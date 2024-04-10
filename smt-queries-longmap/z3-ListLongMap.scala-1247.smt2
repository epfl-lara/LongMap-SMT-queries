; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26042 () Bool)

(assert start!26042)

(declare-fun b!268647 () Bool)

(declare-fun res!132926 () Bool)

(declare-fun e!173487 () Bool)

(assert (=> b!268647 (=> (not res!132926) (not e!173487))))

(declare-datatypes ((array!13139 0))(
  ( (array!13140 (arr!6219 (Array (_ BitVec 32) (_ BitVec 64))) (size!6571 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13139)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268647 (= res!132926 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268648 () Bool)

(declare-fun e!173488 () Bool)

(assert (=> b!268648 (= e!173487 e!173488)))

(declare-fun res!132928 () Bool)

(assert (=> b!268648 (=> (not res!132928) (not e!173488))))

(declare-datatypes ((SeekEntryResult!1377 0))(
  ( (MissingZero!1377 (index!7678 (_ BitVec 32))) (Found!1377 (index!7679 (_ BitVec 32))) (Intermediate!1377 (undefined!2189 Bool) (index!7680 (_ BitVec 32)) (x!26038 (_ BitVec 32))) (Undefined!1377) (MissingVacant!1377 (index!7681 (_ BitVec 32))) )
))
(declare-fun lt!134946 () SeekEntryResult!1377)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268648 (= res!132928 (or (= lt!134946 (MissingZero!1377 i!1267)) (= lt!134946 (MissingVacant!1377 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13139 (_ BitVec 32)) SeekEntryResult!1377)

(assert (=> b!268648 (= lt!134946 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268649 () Bool)

(declare-fun res!132925 () Bool)

(assert (=> b!268649 (=> (not res!132925) (not e!173487))))

(declare-datatypes ((List!4027 0))(
  ( (Nil!4024) (Cons!4023 (h!4690 (_ BitVec 64)) (t!9109 List!4027)) )
))
(declare-fun arrayNoDuplicates!0 (array!13139 (_ BitVec 32) List!4027) Bool)

(assert (=> b!268649 (= res!132925 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4024))))

(declare-fun b!268650 () Bool)

(declare-fun res!132929 () Bool)

(assert (=> b!268650 (=> (not res!132929) (not e!173487))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268650 (= res!132929 (and (= (size!6571 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6571 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6571 a!3325))))))

(declare-fun res!132930 () Bool)

(assert (=> start!26042 (=> (not res!132930) (not e!173487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26042 (= res!132930 (validMask!0 mask!3868))))

(assert (=> start!26042 e!173487))

(declare-fun array_inv!4182 (array!13139) Bool)

(assert (=> start!26042 (array_inv!4182 a!3325)))

(assert (=> start!26042 true))

(declare-fun b!268651 () Bool)

(assert (=> b!268651 (= e!173488 false)))

(declare-fun lt!134947 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13139 (_ BitVec 32)) Bool)

(assert (=> b!268651 (= lt!134947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268652 () Bool)

(declare-fun res!132927 () Bool)

(assert (=> b!268652 (=> (not res!132927) (not e!173487))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268652 (= res!132927 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26042 res!132930) b!268650))

(assert (= (and b!268650 res!132929) b!268652))

(assert (= (and b!268652 res!132927) b!268649))

(assert (= (and b!268649 res!132925) b!268647))

(assert (= (and b!268647 res!132926) b!268648))

(assert (= (and b!268648 res!132928) b!268651))

(declare-fun m!284729 () Bool)

(assert (=> b!268648 m!284729))

(declare-fun m!284731 () Bool)

(assert (=> b!268649 m!284731))

(declare-fun m!284733 () Bool)

(assert (=> start!26042 m!284733))

(declare-fun m!284735 () Bool)

(assert (=> start!26042 m!284735))

(declare-fun m!284737 () Bool)

(assert (=> b!268647 m!284737))

(declare-fun m!284739 () Bool)

(assert (=> b!268651 m!284739))

(declare-fun m!284741 () Bool)

(assert (=> b!268652 m!284741))

(check-sat (not b!268648) (not b!268651) (not start!26042) (not b!268647) (not b!268652) (not b!268649))
(check-sat)
