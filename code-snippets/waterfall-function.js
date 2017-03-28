/* Description:
 * Each time this runs, the first task is run
 * this first task has a callback which calls the waterfall with:
 * the result as the first argument
 * + the tasks left to runs
 * + the final callback
 */

function waterfall(arg, tasks, cb) {
  console.log('Tasks Array: ', tasks);

  if (tasks.length === 0) {
    cb(null, arg);
  } else {
    tasks[0](arg, (error, result) => {
      if (error) {
        cb(error);
        return;
      }
      waterfall(result, tasks.slice(1), cb);
    });
  }
}
