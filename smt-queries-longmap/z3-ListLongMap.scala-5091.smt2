; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69084 () Bool)

(assert start!69084)

(declare-fun b!805821 () Bool)

(declare-fun res!550286 () Bool)

(declare-fun e!446223 () Bool)

(assert (=> b!805821 (=> (not res!550286) (not e!446223))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43846 0))(
  ( (array!43847 (arr!21002 (Array (_ BitVec 32) (_ BitVec 64))) (size!21423 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43846)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!805821 (= res!550286 (and (= (size!21423 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21423 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21423 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805822 () Bool)

(declare-fun res!550285 () Bool)

(declare-fun e!446224 () Bool)

(assert (=> b!805822 (=> (not res!550285) (not e!446224))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!805822 (= res!550285 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21423 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21002 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21423 a!3170)) (= (select (arr!21002 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!805823 () Bool)

(declare-fun e!446225 () Bool)

(declare-fun e!446226 () Bool)

(assert (=> b!805823 (= e!446225 e!446226)))

(declare-fun res!550290 () Bool)

(assert (=> b!805823 (=> (not res!550290) (not e!446226))))

(declare-datatypes ((SeekEntryResult!8590 0))(
  ( (MissingZero!8590 (index!36728 (_ BitVec 32))) (Found!8590 (index!36729 (_ BitVec 32))) (Intermediate!8590 (undefined!9402 Bool) (index!36730 (_ BitVec 32)) (x!67554 (_ BitVec 32))) (Undefined!8590) (MissingVacant!8590 (index!36731 (_ BitVec 32))) )
))
(declare-fun lt!360736 () SeekEntryResult!8590)

(declare-fun lt!360735 () SeekEntryResult!8590)

(assert (=> b!805823 (= res!550290 (= lt!360736 lt!360735))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43846 (_ BitVec 32)) SeekEntryResult!8590)

(assert (=> b!805823 (= lt!360735 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21002 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43846 (_ BitVec 32)) SeekEntryResult!8590)

(assert (=> b!805823 (= lt!360736 (seekEntryOrOpen!0 (select (arr!21002 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!805824 () Bool)

(declare-fun res!550283 () Bool)

(assert (=> b!805824 (=> (not res!550283) (not e!446224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43846 (_ BitVec 32)) Bool)

(assert (=> b!805824 (= res!550283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805825 () Bool)

(declare-fun res!550282 () Bool)

(assert (=> b!805825 (=> (not res!550282) (not e!446223))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805825 (= res!550282 (validKeyInArray!0 k0!2044))))

(declare-fun b!805826 () Bool)

(declare-fun e!446222 () Bool)

(declare-fun lt!360730 () SeekEntryResult!8590)

(declare-fun lt!360737 () SeekEntryResult!8590)

(assert (=> b!805826 (= e!446222 (not (= lt!360730 lt!360737)))))

(assert (=> b!805826 (= lt!360730 (Found!8590 index!1236))))

(declare-fun b!805827 () Bool)

(assert (=> b!805827 (= e!446226 e!446222)))

(declare-fun res!550293 () Bool)

(assert (=> b!805827 (=> (not res!550293) (not e!446222))))

(assert (=> b!805827 (= res!550293 (and (= lt!360735 lt!360737) (= (select (arr!21002 a!3170) index!1236) (select (arr!21002 a!3170) j!153))))))

(assert (=> b!805827 (= lt!360737 (Found!8590 j!153))))

(declare-fun b!805828 () Bool)

(declare-fun res!550291 () Bool)

(assert (=> b!805828 (=> (not res!550291) (not e!446223))))

(assert (=> b!805828 (= res!550291 (validKeyInArray!0 (select (arr!21002 a!3170) j!153)))))

(declare-fun b!805829 () Bool)

(assert (=> b!805829 (= e!446223 e!446224)))

(declare-fun res!550284 () Bool)

(assert (=> b!805829 (=> (not res!550284) (not e!446224))))

(declare-fun lt!360733 () SeekEntryResult!8590)

(assert (=> b!805829 (= res!550284 (or (= lt!360733 (MissingZero!8590 i!1163)) (= lt!360733 (MissingVacant!8590 i!1163))))))

(assert (=> b!805829 (= lt!360733 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!550289 () Bool)

(assert (=> start!69084 (=> (not res!550289) (not e!446223))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69084 (= res!550289 (validMask!0 mask!3266))))

(assert (=> start!69084 e!446223))

(assert (=> start!69084 true))

(declare-fun array_inv!16885 (array!43846) Bool)

(assert (=> start!69084 (array_inv!16885 a!3170)))

(declare-fun b!805830 () Bool)

(declare-fun res!550288 () Bool)

(assert (=> b!805830 (=> (not res!550288) (not e!446223))))

(declare-fun arrayContainsKey!0 (array!43846 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805830 (= res!550288 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!805831 () Bool)

(declare-fun res!550292 () Bool)

(assert (=> b!805831 (=> (not res!550292) (not e!446224))))

(declare-datatypes ((List!15004 0))(
  ( (Nil!15001) (Cons!15000 (h!16129 (_ BitVec 64)) (t!21310 List!15004)) )
))
(declare-fun arrayNoDuplicates!0 (array!43846 (_ BitVec 32) List!15004) Bool)

(assert (=> b!805831 (= res!550292 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15001))))

(declare-fun b!805832 () Bool)

(assert (=> b!805832 (= e!446224 e!446225)))

(declare-fun res!550287 () Bool)

(assert (=> b!805832 (=> (not res!550287) (not e!446225))))

(declare-fun lt!360734 () SeekEntryResult!8590)

(assert (=> b!805832 (= res!550287 (= lt!360734 lt!360730))))

(declare-fun lt!360732 () (_ BitVec 64))

(declare-fun lt!360731 () array!43846)

(assert (=> b!805832 (= lt!360730 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360732 lt!360731 mask!3266))))

(assert (=> b!805832 (= lt!360734 (seekEntryOrOpen!0 lt!360732 lt!360731 mask!3266))))

(assert (=> b!805832 (= lt!360732 (select (store (arr!21002 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!805832 (= lt!360731 (array!43847 (store (arr!21002 a!3170) i!1163 k0!2044) (size!21423 a!3170)))))

(assert (= (and start!69084 res!550289) b!805821))

(assert (= (and b!805821 res!550286) b!805828))

(assert (= (and b!805828 res!550291) b!805825))

(assert (= (and b!805825 res!550282) b!805830))

(assert (= (and b!805830 res!550288) b!805829))

(assert (= (and b!805829 res!550284) b!805824))

(assert (= (and b!805824 res!550283) b!805831))

(assert (= (and b!805831 res!550292) b!805822))

(assert (= (and b!805822 res!550285) b!805832))

(assert (= (and b!805832 res!550287) b!805823))

(assert (= (and b!805823 res!550290) b!805827))

(assert (= (and b!805827 res!550293) b!805826))

(declare-fun m!747283 () Bool)

(assert (=> b!805831 m!747283))

(declare-fun m!747285 () Bool)

(assert (=> b!805827 m!747285))

(declare-fun m!747287 () Bool)

(assert (=> b!805827 m!747287))

(declare-fun m!747289 () Bool)

(assert (=> start!69084 m!747289))

(declare-fun m!747291 () Bool)

(assert (=> start!69084 m!747291))

(declare-fun m!747293 () Bool)

(assert (=> b!805830 m!747293))

(declare-fun m!747295 () Bool)

(assert (=> b!805824 m!747295))

(declare-fun m!747297 () Bool)

(assert (=> b!805822 m!747297))

(declare-fun m!747299 () Bool)

(assert (=> b!805822 m!747299))

(declare-fun m!747301 () Bool)

(assert (=> b!805825 m!747301))

(assert (=> b!805828 m!747287))

(assert (=> b!805828 m!747287))

(declare-fun m!747303 () Bool)

(assert (=> b!805828 m!747303))

(declare-fun m!747305 () Bool)

(assert (=> b!805829 m!747305))

(assert (=> b!805823 m!747287))

(assert (=> b!805823 m!747287))

(declare-fun m!747307 () Bool)

(assert (=> b!805823 m!747307))

(assert (=> b!805823 m!747287))

(declare-fun m!747309 () Bool)

(assert (=> b!805823 m!747309))

(declare-fun m!747311 () Bool)

(assert (=> b!805832 m!747311))

(declare-fun m!747313 () Bool)

(assert (=> b!805832 m!747313))

(declare-fun m!747315 () Bool)

(assert (=> b!805832 m!747315))

(declare-fun m!747317 () Bool)

(assert (=> b!805832 m!747317))

(check-sat (not b!805830) (not b!805824) (not b!805831) (not b!805828) (not b!805823) (not b!805825) (not b!805829) (not b!805832) (not start!69084))
(check-sat)
(get-model)

(declare-fun d!103437 () Bool)

(assert (=> d!103437 (= (validKeyInArray!0 k0!2044) (and (not (= k0!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!805825 d!103437))

(declare-fun b!805915 () Bool)

(declare-fun e!446273 () Bool)

(declare-fun e!446272 () Bool)

(assert (=> b!805915 (= e!446273 e!446272)))

(declare-fun res!550373 () Bool)

(assert (=> b!805915 (=> (not res!550373) (not e!446272))))

(declare-fun e!446274 () Bool)

(assert (=> b!805915 (= res!550373 (not e!446274))))

(declare-fun res!550372 () Bool)

(assert (=> b!805915 (=> (not res!550372) (not e!446274))))

(assert (=> b!805915 (= res!550372 (validKeyInArray!0 (select (arr!21002 a!3170) #b00000000000000000000000000000000)))))

(declare-fun d!103439 () Bool)

(declare-fun res!550374 () Bool)

(assert (=> d!103439 (=> res!550374 e!446273)))

(assert (=> d!103439 (= res!550374 (bvsge #b00000000000000000000000000000000 (size!21423 a!3170)))))

(assert (=> d!103439 (= (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15001) e!446273)))

(declare-fun b!805916 () Bool)

(declare-fun e!446275 () Bool)

(declare-fun call!35341 () Bool)

(assert (=> b!805916 (= e!446275 call!35341)))

(declare-fun bm!35338 () Bool)

(declare-fun c!88182 () Bool)

(assert (=> bm!35338 (= call!35341 (arrayNoDuplicates!0 a!3170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88182 (Cons!15000 (select (arr!21002 a!3170) #b00000000000000000000000000000000) Nil!15001) Nil!15001)))))

(declare-fun b!805917 () Bool)

(assert (=> b!805917 (= e!446275 call!35341)))

(declare-fun b!805918 () Bool)

(assert (=> b!805918 (= e!446272 e!446275)))

(assert (=> b!805918 (= c!88182 (validKeyInArray!0 (select (arr!21002 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!805919 () Bool)

(declare-fun contains!4102 (List!15004 (_ BitVec 64)) Bool)

(assert (=> b!805919 (= e!446274 (contains!4102 Nil!15001 (select (arr!21002 a!3170) #b00000000000000000000000000000000)))))

(assert (= (and d!103439 (not res!550374)) b!805915))

(assert (= (and b!805915 res!550372) b!805919))

(assert (= (and b!805915 res!550373) b!805918))

(assert (= (and b!805918 c!88182) b!805916))

(assert (= (and b!805918 (not c!88182)) b!805917))

(assert (= (or b!805916 b!805917) bm!35338))

(declare-fun m!747391 () Bool)

(assert (=> b!805915 m!747391))

(assert (=> b!805915 m!747391))

(declare-fun m!747393 () Bool)

(assert (=> b!805915 m!747393))

(assert (=> bm!35338 m!747391))

(declare-fun m!747395 () Bool)

(assert (=> bm!35338 m!747395))

(assert (=> b!805918 m!747391))

(assert (=> b!805918 m!747391))

(assert (=> b!805918 m!747393))

(assert (=> b!805919 m!747391))

(assert (=> b!805919 m!747391))

(declare-fun m!747397 () Bool)

(assert (=> b!805919 m!747397))

(assert (=> b!805831 d!103439))

(declare-fun bm!35341 () Bool)

(declare-fun call!35344 () Bool)

(assert (=> bm!35341 (= call!35344 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun b!805928 () Bool)

(declare-fun e!446284 () Bool)

(declare-fun e!446282 () Bool)

(assert (=> b!805928 (= e!446284 e!446282)))

(declare-fun lt!360794 () (_ BitVec 64))

(assert (=> b!805928 (= lt!360794 (select (arr!21002 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27574 0))(
  ( (Unit!27575) )
))
(declare-fun lt!360793 () Unit!27574)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!43846 (_ BitVec 64) (_ BitVec 32)) Unit!27574)

(assert (=> b!805928 (= lt!360793 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!360794 #b00000000000000000000000000000000))))

(assert (=> b!805928 (arrayContainsKey!0 a!3170 lt!360794 #b00000000000000000000000000000000)))

(declare-fun lt!360792 () Unit!27574)

(assert (=> b!805928 (= lt!360792 lt!360793)))

(declare-fun res!550380 () Bool)

(assert (=> b!805928 (= res!550380 (= (seekEntryOrOpen!0 (select (arr!21002 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8590 #b00000000000000000000000000000000)))))

(assert (=> b!805928 (=> (not res!550380) (not e!446282))))

(declare-fun b!805929 () Bool)

(assert (=> b!805929 (= e!446284 call!35344)))

(declare-fun d!103441 () Bool)

(declare-fun res!550379 () Bool)

(declare-fun e!446283 () Bool)

(assert (=> d!103441 (=> res!550379 e!446283)))

(assert (=> d!103441 (= res!550379 (bvsge #b00000000000000000000000000000000 (size!21423 a!3170)))))

(assert (=> d!103441 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!446283)))

(declare-fun b!805930 () Bool)

(assert (=> b!805930 (= e!446282 call!35344)))

(declare-fun b!805931 () Bool)

(assert (=> b!805931 (= e!446283 e!446284)))

(declare-fun c!88185 () Bool)

(assert (=> b!805931 (= c!88185 (validKeyInArray!0 (select (arr!21002 a!3170) #b00000000000000000000000000000000)))))

(assert (= (and d!103441 (not res!550379)) b!805931))

(assert (= (and b!805931 c!88185) b!805928))

(assert (= (and b!805931 (not c!88185)) b!805929))

(assert (= (and b!805928 res!550380) b!805930))

(assert (= (or b!805930 b!805929) bm!35341))

(declare-fun m!747399 () Bool)

(assert (=> bm!35341 m!747399))

(assert (=> b!805928 m!747391))

(declare-fun m!747401 () Bool)

(assert (=> b!805928 m!747401))

(declare-fun m!747403 () Bool)

(assert (=> b!805928 m!747403))

(assert (=> b!805928 m!747391))

(declare-fun m!747405 () Bool)

(assert (=> b!805928 m!747405))

(assert (=> b!805931 m!747391))

(assert (=> b!805931 m!747391))

(assert (=> b!805931 m!747393))

(assert (=> b!805824 d!103441))

(declare-fun b!805950 () Bool)

(declare-fun e!446298 () SeekEntryResult!8590)

(declare-fun lt!360802 () SeekEntryResult!8590)

(assert (=> b!805950 (= e!446298 (Found!8590 (index!36730 lt!360802)))))

(declare-fun b!805951 () Bool)

(declare-fun e!446297 () SeekEntryResult!8590)

(assert (=> b!805951 (= e!446297 (MissingZero!8590 (index!36730 lt!360802)))))

(declare-fun b!805952 () Bool)

(declare-fun c!88193 () Bool)

(declare-fun lt!360803 () (_ BitVec 64))

(assert (=> b!805952 (= c!88193 (= lt!360803 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!805952 (= e!446298 e!446297)))

(declare-fun b!805953 () Bool)

(declare-fun e!446299 () SeekEntryResult!8590)

(assert (=> b!805953 (= e!446299 e!446298)))

(assert (=> b!805953 (= lt!360803 (select (arr!21002 a!3170) (index!36730 lt!360802)))))

(declare-fun c!88194 () Bool)

(assert (=> b!805953 (= c!88194 (= lt!360803 k0!2044))))

(declare-fun b!805955 () Bool)

(assert (=> b!805955 (= e!446297 (seekKeyOrZeroReturnVacant!0 (x!67554 lt!360802) (index!36730 lt!360802) (index!36730 lt!360802) k0!2044 a!3170 mask!3266))))

(declare-fun d!103443 () Bool)

(declare-fun lt!360801 () SeekEntryResult!8590)

(get-info :version)

(assert (=> d!103443 (and (or ((_ is Undefined!8590) lt!360801) (not ((_ is Found!8590) lt!360801)) (and (bvsge (index!36729 lt!360801) #b00000000000000000000000000000000) (bvslt (index!36729 lt!360801) (size!21423 a!3170)))) (or ((_ is Undefined!8590) lt!360801) ((_ is Found!8590) lt!360801) (not ((_ is MissingZero!8590) lt!360801)) (and (bvsge (index!36728 lt!360801) #b00000000000000000000000000000000) (bvslt (index!36728 lt!360801) (size!21423 a!3170)))) (or ((_ is Undefined!8590) lt!360801) ((_ is Found!8590) lt!360801) ((_ is MissingZero!8590) lt!360801) (not ((_ is MissingVacant!8590) lt!360801)) (and (bvsge (index!36731 lt!360801) #b00000000000000000000000000000000) (bvslt (index!36731 lt!360801) (size!21423 a!3170)))) (or ((_ is Undefined!8590) lt!360801) (ite ((_ is Found!8590) lt!360801) (= (select (arr!21002 a!3170) (index!36729 lt!360801)) k0!2044) (ite ((_ is MissingZero!8590) lt!360801) (= (select (arr!21002 a!3170) (index!36728 lt!360801)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8590) lt!360801) (= (select (arr!21002 a!3170) (index!36731 lt!360801)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103443 (= lt!360801 e!446299)))

(declare-fun c!88192 () Bool)

(assert (=> d!103443 (= c!88192 (and ((_ is Intermediate!8590) lt!360802) (undefined!9402 lt!360802)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43846 (_ BitVec 32)) SeekEntryResult!8590)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103443 (= lt!360802 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2044 mask!3266) k0!2044 a!3170 mask!3266))))

(assert (=> d!103443 (validMask!0 mask!3266)))

(assert (=> d!103443 (= (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266) lt!360801)))

(declare-fun b!805954 () Bool)

(assert (=> b!805954 (= e!446299 Undefined!8590)))

(assert (= (and d!103443 c!88192) b!805954))

(assert (= (and d!103443 (not c!88192)) b!805953))

(assert (= (and b!805953 c!88194) b!805950))

(assert (= (and b!805953 (not c!88194)) b!805952))

(assert (= (and b!805952 c!88193) b!805951))

(assert (= (and b!805952 (not c!88193)) b!805955))

(declare-fun m!747411 () Bool)

(assert (=> b!805953 m!747411))

(declare-fun m!747413 () Bool)

(assert (=> b!805955 m!747413))

(declare-fun m!747415 () Bool)

(assert (=> d!103443 m!747415))

(declare-fun m!747417 () Bool)

(assert (=> d!103443 m!747417))

(declare-fun m!747419 () Bool)

(assert (=> d!103443 m!747419))

(assert (=> d!103443 m!747289))

(declare-fun m!747421 () Bool)

(assert (=> d!103443 m!747421))

(declare-fun m!747423 () Bool)

(assert (=> d!103443 m!747423))

(assert (=> d!103443 m!747415))

(assert (=> b!805829 d!103443))

(declare-fun d!103451 () Bool)

(declare-fun res!550391 () Bool)

(declare-fun e!446304 () Bool)

(assert (=> d!103451 (=> res!550391 e!446304)))

(assert (=> d!103451 (= res!550391 (= (select (arr!21002 a!3170) #b00000000000000000000000000000000) k0!2044))))

(assert (=> d!103451 (= (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000) e!446304)))

(declare-fun b!805960 () Bool)

(declare-fun e!446305 () Bool)

(assert (=> b!805960 (= e!446304 e!446305)))

(declare-fun res!550392 () Bool)

(assert (=> b!805960 (=> (not res!550392) (not e!446305))))

(assert (=> b!805960 (= res!550392 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21423 a!3170)))))

(declare-fun b!805961 () Bool)

(assert (=> b!805961 (= e!446305 (arrayContainsKey!0 a!3170 k0!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103451 (not res!550391)) b!805960))

(assert (= (and b!805960 res!550392) b!805961))

(assert (=> d!103451 m!747391))

(declare-fun m!747425 () Bool)

(assert (=> b!805961 m!747425))

(assert (=> b!805830 d!103451))

(declare-fun d!103453 () Bool)

(assert (=> d!103453 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!69084 d!103453))

(declare-fun d!103459 () Bool)

(assert (=> d!103459 (= (array_inv!16885 a!3170) (bvsge (size!21423 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!69084 d!103459))

(declare-fun d!103461 () Bool)

(assert (=> d!103461 (= (validKeyInArray!0 (select (arr!21002 a!3170) j!153)) (and (not (= (select (arr!21002 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!21002 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!805828 d!103461))

(declare-fun b!806000 () Bool)

(declare-fun e!446328 () SeekEntryResult!8590)

(assert (=> b!806000 (= e!446328 Undefined!8590)))

(declare-fun lt!360820 () SeekEntryResult!8590)

(declare-fun d!103463 () Bool)

(assert (=> d!103463 (and (or ((_ is Undefined!8590) lt!360820) (not ((_ is Found!8590) lt!360820)) (and (bvsge (index!36729 lt!360820) #b00000000000000000000000000000000) (bvslt (index!36729 lt!360820) (size!21423 a!3170)))) (or ((_ is Undefined!8590) lt!360820) ((_ is Found!8590) lt!360820) (not ((_ is MissingVacant!8590) lt!360820)) (not (= (index!36731 lt!360820) vacantBefore!23)) (and (bvsge (index!36731 lt!360820) #b00000000000000000000000000000000) (bvslt (index!36731 lt!360820) (size!21423 a!3170)))) (or ((_ is Undefined!8590) lt!360820) (ite ((_ is Found!8590) lt!360820) (= (select (arr!21002 a!3170) (index!36729 lt!360820)) (select (arr!21002 a!3170) j!153)) (and ((_ is MissingVacant!8590) lt!360820) (= (index!36731 lt!360820) vacantBefore!23) (= (select (arr!21002 a!3170) (index!36731 lt!360820)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103463 (= lt!360820 e!446328)))

(declare-fun c!88214 () Bool)

(assert (=> d!103463 (= c!88214 (bvsge x!1077 #b01111111111111111111111111111110))))

(declare-fun lt!360821 () (_ BitVec 64))

(assert (=> d!103463 (= lt!360821 (select (arr!21002 a!3170) index!1236))))

(assert (=> d!103463 (validMask!0 mask!3266)))

(assert (=> d!103463 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21002 a!3170) j!153) a!3170 mask!3266) lt!360820)))

(declare-fun b!806001 () Bool)

(declare-fun e!446327 () SeekEntryResult!8590)

(assert (=> b!806001 (= e!446327 (Found!8590 index!1236))))

(declare-fun b!806002 () Bool)

(declare-fun c!88212 () Bool)

(assert (=> b!806002 (= c!88212 (= lt!360821 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!446329 () SeekEntryResult!8590)

(assert (=> b!806002 (= e!446327 e!446329)))

(declare-fun b!806003 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!806003 (= e!446329 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantBefore!23 (select (arr!21002 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806004 () Bool)

(assert (=> b!806004 (= e!446329 (MissingVacant!8590 vacantBefore!23))))

(declare-fun b!806005 () Bool)

(assert (=> b!806005 (= e!446328 e!446327)))

(declare-fun c!88213 () Bool)

(assert (=> b!806005 (= c!88213 (= lt!360821 (select (arr!21002 a!3170) j!153)))))

(assert (= (and d!103463 c!88214) b!806000))

(assert (= (and d!103463 (not c!88214)) b!806005))

(assert (= (and b!806005 c!88213) b!806001))

(assert (= (and b!806005 (not c!88213)) b!806002))

(assert (= (and b!806002 c!88212) b!806004))

(assert (= (and b!806002 (not c!88212)) b!806003))

(declare-fun m!747435 () Bool)

(assert (=> d!103463 m!747435))

(declare-fun m!747437 () Bool)

(assert (=> d!103463 m!747437))

(assert (=> d!103463 m!747285))

(assert (=> d!103463 m!747289))

(declare-fun m!747439 () Bool)

(assert (=> b!806003 m!747439))

(assert (=> b!806003 m!747439))

(assert (=> b!806003 m!747287))

(declare-fun m!747441 () Bool)

(assert (=> b!806003 m!747441))

(assert (=> b!805823 d!103463))

(declare-fun b!806006 () Bool)

(declare-fun e!446331 () SeekEntryResult!8590)

(declare-fun lt!360823 () SeekEntryResult!8590)

(assert (=> b!806006 (= e!446331 (Found!8590 (index!36730 lt!360823)))))

(declare-fun b!806007 () Bool)

(declare-fun e!446330 () SeekEntryResult!8590)

(assert (=> b!806007 (= e!446330 (MissingZero!8590 (index!36730 lt!360823)))))

(declare-fun b!806008 () Bool)

(declare-fun c!88216 () Bool)

(declare-fun lt!360824 () (_ BitVec 64))

(assert (=> b!806008 (= c!88216 (= lt!360824 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!806008 (= e!446331 e!446330)))

(declare-fun b!806009 () Bool)

(declare-fun e!446332 () SeekEntryResult!8590)

(assert (=> b!806009 (= e!446332 e!446331)))

(assert (=> b!806009 (= lt!360824 (select (arr!21002 a!3170) (index!36730 lt!360823)))))

(declare-fun c!88217 () Bool)

(assert (=> b!806009 (= c!88217 (= lt!360824 (select (arr!21002 a!3170) j!153)))))

(declare-fun b!806011 () Bool)

(assert (=> b!806011 (= e!446330 (seekKeyOrZeroReturnVacant!0 (x!67554 lt!360823) (index!36730 lt!360823) (index!36730 lt!360823) (select (arr!21002 a!3170) j!153) a!3170 mask!3266))))

(declare-fun d!103471 () Bool)

(declare-fun lt!360822 () SeekEntryResult!8590)

(assert (=> d!103471 (and (or ((_ is Undefined!8590) lt!360822) (not ((_ is Found!8590) lt!360822)) (and (bvsge (index!36729 lt!360822) #b00000000000000000000000000000000) (bvslt (index!36729 lt!360822) (size!21423 a!3170)))) (or ((_ is Undefined!8590) lt!360822) ((_ is Found!8590) lt!360822) (not ((_ is MissingZero!8590) lt!360822)) (and (bvsge (index!36728 lt!360822) #b00000000000000000000000000000000) (bvslt (index!36728 lt!360822) (size!21423 a!3170)))) (or ((_ is Undefined!8590) lt!360822) ((_ is Found!8590) lt!360822) ((_ is MissingZero!8590) lt!360822) (not ((_ is MissingVacant!8590) lt!360822)) (and (bvsge (index!36731 lt!360822) #b00000000000000000000000000000000) (bvslt (index!36731 lt!360822) (size!21423 a!3170)))) (or ((_ is Undefined!8590) lt!360822) (ite ((_ is Found!8590) lt!360822) (= (select (arr!21002 a!3170) (index!36729 lt!360822)) (select (arr!21002 a!3170) j!153)) (ite ((_ is MissingZero!8590) lt!360822) (= (select (arr!21002 a!3170) (index!36728 lt!360822)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8590) lt!360822) (= (select (arr!21002 a!3170) (index!36731 lt!360822)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103471 (= lt!360822 e!446332)))

(declare-fun c!88215 () Bool)

(assert (=> d!103471 (= c!88215 (and ((_ is Intermediate!8590) lt!360823) (undefined!9402 lt!360823)))))

(assert (=> d!103471 (= lt!360823 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!21002 a!3170) j!153) mask!3266) (select (arr!21002 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!103471 (validMask!0 mask!3266)))

(assert (=> d!103471 (= (seekEntryOrOpen!0 (select (arr!21002 a!3170) j!153) a!3170 mask!3266) lt!360822)))

(declare-fun b!806010 () Bool)

(assert (=> b!806010 (= e!446332 Undefined!8590)))

(assert (= (and d!103471 c!88215) b!806010))

(assert (= (and d!103471 (not c!88215)) b!806009))

(assert (= (and b!806009 c!88217) b!806006))

(assert (= (and b!806009 (not c!88217)) b!806008))

(assert (= (and b!806008 c!88216) b!806007))

(assert (= (and b!806008 (not c!88216)) b!806011))

(declare-fun m!747443 () Bool)

(assert (=> b!806009 m!747443))

(assert (=> b!806011 m!747287))

(declare-fun m!747445 () Bool)

(assert (=> b!806011 m!747445))

(declare-fun m!747447 () Bool)

(assert (=> d!103471 m!747447))

(assert (=> d!103471 m!747287))

(declare-fun m!747449 () Bool)

(assert (=> d!103471 m!747449))

(declare-fun m!747451 () Bool)

(assert (=> d!103471 m!747451))

(assert (=> d!103471 m!747289))

(declare-fun m!747453 () Bool)

(assert (=> d!103471 m!747453))

(declare-fun m!747455 () Bool)

(assert (=> d!103471 m!747455))

(assert (=> d!103471 m!747287))

(assert (=> d!103471 m!747447))

(assert (=> b!805823 d!103471))

(declare-fun b!806012 () Bool)

(declare-fun e!446334 () SeekEntryResult!8590)

(assert (=> b!806012 (= e!446334 Undefined!8590)))

(declare-fun d!103473 () Bool)

(declare-fun lt!360825 () SeekEntryResult!8590)

(assert (=> d!103473 (and (or ((_ is Undefined!8590) lt!360825) (not ((_ is Found!8590) lt!360825)) (and (bvsge (index!36729 lt!360825) #b00000000000000000000000000000000) (bvslt (index!36729 lt!360825) (size!21423 lt!360731)))) (or ((_ is Undefined!8590) lt!360825) ((_ is Found!8590) lt!360825) (not ((_ is MissingVacant!8590) lt!360825)) (not (= (index!36731 lt!360825) vacantAfter!23)) (and (bvsge (index!36731 lt!360825) #b00000000000000000000000000000000) (bvslt (index!36731 lt!360825) (size!21423 lt!360731)))) (or ((_ is Undefined!8590) lt!360825) (ite ((_ is Found!8590) lt!360825) (= (select (arr!21002 lt!360731) (index!36729 lt!360825)) lt!360732) (and ((_ is MissingVacant!8590) lt!360825) (= (index!36731 lt!360825) vacantAfter!23) (= (select (arr!21002 lt!360731) (index!36731 lt!360825)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103473 (= lt!360825 e!446334)))

(declare-fun c!88220 () Bool)

(assert (=> d!103473 (= c!88220 (bvsge x!1077 #b01111111111111111111111111111110))))

(declare-fun lt!360826 () (_ BitVec 64))

(assert (=> d!103473 (= lt!360826 (select (arr!21002 lt!360731) index!1236))))

(assert (=> d!103473 (validMask!0 mask!3266)))

(assert (=> d!103473 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360732 lt!360731 mask!3266) lt!360825)))

(declare-fun b!806013 () Bool)

(declare-fun e!446333 () SeekEntryResult!8590)

(assert (=> b!806013 (= e!446333 (Found!8590 index!1236))))

(declare-fun b!806014 () Bool)

(declare-fun c!88218 () Bool)

(assert (=> b!806014 (= c!88218 (= lt!360826 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!446335 () SeekEntryResult!8590)

(assert (=> b!806014 (= e!446333 e!446335)))

(declare-fun b!806015 () Bool)

(assert (=> b!806015 (= e!446335 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantAfter!23 lt!360732 lt!360731 mask!3266))))

(declare-fun b!806016 () Bool)

(assert (=> b!806016 (= e!446335 (MissingVacant!8590 vacantAfter!23))))

(declare-fun b!806017 () Bool)

(assert (=> b!806017 (= e!446334 e!446333)))

(declare-fun c!88219 () Bool)

(assert (=> b!806017 (= c!88219 (= lt!360826 lt!360732))))

(assert (= (and d!103473 c!88220) b!806012))

(assert (= (and d!103473 (not c!88220)) b!806017))

(assert (= (and b!806017 c!88219) b!806013))

(assert (= (and b!806017 (not c!88219)) b!806014))

(assert (= (and b!806014 c!88218) b!806016))

(assert (= (and b!806014 (not c!88218)) b!806015))

(declare-fun m!747457 () Bool)

(assert (=> d!103473 m!747457))

(declare-fun m!747459 () Bool)

(assert (=> d!103473 m!747459))

(declare-fun m!747461 () Bool)

(assert (=> d!103473 m!747461))

(assert (=> d!103473 m!747289))

(assert (=> b!806015 m!747439))

(assert (=> b!806015 m!747439))

(declare-fun m!747463 () Bool)

(assert (=> b!806015 m!747463))

(assert (=> b!805832 d!103473))

(declare-fun b!806022 () Bool)

(declare-fun e!446340 () SeekEntryResult!8590)

(declare-fun lt!360831 () SeekEntryResult!8590)

(assert (=> b!806022 (= e!446340 (Found!8590 (index!36730 lt!360831)))))

(declare-fun b!806023 () Bool)

(declare-fun e!446339 () SeekEntryResult!8590)

(assert (=> b!806023 (= e!446339 (MissingZero!8590 (index!36730 lt!360831)))))

(declare-fun b!806024 () Bool)

(declare-fun c!88223 () Bool)

(declare-fun lt!360832 () (_ BitVec 64))

(assert (=> b!806024 (= c!88223 (= lt!360832 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!806024 (= e!446340 e!446339)))

(declare-fun b!806025 () Bool)

(declare-fun e!446341 () SeekEntryResult!8590)

(assert (=> b!806025 (= e!446341 e!446340)))

(assert (=> b!806025 (= lt!360832 (select (arr!21002 lt!360731) (index!36730 lt!360831)))))

(declare-fun c!88224 () Bool)

(assert (=> b!806025 (= c!88224 (= lt!360832 lt!360732))))

(declare-fun b!806027 () Bool)

(assert (=> b!806027 (= e!446339 (seekKeyOrZeroReturnVacant!0 (x!67554 lt!360831) (index!36730 lt!360831) (index!36730 lt!360831) lt!360732 lt!360731 mask!3266))))

(declare-fun d!103475 () Bool)

(declare-fun lt!360830 () SeekEntryResult!8590)

(assert (=> d!103475 (and (or ((_ is Undefined!8590) lt!360830) (not ((_ is Found!8590) lt!360830)) (and (bvsge (index!36729 lt!360830) #b00000000000000000000000000000000) (bvslt (index!36729 lt!360830) (size!21423 lt!360731)))) (or ((_ is Undefined!8590) lt!360830) ((_ is Found!8590) lt!360830) (not ((_ is MissingZero!8590) lt!360830)) (and (bvsge (index!36728 lt!360830) #b00000000000000000000000000000000) (bvslt (index!36728 lt!360830) (size!21423 lt!360731)))) (or ((_ is Undefined!8590) lt!360830) ((_ is Found!8590) lt!360830) ((_ is MissingZero!8590) lt!360830) (not ((_ is MissingVacant!8590) lt!360830)) (and (bvsge (index!36731 lt!360830) #b00000000000000000000000000000000) (bvslt (index!36731 lt!360830) (size!21423 lt!360731)))) (or ((_ is Undefined!8590) lt!360830) (ite ((_ is Found!8590) lt!360830) (= (select (arr!21002 lt!360731) (index!36729 lt!360830)) lt!360732) (ite ((_ is MissingZero!8590) lt!360830) (= (select (arr!21002 lt!360731) (index!36728 lt!360830)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8590) lt!360830) (= (select (arr!21002 lt!360731) (index!36731 lt!360830)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103475 (= lt!360830 e!446341)))

(declare-fun c!88222 () Bool)

(assert (=> d!103475 (= c!88222 (and ((_ is Intermediate!8590) lt!360831) (undefined!9402 lt!360831)))))

(assert (=> d!103475 (= lt!360831 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!360732 mask!3266) lt!360732 lt!360731 mask!3266))))

(assert (=> d!103475 (validMask!0 mask!3266)))

(assert (=> d!103475 (= (seekEntryOrOpen!0 lt!360732 lt!360731 mask!3266) lt!360830)))

(declare-fun b!806026 () Bool)

(assert (=> b!806026 (= e!446341 Undefined!8590)))

(assert (= (and d!103475 c!88222) b!806026))

(assert (= (and d!103475 (not c!88222)) b!806025))

(assert (= (and b!806025 c!88224) b!806022))

(assert (= (and b!806025 (not c!88224)) b!806024))

(assert (= (and b!806024 c!88223) b!806023))

(assert (= (and b!806024 (not c!88223)) b!806027))

(declare-fun m!747465 () Bool)

(assert (=> b!806025 m!747465))

(declare-fun m!747469 () Bool)

(assert (=> b!806027 m!747469))

(declare-fun m!747473 () Bool)

(assert (=> d!103475 m!747473))

(declare-fun m!747475 () Bool)

(assert (=> d!103475 m!747475))

(declare-fun m!747479 () Bool)

(assert (=> d!103475 m!747479))

(assert (=> d!103475 m!747289))

(declare-fun m!747481 () Bool)

(assert (=> d!103475 m!747481))

(declare-fun m!747483 () Bool)

(assert (=> d!103475 m!747483))

(assert (=> d!103475 m!747473))

(assert (=> b!805832 d!103475))

(check-sat (not b!805955) (not b!805919) (not bm!35338) (not b!805928) (not d!103443) (not b!806027) (not b!805918) (not b!805931) (not d!103471) (not d!103473) (not b!805961) (not d!103475) (not b!806003) (not b!806011) (not b!805915) (not bm!35341) (not d!103463) (not b!806015))
(check-sat)
