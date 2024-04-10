; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26126 () Bool)

(assert start!26126)

(declare-fun b!269639 () Bool)

(declare-fun res!133803 () Bool)

(declare-fun e!173925 () Bool)

(assert (=> b!269639 (=> (not res!133803) (not e!173925))))

(declare-datatypes ((array!13223 0))(
  ( (array!13224 (arr!6261 (Array (_ BitVec 32) (_ BitVec 64))) (size!6613 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13223)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13223 (_ BitVec 32)) Bool)

(assert (=> b!269639 (= res!133803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269640 () Bool)

(declare-fun res!133799 () Bool)

(declare-fun e!173927 () Bool)

(assert (=> b!269640 (=> (not res!133799) (not e!173927))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269640 (= res!133799 (validKeyInArray!0 k0!2581))))

(declare-fun b!269641 () Bool)

(declare-datatypes ((Unit!8362 0))(
  ( (Unit!8363) )
))
(declare-fun e!173926 () Unit!8362)

(declare-fun lt!135258 () Unit!8362)

(assert (=> b!269641 (= e!173926 lt!135258)))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13223 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8362)

(assert (=> b!269641 (= lt!135258 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!269641 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13224 (store (arr!6261 a!3325) i!1267 k0!2581) (size!6613 a!3325)) mask!3868)))

(declare-fun b!269642 () Bool)

(assert (=> b!269642 (= e!173925 false)))

(declare-fun lt!135259 () Unit!8362)

(assert (=> b!269642 (= lt!135259 e!173926)))

(declare-fun c!45471 () Bool)

(assert (=> b!269642 (= c!45471 (bvslt startIndex!26 (bvsub (size!6613 a!3325) #b00000000000000000000000000000001)))))

(declare-fun res!133800 () Bool)

(assert (=> start!26126 (=> (not res!133800) (not e!173927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26126 (= res!133800 (validMask!0 mask!3868))))

(assert (=> start!26126 e!173927))

(declare-fun array_inv!4224 (array!13223) Bool)

(assert (=> start!26126 (array_inv!4224 a!3325)))

(assert (=> start!26126 true))

(declare-fun b!269643 () Bool)

(declare-fun res!133802 () Bool)

(assert (=> b!269643 (=> (not res!133802) (not e!173927))))

(declare-fun arrayContainsKey!0 (array!13223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269643 (= res!133802 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269644 () Bool)

(declare-fun res!133806 () Bool)

(assert (=> b!269644 (=> (not res!133806) (not e!173925))))

(assert (=> b!269644 (= res!133806 (= startIndex!26 i!1267))))

(declare-fun b!269645 () Bool)

(declare-fun Unit!8364 () Unit!8362)

(assert (=> b!269645 (= e!173926 Unit!8364)))

(declare-fun b!269646 () Bool)

(declare-fun res!133805 () Bool)

(assert (=> b!269646 (=> (not res!133805) (not e!173927))))

(assert (=> b!269646 (= res!133805 (and (= (size!6613 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6613 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6613 a!3325))))))

(declare-fun b!269647 () Bool)

(declare-fun res!133801 () Bool)

(assert (=> b!269647 (=> (not res!133801) (not e!173927))))

(declare-datatypes ((List!4069 0))(
  ( (Nil!4066) (Cons!4065 (h!4732 (_ BitVec 64)) (t!9151 List!4069)) )
))
(declare-fun arrayNoDuplicates!0 (array!13223 (_ BitVec 32) List!4069) Bool)

(assert (=> b!269647 (= res!133801 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4066))))

(declare-fun b!269648 () Bool)

(assert (=> b!269648 (= e!173927 e!173925)))

(declare-fun res!133804 () Bool)

(assert (=> b!269648 (=> (not res!133804) (not e!173925))))

(declare-datatypes ((SeekEntryResult!1419 0))(
  ( (MissingZero!1419 (index!7846 (_ BitVec 32))) (Found!1419 (index!7847 (_ BitVec 32))) (Intermediate!1419 (undefined!2231 Bool) (index!7848 (_ BitVec 32)) (x!26192 (_ BitVec 32))) (Undefined!1419) (MissingVacant!1419 (index!7849 (_ BitVec 32))) )
))
(declare-fun lt!135257 () SeekEntryResult!1419)

(assert (=> b!269648 (= res!133804 (or (= lt!135257 (MissingZero!1419 i!1267)) (= lt!135257 (MissingVacant!1419 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13223 (_ BitVec 32)) SeekEntryResult!1419)

(assert (=> b!269648 (= lt!135257 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26126 res!133800) b!269646))

(assert (= (and b!269646 res!133805) b!269640))

(assert (= (and b!269640 res!133799) b!269647))

(assert (= (and b!269647 res!133801) b!269643))

(assert (= (and b!269643 res!133802) b!269648))

(assert (= (and b!269648 res!133804) b!269639))

(assert (= (and b!269639 res!133803) b!269644))

(assert (= (and b!269644 res!133806) b!269642))

(assert (= (and b!269642 c!45471) b!269641))

(assert (= (and b!269642 (not c!45471)) b!269645))

(declare-fun m!285431 () Bool)

(assert (=> b!269640 m!285431))

(declare-fun m!285433 () Bool)

(assert (=> b!269639 m!285433))

(declare-fun m!285435 () Bool)

(assert (=> start!26126 m!285435))

(declare-fun m!285437 () Bool)

(assert (=> start!26126 m!285437))

(declare-fun m!285439 () Bool)

(assert (=> b!269641 m!285439))

(declare-fun m!285441 () Bool)

(assert (=> b!269641 m!285441))

(declare-fun m!285443 () Bool)

(assert (=> b!269641 m!285443))

(declare-fun m!285445 () Bool)

(assert (=> b!269643 m!285445))

(declare-fun m!285447 () Bool)

(assert (=> b!269648 m!285447))

(declare-fun m!285449 () Bool)

(assert (=> b!269647 m!285449))

(check-sat (not b!269643) (not b!269648) (not b!269647) (not b!269640) (not b!269639) (not start!26126) (not b!269641))
(check-sat)
