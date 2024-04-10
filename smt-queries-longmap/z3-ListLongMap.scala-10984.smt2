; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128654 () Bool)

(assert start!128654)

(declare-fun b!1508004 () Bool)

(declare-fun e!842500 () Bool)

(declare-fun e!842499 () Bool)

(assert (=> b!1508004 (= e!842500 e!842499)))

(declare-fun res!1028120 () Bool)

(assert (=> b!1508004 (=> (not res!1028120) (not e!842499))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100588 0))(
  ( (array!100589 (arr!48534 (Array (_ BitVec 32) (_ BitVec 64))) (size!49084 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100588)

(declare-datatypes ((SeekEntryResult!12705 0))(
  ( (MissingZero!12705 (index!53215 (_ BitVec 32))) (Found!12705 (index!53216 (_ BitVec 32))) (Intermediate!12705 (undefined!13517 Bool) (index!53217 (_ BitVec 32)) (x!134971 (_ BitVec 32))) (Undefined!12705) (MissingVacant!12705 (index!53218 (_ BitVec 32))) )
))
(declare-fun lt!654511 () SeekEntryResult!12705)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100588 (_ BitVec 32)) SeekEntryResult!12705)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508004 (= res!1028120 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48534 a!2804) j!70) mask!2512) (select (arr!48534 a!2804) j!70) a!2804 mask!2512) lt!654511))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1508004 (= lt!654511 (Intermediate!12705 false resIndex!21 resX!21))))

(declare-fun b!1508005 () Bool)

(declare-fun res!1028118 () Bool)

(assert (=> b!1508005 (=> (not res!1028118) (not e!842500))))

(declare-datatypes ((List!35017 0))(
  ( (Nil!35014) (Cons!35013 (h!36419 (_ BitVec 64)) (t!49711 List!35017)) )
))
(declare-fun arrayNoDuplicates!0 (array!100588 (_ BitVec 32) List!35017) Bool)

(assert (=> b!1508005 (= res!1028118 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35014))))

(declare-fun b!1508006 () Bool)

(declare-fun res!1028122 () Bool)

(assert (=> b!1508006 (=> (not res!1028122) (not e!842500))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100588 (_ BitVec 32)) Bool)

(assert (=> b!1508006 (= res!1028122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508007 () Bool)

(declare-fun res!1028121 () Bool)

(assert (=> b!1508007 (=> (not res!1028121) (not e!842500))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1508007 (= res!1028121 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49084 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49084 a!2804))))))

(declare-fun b!1508008 () Bool)

(declare-fun res!1028119 () Bool)

