; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47214 () Bool)

(assert start!47214)

(declare-fun b!519561 () Bool)

(declare-fun res!318045 () Bool)

(declare-fun e!303147 () Bool)

(assert (=> b!519561 (=> (not res!318045) (not e!303147))))

(declare-datatypes ((array!33176 0))(
  ( (array!33177 (arr!15947 (Array (_ BitVec 32) (_ BitVec 64))) (size!16312 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33176)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!519561 (= res!318045 (validKeyInArray!0 (select (arr!15947 a!3235) j!176)))))

(declare-fun b!519562 () Bool)

(declare-fun res!318048 () Bool)

(declare-fun e!303145 () Bool)

(assert (=> b!519562 (=> (not res!318048) (not e!303145))))

(declare-datatypes ((List!10144 0))(
  ( (Nil!10141) (Cons!10140 (h!11056 (_ BitVec 64)) (t!16363 List!10144)) )
))
(declare-fun arrayNoDuplicates!0 (array!33176 (_ BitVec 32) List!10144) Bool)

(assert (=> b!519562 (= res!318048 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10141))))

(declare-fun b!519563 () Bool)

(declare-fun e!303149 () Bool)

(assert (=> b!519563 (= e!303145 (not e!303149))))

(declare-fun res!318041 () Bool)

(assert (=> b!519563 (=> res!318041 e!303149)))

(declare-fun lt!237830 () array!33176)

(declare-datatypes ((SeekEntryResult!4411 0))(
  ( (MissingZero!4411 (index!19841 (_ BitVec 32))) (Found!4411 (index!19842 (_ BitVec 32))) (Intermediate!4411 (undefined!5223 Bool) (index!19843 (_ BitVec 32)) (x!48830 (_ BitVec 32))) (Undefined!4411) (MissingVacant!4411 (index!19844 (_ BitVec 32))) )
))
(declare-fun lt!237828 () SeekEntryResult!4411)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!237824 () (_ BitVec 32))

(declare-fun lt!237832 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33176 (_ BitVec 32)) SeekEntryResult!4411)

(assert (=> b!519563 (= res!318041 (= lt!237828 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237824 lt!237832 lt!237830 mask!3524)))))

(declare-fun lt!237831 () (_ BitVec 32))

