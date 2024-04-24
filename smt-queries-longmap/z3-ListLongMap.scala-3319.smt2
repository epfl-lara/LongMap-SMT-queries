; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45848 () Bool)

(assert start!45848)

(declare-fun b!507871 () Bool)

(declare-fun e!297190 () Bool)

(declare-fun e!297191 () Bool)

(assert (=> b!507871 (= e!297190 e!297191)))

(declare-fun res!308889 () Bool)

(assert (=> b!507871 (=> (not res!308889) (not e!297191))))

(declare-datatypes ((SeekEntryResult!4105 0))(
  ( (MissingZero!4105 (index!18608 (_ BitVec 32))) (Found!4105 (index!18609 (_ BitVec 32))) (Intermediate!4105 (undefined!4917 Bool) (index!18610 (_ BitVec 32)) (x!47743 (_ BitVec 32))) (Undefined!4105) (MissingVacant!4105 (index!18611 (_ BitVec 32))) )
))
(declare-fun lt!232132 () SeekEntryResult!4105)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507871 (= res!308889 (or (= lt!232132 (MissingZero!4105 i!1204)) (= lt!232132 (MissingVacant!4105 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32605 0))(
  ( (array!32606 (arr!15682 (Array (_ BitVec 32) (_ BitVec 64))) (size!16046 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32605)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32605 (_ BitVec 32)) SeekEntryResult!4105)

(assert (=> b!507871 (= lt!232132 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!507872 () Bool)

(declare-fun res!308886 () Bool)

(assert (=> b!507872 (=> (not res!308886) (not e!297190))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507872 (= res!308886 (validKeyInArray!0 (select (arr!15682 a!3235) j!176)))))

(declare-fun b!507873 () Bool)

(declare-fun res!308884 () Bool)

(assert (=> b!507873 (=> (not res!308884) (not e!297190))))

(assert (=> b!507873 (= res!308884 (and (= (size!16046 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16046 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16046 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!308887 () Bool)

(assert (=> start!45848 (=> (not res!308887) (not e!297190))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45848 (= res!308887 (validMask!0 mask!3524))))

(assert (=> start!45848 e!297190))

(assert (=> start!45848 true))

(declare-fun array_inv!11541 (array!32605) Bool)

(assert (=> start!45848 (array_inv!11541 a!3235)))

(declare-fun b!507874 () Bool)

(declare-fun res!308888 () Bool)

(assert (=> b!507874 (=> (not res!308888) (not e!297190))))

(assert (=> b!507874 (= res!308888 (validKeyInArray!0 k0!2280))))

(declare-fun b!507875 () Bool)

(declare-fun res!308890 () Bool)

(assert (=> b!507875 (=> (not res!308890) (not e!297190))))

(declare-fun arrayContainsKey!0 (array!32605 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507875 (= res!308890 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507876 () Bool)

(assert (=> b!507876 (= e!297191 false)))

(declare-fun lt!232131 () Bool)

(declare-datatypes ((List!9747 0))(
  ( (Nil!9744) (Cons!9743 (h!10620 (_ BitVec 64)) (t!15967 List!9747)) )
))
(declare-fun arrayNoDuplicates!0 (array!32605 (_ BitVec 32) List!9747) Bool)

(assert (=> b!507876 (= lt!232131 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9744))))

(declare-fun b!507877 () Bool)

(declare-fun res!308885 () Bool)

(assert (=> b!507877 (=> (not res!308885) (not e!297191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32605 (_ BitVec 32)) Bool)

(assert (=> b!507877 (= res!308885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45848 res!308887) b!507873))

(assert (= (and b!507873 res!308884) b!507872))

(assert (= (and b!507872 res!308886) b!507874))

(assert (= (and b!507874 res!308888) b!507875))

(assert (= (and b!507875 res!308890) b!507871))

(assert (= (and b!507871 res!308889) b!507877))

(assert (= (and b!507877 res!308885) b!507876))

(declare-fun m!488971 () Bool)

(assert (=> start!45848 m!488971))

(declare-fun m!488973 () Bool)

(assert (=> start!45848 m!488973))

(declare-fun m!488975 () Bool)

(assert (=> b!507872 m!488975))

(assert (=> b!507872 m!488975))

(declare-fun m!488977 () Bool)

(assert (=> b!507872 m!488977))

(declare-fun m!488979 () Bool)

(assert (=> b!507875 m!488979))

(declare-fun m!488981 () Bool)

(assert (=> b!507876 m!488981))

(declare-fun m!488983 () Bool)

(assert (=> b!507874 m!488983))

(declare-fun m!488985 () Bool)

(assert (=> b!507871 m!488985))

(declare-fun m!488987 () Bool)

(assert (=> b!507877 m!488987))

(check-sat (not b!507872) (not start!45848) (not b!507875) (not b!507874) (not b!507877) (not b!507871) (not b!507876))
(check-sat)
