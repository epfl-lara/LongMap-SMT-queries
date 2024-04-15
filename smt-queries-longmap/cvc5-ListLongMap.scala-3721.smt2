; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51246 () Bool)

(assert start!51246)

(declare-fun b!559385 () Bool)

(declare-fun res!350918 () Bool)

(declare-fun e!322245 () Bool)

(assert (=> b!559385 (=> (not res!350918) (not e!322245))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!559385 (= res!350918 (validKeyInArray!0 k!1914))))

(declare-fun b!559386 () Bool)

(declare-fun res!350922 () Bool)

(assert (=> b!559386 (=> (not res!350922) (not e!322245))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35183 0))(
  ( (array!35184 (arr!16894 (Array (_ BitVec 32) (_ BitVec 64))) (size!17259 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35183)

(assert (=> b!559386 (= res!350922 (and (= (size!17259 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17259 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17259 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!559387 () Bool)

(declare-datatypes ((SeekEntryResult!5340 0))(
  ( (MissingZero!5340 (index!23587 (_ BitVec 32))) (Found!5340 (index!23588 (_ BitVec 32))) (Intermediate!5340 (undefined!6152 Bool) (index!23589 (_ BitVec 32)) (x!52501 (_ BitVec 32))) (Undefined!5340) (MissingVacant!5340 (index!23590 (_ BitVec 32))) )
))
(declare-fun lt!254141 () SeekEntryResult!5340)

(declare-fun e!322250 () Bool)

(declare-fun lt!254145 () SeekEntryResult!5340)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35183 (_ BitVec 32)) SeekEntryResult!5340)

(assert (=> b!559387 (= e!322250 (= lt!254141 (seekKeyOrZeroReturnVacant!0 (x!52501 lt!254145) (index!23589 lt!254145) (index!23589 lt!254145) (select (arr!16894 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!559388 () Bool)

(declare-fun res!350923 () Bool)

(assert (=> b!559388 (=> (not res!350923) (not e!322245))))

(assert (=> b!559388 (= res!350923 (validKeyInArray!0 (select (arr!16894 a!3118) j!142)))))

(declare-fun res!350921 () Bool)

(assert (=> start!51246 (=> (not res!350921) (not e!322245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51246 (= res!350921 (validMask!0 mask!3119))))

(assert (=> start!51246 e!322245))

(assert (=> start!51246 true))

(declare-fun array_inv!12777 (array!35183) Bool)

(assert (=> start!51246 (array_inv!12777 a!3118)))

(declare-fun b!559389 () Bool)

(declare-fun res!350919 () Bool)

(declare-fun e!322251 () Bool)

(assert (=> b!559389 (=> (not res!350919) (not e!322251))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35183 (_ BitVec 32)) Bool)

(assert (=> b!559389 (= res!350919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!559390 () Bool)

(declare-fun e!322248 () Bool)

(assert (=> b!559390 (= e!322251 e!322248)))

(declare-fun res!350927 () Bool)

(assert (=> b!559390 (=> (not res!350927) (not e!322248))))

(declare-fun lt!254142 () (_ BitVec 64))

(declare-fun lt!254146 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35183 (_ BitVec 32)) SeekEntryResult!5340)

(assert (=> b!559390 (= res!350927 (= lt!254145 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254146 lt!254142 (array!35184 (store (arr!16894 a!3118) i!1132 k!1914) (size!17259 a!3118)) mask!3119)))))

(declare-fun lt!254143 () (_ BitVec 32))

(assert (=> b!559390 (= lt!254145 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254143 (select (arr!16894 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!559390 (= lt!254146 (toIndex!0 lt!254142 mask!3119))))

(assert (=> b!559390 (= lt!254142 (select (store (arr!16894 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!559390 (= lt!254143 (toIndex!0 (select (arr!16894 a!3118) j!142) mask!3119))))

(declare-fun b!559391 () Bool)

(declare-fun e!322247 () Bool)

(declare-fun e!322249 () Bool)

(assert (=> b!559391 (= e!322247 e!322249)))

(declare-fun res!350917 () Bool)

(assert (=> b!559391 (=> res!350917 e!322249)))

(assert (=> b!559391 (= res!350917 (or (undefined!6152 lt!254145) (not (is-Intermediate!5340 lt!254145))))))

(declare-fun b!559392 () Bool)

(declare-fun res!350924 () Bool)

(assert (=> b!559392 (=> (not res!350924) (not e!322251))))

(declare-datatypes ((List!11013 0))(
  ( (Nil!11010) (Cons!11009 (h!12009 (_ BitVec 64)) (t!17232 List!11013)) )
))
(declare-fun arrayNoDuplicates!0 (array!35183 (_ BitVec 32) List!11013) Bool)

(assert (=> b!559392 (= res!350924 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11010))))

(declare-fun b!559393 () Bool)

(assert (=> b!559393 (= e!322245 e!322251)))

(declare-fun res!350916 () Bool)

(assert (=> b!559393 (=> (not res!350916) (not e!322251))))

(declare-fun lt!254139 () SeekEntryResult!5340)

(assert (=> b!559393 (= res!350916 (or (= lt!254139 (MissingZero!5340 i!1132)) (= lt!254139 (MissingVacant!5340 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35183 (_ BitVec 32)) SeekEntryResult!5340)

(assert (=> b!559393 (= lt!254139 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!559394 () Bool)

(declare-fun res!350926 () Bool)

(assert (=> b!559394 (=> (not res!350926) (not e!322245))))

(declare-fun arrayContainsKey!0 (array!35183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!559394 (= res!350926 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!559395 () Bool)

(assert (=> b!559395 (= e!322248 (not (or (undefined!6152 lt!254145) (not (is-Intermediate!5340 lt!254145)) (let ((bdg!16975 (select (arr!16894 a!3118) (index!23589 lt!254145)))) (or (= bdg!16975 (select (arr!16894 a!3118) j!142)) (= bdg!16975 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (bvslt (index!23589 lt!254145) #b00000000000000000000000000000000) (bvsge (index!23589 lt!254145) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52501 lt!254145) #b01111111111111111111111111111110) (bvslt (x!52501 lt!254145) #b00000000000000000000000000000000) (= (select (store (arr!16894 a!3118) i!1132 k!1914) (index!23589 lt!254145)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!559395 e!322247))

(declare-fun res!350920 () Bool)

(assert (=> b!559395 (=> (not res!350920) (not e!322247))))

(assert (=> b!559395 (= res!350920 (= lt!254141 (Found!5340 j!142)))))

(assert (=> b!559395 (= lt!254141 (seekEntryOrOpen!0 (select (arr!16894 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!559395 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17440 0))(
  ( (Unit!17441) )
))
(declare-fun lt!254144 () Unit!17440)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35183 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17440)

(assert (=> b!559395 (= lt!254144 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!559396 () Bool)

(assert (=> b!559396 (= e!322249 e!322250)))

(declare-fun res!350925 () Bool)

(assert (=> b!559396 (=> res!350925 e!322250)))

(declare-fun lt!254140 () (_ BitVec 64))

(assert (=> b!559396 (= res!350925 (or (= lt!254140 (select (arr!16894 a!3118) j!142)) (= lt!254140 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!559396 (= lt!254140 (select (arr!16894 a!3118) (index!23589 lt!254145)))))

(assert (= (and start!51246 res!350921) b!559386))

(assert (= (and b!559386 res!350922) b!559388))

(assert (= (and b!559388 res!350923) b!559385))

(assert (= (and b!559385 res!350918) b!559394))

(assert (= (and b!559394 res!350926) b!559393))

(assert (= (and b!559393 res!350916) b!559389))

(assert (= (and b!559389 res!350919) b!559392))

(assert (= (and b!559392 res!350924) b!559390))

(assert (= (and b!559390 res!350927) b!559395))

(assert (= (and b!559395 res!350920) b!559391))

(assert (= (and b!559391 (not res!350917)) b!559396))

(assert (= (and b!559396 (not res!350925)) b!559387))

(declare-fun m!536723 () Bool)

(assert (=> b!559395 m!536723))

(declare-fun m!536725 () Bool)

(assert (=> b!559395 m!536725))

(declare-fun m!536727 () Bool)

(assert (=> b!559395 m!536727))

(declare-fun m!536729 () Bool)

(assert (=> b!559395 m!536729))

(declare-fun m!536731 () Bool)

(assert (=> b!559395 m!536731))

(declare-fun m!536733 () Bool)

(assert (=> b!559395 m!536733))

(assert (=> b!559395 m!536725))

(declare-fun m!536735 () Bool)

(assert (=> b!559395 m!536735))

(declare-fun m!536737 () Bool)

(assert (=> start!51246 m!536737))

(declare-fun m!536739 () Bool)

(assert (=> start!51246 m!536739))

(declare-fun m!536741 () Bool)

(assert (=> b!559385 m!536741))

(declare-fun m!536743 () Bool)

(assert (=> b!559392 m!536743))

(assert (=> b!559390 m!536725))

(declare-fun m!536745 () Bool)

(assert (=> b!559390 m!536745))

(declare-fun m!536747 () Bool)

(assert (=> b!559390 m!536747))

(assert (=> b!559390 m!536725))

(declare-fun m!536749 () Bool)

(assert (=> b!559390 m!536749))

(declare-fun m!536751 () Bool)

(assert (=> b!559390 m!536751))

(assert (=> b!559390 m!536731))

(assert (=> b!559390 m!536725))

(declare-fun m!536753 () Bool)

(assert (=> b!559390 m!536753))

(declare-fun m!536755 () Bool)

(assert (=> b!559393 m!536755))

(declare-fun m!536757 () Bool)

(assert (=> b!559389 m!536757))

(assert (=> b!559396 m!536725))

(assert (=> b!559396 m!536729))

(assert (=> b!559387 m!536725))

(assert (=> b!559387 m!536725))

(declare-fun m!536759 () Bool)

(assert (=> b!559387 m!536759))

(declare-fun m!536761 () Bool)

(assert (=> b!559394 m!536761))

(assert (=> b!559388 m!536725))

(assert (=> b!559388 m!536725))

(declare-fun m!536763 () Bool)

(assert (=> b!559388 m!536763))

(push 1)

(assert (not b!559385))

(assert (not start!51246))

(assert (not b!559387))

(assert (not b!559390))

(assert (not b!559389))

(assert (not b!559393))

(assert (not b!559394))

(assert (not b!559395))

(assert (not b!559392))

(assert (not b!559388))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!559445 () Bool)

(declare-fun e!322278 () SeekEntryResult!5340)

(assert (=> b!559445 (= e!322278 (MissingVacant!5340 (index!23589 lt!254145)))))

(declare-fun d!83575 () Bool)

(declare-fun lt!254168 () SeekEntryResult!5340)

(assert (=> d!83575 (and (or (is-Undefined!5340 lt!254168) (not (is-Found!5340 lt!254168)) (and (bvsge (index!23588 lt!254168) #b00000000000000000000000000000000) (bvslt (index!23588 lt!254168) (size!17259 a!3118)))) (or (is-Undefined!5340 lt!254168) (is-Found!5340 lt!254168) (not (is-MissingVacant!5340 lt!254168)) (not (= (index!23590 lt!254168) (index!23589 lt!254145))) (and (bvsge (index!23590 lt!254168) #b00000000000000000000000000000000) (bvslt (index!23590 lt!254168) (size!17259 a!3118)))) (or (is-Undefined!5340 lt!254168) (ite (is-Found!5340 lt!254168) (= (select (arr!16894 a!3118) (index!23588 lt!254168)) (select (arr!16894 a!3118) j!142)) (and (is-MissingVacant!5340 lt!254168) (= (index!23590 lt!254168) (index!23589 lt!254145)) (= (select (arr!16894 a!3118) (index!23590 lt!254168)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!322280 () SeekEntryResult!5340)

(assert (=> d!83575 (= lt!254168 e!322280)))

(declare-fun c!64599 () Bool)

(assert (=> d!83575 (= c!64599 (bvsge (x!52501 lt!254145) #b01111111111111111111111111111110))))

(declare-fun lt!254167 () (_ BitVec 64))

(assert (=> d!83575 (= lt!254167 (select (arr!16894 a!3118) (index!23589 lt!254145)))))

(assert (=> d!83575 (validMask!0 mask!3119)))

(assert (=> d!83575 (= (seekKeyOrZeroReturnVacant!0 (x!52501 lt!254145) (index!23589 lt!254145) (index!23589 lt!254145) (select (arr!16894 a!3118) j!142) a!3118 mask!3119) lt!254168)))

(declare-fun b!559446 () Bool)

(declare-fun e!322279 () SeekEntryResult!5340)

(assert (=> b!559446 (= e!322279 (Found!5340 (index!23589 lt!254145)))))

(declare-fun b!559447 () Bool)

(assert (=> b!559447 (= e!322280 e!322279)))

(declare-fun c!64597 () Bool)

(assert (=> b!559447 (= c!64597 (= lt!254167 (select (arr!16894 a!3118) j!142)))))

(declare-fun b!559448 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!559448 (= e!322278 (seekKeyOrZeroReturnVacant!0 (bvadd (x!52501 lt!254145) #b00000000000000000000000000000001) (nextIndex!0 (index!23589 lt!254145) (x!52501 lt!254145) mask!3119) (index!23589 lt!254145) (select (arr!16894 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!559449 () Bool)

(assert (=> b!559449 (= e!322280 Undefined!5340)))

(declare-fun b!559450 () Bool)

(declare-fun c!64598 () Bool)

(assert (=> b!559450 (= c!64598 (= lt!254167 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!559450 (= e!322279 e!322278)))

(assert (= (and d!83575 c!64599) b!559449))

(assert (= (and d!83575 (not c!64599)) b!559447))

(assert (= (and b!559447 c!64597) b!559446))

(assert (= (and b!559447 (not c!64597)) b!559450))

(assert (= (and b!559450 c!64598) b!559445))

(assert (= (and b!559450 (not c!64598)) b!559448))

(declare-fun m!536781 () Bool)

(assert (=> d!83575 m!536781))

(declare-fun m!536783 () Bool)

(assert (=> d!83575 m!536783))

(assert (=> d!83575 m!536729))

(assert (=> d!83575 m!536737))

(declare-fun m!536785 () Bool)

(assert (=> b!559448 m!536785))

(assert (=> b!559448 m!536785))

(assert (=> b!559448 m!536725))

(declare-fun m!536787 () Bool)

(assert (=> b!559448 m!536787))

(assert (=> b!559387 d!83575))

(declare-fun b!559467 () Bool)

(declare-fun e!322296 () Bool)

(declare-fun contains!2840 (List!11013 (_ BitVec 64)) Bool)

(assert (=> b!559467 (= e!322296 (contains!2840 Nil!11010 (select (arr!16894 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!559468 () Bool)

(declare-fun e!322297 () Bool)

(declare-fun call!32413 () Bool)

(assert (=> b!559468 (= e!322297 call!32413)))

(declare-fun bm!32410 () Bool)

(declare-fun c!64602 () Bool)

(assert (=> bm!32410 (= call!32413 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64602 (Cons!11009 (select (arr!16894 a!3118) #b00000000000000000000000000000000) Nil!11010) Nil!11010)))))

(declare-fun b!559470 () Bool)

(declare-fun e!322295 () Bool)

(assert (=> b!559470 (= e!322295 e!322297)))

(assert (=> b!559470 (= c!64602 (validKeyInArray!0 (select (arr!16894 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!559471 () Bool)

(assert (=> b!559471 (= e!322297 call!32413)))

(declare-fun d!83585 () Bool)

(declare-fun res!350955 () Bool)

(declare-fun e!322298 () Bool)

(assert (=> d!83585 (=> res!350955 e!322298)))

(assert (=> d!83585 (= res!350955 (bvsge #b00000000000000000000000000000000 (size!17259 a!3118)))))

(assert (=> d!83585 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11010) e!322298)))

(declare-fun b!559469 () Bool)

(assert (=> b!559469 (= e!322298 e!322295)))

(declare-fun res!350954 () Bool)

(assert (=> b!559469 (=> (not res!350954) (not e!322295))))

(assert (=> b!559469 (= res!350954 (not e!322296))))

(declare-fun res!350953 () Bool)

(assert (=> b!559469 (=> (not res!350953) (not e!322296))))

(assert (=> b!559469 (= res!350953 (validKeyInArray!0 (select (arr!16894 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!83585 (not res!350955)) b!559469))

(assert (= (and b!559469 res!350953) b!559467))

(assert (= (and b!559469 res!350954) b!559470))

(assert (= (and b!559470 c!64602) b!559468))

(assert (= (and b!559470 (not c!64602)) b!559471))

(assert (= (or b!559468 b!559471) bm!32410))

(declare-fun m!536793 () Bool)

(assert (=> b!559467 m!536793))

(assert (=> b!559467 m!536793))

(declare-fun m!536795 () Bool)

(assert (=> b!559467 m!536795))

(assert (=> bm!32410 m!536793))

(declare-fun m!536797 () Bool)

(assert (=> bm!32410 m!536797))

(assert (=> b!559470 m!536793))

(assert (=> b!559470 m!536793))

(declare-fun m!536799 () Bool)

(assert (=> b!559470 m!536799))

(assert (=> b!559469 m!536793))

(assert (=> b!559469 m!536793))

(assert (=> b!559469 m!536799))

(assert (=> b!559392 d!83585))

(declare-fun d!83595 () Bool)

(assert (=> d!83595 (= (validKeyInArray!0 (select (arr!16894 a!3118) j!142)) (and (not (= (select (arr!16894 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16894 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!559388 d!83595))

(declare-fun e!322336 () SeekEntryResult!5340)

(declare-fun b!559535 () Bool)

(declare-fun lt!254195 () SeekEntryResult!5340)

(assert (=> b!559535 (= e!322336 (seekKeyOrZeroReturnVacant!0 (x!52501 lt!254195) (index!23589 lt!254195) (index!23589 lt!254195) k!1914 a!3118 mask!3119))))

(declare-fun b!559536 () Bool)

(declare-fun e!322335 () SeekEntryResult!5340)

(assert (=> b!559536 (= e!322335 Undefined!5340)))

(declare-fun b!559538 () Bool)

(declare-fun e!322337 () SeekEntryResult!5340)

(assert (=> b!559538 (= e!322335 e!322337)))

(declare-fun lt!254194 () (_ BitVec 64))

(assert (=> b!559538 (= lt!254194 (select (arr!16894 a!3118) (index!23589 lt!254195)))))

(declare-fun c!64630 () Bool)

(assert (=> b!559538 (= c!64630 (= lt!254194 k!1914))))

(declare-fun b!559539 () Bool)

(assert (=> b!559539 (= e!322336 (MissingZero!5340 (index!23589 lt!254195)))))

(declare-fun b!559540 () Bool)

(assert (=> b!559540 (= e!322337 (Found!5340 (index!23589 lt!254195)))))

(declare-fun b!559537 () Bool)

(declare-fun c!64632 () Bool)

(assert (=> b!559537 (= c!64632 (= lt!254194 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!559537 (= e!322337 e!322336)))

(declare-fun d!83597 () Bool)

(declare-fun lt!254193 () SeekEntryResult!5340)

(assert (=> d!83597 (and (or (is-Undefined!5340 lt!254193) (not (is-Found!5340 lt!254193)) (and (bvsge (index!23588 lt!254193) #b00000000000000000000000000000000) (bvslt (index!23588 lt!254193) (size!17259 a!3118)))) (or (is-Undefined!5340 lt!254193) (is-Found!5340 lt!254193) (not (is-MissingZero!5340 lt!254193)) (and (bvsge (index!23587 lt!254193) #b00000000000000000000000000000000) (bvslt (index!23587 lt!254193) (size!17259 a!3118)))) (or (is-Undefined!5340 lt!254193) (is-Found!5340 lt!254193) (is-MissingZero!5340 lt!254193) (not (is-MissingVacant!5340 lt!254193)) (and (bvsge (index!23590 lt!254193) #b00000000000000000000000000000000) (bvslt (index!23590 lt!254193) (size!17259 a!3118)))) (or (is-Undefined!5340 lt!254193) (ite (is-Found!5340 lt!254193) (= (select (arr!16894 a!3118) (index!23588 lt!254193)) k!1914) (ite (is-MissingZero!5340 lt!254193) (= (select (arr!16894 a!3118) (index!23587 lt!254193)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5340 lt!254193) (= (select (arr!16894 a!3118) (index!23590 lt!254193)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83597 (= lt!254193 e!322335)))

(declare-fun c!64631 () Bool)

(assert (=> d!83597 (= c!64631 (and (is-Intermediate!5340 lt!254195) (undefined!6152 lt!254195)))))

(assert (=> d!83597 (= lt!254195 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!83597 (validMask!0 mask!3119)))

(assert (=> d!83597 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!254193)))

(assert (= (and d!83597 c!64631) b!559536))

(assert (= (and d!83597 (not c!64631)) b!559538))

(assert (= (and b!559538 c!64630) b!559540))

(assert (= (and b!559538 (not c!64630)) b!559537))

(assert (= (and b!559537 c!64632) b!559539))

(assert (= (and b!559537 (not c!64632)) b!559535))

(declare-fun m!536833 () Bool)

(assert (=> b!559535 m!536833))

(declare-fun m!536835 () Bool)

(assert (=> b!559538 m!536835))

(declare-fun m!536837 () Bool)

(assert (=> d!83597 m!536837))

(declare-fun m!536839 () Bool)

(assert (=> d!83597 m!536839))

(declare-fun m!536841 () Bool)

(assert (=> d!83597 m!536841))

(declare-fun m!536843 () Bool)

(assert (=> d!83597 m!536843))

(assert (=> d!83597 m!536737))

(assert (=> d!83597 m!536843))

(declare-fun m!536845 () Bool)

(assert (=> d!83597 m!536845))

(assert (=> b!559393 d!83597))

(declare-fun e!322345 () SeekEntryResult!5340)

(declare-fun lt!254204 () SeekEntryResult!5340)

(declare-fun b!559549 () Bool)

(assert (=> b!559549 (= e!322345 (seekKeyOrZeroReturnVacant!0 (x!52501 lt!254204) (index!23589 lt!254204) (index!23589 lt!254204) (select (arr!16894 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!559550 () Bool)

(declare-fun e!322344 () SeekEntryResult!5340)

(assert (=> b!559550 (= e!322344 Undefined!5340)))

(declare-fun b!559552 () Bool)

(declare-fun e!322346 () SeekEntryResult!5340)

(assert (=> b!559552 (= e!322344 e!322346)))

(declare-fun lt!254203 () (_ BitVec 64))

(assert (=> b!559552 (= lt!254203 (select (arr!16894 a!3118) (index!23589 lt!254204)))))

(declare-fun c!64635 () Bool)

(assert (=> b!559552 (= c!64635 (= lt!254203 (select (arr!16894 a!3118) j!142)))))

(declare-fun b!559553 () Bool)

(assert (=> b!559553 (= e!322345 (MissingZero!5340 (index!23589 lt!254204)))))

(declare-fun b!559554 () Bool)

(assert (=> b!559554 (= e!322346 (Found!5340 (index!23589 lt!254204)))))

(declare-fun b!559551 () Bool)

(declare-fun c!64637 () Bool)

(assert (=> b!559551 (= c!64637 (= lt!254203 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!559551 (= e!322346 e!322345)))

(declare-fun d!83605 () Bool)

(declare-fun lt!254202 () SeekEntryResult!5340)

(assert (=> d!83605 (and (or (is-Undefined!5340 lt!254202) (not (is-Found!5340 lt!254202)) (and (bvsge (index!23588 lt!254202) #b00000000000000000000000000000000) (bvslt (index!23588 lt!254202) (size!17259 a!3118)))) (or (is-Undefined!5340 lt!254202) (is-Found!5340 lt!254202) (not (is-MissingZero!5340 lt!254202)) (and (bvsge (index!23587 lt!254202) #b00000000000000000000000000000000) (bvslt (index!23587 lt!254202) (size!17259 a!3118)))) (or (is-Undefined!5340 lt!254202) (is-Found!5340 lt!254202) (is-MissingZero!5340 lt!254202) (not (is-MissingVacant!5340 lt!254202)) (and (bvsge (index!23590 lt!254202) #b00000000000000000000000000000000) (bvslt (index!23590 lt!254202) (size!17259 a!3118)))) (or (is-Undefined!5340 lt!254202) (ite (is-Found!5340 lt!254202) (= (select (arr!16894 a!3118) (index!23588 lt!254202)) (select (arr!16894 a!3118) j!142)) (ite (is-MissingZero!5340 lt!254202) (= (select (arr!16894 a!3118) (index!23587 lt!254202)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5340 lt!254202) (= (select (arr!16894 a!3118) (index!23590 lt!254202)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83605 (= lt!254202 e!322344)))

(declare-fun c!64636 () Bool)

(assert (=> d!83605 (= c!64636 (and (is-Intermediate!5340 lt!254204) (undefined!6152 lt!254204)))))

(assert (=> d!83605 (= lt!254204 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16894 a!3118) j!142) mask!3119) (select (arr!16894 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83605 (validMask!0 mask!3119)))

(assert (=> d!83605 (= (seekEntryOrOpen!0 (select (arr!16894 a!3118) j!142) a!3118 mask!3119) lt!254202)))

(assert (= (and d!83605 c!64636) b!559550))

(assert (= (and d!83605 (not c!64636)) b!559552))

(assert (= (and b!559552 c!64635) b!559554))

(assert (= (and b!559552 (not c!64635)) b!559551))

(assert (= (and b!559551 c!64637) b!559553))

(assert (= (and b!559551 (not c!64637)) b!559549))

(assert (=> b!559549 m!536725))

(declare-fun m!536847 () Bool)

(assert (=> b!559549 m!536847))

(declare-fun m!536849 () Bool)

(assert (=> b!559552 m!536849))

(declare-fun m!536851 () Bool)

(assert (=> d!83605 m!536851))

(declare-fun m!536853 () Bool)

(assert (=> d!83605 m!536853))

(declare-fun m!536855 () Bool)

(assert (=> d!83605 m!536855))

(assert (=> d!83605 m!536725))

(assert (=> d!83605 m!536745))

(assert (=> d!83605 m!536737))

(assert (=> d!83605 m!536745))

(assert (=> d!83605 m!536725))

(declare-fun m!536857 () Bool)

(assert (=> d!83605 m!536857))

(assert (=> b!559395 d!83605))

(declare-fun b!559581 () Bool)

(declare-fun e!322365 () Bool)

(declare-fun call!32424 () Bool)

(assert (=> b!559581 (= e!322365 call!32424)))

(declare-fun b!559582 () Bool)

(declare-fun e!322366 () Bool)

(assert (=> b!559582 (= e!322366 call!32424)))

(declare-fun d!83607 () Bool)

(declare-fun res!350980 () Bool)

(declare-fun e!322367 () Bool)

(assert (=> d!83607 (=> res!350980 e!322367)))

(assert (=> d!83607 (= res!350980 (bvsge j!142 (size!17259 a!3118)))))

(assert (=> d!83607 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!322367)))

(declare-fun bm!32421 () Bool)

(assert (=> bm!32421 (= call!32424 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!559583 () Bool)

(assert (=> b!559583 (= e!322367 e!322365)))

(declare-fun c!64646 () Bool)

(assert (=> b!559583 (= c!64646 (validKeyInArray!0 (select (arr!16894 a!3118) j!142)))))

(declare-fun b!559584 () Bool)

(assert (=> b!559584 (= e!322365 e!322366)))

(declare-fun lt!254227 () (_ BitVec 64))

(assert (=> b!559584 (= lt!254227 (select (arr!16894 a!3118) j!142))))

(declare-fun lt!254228 () Unit!17440)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35183 (_ BitVec 64) (_ BitVec 32)) Unit!17440)

(assert (=> b!559584 (= lt!254228 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!254227 j!142))))

(assert (=> b!559584 (arrayContainsKey!0 a!3118 lt!254227 #b00000000000000000000000000000000)))

(declare-fun lt!254226 () Unit!17440)

(assert (=> b!559584 (= lt!254226 lt!254228)))

(declare-fun res!350979 () Bool)

(assert (=> b!559584 (= res!350979 (= (seekEntryOrOpen!0 (select (arr!16894 a!3118) j!142) a!3118 mask!3119) (Found!5340 j!142)))))

(assert (=> b!559584 (=> (not res!350979) (not e!322366))))

(assert (= (and d!83607 (not res!350980)) b!559583))

(assert (= (and b!559583 c!64646) b!559584))

(assert (= (and b!559583 (not c!64646)) b!559581))

(assert (= (and b!559584 res!350979) b!559582))

(assert (= (or b!559582 b!559581) bm!32421))

(declare-fun m!536879 () Bool)

(assert (=> bm!32421 m!536879))

(assert (=> b!559583 m!536725))

(assert (=> b!559583 m!536725))

(assert (=> b!559583 m!536763))

(assert (=> b!559584 m!536725))

(declare-fun m!536881 () Bool)

(assert (=> b!559584 m!536881))

(declare-fun m!536883 () Bool)

(assert (=> b!559584 m!536883))

(assert (=> b!559584 m!536725))

(assert (=> b!559584 m!536735))

(assert (=> b!559395 d!83607))

(declare-fun d!83615 () Bool)

(assert (=> d!83615 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!254234 () Unit!17440)

(declare-fun choose!38 (array!35183 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17440)

(assert (=> d!83615 (= lt!254234 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83615 (validMask!0 mask!3119)))

(assert (=> d!83615 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!254234)))

(declare-fun bs!17372 () Bool)

(assert (= bs!17372 d!83615))

(assert (=> bs!17372 m!536727))

(declare-fun m!536891 () Bool)

(assert (=> bs!17372 m!536891))

(assert (=> bs!17372 m!536737))

(assert (=> b!559395 d!83615))

(declare-fun b!559589 () Bool)

(declare-fun e!322371 () Bool)

(declare-fun call!32426 () Bool)

(assert (=> b!559589 (= e!322371 call!32426)))

(declare-fun b!559590 () Bool)

(declare-fun e!322372 () Bool)

(assert (=> b!559590 (= e!322372 call!32426)))

(declare-fun d!83619 () Bool)

(declare-fun res!350984 () Bool)

(declare-fun e!322373 () Bool)

(assert (=> d!83619 (=> res!350984 e!322373)))

(assert (=> d!83619 (= res!350984 (bvsge #b00000000000000000000000000000000 (size!17259 a!3118)))))

(assert (=> d!83619 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!322373)))

(declare-fun bm!32423 () Bool)

(assert (=> bm!32423 (= call!32426 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!559591 () Bool)

(assert (=> b!559591 (= e!322373 e!322371)))

(declare-fun c!64648 () Bool)

(assert (=> b!559591 (= c!64648 (validKeyInArray!0 (select (arr!16894 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!559592 () Bool)

(assert (=> b!559592 (= e!322371 e!322372)))

(declare-fun lt!254236 () (_ BitVec 64))

(assert (=> b!559592 (= lt!254236 (select (arr!16894 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!254237 () Unit!17440)

(assert (=> b!559592 (= lt!254237 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!254236 #b00000000000000000000000000000000))))

(assert (=> b!559592 (arrayContainsKey!0 a!3118 lt!254236 #b00000000000000000000000000000000)))

(declare-fun lt!254235 () Unit!17440)

(assert (=> b!559592 (= lt!254235 lt!254237)))

(declare-fun res!350983 () Bool)

(assert (=> b!559592 (= res!350983 (= (seekEntryOrOpen!0 (select (arr!16894 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5340 #b00000000000000000000000000000000)))))

(assert (=> b!559592 (=> (not res!350983) (not e!322372))))

(assert (= (and d!83619 (not res!350984)) b!559591))

(assert (= (and b!559591 c!64648) b!559592))

(assert (= (and b!559591 (not c!64648)) b!559589))

(assert (= (and b!559592 res!350983) b!559590))

(assert (= (or b!559590 b!559589) bm!32423))

(declare-fun m!536893 () Bool)

(assert (=> bm!32423 m!536893))

(assert (=> b!559591 m!536793))

(assert (=> b!559591 m!536793))

(assert (=> b!559591 m!536799))

(assert (=> b!559592 m!536793))

(declare-fun m!536895 () Bool)

(assert (=> b!559592 m!536895))

(declare-fun m!536897 () Bool)

(assert (=> b!559592 m!536897))

(assert (=> b!559592 m!536793))

(declare-fun m!536899 () Bool)

(assert (=> b!559592 m!536899))

(assert (=> b!559389 d!83619))

(declare-fun d!83621 () Bool)

(assert (=> d!83621 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51246 d!83621))

(declare-fun d!83629 () Bool)

(assert (=> d!83629 (= (array_inv!12777 a!3118) (bvsge (size!17259 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51246 d!83629))

(declare-fun d!83631 () Bool)

(declare-fun res!350995 () Bool)

(declare-fun e!322393 () Bool)

(assert (=> d!83631 (=> res!350995 e!322393)))

(assert (=> d!83631 (= res!350995 (= (select (arr!16894 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!83631 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!322393)))

(declare-fun b!559621 () Bool)

(declare-fun e!322394 () Bool)

(assert (=> b!559621 (= e!322393 e!322394)))

(declare-fun res!350996 () Bool)

(assert (=> b!559621 (=> (not res!350996) (not e!322394))))

(assert (=> b!559621 (= res!350996 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17259 a!3118)))))

(declare-fun b!559622 () Bool)

(assert (=> b!559622 (= e!322394 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83631 (not res!350995)) b!559621))

(assert (= (and b!559621 res!350996) b!559622))

(assert (=> d!83631 m!536793))

(declare-fun m!536915 () Bool)

(assert (=> b!559622 m!536915))

(assert (=> b!559394 d!83631))

(declare-fun d!83635 () Bool)

(assert (=> d!83635 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!559385 d!83635))

(declare-fun b!559684 () Bool)

(declare-fun lt!254263 () SeekEntryResult!5340)

(assert (=> b!559684 (and (bvsge (index!23589 lt!254263) #b00000000000000000000000000000000) (bvslt (index!23589 lt!254263) (size!17259 (array!35184 (store (arr!16894 a!3118) i!1132 k!1914) (size!17259 a!3118)))))))

(declare-fun res!351016 () Bool)

(assert (=> b!559684 (= res!351016 (= (select (arr!16894 (array!35184 (store (arr!16894 a!3118) i!1132 k!1914) (size!17259 a!3118))) (index!23589 lt!254263)) lt!254142))))

(declare-fun e!322436 () Bool)

(assert (=> b!559684 (=> res!351016 e!322436)))

(declare-fun e!322435 () Bool)

(assert (=> b!559684 (= e!322435 e!322436)))

(declare-fun b!559685 () Bool)

(declare-fun e!322433 () Bool)

(assert (=> b!559685 (= e!322433 (bvsge (x!52501 lt!254263) #b01111111111111111111111111111110))))

(declare-fun d!83637 () Bool)

(assert (=> d!83637 e!322433))

(declare-fun c!64681 () Bool)

(assert (=> d!83637 (= c!64681 (and (is-Intermediate!5340 lt!254263) (undefined!6152 lt!254263)))))

(declare-fun e!322432 () SeekEntryResult!5340)

(assert (=> d!83637 (= lt!254263 e!322432)))

(declare-fun c!64682 () Bool)

(assert (=> d!83637 (= c!64682 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!254264 () (_ BitVec 64))

(assert (=> d!83637 (= lt!254264 (select (arr!16894 (array!35184 (store (arr!16894 a!3118) i!1132 k!1914) (size!17259 a!3118))) lt!254146))))

(assert (=> d!83637 (validMask!0 mask!3119)))

(assert (=> d!83637 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254146 lt!254142 (array!35184 (store (arr!16894 a!3118) i!1132 k!1914) (size!17259 a!3118)) mask!3119) lt!254263)))

(declare-fun b!559686 () Bool)

(declare-fun e!322434 () SeekEntryResult!5340)

(assert (=> b!559686 (= e!322432 e!322434)))

(declare-fun c!64680 () Bool)

(assert (=> b!559686 (= c!64680 (or (= lt!254264 lt!254142) (= (bvadd lt!254264 lt!254264) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!559687 () Bool)

(assert (=> b!559687 (= e!322432 (Intermediate!5340 true lt!254146 #b00000000000000000000000000000000))))

(declare-fun b!559688 () Bool)

(assert (=> b!559688 (and (bvsge (index!23589 lt!254263) #b00000000000000000000000000000000) (bvslt (index!23589 lt!254263) (size!17259 (array!35184 (store (arr!16894 a!3118) i!1132 k!1914) (size!17259 a!3118)))))))

(assert (=> b!559688 (= e!322436 (= (select (arr!16894 (array!35184 (store (arr!16894 a!3118) i!1132 k!1914) (size!17259 a!3118))) (index!23589 lt!254263)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!559689 () Bool)

(assert (=> b!559689 (= e!322433 e!322435)))

(declare-fun res!351015 () Bool)

(assert (=> b!559689 (= res!351015 (and (is-Intermediate!5340 lt!254263) (not (undefined!6152 lt!254263)) (bvslt (x!52501 lt!254263) #b01111111111111111111111111111110) (bvsge (x!52501 lt!254263) #b00000000000000000000000000000000) (bvsge (x!52501 lt!254263) #b00000000000000000000000000000000)))))

(assert (=> b!559689 (=> (not res!351015) (not e!322435))))

(declare-fun b!559690 () Bool)

(assert (=> b!559690 (= e!322434 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!254146 #b00000000000000000000000000000000 mask!3119) lt!254142 (array!35184 (store (arr!16894 a!3118) i!1132 k!1914) (size!17259 a!3118)) mask!3119))))

(declare-fun b!559691 () Bool)

(assert (=> b!559691 (and (bvsge (index!23589 lt!254263) #b00000000000000000000000000000000) (bvslt (index!23589 lt!254263) (size!17259 (array!35184 (store (arr!16894 a!3118) i!1132 k!1914) (size!17259 a!3118)))))))

(declare-fun res!351014 () Bool)

(assert (=> b!559691 (= res!351014 (= (select (arr!16894 (array!35184 (store (arr!16894 a!3118) i!1132 k!1914) (size!17259 a!3118))) (index!23589 lt!254263)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!559691 (=> res!351014 e!322436)))

(declare-fun b!559692 () Bool)

(assert (=> b!559692 (= e!322434 (Intermediate!5340 false lt!254146 #b00000000000000000000000000000000))))

(assert (= (and d!83637 c!64682) b!559687))

(assert (= (and d!83637 (not c!64682)) b!559686))

(assert (= (and b!559686 c!64680) b!559692))

(assert (= (and b!559686 (not c!64680)) b!559690))

(assert (= (and d!83637 c!64681) b!559685))

(assert (= (and d!83637 (not c!64681)) b!559689))

(assert (= (and b!559689 res!351015) b!559684))

(assert (= (and b!559684 (not res!351016)) b!559691))

(assert (= (and b!559691 (not res!351014)) b!559688))

(declare-fun m!536953 () Bool)

(assert (=> b!559684 m!536953))

(declare-fun m!536955 () Bool)

(assert (=> b!559690 m!536955))

(assert (=> b!559690 m!536955))

(declare-fun m!536957 () Bool)

(assert (=> b!559690 m!536957))

(declare-fun m!536959 () Bool)

(assert (=> d!83637 m!536959))

(assert (=> d!83637 m!536737))

(assert (=> b!559688 m!536953))

(assert (=> b!559691 m!536953))

(assert (=> b!559390 d!83637))

(declare-fun b!559693 () Bool)

(declare-fun lt!254265 () SeekEntryResult!5340)

(assert (=> b!559693 (and (bvsge (index!23589 lt!254265) #b00000000000000000000000000000000) (bvslt (index!23589 lt!254265) (size!17259 a!3118)))))

(declare-fun res!351019 () Bool)

(assert (=> b!559693 (= res!351019 (= (select (arr!16894 a!3118) (index!23589 lt!254265)) (select (arr!16894 a!3118) j!142)))))

(declare-fun e!322441 () Bool)

(assert (=> b!559693 (=> res!351019 e!322441)))

(declare-fun e!322440 () Bool)

(assert (=> b!559693 (= e!322440 e!322441)))

(declare-fun b!559694 () Bool)

(declare-fun e!322438 () Bool)

(assert (=> b!559694 (= e!322438 (bvsge (x!52501 lt!254265) #b01111111111111111111111111111110))))

(declare-fun d!83649 () Bool)

(assert (=> d!83649 e!322438))

(declare-fun c!64684 () Bool)

(assert (=> d!83649 (= c!64684 (and (is-Intermediate!5340 lt!254265) (undefined!6152 lt!254265)))))

(declare-fun e!322437 () SeekEntryResult!5340)

(assert (=> d!83649 (= lt!254265 e!322437)))

(declare-fun c!64685 () Bool)

(assert (=> d!83649 (= c!64685 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!254266 () (_ BitVec 64))

(assert (=> d!83649 (= lt!254266 (select (arr!16894 a!3118) lt!254143))))

(assert (=> d!83649 (validMask!0 mask!3119)))

(assert (=> d!83649 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254143 (select (arr!16894 a!3118) j!142) a!3118 mask!3119) lt!254265)))

(declare-fun b!559695 () Bool)

(declare-fun e!322439 () SeekEntryResult!5340)

(assert (=> b!559695 (= e!322437 e!322439)))

(declare-fun c!64683 () Bool)

(assert (=> b!559695 (= c!64683 (or (= lt!254266 (select (arr!16894 a!3118) j!142)) (= (bvadd lt!254266 lt!254266) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!559696 () Bool)

(assert (=> b!559696 (= e!322437 (Intermediate!5340 true lt!254143 #b00000000000000000000000000000000))))

(declare-fun b!559697 () Bool)

(assert (=> b!559697 (and (bvsge (index!23589 lt!254265) #b00000000000000000000000000000000) (bvslt (index!23589 lt!254265) (size!17259 a!3118)))))

(assert (=> b!559697 (= e!322441 (= (select (arr!16894 a!3118) (index!23589 lt!254265)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!559698 () Bool)

(assert (=> b!559698 (= e!322438 e!322440)))

(declare-fun res!351018 () Bool)

(assert (=> b!559698 (= res!351018 (and (is-Intermediate!5340 lt!254265) (not (undefined!6152 lt!254265)) (bvslt (x!52501 lt!254265) #b01111111111111111111111111111110) (bvsge (x!52501 lt!254265) #b00000000000000000000000000000000) (bvsge (x!52501 lt!254265) #b00000000000000000000000000000000)))))

(assert (=> b!559698 (=> (not res!351018) (not e!322440))))

(declare-fun b!559699 () Bool)

(assert (=> b!559699 (= e!322439 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!254143 #b00000000000000000000000000000000 mask!3119) (select (arr!16894 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!559700 () Bool)

(assert (=> b!559700 (and (bvsge (index!23589 lt!254265) #b00000000000000000000000000000000) (bvslt (index!23589 lt!254265) (size!17259 a!3118)))))

(declare-fun res!351017 () Bool)

(assert (=> b!559700 (= res!351017 (= (select (arr!16894 a!3118) (index!23589 lt!254265)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!559700 (=> res!351017 e!322441)))

(declare-fun b!559701 () Bool)

(assert (=> b!559701 (= e!322439 (Intermediate!5340 false lt!254143 #b00000000000000000000000000000000))))

(assert (= (and d!83649 c!64685) b!559696))

(assert (= (and d!83649 (not c!64685)) b!559695))

(assert (= (and b!559695 c!64683) b!559701))

(assert (= (and b!559695 (not c!64683)) b!559699))

(assert (= (and d!83649 c!64684) b!559694))

(assert (= (and d!83649 (not c!64684)) b!559698))

(assert (= (and b!559698 res!351018) b!559693))

(assert (= (and b!559693 (not res!351019)) b!559700))

(assert (= (and b!559700 (not res!351017)) b!559697))

(declare-fun m!536961 () Bool)

(assert (=> b!559693 m!536961))

(declare-fun m!536963 () Bool)

(assert (=> b!559699 m!536963))

(assert (=> b!559699 m!536963))

(assert (=> b!559699 m!536725))

(declare-fun m!536965 () Bool)

(assert (=> b!559699 m!536965))

(declare-fun m!536967 () Bool)

(assert (=> d!83649 m!536967))

(assert (=> d!83649 m!536737))

(assert (=> b!559697 m!536961))

(assert (=> b!559700 m!536961))

(assert (=> b!559390 d!83649))

(declare-fun d!83651 () Bool)

(declare-fun lt!254276 () (_ BitVec 32))

(declare-fun lt!254275 () (_ BitVec 32))

(assert (=> d!83651 (= lt!254276 (bvmul (bvxor lt!254275 (bvlshr lt!254275 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83651 (= lt!254275 ((_ extract 31 0) (bvand (bvxor lt!254142 (bvlshr lt!254142 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83651 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!351020 (let ((h!12011 ((_ extract 31 0) (bvand (bvxor lt!254142 (bvlshr lt!254142 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52508 (bvmul (bvxor h!12011 (bvlshr h!12011 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52508 (bvlshr x!52508 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!351020 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!351020 #b00000000000000000000000000000000))))))

(assert (=> d!83651 (= (toIndex!0 lt!254142 mask!3119) (bvand (bvxor lt!254276 (bvlshr lt!254276 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!559390 d!83651))

(declare-fun d!83653 () Bool)

(declare-fun lt!254278 () (_ BitVec 32))

(declare-fun lt!254277 () (_ BitVec 32))

(assert (=> d!83653 (= lt!254278 (bvmul (bvxor lt!254277 (bvlshr lt!254277 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83653 (= lt!254277 ((_ extract 31 0) (bvand (bvxor (select (arr!16894 a!3118) j!142) (bvlshr (select (arr!16894 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83653 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!351020 (let ((h!12011 ((_ extract 31 0) (bvand (bvxor (select (arr!16894 a!3118) j!142) (bvlshr (select (arr!16894 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52508 (bvmul (bvxor h!12011 (bvlshr h!12011 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52508 (bvlshr x!52508 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!351020 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!351020 #b00000000000000000000000000000000))))))

(assert (=> d!83653 (= (toIndex!0 (select (arr!16894 a!3118) j!142) mask!3119) (bvand (bvxor lt!254278 (bvlshr lt!254278 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!559390 d!83653))

(push 1)

(assert (not b!559448))

(assert (not d!83605))

(assert (not b!559591))

(assert (not bm!32423))

(assert (not b!559470))

(assert (not b!559535))

(assert (not b!559549))

(assert (not b!559469))

(assert (not b!559467))

(assert (not d!83649))

(assert (not bm!32421))

(assert (not b!559583))

(assert (not b!559622))

(assert (not bm!32410))

(assert (not d!83637))

(assert (not b!559699))

(assert (not b!559592))

(assert (not d!83597))

(assert (not d!83575))

(assert (not b!559690))

(assert (not d!83615))

(assert (not b!559584))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

