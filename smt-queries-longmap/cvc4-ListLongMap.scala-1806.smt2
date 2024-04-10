; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32540 () Bool)

(assert start!32540)

(declare-fun b!325553 () Bool)

(declare-fun res!178884 () Bool)

(declare-fun e!200612 () Bool)

(assert (=> b!325553 (=> (not res!178884) (not e!200612))))

(declare-datatypes ((array!16679 0))(
  ( (array!16680 (arr!7897 (Array (_ BitVec 32) (_ BitVec 64))) (size!8249 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16679)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16679 (_ BitVec 32)) Bool)

(assert (=> b!325553 (= res!178884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!325554 () Bool)

(declare-fun res!178888 () Bool)

(assert (=> b!325554 (=> (not res!178888) (not e!200612))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!325554 (= res!178888 (and (= (size!8249 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8249 a!3305))))))

(declare-fun res!178892 () Bool)

(assert (=> start!32540 (=> (not res!178892) (not e!200612))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32540 (= res!178892 (validMask!0 mask!3777))))

(assert (=> start!32540 e!200612))

(declare-fun array_inv!5860 (array!16679) Bool)

(assert (=> start!32540 (array_inv!5860 a!3305)))

(assert (=> start!32540 true))

(declare-fun b!325555 () Bool)

(declare-fun res!178891 () Bool)

(declare-fun e!200613 () Bool)

(assert (=> b!325555 (=> (not res!178891) (not e!200613))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3028 0))(
  ( (MissingZero!3028 (index!14288 (_ BitVec 32))) (Found!3028 (index!14289 (_ BitVec 32))) (Intermediate!3028 (undefined!3840 Bool) (index!14290 (_ BitVec 32)) (x!32520 (_ BitVec 32))) (Undefined!3028) (MissingVacant!3028 (index!14291 (_ BitVec 32))) )
))
(declare-fun lt!157026 () SeekEntryResult!3028)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16679 (_ BitVec 32)) SeekEntryResult!3028)

(assert (=> b!325555 (= res!178891 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157026))))

(declare-fun b!325556 () Bool)

(declare-fun res!178886 () Bool)

