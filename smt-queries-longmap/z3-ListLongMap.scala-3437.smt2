; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47730 () Bool)

(assert start!47730)

(declare-fun e!306160 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33377 0))(
  ( (array!33378 (arr!16040 (Array (_ BitVec 32) (_ BitVec 64))) (size!16405 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33377)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!525111 () Bool)

(declare-datatypes ((SeekEntryResult!4504 0))(
  ( (MissingZero!4504 (index!20228 (_ BitVec 32))) (Found!4504 (index!20229 (_ BitVec 32))) (Intermediate!4504 (undefined!5316 Bool) (index!20230 (_ BitVec 32)) (x!49216 (_ BitVec 32))) (Undefined!4504) (MissingVacant!4504 (index!20231 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33377 (_ BitVec 32)) SeekEntryResult!4504)

(assert (=> b!525111 (= e!306160 (= (seekEntryOrOpen!0 (select (arr!16040 a!3235) j!176) a!3235 mask!3524) (Found!4504 j!176)))))

(declare-fun b!525112 () Bool)

(declare-fun res!322028 () Bool)

(declare-fun e!306159 () Bool)

(assert (=> b!525112 (=> (not res!322028) (not e!306159))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525112 (= res!322028 (validKeyInArray!0 k0!2280))))

(declare-fun b!525113 () Bool)

(declare-fun e!306157 () Bool)

(assert (=> b!525113 (= e!306159 e!306157)))

(declare-fun res!322029 () Bool)

(assert (=> b!525113 (=> (not res!322029) (not e!306157))))

(declare-fun lt!241129 () SeekEntryResult!4504)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!525113 (= res!322029 (or (= lt!241129 (MissingZero!4504 i!1204)) (= lt!241129 (MissingVacant!4504 i!1204))))))

(assert (=> b!525113 (= lt!241129 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!322035 () Bool)

(assert (=> start!47730 (=> (not res!322035) (not e!306159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47730 (= res!322035 (validMask!0 mask!3524))))

(assert (=> start!47730 e!306159))

(assert (=> start!47730 true))

(declare-fun array_inv!11923 (array!33377) Bool)

(assert (=> start!47730 (array_inv!11923 a!3235)))

(declare-fun b!525114 () Bool)

(declare-fun res!322031 () Bool)

(assert (=> b!525114 (=> (not res!322031) (not e!306159))))

(assert (=> b!525114 (= res!322031 (validKeyInArray!0 (select (arr!16040 a!3235) j!176)))))

(declare-fun b!525115 () Bool)

(declare-fun e!306156 () Bool)

(assert (=> b!525115 (= e!306156 true)))

(declare-fun lt!241120 () SeekEntryResult!4504)

(assert (=> b!525115 (= (index!20230 lt!241120) i!1204)))

(declare-datatypes ((Unit!16462 0))(
  ( (Unit!16463) )
))
(declare-fun lt!241127 () Unit!16462)

(declare-fun lt!241125 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33377 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16462)

(assert (=> b!525115 (= lt!241127 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!241125 #b00000000000000000000000000000000 (index!20230 lt!241120) (x!49216 lt!241120) mask!3524))))

(assert (=> b!525115 (and (or (= (select (arr!16040 a!3235) (index!20230 lt!241120)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16040 a!3235) (index!20230 lt!241120)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16040 a!3235) (index!20230 lt!241120)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16040 a!3235) (index!20230 lt!241120)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241123 () Unit!16462)

(declare-fun e!306161 () Unit!16462)

(assert (=> b!525115 (= lt!241123 e!306161)))

(declare-fun c!61848 () Bool)

(assert (=> b!525115 (= c!61848 (= (select (arr!16040 a!3235) (index!20230 lt!241120)) (select (arr!16040 a!3235) j!176)))))

(assert (=> b!525115 (and (bvslt (x!49216 lt!241120) #b01111111111111111111111111111110) (or (= (select (arr!16040 a!3235) (index!20230 lt!241120)) (select (arr!16040 a!3235) j!176)) (= (select (arr!16040 a!3235) (index!20230 lt!241120)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16040 a!3235) (index!20230 lt!241120)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525116 () Bool)

(declare-fun res!322027 () Bool)

(assert (=> b!525116 (=> (not res!322027) (not e!306157))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33377 (_ BitVec 32)) Bool)

(assert (=> b!525116 (= res!322027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525117 () Bool)

(declare-fun res!322032 () Bool)

(assert (=> b!525117 (=> (not res!322032) (not e!306157))))

(declare-datatypes ((List!10237 0))(
  ( (Nil!10234) (Cons!10233 (h!11164 (_ BitVec 64)) (t!16456 List!10237)) )
))
(declare-fun arrayNoDuplicates!0 (array!33377 (_ BitVec 32) List!10237) Bool)

(assert (=> b!525117 (= res!322032 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10234))))

(declare-fun b!525118 () Bool)

(declare-fun res!322026 () Bool)

(assert (=> b!525118 (=> (not res!322026) (not e!306159))))

(assert (=> b!525118 (= res!322026 (and (= (size!16405 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16405 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16405 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525119 () Bool)

(assert (=> b!525119 (= e!306157 (not e!306156))))

(declare-fun res!322034 () Bool)

(assert (=> b!525119 (=> res!322034 e!306156)))

(declare-fun lt!241121 () (_ BitVec 32))

(declare-fun lt!241128 () (_ BitVec 64))

(declare-fun lt!241124 () array!33377)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33377 (_ BitVec 32)) SeekEntryResult!4504)

(assert (=> b!525119 (= res!322034 (= lt!241120 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241121 lt!241128 lt!241124 mask!3524)))))

(assert (=> b!525119 (= lt!241120 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241125 (select (arr!16040 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525119 (= lt!241121 (toIndex!0 lt!241128 mask!3524))))

(assert (=> b!525119 (= lt!241128 (select (store (arr!16040 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!525119 (= lt!241125 (toIndex!0 (select (arr!16040 a!3235) j!176) mask!3524))))

(assert (=> b!525119 (= lt!241124 (array!33378 (store (arr!16040 a!3235) i!1204 k0!2280) (size!16405 a!3235)))))

(assert (=> b!525119 e!306160))

(declare-fun res!322030 () Bool)

(assert (=> b!525119 (=> (not res!322030) (not e!306160))))

(assert (=> b!525119 (= res!322030 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241126 () Unit!16462)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33377 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16462)

(assert (=> b!525119 (= lt!241126 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!525120 () Bool)

(declare-fun Unit!16464 () Unit!16462)

(assert (=> b!525120 (= e!306161 Unit!16464)))

(declare-fun lt!241122 () Unit!16462)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33377 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16462)

(assert (=> b!525120 (= lt!241122 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!241125 #b00000000000000000000000000000000 (index!20230 lt!241120) (x!49216 lt!241120) mask!3524))))

(declare-fun res!322036 () Bool)

(assert (=> b!525120 (= res!322036 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241125 lt!241128 lt!241124 mask!3524) (Intermediate!4504 false (index!20230 lt!241120) (x!49216 lt!241120))))))

(declare-fun e!306158 () Bool)

(assert (=> b!525120 (=> (not res!322036) (not e!306158))))

(assert (=> b!525120 e!306158))

(declare-fun b!525121 () Bool)

(assert (=> b!525121 (= e!306158 false)))

(declare-fun b!525122 () Bool)

(declare-fun res!322033 () Bool)

(assert (=> b!525122 (=> res!322033 e!306156)))

(get-info :version)

(assert (=> b!525122 (= res!322033 (or (undefined!5316 lt!241120) (not ((_ is Intermediate!4504) lt!241120))))))

(declare-fun b!525123 () Bool)

(declare-fun res!322037 () Bool)

(assert (=> b!525123 (=> (not res!322037) (not e!306159))))

(declare-fun arrayContainsKey!0 (array!33377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525123 (= res!322037 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!525124 () Bool)

(declare-fun Unit!16465 () Unit!16462)

(assert (=> b!525124 (= e!306161 Unit!16465)))

(assert (= (and start!47730 res!322035) b!525118))

(assert (= (and b!525118 res!322026) b!525114))

(assert (= (and b!525114 res!322031) b!525112))

(assert (= (and b!525112 res!322028) b!525123))

(assert (= (and b!525123 res!322037) b!525113))

(assert (= (and b!525113 res!322029) b!525116))

(assert (= (and b!525116 res!322027) b!525117))

(assert (= (and b!525117 res!322032) b!525119))

(assert (= (and b!525119 res!322030) b!525111))

(assert (= (and b!525119 (not res!322034)) b!525122))

(assert (= (and b!525122 (not res!322033)) b!525115))

(assert (= (and b!525115 c!61848) b!525120))

(assert (= (and b!525115 (not c!61848)) b!525124))

(assert (= (and b!525120 res!322036) b!525121))

(declare-fun m!505285 () Bool)

(assert (=> b!525111 m!505285))

(assert (=> b!525111 m!505285))

(declare-fun m!505287 () Bool)

(assert (=> b!525111 m!505287))

(declare-fun m!505289 () Bool)

(assert (=> b!525116 m!505289))

(declare-fun m!505291 () Bool)

(assert (=> start!47730 m!505291))

(declare-fun m!505293 () Bool)

(assert (=> start!47730 m!505293))

(declare-fun m!505295 () Bool)

(assert (=> b!525120 m!505295))

(declare-fun m!505297 () Bool)

(assert (=> b!525120 m!505297))

(declare-fun m!505299 () Bool)

(assert (=> b!525112 m!505299))

(declare-fun m!505301 () Bool)

(assert (=> b!525123 m!505301))

(declare-fun m!505303 () Bool)

(assert (=> b!525119 m!505303))

(declare-fun m!505305 () Bool)

(assert (=> b!525119 m!505305))

(declare-fun m!505307 () Bool)

(assert (=> b!525119 m!505307))

(assert (=> b!525119 m!505285))

(declare-fun m!505309 () Bool)

(assert (=> b!525119 m!505309))

(assert (=> b!525119 m!505285))

(assert (=> b!525119 m!505285))

(declare-fun m!505311 () Bool)

(assert (=> b!525119 m!505311))

(declare-fun m!505313 () Bool)

(assert (=> b!525119 m!505313))

(declare-fun m!505315 () Bool)

(assert (=> b!525119 m!505315))

(declare-fun m!505317 () Bool)

(assert (=> b!525119 m!505317))

(declare-fun m!505319 () Bool)

(assert (=> b!525117 m!505319))

(assert (=> b!525114 m!505285))

(assert (=> b!525114 m!505285))

(declare-fun m!505321 () Bool)

(assert (=> b!525114 m!505321))

(declare-fun m!505323 () Bool)

(assert (=> b!525113 m!505323))

(declare-fun m!505325 () Bool)

(assert (=> b!525115 m!505325))

(declare-fun m!505327 () Bool)

(assert (=> b!525115 m!505327))

(assert (=> b!525115 m!505285))

(check-sat (not b!525111) (not b!525114) (not start!47730) (not b!525123) (not b!525112) (not b!525120) (not b!525116) (not b!525115) (not b!525119) (not b!525113) (not b!525117))
(check-sat)
