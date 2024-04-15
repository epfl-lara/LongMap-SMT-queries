; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44976 () Bool)

(assert start!44976)

(declare-fun res!295915 () Bool)

(declare-fun e!289623 () Bool)

(assert (=> start!44976 (=> (not res!295915) (not e!289623))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44976 (= res!295915 (validMask!0 mask!3524))))

(assert (=> start!44976 e!289623))

(assert (=> start!44976 true))

(declare-datatypes ((array!31931 0))(
  ( (array!31932 (arr!15350 (Array (_ BitVec 32) (_ BitVec 64))) (size!15715 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31931)

(declare-fun array_inv!11233 (array!31931) Bool)

(assert (=> start!44976 (array_inv!11233 a!3235)))

(declare-fun b!493195 () Bool)

(declare-fun res!295909 () Bool)

(assert (=> b!493195 (=> (not res!295909) (not e!289623))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493195 (= res!295909 (validKeyInArray!0 k0!2280))))

(declare-fun b!493196 () Bool)

(declare-fun res!295908 () Bool)

(declare-fun e!289620 () Bool)

(assert (=> b!493196 (=> res!295908 e!289620)))

(declare-datatypes ((SeekEntryResult!3814 0))(
  ( (MissingZero!3814 (index!17435 (_ BitVec 32))) (Found!3814 (index!17436 (_ BitVec 32))) (Intermediate!3814 (undefined!4626 Bool) (index!17437 (_ BitVec 32)) (x!46527 (_ BitVec 32))) (Undefined!3814) (MissingVacant!3814 (index!17438 (_ BitVec 32))) )
))
(declare-fun lt!222958 () SeekEntryResult!3814)

(get-info :version)

(assert (=> b!493196 (= res!295908 (or (not ((_ is Intermediate!3814) lt!222958)) (not (undefined!4626 lt!222958))))))

(declare-fun b!493197 () Bool)

(assert (=> b!493197 (= e!289620 true)))

(declare-fun lt!222956 () SeekEntryResult!3814)

(assert (=> b!493197 (= lt!222956 Undefined!3814)))

(declare-fun b!493198 () Bool)

(declare-fun res!295913 () Bool)

(assert (=> b!493198 (=> (not res!295913) (not e!289623))))

(declare-fun arrayContainsKey!0 (array!31931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493198 (= res!295913 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493199 () Bool)

(declare-fun res!295914 () Bool)

(declare-fun e!289621 () Bool)

(assert (=> b!493199 (=> (not res!295914) (not e!289621))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31931 (_ BitVec 32)) Bool)

(assert (=> b!493199 (= res!295914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493200 () Bool)

(declare-fun res!295907 () Bool)

(assert (=> b!493200 (=> (not res!295907) (not e!289623))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!493200 (= res!295907 (and (= (size!15715 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15715 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15715 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493201 () Bool)

(assert (=> b!493201 (= e!289623 e!289621)))

(declare-fun res!295910 () Bool)

(assert (=> b!493201 (=> (not res!295910) (not e!289621))))

(declare-fun lt!222953 () SeekEntryResult!3814)

(assert (=> b!493201 (= res!295910 (or (= lt!222953 (MissingZero!3814 i!1204)) (= lt!222953 (MissingVacant!3814 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31931 (_ BitVec 32)) SeekEntryResult!3814)

(assert (=> b!493201 (= lt!222953 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!493202 () Bool)

(declare-fun res!295916 () Bool)

(assert (=> b!493202 (=> (not res!295916) (not e!289621))))

(declare-datatypes ((List!9547 0))(
  ( (Nil!9544) (Cons!9543 (h!10411 (_ BitVec 64)) (t!15766 List!9547)) )
))
(declare-fun arrayNoDuplicates!0 (array!31931 (_ BitVec 32) List!9547) Bool)

(assert (=> b!493202 (= res!295916 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9544))))

(declare-fun b!493203 () Bool)

(declare-fun res!295912 () Bool)

(assert (=> b!493203 (=> (not res!295912) (not e!289623))))

(assert (=> b!493203 (= res!295912 (validKeyInArray!0 (select (arr!15350 a!3235) j!176)))))

(declare-fun b!493204 () Bool)

(assert (=> b!493204 (= e!289621 (not e!289620))))

(declare-fun res!295911 () Bool)

(assert (=> b!493204 (=> res!295911 e!289620)))

(declare-fun lt!222957 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31931 (_ BitVec 32)) SeekEntryResult!3814)

(assert (=> b!493204 (= res!295911 (= lt!222958 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222957 (select (store (arr!15350 a!3235) i!1204 k0!2280) j!176) (array!31932 (store (arr!15350 a!3235) i!1204 k0!2280) (size!15715 a!3235)) mask!3524)))))

(declare-fun lt!222955 () (_ BitVec 32))

(assert (=> b!493204 (= lt!222958 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222955 (select (arr!15350 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493204 (= lt!222957 (toIndex!0 (select (store (arr!15350 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!493204 (= lt!222955 (toIndex!0 (select (arr!15350 a!3235) j!176) mask!3524))))

(assert (=> b!493204 (= lt!222956 (Found!3814 j!176))))

(assert (=> b!493204 (= lt!222956 (seekEntryOrOpen!0 (select (arr!15350 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!493204 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14560 0))(
  ( (Unit!14561) )
))
(declare-fun lt!222954 () Unit!14560)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31931 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14560)

(assert (=> b!493204 (= lt!222954 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44976 res!295915) b!493200))

(assert (= (and b!493200 res!295907) b!493203))

(assert (= (and b!493203 res!295912) b!493195))

(assert (= (and b!493195 res!295909) b!493198))

(assert (= (and b!493198 res!295913) b!493201))

(assert (= (and b!493201 res!295910) b!493199))

(assert (= (and b!493199 res!295914) b!493202))

(assert (= (and b!493202 res!295916) b!493204))

(assert (= (and b!493204 (not res!295911)) b!493196))

(assert (= (and b!493196 (not res!295908)) b!493197))

(declare-fun m!473563 () Bool)

(assert (=> b!493203 m!473563))

(assert (=> b!493203 m!473563))

(declare-fun m!473565 () Bool)

(assert (=> b!493203 m!473565))

(declare-fun m!473567 () Bool)

(assert (=> start!44976 m!473567))

(declare-fun m!473569 () Bool)

(assert (=> start!44976 m!473569))

(declare-fun m!473571 () Bool)

(assert (=> b!493201 m!473571))

(declare-fun m!473573 () Bool)

(assert (=> b!493199 m!473573))

(declare-fun m!473575 () Bool)

(assert (=> b!493204 m!473575))

(declare-fun m!473577 () Bool)

(assert (=> b!493204 m!473577))

(declare-fun m!473579 () Bool)

(assert (=> b!493204 m!473579))

(assert (=> b!493204 m!473563))

(declare-fun m!473581 () Bool)

(assert (=> b!493204 m!473581))

(declare-fun m!473583 () Bool)

(assert (=> b!493204 m!473583))

(assert (=> b!493204 m!473575))

(assert (=> b!493204 m!473563))

(declare-fun m!473585 () Bool)

(assert (=> b!493204 m!473585))

(assert (=> b!493204 m!473563))

(declare-fun m!473587 () Bool)

(assert (=> b!493204 m!473587))

(assert (=> b!493204 m!473563))

(declare-fun m!473589 () Bool)

(assert (=> b!493204 m!473589))

(assert (=> b!493204 m!473575))

(declare-fun m!473591 () Bool)

(assert (=> b!493204 m!473591))

(declare-fun m!473593 () Bool)

(assert (=> b!493202 m!473593))

(declare-fun m!473595 () Bool)

(assert (=> b!493195 m!473595))

(declare-fun m!473597 () Bool)

(assert (=> b!493198 m!473597))

(check-sat (not b!493204) (not b!493195) (not b!493199) (not b!493203) (not b!493202) (not b!493198) (not b!493201) (not start!44976))
(check-sat)
