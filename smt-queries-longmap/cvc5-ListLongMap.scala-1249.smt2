; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26052 () Bool)

(assert start!26052)

(declare-fun b!268737 () Bool)

(declare-fun res!133016 () Bool)

(declare-fun e!173533 () Bool)

(assert (=> b!268737 (=> (not res!133016) (not e!173533))))

(declare-datatypes ((array!13149 0))(
  ( (array!13150 (arr!6224 (Array (_ BitVec 32) (_ BitVec 64))) (size!6576 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13149)

(declare-datatypes ((List!4032 0))(
  ( (Nil!4029) (Cons!4028 (h!4695 (_ BitVec 64)) (t!9114 List!4032)) )
))
(declare-fun arrayNoDuplicates!0 (array!13149 (_ BitVec 32) List!4032) Bool)

(assert (=> b!268737 (= res!133016 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4029))))

(declare-fun res!133015 () Bool)

(assert (=> start!26052 (=> (not res!133015) (not e!173533))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26052 (= res!133015 (validMask!0 mask!3868))))

(assert (=> start!26052 e!173533))

(declare-fun array_inv!4187 (array!13149) Bool)

(assert (=> start!26052 (array_inv!4187 a!3325)))

(assert (=> start!26052 true))

(declare-fun b!268738 () Bool)

(declare-fun res!133020 () Bool)

(assert (=> b!268738 (=> (not res!133020) (not e!173533))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268738 (= res!133020 (and (= (size!6576 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6576 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6576 a!3325))))))

(declare-fun b!268739 () Bool)

(declare-fun e!173534 () Bool)

(assert (=> b!268739 (= e!173534 false)))

(declare-fun lt!134977 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13149 (_ BitVec 32)) Bool)

(assert (=> b!268739 (= lt!134977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268740 () Bool)

(declare-fun res!133018 () Bool)

(assert (=> b!268740 (=> (not res!133018) (not e!173533))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268740 (= res!133018 (validKeyInArray!0 k!2581))))

(declare-fun b!268741 () Bool)

(assert (=> b!268741 (= e!173533 e!173534)))

(declare-fun res!133017 () Bool)

(assert (=> b!268741 (=> (not res!133017) (not e!173534))))

(declare-datatypes ((SeekEntryResult!1382 0))(
  ( (MissingZero!1382 (index!7698 (_ BitVec 32))) (Found!1382 (index!7699 (_ BitVec 32))) (Intermediate!1382 (undefined!2194 Bool) (index!7700 (_ BitVec 32)) (x!26059 (_ BitVec 32))) (Undefined!1382) (MissingVacant!1382 (index!7701 (_ BitVec 32))) )
))
(declare-fun lt!134976 () SeekEntryResult!1382)

(assert (=> b!268741 (= res!133017 (or (= lt!134976 (MissingZero!1382 i!1267)) (= lt!134976 (MissingVacant!1382 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13149 (_ BitVec 32)) SeekEntryResult!1382)

(assert (=> b!268741 (= lt!134976 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!268742 () Bool)

(declare-fun res!133019 () Bool)

(assert (=> b!268742 (=> (not res!133019) (not e!173533))))

(declare-fun arrayContainsKey!0 (array!13149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268742 (= res!133019 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26052 res!133015) b!268738))

(assert (= (and b!268738 res!133020) b!268740))

(assert (= (and b!268740 res!133018) b!268737))

(assert (= (and b!268737 res!133016) b!268742))

(assert (= (and b!268742 res!133019) b!268741))

(assert (= (and b!268741 res!133017) b!268739))

(declare-fun m!284799 () Bool)

(assert (=> b!268739 m!284799))

(declare-fun m!284801 () Bool)

(assert (=> start!26052 m!284801))

(declare-fun m!284803 () Bool)

(assert (=> start!26052 m!284803))

(declare-fun m!284805 () Bool)

(assert (=> b!268741 m!284805))

(declare-fun m!284807 () Bool)

(assert (=> b!268740 m!284807))

(declare-fun m!284809 () Bool)

(assert (=> b!268737 m!284809))

(declare-fun m!284811 () Bool)

(assert (=> b!268742 m!284811))

(push 1)