(assert (=> b!325556 (=> (not res!178886) (not e!200613))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!325556 (= res!178886 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7897 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!325557 () Bool)

(declare-fun res!178889 () Bool)

(assert (=> b!325557 (=> (not res!178889) (not e!200613))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!325557 (= res!178889 (and (= (select (arr!7897 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8249 a!3305))))))

(declare-fun b!325558 () Bool)

(declare-fun lt!157025 () (_ BitVec 32))

(assert (=> b!325558 (= e!200613 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1490) resX!58) (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b00000000000000000000000000000000) (or (bvslt lt!157025 #b00000000000000000000000000000000) (bvsge lt!157025 (size!8249 a!3305)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325558 (= lt!157025 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!325559 () Bool)

(declare-fun res!178887 () Bool)

(assert (=> b!325559 (=> (not res!178887) (not e!200612))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16679 (_ BitVec 32)) SeekEntryResult!3028)

(assert (=> b!325559 (= res!178887 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3028 i!1250)))))

(declare-fun b!325560 () Bool)

(declare-fun res!178893 () Bool)

(assert (=> b!325560 (=> (not res!178893) (not e!200612))))

(declare-fun arrayContainsKey!0 (array!16679 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325560 (= res!178893 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!325561 () Bool)

(assert (=> b!325561 (= e!200612 e!200613)))

(declare-fun res!178885 () Bool)

(assert (=> b!325561 (=> (not res!178885) (not e!200613))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325561 (= res!178885 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157026))))

(assert (=> b!325561 (= lt!157026 (Intermediate!3028 false resIndex!58 resX!58))))

(declare-fun b!325562 () Bool)

(declare-fun res!178890 () Bool)

(assert (=> b!325562 (=> (not res!178890) (not e!200612))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325562 (= res!178890 (validKeyInArray!0 k!2497))))

(assert (= (and start!32540 res!178892) b!325554))

(assert (= (and b!325554 res!178888) b!325562))

(assert (= (and b!325562 res!178890) b!325560))

(assert (= (and b!325560 res!178893) b!325559))

(assert (= (and b!325559 res!178887) b!325553))

(assert (= (and b!325553 res!178884) b!325561))

(assert (= (and b!325561 res!178885) b!325557))

(assert (= (and b!325557 res!178889) b!325555))

(assert (= (and b!325555 res!178891) b!325556))

(assert (= (and b!325556 res!178886) b!325558))

(declare-fun m!332375 () Bool)

(assert (=> b!325561 m!332375))

(assert (=> b!325561 m!332375))

(declare-fun m!332377 () Bool)

(assert (=> b!325561 m!332377))

(declare-fun m!332379 () Bool)

(assert (=> b!325555 m!332379))

(declare-fun m!332381 () Bool)

(assert (=> b!325557 m!332381))

(declare-fun m!332383 () Bool)

(assert (=> b!325559 m!332383))

(declare-fun m!332385 () Bool)

(assert (=> b!325562 m!332385))

(declare-fun m!332387 () Bool)

(assert (=> b!325553 m!332387))

(declare-fun m!332389 () Bool)

(assert (=> b!325556 m!332389))

(declare-fun m!332391 () Bool)

(assert (=> b!325558 m!332391))

(declare-fun m!332393 () Bool)

(assert (=> start!32540 m!332393))

(declare-fun m!332395 () Bool)

(assert (=> start!32540 m!332395))

(declare-fun m!332397 () Bool)

(assert (=> b!325560 m!332397))

(push 1)

(assert (not b!325558))

(assert (not b!325555))

(assert (not b!325559))

(assert (not start!32540))

(assert (not b!325553))

(assert (not b!325560))

(assert (not b!325562))

(assert (not b!325561))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69659 () Bool)

(assert (=> d!69659 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32540 d!69659))

(declare-fun d!69675 () Bool)

(assert (=> d!69675 (= (array_inv!5860 a!3305) (bvsge (size!8249 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32540 d!69675))

(declare-fun d!69677 () Bool)

(assert (=> d!69677 (= (validKeyInArray!0 k!2497) (and (not (= k!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!325562 d!69677))

(declare-fun b!325710 () Bool)

(declare-fun e!200705 () SeekEntryResult!3028)

(declare-fun e!200707 () SeekEntryResult!3028)

(assert (=> b!325710 (= e!200705 e!200707)))

(declare-fun c!51010 () Bool)

(declare-fun lt!157090 () (_ BitVec 64))

(assert (=> b!325710 (= c!51010 (or (= lt!157090 k!2497) (= (bvadd lt!157090 lt!157090) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!325711 () Bool)

(declare-fun e!200709 () Bool)

(declare-fun e!200708 () Bool)

(assert (=> b!325711 (= e!200709 e!200708)))

(declare-fun res!178948 () Bool)

(declare-fun lt!157091 () SeekEntryResult!3028)

(assert (=> b!325711 (= res!178948 (and (is-Intermediate!3028 lt!157091) (not (undefined!3840 lt!157091)) (bvslt (x!32520 lt!157091) #b01111111111111111111111111111110) (bvsge (x!32520 lt!157091) #b00000000000000000000000000000000) (bvsge (x!32520 lt!157091) #b00000000000000000000000000000000)))))

(assert (=> b!325711 (=> (not res!178948) (not e!200708))))

(declare-fun b!325712 () Bool)

(assert (=> b!325712 (and (bvsge (index!14290 lt!157091) #b00000000000000000000000000000000) (bvslt (index!14290 lt!157091) (size!8249 a!3305)))))

(declare-fun res!178947 () Bool)

(assert (=> b!325712 (= res!178947 (= (select (arr!7897 a!3305) (index!14290 lt!157091)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!200706 () Bool)

(assert (=> b!325712 (=> res!178947 e!200706)))

(declare-fun b!325713 () Bool)

(assert (=> b!325713 (= e!200705 (Intermediate!3028 true (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!325714 () Bool)

(assert (=> b!325714 (= e!200707 (Intermediate!3028 false (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!325715 () Bool)

(assert (=> b!325715 (and (bvsge (index!14290 lt!157091) #b00000000000000000000000000000000) (bvslt (index!14290 lt!157091) (size!8249 a!3305)))))

(declare-fun res!178946 () Bool)

(assert (=> b!325715 (= res!178946 (= (select (arr!7897 a!3305) (index!14290 lt!157091)) k!2497))))

(assert (=> b!325715 (=> res!178946 e!200706)))

(assert (=> b!325715 (= e!200708 e!200706)))

(declare-fun b!325716 () Bool)

(assert (=> b!325716 (and (bvsge (index!14290 lt!157091) #b00000000000000000000000000000000) (bvslt (index!14290 lt!157091) (size!8249 a!3305)))))

(assert (=> b!325716 (= e!200706 (= (select (arr!7897 a!3305) (index!14290 lt!157091)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!325717 () Bool)

(assert (=> b!325717 (= e!200709 (bvsge (x!32520 lt!157091) #b01111111111111111111111111111110))))

(declare-fun d!69679 () Bool)

(assert (=> d!69679 e!200709))

(declare-fun c!51012 () Bool)

(assert (=> d!69679 (= c!51012 (and (is-Intermediate!3028 lt!157091) (undefined!3840 lt!157091)))))

(assert (=> d!69679 (= lt!157091 e!200705)))

(declare-fun c!51011 () Bool)

(assert (=> d!69679 (= c!51011 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!69679 (= lt!157090 (select (arr!7897 a!3305) (toIndex!0 k!2497 mask!3777)))))

(assert (=> d!69679 (validMask!0 mask!3777)))

(assert (=> d!69679 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157091)))

(declare-fun b!325718 () Bool)

(assert (=> b!325718 (= e!200707 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k!2497 a!3305 mask!3777))))

(assert (= (and d!69679 c!51011) b!325713))

(assert (= (and d!69679 (not c!51011)) b!325710))

(assert (= (and b!325710 c!51010) b!325714))

(assert (= (and b!325710 (not c!51010)) b!325718))

(assert (= (and d!69679 c!51012) b!325717))

(assert (= (and d!69679 (not c!51012)) b!325711))

(assert (= (and b!325711 res!178948) b!325715))

(assert (= (and b!325715 (not res!178946)) b!325712))

(assert (= (and b!325712 (not res!178947)) b!325716))

(declare-fun m!332457 () Bool)

(assert (=> b!325716 m!332457))

(assert (=> b!325712 m!332457))

(assert (=> b!325718 m!332375))

(declare-fun m!332459 () Bool)

(assert (=> b!325718 m!332459))

(assert (=> b!325718 m!332459))

(declare-fun m!332461 () Bool)

(assert (=> b!325718 m!332461))

(assert (=> b!325715 m!332457))

(assert (=> d!69679 m!332375))

(declare-fun m!332463 () Bool)

(assert (=> d!69679 m!332463))

(assert (=> d!69679 m!332393))

(assert (=> b!325561 d!69679))

(declare-fun d!69691 () Bool)

(declare-fun lt!157102 () (_ BitVec 32))

(declare-fun lt!157101 () (_ BitVec 32))

(assert (=> d!69691 (= lt!157102 (bvmul (bvxor lt!157101 (bvlshr lt!157101 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69691 (= lt!157101 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69691 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!178949 (let ((h!5392 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32527 (bvmul (bvxor h!5392 (bvlshr h!5392 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32527 (bvlshr x!32527 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!178949 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!178949 #b00000000000000000000000000000000))))))

(assert (=> d!69691 (= (toIndex!0 k!2497 mask!3777) (bvand (bvxor lt!157102 (bvlshr lt!157102 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!325561 d!69691))

(declare-fun b!325734 () Bool)

(declare-fun e!200718 () SeekEntryResult!3028)

(declare-fun e!200720 () SeekEntryResult!3028)

(assert (=> b!325734 (= e!200718 e!200720)))

(declare-fun c!51019 () Bool)

(declare-fun lt!157103 () (_ BitVec 64))

(assert (=> b!325734 (= c!51019 (or (= lt!157103 k!2497) (= (bvadd lt!157103 lt!157103) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!325735 () Bool)

(declare-fun e!200722 () Bool)

(declare-fun e!200721 () Bool)

(assert (=> b!325735 (= e!200722 e!200721)))

(declare-fun res!178956 () Bool)

(declare-fun lt!157104 () SeekEntryResult!3028)

(assert (=> b!325735 (= res!178956 (and (is-Intermediate!3028 lt!157104) (not (undefined!3840 lt!157104)) (bvslt (x!32520 lt!157104) #b01111111111111111111111111111110) (bvsge (x!32520 lt!157104) #b00000000000000000000000000000000) (bvsge (x!32520 lt!157104) x!1490)))))

(assert (=> b!325735 (=> (not res!178956) (not e!200721))))

(declare-fun b!325736 () Bool)

(assert (=> b!325736 (and (bvsge (index!14290 lt!157104) #b00000000000000000000000000000000) (bvslt (index!14290 lt!157104) (size!8249 a!3305)))))

(declare-fun res!178955 () Bool)

(assert (=> b!325736 (= res!178955 (= (select (arr!7897 a!3305) (index!14290 lt!157104)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!200719 () Bool)

(assert (=> b!325736 (=> res!178955 e!200719)))

(declare-fun b!325737 () Bool)

(assert (=> b!325737 (= e!200718 (Intermediate!3028 true index!1840 x!1490))))

(declare-fun b!325738 () Bool)

(assert (=> b!325738 (= e!200720 (Intermediate!3028 false index!1840 x!1490))))

(declare-fun b!325739 () Bool)

(assert (=> b!325739 (and (bvsge (index!14290 lt!157104) #b00000000000000000000000000000000) (bvslt (index!14290 lt!157104) (size!8249 a!3305)))))

(declare-fun res!178954 () Bool)

(assert (=> b!325739 (= res!178954 (= (select (arr!7897 a!3305) (index!14290 lt!157104)) k!2497))))

(assert (=> b!325739 (=> res!178954 e!200719)))

(assert (=> b!325739 (= e!200721 e!200719)))

(declare-fun b!325740 () Bool)

(assert (=> b!325740 (and (bvsge (index!14290 lt!157104) #b00000000000000000000000000000000) (bvslt (index!14290 lt!157104) (size!8249 a!3305)))))

(assert (=> b!325740 (= e!200719 (= (select (arr!7897 a!3305) (index!14290 lt!157104)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!325741 () Bool)

(assert (=> b!325741 (= e!200722 (bvsge (x!32520 lt!157104) #b01111111111111111111111111111110))))

(declare-fun d!69697 () Bool)

(assert (=> d!69697 e!200722))

(declare-fun c!51021 () Bool)

(assert (=> d!69697 (= c!51021 (and (is-Intermediate!3028 lt!157104) (undefined!3840 lt!157104)))))

(assert (=> d!69697 (= lt!157104 e!200718)))

