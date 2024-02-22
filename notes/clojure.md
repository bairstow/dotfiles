#### Dependencies
- search for dependcy definition on clojars.org.
- add [clj-xxx "x.x.x"] to dependencies definition in project.clj
- run `lein deps` from root to fetch new dependencies
- run `lein deps :tree` to list current dependencies
- add dependency definition to project namespace or require to current ns
  - (require '[clojure.string :as str])

- maven dependencies can be added in similar fashion

#### Interop
- static inner classes can be accessed via the $ - package.Outer$Inner
- proxy can be used for abstract classes and implementing predefined methods

#### Destructuring
- within let block vectored arguments can be destructured with variable name at position
- maps can be destructured via [{value :key} target]
- :as keyword allows binding to entire collection as well as destructuring single elements
- :or allows default values to be supplied
