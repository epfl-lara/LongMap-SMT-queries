; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31578 () Bool)

(assert start!31578)

(declare-fun res!171163 () Bool)

(declare-fun e!196481 () Bool)

(assert (=> start!31578 (=> (not res!171163) (not e!196481))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31578 (= res!171163 (validMask!0 mask!3709))))

(assert (=> start!31578 e!196481))

(declare-datatypes ((array!16106 0))(
  ( (array!16107 (arr!7623 (Array (_ BitVec 32) (_ BitVec 64))) (size!7976 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16106)

(declare-fun array_inv!5595 (array!16106) Bool)

(assert (=> start!31578 (array_inv!5595 a!3293)))

(assert (=> start!31578 true))

(declare-fun b!315875 () Bool)

(declare-fun e!196484 () Bool)

(declare-fun e!196483 () Bool)

(assert (=> b!315875 (= e!196484 e!196483)))

(declare-fun res!171161 () Bool)

(assert (=> b!315875 (=> (not res!171161) (not e!196483))))

(declare-datatypes ((SeekEntryResult!2762 0))(
  ( (MissingZero!2762 (index!13224 (_ BitVec 32))) (Found!2762 (index!13225 (_ BitVec 32))) (Intermediate!2762 (undefined!3574 Bool) (index!13226 (_ BitVec 32)) (x!31483 (_ BitVec 32))) (Undefined!2762) (MissingVacant!2762 (index!13227 (_ BitVec 32))) )
))
(declare-fun lt!154226 () SeekEntryResult!2762)

(declare-fun lt!154224 () SeekEntryResult!2762)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!315875 (= res!171161 (and (= lt!154224 lt!154226) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7623 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16106 (_ BitVec 32)) SeekEntryResult!2762)

(assert (=> b!315875 (= lt!154224 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!315876 () Bool)

(declare-datatypes ((Unit!9731 0))(
  ( (Unit!9732) )
))
(declare-fun e!196487 () Unit!9731)

(declare-fun e!196486 () Unit!9731)

(assert (=> b!315876 (= e!196487 e!196486)))

(declare-fun c!49976 () Bool)

(assert (=> b!315876 (= c!49976 (or (= (select (arr!7623 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7623 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315877 () Bool)

(declare-fun res!171166 () Bool)

(assert (=> b!315877 (=> (not res!171166) (not e!196481))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!315877 (= res!171166 (and (= (size!7976 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7976 a!3293))))))

(declare-fun b!315878 () Bool)

(declare-fun res!171164 () Bool)

(assert (=> b!315878 (=> (not res!171164) (not e!196481))))

(declare-fun arrayContainsKey!0 (array!16106 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!315878 (= res!171164 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!315879 () Bool)

(assert (=> b!315879 false))

(declare-fun lt!154223 () SeekEntryResult!2762)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315879 (= lt!154223 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9733 () Unit!9731)

(assert (=> b!315879 (= e!196486 Unit!9733)))

(declare-fun b!315880 () Bool)

(declare-fun res!171162 () Bool)

(assert (=> b!315880 (=> (not res!171162) (not e!196481))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!315880 (= res!171162 (validKeyInArray!0 k0!2441))))

(declare-fun b!315881 () Bool)

(assert (=> b!315881 false))

(declare-fun Unit!9734 () Unit!9731)

(assert (=> b!315881 (= e!196486 Unit!9734)))

(declare-fun b!315882 () Bool)

(declare-fun res!171167 () Bool)

(assert (=> b!315882 (=> (not res!171167) (not e!196481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16106 (_ BitVec 32)) Bool)

(assert (=> b!315882 (= res!171167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!315883 () Bool)

(declare-fun res!171159 () Bool)

(assert (=> b!315883 (=> (not res!171159) (not e!196481))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16106 (_ BitVec 32)) SeekEntryResult!2762)

(assert (=> b!315883 (= res!171159 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2762 i!1240)))))

(declare-fun b!315884 () Bool)

(assert (=> b!315884 (= e!196481 e!196484)))

(declare-fun res!171160 () Bool)

(assert (=> b!315884 (=> (not res!171160) (not e!196484))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315884 (= res!171160 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154226))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!315884 (= lt!154226 (Intermediate!2762 false resIndex!52 resX!52))))

(declare-fun b!315885 () Bool)

(declare-fun e!196485 () Bool)

(assert (=> b!315885 (= e!196483 (not e!196485))))

(declare-fun res!171168 () Bool)

(assert (=> b!315885 (=> res!171168 e!196485)))

(assert (=> b!315885 (= res!171168 (not (= (select (arr!7623 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!315885 (= index!1781 resIndex!52)))

(declare-fun lt!154225 () Unit!9731)

(assert (=> b!315885 (= lt!154225 e!196487)))

(declare-fun c!49975 () Bool)

(assert (=> b!315885 (= c!49975 (not (= resIndex!52 index!1781)))))

(declare-fun b!315886 () Bool)

(assert (=> b!315886 (= e!196485 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 (array!16107 (store (arr!7623 a!3293) i!1240 k0!2441) (size!7976 a!3293)) mask!3709) lt!154224))))

(declare-fun b!315887 () Bool)

(declare-fun res!171165 () Bool)

(assert (=> b!315887 (=> (not res!171165) (not e!196484))))

(assert (=> b!315887 (= res!171165 (and (= (select (arr!7623 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7976 a!3293))))))

(declare-fun b!315888 () Bool)

(declare-fun Unit!9735 () Unit!9731)

(assert (=> b!315888 (= e!196487 Unit!9735)))

(assert (= (and start!31578 res!171163) b!315877))

(assert (= (and b!315877 res!171166) b!315880))

(assert (= (and b!315880 res!171162) b!315878))

(assert (= (and b!315878 res!171164) b!315883))

(assert (= (and b!315883 res!171159) b!315882))

(assert (= (and b!315882 res!171167) b!315884))

(assert (= (and b!315884 res!171160) b!315887))

(assert (= (and b!315887 res!171165) b!315875))

(assert (= (and b!315875 res!171161) b!315885))

(assert (= (and b!315885 c!49975) b!315876))

(assert (= (and b!315885 (not c!49975)) b!315888))

(assert (= (and b!315876 c!49976) b!315881))

(assert (= (and b!315876 (not c!49976)) b!315879))

(assert (= (and b!315885 (not res!171168)) b!315886))

(declare-fun m!324415 () Bool)

(assert (=> b!315879 m!324415))

(assert (=> b!315879 m!324415))

(declare-fun m!324417 () Bool)

(assert (=> b!315879 m!324417))

(declare-fun m!324419 () Bool)

(assert (=> b!315882 m!324419))

(declare-fun m!324421 () Bool)

(assert (=> b!315880 m!324421))

(declare-fun m!324423 () Bool)

(assert (=> b!315884 m!324423))

(assert (=> b!315884 m!324423))

(declare-fun m!324425 () Bool)

(assert (=> b!315884 m!324425))

(declare-fun m!324427 () Bool)

(assert (=> b!315885 m!324427))

(declare-fun m!324429 () Bool)

(assert (=> b!315887 m!324429))

(declare-fun m!324431 () Bool)

(assert (=> start!31578 m!324431))

(declare-fun m!324433 () Bool)

(assert (=> start!31578 m!324433))

(assert (=> b!315875 m!324427))

(declare-fun m!324435 () Bool)

(assert (=> b!315875 m!324435))

(declare-fun m!324437 () Bool)

(assert (=> b!315886 m!324437))

(declare-fun m!324439 () Bool)

(assert (=> b!315886 m!324439))

(declare-fun m!324441 () Bool)

(assert (=> b!315878 m!324441))

(declare-fun m!324443 () Bool)

(assert (=> b!315883 m!324443))

(assert (=> b!315876 m!324427))

(check-sat (not b!315875) (not b!315878) (not b!315884) (not b!315879) (not b!315882) (not b!315886) (not b!315883) (not b!315880) (not start!31578))
(check-sat)
(get-model)

(declare-fun e!196551 () SeekEntryResult!2762)

(declare-fun b!316003 () Bool)

(assert (=> b!316003 (= e!196551 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!316004 () Bool)

(declare-fun e!196553 () Bool)

(declare-fun lt!154265 () SeekEntryResult!2762)

(assert (=> b!316004 (= e!196553 (bvsge (x!31483 lt!154265) #b01111111111111111111111111111110))))

(declare-fun b!316005 () Bool)

(assert (=> b!316005 (and (bvsge (index!13226 lt!154265) #b00000000000000000000000000000000) (bvslt (index!13226 lt!154265) (size!7976 a!3293)))))

(declare-fun res!171242 () Bool)

(assert (=> b!316005 (= res!171242 (= (select (arr!7623 a!3293) (index!13226 lt!154265)) k0!2441))))

(declare-fun e!196550 () Bool)

(assert (=> b!316005 (=> res!171242 e!196550)))

(declare-fun e!196549 () Bool)

(assert (=> b!316005 (= e!196549 e!196550)))

(declare-fun b!316006 () Bool)

(assert (=> b!316006 (and (bvsge (index!13226 lt!154265) #b00000000000000000000000000000000) (bvslt (index!13226 lt!154265) (size!7976 a!3293)))))

(assert (=> b!316006 (= e!196550 (= (select (arr!7623 a!3293) (index!13226 lt!154265)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!316007 () Bool)

(assert (=> b!316007 (and (bvsge (index!13226 lt!154265) #b00000000000000000000000000000000) (bvslt (index!13226 lt!154265) (size!7976 a!3293)))))

(declare-fun res!171241 () Bool)

(assert (=> b!316007 (= res!171241 (= (select (arr!7623 a!3293) (index!13226 lt!154265)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!316007 (=> res!171241 e!196550)))

(declare-fun b!316008 () Bool)

(assert (=> b!316008 (= e!196551 (Intermediate!2762 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun d!68769 () Bool)

(assert (=> d!68769 e!196553))

(declare-fun c!49998 () Bool)

(get-info :version)

(assert (=> d!68769 (= c!49998 (and ((_ is Intermediate!2762) lt!154265) (undefined!3574 lt!154265)))))

(declare-fun e!196552 () SeekEntryResult!2762)

(assert (=> d!68769 (= lt!154265 e!196552)))

(declare-fun c!50000 () Bool)

(assert (=> d!68769 (= c!50000 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!154264 () (_ BitVec 64))

(assert (=> d!68769 (= lt!154264 (select (arr!7623 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68769 (validMask!0 mask!3709)))

(assert (=> d!68769 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154265)))

(declare-fun b!316009 () Bool)

(assert (=> b!316009 (= e!196552 e!196551)))

(declare-fun c!49999 () Bool)

(assert (=> b!316009 (= c!49999 (or (= lt!154264 k0!2441) (= (bvadd lt!154264 lt!154264) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!316010 () Bool)

(assert (=> b!316010 (= e!196552 (Intermediate!2762 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!316011 () Bool)

(assert (=> b!316011 (= e!196553 e!196549)))

(declare-fun res!171243 () Bool)

(assert (=> b!316011 (= res!171243 (and ((_ is Intermediate!2762) lt!154265) (not (undefined!3574 lt!154265)) (bvslt (x!31483 lt!154265) #b01111111111111111111111111111110) (bvsge (x!31483 lt!154265) #b00000000000000000000000000000000) (bvsge (x!31483 lt!154265) #b00000000000000000000000000000000)))))

(assert (=> b!316011 (=> (not res!171243) (not e!196549))))

(assert (= (and d!68769 c!50000) b!316010))

(assert (= (and d!68769 (not c!50000)) b!316009))

(assert (= (and b!316009 c!49999) b!316008))

(assert (= (and b!316009 (not c!49999)) b!316003))

(assert (= (and d!68769 c!49998) b!316004))

(assert (= (and d!68769 (not c!49998)) b!316011))

(assert (= (and b!316011 res!171243) b!316005))

(assert (= (and b!316005 (not res!171242)) b!316007))

(assert (= (and b!316007 (not res!171241)) b!316006))

(assert (=> d!68769 m!324423))

(declare-fun m!324517 () Bool)

(assert (=> d!68769 m!324517))

(assert (=> d!68769 m!324431))

(declare-fun m!324519 () Bool)

(assert (=> b!316006 m!324519))

(assert (=> b!316003 m!324423))

(declare-fun m!324521 () Bool)

(assert (=> b!316003 m!324521))

(assert (=> b!316003 m!324521))

(declare-fun m!324523 () Bool)

(assert (=> b!316003 m!324523))

(assert (=> b!316005 m!324519))

(assert (=> b!316007 m!324519))

(assert (=> b!315884 d!68769))

(declare-fun d!68777 () Bool)

(declare-fun lt!154271 () (_ BitVec 32))

(declare-fun lt!154270 () (_ BitVec 32))

(assert (=> d!68777 (= lt!154271 (bvmul (bvxor lt!154270 (bvlshr lt!154270 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68777 (= lt!154270 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68777 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!171244 (let ((h!5338 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31487 (bvmul (bvxor h!5338 (bvlshr h!5338 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31487 (bvlshr x!31487 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!171244 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!171244 #b00000000000000000000000000000000))))))

(assert (=> d!68777 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!154271 (bvlshr lt!154271 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!315884 d!68777))

(declare-fun e!196562 () SeekEntryResult!2762)

(declare-fun b!316018 () Bool)

(assert (=> b!316018 (= e!196562 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!316019 () Bool)

(declare-fun e!196564 () Bool)

(declare-fun lt!154273 () SeekEntryResult!2762)

(assert (=> b!316019 (= e!196564 (bvsge (x!31483 lt!154273) #b01111111111111111111111111111110))))

(declare-fun b!316020 () Bool)

(assert (=> b!316020 (and (bvsge (index!13226 lt!154273) #b00000000000000000000000000000000) (bvslt (index!13226 lt!154273) (size!7976 a!3293)))))

(declare-fun res!171252 () Bool)

(assert (=> b!316020 (= res!171252 (= (select (arr!7623 a!3293) (index!13226 lt!154273)) k0!2441))))

(declare-fun e!196561 () Bool)

(assert (=> b!316020 (=> res!171252 e!196561)))

(declare-fun e!196560 () Bool)

(assert (=> b!316020 (= e!196560 e!196561)))

(declare-fun b!316021 () Bool)

(assert (=> b!316021 (and (bvsge (index!13226 lt!154273) #b00000000000000000000000000000000) (bvslt (index!13226 lt!154273) (size!7976 a!3293)))))

(assert (=> b!316021 (= e!196561 (= (select (arr!7623 a!3293) (index!13226 lt!154273)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!316022 () Bool)

(assert (=> b!316022 (and (bvsge (index!13226 lt!154273) #b00000000000000000000000000000000) (bvslt (index!13226 lt!154273) (size!7976 a!3293)))))

(declare-fun res!171251 () Bool)

(assert (=> b!316022 (= res!171251 (= (select (arr!7623 a!3293) (index!13226 lt!154273)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!316022 (=> res!171251 e!196561)))

(declare-fun b!316023 () Bool)

(assert (=> b!316023 (= e!196562 (Intermediate!2762 false (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun d!68783 () Bool)

(assert (=> d!68783 e!196564))

(declare-fun c!50001 () Bool)

(assert (=> d!68783 (= c!50001 (and ((_ is Intermediate!2762) lt!154273) (undefined!3574 lt!154273)))))

(declare-fun e!196563 () SeekEntryResult!2762)

(assert (=> d!68783 (= lt!154273 e!196563)))

(declare-fun c!50003 () Bool)

(assert (=> d!68783 (= c!50003 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(declare-fun lt!154272 () (_ BitVec 64))

(assert (=> d!68783 (= lt!154272 (select (arr!7623 a!3293) (nextIndex!0 index!1781 x!1427 mask!3709)))))

(assert (=> d!68783 (validMask!0 mask!3709)))

(assert (=> d!68783 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709) lt!154273)))

(declare-fun b!316024 () Bool)

(assert (=> b!316024 (= e!196563 e!196562)))

(declare-fun c!50002 () Bool)

(assert (=> b!316024 (= c!50002 (or (= lt!154272 k0!2441) (= (bvadd lt!154272 lt!154272) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!316025 () Bool)

(assert (=> b!316025 (= e!196563 (Intermediate!2762 true (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!316026 () Bool)

(assert (=> b!316026 (= e!196564 e!196560)))

(declare-fun res!171253 () Bool)

(assert (=> b!316026 (= res!171253 (and ((_ is Intermediate!2762) lt!154273) (not (undefined!3574 lt!154273)) (bvslt (x!31483 lt!154273) #b01111111111111111111111111111110) (bvsge (x!31483 lt!154273) #b00000000000000000000000000000000) (bvsge (x!31483 lt!154273) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!316026 (=> (not res!171253) (not e!196560))))

(assert (= (and d!68783 c!50003) b!316025))

(assert (= (and d!68783 (not c!50003)) b!316024))

(assert (= (and b!316024 c!50002) b!316023))

(assert (= (and b!316024 (not c!50002)) b!316018))

(assert (= (and d!68783 c!50001) b!316019))

(assert (= (and d!68783 (not c!50001)) b!316026))

(assert (= (and b!316026 res!171253) b!316020))

(assert (= (and b!316020 (not res!171252)) b!316022))

(assert (= (and b!316022 (not res!171251)) b!316021))

(assert (=> d!68783 m!324415))

(declare-fun m!324527 () Bool)

(assert (=> d!68783 m!324527))

(assert (=> d!68783 m!324431))

(declare-fun m!324529 () Bool)

(assert (=> b!316021 m!324529))

(assert (=> b!316018 m!324415))

(declare-fun m!324531 () Bool)

(assert (=> b!316018 m!324531))

(assert (=> b!316018 m!324531))

(declare-fun m!324533 () Bool)

(assert (=> b!316018 m!324533))

(assert (=> b!316020 m!324529))

(assert (=> b!316022 m!324529))

(assert (=> b!315879 d!68783))

(declare-fun d!68785 () Bool)

(declare-fun lt!154280 () (_ BitVec 32))

(assert (=> d!68785 (and (bvsge lt!154280 #b00000000000000000000000000000000) (bvslt lt!154280 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!68785 (= lt!154280 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!68785 (validMask!0 mask!3709)))

(assert (=> d!68785 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!154280)))

(declare-fun bs!11015 () Bool)

(assert (= bs!11015 d!68785))

(declare-fun m!324535 () Bool)

(assert (=> bs!11015 m!324535))

(assert (=> bs!11015 m!324431))

(assert (=> b!315879 d!68785))

(declare-fun d!68787 () Bool)

(assert (=> d!68787 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!315880 d!68787))

(declare-fun b!316045 () Bool)

(declare-fun e!196577 () SeekEntryResult!2762)

(assert (=> b!316045 (= e!196577 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!316046 () Bool)

(declare-fun e!196579 () Bool)

(declare-fun lt!154282 () SeekEntryResult!2762)

(assert (=> b!316046 (= e!196579 (bvsge (x!31483 lt!154282) #b01111111111111111111111111111110))))

(declare-fun b!316047 () Bool)

(assert (=> b!316047 (and (bvsge (index!13226 lt!154282) #b00000000000000000000000000000000) (bvslt (index!13226 lt!154282) (size!7976 a!3293)))))

(declare-fun res!171261 () Bool)

(assert (=> b!316047 (= res!171261 (= (select (arr!7623 a!3293) (index!13226 lt!154282)) k0!2441))))

(declare-fun e!196576 () Bool)

(assert (=> b!316047 (=> res!171261 e!196576)))

(declare-fun e!196575 () Bool)

(assert (=> b!316047 (= e!196575 e!196576)))

(declare-fun b!316048 () Bool)

(assert (=> b!316048 (and (bvsge (index!13226 lt!154282) #b00000000000000000000000000000000) (bvslt (index!13226 lt!154282) (size!7976 a!3293)))))

(assert (=> b!316048 (= e!196576 (= (select (arr!7623 a!3293) (index!13226 lt!154282)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!316049 () Bool)

(assert (=> b!316049 (and (bvsge (index!13226 lt!154282) #b00000000000000000000000000000000) (bvslt (index!13226 lt!154282) (size!7976 a!3293)))))

(declare-fun res!171260 () Bool)

(assert (=> b!316049 (= res!171260 (= (select (arr!7623 a!3293) (index!13226 lt!154282)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!316049 (=> res!171260 e!196576)))

(declare-fun b!316050 () Bool)

(assert (=> b!316050 (= e!196577 (Intermediate!2762 false index!1781 x!1427))))

(declare-fun d!68789 () Bool)

(assert (=> d!68789 e!196579))

(declare-fun c!50010 () Bool)

(assert (=> d!68789 (= c!50010 (and ((_ is Intermediate!2762) lt!154282) (undefined!3574 lt!154282)))))

(declare-fun e!196578 () SeekEntryResult!2762)

(assert (=> d!68789 (= lt!154282 e!196578)))

(declare-fun c!50012 () Bool)

(assert (=> d!68789 (= c!50012 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!154281 () (_ BitVec 64))

(assert (=> d!68789 (= lt!154281 (select (arr!7623 a!3293) index!1781))))

(assert (=> d!68789 (validMask!0 mask!3709)))

(assert (=> d!68789 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!154282)))

(declare-fun b!316051 () Bool)

(assert (=> b!316051 (= e!196578 e!196577)))

(declare-fun c!50011 () Bool)

(assert (=> b!316051 (= c!50011 (or (= lt!154281 k0!2441) (= (bvadd lt!154281 lt!154281) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!316052 () Bool)

(assert (=> b!316052 (= e!196578 (Intermediate!2762 true index!1781 x!1427))))

(declare-fun b!316053 () Bool)

(assert (=> b!316053 (= e!196579 e!196575)))

(declare-fun res!171262 () Bool)

(assert (=> b!316053 (= res!171262 (and ((_ is Intermediate!2762) lt!154282) (not (undefined!3574 lt!154282)) (bvslt (x!31483 lt!154282) #b01111111111111111111111111111110) (bvsge (x!31483 lt!154282) #b00000000000000000000000000000000) (bvsge (x!31483 lt!154282) x!1427)))))

(assert (=> b!316053 (=> (not res!171262) (not e!196575))))

(assert (= (and d!68789 c!50012) b!316052))

(assert (= (and d!68789 (not c!50012)) b!316051))

(assert (= (and b!316051 c!50011) b!316050))

(assert (= (and b!316051 (not c!50011)) b!316045))

(assert (= (and d!68789 c!50010) b!316046))

(assert (= (and d!68789 (not c!50010)) b!316053))

(assert (= (and b!316053 res!171262) b!316047))

(assert (= (and b!316047 (not res!171261)) b!316049))

(assert (= (and b!316049 (not res!171260)) b!316048))

(assert (=> d!68789 m!324427))

(assert (=> d!68789 m!324431))

(declare-fun m!324537 () Bool)

(assert (=> b!316048 m!324537))

(assert (=> b!316045 m!324415))

(assert (=> b!316045 m!324415))

(declare-fun m!324539 () Bool)

(assert (=> b!316045 m!324539))

(assert (=> b!316047 m!324537))

(assert (=> b!316049 m!324537))

(assert (=> b!315875 d!68789))

(declare-fun d!68791 () Bool)

(assert (=> d!68791 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31578 d!68791))

(declare-fun d!68797 () Bool)

(assert (=> d!68797 (= (array_inv!5595 a!3293) (bvsge (size!7976 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31578 d!68797))

(declare-fun e!196593 () SeekEntryResult!2762)

(declare-fun b!316075 () Bool)

(assert (=> b!316075 (= e!196593 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 (array!16107 (store (arr!7623 a!3293) i!1240 k0!2441) (size!7976 a!3293)) mask!3709))))

(declare-fun b!316076 () Bool)

(declare-fun e!196595 () Bool)

(declare-fun lt!154298 () SeekEntryResult!2762)

(assert (=> b!316076 (= e!196595 (bvsge (x!31483 lt!154298) #b01111111111111111111111111111110))))

(declare-fun b!316077 () Bool)

(assert (=> b!316077 (and (bvsge (index!13226 lt!154298) #b00000000000000000000000000000000) (bvslt (index!13226 lt!154298) (size!7976 (array!16107 (store (arr!7623 a!3293) i!1240 k0!2441) (size!7976 a!3293)))))))

(declare-fun res!171268 () Bool)

(assert (=> b!316077 (= res!171268 (= (select (arr!7623 (array!16107 (store (arr!7623 a!3293) i!1240 k0!2441) (size!7976 a!3293))) (index!13226 lt!154298)) k0!2441))))

(declare-fun e!196592 () Bool)

(assert (=> b!316077 (=> res!171268 e!196592)))

(declare-fun e!196591 () Bool)

(assert (=> b!316077 (= e!196591 e!196592)))

(declare-fun b!316078 () Bool)

(assert (=> b!316078 (and (bvsge (index!13226 lt!154298) #b00000000000000000000000000000000) (bvslt (index!13226 lt!154298) (size!7976 (array!16107 (store (arr!7623 a!3293) i!1240 k0!2441) (size!7976 a!3293)))))))

(assert (=> b!316078 (= e!196592 (= (select (arr!7623 (array!16107 (store (arr!7623 a!3293) i!1240 k0!2441) (size!7976 a!3293))) (index!13226 lt!154298)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!316079 () Bool)

(assert (=> b!316079 (and (bvsge (index!13226 lt!154298) #b00000000000000000000000000000000) (bvslt (index!13226 lt!154298) (size!7976 (array!16107 (store (arr!7623 a!3293) i!1240 k0!2441) (size!7976 a!3293)))))))

(declare-fun res!171267 () Bool)

(assert (=> b!316079 (= res!171267 (= (select (arr!7623 (array!16107 (store (arr!7623 a!3293) i!1240 k0!2441) (size!7976 a!3293))) (index!13226 lt!154298)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!316079 (=> res!171267 e!196592)))

(declare-fun b!316080 () Bool)

(assert (=> b!316080 (= e!196593 (Intermediate!2762 false index!1781 x!1427))))

(declare-fun d!68799 () Bool)

(assert (=> d!68799 e!196595))

(declare-fun c!50022 () Bool)

(assert (=> d!68799 (= c!50022 (and ((_ is Intermediate!2762) lt!154298) (undefined!3574 lt!154298)))))

(declare-fun e!196594 () SeekEntryResult!2762)

(assert (=> d!68799 (= lt!154298 e!196594)))

(declare-fun c!50024 () Bool)

(assert (=> d!68799 (= c!50024 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!154297 () (_ BitVec 64))

(assert (=> d!68799 (= lt!154297 (select (arr!7623 (array!16107 (store (arr!7623 a!3293) i!1240 k0!2441) (size!7976 a!3293))) index!1781))))

(assert (=> d!68799 (validMask!0 mask!3709)))

(assert (=> d!68799 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 (array!16107 (store (arr!7623 a!3293) i!1240 k0!2441) (size!7976 a!3293)) mask!3709) lt!154298)))

(declare-fun b!316081 () Bool)

(assert (=> b!316081 (= e!196594 e!196593)))

(declare-fun c!50023 () Bool)

(assert (=> b!316081 (= c!50023 (or (= lt!154297 k0!2441) (= (bvadd lt!154297 lt!154297) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!316082 () Bool)

(assert (=> b!316082 (= e!196594 (Intermediate!2762 true index!1781 x!1427))))

(declare-fun b!316083 () Bool)

(assert (=> b!316083 (= e!196595 e!196591)))

(declare-fun res!171269 () Bool)

(assert (=> b!316083 (= res!171269 (and ((_ is Intermediate!2762) lt!154298) (not (undefined!3574 lt!154298)) (bvslt (x!31483 lt!154298) #b01111111111111111111111111111110) (bvsge (x!31483 lt!154298) #b00000000000000000000000000000000) (bvsge (x!31483 lt!154298) x!1427)))))

(assert (=> b!316083 (=> (not res!171269) (not e!196591))))

(assert (= (and d!68799 c!50024) b!316082))

(assert (= (and d!68799 (not c!50024)) b!316081))

(assert (= (and b!316081 c!50023) b!316080))

(assert (= (and b!316081 (not c!50023)) b!316075))

(assert (= (and d!68799 c!50022) b!316076))

(assert (= (and d!68799 (not c!50022)) b!316083))

(assert (= (and b!316083 res!171269) b!316077))

(assert (= (and b!316077 (not res!171268)) b!316079))

(assert (= (and b!316079 (not res!171267)) b!316078))

(declare-fun m!324549 () Bool)

(assert (=> d!68799 m!324549))

(assert (=> d!68799 m!324431))

(declare-fun m!324551 () Bool)

(assert (=> b!316078 m!324551))

(assert (=> b!316075 m!324415))

(assert (=> b!316075 m!324415))

(declare-fun m!324553 () Bool)

(assert (=> b!316075 m!324553))

(assert (=> b!316077 m!324551))

(assert (=> b!316079 m!324551))

(assert (=> b!315886 d!68799))

(declare-fun b!316098 () Bool)

(declare-fun e!196605 () Bool)

(declare-fun call!25979 () Bool)

(assert (=> b!316098 (= e!196605 call!25979)))

(declare-fun d!68801 () Bool)

(declare-fun res!171275 () Bool)

(declare-fun e!196607 () Bool)

(assert (=> d!68801 (=> res!171275 e!196607)))

(assert (=> d!68801 (= res!171275 (bvsge #b00000000000000000000000000000000 (size!7976 a!3293)))))

(assert (=> d!68801 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!196607)))

(declare-fun b!316099 () Bool)

(declare-fun e!196606 () Bool)

(assert (=> b!316099 (= e!196606 call!25979)))

(declare-fun b!316100 () Bool)

(assert (=> b!316100 (= e!196607 e!196605)))

(declare-fun c!50030 () Bool)

(assert (=> b!316100 (= c!50030 (validKeyInArray!0 (select (arr!7623 a!3293) #b00000000000000000000000000000000)))))

(declare-fun bm!25976 () Bool)

(assert (=> bm!25976 (= call!25979 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!316101 () Bool)

(assert (=> b!316101 (= e!196605 e!196606)))

(declare-fun lt!154308 () (_ BitVec 64))

(assert (=> b!316101 (= lt!154308 (select (arr!7623 a!3293) #b00000000000000000000000000000000))))

(declare-fun lt!154310 () Unit!9731)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16106 (_ BitVec 64) (_ BitVec 32)) Unit!9731)

(assert (=> b!316101 (= lt!154310 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!154308 #b00000000000000000000000000000000))))

(assert (=> b!316101 (arrayContainsKey!0 a!3293 lt!154308 #b00000000000000000000000000000000)))

(declare-fun lt!154309 () Unit!9731)

(assert (=> b!316101 (= lt!154309 lt!154310)))

(declare-fun res!171274 () Bool)

(assert (=> b!316101 (= res!171274 (= (seekEntryOrOpen!0 (select (arr!7623 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2762 #b00000000000000000000000000000000)))))

(assert (=> b!316101 (=> (not res!171274) (not e!196606))))

(assert (= (and d!68801 (not res!171275)) b!316100))

(assert (= (and b!316100 c!50030) b!316101))

(assert (= (and b!316100 (not c!50030)) b!316098))

(assert (= (and b!316101 res!171274) b!316099))

(assert (= (or b!316099 b!316098) bm!25976))

(declare-fun m!324565 () Bool)

(assert (=> b!316100 m!324565))

(assert (=> b!316100 m!324565))

(declare-fun m!324567 () Bool)

(assert (=> b!316100 m!324567))

(declare-fun m!324569 () Bool)

(assert (=> bm!25976 m!324569))

(assert (=> b!316101 m!324565))

(declare-fun m!324571 () Bool)

(assert (=> b!316101 m!324571))

(declare-fun m!324573 () Bool)

(assert (=> b!316101 m!324573))

(assert (=> b!316101 m!324565))

(declare-fun m!324575 () Bool)

(assert (=> b!316101 m!324575))

(assert (=> b!315882 d!68801))

(declare-fun b!316159 () Bool)

(declare-fun e!196640 () SeekEntryResult!2762)

(declare-fun lt!154336 () SeekEntryResult!2762)

(assert (=> b!316159 (= e!196640 (MissingZero!2762 (index!13226 lt!154336)))))

(declare-fun b!316160 () Bool)

(declare-fun c!50056 () Bool)

(declare-fun lt!154335 () (_ BitVec 64))

(assert (=> b!316160 (= c!50056 (= lt!154335 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196639 () SeekEntryResult!2762)

(assert (=> b!316160 (= e!196639 e!196640)))

(declare-fun b!316161 () Bool)

(assert (=> b!316161 (= e!196639 (Found!2762 (index!13226 lt!154336)))))

(declare-fun b!316162 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16106 (_ BitVec 32)) SeekEntryResult!2762)

(assert (=> b!316162 (= e!196640 (seekKeyOrZeroReturnVacant!0 (x!31483 lt!154336) (index!13226 lt!154336) (index!13226 lt!154336) k0!2441 a!3293 mask!3709))))

(declare-fun b!316163 () Bool)

(declare-fun e!196638 () SeekEntryResult!2762)

(assert (=> b!316163 (= e!196638 Undefined!2762)))

(declare-fun d!68809 () Bool)

(declare-fun lt!154337 () SeekEntryResult!2762)

(assert (=> d!68809 (and (or ((_ is Undefined!2762) lt!154337) (not ((_ is Found!2762) lt!154337)) (and (bvsge (index!13225 lt!154337) #b00000000000000000000000000000000) (bvslt (index!13225 lt!154337) (size!7976 a!3293)))) (or ((_ is Undefined!2762) lt!154337) ((_ is Found!2762) lt!154337) (not ((_ is MissingZero!2762) lt!154337)) (and (bvsge (index!13224 lt!154337) #b00000000000000000000000000000000) (bvslt (index!13224 lt!154337) (size!7976 a!3293)))) (or ((_ is Undefined!2762) lt!154337) ((_ is Found!2762) lt!154337) ((_ is MissingZero!2762) lt!154337) (not ((_ is MissingVacant!2762) lt!154337)) (and (bvsge (index!13227 lt!154337) #b00000000000000000000000000000000) (bvslt (index!13227 lt!154337) (size!7976 a!3293)))) (or ((_ is Undefined!2762) lt!154337) (ite ((_ is Found!2762) lt!154337) (= (select (arr!7623 a!3293) (index!13225 lt!154337)) k0!2441) (ite ((_ is MissingZero!2762) lt!154337) (= (select (arr!7623 a!3293) (index!13224 lt!154337)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2762) lt!154337) (= (select (arr!7623 a!3293) (index!13227 lt!154337)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68809 (= lt!154337 e!196638)))

(declare-fun c!50057 () Bool)

(assert (=> d!68809 (= c!50057 (and ((_ is Intermediate!2762) lt!154336) (undefined!3574 lt!154336)))))

(assert (=> d!68809 (= lt!154336 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68809 (validMask!0 mask!3709)))

(assert (=> d!68809 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!154337)))

(declare-fun b!316164 () Bool)

(assert (=> b!316164 (= e!196638 e!196639)))

(assert (=> b!316164 (= lt!154335 (select (arr!7623 a!3293) (index!13226 lt!154336)))))

(declare-fun c!50055 () Bool)

(assert (=> b!316164 (= c!50055 (= lt!154335 k0!2441))))

(assert (= (and d!68809 c!50057) b!316163))

(assert (= (and d!68809 (not c!50057)) b!316164))

(assert (= (and b!316164 c!50055) b!316161))

(assert (= (and b!316164 (not c!50055)) b!316160))

(assert (= (and b!316160 c!50056) b!316159))

(assert (= (and b!316160 (not c!50056)) b!316162))

(declare-fun m!324597 () Bool)

(assert (=> b!316162 m!324597))

(declare-fun m!324599 () Bool)

(assert (=> d!68809 m!324599))

(assert (=> d!68809 m!324423))

(assert (=> d!68809 m!324425))

(declare-fun m!324601 () Bool)

(assert (=> d!68809 m!324601))

(assert (=> d!68809 m!324423))

(declare-fun m!324603 () Bool)

(assert (=> d!68809 m!324603))

(assert (=> d!68809 m!324431))

(declare-fun m!324605 () Bool)

(assert (=> b!316164 m!324605))

(assert (=> b!315883 d!68809))

(declare-fun d!68819 () Bool)

(declare-fun res!171301 () Bool)

(declare-fun e!196661 () Bool)

(assert (=> d!68819 (=> res!171301 e!196661)))

(assert (=> d!68819 (= res!171301 (= (select (arr!7623 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68819 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!196661)))

(declare-fun b!316193 () Bool)

(declare-fun e!196662 () Bool)

(assert (=> b!316193 (= e!196661 e!196662)))

(declare-fun res!171302 () Bool)

(assert (=> b!316193 (=> (not res!171302) (not e!196662))))

(assert (=> b!316193 (= res!171302 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7976 a!3293)))))

(declare-fun b!316194 () Bool)

(assert (=> b!316194 (= e!196662 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68819 (not res!171301)) b!316193))

(assert (= (and b!316193 res!171302) b!316194))

(assert (=> d!68819 m!324565))

(declare-fun m!324617 () Bool)

(assert (=> b!316194 m!324617))

(assert (=> b!315878 d!68819))

(check-sat (not d!68783) (not b!316101) (not d!68785) (not b!316194) (not d!68799) (not b!316003) (not d!68769) (not b!316162) (not b!316075) (not d!68789) (not b!316045) (not d!68809) (not b!316100) (not bm!25976) (not b!316018))
(check-sat)
