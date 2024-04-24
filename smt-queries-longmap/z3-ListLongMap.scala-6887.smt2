; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86806 () Bool)

(assert start!86806)

(declare-fun b!1005019 () Bool)

(declare-fun res!673750 () Bool)

(declare-fun e!566123 () Bool)

(assert (=> b!1005019 (=> (not res!673750) (not e!566123))))

(declare-datatypes ((array!63426 0))(
  ( (array!63427 (arr!30532 (Array (_ BitVec 32) (_ BitVec 64))) (size!31035 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63426)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005019 (= res!673750 (validKeyInArray!0 (select (arr!30532 a!3219) j!170)))))

(declare-fun b!1005020 () Bool)

(declare-fun e!566119 () Bool)

(assert (=> b!1005020 (= e!566123 e!566119)))

(declare-fun res!673748 () Bool)

(assert (=> b!1005020 (=> (not res!673748) (not e!566119))))

(declare-datatypes ((SeekEntryResult!9400 0))(
  ( (MissingZero!9400 (index!39971 (_ BitVec 32))) (Found!9400 (index!39972 (_ BitVec 32))) (Intermediate!9400 (undefined!10212 Bool) (index!39973 (_ BitVec 32)) (x!87536 (_ BitVec 32))) (Undefined!9400) (MissingVacant!9400 (index!39974 (_ BitVec 32))) )
))
(declare-fun lt!444327 () SeekEntryResult!9400)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005020 (= res!673748 (or (= lt!444327 (MissingVacant!9400 i!1194)) (= lt!444327 (MissingZero!9400 i!1194))))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63426 (_ BitVec 32)) SeekEntryResult!9400)

(assert (=> b!1005020 (= lt!444327 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1005021 () Bool)

(declare-fun e!566124 () Bool)

(declare-fun e!566120 () Bool)

(assert (=> b!1005021 (= e!566124 e!566120)))

(declare-fun res!673744 () Bool)

(assert (=> b!1005021 (=> (not res!673744) (not e!566120))))

(declare-fun lt!444326 () array!63426)

(declare-fun lt!444324 () SeekEntryResult!9400)

(declare-fun lt!444325 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63426 (_ BitVec 32)) SeekEntryResult!9400)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005021 (= res!673744 (not (= lt!444324 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444325 mask!3464) lt!444325 lt!444326 mask!3464))))))

