; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26250 () Bool)

(assert start!26250)

(declare-fun b!271794 () Bool)

(declare-fun res!135786 () Bool)

(declare-fun e!174641 () Bool)

(assert (=> b!271794 (=> (not res!135786) (not e!174641))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271794 (= res!135786 (validKeyInArray!0 k!2581))))

(declare-fun b!271795 () Bool)

(declare-fun res!135788 () Bool)

(declare-fun e!174640 () Bool)

(assert (=> b!271795 (=> (not res!135788) (not e!174640))))

(declare-datatypes ((array!13347 0))(
  ( (array!13348 (arr!6323 (Array (_ BitVec 32) (_ BitVec 64))) (size!6675 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13347)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13347 (_ BitVec 32)) Bool)

(assert (=> b!271795 (= res!135788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271796 () Bool)

(declare-fun res!135791 () Bool)

(assert (=> b!271796 (=> (not res!135791) (not e!174641))))

(declare-datatypes ((List!4131 0))(
  ( (Nil!4128) (Cons!4127 (h!4794 (_ BitVec 64)) (t!9213 List!4131)) )
))
(declare-fun arrayNoDuplicates!0 (array!13347 (_ BitVec 32) List!4131) Bool)

(assert (=> b!271796 (= res!135791 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4128))))

(declare-fun b!271797 () Bool)

(declare-fun res!135792 () Bool)

(assert (=> b!271797 (=> (not res!135792) (not e!174641))))

(declare-fun arrayContainsKey!0 (array!13347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271797 (= res!135792 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271798 () Bool)

(assert (=> b!271798 (= e!174640 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!271798 (arrayNoDuplicates!0 (array!13348 (store (arr!6323 a!3325) i!1267 k!2581) (size!6675 a!3325)) #b00000000000000000000000000000000 Nil!4128)))

(declare-datatypes ((Unit!8449 0))(
  ( (Unit!8450) )
))
(declare-fun lt!135858 () Unit!8449)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13347 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4131) Unit!8449)

(assert (=> b!271798 (= lt!135858 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4128))))

(declare-fun b!271799 () Bool)

(assert (=> b!271799 (= e!174641 e!174640)))

(declare-fun res!135789 () Bool)

(assert (=> b!271799 (=> (not res!135789) (not e!174640))))

(declare-datatypes ((SeekEntryResult!1481 0))(
  ( (MissingZero!1481 (index!8094 (_ BitVec 32))) (Found!1481 (index!8095 (_ BitVec 32))) (Intermediate!1481 (undefined!2293 Bool) (index!8096 (_ BitVec 32)) (x!26422 (_ BitVec 32))) (Undefined!1481) (MissingVacant!1481 (index!8097 (_ BitVec 32))) )
))
(declare-fun lt!135859 () SeekEntryResult!1481)

(assert (=> b!271799 (= res!135789 (or (= lt!135859 (MissingZero!1481 i!1267)) (= lt!135859 (MissingVacant!1481 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13347 (_ BitVec 32)) SeekEntryResult!1481)

(assert (=> b!271799 (= lt!135859 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!271800 () Bool)

(declare-fun res!135790 () Bool)

(assert (=> b!271800 (=> (not res!135790) (not e!174640))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!271800 (= res!135790 (validKeyInArray!0 (select (arr!6323 a!3325) startIndex!26)))))

(declare-fun b!271801 () Bool)

(declare-fun res!135784 () Bool)

(assert (=> b!271801 (=> (not res!135784) (not e!174641))))

(assert (=> b!271801 (= res!135784 (and (= (size!6675 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6675 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6675 a!3325))))))

(declare-fun res!135787 () Bool)

(assert (=> start!26250 (=> (not res!135787) (not e!174641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26250 (= res!135787 (validMask!0 mask!3868))))

(assert (=> start!26250 e!174641))

(declare-fun array_inv!4286 (array!13347) Bool)

(assert (=> start!26250 (array_inv!4286 a!3325)))

(assert (=> start!26250 true))

(declare-fun b!271802 () Bool)

(declare-fun res!135785 () Bool)

(assert (=> b!271802 (=> (not res!135785) (not e!174640))))

(assert (=> b!271802 (= res!135785 (not (= startIndex!26 i!1267)))))

(assert (= (and start!26250 res!135787) b!271801))

(assert (= (and b!271801 res!135784) b!271794))

(assert (= (and b!271794 res!135786) b!271796))

(assert (= (and b!271796 res!135791) b!271797))

(assert (= (and b!271797 res!135792) b!271799))

(assert (= (and b!271799 res!135789) b!271795))

(assert (= (and b!271795 res!135788) b!271802))

(assert (= (and b!271802 res!135785) b!271800))

(assert (= (and b!271800 res!135790) b!271798))

(declare-fun m!286965 () Bool)

(assert (=> b!271800 m!286965))

(assert (=> b!271800 m!286965))

(declare-fun m!286967 () Bool)

(assert (=> b!271800 m!286967))

(declare-fun m!286969 () Bool)

(assert (=> b!271797 m!286969))

(declare-fun m!286971 () Bool)

(assert (=> b!271795 m!286971))

(declare-fun m!286973 () Bool)

(assert (=> b!271798 m!286973))

(declare-fun m!286975 () Bool)

(assert (=> b!271798 m!286975))

(declare-fun m!286977 () Bool)

(assert (=> b!271798 m!286977))

(declare-fun m!286979 () Bool)

(assert (=> b!271794 m!286979))

(declare-fun m!286981 () Bool)

(assert (=> b!271796 m!286981))

(declare-fun m!286983 () Bool)

(assert (=> start!26250 m!286983))

(declare-fun m!286985 () Bool)

(assert (=> start!26250 m!286985))

(declare-fun m!286987 () Bool)

(assert (=> b!271799 m!286987))

(push 1)

