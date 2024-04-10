; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51920 () Bool)

(assert start!51920)

(declare-fun b!567593 () Bool)

(declare-fun res!358180 () Bool)

(declare-fun e!326586 () Bool)

(assert (=> b!567593 (=> (not res!358180) (not e!326586))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35614 0))(
  ( (array!35615 (arr!17103 (Array (_ BitVec 32) (_ BitVec 64))) (size!17467 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35614)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!567593 (= res!358180 (and (= (size!17467 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17467 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17467 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!358187 () Bool)

(assert (=> start!51920 (=> (not res!358187) (not e!326586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51920 (= res!358187 (validMask!0 mask!3119))))

(assert (=> start!51920 e!326586))

(assert (=> start!51920 true))

(declare-fun array_inv!12899 (array!35614) Bool)

(assert (=> start!51920 (array_inv!12899 a!3118)))

(declare-fun b!567594 () Bool)

(declare-fun e!326583 () Bool)

(declare-fun lt!258559 () array!35614)

(declare-datatypes ((SeekEntryResult!5552 0))(
  ( (MissingZero!5552 (index!24435 (_ BitVec 32))) (Found!5552 (index!24436 (_ BitVec 32))) (Intermediate!5552 (undefined!6364 Bool) (index!24437 (_ BitVec 32)) (x!53305 (_ BitVec 32))) (Undefined!5552) (MissingVacant!5552 (index!24438 (_ BitVec 32))) )
))
(declare-fun lt!258560 () SeekEntryResult!5552)

(declare-fun lt!258558 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35614 (_ BitVec 32)) SeekEntryResult!5552)

(assert (=> b!567594 (= e!326583 (= lt!258560 (seekEntryOrOpen!0 lt!258558 lt!258559 mask!3119)))))

(declare-fun b!567595 () Bool)

(declare-fun e!326582 () Bool)

(assert (=> b!567595 (= e!326586 e!326582)))

(declare-fun res!358182 () Bool)

(assert (=> b!567595 (=> (not res!358182) (not e!326582))))

(declare-fun lt!258561 () SeekEntryResult!5552)

(assert (=> b!567595 (= res!358182 (or (= lt!258561 (MissingZero!5552 i!1132)) (= lt!258561 (MissingVacant!5552 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!567595 (= lt!258561 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!567596 () Bool)

(declare-fun e!326585 () Bool)

(assert (=> b!567596 (= e!326582 e!326585)))

(declare-fun res!358185 () Bool)

(assert (=> b!567596 (=> (not res!358185) (not e!326585))))

(declare-fun lt!258563 () SeekEntryResult!5552)

(declare-fun lt!258564 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35614 (_ BitVec 32)) SeekEntryResult!5552)

(assert (=> b!567596 (= res!358185 (= lt!258563 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258564 lt!258558 lt!258559 mask!3119)))))

(declare-fun lt!258565 () (_ BitVec 32))

(assert (=> b!567596 (= lt!258563 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258565 (select (arr!17103 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567596 (= lt!258564 (toIndex!0 lt!258558 mask!3119))))

(assert (=> b!567596 (= lt!258558 (select (store (arr!17103 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!567596 (= lt!258565 (toIndex!0 (select (arr!17103 a!3118) j!142) mask!3119))))

(assert (=> b!567596 (= lt!258559 (array!35615 (store (arr!17103 a!3118) i!1132 k!1914) (size!17467 a!3118)))))

(declare-fun b!567597 () Bool)

(assert (=> b!567597 (= e!326585 (not e!326583))))

(declare-fun res!358186 () Bool)

(assert (=> b!567597 (=> res!358186 e!326583)))

(assert (=> b!567597 (= res!358186 (or (undefined!6364 lt!258563) (not (is-Intermediate!5552 lt!258563)) (not (= (select (arr!17103 a!3118) (index!24437 lt!258563)) (select (arr!17103 a!3118) j!142)))))))

(assert (=> b!567597 (= lt!258560 (Found!5552 j!142))))

(assert (=> b!567597 (= lt!258560 (seekEntryOrOpen!0 (select (arr!17103 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35614 (_ BitVec 32)) Bool)

(assert (=> b!567597 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17806 0))(
  ( (Unit!17807) )
))
(declare-fun lt!258562 () Unit!17806)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35614 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17806)

(assert (=> b!567597 (= lt!258562 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!567598 () Bool)

(declare-fun res!358179 () Bool)

(assert (=> b!567598 (=> (not res!358179) (not e!326582))))

(assert (=> b!567598 (= res!358179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!567599 () Bool)

(declare-fun res!358183 () Bool)

(assert (=> b!567599 (=> (not res!358183) (not e!326586))))

(declare-fun arrayContainsKey!0 (array!35614 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!567599 (= res!358183 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!567600 () Bool)

(declare-fun res!358184 () Bool)

(assert (=> b!567600 (=> (not res!358184) (not e!326586))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!567600 (= res!358184 (validKeyInArray!0 (select (arr!17103 a!3118) j!142)))))

(declare-fun b!567601 () Bool)

(declare-fun res!358181 () Bool)

(assert (=> b!567601 (=> (not res!358181) (not e!326586))))

(assert (=> b!567601 (= res!358181 (validKeyInArray!0 k!1914))))

(declare-fun b!567602 () Bool)

(declare-fun res!358178 () Bool)

(assert (=> b!567602 (=> (not res!358178) (not e!326582))))

(declare-datatypes ((List!11183 0))(
  ( (Nil!11180) (Cons!11179 (h!12191 (_ BitVec 64)) (t!17411 List!11183)) )
))
(declare-fun arrayNoDuplicates!0 (array!35614 (_ BitVec 32) List!11183) Bool)

(assert (=> b!567602 (= res!358178 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11180))))

(assert (= (and start!51920 res!358187) b!567593))

(assert (= (and b!567593 res!358180) b!567600))

(assert (= (and b!567600 res!358184) b!567601))

(assert (= (and b!567601 res!358181) b!567599))

(assert (= (and b!567599 res!358183) b!567595))

(assert (= (and b!567595 res!358182) b!567598))

(assert (= (and b!567598 res!358179) b!567602))

(assert (= (and b!567602 res!358178) b!567596))

(assert (= (and b!567596 res!358185) b!567597))

(assert (= (and b!567597 (not res!358186)) b!567594))

(declare-fun m!546213 () Bool)

(assert (=> b!567597 m!546213))

(declare-fun m!546215 () Bool)

(assert (=> b!567597 m!546215))

(declare-fun m!546217 () Bool)

(assert (=> b!567597 m!546217))

(declare-fun m!546219 () Bool)

(assert (=> b!567597 m!546219))

(assert (=> b!567597 m!546213))

(declare-fun m!546221 () Bool)

(assert (=> b!567597 m!546221))

(assert (=> b!567600 m!546213))

(assert (=> b!567600 m!546213))

(declare-fun m!546223 () Bool)

(assert (=> b!567600 m!546223))

(declare-fun m!546225 () Bool)

(assert (=> b!567594 m!546225))

(assert (=> b!567596 m!546213))

(declare-fun m!546227 () Bool)

(assert (=> b!567596 m!546227))

(assert (=> b!567596 m!546213))

(assert (=> b!567596 m!546213))

(declare-fun m!546229 () Bool)

(assert (=> b!567596 m!546229))

(declare-fun m!546231 () Bool)

(assert (=> b!567596 m!546231))

(declare-fun m!546233 () Bool)

(assert (=> b!567596 m!546233))

(declare-fun m!546235 () Bool)

(assert (=> b!567596 m!546235))

(declare-fun m!546237 () Bool)

(assert (=> b!567596 m!546237))

(declare-fun m!546239 () Bool)

(assert (=> start!51920 m!546239))

(declare-fun m!546241 () Bool)

(assert (=> start!51920 m!546241))

(declare-fun m!546243 () Bool)

(assert (=> b!567601 m!546243))

(declare-fun m!546245 () Bool)

(assert (=> b!567595 m!546245))

(declare-fun m!546247 () Bool)

(assert (=> b!567599 m!546247))

(declare-fun m!546249 () Bool)

(assert (=> b!567602 m!546249))

(declare-fun m!546251 () Bool)

(assert (=> b!567598 m!546251))

(push 1)

(assert (not b!567594))

(assert (not start!51920))

(assert (not b!567600))

(assert (not b!567601))

(assert (not b!567602))

(assert (not b!567596))

(assert (not b!567595))

(assert (not b!567598))

(assert (not b!567599))

(assert (not b!567597))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!567754 () Bool)

(declare-fun lt!258650 () SeekEntryResult!5552)

(assert (=> b!567754 (and (bvsge (index!24437 lt!258650) #b00000000000000000000000000000000) (bvslt (index!24437 lt!258650) (size!17467 lt!258559)))))

(declare-fun res!358279 () Bool)

(assert (=> b!567754 (= res!358279 (= (select (arr!17103 lt!258559) (index!24437 lt!258650)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!326675 () Bool)

(assert (=> b!567754 (=> res!358279 e!326675)))

(declare-fun e!326679 () SeekEntryResult!5552)

(declare-fun b!567755 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567755 (= e!326679 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258564 #b00000000000000000000000000000000 mask!3119) lt!258558 lt!258559 mask!3119))))

(declare-fun b!567756 () Bool)

(declare-fun e!326677 () Bool)

(declare-fun e!326678 () Bool)

(assert (=> b!567756 (= e!326677 e!326678)))

(declare-fun res!358277 () Bool)

(assert (=> b!567756 (= res!358277 (and (is-Intermediate!5552 lt!258650) (not (undefined!6364 lt!258650)) (bvslt (x!53305 lt!258650) #b01111111111111111111111111111110) (bvsge (x!53305 lt!258650) #b00000000000000000000000000000000) (bvsge (x!53305 lt!258650) #b00000000000000000000000000000000)))))

(assert (=> b!567756 (=> (not res!358277) (not e!326678))))

(declare-fun b!567757 () Bool)

(assert (=> b!567757 (and (bvsge (index!24437 lt!258650) #b00000000000000000000000000000000) (bvslt (index!24437 lt!258650) (size!17467 lt!258559)))))

(declare-fun res!358278 () Bool)

(assert (=> b!567757 (= res!358278 (= (select (arr!17103 lt!258559) (index!24437 lt!258650)) lt!258558))))

(assert (=> b!567757 (=> res!358278 e!326675)))

(assert (=> b!567757 (= e!326678 e!326675)))

(declare-fun b!567758 () Bool)

(assert (=> b!567758 (= e!326679 (Intermediate!5552 false lt!258564 #b00000000000000000000000000000000))))

(declare-fun b!567759 () Bool)

(declare-fun e!326676 () SeekEntryResult!5552)

(assert (=> b!567759 (= e!326676 (Intermediate!5552 true lt!258564 #b00000000000000000000000000000000))))

(declare-fun b!567760 () Bool)

(assert (=> b!567760 (and (bvsge (index!24437 lt!258650) #b00000000000000000000000000000000) (bvslt (index!24437 lt!258650) (size!17467 lt!258559)))))

(assert (=> b!567760 (= e!326675 (= (select (arr!17103 lt!258559) (index!24437 lt!258650)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!84309 () Bool)

(assert (=> d!84309 e!326677))

(declare-fun c!65090 () Bool)

(assert (=> d!84309 (= c!65090 (and (is-Intermediate!5552 lt!258650) (undefined!6364 lt!258650)))))

(assert (=> d!84309 (= lt!258650 e!326676)))

(declare-fun c!65091 () Bool)

(assert (=> d!84309 (= c!65091 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!258651 () (_ BitVec 64))

(assert (=> d!84309 (= lt!258651 (select (arr!17103 lt!258559) lt!258564))))

(assert (=> d!84309 (validMask!0 mask!3119)))

(assert (=> d!84309 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258564 lt!258558 lt!258559 mask!3119) lt!258650)))

(declare-fun b!567761 () Bool)

(assert (=> b!567761 (= e!326676 e!326679)))

(declare-fun c!65089 () Bool)

(assert (=> b!567761 (= c!65089 (or (= lt!258651 lt!258558) (= (bvadd lt!258651 lt!258651) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!567762 () Bool)

(assert (=> b!567762 (= e!326677 (bvsge (x!53305 lt!258650) #b01111111111111111111111111111110))))

(assert (= (and d!84309 c!65091) b!567759))

(assert (= (and d!84309 (not c!65091)) b!567761))

(assert (= (and b!567761 c!65089) b!567758))

(assert (= (and b!567761 (not c!65089)) b!567755))

(assert (= (and d!84309 c!65090) b!567762))

(assert (= (and d!84309 (not c!65090)) b!567756))

(assert (= (and b!567756 res!358277) b!567757))

(assert (= (and b!567757 (not res!358278)) b!567754))

(assert (= (and b!567754 (not res!358279)) b!567760))

(declare-fun m!546385 () Bool)

(assert (=> d!84309 m!546385))

(assert (=> d!84309 m!546239))

(declare-fun m!546387 () Bool)

(assert (=> b!567755 m!546387))

(assert (=> b!567755 m!546387))

(declare-fun m!546389 () Bool)

(assert (=> b!567755 m!546389))

(declare-fun m!546391 () Bool)

(assert (=> b!567757 m!546391))

(assert (=> b!567760 m!546391))

(assert (=> b!567754 m!546391))

(assert (=> b!567596 d!84309))

(declare-fun b!567763 () Bool)

(declare-fun lt!258653 () SeekEntryResult!5552)

(assert (=> b!567763 (and (bvsge (index!24437 lt!258653) #b00000000000000000000000000000000) (bvslt (index!24437 lt!258653) (size!17467 a!3118)))))

(declare-fun res!358282 () Bool)

(assert (=> b!567763 (= res!358282 (= (select (arr!17103 a!3118) (index!24437 lt!258653)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!326680 () Bool)

(assert (=> b!567763 (=> res!358282 e!326680)))

(declare-fun e!326684 () SeekEntryResult!5552)

(declare-fun b!567764 () Bool)

(assert (=> b!567764 (= e!326684 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258565 #b00000000000000000000000000000000 mask!3119) (select (arr!17103 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!567765 () Bool)

(declare-fun e!326682 () Bool)

(declare-fun e!326683 () Bool)

(assert (=> b!567765 (= e!326682 e!326683)))

(declare-fun res!358280 () Bool)

(assert (=> b!567765 (= res!358280 (and (is-Intermediate!5552 lt!258653) (not (undefined!6364 lt!258653)) (bvslt (x!53305 lt!258653) #b01111111111111111111111111111110) (bvsge (x!53305 lt!258653) #b00000000000000000000000000000000) (bvsge (x!53305 lt!258653) #b00000000000000000000000000000000)))))

(assert (=> b!567765 (=> (not res!358280) (not e!326683))))

(declare-fun b!567766 () Bool)

(assert (=> b!567766 (and (bvsge (index!24437 lt!258653) #b00000000000000000000000000000000) (bvslt (index!24437 lt!258653) (size!17467 a!3118)))))

(declare-fun res!358281 () Bool)

(assert (=> b!567766 (= res!358281 (= (select (arr!17103 a!3118) (index!24437 lt!258653)) (select (arr!17103 a!3118) j!142)))))

(assert (=> b!567766 (=> res!358281 e!326680)))

(assert (=> b!567766 (= e!326683 e!326680)))

(declare-fun b!567767 () Bool)

(assert (=> b!567767 (= e!326684 (Intermediate!5552 false lt!258565 #b00000000000000000000000000000000))))

(declare-fun b!567768 () Bool)

(declare-fun e!326681 () SeekEntryResult!5552)

(assert (=> b!567768 (= e!326681 (Intermediate!5552 true lt!258565 #b00000000000000000000000000000000))))

(declare-fun b!567769 () Bool)

(assert (=> b!567769 (and (bvsge (index!24437 lt!258653) #b00000000000000000000000000000000) (bvslt (index!24437 lt!258653) (size!17467 a!3118)))))

(assert (=> b!567769 (= e!326680 (= (select (arr!17103 a!3118) (index!24437 lt!258653)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!84323 () Bool)

(assert (=> d!84323 e!326682))

(declare-fun c!65093 () Bool)

(assert (=> d!84323 (= c!65093 (and (is-Intermediate!5552 lt!258653) (undefined!6364 lt!258653)))))

(assert (=> d!84323 (= lt!258653 e!326681)))

(declare-fun c!65094 () Bool)

(assert (=> d!84323 (= c!65094 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!258654 () (_ BitVec 64))

(assert (=> d!84323 (= lt!258654 (select (arr!17103 a!3118) lt!258565))))

(assert (=> d!84323 (validMask!0 mask!3119)))

(assert (=> d!84323 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258565 (select (arr!17103 a!3118) j!142) a!3118 mask!3119) lt!258653)))

(declare-fun b!567770 () Bool)

(assert (=> b!567770 (= e!326681 e!326684)))

(declare-fun c!65092 () Bool)

(assert (=> b!567770 (= c!65092 (or (= lt!258654 (select (arr!17103 a!3118) j!142)) (= (bvadd lt!258654 lt!258654) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!567771 () Bool)

(assert (=> b!567771 (= e!326682 (bvsge (x!53305 lt!258653) #b01111111111111111111111111111110))))

(assert (= (and d!84323 c!65094) b!567768))

(assert (= (and d!84323 (not c!65094)) b!567770))

(assert (= (and b!567770 c!65092) b!567767))

(assert (= (and b!567770 (not c!65092)) b!567764))

(assert (= (and d!84323 c!65093) b!567771))

(assert (= (and d!84323 (not c!65093)) b!567765))

(assert (= (and b!567765 res!358280) b!567766))

(assert (= (and b!567766 (not res!358281)) b!567763))

(assert (= (and b!567763 (not res!358282)) b!567769))

(declare-fun m!546393 () Bool)

(assert (=> d!84323 m!546393))

(assert (=> d!84323 m!546239))

(declare-fun m!546395 () Bool)

(assert (=> b!567764 m!546395))

(assert (=> b!567764 m!546395))

(assert (=> b!567764 m!546213))

(declare-fun m!546397 () Bool)

(assert (=> b!567764 m!546397))

(declare-fun m!546399 () Bool)

(assert (=> b!567766 m!546399))

(assert (=> b!567769 m!546399))

(assert (=> b!567763 m!546399))

(assert (=> b!567596 d!84323))

(declare-fun d!84325 () Bool)

(declare-fun lt!258660 () (_ BitVec 32))

(declare-fun lt!258659 () (_ BitVec 32))

(assert (=> d!84325 (= lt!258660 (bvmul (bvxor lt!258659 (bvlshr lt!258659 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84325 (= lt!258659 ((_ extract 31 0) (bvand (bvxor lt!258558 (bvlshr lt!258558 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84325 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!358283 (let ((h!12194 ((_ extract 31 0) (bvand (bvxor lt!258558 (bvlshr lt!258558 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53309 (bvmul (bvxor h!12194 (bvlshr h!12194 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53309 (bvlshr x!53309 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!358283 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!358283 #b00000000000000000000000000000000))))))

(assert (=> d!84325 (= (toIndex!0 lt!258558 mask!3119) (bvand (bvxor lt!258660 (bvlshr lt!258660 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!567596 d!84325))

(declare-fun d!84327 () Bool)

(declare-fun lt!258662 () (_ BitVec 32))

(declare-fun lt!258661 () (_ BitVec 32))

(assert (=> d!84327 (= lt!258662 (bvmul (bvxor lt!258661 (bvlshr lt!258661 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84327 (= lt!258661 ((_ extract 31 0) (bvand (bvxor (select (arr!17103 a!3118) j!142) (bvlshr (select (arr!17103 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84327 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!358283 (let ((h!12194 ((_ extract 31 0) (bvand (bvxor (select (arr!17103 a!3118) j!142) (bvlshr (select (arr!17103 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53309 (bvmul (bvxor h!12194 (bvlshr h!12194 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53309 (bvlshr x!53309 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!358283 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!358283 #b00000000000000000000000000000000))))))

(assert (=> d!84327 (= (toIndex!0 (select (arr!17103 a!3118) j!142) mask!3119) (bvand (bvxor lt!258662 (bvlshr lt!258662 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!567596 d!84327))

(declare-fun b!567788 () Bool)

(declare-fun e!326701 () Bool)

(declare-fun contains!2872 (List!11183 (_ BitVec 64)) Bool)

(assert (=> b!567788 (= e!326701 (contains!2872 Nil!11180 (select (arr!17103 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!84329 () Bool)

(declare-fun res!358296 () Bool)

(declare-fun e!326700 () Bool)

(assert (=> d!84329 (=> res!358296 e!326700)))

(assert (=> d!84329 (= res!358296 (bvsge #b00000000000000000000000000000000 (size!17467 a!3118)))))

(assert (=> d!84329 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11180) e!326700)))

(declare-fun b!567789 () Bool)

(declare-fun e!326702 () Bool)

(declare-fun e!326699 () Bool)

(assert (=> b!567789 (= e!326702 e!326699)))

(declare-fun c!65097 () Bool)

(assert (=> b!567789 (= c!65097 (validKeyInArray!0 (select (arr!17103 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!567790 () Bool)

(declare-fun call!32529 () Bool)

(assert (=> b!567790 (= e!326699 call!32529)))

(declare-fun b!567791 () Bool)

(assert (=> b!567791 (= e!326700 e!326702)))

(declare-fun res!358297 () Bool)

(assert (=> b!567791 (=> (not res!358297) (not e!326702))))

(assert (=> b!567791 (= res!358297 (not e!326701))))

(declare-fun res!358298 () Bool)

(assert (=> b!567791 (=> (not res!358298) (not e!326701))))

(assert (=> b!567791 (= res!358298 (validKeyInArray!0 (select (arr!17103 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!567792 () Bool)

(assert (=> b!567792 (= e!326699 call!32529)))

(declare-fun bm!32526 () Bool)

(assert (=> bm!32526 (= call!32529 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65097 (Cons!11179 (select (arr!17103 a!3118) #b00000000000000000000000000000000) Nil!11180) Nil!11180)))))

(assert (= (and d!84329 (not res!358296)) b!567791))

(assert (= (and b!567791 res!358298) b!567788))

(assert (= (and b!567791 res!358297) b!567789))

(assert (= (and b!567789 c!65097) b!567792))

(assert (= (and b!567789 (not c!65097)) b!567790))

(assert (= (or b!567792 b!567790) bm!32526))

(declare-fun m!546403 () Bool)

(assert (=> b!567788 m!546403))

(assert (=> b!567788 m!546403))

(declare-fun m!546405 () Bool)

(assert (=> b!567788 m!546405))

(assert (=> b!567789 m!546403))

(assert (=> b!567789 m!546403))

(declare-fun m!546407 () Bool)

(assert (=> b!567789 m!546407))

(assert (=> b!567791 m!546403))

(assert (=> b!567791 m!546403))

(assert (=> b!567791 m!546407))

(assert (=> bm!32526 m!546403))

(declare-fun m!546409 () Bool)

(assert (=> bm!32526 m!546409))

(assert (=> b!567602 d!84329))

(declare-fun lt!258698 () SeekEntryResult!5552)

(declare-fun b!567883 () Bool)

(declare-fun e!326753 () SeekEntryResult!5552)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35614 (_ BitVec 32)) SeekEntryResult!5552)

(assert (=> b!567883 (= e!326753 (seekKeyOrZeroReturnVacant!0 (x!53305 lt!258698) (index!24437 lt!258698) (index!24437 lt!258698) (select (arr!17103 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!567885 () Bool)

(declare-fun e!326752 () SeekEntryResult!5552)

(assert (=> b!567885 (= e!326752 Undefined!5552)))

(declare-fun b!567886 () Bool)

(declare-fun e!326754 () SeekEntryResult!5552)

(assert (=> b!567886 (= e!326752 e!326754)))

(declare-fun lt!258696 () (_ BitVec 64))

(assert (=> b!567886 (= lt!258696 (select (arr!17103 a!3118) (index!24437 lt!258698)))))

(declare-fun c!65131 () Bool)

(assert (=> b!567886 (= c!65131 (= lt!258696 (select (arr!17103 a!3118) j!142)))))

(declare-fun b!567887 () Bool)

(assert (=> b!567887 (= e!326753 (MissingZero!5552 (index!24437 lt!258698)))))

(declare-fun b!567888 () Bool)

(assert (=> b!567888 (= e!326754 (Found!5552 (index!24437 lt!258698)))))

(declare-fun d!84337 () Bool)

(declare-fun lt!258697 () SeekEntryResult!5552)

(assert (=> d!84337 (and (or (is-Undefined!5552 lt!258697) (not (is-Found!5552 lt!258697)) (and (bvsge (index!24436 lt!258697) #b00000000000000000000000000000000) (bvslt (index!24436 lt!258697) (size!17467 a!3118)))) (or (is-Undefined!5552 lt!258697) (is-Found!5552 lt!258697) (not (is-MissingZero!5552 lt!258697)) (and (bvsge (index!24435 lt!258697) #b00000000000000000000000000000000) (bvslt (index!24435 lt!258697) (size!17467 a!3118)))) (or (is-Undefined!5552 lt!258697) (is-Found!5552 lt!258697) (is-MissingZero!5552 lt!258697) (not (is-MissingVacant!5552 lt!258697)) (and (bvsge (index!24438 lt!258697) #b00000000000000000000000000000000) (bvslt (index!24438 lt!258697) (size!17467 a!3118)))) (or (is-Undefined!5552 lt!258697) (ite (is-Found!5552 lt!258697) (= (select (arr!17103 a!3118) (index!24436 lt!258697)) (select (arr!17103 a!3118) j!142)) (ite (is-MissingZero!5552 lt!258697) (= (select (arr!17103 a!3118) (index!24435 lt!258697)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5552 lt!258697) (= (select (arr!17103 a!3118) (index!24438 lt!258697)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84337 (= lt!258697 e!326752)))

(declare-fun c!65133 () Bool)

(assert (=> d!84337 (= c!65133 (and (is-Intermediate!5552 lt!258698) (undefined!6364 lt!258698)))))

(assert (=> d!84337 (= lt!258698 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17103 a!3118) j!142) mask!3119) (select (arr!17103 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84337 (validMask!0 mask!3119)))

(assert (=> d!84337 (= (seekEntryOrOpen!0 (select (arr!17103 a!3118) j!142) a!3118 mask!3119) lt!258697)))

(declare-fun b!567884 () Bool)

(declare-fun c!65132 () Bool)

(assert (=> b!567884 (= c!65132 (= lt!258696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!567884 (= e!326754 e!326753)))

(assert (= (and d!84337 c!65133) b!567885))

(assert (= (and d!84337 (not c!65133)) b!567886))

(assert (= (and b!567886 c!65131) b!567888))

(assert (= (and b!567886 (not c!65131)) b!567884))

(assert (= (and b!567884 c!65132) b!567887))

(assert (= (and b!567884 (not c!65132)) b!567883))

(assert (=> b!567883 m!546213))

(declare-fun m!546449 () Bool)

(assert (=> b!567883 m!546449))

(declare-fun m!546453 () Bool)

(assert (=> b!567886 m!546453))

(assert (=> d!84337 m!546213))

(assert (=> d!84337 m!546227))

(declare-fun m!546459 () Bool)

(assert (=> d!84337 m!546459))

(assert (=> d!84337 m!546239))

(assert (=> d!84337 m!546227))

(assert (=> d!84337 m!546213))

(declare-fun m!546461 () Bool)

(assert (=> d!84337 m!546461))

(declare-fun m!546463 () Bool)

(assert (=> d!84337 m!546463))

(declare-fun m!546465 () Bool)

(assert (=> d!84337 m!546465))

(assert (=> b!567597 d!84337))

(declare-fun b!567921 () Bool)

(declare-fun e!326776 () Bool)

(declare-fun e!326778 () Bool)

(assert (=> b!567921 (= e!326776 e!326778)))

(declare-fun lt!258732 () (_ BitVec 64))

(assert (=> b!567921 (= lt!258732 (select (arr!17103 a!3118) j!142))))

(declare-fun lt!258733 () Unit!17806)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35614 (_ BitVec 64) (_ BitVec 32)) Unit!17806)

(assert (=> b!567921 (= lt!258733 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258732 j!142))))

(assert (=> b!567921 (arrayContainsKey!0 a!3118 lt!258732 #b00000000000000000000000000000000)))

(declare-fun lt!258731 () Unit!17806)

(assert (=> b!567921 (= lt!258731 lt!258733)))

(declare-fun res!358336 () Bool)

(assert (=> b!567921 (= res!358336 (= (seekEntryOrOpen!0 (select (arr!17103 a!3118) j!142) a!3118 mask!3119) (Found!5552 j!142)))))

(assert (=> b!567921 (=> (not res!358336) (not e!326778))))

(declare-fun call!32535 () Bool)

(declare-fun bm!32532 () Bool)

(assert (=> bm!32532 (= call!32535 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!567922 () Bool)

(declare-fun e!326777 () Bool)

(assert (=> b!567922 (= e!326777 e!326776)))

(declare-fun c!65145 () Bool)

(assert (=> b!567922 (= c!65145 (validKeyInArray!0 (select (arr!17103 a!3118) j!142)))))

(declare-fun b!567923 () Bool)

(assert (=> b!567923 (= e!326778 call!32535)))

(declare-fun d!84353 () Bool)

(declare-fun res!358335 () Bool)

(assert (=> d!84353 (=> res!358335 e!326777)))

(assert (=> d!84353 (= res!358335 (bvsge j!142 (size!17467 a!3118)))))

(assert (=> d!84353 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!326777)))

(declare-fun b!567924 () Bool)

(assert (=> b!567924 (= e!326776 call!32535)))

(assert (= (and d!84353 (not res!358335)) b!567922))

(assert (= (and b!567922 c!65145) b!567921))

(assert (= (and b!567922 (not c!65145)) b!567924))

(assert (= (and b!567921 res!358336) b!567923))

(assert (= (or b!567923 b!567924) bm!32532))

(assert (=> b!567921 m!546213))

(declare-fun m!546501 () Bool)

(assert (=> b!567921 m!546501))

(declare-fun m!546503 () Bool)

(assert (=> b!567921 m!546503))

(assert (=> b!567921 m!546213))

(assert (=> b!567921 m!546221))

(declare-fun m!546505 () Bool)

(assert (=> bm!32532 m!546505))

(assert (=> b!567922 m!546213))

(assert (=> b!567922 m!546213))

(assert (=> b!567922 m!546223))

(assert (=> b!567597 d!84353))

(declare-fun d!84365 () Bool)

(assert (=> d!84365 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!258736 () Unit!17806)

(declare-fun choose!38 (array!35614 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17806)

(assert (=> d!84365 (= lt!258736 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84365 (validMask!0 mask!3119)))

(assert (=> d!84365 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!258736)))

(declare-fun bs!17625 () Bool)

(assert (= bs!17625 d!84365))

(assert (=> bs!17625 m!546215))

(declare-fun m!546507 () Bool)

(assert (=> bs!17625 m!546507))

(assert (=> bs!17625 m!546239))

(assert (=> b!567597 d!84365))

(declare-fun d!84367 () Bool)

(assert (=> d!84367 (= (validKeyInArray!0 (select (arr!17103 a!3118) j!142)) (and (not (= (select (arr!17103 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17103 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!567600 d!84367))

(declare-fun e!326792 () SeekEntryResult!5552)

(declare-fun lt!258739 () SeekEntryResult!5552)

(declare-fun b!567940 () Bool)

(assert (=> b!567940 (= e!326792 (seekKeyOrZeroReturnVacant!0 (x!53305 lt!258739) (index!24437 lt!258739) (index!24437 lt!258739) k!1914 a!3118 mask!3119))))

(declare-fun b!567942 () Bool)

(declare-fun e!326791 () SeekEntryResult!5552)

(assert (=> b!567942 (= e!326791 Undefined!5552)))

(declare-fun b!567943 () Bool)

(declare-fun e!326793 () SeekEntryResult!5552)

(assert (=> b!567943 (= e!326791 e!326793)))

(declare-fun lt!258737 () (_ BitVec 64))

(assert (=> b!567943 (= lt!258737 (select (arr!17103 a!3118) (index!24437 lt!258739)))))

(declare-fun c!65149 () Bool)

(assert (=> b!567943 (= c!65149 (= lt!258737 k!1914))))

(declare-fun b!567944 () Bool)

(assert (=> b!567944 (= e!326792 (MissingZero!5552 (index!24437 lt!258739)))))

(declare-fun b!567945 () Bool)

(assert (=> b!567945 (= e!326793 (Found!5552 (index!24437 lt!258739)))))

(declare-fun d!84369 () Bool)

(declare-fun lt!258738 () SeekEntryResult!5552)

(assert (=> d!84369 (and (or (is-Undefined!5552 lt!258738) (not (is-Found!5552 lt!258738)) (and (bvsge (index!24436 lt!258738) #b00000000000000000000000000000000) (bvslt (index!24436 lt!258738) (size!17467 a!3118)))) (or (is-Undefined!5552 lt!258738) (is-Found!5552 lt!258738) (not (is-MissingZero!5552 lt!258738)) (and (bvsge (index!24435 lt!258738) #b00000000000000000000000000000000) (bvslt (index!24435 lt!258738) (size!17467 a!3118)))) (or (is-Undefined!5552 lt!258738) (is-Found!5552 lt!258738) (is-MissingZero!5552 lt!258738) (not (is-MissingVacant!5552 lt!258738)) (and (bvsge (index!24438 lt!258738) #b00000000000000000000000000000000) (bvslt (index!24438 lt!258738) (size!17467 a!3118)))) (or (is-Undefined!5552 lt!258738) (ite (is-Found!5552 lt!258738) (= (select (arr!17103 a!3118) (index!24436 lt!258738)) k!1914) (ite (is-MissingZero!5552 lt!258738) (= (select (arr!17103 a!3118) (index!24435 lt!258738)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5552 lt!258738) (= (select (arr!17103 a!3118) (index!24438 lt!258738)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84369 (= lt!258738 e!326791)))

(declare-fun c!65151 () Bool)

(assert (=> d!84369 (= c!65151 (and (is-Intermediate!5552 lt!258739) (undefined!6364 lt!258739)))))

(assert (=> d!84369 (= lt!258739 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!84369 (validMask!0 mask!3119)))

(assert (=> d!84369 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!258738)))

(declare-fun b!567941 () Bool)

(declare-fun c!65150 () Bool)

(assert (=> b!567941 (= c!65150 (= lt!258737 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!567941 (= e!326793 e!326792)))

(assert (= (and d!84369 c!65151) b!567942))

(assert (= (and d!84369 (not c!65151)) b!567943))

(assert (= (and b!567943 c!65149) b!567945))

(assert (= (and b!567943 (not c!65149)) b!567941))

(assert (= (and b!567941 c!65150) b!567944))

(assert (= (and b!567941 (not c!65150)) b!567940))

(declare-fun m!546517 () Bool)

(assert (=> b!567940 m!546517))

(declare-fun m!546521 () Bool)

(assert (=> b!567943 m!546521))

(declare-fun m!546525 () Bool)

(assert (=> d!84369 m!546525))

(declare-fun m!546527 () Bool)

(assert (=> d!84369 m!546527))

(assert (=> d!84369 m!546239))

(assert (=> d!84369 m!546525))

(declare-fun m!546531 () Bool)

(assert (=> d!84369 m!546531))

(declare-fun m!546533 () Bool)

(assert (=> d!84369 m!546533))

(declare-fun m!546535 () Bool)

(assert (=> d!84369 m!546535))

(assert (=> b!567595 d!84369))

(declare-fun d!84375 () Bool)

(assert (=> d!84375 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!567601 d!84375))

(declare-fun d!84377 () Bool)

(declare-fun res!358352 () Bool)

(declare-fun e!326804 () Bool)

(assert (=> d!84377 (=> res!358352 e!326804)))

(assert (=> d!84377 (= res!358352 (= (select (arr!17103 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!84377 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!326804)))

(declare-fun b!567960 () Bool)

(declare-fun e!326805 () Bool)

(assert (=> b!567960 (= e!326804 e!326805)))

(declare-fun res!358353 () Bool)

(assert (=> b!567960 (=> (not res!358353) (not e!326805))))

(assert (=> b!567960 (= res!358353 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17467 a!3118)))))

(declare-fun b!567961 () Bool)

(assert (=> b!567961 (= e!326805 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84377 (not res!358352)) b!567960))

(assert (= (and b!567960 res!358353) b!567961))

(assert (=> d!84377 m!546403))

(declare-fun m!546551 () Bool)

(assert (=> b!567961 m!546551))

(assert (=> b!567599 d!84377))

(declare-fun d!84379 () Bool)

(assert (=> d!84379 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51920 d!84379))

(declare-fun d!84381 () Bool)

(assert (=> d!84381 (= (array_inv!12899 a!3118) (bvsge (size!17467 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51920 d!84381))

(declare-fun e!326807 () SeekEntryResult!5552)

(declare-fun b!567962 () Bool)

(declare-fun lt!258748 () SeekEntryResult!5552)

(assert (=> b!567962 (= e!326807 (seekKeyOrZeroReturnVacant!0 (x!53305 lt!258748) (index!24437 lt!258748) (index!24437 lt!258748) lt!258558 lt!258559 mask!3119))))

(declare-fun b!567964 () Bool)

(declare-fun e!326806 () SeekEntryResult!5552)

(assert (=> b!567964 (= e!326806 Undefined!5552)))

(declare-fun b!567965 () Bool)

(declare-fun e!326808 () SeekEntryResult!5552)

(assert (=> b!567965 (= e!326806 e!326808)))

(declare-fun lt!258746 () (_ BitVec 64))

(assert (=> b!567965 (= lt!258746 (select (arr!17103 lt!258559) (index!24437 lt!258748)))))

(declare-fun c!65156 () Bool)

(assert (=> b!567965 (= c!65156 (= lt!258746 lt!258558))))

(declare-fun b!567966 () Bool)

(assert (=> b!567966 (= e!326807 (MissingZero!5552 (index!24437 lt!258748)))))

(declare-fun b!567967 () Bool)

(assert (=> b!567967 (= e!326808 (Found!5552 (index!24437 lt!258748)))))

(declare-fun d!84383 () Bool)

(declare-fun lt!258747 () SeekEntryResult!5552)

(assert (=> d!84383 (and (or (is-Undefined!5552 lt!258747) (not (is-Found!5552 lt!258747)) (and (bvsge (index!24436 lt!258747) #b00000000000000000000000000000000) (bvslt (index!24436 lt!258747) (size!17467 lt!258559)))) (or (is-Undefined!5552 lt!258747) (is-Found!5552 lt!258747) (not (is-MissingZero!5552 lt!258747)) (and (bvsge (index!24435 lt!258747) #b00000000000000000000000000000000) (bvslt (index!24435 lt!258747) (size!17467 lt!258559)))) (or (is-Undefined!5552 lt!258747) (is-Found!5552 lt!258747) (is-MissingZero!5552 lt!258747) (not (is-MissingVacant!5552 lt!258747)) (and (bvsge (index!24438 lt!258747) #b00000000000000000000000000000000) (bvslt (index!24438 lt!258747) (size!17467 lt!258559)))) (or (is-Undefined!5552 lt!258747) (ite (is-Found!5552 lt!258747) (= (select (arr!17103 lt!258559) (index!24436 lt!258747)) lt!258558) (ite (is-MissingZero!5552 lt!258747) (= (select (arr!17103 lt!258559) (index!24435 lt!258747)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5552 lt!258747) (= (select (arr!17103 lt!258559) (index!24438 lt!258747)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84383 (= lt!258747 e!326806)))

(declare-fun c!65158 () Bool)

(assert (=> d!84383 (= c!65158 (and (is-Intermediate!5552 lt!258748) (undefined!6364 lt!258748)))))

(assert (=> d!84383 (= lt!258748 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!258558 mask!3119) lt!258558 lt!258559 mask!3119))))

(assert (=> d!84383 (validMask!0 mask!3119)))

(assert (=> d!84383 (= (seekEntryOrOpen!0 lt!258558 lt!258559 mask!3119) lt!258747)))

(declare-fun b!567963 () Bool)

(declare-fun c!65157 () Bool)

(assert (=> b!567963 (= c!65157 (= lt!258746 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!567963 (= e!326808 e!326807)))

(assert (= (and d!84383 c!65158) b!567964))

(assert (= (and d!84383 (not c!65158)) b!567965))

(assert (= (and b!567965 c!65156) b!567967))

(assert (= (and b!567965 (not c!65156)) b!567963))

(assert (= (and b!567963 c!65157) b!567966))

(assert (= (and b!567963 (not c!65157)) b!567962))

(declare-fun m!546553 () Bool)

(assert (=> b!567962 m!546553))

(declare-fun m!546555 () Bool)

(assert (=> b!567965 m!546555))

(assert (=> d!84383 m!546233))

(declare-fun m!546557 () Bool)

(assert (=> d!84383 m!546557))

(assert (=> d!84383 m!546239))

(assert (=> d!84383 m!546233))

(declare-fun m!546559 () Bool)

(assert (=> d!84383 m!546559))

(declare-fun m!546561 () Bool)

(assert (=> d!84383 m!546561))

(declare-fun m!546563 () Bool)

(assert (=> d!84383 m!546563))

(assert (=> b!567594 d!84383))

(declare-fun b!567968 () Bool)

(declare-fun e!326809 () Bool)

(declare-fun e!326811 () Bool)

(assert (=> b!567968 (= e!326809 e!326811)))

(declare-fun lt!258750 () (_ BitVec 64))

(assert (=> b!567968 (= lt!258750 (select (arr!17103 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!258751 () Unit!17806)

(assert (=> b!567968 (= lt!258751 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258750 #b00000000000000000000000000000000))))

(assert (=> b!567968 (arrayContainsKey!0 a!3118 lt!258750 #b00000000000000000000000000000000)))

(declare-fun lt!258749 () Unit!17806)

(assert (=> b!567968 (= lt!258749 lt!258751)))

(declare-fun res!358355 () Bool)

(assert (=> b!567968 (= res!358355 (= (seekEntryOrOpen!0 (select (arr!17103 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5552 #b00000000000000000000000000000000)))))

(assert (=> b!567968 (=> (not res!358355) (not e!326811))))

(declare-fun bm!32537 () Bool)

(declare-fun call!32540 () Bool)

(assert (=> bm!32537 (= call!32540 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!567969 () Bool)

(declare-fun e!326810 () Bool)

(assert (=> b!567969 (= e!326810 e!326809)))

(declare-fun c!65159 () Bool)

(assert (=> b!567969 (= c!65159 (validKeyInArray!0 (select (arr!17103 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!567970 () Bool)

(assert (=> b!567970 (= e!326811 call!32540)))

(declare-fun d!84385 () Bool)

(declare-fun res!358354 () Bool)

(assert (=> d!84385 (=> res!358354 e!326810)))

(assert (=> d!84385 (= res!358354 (bvsge #b00000000000000000000000000000000 (size!17467 a!3118)))))

(assert (=> d!84385 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!326810)))

(declare-fun b!567971 () Bool)

(assert (=> b!567971 (= e!326809 call!32540)))

(assert (= (and d!84385 (not res!358354)) b!567969))

(assert (= (and b!567969 c!65159) b!567968))

(assert (= (and b!567969 (not c!65159)) b!567971))

(assert (= (and b!567968 res!358355) b!567970))

(assert (= (or b!567970 b!567971) bm!32537))

(assert (=> b!567968 m!546403))

(declare-fun m!546565 () Bool)

(assert (=> b!567968 m!546565))

(declare-fun m!546567 () Bool)

(assert (=> b!567968 m!546567))

(assert (=> b!567968 m!546403))

(declare-fun m!546569 () Bool)

(assert (=> b!567968 m!546569))

(declare-fun m!546571 () Bool)

(assert (=> bm!32537 m!546571))

(assert (=> b!567969 m!546403))

(assert (=> b!567969 m!546403))

(assert (=> b!567969 m!546407))

(assert (=> b!567598 d!84385))

(push 1)

