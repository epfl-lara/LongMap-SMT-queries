; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120900 () Bool)

(assert start!120900)

(declare-fun b!1406746 () Bool)

(declare-fun res!944968 () Bool)

(declare-fun e!796196 () Bool)

(assert (=> b!1406746 (=> (not res!944968) (not e!796196))))

(declare-datatypes ((array!96207 0))(
  ( (array!96208 (arr!46451 (Array (_ BitVec 32) (_ BitVec 64))) (size!47001 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96207)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96207 (_ BitVec 32)) Bool)

(assert (=> b!1406746 (= res!944968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406747 () Bool)

(declare-fun e!796194 () Bool)

(assert (=> b!1406747 (= e!796196 (not e!796194))))

(declare-fun res!944971 () Bool)

(assert (=> b!1406747 (=> res!944971 e!796194)))

(declare-datatypes ((SeekEntryResult!10762 0))(
  ( (MissingZero!10762 (index!45425 (_ BitVec 32))) (Found!10762 (index!45426 (_ BitVec 32))) (Intermediate!10762 (undefined!11574 Bool) (index!45427 (_ BitVec 32)) (x!127025 (_ BitVec 32))) (Undefined!10762) (MissingVacant!10762 (index!45428 (_ BitVec 32))) )
))
(declare-fun lt!619497 () SeekEntryResult!10762)

(assert (=> b!1406747 (= res!944971 (or (not (is-Intermediate!10762 lt!619497)) (undefined!11574 lt!619497)))))

(declare-fun e!796195 () Bool)

(assert (=> b!1406747 e!796195))

(declare-fun res!944967 () Bool)

(assert (=> b!1406747 (=> (not res!944967) (not e!796195))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1406747 (= res!944967 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47498 0))(
  ( (Unit!47499) )
))
(declare-fun lt!619496 () Unit!47498)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96207 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47498)

(assert (=> b!1406747 (= lt!619496 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96207 (_ BitVec 32)) SeekEntryResult!10762)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406747 (= lt!619497 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46451 a!2901) j!112) mask!2840) (select (arr!46451 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!944965 () Bool)

(assert (=> start!120900 (=> (not res!944965) (not e!796196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120900 (= res!944965 (validMask!0 mask!2840))))

(assert (=> start!120900 e!796196))

(assert (=> start!120900 true))

(declare-fun array_inv!35479 (array!96207) Bool)

(assert (=> start!120900 (array_inv!35479 a!2901)))

(declare-fun b!1406748 () Bool)

(declare-fun res!944970 () Bool)

(assert (=> b!1406748 (=> (not res!944970) (not e!796196))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406748 (= res!944970 (validKeyInArray!0 (select (arr!46451 a!2901) i!1037)))))

(declare-fun b!1406749 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96207 (_ BitVec 32)) SeekEntryResult!10762)

(assert (=> b!1406749 (= e!796195 (= (seekEntryOrOpen!0 (select (arr!46451 a!2901) j!112) a!2901 mask!2840) (Found!10762 j!112)))))

(declare-fun b!1406750 () Bool)

(assert (=> b!1406750 (= e!796194 (and (bvsge (x!127025 lt!619497) #b00000000000000000000000000000000) (bvsle (x!127025 lt!619497) #b01111111111111111111111111111110)))))

(declare-fun b!1406751 () Bool)

(declare-fun res!944963 () Bool)

(assert (=> b!1406751 (=> (not res!944963) (not e!796196))))

(assert (=> b!1406751 (= res!944963 (and (= (size!47001 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47001 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47001 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406752 () Bool)

(declare-fun res!944966 () Bool)

(assert (=> b!1406752 (=> (not res!944966) (not e!796196))))

(declare-datatypes ((List!32970 0))(
  ( (Nil!32967) (Cons!32966 (h!34220 (_ BitVec 64)) (t!47664 List!32970)) )
))
(declare-fun arrayNoDuplicates!0 (array!96207 (_ BitVec 32) List!32970) Bool)

(assert (=> b!1406752 (= res!944966 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32967))))

(declare-fun b!1406753 () Bool)

(declare-fun res!944969 () Bool)

(assert (=> b!1406753 (=> res!944969 e!796194)))

(assert (=> b!1406753 (= res!944969 (not (= lt!619497 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46451 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46451 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96208 (store (arr!46451 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47001 a!2901)) mask!2840))))))

(declare-fun b!1406754 () Bool)

(declare-fun res!944964 () Bool)

(assert (=> b!1406754 (=> (not res!944964) (not e!796196))))

(assert (=> b!1406754 (= res!944964 (validKeyInArray!0 (select (arr!46451 a!2901) j!112)))))

(assert (= (and start!120900 res!944965) b!1406751))

(assert (= (and b!1406751 res!944963) b!1406748))

(assert (= (and b!1406748 res!944970) b!1406754))

(assert (= (and b!1406754 res!944964) b!1406746))

(assert (= (and b!1406746 res!944968) b!1406752))

(assert (= (and b!1406752 res!944966) b!1406747))

(assert (= (and b!1406747 res!944967) b!1406749))

(assert (= (and b!1406747 (not res!944971)) b!1406753))

(assert (= (and b!1406753 (not res!944969)) b!1406750))

(declare-fun m!1296015 () Bool)

(assert (=> b!1406747 m!1296015))

(declare-fun m!1296017 () Bool)

(assert (=> b!1406747 m!1296017))

(assert (=> b!1406747 m!1296015))

(declare-fun m!1296019 () Bool)

(assert (=> b!1406747 m!1296019))

(assert (=> b!1406747 m!1296017))

(assert (=> b!1406747 m!1296015))

(declare-fun m!1296021 () Bool)

(assert (=> b!1406747 m!1296021))

(declare-fun m!1296023 () Bool)

(assert (=> b!1406747 m!1296023))

(declare-fun m!1296025 () Bool)

(assert (=> b!1406752 m!1296025))

(declare-fun m!1296027 () Bool)

(assert (=> b!1406748 m!1296027))

(assert (=> b!1406748 m!1296027))

(declare-fun m!1296029 () Bool)

(assert (=> b!1406748 m!1296029))

(assert (=> b!1406749 m!1296015))

(assert (=> b!1406749 m!1296015))

(declare-fun m!1296031 () Bool)

(assert (=> b!1406749 m!1296031))

(assert (=> b!1406754 m!1296015))

(assert (=> b!1406754 m!1296015))

(declare-fun m!1296033 () Bool)

(assert (=> b!1406754 m!1296033))

(declare-fun m!1296035 () Bool)

(assert (=> b!1406753 m!1296035))

(declare-fun m!1296037 () Bool)

(assert (=> b!1406753 m!1296037))

(assert (=> b!1406753 m!1296037))

(declare-fun m!1296039 () Bool)

(assert (=> b!1406753 m!1296039))

(assert (=> b!1406753 m!1296039))

(assert (=> b!1406753 m!1296037))

(declare-fun m!1296041 () Bool)

(assert (=> b!1406753 m!1296041))

(declare-fun m!1296043 () Bool)

(assert (=> b!1406746 m!1296043))

(declare-fun m!1296045 () Bool)

(assert (=> start!120900 m!1296045))

(declare-fun m!1296047 () Bool)

(assert (=> start!120900 m!1296047))

(push 1)

(assert (not start!120900))

(assert (not b!1406752))

(assert (not b!1406747))

(assert (not b!1406748))

(assert (not b!1406753))

(assert (not b!1406746))

(assert (not b!1406749))

(assert (not b!1406754))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!151439 () Bool)

(assert (=> d!151439 (= (validKeyInArray!0 (select (arr!46451 a!2901) i!1037)) (and (not (= (select (arr!46451 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46451 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1406748 d!151439))

(declare-fun b!1406877 () Bool)

(declare-fun e!796265 () Bool)

(declare-fun e!796264 () Bool)

(assert (=> b!1406877 (= e!796265 e!796264)))

(declare-fun res!945049 () Bool)

(declare-fun lt!619554 () SeekEntryResult!10762)

(assert (=> b!1406877 (= res!945049 (and (is-Intermediate!10762 lt!619554) (not (undefined!11574 lt!619554)) (bvslt (x!127025 lt!619554) #b01111111111111111111111111111110) (bvsge (x!127025 lt!619554) #b00000000000000000000000000000000) (bvsge (x!127025 lt!619554) #b00000000000000000000000000000000)))))

(assert (=> b!1406877 (=> (not res!945049) (not e!796264))))

(declare-fun b!1406878 () Bool)

(assert (=> b!1406878 (and (bvsge (index!45427 lt!619554) #b00000000000000000000000000000000) (bvslt (index!45427 lt!619554) (size!47001 (array!96208 (store (arr!46451 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47001 a!2901)))))))

(declare-fun res!945048 () Bool)

(assert (=> b!1406878 (= res!945048 (= (select (arr!46451 (array!96208 (store (arr!46451 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47001 a!2901))) (index!45427 lt!619554)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!796267 () Bool)

(assert (=> b!1406878 (=> res!945048 e!796267)))

(declare-fun b!1406879 () Bool)

(assert (=> b!1406879 (and (bvsge (index!45427 lt!619554) #b00000000000000000000000000000000) (bvslt (index!45427 lt!619554) (size!47001 (array!96208 (store (arr!46451 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47001 a!2901)))))))

(assert (=> b!1406879 (= e!796267 (= (select (arr!46451 (array!96208 (store (arr!46451 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47001 a!2901))) (index!45427 lt!619554)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!796268 () SeekEntryResult!10762)

(declare-fun b!1406880 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406880 (= e!796268 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46451 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46451 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96208 (store (arr!46451 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47001 a!2901)) mask!2840))))

(declare-fun b!1406881 () Bool)

(assert (=> b!1406881 (and (bvsge (index!45427 lt!619554) #b00000000000000000000000000000000) (bvslt (index!45427 lt!619554) (size!47001 (array!96208 (store (arr!46451 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47001 a!2901)))))))

(declare-fun res!945050 () Bool)

(assert (=> b!1406881 (= res!945050 (= (select (arr!46451 (array!96208 (store (arr!46451 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47001 a!2901))) (index!45427 lt!619554)) (select (store (arr!46451 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1406881 (=> res!945050 e!796267)))

(assert (=> b!1406881 (= e!796264 e!796267)))

(declare-fun e!796266 () SeekEntryResult!10762)

(declare-fun b!1406882 () Bool)

(assert (=> b!1406882 (= e!796266 (Intermediate!10762 true (toIndex!0 (select (store (arr!46451 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1406883 () Bool)

(assert (=> b!1406883 (= e!796266 e!796268)))

(declare-fun c!130378 () Bool)

(declare-fun lt!619553 () (_ BitVec 64))

(assert (=> b!1406883 (= c!130378 (or (= lt!619553 (select (store (arr!46451 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!619553 lt!619553) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1406884 () Bool)

(assert (=> b!1406884 (= e!796268 (Intermediate!10762 false (toIndex!0 (select (store (arr!46451 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun d!151441 () Bool)

(assert (=> d!151441 e!796265))

(declare-fun c!130379 () Bool)

(assert (=> d!151441 (= c!130379 (and (is-Intermediate!10762 lt!619554) (undefined!11574 lt!619554)))))

(assert (=> d!151441 (= lt!619554 e!796266)))

(declare-fun c!130377 () Bool)

(assert (=> d!151441 (= c!130377 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151441 (= lt!619553 (select (arr!46451 (array!96208 (store (arr!46451 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47001 a!2901))) (toIndex!0 (select (store (arr!46451 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!151441 (validMask!0 mask!2840)))

(assert (=> d!151441 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46451 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46451 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96208 (store (arr!46451 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47001 a!2901)) mask!2840) lt!619554)))

(declare-fun b!1406885 () Bool)

(assert (=> b!1406885 (= e!796265 (bvsge (x!127025 lt!619554) #b01111111111111111111111111111110))))

(assert (= (and d!151441 c!130377) b!1406882))

(assert (= (and d!151441 (not c!130377)) b!1406883))

(assert (= (and b!1406883 c!130378) b!1406884))

(assert (= (and b!1406883 (not c!130378)) b!1406880))

(assert (= (and d!151441 c!130379) b!1406885))

(assert (= (and d!151441 (not c!130379)) b!1406877))

(assert (= (and b!1406877 res!945049) b!1406881))

(assert (= (and b!1406881 (not res!945050)) b!1406878))

(assert (= (and b!1406878 (not res!945048)) b!1406879))

(declare-fun m!1296167 () Bool)

(assert (=> b!1406879 m!1296167))

(assert (=> b!1406878 m!1296167))

(assert (=> d!151441 m!1296039))

(declare-fun m!1296169 () Bool)

(assert (=> d!151441 m!1296169))

(assert (=> d!151441 m!1296045))

(assert (=> b!1406880 m!1296039))

(declare-fun m!1296171 () Bool)

(assert (=> b!1406880 m!1296171))

(assert (=> b!1406880 m!1296171))

(assert (=> b!1406880 m!1296037))

(declare-fun m!1296173 () Bool)

(assert (=> b!1406880 m!1296173))

(assert (=> b!1406881 m!1296167))

(assert (=> b!1406753 d!151441))

(declare-fun d!151461 () Bool)

(declare-fun lt!619564 () (_ BitVec 32))

(declare-fun lt!619563 () (_ BitVec 32))

(assert (=> d!151461 (= lt!619564 (bvmul (bvxor lt!619563 (bvlshr lt!619563 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151461 (= lt!619563 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46451 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46451 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151461 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!945051 (let ((h!34223 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46451 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46451 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127029 (bvmul (bvxor h!34223 (bvlshr h!34223 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127029 (bvlshr x!127029 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!945051 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!945051 #b00000000000000000000000000000000))))))

(assert (=> d!151461 (= (toIndex!0 (select (store (arr!46451 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!619564 (bvlshr lt!619564 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1406753 d!151461))

(declare-fun d!151463 () Bool)

(assert (=> d!151463 (= (validKeyInArray!0 (select (arr!46451 a!2901) j!112)) (and (not (= (select (arr!46451 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46451 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1406754 d!151463))

(declare-fun bm!66957 () Bool)

(declare-fun call!66960 () Bool)

(declare-fun c!130400 () Bool)

(assert (=> bm!66957 (= call!66960 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130400 (Cons!32966 (select (arr!46451 a!2901) #b00000000000000000000000000000000) Nil!32967) Nil!32967)))))

(declare-fun b!1406950 () Bool)

(declare-fun e!796308 () Bool)

(assert (=> b!1406950 (= e!796308 call!66960)))

(declare-fun b!1406951 () Bool)

(declare-fun e!796310 () Bool)

(declare-fun e!796309 () Bool)

(assert (=> b!1406951 (= e!796310 e!796309)))

(declare-fun res!945080 () Bool)

(assert (=> b!1406951 (=> (not res!945080) (not e!796309))))

(declare-fun e!796307 () Bool)

(assert (=> b!1406951 (= res!945080 (not e!796307))))

(declare-fun res!945078 () Bool)

(assert (=> b!1406951 (=> (not res!945078) (not e!796307))))

(assert (=> b!1406951 (= res!945078 (validKeyInArray!0 (select (arr!46451 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1406952 () Bool)

(assert (=> b!1406952 (= e!796309 e!796308)))

(assert (=> b!1406952 (= c!130400 (validKeyInArray!0 (select (arr!46451 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1406953 () Bool)

(assert (=> b!1406953 (= e!796308 call!66960)))

(declare-fun b!1406954 () Bool)

(declare-fun contains!9794 (List!32970 (_ BitVec 64)) Bool)

(assert (=> b!1406954 (= e!796307 (contains!9794 Nil!32967 (select (arr!46451 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!151465 () Bool)

(declare-fun res!945079 () Bool)

(assert (=> d!151465 (=> res!945079 e!796310)))

(assert (=> d!151465 (= res!945079 (bvsge #b00000000000000000000000000000000 (size!47001 a!2901)))))

(assert (=> d!151465 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32967) e!796310)))

(assert (= (and d!151465 (not res!945079)) b!1406951))

(assert (= (and b!1406951 res!945078) b!1406954))

(assert (= (and b!1406951 res!945080) b!1406952))

(assert (= (and b!1406952 c!130400) b!1406953))

(assert (= (and b!1406952 (not c!130400)) b!1406950))

(assert (= (or b!1406953 b!1406950) bm!66957))

(declare-fun m!1296191 () Bool)

(assert (=> bm!66957 m!1296191))

(declare-fun m!1296193 () Bool)

(assert (=> bm!66957 m!1296193))

(assert (=> b!1406951 m!1296191))

(assert (=> b!1406951 m!1296191))

(declare-fun m!1296195 () Bool)

(assert (=> b!1406951 m!1296195))

(assert (=> b!1406952 m!1296191))

(assert (=> b!1406952 m!1296191))

(assert (=> b!1406952 m!1296195))

(assert (=> b!1406954 m!1296191))

(assert (=> b!1406954 m!1296191))

(declare-fun m!1296197 () Bool)

(assert (=> b!1406954 m!1296197))

(assert (=> b!1406752 d!151465))

(declare-fun bm!66962 () Bool)

(declare-fun call!66965 () Bool)

(assert (=> bm!66962 (= call!66965 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!151471 () Bool)

(declare-fun res!945095 () Bool)

(declare-fun e!796331 () Bool)

(assert (=> d!151471 (=> res!945095 e!796331)))

(assert (=> d!151471 (= res!945095 (bvsge j!112 (size!47001 a!2901)))))

(assert (=> d!151471 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!796331)))

(declare-fun b!1406982 () Bool)

(declare-fun e!796332 () Bool)

(declare-fun e!796330 () Bool)

(assert (=> b!1406982 (= e!796332 e!796330)))

(declare-fun lt!619595 () (_ BitVec 64))

(assert (=> b!1406982 (= lt!619595 (select (arr!46451 a!2901) j!112))))

(declare-fun lt!619596 () Unit!47498)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96207 (_ BitVec 64) (_ BitVec 32)) Unit!47498)

(assert (=> b!1406982 (= lt!619596 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!619595 j!112))))

(declare-fun arrayContainsKey!0 (array!96207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1406982 (arrayContainsKey!0 a!2901 lt!619595 #b00000000000000000000000000000000)))

(declare-fun lt!619597 () Unit!47498)

(assert (=> b!1406982 (= lt!619597 lt!619596)))

(declare-fun res!945094 () Bool)

(assert (=> b!1406982 (= res!945094 (= (seekEntryOrOpen!0 (select (arr!46451 a!2901) j!112) a!2901 mask!2840) (Found!10762 j!112)))))

(assert (=> b!1406982 (=> (not res!945094) (not e!796330))))

(declare-fun b!1406983 () Bool)

(assert (=> b!1406983 (= e!796331 e!796332)))

(declare-fun c!130408 () Bool)

(assert (=> b!1406983 (= c!130408 (validKeyInArray!0 (select (arr!46451 a!2901) j!112)))))

(declare-fun b!1406984 () Bool)

(assert (=> b!1406984 (= e!796332 call!66965)))

(declare-fun b!1406985 () Bool)

(assert (=> b!1406985 (= e!796330 call!66965)))

(assert (= (and d!151471 (not res!945095)) b!1406983))

(assert (= (and b!1406983 c!130408) b!1406982))

(assert (= (and b!1406983 (not c!130408)) b!1406984))

(assert (= (and b!1406982 res!945094) b!1406985))

(assert (= (or b!1406985 b!1406984) bm!66962))

(declare-fun m!1296207 () Bool)

(assert (=> bm!66962 m!1296207))

(assert (=> b!1406982 m!1296015))

(declare-fun m!1296209 () Bool)

(assert (=> b!1406982 m!1296209))

(declare-fun m!1296211 () Bool)

(assert (=> b!1406982 m!1296211))

(assert (=> b!1406982 m!1296015))

(assert (=> b!1406982 m!1296031))

(assert (=> b!1406983 m!1296015))

(assert (=> b!1406983 m!1296015))

(assert (=> b!1406983 m!1296033))

(assert (=> b!1406747 d!151471))

(declare-fun d!151483 () Bool)

(assert (=> d!151483 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!619606 () Unit!47498)

(declare-fun choose!38 (array!96207 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47498)

(assert (=> d!151483 (= lt!619606 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151483 (validMask!0 mask!2840)))

(assert (=> d!151483 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!619606)))

(declare-fun bs!41011 () Bool)

(assert (= bs!41011 d!151483))

(assert (=> bs!41011 m!1296023))

(declare-fun m!1296217 () Bool)

(assert (=> bs!41011 m!1296217))

(assert (=> bs!41011 m!1296045))

(assert (=> b!1406747 d!151483))

(declare-fun b!1407009 () Bool)

(declare-fun e!796347 () Bool)

(declare-fun e!796346 () Bool)

(assert (=> b!1407009 (= e!796347 e!796346)))

(declare-fun res!945100 () Bool)

(declare-fun lt!619611 () SeekEntryResult!10762)

(assert (=> b!1407009 (= res!945100 (and (is-Intermediate!10762 lt!619611) (not (undefined!11574 lt!619611)) (bvslt (x!127025 lt!619611) #b01111111111111111111111111111110) (bvsge (x!127025 lt!619611) #b00000000000000000000000000000000) (bvsge (x!127025 lt!619611) #b00000000000000000000000000000000)))))

(assert (=> b!1407009 (=> (not res!945100) (not e!796346))))

(declare-fun b!1407010 () Bool)

(assert (=> b!1407010 (and (bvsge (index!45427 lt!619611) #b00000000000000000000000000000000) (bvslt (index!45427 lt!619611) (size!47001 a!2901)))))

(declare-fun res!945099 () Bool)

(assert (=> b!1407010 (= res!945099 (= (select (arr!46451 a!2901) (index!45427 lt!619611)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!796349 () Bool)

(assert (=> b!1407010 (=> res!945099 e!796349)))

(declare-fun b!1407011 () Bool)

(assert (=> b!1407011 (and (bvsge (index!45427 lt!619611) #b00000000000000000000000000000000) (bvslt (index!45427 lt!619611) (size!47001 a!2901)))))

(assert (=> b!1407011 (= e!796349 (= (select (arr!46451 a!2901) (index!45427 lt!619611)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!796350 () SeekEntryResult!10762)

(declare-fun b!1407012 () Bool)

(assert (=> b!1407012 (= e!796350 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46451 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46451 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1407013 () Bool)

(assert (=> b!1407013 (and (bvsge (index!45427 lt!619611) #b00000000000000000000000000000000) (bvslt (index!45427 lt!619611) (size!47001 a!2901)))))

(declare-fun res!945101 () Bool)

(assert (=> b!1407013 (= res!945101 (= (select (arr!46451 a!2901) (index!45427 lt!619611)) (select (arr!46451 a!2901) j!112)))))

(assert (=> b!1407013 (=> res!945101 e!796349)))

(assert (=> b!1407013 (= e!796346 e!796349)))

(declare-fun e!796348 () SeekEntryResult!10762)

(declare-fun b!1407014 () Bool)

(assert (=> b!1407014 (= e!796348 (Intermediate!10762 true (toIndex!0 (select (arr!46451 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1407015 () Bool)

(assert (=> b!1407015 (= e!796348 e!796350)))

(declare-fun c!130420 () Bool)

(declare-fun lt!619610 () (_ BitVec 64))

(assert (=> b!1407015 (= c!130420 (or (= lt!619610 (select (arr!46451 a!2901) j!112)) (= (bvadd lt!619610 lt!619610) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1407016 () Bool)

(assert (=> b!1407016 (= e!796350 (Intermediate!10762 false (toIndex!0 (select (arr!46451 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun d!151487 () Bool)

(assert (=> d!151487 e!796347))

(declare-fun c!130421 () Bool)

(assert (=> d!151487 (= c!130421 (and (is-Intermediate!10762 lt!619611) (undefined!11574 lt!619611)))))

(assert (=> d!151487 (= lt!619611 e!796348)))

(declare-fun c!130419 () Bool)

(assert (=> d!151487 (= c!130419 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151487 (= lt!619610 (select (arr!46451 a!2901) (toIndex!0 (select (arr!46451 a!2901) j!112) mask!2840)))))

(assert (=> d!151487 (validMask!0 mask!2840)))

(assert (=> d!151487 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46451 a!2901) j!112) mask!2840) (select (arr!46451 a!2901) j!112) a!2901 mask!2840) lt!619611)))

(declare-fun b!1407017 () Bool)

(assert (=> b!1407017 (= e!796347 (bvsge (x!127025 lt!619611) #b01111111111111111111111111111110))))

(assert (= (and d!151487 c!130419) b!1407014))

(assert (= (and d!151487 (not c!130419)) b!1407015))

(assert (= (and b!1407015 c!130420) b!1407016))

(assert (= (and b!1407015 (not c!130420)) b!1407012))

(assert (= (and d!151487 c!130421) b!1407017))

(assert (= (and d!151487 (not c!130421)) b!1407009))

(assert (= (and b!1407009 res!945100) b!1407013))

(assert (= (and b!1407013 (not res!945101)) b!1407010))

(assert (= (and b!1407010 (not res!945099)) b!1407011))

(declare-fun m!1296229 () Bool)

(assert (=> b!1407011 m!1296229))

(assert (=> b!1407010 m!1296229))

(assert (=> d!151487 m!1296017))

(declare-fun m!1296231 () Bool)

(assert (=> d!151487 m!1296231))

(assert (=> d!151487 m!1296045))

(assert (=> b!1407012 m!1296017))

(declare-fun m!1296233 () Bool)

(assert (=> b!1407012 m!1296233))

(assert (=> b!1407012 m!1296233))

(assert (=> b!1407012 m!1296015))

(declare-fun m!1296235 () Bool)

(assert (=> b!1407012 m!1296235))

(assert (=> b!1407013 m!1296229))

(assert (=> b!1406747 d!151487))

(declare-fun d!151495 () Bool)

(declare-fun lt!619613 () (_ BitVec 32))

(declare-fun lt!619612 () (_ BitVec 32))

(assert (=> d!151495 (= lt!619613 (bvmul (bvxor lt!619612 (bvlshr lt!619612 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151495 (= lt!619612 ((_ extract 31 0) (bvand (bvxor (select (arr!46451 a!2901) j!112) (bvlshr (select (arr!46451 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151495 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!945051 (let ((h!34223 ((_ extract 31 0) (bvand (bvxor (select (arr!46451 a!2901) j!112) (bvlshr (select (arr!46451 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127029 (bvmul (bvxor h!34223 (bvlshr h!34223 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127029 (bvlshr x!127029 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!945051 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!945051 #b00000000000000000000000000000000))))))

(assert (=> d!151495 (= (toIndex!0 (select (arr!46451 a!2901) j!112) mask!2840) (bvand (bvxor lt!619613 (bvlshr lt!619613 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1406747 d!151495))

(declare-fun d!151497 () Bool)

(assert (=> d!151497 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!120900 d!151497))

(declare-fun d!151507 () Bool)

(assert (=> d!151507 (= (array_inv!35479 a!2901) (bvsge (size!47001 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!120900 d!151507))

(declare-fun bm!66967 () Bool)

(declare-fun call!66970 () Bool)

(assert (=> bm!66967 (= call!66970 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!151509 () Bool)

(declare-fun res!945115 () Bool)

(declare-fun e!796369 () Bool)

(assert (=> d!151509 (=> res!945115 e!796369)))

(assert (=> d!151509 (= res!945115 (bvsge #b00000000000000000000000000000000 (size!47001 a!2901)))))

(assert (=> d!151509 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!796369)))

(declare-fun b!1407042 () Bool)

(declare-fun e!796370 () Bool)

(declare-fun e!796368 () Bool)

(assert (=> b!1407042 (= e!796370 e!796368)))

(declare-fun lt!619618 () (_ BitVec 64))

(assert (=> b!1407042 (= lt!619618 (select (arr!46451 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!619619 () Unit!47498)

(assert (=> b!1407042 (= lt!619619 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!619618 #b00000000000000000000000000000000))))

(assert (=> b!1407042 (arrayContainsKey!0 a!2901 lt!619618 #b00000000000000000000000000000000)))

(declare-fun lt!619620 () Unit!47498)

(assert (=> b!1407042 (= lt!619620 lt!619619)))

(declare-fun res!945114 () Bool)

(assert (=> b!1407042 (= res!945114 (= (seekEntryOrOpen!0 (select (arr!46451 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10762 #b00000000000000000000000000000000)))))

(assert (=> b!1407042 (=> (not res!945114) (not e!796368))))

(declare-fun b!1407043 () Bool)

(assert (=> b!1407043 (= e!796369 e!796370)))

(declare-fun c!130428 () Bool)

(assert (=> b!1407043 (= c!130428 (validKeyInArray!0 (select (arr!46451 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1407044 () Bool)

(assert (=> b!1407044 (= e!796370 call!66970)))

(declare-fun b!1407045 () Bool)

(assert (=> b!1407045 (= e!796368 call!66970)))

(assert (= (and d!151509 (not res!945115)) b!1407043))

(assert (= (and b!1407043 c!130428) b!1407042))

(assert (= (and b!1407043 (not c!130428)) b!1407044))

(assert (= (and b!1407042 res!945114) b!1407045))

(assert (= (or b!1407045 b!1407044) bm!66967))

(declare-fun m!1296249 () Bool)

(assert (=> bm!66967 m!1296249))

(assert (=> b!1407042 m!1296191))

(declare-fun m!1296251 () Bool)

(assert (=> b!1407042 m!1296251))

(declare-fun m!1296253 () Bool)

(assert (=> b!1407042 m!1296253))

(assert (=> b!1407042 m!1296191))

(declare-fun m!1296255 () Bool)

(assert (=> b!1407042 m!1296255))

(assert (=> b!1407043 m!1296191))

(assert (=> b!1407043 m!1296191))

(assert (=> b!1407043 m!1296195))

(assert (=> b!1406746 d!151509))

(declare-fun b!1407058 () Bool)

(declare-fun e!796377 () SeekEntryResult!10762)

(declare-fun lt!619629 () SeekEntryResult!10762)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96207 (_ BitVec 32)) SeekEntryResult!10762)

(assert (=> b!1407058 (= e!796377 (seekKeyOrZeroReturnVacant!0 (x!127025 lt!619629) (index!45427 lt!619629) (index!45427 lt!619629) (select (arr!46451 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1407059 () Bool)

(assert (=> b!1407059 (= e!796377 (MissingZero!10762 (index!45427 lt!619629)))))

(declare-fun b!1407060 () Bool)

(declare-fun c!130437 () Bool)

(declare-fun lt!619628 () (_ BitVec 64))

(assert (=> b!1407060 (= c!130437 (= lt!619628 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!796378 () SeekEntryResult!10762)

(assert (=> b!1407060 (= e!796378 e!796377)))

(declare-fun b!1407061 () Bool)

(declare-fun e!796379 () SeekEntryResult!10762)

(assert (=> b!1407061 (= e!796379 Undefined!10762)))

(declare-fun b!1407062 () Bool)

(assert (=> b!1407062 (= e!796379 e!796378)))

(assert (=> b!1407062 (= lt!619628 (select (arr!46451 a!2901) (index!45427 lt!619629)))))

(declare-fun c!130435 () Bool)

(assert (=> b!1407062 (= c!130435 (= lt!619628 (select (arr!46451 a!2901) j!112)))))

(declare-fun d!151511 () Bool)

(declare-fun lt!619627 () SeekEntryResult!10762)

(assert (=> d!151511 (and (or (is-Undefined!10762 lt!619627) (not (is-Found!10762 lt!619627)) (and (bvsge (index!45426 lt!619627) #b00000000000000000000000000000000) (bvslt (index!45426 lt!619627) (size!47001 a!2901)))) (or (is-Undefined!10762 lt!619627) (is-Found!10762 lt!619627) (not (is-MissingZero!10762 lt!619627)) (and (bvsge (index!45425 lt!619627) #b00000000000000000000000000000000) (bvslt (index!45425 lt!619627) (size!47001 a!2901)))) (or (is-Undefined!10762 lt!619627) (is-Found!10762 lt!619627) (is-MissingZero!10762 lt!619627) (not (is-MissingVacant!10762 lt!619627)) (and (bvsge (index!45428 lt!619627) #b00000000000000000000000000000000) (bvslt (index!45428 lt!619627) (size!47001 a!2901)))) (or (is-Undefined!10762 lt!619627) (ite (is-Found!10762 lt!619627) (= (select (arr!46451 a!2901) (index!45426 lt!619627)) (select (arr!46451 a!2901) j!112)) (ite (is-MissingZero!10762 lt!619627) (= (select (arr!46451 a!2901) (index!45425 lt!619627)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10762 lt!619627) (= (select (arr!46451 a!2901) (index!45428 lt!619627)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!151511 (= lt!619627 e!796379)))

(declare-fun c!130436 () Bool)

(assert (=> d!151511 (= c!130436 (and (is-Intermediate!10762 lt!619629) (undefined!11574 lt!619629)))))

(assert (=> d!151511 (= lt!619629 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46451 a!2901) j!112) mask!2840) (select (arr!46451 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151511 (validMask!0 mask!2840)))

(assert (=> d!151511 (= (seekEntryOrOpen!0 (select (arr!46451 a!2901) j!112) a!2901 mask!2840) lt!619627)))

(declare-fun b!1407063 () Bool)

(assert (=> b!1407063 (= e!796378 (Found!10762 (index!45427 lt!619629)))))

(assert (= (and d!151511 c!130436) b!1407061))

(assert (= (and d!151511 (not c!130436)) b!1407062))

(assert (= (and b!1407062 c!130435) b!1407063))

(assert (= (and b!1407062 (not c!130435)) b!1407060))

(assert (= (and b!1407060 c!130437) b!1407059))

(assert (= (and b!1407060 (not c!130437)) b!1407058))

(assert (=> b!1407058 m!1296015))

(declare-fun m!1296257 () Bool)

(assert (=> b!1407058 m!1296257))

(declare-fun m!1296259 () Bool)

(assert (=> b!1407062 m!1296259))

(declare-fun m!1296261 () Bool)

(assert (=> d!151511 m!1296261))

(declare-fun m!1296263 () Bool)

(assert (=> d!151511 m!1296263))

(assert (=> d!151511 m!1296045))

(assert (=> d!151511 m!1296017))

(assert (=> d!151511 m!1296015))

(assert (=> d!151511 m!1296021))

(assert (=> d!151511 m!1296015))

(assert (=> d!151511 m!1296017))

(declare-fun m!1296265 () Bool)

(assert (=> d!151511 m!1296265))

(assert (=> b!1406749 d!151511))

(push 1)

