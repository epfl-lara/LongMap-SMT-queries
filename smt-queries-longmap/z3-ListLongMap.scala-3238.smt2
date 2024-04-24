; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45224 () Bool)

(assert start!45224)

(declare-fun b!496623 () Bool)

(declare-fun res!299064 () Bool)

(declare-fun e!291196 () Bool)

(assert (=> b!496623 (=> (not res!299064) (not e!291196))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496623 (= res!299064 (validKeyInArray!0 k0!2280))))

(declare-fun b!496624 () Bool)

(declare-fun res!299068 () Bool)

(assert (=> b!496624 (=> (not res!299068) (not e!291196))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32113 0))(
  ( (array!32114 (arr!15439 (Array (_ BitVec 32) (_ BitVec 64))) (size!15803 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32113)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!496624 (= res!299068 (and (= (size!15803 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15803 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15803 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!299070 () Bool)

(assert (=> start!45224 (=> (not res!299070) (not e!291196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45224 (= res!299070 (validMask!0 mask!3524))))

(assert (=> start!45224 e!291196))

(assert (=> start!45224 true))

(declare-fun array_inv!11298 (array!32113) Bool)

(assert (=> start!45224 (array_inv!11298 a!3235)))

(declare-fun b!496625 () Bool)

(declare-fun e!291197 () Bool)

(assert (=> b!496625 (= e!291196 e!291197)))

(declare-fun res!299067 () Bool)

(assert (=> b!496625 (=> (not res!299067) (not e!291197))))

(declare-datatypes ((SeekEntryResult!3862 0))(
  ( (MissingZero!3862 (index!17627 (_ BitVec 32))) (Found!3862 (index!17628 (_ BitVec 32))) (Intermediate!3862 (undefined!4674 Bool) (index!17629 (_ BitVec 32)) (x!46831 (_ BitVec 32))) (Undefined!3862) (MissingVacant!3862 (index!17630 (_ BitVec 32))) )
))
(declare-fun lt!224867 () SeekEntryResult!3862)

(assert (=> b!496625 (= res!299067 (or (= lt!224867 (MissingZero!3862 i!1204)) (= lt!224867 (MissingVacant!3862 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32113 (_ BitVec 32)) SeekEntryResult!3862)

(assert (=> b!496625 (= lt!224867 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!496626 () Bool)

(declare-fun res!299074 () Bool)

(assert (=> b!496626 (=> (not res!299074) (not e!291196))))

(declare-fun arrayContainsKey!0 (array!32113 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496626 (= res!299074 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496627 () Bool)

(declare-fun res!299072 () Bool)

(assert (=> b!496627 (=> (not res!299072) (not e!291197))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32113 (_ BitVec 32)) Bool)

(assert (=> b!496627 (= res!299072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496628 () Bool)

(declare-fun e!291198 () Bool)

(assert (=> b!496628 (= e!291197 (not e!291198))))

(declare-fun res!299066 () Bool)

(assert (=> b!496628 (=> res!299066 e!291198)))

(declare-fun lt!224868 () (_ BitVec 32))

(declare-fun lt!224866 () SeekEntryResult!3862)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32113 (_ BitVec 32)) SeekEntryResult!3862)

(assert (=> b!496628 (= res!299066 (= lt!224866 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224868 (select (store (arr!15439 a!3235) i!1204 k0!2280) j!176) (array!32114 (store (arr!15439 a!3235) i!1204 k0!2280) (size!15803 a!3235)) mask!3524)))))

(declare-fun lt!224865 () (_ BitVec 32))

(assert (=> b!496628 (= lt!224866 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224865 (select (arr!15439 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496628 (= lt!224868 (toIndex!0 (select (store (arr!15439 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!496628 (= lt!224865 (toIndex!0 (select (arr!15439 a!3235) j!176) mask!3524))))

(declare-fun e!291194 () Bool)

(assert (=> b!496628 e!291194))

(declare-fun res!299069 () Bool)

(assert (=> b!496628 (=> (not res!299069) (not e!291194))))

(assert (=> b!496628 (= res!299069 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14731 0))(
  ( (Unit!14732) )
))
(declare-fun lt!224869 () Unit!14731)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32113 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14731)

(assert (=> b!496628 (= lt!224869 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496629 () Bool)

(assert (=> b!496629 (= e!291194 (= (seekEntryOrOpen!0 (select (arr!15439 a!3235) j!176) a!3235 mask!3524) (Found!3862 j!176)))))

(declare-fun b!496630 () Bool)

(declare-fun res!299071 () Bool)

(assert (=> b!496630 (=> (not res!299071) (not e!291197))))

(declare-datatypes ((List!9504 0))(
  ( (Nil!9501) (Cons!9500 (h!10371 (_ BitVec 64)) (t!15724 List!9504)) )
))
(declare-fun arrayNoDuplicates!0 (array!32113 (_ BitVec 32) List!9504) Bool)

(assert (=> b!496630 (= res!299071 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9501))))

(declare-fun b!496631 () Bool)

(assert (=> b!496631 (= e!291198 true)))

(assert (=> b!496631 (and (bvslt (x!46831 lt!224866) #b01111111111111111111111111111110) (or (= (select (arr!15439 a!3235) (index!17629 lt!224866)) (select (arr!15439 a!3235) j!176)) (= (select (arr!15439 a!3235) (index!17629 lt!224866)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15439 a!3235) (index!17629 lt!224866)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496632 () Bool)

(declare-fun res!299073 () Bool)

(assert (=> b!496632 (=> (not res!299073) (not e!291196))))

(assert (=> b!496632 (= res!299073 (validKeyInArray!0 (select (arr!15439 a!3235) j!176)))))

(declare-fun b!496633 () Bool)

(declare-fun res!299065 () Bool)

(assert (=> b!496633 (=> res!299065 e!291198)))

(get-info :version)

(assert (=> b!496633 (= res!299065 (or (undefined!4674 lt!224866) (not ((_ is Intermediate!3862) lt!224866))))))

(assert (= (and start!45224 res!299070) b!496624))

(assert (= (and b!496624 res!299068) b!496632))

(assert (= (and b!496632 res!299073) b!496623))

(assert (= (and b!496623 res!299064) b!496626))

(assert (= (and b!496626 res!299074) b!496625))

(assert (= (and b!496625 res!299067) b!496627))

(assert (= (and b!496627 res!299072) b!496630))

(assert (= (and b!496630 res!299071) b!496628))

(assert (= (and b!496628 res!299069) b!496629))

(assert (= (and b!496628 (not res!299066)) b!496633))

(assert (= (and b!496633 (not res!299065)) b!496631))

(declare-fun m!478141 () Bool)

(assert (=> b!496623 m!478141))

(declare-fun m!478143 () Bool)

(assert (=> b!496632 m!478143))

(assert (=> b!496632 m!478143))

(declare-fun m!478145 () Bool)

(assert (=> b!496632 m!478145))

(declare-fun m!478147 () Bool)

(assert (=> b!496627 m!478147))

(declare-fun m!478149 () Bool)

(assert (=> b!496631 m!478149))

(assert (=> b!496631 m!478143))

(declare-fun m!478151 () Bool)

(assert (=> b!496625 m!478151))

(declare-fun m!478153 () Bool)

(assert (=> start!45224 m!478153))

(declare-fun m!478155 () Bool)

(assert (=> start!45224 m!478155))

(declare-fun m!478157 () Bool)

(assert (=> b!496630 m!478157))

(assert (=> b!496629 m!478143))

(assert (=> b!496629 m!478143))

(declare-fun m!478159 () Bool)

(assert (=> b!496629 m!478159))

(declare-fun m!478161 () Bool)

(assert (=> b!496626 m!478161))

(declare-fun m!478163 () Bool)

(assert (=> b!496628 m!478163))

(declare-fun m!478165 () Bool)

(assert (=> b!496628 m!478165))

(assert (=> b!496628 m!478143))

(declare-fun m!478167 () Bool)

(assert (=> b!496628 m!478167))

(assert (=> b!496628 m!478143))

(declare-fun m!478169 () Bool)

(assert (=> b!496628 m!478169))

(assert (=> b!496628 m!478143))

(declare-fun m!478171 () Bool)

(assert (=> b!496628 m!478171))

(declare-fun m!478173 () Bool)

(assert (=> b!496628 m!478173))

(assert (=> b!496628 m!478165))

(declare-fun m!478175 () Bool)

(assert (=> b!496628 m!478175))

(assert (=> b!496628 m!478165))

(declare-fun m!478177 () Bool)

(assert (=> b!496628 m!478177))

(check-sat (not b!496627) (not start!45224) (not b!496629) (not b!496626) (not b!496630) (not b!496628) (not b!496625) (not b!496623) (not b!496632))
(check-sat)
