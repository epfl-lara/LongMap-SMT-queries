; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47378 () Bool)

(assert start!47378)

(declare-fun b!521055 () Bool)

(declare-fun e!304018 () Bool)

(declare-fun e!304016 () Bool)

(assert (=> b!521055 (= e!304018 (not e!304016))))

(declare-fun res!318961 () Bool)

(assert (=> b!521055 (=> res!318961 e!304016)))

(declare-datatypes ((array!33205 0))(
  ( (array!33206 (arr!15958 (Array (_ BitVec 32) (_ BitVec 64))) (size!16322 (_ BitVec 32))) )
))
(declare-fun lt!238769 () array!33205)

(declare-fun lt!238770 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4381 0))(
  ( (MissingZero!4381 (index!19727 (_ BitVec 32))) (Found!4381 (index!19728 (_ BitVec 32))) (Intermediate!4381 (undefined!5193 Bool) (index!19729 (_ BitVec 32)) (x!48860 (_ BitVec 32))) (Undefined!4381) (MissingVacant!4381 (index!19730 (_ BitVec 32))) )
))
(declare-fun lt!238764 () SeekEntryResult!4381)

(declare-fun lt!238771 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33205 (_ BitVec 32)) SeekEntryResult!4381)

(assert (=> b!521055 (= res!318961 (= lt!238764 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238771 lt!238770 lt!238769 mask!3524)))))

(declare-fun a!3235 () array!33205)

