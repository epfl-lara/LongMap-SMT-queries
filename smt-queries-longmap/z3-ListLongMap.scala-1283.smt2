; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26258 () Bool)

(assert start!26258)

(declare-fun b!271728 () Bool)

(declare-fun e!174566 () Bool)

(assert (=> b!271728 (= e!174566 (not true))))

(declare-datatypes ((array!13344 0))(
  ( (array!13345 (arr!6321 (Array (_ BitVec 32) (_ BitVec 64))) (size!6674 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13344)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-datatypes ((List!4102 0))(
  ( (Nil!4099) (Cons!4098 (h!4765 (_ BitVec 64)) (t!9175 List!4102)) )
))
(declare-fun arrayNoDuplicates!0 (array!13344 (_ BitVec 32) List!4102) Bool)

(assert (=> b!271728 (arrayNoDuplicates!0 (array!13345 (store (arr!6321 a!3325) i!1267 k0!2581) (size!6674 a!3325)) #b00000000000000000000000000000000 Nil!4099)))

(declare-datatypes ((Unit!8409 0))(
  ( (Unit!8410) )
))
(declare-fun lt!135695 () Unit!8409)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13344 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4102) Unit!8409)

(assert (=> b!271728 (= lt!135695 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4099))))

(declare-fun b!271729 () Bool)

(declare-fun res!135770 () Bool)

(declare-fun e!174567 () Bool)

(assert (=> b!271729 (=> (not res!135770) (not e!174567))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271729 (= res!135770 (validKeyInArray!0 k0!2581))))

(declare-fun b!271730 () Bool)

(declare-fun res!135773 () Bool)

(assert (=> b!271730 (=> (not res!135773) (not e!174567))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!271730 (= res!135773 (and (= (size!6674 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6674 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6674 a!3325))))))

(declare-fun b!271731 () Bool)

(assert (=> b!271731 (= e!174567 e!174566)))

(declare-fun res!135778 () Bool)

(assert (=> b!271731 (=> (not res!135778) (not e!174566))))

(declare-datatypes ((SeekEntryResult!1478 0))(
  ( (MissingZero!1478 (index!8082 (_ BitVec 32))) (Found!1478 (index!8083 (_ BitVec 32))) (Intermediate!1478 (undefined!2290 Bool) (index!8084 (_ BitVec 32)) (x!26426 (_ BitVec 32))) (Undefined!1478) (MissingVacant!1478 (index!8085 (_ BitVec 32))) )
))
(declare-fun lt!135696 () SeekEntryResult!1478)

(assert (=> b!271731 (= res!135778 (or (= lt!135696 (MissingZero!1478 i!1267)) (= lt!135696 (MissingVacant!1478 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13344 (_ BitVec 32)) SeekEntryResult!1478)

(assert (=> b!271731 (= lt!135696 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!271732 () Bool)

(declare-fun res!135775 () Bool)

(assert (=> b!271732 (=> (not res!135775) (not e!174567))))

(assert (=> b!271732 (= res!135775 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4099))))

(declare-fun b!271733 () Bool)

(declare-fun res!135771 () Bool)

(assert (=> b!271733 (=> (not res!135771) (not e!174566))))

(assert (=> b!271733 (= res!135771 (not (= startIndex!26 i!1267)))))

(declare-fun b!271734 () Bool)

(declare-fun res!135772 () Bool)

(assert (=> b!271734 (=> (not res!135772) (not e!174567))))

(declare-fun arrayContainsKey!0 (array!13344 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271734 (= res!135772 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271736 () Bool)

(declare-fun res!135777 () Bool)

(assert (=> b!271736 (=> (not res!135777) (not e!174566))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13344 (_ BitVec 32)) Bool)

(assert (=> b!271736 (= res!135777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!135774 () Bool)

(assert (=> start!26258 (=> (not res!135774) (not e!174567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26258 (= res!135774 (validMask!0 mask!3868))))

(assert (=> start!26258 e!174567))

(declare-fun array_inv!4293 (array!13344) Bool)

(assert (=> start!26258 (array_inv!4293 a!3325)))

(assert (=> start!26258 true))

(declare-fun b!271735 () Bool)

(declare-fun res!135776 () Bool)

(assert (=> b!271735 (=> (not res!135776) (not e!174566))))

(assert (=> b!271735 (= res!135776 (validKeyInArray!0 (select (arr!6321 a!3325) startIndex!26)))))

(assert (= (and start!26258 res!135774) b!271730))

(assert (= (and b!271730 res!135773) b!271729))

(assert (= (and b!271729 res!135770) b!271732))

(assert (= (and b!271732 res!135775) b!271734))

(assert (= (and b!271734 res!135772) b!271731))

(assert (= (and b!271731 res!135778) b!271736))

(assert (= (and b!271736 res!135777) b!271733))

(assert (= (and b!271733 res!135771) b!271735))

(assert (= (and b!271735 res!135776) b!271728))

(declare-fun m!286445 () Bool)

(assert (=> b!271734 m!286445))

(declare-fun m!286447 () Bool)

(assert (=> b!271735 m!286447))

(assert (=> b!271735 m!286447))

(declare-fun m!286449 () Bool)

(assert (=> b!271735 m!286449))

(declare-fun m!286451 () Bool)

(assert (=> b!271729 m!286451))

(declare-fun m!286453 () Bool)

(assert (=> start!26258 m!286453))

(declare-fun m!286455 () Bool)

(assert (=> start!26258 m!286455))

(declare-fun m!286457 () Bool)

(assert (=> b!271736 m!286457))

(declare-fun m!286459 () Bool)

(assert (=> b!271731 m!286459))

(declare-fun m!286461 () Bool)

(assert (=> b!271732 m!286461))

(declare-fun m!286463 () Bool)

(assert (=> b!271728 m!286463))

(declare-fun m!286465 () Bool)

(assert (=> b!271728 m!286465))

(declare-fun m!286467 () Bool)

(assert (=> b!271728 m!286467))

(check-sat (not b!271729) (not b!271735) (not start!26258) (not b!271731) (not b!271728) (not b!271734) (not b!271732) (not b!271736))
(check-sat)