(assert (=> b!519563 (= lt!237828 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237831 (select (arr!15947 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!519563 (= lt!237824 (toIndex!0 lt!237832 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!519563 (= lt!237832 (select (store (arr!15947 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!519563 (= lt!237831 (toIndex!0 (select (arr!15947 a!3235) j!176) mask!3524))))

(assert (=> b!519563 (= lt!237830 (array!33177 (store (arr!15947 a!3235) i!1204 k0!2280) (size!16312 a!3235)))))

(declare-fun e!303144 () Bool)

(assert (=> b!519563 e!303144))

(declare-fun res!318039 () Bool)

(assert (=> b!519563 (=> (not res!318039) (not e!303144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33176 (_ BitVec 32)) Bool)

(assert (=> b!519563 (= res!318039 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16090 0))(
  ( (Unit!16091) )
))
(declare-fun lt!237827 () Unit!16090)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33176 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16090)

(assert (=> b!519563 (= lt!237827 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!519564 () Bool)

(declare-fun res!318042 () Bool)

(assert (=> b!519564 (=> (not res!318042) (not e!303147))))

(assert (=> b!519564 (= res!318042 (validKeyInArray!0 k0!2280))))

(declare-fun b!519565 () Bool)

(declare-fun e!303148 () Unit!16090)

(declare-fun Unit!16092 () Unit!16090)

(assert (=> b!519565 (= e!303148 Unit!16092)))

(declare-fun lt!237825 () Unit!16090)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33176 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16090)

(assert (=> b!519565 (= lt!237825 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!237831 #b00000000000000000000000000000000 (index!19843 lt!237828) (x!48830 lt!237828) mask!3524))))

(declare-fun res!318047 () Bool)

(assert (=> b!519565 (= res!318047 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237831 lt!237832 lt!237830 mask!3524) (Intermediate!4411 false (index!19843 lt!237828) (x!48830 lt!237828))))))

(declare-fun e!303150 () Bool)

(assert (=> b!519565 (=> (not res!318047) (not e!303150))))

(assert (=> b!519565 e!303150))

(declare-fun b!519566 () Bool)

(assert (=> b!519566 (= e!303150 false)))

(declare-fun b!519567 () Bool)

(declare-fun res!318043 () Bool)

(assert (=> b!519567 (=> (not res!318043) (not e!303147))))

(assert (=> b!519567 (= res!318043 (and (= (size!16312 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16312 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16312 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!519568 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33176 (_ BitVec 32)) SeekEntryResult!4411)

(assert (=> b!519568 (= e!303144 (= (seekEntryOrOpen!0 (select (arr!15947 a!3235) j!176) a!3235 mask!3524) (Found!4411 j!176)))))

(declare-fun b!519569 () Bool)

(assert (=> b!519569 (= e!303147 e!303145)))

(declare-fun res!318040 () Bool)

(assert (=> b!519569 (=> (not res!318040) (not e!303145))))

(declare-fun lt!237829 () SeekEntryResult!4411)

(assert (=> b!519569 (= res!318040 (or (= lt!237829 (MissingZero!4411 i!1204)) (= lt!237829 (MissingVacant!4411 i!1204))))))

(assert (=> b!519569 (= lt!237829 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!318050 () Bool)

(assert (=> start!47214 (=> (not res!318050) (not e!303147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47214 (= res!318050 (validMask!0 mask!3524))))

(assert (=> start!47214 e!303147))

(assert (=> start!47214 true))

(declare-fun array_inv!11830 (array!33176) Bool)

(assert (=> start!47214 (array_inv!11830 a!3235)))

(declare-fun b!519570 () Bool)

(declare-fun res!318046 () Bool)

(assert (=> b!519570 (=> (not res!318046) (not e!303147))))

(declare-fun arrayContainsKey!0 (array!33176 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!519570 (= res!318046 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!519571 () Bool)

(assert (=> b!519571 (= e!303149 (not (= (select (arr!15947 a!3235) (index!19843 lt!237828)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!519571 (or (= (select (arr!15947 a!3235) (index!19843 lt!237828)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15947 a!3235) (index!19843 lt!237828)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!237826 () Unit!16090)

(assert (=> b!519571 (= lt!237826 e!303148)))

(declare-fun c!61059 () Bool)

(assert (=> b!519571 (= c!61059 (= (select (arr!15947 a!3235) (index!19843 lt!237828)) (select (arr!15947 a!3235) j!176)))))

(assert (=> b!519571 (and (bvslt (x!48830 lt!237828) #b01111111111111111111111111111110) (or (= (select (arr!15947 a!3235) (index!19843 lt!237828)) (select (arr!15947 a!3235) j!176)) (= (select (arr!15947 a!3235) (index!19843 lt!237828)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15947 a!3235) (index!19843 lt!237828)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!519572 () Bool)

(declare-fun res!318044 () Bool)

(assert (=> b!519572 (=> res!318044 e!303149)))

(get-info :version)

(assert (=> b!519572 (= res!318044 (or (undefined!5223 lt!237828) (not ((_ is Intermediate!4411) lt!237828))))))

(declare-fun b!519573 () Bool)

(declare-fun res!318049 () Bool)

(assert (=> b!519573 (=> (not res!318049) (not e!303145))))

(assert (=> b!519573 (= res!318049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!519574 () Bool)

(declare-fun Unit!16093 () Unit!16090)

(assert (=> b!519574 (= e!303148 Unit!16093)))

(assert (= (and start!47214 res!318050) b!519567))

(assert (= (and b!519567 res!318043) b!519561))

(assert (= (and b!519561 res!318045) b!519564))

(assert (= (and b!519564 res!318042) b!519570))

(assert (= (and b!519570 res!318046) b!519569))

(assert (= (and b!519569 res!318040) b!519573))

(assert (= (and b!519573 res!318049) b!519562))

(assert (= (and b!519562 res!318048) b!519563))

(assert (= (and b!519563 res!318039) b!519568))

(assert (= (and b!519563 (not res!318041)) b!519572))

(assert (= (and b!519572 (not res!318044)) b!519571))

(assert (= (and b!519571 c!61059) b!519565))

(assert (= (and b!519571 (not c!61059)) b!519574))

(assert (= (and b!519565 res!318047) b!519566))

(declare-fun m!500179 () Bool)

(assert (=> b!519563 m!500179))

(declare-fun m!500181 () Bool)

(assert (=> b!519563 m!500181))

(declare-fun m!500183 () Bool)

(assert (=> b!519563 m!500183))

(declare-fun m!500185 () Bool)

(assert (=> b!519563 m!500185))

(declare-fun m!500187 () Bool)

(assert (=> b!519563 m!500187))

(declare-fun m!500189 () Bool)

(assert (=> b!519563 m!500189))

(declare-fun m!500191 () Bool)

(assert (=> b!519563 m!500191))

(assert (=> b!519563 m!500189))

(declare-fun m!500193 () Bool)

(assert (=> b!519563 m!500193))

(assert (=> b!519563 m!500189))

(declare-fun m!500195 () Bool)

(assert (=> b!519563 m!500195))

(declare-fun m!500197 () Bool)

(assert (=> b!519573 m!500197))

(declare-fun m!500199 () Bool)

(assert (=> b!519571 m!500199))

(assert (=> b!519571 m!500189))

(assert (=> b!519568 m!500189))

(assert (=> b!519568 m!500189))

(declare-fun m!500201 () Bool)

(assert (=> b!519568 m!500201))

(declare-fun m!500203 () Bool)

(assert (=> b!519569 m!500203))

(declare-fun m!500205 () Bool)

(assert (=> b!519570 m!500205))

(assert (=> b!519561 m!500189))

(assert (=> b!519561 m!500189))

(declare-fun m!500207 () Bool)

(assert (=> b!519561 m!500207))

(declare-fun m!500209 () Bool)

(assert (=> b!519562 m!500209))

(declare-fun m!500211 () Bool)

(assert (=> b!519565 m!500211))

(declare-fun m!500213 () Bool)

(assert (=> b!519565 m!500213))

(declare-fun m!500215 () Bool)

(assert (=> b!519564 m!500215))

(declare-fun m!500217 () Bool)

(assert (=> start!47214 m!500217))

(declare-fun m!500219 () Bool)

(assert (=> start!47214 m!500219))

(check-sat (not b!519565) (not b!519573) (not b!519564) (not b!519568) (not b!519562) (not start!47214) (not b!519569) (not b!519561) (not b!519570) (not b!519563))
(check-sat)
(get-model)

(declare-fun bm!31741 () Bool)

(declare-fun call!31744 () Bool)

(assert (=> bm!31741 (= call!31744 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!79971 () Bool)

(declare-fun res!318127 () Bool)

(declare-fun e!303200 () Bool)

(assert (=> d!79971 (=> res!318127 e!303200)))

(assert (=> d!79971 (= res!318127 (bvsge #b00000000000000000000000000000000 (size!16312 a!3235)))))

(assert (=> d!79971 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!303200)))

(declare-fun b!519667 () Bool)

(declare-fun e!303201 () Bool)

(declare-fun e!303199 () Bool)

(assert (=> b!519667 (= e!303201 e!303199)))

(declare-fun lt!237893 () (_ BitVec 64))

(assert (=> b!519667 (= lt!237893 (select (arr!15947 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!237895 () Unit!16090)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33176 (_ BitVec 64) (_ BitVec 32)) Unit!16090)

(assert (=> b!519667 (= lt!237895 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!237893 #b00000000000000000000000000000000))))

(assert (=> b!519667 (arrayContainsKey!0 a!3235 lt!237893 #b00000000000000000000000000000000)))

(declare-fun lt!237894 () Unit!16090)

(assert (=> b!519667 (= lt!237894 lt!237895)))

(declare-fun res!318128 () Bool)

(assert (=> b!519667 (= res!318128 (= (seekEntryOrOpen!0 (select (arr!15947 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4411 #b00000000000000000000000000000000)))))

(assert (=> b!519667 (=> (not res!318128) (not e!303199))))

(declare-fun b!519668 () Bool)

(assert (=> b!519668 (= e!303201 call!31744)))

(declare-fun b!519669 () Bool)

(assert (=> b!519669 (= e!303199 call!31744)))

(declare-fun b!519670 () Bool)

(assert (=> b!519670 (= e!303200 e!303201)))

(declare-fun c!61068 () Bool)

(assert (=> b!519670 (= c!61068 (validKeyInArray!0 (select (arr!15947 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!79971 (not res!318127)) b!519670))

(assert (= (and b!519670 c!61068) b!519667))

(assert (= (and b!519670 (not c!61068)) b!519668))

(assert (= (and b!519667 res!318128) b!519669))

(assert (= (or b!519669 b!519668) bm!31741))

(declare-fun m!500305 () Bool)

(assert (=> bm!31741 m!500305))

(declare-fun m!500307 () Bool)

(assert (=> b!519667 m!500307))

(declare-fun m!500309 () Bool)

(assert (=> b!519667 m!500309))

(declare-fun m!500311 () Bool)

(assert (=> b!519667 m!500311))

(assert (=> b!519667 m!500307))

(declare-fun m!500313 () Bool)

(assert (=> b!519667 m!500313))

(assert (=> b!519670 m!500307))

(assert (=> b!519670 m!500307))

(declare-fun m!500315 () Bool)

(assert (=> b!519670 m!500315))

(assert (=> b!519573 d!79971))

(declare-fun d!79973 () Bool)

(assert (=> d!79973 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47214 d!79973))

(declare-fun d!79975 () Bool)

(assert (=> d!79975 (= (array_inv!11830 a!3235) (bvsge (size!16312 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47214 d!79975))

(declare-fun d!79977 () Bool)

(declare-fun lt!237902 () SeekEntryResult!4411)

(assert (=> d!79977 (and (or ((_ is Undefined!4411) lt!237902) (not ((_ is Found!4411) lt!237902)) (and (bvsge (index!19842 lt!237902) #b00000000000000000000000000000000) (bvslt (index!19842 lt!237902) (size!16312 a!3235)))) (or ((_ is Undefined!4411) lt!237902) ((_ is Found!4411) lt!237902) (not ((_ is MissingZero!4411) lt!237902)) (and (bvsge (index!19841 lt!237902) #b00000000000000000000000000000000) (bvslt (index!19841 lt!237902) (size!16312 a!3235)))) (or ((_ is Undefined!4411) lt!237902) ((_ is Found!4411) lt!237902) ((_ is MissingZero!4411) lt!237902) (not ((_ is MissingVacant!4411) lt!237902)) (and (bvsge (index!19844 lt!237902) #b00000000000000000000000000000000) (bvslt (index!19844 lt!237902) (size!16312 a!3235)))) (or ((_ is Undefined!4411) lt!237902) (ite ((_ is Found!4411) lt!237902) (= (select (arr!15947 a!3235) (index!19842 lt!237902)) (select (arr!15947 a!3235) j!176)) (ite ((_ is MissingZero!4411) lt!237902) (= (select (arr!15947 a!3235) (index!19841 lt!237902)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4411) lt!237902) (= (select (arr!15947 a!3235) (index!19844 lt!237902)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!303209 () SeekEntryResult!4411)

(assert (=> d!79977 (= lt!237902 e!303209)))

(declare-fun c!61075 () Bool)

(declare-fun lt!237904 () SeekEntryResult!4411)

(assert (=> d!79977 (= c!61075 (and ((_ is Intermediate!4411) lt!237904) (undefined!5223 lt!237904)))))

(assert (=> d!79977 (= lt!237904 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15947 a!3235) j!176) mask!3524) (select (arr!15947 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79977 (validMask!0 mask!3524)))

(assert (=> d!79977 (= (seekEntryOrOpen!0 (select (arr!15947 a!3235) j!176) a!3235 mask!3524) lt!237902)))

(declare-fun b!519683 () Bool)

(declare-fun c!61077 () Bool)

(declare-fun lt!237903 () (_ BitVec 64))

(assert (=> b!519683 (= c!61077 (= lt!237903 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!303208 () SeekEntryResult!4411)

(declare-fun e!303210 () SeekEntryResult!4411)

(assert (=> b!519683 (= e!303208 e!303210)))

(declare-fun b!519684 () Bool)

(assert (=> b!519684 (= e!303209 Undefined!4411)))

(declare-fun b!519685 () Bool)

(assert (=> b!519685 (= e!303208 (Found!4411 (index!19843 lt!237904)))))

(declare-fun b!519686 () Bool)

(assert (=> b!519686 (= e!303210 (MissingZero!4411 (index!19843 lt!237904)))))

(declare-fun b!519687 () Bool)

(assert (=> b!519687 (= e!303209 e!303208)))

(assert (=> b!519687 (= lt!237903 (select (arr!15947 a!3235) (index!19843 lt!237904)))))

(declare-fun c!61076 () Bool)

(assert (=> b!519687 (= c!61076 (= lt!237903 (select (arr!15947 a!3235) j!176)))))

(declare-fun b!519688 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33176 (_ BitVec 32)) SeekEntryResult!4411)

(assert (=> b!519688 (= e!303210 (seekKeyOrZeroReturnVacant!0 (x!48830 lt!237904) (index!19843 lt!237904) (index!19843 lt!237904) (select (arr!15947 a!3235) j!176) a!3235 mask!3524))))

(assert (= (and d!79977 c!61075) b!519684))

(assert (= (and d!79977 (not c!61075)) b!519687))

(assert (= (and b!519687 c!61076) b!519685))

(assert (= (and b!519687 (not c!61076)) b!519683))

(assert (= (and b!519683 c!61077) b!519686))

(assert (= (and b!519683 (not c!61077)) b!519688))

(declare-fun m!500317 () Bool)

(assert (=> d!79977 m!500317))

(declare-fun m!500319 () Bool)

(assert (=> d!79977 m!500319))

(assert (=> d!79977 m!500193))

(assert (=> d!79977 m!500189))

(declare-fun m!500321 () Bool)

(assert (=> d!79977 m!500321))

(assert (=> d!79977 m!500217))

(declare-fun m!500323 () Bool)

(assert (=> d!79977 m!500323))

(assert (=> d!79977 m!500189))

(assert (=> d!79977 m!500193))

(declare-fun m!500325 () Bool)

(assert (=> b!519687 m!500325))

(assert (=> b!519688 m!500189))

(declare-fun m!500327 () Bool)

(assert (=> b!519688 m!500327))

(assert (=> b!519568 d!79977))

(declare-fun bm!31744 () Bool)

(declare-fun call!31747 () Bool)

(declare-fun c!61080 () Bool)

(assert (=> bm!31744 (= call!31747 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!61080 (Cons!10140 (select (arr!15947 a!3235) #b00000000000000000000000000000000) Nil!10141) Nil!10141)))))

(declare-fun b!519699 () Bool)

(declare-fun e!303222 () Bool)

(assert (=> b!519699 (= e!303222 call!31747)))

(declare-fun b!519700 () Bool)

(declare-fun e!303220 () Bool)

(declare-fun contains!2743 (List!10144 (_ BitVec 64)) Bool)

(assert (=> b!519700 (= e!303220 (contains!2743 Nil!10141 (select (arr!15947 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!519701 () Bool)

(declare-fun e!303221 () Bool)

(assert (=> b!519701 (= e!303221 e!303222)))

(assert (=> b!519701 (= c!61080 (validKeyInArray!0 (select (arr!15947 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79979 () Bool)

(declare-fun res!318137 () Bool)

(declare-fun e!303219 () Bool)

(assert (=> d!79979 (=> res!318137 e!303219)))

(assert (=> d!79979 (= res!318137 (bvsge #b00000000000000000000000000000000 (size!16312 a!3235)))))

(assert (=> d!79979 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10141) e!303219)))

(declare-fun b!519702 () Bool)

(assert (=> b!519702 (= e!303219 e!303221)))

(declare-fun res!318136 () Bool)

(assert (=> b!519702 (=> (not res!318136) (not e!303221))))

(assert (=> b!519702 (= res!318136 (not e!303220))))

(declare-fun res!318135 () Bool)

(assert (=> b!519702 (=> (not res!318135) (not e!303220))))

(assert (=> b!519702 (= res!318135 (validKeyInArray!0 (select (arr!15947 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!519703 () Bool)

(assert (=> b!519703 (= e!303222 call!31747)))

(assert (= (and d!79979 (not res!318137)) b!519702))

(assert (= (and b!519702 res!318135) b!519700))

(assert (= (and b!519702 res!318136) b!519701))

(assert (= (and b!519701 c!61080) b!519703))

(assert (= (and b!519701 (not c!61080)) b!519699))

(assert (= (or b!519703 b!519699) bm!31744))

(assert (=> bm!31744 m!500307))

(declare-fun m!500329 () Bool)

(assert (=> bm!31744 m!500329))

(assert (=> b!519700 m!500307))

(assert (=> b!519700 m!500307))

(declare-fun m!500331 () Bool)

(assert (=> b!519700 m!500331))

(assert (=> b!519701 m!500307))

(assert (=> b!519701 m!500307))

(assert (=> b!519701 m!500315))

(assert (=> b!519702 m!500307))

(assert (=> b!519702 m!500307))

(assert (=> b!519702 m!500315))

(assert (=> b!519562 d!79979))

(declare-fun d!79981 () Bool)

(assert (=> d!79981 (= (validKeyInArray!0 (select (arr!15947 a!3235) j!176)) (and (not (= (select (arr!15947 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15947 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!519561 d!79981))

(declare-fun d!79983 () Bool)

(declare-fun e!303225 () Bool)

(assert (=> d!79983 e!303225))

(declare-fun res!318140 () Bool)

(assert (=> d!79983 (=> (not res!318140) (not e!303225))))

(assert (=> d!79983 (= res!318140 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16312 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16312 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16312 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16312 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16312 a!3235))))))

(declare-fun lt!237907 () Unit!16090)

(declare-fun choose!47 (array!33176 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16090)

(assert (=> d!79983 (= lt!237907 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!237831 #b00000000000000000000000000000000 (index!19843 lt!237828) (x!48830 lt!237828) mask!3524))))

(assert (=> d!79983 (validMask!0 mask!3524)))

(assert (=> d!79983 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!237831 #b00000000000000000000000000000000 (index!19843 lt!237828) (x!48830 lt!237828) mask!3524) lt!237907)))

(declare-fun b!519706 () Bool)

(assert (=> b!519706 (= e!303225 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237831 (select (store (arr!15947 a!3235) i!1204 k0!2280) j!176) (array!33177 (store (arr!15947 a!3235) i!1204 k0!2280) (size!16312 a!3235)) mask!3524) (Intermediate!4411 false (index!19843 lt!237828) (x!48830 lt!237828))))))

(assert (= (and d!79983 res!318140) b!519706))

(declare-fun m!500333 () Bool)

(assert (=> d!79983 m!500333))

(assert (=> d!79983 m!500217))

(assert (=> b!519706 m!500181))

(assert (=> b!519706 m!500187))

(assert (=> b!519706 m!500187))

(declare-fun m!500335 () Bool)

(assert (=> b!519706 m!500335))

(assert (=> b!519565 d!79983))

(declare-fun d!79985 () Bool)

(declare-fun e!303245 () Bool)

(assert (=> d!79985 e!303245))

(declare-fun c!61090 () Bool)

(declare-fun lt!237918 () SeekEntryResult!4411)

(assert (=> d!79985 (= c!61090 (and ((_ is Intermediate!4411) lt!237918) (undefined!5223 lt!237918)))))

(declare-fun e!303244 () SeekEntryResult!4411)

(assert (=> d!79985 (= lt!237918 e!303244)))

(declare-fun c!61091 () Bool)

(assert (=> d!79985 (= c!61091 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!237919 () (_ BitVec 64))

(assert (=> d!79985 (= lt!237919 (select (arr!15947 lt!237830) lt!237831))))

(assert (=> d!79985 (validMask!0 mask!3524)))

(assert (=> d!79985 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237831 lt!237832 lt!237830 mask!3524) lt!237918)))

(declare-fun b!519733 () Bool)

(assert (=> b!519733 (and (bvsge (index!19843 lt!237918) #b00000000000000000000000000000000) (bvslt (index!19843 lt!237918) (size!16312 lt!237830)))))

(declare-fun res!318153 () Bool)

(assert (=> b!519733 (= res!318153 (= (select (arr!15947 lt!237830) (index!19843 lt!237918)) lt!237832))))

(declare-fun e!303246 () Bool)

(assert (=> b!519733 (=> res!318153 e!303246)))

(declare-fun e!303243 () Bool)

(assert (=> b!519733 (= e!303243 e!303246)))

(declare-fun b!519734 () Bool)

(declare-fun e!303242 () SeekEntryResult!4411)

(assert (=> b!519734 (= e!303242 (Intermediate!4411 false lt!237831 #b00000000000000000000000000000000))))

(declare-fun b!519735 () Bool)

(assert (=> b!519735 (= e!303244 (Intermediate!4411 true lt!237831 #b00000000000000000000000000000000))))

(declare-fun b!519736 () Bool)

(assert (=> b!519736 (and (bvsge (index!19843 lt!237918) #b00000000000000000000000000000000) (bvslt (index!19843 lt!237918) (size!16312 lt!237830)))))

(assert (=> b!519736 (= e!303246 (= (select (arr!15947 lt!237830) (index!19843 lt!237918)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!519737 () Bool)

(assert (=> b!519737 (= e!303245 (bvsge (x!48830 lt!237918) #b01111111111111111111111111111110))))

(declare-fun b!519738 () Bool)

(assert (=> b!519738 (= e!303244 e!303242)))

(declare-fun c!61089 () Bool)

(assert (=> b!519738 (= c!61089 (or (= lt!237919 lt!237832) (= (bvadd lt!237919 lt!237919) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!519739 () Bool)

(assert (=> b!519739 (and (bvsge (index!19843 lt!237918) #b00000000000000000000000000000000) (bvslt (index!19843 lt!237918) (size!16312 lt!237830)))))

(declare-fun res!318152 () Bool)

(assert (=> b!519739 (= res!318152 (= (select (arr!15947 lt!237830) (index!19843 lt!237918)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!519739 (=> res!318152 e!303246)))

(declare-fun b!519740 () Bool)

(assert (=> b!519740 (= e!303245 e!303243)))

(declare-fun res!318151 () Bool)

(assert (=> b!519740 (= res!318151 (and ((_ is Intermediate!4411) lt!237918) (not (undefined!5223 lt!237918)) (bvslt (x!48830 lt!237918) #b01111111111111111111111111111110) (bvsge (x!48830 lt!237918) #b00000000000000000000000000000000) (bvsge (x!48830 lt!237918) #b00000000000000000000000000000000)))))

(assert (=> b!519740 (=> (not res!318151) (not e!303243))))

(declare-fun b!519741 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!519741 (= e!303242 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237831 #b00000000000000000000000000000000 mask!3524) lt!237832 lt!237830 mask!3524))))

(assert (= (and d!79985 c!61091) b!519735))

(assert (= (and d!79985 (not c!61091)) b!519738))

(assert (= (and b!519738 c!61089) b!519734))

(assert (= (and b!519738 (not c!61089)) b!519741))

(assert (= (and d!79985 c!61090) b!519737))

(assert (= (and d!79985 (not c!61090)) b!519740))

(assert (= (and b!519740 res!318151) b!519733))

(assert (= (and b!519733 (not res!318153)) b!519739))

(assert (= (and b!519739 (not res!318152)) b!519736))

(declare-fun m!500337 () Bool)

(assert (=> b!519739 m!500337))

(assert (=> b!519733 m!500337))

(declare-fun m!500339 () Bool)

(assert (=> d!79985 m!500339))

(assert (=> d!79985 m!500217))

(declare-fun m!500341 () Bool)

(assert (=> b!519741 m!500341))

(assert (=> b!519741 m!500341))

(declare-fun m!500343 () Bool)

(assert (=> b!519741 m!500343))

(assert (=> b!519736 m!500337))

(assert (=> b!519565 d!79985))

(declare-fun d!79993 () Bool)

(declare-fun res!318161 () Bool)

(declare-fun e!303254 () Bool)

(assert (=> d!79993 (=> res!318161 e!303254)))

(assert (=> d!79993 (= res!318161 (= (select (arr!15947 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!79993 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!303254)))

(declare-fun b!519750 () Bool)

(declare-fun e!303255 () Bool)

(assert (=> b!519750 (= e!303254 e!303255)))

(declare-fun res!318162 () Bool)

(assert (=> b!519750 (=> (not res!318162) (not e!303255))))

(assert (=> b!519750 (= res!318162 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16312 a!3235)))))

(declare-fun b!519751 () Bool)

(assert (=> b!519751 (= e!303255 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79993 (not res!318161)) b!519750))

(assert (= (and b!519750 res!318162) b!519751))

(assert (=> d!79993 m!500307))

(declare-fun m!500357 () Bool)

(assert (=> b!519751 m!500357))

(assert (=> b!519570 d!79993))

(declare-fun d!79997 () Bool)

(declare-fun lt!237923 () SeekEntryResult!4411)

(assert (=> d!79997 (and (or ((_ is Undefined!4411) lt!237923) (not ((_ is Found!4411) lt!237923)) (and (bvsge (index!19842 lt!237923) #b00000000000000000000000000000000) (bvslt (index!19842 lt!237923) (size!16312 a!3235)))) (or ((_ is Undefined!4411) lt!237923) ((_ is Found!4411) lt!237923) (not ((_ is MissingZero!4411) lt!237923)) (and (bvsge (index!19841 lt!237923) #b00000000000000000000000000000000) (bvslt (index!19841 lt!237923) (size!16312 a!3235)))) (or ((_ is Undefined!4411) lt!237923) ((_ is Found!4411) lt!237923) ((_ is MissingZero!4411) lt!237923) (not ((_ is MissingVacant!4411) lt!237923)) (and (bvsge (index!19844 lt!237923) #b00000000000000000000000000000000) (bvslt (index!19844 lt!237923) (size!16312 a!3235)))) (or ((_ is Undefined!4411) lt!237923) (ite ((_ is Found!4411) lt!237923) (= (select (arr!15947 a!3235) (index!19842 lt!237923)) k0!2280) (ite ((_ is MissingZero!4411) lt!237923) (= (select (arr!15947 a!3235) (index!19841 lt!237923)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4411) lt!237923) (= (select (arr!15947 a!3235) (index!19844 lt!237923)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!303257 () SeekEntryResult!4411)

(assert (=> d!79997 (= lt!237923 e!303257)))

(declare-fun c!61093 () Bool)

(declare-fun lt!237925 () SeekEntryResult!4411)

(assert (=> d!79997 (= c!61093 (and ((_ is Intermediate!4411) lt!237925) (undefined!5223 lt!237925)))))

(assert (=> d!79997 (= lt!237925 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!79997 (validMask!0 mask!3524)))

(assert (=> d!79997 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!237923)))

(declare-fun b!519752 () Bool)

(declare-fun c!61095 () Bool)

(declare-fun lt!237924 () (_ BitVec 64))

(assert (=> b!519752 (= c!61095 (= lt!237924 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!303256 () SeekEntryResult!4411)

(declare-fun e!303258 () SeekEntryResult!4411)

(assert (=> b!519752 (= e!303256 e!303258)))

(declare-fun b!519753 () Bool)

(assert (=> b!519753 (= e!303257 Undefined!4411)))

(declare-fun b!519754 () Bool)

(assert (=> b!519754 (= e!303256 (Found!4411 (index!19843 lt!237925)))))

(declare-fun b!519755 () Bool)

(assert (=> b!519755 (= e!303258 (MissingZero!4411 (index!19843 lt!237925)))))

(declare-fun b!519756 () Bool)

(assert (=> b!519756 (= e!303257 e!303256)))

(assert (=> b!519756 (= lt!237924 (select (arr!15947 a!3235) (index!19843 lt!237925)))))

(declare-fun c!61094 () Bool)

(assert (=> b!519756 (= c!61094 (= lt!237924 k0!2280))))

(declare-fun b!519757 () Bool)

(assert (=> b!519757 (= e!303258 (seekKeyOrZeroReturnVacant!0 (x!48830 lt!237925) (index!19843 lt!237925) (index!19843 lt!237925) k0!2280 a!3235 mask!3524))))

(assert (= (and d!79997 c!61093) b!519753))

(assert (= (and d!79997 (not c!61093)) b!519756))

(assert (= (and b!519756 c!61094) b!519754))

(assert (= (and b!519756 (not c!61094)) b!519752))

(assert (= (and b!519752 c!61095) b!519755))

(assert (= (and b!519752 (not c!61095)) b!519757))

(declare-fun m!500359 () Bool)

(assert (=> d!79997 m!500359))

(declare-fun m!500361 () Bool)

(assert (=> d!79997 m!500361))

(declare-fun m!500363 () Bool)

(assert (=> d!79997 m!500363))

(declare-fun m!500365 () Bool)

(assert (=> d!79997 m!500365))

(assert (=> d!79997 m!500217))

(declare-fun m!500367 () Bool)

(assert (=> d!79997 m!500367))

(assert (=> d!79997 m!500363))

(declare-fun m!500369 () Bool)

(assert (=> b!519756 m!500369))

(declare-fun m!500371 () Bool)

(assert (=> b!519757 m!500371))

(assert (=> b!519569 d!79997))

(declare-fun d!79999 () Bool)

(assert (=> d!79999 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!519564 d!79999))

(declare-fun d!80001 () Bool)

(declare-fun lt!237946 () (_ BitVec 32))

(declare-fun lt!237945 () (_ BitVec 32))

(assert (=> d!80001 (= lt!237946 (bvmul (bvxor lt!237945 (bvlshr lt!237945 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80001 (= lt!237945 ((_ extract 31 0) (bvand (bvxor (select (arr!15947 a!3235) j!176) (bvlshr (select (arr!15947 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80001 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!318163 (let ((h!11060 ((_ extract 31 0) (bvand (bvxor (select (arr!15947 a!3235) j!176) (bvlshr (select (arr!15947 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48836 (bvmul (bvxor h!11060 (bvlshr h!11060 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48836 (bvlshr x!48836 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!318163 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!318163 #b00000000000000000000000000000000))))))

(assert (=> d!80001 (= (toIndex!0 (select (arr!15947 a!3235) j!176) mask!3524) (bvand (bvxor lt!237946 (bvlshr lt!237946 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!519563 d!80001))

(declare-fun d!80007 () Bool)

(declare-fun e!303271 () Bool)

(assert (=> d!80007 e!303271))

(declare-fun c!61104 () Bool)

(declare-fun lt!237947 () SeekEntryResult!4411)

(assert (=> d!80007 (= c!61104 (and ((_ is Intermediate!4411) lt!237947) (undefined!5223 lt!237947)))))

(declare-fun e!303270 () SeekEntryResult!4411)

(assert (=> d!80007 (= lt!237947 e!303270)))

(declare-fun c!61105 () Bool)

(assert (=> d!80007 (= c!61105 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!237948 () (_ BitVec 64))

(assert (=> d!80007 (= lt!237948 (select (arr!15947 a!3235) lt!237831))))

(assert (=> d!80007 (validMask!0 mask!3524)))

(assert (=> d!80007 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237831 (select (arr!15947 a!3235) j!176) a!3235 mask!3524) lt!237947)))

(declare-fun b!519774 () Bool)

(assert (=> b!519774 (and (bvsge (index!19843 lt!237947) #b00000000000000000000000000000000) (bvslt (index!19843 lt!237947) (size!16312 a!3235)))))

(declare-fun res!318168 () Bool)

(assert (=> b!519774 (= res!318168 (= (select (arr!15947 a!3235) (index!19843 lt!237947)) (select (arr!15947 a!3235) j!176)))))

(declare-fun e!303272 () Bool)

(assert (=> b!519774 (=> res!318168 e!303272)))

(declare-fun e!303269 () Bool)

(assert (=> b!519774 (= e!303269 e!303272)))

(declare-fun b!519775 () Bool)

(declare-fun e!303268 () SeekEntryResult!4411)

(assert (=> b!519775 (= e!303268 (Intermediate!4411 false lt!237831 #b00000000000000000000000000000000))))

(declare-fun b!519776 () Bool)

(assert (=> b!519776 (= e!303270 (Intermediate!4411 true lt!237831 #b00000000000000000000000000000000))))

(declare-fun b!519777 () Bool)

(assert (=> b!519777 (and (bvsge (index!19843 lt!237947) #b00000000000000000000000000000000) (bvslt (index!19843 lt!237947) (size!16312 a!3235)))))

(assert (=> b!519777 (= e!303272 (= (select (arr!15947 a!3235) (index!19843 lt!237947)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!519778 () Bool)

(assert (=> b!519778 (= e!303271 (bvsge (x!48830 lt!237947) #b01111111111111111111111111111110))))

(declare-fun b!519779 () Bool)

(assert (=> b!519779 (= e!303270 e!303268)))

(declare-fun c!61103 () Bool)

(assert (=> b!519779 (= c!61103 (or (= lt!237948 (select (arr!15947 a!3235) j!176)) (= (bvadd lt!237948 lt!237948) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!519780 () Bool)

(assert (=> b!519780 (and (bvsge (index!19843 lt!237947) #b00000000000000000000000000000000) (bvslt (index!19843 lt!237947) (size!16312 a!3235)))))

(declare-fun res!318167 () Bool)

(assert (=> b!519780 (= res!318167 (= (select (arr!15947 a!3235) (index!19843 lt!237947)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!519780 (=> res!318167 e!303272)))

(declare-fun b!519781 () Bool)

(assert (=> b!519781 (= e!303271 e!303269)))

(declare-fun res!318166 () Bool)

(assert (=> b!519781 (= res!318166 (and ((_ is Intermediate!4411) lt!237947) (not (undefined!5223 lt!237947)) (bvslt (x!48830 lt!237947) #b01111111111111111111111111111110) (bvsge (x!48830 lt!237947) #b00000000000000000000000000000000) (bvsge (x!48830 lt!237947) #b00000000000000000000000000000000)))))

(assert (=> b!519781 (=> (not res!318166) (not e!303269))))

(declare-fun b!519782 () Bool)

(assert (=> b!519782 (= e!303268 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237831 #b00000000000000000000000000000000 mask!3524) (select (arr!15947 a!3235) j!176) a!3235 mask!3524))))

(assert (= (and d!80007 c!61105) b!519776))

(assert (= (and d!80007 (not c!61105)) b!519779))

(assert (= (and b!519779 c!61103) b!519775))

(assert (= (and b!519779 (not c!61103)) b!519782))

(assert (= (and d!80007 c!61104) b!519778))

(assert (= (and d!80007 (not c!61104)) b!519781))

(assert (= (and b!519781 res!318166) b!519774))

(assert (= (and b!519774 (not res!318168)) b!519780))

(assert (= (and b!519780 (not res!318167)) b!519777))

(declare-fun m!500379 () Bool)

(assert (=> b!519780 m!500379))

(assert (=> b!519774 m!500379))

(declare-fun m!500381 () Bool)

(assert (=> d!80007 m!500381))

(assert (=> d!80007 m!500217))

(assert (=> b!519782 m!500341))

(assert (=> b!519782 m!500341))

(assert (=> b!519782 m!500189))

(declare-fun m!500383 () Bool)

(assert (=> b!519782 m!500383))

(assert (=> b!519777 m!500379))

(assert (=> b!519563 d!80007))

(declare-fun call!31752 () Bool)

(declare-fun bm!31749 () Bool)

(assert (=> bm!31749 (= call!31752 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!80009 () Bool)

(declare-fun res!318169 () Bool)

(declare-fun e!303274 () Bool)

(assert (=> d!80009 (=> res!318169 e!303274)))

(assert (=> d!80009 (= res!318169 (bvsge j!176 (size!16312 a!3235)))))

(assert (=> d!80009 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!303274)))

(declare-fun b!519783 () Bool)

(declare-fun e!303275 () Bool)

(declare-fun e!303273 () Bool)

(assert (=> b!519783 (= e!303275 e!303273)))

(declare-fun lt!237949 () (_ BitVec 64))

(assert (=> b!519783 (= lt!237949 (select (arr!15947 a!3235) j!176))))

(declare-fun lt!237951 () Unit!16090)

(assert (=> b!519783 (= lt!237951 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!237949 j!176))))

(assert (=> b!519783 (arrayContainsKey!0 a!3235 lt!237949 #b00000000000000000000000000000000)))

(declare-fun lt!237950 () Unit!16090)

(assert (=> b!519783 (= lt!237950 lt!237951)))

(declare-fun res!318170 () Bool)

(assert (=> b!519783 (= res!318170 (= (seekEntryOrOpen!0 (select (arr!15947 a!3235) j!176) a!3235 mask!3524) (Found!4411 j!176)))))

(assert (=> b!519783 (=> (not res!318170) (not e!303273))))

(declare-fun b!519784 () Bool)

(assert (=> b!519784 (= e!303275 call!31752)))

(declare-fun b!519785 () Bool)

(assert (=> b!519785 (= e!303273 call!31752)))

(declare-fun b!519786 () Bool)

(assert (=> b!519786 (= e!303274 e!303275)))

(declare-fun c!61106 () Bool)

(assert (=> b!519786 (= c!61106 (validKeyInArray!0 (select (arr!15947 a!3235) j!176)))))

(assert (= (and d!80009 (not res!318169)) b!519786))

(assert (= (and b!519786 c!61106) b!519783))

(assert (= (and b!519786 (not c!61106)) b!519784))

(assert (= (and b!519783 res!318170) b!519785))

(assert (= (or b!519785 b!519784) bm!31749))

(declare-fun m!500385 () Bool)

(assert (=> bm!31749 m!500385))

(assert (=> b!519783 m!500189))

(declare-fun m!500387 () Bool)

(assert (=> b!519783 m!500387))

(declare-fun m!500389 () Bool)

(assert (=> b!519783 m!500389))

(assert (=> b!519783 m!500189))

(assert (=> b!519783 m!500201))

(assert (=> b!519786 m!500189))

(assert (=> b!519786 m!500189))

(assert (=> b!519786 m!500207))

(assert (=> b!519563 d!80009))

(declare-fun d!80011 () Bool)

(declare-fun lt!237953 () (_ BitVec 32))

(declare-fun lt!237952 () (_ BitVec 32))

(assert (=> d!80011 (= lt!237953 (bvmul (bvxor lt!237952 (bvlshr lt!237952 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80011 (= lt!237952 ((_ extract 31 0) (bvand (bvxor lt!237832 (bvlshr lt!237832 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80011 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!318163 (let ((h!11060 ((_ extract 31 0) (bvand (bvxor lt!237832 (bvlshr lt!237832 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48836 (bvmul (bvxor h!11060 (bvlshr h!11060 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48836 (bvlshr x!48836 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!318163 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!318163 #b00000000000000000000000000000000))))))

(assert (=> d!80011 (= (toIndex!0 lt!237832 mask!3524) (bvand (bvxor lt!237953 (bvlshr lt!237953 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!519563 d!80011))

(declare-fun d!80013 () Bool)

(declare-fun e!303279 () Bool)

(assert (=> d!80013 e!303279))

(declare-fun c!61108 () Bool)

(declare-fun lt!237954 () SeekEntryResult!4411)

(assert (=> d!80013 (= c!61108 (and ((_ is Intermediate!4411) lt!237954) (undefined!5223 lt!237954)))))

(declare-fun e!303278 () SeekEntryResult!4411)

(assert (=> d!80013 (= lt!237954 e!303278)))

(declare-fun c!61109 () Bool)

(assert (=> d!80013 (= c!61109 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!237955 () (_ BitVec 64))

(assert (=> d!80013 (= lt!237955 (select (arr!15947 lt!237830) lt!237824))))

(assert (=> d!80013 (validMask!0 mask!3524)))

(assert (=> d!80013 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237824 lt!237832 lt!237830 mask!3524) lt!237954)))

(declare-fun b!519787 () Bool)

(assert (=> b!519787 (and (bvsge (index!19843 lt!237954) #b00000000000000000000000000000000) (bvslt (index!19843 lt!237954) (size!16312 lt!237830)))))

(declare-fun res!318173 () Bool)

(assert (=> b!519787 (= res!318173 (= (select (arr!15947 lt!237830) (index!19843 lt!237954)) lt!237832))))

(declare-fun e!303280 () Bool)

(assert (=> b!519787 (=> res!318173 e!303280)))

(declare-fun e!303277 () Bool)

(assert (=> b!519787 (= e!303277 e!303280)))

(declare-fun b!519788 () Bool)

(declare-fun e!303276 () SeekEntryResult!4411)

(assert (=> b!519788 (= e!303276 (Intermediate!4411 false lt!237824 #b00000000000000000000000000000000))))

(declare-fun b!519789 () Bool)

(assert (=> b!519789 (= e!303278 (Intermediate!4411 true lt!237824 #b00000000000000000000000000000000))))

(declare-fun b!519790 () Bool)

(assert (=> b!519790 (and (bvsge (index!19843 lt!237954) #b00000000000000000000000000000000) (bvslt (index!19843 lt!237954) (size!16312 lt!237830)))))

(assert (=> b!519790 (= e!303280 (= (select (arr!15947 lt!237830) (index!19843 lt!237954)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!519791 () Bool)

(assert (=> b!519791 (= e!303279 (bvsge (x!48830 lt!237954) #b01111111111111111111111111111110))))

(declare-fun b!519792 () Bool)

(assert (=> b!519792 (= e!303278 e!303276)))

(declare-fun c!61107 () Bool)

(assert (=> b!519792 (= c!61107 (or (= lt!237955 lt!237832) (= (bvadd lt!237955 lt!237955) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!519793 () Bool)

(assert (=> b!519793 (and (bvsge (index!19843 lt!237954) #b00000000000000000000000000000000) (bvslt (index!19843 lt!237954) (size!16312 lt!237830)))))

(declare-fun res!318172 () Bool)

(assert (=> b!519793 (= res!318172 (= (select (arr!15947 lt!237830) (index!19843 lt!237954)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!519793 (=> res!318172 e!303280)))

(declare-fun b!519794 () Bool)

(assert (=> b!519794 (= e!303279 e!303277)))

(declare-fun res!318171 () Bool)

(assert (=> b!519794 (= res!318171 (and ((_ is Intermediate!4411) lt!237954) (not (undefined!5223 lt!237954)) (bvslt (x!48830 lt!237954) #b01111111111111111111111111111110) (bvsge (x!48830 lt!237954) #b00000000000000000000000000000000) (bvsge (x!48830 lt!237954) #b00000000000000000000000000000000)))))

(assert (=> b!519794 (=> (not res!318171) (not e!303277))))

(declare-fun b!519795 () Bool)

(assert (=> b!519795 (= e!303276 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237824 #b00000000000000000000000000000000 mask!3524) lt!237832 lt!237830 mask!3524))))

(assert (= (and d!80013 c!61109) b!519789))

(assert (= (and d!80013 (not c!61109)) b!519792))

(assert (= (and b!519792 c!61107) b!519788))

(assert (= (and b!519792 (not c!61107)) b!519795))

(assert (= (and d!80013 c!61108) b!519791))

(assert (= (and d!80013 (not c!61108)) b!519794))

(assert (= (and b!519794 res!318171) b!519787))

(assert (= (and b!519787 (not res!318173)) b!519793))

(assert (= (and b!519793 (not res!318172)) b!519790))

(declare-fun m!500391 () Bool)

(assert (=> b!519793 m!500391))

(assert (=> b!519787 m!500391))

(declare-fun m!500393 () Bool)

(assert (=> d!80013 m!500393))

(assert (=> d!80013 m!500217))

(declare-fun m!500395 () Bool)

(assert (=> b!519795 m!500395))

(assert (=> b!519795 m!500395))

(declare-fun m!500397 () Bool)

(assert (=> b!519795 m!500397))

(assert (=> b!519790 m!500391))

(assert (=> b!519563 d!80013))

(declare-fun d!80015 () Bool)

(assert (=> d!80015 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!237961 () Unit!16090)

(declare-fun choose!38 (array!33176 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16090)

(assert (=> d!80015 (= lt!237961 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80015 (validMask!0 mask!3524)))

(assert (=> d!80015 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!237961)))

(declare-fun bs!16351 () Bool)

(assert (= bs!16351 d!80015))

(assert (=> bs!16351 m!500195))

(declare-fun m!500413 () Bool)

(assert (=> bs!16351 m!500413))

(assert (=> bs!16351 m!500217))

(assert (=> b!519563 d!80015))

(check-sat (not b!519795) (not bm!31749) (not b!519751) (not b!519702) (not d!79985) (not b!519741) (not d!80007) (not b!519700) (not b!519706) (not b!519670) (not b!519783) (not b!519688) (not b!519667) (not b!519786) (not bm!31744) (not d!79997) (not b!519757) (not b!519701) (not b!519782) (not d!80015) (not d!79977) (not d!80013) (not d!79983) (not bm!31741))
(check-sat)