(assert (=> b!1005021 (= lt!444325 (select (store (arr!30532 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1005021 (= lt!444326 (array!63427 (store (arr!30532 a!3219) i!1194 k0!2224) (size!31035 a!3219)))))

(declare-fun res!673742 () Bool)

(assert (=> start!86806 (=> (not res!673742) (not e!566123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86806 (= res!673742 (validMask!0 mask!3464))))

(assert (=> start!86806 e!566123))

(declare-fun array_inv!23668 (array!63426) Bool)

(assert (=> start!86806 (array_inv!23668 a!3219)))

(assert (=> start!86806 true))

(declare-fun b!1005022 () Bool)

(declare-fun e!566122 () Bool)

(assert (=> b!1005022 (= e!566122 false)))

(declare-fun lt!444322 () SeekEntryResult!9400)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!444328 () (_ BitVec 32))

(assert (=> b!1005022 (= lt!444322 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444328 lt!444325 lt!444326 mask!3464))))

(declare-fun b!1005023 () Bool)

(declare-fun res!673745 () Bool)

(assert (=> b!1005023 (=> (not res!673745) (not e!566119))))

(declare-datatypes ((List!21179 0))(
  ( (Nil!21176) (Cons!21175 (h!22361 (_ BitVec 64)) (t!30172 List!21179)) )
))
(declare-fun arrayNoDuplicates!0 (array!63426 (_ BitVec 32) List!21179) Bool)

(assert (=> b!1005023 (= res!673745 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21176))))

(declare-fun b!1005024 () Bool)

(declare-fun res!673751 () Bool)

(assert (=> b!1005024 (=> (not res!673751) (not e!566122))))

(declare-fun lt!444323 () SeekEntryResult!9400)

(assert (=> b!1005024 (= res!673751 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444328 (select (arr!30532 a!3219) j!170) a!3219 mask!3464) lt!444323))))

(declare-fun b!1005025 () Bool)

(declare-fun e!566118 () Bool)

(assert (=> b!1005025 (= e!566118 e!566124)))

(declare-fun res!673736 () Bool)

(assert (=> b!1005025 (=> (not res!673736) (not e!566124))))

(declare-fun lt!444329 () SeekEntryResult!9400)

(assert (=> b!1005025 (= res!673736 (= lt!444329 lt!444323))))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1005025 (= lt!444329 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30532 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005026 () Bool)

(declare-fun res!673740 () Bool)

(assert (=> b!1005026 (=> (not res!673740) (not e!566123))))

(assert (=> b!1005026 (= res!673740 (and (= (size!31035 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31035 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31035 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005027 () Bool)

(declare-fun res!673747 () Bool)

(assert (=> b!1005027 (=> (not res!673747) (not e!566123))))

(assert (=> b!1005027 (= res!673747 (validKeyInArray!0 k0!2224))))

(declare-fun b!1005028 () Bool)

(assert (=> b!1005028 (= e!566119 e!566118)))

(declare-fun res!673746 () Bool)

(assert (=> b!1005028 (=> (not res!673746) (not e!566118))))

(assert (=> b!1005028 (= res!673746 (= lt!444324 lt!444323))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1005028 (= lt!444323 (Intermediate!9400 false resIndex!38 resX!38))))

(assert (=> b!1005028 (= lt!444324 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30532 a!3219) j!170) mask!3464) (select (arr!30532 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005029 () Bool)

(declare-fun res!673749 () Bool)

(assert (=> b!1005029 (=> (not res!673749) (not e!566120))))

(assert (=> b!1005029 (= res!673749 (not (= lt!444329 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444325 lt!444326 mask!3464))))))

(declare-fun b!1005030 () Bool)

(declare-fun res!673741 () Bool)

(assert (=> b!1005030 (=> (not res!673741) (not e!566120))))

(assert (=> b!1005030 (= res!673741 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1005031 () Bool)

(declare-fun res!673737 () Bool)

(assert (=> b!1005031 (=> (not res!673737) (not e!566119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63426 (_ BitVec 32)) Bool)

(assert (=> b!1005031 (= res!673737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1005032 () Bool)

(assert (=> b!1005032 (= e!566120 e!566122)))

(declare-fun res!673739 () Bool)

(assert (=> b!1005032 (=> (not res!673739) (not e!566122))))

(assert (=> b!1005032 (= res!673739 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!444328 #b00000000000000000000000000000000) (bvslt lt!444328 (size!31035 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005032 (= lt!444328 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1005033 () Bool)

(declare-fun res!673738 () Bool)

(assert (=> b!1005033 (=> (not res!673738) (not e!566119))))

(assert (=> b!1005033 (= res!673738 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31035 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31035 a!3219))))))

(declare-fun b!1005034 () Bool)

(declare-fun res!673743 () Bool)

(assert (=> b!1005034 (=> (not res!673743) (not e!566123))))

(declare-fun arrayContainsKey!0 (array!63426 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005034 (= res!673743 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!86806 res!673742) b!1005026))

(assert (= (and b!1005026 res!673740) b!1005019))

(assert (= (and b!1005019 res!673750) b!1005027))

(assert (= (and b!1005027 res!673747) b!1005034))

(assert (= (and b!1005034 res!673743) b!1005020))

(assert (= (and b!1005020 res!673748) b!1005031))

(assert (= (and b!1005031 res!673737) b!1005023))

(assert (= (and b!1005023 res!673745) b!1005033))

(assert (= (and b!1005033 res!673738) b!1005028))

(assert (= (and b!1005028 res!673746) b!1005025))

(assert (= (and b!1005025 res!673736) b!1005021))

(assert (= (and b!1005021 res!673744) b!1005029))

(assert (= (and b!1005029 res!673749) b!1005030))

(assert (= (and b!1005030 res!673741) b!1005032))

(assert (= (and b!1005032 res!673739) b!1005024))

(assert (= (and b!1005024 res!673751) b!1005022))

(declare-fun m!930953 () Bool)

(assert (=> b!1005031 m!930953))

(declare-fun m!930955 () Bool)

(assert (=> b!1005021 m!930955))

(assert (=> b!1005021 m!930955))

(declare-fun m!930957 () Bool)

(assert (=> b!1005021 m!930957))

(declare-fun m!930959 () Bool)

(assert (=> b!1005021 m!930959))

(declare-fun m!930961 () Bool)

(assert (=> b!1005021 m!930961))

(declare-fun m!930963 () Bool)

(assert (=> start!86806 m!930963))

(declare-fun m!930965 () Bool)

(assert (=> start!86806 m!930965))

(declare-fun m!930967 () Bool)

(assert (=> b!1005027 m!930967))

(declare-fun m!930969 () Bool)

(assert (=> b!1005024 m!930969))

(assert (=> b!1005024 m!930969))

(declare-fun m!930971 () Bool)

(assert (=> b!1005024 m!930971))

(declare-fun m!930973 () Bool)

(assert (=> b!1005022 m!930973))

(assert (=> b!1005028 m!930969))

(assert (=> b!1005028 m!930969))

(declare-fun m!930975 () Bool)

(assert (=> b!1005028 m!930975))

(assert (=> b!1005028 m!930975))

(assert (=> b!1005028 m!930969))

(declare-fun m!930977 () Bool)

(assert (=> b!1005028 m!930977))

(declare-fun m!930979 () Bool)

(assert (=> b!1005034 m!930979))

(declare-fun m!930981 () Bool)

(assert (=> b!1005032 m!930981))

(assert (=> b!1005025 m!930969))

(assert (=> b!1005025 m!930969))

(declare-fun m!930983 () Bool)

(assert (=> b!1005025 m!930983))

(declare-fun m!930985 () Bool)

(assert (=> b!1005029 m!930985))

(assert (=> b!1005019 m!930969))

(assert (=> b!1005019 m!930969))

(declare-fun m!930987 () Bool)

(assert (=> b!1005019 m!930987))

(declare-fun m!930989 () Bool)

(assert (=> b!1005023 m!930989))

(declare-fun m!930991 () Bool)

(assert (=> b!1005020 m!930991))

(check-sat (not b!1005025) (not b!1005027) (not b!1005021) (not b!1005034) (not b!1005022) (not b!1005023) (not b!1005031) (not b!1005032) (not b!1005024) (not start!86806) (not b!1005019) (not b!1005029) (not b!1005028) (not b!1005020))
(check-sat)
