; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50246 () Bool)

(assert start!50246)

(declare-fun res!343234 () Bool)

(declare-fun e!317447 () Bool)

(assert (=> start!50246 (=> (not res!343234) (not e!317447))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50246 (= res!343234 (validMask!0 mask!3119))))

(assert (=> start!50246 e!317447))

(assert (=> start!50246 true))

(declare-datatypes ((array!34708 0))(
  ( (array!34709 (arr!16670 (Array (_ BitVec 32) (_ BitVec 64))) (size!17035 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34708)

(declare-fun array_inv!12553 (array!34708) Bool)

(assert (=> start!50246 (array_inv!12553 a!3118)))

(declare-fun b!549940 () Bool)

(declare-fun res!343230 () Bool)

(assert (=> b!549940 (=> (not res!343230) (not e!317447))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549940 (= res!343230 (validKeyInArray!0 k0!1914))))

(declare-fun b!549941 () Bool)

(declare-fun res!343227 () Bool)

(assert (=> b!549941 (=> (not res!343227) (not e!317447))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!549941 (= res!343227 (validKeyInArray!0 (select (arr!16670 a!3118) j!142)))))

(declare-fun b!549942 () Bool)

(declare-fun res!343229 () Bool)

(assert (=> b!549942 (=> (not res!343229) (not e!317447))))

(declare-fun arrayContainsKey!0 (array!34708 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549942 (= res!343229 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549943 () Bool)

(declare-fun e!317446 () Bool)

(assert (=> b!549943 (= e!317446 (not (or (bvslt mask!3119 #b00000000000000000000000000000000) (bvsle mask!3119 #b00111111111111111111111111111111))))))

(declare-fun e!317445 () Bool)

(assert (=> b!549943 e!317445))

(declare-fun res!343235 () Bool)

(assert (=> b!549943 (=> (not res!343235) (not e!317445))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34708 (_ BitVec 32)) Bool)

(assert (=> b!549943 (= res!343235 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!16992 0))(
  ( (Unit!16993) )
))
(declare-fun lt!250201 () Unit!16992)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34708 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16992)

(assert (=> b!549943 (= lt!250201 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!549944 () Bool)

(declare-datatypes ((SeekEntryResult!5116 0))(
  ( (MissingZero!5116 (index!22691 (_ BitVec 32))) (Found!5116 (index!22692 (_ BitVec 32))) (Intermediate!5116 (undefined!5928 Bool) (index!22693 (_ BitVec 32)) (x!51625 (_ BitVec 32))) (Undefined!5116) (MissingVacant!5116 (index!22694 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34708 (_ BitVec 32)) SeekEntryResult!5116)

(assert (=> b!549944 (= e!317445 (= (seekEntryOrOpen!0 (select (arr!16670 a!3118) j!142) a!3118 mask!3119) (Found!5116 j!142)))))

(declare-fun b!549945 () Bool)

(declare-fun res!343232 () Bool)

(assert (=> b!549945 (=> (not res!343232) (not e!317446))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34708 (_ BitVec 32)) SeekEntryResult!5116)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549945 (= res!343232 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16670 a!3118) j!142) mask!3119) (select (arr!16670 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16670 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16670 a!3118) i!1132 k0!1914) j!142) (array!34709 (store (arr!16670 a!3118) i!1132 k0!1914) (size!17035 a!3118)) mask!3119)))))

(declare-fun b!549946 () Bool)

(declare-fun res!343233 () Bool)

(assert (=> b!549946 (=> (not res!343233) (not e!317446))))

(assert (=> b!549946 (= res!343233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549947 () Bool)

(assert (=> b!549947 (= e!317447 e!317446)))

(declare-fun res!343226 () Bool)

(assert (=> b!549947 (=> (not res!343226) (not e!317446))))

(declare-fun lt!250200 () SeekEntryResult!5116)

(assert (=> b!549947 (= res!343226 (or (= lt!250200 (MissingZero!5116 i!1132)) (= lt!250200 (MissingVacant!5116 i!1132))))))

(assert (=> b!549947 (= lt!250200 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!549948 () Bool)

(declare-fun res!343231 () Bool)

(assert (=> b!549948 (=> (not res!343231) (not e!317447))))

(assert (=> b!549948 (= res!343231 (and (= (size!17035 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17035 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17035 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549949 () Bool)

(declare-fun res!343228 () Bool)

(assert (=> b!549949 (=> (not res!343228) (not e!317446))))

(declare-datatypes ((List!10789 0))(
  ( (Nil!10786) (Cons!10785 (h!11758 (_ BitVec 64)) (t!17008 List!10789)) )
))
(declare-fun arrayNoDuplicates!0 (array!34708 (_ BitVec 32) List!10789) Bool)

(assert (=> b!549949 (= res!343228 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10786))))

(assert (= (and start!50246 res!343234) b!549948))

(assert (= (and b!549948 res!343231) b!549941))

(assert (= (and b!549941 res!343227) b!549940))

(assert (= (and b!549940 res!343230) b!549942))

(assert (= (and b!549942 res!343229) b!549947))

(assert (= (and b!549947 res!343226) b!549946))

(assert (= (and b!549946 res!343233) b!549949))

(assert (= (and b!549949 res!343228) b!549945))

(assert (= (and b!549945 res!343232) b!549943))

(assert (= (and b!549943 res!343235) b!549944))

(declare-fun m!526475 () Bool)

(assert (=> b!549941 m!526475))

(assert (=> b!549941 m!526475))

(declare-fun m!526477 () Bool)

(assert (=> b!549941 m!526477))

(declare-fun m!526479 () Bool)

(assert (=> b!549947 m!526479))

(declare-fun m!526481 () Bool)

(assert (=> b!549946 m!526481))

(declare-fun m!526483 () Bool)

(assert (=> b!549942 m!526483))

(declare-fun m!526485 () Bool)

(assert (=> start!50246 m!526485))

(declare-fun m!526487 () Bool)

(assert (=> start!50246 m!526487))

(declare-fun m!526489 () Bool)

(assert (=> b!549943 m!526489))

(declare-fun m!526491 () Bool)

(assert (=> b!549943 m!526491))

(declare-fun m!526493 () Bool)

(assert (=> b!549940 m!526493))

(declare-fun m!526495 () Bool)

(assert (=> b!549949 m!526495))

(assert (=> b!549944 m!526475))

(assert (=> b!549944 m!526475))

(declare-fun m!526497 () Bool)

(assert (=> b!549944 m!526497))

(assert (=> b!549945 m!526475))

(declare-fun m!526499 () Bool)

(assert (=> b!549945 m!526499))

(assert (=> b!549945 m!526475))

(declare-fun m!526501 () Bool)

(assert (=> b!549945 m!526501))

(declare-fun m!526503 () Bool)

(assert (=> b!549945 m!526503))

(assert (=> b!549945 m!526501))

(declare-fun m!526505 () Bool)

(assert (=> b!549945 m!526505))

(assert (=> b!549945 m!526499))

(assert (=> b!549945 m!526475))

(declare-fun m!526507 () Bool)

(assert (=> b!549945 m!526507))

(declare-fun m!526509 () Bool)

(assert (=> b!549945 m!526509))

(assert (=> b!549945 m!526501))

(assert (=> b!549945 m!526503))

(check-sat (not b!549947) (not start!50246) (not b!549942) (not b!549943) (not b!549940) (not b!549941) (not b!549949) (not b!549944) (not b!549946) (not b!549945))
(check-sat)
(get-model)

(declare-fun d!82601 () Bool)

(assert (=> d!82601 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50246 d!82601))

(declare-fun d!82605 () Bool)

(assert (=> d!82605 (= (array_inv!12553 a!3118) (bvsge (size!17035 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50246 d!82605))

(declare-fun d!82607 () Bool)

(assert (=> d!82607 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!549940 d!82607))

(declare-fun b!550073 () Bool)

(declare-fun e!317516 () Bool)

(declare-fun lt!250236 () SeekEntryResult!5116)

(assert (=> b!550073 (= e!317516 (bvsge (x!51625 lt!250236) #b01111111111111111111111111111110))))

(declare-fun b!550074 () Bool)

(assert (=> b!550074 (and (bvsge (index!22693 lt!250236) #b00000000000000000000000000000000) (bvslt (index!22693 lt!250236) (size!17035 a!3118)))))

(declare-fun res!343317 () Bool)

(assert (=> b!550074 (= res!343317 (= (select (arr!16670 a!3118) (index!22693 lt!250236)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!317517 () Bool)

(assert (=> b!550074 (=> res!343317 e!317517)))

(declare-fun b!550075 () Bool)

(assert (=> b!550075 (and (bvsge (index!22693 lt!250236) #b00000000000000000000000000000000) (bvslt (index!22693 lt!250236) (size!17035 a!3118)))))

(assert (=> b!550075 (= e!317517 (= (select (arr!16670 a!3118) (index!22693 lt!250236)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!550076 () Bool)

(declare-fun e!317515 () Bool)

(assert (=> b!550076 (= e!317516 e!317515)))

(declare-fun res!343319 () Bool)

(get-info :version)

(assert (=> b!550076 (= res!343319 (and ((_ is Intermediate!5116) lt!250236) (not (undefined!5928 lt!250236)) (bvslt (x!51625 lt!250236) #b01111111111111111111111111111110) (bvsge (x!51625 lt!250236) #b00000000000000000000000000000000) (bvsge (x!51625 lt!250236) #b00000000000000000000000000000000)))))

(assert (=> b!550076 (=> (not res!343319) (not e!317515))))

(declare-fun d!82609 () Bool)

(assert (=> d!82609 e!317516))

(declare-fun c!63709 () Bool)

(assert (=> d!82609 (= c!63709 (and ((_ is Intermediate!5116) lt!250236) (undefined!5928 lt!250236)))))

(declare-fun e!317513 () SeekEntryResult!5116)

(assert (=> d!82609 (= lt!250236 e!317513)))

(declare-fun c!63711 () Bool)

(assert (=> d!82609 (= c!63711 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!250237 () (_ BitVec 64))

(assert (=> d!82609 (= lt!250237 (select (arr!16670 a!3118) (toIndex!0 (select (arr!16670 a!3118) j!142) mask!3119)))))

(assert (=> d!82609 (validMask!0 mask!3119)))

(assert (=> d!82609 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16670 a!3118) j!142) mask!3119) (select (arr!16670 a!3118) j!142) a!3118 mask!3119) lt!250236)))

(declare-fun b!550077 () Bool)

(assert (=> b!550077 (= e!317513 (Intermediate!5116 true (toIndex!0 (select (arr!16670 a!3118) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun e!317514 () SeekEntryResult!5116)

(declare-fun b!550078 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550078 (= e!317514 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16670 a!3118) j!142) mask!3119) #b00000000000000000000000000000000 mask!3119) (select (arr!16670 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!550079 () Bool)

(assert (=> b!550079 (= e!317514 (Intermediate!5116 false (toIndex!0 (select (arr!16670 a!3118) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!550080 () Bool)

(assert (=> b!550080 (= e!317513 e!317514)))

(declare-fun c!63710 () Bool)

(assert (=> b!550080 (= c!63710 (or (= lt!250237 (select (arr!16670 a!3118) j!142)) (= (bvadd lt!250237 lt!250237) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!550081 () Bool)

(assert (=> b!550081 (and (bvsge (index!22693 lt!250236) #b00000000000000000000000000000000) (bvslt (index!22693 lt!250236) (size!17035 a!3118)))))

(declare-fun res!343318 () Bool)

(assert (=> b!550081 (= res!343318 (= (select (arr!16670 a!3118) (index!22693 lt!250236)) (select (arr!16670 a!3118) j!142)))))

(assert (=> b!550081 (=> res!343318 e!317517)))

(assert (=> b!550081 (= e!317515 e!317517)))

(assert (= (and d!82609 c!63711) b!550077))

(assert (= (and d!82609 (not c!63711)) b!550080))

(assert (= (and b!550080 c!63710) b!550079))

(assert (= (and b!550080 (not c!63710)) b!550078))

(assert (= (and d!82609 c!63709) b!550073))

(assert (= (and d!82609 (not c!63709)) b!550076))

(assert (= (and b!550076 res!343319) b!550081))

(assert (= (and b!550081 (not res!343318)) b!550074))

(assert (= (and b!550074 (not res!343317)) b!550075))

(declare-fun m!526611 () Bool)

(assert (=> b!550081 m!526611))

(assert (=> b!550078 m!526499))

(declare-fun m!526613 () Bool)

(assert (=> b!550078 m!526613))

(assert (=> b!550078 m!526613))

(assert (=> b!550078 m!526475))

(declare-fun m!526615 () Bool)

(assert (=> b!550078 m!526615))

(assert (=> b!550074 m!526611))

(assert (=> b!550075 m!526611))

(assert (=> d!82609 m!526499))

(declare-fun m!526617 () Bool)

(assert (=> d!82609 m!526617))

(assert (=> d!82609 m!526485))

(assert (=> b!549945 d!82609))

(declare-fun d!82619 () Bool)

(declare-fun lt!250252 () (_ BitVec 32))

(declare-fun lt!250251 () (_ BitVec 32))

(assert (=> d!82619 (= lt!250252 (bvmul (bvxor lt!250251 (bvlshr lt!250251 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82619 (= lt!250251 ((_ extract 31 0) (bvand (bvxor (select (arr!16670 a!3118) j!142) (bvlshr (select (arr!16670 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82619 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!343320 (let ((h!11761 ((_ extract 31 0) (bvand (bvxor (select (arr!16670 a!3118) j!142) (bvlshr (select (arr!16670 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51629 (bvmul (bvxor h!11761 (bvlshr h!11761 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51629 (bvlshr x!51629 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!343320 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!343320 #b00000000000000000000000000000000))))))

(assert (=> d!82619 (= (toIndex!0 (select (arr!16670 a!3118) j!142) mask!3119) (bvand (bvxor lt!250252 (bvlshr lt!250252 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!549945 d!82619))

(declare-fun b!550090 () Bool)

(declare-fun e!317527 () Bool)

(declare-fun lt!250253 () SeekEntryResult!5116)

(assert (=> b!550090 (= e!317527 (bvsge (x!51625 lt!250253) #b01111111111111111111111111111110))))

(declare-fun b!550091 () Bool)

(assert (=> b!550091 (and (bvsge (index!22693 lt!250253) #b00000000000000000000000000000000) (bvslt (index!22693 lt!250253) (size!17035 (array!34709 (store (arr!16670 a!3118) i!1132 k0!1914) (size!17035 a!3118)))))))

(declare-fun res!343325 () Bool)

(assert (=> b!550091 (= res!343325 (= (select (arr!16670 (array!34709 (store (arr!16670 a!3118) i!1132 k0!1914) (size!17035 a!3118))) (index!22693 lt!250253)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!317528 () Bool)

(assert (=> b!550091 (=> res!343325 e!317528)))

(declare-fun b!550092 () Bool)

(assert (=> b!550092 (and (bvsge (index!22693 lt!250253) #b00000000000000000000000000000000) (bvslt (index!22693 lt!250253) (size!17035 (array!34709 (store (arr!16670 a!3118) i!1132 k0!1914) (size!17035 a!3118)))))))

(assert (=> b!550092 (= e!317528 (= (select (arr!16670 (array!34709 (store (arr!16670 a!3118) i!1132 k0!1914) (size!17035 a!3118))) (index!22693 lt!250253)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!550093 () Bool)

(declare-fun e!317526 () Bool)

(assert (=> b!550093 (= e!317527 e!317526)))

(declare-fun res!343327 () Bool)

(assert (=> b!550093 (= res!343327 (and ((_ is Intermediate!5116) lt!250253) (not (undefined!5928 lt!250253)) (bvslt (x!51625 lt!250253) #b01111111111111111111111111111110) (bvsge (x!51625 lt!250253) #b00000000000000000000000000000000) (bvsge (x!51625 lt!250253) #b00000000000000000000000000000000)))))

(assert (=> b!550093 (=> (not res!343327) (not e!317526))))

(declare-fun d!82623 () Bool)

(assert (=> d!82623 e!317527))

(declare-fun c!63714 () Bool)

(assert (=> d!82623 (= c!63714 (and ((_ is Intermediate!5116) lt!250253) (undefined!5928 lt!250253)))))

(declare-fun e!317524 () SeekEntryResult!5116)

(assert (=> d!82623 (= lt!250253 e!317524)))

(declare-fun c!63716 () Bool)

(assert (=> d!82623 (= c!63716 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!250254 () (_ BitVec 64))

(assert (=> d!82623 (= lt!250254 (select (arr!16670 (array!34709 (store (arr!16670 a!3118) i!1132 k0!1914) (size!17035 a!3118))) (toIndex!0 (select (store (arr!16670 a!3118) i!1132 k0!1914) j!142) mask!3119)))))

(assert (=> d!82623 (validMask!0 mask!3119)))

(assert (=> d!82623 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16670 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16670 a!3118) i!1132 k0!1914) j!142) (array!34709 (store (arr!16670 a!3118) i!1132 k0!1914) (size!17035 a!3118)) mask!3119) lt!250253)))

(declare-fun b!550094 () Bool)

(assert (=> b!550094 (= e!317524 (Intermediate!5116 true (toIndex!0 (select (store (arr!16670 a!3118) i!1132 k0!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!550095 () Bool)

(declare-fun e!317525 () SeekEntryResult!5116)

(assert (=> b!550095 (= e!317525 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!16670 a!3118) i!1132 k0!1914) j!142) mask!3119) #b00000000000000000000000000000000 mask!3119) (select (store (arr!16670 a!3118) i!1132 k0!1914) j!142) (array!34709 (store (arr!16670 a!3118) i!1132 k0!1914) (size!17035 a!3118)) mask!3119))))

(declare-fun b!550096 () Bool)

(assert (=> b!550096 (= e!317525 (Intermediate!5116 false (toIndex!0 (select (store (arr!16670 a!3118) i!1132 k0!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!550097 () Bool)

(assert (=> b!550097 (= e!317524 e!317525)))

(declare-fun c!63715 () Bool)

(assert (=> b!550097 (= c!63715 (or (= lt!250254 (select (store (arr!16670 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!250254 lt!250254) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!550098 () Bool)

(assert (=> b!550098 (and (bvsge (index!22693 lt!250253) #b00000000000000000000000000000000) (bvslt (index!22693 lt!250253) (size!17035 (array!34709 (store (arr!16670 a!3118) i!1132 k0!1914) (size!17035 a!3118)))))))

(declare-fun res!343326 () Bool)

(assert (=> b!550098 (= res!343326 (= (select (arr!16670 (array!34709 (store (arr!16670 a!3118) i!1132 k0!1914) (size!17035 a!3118))) (index!22693 lt!250253)) (select (store (arr!16670 a!3118) i!1132 k0!1914) j!142)))))

(assert (=> b!550098 (=> res!343326 e!317528)))

(assert (=> b!550098 (= e!317526 e!317528)))

(assert (= (and d!82623 c!63716) b!550094))

(assert (= (and d!82623 (not c!63716)) b!550097))

(assert (= (and b!550097 c!63715) b!550096))

(assert (= (and b!550097 (not c!63715)) b!550095))

(assert (= (and d!82623 c!63714) b!550090))

(assert (= (and d!82623 (not c!63714)) b!550093))

(assert (= (and b!550093 res!343327) b!550098))

(assert (= (and b!550098 (not res!343326)) b!550091))

(assert (= (and b!550091 (not res!343325)) b!550092))

(declare-fun m!526621 () Bool)

(assert (=> b!550098 m!526621))

(assert (=> b!550095 m!526503))

(declare-fun m!526623 () Bool)

(assert (=> b!550095 m!526623))

(assert (=> b!550095 m!526623))

(assert (=> b!550095 m!526501))

(declare-fun m!526625 () Bool)

(assert (=> b!550095 m!526625))

(assert (=> b!550091 m!526621))

(assert (=> b!550092 m!526621))

(assert (=> d!82623 m!526503))

(declare-fun m!526627 () Bool)

(assert (=> d!82623 m!526627))

(assert (=> d!82623 m!526485))

(assert (=> b!549945 d!82623))

(declare-fun d!82625 () Bool)

(declare-fun lt!250259 () (_ BitVec 32))

(declare-fun lt!250258 () (_ BitVec 32))

(assert (=> d!82625 (= lt!250259 (bvmul (bvxor lt!250258 (bvlshr lt!250258 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82625 (= lt!250258 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16670 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16670 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82625 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!343320 (let ((h!11761 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16670 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16670 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51629 (bvmul (bvxor h!11761 (bvlshr h!11761 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51629 (bvlshr x!51629 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!343320 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!343320 #b00000000000000000000000000000000))))))

(assert (=> d!82625 (= (toIndex!0 (select (store (arr!16670 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!250259 (bvlshr lt!250259 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!549945 d!82625))

(declare-fun d!82629 () Bool)

(declare-fun lt!250280 () SeekEntryResult!5116)

(assert (=> d!82629 (and (or ((_ is Undefined!5116) lt!250280) (not ((_ is Found!5116) lt!250280)) (and (bvsge (index!22692 lt!250280) #b00000000000000000000000000000000) (bvslt (index!22692 lt!250280) (size!17035 a!3118)))) (or ((_ is Undefined!5116) lt!250280) ((_ is Found!5116) lt!250280) (not ((_ is MissingZero!5116) lt!250280)) (and (bvsge (index!22691 lt!250280) #b00000000000000000000000000000000) (bvslt (index!22691 lt!250280) (size!17035 a!3118)))) (or ((_ is Undefined!5116) lt!250280) ((_ is Found!5116) lt!250280) ((_ is MissingZero!5116) lt!250280) (not ((_ is MissingVacant!5116) lt!250280)) (and (bvsge (index!22694 lt!250280) #b00000000000000000000000000000000) (bvslt (index!22694 lt!250280) (size!17035 a!3118)))) (or ((_ is Undefined!5116) lt!250280) (ite ((_ is Found!5116) lt!250280) (= (select (arr!16670 a!3118) (index!22692 lt!250280)) (select (arr!16670 a!3118) j!142)) (ite ((_ is MissingZero!5116) lt!250280) (= (select (arr!16670 a!3118) (index!22691 lt!250280)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5116) lt!250280) (= (select (arr!16670 a!3118) (index!22694 lt!250280)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!317554 () SeekEntryResult!5116)

(assert (=> d!82629 (= lt!250280 e!317554)))

(declare-fun c!63735 () Bool)

(declare-fun lt!250279 () SeekEntryResult!5116)

(assert (=> d!82629 (= c!63735 (and ((_ is Intermediate!5116) lt!250279) (undefined!5928 lt!250279)))))

(assert (=> d!82629 (= lt!250279 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16670 a!3118) j!142) mask!3119) (select (arr!16670 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!82629 (validMask!0 mask!3119)))

(assert (=> d!82629 (= (seekEntryOrOpen!0 (select (arr!16670 a!3118) j!142) a!3118 mask!3119) lt!250280)))

(declare-fun b!550142 () Bool)

(declare-fun e!317553 () SeekEntryResult!5116)

(assert (=> b!550142 (= e!317553 (MissingZero!5116 (index!22693 lt!250279)))))

(declare-fun b!550143 () Bool)

(declare-fun c!63733 () Bool)

(declare-fun lt!250281 () (_ BitVec 64))

(assert (=> b!550143 (= c!63733 (= lt!250281 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!317555 () SeekEntryResult!5116)

(assert (=> b!550143 (= e!317555 e!317553)))

(declare-fun b!550144 () Bool)

(assert (=> b!550144 (= e!317554 e!317555)))

(assert (=> b!550144 (= lt!250281 (select (arr!16670 a!3118) (index!22693 lt!250279)))))

(declare-fun c!63734 () Bool)

(assert (=> b!550144 (= c!63734 (= lt!250281 (select (arr!16670 a!3118) j!142)))))

(declare-fun b!550145 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34708 (_ BitVec 32)) SeekEntryResult!5116)

(assert (=> b!550145 (= e!317553 (seekKeyOrZeroReturnVacant!0 (x!51625 lt!250279) (index!22693 lt!250279) (index!22693 lt!250279) (select (arr!16670 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!550146 () Bool)

(assert (=> b!550146 (= e!317555 (Found!5116 (index!22693 lt!250279)))))

(declare-fun b!550147 () Bool)

(assert (=> b!550147 (= e!317554 Undefined!5116)))

(assert (= (and d!82629 c!63735) b!550147))

(assert (= (and d!82629 (not c!63735)) b!550144))

(assert (= (and b!550144 c!63734) b!550146))

(assert (= (and b!550144 (not c!63734)) b!550143))

(assert (= (and b!550143 c!63733) b!550142))

(assert (= (and b!550143 (not c!63733)) b!550145))

(declare-fun m!526645 () Bool)

(assert (=> d!82629 m!526645))

(assert (=> d!82629 m!526499))

(assert (=> d!82629 m!526475))

(assert (=> d!82629 m!526507))

(declare-fun m!526647 () Bool)

(assert (=> d!82629 m!526647))

(assert (=> d!82629 m!526475))

(assert (=> d!82629 m!526499))

(declare-fun m!526649 () Bool)

(assert (=> d!82629 m!526649))

(assert (=> d!82629 m!526485))

(declare-fun m!526651 () Bool)

(assert (=> b!550144 m!526651))

(assert (=> b!550145 m!526475))

(declare-fun m!526653 () Bool)

(assert (=> b!550145 m!526653))

(assert (=> b!549944 d!82629))

(declare-fun b!550198 () Bool)

(declare-fun e!317590 () Bool)

(declare-fun call!32233 () Bool)

(assert (=> b!550198 (= e!317590 call!32233)))

(declare-fun d!82637 () Bool)

(declare-fun res!343365 () Bool)

(declare-fun e!317591 () Bool)

(assert (=> d!82637 (=> res!343365 e!317591)))

(assert (=> d!82637 (= res!343365 (bvsge #b00000000000000000000000000000000 (size!17035 a!3118)))))

(assert (=> d!82637 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10786) e!317591)))

(declare-fun b!550199 () Bool)

(declare-fun e!317589 () Bool)

(assert (=> b!550199 (= e!317591 e!317589)))

(declare-fun res!343363 () Bool)

(assert (=> b!550199 (=> (not res!343363) (not e!317589))))

(declare-fun e!317588 () Bool)

(assert (=> b!550199 (= res!343363 (not e!317588))))

(declare-fun res!343364 () Bool)

(assert (=> b!550199 (=> (not res!343364) (not e!317588))))

(assert (=> b!550199 (= res!343364 (validKeyInArray!0 (select (arr!16670 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!550200 () Bool)

(assert (=> b!550200 (= e!317590 call!32233)))

(declare-fun bm!32230 () Bool)

(declare-fun c!63750 () Bool)

(assert (=> bm!32230 (= call!32233 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63750 (Cons!10785 (select (arr!16670 a!3118) #b00000000000000000000000000000000) Nil!10786) Nil!10786)))))

(declare-fun b!550201 () Bool)

(assert (=> b!550201 (= e!317589 e!317590)))

(assert (=> b!550201 (= c!63750 (validKeyInArray!0 (select (arr!16670 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!550202 () Bool)

(declare-fun contains!2815 (List!10789 (_ BitVec 64)) Bool)

(assert (=> b!550202 (= e!317588 (contains!2815 Nil!10786 (select (arr!16670 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!82637 (not res!343365)) b!550199))

(assert (= (and b!550199 res!343364) b!550202))

(assert (= (and b!550199 res!343363) b!550201))

(assert (= (and b!550201 c!63750) b!550198))

(assert (= (and b!550201 (not c!63750)) b!550200))

(assert (= (or b!550198 b!550200) bm!32230))

(declare-fun m!526673 () Bool)

(assert (=> b!550199 m!526673))

(assert (=> b!550199 m!526673))

(declare-fun m!526675 () Bool)

(assert (=> b!550199 m!526675))

(assert (=> bm!32230 m!526673))

(declare-fun m!526677 () Bool)

(assert (=> bm!32230 m!526677))

(assert (=> b!550201 m!526673))

(assert (=> b!550201 m!526673))

(assert (=> b!550201 m!526675))

(assert (=> b!550202 m!526673))

(assert (=> b!550202 m!526673))

(declare-fun m!526679 () Bool)

(assert (=> b!550202 m!526679))

(assert (=> b!549949 d!82637))

(declare-fun b!550226 () Bool)

(declare-fun e!317610 () Bool)

(declare-fun call!32237 () Bool)

(assert (=> b!550226 (= e!317610 call!32237)))

(declare-fun b!550227 () Bool)

(declare-fun e!317609 () Bool)

(assert (=> b!550227 (= e!317609 e!317610)))

(declare-fun c!63757 () Bool)

(assert (=> b!550227 (= c!63757 (validKeyInArray!0 (select (arr!16670 a!3118) j!142)))))

(declare-fun d!82649 () Bool)

(declare-fun res!343378 () Bool)

(assert (=> d!82649 (=> res!343378 e!317609)))

(assert (=> d!82649 (= res!343378 (bvsge j!142 (size!17035 a!3118)))))

(assert (=> d!82649 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!317609)))

(declare-fun b!550228 () Bool)

(declare-fun e!317608 () Bool)

(assert (=> b!550228 (= e!317610 e!317608)))

(declare-fun lt!250314 () (_ BitVec 64))

(assert (=> b!550228 (= lt!250314 (select (arr!16670 a!3118) j!142))))

(declare-fun lt!250315 () Unit!16992)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34708 (_ BitVec 64) (_ BitVec 32)) Unit!16992)

(assert (=> b!550228 (= lt!250315 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!250314 j!142))))

(assert (=> b!550228 (arrayContainsKey!0 a!3118 lt!250314 #b00000000000000000000000000000000)))

(declare-fun lt!250313 () Unit!16992)

(assert (=> b!550228 (= lt!250313 lt!250315)))

(declare-fun res!343377 () Bool)

(assert (=> b!550228 (= res!343377 (= (seekEntryOrOpen!0 (select (arr!16670 a!3118) j!142) a!3118 mask!3119) (Found!5116 j!142)))))

(assert (=> b!550228 (=> (not res!343377) (not e!317608))))

(declare-fun b!550229 () Bool)

(assert (=> b!550229 (= e!317608 call!32237)))

(declare-fun bm!32234 () Bool)

(assert (=> bm!32234 (= call!32237 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!82649 (not res!343378)) b!550227))

(assert (= (and b!550227 c!63757) b!550228))

(assert (= (and b!550227 (not c!63757)) b!550226))

(assert (= (and b!550228 res!343377) b!550229))

(assert (= (or b!550229 b!550226) bm!32234))

(assert (=> b!550227 m!526475))

(assert (=> b!550227 m!526475))

(assert (=> b!550227 m!526477))

(assert (=> b!550228 m!526475))

(declare-fun m!526701 () Bool)

(assert (=> b!550228 m!526701))

(declare-fun m!526703 () Bool)

(assert (=> b!550228 m!526703))

(assert (=> b!550228 m!526475))

(assert (=> b!550228 m!526497))

(declare-fun m!526705 () Bool)

(assert (=> bm!32234 m!526705))

(assert (=> b!549943 d!82649))

(declare-fun d!82663 () Bool)

(assert (=> d!82663 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!250318 () Unit!16992)

(declare-fun choose!38 (array!34708 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16992)

(assert (=> d!82663 (= lt!250318 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!82663 (validMask!0 mask!3119)))

(assert (=> d!82663 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!250318)))

(declare-fun bs!17124 () Bool)

(assert (= bs!17124 d!82663))

(assert (=> bs!17124 m!526489))

(declare-fun m!526707 () Bool)

(assert (=> bs!17124 m!526707))

(assert (=> bs!17124 m!526485))

(assert (=> b!549943 d!82663))

(declare-fun d!82665 () Bool)

(declare-fun res!343383 () Bool)

(declare-fun e!317621 () Bool)

(assert (=> d!82665 (=> res!343383 e!317621)))

(assert (=> d!82665 (= res!343383 (= (select (arr!16670 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!82665 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!317621)))

(declare-fun b!550246 () Bool)

(declare-fun e!317622 () Bool)

(assert (=> b!550246 (= e!317621 e!317622)))

(declare-fun res!343384 () Bool)

(assert (=> b!550246 (=> (not res!343384) (not e!317622))))

(assert (=> b!550246 (= res!343384 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17035 a!3118)))))

(declare-fun b!550247 () Bool)

(assert (=> b!550247 (= e!317622 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82665 (not res!343383)) b!550246))

(assert (= (and b!550246 res!343384) b!550247))

(assert (=> d!82665 m!526673))

(declare-fun m!526709 () Bool)

(assert (=> b!550247 m!526709))

(assert (=> b!549942 d!82665))

(declare-fun d!82671 () Bool)

(declare-fun lt!250326 () SeekEntryResult!5116)

(assert (=> d!82671 (and (or ((_ is Undefined!5116) lt!250326) (not ((_ is Found!5116) lt!250326)) (and (bvsge (index!22692 lt!250326) #b00000000000000000000000000000000) (bvslt (index!22692 lt!250326) (size!17035 a!3118)))) (or ((_ is Undefined!5116) lt!250326) ((_ is Found!5116) lt!250326) (not ((_ is MissingZero!5116) lt!250326)) (and (bvsge (index!22691 lt!250326) #b00000000000000000000000000000000) (bvslt (index!22691 lt!250326) (size!17035 a!3118)))) (or ((_ is Undefined!5116) lt!250326) ((_ is Found!5116) lt!250326) ((_ is MissingZero!5116) lt!250326) (not ((_ is MissingVacant!5116) lt!250326)) (and (bvsge (index!22694 lt!250326) #b00000000000000000000000000000000) (bvslt (index!22694 lt!250326) (size!17035 a!3118)))) (or ((_ is Undefined!5116) lt!250326) (ite ((_ is Found!5116) lt!250326) (= (select (arr!16670 a!3118) (index!22692 lt!250326)) k0!1914) (ite ((_ is MissingZero!5116) lt!250326) (= (select (arr!16670 a!3118) (index!22691 lt!250326)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5116) lt!250326) (= (select (arr!16670 a!3118) (index!22694 lt!250326)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!317624 () SeekEntryResult!5116)

(assert (=> d!82671 (= lt!250326 e!317624)))

(declare-fun c!63766 () Bool)

(declare-fun lt!250325 () SeekEntryResult!5116)

(assert (=> d!82671 (= c!63766 (and ((_ is Intermediate!5116) lt!250325) (undefined!5928 lt!250325)))))

(assert (=> d!82671 (= lt!250325 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!82671 (validMask!0 mask!3119)))

(assert (=> d!82671 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!250326)))

(declare-fun b!550248 () Bool)

(declare-fun e!317623 () SeekEntryResult!5116)

(assert (=> b!550248 (= e!317623 (MissingZero!5116 (index!22693 lt!250325)))))

(declare-fun b!550249 () Bool)

(declare-fun c!63764 () Bool)

(declare-fun lt!250327 () (_ BitVec 64))

(assert (=> b!550249 (= c!63764 (= lt!250327 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!317625 () SeekEntryResult!5116)

(assert (=> b!550249 (= e!317625 e!317623)))

(declare-fun b!550250 () Bool)

(assert (=> b!550250 (= e!317624 e!317625)))

(assert (=> b!550250 (= lt!250327 (select (arr!16670 a!3118) (index!22693 lt!250325)))))

(declare-fun c!63765 () Bool)

(assert (=> b!550250 (= c!63765 (= lt!250327 k0!1914))))

(declare-fun b!550251 () Bool)

(assert (=> b!550251 (= e!317623 (seekKeyOrZeroReturnVacant!0 (x!51625 lt!250325) (index!22693 lt!250325) (index!22693 lt!250325) k0!1914 a!3118 mask!3119))))

(declare-fun b!550252 () Bool)

(assert (=> b!550252 (= e!317625 (Found!5116 (index!22693 lt!250325)))))

(declare-fun b!550253 () Bool)

(assert (=> b!550253 (= e!317624 Undefined!5116)))

(assert (= (and d!82671 c!63766) b!550253))

(assert (= (and d!82671 (not c!63766)) b!550250))

(assert (= (and b!550250 c!63765) b!550252))

(assert (= (and b!550250 (not c!63765)) b!550249))

(assert (= (and b!550249 c!63764) b!550248))

(assert (= (and b!550249 (not c!63764)) b!550251))

(declare-fun m!526711 () Bool)

(assert (=> d!82671 m!526711))

(declare-fun m!526713 () Bool)

(assert (=> d!82671 m!526713))

(declare-fun m!526715 () Bool)

(assert (=> d!82671 m!526715))

(declare-fun m!526717 () Bool)

(assert (=> d!82671 m!526717))

(assert (=> d!82671 m!526713))

(declare-fun m!526719 () Bool)

(assert (=> d!82671 m!526719))

(assert (=> d!82671 m!526485))

(declare-fun m!526721 () Bool)

(assert (=> b!550250 m!526721))

(declare-fun m!526723 () Bool)

(assert (=> b!550251 m!526723))

(assert (=> b!549947 d!82671))

(declare-fun d!82673 () Bool)

(assert (=> d!82673 (= (validKeyInArray!0 (select (arr!16670 a!3118) j!142)) (and (not (= (select (arr!16670 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16670 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!549941 d!82673))

(declare-fun b!550258 () Bool)

(declare-fun e!317632 () Bool)

(declare-fun call!32238 () Bool)

(assert (=> b!550258 (= e!317632 call!32238)))

(declare-fun b!550259 () Bool)

(declare-fun e!317631 () Bool)

(assert (=> b!550259 (= e!317631 e!317632)))

(declare-fun c!63767 () Bool)

(assert (=> b!550259 (= c!63767 (validKeyInArray!0 (select (arr!16670 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!82675 () Bool)

(declare-fun res!343390 () Bool)

(assert (=> d!82675 (=> res!343390 e!317631)))

(assert (=> d!82675 (= res!343390 (bvsge #b00000000000000000000000000000000 (size!17035 a!3118)))))

(assert (=> d!82675 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!317631)))

(declare-fun b!550260 () Bool)

(declare-fun e!317630 () Bool)

(assert (=> b!550260 (= e!317632 e!317630)))

(declare-fun lt!250329 () (_ BitVec 64))

(assert (=> b!550260 (= lt!250329 (select (arr!16670 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!250330 () Unit!16992)

(assert (=> b!550260 (= lt!250330 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!250329 #b00000000000000000000000000000000))))

(assert (=> b!550260 (arrayContainsKey!0 a!3118 lt!250329 #b00000000000000000000000000000000)))

(declare-fun lt!250328 () Unit!16992)

(assert (=> b!550260 (= lt!250328 lt!250330)))

(declare-fun res!343389 () Bool)

(assert (=> b!550260 (= res!343389 (= (seekEntryOrOpen!0 (select (arr!16670 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5116 #b00000000000000000000000000000000)))))

(assert (=> b!550260 (=> (not res!343389) (not e!317630))))

(declare-fun b!550261 () Bool)

(assert (=> b!550261 (= e!317630 call!32238)))

(declare-fun bm!32235 () Bool)

(assert (=> bm!32235 (= call!32238 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!82675 (not res!343390)) b!550259))

(assert (= (and b!550259 c!63767) b!550260))

(assert (= (and b!550259 (not c!63767)) b!550258))

(assert (= (and b!550260 res!343389) b!550261))

(assert (= (or b!550261 b!550258) bm!32235))

(assert (=> b!550259 m!526673))

(assert (=> b!550259 m!526673))

(assert (=> b!550259 m!526675))

(assert (=> b!550260 m!526673))

(declare-fun m!526725 () Bool)

(assert (=> b!550260 m!526725))

(declare-fun m!526727 () Bool)

(assert (=> b!550260 m!526727))

(assert (=> b!550260 m!526673))

(declare-fun m!526729 () Bool)

(assert (=> b!550260 m!526729))

(declare-fun m!526731 () Bool)

(assert (=> bm!32235 m!526731))

(assert (=> b!549946 d!82675))

(check-sat (not bm!32234) (not b!550095) (not b!550259) (not bm!32235) (not b!550260) (not b!550078) (not b!550201) (not d!82671) (not bm!32230) (not b!550227) (not d!82663) (not b!550202) (not d!82609) (not b!550247) (not d!82623) (not b!550199) (not b!550145) (not d!82629) (not b!550251) (not b!550228))
(check-sat)
