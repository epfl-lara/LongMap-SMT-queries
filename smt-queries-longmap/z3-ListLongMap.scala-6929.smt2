; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87126 () Bool)

(assert start!87126)

(declare-fun b!1010243 () Bool)

(declare-fun e!568326 () Bool)

(declare-fun e!568325 () Bool)

(assert (=> b!1010243 (= e!568326 e!568325)))

(declare-fun res!678709 () Bool)

(assert (=> b!1010243 (=> (not res!678709) (not e!568325))))

(declare-datatypes ((SeekEntryResult!9566 0))(
  ( (MissingZero!9566 (index!40635 (_ BitVec 32))) (Found!9566 (index!40636 (_ BitVec 32))) (Intermediate!9566 (undefined!10378 Bool) (index!40637 (_ BitVec 32)) (x!88055 (_ BitVec 32))) (Undefined!9566) (MissingVacant!9566 (index!40638 (_ BitVec 32))) )
))
(declare-fun lt!446373 () SeekEntryResult!9566)

(declare-fun lt!446374 () SeekEntryResult!9566)

(assert (=> b!1010243 (= res!678709 (= lt!446373 lt!446374))))

(declare-datatypes ((array!63583 0))(
  ( (array!63584 (arr!30609 (Array (_ BitVec 32) (_ BitVec 64))) (size!31113 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63583)

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63583 (_ BitVec 32)) SeekEntryResult!9566)

(assert (=> b!1010243 (= lt!446373 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30609 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010244 () Bool)

(declare-fun res!678718 () Bool)

(declare-fun e!568330 () Bool)

(assert (=> b!1010244 (=> (not res!678718) (not e!568330))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1010244 (= res!678718 (and (= (size!31113 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31113 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31113 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!678712 () Bool)

(assert (=> start!87126 (=> (not res!678712) (not e!568330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87126 (= res!678712 (validMask!0 mask!3464))))

(assert (=> start!87126 e!568330))

(declare-fun array_inv!23752 (array!63583) Bool)

(assert (=> start!87126 (array_inv!23752 a!3219)))

(assert (=> start!87126 true))

(declare-fun b!1010245 () Bool)

(declare-fun e!568329 () Bool)

(assert (=> b!1010245 (= e!568325 e!568329)))

(declare-fun res!678708 () Bool)

(assert (=> b!1010245 (=> (not res!678708) (not e!568329))))

(declare-fun lt!446372 () array!63583)

(declare-fun lt!446371 () SeekEntryResult!9566)

(declare-fun lt!446376 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010245 (= res!678708 (not (= lt!446371 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446376 mask!3464) lt!446376 lt!446372 mask!3464))))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1010245 (= lt!446376 (select (store (arr!30609 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1010245 (= lt!446372 (array!63584 (store (arr!30609 a!3219) i!1194 k0!2224) (size!31113 a!3219)))))

(declare-fun b!1010246 () Bool)

(declare-fun res!678715 () Bool)

(declare-fun e!568328 () Bool)

(assert (=> b!1010246 (=> (not res!678715) (not e!568328))))

(declare-datatypes ((List!21351 0))(
  ( (Nil!21348) (Cons!21347 (h!22539 (_ BitVec 64)) (t!30343 List!21351)) )
))
(declare-fun arrayNoDuplicates!0 (array!63583 (_ BitVec 32) List!21351) Bool)

(assert (=> b!1010246 (= res!678715 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21348))))

(declare-fun b!1010247 () Bool)

(declare-fun res!678713 () Bool)

(assert (=> b!1010247 (=> (not res!678713) (not e!568329))))

(assert (=> b!1010247 (= res!678713 (not (= lt!446373 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446376 lt!446372 mask!3464))))))

(declare-fun b!1010248 () Bool)

(assert (=> b!1010248 (= e!568330 e!568328)))

(declare-fun res!678716 () Bool)

(assert (=> b!1010248 (=> (not res!678716) (not e!568328))))

(declare-fun lt!446377 () SeekEntryResult!9566)

(assert (=> b!1010248 (= res!678716 (or (= lt!446377 (MissingVacant!9566 i!1194)) (= lt!446377 (MissingZero!9566 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63583 (_ BitVec 32)) SeekEntryResult!9566)

(assert (=> b!1010248 (= lt!446377 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1010249 () Bool)

(declare-fun res!678719 () Bool)

(assert (=> b!1010249 (=> (not res!678719) (not e!568328))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1010249 (= res!678719 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31113 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31113 a!3219))))))

(declare-fun b!1010250 () Bool)

(declare-fun res!678717 () Bool)

(assert (=> b!1010250 (=> (not res!678717) (not e!568330))))

(declare-fun arrayContainsKey!0 (array!63583 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1010250 (= res!678717 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1010251 () Bool)

(declare-fun res!678707 () Bool)

(assert (=> b!1010251 (=> (not res!678707) (not e!568330))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1010251 (= res!678707 (validKeyInArray!0 k0!2224))))

(declare-fun b!1010252 () Bool)

(assert (=> b!1010252 (= e!568328 e!568326)))

(declare-fun res!678710 () Bool)

(assert (=> b!1010252 (=> (not res!678710) (not e!568326))))

(assert (=> b!1010252 (= res!678710 (= lt!446371 lt!446374))))

(assert (=> b!1010252 (= lt!446374 (Intermediate!9566 false resIndex!38 resX!38))))

(assert (=> b!1010252 (= lt!446371 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30609 a!3219) j!170) mask!3464) (select (arr!30609 a!3219) j!170) a!3219 mask!3464))))

(declare-fun e!568331 () Bool)

(declare-fun b!1010253 () Bool)

(declare-fun lt!446375 () (_ BitVec 32))

(assert (=> b!1010253 (= e!568331 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!446375 (select (arr!30609 a!3219) j!170) a!3219 mask!3464) lt!446374)))))

(declare-fun b!1010254 () Bool)

(declare-fun res!678705 () Bool)

(assert (=> b!1010254 (=> (not res!678705) (not e!568328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63583 (_ BitVec 32)) Bool)

(assert (=> b!1010254 (= res!678705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1010255 () Bool)

(declare-fun res!678711 () Bool)

(assert (=> b!1010255 (=> (not res!678711) (not e!568329))))

(assert (=> b!1010255 (= res!678711 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1010256 () Bool)

(declare-fun res!678714 () Bool)

(assert (=> b!1010256 (=> (not res!678714) (not e!568330))))

(assert (=> b!1010256 (= res!678714 (validKeyInArray!0 (select (arr!30609 a!3219) j!170)))))

(declare-fun b!1010257 () Bool)

(assert (=> b!1010257 (= e!568329 e!568331)))

(declare-fun res!678706 () Bool)

(assert (=> b!1010257 (=> (not res!678706) (not e!568331))))

(assert (=> b!1010257 (= res!678706 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!446375 #b00000000000000000000000000000000) (bvslt lt!446375 (size!31113 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010257 (= lt!446375 (nextIndex!0 index!1507 x!1245 mask!3464))))

(assert (= (and start!87126 res!678712) b!1010244))

(assert (= (and b!1010244 res!678718) b!1010256))

(assert (= (and b!1010256 res!678714) b!1010251))

(assert (= (and b!1010251 res!678707) b!1010250))

(assert (= (and b!1010250 res!678717) b!1010248))

(assert (= (and b!1010248 res!678716) b!1010254))

(assert (= (and b!1010254 res!678705) b!1010246))

(assert (= (and b!1010246 res!678715) b!1010249))

(assert (= (and b!1010249 res!678719) b!1010252))

(assert (= (and b!1010252 res!678710) b!1010243))

(assert (= (and b!1010243 res!678709) b!1010245))

(assert (= (and b!1010245 res!678708) b!1010247))

(assert (= (and b!1010247 res!678713) b!1010255))

(assert (= (and b!1010255 res!678711) b!1010257))

(assert (= (and b!1010257 res!678706) b!1010253))

(declare-fun m!934069 () Bool)

(assert (=> b!1010245 m!934069))

(assert (=> b!1010245 m!934069))

(declare-fun m!934071 () Bool)

(assert (=> b!1010245 m!934071))

(declare-fun m!934073 () Bool)

(assert (=> b!1010245 m!934073))

(declare-fun m!934075 () Bool)

(assert (=> b!1010245 m!934075))

(declare-fun m!934077 () Bool)

(assert (=> b!1010247 m!934077))

(declare-fun m!934079 () Bool)

(assert (=> b!1010248 m!934079))

(declare-fun m!934081 () Bool)

(assert (=> b!1010256 m!934081))

(assert (=> b!1010256 m!934081))

(declare-fun m!934083 () Bool)

(assert (=> b!1010256 m!934083))

(declare-fun m!934085 () Bool)

(assert (=> b!1010257 m!934085))

(assert (=> b!1010252 m!934081))

(assert (=> b!1010252 m!934081))

(declare-fun m!934087 () Bool)

(assert (=> b!1010252 m!934087))

(assert (=> b!1010252 m!934087))

(assert (=> b!1010252 m!934081))

(declare-fun m!934089 () Bool)

(assert (=> b!1010252 m!934089))

(declare-fun m!934091 () Bool)

(assert (=> start!87126 m!934091))

(declare-fun m!934093 () Bool)

(assert (=> start!87126 m!934093))

(assert (=> b!1010243 m!934081))

(assert (=> b!1010243 m!934081))

(declare-fun m!934095 () Bool)

(assert (=> b!1010243 m!934095))

(declare-fun m!934097 () Bool)

(assert (=> b!1010250 m!934097))

(declare-fun m!934099 () Bool)

(assert (=> b!1010246 m!934099))

(declare-fun m!934101 () Bool)

(assert (=> b!1010254 m!934101))

(assert (=> b!1010253 m!934081))

(assert (=> b!1010253 m!934081))

(declare-fun m!934103 () Bool)

(assert (=> b!1010253 m!934103))

(declare-fun m!934105 () Bool)

(assert (=> b!1010251 m!934105))

(check-sat (not b!1010256) (not b!1010248) (not b!1010257) (not b!1010243) (not b!1010250) (not b!1010246) (not b!1010254) (not b!1010252) (not b!1010247) (not b!1010251) (not b!1010253) (not start!87126) (not b!1010245))
(check-sat)
(get-model)

(declare-fun d!119847 () Bool)

(declare-fun lt!446426 () SeekEntryResult!9566)

(get-info :version)

(assert (=> d!119847 (and (or ((_ is Undefined!9566) lt!446426) (not ((_ is Found!9566) lt!446426)) (and (bvsge (index!40636 lt!446426) #b00000000000000000000000000000000) (bvslt (index!40636 lt!446426) (size!31113 a!3219)))) (or ((_ is Undefined!9566) lt!446426) ((_ is Found!9566) lt!446426) (not ((_ is MissingZero!9566) lt!446426)) (and (bvsge (index!40635 lt!446426) #b00000000000000000000000000000000) (bvslt (index!40635 lt!446426) (size!31113 a!3219)))) (or ((_ is Undefined!9566) lt!446426) ((_ is Found!9566) lt!446426) ((_ is MissingZero!9566) lt!446426) (not ((_ is MissingVacant!9566) lt!446426)) (and (bvsge (index!40638 lt!446426) #b00000000000000000000000000000000) (bvslt (index!40638 lt!446426) (size!31113 a!3219)))) (or ((_ is Undefined!9566) lt!446426) (ite ((_ is Found!9566) lt!446426) (= (select (arr!30609 a!3219) (index!40636 lt!446426)) k0!2224) (ite ((_ is MissingZero!9566) lt!446426) (= (select (arr!30609 a!3219) (index!40635 lt!446426)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9566) lt!446426) (= (select (arr!30609 a!3219) (index!40638 lt!446426)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!568380 () SeekEntryResult!9566)

(assert (=> d!119847 (= lt!446426 e!568380)))

(declare-fun c!101937 () Bool)

(declare-fun lt!446427 () SeekEntryResult!9566)

(assert (=> d!119847 (= c!101937 (and ((_ is Intermediate!9566) lt!446427) (undefined!10378 lt!446427)))))

(assert (=> d!119847 (= lt!446427 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!119847 (validMask!0 mask!3464)))

(assert (=> d!119847 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!446426)))

(declare-fun e!568382 () SeekEntryResult!9566)

(declare-fun b!1010360 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63583 (_ BitVec 32)) SeekEntryResult!9566)

(assert (=> b!1010360 (= e!568382 (seekKeyOrZeroReturnVacant!0 (x!88055 lt!446427) (index!40637 lt!446427) (index!40637 lt!446427) k0!2224 a!3219 mask!3464))))

(declare-fun b!1010361 () Bool)

(assert (=> b!1010361 (= e!568380 Undefined!9566)))

(declare-fun b!1010362 () Bool)

(assert (=> b!1010362 (= e!568382 (MissingZero!9566 (index!40637 lt!446427)))))

(declare-fun b!1010363 () Bool)

(declare-fun e!568381 () SeekEntryResult!9566)

(assert (=> b!1010363 (= e!568381 (Found!9566 (index!40637 lt!446427)))))

(declare-fun b!1010364 () Bool)

(assert (=> b!1010364 (= e!568380 e!568381)))

(declare-fun lt!446428 () (_ BitVec 64))

(assert (=> b!1010364 (= lt!446428 (select (arr!30609 a!3219) (index!40637 lt!446427)))))

(declare-fun c!101936 () Bool)

(assert (=> b!1010364 (= c!101936 (= lt!446428 k0!2224))))

(declare-fun b!1010365 () Bool)

(declare-fun c!101938 () Bool)

(assert (=> b!1010365 (= c!101938 (= lt!446428 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1010365 (= e!568381 e!568382)))

(assert (= (and d!119847 c!101937) b!1010361))

(assert (= (and d!119847 (not c!101937)) b!1010364))

(assert (= (and b!1010364 c!101936) b!1010363))

(assert (= (and b!1010364 (not c!101936)) b!1010365))

(assert (= (and b!1010365 c!101938) b!1010362))

(assert (= (and b!1010365 (not c!101938)) b!1010360))

(assert (=> d!119847 m!934091))

(declare-fun m!934183 () Bool)

(assert (=> d!119847 m!934183))

(declare-fun m!934185 () Bool)

(assert (=> d!119847 m!934185))

(declare-fun m!934187 () Bool)

(assert (=> d!119847 m!934187))

(assert (=> d!119847 m!934185))

(declare-fun m!934189 () Bool)

(assert (=> d!119847 m!934189))

(declare-fun m!934191 () Bool)

(assert (=> d!119847 m!934191))

(declare-fun m!934193 () Bool)

(assert (=> b!1010360 m!934193))

(declare-fun m!934195 () Bool)

(assert (=> b!1010364 m!934195))

(assert (=> b!1010248 d!119847))

(declare-fun b!1010384 () Bool)

(declare-fun e!568394 () SeekEntryResult!9566)

(assert (=> b!1010384 (= e!568394 (Intermediate!9566 true index!1507 x!1245))))

(declare-fun b!1010385 () Bool)

(declare-fun lt!446434 () SeekEntryResult!9566)

(assert (=> b!1010385 (and (bvsge (index!40637 lt!446434) #b00000000000000000000000000000000) (bvslt (index!40637 lt!446434) (size!31113 lt!446372)))))

(declare-fun res!678818 () Bool)

(assert (=> b!1010385 (= res!678818 (= (select (arr!30609 lt!446372) (index!40637 lt!446434)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!568393 () Bool)

(assert (=> b!1010385 (=> res!678818 e!568393)))

(declare-fun b!1010386 () Bool)

(declare-fun e!568397 () Bool)

(declare-fun e!568396 () Bool)

(assert (=> b!1010386 (= e!568397 e!568396)))

(declare-fun res!678816 () Bool)

(assert (=> b!1010386 (= res!678816 (and ((_ is Intermediate!9566) lt!446434) (not (undefined!10378 lt!446434)) (bvslt (x!88055 lt!446434) #b01111111111111111111111111111110) (bvsge (x!88055 lt!446434) #b00000000000000000000000000000000) (bvsge (x!88055 lt!446434) x!1245)))))

(assert (=> b!1010386 (=> (not res!678816) (not e!568396))))

(declare-fun d!119849 () Bool)

(assert (=> d!119849 e!568397))

(declare-fun c!101946 () Bool)

(assert (=> d!119849 (= c!101946 (and ((_ is Intermediate!9566) lt!446434) (undefined!10378 lt!446434)))))

(assert (=> d!119849 (= lt!446434 e!568394)))

(declare-fun c!101945 () Bool)

(assert (=> d!119849 (= c!101945 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!446433 () (_ BitVec 64))

(assert (=> d!119849 (= lt!446433 (select (arr!30609 lt!446372) index!1507))))

(assert (=> d!119849 (validMask!0 mask!3464)))

(assert (=> d!119849 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446376 lt!446372 mask!3464) lt!446434)))

(declare-fun b!1010387 () Bool)

(declare-fun e!568395 () SeekEntryResult!9566)

(assert (=> b!1010387 (= e!568395 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) lt!446376 lt!446372 mask!3464))))

(declare-fun b!1010388 () Bool)

(assert (=> b!1010388 (= e!568395 (Intermediate!9566 false index!1507 x!1245))))

(declare-fun b!1010389 () Bool)

(assert (=> b!1010389 (and (bvsge (index!40637 lt!446434) #b00000000000000000000000000000000) (bvslt (index!40637 lt!446434) (size!31113 lt!446372)))))

(assert (=> b!1010389 (= e!568393 (= (select (arr!30609 lt!446372) (index!40637 lt!446434)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1010390 () Bool)

(assert (=> b!1010390 (= e!568397 (bvsge (x!88055 lt!446434) #b01111111111111111111111111111110))))

(declare-fun b!1010391 () Bool)

(assert (=> b!1010391 (= e!568394 e!568395)))

(declare-fun c!101947 () Bool)

(assert (=> b!1010391 (= c!101947 (or (= lt!446433 lt!446376) (= (bvadd lt!446433 lt!446433) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1010392 () Bool)

(assert (=> b!1010392 (and (bvsge (index!40637 lt!446434) #b00000000000000000000000000000000) (bvslt (index!40637 lt!446434) (size!31113 lt!446372)))))

(declare-fun res!678817 () Bool)

(assert (=> b!1010392 (= res!678817 (= (select (arr!30609 lt!446372) (index!40637 lt!446434)) lt!446376))))

(assert (=> b!1010392 (=> res!678817 e!568393)))

(assert (=> b!1010392 (= e!568396 e!568393)))

(assert (= (and d!119849 c!101945) b!1010384))

(assert (= (and d!119849 (not c!101945)) b!1010391))

(assert (= (and b!1010391 c!101947) b!1010388))

(assert (= (and b!1010391 (not c!101947)) b!1010387))

(assert (= (and d!119849 c!101946) b!1010390))

(assert (= (and d!119849 (not c!101946)) b!1010386))

(assert (= (and b!1010386 res!678816) b!1010392))

(assert (= (and b!1010392 (not res!678817)) b!1010385))

(assert (= (and b!1010385 (not res!678818)) b!1010389))

(declare-fun m!934197 () Bool)

(assert (=> b!1010389 m!934197))

(assert (=> b!1010385 m!934197))

(assert (=> b!1010392 m!934197))

(assert (=> b!1010387 m!934085))

(assert (=> b!1010387 m!934085))

(declare-fun m!934199 () Bool)

(assert (=> b!1010387 m!934199))

(declare-fun m!934201 () Bool)

(assert (=> d!119849 m!934201))

(assert (=> d!119849 m!934091))

(assert (=> b!1010247 d!119849))

(declare-fun d!119853 () Bool)

(declare-fun lt!446437 () (_ BitVec 32))

(assert (=> d!119853 (and (bvsge lt!446437 #b00000000000000000000000000000000) (bvslt lt!446437 (bvadd mask!3464 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!119853 (= lt!446437 (choose!52 index!1507 x!1245 mask!3464))))

(assert (=> d!119853 (validMask!0 mask!3464)))

(assert (=> d!119853 (= (nextIndex!0 index!1507 x!1245 mask!3464) lt!446437)))

(declare-fun bs!28696 () Bool)

(assert (= bs!28696 d!119853))

(declare-fun m!934203 () Bool)

(assert (=> bs!28696 m!934203))

(assert (=> bs!28696 m!934091))

(assert (=> b!1010257 d!119853))

(declare-fun b!1010403 () Bool)

(declare-fun e!568408 () Bool)

(declare-fun e!568406 () Bool)

(assert (=> b!1010403 (= e!568408 e!568406)))

(declare-fun c!101950 () Bool)

(assert (=> b!1010403 (= c!101950 (validKeyInArray!0 (select (arr!30609 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1010404 () Bool)

(declare-fun e!568409 () Bool)

(declare-fun contains!5866 (List!21351 (_ BitVec 64)) Bool)

(assert (=> b!1010404 (= e!568409 (contains!5866 Nil!21348 (select (arr!30609 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!119857 () Bool)

(declare-fun res!678825 () Bool)

(declare-fun e!568407 () Bool)

(assert (=> d!119857 (=> res!678825 e!568407)))

(assert (=> d!119857 (= res!678825 (bvsge #b00000000000000000000000000000000 (size!31113 a!3219)))))

(assert (=> d!119857 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21348) e!568407)))

(declare-fun bm!42382 () Bool)

(declare-fun call!42385 () Bool)

(assert (=> bm!42382 (= call!42385 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101950 (Cons!21347 (select (arr!30609 a!3219) #b00000000000000000000000000000000) Nil!21348) Nil!21348)))))

(declare-fun b!1010405 () Bool)

(assert (=> b!1010405 (= e!568406 call!42385)))

(declare-fun b!1010406 () Bool)

(assert (=> b!1010406 (= e!568406 call!42385)))

(declare-fun b!1010407 () Bool)

(assert (=> b!1010407 (= e!568407 e!568408)))

(declare-fun res!678826 () Bool)

(assert (=> b!1010407 (=> (not res!678826) (not e!568408))))

(assert (=> b!1010407 (= res!678826 (not e!568409))))

(declare-fun res!678827 () Bool)

(assert (=> b!1010407 (=> (not res!678827) (not e!568409))))

(assert (=> b!1010407 (= res!678827 (validKeyInArray!0 (select (arr!30609 a!3219) #b00000000000000000000000000000000)))))

(assert (= (and d!119857 (not res!678825)) b!1010407))

(assert (= (and b!1010407 res!678827) b!1010404))

(assert (= (and b!1010407 res!678826) b!1010403))

(assert (= (and b!1010403 c!101950) b!1010406))

(assert (= (and b!1010403 (not c!101950)) b!1010405))

(assert (= (or b!1010406 b!1010405) bm!42382))

(declare-fun m!934205 () Bool)

(assert (=> b!1010403 m!934205))

(assert (=> b!1010403 m!934205))

(declare-fun m!934207 () Bool)

(assert (=> b!1010403 m!934207))

(assert (=> b!1010404 m!934205))

(assert (=> b!1010404 m!934205))

(declare-fun m!934209 () Bool)

(assert (=> b!1010404 m!934209))

(assert (=> bm!42382 m!934205))

(declare-fun m!934211 () Bool)

(assert (=> bm!42382 m!934211))

(assert (=> b!1010407 m!934205))

(assert (=> b!1010407 m!934205))

(assert (=> b!1010407 m!934207))

(assert (=> b!1010246 d!119857))

(declare-fun d!119859 () Bool)

(declare-fun res!678832 () Bool)

(declare-fun e!568414 () Bool)

(assert (=> d!119859 (=> res!678832 e!568414)))

(assert (=> d!119859 (= res!678832 (= (select (arr!30609 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!119859 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!568414)))

(declare-fun b!1010412 () Bool)

(declare-fun e!568415 () Bool)

(assert (=> b!1010412 (= e!568414 e!568415)))

(declare-fun res!678833 () Bool)

(assert (=> b!1010412 (=> (not res!678833) (not e!568415))))

(assert (=> b!1010412 (= res!678833 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31113 a!3219)))))

(declare-fun b!1010413 () Bool)

(assert (=> b!1010413 (= e!568415 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119859 (not res!678832)) b!1010412))

(assert (= (and b!1010412 res!678833) b!1010413))

(assert (=> d!119859 m!934205))

(declare-fun m!934213 () Bool)

(assert (=> b!1010413 m!934213))

(assert (=> b!1010250 d!119859))

(declare-fun b!1010414 () Bool)

(declare-fun e!568417 () SeekEntryResult!9566)

(assert (=> b!1010414 (= e!568417 (Intermediate!9566 true lt!446375 (bvadd #b00000000000000000000000000000001 x!1245)))))

(declare-fun b!1010415 () Bool)

(declare-fun lt!446439 () SeekEntryResult!9566)

(assert (=> b!1010415 (and (bvsge (index!40637 lt!446439) #b00000000000000000000000000000000) (bvslt (index!40637 lt!446439) (size!31113 a!3219)))))

(declare-fun res!678836 () Bool)

(assert (=> b!1010415 (= res!678836 (= (select (arr!30609 a!3219) (index!40637 lt!446439)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!568416 () Bool)

(assert (=> b!1010415 (=> res!678836 e!568416)))

(declare-fun b!1010416 () Bool)

(declare-fun e!568420 () Bool)

(declare-fun e!568419 () Bool)

(assert (=> b!1010416 (= e!568420 e!568419)))

(declare-fun res!678834 () Bool)

(assert (=> b!1010416 (= res!678834 (and ((_ is Intermediate!9566) lt!446439) (not (undefined!10378 lt!446439)) (bvslt (x!88055 lt!446439) #b01111111111111111111111111111110) (bvsge (x!88055 lt!446439) #b00000000000000000000000000000000) (bvsge (x!88055 lt!446439) (bvadd #b00000000000000000000000000000001 x!1245))))))

(assert (=> b!1010416 (=> (not res!678834) (not e!568419))))

(declare-fun d!119861 () Bool)

(assert (=> d!119861 e!568420))

(declare-fun c!101952 () Bool)

(assert (=> d!119861 (= c!101952 (and ((_ is Intermediate!9566) lt!446439) (undefined!10378 lt!446439)))))

(assert (=> d!119861 (= lt!446439 e!568417)))

(declare-fun c!101951 () Bool)

(assert (=> d!119861 (= c!101951 (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b01111111111111111111111111111110))))

(declare-fun lt!446438 () (_ BitVec 64))

(assert (=> d!119861 (= lt!446438 (select (arr!30609 a!3219) lt!446375))))

(assert (=> d!119861 (validMask!0 mask!3464)))

(assert (=> d!119861 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!446375 (select (arr!30609 a!3219) j!170) a!3219 mask!3464) lt!446439)))

(declare-fun e!568418 () SeekEntryResult!9566)

(declare-fun b!1010417 () Bool)

(assert (=> b!1010417 (= e!568418 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245 #b00000000000000000000000000000001) (nextIndex!0 lt!446375 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464) (select (arr!30609 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010418 () Bool)

(assert (=> b!1010418 (= e!568418 (Intermediate!9566 false lt!446375 (bvadd #b00000000000000000000000000000001 x!1245)))))

(declare-fun b!1010419 () Bool)

(assert (=> b!1010419 (and (bvsge (index!40637 lt!446439) #b00000000000000000000000000000000) (bvslt (index!40637 lt!446439) (size!31113 a!3219)))))

(assert (=> b!1010419 (= e!568416 (= (select (arr!30609 a!3219) (index!40637 lt!446439)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1010420 () Bool)

(assert (=> b!1010420 (= e!568420 (bvsge (x!88055 lt!446439) #b01111111111111111111111111111110))))

(declare-fun b!1010421 () Bool)

(assert (=> b!1010421 (= e!568417 e!568418)))

(declare-fun c!101953 () Bool)

(assert (=> b!1010421 (= c!101953 (or (= lt!446438 (select (arr!30609 a!3219) j!170)) (= (bvadd lt!446438 lt!446438) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1010422 () Bool)

(assert (=> b!1010422 (and (bvsge (index!40637 lt!446439) #b00000000000000000000000000000000) (bvslt (index!40637 lt!446439) (size!31113 a!3219)))))

(declare-fun res!678835 () Bool)

(assert (=> b!1010422 (= res!678835 (= (select (arr!30609 a!3219) (index!40637 lt!446439)) (select (arr!30609 a!3219) j!170)))))

(assert (=> b!1010422 (=> res!678835 e!568416)))

(assert (=> b!1010422 (= e!568419 e!568416)))

(assert (= (and d!119861 c!101951) b!1010414))

(assert (= (and d!119861 (not c!101951)) b!1010421))

(assert (= (and b!1010421 c!101953) b!1010418))

(assert (= (and b!1010421 (not c!101953)) b!1010417))

(assert (= (and d!119861 c!101952) b!1010420))

(assert (= (and d!119861 (not c!101952)) b!1010416))

(assert (= (and b!1010416 res!678834) b!1010422))

(assert (= (and b!1010422 (not res!678835)) b!1010415))

(assert (= (and b!1010415 (not res!678836)) b!1010419))

(declare-fun m!934215 () Bool)

(assert (=> b!1010419 m!934215))

(assert (=> b!1010415 m!934215))

(assert (=> b!1010422 m!934215))

(declare-fun m!934217 () Bool)

(assert (=> b!1010417 m!934217))

(assert (=> b!1010417 m!934217))

(assert (=> b!1010417 m!934081))

(declare-fun m!934219 () Bool)

(assert (=> b!1010417 m!934219))

(declare-fun m!934221 () Bool)

(assert (=> d!119861 m!934221))

(assert (=> d!119861 m!934091))

(assert (=> b!1010253 d!119861))

(declare-fun d!119863 () Bool)

(assert (=> d!119863 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!87126 d!119863))

(declare-fun d!119871 () Bool)

(assert (=> d!119871 (= (array_inv!23752 a!3219) (bvsge (size!31113 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!87126 d!119871))

(declare-fun e!568462 () SeekEntryResult!9566)

(declare-fun b!1010495 () Bool)

(assert (=> b!1010495 (= e!568462 (Intermediate!9566 true (toIndex!0 (select (arr!30609 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1010496 () Bool)

(declare-fun lt!446457 () SeekEntryResult!9566)

(assert (=> b!1010496 (and (bvsge (index!40637 lt!446457) #b00000000000000000000000000000000) (bvslt (index!40637 lt!446457) (size!31113 a!3219)))))

(declare-fun res!678864 () Bool)

(assert (=> b!1010496 (= res!678864 (= (select (arr!30609 a!3219) (index!40637 lt!446457)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!568461 () Bool)

(assert (=> b!1010496 (=> res!678864 e!568461)))

(declare-fun b!1010497 () Bool)

(declare-fun e!568465 () Bool)

(declare-fun e!568464 () Bool)

(assert (=> b!1010497 (= e!568465 e!568464)))

(declare-fun res!678862 () Bool)

(assert (=> b!1010497 (= res!678862 (and ((_ is Intermediate!9566) lt!446457) (not (undefined!10378 lt!446457)) (bvslt (x!88055 lt!446457) #b01111111111111111111111111111110) (bvsge (x!88055 lt!446457) #b00000000000000000000000000000000) (bvsge (x!88055 lt!446457) #b00000000000000000000000000000000)))))

(assert (=> b!1010497 (=> (not res!678862) (not e!568464))))

(declare-fun d!119875 () Bool)

(assert (=> d!119875 e!568465))

(declare-fun c!101979 () Bool)

(assert (=> d!119875 (= c!101979 (and ((_ is Intermediate!9566) lt!446457) (undefined!10378 lt!446457)))))

(assert (=> d!119875 (= lt!446457 e!568462)))

(declare-fun c!101978 () Bool)

(assert (=> d!119875 (= c!101978 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!446456 () (_ BitVec 64))

(assert (=> d!119875 (= lt!446456 (select (arr!30609 a!3219) (toIndex!0 (select (arr!30609 a!3219) j!170) mask!3464)))))

(assert (=> d!119875 (validMask!0 mask!3464)))

(assert (=> d!119875 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30609 a!3219) j!170) mask!3464) (select (arr!30609 a!3219) j!170) a!3219 mask!3464) lt!446457)))

(declare-fun b!1010498 () Bool)

(declare-fun e!568463 () SeekEntryResult!9566)

(assert (=> b!1010498 (= e!568463 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30609 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30609 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010499 () Bool)

(assert (=> b!1010499 (= e!568463 (Intermediate!9566 false (toIndex!0 (select (arr!30609 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1010500 () Bool)

(assert (=> b!1010500 (and (bvsge (index!40637 lt!446457) #b00000000000000000000000000000000) (bvslt (index!40637 lt!446457) (size!31113 a!3219)))))

(assert (=> b!1010500 (= e!568461 (= (select (arr!30609 a!3219) (index!40637 lt!446457)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1010501 () Bool)

(assert (=> b!1010501 (= e!568465 (bvsge (x!88055 lt!446457) #b01111111111111111111111111111110))))

(declare-fun b!1010502 () Bool)

(assert (=> b!1010502 (= e!568462 e!568463)))

(declare-fun c!101980 () Bool)

(assert (=> b!1010502 (= c!101980 (or (= lt!446456 (select (arr!30609 a!3219) j!170)) (= (bvadd lt!446456 lt!446456) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1010503 () Bool)

(assert (=> b!1010503 (and (bvsge (index!40637 lt!446457) #b00000000000000000000000000000000) (bvslt (index!40637 lt!446457) (size!31113 a!3219)))))

(declare-fun res!678863 () Bool)

(assert (=> b!1010503 (= res!678863 (= (select (arr!30609 a!3219) (index!40637 lt!446457)) (select (arr!30609 a!3219) j!170)))))

(assert (=> b!1010503 (=> res!678863 e!568461)))

(assert (=> b!1010503 (= e!568464 e!568461)))

(assert (= (and d!119875 c!101978) b!1010495))

(assert (= (and d!119875 (not c!101978)) b!1010502))

(assert (= (and b!1010502 c!101980) b!1010499))

(assert (= (and b!1010502 (not c!101980)) b!1010498))

(assert (= (and d!119875 c!101979) b!1010501))

(assert (= (and d!119875 (not c!101979)) b!1010497))

(assert (= (and b!1010497 res!678862) b!1010503))

(assert (= (and b!1010503 (not res!678863)) b!1010496))

(assert (= (and b!1010496 (not res!678864)) b!1010500))

(declare-fun m!934249 () Bool)

(assert (=> b!1010500 m!934249))

(assert (=> b!1010496 m!934249))

(assert (=> b!1010503 m!934249))

(assert (=> b!1010498 m!934087))

(declare-fun m!934253 () Bool)

(assert (=> b!1010498 m!934253))

(assert (=> b!1010498 m!934253))

(assert (=> b!1010498 m!934081))

(declare-fun m!934255 () Bool)

(assert (=> b!1010498 m!934255))

(assert (=> d!119875 m!934087))

(declare-fun m!934257 () Bool)

(assert (=> d!119875 m!934257))

(assert (=> d!119875 m!934091))

(assert (=> b!1010252 d!119875))

(declare-fun d!119879 () Bool)

(declare-fun lt!446475 () (_ BitVec 32))

(declare-fun lt!446474 () (_ BitVec 32))

(assert (=> d!119879 (= lt!446475 (bvmul (bvxor lt!446474 (bvlshr lt!446474 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119879 (= lt!446474 ((_ extract 31 0) (bvand (bvxor (select (arr!30609 a!3219) j!170) (bvlshr (select (arr!30609 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119879 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!678866 (let ((h!22544 ((_ extract 31 0) (bvand (bvxor (select (arr!30609 a!3219) j!170) (bvlshr (select (arr!30609 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!88064 (bvmul (bvxor h!22544 (bvlshr h!22544 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!88064 (bvlshr x!88064 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!678866 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!678866 #b00000000000000000000000000000000))))))

(assert (=> d!119879 (= (toIndex!0 (select (arr!30609 a!3219) j!170) mask!3464) (bvand (bvxor lt!446475 (bvlshr lt!446475 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1010252 d!119879))

(declare-fun d!119887 () Bool)

(assert (=> d!119887 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1010251 d!119887))

(declare-fun b!1010504 () Bool)

(declare-fun e!568467 () SeekEntryResult!9566)

(assert (=> b!1010504 (= e!568467 (Intermediate!9566 true (toIndex!0 lt!446376 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1010505 () Bool)

(declare-fun lt!446477 () SeekEntryResult!9566)

(assert (=> b!1010505 (and (bvsge (index!40637 lt!446477) #b00000000000000000000000000000000) (bvslt (index!40637 lt!446477) (size!31113 lt!446372)))))

(declare-fun res!678869 () Bool)

(assert (=> b!1010505 (= res!678869 (= (select (arr!30609 lt!446372) (index!40637 lt!446477)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!568466 () Bool)

(assert (=> b!1010505 (=> res!678869 e!568466)))

(declare-fun b!1010506 () Bool)

(declare-fun e!568470 () Bool)

(declare-fun e!568469 () Bool)

(assert (=> b!1010506 (= e!568470 e!568469)))

(declare-fun res!678867 () Bool)

(assert (=> b!1010506 (= res!678867 (and ((_ is Intermediate!9566) lt!446477) (not (undefined!10378 lt!446477)) (bvslt (x!88055 lt!446477) #b01111111111111111111111111111110) (bvsge (x!88055 lt!446477) #b00000000000000000000000000000000) (bvsge (x!88055 lt!446477) #b00000000000000000000000000000000)))))

(assert (=> b!1010506 (=> (not res!678867) (not e!568469))))

(declare-fun d!119889 () Bool)

(assert (=> d!119889 e!568470))

(declare-fun c!101982 () Bool)

(assert (=> d!119889 (= c!101982 (and ((_ is Intermediate!9566) lt!446477) (undefined!10378 lt!446477)))))

(assert (=> d!119889 (= lt!446477 e!568467)))

(declare-fun c!101981 () Bool)

(assert (=> d!119889 (= c!101981 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!446476 () (_ BitVec 64))

(assert (=> d!119889 (= lt!446476 (select (arr!30609 lt!446372) (toIndex!0 lt!446376 mask!3464)))))

(assert (=> d!119889 (validMask!0 mask!3464)))

(assert (=> d!119889 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446376 mask!3464) lt!446376 lt!446372 mask!3464) lt!446477)))

(declare-fun b!1010507 () Bool)

(declare-fun e!568468 () SeekEntryResult!9566)

(assert (=> b!1010507 (= e!568468 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!446376 mask!3464) #b00000000000000000000000000000000 mask!3464) lt!446376 lt!446372 mask!3464))))

(declare-fun b!1010508 () Bool)

(assert (=> b!1010508 (= e!568468 (Intermediate!9566 false (toIndex!0 lt!446376 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1010509 () Bool)

(assert (=> b!1010509 (and (bvsge (index!40637 lt!446477) #b00000000000000000000000000000000) (bvslt (index!40637 lt!446477) (size!31113 lt!446372)))))

(assert (=> b!1010509 (= e!568466 (= (select (arr!30609 lt!446372) (index!40637 lt!446477)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1010510 () Bool)

(assert (=> b!1010510 (= e!568470 (bvsge (x!88055 lt!446477) #b01111111111111111111111111111110))))

(declare-fun b!1010511 () Bool)

(assert (=> b!1010511 (= e!568467 e!568468)))

(declare-fun c!101983 () Bool)

(assert (=> b!1010511 (= c!101983 (or (= lt!446476 lt!446376) (= (bvadd lt!446476 lt!446476) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1010512 () Bool)

(assert (=> b!1010512 (and (bvsge (index!40637 lt!446477) #b00000000000000000000000000000000) (bvslt (index!40637 lt!446477) (size!31113 lt!446372)))))

(declare-fun res!678868 () Bool)

(assert (=> b!1010512 (= res!678868 (= (select (arr!30609 lt!446372) (index!40637 lt!446477)) lt!446376))))

(assert (=> b!1010512 (=> res!678868 e!568466)))

(assert (=> b!1010512 (= e!568469 e!568466)))

(assert (= (and d!119889 c!101981) b!1010504))

(assert (= (and d!119889 (not c!101981)) b!1010511))

(assert (= (and b!1010511 c!101983) b!1010508))

(assert (= (and b!1010511 (not c!101983)) b!1010507))

(assert (= (and d!119889 c!101982) b!1010510))

(assert (= (and d!119889 (not c!101982)) b!1010506))

(assert (= (and b!1010506 res!678867) b!1010512))

(assert (= (and b!1010512 (not res!678868)) b!1010505))

(assert (= (and b!1010505 (not res!678869)) b!1010509))

(declare-fun m!934259 () Bool)

(assert (=> b!1010509 m!934259))

(assert (=> b!1010505 m!934259))

(assert (=> b!1010512 m!934259))

(assert (=> b!1010507 m!934069))

(declare-fun m!934261 () Bool)

(assert (=> b!1010507 m!934261))

(assert (=> b!1010507 m!934261))

(declare-fun m!934263 () Bool)

(assert (=> b!1010507 m!934263))

(assert (=> d!119889 m!934069))

(declare-fun m!934265 () Bool)

(assert (=> d!119889 m!934265))

(assert (=> d!119889 m!934091))

(assert (=> b!1010245 d!119889))

(declare-fun d!119891 () Bool)

(declare-fun lt!446481 () (_ BitVec 32))

(declare-fun lt!446480 () (_ BitVec 32))

(assert (=> d!119891 (= lt!446481 (bvmul (bvxor lt!446480 (bvlshr lt!446480 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119891 (= lt!446480 ((_ extract 31 0) (bvand (bvxor lt!446376 (bvlshr lt!446376 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119891 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!678866 (let ((h!22544 ((_ extract 31 0) (bvand (bvxor lt!446376 (bvlshr lt!446376 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!88064 (bvmul (bvxor h!22544 (bvlshr h!22544 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!88064 (bvlshr x!88064 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!678866 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!678866 #b00000000000000000000000000000000))))))

(assert (=> d!119891 (= (toIndex!0 lt!446376 mask!3464) (bvand (bvxor lt!446481 (bvlshr lt!446481 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1010245 d!119891))

(declare-fun d!119893 () Bool)

(assert (=> d!119893 (= (validKeyInArray!0 (select (arr!30609 a!3219) j!170)) (and (not (= (select (arr!30609 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30609 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1010256 d!119893))

(declare-fun b!1010513 () Bool)

(declare-fun e!568472 () SeekEntryResult!9566)

(assert (=> b!1010513 (= e!568472 (Intermediate!9566 true index!1507 x!1245))))

(declare-fun b!1010514 () Bool)

(declare-fun lt!446484 () SeekEntryResult!9566)

(assert (=> b!1010514 (and (bvsge (index!40637 lt!446484) #b00000000000000000000000000000000) (bvslt (index!40637 lt!446484) (size!31113 a!3219)))))

(declare-fun res!678872 () Bool)

(assert (=> b!1010514 (= res!678872 (= (select (arr!30609 a!3219) (index!40637 lt!446484)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!568471 () Bool)

(assert (=> b!1010514 (=> res!678872 e!568471)))

(declare-fun b!1010515 () Bool)

(declare-fun e!568475 () Bool)

(declare-fun e!568474 () Bool)

(assert (=> b!1010515 (= e!568475 e!568474)))

(declare-fun res!678870 () Bool)

(assert (=> b!1010515 (= res!678870 (and ((_ is Intermediate!9566) lt!446484) (not (undefined!10378 lt!446484)) (bvslt (x!88055 lt!446484) #b01111111111111111111111111111110) (bvsge (x!88055 lt!446484) #b00000000000000000000000000000000) (bvsge (x!88055 lt!446484) x!1245)))))

(assert (=> b!1010515 (=> (not res!678870) (not e!568474))))

(declare-fun d!119895 () Bool)

(assert (=> d!119895 e!568475))

(declare-fun c!101985 () Bool)

(assert (=> d!119895 (= c!101985 (and ((_ is Intermediate!9566) lt!446484) (undefined!10378 lt!446484)))))

(assert (=> d!119895 (= lt!446484 e!568472)))

(declare-fun c!101984 () Bool)

(assert (=> d!119895 (= c!101984 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!446483 () (_ BitVec 64))

(assert (=> d!119895 (= lt!446483 (select (arr!30609 a!3219) index!1507))))

(assert (=> d!119895 (validMask!0 mask!3464)))

(assert (=> d!119895 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30609 a!3219) j!170) a!3219 mask!3464) lt!446484)))

(declare-fun b!1010516 () Bool)

(declare-fun e!568473 () SeekEntryResult!9566)

(assert (=> b!1010516 (= e!568473 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30609 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010517 () Bool)

(assert (=> b!1010517 (= e!568473 (Intermediate!9566 false index!1507 x!1245))))

(declare-fun b!1010518 () Bool)

(assert (=> b!1010518 (and (bvsge (index!40637 lt!446484) #b00000000000000000000000000000000) (bvslt (index!40637 lt!446484) (size!31113 a!3219)))))

(assert (=> b!1010518 (= e!568471 (= (select (arr!30609 a!3219) (index!40637 lt!446484)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1010519 () Bool)

(assert (=> b!1010519 (= e!568475 (bvsge (x!88055 lt!446484) #b01111111111111111111111111111110))))

(declare-fun b!1010520 () Bool)

(assert (=> b!1010520 (= e!568472 e!568473)))

(declare-fun c!101986 () Bool)

(assert (=> b!1010520 (= c!101986 (or (= lt!446483 (select (arr!30609 a!3219) j!170)) (= (bvadd lt!446483 lt!446483) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1010521 () Bool)

(assert (=> b!1010521 (and (bvsge (index!40637 lt!446484) #b00000000000000000000000000000000) (bvslt (index!40637 lt!446484) (size!31113 a!3219)))))

(declare-fun res!678871 () Bool)

(assert (=> b!1010521 (= res!678871 (= (select (arr!30609 a!3219) (index!40637 lt!446484)) (select (arr!30609 a!3219) j!170)))))

(assert (=> b!1010521 (=> res!678871 e!568471)))

(assert (=> b!1010521 (= e!568474 e!568471)))

(assert (= (and d!119895 c!101984) b!1010513))

(assert (= (and d!119895 (not c!101984)) b!1010520))

(assert (= (and b!1010520 c!101986) b!1010517))

(assert (= (and b!1010520 (not c!101986)) b!1010516))

(assert (= (and d!119895 c!101985) b!1010519))

(assert (= (and d!119895 (not c!101985)) b!1010515))

(assert (= (and b!1010515 res!678870) b!1010521))

(assert (= (and b!1010521 (not res!678871)) b!1010514))

(assert (= (and b!1010514 (not res!678872)) b!1010518))

(declare-fun m!934269 () Bool)

(assert (=> b!1010518 m!934269))

(assert (=> b!1010514 m!934269))

(assert (=> b!1010521 m!934269))

(assert (=> b!1010516 m!934085))

(assert (=> b!1010516 m!934085))

(assert (=> b!1010516 m!934081))

(declare-fun m!934275 () Bool)

(assert (=> b!1010516 m!934275))

(declare-fun m!934277 () Bool)

(assert (=> d!119895 m!934277))

(assert (=> d!119895 m!934091))

(assert (=> b!1010243 d!119895))

(declare-fun b!1010547 () Bool)

(declare-fun e!568493 () Bool)

(declare-fun call!42390 () Bool)

(assert (=> b!1010547 (= e!568493 call!42390)))

(declare-fun b!1010548 () Bool)

(declare-fun e!568494 () Bool)

(declare-fun e!568495 () Bool)

(assert (=> b!1010548 (= e!568494 e!568495)))

(declare-fun c!101994 () Bool)

(assert (=> b!1010548 (= c!101994 (validKeyInArray!0 (select (arr!30609 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42387 () Bool)

(assert (=> bm!42387 (= call!42390 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!1010549 () Bool)

(assert (=> b!1010549 (= e!568495 call!42390)))

(declare-fun d!119899 () Bool)

(declare-fun res!678885 () Bool)

(assert (=> d!119899 (=> res!678885 e!568494)))

(assert (=> d!119899 (= res!678885 (bvsge #b00000000000000000000000000000000 (size!31113 a!3219)))))

(assert (=> d!119899 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!568494)))

(declare-fun b!1010550 () Bool)

(assert (=> b!1010550 (= e!568495 e!568493)))

(declare-fun lt!446504 () (_ BitVec 64))

(assert (=> b!1010550 (= lt!446504 (select (arr!30609 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32901 0))(
  ( (Unit!32902) )
))
(declare-fun lt!446506 () Unit!32901)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63583 (_ BitVec 64) (_ BitVec 32)) Unit!32901)

(assert (=> b!1010550 (= lt!446506 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!446504 #b00000000000000000000000000000000))))

(assert (=> b!1010550 (arrayContainsKey!0 a!3219 lt!446504 #b00000000000000000000000000000000)))

(declare-fun lt!446505 () Unit!32901)

(assert (=> b!1010550 (= lt!446505 lt!446506)))

(declare-fun res!678884 () Bool)

(assert (=> b!1010550 (= res!678884 (= (seekEntryOrOpen!0 (select (arr!30609 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9566 #b00000000000000000000000000000000)))))

(assert (=> b!1010550 (=> (not res!678884) (not e!568493))))

(assert (= (and d!119899 (not res!678885)) b!1010548))

(assert (= (and b!1010548 c!101994) b!1010550))

(assert (= (and b!1010548 (not c!101994)) b!1010549))

(assert (= (and b!1010550 res!678884) b!1010547))

(assert (= (or b!1010547 b!1010549) bm!42387))

(assert (=> b!1010548 m!934205))

(assert (=> b!1010548 m!934205))

(assert (=> b!1010548 m!934207))

(declare-fun m!934285 () Bool)

(assert (=> bm!42387 m!934285))

(assert (=> b!1010550 m!934205))

(declare-fun m!934287 () Bool)

(assert (=> b!1010550 m!934287))

(declare-fun m!934289 () Bool)

(assert (=> b!1010550 m!934289))

(assert (=> b!1010550 m!934205))

(declare-fun m!934291 () Bool)

(assert (=> b!1010550 m!934291))

(assert (=> b!1010254 d!119899))

(check-sat (not b!1010417) (not b!1010516) (not b!1010404) (not b!1010548) (not b!1010403) (not b!1010413) (not b!1010360) (not b!1010387) (not d!119889) (not bm!42382) (not b!1010407) (not b!1010550) (not d!119853) (not bm!42387) (not b!1010498) (not d!119861) (not d!119895) (not d!119849) (not d!119875) (not b!1010507) (not d!119847))
(check-sat)
