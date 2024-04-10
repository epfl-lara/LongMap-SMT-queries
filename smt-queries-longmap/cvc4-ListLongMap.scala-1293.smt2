; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26320 () Bool)

(assert start!26320)

(declare-fun res!136737 () Bool)

(declare-fun e!174954 () Bool)

(assert (=> start!26320 (=> (not res!136737) (not e!174954))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26320 (= res!136737 (validMask!0 mask!3868))))

(assert (=> start!26320 e!174954))

(declare-datatypes ((array!13417 0))(
  ( (array!13418 (arr!6358 (Array (_ BitVec 32) (_ BitVec 64))) (size!6710 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13417)

(declare-fun array_inv!4321 (array!13417) Bool)

(assert (=> start!26320 (array_inv!4321 a!3325)))

(assert (=> start!26320 true))

(declare-fun b!272739 () Bool)

(declare-fun e!174955 () Bool)

(assert (=> b!272739 (= e!174954 e!174955)))

(declare-fun res!136736 () Bool)

(assert (=> b!272739 (=> (not res!136736) (not e!174955))))

(declare-datatypes ((SeekEntryResult!1516 0))(
  ( (MissingZero!1516 (index!8234 (_ BitVec 32))) (Found!1516 (index!8235 (_ BitVec 32))) (Intermediate!1516 (undefined!2328 Bool) (index!8236 (_ BitVec 32)) (x!26545 (_ BitVec 32))) (Undefined!1516) (MissingVacant!1516 (index!8237 (_ BitVec 32))) )
))
(declare-fun lt!136069 () SeekEntryResult!1516)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272739 (= res!136736 (or (= lt!136069 (MissingZero!1516 i!1267)) (= lt!136069 (MissingVacant!1516 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13417 (_ BitVec 32)) SeekEntryResult!1516)

(assert (=> b!272739 (= lt!136069 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!272740 () Bool)

(declare-fun res!136735 () Bool)

(assert (=> b!272740 (=> (not res!136735) (not e!174955))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272740 (= res!136735 (validKeyInArray!0 (select (arr!6358 a!3325) startIndex!26)))))

(declare-fun b!272741 () Bool)

(declare-fun res!136730 () Bool)

(assert (=> b!272741 (=> (not res!136730) (not e!174955))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13417 (_ BitVec 32)) Bool)

(assert (=> b!272741 (= res!136730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272742 () Bool)

(declare-fun res!136729 () Bool)

(assert (=> b!272742 (=> (not res!136729) (not e!174954))))

(assert (=> b!272742 (= res!136729 (validKeyInArray!0 k!2581))))

(declare-fun b!272743 () Bool)

(declare-fun res!136734 () Bool)

(assert (=> b!272743 (=> (not res!136734) (not e!174954))))

(assert (=> b!272743 (= res!136734 (and (= (size!6710 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6710 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6710 a!3325))))))

(declare-fun b!272744 () Bool)

(declare-fun res!136731 () Bool)

(assert (=> b!272744 (=> (not res!136731) (not e!174954))))

(declare-fun arrayContainsKey!0 (array!13417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272744 (= res!136731 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272745 () Bool)

(assert (=> b!272745 (= e!174955 (not true))))

(declare-datatypes ((List!4166 0))(
  ( (Nil!4163) (Cons!4162 (h!4829 (_ BitVec 64)) (t!9248 List!4166)) )
))
(declare-fun arrayNoDuplicates!0 (array!13417 (_ BitVec 32) List!4166) Bool)

(assert (=> b!272745 (arrayNoDuplicates!0 (array!13418 (store (arr!6358 a!3325) i!1267 k!2581) (size!6710 a!3325)) #b00000000000000000000000000000000 Nil!4163)))

(declare-datatypes ((Unit!8519 0))(
  ( (Unit!8520) )
))
(declare-fun lt!136068 () Unit!8519)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13417 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4166) Unit!8519)

(assert (=> b!272745 (= lt!136068 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4163))))

(declare-fun b!272746 () Bool)

(declare-fun res!136732 () Bool)

(assert (=> b!272746 (=> (not res!136732) (not e!174955))))

(assert (=> b!272746 (= res!136732 (not (= startIndex!26 i!1267)))))

(declare-fun b!272747 () Bool)

(declare-fun res!136733 () Bool)

(assert (=> b!272747 (=> (not res!136733) (not e!174954))))

(assert (=> b!272747 (= res!136733 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4163))))

(assert (= (and start!26320 res!136737) b!272743))

(assert (= (and b!272743 res!136734) b!272742))

(assert (= (and b!272742 res!136729) b!272747))

(assert (= (and b!272747 res!136733) b!272744))

(assert (= (and b!272744 res!136731) b!272739))

(assert (= (and b!272739 res!136736) b!272741))

(assert (= (and b!272741 res!136730) b!272746))

(assert (= (and b!272746 res!136732) b!272740))

(assert (= (and b!272740 res!136735) b!272745))

(declare-fun m!287805 () Bool)

(assert (=> b!272739 m!287805))

(declare-fun m!287807 () Bool)

(assert (=> b!272741 m!287807))

(declare-fun m!287809 () Bool)

(assert (=> b!272740 m!287809))

(assert (=> b!272740 m!287809))

(declare-fun m!287811 () Bool)

(assert (=> b!272740 m!287811))

(declare-fun m!287813 () Bool)

(assert (=> b!272747 m!287813))

(declare-fun m!287815 () Bool)

(assert (=> b!272745 m!287815))

(declare-fun m!287817 () Bool)

(assert (=> b!272745 m!287817))

(declare-fun m!287819 () Bool)

(assert (=> b!272745 m!287819))

(declare-fun m!287821 () Bool)

(assert (=> start!26320 m!287821))

(declare-fun m!287823 () Bool)

(assert (=> start!26320 m!287823))

(declare-fun m!287825 () Bool)

(assert (=> b!272744 m!287825))

(declare-fun m!287827 () Bool)

(assert (=> b!272742 m!287827))

(push 1)

(assert (not b!272744))

(assert (not b!272741))

(assert (not b!272740))

(assert (not b!272739))

(assert (not b!272747))

(assert (not start!26320))

(assert (not b!272745))

(assert (not b!272742))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

