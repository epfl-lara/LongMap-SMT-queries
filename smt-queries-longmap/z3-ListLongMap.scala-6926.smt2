; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87050 () Bool)

(assert start!87050)

(declare-fun b!1009720 () Bool)

(declare-fun e!568062 () Bool)

(declare-fun e!568060 () Bool)

(assert (=> b!1009720 (= e!568062 e!568060)))

(declare-fun res!678313 () Bool)

(assert (=> b!1009720 (=> (not res!678313) (not e!568060))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9564 0))(
  ( (MissingZero!9564 (index!40627 (_ BitVec 32))) (Found!9564 (index!40628 (_ BitVec 32))) (Intermediate!9564 (undefined!10376 Bool) (index!40629 (_ BitVec 32)) (x!88023 (_ BitVec 32))) (Undefined!9564) (MissingVacant!9564 (index!40630 (_ BitVec 32))) )
))
(declare-fun lt!446282 () SeekEntryResult!9564)

(declare-datatypes ((array!63625 0))(
  ( (array!63626 (arr!30632 (Array (_ BitVec 32) (_ BitVec 64))) (size!31134 (_ BitVec 32))) )
))
(declare-fun lt!446286 () array!63625)

(declare-fun lt!446284 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63625 (_ BitVec 32)) SeekEntryResult!9564)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009720 (= res!678313 (not (= lt!446282 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446284 mask!3464) lt!446284 lt!446286 mask!3464))))))

