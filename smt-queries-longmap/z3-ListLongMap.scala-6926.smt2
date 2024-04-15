; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87048 () Bool)

(assert start!87048)

(declare-fun b!1009548 () Bool)

(declare-fun res!678210 () Bool)

(declare-fun e!567963 () Bool)

(assert (=> b!1009548 (=> (not res!678210) (not e!567963))))

(declare-datatypes ((array!63562 0))(
  ( (array!63563 (arr!30600 (Array (_ BitVec 32) (_ BitVec 64))) (size!31104 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63562)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(assert (=> b!1009548 (= res!678210 (and (= (size!31104 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31104 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31104 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1009549 () Bool)

(declare-fun e!567964 () Bool)

(declare-fun e!567968 () Bool)

(assert (=> b!1009549 (= e!567964 e!567968)))

(declare-fun res!678212 () Bool)

(assert (=> b!1009549 (=> (not res!678212) (not e!567968))))

(declare-datatypes ((SeekEntryResult!9557 0))(
  ( (MissingZero!9557 (index!40599 (_ BitVec 32))) (Found!9557 (index!40600 (_ BitVec 32))) (Intermediate!9557 (undefined!10369 Bool) (index!40601 (_ BitVec 32)) (x!88013 (_ BitVec 32))) (Undefined!9557) (MissingVacant!9557 (index!40602 (_ BitVec 32))) )
))
(declare-fun lt!446060 () SeekEntryResult!9557)

(declare-fun lt!446064 () array!63562)

(declare-fun lt!446062 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63562 (_ BitVec 32)) SeekEntryResult!9557)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009549 (= res!678212 (not (= lt!446060 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446062 mask!3464) lt!446062 lt!446064 mask!3464))))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1009549 (= lt!446062 (select (store (arr!30600 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1009549 (= lt!446064 (array!63563 (store (arr!30600 a!3219) i!1194 k0!2224) (size!31104 a!3219)))))

(declare-fun b!1009550 () Bool)

(declare-fun e!567967 () Bool)

(assert (=> b!1009550 (= e!567967 e!567964)))

(declare-fun res!678211 () Bool)

(assert (=> b!1009550 (=> (not res!678211) (not e!567964))))

(declare-fun lt!446063 () SeekEntryResult!9557)

(declare-fun lt!446061 () SeekEntryResult!9557)

(assert (=> b!1009550 (= res!678211 (= lt!446063 lt!446061))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1009550 (= lt!446063 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30600 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!678215 () Bool)

(assert (=> start!87048 (=> (not res!678215) (not e!567963))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87048 (= res!678215 (validMask!0 mask!3464))))

(assert (=> start!87048 e!567963))

(declare-fun array_inv!23743 (array!63562) Bool)

(assert (=> start!87048 (array_inv!23743 a!3219)))

(assert (=> start!87048 true))

(declare-fun b!1009551 () Bool)

(declare-fun res!678214 () Bool)

(declare-fun e!567966 () Bool)

(assert (=> b!1009551 (=> (not res!678214) (not e!567966))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63562 (_ BitVec 32)) Bool)

(assert (=> b!1009551 (= res!678214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1009552 () Bool)

(assert (=> b!1009552 (= e!567963 e!567966)))

(declare-fun res!678208 () Bool)

(assert (=> b!1009552 (=> (not res!678208) (not e!567966))))

(declare-fun lt!446059 () SeekEntryResult!9557)

(assert (=> b!1009552 (= res!678208 (or (= lt!446059 (MissingVacant!9557 i!1194)) (= lt!446059 (MissingZero!9557 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63562 (_ BitVec 32)) SeekEntryResult!9557)

(assert (=> b!1009552 (= lt!446059 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1009553 () Bool)

(declare-fun res!678217 () Bool)

(assert (=> b!1009553 (=> (not res!678217) (not e!567963))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1009553 (= res!678217 (validKeyInArray!0 k0!2224))))

(declare-fun lt!446065 () (_ BitVec 32))

(declare-fun b!1009554 () Bool)

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1009554 (= e!567968 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (or (bvslt lt!446065 #b00000000000000000000000000000000) (bvsge lt!446065 (size!31104 a!3219)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009554 (= lt!446065 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1009555 () Bool)

(declare-fun res!678209 () Bool)

(assert (=> b!1009555 (=> (not res!678209) (not e!567963))))

(assert (=> b!1009555 (= res!678209 (validKeyInArray!0 (select (arr!30600 a!3219) j!170)))))

(declare-fun b!1009556 () Bool)

(assert (=> b!1009556 (= e!567966 e!567967)))

(declare-fun res!678206 () Bool)

(assert (=> b!1009556 (=> (not res!678206) (not e!567967))))

(assert (=> b!1009556 (= res!678206 (= lt!446060 lt!446061))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1009556 (= lt!446061 (Intermediate!9557 false resIndex!38 resX!38))))

(assert (=> b!1009556 (= lt!446060 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30600 a!3219) j!170) mask!3464) (select (arr!30600 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009557 () Bool)

(declare-fun res!678207 () Bool)

(assert (=> b!1009557 (=> (not res!678207) (not e!567963))))

(declare-fun arrayContainsKey!0 (array!63562 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1009557 (= res!678207 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1009558 () Bool)

(declare-fun res!678213 () Bool)

(assert (=> b!1009558 (=> (not res!678213) (not e!567968))))

(assert (=> b!1009558 (= res!678213 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1009559 () Bool)

(declare-fun res!678216 () Bool)

(assert (=> b!1009559 (=> (not res!678216) (not e!567966))))

(assert (=> b!1009559 (= res!678216 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31104 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31104 a!3219))))))

(declare-fun b!1009560 () Bool)

(declare-fun res!678205 () Bool)

(assert (=> b!1009560 (=> (not res!678205) (not e!567968))))

(assert (=> b!1009560 (= res!678205 (not (= lt!446063 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446062 lt!446064 mask!3464))))))

(declare-fun b!1009561 () Bool)

(declare-fun res!678218 () Bool)

(assert (=> b!1009561 (=> (not res!678218) (not e!567966))))

(declare-datatypes ((List!21342 0))(
  ( (Nil!21339) (Cons!21338 (h!22527 (_ BitVec 64)) (t!30334 List!21342)) )
))
(declare-fun arrayNoDuplicates!0 (array!63562 (_ BitVec 32) List!21342) Bool)

(assert (=> b!1009561 (= res!678218 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21339))))

(assert (= (and start!87048 res!678215) b!1009548))

(assert (= (and b!1009548 res!678210) b!1009555))

(assert (= (and b!1009555 res!678209) b!1009553))

(assert (= (and b!1009553 res!678217) b!1009557))

(assert (= (and b!1009557 res!678207) b!1009552))

(assert (= (and b!1009552 res!678208) b!1009551))

(assert (= (and b!1009551 res!678214) b!1009561))

(assert (= (and b!1009561 res!678218) b!1009559))

(assert (= (and b!1009559 res!678216) b!1009556))

(assert (= (and b!1009556 res!678206) b!1009550))

(assert (= (and b!1009550 res!678211) b!1009549))

(assert (= (and b!1009549 res!678212) b!1009560))

(assert (= (and b!1009560 res!678205) b!1009558))

(assert (= (and b!1009558 res!678213) b!1009554))

(declare-fun m!933559 () Bool)

(assert (=> b!1009549 m!933559))

(assert (=> b!1009549 m!933559))

(declare-fun m!933561 () Bool)

(assert (=> b!1009549 m!933561))

(declare-fun m!933563 () Bool)

(assert (=> b!1009549 m!933563))

(declare-fun m!933565 () Bool)

(assert (=> b!1009549 m!933565))

(declare-fun m!933567 () Bool)

(assert (=> b!1009554 m!933567))

(declare-fun m!933569 () Bool)

(assert (=> b!1009551 m!933569))

(declare-fun m!933571 () Bool)

(assert (=> b!1009557 m!933571))

(declare-fun m!933573 () Bool)

(assert (=> b!1009556 m!933573))

(assert (=> b!1009556 m!933573))

(declare-fun m!933575 () Bool)

(assert (=> b!1009556 m!933575))

(assert (=> b!1009556 m!933575))

(assert (=> b!1009556 m!933573))

(declare-fun m!933577 () Bool)

(assert (=> b!1009556 m!933577))

(assert (=> b!1009550 m!933573))

(assert (=> b!1009550 m!933573))

(declare-fun m!933579 () Bool)

(assert (=> b!1009550 m!933579))

(assert (=> b!1009555 m!933573))

(assert (=> b!1009555 m!933573))

(declare-fun m!933581 () Bool)

(assert (=> b!1009555 m!933581))

(declare-fun m!933583 () Bool)

(assert (=> start!87048 m!933583))

(declare-fun m!933585 () Bool)

(assert (=> start!87048 m!933585))

(declare-fun m!933587 () Bool)

(assert (=> b!1009560 m!933587))

(declare-fun m!933589 () Bool)

(assert (=> b!1009553 m!933589))

(declare-fun m!933591 () Bool)

(assert (=> b!1009552 m!933591))

(declare-fun m!933593 () Bool)

(assert (=> b!1009561 m!933593))

(check-sat (not b!1009549) (not b!1009560) (not b!1009550) (not b!1009553) (not b!1009555) (not b!1009552) (not b!1009554) (not b!1009557) (not b!1009556) (not b!1009551) (not b!1009561) (not start!87048))
(check-sat)
(get-model)

(declare-fun d!119751 () Bool)

(declare-fun e!568018 () Bool)

(assert (=> d!119751 e!568018))

(declare-fun c!101838 () Bool)

(declare-fun lt!446112 () SeekEntryResult!9557)

(get-info :version)

(assert (=> d!119751 (= c!101838 (and ((_ is Intermediate!9557) lt!446112) (undefined!10369 lt!446112)))))

(declare-fun e!568015 () SeekEntryResult!9557)

(assert (=> d!119751 (= lt!446112 e!568015)))

(declare-fun c!101837 () Bool)

(assert (=> d!119751 (= c!101837 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!446113 () (_ BitVec 64))

(assert (=> d!119751 (= lt!446113 (select (arr!30600 lt!446064) (toIndex!0 lt!446062 mask!3464)))))

(assert (=> d!119751 (validMask!0 mask!3464)))

(assert (=> d!119751 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446062 mask!3464) lt!446062 lt!446064 mask!3464) lt!446112)))

(declare-fun b!1009664 () Bool)

(assert (=> b!1009664 (and (bvsge (index!40601 lt!446112) #b00000000000000000000000000000000) (bvslt (index!40601 lt!446112) (size!31104 lt!446064)))))

(declare-fun res!678309 () Bool)

(assert (=> b!1009664 (= res!678309 (= (select (arr!30600 lt!446064) (index!40601 lt!446112)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!568017 () Bool)

(assert (=> b!1009664 (=> res!678309 e!568017)))

(declare-fun b!1009665 () Bool)

(declare-fun e!568019 () Bool)

(assert (=> b!1009665 (= e!568018 e!568019)))

(declare-fun res!678310 () Bool)

(assert (=> b!1009665 (= res!678310 (and ((_ is Intermediate!9557) lt!446112) (not (undefined!10369 lt!446112)) (bvslt (x!88013 lt!446112) #b01111111111111111111111111111110) (bvsge (x!88013 lt!446112) #b00000000000000000000000000000000) (bvsge (x!88013 lt!446112) #b00000000000000000000000000000000)))))

(assert (=> b!1009665 (=> (not res!678310) (not e!568019))))

(declare-fun b!1009666 () Bool)

(declare-fun e!568016 () SeekEntryResult!9557)

(assert (=> b!1009666 (= e!568016 (Intermediate!9557 false (toIndex!0 lt!446062 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1009667 () Bool)

(assert (=> b!1009667 (and (bvsge (index!40601 lt!446112) #b00000000000000000000000000000000) (bvslt (index!40601 lt!446112) (size!31104 lt!446064)))))

(assert (=> b!1009667 (= e!568017 (= (select (arr!30600 lt!446064) (index!40601 lt!446112)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1009668 () Bool)

(assert (=> b!1009668 (= e!568018 (bvsge (x!88013 lt!446112) #b01111111111111111111111111111110))))

(declare-fun b!1009669 () Bool)

(assert (=> b!1009669 (and (bvsge (index!40601 lt!446112) #b00000000000000000000000000000000) (bvslt (index!40601 lt!446112) (size!31104 lt!446064)))))

(declare-fun res!678311 () Bool)

(assert (=> b!1009669 (= res!678311 (= (select (arr!30600 lt!446064) (index!40601 lt!446112)) lt!446062))))

(assert (=> b!1009669 (=> res!678311 e!568017)))

(assert (=> b!1009669 (= e!568019 e!568017)))

(declare-fun b!1009670 () Bool)

(assert (=> b!1009670 (= e!568016 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!446062 mask!3464) #b00000000000000000000000000000000 mask!3464) lt!446062 lt!446064 mask!3464))))

(declare-fun b!1009671 () Bool)

(assert (=> b!1009671 (= e!568015 e!568016)))

(declare-fun c!101839 () Bool)

(assert (=> b!1009671 (= c!101839 (or (= lt!446113 lt!446062) (= (bvadd lt!446113 lt!446113) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1009672 () Bool)

(assert (=> b!1009672 (= e!568015 (Intermediate!9557 true (toIndex!0 lt!446062 mask!3464) #b00000000000000000000000000000000))))

(assert (= (and d!119751 c!101837) b!1009672))

(assert (= (and d!119751 (not c!101837)) b!1009671))

(assert (= (and b!1009671 c!101839) b!1009666))

(assert (= (and b!1009671 (not c!101839)) b!1009670))

(assert (= (and d!119751 c!101838) b!1009668))

(assert (= (and d!119751 (not c!101838)) b!1009665))

(assert (= (and b!1009665 res!678310) b!1009669))

(assert (= (and b!1009669 (not res!678311)) b!1009664))

(assert (= (and b!1009664 (not res!678309)) b!1009667))

(assert (=> d!119751 m!933559))

(declare-fun m!933667 () Bool)

(assert (=> d!119751 m!933667))

(assert (=> d!119751 m!933583))

(declare-fun m!933669 () Bool)

(assert (=> b!1009667 m!933669))

(assert (=> b!1009669 m!933669))

(assert (=> b!1009670 m!933559))

(declare-fun m!933671 () Bool)

(assert (=> b!1009670 m!933671))

(assert (=> b!1009670 m!933671))

(declare-fun m!933673 () Bool)

(assert (=> b!1009670 m!933673))

(assert (=> b!1009664 m!933669))

(assert (=> b!1009549 d!119751))

(declare-fun d!119753 () Bool)

(declare-fun lt!446119 () (_ BitVec 32))

(declare-fun lt!446118 () (_ BitVec 32))

(assert (=> d!119753 (= lt!446119 (bvmul (bvxor lt!446118 (bvlshr lt!446118 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119753 (= lt!446118 ((_ extract 31 0) (bvand (bvxor lt!446062 (bvlshr lt!446062 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119753 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!678312 (let ((h!22530 ((_ extract 31 0) (bvand (bvxor lt!446062 (bvlshr lt!446062 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!88017 (bvmul (bvxor h!22530 (bvlshr h!22530 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!88017 (bvlshr x!88017 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!678312 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!678312 #b00000000000000000000000000000000))))))

(assert (=> d!119753 (= (toIndex!0 lt!446062 mask!3464) (bvand (bvxor lt!446119 (bvlshr lt!446119 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1009549 d!119753))

(declare-fun d!119755 () Bool)

(declare-fun e!568023 () Bool)

(assert (=> d!119755 e!568023))

(declare-fun c!101841 () Bool)

(declare-fun lt!446120 () SeekEntryResult!9557)

(assert (=> d!119755 (= c!101841 (and ((_ is Intermediate!9557) lt!446120) (undefined!10369 lt!446120)))))

(declare-fun e!568020 () SeekEntryResult!9557)

(assert (=> d!119755 (= lt!446120 e!568020)))

(declare-fun c!101840 () Bool)

(assert (=> d!119755 (= c!101840 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!446121 () (_ BitVec 64))

(assert (=> d!119755 (= lt!446121 (select (arr!30600 lt!446064) index!1507))))

(assert (=> d!119755 (validMask!0 mask!3464)))

(assert (=> d!119755 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446062 lt!446064 mask!3464) lt!446120)))

(declare-fun b!1009673 () Bool)

(assert (=> b!1009673 (and (bvsge (index!40601 lt!446120) #b00000000000000000000000000000000) (bvslt (index!40601 lt!446120) (size!31104 lt!446064)))))

(declare-fun res!678313 () Bool)

(assert (=> b!1009673 (= res!678313 (= (select (arr!30600 lt!446064) (index!40601 lt!446120)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!568022 () Bool)

(assert (=> b!1009673 (=> res!678313 e!568022)))

(declare-fun b!1009674 () Bool)

(declare-fun e!568024 () Bool)

(assert (=> b!1009674 (= e!568023 e!568024)))

(declare-fun res!678314 () Bool)

(assert (=> b!1009674 (= res!678314 (and ((_ is Intermediate!9557) lt!446120) (not (undefined!10369 lt!446120)) (bvslt (x!88013 lt!446120) #b01111111111111111111111111111110) (bvsge (x!88013 lt!446120) #b00000000000000000000000000000000) (bvsge (x!88013 lt!446120) x!1245)))))

(assert (=> b!1009674 (=> (not res!678314) (not e!568024))))

(declare-fun b!1009675 () Bool)

(declare-fun e!568021 () SeekEntryResult!9557)

(assert (=> b!1009675 (= e!568021 (Intermediate!9557 false index!1507 x!1245))))

(declare-fun b!1009676 () Bool)

(assert (=> b!1009676 (and (bvsge (index!40601 lt!446120) #b00000000000000000000000000000000) (bvslt (index!40601 lt!446120) (size!31104 lt!446064)))))

(assert (=> b!1009676 (= e!568022 (= (select (arr!30600 lt!446064) (index!40601 lt!446120)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1009677 () Bool)

(assert (=> b!1009677 (= e!568023 (bvsge (x!88013 lt!446120) #b01111111111111111111111111111110))))

(declare-fun b!1009678 () Bool)

(assert (=> b!1009678 (and (bvsge (index!40601 lt!446120) #b00000000000000000000000000000000) (bvslt (index!40601 lt!446120) (size!31104 lt!446064)))))

(declare-fun res!678315 () Bool)

(assert (=> b!1009678 (= res!678315 (= (select (arr!30600 lt!446064) (index!40601 lt!446120)) lt!446062))))

(assert (=> b!1009678 (=> res!678315 e!568022)))

(assert (=> b!1009678 (= e!568024 e!568022)))

(declare-fun b!1009679 () Bool)

(assert (=> b!1009679 (= e!568021 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) lt!446062 lt!446064 mask!3464))))

(declare-fun b!1009680 () Bool)

(assert (=> b!1009680 (= e!568020 e!568021)))

(declare-fun c!101842 () Bool)

(assert (=> b!1009680 (= c!101842 (or (= lt!446121 lt!446062) (= (bvadd lt!446121 lt!446121) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1009681 () Bool)

(assert (=> b!1009681 (= e!568020 (Intermediate!9557 true index!1507 x!1245))))

(assert (= (and d!119755 c!101840) b!1009681))

(assert (= (and d!119755 (not c!101840)) b!1009680))

(assert (= (and b!1009680 c!101842) b!1009675))

(assert (= (and b!1009680 (not c!101842)) b!1009679))

(assert (= (and d!119755 c!101841) b!1009677))

(assert (= (and d!119755 (not c!101841)) b!1009674))

(assert (= (and b!1009674 res!678314) b!1009678))

(assert (= (and b!1009678 (not res!678315)) b!1009673))

(assert (= (and b!1009673 (not res!678313)) b!1009676))

(declare-fun m!933675 () Bool)

(assert (=> d!119755 m!933675))

(assert (=> d!119755 m!933583))

(declare-fun m!933677 () Bool)

(assert (=> b!1009676 m!933677))

(assert (=> b!1009678 m!933677))

(assert (=> b!1009679 m!933567))

(assert (=> b!1009679 m!933567))

(declare-fun m!933679 () Bool)

(assert (=> b!1009679 m!933679))

(assert (=> b!1009673 m!933677))

(assert (=> b!1009560 d!119755))

(declare-fun b!1009692 () Bool)

(declare-fun e!568035 () Bool)

(declare-fun e!568034 () Bool)

(assert (=> b!1009692 (= e!568035 e!568034)))

(declare-fun c!101845 () Bool)

(assert (=> b!1009692 (= c!101845 (validKeyInArray!0 (select (arr!30600 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1009693 () Bool)

(declare-fun e!568036 () Bool)

(assert (=> b!1009693 (= e!568036 e!568035)))

(declare-fun res!678323 () Bool)

(assert (=> b!1009693 (=> (not res!678323) (not e!568035))))

(declare-fun e!568033 () Bool)

(assert (=> b!1009693 (= res!678323 (not e!568033))))

(declare-fun res!678324 () Bool)

(assert (=> b!1009693 (=> (not res!678324) (not e!568033))))

(assert (=> b!1009693 (= res!678324 (validKeyInArray!0 (select (arr!30600 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1009694 () Bool)

(declare-fun contains!5863 (List!21342 (_ BitVec 64)) Bool)

(assert (=> b!1009694 (= e!568033 (contains!5863 Nil!21339 (select (arr!30600 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1009695 () Bool)

(declare-fun call!42367 () Bool)

(assert (=> b!1009695 (= e!568034 call!42367)))

(declare-fun b!1009696 () Bool)

(assert (=> b!1009696 (= e!568034 call!42367)))

(declare-fun d!119757 () Bool)

(declare-fun res!678322 () Bool)

(assert (=> d!119757 (=> res!678322 e!568036)))

(assert (=> d!119757 (= res!678322 (bvsge #b00000000000000000000000000000000 (size!31104 a!3219)))))

(assert (=> d!119757 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21339) e!568036)))

(declare-fun bm!42364 () Bool)

(assert (=> bm!42364 (= call!42367 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101845 (Cons!21338 (select (arr!30600 a!3219) #b00000000000000000000000000000000) Nil!21339) Nil!21339)))))

(assert (= (and d!119757 (not res!678322)) b!1009693))

(assert (= (and b!1009693 res!678324) b!1009694))

(assert (= (and b!1009693 res!678323) b!1009692))

(assert (= (and b!1009692 c!101845) b!1009695))

(assert (= (and b!1009692 (not c!101845)) b!1009696))

(assert (= (or b!1009695 b!1009696) bm!42364))

(declare-fun m!933681 () Bool)

(assert (=> b!1009692 m!933681))

(assert (=> b!1009692 m!933681))

(declare-fun m!933683 () Bool)

(assert (=> b!1009692 m!933683))

(assert (=> b!1009693 m!933681))

(assert (=> b!1009693 m!933681))

(assert (=> b!1009693 m!933683))

(assert (=> b!1009694 m!933681))

(assert (=> b!1009694 m!933681))

(declare-fun m!933685 () Bool)

(assert (=> b!1009694 m!933685))

(assert (=> bm!42364 m!933681))

(declare-fun m!933687 () Bool)

(assert (=> bm!42364 m!933687))

(assert (=> b!1009561 d!119757))

(declare-fun d!119759 () Bool)

(declare-fun e!568040 () Bool)

(assert (=> d!119759 e!568040))

(declare-fun c!101847 () Bool)

(declare-fun lt!446122 () SeekEntryResult!9557)

(assert (=> d!119759 (= c!101847 (and ((_ is Intermediate!9557) lt!446122) (undefined!10369 lt!446122)))))

(declare-fun e!568037 () SeekEntryResult!9557)

(assert (=> d!119759 (= lt!446122 e!568037)))

(declare-fun c!101846 () Bool)

(assert (=> d!119759 (= c!101846 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!446123 () (_ BitVec 64))

(assert (=> d!119759 (= lt!446123 (select (arr!30600 a!3219) index!1507))))

(assert (=> d!119759 (validMask!0 mask!3464)))

(assert (=> d!119759 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30600 a!3219) j!170) a!3219 mask!3464) lt!446122)))

(declare-fun b!1009697 () Bool)

(assert (=> b!1009697 (and (bvsge (index!40601 lt!446122) #b00000000000000000000000000000000) (bvslt (index!40601 lt!446122) (size!31104 a!3219)))))

(declare-fun res!678325 () Bool)

(assert (=> b!1009697 (= res!678325 (= (select (arr!30600 a!3219) (index!40601 lt!446122)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!568039 () Bool)

(assert (=> b!1009697 (=> res!678325 e!568039)))

(declare-fun b!1009698 () Bool)

(declare-fun e!568041 () Bool)

(assert (=> b!1009698 (= e!568040 e!568041)))

(declare-fun res!678326 () Bool)

(assert (=> b!1009698 (= res!678326 (and ((_ is Intermediate!9557) lt!446122) (not (undefined!10369 lt!446122)) (bvslt (x!88013 lt!446122) #b01111111111111111111111111111110) (bvsge (x!88013 lt!446122) #b00000000000000000000000000000000) (bvsge (x!88013 lt!446122) x!1245)))))

(assert (=> b!1009698 (=> (not res!678326) (not e!568041))))

(declare-fun b!1009699 () Bool)

(declare-fun e!568038 () SeekEntryResult!9557)

(assert (=> b!1009699 (= e!568038 (Intermediate!9557 false index!1507 x!1245))))

(declare-fun b!1009700 () Bool)

(assert (=> b!1009700 (and (bvsge (index!40601 lt!446122) #b00000000000000000000000000000000) (bvslt (index!40601 lt!446122) (size!31104 a!3219)))))

(assert (=> b!1009700 (= e!568039 (= (select (arr!30600 a!3219) (index!40601 lt!446122)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1009701 () Bool)

(assert (=> b!1009701 (= e!568040 (bvsge (x!88013 lt!446122) #b01111111111111111111111111111110))))

(declare-fun b!1009702 () Bool)

(assert (=> b!1009702 (and (bvsge (index!40601 lt!446122) #b00000000000000000000000000000000) (bvslt (index!40601 lt!446122) (size!31104 a!3219)))))

(declare-fun res!678327 () Bool)

(assert (=> b!1009702 (= res!678327 (= (select (arr!30600 a!3219) (index!40601 lt!446122)) (select (arr!30600 a!3219) j!170)))))

(assert (=> b!1009702 (=> res!678327 e!568039)))

(assert (=> b!1009702 (= e!568041 e!568039)))

(declare-fun b!1009703 () Bool)

(assert (=> b!1009703 (= e!568038 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30600 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009704 () Bool)

(assert (=> b!1009704 (= e!568037 e!568038)))

(declare-fun c!101848 () Bool)

(assert (=> b!1009704 (= c!101848 (or (= lt!446123 (select (arr!30600 a!3219) j!170)) (= (bvadd lt!446123 lt!446123) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1009705 () Bool)

(assert (=> b!1009705 (= e!568037 (Intermediate!9557 true index!1507 x!1245))))

(assert (= (and d!119759 c!101846) b!1009705))

(assert (= (and d!119759 (not c!101846)) b!1009704))

(assert (= (and b!1009704 c!101848) b!1009699))

(assert (= (and b!1009704 (not c!101848)) b!1009703))

(assert (= (and d!119759 c!101847) b!1009701))

(assert (= (and d!119759 (not c!101847)) b!1009698))

(assert (= (and b!1009698 res!678326) b!1009702))

(assert (= (and b!1009702 (not res!678327)) b!1009697))

(assert (= (and b!1009697 (not res!678325)) b!1009700))

(declare-fun m!933689 () Bool)

(assert (=> d!119759 m!933689))

(assert (=> d!119759 m!933583))

(declare-fun m!933691 () Bool)

(assert (=> b!1009700 m!933691))

(assert (=> b!1009702 m!933691))

(assert (=> b!1009703 m!933567))

(assert (=> b!1009703 m!933567))

(assert (=> b!1009703 m!933573))

(declare-fun m!933693 () Bool)

(assert (=> b!1009703 m!933693))

(assert (=> b!1009697 m!933691))

(assert (=> b!1009550 d!119759))

(declare-fun d!119761 () Bool)

(declare-fun res!678332 () Bool)

(declare-fun e!568046 () Bool)

(assert (=> d!119761 (=> res!678332 e!568046)))

(assert (=> d!119761 (= res!678332 (= (select (arr!30600 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!119761 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!568046)))

(declare-fun b!1009710 () Bool)

(declare-fun e!568047 () Bool)

(assert (=> b!1009710 (= e!568046 e!568047)))

(declare-fun res!678333 () Bool)

(assert (=> b!1009710 (=> (not res!678333) (not e!568047))))

(assert (=> b!1009710 (= res!678333 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31104 a!3219)))))

(declare-fun b!1009711 () Bool)

(assert (=> b!1009711 (= e!568047 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119761 (not res!678332)) b!1009710))

(assert (= (and b!1009710 res!678333) b!1009711))

(assert (=> d!119761 m!933681))

(declare-fun m!933695 () Bool)

(assert (=> b!1009711 m!933695))

(assert (=> b!1009557 d!119761))

(declare-fun d!119767 () Bool)

(declare-fun lt!446126 () (_ BitVec 32))

(assert (=> d!119767 (and (bvsge lt!446126 #b00000000000000000000000000000000) (bvslt lt!446126 (bvadd mask!3464 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!119767 (= lt!446126 (choose!52 index!1507 x!1245 mask!3464))))

(assert (=> d!119767 (validMask!0 mask!3464)))

(assert (=> d!119767 (= (nextIndex!0 index!1507 x!1245 mask!3464) lt!446126)))

(declare-fun bs!28684 () Bool)

(assert (= bs!28684 d!119767))

(declare-fun m!933697 () Bool)

(assert (=> bs!28684 m!933697))

(assert (=> bs!28684 m!933583))

(assert (=> b!1009554 d!119767))

(declare-fun d!119769 () Bool)

(declare-fun e!568051 () Bool)

(assert (=> d!119769 e!568051))

(declare-fun c!101850 () Bool)

(declare-fun lt!446127 () SeekEntryResult!9557)

(assert (=> d!119769 (= c!101850 (and ((_ is Intermediate!9557) lt!446127) (undefined!10369 lt!446127)))))

(declare-fun e!568048 () SeekEntryResult!9557)

(assert (=> d!119769 (= lt!446127 e!568048)))

(declare-fun c!101849 () Bool)

(assert (=> d!119769 (= c!101849 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!446128 () (_ BitVec 64))

(assert (=> d!119769 (= lt!446128 (select (arr!30600 a!3219) (toIndex!0 (select (arr!30600 a!3219) j!170) mask!3464)))))

(assert (=> d!119769 (validMask!0 mask!3464)))

(assert (=> d!119769 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30600 a!3219) j!170) mask!3464) (select (arr!30600 a!3219) j!170) a!3219 mask!3464) lt!446127)))

(declare-fun b!1009712 () Bool)

(assert (=> b!1009712 (and (bvsge (index!40601 lt!446127) #b00000000000000000000000000000000) (bvslt (index!40601 lt!446127) (size!31104 a!3219)))))

(declare-fun res!678334 () Bool)

(assert (=> b!1009712 (= res!678334 (= (select (arr!30600 a!3219) (index!40601 lt!446127)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!568050 () Bool)

(assert (=> b!1009712 (=> res!678334 e!568050)))

(declare-fun b!1009713 () Bool)

(declare-fun e!568052 () Bool)

(assert (=> b!1009713 (= e!568051 e!568052)))

(declare-fun res!678335 () Bool)

(assert (=> b!1009713 (= res!678335 (and ((_ is Intermediate!9557) lt!446127) (not (undefined!10369 lt!446127)) (bvslt (x!88013 lt!446127) #b01111111111111111111111111111110) (bvsge (x!88013 lt!446127) #b00000000000000000000000000000000) (bvsge (x!88013 lt!446127) #b00000000000000000000000000000000)))))

(assert (=> b!1009713 (=> (not res!678335) (not e!568052))))

(declare-fun b!1009714 () Bool)

(declare-fun e!568049 () SeekEntryResult!9557)

(assert (=> b!1009714 (= e!568049 (Intermediate!9557 false (toIndex!0 (select (arr!30600 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1009715 () Bool)

(assert (=> b!1009715 (and (bvsge (index!40601 lt!446127) #b00000000000000000000000000000000) (bvslt (index!40601 lt!446127) (size!31104 a!3219)))))

(assert (=> b!1009715 (= e!568050 (= (select (arr!30600 a!3219) (index!40601 lt!446127)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1009716 () Bool)

(assert (=> b!1009716 (= e!568051 (bvsge (x!88013 lt!446127) #b01111111111111111111111111111110))))

(declare-fun b!1009717 () Bool)

(assert (=> b!1009717 (and (bvsge (index!40601 lt!446127) #b00000000000000000000000000000000) (bvslt (index!40601 lt!446127) (size!31104 a!3219)))))

(declare-fun res!678336 () Bool)

(assert (=> b!1009717 (= res!678336 (= (select (arr!30600 a!3219) (index!40601 lt!446127)) (select (arr!30600 a!3219) j!170)))))

(assert (=> b!1009717 (=> res!678336 e!568050)))

(assert (=> b!1009717 (= e!568052 e!568050)))

(declare-fun b!1009718 () Bool)

(assert (=> b!1009718 (= e!568049 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30600 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30600 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009719 () Bool)

(assert (=> b!1009719 (= e!568048 e!568049)))

(declare-fun c!101851 () Bool)

(assert (=> b!1009719 (= c!101851 (or (= lt!446128 (select (arr!30600 a!3219) j!170)) (= (bvadd lt!446128 lt!446128) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1009720 () Bool)

(assert (=> b!1009720 (= e!568048 (Intermediate!9557 true (toIndex!0 (select (arr!30600 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(assert (= (and d!119769 c!101849) b!1009720))

(assert (= (and d!119769 (not c!101849)) b!1009719))

(assert (= (and b!1009719 c!101851) b!1009714))

(assert (= (and b!1009719 (not c!101851)) b!1009718))

(assert (= (and d!119769 c!101850) b!1009716))

(assert (= (and d!119769 (not c!101850)) b!1009713))

(assert (= (and b!1009713 res!678335) b!1009717))

(assert (= (and b!1009717 (not res!678336)) b!1009712))

(assert (= (and b!1009712 (not res!678334)) b!1009715))

(assert (=> d!119769 m!933575))

(declare-fun m!933699 () Bool)

(assert (=> d!119769 m!933699))

(assert (=> d!119769 m!933583))

(declare-fun m!933701 () Bool)

(assert (=> b!1009715 m!933701))

(assert (=> b!1009717 m!933701))

(assert (=> b!1009718 m!933575))

(declare-fun m!933703 () Bool)

(assert (=> b!1009718 m!933703))

(assert (=> b!1009718 m!933703))

(assert (=> b!1009718 m!933573))

(declare-fun m!933705 () Bool)

(assert (=> b!1009718 m!933705))

(assert (=> b!1009712 m!933701))

(assert (=> b!1009556 d!119769))

(declare-fun d!119771 () Bool)

(declare-fun lt!446130 () (_ BitVec 32))

(declare-fun lt!446129 () (_ BitVec 32))

(assert (=> d!119771 (= lt!446130 (bvmul (bvxor lt!446129 (bvlshr lt!446129 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119771 (= lt!446129 ((_ extract 31 0) (bvand (bvxor (select (arr!30600 a!3219) j!170) (bvlshr (select (arr!30600 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119771 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!678312 (let ((h!22530 ((_ extract 31 0) (bvand (bvxor (select (arr!30600 a!3219) j!170) (bvlshr (select (arr!30600 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!88017 (bvmul (bvxor h!22530 (bvlshr h!22530 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!88017 (bvlshr x!88017 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!678312 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!678312 #b00000000000000000000000000000000))))))

(assert (=> d!119771 (= (toIndex!0 (select (arr!30600 a!3219) j!170) mask!3464) (bvand (bvxor lt!446130 (bvlshr lt!446130 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1009556 d!119771))

(declare-fun d!119773 () Bool)

(assert (=> d!119773 (= (validKeyInArray!0 (select (arr!30600 a!3219) j!170)) (and (not (= (select (arr!30600 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30600 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1009555 d!119773))

(declare-fun d!119775 () Bool)

(assert (=> d!119775 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!87048 d!119775))

(declare-fun d!119779 () Bool)

(assert (=> d!119779 (= (array_inv!23743 a!3219) (bvsge (size!31104 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!87048 d!119779))

(declare-fun b!1009799 () Bool)

(declare-fun e!568098 () SeekEntryResult!9557)

(declare-fun lt!446173 () SeekEntryResult!9557)

(assert (=> b!1009799 (= e!568098 (MissingZero!9557 (index!40601 lt!446173)))))

(declare-fun b!1009800 () Bool)

(declare-fun c!101882 () Bool)

(declare-fun lt!446174 () (_ BitVec 64))

(assert (=> b!1009800 (= c!101882 (= lt!446174 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!568099 () SeekEntryResult!9557)

(assert (=> b!1009800 (= e!568099 e!568098)))

(declare-fun b!1009801 () Bool)

(declare-fun e!568097 () SeekEntryResult!9557)

(assert (=> b!1009801 (= e!568097 Undefined!9557)))

(declare-fun d!119781 () Bool)

(declare-fun lt!446172 () SeekEntryResult!9557)

(assert (=> d!119781 (and (or ((_ is Undefined!9557) lt!446172) (not ((_ is Found!9557) lt!446172)) (and (bvsge (index!40600 lt!446172) #b00000000000000000000000000000000) (bvslt (index!40600 lt!446172) (size!31104 a!3219)))) (or ((_ is Undefined!9557) lt!446172) ((_ is Found!9557) lt!446172) (not ((_ is MissingZero!9557) lt!446172)) (and (bvsge (index!40599 lt!446172) #b00000000000000000000000000000000) (bvslt (index!40599 lt!446172) (size!31104 a!3219)))) (or ((_ is Undefined!9557) lt!446172) ((_ is Found!9557) lt!446172) ((_ is MissingZero!9557) lt!446172) (not ((_ is MissingVacant!9557) lt!446172)) (and (bvsge (index!40602 lt!446172) #b00000000000000000000000000000000) (bvslt (index!40602 lt!446172) (size!31104 a!3219)))) (or ((_ is Undefined!9557) lt!446172) (ite ((_ is Found!9557) lt!446172) (= (select (arr!30600 a!3219) (index!40600 lt!446172)) k0!2224) (ite ((_ is MissingZero!9557) lt!446172) (= (select (arr!30600 a!3219) (index!40599 lt!446172)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9557) lt!446172) (= (select (arr!30600 a!3219) (index!40602 lt!446172)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!119781 (= lt!446172 e!568097)))

(declare-fun c!101883 () Bool)

(assert (=> d!119781 (= c!101883 (and ((_ is Intermediate!9557) lt!446173) (undefined!10369 lt!446173)))))

(assert (=> d!119781 (= lt!446173 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!119781 (validMask!0 mask!3464)))

(assert (=> d!119781 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!446172)))

(declare-fun b!1009802 () Bool)

(assert (=> b!1009802 (= e!568097 e!568099)))

(assert (=> b!1009802 (= lt!446174 (select (arr!30600 a!3219) (index!40601 lt!446173)))))

(declare-fun c!101884 () Bool)

(assert (=> b!1009802 (= c!101884 (= lt!446174 k0!2224))))

(declare-fun b!1009803 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63562 (_ BitVec 32)) SeekEntryResult!9557)

(assert (=> b!1009803 (= e!568098 (seekKeyOrZeroReturnVacant!0 (x!88013 lt!446173) (index!40601 lt!446173) (index!40601 lt!446173) k0!2224 a!3219 mask!3464))))

(declare-fun b!1009804 () Bool)

(assert (=> b!1009804 (= e!568099 (Found!9557 (index!40601 lt!446173)))))

(assert (= (and d!119781 c!101883) b!1009801))

(assert (= (and d!119781 (not c!101883)) b!1009802))

(assert (= (and b!1009802 c!101884) b!1009804))

(assert (= (and b!1009802 (not c!101884)) b!1009800))

(assert (= (and b!1009800 c!101882) b!1009799))

(assert (= (and b!1009800 (not c!101882)) b!1009803))

(declare-fun m!933749 () Bool)

(assert (=> d!119781 m!933749))

(declare-fun m!933751 () Bool)

(assert (=> d!119781 m!933751))

(declare-fun m!933753 () Bool)

(assert (=> d!119781 m!933753))

(declare-fun m!933755 () Bool)

(assert (=> d!119781 m!933755))

(declare-fun m!933757 () Bool)

(assert (=> d!119781 m!933757))

(assert (=> d!119781 m!933583))

(assert (=> d!119781 m!933753))

(declare-fun m!933759 () Bool)

(assert (=> b!1009802 m!933759))

(declare-fun m!933761 () Bool)

(assert (=> b!1009803 m!933761))

(assert (=> b!1009552 d!119781))

(declare-fun b!1009828 () Bool)

(declare-fun e!568118 () Bool)

(declare-fun e!568119 () Bool)

(assert (=> b!1009828 (= e!568118 e!568119)))

(declare-fun c!101890 () Bool)

(assert (=> b!1009828 (= c!101890 (validKeyInArray!0 (select (arr!30600 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!119797 () Bool)

(declare-fun res!678370 () Bool)

(assert (=> d!119797 (=> res!678370 e!568118)))

(assert (=> d!119797 (= res!678370 (bvsge #b00000000000000000000000000000000 (size!31104 a!3219)))))

(assert (=> d!119797 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!568118)))

(declare-fun b!1009829 () Bool)

(declare-fun e!568120 () Bool)

(assert (=> b!1009829 (= e!568119 e!568120)))

(declare-fun lt!446183 () (_ BitVec 64))

(assert (=> b!1009829 (= lt!446183 (select (arr!30600 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32895 0))(
  ( (Unit!32896) )
))
(declare-fun lt!446182 () Unit!32895)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63562 (_ BitVec 64) (_ BitVec 32)) Unit!32895)

(assert (=> b!1009829 (= lt!446182 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!446183 #b00000000000000000000000000000000))))

(assert (=> b!1009829 (arrayContainsKey!0 a!3219 lt!446183 #b00000000000000000000000000000000)))

(declare-fun lt!446181 () Unit!32895)

(assert (=> b!1009829 (= lt!446181 lt!446182)))

(declare-fun res!678369 () Bool)

(assert (=> b!1009829 (= res!678369 (= (seekEntryOrOpen!0 (select (arr!30600 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9557 #b00000000000000000000000000000000)))))

(assert (=> b!1009829 (=> (not res!678369) (not e!568120))))

(declare-fun b!1009830 () Bool)

(declare-fun call!42376 () Bool)

(assert (=> b!1009830 (= e!568120 call!42376)))

(declare-fun b!1009831 () Bool)

(assert (=> b!1009831 (= e!568119 call!42376)))

(declare-fun bm!42373 () Bool)

(assert (=> bm!42373 (= call!42376 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(assert (= (and d!119797 (not res!678370)) b!1009828))

(assert (= (and b!1009828 c!101890) b!1009829))

(assert (= (and b!1009828 (not c!101890)) b!1009831))

(assert (= (and b!1009829 res!678369) b!1009830))

(assert (= (or b!1009830 b!1009831) bm!42373))

(assert (=> b!1009828 m!933681))

(assert (=> b!1009828 m!933681))

(assert (=> b!1009828 m!933683))

(assert (=> b!1009829 m!933681))

(declare-fun m!933771 () Bool)

(assert (=> b!1009829 m!933771))

(declare-fun m!933773 () Bool)

(assert (=> b!1009829 m!933773))

(assert (=> b!1009829 m!933681))

(declare-fun m!933775 () Bool)

(assert (=> b!1009829 m!933775))

(declare-fun m!933777 () Bool)

(assert (=> bm!42373 m!933777))

(assert (=> b!1009551 d!119797))

(declare-fun d!119809 () Bool)

(assert (=> d!119809 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1009553 d!119809))

(check-sat (not b!1009718) (not d!119767) (not b!1009803) (not b!1009679) (not bm!42364) (not b!1009703) (not b!1009711) (not b!1009670) (not d!119769) (not b!1009692) (not b!1009694) (not b!1009829) (not b!1009828) (not d!119751) (not bm!42373) (not d!119759) (not b!1009693) (not d!119755) (not d!119781))
(check-sat)
