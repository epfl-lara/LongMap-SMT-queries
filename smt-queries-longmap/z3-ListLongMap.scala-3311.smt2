; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45800 () Bool)

(assert start!45800)

(declare-datatypes ((array!32557 0))(
  ( (array!32558 (arr!15658 (Array (_ BitVec 32) (_ BitVec 64))) (size!16022 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32557)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!507087 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!296769 () Bool)

(declare-datatypes ((SeekEntryResult!4081 0))(
  ( (MissingZero!4081 (index!18512 (_ BitVec 32))) (Found!4081 (index!18513 (_ BitVec 32))) (Intermediate!4081 (undefined!4893 Bool) (index!18514 (_ BitVec 32)) (x!47655 (_ BitVec 32))) (Undefined!4081) (MissingVacant!4081 (index!18515 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32557 (_ BitVec 32)) SeekEntryResult!4081)

(assert (=> b!507087 (= e!296769 (= (seekEntryOrOpen!0 (select (arr!15658 a!3235) j!176) a!3235 mask!3524) (Found!4081 j!176)))))

(declare-fun b!507088 () Bool)

(declare-fun e!296765 () Bool)

(assert (=> b!507088 (= e!296765 true)))

(declare-fun lt!231505 () (_ BitVec 64))

(declare-fun lt!231499 () array!32557)

(declare-fun lt!231497 () SeekEntryResult!4081)

(assert (=> b!507088 (= lt!231497 (seekEntryOrOpen!0 lt!231505 lt!231499 mask!3524))))

(assert (=> b!507088 false))

(declare-fun b!507089 () Bool)

(declare-fun e!296768 () Bool)

(declare-fun e!296767 () Bool)

(assert (=> b!507089 (= e!296768 e!296767)))

(declare-fun res!308105 () Bool)

(assert (=> b!507089 (=> (not res!308105) (not e!296767))))

(declare-fun lt!231503 () SeekEntryResult!4081)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507089 (= res!308105 (or (= lt!231503 (MissingZero!4081 i!1204)) (= lt!231503 (MissingVacant!4081 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!507089 (= lt!231503 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!507090 () Bool)

(declare-fun res!308109 () Bool)

(assert (=> b!507090 (=> (not res!308109) (not e!296768))))

(assert (=> b!507090 (= res!308109 (and (= (size!16022 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16022 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16022 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507091 () Bool)

(declare-fun e!296764 () Bool)

(assert (=> b!507091 (= e!296764 e!296765)))

(declare-fun res!308100 () Bool)

(assert (=> b!507091 (=> res!308100 e!296765)))

(declare-fun lt!231500 () Bool)

(declare-fun lt!231502 () SeekEntryResult!4081)

(assert (=> b!507091 (= res!308100 (or (and (not lt!231500) (undefined!4893 lt!231502)) (and (not lt!231500) (not (undefined!4893 lt!231502)))))))

(get-info :version)

(assert (=> b!507091 (= lt!231500 (not ((_ is Intermediate!4081) lt!231502)))))

(declare-fun b!507092 () Bool)

(assert (=> b!507092 (= e!296767 (not e!296764))))

(declare-fun res!308101 () Bool)

(assert (=> b!507092 (=> res!308101 e!296764)))

(declare-fun lt!231504 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32557 (_ BitVec 32)) SeekEntryResult!4081)

(assert (=> b!507092 (= res!308101 (= lt!231502 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231504 lt!231505 lt!231499 mask!3524)))))

(declare-fun lt!231498 () (_ BitVec 32))

(assert (=> b!507092 (= lt!231502 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231498 (select (arr!15658 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507092 (= lt!231504 (toIndex!0 lt!231505 mask!3524))))

(assert (=> b!507092 (= lt!231505 (select (store (arr!15658 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!507092 (= lt!231498 (toIndex!0 (select (arr!15658 a!3235) j!176) mask!3524))))

(assert (=> b!507092 (= lt!231499 (array!32558 (store (arr!15658 a!3235) i!1204 k0!2280) (size!16022 a!3235)))))

(assert (=> b!507092 e!296769))

(declare-fun res!308103 () Bool)

(assert (=> b!507092 (=> (not res!308103) (not e!296769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32557 (_ BitVec 32)) Bool)

(assert (=> b!507092 (= res!308103 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15511 0))(
  ( (Unit!15512) )
))
(declare-fun lt!231501 () Unit!15511)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32557 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15511)

(assert (=> b!507092 (= lt!231501 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507093 () Bool)

(declare-fun res!308104 () Bool)

(assert (=> b!507093 (=> (not res!308104) (not e!296768))))

(declare-fun arrayContainsKey!0 (array!32557 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507093 (= res!308104 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!308108 () Bool)

(assert (=> start!45800 (=> (not res!308108) (not e!296768))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45800 (= res!308108 (validMask!0 mask!3524))))

(assert (=> start!45800 e!296768))

(assert (=> start!45800 true))

(declare-fun array_inv!11517 (array!32557) Bool)

(assert (=> start!45800 (array_inv!11517 a!3235)))

(declare-fun b!507094 () Bool)

(declare-fun res!308110 () Bool)

(assert (=> b!507094 (=> (not res!308110) (not e!296768))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507094 (= res!308110 (validKeyInArray!0 (select (arr!15658 a!3235) j!176)))))

(declare-fun b!507095 () Bool)

(declare-fun res!308106 () Bool)

(assert (=> b!507095 (=> (not res!308106) (not e!296767))))

(assert (=> b!507095 (= res!308106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507096 () Bool)

(declare-fun res!308107 () Bool)

(assert (=> b!507096 (=> (not res!308107) (not e!296767))))

(declare-datatypes ((List!9723 0))(
  ( (Nil!9720) (Cons!9719 (h!10596 (_ BitVec 64)) (t!15943 List!9723)) )
))
(declare-fun arrayNoDuplicates!0 (array!32557 (_ BitVec 32) List!9723) Bool)

(assert (=> b!507096 (= res!308107 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9720))))

(declare-fun b!507097 () Bool)

(declare-fun res!308102 () Bool)

(assert (=> b!507097 (=> (not res!308102) (not e!296768))))

(assert (=> b!507097 (= res!308102 (validKeyInArray!0 k0!2280))))

(assert (= (and start!45800 res!308108) b!507090))

(assert (= (and b!507090 res!308109) b!507094))

(assert (= (and b!507094 res!308110) b!507097))

(assert (= (and b!507097 res!308102) b!507093))

(assert (= (and b!507093 res!308104) b!507089))

(assert (= (and b!507089 res!308105) b!507095))

(assert (= (and b!507095 res!308106) b!507096))

(assert (= (and b!507096 res!308107) b!507092))

(assert (= (and b!507092 res!308103) b!507087))

(assert (= (and b!507092 (not res!308101)) b!507091))

(assert (= (and b!507091 (not res!308100)) b!507088))

(declare-fun m!488059 () Bool)

(assert (=> b!507093 m!488059))

(declare-fun m!488061 () Bool)

(assert (=> b!507089 m!488061))

(declare-fun m!488063 () Bool)

(assert (=> b!507097 m!488063))

(declare-fun m!488065 () Bool)

(assert (=> b!507094 m!488065))

(assert (=> b!507094 m!488065))

(declare-fun m!488067 () Bool)

(assert (=> b!507094 m!488067))

(declare-fun m!488069 () Bool)

(assert (=> b!507095 m!488069))

(declare-fun m!488071 () Bool)

(assert (=> b!507088 m!488071))

(assert (=> b!507087 m!488065))

(assert (=> b!507087 m!488065))

(declare-fun m!488073 () Bool)

(assert (=> b!507087 m!488073))

(declare-fun m!488075 () Bool)

(assert (=> b!507096 m!488075))

(declare-fun m!488077 () Bool)

(assert (=> start!45800 m!488077))

(declare-fun m!488079 () Bool)

(assert (=> start!45800 m!488079))

(declare-fun m!488081 () Bool)

(assert (=> b!507092 m!488081))

(declare-fun m!488083 () Bool)

(assert (=> b!507092 m!488083))

(declare-fun m!488085 () Bool)

(assert (=> b!507092 m!488085))

(declare-fun m!488087 () Bool)

(assert (=> b!507092 m!488087))

(assert (=> b!507092 m!488065))

(declare-fun m!488089 () Bool)

(assert (=> b!507092 m!488089))

(declare-fun m!488091 () Bool)

(assert (=> b!507092 m!488091))

(assert (=> b!507092 m!488065))

(declare-fun m!488093 () Bool)

(assert (=> b!507092 m!488093))

(assert (=> b!507092 m!488065))

(declare-fun m!488095 () Bool)

(assert (=> b!507092 m!488095))

(check-sat (not start!45800) (not b!507087) (not b!507097) (not b!507092) (not b!507095) (not b!507096) (not b!507089) (not b!507093) (not b!507088) (not b!507094))
(check-sat)
