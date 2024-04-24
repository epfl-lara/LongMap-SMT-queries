; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68214 () Bool)

(assert start!68214)

(declare-fun b!792729 () Bool)

(declare-fun res!537091 () Bool)

(declare-fun e!440522 () Bool)

(assert (=> b!792729 (=> (not res!537091) (not e!440522))))

(declare-datatypes ((array!42995 0))(
  ( (array!42996 (arr!20578 (Array (_ BitVec 32) (_ BitVec 64))) (size!20998 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42995)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792729 (= res!537091 (validKeyInArray!0 (select (arr!20578 a!3170) j!153)))))

(declare-fun res!537092 () Bool)

(assert (=> start!68214 (=> (not res!537092) (not e!440522))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68214 (= res!537092 (validMask!0 mask!3266))))

(assert (=> start!68214 e!440522))

(assert (=> start!68214 true))

(declare-fun array_inv!16437 (array!42995) Bool)

(assert (=> start!68214 (array_inv!16437 a!3170)))

(declare-fun b!792730 () Bool)

(declare-fun res!537094 () Bool)

(assert (=> b!792730 (=> (not res!537094) (not e!440522))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!792730 (= res!537094 (validKeyInArray!0 k0!2044))))

(declare-fun b!792731 () Bool)

(declare-fun res!537095 () Bool)

(assert (=> b!792731 (=> (not res!537095) (not e!440522))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!792731 (= res!537095 (and (= (size!20998 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20998 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20998 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792732 () Bool)

(declare-fun res!537090 () Bool)

(declare-fun e!440523 () Bool)

(assert (=> b!792732 (=> (not res!537090) (not e!440523))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42995 (_ BitVec 32)) Bool)

(assert (=> b!792732 (= res!537090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!792733 () Bool)

(assert (=> b!792733 (= e!440523 (and (bvsle #b00000000000000000000000000000000 (size!20998 a!3170)) (bvsge (size!20998 a!3170) #b01111111111111111111111111111111)))))

(declare-fun b!792734 () Bool)

(declare-fun res!537096 () Bool)

(assert (=> b!792734 (=> (not res!537096) (not e!440522))))

(declare-fun arrayContainsKey!0 (array!42995 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792734 (= res!537096 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792735 () Bool)

(assert (=> b!792735 (= e!440522 e!440523)))

(declare-fun res!537093 () Bool)

(assert (=> b!792735 (=> (not res!537093) (not e!440523))))

(declare-datatypes ((SeekEntryResult!8125 0))(
  ( (MissingZero!8125 (index!34868 (_ BitVec 32))) (Found!8125 (index!34869 (_ BitVec 32))) (Intermediate!8125 (undefined!8937 Bool) (index!34870 (_ BitVec 32)) (x!65982 (_ BitVec 32))) (Undefined!8125) (MissingVacant!8125 (index!34871 (_ BitVec 32))) )
))
(declare-fun lt!353632 () SeekEntryResult!8125)

(assert (=> b!792735 (= res!537093 (or (= lt!353632 (MissingZero!8125 i!1163)) (= lt!353632 (MissingVacant!8125 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42995 (_ BitVec 32)) SeekEntryResult!8125)

(assert (=> b!792735 (= lt!353632 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!68214 res!537092) b!792731))

(assert (= (and b!792731 res!537095) b!792729))

(assert (= (and b!792729 res!537091) b!792730))

(assert (= (and b!792730 res!537094) b!792734))

(assert (= (and b!792734 res!537096) b!792735))

(assert (= (and b!792735 res!537093) b!792732))

(assert (= (and b!792732 res!537090) b!792733))

(declare-fun m!733823 () Bool)

(assert (=> start!68214 m!733823))

(declare-fun m!733825 () Bool)

(assert (=> start!68214 m!733825))

(declare-fun m!733827 () Bool)

(assert (=> b!792734 m!733827))

(declare-fun m!733829 () Bool)

(assert (=> b!792729 m!733829))

(assert (=> b!792729 m!733829))

(declare-fun m!733831 () Bool)

(assert (=> b!792729 m!733831))

(declare-fun m!733833 () Bool)

(assert (=> b!792730 m!733833))

(declare-fun m!733835 () Bool)

(assert (=> b!792732 m!733835))

(declare-fun m!733837 () Bool)

(assert (=> b!792735 m!733837))

(check-sat (not b!792729) (not b!792730) (not b!792735) (not start!68214) (not b!792734) (not b!792732))
(check-sat)
(get-model)

(declare-fun lt!353654 () SeekEntryResult!8125)

(declare-fun b!792802 () Bool)

(declare-fun e!440558 () SeekEntryResult!8125)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42995 (_ BitVec 32)) SeekEntryResult!8125)

(assert (=> b!792802 (= e!440558 (seekKeyOrZeroReturnVacant!0 (x!65982 lt!353654) (index!34870 lt!353654) (index!34870 lt!353654) k0!2044 a!3170 mask!3266))))

(declare-fun d!103393 () Bool)

(declare-fun lt!353656 () SeekEntryResult!8125)

(get-info :version)

(assert (=> d!103393 (and (or ((_ is Undefined!8125) lt!353656) (not ((_ is Found!8125) lt!353656)) (and (bvsge (index!34869 lt!353656) #b00000000000000000000000000000000) (bvslt (index!34869 lt!353656) (size!20998 a!3170)))) (or ((_ is Undefined!8125) lt!353656) ((_ is Found!8125) lt!353656) (not ((_ is MissingZero!8125) lt!353656)) (and (bvsge (index!34868 lt!353656) #b00000000000000000000000000000000) (bvslt (index!34868 lt!353656) (size!20998 a!3170)))) (or ((_ is Undefined!8125) lt!353656) ((_ is Found!8125) lt!353656) ((_ is MissingZero!8125) lt!353656) (not ((_ is MissingVacant!8125) lt!353656)) (and (bvsge (index!34871 lt!353656) #b00000000000000000000000000000000) (bvslt (index!34871 lt!353656) (size!20998 a!3170)))) (or ((_ is Undefined!8125) lt!353656) (ite ((_ is Found!8125) lt!353656) (= (select (arr!20578 a!3170) (index!34869 lt!353656)) k0!2044) (ite ((_ is MissingZero!8125) lt!353656) (= (select (arr!20578 a!3170) (index!34868 lt!353656)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8125) lt!353656) (= (select (arr!20578 a!3170) (index!34871 lt!353656)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!440559 () SeekEntryResult!8125)

(assert (=> d!103393 (= lt!353656 e!440559)))

(declare-fun c!88243 () Bool)

(assert (=> d!103393 (= c!88243 (and ((_ is Intermediate!8125) lt!353654) (undefined!8937 lt!353654)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42995 (_ BitVec 32)) SeekEntryResult!8125)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103393 (= lt!353654 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2044 mask!3266) k0!2044 a!3170 mask!3266))))

(assert (=> d!103393 (validMask!0 mask!3266)))

(assert (=> d!103393 (= (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266) lt!353656)))

(declare-fun b!792803 () Bool)

(declare-fun c!88244 () Bool)

(declare-fun lt!353655 () (_ BitVec 64))

(assert (=> b!792803 (= c!88244 (= lt!353655 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!440560 () SeekEntryResult!8125)

(assert (=> b!792803 (= e!440560 e!440558)))

(declare-fun b!792804 () Bool)

(assert (=> b!792804 (= e!440560 (Found!8125 (index!34870 lt!353654)))))

(declare-fun b!792805 () Bool)

(assert (=> b!792805 (= e!440559 e!440560)))

(assert (=> b!792805 (= lt!353655 (select (arr!20578 a!3170) (index!34870 lt!353654)))))

(declare-fun c!88242 () Bool)

(assert (=> b!792805 (= c!88242 (= lt!353655 k0!2044))))

(declare-fun b!792806 () Bool)

(assert (=> b!792806 (= e!440559 Undefined!8125)))

(declare-fun b!792807 () Bool)

(assert (=> b!792807 (= e!440558 (MissingZero!8125 (index!34870 lt!353654)))))

(assert (= (and d!103393 c!88243) b!792806))

(assert (= (and d!103393 (not c!88243)) b!792805))

(assert (= (and b!792805 c!88242) b!792804))

(assert (= (and b!792805 (not c!88242)) b!792803))

(assert (= (and b!792803 c!88244) b!792807))

(assert (= (and b!792803 (not c!88244)) b!792802))

(declare-fun m!733883 () Bool)

(assert (=> b!792802 m!733883))

(declare-fun m!733885 () Bool)

(assert (=> d!103393 m!733885))

(assert (=> d!103393 m!733885))

(declare-fun m!733887 () Bool)

(assert (=> d!103393 m!733887))

(assert (=> d!103393 m!733823))

(declare-fun m!733889 () Bool)

(assert (=> d!103393 m!733889))

(declare-fun m!733891 () Bool)

(assert (=> d!103393 m!733891))

(declare-fun m!733893 () Bool)

(assert (=> d!103393 m!733893))

(declare-fun m!733895 () Bool)

(assert (=> b!792805 m!733895))

(assert (=> b!792735 d!103393))

(declare-fun d!103403 () Bool)

(assert (=> d!103403 (= (validKeyInArray!0 k0!2044) (and (not (= k0!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!792730 d!103403))

(declare-fun d!103405 () Bool)

(declare-fun res!537149 () Bool)

(declare-fun e!440571 () Bool)

(assert (=> d!103405 (=> res!537149 e!440571)))

(assert (=> d!103405 (= res!537149 (= (select (arr!20578 a!3170) #b00000000000000000000000000000000) k0!2044))))

(assert (=> d!103405 (= (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000) e!440571)))

(declare-fun b!792824 () Bool)

(declare-fun e!440572 () Bool)

(assert (=> b!792824 (= e!440571 e!440572)))

(declare-fun res!537150 () Bool)

(assert (=> b!792824 (=> (not res!537150) (not e!440572))))

(assert (=> b!792824 (= res!537150 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20998 a!3170)))))

(declare-fun b!792825 () Bool)

(assert (=> b!792825 (= e!440572 (arrayContainsKey!0 a!3170 k0!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103405 (not res!537149)) b!792824))

(assert (= (and b!792824 res!537150) b!792825))

(declare-fun m!733897 () Bool)

(assert (=> d!103405 m!733897))

(declare-fun m!733899 () Bool)

(assert (=> b!792825 m!733899))

(assert (=> b!792734 d!103405))

(declare-fun d!103407 () Bool)

(assert (=> d!103407 (= (validKeyInArray!0 (select (arr!20578 a!3170) j!153)) (and (not (= (select (arr!20578 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20578 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!792729 d!103407))

(declare-fun d!103409 () Bool)

(assert (=> d!103409 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!68214 d!103409))

(declare-fun d!103413 () Bool)

(assert (=> d!103413 (= (array_inv!16437 a!3170) (bvsge (size!20998 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!68214 d!103413))

(declare-fun bm!35352 () Bool)

(declare-fun call!35355 () Bool)

(assert (=> bm!35352 (= call!35355 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun d!103415 () Bool)

(declare-fun res!537171 () Bool)

(declare-fun e!440610 () Bool)

(assert (=> d!103415 (=> res!537171 e!440610)))

(assert (=> d!103415 (= res!537171 (bvsge #b00000000000000000000000000000000 (size!20998 a!3170)))))

(assert (=> d!103415 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!440610)))

(declare-fun b!792880 () Bool)

(declare-fun e!440612 () Bool)

(assert (=> b!792880 (= e!440612 call!35355)))

(declare-fun b!792881 () Bool)

(declare-fun e!440611 () Bool)

(assert (=> b!792881 (= e!440612 e!440611)))

(declare-fun lt!353690 () (_ BitVec 64))

(assert (=> b!792881 (= lt!353690 (select (arr!20578 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27429 0))(
  ( (Unit!27430) )
))
(declare-fun lt!353691 () Unit!27429)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42995 (_ BitVec 64) (_ BitVec 32)) Unit!27429)

(assert (=> b!792881 (= lt!353691 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!353690 #b00000000000000000000000000000000))))

(assert (=> b!792881 (arrayContainsKey!0 a!3170 lt!353690 #b00000000000000000000000000000000)))

(declare-fun lt!353692 () Unit!27429)

(assert (=> b!792881 (= lt!353692 lt!353691)))

(declare-fun res!537172 () Bool)

(assert (=> b!792881 (= res!537172 (= (seekEntryOrOpen!0 (select (arr!20578 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8125 #b00000000000000000000000000000000)))))

(assert (=> b!792881 (=> (not res!537172) (not e!440611))))

(declare-fun b!792882 () Bool)

(assert (=> b!792882 (= e!440610 e!440612)))

(declare-fun c!88268 () Bool)

(assert (=> b!792882 (= c!88268 (validKeyInArray!0 (select (arr!20578 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!792883 () Bool)

(assert (=> b!792883 (= e!440611 call!35355)))

(assert (= (and d!103415 (not res!537171)) b!792882))

(assert (= (and b!792882 c!88268) b!792881))

(assert (= (and b!792882 (not c!88268)) b!792880))

(assert (= (and b!792881 res!537172) b!792883))

(assert (= (or b!792883 b!792880) bm!35352))

(declare-fun m!733943 () Bool)

(assert (=> bm!35352 m!733943))

(assert (=> b!792881 m!733897))

(declare-fun m!733945 () Bool)

(assert (=> b!792881 m!733945))

(declare-fun m!733947 () Bool)

(assert (=> b!792881 m!733947))

(assert (=> b!792881 m!733897))

(declare-fun m!733949 () Bool)

(assert (=> b!792881 m!733949))

(assert (=> b!792882 m!733897))

(assert (=> b!792882 m!733897))

(declare-fun m!733953 () Bool)

(assert (=> b!792882 m!733953))

(assert (=> b!792732 d!103415))

(check-sat (not d!103393) (not b!792882) (not b!792825) (not b!792881) (not bm!35352) (not b!792802))
(check-sat)
