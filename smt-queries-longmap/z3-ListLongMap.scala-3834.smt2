; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52676 () Bool)

(assert start!52676)

(declare-fun b!574390 () Bool)

(declare-fun e!330461 () Bool)

(declare-fun e!330463 () Bool)

(assert (=> b!574390 (= e!330461 e!330463)))

(declare-fun res!363221 () Bool)

(assert (=> b!574390 (=> (not res!363221) (not e!330463))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!262239 () (_ BitVec 64))

(declare-datatypes ((array!35893 0))(
  ( (array!35894 (arr!17231 (Array (_ BitVec 32) (_ BitVec 64))) (size!17596 (_ BitVec 32))) )
))
(declare-fun lt!262237 () array!35893)

(declare-fun lt!262235 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5677 0))(
  ( (MissingZero!5677 (index!24935 (_ BitVec 32))) (Found!5677 (index!24936 (_ BitVec 32))) (Intermediate!5677 (undefined!6489 Bool) (index!24937 (_ BitVec 32)) (x!53832 (_ BitVec 32))) (Undefined!5677) (MissingVacant!5677 (index!24938 (_ BitVec 32))) )
))
(declare-fun lt!262238 () SeekEntryResult!5677)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35893 (_ BitVec 32)) SeekEntryResult!5677)