(declare-fun a!3219 () array!63625)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1009720 (= lt!446284 (select (store (arr!30632 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1009720 (= lt!446286 (array!63626 (store (arr!30632 a!3219) i!1194 k0!2224) (size!31134 a!3219)))))

(declare-fun b!1009721 () Bool)

(declare-fun e!568059 () Bool)

(declare-fun e!568063 () Bool)

(assert (=> b!1009721 (= e!568059 e!568063)))

(declare-fun res!678317 () Bool)

(assert (=> b!1009721 (=> (not res!678317) (not e!568063))))

(declare-fun lt!446281 () SeekEntryResult!9564)

(assert (=> b!1009721 (= res!678317 (or (= lt!446281 (MissingVacant!9564 i!1194)) (= lt!446281 (MissingZero!9564 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63625 (_ BitVec 32)) SeekEntryResult!9564)

(assert (=> b!1009721 (= lt!446281 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1009722 () Bool)

(declare-fun res!678310 () Bool)

(assert (=> b!1009722 (=> (not res!678310) (not e!568063))))

(declare-datatypes ((List!21308 0))(
  ( (Nil!21305) (Cons!21304 (h!22493 (_ BitVec 64)) (t!30309 List!21308)) )
))
(declare-fun arrayNoDuplicates!0 (array!63625 (_ BitVec 32) List!21308) Bool)

(assert (=> b!1009722 (= res!678310 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21305))))

(declare-fun b!1009723 () Bool)

(declare-fun res!678316 () Bool)

(assert (=> b!1009723 (=> (not res!678316) (not e!568060))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!446285 () SeekEntryResult!9564)

(assert (=> b!1009723 (= res!678316 (not (= lt!446285 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446284 lt!446286 mask!3464))))))

(declare-fun b!1009724 () Bool)

(declare-fun res!678309 () Bool)

(assert (=> b!1009724 (=> (not res!678309) (not e!568063))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63625 (_ BitVec 32)) Bool)

(assert (=> b!1009724 (= res!678309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1009725 () Bool)

(declare-fun res!678314 () Bool)

(assert (=> b!1009725 (=> (not res!678314) (not e!568060))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1009725 (= res!678314 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1009726 () Bool)

(declare-fun e!568061 () Bool)

(assert (=> b!1009726 (= e!568063 e!568061)))

(declare-fun res!678312 () Bool)

(assert (=> b!1009726 (=> (not res!678312) (not e!568061))))

(declare-fun lt!446283 () SeekEntryResult!9564)

(assert (=> b!1009726 (= res!678312 (= lt!446282 lt!446283))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1009726 (= lt!446283 (Intermediate!9564 false resIndex!38 resX!38))))

(assert (=> b!1009726 (= lt!446282 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30632 a!3219) j!170) mask!3464) (select (arr!30632 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009727 () Bool)

(declare-fun res!678320 () Bool)

(assert (=> b!1009727 (=> (not res!678320) (not e!568059))))

(declare-fun arrayContainsKey!0 (array!63625 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1009727 (= res!678320 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1009728 () Bool)

(declare-fun res!678315 () Bool)

(assert (=> b!1009728 (=> (not res!678315) (not e!568059))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1009728 (= res!678315 (validKeyInArray!0 k0!2224))))

(declare-fun res!678311 () Bool)

(assert (=> start!87050 (=> (not res!678311) (not e!568059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87050 (= res!678311 (validMask!0 mask!3464))))

(assert (=> start!87050 e!568059))

(declare-fun array_inv!23756 (array!63625) Bool)

(assert (=> start!87050 (array_inv!23756 a!3219)))

(assert (=> start!87050 true))

(declare-fun b!1009729 () Bool)

(declare-fun lt!446280 () (_ BitVec 32))

(assert (=> b!1009729 (= e!568060 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (or (bvslt lt!446280 #b00000000000000000000000000000000) (bvsge lt!446280 (size!31134 a!3219)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009729 (= lt!446280 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1009730 () Bool)

(assert (=> b!1009730 (= e!568061 e!568062)))

(declare-fun res!678321 () Bool)

(assert (=> b!1009730 (=> (not res!678321) (not e!568062))))

(assert (=> b!1009730 (= res!678321 (= lt!446285 lt!446283))))

(assert (=> b!1009730 (= lt!446285 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30632 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009731 () Bool)

(declare-fun res!678308 () Bool)

(assert (=> b!1009731 (=> (not res!678308) (not e!568059))))

(assert (=> b!1009731 (= res!678308 (and (= (size!31134 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31134 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31134 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1009732 () Bool)

(declare-fun res!678318 () Bool)

(assert (=> b!1009732 (=> (not res!678318) (not e!568063))))

(assert (=> b!1009732 (= res!678318 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31134 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31134 a!3219))))))

(declare-fun b!1009733 () Bool)

(declare-fun res!678319 () Bool)

(assert (=> b!1009733 (=> (not res!678319) (not e!568059))))

(assert (=> b!1009733 (= res!678319 (validKeyInArray!0 (select (arr!30632 a!3219) j!170)))))

(assert (= (and start!87050 res!678311) b!1009731))

(assert (= (and b!1009731 res!678308) b!1009733))

(assert (= (and b!1009733 res!678319) b!1009728))

(assert (= (and b!1009728 res!678315) b!1009727))

(assert (= (and b!1009727 res!678320) b!1009721))

(assert (= (and b!1009721 res!678317) b!1009724))

(assert (= (and b!1009724 res!678309) b!1009722))

(assert (= (and b!1009722 res!678310) b!1009732))

(assert (= (and b!1009732 res!678318) b!1009726))

(assert (= (and b!1009726 res!678312) b!1009730))

(assert (= (and b!1009730 res!678321) b!1009720))

(assert (= (and b!1009720 res!678313) b!1009723))

(assert (= (and b!1009723 res!678316) b!1009725))

(assert (= (and b!1009725 res!678314) b!1009729))

(declare-fun m!934233 () Bool)

(assert (=> b!1009721 m!934233))

(declare-fun m!934235 () Bool)

(assert (=> b!1009733 m!934235))

(assert (=> b!1009733 m!934235))

(declare-fun m!934237 () Bool)

(assert (=> b!1009733 m!934237))

(declare-fun m!934239 () Bool)

(assert (=> b!1009724 m!934239))

(declare-fun m!934241 () Bool)

(assert (=> b!1009729 m!934241))

(assert (=> b!1009726 m!934235))

(assert (=> b!1009726 m!934235))

(declare-fun m!934243 () Bool)

(assert (=> b!1009726 m!934243))

(assert (=> b!1009726 m!934243))

(assert (=> b!1009726 m!934235))

(declare-fun m!934245 () Bool)

(assert (=> b!1009726 m!934245))

(declare-fun m!934247 () Bool)

(assert (=> start!87050 m!934247))

(declare-fun m!934249 () Bool)

(assert (=> start!87050 m!934249))

(declare-fun m!934251 () Bool)

(assert (=> b!1009723 m!934251))

(declare-fun m!934253 () Bool)

(assert (=> b!1009720 m!934253))

(assert (=> b!1009720 m!934253))

(declare-fun m!934255 () Bool)

(assert (=> b!1009720 m!934255))

(declare-fun m!934257 () Bool)

(assert (=> b!1009720 m!934257))

(declare-fun m!934259 () Bool)

(assert (=> b!1009720 m!934259))

(declare-fun m!934261 () Bool)

(assert (=> b!1009728 m!934261))

(declare-fun m!934263 () Bool)

(assert (=> b!1009727 m!934263))

(assert (=> b!1009730 m!934235))

(assert (=> b!1009730 m!934235))

(declare-fun m!934265 () Bool)

(assert (=> b!1009730 m!934265))

(declare-fun m!934267 () Bool)

(assert (=> b!1009722 m!934267))

(check-sat (not start!87050) (not b!1009728) (not b!1009729) (not b!1009720) (not b!1009733) (not b!1009721) (not b!1009723) (not b!1009724) (not b!1009727) (not b!1009726) (not b!1009730) (not b!1009722))
(check-sat)
(get-model)

(declare-fun b!1009794 () Bool)

(declare-fun lt!446313 () SeekEntryResult!9564)

(assert (=> b!1009794 (and (bvsge (index!40629 lt!446313) #b00000000000000000000000000000000) (bvslt (index!40629 lt!446313) (size!31134 a!3219)))))

(declare-fun e!568096 () Bool)

(assert (=> b!1009794 (= e!568096 (= (select (arr!30632 a!3219) (index!40629 lt!446313)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1009795 () Bool)

(declare-fun e!568095 () SeekEntryResult!9564)

(declare-fun e!568092 () SeekEntryResult!9564)

(assert (=> b!1009795 (= e!568095 e!568092)))

(declare-fun c!101869 () Bool)

(declare-fun lt!446312 () (_ BitVec 64))

(assert (=> b!1009795 (= c!101869 (or (= lt!446312 (select (arr!30632 a!3219) j!170)) (= (bvadd lt!446312 lt!446312) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!119889 () Bool)

(declare-fun e!568094 () Bool)

(assert (=> d!119889 e!568094))

(declare-fun c!101871 () Bool)

(get-info :version)

(assert (=> d!119889 (= c!101871 (and ((_ is Intermediate!9564) lt!446313) (undefined!10376 lt!446313)))))

(assert (=> d!119889 (= lt!446313 e!568095)))

(declare-fun c!101870 () Bool)

(assert (=> d!119889 (= c!101870 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!119889 (= lt!446312 (select (arr!30632 a!3219) (toIndex!0 (select (arr!30632 a!3219) j!170) mask!3464)))))

(assert (=> d!119889 (validMask!0 mask!3464)))

(assert (=> d!119889 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30632 a!3219) j!170) mask!3464) (select (arr!30632 a!3219) j!170) a!3219 mask!3464) lt!446313)))

(declare-fun b!1009796 () Bool)

(assert (=> b!1009796 (= e!568092 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30632 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30632 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009797 () Bool)

(assert (=> b!1009797 (= e!568092 (Intermediate!9564 false (toIndex!0 (select (arr!30632 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1009798 () Bool)

(assert (=> b!1009798 (and (bvsge (index!40629 lt!446313) #b00000000000000000000000000000000) (bvslt (index!40629 lt!446313) (size!31134 a!3219)))))

(declare-fun res!678371 () Bool)

(assert (=> b!1009798 (= res!678371 (= (select (arr!30632 a!3219) (index!40629 lt!446313)) (select (arr!30632 a!3219) j!170)))))

(assert (=> b!1009798 (=> res!678371 e!568096)))

(declare-fun e!568093 () Bool)

(assert (=> b!1009798 (= e!568093 e!568096)))

(declare-fun b!1009799 () Bool)

(assert (=> b!1009799 (= e!568094 (bvsge (x!88023 lt!446313) #b01111111111111111111111111111110))))

(declare-fun b!1009800 () Bool)

(assert (=> b!1009800 (and (bvsge (index!40629 lt!446313) #b00000000000000000000000000000000) (bvslt (index!40629 lt!446313) (size!31134 a!3219)))))

(declare-fun res!678370 () Bool)

(assert (=> b!1009800 (= res!678370 (= (select (arr!30632 a!3219) (index!40629 lt!446313)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1009800 (=> res!678370 e!568096)))

(declare-fun b!1009801 () Bool)

(assert (=> b!1009801 (= e!568095 (Intermediate!9564 true (toIndex!0 (select (arr!30632 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1009802 () Bool)

(assert (=> b!1009802 (= e!568094 e!568093)))

(declare-fun res!678372 () Bool)

(assert (=> b!1009802 (= res!678372 (and ((_ is Intermediate!9564) lt!446313) (not (undefined!10376 lt!446313)) (bvslt (x!88023 lt!446313) #b01111111111111111111111111111110) (bvsge (x!88023 lt!446313) #b00000000000000000000000000000000) (bvsge (x!88023 lt!446313) #b00000000000000000000000000000000)))))

(assert (=> b!1009802 (=> (not res!678372) (not e!568093))))

(assert (= (and d!119889 c!101870) b!1009801))

(assert (= (and d!119889 (not c!101870)) b!1009795))

(assert (= (and b!1009795 c!101869) b!1009797))

(assert (= (and b!1009795 (not c!101869)) b!1009796))

(assert (= (and d!119889 c!101871) b!1009799))

(assert (= (and d!119889 (not c!101871)) b!1009802))

(assert (= (and b!1009802 res!678372) b!1009798))

(assert (= (and b!1009798 (not res!678371)) b!1009800))

(assert (= (and b!1009800 (not res!678370)) b!1009794))

(assert (=> d!119889 m!934243))

(declare-fun m!934305 () Bool)

(assert (=> d!119889 m!934305))

(assert (=> d!119889 m!934247))

(declare-fun m!934307 () Bool)

(assert (=> b!1009800 m!934307))

(assert (=> b!1009798 m!934307))

(assert (=> b!1009796 m!934243))

(declare-fun m!934309 () Bool)

(assert (=> b!1009796 m!934309))

(assert (=> b!1009796 m!934309))

(assert (=> b!1009796 m!934235))

(declare-fun m!934311 () Bool)

(assert (=> b!1009796 m!934311))

(assert (=> b!1009794 m!934307))

(assert (=> b!1009726 d!119889))

(declare-fun d!119891 () Bool)

(declare-fun lt!446319 () (_ BitVec 32))

(declare-fun lt!446318 () (_ BitVec 32))

(assert (=> d!119891 (= lt!446319 (bvmul (bvxor lt!446318 (bvlshr lt!446318 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119891 (= lt!446318 ((_ extract 31 0) (bvand (bvxor (select (arr!30632 a!3219) j!170) (bvlshr (select (arr!30632 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119891 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!678373 (let ((h!22495 ((_ extract 31 0) (bvand (bvxor (select (arr!30632 a!3219) j!170) (bvlshr (select (arr!30632 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!88026 (bvmul (bvxor h!22495 (bvlshr h!22495 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!88026 (bvlshr x!88026 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!678373 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!678373 #b00000000000000000000000000000000))))))

(assert (=> d!119891 (= (toIndex!0 (select (arr!30632 a!3219) j!170) mask!3464) (bvand (bvxor lt!446319 (bvlshr lt!446319 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1009726 d!119891))

(declare-fun d!119893 () Bool)

(declare-fun res!678378 () Bool)

(declare-fun e!568101 () Bool)

(assert (=> d!119893 (=> res!678378 e!568101)))

(assert (=> d!119893 (= res!678378 (= (select (arr!30632 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!119893 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!568101)))

(declare-fun b!1009807 () Bool)

(declare-fun e!568102 () Bool)

(assert (=> b!1009807 (= e!568101 e!568102)))

(declare-fun res!678379 () Bool)

(assert (=> b!1009807 (=> (not res!678379) (not e!568102))))

(assert (=> b!1009807 (= res!678379 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31134 a!3219)))))

(declare-fun b!1009808 () Bool)

(assert (=> b!1009808 (= e!568102 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119893 (not res!678378)) b!1009807))

(assert (= (and b!1009807 res!678379) b!1009808))

(declare-fun m!934313 () Bool)

(assert (=> d!119893 m!934313))

(declare-fun m!934315 () Bool)

(assert (=> b!1009808 m!934315))

(assert (=> b!1009727 d!119893))

(declare-fun d!119895 () Bool)

(assert (=> d!119895 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!87050 d!119895))

(declare-fun d!119897 () Bool)

(assert (=> d!119897 (= (array_inv!23756 a!3219) (bvsge (size!31134 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!87050 d!119897))

(declare-fun d!119899 () Bool)

(assert (=> d!119899 (= (validKeyInArray!0 (select (arr!30632 a!3219) j!170)) (and (not (= (select (arr!30632 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30632 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1009733 d!119899))

(declare-fun b!1009809 () Bool)

(declare-fun lt!446321 () SeekEntryResult!9564)

(assert (=> b!1009809 (and (bvsge (index!40629 lt!446321) #b00000000000000000000000000000000) (bvslt (index!40629 lt!446321) (size!31134 lt!446286)))))

(declare-fun e!568107 () Bool)

(assert (=> b!1009809 (= e!568107 (= (select (arr!30632 lt!446286) (index!40629 lt!446321)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1009810 () Bool)

(declare-fun e!568106 () SeekEntryResult!9564)

(declare-fun e!568103 () SeekEntryResult!9564)

(assert (=> b!1009810 (= e!568106 e!568103)))

(declare-fun c!101872 () Bool)

(declare-fun lt!446320 () (_ BitVec 64))

(assert (=> b!1009810 (= c!101872 (or (= lt!446320 lt!446284) (= (bvadd lt!446320 lt!446320) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!119901 () Bool)

(declare-fun e!568105 () Bool)

(assert (=> d!119901 e!568105))

(declare-fun c!101874 () Bool)

(assert (=> d!119901 (= c!101874 (and ((_ is Intermediate!9564) lt!446321) (undefined!10376 lt!446321)))))

(assert (=> d!119901 (= lt!446321 e!568106)))

(declare-fun c!101873 () Bool)

(assert (=> d!119901 (= c!101873 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!119901 (= lt!446320 (select (arr!30632 lt!446286) index!1507))))

(assert (=> d!119901 (validMask!0 mask!3464)))

(assert (=> d!119901 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446284 lt!446286 mask!3464) lt!446321)))

(declare-fun b!1009811 () Bool)

(assert (=> b!1009811 (= e!568103 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) lt!446284 lt!446286 mask!3464))))

(declare-fun b!1009812 () Bool)

(assert (=> b!1009812 (= e!568103 (Intermediate!9564 false index!1507 x!1245))))

(declare-fun b!1009813 () Bool)

(assert (=> b!1009813 (and (bvsge (index!40629 lt!446321) #b00000000000000000000000000000000) (bvslt (index!40629 lt!446321) (size!31134 lt!446286)))))

(declare-fun res!678381 () Bool)

(assert (=> b!1009813 (= res!678381 (= (select (arr!30632 lt!446286) (index!40629 lt!446321)) lt!446284))))

(assert (=> b!1009813 (=> res!678381 e!568107)))

(declare-fun e!568104 () Bool)

(assert (=> b!1009813 (= e!568104 e!568107)))

(declare-fun b!1009814 () Bool)

(assert (=> b!1009814 (= e!568105 (bvsge (x!88023 lt!446321) #b01111111111111111111111111111110))))

(declare-fun b!1009815 () Bool)

(assert (=> b!1009815 (and (bvsge (index!40629 lt!446321) #b00000000000000000000000000000000) (bvslt (index!40629 lt!446321) (size!31134 lt!446286)))))

(declare-fun res!678380 () Bool)

(assert (=> b!1009815 (= res!678380 (= (select (arr!30632 lt!446286) (index!40629 lt!446321)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1009815 (=> res!678380 e!568107)))

(declare-fun b!1009816 () Bool)

(assert (=> b!1009816 (= e!568106 (Intermediate!9564 true index!1507 x!1245))))

(declare-fun b!1009817 () Bool)

(assert (=> b!1009817 (= e!568105 e!568104)))

(declare-fun res!678382 () Bool)

(assert (=> b!1009817 (= res!678382 (and ((_ is Intermediate!9564) lt!446321) (not (undefined!10376 lt!446321)) (bvslt (x!88023 lt!446321) #b01111111111111111111111111111110) (bvsge (x!88023 lt!446321) #b00000000000000000000000000000000) (bvsge (x!88023 lt!446321) x!1245)))))

(assert (=> b!1009817 (=> (not res!678382) (not e!568104))))

(assert (= (and d!119901 c!101873) b!1009816))

(assert (= (and d!119901 (not c!101873)) b!1009810))

(assert (= (and b!1009810 c!101872) b!1009812))

(assert (= (and b!1009810 (not c!101872)) b!1009811))

(assert (= (and d!119901 c!101874) b!1009814))

(assert (= (and d!119901 (not c!101874)) b!1009817))

(assert (= (and b!1009817 res!678382) b!1009813))

(assert (= (and b!1009813 (not res!678381)) b!1009815))

(assert (= (and b!1009815 (not res!678380)) b!1009809))

(declare-fun m!934317 () Bool)

(assert (=> d!119901 m!934317))

(assert (=> d!119901 m!934247))

(declare-fun m!934319 () Bool)

(assert (=> b!1009815 m!934319))

(assert (=> b!1009813 m!934319))

(assert (=> b!1009811 m!934241))

(assert (=> b!1009811 m!934241))

(declare-fun m!934321 () Bool)

(assert (=> b!1009811 m!934321))

(assert (=> b!1009809 m!934319))

(assert (=> b!1009723 d!119901))

(declare-fun bm!42387 () Bool)

(declare-fun call!42390 () Bool)

(assert (=> bm!42387 (= call!42390 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!1009827 () Bool)

(declare-fun e!568114 () Bool)

(declare-fun e!568116 () Bool)

(assert (=> b!1009827 (= e!568114 e!568116)))

(declare-fun lt!446330 () (_ BitVec 64))

(assert (=> b!1009827 (= lt!446330 (select (arr!30632 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33022 0))(
  ( (Unit!33023) )
))
(declare-fun lt!446329 () Unit!33022)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63625 (_ BitVec 64) (_ BitVec 32)) Unit!33022)

(assert (=> b!1009827 (= lt!446329 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!446330 #b00000000000000000000000000000000))))

(assert (=> b!1009827 (arrayContainsKey!0 a!3219 lt!446330 #b00000000000000000000000000000000)))

(declare-fun lt!446328 () Unit!33022)

(assert (=> b!1009827 (= lt!446328 lt!446329)))

(declare-fun res!678388 () Bool)

(assert (=> b!1009827 (= res!678388 (= (seekEntryOrOpen!0 (select (arr!30632 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9564 #b00000000000000000000000000000000)))))

(assert (=> b!1009827 (=> (not res!678388) (not e!568116))))

(declare-fun b!1009828 () Bool)

(declare-fun e!568115 () Bool)

(assert (=> b!1009828 (= e!568115 e!568114)))

(declare-fun c!101877 () Bool)

(assert (=> b!1009828 (= c!101877 (validKeyInArray!0 (select (arr!30632 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1009829 () Bool)

(assert (=> b!1009829 (= e!568114 call!42390)))

(declare-fun d!119903 () Bool)

(declare-fun res!678387 () Bool)

(assert (=> d!119903 (=> res!678387 e!568115)))

(assert (=> d!119903 (= res!678387 (bvsge #b00000000000000000000000000000000 (size!31134 a!3219)))))

(assert (=> d!119903 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!568115)))

(declare-fun b!1009826 () Bool)

(assert (=> b!1009826 (= e!568116 call!42390)))

(assert (= (and d!119903 (not res!678387)) b!1009828))

(assert (= (and b!1009828 c!101877) b!1009827))

(assert (= (and b!1009828 (not c!101877)) b!1009829))

(assert (= (and b!1009827 res!678388) b!1009826))

(assert (= (or b!1009826 b!1009829) bm!42387))

(declare-fun m!934323 () Bool)

(assert (=> bm!42387 m!934323))

(assert (=> b!1009827 m!934313))

(declare-fun m!934325 () Bool)

(assert (=> b!1009827 m!934325))

(declare-fun m!934327 () Bool)

(assert (=> b!1009827 m!934327))

(assert (=> b!1009827 m!934313))

(declare-fun m!934329 () Bool)

(assert (=> b!1009827 m!934329))

(assert (=> b!1009828 m!934313))

(assert (=> b!1009828 m!934313))

(declare-fun m!934331 () Bool)

(assert (=> b!1009828 m!934331))

(assert (=> b!1009724 d!119903))

(declare-fun b!1009830 () Bool)

(declare-fun lt!446332 () SeekEntryResult!9564)

(assert (=> b!1009830 (and (bvsge (index!40629 lt!446332) #b00000000000000000000000000000000) (bvslt (index!40629 lt!446332) (size!31134 lt!446286)))))

(declare-fun e!568121 () Bool)

(assert (=> b!1009830 (= e!568121 (= (select (arr!30632 lt!446286) (index!40629 lt!446332)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1009831 () Bool)

(declare-fun e!568120 () SeekEntryResult!9564)

(declare-fun e!568117 () SeekEntryResult!9564)

(assert (=> b!1009831 (= e!568120 e!568117)))

(declare-fun c!101878 () Bool)

(declare-fun lt!446331 () (_ BitVec 64))

(assert (=> b!1009831 (= c!101878 (or (= lt!446331 lt!446284) (= (bvadd lt!446331 lt!446331) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!119905 () Bool)

(declare-fun e!568119 () Bool)

(assert (=> d!119905 e!568119))

(declare-fun c!101880 () Bool)

(assert (=> d!119905 (= c!101880 (and ((_ is Intermediate!9564) lt!446332) (undefined!10376 lt!446332)))))

(assert (=> d!119905 (= lt!446332 e!568120)))

(declare-fun c!101879 () Bool)

(assert (=> d!119905 (= c!101879 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!119905 (= lt!446331 (select (arr!30632 lt!446286) (toIndex!0 lt!446284 mask!3464)))))

(assert (=> d!119905 (validMask!0 mask!3464)))

(assert (=> d!119905 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446284 mask!3464) lt!446284 lt!446286 mask!3464) lt!446332)))

(declare-fun b!1009832 () Bool)

(assert (=> b!1009832 (= e!568117 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!446284 mask!3464) #b00000000000000000000000000000000 mask!3464) lt!446284 lt!446286 mask!3464))))

(declare-fun b!1009833 () Bool)

(assert (=> b!1009833 (= e!568117 (Intermediate!9564 false (toIndex!0 lt!446284 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1009834 () Bool)

(assert (=> b!1009834 (and (bvsge (index!40629 lt!446332) #b00000000000000000000000000000000) (bvslt (index!40629 lt!446332) (size!31134 lt!446286)))))

(declare-fun res!678390 () Bool)

(assert (=> b!1009834 (= res!678390 (= (select (arr!30632 lt!446286) (index!40629 lt!446332)) lt!446284))))

(assert (=> b!1009834 (=> res!678390 e!568121)))

(declare-fun e!568118 () Bool)

(assert (=> b!1009834 (= e!568118 e!568121)))

(declare-fun b!1009835 () Bool)

(assert (=> b!1009835 (= e!568119 (bvsge (x!88023 lt!446332) #b01111111111111111111111111111110))))

(declare-fun b!1009836 () Bool)

(assert (=> b!1009836 (and (bvsge (index!40629 lt!446332) #b00000000000000000000000000000000) (bvslt (index!40629 lt!446332) (size!31134 lt!446286)))))

(declare-fun res!678389 () Bool)

(assert (=> b!1009836 (= res!678389 (= (select (arr!30632 lt!446286) (index!40629 lt!446332)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1009836 (=> res!678389 e!568121)))

(declare-fun b!1009837 () Bool)

(assert (=> b!1009837 (= e!568120 (Intermediate!9564 true (toIndex!0 lt!446284 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1009838 () Bool)

(assert (=> b!1009838 (= e!568119 e!568118)))

(declare-fun res!678391 () Bool)

(assert (=> b!1009838 (= res!678391 (and ((_ is Intermediate!9564) lt!446332) (not (undefined!10376 lt!446332)) (bvslt (x!88023 lt!446332) #b01111111111111111111111111111110) (bvsge (x!88023 lt!446332) #b00000000000000000000000000000000) (bvsge (x!88023 lt!446332) #b00000000000000000000000000000000)))))

(assert (=> b!1009838 (=> (not res!678391) (not e!568118))))

(assert (= (and d!119905 c!101879) b!1009837))

(assert (= (and d!119905 (not c!101879)) b!1009831))

(assert (= (and b!1009831 c!101878) b!1009833))

(assert (= (and b!1009831 (not c!101878)) b!1009832))

(assert (= (and d!119905 c!101880) b!1009835))

(assert (= (and d!119905 (not c!101880)) b!1009838))

(assert (= (and b!1009838 res!678391) b!1009834))

(assert (= (and b!1009834 (not res!678390)) b!1009836))

(assert (= (and b!1009836 (not res!678389)) b!1009830))

(assert (=> d!119905 m!934253))

(declare-fun m!934333 () Bool)

(assert (=> d!119905 m!934333))

(assert (=> d!119905 m!934247))

(declare-fun m!934335 () Bool)

(assert (=> b!1009836 m!934335))

(assert (=> b!1009834 m!934335))

(assert (=> b!1009832 m!934253))

(declare-fun m!934337 () Bool)

(assert (=> b!1009832 m!934337))

(assert (=> b!1009832 m!934337))

(declare-fun m!934339 () Bool)

(assert (=> b!1009832 m!934339))

(assert (=> b!1009830 m!934335))

(assert (=> b!1009720 d!119905))

(declare-fun d!119907 () Bool)

(declare-fun lt!446334 () (_ BitVec 32))

(declare-fun lt!446333 () (_ BitVec 32))

(assert (=> d!119907 (= lt!446334 (bvmul (bvxor lt!446333 (bvlshr lt!446333 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119907 (= lt!446333 ((_ extract 31 0) (bvand (bvxor lt!446284 (bvlshr lt!446284 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119907 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!678373 (let ((h!22495 ((_ extract 31 0) (bvand (bvxor lt!446284 (bvlshr lt!446284 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!88026 (bvmul (bvxor h!22495 (bvlshr h!22495 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!88026 (bvlshr x!88026 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!678373 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!678373 #b00000000000000000000000000000000))))))

(assert (=> d!119907 (= (toIndex!0 lt!446284 mask!3464) (bvand (bvxor lt!446334 (bvlshr lt!446334 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1009720 d!119907))

(declare-fun d!119909 () Bool)

(declare-fun lt!446341 () SeekEntryResult!9564)

(assert (=> d!119909 (and (or ((_ is Undefined!9564) lt!446341) (not ((_ is Found!9564) lt!446341)) (and (bvsge (index!40628 lt!446341) #b00000000000000000000000000000000) (bvslt (index!40628 lt!446341) (size!31134 a!3219)))) (or ((_ is Undefined!9564) lt!446341) ((_ is Found!9564) lt!446341) (not ((_ is MissingZero!9564) lt!446341)) (and (bvsge (index!40627 lt!446341) #b00000000000000000000000000000000) (bvslt (index!40627 lt!446341) (size!31134 a!3219)))) (or ((_ is Undefined!9564) lt!446341) ((_ is Found!9564) lt!446341) ((_ is MissingZero!9564) lt!446341) (not ((_ is MissingVacant!9564) lt!446341)) (and (bvsge (index!40630 lt!446341) #b00000000000000000000000000000000) (bvslt (index!40630 lt!446341) (size!31134 a!3219)))) (or ((_ is Undefined!9564) lt!446341) (ite ((_ is Found!9564) lt!446341) (= (select (arr!30632 a!3219) (index!40628 lt!446341)) k0!2224) (ite ((_ is MissingZero!9564) lt!446341) (= (select (arr!30632 a!3219) (index!40627 lt!446341)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9564) lt!446341) (= (select (arr!30632 a!3219) (index!40630 lt!446341)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!568129 () SeekEntryResult!9564)

(assert (=> d!119909 (= lt!446341 e!568129)))

(declare-fun c!101889 () Bool)

(declare-fun lt!446342 () SeekEntryResult!9564)

(assert (=> d!119909 (= c!101889 (and ((_ is Intermediate!9564) lt!446342) (undefined!10376 lt!446342)))))

(assert (=> d!119909 (= lt!446342 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!119909 (validMask!0 mask!3464)))

(assert (=> d!119909 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!446341)))

(declare-fun b!1009851 () Bool)

(declare-fun e!568128 () SeekEntryResult!9564)

(assert (=> b!1009851 (= e!568128 (MissingZero!9564 (index!40629 lt!446342)))))

(declare-fun b!1009852 () Bool)

(declare-fun e!568130 () SeekEntryResult!9564)

(assert (=> b!1009852 (= e!568130 (Found!9564 (index!40629 lt!446342)))))

(declare-fun b!1009853 () Bool)

(assert (=> b!1009853 (= e!568129 e!568130)))

(declare-fun lt!446343 () (_ BitVec 64))

(assert (=> b!1009853 (= lt!446343 (select (arr!30632 a!3219) (index!40629 lt!446342)))))

(declare-fun c!101888 () Bool)

(assert (=> b!1009853 (= c!101888 (= lt!446343 k0!2224))))

(declare-fun b!1009854 () Bool)

(declare-fun c!101887 () Bool)

(assert (=> b!1009854 (= c!101887 (= lt!446343 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1009854 (= e!568130 e!568128)))

(declare-fun b!1009855 () Bool)

(assert (=> b!1009855 (= e!568129 Undefined!9564)))

(declare-fun b!1009856 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63625 (_ BitVec 32)) SeekEntryResult!9564)

(assert (=> b!1009856 (= e!568128 (seekKeyOrZeroReturnVacant!0 (x!88023 lt!446342) (index!40629 lt!446342) (index!40629 lt!446342) k0!2224 a!3219 mask!3464))))

(assert (= (and d!119909 c!101889) b!1009855))

(assert (= (and d!119909 (not c!101889)) b!1009853))

(assert (= (and b!1009853 c!101888) b!1009852))

(assert (= (and b!1009853 (not c!101888)) b!1009854))

(assert (= (and b!1009854 c!101887) b!1009851))

(assert (= (and b!1009854 (not c!101887)) b!1009856))

(declare-fun m!934341 () Bool)

(assert (=> d!119909 m!934341))

(declare-fun m!934343 () Bool)

(assert (=> d!119909 m!934343))

(assert (=> d!119909 m!934341))

(declare-fun m!934345 () Bool)

(assert (=> d!119909 m!934345))

(declare-fun m!934347 () Bool)

(assert (=> d!119909 m!934347))

(declare-fun m!934349 () Bool)

(assert (=> d!119909 m!934349))

(assert (=> d!119909 m!934247))

(declare-fun m!934351 () Bool)

(assert (=> b!1009853 m!934351))

(declare-fun m!934353 () Bool)

(assert (=> b!1009856 m!934353))

(assert (=> b!1009721 d!119909))

(declare-fun d!119911 () Bool)

(declare-fun res!678399 () Bool)

(declare-fun e!568139 () Bool)

(assert (=> d!119911 (=> res!678399 e!568139)))

(assert (=> d!119911 (= res!678399 (bvsge #b00000000000000000000000000000000 (size!31134 a!3219)))))

(assert (=> d!119911 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21305) e!568139)))

(declare-fun b!1009867 () Bool)

(declare-fun e!568141 () Bool)

(assert (=> b!1009867 (= e!568139 e!568141)))

(declare-fun res!678398 () Bool)

(assert (=> b!1009867 (=> (not res!678398) (not e!568141))))

(declare-fun e!568142 () Bool)

(assert (=> b!1009867 (= res!678398 (not e!568142))))

(declare-fun res!678400 () Bool)

(assert (=> b!1009867 (=> (not res!678400) (not e!568142))))

(assert (=> b!1009867 (= res!678400 (validKeyInArray!0 (select (arr!30632 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1009868 () Bool)

(declare-fun contains!5892 (List!21308 (_ BitVec 64)) Bool)

(assert (=> b!1009868 (= e!568142 (contains!5892 Nil!21305 (select (arr!30632 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42390 () Bool)

(declare-fun call!42393 () Bool)

(declare-fun c!101892 () Bool)

(assert (=> bm!42390 (= call!42393 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101892 (Cons!21304 (select (arr!30632 a!3219) #b00000000000000000000000000000000) Nil!21305) Nil!21305)))))

(declare-fun b!1009869 () Bool)

(declare-fun e!568140 () Bool)

(assert (=> b!1009869 (= e!568141 e!568140)))

(assert (=> b!1009869 (= c!101892 (validKeyInArray!0 (select (arr!30632 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1009870 () Bool)

(assert (=> b!1009870 (= e!568140 call!42393)))

(declare-fun b!1009871 () Bool)

(assert (=> b!1009871 (= e!568140 call!42393)))

(assert (= (and d!119911 (not res!678399)) b!1009867))

(assert (= (and b!1009867 res!678400) b!1009868))

(assert (= (and b!1009867 res!678398) b!1009869))

(assert (= (and b!1009869 c!101892) b!1009871))

(assert (= (and b!1009869 (not c!101892)) b!1009870))

(assert (= (or b!1009871 b!1009870) bm!42390))

(assert (=> b!1009867 m!934313))

(assert (=> b!1009867 m!934313))

(assert (=> b!1009867 m!934331))

(assert (=> b!1009868 m!934313))

(assert (=> b!1009868 m!934313))

(declare-fun m!934355 () Bool)

(assert (=> b!1009868 m!934355))

(assert (=> bm!42390 m!934313))

(declare-fun m!934357 () Bool)

(assert (=> bm!42390 m!934357))

(assert (=> b!1009869 m!934313))

(assert (=> b!1009869 m!934313))

(assert (=> b!1009869 m!934331))

(assert (=> b!1009722 d!119911))

(declare-fun d!119917 () Bool)

(assert (=> d!119917 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1009728 d!119917))

(declare-fun d!119919 () Bool)

(declare-fun lt!446346 () (_ BitVec 32))

(assert (=> d!119919 (and (bvsge lt!446346 #b00000000000000000000000000000000) (bvslt lt!446346 (bvadd mask!3464 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!119919 (= lt!446346 (choose!52 index!1507 x!1245 mask!3464))))

(assert (=> d!119919 (validMask!0 mask!3464)))

(assert (=> d!119919 (= (nextIndex!0 index!1507 x!1245 mask!3464) lt!446346)))

(declare-fun bs!28713 () Bool)

(assert (= bs!28713 d!119919))

(declare-fun m!934359 () Bool)

(assert (=> bs!28713 m!934359))

(assert (=> bs!28713 m!934247))

(assert (=> b!1009729 d!119919))

(declare-fun b!1009872 () Bool)

(declare-fun lt!446348 () SeekEntryResult!9564)

(assert (=> b!1009872 (and (bvsge (index!40629 lt!446348) #b00000000000000000000000000000000) (bvslt (index!40629 lt!446348) (size!31134 a!3219)))))

(declare-fun e!568147 () Bool)

(assert (=> b!1009872 (= e!568147 (= (select (arr!30632 a!3219) (index!40629 lt!446348)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1009873 () Bool)

(declare-fun e!568146 () SeekEntryResult!9564)

(declare-fun e!568143 () SeekEntryResult!9564)

(assert (=> b!1009873 (= e!568146 e!568143)))

(declare-fun c!101893 () Bool)

(declare-fun lt!446347 () (_ BitVec 64))

(assert (=> b!1009873 (= c!101893 (or (= lt!446347 (select (arr!30632 a!3219) j!170)) (= (bvadd lt!446347 lt!446347) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!119921 () Bool)

(declare-fun e!568145 () Bool)

(assert (=> d!119921 e!568145))

(declare-fun c!101895 () Bool)

(assert (=> d!119921 (= c!101895 (and ((_ is Intermediate!9564) lt!446348) (undefined!10376 lt!446348)))))

(assert (=> d!119921 (= lt!446348 e!568146)))

(declare-fun c!101894 () Bool)

(assert (=> d!119921 (= c!101894 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!119921 (= lt!446347 (select (arr!30632 a!3219) index!1507))))

(assert (=> d!119921 (validMask!0 mask!3464)))

(assert (=> d!119921 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30632 a!3219) j!170) a!3219 mask!3464) lt!446348)))

(declare-fun b!1009874 () Bool)

(assert (=> b!1009874 (= e!568143 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30632 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009875 () Bool)

(assert (=> b!1009875 (= e!568143 (Intermediate!9564 false index!1507 x!1245))))

(declare-fun b!1009876 () Bool)

(assert (=> b!1009876 (and (bvsge (index!40629 lt!446348) #b00000000000000000000000000000000) (bvslt (index!40629 lt!446348) (size!31134 a!3219)))))

(declare-fun res!678402 () Bool)

(assert (=> b!1009876 (= res!678402 (= (select (arr!30632 a!3219) (index!40629 lt!446348)) (select (arr!30632 a!3219) j!170)))))

(assert (=> b!1009876 (=> res!678402 e!568147)))

(declare-fun e!568144 () Bool)

(assert (=> b!1009876 (= e!568144 e!568147)))

(declare-fun b!1009877 () Bool)

(assert (=> b!1009877 (= e!568145 (bvsge (x!88023 lt!446348) #b01111111111111111111111111111110))))

(declare-fun b!1009878 () Bool)

(assert (=> b!1009878 (and (bvsge (index!40629 lt!446348) #b00000000000000000000000000000000) (bvslt (index!40629 lt!446348) (size!31134 a!3219)))))

(declare-fun res!678401 () Bool)

(assert (=> b!1009878 (= res!678401 (= (select (arr!30632 a!3219) (index!40629 lt!446348)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1009878 (=> res!678401 e!568147)))

(declare-fun b!1009879 () Bool)

(assert (=> b!1009879 (= e!568146 (Intermediate!9564 true index!1507 x!1245))))

(declare-fun b!1009880 () Bool)

(assert (=> b!1009880 (= e!568145 e!568144)))

(declare-fun res!678403 () Bool)

(assert (=> b!1009880 (= res!678403 (and ((_ is Intermediate!9564) lt!446348) (not (undefined!10376 lt!446348)) (bvslt (x!88023 lt!446348) #b01111111111111111111111111111110) (bvsge (x!88023 lt!446348) #b00000000000000000000000000000000) (bvsge (x!88023 lt!446348) x!1245)))))

(assert (=> b!1009880 (=> (not res!678403) (not e!568144))))

(assert (= (and d!119921 c!101894) b!1009879))

(assert (= (and d!119921 (not c!101894)) b!1009873))

(assert (= (and b!1009873 c!101893) b!1009875))

(assert (= (and b!1009873 (not c!101893)) b!1009874))

(assert (= (and d!119921 c!101895) b!1009877))

(assert (= (and d!119921 (not c!101895)) b!1009880))

(assert (= (and b!1009880 res!678403) b!1009876))

(assert (= (and b!1009876 (not res!678402)) b!1009878))

(assert (= (and b!1009878 (not res!678401)) b!1009872))

(declare-fun m!934361 () Bool)

(assert (=> d!119921 m!934361))

(assert (=> d!119921 m!934247))

(declare-fun m!934363 () Bool)

(assert (=> b!1009878 m!934363))

(assert (=> b!1009876 m!934363))

(assert (=> b!1009874 m!934241))

(assert (=> b!1009874 m!934241))

(assert (=> b!1009874 m!934235))

(declare-fun m!934365 () Bool)

(assert (=> b!1009874 m!934365))

(assert (=> b!1009872 m!934363))

(assert (=> b!1009730 d!119921))

(check-sat (not b!1009867) (not b!1009827) (not d!119889) (not b!1009868) (not b!1009828) (not b!1009808) (not d!119909) (not bm!42390) (not b!1009874) (not b!1009811) (not d!119921) (not b!1009869) (not b!1009856) (not bm!42387) (not d!119901) (not b!1009832) (not b!1009796) (not d!119905) (not d!119919))
(check-sat)
