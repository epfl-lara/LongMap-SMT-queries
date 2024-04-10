; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47786 () Bool)

(assert start!47786)

(declare-fun b!526306 () Bool)

(declare-fun res!322956 () Bool)

(declare-fun e!306797 () Bool)

(assert (=> b!526306 (=> (not res!322956) (not e!306797))))

(declare-datatypes ((array!33423 0))(
  ( (array!33424 (arr!16063 (Array (_ BitVec 32) (_ BitVec 64))) (size!16427 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33423)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33423 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526306 (= res!322956 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!526307 () Bool)

(declare-datatypes ((Unit!16572 0))(
  ( (Unit!16573) )
))
(declare-fun e!306793 () Unit!16572)

(declare-fun Unit!16574 () Unit!16572)

(assert (=> b!526307 (= e!306793 Unit!16574)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!242021 () Unit!16572)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!242023 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4530 0))(
  ( (MissingZero!4530 (index!20332 (_ BitVec 32))) (Found!4530 (index!20333 (_ BitVec 32))) (Intermediate!4530 (undefined!5342 Bool) (index!20334 (_ BitVec 32)) (x!49303 (_ BitVec 32))) (Undefined!4530) (MissingVacant!4530 (index!20335 (_ BitVec 32))) )
))
(declare-fun lt!242020 () SeekEntryResult!4530)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33423 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16572)

(assert (=> b!526307 (= lt!242021 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!242023 #b00000000000000000000000000000000 (index!20334 lt!242020) (x!49303 lt!242020) mask!3524))))

(declare-fun lt!242017 () (_ BitVec 64))

(declare-fun res!322954 () Bool)

(declare-fun lt!242016 () array!33423)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33423 (_ BitVec 32)) SeekEntryResult!4530)

(assert (=> b!526307 (= res!322954 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242023 lt!242017 lt!242016 mask!3524) (Intermediate!4530 false (index!20334 lt!242020) (x!49303 lt!242020))))))

(declare-fun e!306796 () Bool)

(assert (=> b!526307 (=> (not res!322954) (not e!306796))))

(assert (=> b!526307 e!306796))

(declare-fun b!526308 () Bool)

(declare-fun e!306795 () Bool)

(declare-fun e!306798 () Bool)

(assert (=> b!526308 (= e!306795 (not e!306798))))

(declare-fun res!322948 () Bool)

(assert (=> b!526308 (=> res!322948 e!306798)))

(declare-fun lt!242019 () (_ BitVec 32))

(assert (=> b!526308 (= res!322948 (= lt!242020 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242019 lt!242017 lt!242016 mask!3524)))))