(declare-fun lt!238765 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!521055 (= lt!238764 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238765 (select (arr!15958 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521055 (= lt!238771 (toIndex!0 lt!238770 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!521055 (= lt!238770 (select (store (arr!15958 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!521055 (= lt!238765 (toIndex!0 (select (arr!15958 a!3235) j!176) mask!3524))))

(assert (=> b!521055 (= lt!238769 (array!33206 (store (arr!15958 a!3235) i!1204 k0!2280) (size!16322 a!3235)))))

(declare-fun e!304014 () Bool)

(assert (=> b!521055 e!304014))

(declare-fun res!318954 () Bool)

(assert (=> b!521055 (=> (not res!318954) (not e!304014))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33205 (_ BitVec 32)) Bool)

(assert (=> b!521055 (= res!318954 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16135 0))(
  ( (Unit!16136) )
))
(declare-fun lt!238768 () Unit!16135)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33205 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16135)

(assert (=> b!521055 (= lt!238768 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!521056 () Bool)

(declare-fun e!304015 () Unit!16135)

(declare-fun Unit!16137 () Unit!16135)

(assert (=> b!521056 (= e!304015 Unit!16137)))

(declare-fun lt!238767 () Unit!16135)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33205 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16135)

(assert (=> b!521056 (= lt!238767 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!238765 #b00000000000000000000000000000000 (index!19729 lt!238764) (x!48860 lt!238764) mask!3524))))

(declare-fun res!318957 () Bool)

(assert (=> b!521056 (= res!318957 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238765 lt!238770 lt!238769 mask!3524) (Intermediate!4381 false (index!19729 lt!238764) (x!48860 lt!238764))))))

(declare-fun e!304019 () Bool)

(assert (=> b!521056 (=> (not res!318957) (not e!304019))))

(assert (=> b!521056 e!304019))

(declare-fun b!521057 () Bool)

(declare-fun res!318963 () Bool)

(assert (=> b!521057 (=> res!318963 e!304016)))

(get-info :version)

(assert (=> b!521057 (= res!318963 (or (undefined!5193 lt!238764) (not ((_ is Intermediate!4381) lt!238764))))))

(declare-fun b!521058 () Bool)

(declare-fun res!318959 () Bool)

(assert (=> b!521058 (=> (not res!318959) (not e!304018))))

(assert (=> b!521058 (= res!318959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!521059 () Bool)

(declare-fun Unit!16138 () Unit!16135)

(assert (=> b!521059 (= e!304015 Unit!16138)))

(declare-fun b!521060 () Bool)

(assert (=> b!521060 (= e!304016 true)))

(assert (=> b!521060 (and (or (= (select (arr!15958 a!3235) (index!19729 lt!238764)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15958 a!3235) (index!19729 lt!238764)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15958 a!3235) (index!19729 lt!238764)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15958 a!3235) (index!19729 lt!238764)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!238763 () Unit!16135)

(assert (=> b!521060 (= lt!238763 e!304015)))

(declare-fun c!61352 () Bool)

(assert (=> b!521060 (= c!61352 (= (select (arr!15958 a!3235) (index!19729 lt!238764)) (select (arr!15958 a!3235) j!176)))))

(assert (=> b!521060 (and (bvslt (x!48860 lt!238764) #b01111111111111111111111111111110) (or (= (select (arr!15958 a!3235) (index!19729 lt!238764)) (select (arr!15958 a!3235) j!176)) (= (select (arr!15958 a!3235) (index!19729 lt!238764)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15958 a!3235) (index!19729 lt!238764)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521061 () Bool)

(declare-fun res!318962 () Bool)

(assert (=> b!521061 (=> (not res!318962) (not e!304018))))

(declare-datatypes ((List!10023 0))(
  ( (Nil!10020) (Cons!10019 (h!10941 (_ BitVec 64)) (t!16243 List!10023)) )
))
(declare-fun arrayNoDuplicates!0 (array!33205 (_ BitVec 32) List!10023) Bool)

(assert (=> b!521061 (= res!318962 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10020))))

(declare-fun b!521062 () Bool)

(declare-fun res!318960 () Bool)

(declare-fun e!304017 () Bool)

(assert (=> b!521062 (=> (not res!318960) (not e!304017))))

(declare-fun arrayContainsKey!0 (array!33205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521062 (= res!318960 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!521064 () Bool)

(declare-fun res!318955 () Bool)

(assert (=> b!521064 (=> (not res!318955) (not e!304017))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521064 (= res!318955 (validKeyInArray!0 (select (arr!15958 a!3235) j!176)))))

(declare-fun b!521065 () Bool)

(declare-fun res!318964 () Bool)

(assert (=> b!521065 (=> (not res!318964) (not e!304017))))

(assert (=> b!521065 (= res!318964 (validKeyInArray!0 k0!2280))))

(declare-fun b!521066 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33205 (_ BitVec 32)) SeekEntryResult!4381)

(assert (=> b!521066 (= e!304014 (= (seekEntryOrOpen!0 (select (arr!15958 a!3235) j!176) a!3235 mask!3524) (Found!4381 j!176)))))

(declare-fun b!521067 () Bool)

(assert (=> b!521067 (= e!304017 e!304018)))

(declare-fun res!318956 () Bool)

(assert (=> b!521067 (=> (not res!318956) (not e!304018))))

(declare-fun lt!238766 () SeekEntryResult!4381)

(assert (=> b!521067 (= res!318956 (or (= lt!238766 (MissingZero!4381 i!1204)) (= lt!238766 (MissingVacant!4381 i!1204))))))

(assert (=> b!521067 (= lt!238766 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!521068 () Bool)

(declare-fun res!318958 () Bool)

(assert (=> b!521068 (=> (not res!318958) (not e!304017))))

(assert (=> b!521068 (= res!318958 (and (= (size!16322 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16322 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16322 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!318953 () Bool)

(assert (=> start!47378 (=> (not res!318953) (not e!304017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47378 (= res!318953 (validMask!0 mask!3524))))

(assert (=> start!47378 e!304017))

(assert (=> start!47378 true))

(declare-fun array_inv!11817 (array!33205) Bool)

(assert (=> start!47378 (array_inv!11817 a!3235)))

(declare-fun b!521063 () Bool)

(assert (=> b!521063 (= e!304019 false)))

(assert (= (and start!47378 res!318953) b!521068))

(assert (= (and b!521068 res!318958) b!521064))

(assert (= (and b!521064 res!318955) b!521065))

(assert (= (and b!521065 res!318964) b!521062))

(assert (= (and b!521062 res!318960) b!521067))

(assert (= (and b!521067 res!318956) b!521058))

(assert (= (and b!521058 res!318959) b!521061))

(assert (= (and b!521061 res!318962) b!521055))

(assert (= (and b!521055 res!318954) b!521066))

(assert (= (and b!521055 (not res!318961)) b!521057))

(assert (= (and b!521057 (not res!318963)) b!521060))

(assert (= (and b!521060 c!61352) b!521056))

(assert (= (and b!521060 (not c!61352)) b!521059))

(assert (= (and b!521056 res!318957) b!521063))

(declare-fun m!502213 () Bool)

(assert (=> b!521056 m!502213))

(declare-fun m!502215 () Bool)

(assert (=> b!521056 m!502215))

(declare-fun m!502217 () Bool)

(assert (=> b!521066 m!502217))

(assert (=> b!521066 m!502217))

(declare-fun m!502219 () Bool)

(assert (=> b!521066 m!502219))

(declare-fun m!502221 () Bool)

(assert (=> b!521058 m!502221))

(declare-fun m!502223 () Bool)

(assert (=> b!521060 m!502223))

(assert (=> b!521060 m!502217))

(declare-fun m!502225 () Bool)

(assert (=> b!521061 m!502225))

(declare-fun m!502227 () Bool)

(assert (=> b!521062 m!502227))

(declare-fun m!502229 () Bool)

(assert (=> b!521065 m!502229))

(declare-fun m!502231 () Bool)

(assert (=> b!521067 m!502231))

(declare-fun m!502233 () Bool)

(assert (=> start!47378 m!502233))

(declare-fun m!502235 () Bool)

(assert (=> start!47378 m!502235))

(assert (=> b!521064 m!502217))

(assert (=> b!521064 m!502217))

(declare-fun m!502237 () Bool)

(assert (=> b!521064 m!502237))

(assert (=> b!521055 m!502217))

(declare-fun m!502239 () Bool)

(assert (=> b!521055 m!502239))

(declare-fun m!502241 () Bool)

(assert (=> b!521055 m!502241))

(declare-fun m!502243 () Bool)

(assert (=> b!521055 m!502243))

(declare-fun m!502245 () Bool)

(assert (=> b!521055 m!502245))

(declare-fun m!502247 () Bool)

(assert (=> b!521055 m!502247))

(assert (=> b!521055 m!502217))

(declare-fun m!502249 () Bool)

(assert (=> b!521055 m!502249))

(assert (=> b!521055 m!502217))

(declare-fun m!502251 () Bool)

(assert (=> b!521055 m!502251))

(declare-fun m!502253 () Bool)

(assert (=> b!521055 m!502253))

(check-sat (not b!521067) (not b!521066) (not b!521065) (not start!47378) (not b!521056) (not b!521061) (not b!521055) (not b!521064) (not b!521062) (not b!521058))
(check-sat)
