; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27122 () Bool)

(assert start!27122)

(declare-fun b!280473 () Bool)

(declare-fun res!143544 () Bool)

(declare-fun e!178553 () Bool)

(assert (=> b!280473 (=> (not res!143544) (not e!178553))))

(declare-datatypes ((array!13940 0))(
  ( (array!13941 (arr!6612 (Array (_ BitVec 32) (_ BitVec 64))) (size!6964 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13940)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13940 (_ BitVec 32)) Bool)

(assert (=> b!280473 (= res!143544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280474 () Bool)

(declare-fun res!143549 () Bool)

(declare-fun e!178551 () Bool)

(assert (=> b!280474 (=> (not res!143549) (not e!178551))))

(declare-datatypes ((List!4420 0))(
  ( (Nil!4417) (Cons!4416 (h!5086 (_ BitVec 64)) (t!9502 List!4420)) )
))
(declare-fun arrayNoDuplicates!0 (array!13940 (_ BitVec 32) List!4420) Bool)

(assert (=> b!280474 (= res!143549 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4417))))

(declare-fun b!280476 () Bool)

(declare-fun res!143550 () Bool)

(assert (=> b!280476 (=> (not res!143550) (not e!178553))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280476 (= res!143550 (validKeyInArray!0 (select (arr!6612 a!3325) startIndex!26)))))

(declare-fun b!280477 () Bool)

(assert (=> b!280477 (= e!178553 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!280477 (arrayNoDuplicates!0 (array!13941 (store (arr!6612 a!3325) i!1267 k0!2581) (size!6964 a!3325)) #b00000000000000000000000000000000 Nil!4417)))

(declare-datatypes ((Unit!8824 0))(
  ( (Unit!8825) )
))
(declare-fun lt!138835 () Unit!8824)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13940 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4420) Unit!8824)

(assert (=> b!280477 (= lt!138835 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4417))))

(declare-fun b!280478 () Bool)

(declare-fun res!143545 () Bool)

(assert (=> b!280478 (=> (not res!143545) (not e!178551))))

(assert (=> b!280478 (= res!143545 (and (= (size!6964 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6964 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6964 a!3325))))))

(declare-fun b!280479 () Bool)

(declare-fun res!143547 () Bool)

(assert (=> b!280479 (=> (not res!143547) (not e!178553))))

(assert (=> b!280479 (= res!143547 (not (= startIndex!26 i!1267)))))

(declare-fun res!143548 () Bool)

(assert (=> start!27122 (=> (not res!143548) (not e!178551))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27122 (= res!143548 (validMask!0 mask!3868))))

(assert (=> start!27122 e!178551))

(declare-fun array_inv!4575 (array!13940) Bool)

(assert (=> start!27122 (array_inv!4575 a!3325)))

(assert (=> start!27122 true))

(declare-fun b!280475 () Bool)

(declare-fun res!143543 () Bool)

(assert (=> b!280475 (=> (not res!143543) (not e!178551))))

(declare-fun arrayContainsKey!0 (array!13940 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280475 (= res!143543 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280480 () Bool)

(declare-fun res!143546 () Bool)

(assert (=> b!280480 (=> (not res!143546) (not e!178551))))

(assert (=> b!280480 (= res!143546 (validKeyInArray!0 k0!2581))))

(declare-fun b!280481 () Bool)

(assert (=> b!280481 (= e!178551 e!178553)))

(declare-fun res!143542 () Bool)

(assert (=> b!280481 (=> (not res!143542) (not e!178553))))

(declare-datatypes ((SeekEntryResult!1770 0))(
  ( (MissingZero!1770 (index!9250 (_ BitVec 32))) (Found!1770 (index!9251 (_ BitVec 32))) (Intermediate!1770 (undefined!2582 Bool) (index!9252 (_ BitVec 32)) (x!27488 (_ BitVec 32))) (Undefined!1770) (MissingVacant!1770 (index!9253 (_ BitVec 32))) )
))
(declare-fun lt!138834 () SeekEntryResult!1770)

(assert (=> b!280481 (= res!143542 (or (= lt!138834 (MissingZero!1770 i!1267)) (= lt!138834 (MissingVacant!1770 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13940 (_ BitVec 32)) SeekEntryResult!1770)

(assert (=> b!280481 (= lt!138834 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!27122 res!143548) b!280478))

(assert (= (and b!280478 res!143545) b!280480))

(assert (= (and b!280480 res!143546) b!280474))

(assert (= (and b!280474 res!143549) b!280475))

(assert (= (and b!280475 res!143543) b!280481))

(assert (= (and b!280481 res!143542) b!280473))

(assert (= (and b!280473 res!143544) b!280479))

(assert (= (and b!280479 res!143547) b!280476))

(assert (= (and b!280476 res!143550) b!280477))

(declare-fun m!294903 () Bool)

(assert (=> b!280480 m!294903))

(declare-fun m!294905 () Bool)

(assert (=> b!280477 m!294905))

(declare-fun m!294907 () Bool)

(assert (=> b!280477 m!294907))

(declare-fun m!294909 () Bool)

(assert (=> b!280477 m!294909))

(declare-fun m!294911 () Bool)

(assert (=> b!280476 m!294911))

(assert (=> b!280476 m!294911))

(declare-fun m!294913 () Bool)

(assert (=> b!280476 m!294913))

(declare-fun m!294915 () Bool)

(assert (=> b!280473 m!294915))

(declare-fun m!294917 () Bool)

(assert (=> b!280481 m!294917))

(declare-fun m!294919 () Bool)

(assert (=> b!280474 m!294919))

(declare-fun m!294921 () Bool)

(assert (=> start!27122 m!294921))

(declare-fun m!294923 () Bool)

(assert (=> start!27122 m!294923))

(declare-fun m!294925 () Bool)

(assert (=> b!280475 m!294925))

(check-sat (not b!280476) (not b!280481) (not b!280474) (not b!280477) (not b!280475) (not b!280473) (not start!27122) (not b!280480))
(check-sat)