(assert (=> b!526308 (= lt!242020 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242023 (select (arr!16063 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526308 (= lt!242019 (toIndex!0 lt!242017 mask!3524))))

(assert (=> b!526308 (= lt!242017 (select (store (arr!16063 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!526308 (= lt!242023 (toIndex!0 (select (arr!16063 a!3235) j!176) mask!3524))))

(assert (=> b!526308 (= lt!242016 (array!33424 (store (arr!16063 a!3235) i!1204 k0!2280) (size!16427 a!3235)))))

(declare-fun e!306794 () Bool)

(assert (=> b!526308 e!306794))

(declare-fun res!322949 () Bool)

(assert (=> b!526308 (=> (not res!322949) (not e!306794))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33423 (_ BitVec 32)) Bool)

(assert (=> b!526308 (= res!322949 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!242022 () Unit!16572)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33423 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16572)

(assert (=> b!526308 (= lt!242022 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526309 () Bool)

(declare-fun Unit!16575 () Unit!16572)

(assert (=> b!526309 (= e!306793 Unit!16575)))

(declare-fun b!526310 () Bool)

(assert (=> b!526310 (= e!306798 true)))

(assert (=> b!526310 (= (index!20334 lt!242020) i!1204)))

(declare-fun lt!242014 () Unit!16572)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33423 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16572)

(assert (=> b!526310 (= lt!242014 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!242023 #b00000000000000000000000000000000 (index!20334 lt!242020) (x!49303 lt!242020) mask!3524))))

(assert (=> b!526310 (and (or (= (select (arr!16063 a!3235) (index!20334 lt!242020)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16063 a!3235) (index!20334 lt!242020)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16063 a!3235) (index!20334 lt!242020)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16063 a!3235) (index!20334 lt!242020)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242018 () Unit!16572)

(assert (=> b!526310 (= lt!242018 e!306793)))

(declare-fun c!61985 () Bool)

(assert (=> b!526310 (= c!61985 (= (select (arr!16063 a!3235) (index!20334 lt!242020)) (select (arr!16063 a!3235) j!176)))))

(assert (=> b!526310 (and (bvslt (x!49303 lt!242020) #b01111111111111111111111111111110) (or (= (select (arr!16063 a!3235) (index!20334 lt!242020)) (select (arr!16063 a!3235) j!176)) (= (select (arr!16063 a!3235) (index!20334 lt!242020)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16063 a!3235) (index!20334 lt!242020)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!526311 () Bool)

(declare-fun res!322953 () Bool)

(assert (=> b!526311 (=> (not res!322953) (not e!306797))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526311 (= res!322953 (validKeyInArray!0 (select (arr!16063 a!3235) j!176)))))

(declare-fun b!526312 () Bool)

(declare-fun res!322955 () Bool)

(assert (=> b!526312 (=> (not res!322955) (not e!306795))))

(assert (=> b!526312 (= res!322955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!526313 () Bool)

(declare-fun res!322947 () Bool)

(assert (=> b!526313 (=> (not res!322947) (not e!306797))))

(assert (=> b!526313 (= res!322947 (validKeyInArray!0 k0!2280))))

(declare-fun res!322957 () Bool)

(assert (=> start!47786 (=> (not res!322957) (not e!306797))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47786 (= res!322957 (validMask!0 mask!3524))))

(assert (=> start!47786 e!306797))

(assert (=> start!47786 true))

(declare-fun array_inv!11859 (array!33423) Bool)

(assert (=> start!47786 (array_inv!11859 a!3235)))

(declare-fun b!526314 () Bool)

(declare-fun res!322958 () Bool)

(assert (=> b!526314 (=> (not res!322958) (not e!306797))))

(assert (=> b!526314 (= res!322958 (and (= (size!16427 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16427 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16427 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!526315 () Bool)

(assert (=> b!526315 (= e!306796 false)))

(declare-fun b!526316 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33423 (_ BitVec 32)) SeekEntryResult!4530)

(assert (=> b!526316 (= e!306794 (= (seekEntryOrOpen!0 (select (arr!16063 a!3235) j!176) a!3235 mask!3524) (Found!4530 j!176)))))

(declare-fun b!526317 () Bool)

(declare-fun res!322952 () Bool)

(assert (=> b!526317 (=> (not res!322952) (not e!306795))))

(declare-datatypes ((List!10221 0))(
  ( (Nil!10218) (Cons!10217 (h!11148 (_ BitVec 64)) (t!16449 List!10221)) )
))
(declare-fun arrayNoDuplicates!0 (array!33423 (_ BitVec 32) List!10221) Bool)

(assert (=> b!526317 (= res!322952 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10218))))

(declare-fun b!526318 () Bool)

(assert (=> b!526318 (= e!306797 e!306795)))

(declare-fun res!322951 () Bool)

(assert (=> b!526318 (=> (not res!322951) (not e!306795))))

(declare-fun lt!242015 () SeekEntryResult!4530)

(assert (=> b!526318 (= res!322951 (or (= lt!242015 (MissingZero!4530 i!1204)) (= lt!242015 (MissingVacant!4530 i!1204))))))

(assert (=> b!526318 (= lt!242015 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!526319 () Bool)

(declare-fun res!322950 () Bool)

(assert (=> b!526319 (=> res!322950 e!306798)))

(get-info :version)

(assert (=> b!526319 (= res!322950 (or (undefined!5342 lt!242020) (not ((_ is Intermediate!4530) lt!242020))))))

(assert (= (and start!47786 res!322957) b!526314))

(assert (= (and b!526314 res!322958) b!526311))

(assert (= (and b!526311 res!322953) b!526313))

(assert (= (and b!526313 res!322947) b!526306))

(assert (= (and b!526306 res!322956) b!526318))

(assert (= (and b!526318 res!322951) b!526312))

(assert (= (and b!526312 res!322955) b!526317))

(assert (= (and b!526317 res!322952) b!526308))

(assert (= (and b!526308 res!322949) b!526316))

(assert (= (and b!526308 (not res!322948)) b!526319))

(assert (= (and b!526319 (not res!322950)) b!526310))

(assert (= (and b!526310 c!61985) b!526307))

(assert (= (and b!526310 (not c!61985)) b!526309))

(assert (= (and b!526307 res!322954) b!526315))

(declare-fun m!507005 () Bool)

(assert (=> b!526307 m!507005))

(declare-fun m!507007 () Bool)

(assert (=> b!526307 m!507007))

(declare-fun m!507009 () Bool)

(assert (=> b!526316 m!507009))

(assert (=> b!526316 m!507009))

(declare-fun m!507011 () Bool)

(assert (=> b!526316 m!507011))

(assert (=> b!526311 m!507009))

(assert (=> b!526311 m!507009))

(declare-fun m!507013 () Bool)

(assert (=> b!526311 m!507013))

(declare-fun m!507015 () Bool)

(assert (=> b!526310 m!507015))

(declare-fun m!507017 () Bool)

(assert (=> b!526310 m!507017))

(assert (=> b!526310 m!507009))

(declare-fun m!507019 () Bool)

(assert (=> b!526312 m!507019))

(declare-fun m!507021 () Bool)

(assert (=> b!526313 m!507021))

(declare-fun m!507023 () Bool)

(assert (=> b!526317 m!507023))

(declare-fun m!507025 () Bool)

(assert (=> b!526306 m!507025))

(declare-fun m!507027 () Bool)

(assert (=> b!526318 m!507027))

(declare-fun m!507029 () Bool)

(assert (=> b!526308 m!507029))

(declare-fun m!507031 () Bool)

(assert (=> b!526308 m!507031))

(declare-fun m!507033 () Bool)

(assert (=> b!526308 m!507033))

(declare-fun m!507035 () Bool)

(assert (=> b!526308 m!507035))

(assert (=> b!526308 m!507009))

(declare-fun m!507037 () Bool)

(assert (=> b!526308 m!507037))

(assert (=> b!526308 m!507009))

(declare-fun m!507039 () Bool)

(assert (=> b!526308 m!507039))

(declare-fun m!507041 () Bool)

(assert (=> b!526308 m!507041))

(declare-fun m!507043 () Bool)

(assert (=> b!526308 m!507043))

(assert (=> b!526308 m!507009))

(declare-fun m!507045 () Bool)

(assert (=> start!47786 m!507045))

(declare-fun m!507047 () Bool)

(assert (=> start!47786 m!507047))

(check-sat (not start!47786) (not b!526313) (not b!526306) (not b!526316) (not b!526318) (not b!526307) (not b!526308) (not b!526312) (not b!526317) (not b!526310) (not b!526311))
(check-sat)
