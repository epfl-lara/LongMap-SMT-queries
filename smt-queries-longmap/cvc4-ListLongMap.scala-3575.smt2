; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49132 () Bool)

(assert start!49132)

(declare-fun b!541324 () Bool)

(declare-fun res!336217 () Bool)

(declare-fun e!313437 () Bool)

(assert (=> b!541324 (=> (not res!336217) (not e!313437))))

(declare-datatypes ((array!34242 0))(
  ( (array!34243 (arr!16457 (Array (_ BitVec 32) (_ BitVec 64))) (size!16821 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34242)

(declare-datatypes ((List!10576 0))(
  ( (Nil!10573) (Cons!10572 (h!11521 (_ BitVec 64)) (t!16804 List!10576)) )
))
(declare-fun arrayNoDuplicates!0 (array!34242 (_ BitVec 32) List!10576) Bool)

(assert (=> b!541324 (= res!336217 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10573))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun e!313436 () Bool)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun b!541325 () Bool)

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!541325 (= e!313436 (and (not (= (select (arr!16457 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16457 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16457 a!3154) index!1177) (select (arr!16457 a!3154) j!147)) (not (= index!1177 resIndex!32))))))

(declare-fun b!541326 () Bool)

(declare-fun res!336220 () Bool)

(assert (=> b!541326 (=> (not res!336220) (not e!313437))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34242 (_ BitVec 32)) Bool)

(assert (=> b!541326 (= res!336220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!541327 () Bool)

(declare-fun res!336219 () Bool)

(declare-fun e!313434 () Bool)

(assert (=> b!541327 (=> (not res!336219) (not e!313434))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541327 (= res!336219 (and (= (size!16821 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16821 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16821 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!541328 () Bool)

(assert (=> b!541328 (= e!313437 e!313436)))

(declare-fun res!336218 () Bool)

(assert (=> b!541328 (=> (not res!336218) (not e!313436))))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4915 0))(
  ( (MissingZero!4915 (index!21884 (_ BitVec 32))) (Found!4915 (index!21885 (_ BitVec 32))) (Intermediate!4915 (undefined!5727 Bool) (index!21886 (_ BitVec 32)) (x!50790 (_ BitVec 32))) (Undefined!4915) (MissingVacant!4915 (index!21887 (_ BitVec 32))) )
))
(declare-fun lt!247596 () SeekEntryResult!4915)

(assert (=> b!541328 (= res!336218 (= lt!247596 (Intermediate!4915 false resIndex!32 resX!32)))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34242 (_ BitVec 32)) SeekEntryResult!4915)

(assert (=> b!541328 (= lt!247596 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16457 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541330 () Bool)

(declare-fun res!336213 () Bool)

(assert (=> b!541330 (=> (not res!336213) (not e!313436))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541330 (= res!336213 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16457 a!3154) j!147) mask!3216) (select (arr!16457 a!3154) j!147) a!3154 mask!3216) lt!247596))))

(declare-fun b!541331 () Bool)

(declare-fun res!336211 () Bool)

(assert (=> b!541331 (=> (not res!336211) (not e!313434))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34242 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541331 (= res!336211 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!541332 () Bool)

(declare-fun res!336215 () Bool)

(assert (=> b!541332 (=> (not res!336215) (not e!313434))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541332 (= res!336215 (validKeyInArray!0 (select (arr!16457 a!3154) j!147)))))

(declare-fun b!541329 () Bool)

(declare-fun res!336212 () Bool)

(assert (=> b!541329 (=> (not res!336212) (not e!313437))))

(assert (=> b!541329 (= res!336212 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16821 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16821 a!3154)) (= (select (arr!16457 a!3154) resIndex!32) (select (arr!16457 a!3154) j!147))))))

(declare-fun res!336221 () Bool)

(assert (=> start!49132 (=> (not res!336221) (not e!313434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49132 (= res!336221 (validMask!0 mask!3216))))

(assert (=> start!49132 e!313434))

(assert (=> start!49132 true))

(declare-fun array_inv!12253 (array!34242) Bool)

(assert (=> start!49132 (array_inv!12253 a!3154)))

(declare-fun b!541333 () Bool)

(declare-fun res!336216 () Bool)

(assert (=> b!541333 (=> (not res!336216) (not e!313434))))

(assert (=> b!541333 (= res!336216 (validKeyInArray!0 k!1998))))

(declare-fun b!541334 () Bool)

(assert (=> b!541334 (= e!313434 e!313437)))

(declare-fun res!336214 () Bool)

(assert (=> b!541334 (=> (not res!336214) (not e!313437))))

(declare-fun lt!247597 () SeekEntryResult!4915)

(assert (=> b!541334 (= res!336214 (or (= lt!247597 (MissingZero!4915 i!1153)) (= lt!247597 (MissingVacant!4915 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34242 (_ BitVec 32)) SeekEntryResult!4915)

(assert (=> b!541334 (= lt!247597 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(assert (= (and start!49132 res!336221) b!541327))

(assert (= (and b!541327 res!336219) b!541332))

(assert (= (and b!541332 res!336215) b!541333))

(assert (= (and b!541333 res!336216) b!541331))

(assert (= (and b!541331 res!336211) b!541334))

(assert (= (and b!541334 res!336214) b!541326))

(assert (= (and b!541326 res!336220) b!541324))

(assert (= (and b!541324 res!336217) b!541329))

(assert (= (and b!541329 res!336212) b!541328))

(assert (= (and b!541328 res!336218) b!541330))

(assert (= (and b!541330 res!336213) b!541325))

(declare-fun m!519911 () Bool)

(assert (=> b!541334 m!519911))

(declare-fun m!519913 () Bool)

(assert (=> b!541329 m!519913))

(declare-fun m!519915 () Bool)

(assert (=> b!541329 m!519915))

(declare-fun m!519917 () Bool)

(assert (=> b!541333 m!519917))

(declare-fun m!519919 () Bool)

(assert (=> start!49132 m!519919))

(declare-fun m!519921 () Bool)

(assert (=> start!49132 m!519921))

(assert (=> b!541328 m!519915))

(assert (=> b!541328 m!519915))

(declare-fun m!519923 () Bool)

(assert (=> b!541328 m!519923))

(declare-fun m!519925 () Bool)

(assert (=> b!541324 m!519925))

(declare-fun m!519927 () Bool)

(assert (=> b!541331 m!519927))

(declare-fun m!519929 () Bool)

(assert (=> b!541325 m!519929))

(assert (=> b!541325 m!519915))

(assert (=> b!541332 m!519915))

(assert (=> b!541332 m!519915))

(declare-fun m!519931 () Bool)

(assert (=> b!541332 m!519931))

(declare-fun m!519933 () Bool)

(assert (=> b!541326 m!519933))

(assert (=> b!541330 m!519915))

(assert (=> b!541330 m!519915))

(declare-fun m!519935 () Bool)

(assert (=> b!541330 m!519935))

(assert (=> b!541330 m!519935))

(assert (=> b!541330 m!519915))

(declare-fun m!519937 () Bool)

(assert (=> b!541330 m!519937))

(push 1)

(assert (not b!541328))

(assert (not b!541324))

(assert (not b!541330))

(assert (not b!541326))

(assert (not b!541332))

(assert (not start!49132))

(assert (not b!541333))

(assert (not b!541331))

(assert (not b!541334))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!541372 () Bool)

(declare-fun e!313464 () Bool)

(declare-fun call!32036 () Bool)

(assert (=> b!541372 (= e!313464 call!32036)))

(declare-fun bm!32033 () Bool)

(declare-fun c!62882 () Bool)

(assert (=> bm!32033 (= call!32036 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62882 (Cons!10572 (select (arr!16457 a!3154) #b00000000000000000000000000000000) Nil!10573) Nil!10573)))))

(declare-fun b!541373 () Bool)

(declare-fun e!313461 () Bool)

(declare-fun contains!2799 (List!10576 (_ BitVec 64)) Bool)

(assert (=> b!541373 (= e!313461 (contains!2799 Nil!10573 (select (arr!16457 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!81751 () Bool)

(declare-fun res!336237 () Bool)

(declare-fun e!313462 () Bool)

(assert (=> d!81751 (=> res!336237 e!313462)))

(assert (=> d!81751 (= res!336237 (bvsge #b00000000000000000000000000000000 (size!16821 a!3154)))))

(assert (=> d!81751 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10573) e!313462)))

(declare-fun b!541374 () Bool)

(assert (=> b!541374 (= e!313464 call!32036)))

(declare-fun b!541375 () Bool)

(declare-fun e!313463 () Bool)

(assert (=> b!541375 (= e!313463 e!313464)))

(assert (=> b!541375 (= c!62882 (validKeyInArray!0 (select (arr!16457 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!541376 () Bool)

(assert (=> b!541376 (= e!313462 e!313463)))

(declare-fun res!336239 () Bool)

(assert (=> b!541376 (=> (not res!336239) (not e!313463))))

(assert (=> b!541376 (= res!336239 (not e!313461))))

(declare-fun res!336238 () Bool)

(assert (=> b!541376 (=> (not res!336238) (not e!313461))))

(assert (=> b!541376 (= res!336238 (validKeyInArray!0 (select (arr!16457 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!81751 (not res!336237)) b!541376))

(assert (= (and b!541376 res!336238) b!541373))

(assert (= (and b!541376 res!336239) b!541375))

(assert (= (and b!541375 c!62882) b!541374))

(assert (= (and b!541375 (not c!62882)) b!541372))

(assert (= (or b!541374 b!541372) bm!32033))

(declare-fun m!519945 () Bool)

(assert (=> bm!32033 m!519945))

(declare-fun m!519947 () Bool)

(assert (=> bm!32033 m!519947))

(assert (=> b!541373 m!519945))

(assert (=> b!541373 m!519945))

(declare-fun m!519949 () Bool)

(assert (=> b!541373 m!519949))

(assert (=> b!541375 m!519945))

(assert (=> b!541375 m!519945))

(declare-fun m!519951 () Bool)

(assert (=> b!541375 m!519951))

(assert (=> b!541376 m!519945))

(assert (=> b!541376 m!519945))

(assert (=> b!541376 m!519951))

(assert (=> b!541324 d!81751))

(declare-fun b!541446 () Bool)

(declare-fun lt!247627 () SeekEntryResult!4915)

(assert (=> b!541446 (and (bvsge (index!21886 lt!247627) #b00000000000000000000000000000000) (bvslt (index!21886 lt!247627) (size!16821 a!3154)))))

(declare-fun res!336257 () Bool)

(assert (=> b!541446 (= res!336257 (= (select (arr!16457 a!3154) (index!21886 lt!247627)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!313508 () Bool)

(assert (=> b!541446 (=> res!336257 e!313508)))

(declare-fun b!541447 () Bool)

(declare-fun e!313507 () SeekEntryResult!4915)

(declare-fun e!313505 () SeekEntryResult!4915)

(assert (=> b!541447 (= e!313507 e!313505)))

(declare-fun lt!247626 () (_ BitVec 64))

(declare-fun c!62910 () Bool)

(assert (=> b!541447 (= c!62910 (or (= lt!247626 (select (arr!16457 a!3154) j!147)) (= (bvadd lt!247626 lt!247626) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!541449 () Bool)

(assert (=> b!541449 (and (bvsge (index!21886 lt!247627) #b00000000000000000000000000000000) (bvslt (index!21886 lt!247627) (size!16821 a!3154)))))

(declare-fun res!336256 () Bool)

(assert (=> b!541449 (= res!336256 (= (select (arr!16457 a!3154) (index!21886 lt!247627)) (select (arr!16457 a!3154) j!147)))))

(assert (=> b!541449 (=> res!336256 e!313508)))

(declare-fun e!313509 () Bool)

(assert (=> b!541449 (= e!313509 e!313508)))

(declare-fun b!541450 () Bool)

(assert (=> b!541450 (and (bvsge (index!21886 lt!247627) #b00000000000000000000000000000000) (bvslt (index!21886 lt!247627) (size!16821 a!3154)))))

(assert (=> b!541450 (= e!313508 (= (select (arr!16457 a!3154) (index!21886 lt!247627)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!541451 () Bool)

(declare-fun e!313506 () Bool)

(assert (=> b!541451 (= e!313506 e!313509)))

(declare-fun res!336255 () Bool)

(assert (=> b!541451 (= res!336255 (and (is-Intermediate!4915 lt!247627) (not (undefined!5727 lt!247627)) (bvslt (x!50790 lt!247627) #b01111111111111111111111111111110) (bvsge (x!50790 lt!247627) #b00000000000000000000000000000000) (bvsge (x!50790 lt!247627) #b00000000000000000000000000000000)))))

(assert (=> b!541451 (=> (not res!336255) (not e!313509))))

(declare-fun b!541452 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541452 (= e!313505 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16457 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16457 a!3154) j!147) a!3154 mask!3216))))

(declare-fun d!81755 () Bool)

(assert (=> d!81755 e!313506))

(declare-fun c!62911 () Bool)

(assert (=> d!81755 (= c!62911 (and (is-Intermediate!4915 lt!247627) (undefined!5727 lt!247627)))))

(assert (=> d!81755 (= lt!247627 e!313507)))

(declare-fun c!62912 () Bool)

(assert (=> d!81755 (= c!62912 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!81755 (= lt!247626 (select (arr!16457 a!3154) (toIndex!0 (select (arr!16457 a!3154) j!147) mask!3216)))))

(assert (=> d!81755 (validMask!0 mask!3216)))

(assert (=> d!81755 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16457 a!3154) j!147) mask!3216) (select (arr!16457 a!3154) j!147) a!3154 mask!3216) lt!247627)))

(declare-fun b!541448 () Bool)

(assert (=> b!541448 (= e!313505 (Intermediate!4915 false (toIndex!0 (select (arr!16457 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!541453 () Bool)

(assert (=> b!541453 (= e!313507 (Intermediate!4915 true (toIndex!0 (select (arr!16457 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!541454 () Bool)

(assert (=> b!541454 (= e!313506 (bvsge (x!50790 lt!247627) #b01111111111111111111111111111110))))

(assert (= (and d!81755 c!62912) b!541453))

(assert (= (and d!81755 (not c!62912)) b!541447))

(assert (= (and b!541447 c!62910) b!541448))

(assert (= (and b!541447 (not c!62910)) b!541452))

(assert (= (and d!81755 c!62911) b!541454))

(assert (= (and d!81755 (not c!62911)) b!541451))

(assert (= (and b!541451 res!336255) b!541449))

(assert (= (and b!541449 (not res!336256)) b!541446))

(assert (= (and b!541446 (not res!336257)) b!541450))

(declare-fun m!519989 () Bool)

(assert (=> b!541450 m!519989))

(assert (=> b!541446 m!519989))

(assert (=> d!81755 m!519935))

(declare-fun m!519991 () Bool)

(assert (=> d!81755 m!519991))

(assert (=> d!81755 m!519919))

(assert (=> b!541452 m!519935))

(declare-fun m!519993 () Bool)

(assert (=> b!541452 m!519993))

(assert (=> b!541452 m!519993))

(assert (=> b!541452 m!519915))

(declare-fun m!519995 () Bool)

(assert (=> b!541452 m!519995))

(assert (=> b!541449 m!519989))

(assert (=> b!541330 d!81755))

(declare-fun d!81763 () Bool)

(declare-fun lt!247644 () (_ BitVec 32))

(declare-fun lt!247643 () (_ BitVec 32))

(assert (=> d!81763 (= lt!247644 (bvmul (bvxor lt!247643 (bvlshr lt!247643 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81763 (= lt!247643 ((_ extract 31 0) (bvand (bvxor (select (arr!16457 a!3154) j!147) (bvlshr (select (arr!16457 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81763 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!336262 (let ((h!11522 ((_ extract 31 0) (bvand (bvxor (select (arr!16457 a!3154) j!147) (bvlshr (select (arr!16457 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!50793 (bvmul (bvxor h!11522 (bvlshr h!11522 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!50793 (bvlshr x!50793 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!336262 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!336262 #b00000000000000000000000000000000))))))

(assert (=> d!81763 (= (toIndex!0 (select (arr!16457 a!3154) j!147) mask!3216) (bvand (bvxor lt!247644 (bvlshr lt!247644 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!541330 d!81763))

(declare-fun d!81767 () Bool)

(assert (=> d!81767 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49132 d!81767))

(declare-fun d!81783 () Bool)

(assert (=> d!81783 (= (array_inv!12253 a!3154) (bvsge (size!16821 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49132 d!81783))

(declare-fun d!81785 () Bool)

(assert (=> d!81785 (= (validKeyInArray!0 k!1998) (and (not (= k!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!541333 d!81785))

(declare-fun b!541482 () Bool)

(declare-fun lt!247652 () SeekEntryResult!4915)

(assert (=> b!541482 (and (bvsge (index!21886 lt!247652) #b00000000000000000000000000000000) (bvslt (index!21886 lt!247652) (size!16821 a!3154)))))

(declare-fun res!336277 () Bool)

(assert (=> b!541482 (= res!336277 (= (select (arr!16457 a!3154) (index!21886 lt!247652)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!313533 () Bool)

(assert (=> b!541482 (=> res!336277 e!313533)))

(declare-fun b!541483 () Bool)

(declare-fun e!313532 () SeekEntryResult!4915)

(declare-fun e!313530 () SeekEntryResult!4915)

(assert (=> b!541483 (= e!313532 e!313530)))

(declare-fun lt!247651 () (_ BitVec 64))

(declare-fun c!62919 () Bool)

(assert (=> b!541483 (= c!62919 (or (= lt!247651 (select (arr!16457 a!3154) j!147)) (= (bvadd lt!247651 lt!247651) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!541485 () Bool)

(assert (=> b!541485 (and (bvsge (index!21886 lt!247652) #b00000000000000000000000000000000) (bvslt (index!21886 lt!247652) (size!16821 a!3154)))))

(declare-fun res!336276 () Bool)

(assert (=> b!541485 (= res!336276 (= (select (arr!16457 a!3154) (index!21886 lt!247652)) (select (arr!16457 a!3154) j!147)))))

(assert (=> b!541485 (=> res!336276 e!313533)))

(declare-fun e!313534 () Bool)

(assert (=> b!541485 (= e!313534 e!313533)))

(declare-fun b!541486 () Bool)

(assert (=> b!541486 (and (bvsge (index!21886 lt!247652) #b00000000000000000000000000000000) (bvslt (index!21886 lt!247652) (size!16821 a!3154)))))

(assert (=> b!541486 (= e!313533 (= (select (arr!16457 a!3154) (index!21886 lt!247652)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!541487 () Bool)

(declare-fun e!313531 () Bool)

(assert (=> b!541487 (= e!313531 e!313534)))

(declare-fun res!336275 () Bool)

(assert (=> b!541487 (= res!336275 (and (is-Intermediate!4915 lt!247652) (not (undefined!5727 lt!247652)) (bvslt (x!50790 lt!247652) #b01111111111111111111111111111110) (bvsge (x!50790 lt!247652) #b00000000000000000000000000000000) (bvsge (x!50790 lt!247652) x!1030)))))

(assert (=> b!541487 (=> (not res!336275) (not e!313534))))

(declare-fun b!541488 () Bool)

(assert (=> b!541488 (= e!313530 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16457 a!3154) j!147) a!3154 mask!3216))))

(declare-fun d!81787 () Bool)

(assert (=> d!81787 e!313531))

(declare-fun c!62920 () Bool)

(assert (=> d!81787 (= c!62920 (and (is-Intermediate!4915 lt!247652) (undefined!5727 lt!247652)))))

(assert (=> d!81787 (= lt!247652 e!313532)))

(declare-fun c!62921 () Bool)

(assert (=> d!81787 (= c!62921 (bvsge x!1030 #b01111111111111111111111111111110))))

(assert (=> d!81787 (= lt!247651 (select (arr!16457 a!3154) index!1177))))

(assert (=> d!81787 (validMask!0 mask!3216)))

(assert (=> d!81787 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16457 a!3154) j!147) a!3154 mask!3216) lt!247652)))

(declare-fun b!541484 () Bool)

(assert (=> b!541484 (= e!313530 (Intermediate!4915 false index!1177 x!1030))))

(declare-fun b!541489 () Bool)

(assert (=> b!541489 (= e!313532 (Intermediate!4915 true index!1177 x!1030))))

(declare-fun b!541490 () Bool)

(assert (=> b!541490 (= e!313531 (bvsge (x!50790 lt!247652) #b01111111111111111111111111111110))))

(assert (= (and d!81787 c!62921) b!541489))

(assert (= (and d!81787 (not c!62921)) b!541483))

(assert (= (and b!541483 c!62919) b!541484))

(assert (= (and b!541483 (not c!62919)) b!541488))

(assert (= (and d!81787 c!62920) b!541490))

(assert (= (and d!81787 (not c!62920)) b!541487))

(assert (= (and b!541487 res!336275) b!541485))

(assert (= (and b!541485 (not res!336276)) b!541482))

(assert (= (and b!541482 (not res!336277)) b!541486))

(declare-fun m!520019 () Bool)

(assert (=> b!541486 m!520019))

(assert (=> b!541482 m!520019))

(assert (=> d!81787 m!519929))

(assert (=> d!81787 m!519919))

(declare-fun m!520021 () Bool)

(assert (=> b!541488 m!520021))

(assert (=> b!541488 m!520021))

(assert (=> b!541488 m!519915))

(declare-fun m!520023 () Bool)

(assert (=> b!541488 m!520023))

(assert (=> b!541485 m!520019))

(assert (=> b!541328 d!81787))

(declare-fun d!81789 () Bool)

(declare-fun lt!247666 () SeekEntryResult!4915)

(assert (=> d!81789 (and (or (is-Undefined!4915 lt!247666) (not (is-Found!4915 lt!247666)) (and (bvsge (index!21885 lt!247666) #b00000000000000000000000000000000) (bvslt (index!21885 lt!247666) (size!16821 a!3154)))) (or (is-Undefined!4915 lt!247666) (is-Found!4915 lt!247666) (not (is-MissingZero!4915 lt!247666)) (and (bvsge (index!21884 lt!247666) #b00000000000000000000000000000000) (bvslt (index!21884 lt!247666) (size!16821 a!3154)))) (or (is-Undefined!4915 lt!247666) (is-Found!4915 lt!247666) (is-MissingZero!4915 lt!247666) (not (is-MissingVacant!4915 lt!247666)) (and (bvsge (index!21887 lt!247666) #b00000000000000000000000000000000) (bvslt (index!21887 lt!247666) (size!16821 a!3154)))) (or (is-Undefined!4915 lt!247666) (ite (is-Found!4915 lt!247666) (= (select (arr!16457 a!3154) (index!21885 lt!247666)) k!1998) (ite (is-MissingZero!4915 lt!247666) (= (select (arr!16457 a!3154) (index!21884 lt!247666)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4915 lt!247666) (= (select (arr!16457 a!3154) (index!21887 lt!247666)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