(assert (=> b!1508008 (=> (not res!1028119) (not e!842500))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1508008 (= res!1028119 (and (= (size!49084 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49084 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49084 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508010 () Bool)

(declare-fun res!1028125 () Bool)

(assert (=> b!1508010 (=> (not res!1028125) (not e!842500))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508010 (= res!1028125 (validKeyInArray!0 (select (arr!48534 a!2804) j!70)))))

(declare-fun b!1508011 () Bool)

(declare-fun res!1028123 () Bool)

(assert (=> b!1508011 (=> (not res!1028123) (not e!842500))))

(assert (=> b!1508011 (= res!1028123 (validKeyInArray!0 (select (arr!48534 a!2804) i!961)))))

(declare-fun b!1508012 () Bool)

(declare-fun res!1028124 () Bool)

(assert (=> b!1508012 (=> (not res!1028124) (not e!842499))))

(assert (=> b!1508012 (= res!1028124 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48534 a!2804) j!70) a!2804 mask!2512) lt!654511))))

(declare-fun res!1028117 () Bool)

(assert (=> start!128654 (=> (not res!1028117) (not e!842500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128654 (= res!1028117 (validMask!0 mask!2512))))

(assert (=> start!128654 e!842500))

(assert (=> start!128654 true))

(declare-fun array_inv!37562 (array!100588) Bool)

(assert (=> start!128654 (array_inv!37562 a!2804)))

(declare-fun b!1508009 () Bool)

(assert (=> b!1508009 (= e!842499 (and (bvsge mask!2512 #b00000000000000000000000000000000) (bvsgt mask!2512 #b00111111111111111111111111111111)))))

(assert (= (and start!128654 res!1028117) b!1508008))

(assert (= (and b!1508008 res!1028119) b!1508011))

(assert (= (and b!1508011 res!1028123) b!1508010))

(assert (= (and b!1508010 res!1028125) b!1508006))

(assert (= (and b!1508006 res!1028122) b!1508005))

(assert (= (and b!1508005 res!1028118) b!1508007))

(assert (= (and b!1508007 res!1028121) b!1508004))

(assert (= (and b!1508004 res!1028120) b!1508012))

(assert (= (and b!1508012 res!1028124) b!1508009))

(declare-fun m!1390607 () Bool)

(assert (=> b!1508010 m!1390607))

(assert (=> b!1508010 m!1390607))

(declare-fun m!1390609 () Bool)

(assert (=> b!1508010 m!1390609))

(declare-fun m!1390611 () Bool)

(assert (=> start!128654 m!1390611))

(declare-fun m!1390613 () Bool)

(assert (=> start!128654 m!1390613))

(declare-fun m!1390615 () Bool)

(assert (=> b!1508005 m!1390615))

(declare-fun m!1390617 () Bool)

(assert (=> b!1508011 m!1390617))

(assert (=> b!1508011 m!1390617))

(declare-fun m!1390619 () Bool)

(assert (=> b!1508011 m!1390619))

(declare-fun m!1390621 () Bool)

(assert (=> b!1508006 m!1390621))

(assert (=> b!1508012 m!1390607))

(assert (=> b!1508012 m!1390607))

(declare-fun m!1390623 () Bool)

(assert (=> b!1508012 m!1390623))

(assert (=> b!1508004 m!1390607))

(assert (=> b!1508004 m!1390607))

(declare-fun m!1390625 () Bool)

(assert (=> b!1508004 m!1390625))

(assert (=> b!1508004 m!1390625))

(assert (=> b!1508004 m!1390607))

(declare-fun m!1390627 () Bool)

(assert (=> b!1508004 m!1390627))

(check-sat (not b!1508012) (not b!1508006) (not start!128654) (not b!1508010) (not b!1508005) (not b!1508011) (not b!1508004))
(check-sat)
(get-model)

(declare-fun b!1508080 () Bool)

(declare-fun e!842541 () SeekEntryResult!12705)

(assert (=> b!1508080 (= e!842541 (Intermediate!12705 true index!487 x!534))))

(declare-fun b!1508081 () Bool)

(declare-fun lt!654528 () SeekEntryResult!12705)

(assert (=> b!1508081 (and (bvsge (index!53217 lt!654528) #b00000000000000000000000000000000) (bvslt (index!53217 lt!654528) (size!49084 a!2804)))))

(declare-fun res!1028173 () Bool)

(assert (=> b!1508081 (= res!1028173 (= (select (arr!48534 a!2804) (index!53217 lt!654528)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!842537 () Bool)

(assert (=> b!1508081 (=> res!1028173 e!842537)))

(declare-fun e!842540 () SeekEntryResult!12705)

(declare-fun b!1508082 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508082 (= e!842540 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48534 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1508083 () Bool)

(assert (=> b!1508083 (= e!842541 e!842540)))

(declare-fun c!139494 () Bool)

(declare-fun lt!654529 () (_ BitVec 64))

(assert (=> b!1508083 (= c!139494 (or (= lt!654529 (select (arr!48534 a!2804) j!70)) (= (bvadd lt!654529 lt!654529) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1508084 () Bool)

(declare-fun e!842538 () Bool)

(assert (=> b!1508084 (= e!842538 (bvsge (x!134971 lt!654528) #b01111111111111111111111111111110))))

(declare-fun b!1508085 () Bool)

(assert (=> b!1508085 (= e!842540 (Intermediate!12705 false index!487 x!534))))

(declare-fun b!1508086 () Bool)

(declare-fun e!842539 () Bool)

(assert (=> b!1508086 (= e!842538 e!842539)))

(declare-fun res!1028172 () Bool)

(get-info :version)

(assert (=> b!1508086 (= res!1028172 (and ((_ is Intermediate!12705) lt!654528) (not (undefined!13517 lt!654528)) (bvslt (x!134971 lt!654528) #b01111111111111111111111111111110) (bvsge (x!134971 lt!654528) #b00000000000000000000000000000000) (bvsge (x!134971 lt!654528) x!534)))))

(assert (=> b!1508086 (=> (not res!1028172) (not e!842539))))

(declare-fun b!1508087 () Bool)

(assert (=> b!1508087 (and (bvsge (index!53217 lt!654528) #b00000000000000000000000000000000) (bvslt (index!53217 lt!654528) (size!49084 a!2804)))))

(assert (=> b!1508087 (= e!842537 (= (select (arr!48534 a!2804) (index!53217 lt!654528)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1508088 () Bool)

(assert (=> b!1508088 (and (bvsge (index!53217 lt!654528) #b00000000000000000000000000000000) (bvslt (index!53217 lt!654528) (size!49084 a!2804)))))

(declare-fun res!1028171 () Bool)

(assert (=> b!1508088 (= res!1028171 (= (select (arr!48534 a!2804) (index!53217 lt!654528)) (select (arr!48534 a!2804) j!70)))))

(assert (=> b!1508088 (=> res!1028171 e!842537)))

(assert (=> b!1508088 (= e!842539 e!842537)))

(declare-fun d!158383 () Bool)

(assert (=> d!158383 e!842538))

(declare-fun c!139493 () Bool)

(assert (=> d!158383 (= c!139493 (and ((_ is Intermediate!12705) lt!654528) (undefined!13517 lt!654528)))))

(assert (=> d!158383 (= lt!654528 e!842541)))

(declare-fun c!139495 () Bool)

(assert (=> d!158383 (= c!139495 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!158383 (= lt!654529 (select (arr!48534 a!2804) index!487))))

(assert (=> d!158383 (validMask!0 mask!2512)))

(assert (=> d!158383 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48534 a!2804) j!70) a!2804 mask!2512) lt!654528)))

(assert (= (and d!158383 c!139495) b!1508080))

(assert (= (and d!158383 (not c!139495)) b!1508083))

(assert (= (and b!1508083 c!139494) b!1508085))

(assert (= (and b!1508083 (not c!139494)) b!1508082))

(assert (= (and d!158383 c!139493) b!1508084))

(assert (= (and d!158383 (not c!139493)) b!1508086))

(assert (= (and b!1508086 res!1028172) b!1508088))

(assert (= (and b!1508088 (not res!1028171)) b!1508081))

(assert (= (and b!1508081 (not res!1028173)) b!1508087))

(declare-fun m!1390663 () Bool)

(assert (=> d!158383 m!1390663))

(assert (=> d!158383 m!1390611))

(declare-fun m!1390665 () Bool)

(assert (=> b!1508087 m!1390665))

(assert (=> b!1508081 m!1390665))

(assert (=> b!1508088 m!1390665))

(declare-fun m!1390667 () Bool)

(assert (=> b!1508082 m!1390667))

(assert (=> b!1508082 m!1390667))

(assert (=> b!1508082 m!1390607))

(declare-fun m!1390669 () Bool)

(assert (=> b!1508082 m!1390669))

(assert (=> b!1508012 d!158383))

(declare-fun e!842546 () SeekEntryResult!12705)

(declare-fun b!1508089 () Bool)

(assert (=> b!1508089 (= e!842546 (Intermediate!12705 true (toIndex!0 (select (arr!48534 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1508090 () Bool)

(declare-fun lt!654530 () SeekEntryResult!12705)

(assert (=> b!1508090 (and (bvsge (index!53217 lt!654530) #b00000000000000000000000000000000) (bvslt (index!53217 lt!654530) (size!49084 a!2804)))))

(declare-fun res!1028176 () Bool)

(assert (=> b!1508090 (= res!1028176 (= (select (arr!48534 a!2804) (index!53217 lt!654530)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!842542 () Bool)

(assert (=> b!1508090 (=> res!1028176 e!842542)))

(declare-fun e!842545 () SeekEntryResult!12705)

(declare-fun b!1508091 () Bool)

(assert (=> b!1508091 (= e!842545 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48534 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48534 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1508092 () Bool)

(assert (=> b!1508092 (= e!842546 e!842545)))

(declare-fun c!139497 () Bool)

(declare-fun lt!654531 () (_ BitVec 64))

(assert (=> b!1508092 (= c!139497 (or (= lt!654531 (select (arr!48534 a!2804) j!70)) (= (bvadd lt!654531 lt!654531) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1508093 () Bool)

(declare-fun e!842543 () Bool)

(assert (=> b!1508093 (= e!842543 (bvsge (x!134971 lt!654530) #b01111111111111111111111111111110))))

(declare-fun b!1508094 () Bool)

(assert (=> b!1508094 (= e!842545 (Intermediate!12705 false (toIndex!0 (select (arr!48534 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1508095 () Bool)

(declare-fun e!842544 () Bool)

(assert (=> b!1508095 (= e!842543 e!842544)))

(declare-fun res!1028175 () Bool)

(assert (=> b!1508095 (= res!1028175 (and ((_ is Intermediate!12705) lt!654530) (not (undefined!13517 lt!654530)) (bvslt (x!134971 lt!654530) #b01111111111111111111111111111110) (bvsge (x!134971 lt!654530) #b00000000000000000000000000000000) (bvsge (x!134971 lt!654530) #b00000000000000000000000000000000)))))

(assert (=> b!1508095 (=> (not res!1028175) (not e!842544))))

(declare-fun b!1508096 () Bool)

(assert (=> b!1508096 (and (bvsge (index!53217 lt!654530) #b00000000000000000000000000000000) (bvslt (index!53217 lt!654530) (size!49084 a!2804)))))

(assert (=> b!1508096 (= e!842542 (= (select (arr!48534 a!2804) (index!53217 lt!654530)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1508097 () Bool)

(assert (=> b!1508097 (and (bvsge (index!53217 lt!654530) #b00000000000000000000000000000000) (bvslt (index!53217 lt!654530) (size!49084 a!2804)))))

(declare-fun res!1028174 () Bool)

(assert (=> b!1508097 (= res!1028174 (= (select (arr!48534 a!2804) (index!53217 lt!654530)) (select (arr!48534 a!2804) j!70)))))

(assert (=> b!1508097 (=> res!1028174 e!842542)))

(assert (=> b!1508097 (= e!842544 e!842542)))

(declare-fun d!158397 () Bool)

(assert (=> d!158397 e!842543))

(declare-fun c!139496 () Bool)

(assert (=> d!158397 (= c!139496 (and ((_ is Intermediate!12705) lt!654530) (undefined!13517 lt!654530)))))

(assert (=> d!158397 (= lt!654530 e!842546)))

(declare-fun c!139498 () Bool)

(assert (=> d!158397 (= c!139498 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!158397 (= lt!654531 (select (arr!48534 a!2804) (toIndex!0 (select (arr!48534 a!2804) j!70) mask!2512)))))

(assert (=> d!158397 (validMask!0 mask!2512)))

(assert (=> d!158397 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48534 a!2804) j!70) mask!2512) (select (arr!48534 a!2804) j!70) a!2804 mask!2512) lt!654530)))

(assert (= (and d!158397 c!139498) b!1508089))

(assert (= (and d!158397 (not c!139498)) b!1508092))

(assert (= (and b!1508092 c!139497) b!1508094))

(assert (= (and b!1508092 (not c!139497)) b!1508091))

(assert (= (and d!158397 c!139496) b!1508093))

(assert (= (and d!158397 (not c!139496)) b!1508095))

(assert (= (and b!1508095 res!1028175) b!1508097))

(assert (= (and b!1508097 (not res!1028174)) b!1508090))

(assert (= (and b!1508090 (not res!1028176)) b!1508096))

(assert (=> d!158397 m!1390625))

(declare-fun m!1390671 () Bool)

(assert (=> d!158397 m!1390671))

(assert (=> d!158397 m!1390611))

(declare-fun m!1390673 () Bool)

(assert (=> b!1508096 m!1390673))

(assert (=> b!1508090 m!1390673))

(assert (=> b!1508097 m!1390673))

(assert (=> b!1508091 m!1390625))

(declare-fun m!1390675 () Bool)

(assert (=> b!1508091 m!1390675))

(assert (=> b!1508091 m!1390675))

(assert (=> b!1508091 m!1390607))

(declare-fun m!1390677 () Bool)

(assert (=> b!1508091 m!1390677))

(assert (=> b!1508004 d!158397))

(declare-fun d!158399 () Bool)

(declare-fun lt!654537 () (_ BitVec 32))

(declare-fun lt!654536 () (_ BitVec 32))

(assert (=> d!158399 (= lt!654537 (bvmul (bvxor lt!654536 (bvlshr lt!654536 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158399 (= lt!654536 ((_ extract 31 0) (bvand (bvxor (select (arr!48534 a!2804) j!70) (bvlshr (select (arr!48534 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158399 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1028182 (let ((h!36421 ((_ extract 31 0) (bvand (bvxor (select (arr!48534 a!2804) j!70) (bvlshr (select (arr!48534 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!134974 (bvmul (bvxor h!36421 (bvlshr h!36421 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!134974 (bvlshr x!134974 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1028182 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1028182 #b00000000000000000000000000000000))))))

(assert (=> d!158399 (= (toIndex!0 (select (arr!48534 a!2804) j!70) mask!2512) (bvand (bvxor lt!654537 (bvlshr lt!654537 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1508004 d!158399))

(declare-fun b!1508128 () Bool)

(declare-fun e!842573 () Bool)

(declare-fun call!68286 () Bool)

(assert (=> b!1508128 (= e!842573 call!68286)))

(declare-fun b!1508129 () Bool)

(declare-fun e!842574 () Bool)

(declare-fun e!842571 () Bool)

(assert (=> b!1508129 (= e!842574 e!842571)))

(declare-fun res!1028196 () Bool)

(assert (=> b!1508129 (=> (not res!1028196) (not e!842571))))

(declare-fun e!842572 () Bool)

(assert (=> b!1508129 (= res!1028196 (not e!842572))))

(declare-fun res!1028197 () Bool)

(assert (=> b!1508129 (=> (not res!1028197) (not e!842572))))

(assert (=> b!1508129 (= res!1028197 (validKeyInArray!0 (select (arr!48534 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1508130 () Bool)

(assert (=> b!1508130 (= e!842571 e!842573)))

(declare-fun c!139505 () Bool)

(assert (=> b!1508130 (= c!139505 (validKeyInArray!0 (select (arr!48534 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68283 () Bool)

(assert (=> bm!68283 (= call!68286 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139505 (Cons!35013 (select (arr!48534 a!2804) #b00000000000000000000000000000000) Nil!35014) Nil!35014)))))

(declare-fun d!158407 () Bool)

(declare-fun res!1028198 () Bool)

(assert (=> d!158407 (=> res!1028198 e!842574)))

(assert (=> d!158407 (= res!1028198 (bvsge #b00000000000000000000000000000000 (size!49084 a!2804)))))

(assert (=> d!158407 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35014) e!842574)))

(declare-fun b!1508131 () Bool)

(declare-fun contains!9971 (List!35017 (_ BitVec 64)) Bool)

(assert (=> b!1508131 (= e!842572 (contains!9971 Nil!35014 (select (arr!48534 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1508132 () Bool)

(assert (=> b!1508132 (= e!842573 call!68286)))

(assert (= (and d!158407 (not res!1028198)) b!1508129))

(assert (= (and b!1508129 res!1028197) b!1508131))

(assert (= (and b!1508129 res!1028196) b!1508130))

(assert (= (and b!1508130 c!139505) b!1508132))

(assert (= (and b!1508130 (not c!139505)) b!1508128))

(assert (= (or b!1508132 b!1508128) bm!68283))

(declare-fun m!1390691 () Bool)

(assert (=> b!1508129 m!1390691))

(assert (=> b!1508129 m!1390691))

(declare-fun m!1390693 () Bool)

(assert (=> b!1508129 m!1390693))

(assert (=> b!1508130 m!1390691))

(assert (=> b!1508130 m!1390691))

(assert (=> b!1508130 m!1390693))

(assert (=> bm!68283 m!1390691))

(declare-fun m!1390695 () Bool)

(assert (=> bm!68283 m!1390695))

(assert (=> b!1508131 m!1390691))

(assert (=> b!1508131 m!1390691))

(declare-fun m!1390697 () Bool)

(assert (=> b!1508131 m!1390697))

(assert (=> b!1508005 d!158407))

(declare-fun d!158409 () Bool)

(assert (=> d!158409 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128654 d!158409))

(declare-fun d!158419 () Bool)

(assert (=> d!158419 (= (array_inv!37562 a!2804) (bvsge (size!49084 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128654 d!158419))

(declare-fun d!158421 () Bool)

(assert (=> d!158421 (= (validKeyInArray!0 (select (arr!48534 a!2804) j!70)) (and (not (= (select (arr!48534 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48534 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1508010 d!158421))

(declare-fun d!158423 () Bool)

(assert (=> d!158423 (= (validKeyInArray!0 (select (arr!48534 a!2804) i!961)) (and (not (= (select (arr!48534 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48534 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1508011 d!158423))

(declare-fun bm!68289 () Bool)

(declare-fun call!68292 () Bool)

(assert (=> bm!68289 (= call!68292 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1508165 () Bool)

(declare-fun e!842597 () Bool)

(assert (=> b!1508165 (= e!842597 call!68292)))

(declare-fun b!1508166 () Bool)

(declare-fun e!842596 () Bool)

(assert (=> b!1508166 (= e!842596 e!842597)))

(declare-fun lt!654557 () (_ BitVec 64))

(assert (=> b!1508166 (= lt!654557 (select (arr!48534 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50338 0))(
  ( (Unit!50339) )
))
(declare-fun lt!654559 () Unit!50338)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100588 (_ BitVec 64) (_ BitVec 32)) Unit!50338)

(assert (=> b!1508166 (= lt!654559 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!654557 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100588 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1508166 (arrayContainsKey!0 a!2804 lt!654557 #b00000000000000000000000000000000)))

(declare-fun lt!654558 () Unit!50338)

(assert (=> b!1508166 (= lt!654558 lt!654559)))

(declare-fun res!1028210 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100588 (_ BitVec 32)) SeekEntryResult!12705)

(assert (=> b!1508166 (= res!1028210 (= (seekEntryOrOpen!0 (select (arr!48534 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12705 #b00000000000000000000000000000000)))))

(assert (=> b!1508166 (=> (not res!1028210) (not e!842597))))

(declare-fun d!158425 () Bool)

(declare-fun res!1028209 () Bool)

(declare-fun e!842598 () Bool)

(assert (=> d!158425 (=> res!1028209 e!842598)))

(assert (=> d!158425 (= res!1028209 (bvsge #b00000000000000000000000000000000 (size!49084 a!2804)))))

(assert (=> d!158425 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!842598)))

(declare-fun b!1508167 () Bool)

(assert (=> b!1508167 (= e!842596 call!68292)))

(declare-fun b!1508168 () Bool)

(assert (=> b!1508168 (= e!842598 e!842596)))

(declare-fun c!139517 () Bool)

(assert (=> b!1508168 (= c!139517 (validKeyInArray!0 (select (arr!48534 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!158425 (not res!1028209)) b!1508168))

(assert (= (and b!1508168 c!139517) b!1508166))

(assert (= (and b!1508168 (not c!139517)) b!1508167))

(assert (= (and b!1508166 res!1028210) b!1508165))

(assert (= (or b!1508165 b!1508167) bm!68289))

(declare-fun m!1390707 () Bool)

(assert (=> bm!68289 m!1390707))

(assert (=> b!1508166 m!1390691))

(declare-fun m!1390709 () Bool)

(assert (=> b!1508166 m!1390709))

(declare-fun m!1390711 () Bool)

(assert (=> b!1508166 m!1390711))

(assert (=> b!1508166 m!1390691))

(declare-fun m!1390713 () Bool)

(assert (=> b!1508166 m!1390713))

(assert (=> b!1508168 m!1390691))

(assert (=> b!1508168 m!1390691))

(assert (=> b!1508168 m!1390693))

(assert (=> b!1508006 d!158425))

(check-sat (not b!1508168) (not b!1508091) (not b!1508131) (not d!158397) (not b!1508082) (not b!1508130) (not b!1508129) (not bm!68289) (not bm!68283) (not b!1508166) (not d!158383))
(check-sat)
