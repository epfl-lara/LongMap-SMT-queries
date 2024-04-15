; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26060 () Bool)

(assert start!26060)

(declare-fun b!268644 () Bool)

(declare-fun e!173458 () Bool)

(declare-fun e!173460 () Bool)

(assert (=> b!268644 (= e!173458 e!173460)))

(declare-fun res!132974 () Bool)

(assert (=> b!268644 (=> (not res!132974) (not e!173460))))

(declare-datatypes ((SeekEntryResult!1379 0))(
  ( (MissingZero!1379 (index!7686 (_ BitVec 32))) (Found!1379 (index!7687 (_ BitVec 32))) (Intermediate!1379 (undefined!2191 Bool) (index!7688 (_ BitVec 32)) (x!26063 (_ BitVec 32))) (Undefined!1379) (MissingVacant!1379 (index!7689 (_ BitVec 32))) )
))
(declare-fun lt!134813 () SeekEntryResult!1379)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268644 (= res!132974 (or (= lt!134813 (MissingZero!1379 i!1267)) (= lt!134813 (MissingVacant!1379 i!1267))))))

(declare-datatypes ((array!13146 0))(
  ( (array!13147 (arr!6222 (Array (_ BitVec 32) (_ BitVec 64))) (size!6575 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13146)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13146 (_ BitVec 32)) SeekEntryResult!1379)

(assert (=> b!268644 (= lt!134813 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268645 () Bool)

(declare-fun res!132978 () Bool)

(assert (=> b!268645 (=> (not res!132978) (not e!173458))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268645 (= res!132978 (validKeyInArray!0 k0!2581))))

(declare-fun b!268646 () Bool)

(declare-fun res!132977 () Bool)

(assert (=> b!268646 (=> (not res!132977) (not e!173458))))

(declare-datatypes ((List!4003 0))(
  ( (Nil!4000) (Cons!3999 (h!4666 (_ BitVec 64)) (t!9076 List!4003)) )
))
(declare-fun arrayNoDuplicates!0 (array!13146 (_ BitVec 32) List!4003) Bool)

(assert (=> b!268646 (= res!132977 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4000))))

(declare-fun b!268647 () Bool)

(assert (=> b!268647 (= e!173460 false)))

(declare-fun lt!134814 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13146 (_ BitVec 32)) Bool)

(assert (=> b!268647 (= lt!134814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!132975 () Bool)

(assert (=> start!26060 (=> (not res!132975) (not e!173458))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26060 (= res!132975 (validMask!0 mask!3868))))

(assert (=> start!26060 e!173458))

(declare-fun array_inv!4194 (array!13146) Bool)

(assert (=> start!26060 (array_inv!4194 a!3325)))

(assert (=> start!26060 true))

(declare-fun b!268648 () Bool)

(declare-fun res!132979 () Bool)

(assert (=> b!268648 (=> (not res!132979) (not e!173458))))

(declare-fun arrayContainsKey!0 (array!13146 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268648 (= res!132979 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268649 () Bool)

(declare-fun res!132976 () Bool)

(assert (=> b!268649 (=> (not res!132976) (not e!173458))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268649 (= res!132976 (and (= (size!6575 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6575 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6575 a!3325))))))

(assert (= (and start!26060 res!132975) b!268649))

(assert (= (and b!268649 res!132976) b!268645))

(assert (= (and b!268645 res!132978) b!268646))

(assert (= (and b!268646 res!132977) b!268648))

(assert (= (and b!268648 res!132979) b!268644))

(assert (= (and b!268644 res!132974) b!268647))

(declare-fun m!284249 () Bool)

(assert (=> b!268648 m!284249))

(declare-fun m!284251 () Bool)

(assert (=> b!268646 m!284251))

(declare-fun m!284253 () Bool)

(assert (=> start!26060 m!284253))

(declare-fun m!284255 () Bool)

(assert (=> start!26060 m!284255))

(declare-fun m!284257 () Bool)

(assert (=> b!268647 m!284257))

(declare-fun m!284259 () Bool)

(assert (=> b!268645 m!284259))

(declare-fun m!284261 () Bool)

(assert (=> b!268644 m!284261))

(check-sat (not b!268644) (not b!268647) (not b!268648) (not b!268645) (not start!26060) (not b!268646))
(check-sat)