(assert (=> b!574390 (= res!363221 (= lt!262238 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262235 lt!262239 lt!262237 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!262242 () (_ BitVec 32))

(declare-fun a!3118 () array!35893)

(assert (=> b!574390 (= lt!262238 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262242 (select (arr!17231 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!574390 (= lt!262235 (toIndex!0 lt!262239 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!574390 (= lt!262239 (select (store (arr!17231 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!574390 (= lt!262242 (toIndex!0 (select (arr!17231 a!3118) j!142) mask!3119))))

(assert (=> b!574390 (= lt!262237 (array!35894 (store (arr!17231 a!3118) i!1132 k0!1914) (size!17596 a!3118)))))

(declare-fun e!330464 () Bool)

(declare-fun b!574391 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35893 (_ BitVec 32)) SeekEntryResult!5677)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35893 (_ BitVec 32)) SeekEntryResult!5677)

(assert (=> b!574391 (= e!330464 (= (seekEntryOrOpen!0 lt!262239 lt!262237 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53832 lt!262238) (index!24937 lt!262238) (index!24937 lt!262238) lt!262239 lt!262237 mask!3119)))))

(declare-fun b!574392 () Bool)

(declare-fun res!363232 () Bool)

(declare-fun e!330459 () Bool)

(assert (=> b!574392 (=> (not res!363232) (not e!330459))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!574392 (= res!363232 (validKeyInArray!0 (select (arr!17231 a!3118) j!142)))))

(declare-fun b!574393 () Bool)

(declare-fun e!330462 () Bool)

(assert (=> b!574393 (= e!330462 e!330464)))

(declare-fun res!363233 () Bool)

(assert (=> b!574393 (=> (not res!363233) (not e!330464))))

(declare-fun lt!262236 () SeekEntryResult!5677)

(assert (=> b!574393 (= res!363233 (= lt!262236 (seekKeyOrZeroReturnVacant!0 (x!53832 lt!262238) (index!24937 lt!262238) (index!24937 lt!262238) (select (arr!17231 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!574394 () Bool)

(declare-fun res!363226 () Bool)

(assert (=> b!574394 (=> (not res!363226) (not e!330461))))

(declare-datatypes ((List!11350 0))(
  ( (Nil!11347) (Cons!11346 (h!12382 (_ BitVec 64)) (t!17569 List!11350)) )
))
(declare-fun arrayNoDuplicates!0 (array!35893 (_ BitVec 32) List!11350) Bool)

(assert (=> b!574394 (= res!363226 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11347))))

(declare-fun b!574395 () Bool)

(declare-fun e!330465 () Bool)

(assert (=> b!574395 (= e!330465 e!330462)))

(declare-fun res!363224 () Bool)

(assert (=> b!574395 (=> res!363224 e!330462)))

(declare-fun lt!262243 () (_ BitVec 64))

(assert (=> b!574395 (= res!363224 (or (= lt!262243 (select (arr!17231 a!3118) j!142)) (= lt!262243 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!574395 (= lt!262243 (select (arr!17231 a!3118) (index!24937 lt!262238)))))

(declare-fun res!363230 () Bool)

(assert (=> start!52676 (=> (not res!363230) (not e!330459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52676 (= res!363230 (validMask!0 mask!3119))))

(assert (=> start!52676 e!330459))

(assert (=> start!52676 true))

(declare-fun array_inv!13114 (array!35893) Bool)

(assert (=> start!52676 (array_inv!13114 a!3118)))

(declare-fun b!574396 () Bool)

(get-info :version)

(assert (=> b!574396 (= e!330463 (not (or (undefined!6489 lt!262238) (not ((_ is Intermediate!5677) lt!262238)) (let ((bdg!18025 (select (arr!17231 a!3118) (index!24937 lt!262238)))) (or (= bdg!18025 (select (arr!17231 a!3118) j!142)) (= bdg!18025 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt (index!24937 lt!262238) #b00000000000000000000000000000000) (bvsge (index!24937 lt!262238) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53832 lt!262238) #b01111111111111111111111111111110) (bvslt (x!53832 lt!262238) #b00000000000000000000000000000000) (not (= bdg!18025 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (store (arr!17231 a!3118) i!1132 k0!1914) (index!24937 lt!262238)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!330460 () Bool)

(assert (=> b!574396 e!330460))

(declare-fun res!363223 () Bool)

(assert (=> b!574396 (=> (not res!363223) (not e!330460))))

(assert (=> b!574396 (= res!363223 (= lt!262236 (Found!5677 j!142)))))

(assert (=> b!574396 (= lt!262236 (seekEntryOrOpen!0 (select (arr!17231 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35893 (_ BitVec 32)) Bool)

(assert (=> b!574396 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18042 0))(
  ( (Unit!18043) )
))
(declare-fun lt!262241 () Unit!18042)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35893 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18042)

(assert (=> b!574396 (= lt!262241 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!574397 () Bool)

(assert (=> b!574397 (= e!330460 e!330465)))

(declare-fun res!363229 () Bool)

(assert (=> b!574397 (=> res!363229 e!330465)))

(assert (=> b!574397 (= res!363229 (or (undefined!6489 lt!262238) (not ((_ is Intermediate!5677) lt!262238))))))

(declare-fun b!574398 () Bool)

(declare-fun res!363225 () Bool)

(assert (=> b!574398 (=> (not res!363225) (not e!330459))))

(assert (=> b!574398 (= res!363225 (and (= (size!17596 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17596 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17596 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!574399 () Bool)

(declare-fun res!363228 () Bool)

(assert (=> b!574399 (=> (not res!363228) (not e!330459))))

(assert (=> b!574399 (= res!363228 (validKeyInArray!0 k0!1914))))

(declare-fun b!574400 () Bool)

(assert (=> b!574400 (= e!330459 e!330461)))

(declare-fun res!363231 () Bool)

(assert (=> b!574400 (=> (not res!363231) (not e!330461))))

(declare-fun lt!262240 () SeekEntryResult!5677)

(assert (=> b!574400 (= res!363231 (or (= lt!262240 (MissingZero!5677 i!1132)) (= lt!262240 (MissingVacant!5677 i!1132))))))

(assert (=> b!574400 (= lt!262240 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!574401 () Bool)

(declare-fun res!363222 () Bool)

(assert (=> b!574401 (=> (not res!363222) (not e!330459))))

(declare-fun arrayContainsKey!0 (array!35893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!574401 (= res!363222 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!574402 () Bool)

(declare-fun res!363227 () Bool)

(assert (=> b!574402 (=> (not res!363227) (not e!330461))))

(assert (=> b!574402 (= res!363227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!52676 res!363230) b!574398))

(assert (= (and b!574398 res!363225) b!574392))

(assert (= (and b!574392 res!363232) b!574399))

(assert (= (and b!574399 res!363228) b!574401))

(assert (= (and b!574401 res!363222) b!574400))

(assert (= (and b!574400 res!363231) b!574402))

(assert (= (and b!574402 res!363227) b!574394))

(assert (= (and b!574394 res!363226) b!574390))

(assert (= (and b!574390 res!363221) b!574396))

(assert (= (and b!574396 res!363223) b!574397))

(assert (= (and b!574397 (not res!363229)) b!574395))

(assert (= (and b!574395 (not res!363224)) b!574393))

(assert (= (and b!574393 res!363233) b!574391))

(declare-fun m!552725 () Bool)

(assert (=> b!574393 m!552725))

(assert (=> b!574393 m!552725))

(declare-fun m!552727 () Bool)

(assert (=> b!574393 m!552727))

(assert (=> b!574395 m!552725))

(declare-fun m!552729 () Bool)

(assert (=> b!574395 m!552729))

(assert (=> b!574392 m!552725))

(assert (=> b!574392 m!552725))

(declare-fun m!552731 () Bool)

(assert (=> b!574392 m!552731))

(declare-fun m!552733 () Bool)

(assert (=> b!574391 m!552733))

(declare-fun m!552735 () Bool)

(assert (=> b!574391 m!552735))

(declare-fun m!552737 () Bool)

(assert (=> b!574401 m!552737))

(declare-fun m!552739 () Bool)

(assert (=> b!574394 m!552739))

(declare-fun m!552741 () Bool)

(assert (=> b!574402 m!552741))

(assert (=> b!574396 m!552729))

(assert (=> b!574396 m!552725))

(declare-fun m!552743 () Bool)

(assert (=> b!574396 m!552743))

(declare-fun m!552745 () Bool)

(assert (=> b!574396 m!552745))

(declare-fun m!552747 () Bool)

(assert (=> b!574396 m!552747))

(declare-fun m!552749 () Bool)

(assert (=> b!574396 m!552749))

(assert (=> b!574396 m!552725))

(declare-fun m!552751 () Bool)

(assert (=> b!574396 m!552751))

(declare-fun m!552753 () Bool)

(assert (=> start!52676 m!552753))

(declare-fun m!552755 () Bool)

(assert (=> start!52676 m!552755))

(assert (=> b!574390 m!552725))

(declare-fun m!552757 () Bool)

(assert (=> b!574390 m!552757))

(declare-fun m!552759 () Bool)

(assert (=> b!574390 m!552759))

(assert (=> b!574390 m!552725))

(declare-fun m!552761 () Bool)

(assert (=> b!574390 m!552761))

(assert (=> b!574390 m!552725))

(declare-fun m!552763 () Bool)

(assert (=> b!574390 m!552763))

(declare-fun m!552765 () Bool)

(assert (=> b!574390 m!552765))

(assert (=> b!574390 m!552747))

(declare-fun m!552767 () Bool)

(assert (=> b!574399 m!552767))

(declare-fun m!552769 () Bool)

(assert (=> b!574400 m!552769))

(check-sat (not b!574394) (not b!574393) (not b!574396) (not start!52676) (not b!574391) (not b!574402) (not b!574399) (not b!574401) (not b!574392) (not b!574400) (not b!574390))
(check-sat)
(get-model)

(declare-fun b!574491 () Bool)

(declare-fun e!330522 () Bool)

(declare-fun contains!2872 (List!11350 (_ BitVec 64)) Bool)

(assert (=> b!574491 (= e!330522 (contains!2872 Nil!11347 (select (arr!17231 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!574493 () Bool)

(declare-fun e!330524 () Bool)

(declare-fun call!32665 () Bool)

(assert (=> b!574493 (= e!330524 call!32665)))

(declare-fun b!574494 () Bool)

(declare-fun e!330523 () Bool)

(assert (=> b!574494 (= e!330523 e!330524)))

(declare-fun c!65949 () Bool)

(assert (=> b!574494 (= c!65949 (validKeyInArray!0 (select (arr!17231 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!574495 () Bool)

(declare-fun e!330525 () Bool)

(assert (=> b!574495 (= e!330525 e!330523)))

(declare-fun res!363319 () Bool)

(assert (=> b!574495 (=> (not res!363319) (not e!330523))))

(assert (=> b!574495 (= res!363319 (not e!330522))))

(declare-fun res!363318 () Bool)

(assert (=> b!574495 (=> (not res!363318) (not e!330522))))

(assert (=> b!574495 (= res!363318 (validKeyInArray!0 (select (arr!17231 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32662 () Bool)

(assert (=> bm!32662 (= call!32665 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65949 (Cons!11346 (select (arr!17231 a!3118) #b00000000000000000000000000000000) Nil!11347) Nil!11347)))))

(declare-fun d!84973 () Bool)

(declare-fun res!363320 () Bool)

(assert (=> d!84973 (=> res!363320 e!330525)))

(assert (=> d!84973 (= res!363320 (bvsge #b00000000000000000000000000000000 (size!17596 a!3118)))))

(assert (=> d!84973 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11347) e!330525)))

(declare-fun b!574492 () Bool)

(assert (=> b!574492 (= e!330524 call!32665)))

(assert (= (and d!84973 (not res!363320)) b!574495))

(assert (= (and b!574495 res!363318) b!574491))

(assert (= (and b!574495 res!363319) b!574494))

(assert (= (and b!574494 c!65949) b!574493))

(assert (= (and b!574494 (not c!65949)) b!574492))

(assert (= (or b!574493 b!574492) bm!32662))

(declare-fun m!552863 () Bool)

(assert (=> b!574491 m!552863))

(assert (=> b!574491 m!552863))

(declare-fun m!552865 () Bool)

(assert (=> b!574491 m!552865))

(assert (=> b!574494 m!552863))

(assert (=> b!574494 m!552863))

(declare-fun m!552867 () Bool)

(assert (=> b!574494 m!552867))

(assert (=> b!574495 m!552863))

(assert (=> b!574495 m!552863))

(assert (=> b!574495 m!552867))

(assert (=> bm!32662 m!552863))

(declare-fun m!552869 () Bool)

(assert (=> bm!32662 m!552869))

(assert (=> b!574394 d!84973))

(declare-fun d!84975 () Bool)

(assert (=> d!84975 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!574399 d!84975))

(declare-fun d!84977 () Bool)

(assert (=> d!84977 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52676 d!84977))

(declare-fun d!84979 () Bool)

(assert (=> d!84979 (= (array_inv!13114 a!3118) (bvsge (size!17596 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52676 d!84979))

(declare-fun b!574508 () Bool)

(declare-fun e!330533 () SeekEntryResult!5677)

(assert (=> b!574508 (= e!330533 (MissingVacant!5677 (index!24937 lt!262238)))))

(declare-fun b!574509 () Bool)

(declare-fun e!330532 () SeekEntryResult!5677)

(declare-fun e!330534 () SeekEntryResult!5677)

(assert (=> b!574509 (= e!330532 e!330534)))

(declare-fun lt!262302 () (_ BitVec 64))

(declare-fun c!65956 () Bool)

(assert (=> b!574509 (= c!65956 (= lt!262302 (select (arr!17231 a!3118) j!142)))))

(declare-fun lt!262303 () SeekEntryResult!5677)

(declare-fun d!84981 () Bool)

(assert (=> d!84981 (and (or ((_ is Undefined!5677) lt!262303) (not ((_ is Found!5677) lt!262303)) (and (bvsge (index!24936 lt!262303) #b00000000000000000000000000000000) (bvslt (index!24936 lt!262303) (size!17596 a!3118)))) (or ((_ is Undefined!5677) lt!262303) ((_ is Found!5677) lt!262303) (not ((_ is MissingVacant!5677) lt!262303)) (not (= (index!24938 lt!262303) (index!24937 lt!262238))) (and (bvsge (index!24938 lt!262303) #b00000000000000000000000000000000) (bvslt (index!24938 lt!262303) (size!17596 a!3118)))) (or ((_ is Undefined!5677) lt!262303) (ite ((_ is Found!5677) lt!262303) (= (select (arr!17231 a!3118) (index!24936 lt!262303)) (select (arr!17231 a!3118) j!142)) (and ((_ is MissingVacant!5677) lt!262303) (= (index!24938 lt!262303) (index!24937 lt!262238)) (= (select (arr!17231 a!3118) (index!24938 lt!262303)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!84981 (= lt!262303 e!330532)))

(declare-fun c!65958 () Bool)

(assert (=> d!84981 (= c!65958 (bvsge (x!53832 lt!262238) #b01111111111111111111111111111110))))

(assert (=> d!84981 (= lt!262302 (select (arr!17231 a!3118) (index!24937 lt!262238)))))

(assert (=> d!84981 (validMask!0 mask!3119)))

(assert (=> d!84981 (= (seekKeyOrZeroReturnVacant!0 (x!53832 lt!262238) (index!24937 lt!262238) (index!24937 lt!262238) (select (arr!17231 a!3118) j!142) a!3118 mask!3119) lt!262303)))

(declare-fun b!574510 () Bool)

(declare-fun c!65957 () Bool)

(assert (=> b!574510 (= c!65957 (= lt!262302 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!574510 (= e!330534 e!330533)))

(declare-fun b!574511 () Bool)

(assert (=> b!574511 (= e!330532 Undefined!5677)))

(declare-fun b!574512 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!574512 (= e!330533 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53832 lt!262238) #b00000000000000000000000000000001) (nextIndex!0 (index!24937 lt!262238) (x!53832 lt!262238) mask!3119) (index!24937 lt!262238) (select (arr!17231 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!574513 () Bool)

(assert (=> b!574513 (= e!330534 (Found!5677 (index!24937 lt!262238)))))

(assert (= (and d!84981 c!65958) b!574511))

(assert (= (and d!84981 (not c!65958)) b!574509))

(assert (= (and b!574509 c!65956) b!574513))

(assert (= (and b!574509 (not c!65956)) b!574510))

(assert (= (and b!574510 c!65957) b!574508))

(assert (= (and b!574510 (not c!65957)) b!574512))

(declare-fun m!552871 () Bool)

(assert (=> d!84981 m!552871))

(declare-fun m!552873 () Bool)

(assert (=> d!84981 m!552873))

(assert (=> d!84981 m!552729))

(assert (=> d!84981 m!552753))

(declare-fun m!552875 () Bool)

(assert (=> b!574512 m!552875))

(assert (=> b!574512 m!552875))

(assert (=> b!574512 m!552725))

(declare-fun m!552877 () Bool)

(assert (=> b!574512 m!552877))

(assert (=> b!574393 d!84981))

(declare-fun d!84983 () Bool)

(assert (=> d!84983 (= (validKeyInArray!0 (select (arr!17231 a!3118) j!142)) (and (not (= (select (arr!17231 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17231 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!574392 d!84983))

(declare-fun b!574522 () Bool)

(declare-fun e!330541 () Bool)

(declare-fun e!330542 () Bool)

(assert (=> b!574522 (= e!330541 e!330542)))

(declare-fun c!65961 () Bool)

(assert (=> b!574522 (= c!65961 (validKeyInArray!0 (select (arr!17231 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!84985 () Bool)

(declare-fun res!363326 () Bool)

(assert (=> d!84985 (=> res!363326 e!330541)))

(assert (=> d!84985 (= res!363326 (bvsge #b00000000000000000000000000000000 (size!17596 a!3118)))))

(assert (=> d!84985 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!330541)))

(declare-fun bm!32665 () Bool)

(declare-fun call!32668 () Bool)

(assert (=> bm!32665 (= call!32668 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!574523 () Bool)

(declare-fun e!330543 () Bool)

(assert (=> b!574523 (= e!330543 call!32668)))

(declare-fun b!574524 () Bool)

(assert (=> b!574524 (= e!330542 e!330543)))

(declare-fun lt!262312 () (_ BitVec 64))

(assert (=> b!574524 (= lt!262312 (select (arr!17231 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!262311 () Unit!18042)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35893 (_ BitVec 64) (_ BitVec 32)) Unit!18042)

(assert (=> b!574524 (= lt!262311 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!262312 #b00000000000000000000000000000000))))

(assert (=> b!574524 (arrayContainsKey!0 a!3118 lt!262312 #b00000000000000000000000000000000)))

(declare-fun lt!262310 () Unit!18042)

(assert (=> b!574524 (= lt!262310 lt!262311)))

(declare-fun res!363325 () Bool)

(assert (=> b!574524 (= res!363325 (= (seekEntryOrOpen!0 (select (arr!17231 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5677 #b00000000000000000000000000000000)))))

(assert (=> b!574524 (=> (not res!363325) (not e!330543))))

(declare-fun b!574525 () Bool)

(assert (=> b!574525 (= e!330542 call!32668)))

(assert (= (and d!84985 (not res!363326)) b!574522))

(assert (= (and b!574522 c!65961) b!574524))

(assert (= (and b!574522 (not c!65961)) b!574525))

(assert (= (and b!574524 res!363325) b!574523))

(assert (= (or b!574523 b!574525) bm!32665))

(assert (=> b!574522 m!552863))

(assert (=> b!574522 m!552863))

(assert (=> b!574522 m!552867))

(declare-fun m!552879 () Bool)

(assert (=> bm!32665 m!552879))

(assert (=> b!574524 m!552863))

(declare-fun m!552881 () Bool)

(assert (=> b!574524 m!552881))

(declare-fun m!552883 () Bool)

(assert (=> b!574524 m!552883))

(assert (=> b!574524 m!552863))

(declare-fun m!552885 () Bool)

(assert (=> b!574524 m!552885))

(assert (=> b!574402 d!84985))

(declare-fun d!84991 () Bool)

(declare-fun lt!262321 () SeekEntryResult!5677)

(assert (=> d!84991 (and (or ((_ is Undefined!5677) lt!262321) (not ((_ is Found!5677) lt!262321)) (and (bvsge (index!24936 lt!262321) #b00000000000000000000000000000000) (bvslt (index!24936 lt!262321) (size!17596 lt!262237)))) (or ((_ is Undefined!5677) lt!262321) ((_ is Found!5677) lt!262321) (not ((_ is MissingZero!5677) lt!262321)) (and (bvsge (index!24935 lt!262321) #b00000000000000000000000000000000) (bvslt (index!24935 lt!262321) (size!17596 lt!262237)))) (or ((_ is Undefined!5677) lt!262321) ((_ is Found!5677) lt!262321) ((_ is MissingZero!5677) lt!262321) (not ((_ is MissingVacant!5677) lt!262321)) (and (bvsge (index!24938 lt!262321) #b00000000000000000000000000000000) (bvslt (index!24938 lt!262321) (size!17596 lt!262237)))) (or ((_ is Undefined!5677) lt!262321) (ite ((_ is Found!5677) lt!262321) (= (select (arr!17231 lt!262237) (index!24936 lt!262321)) lt!262239) (ite ((_ is MissingZero!5677) lt!262321) (= (select (arr!17231 lt!262237) (index!24935 lt!262321)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5677) lt!262321) (= (select (arr!17231 lt!262237) (index!24938 lt!262321)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!330558 () SeekEntryResult!5677)

(assert (=> d!84991 (= lt!262321 e!330558)))

(declare-fun c!65970 () Bool)

(declare-fun lt!262320 () SeekEntryResult!5677)

(assert (=> d!84991 (= c!65970 (and ((_ is Intermediate!5677) lt!262320) (undefined!6489 lt!262320)))))

(assert (=> d!84991 (= lt!262320 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!262239 mask!3119) lt!262239 lt!262237 mask!3119))))

(assert (=> d!84991 (validMask!0 mask!3119)))

(assert (=> d!84991 (= (seekEntryOrOpen!0 lt!262239 lt!262237 mask!3119) lt!262321)))

(declare-fun b!574544 () Bool)

(declare-fun e!330556 () SeekEntryResult!5677)

(assert (=> b!574544 (= e!330556 (Found!5677 (index!24937 lt!262320)))))

(declare-fun b!574545 () Bool)

(assert (=> b!574545 (= e!330558 e!330556)))

(declare-fun lt!262319 () (_ BitVec 64))

(assert (=> b!574545 (= lt!262319 (select (arr!17231 lt!262237) (index!24937 lt!262320)))))

(declare-fun c!65968 () Bool)

(assert (=> b!574545 (= c!65968 (= lt!262319 lt!262239))))

(declare-fun b!574546 () Bool)

(declare-fun e!330557 () SeekEntryResult!5677)

(assert (=> b!574546 (= e!330557 (MissingZero!5677 (index!24937 lt!262320)))))

(declare-fun b!574547 () Bool)

(assert (=> b!574547 (= e!330557 (seekKeyOrZeroReturnVacant!0 (x!53832 lt!262320) (index!24937 lt!262320) (index!24937 lt!262320) lt!262239 lt!262237 mask!3119))))

(declare-fun b!574548 () Bool)

(assert (=> b!574548 (= e!330558 Undefined!5677)))

(declare-fun b!574549 () Bool)

(declare-fun c!65969 () Bool)

(assert (=> b!574549 (= c!65969 (= lt!262319 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!574549 (= e!330556 e!330557)))

(assert (= (and d!84991 c!65970) b!574548))

(assert (= (and d!84991 (not c!65970)) b!574545))

(assert (= (and b!574545 c!65968) b!574544))

(assert (= (and b!574545 (not c!65968)) b!574549))

(assert (= (and b!574549 c!65969) b!574546))

(assert (= (and b!574549 (not c!65969)) b!574547))

(declare-fun m!552891 () Bool)

(assert (=> d!84991 m!552891))

(assert (=> d!84991 m!552765))

(declare-fun m!552893 () Bool)

(assert (=> d!84991 m!552893))

(assert (=> d!84991 m!552753))

(declare-fun m!552895 () Bool)

(assert (=> d!84991 m!552895))

(assert (=> d!84991 m!552765))

(declare-fun m!552897 () Bool)

(assert (=> d!84991 m!552897))

(declare-fun m!552899 () Bool)

(assert (=> b!574545 m!552899))

(declare-fun m!552901 () Bool)

(assert (=> b!574547 m!552901))

(assert (=> b!574391 d!84991))

(declare-fun b!574550 () Bool)

(declare-fun e!330560 () SeekEntryResult!5677)

(assert (=> b!574550 (= e!330560 (MissingVacant!5677 (index!24937 lt!262238)))))

(declare-fun b!574551 () Bool)

(declare-fun e!330559 () SeekEntryResult!5677)

(declare-fun e!330561 () SeekEntryResult!5677)

(assert (=> b!574551 (= e!330559 e!330561)))

(declare-fun c!65971 () Bool)

(declare-fun lt!262322 () (_ BitVec 64))

(assert (=> b!574551 (= c!65971 (= lt!262322 lt!262239))))

(declare-fun d!85005 () Bool)

(declare-fun lt!262323 () SeekEntryResult!5677)

(assert (=> d!85005 (and (or ((_ is Undefined!5677) lt!262323) (not ((_ is Found!5677) lt!262323)) (and (bvsge (index!24936 lt!262323) #b00000000000000000000000000000000) (bvslt (index!24936 lt!262323) (size!17596 lt!262237)))) (or ((_ is Undefined!5677) lt!262323) ((_ is Found!5677) lt!262323) (not ((_ is MissingVacant!5677) lt!262323)) (not (= (index!24938 lt!262323) (index!24937 lt!262238))) (and (bvsge (index!24938 lt!262323) #b00000000000000000000000000000000) (bvslt (index!24938 lt!262323) (size!17596 lt!262237)))) (or ((_ is Undefined!5677) lt!262323) (ite ((_ is Found!5677) lt!262323) (= (select (arr!17231 lt!262237) (index!24936 lt!262323)) lt!262239) (and ((_ is MissingVacant!5677) lt!262323) (= (index!24938 lt!262323) (index!24937 lt!262238)) (= (select (arr!17231 lt!262237) (index!24938 lt!262323)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!85005 (= lt!262323 e!330559)))

(declare-fun c!65973 () Bool)

(assert (=> d!85005 (= c!65973 (bvsge (x!53832 lt!262238) #b01111111111111111111111111111110))))

(assert (=> d!85005 (= lt!262322 (select (arr!17231 lt!262237) (index!24937 lt!262238)))))

(assert (=> d!85005 (validMask!0 mask!3119)))

(assert (=> d!85005 (= (seekKeyOrZeroReturnVacant!0 (x!53832 lt!262238) (index!24937 lt!262238) (index!24937 lt!262238) lt!262239 lt!262237 mask!3119) lt!262323)))

(declare-fun b!574552 () Bool)

(declare-fun c!65972 () Bool)

(assert (=> b!574552 (= c!65972 (= lt!262322 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!574552 (= e!330561 e!330560)))

(declare-fun b!574553 () Bool)

(assert (=> b!574553 (= e!330559 Undefined!5677)))

(declare-fun b!574554 () Bool)

(assert (=> b!574554 (= e!330560 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53832 lt!262238) #b00000000000000000000000000000001) (nextIndex!0 (index!24937 lt!262238) (x!53832 lt!262238) mask!3119) (index!24937 lt!262238) lt!262239 lt!262237 mask!3119))))

(declare-fun b!574555 () Bool)

(assert (=> b!574555 (= e!330561 (Found!5677 (index!24937 lt!262238)))))

(assert (= (and d!85005 c!65973) b!574553))

(assert (= (and d!85005 (not c!65973)) b!574551))

(assert (= (and b!574551 c!65971) b!574555))

(assert (= (and b!574551 (not c!65971)) b!574552))

(assert (= (and b!574552 c!65972) b!574550))

(assert (= (and b!574552 (not c!65972)) b!574554))

(declare-fun m!552903 () Bool)

(assert (=> d!85005 m!552903))

(declare-fun m!552905 () Bool)

(assert (=> d!85005 m!552905))

(declare-fun m!552907 () Bool)

(assert (=> d!85005 m!552907))

(assert (=> d!85005 m!552753))

(assert (=> b!574554 m!552875))

(assert (=> b!574554 m!552875))

(declare-fun m!552909 () Bool)

(assert (=> b!574554 m!552909))

(assert (=> b!574391 d!85005))

(declare-fun d!85007 () Bool)

(declare-fun lt!262326 () SeekEntryResult!5677)

(assert (=> d!85007 (and (or ((_ is Undefined!5677) lt!262326) (not ((_ is Found!5677) lt!262326)) (and (bvsge (index!24936 lt!262326) #b00000000000000000000000000000000) (bvslt (index!24936 lt!262326) (size!17596 a!3118)))) (or ((_ is Undefined!5677) lt!262326) ((_ is Found!5677) lt!262326) (not ((_ is MissingZero!5677) lt!262326)) (and (bvsge (index!24935 lt!262326) #b00000000000000000000000000000000) (bvslt (index!24935 lt!262326) (size!17596 a!3118)))) (or ((_ is Undefined!5677) lt!262326) ((_ is Found!5677) lt!262326) ((_ is MissingZero!5677) lt!262326) (not ((_ is MissingVacant!5677) lt!262326)) (and (bvsge (index!24938 lt!262326) #b00000000000000000000000000000000) (bvslt (index!24938 lt!262326) (size!17596 a!3118)))) (or ((_ is Undefined!5677) lt!262326) (ite ((_ is Found!5677) lt!262326) (= (select (arr!17231 a!3118) (index!24936 lt!262326)) (select (arr!17231 a!3118) j!142)) (ite ((_ is MissingZero!5677) lt!262326) (= (select (arr!17231 a!3118) (index!24935 lt!262326)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5677) lt!262326) (= (select (arr!17231 a!3118) (index!24938 lt!262326)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!330564 () SeekEntryResult!5677)

(assert (=> d!85007 (= lt!262326 e!330564)))

(declare-fun c!65976 () Bool)

(declare-fun lt!262325 () SeekEntryResult!5677)

(assert (=> d!85007 (= c!65976 (and ((_ is Intermediate!5677) lt!262325) (undefined!6489 lt!262325)))))

(assert (=> d!85007 (= lt!262325 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17231 a!3118) j!142) mask!3119) (select (arr!17231 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!85007 (validMask!0 mask!3119)))

(assert (=> d!85007 (= (seekEntryOrOpen!0 (select (arr!17231 a!3118) j!142) a!3118 mask!3119) lt!262326)))

(declare-fun b!574556 () Bool)

(declare-fun e!330562 () SeekEntryResult!5677)

(assert (=> b!574556 (= e!330562 (Found!5677 (index!24937 lt!262325)))))

(declare-fun b!574557 () Bool)

(assert (=> b!574557 (= e!330564 e!330562)))

(declare-fun lt!262324 () (_ BitVec 64))

(assert (=> b!574557 (= lt!262324 (select (arr!17231 a!3118) (index!24937 lt!262325)))))

(declare-fun c!65974 () Bool)

(assert (=> b!574557 (= c!65974 (= lt!262324 (select (arr!17231 a!3118) j!142)))))

(declare-fun b!574558 () Bool)

(declare-fun e!330563 () SeekEntryResult!5677)

(assert (=> b!574558 (= e!330563 (MissingZero!5677 (index!24937 lt!262325)))))

(declare-fun b!574559 () Bool)

(assert (=> b!574559 (= e!330563 (seekKeyOrZeroReturnVacant!0 (x!53832 lt!262325) (index!24937 lt!262325) (index!24937 lt!262325) (select (arr!17231 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!574560 () Bool)

(assert (=> b!574560 (= e!330564 Undefined!5677)))

(declare-fun b!574561 () Bool)

(declare-fun c!65975 () Bool)

(assert (=> b!574561 (= c!65975 (= lt!262324 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!574561 (= e!330562 e!330563)))

(assert (= (and d!85007 c!65976) b!574560))

(assert (= (and d!85007 (not c!65976)) b!574557))

(assert (= (and b!574557 c!65974) b!574556))

(assert (= (and b!574557 (not c!65974)) b!574561))

(assert (= (and b!574561 c!65975) b!574558))

(assert (= (and b!574561 (not c!65975)) b!574559))

(declare-fun m!552911 () Bool)

(assert (=> d!85007 m!552911))

(assert (=> d!85007 m!552725))

(assert (=> d!85007 m!552757))

(declare-fun m!552913 () Bool)

(assert (=> d!85007 m!552913))

(assert (=> d!85007 m!552753))

(declare-fun m!552915 () Bool)

(assert (=> d!85007 m!552915))

(assert (=> d!85007 m!552757))

(assert (=> d!85007 m!552725))

(declare-fun m!552917 () Bool)

(assert (=> d!85007 m!552917))

(declare-fun m!552919 () Bool)

(assert (=> b!574557 m!552919))

(assert (=> b!574559 m!552725))

(declare-fun m!552921 () Bool)

(assert (=> b!574559 m!552921))

(assert (=> b!574396 d!85007))

(declare-fun b!574574 () Bool)

(declare-fun e!330571 () Bool)

(declare-fun e!330572 () Bool)

(assert (=> b!574574 (= e!330571 e!330572)))

(declare-fun c!65983 () Bool)

(assert (=> b!574574 (= c!65983 (validKeyInArray!0 (select (arr!17231 a!3118) j!142)))))

(declare-fun d!85009 () Bool)

(declare-fun res!363334 () Bool)

(assert (=> d!85009 (=> res!363334 e!330571)))

(assert (=> d!85009 (= res!363334 (bvsge j!142 (size!17596 a!3118)))))

(assert (=> d!85009 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!330571)))

(declare-fun call!32669 () Bool)

(declare-fun bm!32666 () Bool)

(assert (=> bm!32666 (= call!32669 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!574575 () Bool)

(declare-fun e!330573 () Bool)

(assert (=> b!574575 (= e!330573 call!32669)))

(declare-fun b!574576 () Bool)

(assert (=> b!574576 (= e!330572 e!330573)))

(declare-fun lt!262335 () (_ BitVec 64))

(assert (=> b!574576 (= lt!262335 (select (arr!17231 a!3118) j!142))))

(declare-fun lt!262334 () Unit!18042)

(assert (=> b!574576 (= lt!262334 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!262335 j!142))))

(assert (=> b!574576 (arrayContainsKey!0 a!3118 lt!262335 #b00000000000000000000000000000000)))

(declare-fun lt!262333 () Unit!18042)

(assert (=> b!574576 (= lt!262333 lt!262334)))

(declare-fun res!363333 () Bool)

(assert (=> b!574576 (= res!363333 (= (seekEntryOrOpen!0 (select (arr!17231 a!3118) j!142) a!3118 mask!3119) (Found!5677 j!142)))))

(assert (=> b!574576 (=> (not res!363333) (not e!330573))))

(declare-fun b!574577 () Bool)

(assert (=> b!574577 (= e!330572 call!32669)))

(assert (= (and d!85009 (not res!363334)) b!574574))

(assert (= (and b!574574 c!65983) b!574576))

(assert (= (and b!574574 (not c!65983)) b!574577))

(assert (= (and b!574576 res!363333) b!574575))

(assert (= (or b!574575 b!574577) bm!32666))

(assert (=> b!574574 m!552725))

(assert (=> b!574574 m!552725))

(assert (=> b!574574 m!552731))

(declare-fun m!552923 () Bool)

(assert (=> bm!32666 m!552923))

(assert (=> b!574576 m!552725))

(declare-fun m!552925 () Bool)

(assert (=> b!574576 m!552925))

(declare-fun m!552927 () Bool)

(assert (=> b!574576 m!552927))

(assert (=> b!574576 m!552725))

(assert (=> b!574576 m!552751))

(assert (=> b!574396 d!85009))

(declare-fun d!85011 () Bool)

(assert (=> d!85011 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!262341 () Unit!18042)

(declare-fun choose!38 (array!35893 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18042)

(assert (=> d!85011 (= lt!262341 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!85011 (validMask!0 mask!3119)))

(assert (=> d!85011 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!262341)))

(declare-fun bs!17746 () Bool)

(assert (= bs!17746 d!85011))

(assert (=> bs!17746 m!552745))

(declare-fun m!552941 () Bool)

(assert (=> bs!17746 m!552941))

(assert (=> bs!17746 m!552753))

(assert (=> b!574396 d!85011))

(declare-fun d!85015 () Bool)

(declare-fun res!363339 () Bool)

(declare-fun e!330581 () Bool)

(assert (=> d!85015 (=> res!363339 e!330581)))

(assert (=> d!85015 (= res!363339 (= (select (arr!17231 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!85015 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!330581)))

(declare-fun b!574588 () Bool)

(declare-fun e!330582 () Bool)

(assert (=> b!574588 (= e!330581 e!330582)))

(declare-fun res!363340 () Bool)

(assert (=> b!574588 (=> (not res!363340) (not e!330582))))

(assert (=> b!574588 (= res!363340 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17596 a!3118)))))

(declare-fun b!574589 () Bool)

(assert (=> b!574589 (= e!330582 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!85015 (not res!363339)) b!574588))

(assert (= (and b!574588 res!363340) b!574589))

(assert (=> d!85015 m!552863))

(declare-fun m!552943 () Bool)

(assert (=> b!574589 m!552943))

(assert (=> b!574401 d!85015))

(declare-fun b!574650 () Bool)

(declare-fun lt!262365 () SeekEntryResult!5677)

(assert (=> b!574650 (and (bvsge (index!24937 lt!262365) #b00000000000000000000000000000000) (bvslt (index!24937 lt!262365) (size!17596 lt!262237)))))

(declare-fun res!363349 () Bool)

(assert (=> b!574650 (= res!363349 (= (select (arr!17231 lt!262237) (index!24937 lt!262365)) lt!262239))))

(declare-fun e!330615 () Bool)

(assert (=> b!574650 (=> res!363349 e!330615)))

(declare-fun e!330617 () Bool)

(assert (=> b!574650 (= e!330617 e!330615)))

(declare-fun b!574651 () Bool)

(assert (=> b!574651 (and (bvsge (index!24937 lt!262365) #b00000000000000000000000000000000) (bvslt (index!24937 lt!262365) (size!17596 lt!262237)))))

(declare-fun res!363347 () Bool)

(assert (=> b!574651 (= res!363347 (= (select (arr!17231 lt!262237) (index!24937 lt!262365)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!574651 (=> res!363347 e!330615)))

(declare-fun b!574652 () Bool)

(declare-fun e!330618 () Bool)

(assert (=> b!574652 (= e!330618 e!330617)))

(declare-fun res!363348 () Bool)

(assert (=> b!574652 (= res!363348 (and ((_ is Intermediate!5677) lt!262365) (not (undefined!6489 lt!262365)) (bvslt (x!53832 lt!262365) #b01111111111111111111111111111110) (bvsge (x!53832 lt!262365) #b00000000000000000000000000000000) (bvsge (x!53832 lt!262365) #b00000000000000000000000000000000)))))

(assert (=> b!574652 (=> (not res!363348) (not e!330617))))

(declare-fun b!574653 () Bool)

(declare-fun e!330616 () SeekEntryResult!5677)

(assert (=> b!574653 (= e!330616 (Intermediate!5677 false lt!262235 #b00000000000000000000000000000000))))

(declare-fun d!85017 () Bool)

(assert (=> d!85017 e!330618))

(declare-fun c!66015 () Bool)

(assert (=> d!85017 (= c!66015 (and ((_ is Intermediate!5677) lt!262365) (undefined!6489 lt!262365)))))

(declare-fun e!330614 () SeekEntryResult!5677)

(assert (=> d!85017 (= lt!262365 e!330614)))

(declare-fun c!66014 () Bool)

(assert (=> d!85017 (= c!66014 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!262364 () (_ BitVec 64))

(assert (=> d!85017 (= lt!262364 (select (arr!17231 lt!262237) lt!262235))))

(assert (=> d!85017 (validMask!0 mask!3119)))

(assert (=> d!85017 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262235 lt!262239 lt!262237 mask!3119) lt!262365)))

(declare-fun b!574654 () Bool)

(assert (=> b!574654 (and (bvsge (index!24937 lt!262365) #b00000000000000000000000000000000) (bvslt (index!24937 lt!262365) (size!17596 lt!262237)))))

(assert (=> b!574654 (= e!330615 (= (select (arr!17231 lt!262237) (index!24937 lt!262365)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!574655 () Bool)

(assert (=> b!574655 (= e!330618 (bvsge (x!53832 lt!262365) #b01111111111111111111111111111110))))

(declare-fun b!574656 () Bool)

(assert (=> b!574656 (= e!330616 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!262235 #b00000000000000000000000000000000 mask!3119) lt!262239 lt!262237 mask!3119))))

(declare-fun b!574657 () Bool)

(assert (=> b!574657 (= e!330614 (Intermediate!5677 true lt!262235 #b00000000000000000000000000000000))))

(declare-fun b!574658 () Bool)

(assert (=> b!574658 (= e!330614 e!330616)))

(declare-fun c!66016 () Bool)

(assert (=> b!574658 (= c!66016 (or (= lt!262364 lt!262239) (= (bvadd lt!262364 lt!262364) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!85017 c!66014) b!574657))

(assert (= (and d!85017 (not c!66014)) b!574658))

(assert (= (and b!574658 c!66016) b!574653))

(assert (= (and b!574658 (not c!66016)) b!574656))

(assert (= (and d!85017 c!66015) b!574655))

(assert (= (and d!85017 (not c!66015)) b!574652))

(assert (= (and b!574652 res!363348) b!574650))

(assert (= (and b!574650 (not res!363349)) b!574651))

(assert (= (and b!574651 (not res!363347)) b!574654))

(declare-fun m!552979 () Bool)

(assert (=> b!574650 m!552979))

(assert (=> b!574651 m!552979))

(declare-fun m!552981 () Bool)

(assert (=> d!85017 m!552981))

(assert (=> d!85017 m!552753))

(assert (=> b!574654 m!552979))

(declare-fun m!552983 () Bool)

(assert (=> b!574656 m!552983))

(assert (=> b!574656 m!552983))

(declare-fun m!552985 () Bool)

(assert (=> b!574656 m!552985))

(assert (=> b!574390 d!85017))

(declare-fun b!574659 () Bool)

(declare-fun lt!262371 () SeekEntryResult!5677)

(assert (=> b!574659 (and (bvsge (index!24937 lt!262371) #b00000000000000000000000000000000) (bvslt (index!24937 lt!262371) (size!17596 a!3118)))))

(declare-fun res!363352 () Bool)

(assert (=> b!574659 (= res!363352 (= (select (arr!17231 a!3118) (index!24937 lt!262371)) (select (arr!17231 a!3118) j!142)))))

(declare-fun e!330620 () Bool)

(assert (=> b!574659 (=> res!363352 e!330620)))

(declare-fun e!330622 () Bool)

(assert (=> b!574659 (= e!330622 e!330620)))

(declare-fun b!574660 () Bool)

(assert (=> b!574660 (and (bvsge (index!24937 lt!262371) #b00000000000000000000000000000000) (bvslt (index!24937 lt!262371) (size!17596 a!3118)))))

(declare-fun res!363350 () Bool)

(assert (=> b!574660 (= res!363350 (= (select (arr!17231 a!3118) (index!24937 lt!262371)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!574660 (=> res!363350 e!330620)))

(declare-fun b!574661 () Bool)

(declare-fun e!330623 () Bool)

(assert (=> b!574661 (= e!330623 e!330622)))

(declare-fun res!363351 () Bool)

(assert (=> b!574661 (= res!363351 (and ((_ is Intermediate!5677) lt!262371) (not (undefined!6489 lt!262371)) (bvslt (x!53832 lt!262371) #b01111111111111111111111111111110) (bvsge (x!53832 lt!262371) #b00000000000000000000000000000000) (bvsge (x!53832 lt!262371) #b00000000000000000000000000000000)))))

(assert (=> b!574661 (=> (not res!363351) (not e!330622))))

(declare-fun b!574662 () Bool)

(declare-fun e!330621 () SeekEntryResult!5677)

(assert (=> b!574662 (= e!330621 (Intermediate!5677 false lt!262242 #b00000000000000000000000000000000))))

(declare-fun d!85025 () Bool)

(assert (=> d!85025 e!330623))

(declare-fun c!66018 () Bool)

(assert (=> d!85025 (= c!66018 (and ((_ is Intermediate!5677) lt!262371) (undefined!6489 lt!262371)))))

(declare-fun e!330619 () SeekEntryResult!5677)

(assert (=> d!85025 (= lt!262371 e!330619)))

(declare-fun c!66017 () Bool)

(assert (=> d!85025 (= c!66017 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!262370 () (_ BitVec 64))

(assert (=> d!85025 (= lt!262370 (select (arr!17231 a!3118) lt!262242))))

(assert (=> d!85025 (validMask!0 mask!3119)))

(assert (=> d!85025 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262242 (select (arr!17231 a!3118) j!142) a!3118 mask!3119) lt!262371)))

(declare-fun b!574663 () Bool)

(assert (=> b!574663 (and (bvsge (index!24937 lt!262371) #b00000000000000000000000000000000) (bvslt (index!24937 lt!262371) (size!17596 a!3118)))))

(assert (=> b!574663 (= e!330620 (= (select (arr!17231 a!3118) (index!24937 lt!262371)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!574664 () Bool)

(assert (=> b!574664 (= e!330623 (bvsge (x!53832 lt!262371) #b01111111111111111111111111111110))))

(declare-fun b!574666 () Bool)

(assert (=> b!574666 (= e!330621 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!262242 #b00000000000000000000000000000000 mask!3119) (select (arr!17231 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!574668 () Bool)

(assert (=> b!574668 (= e!330619 (Intermediate!5677 true lt!262242 #b00000000000000000000000000000000))))

(declare-fun b!574669 () Bool)

(assert (=> b!574669 (= e!330619 e!330621)))

(declare-fun c!66019 () Bool)

(assert (=> b!574669 (= c!66019 (or (= lt!262370 (select (arr!17231 a!3118) j!142)) (= (bvadd lt!262370 lt!262370) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!85025 c!66017) b!574668))

(assert (= (and d!85025 (not c!66017)) b!574669))

(assert (= (and b!574669 c!66019) b!574662))

(assert (= (and b!574669 (not c!66019)) b!574666))

(assert (= (and d!85025 c!66018) b!574664))

(assert (= (and d!85025 (not c!66018)) b!574661))

(assert (= (and b!574661 res!363351) b!574659))

(assert (= (and b!574659 (not res!363352)) b!574660))

(assert (= (and b!574660 (not res!363350)) b!574663))

(declare-fun m!552987 () Bool)

(assert (=> b!574659 m!552987))

(assert (=> b!574660 m!552987))

(declare-fun m!552989 () Bool)

(assert (=> d!85025 m!552989))

(assert (=> d!85025 m!552753))

(assert (=> b!574663 m!552987))

(declare-fun m!552991 () Bool)

(assert (=> b!574666 m!552991))

(assert (=> b!574666 m!552991))

(assert (=> b!574666 m!552725))

(declare-fun m!552993 () Bool)

(assert (=> b!574666 m!552993))

(assert (=> b!574390 d!85025))

(declare-fun d!85027 () Bool)

(declare-fun lt!262391 () (_ BitVec 32))

(declare-fun lt!262390 () (_ BitVec 32))

(assert (=> d!85027 (= lt!262391 (bvmul (bvxor lt!262390 (bvlshr lt!262390 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85027 (= lt!262390 ((_ extract 31 0) (bvand (bvxor lt!262239 (bvlshr lt!262239 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85027 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!363357 (let ((h!12385 ((_ extract 31 0) (bvand (bvxor lt!262239 (bvlshr lt!262239 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53839 (bvmul (bvxor h!12385 (bvlshr h!12385 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53839 (bvlshr x!53839 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!363357 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!363357 #b00000000000000000000000000000000))))))

(assert (=> d!85027 (= (toIndex!0 lt!262239 mask!3119) (bvand (bvxor lt!262391 (bvlshr lt!262391 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!574390 d!85027))

(declare-fun d!85035 () Bool)

(declare-fun lt!262393 () (_ BitVec 32))

(declare-fun lt!262392 () (_ BitVec 32))

(assert (=> d!85035 (= lt!262393 (bvmul (bvxor lt!262392 (bvlshr lt!262392 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85035 (= lt!262392 ((_ extract 31 0) (bvand (bvxor (select (arr!17231 a!3118) j!142) (bvlshr (select (arr!17231 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85035 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!363357 (let ((h!12385 ((_ extract 31 0) (bvand (bvxor (select (arr!17231 a!3118) j!142) (bvlshr (select (arr!17231 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53839 (bvmul (bvxor h!12385 (bvlshr h!12385 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53839 (bvlshr x!53839 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!363357 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!363357 #b00000000000000000000000000000000))))))

(assert (=> d!85035 (= (toIndex!0 (select (arr!17231 a!3118) j!142) mask!3119) (bvand (bvxor lt!262393 (bvlshr lt!262393 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!574390 d!85035))

(declare-fun d!85037 () Bool)

(declare-fun lt!262396 () SeekEntryResult!5677)

(assert (=> d!85037 (and (or ((_ is Undefined!5677) lt!262396) (not ((_ is Found!5677) lt!262396)) (and (bvsge (index!24936 lt!262396) #b00000000000000000000000000000000) (bvslt (index!24936 lt!262396) (size!17596 a!3118)))) (or ((_ is Undefined!5677) lt!262396) ((_ is Found!5677) lt!262396) (not ((_ is MissingZero!5677) lt!262396)) (and (bvsge (index!24935 lt!262396) #b00000000000000000000000000000000) (bvslt (index!24935 lt!262396) (size!17596 a!3118)))) (or ((_ is Undefined!5677) lt!262396) ((_ is Found!5677) lt!262396) ((_ is MissingZero!5677) lt!262396) (not ((_ is MissingVacant!5677) lt!262396)) (and (bvsge (index!24938 lt!262396) #b00000000000000000000000000000000) (bvslt (index!24938 lt!262396) (size!17596 a!3118)))) (or ((_ is Undefined!5677) lt!262396) (ite ((_ is Found!5677) lt!262396) (= (select (arr!17231 a!3118) (index!24936 lt!262396)) k0!1914) (ite ((_ is MissingZero!5677) lt!262396) (= (select (arr!17231 a!3118) (index!24935 lt!262396)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5677) lt!262396) (= (select (arr!17231 a!3118) (index!24938 lt!262396)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!330647 () SeekEntryResult!5677)

(assert (=> d!85037 (= lt!262396 e!330647)))

(declare-fun c!66037 () Bool)

(declare-fun lt!262395 () SeekEntryResult!5677)

(assert (=> d!85037 (= c!66037 (and ((_ is Intermediate!5677) lt!262395) (undefined!6489 lt!262395)))))

(assert (=> d!85037 (= lt!262395 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!85037 (validMask!0 mask!3119)))

(assert (=> d!85037 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!262396)))

(declare-fun b!574704 () Bool)

(declare-fun e!330645 () SeekEntryResult!5677)

(assert (=> b!574704 (= e!330645 (Found!5677 (index!24937 lt!262395)))))

(declare-fun b!574705 () Bool)

(assert (=> b!574705 (= e!330647 e!330645)))

(declare-fun lt!262394 () (_ BitVec 64))

(assert (=> b!574705 (= lt!262394 (select (arr!17231 a!3118) (index!24937 lt!262395)))))

(declare-fun c!66035 () Bool)

(assert (=> b!574705 (= c!66035 (= lt!262394 k0!1914))))

(declare-fun b!574706 () Bool)

(declare-fun e!330646 () SeekEntryResult!5677)

(assert (=> b!574706 (= e!330646 (MissingZero!5677 (index!24937 lt!262395)))))

(declare-fun b!574707 () Bool)

(assert (=> b!574707 (= e!330646 (seekKeyOrZeroReturnVacant!0 (x!53832 lt!262395) (index!24937 lt!262395) (index!24937 lt!262395) k0!1914 a!3118 mask!3119))))

(declare-fun b!574708 () Bool)

(assert (=> b!574708 (= e!330647 Undefined!5677)))

(declare-fun b!574709 () Bool)

(declare-fun c!66036 () Bool)

(assert (=> b!574709 (= c!66036 (= lt!262394 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!574709 (= e!330645 e!330646)))

(assert (= (and d!85037 c!66037) b!574708))

(assert (= (and d!85037 (not c!66037)) b!574705))

(assert (= (and b!574705 c!66035) b!574704))

(assert (= (and b!574705 (not c!66035)) b!574709))

(assert (= (and b!574709 c!66036) b!574706))

(assert (= (and b!574709 (not c!66036)) b!574707))

(declare-fun m!553025 () Bool)

(assert (=> d!85037 m!553025))

(declare-fun m!553027 () Bool)

(assert (=> d!85037 m!553027))

(declare-fun m!553029 () Bool)

(assert (=> d!85037 m!553029))

(assert (=> d!85037 m!552753))

(declare-fun m!553031 () Bool)

(assert (=> d!85037 m!553031))

(assert (=> d!85037 m!553027))

(declare-fun m!553033 () Bool)

(assert (=> d!85037 m!553033))

(declare-fun m!553035 () Bool)

(assert (=> b!574705 m!553035))

(declare-fun m!553037 () Bool)

(assert (=> b!574707 m!553037))

(assert (=> b!574400 d!85037))

(check-sat (not bm!32662) (not b!574707) (not b!574589) (not bm!32666) (not d!85011) (not d!85007) (not b!574547) (not b!574494) (not b!574554) (not d!85037) (not b!574522) (not b!574524) (not d!85025) (not b!574491) (not d!85005) (not b!574656) (not b!574559) (not b!574666) (not b!574574) (not d!84991) (not b!574576) (not b!574495) (not bm!32665) (not d!85017) (not b!574512) (not d!84981))
(check-sat)
