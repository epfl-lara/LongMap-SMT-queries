; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45966 () Bool)

(assert start!45966)

(declare-fun b!508730 () Bool)

(declare-fun e!297554 () Bool)

(declare-fun e!297553 () Bool)

(assert (=> b!508730 (= e!297554 e!297553)))

(declare-fun res!309722 () Bool)

(assert (=> b!508730 (=> (not res!309722) (not e!297553))))

(declare-datatypes ((SeekEntryResult!4186 0))(
  ( (MissingZero!4186 (index!18932 (_ BitVec 32))) (Found!4186 (index!18933 (_ BitVec 32))) (Intermediate!4186 (undefined!4998 Bool) (index!18934 (_ BitVec 32)) (x!47918 (_ BitVec 32))) (Undefined!4186) (MissingVacant!4186 (index!18935 (_ BitVec 32))) )
))
(declare-fun lt!232192 () SeekEntryResult!4186)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508730 (= res!309722 (or (= lt!232192 (MissingZero!4186 i!1204)) (= lt!232192 (MissingVacant!4186 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32687 0))(
  ( (array!32688 (arr!15722 (Array (_ BitVec 32) (_ BitVec 64))) (size!16087 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32687)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32687 (_ BitVec 32)) SeekEntryResult!4186)

(assert (=> b!508730 (= lt!232192 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!508731 () Bool)

(declare-fun res!309717 () Bool)

(assert (=> b!508731 (=> (not res!309717) (not e!297554))))

(declare-fun arrayContainsKey!0 (array!32687 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508731 (= res!309717 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508732 () Bool)

(declare-fun res!309723 () Bool)

(assert (=> b!508732 (=> (not res!309723) (not e!297554))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!508732 (= res!309723 (and (= (size!16087 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16087 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16087 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508733 () Bool)

(declare-fun res!309718 () Bool)

(assert (=> b!508733 (=> (not res!309718) (not e!297554))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508733 (= res!309718 (validKeyInArray!0 k0!2280))))

(declare-fun b!508734 () Bool)

(declare-fun res!309719 () Bool)

(assert (=> b!508734 (=> (not res!309719) (not e!297553))))

(declare-datatypes ((List!9919 0))(
  ( (Nil!9916) (Cons!9915 (h!10792 (_ BitVec 64)) (t!16138 List!9919)) )
))
(declare-fun arrayNoDuplicates!0 (array!32687 (_ BitVec 32) List!9919) Bool)

(assert (=> b!508734 (= res!309719 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9916))))

(declare-fun b!508736 () Bool)

(declare-fun res!309724 () Bool)

(assert (=> b!508736 (=> (not res!309724) (not e!297553))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32687 (_ BitVec 32)) Bool)

(assert (=> b!508736 (= res!309724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508737 () Bool)

(assert (=> b!508737 (= e!297553 (not true))))

(declare-fun lt!232193 () SeekEntryResult!4186)

(declare-fun lt!232191 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32687 (_ BitVec 32)) SeekEntryResult!4186)

(assert (=> b!508737 (= lt!232193 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232191 (select (store (arr!15722 a!3235) i!1204 k0!2280) j!176) (array!32688 (store (arr!15722 a!3235) i!1204 k0!2280) (size!16087 a!3235)) mask!3524))))

(declare-fun lt!232194 () SeekEntryResult!4186)

(declare-fun lt!232190 () (_ BitVec 32))

(assert (=> b!508737 (= lt!232194 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232190 (select (arr!15722 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!508737 (= lt!232191 (toIndex!0 (select (store (arr!15722 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!508737 (= lt!232190 (toIndex!0 (select (arr!15722 a!3235) j!176) mask!3524))))

(declare-fun e!297552 () Bool)

(assert (=> b!508737 e!297552))

(declare-fun res!309720 () Bool)

(assert (=> b!508737 (=> (not res!309720) (not e!297552))))

(assert (=> b!508737 (= res!309720 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15616 0))(
  ( (Unit!15617) )
))
(declare-fun lt!232195 () Unit!15616)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32687 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15616)

(assert (=> b!508737 (= lt!232195 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!508738 () Bool)

(declare-fun res!309725 () Bool)

(assert (=> b!508738 (=> (not res!309725) (not e!297554))))

(assert (=> b!508738 (= res!309725 (validKeyInArray!0 (select (arr!15722 a!3235) j!176)))))

(declare-fun res!309721 () Bool)

(assert (=> start!45966 (=> (not res!309721) (not e!297554))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45966 (= res!309721 (validMask!0 mask!3524))))

(assert (=> start!45966 e!297554))

(assert (=> start!45966 true))

(declare-fun array_inv!11605 (array!32687) Bool)

(assert (=> start!45966 (array_inv!11605 a!3235)))

(declare-fun b!508735 () Bool)

(assert (=> b!508735 (= e!297552 (= (seekEntryOrOpen!0 (select (arr!15722 a!3235) j!176) a!3235 mask!3524) (Found!4186 j!176)))))

(assert (= (and start!45966 res!309721) b!508732))

(assert (= (and b!508732 res!309723) b!508738))

(assert (= (and b!508738 res!309725) b!508733))

(assert (= (and b!508733 res!309718) b!508731))

(assert (= (and b!508731 res!309717) b!508730))

(assert (= (and b!508730 res!309722) b!508736))

(assert (= (and b!508736 res!309724) b!508734))

(assert (= (and b!508734 res!309719) b!508737))

(assert (= (and b!508737 res!309720) b!508735))

(declare-fun m!488989 () Bool)

(assert (=> b!508738 m!488989))

(assert (=> b!508738 m!488989))

(declare-fun m!488991 () Bool)

(assert (=> b!508738 m!488991))

(assert (=> b!508737 m!488989))

(declare-fun m!488993 () Bool)

(assert (=> b!508737 m!488993))

(declare-fun m!488995 () Bool)

(assert (=> b!508737 m!488995))

(declare-fun m!488997 () Bool)

(assert (=> b!508737 m!488997))

(assert (=> b!508737 m!488989))

(declare-fun m!488999 () Bool)

(assert (=> b!508737 m!488999))

(assert (=> b!508737 m!488989))

(declare-fun m!489001 () Bool)

(assert (=> b!508737 m!489001))

(declare-fun m!489003 () Bool)

(assert (=> b!508737 m!489003))

(declare-fun m!489005 () Bool)

(assert (=> b!508737 m!489005))

(assert (=> b!508737 m!489003))

(assert (=> b!508737 m!489003))

(declare-fun m!489007 () Bool)

(assert (=> b!508737 m!489007))

(declare-fun m!489009 () Bool)

(assert (=> start!45966 m!489009))

(declare-fun m!489011 () Bool)

(assert (=> start!45966 m!489011))

(declare-fun m!489013 () Bool)

(assert (=> b!508733 m!489013))

(declare-fun m!489015 () Bool)

(assert (=> b!508731 m!489015))

(declare-fun m!489017 () Bool)

(assert (=> b!508736 m!489017))

(declare-fun m!489019 () Bool)

(assert (=> b!508734 m!489019))

(declare-fun m!489021 () Bool)

(assert (=> b!508730 m!489021))

(assert (=> b!508735 m!488989))

(assert (=> b!508735 m!488989))

(declare-fun m!489023 () Bool)

(assert (=> b!508735 m!489023))

(check-sat (not b!508738) (not b!508737) (not b!508734) (not b!508735) (not b!508733) (not b!508736) (not b!508731) (not start!45966) (not b!508730))
(check-sat)
