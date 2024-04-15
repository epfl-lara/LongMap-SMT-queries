; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47676 () Bool)

(assert start!47676)

(declare-fun b!523968 () Bool)

(declare-datatypes ((Unit!16354 0))(
  ( (Unit!16355) )
))
(declare-fun e!305580 () Unit!16354)

(declare-fun Unit!16356 () Unit!16354)

(assert (=> b!523968 (= e!305580 Unit!16356)))

(declare-fun b!523969 () Bool)

(declare-fun res!321051 () Bool)

(declare-fun e!305582 () Bool)

(assert (=> b!523969 (=> (not res!321051) (not e!305582))))

(declare-datatypes ((array!33323 0))(
  ( (array!33324 (arr!16013 (Array (_ BitVec 32) (_ BitVec 64))) (size!16378 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33323)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33323 (_ BitVec 32)) Bool)

(assert (=> b!523969 (= res!321051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!523970 () Bool)

(declare-fun res!321053 () Bool)

(declare-fun e!305581 () Bool)

(assert (=> b!523970 (=> (not res!321053) (not e!305581))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!523970 (= res!321053 (and (= (size!16378 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16378 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16378 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!523971 () Bool)

(declare-fun res!321049 () Bool)

(assert (=> b!523971 (=> (not res!321049) (not e!305582))))

(declare-datatypes ((List!10210 0))(
  ( (Nil!10207) (Cons!10206 (h!11137 (_ BitVec 64)) (t!16429 List!10210)) )
))
(declare-fun arrayNoDuplicates!0 (array!33323 (_ BitVec 32) List!10210) Bool)

(assert (=> b!523971 (= res!321049 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10207))))

(declare-fun b!523972 () Bool)

(declare-fun e!305586 () Bool)

(assert (=> b!523972 (= e!305582 (not e!305586))))

(declare-fun res!321045 () Bool)

(assert (=> b!523972 (=> res!321045 e!305586)))

(declare-datatypes ((SeekEntryResult!4477 0))(
  ( (MissingZero!4477 (index!20120 (_ BitVec 32))) (Found!4477 (index!20121 (_ BitVec 32))) (Intermediate!4477 (undefined!5289 Bool) (index!20122 (_ BitVec 32)) (x!49117 (_ BitVec 32))) (Undefined!4477) (MissingVacant!4477 (index!20123 (_ BitVec 32))) )
))
(declare-fun lt!240334 () SeekEntryResult!4477)

(declare-fun lt!240332 () (_ BitVec 32))

(declare-fun lt!240331 () (_ BitVec 64))

(declare-fun lt!240333 () array!33323)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33323 (_ BitVec 32)) SeekEntryResult!4477)

(assert (=> b!523972 (= res!321045 (= lt!240334 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240332 lt!240331 lt!240333 mask!3524)))))

(declare-fun lt!240329 () (_ BitVec 32))

(assert (=> b!523972 (= lt!240334 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240329 (select (arr!16013 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!523972 (= lt!240332 (toIndex!0 lt!240331 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!523972 (= lt!240331 (select (store (arr!16013 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!523972 (= lt!240329 (toIndex!0 (select (arr!16013 a!3235) j!176) mask!3524))))

(assert (=> b!523972 (= lt!240333 (array!33324 (store (arr!16013 a!3235) i!1204 k0!2280) (size!16378 a!3235)))))

(declare-fun e!305583 () Bool)

(assert (=> b!523972 e!305583))

(declare-fun res!321050 () Bool)

(assert (=> b!523972 (=> (not res!321050) (not e!305583))))

(assert (=> b!523972 (= res!321050 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240328 () Unit!16354)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33323 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16354)

(assert (=> b!523972 (= lt!240328 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!523973 () Bool)

(assert (=> b!523973 (= e!305581 e!305582)))

(declare-fun res!321052 () Bool)

(assert (=> b!523973 (=> (not res!321052) (not e!305582))))

(declare-fun lt!240327 () SeekEntryResult!4477)

(assert (=> b!523973 (= res!321052 (or (= lt!240327 (MissingZero!4477 i!1204)) (= lt!240327 (MissingVacant!4477 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33323 (_ BitVec 32)) SeekEntryResult!4477)

(assert (=> b!523973 (= lt!240327 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!523974 () Bool)

(declare-fun Unit!16357 () Unit!16354)

(assert (=> b!523974 (= e!305580 Unit!16357)))

(declare-fun lt!240330 () Unit!16354)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33323 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16354)

(assert (=> b!523974 (= lt!240330 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!240329 #b00000000000000000000000000000000 (index!20122 lt!240334) (x!49117 lt!240334) mask!3524))))

(declare-fun res!321046 () Bool)

(assert (=> b!523974 (= res!321046 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240329 lt!240331 lt!240333 mask!3524) (Intermediate!4477 false (index!20122 lt!240334) (x!49117 lt!240334))))))

(declare-fun e!305584 () Bool)

(assert (=> b!523974 (=> (not res!321046) (not e!305584))))

(assert (=> b!523974 e!305584))

(declare-fun b!523975 () Bool)

(declare-fun res!321054 () Bool)

(assert (=> b!523975 (=> res!321054 e!305586)))

(get-info :version)

(assert (=> b!523975 (= res!321054 (or (undefined!5289 lt!240334) (not ((_ is Intermediate!4477) lt!240334))))))

(declare-fun b!523976 () Bool)

(assert (=> b!523976 (= e!305584 false)))

(declare-fun b!523977 () Bool)

(assert (=> b!523977 (= e!305586 (or (bvsgt #b00000000000000000000000000000000 (x!49117 lt!240334)) (bvsgt (x!49117 lt!240334) #b01111111111111111111111111111110) (bvslt lt!240329 #b00000000000000000000000000000000) (bvsge lt!240329 (size!16378 a!3235)) (bvslt (index!20122 lt!240334) #b00000000000000000000000000000000) (bvsge (index!20122 lt!240334) (size!16378 a!3235)) (= lt!240334 (Intermediate!4477 false (index!20122 lt!240334) (x!49117 lt!240334)))))))

(assert (=> b!523977 (and (or (= (select (arr!16013 a!3235) (index!20122 lt!240334)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16013 a!3235) (index!20122 lt!240334)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16013 a!3235) (index!20122 lt!240334)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16013 a!3235) (index!20122 lt!240334)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240326 () Unit!16354)

(assert (=> b!523977 (= lt!240326 e!305580)))

(declare-fun c!61767 () Bool)

(assert (=> b!523977 (= c!61767 (= (select (arr!16013 a!3235) (index!20122 lt!240334)) (select (arr!16013 a!3235) j!176)))))

(assert (=> b!523977 (and (bvslt (x!49117 lt!240334) #b01111111111111111111111111111110) (or (= (select (arr!16013 a!3235) (index!20122 lt!240334)) (select (arr!16013 a!3235) j!176)) (= (select (arr!16013 a!3235) (index!20122 lt!240334)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16013 a!3235) (index!20122 lt!240334)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523978 () Bool)

(declare-fun res!321055 () Bool)

(assert (=> b!523978 (=> (not res!321055) (not e!305581))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!523978 (= res!321055 (validKeyInArray!0 k0!2280))))

(declare-fun res!321048 () Bool)

(assert (=> start!47676 (=> (not res!321048) (not e!305581))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47676 (= res!321048 (validMask!0 mask!3524))))

(assert (=> start!47676 e!305581))

(assert (=> start!47676 true))

(declare-fun array_inv!11896 (array!33323) Bool)

(assert (=> start!47676 (array_inv!11896 a!3235)))

(declare-fun b!523979 () Bool)

(declare-fun res!321056 () Bool)

(assert (=> b!523979 (=> (not res!321056) (not e!305581))))

(declare-fun arrayContainsKey!0 (array!33323 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!523979 (= res!321056 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!523980 () Bool)

(assert (=> b!523980 (= e!305583 (= (seekEntryOrOpen!0 (select (arr!16013 a!3235) j!176) a!3235 mask!3524) (Found!4477 j!176)))))

(declare-fun b!523981 () Bool)

(declare-fun res!321047 () Bool)

(assert (=> b!523981 (=> (not res!321047) (not e!305581))))

(assert (=> b!523981 (= res!321047 (validKeyInArray!0 (select (arr!16013 a!3235) j!176)))))

(assert (= (and start!47676 res!321048) b!523970))

(assert (= (and b!523970 res!321053) b!523981))

(assert (= (and b!523981 res!321047) b!523978))

(assert (= (and b!523978 res!321055) b!523979))

(assert (= (and b!523979 res!321056) b!523973))

(assert (= (and b!523973 res!321052) b!523969))

(assert (= (and b!523969 res!321051) b!523971))

(assert (= (and b!523971 res!321049) b!523972))

(assert (= (and b!523972 res!321050) b!523980))

(assert (= (and b!523972 (not res!321045)) b!523975))

(assert (= (and b!523975 (not res!321054)) b!523977))

(assert (= (and b!523977 c!61767) b!523974))

(assert (= (and b!523977 (not c!61767)) b!523968))

(assert (= (and b!523974 res!321046) b!523976))

(declare-fun m!504121 () Bool)

(assert (=> b!523969 m!504121))

(declare-fun m!504123 () Bool)

(assert (=> b!523980 m!504123))

(assert (=> b!523980 m!504123))

(declare-fun m!504125 () Bool)

(assert (=> b!523980 m!504125))

(declare-fun m!504127 () Bool)

(assert (=> start!47676 m!504127))

(declare-fun m!504129 () Bool)

(assert (=> start!47676 m!504129))

(assert (=> b!523981 m!504123))

(assert (=> b!523981 m!504123))

(declare-fun m!504131 () Bool)

(assert (=> b!523981 m!504131))

(declare-fun m!504133 () Bool)

(assert (=> b!523971 m!504133))

(declare-fun m!504135 () Bool)

(assert (=> b!523972 m!504135))

(assert (=> b!523972 m!504123))

(declare-fun m!504137 () Bool)

(assert (=> b!523972 m!504137))

(declare-fun m!504139 () Bool)

(assert (=> b!523972 m!504139))

(declare-fun m!504141 () Bool)

(assert (=> b!523972 m!504141))

(assert (=> b!523972 m!504123))

(declare-fun m!504143 () Bool)

(assert (=> b!523972 m!504143))

(assert (=> b!523972 m!504123))

(declare-fun m!504145 () Bool)

(assert (=> b!523972 m!504145))

(declare-fun m!504147 () Bool)

(assert (=> b!523972 m!504147))

(declare-fun m!504149 () Bool)

(assert (=> b!523972 m!504149))

(declare-fun m!504151 () Bool)

(assert (=> b!523979 m!504151))

(declare-fun m!504153 () Bool)

(assert (=> b!523974 m!504153))

(declare-fun m!504155 () Bool)

(assert (=> b!523974 m!504155))

(declare-fun m!504157 () Bool)

(assert (=> b!523978 m!504157))

(declare-fun m!504159 () Bool)

(assert (=> b!523973 m!504159))

(declare-fun m!504161 () Bool)

(assert (=> b!523977 m!504161))

(assert (=> b!523977 m!504123))

(check-sat (not b!523978) (not b!523971) (not b!523969) (not b!523973) (not start!47676) (not b!523972) (not b!523979) (not b!523980) (not b!523974) (not b!523981))
(check-sat)
