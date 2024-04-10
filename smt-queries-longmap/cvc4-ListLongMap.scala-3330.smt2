; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45976 () Bool)

(assert start!45976)

(declare-fun b!508974 () Bool)

(declare-fun e!297717 () Bool)

(assert (=> b!508974 (= e!297717 (not true))))

(declare-fun lt!232409 () (_ BitVec 32))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32687 0))(
  ( (array!32688 (arr!15722 (Array (_ BitVec 32) (_ BitVec 64))) (size!16086 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32687)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!508974 (= lt!232409 (toIndex!0 (select (store (arr!15722 a!3235) i!1204 k!2280) j!176) mask!3524))))

(declare-fun e!297715 () Bool)

(assert (=> b!508974 e!297715))

(declare-fun res!309826 () Bool)

(assert (=> b!508974 (=> (not res!309826) (not e!297715))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32687 (_ BitVec 32)) Bool)

(assert (=> b!508974 (= res!309826 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15636 0))(
  ( (Unit!15637) )
))
(declare-fun lt!232411 () Unit!15636)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32687 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15636)

(assert (=> b!508974 (= lt!232411 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!508975 () Bool)

(declare-fun res!309827 () Bool)

(declare-fun e!297714 () Bool)

(assert (=> b!508975 (=> (not res!309827) (not e!297714))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508975 (= res!309827 (validKeyInArray!0 (select (arr!15722 a!3235) j!176)))))

(declare-fun b!508976 () Bool)

(assert (=> b!508976 (= e!297714 e!297717)))

(declare-fun res!309819 () Bool)

(assert (=> b!508976 (=> (not res!309819) (not e!297717))))

(declare-datatypes ((SeekEntryResult!4189 0))(
  ( (MissingZero!4189 (index!18944 (_ BitVec 32))) (Found!4189 (index!18945 (_ BitVec 32))) (Intermediate!4189 (undefined!5001 Bool) (index!18946 (_ BitVec 32)) (x!47918 (_ BitVec 32))) (Undefined!4189) (MissingVacant!4189 (index!18947 (_ BitVec 32))) )
))
(declare-fun lt!232410 () SeekEntryResult!4189)

(assert (=> b!508976 (= res!309819 (or (= lt!232410 (MissingZero!4189 i!1204)) (= lt!232410 (MissingVacant!4189 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32687 (_ BitVec 32)) SeekEntryResult!4189)

(assert (=> b!508976 (= lt!232410 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!508977 () Bool)

(declare-fun res!309822 () Bool)

(assert (=> b!508977 (=> (not res!309822) (not e!297714))))

(assert (=> b!508977 (= res!309822 (and (= (size!16086 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16086 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16086 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508978 () Bool)

(assert (=> b!508978 (= e!297715 (= (seekEntryOrOpen!0 (select (arr!15722 a!3235) j!176) a!3235 mask!3524) (Found!4189 j!176)))))

(declare-fun b!508979 () Bool)

(declare-fun res!309823 () Bool)

(assert (=> b!508979 (=> (not res!309823) (not e!297714))))

(declare-fun arrayContainsKey!0 (array!32687 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508979 (= res!309823 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!309825 () Bool)

(assert (=> start!45976 (=> (not res!309825) (not e!297714))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45976 (= res!309825 (validMask!0 mask!3524))))

(assert (=> start!45976 e!297714))

(assert (=> start!45976 true))

(declare-fun array_inv!11518 (array!32687) Bool)

(assert (=> start!45976 (array_inv!11518 a!3235)))

(declare-fun b!508980 () Bool)

(declare-fun res!309820 () Bool)

(assert (=> b!508980 (=> (not res!309820) (not e!297714))))

(assert (=> b!508980 (= res!309820 (validKeyInArray!0 k!2280))))

(declare-fun b!508981 () Bool)

(declare-fun res!309821 () Bool)

(assert (=> b!508981 (=> (not res!309821) (not e!297717))))

(declare-datatypes ((List!9880 0))(
  ( (Nil!9877) (Cons!9876 (h!10753 (_ BitVec 64)) (t!16108 List!9880)) )
))
(declare-fun arrayNoDuplicates!0 (array!32687 (_ BitVec 32) List!9880) Bool)

(assert (=> b!508981 (= res!309821 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9877))))

(declare-fun b!508982 () Bool)

(declare-fun res!309824 () Bool)

(assert (=> b!508982 (=> (not res!309824) (not e!297717))))

(assert (=> b!508982 (= res!309824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45976 res!309825) b!508977))

(assert (= (and b!508977 res!309822) b!508975))

(assert (= (and b!508975 res!309827) b!508980))

(assert (= (and b!508980 res!309820) b!508979))

(assert (= (and b!508979 res!309823) b!508976))

(assert (= (and b!508976 res!309819) b!508982))

(assert (= (and b!508982 res!309824) b!508981))

(assert (= (and b!508981 res!309821) b!508974))

(assert (= (and b!508974 res!309826) b!508978))

(declare-fun m!489711 () Bool)

(assert (=> b!508974 m!489711))

(declare-fun m!489713 () Bool)

(assert (=> b!508974 m!489713))

(declare-fun m!489715 () Bool)

(assert (=> b!508974 m!489715))

(declare-fun m!489717 () Bool)

(assert (=> b!508974 m!489717))

(assert (=> b!508974 m!489715))

(declare-fun m!489719 () Bool)

(assert (=> b!508974 m!489719))

(declare-fun m!489721 () Bool)

(assert (=> b!508980 m!489721))

(declare-fun m!489723 () Bool)

(assert (=> b!508979 m!489723))

(declare-fun m!489725 () Bool)

(assert (=> b!508975 m!489725))

(assert (=> b!508975 m!489725))

(declare-fun m!489727 () Bool)

(assert (=> b!508975 m!489727))

(declare-fun m!489729 () Bool)

(assert (=> b!508982 m!489729))

(declare-fun m!489731 () Bool)

(assert (=> b!508981 m!489731))

(assert (=> b!508978 m!489725))

(assert (=> b!508978 m!489725))

(declare-fun m!489733 () Bool)

(assert (=> b!508978 m!489733))

(declare-fun m!489735 () Bool)

(assert (=> start!45976 m!489735))

(declare-fun m!489737 () Bool)

(assert (=> start!45976 m!489737))

(declare-fun m!489739 () Bool)

(assert (=> b!508976 m!489739))

(push 1)

(assert (not b!508976))

(assert (not b!508974))

(assert (not b!508981))

(assert (not b!508980))

(assert (not b!508979))

(assert (not b!508982))

(assert (not b!508975))

(assert (not start!45976))

(assert (not b!508978))

(check-sat)

