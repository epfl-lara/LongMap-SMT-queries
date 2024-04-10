; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50190 () Bool)

(assert start!50190)

(declare-fun b!549328 () Bool)

(declare-fun e!317293 () Bool)

(declare-fun e!317295 () Bool)

(assert (=> b!549328 (= e!317293 e!317295)))

(declare-fun res!342478 () Bool)

(assert (=> b!549328 (=> (not res!342478) (not e!317295))))

(declare-datatypes ((SeekEntryResult!5086 0))(
  ( (MissingZero!5086 (index!22571 (_ BitVec 32))) (Found!5086 (index!22572 (_ BitVec 32))) (Intermediate!5086 (undefined!5898 Bool) (index!22573 (_ BitVec 32)) (x!51504 (_ BitVec 32))) (Undefined!5086) (MissingVacant!5086 (index!22574 (_ BitVec 32))) )
))
(declare-fun lt!250096 () SeekEntryResult!5086)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!549328 (= res!342478 (or (= lt!250096 (MissingZero!5086 i!1132)) (= lt!250096 (MissingVacant!5086 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!34643 0))(
  ( (array!34644 (arr!16637 (Array (_ BitVec 32) (_ BitVec 64))) (size!17001 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34643)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34643 (_ BitVec 32)) SeekEntryResult!5086)

(assert (=> b!549328 (= lt!250096 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!549329 () Bool)

(declare-fun res!342476 () Bool)

(assert (=> b!549329 (=> (not res!342476) (not e!317293))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549329 (= res!342476 (validKeyInArray!0 k!1914))))

(declare-fun b!549330 () Bool)

(declare-fun res!342479 () Bool)

(assert (=> b!549330 (=> (not res!342479) (not e!317293))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!549330 (= res!342479 (validKeyInArray!0 (select (arr!16637 a!3118) j!142)))))

(declare-fun b!549331 () Bool)

(declare-fun res!342474 () Bool)

(assert (=> b!549331 (=> (not res!342474) (not e!317293))))

(assert (=> b!549331 (= res!342474 (and (= (size!17001 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17001 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17001 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549332 () Bool)

(declare-fun res!342473 () Bool)

(assert (=> b!549332 (=> (not res!342473) (not e!317293))))

(declare-fun arrayContainsKey!0 (array!34643 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549332 (= res!342473 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549333 () Bool)

(declare-fun res!342475 () Bool)

(assert (=> b!549333 (=> (not res!342475) (not e!317295))))

(declare-datatypes ((List!10717 0))(
  ( (Nil!10714) (Cons!10713 (h!11686 (_ BitVec 64)) (t!16945 List!10717)) )
))
(declare-fun arrayNoDuplicates!0 (array!34643 (_ BitVec 32) List!10717) Bool)

(assert (=> b!549333 (= res!342475 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10714))))

(declare-fun b!549334 () Bool)

(declare-fun res!342472 () Bool)

(assert (=> b!549334 (=> (not res!342472) (not e!317295))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34643 (_ BitVec 32)) Bool)

(assert (=> b!549334 (= res!342472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!342477 () Bool)

(assert (=> start!50190 (=> (not res!342477) (not e!317293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50190 (= res!342477 (validMask!0 mask!3119))))

(assert (=> start!50190 e!317293))

(assert (=> start!50190 true))

(declare-fun array_inv!12433 (array!34643) Bool)

(assert (=> start!50190 (array_inv!12433 a!3118)))

(declare-fun b!549335 () Bool)

(assert (=> b!549335 (= e!317295 false)))

(declare-fun lt!250095 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549335 (= lt!250095 (toIndex!0 (select (store (arr!16637 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (= (and start!50190 res!342477) b!549331))

(assert (= (and b!549331 res!342474) b!549330))

(assert (= (and b!549330 res!342479) b!549329))

(assert (= (and b!549329 res!342476) b!549332))

(assert (= (and b!549332 res!342473) b!549328))

(assert (= (and b!549328 res!342478) b!549334))

(assert (= (and b!549334 res!342472) b!549333))

(assert (= (and b!549333 res!342475) b!549335))

(declare-fun m!526179 () Bool)

(assert (=> start!50190 m!526179))

(declare-fun m!526181 () Bool)

(assert (=> start!50190 m!526181))

(declare-fun m!526183 () Bool)

(assert (=> b!549329 m!526183))

(declare-fun m!526185 () Bool)

(assert (=> b!549334 m!526185))

(declare-fun m!526187 () Bool)

(assert (=> b!549328 m!526187))

(declare-fun m!526189 () Bool)

(assert (=> b!549330 m!526189))

(assert (=> b!549330 m!526189))

(declare-fun m!526191 () Bool)

(assert (=> b!549330 m!526191))

(declare-fun m!526193 () Bool)

(assert (=> b!549335 m!526193))

(declare-fun m!526195 () Bool)

(assert (=> b!549335 m!526195))

(assert (=> b!549335 m!526195))

(declare-fun m!526197 () Bool)

(assert (=> b!549335 m!526197))

(declare-fun m!526199 () Bool)

(assert (=> b!549333 m!526199))

(declare-fun m!526201 () Bool)

(assert (=> b!549332 m!526201))

(push 1)

(assert (not b!549332))

(assert (not b!549335))

(assert (not b!549328))

