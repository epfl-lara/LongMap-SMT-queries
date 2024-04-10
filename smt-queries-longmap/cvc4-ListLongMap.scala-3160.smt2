; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44536 () Bool)

(assert start!44536)

(declare-fun b!488865 () Bool)

(declare-fun res!291920 () Bool)

(declare-fun e!287556 () Bool)

(assert (=> b!488865 (=> (not res!291920) (not e!287556))))

(declare-datatypes ((array!31646 0))(
  ( (array!31647 (arr!15212 (Array (_ BitVec 32) (_ BitVec 64))) (size!15576 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31646)

(declare-datatypes ((List!9370 0))(
  ( (Nil!9367) (Cons!9366 (h!10225 (_ BitVec 64)) (t!15598 List!9370)) )
))
(declare-fun arrayNoDuplicates!0 (array!31646 (_ BitVec 32) List!9370) Bool)

(assert (=> b!488865 (= res!291920 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9367))))

(declare-fun b!488866 () Bool)

(declare-fun res!291918 () Bool)

(declare-fun e!287557 () Bool)

(assert (=> b!488866 (=> (not res!291918) (not e!287557))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31646 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488866 (= res!291918 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!488867 () Bool)

(declare-fun res!291913 () Bool)

(assert (=> b!488867 (=> (not res!291913) (not e!287556))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31646 (_ BitVec 32)) Bool)

(assert (=> b!488867 (= res!291913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!488868 () Bool)

(assert (=> b!488868 (= e!287556 (not true))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!220556 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!488868 (= lt!220556 (toIndex!0 (select (store (arr!15212 a!3235) i!1204 k!2280) j!176) mask!3524))))

(declare-fun e!287559 () Bool)

(assert (=> b!488868 e!287559))

(declare-fun res!291914 () Bool)

(assert (=> b!488868 (=> (not res!291914) (not e!287559))))

(assert (=> b!488868 (= res!291914 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14304 0))(
  ( (Unit!14305) )
))
(declare-fun lt!220557 () Unit!14304)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31646 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14304)

(assert (=> b!488868 (= lt!220557 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!488869 () Bool)

(declare-fun res!291917 () Bool)

(assert (=> b!488869 (=> (not res!291917) (not e!287557))))

(assert (=> b!488869 (= res!291917 (and (= (size!15576 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15576 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15576 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!488870 () Bool)

(assert (=> b!488870 (= e!287557 e!287556)))

(declare-fun res!291916 () Bool)

(assert (=> b!488870 (=> (not res!291916) (not e!287556))))

(declare-datatypes ((SeekEntryResult!3679 0))(
  ( (MissingZero!3679 (index!16895 (_ BitVec 32))) (Found!3679 (index!16896 (_ BitVec 32))) (Intermediate!3679 (undefined!4491 Bool) (index!16897 (_ BitVec 32)) (x!46006 (_ BitVec 32))) (Undefined!3679) (MissingVacant!3679 (index!16898 (_ BitVec 32))) )
))
(declare-fun lt!220558 () SeekEntryResult!3679)

(assert (=> b!488870 (= res!291916 (or (= lt!220558 (MissingZero!3679 i!1204)) (= lt!220558 (MissingVacant!3679 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31646 (_ BitVec 32)) SeekEntryResult!3679)

(assert (=> b!488870 (= lt!220558 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!291919 () Bool)

(assert (=> start!44536 (=> (not res!291919) (not e!287557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44536 (= res!291919 (validMask!0 mask!3524))))

(assert (=> start!44536 e!287557))

(assert (=> start!44536 true))

(declare-fun array_inv!11008 (array!31646) Bool)

(assert (=> start!44536 (array_inv!11008 a!3235)))

(declare-fun b!488871 () Bool)

(declare-fun res!291915 () Bool)

(assert (=> b!488871 (=> (not res!291915) (not e!287557))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488871 (= res!291915 (validKeyInArray!0 (select (arr!15212 a!3235) j!176)))))

(declare-fun b!488872 () Bool)

(assert (=> b!488872 (= e!287559 (= (seekEntryOrOpen!0 (select (arr!15212 a!3235) j!176) a!3235 mask!3524) (Found!3679 j!176)))))

(declare-fun b!488873 () Bool)

(declare-fun res!291912 () Bool)

(assert (=> b!488873 (=> (not res!291912) (not e!287557))))

(assert (=> b!488873 (= res!291912 (validKeyInArray!0 k!2280))))

(assert (= (and start!44536 res!291919) b!488869))

(assert (= (and b!488869 res!291917) b!488871))

(assert (= (and b!488871 res!291915) b!488873))

(assert (= (and b!488873 res!291912) b!488866))

(assert (= (and b!488866 res!291918) b!488870))

(assert (= (and b!488870 res!291916) b!488867))

(assert (= (and b!488867 res!291913) b!488865))

(assert (= (and b!488865 res!291920) b!488868))

(assert (= (and b!488868 res!291914) b!488872))

(declare-fun m!468597 () Bool)

(assert (=> b!488868 m!468597))

(declare-fun m!468599 () Bool)

(assert (=> b!488868 m!468599))

(declare-fun m!468601 () Bool)

(assert (=> b!488868 m!468601))

(declare-fun m!468603 () Bool)

(assert (=> b!488868 m!468603))

(assert (=> b!488868 m!468601))

(declare-fun m!468605 () Bool)

(assert (=> b!488868 m!468605))

(declare-fun m!468607 () Bool)

(assert (=> b!488870 m!468607))

(declare-fun m!468609 () Bool)

(assert (=> b!488867 m!468609))

(declare-fun m!468611 () Bool)

(assert (=> b!488865 m!468611))

(declare-fun m!468613 () Bool)

(assert (=> start!44536 m!468613))

(declare-fun m!468615 () Bool)

(assert (=> start!44536 m!468615))

(declare-fun m!468617 () Bool)

(assert (=> b!488873 m!468617))

(declare-fun m!468619 () Bool)

(assert (=> b!488871 m!468619))

(assert (=> b!488871 m!468619))

(declare-fun m!468621 () Bool)

(assert (=> b!488871 m!468621))

(assert (=> b!488872 m!468619))

(assert (=> b!488872 m!468619))

(declare-fun m!468623 () Bool)

(assert (=> b!488872 m!468623))

(declare-fun m!468625 () Bool)

(assert (=> b!488866 m!468625))

(push 1)

(assert (not b!488866))

(assert (not start!44536))

(assert (not b!488867))

(assert (not b!488871))

(assert (not b!488868))

(assert (not b!488870))

(assert (not b!488865))

(assert (not b!488872))

(assert (not b!488873))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

