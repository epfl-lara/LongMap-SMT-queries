; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128656 () Bool)

(assert start!128656)

(declare-fun b!1508031 () Bool)

(declare-fun res!1028151 () Bool)

(declare-fun e!842508 () Bool)

(assert (=> b!1508031 (=> (not res!1028151) (not e!842508))))

(declare-datatypes ((array!100590 0))(
  ( (array!100591 (arr!48535 (Array (_ BitVec 32) (_ BitVec 64))) (size!49085 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100590)

(declare-datatypes ((List!35018 0))(
  ( (Nil!35015) (Cons!35014 (h!36420 (_ BitVec 64)) (t!49712 List!35018)) )
))
(declare-fun arrayNoDuplicates!0 (array!100590 (_ BitVec 32) List!35018) Bool)

(assert (=> b!1508031 (= res!1028151 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35015))))

(declare-fun b!1508032 () Bool)

(declare-fun res!1028146 () Bool)

(assert (=> b!1508032 (=> (not res!1028146) (not e!842508))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100590 (_ BitVec 32)) Bool)

(assert (=> b!1508032 (= res!1028146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508033 () Bool)

(declare-fun e!842507 () Bool)

(assert (=> b!1508033 (= e!842508 e!842507)))

(declare-fun res!1028147 () Bool)

(assert (=> b!1508033 (=> (not res!1028147) (not e!842507))))

(declare-datatypes ((SeekEntryResult!12706 0))(
  ( (MissingZero!12706 (index!53219 (_ BitVec 32))) (Found!12706 (index!53220 (_ BitVec 32))) (Intermediate!12706 (undefined!13518 Bool) (index!53221 (_ BitVec 32)) (x!134972 (_ BitVec 32))) (Undefined!12706) (MissingVacant!12706 (index!53222 (_ BitVec 32))) )
))
(declare-fun lt!654514 () SeekEntryResult!12706)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100590 (_ BitVec 32)) SeekEntryResult!12706)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508033 (= res!1028147 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48535 a!2804) j!70) mask!2512) (select (arr!48535 a!2804) j!70) a!2804 mask!2512) lt!654514))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1508033 (= lt!654514 (Intermediate!12706 false resIndex!21 resX!21))))

(declare-fun b!1508035 () Bool)

(declare-fun res!1028149 () Bool)

(assert (=> b!1508035 (=> (not res!1028149) (not e!842508))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1508035 (= res!1028149 (and (= (size!49085 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49085 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49085 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1028148 () Bool)

(assert (=> start!128656 (=> (not res!1028148) (not e!842508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128656 (= res!1028148 (validMask!0 mask!2512))))

(assert (=> start!128656 e!842508))

(assert (=> start!128656 true))

(declare-fun array_inv!37563 (array!100590) Bool)

(assert (=> start!128656 (array_inv!37563 a!2804)))

(declare-fun b!1508034 () Bool)

(declare-fun res!1028150 () Bool)

(assert (=> b!1508034 (=> (not res!1028150) (not e!842508))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508034 (= res!1028150 (validKeyInArray!0 (select (arr!48535 a!2804) i!961)))))

(declare-fun b!1508036 () Bool)

(declare-fun res!1028144 () Bool)

(assert (=> b!1508036 (=> (not res!1028144) (not e!842508))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1508036 (= res!1028144 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49085 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49085 a!2804))))))

(declare-fun b!1508037 () Bool)

(assert (=> b!1508037 (= e!842507 (and (bvsge mask!2512 #b00000000000000000000000000000000) (bvsgt mask!2512 #b00111111111111111111111111111111)))))

(declare-fun b!1508038 () Bool)

(declare-fun res!1028152 () Bool)

(assert (=> b!1508038 (=> (not res!1028152) (not e!842507))))

(assert (=> b!1508038 (= res!1028152 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48535 a!2804) j!70) a!2804 mask!2512) lt!654514))))

(declare-fun b!1508039 () Bool)

(declare-fun res!1028145 () Bool)

(assert (=> b!1508039 (=> (not res!1028145) (not e!842508))))

(assert (=> b!1508039 (= res!1028145 (validKeyInArray!0 (select (arr!48535 a!2804) j!70)))))

(assert (= (and start!128656 res!1028148) b!1508035))

(assert (= (and b!1508035 res!1028149) b!1508034))

(assert (= (and b!1508034 res!1028150) b!1508039))

(assert (= (and b!1508039 res!1028145) b!1508032))

(assert (= (and b!1508032 res!1028146) b!1508031))

(assert (= (and b!1508031 res!1028151) b!1508036))

(assert (= (and b!1508036 res!1028144) b!1508033))

(assert (= (and b!1508033 res!1028147) b!1508038))

(assert (= (and b!1508038 res!1028152) b!1508037))

(declare-fun m!1390629 () Bool)

(assert (=> b!1508034 m!1390629))

(assert (=> b!1508034 m!1390629))

(declare-fun m!1390631 () Bool)

(assert (=> b!1508034 m!1390631))

(declare-fun m!1390633 () Bool)

(assert (=> b!1508038 m!1390633))

(assert (=> b!1508038 m!1390633))

(declare-fun m!1390635 () Bool)

(assert (=> b!1508038 m!1390635))

(declare-fun m!1390637 () Bool)

(assert (=> b!1508032 m!1390637))

(declare-fun m!1390639 () Bool)

(assert (=> start!128656 m!1390639))

(declare-fun m!1390641 () Bool)

(assert (=> start!128656 m!1390641))

(assert (=> b!1508039 m!1390633))

(assert (=> b!1508039 m!1390633))

(declare-fun m!1390643 () Bool)

(assert (=> b!1508039 m!1390643))

(assert (=> b!1508033 m!1390633))

(assert (=> b!1508033 m!1390633))

(declare-fun m!1390645 () Bool)

(assert (=> b!1508033 m!1390645))

(assert (=> b!1508033 m!1390645))

(assert (=> b!1508033 m!1390633))

(declare-fun m!1390647 () Bool)

(assert (=> b!1508033 m!1390647))

(declare-fun m!1390649 () Bool)

(assert (=> b!1508031 m!1390649))

(push 1)

(assert (not b!1508039))

(assert (not b!1508031))

(assert (not b!1508032))

(assert (not b!1508034))

(assert (not b!1508033))

(assert (not start!128656))

(assert (not b!1508038))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!158387 () Bool)

(assert (=> d!158387 (= (validKeyInArray!0 (select (arr!48535 a!2804) j!70)) (and (not (= (select (arr!48535 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48535 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1508039 d!158387))

(declare-fun d!158389 () Bool)

(assert (=> d!158389 (= (validKeyInArray!0 (select (arr!48535 a!2804) i!961)) (and (not (= (select (arr!48535 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48535 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1508034 d!158389))

(declare-fun b!1508098 () Bool)

(declare-fun e!842550 () Bool)

(declare-fun call!68280 () Bool)

(assert (=> b!1508098 (= e!842550 call!68280)))

(declare-fun b!1508099 () Bool)

(assert (=> b!1508099 (= e!842550 call!68280)))

(declare-fun b!1508100 () Bool)

(declare-fun e!842547 () Bool)

(declare-fun e!842548 () Bool)

(assert (=> b!1508100 (= e!842547 e!842548)))

(declare-fun res!1028179 () Bool)

(assert (=> b!1508100 (=> (not res!1028179) (not e!842548))))

(declare-fun e!842549 () Bool)

(assert (=> b!1508100 (= res!1028179 (not e!842549))))

(declare-fun res!1028178 () Bool)

(assert (=> b!1508100 (=> (not res!1028178) (not e!842549))))

(assert (=> b!1508100 (= res!1028178 (validKeyInArray!0 (select (arr!48535 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!158391 () Bool)

(declare-fun res!1028177 () Bool)

(assert (=> d!158391 (=> res!1028177 e!842547)))

(assert (=> d!158391 (= res!1028177 (bvsge #b00000000000000000000000000000000 (size!49085 a!2804)))))

(assert (=> d!158391 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35015) e!842547)))

(declare-fun b!1508101 () Bool)

(assert (=> b!1508101 (= e!842548 e!842550)))

(declare-fun c!139499 () Bool)

(assert (=> b!1508101 (= c!139499 (validKeyInArray!0 (select (arr!48535 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1508102 () Bool)

(declare-fun contains!9972 (List!35018 (_ BitVec 64)) Bool)

(assert (=> b!1508102 (= e!842549 (contains!9972 Nil!35015 (select (arr!48535 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68277 () Bool)

(assert (=> bm!68277 (= call!68280 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139499 (Cons!35014 (select (arr!48535 a!2804) #b00000000000000000000000000000000) Nil!35015) Nil!35015)))))

(assert (= (and d!158391 (not res!1028177)) b!1508100))

(assert (= (and b!1508100 res!1028178) b!1508102))

(assert (= (and b!1508100 res!1028179) b!1508101))

(assert (= (and b!1508101 c!139499) b!1508098))

(assert (= (and b!1508101 (not c!139499)) b!1508099))

(assert (= (or b!1508098 b!1508099) bm!68277))

(declare-fun m!1390679 () Bool)

(assert (=> b!1508100 m!1390679))

(assert (=> b!1508100 m!1390679))

(declare-fun m!1390681 () Bool)

(assert (=> b!1508100 m!1390681))

(assert (=> b!1508101 m!1390679))

(assert (=> b!1508101 m!1390679))

(assert (=> b!1508101 m!1390681))

(assert (=> b!1508102 m!1390679))

(assert (=> b!1508102 m!1390679))

(declare-fun m!1390683 () Bool)

(assert (=> b!1508102 m!1390683))

(assert (=> bm!68277 m!1390679))

(declare-fun m!1390685 () Bool)

(assert (=> bm!68277 m!1390685))

(assert (=> b!1508031 d!158391))

(declare-fun d!158401 () Bool)

(assert (=> d!158401 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128656 d!158401))

(declare-fun d!158411 () Bool)

(assert (=> d!158411 (= (array_inv!37563 a!2804) (bvsge (size!49085 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128656 d!158411))

(declare-fun b!1508141 () Bool)

(declare-fun e!842582 () Bool)

(declare-fun call!68289 () Bool)

(assert (=> b!1508141 (= e!842582 call!68289)))

(declare-fun bm!68286 () Bool)

(assert (=> bm!68286 (= call!68289 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!158413 () Bool)

(declare-fun res!1028204 () Bool)

(declare-fun e!842581 () Bool)

(assert (=> d!158413 (=> res!1028204 e!842581)))

(assert (=> d!158413 (= res!1028204 (bvsge #b00000000000000000000000000000000 (size!49085 a!2804)))))

(assert (=> d!158413 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!842581)))

(declare-fun b!1508142 () Bool)

(assert (=> b!1508142 (= e!842581 e!842582)))

(declare-fun c!139508 () Bool)

(assert (=> b!1508142 (= c!139508 (validKeyInArray!0 (select (arr!48535 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1508143 () Bool)

(declare-fun e!842583 () Bool)

(assert (=> b!1508143 (= e!842582 e!842583)))

(declare-fun lt!654545 () (_ BitVec 64))

(assert (=> b!1508143 (= lt!654545 (select (arr!48535 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50340 0))(
  ( (Unit!50341) )
))
(declare-fun lt!654546 () Unit!50340)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100590 (_ BitVec 64) (_ BitVec 32)) Unit!50340)

(assert (=> b!1508143 (= lt!654546 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!654545 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100590 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1508143 (arrayContainsKey!0 a!2804 lt!654545 #b00000000000000000000000000000000)))

(declare-fun lt!654544 () Unit!50340)

(assert (=> b!1508143 (= lt!654544 lt!654546)))

(declare-fun res!1028203 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100590 (_ BitVec 32)) SeekEntryResult!12706)

(assert (=> b!1508143 (= res!1028203 (= (seekEntryOrOpen!0 (select (arr!48535 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12706 #b00000000000000000000000000000000)))))

(assert (=> b!1508143 (=> (not res!1028203) (not e!842583))))

(declare-fun b!1508144 () Bool)

(assert (=> b!1508144 (= e!842583 call!68289)))

(assert (= (and d!158413 (not res!1028204)) b!1508142))

(assert (= (and b!1508142 c!139508) b!1508143))

(assert (= (and b!1508142 (not c!139508)) b!1508141))

(assert (= (and b!1508143 res!1028203) b!1508144))

(assert (= (or b!1508144 b!1508141) bm!68286))

(declare-fun m!1390699 () Bool)

(assert (=> bm!68286 m!1390699))

(assert (=> b!1508142 m!1390679))

(assert (=> b!1508142 m!1390679))

(assert (=> b!1508142 m!1390681))

(assert (=> b!1508143 m!1390679))

(declare-fun m!1390701 () Bool)

(assert (=> b!1508143 m!1390701))

(declare-fun m!1390703 () Bool)

(assert (=> b!1508143 m!1390703))

(assert (=> b!1508143 m!1390679))

(declare-fun m!1390705 () Bool)

(assert (=> b!1508143 m!1390705))

(assert (=> b!1508032 d!158413))

(declare-fun b!1508211 () Bool)

(declare-fun e!842625 () SeekEntryResult!12706)

(assert (=> b!1508211 (= e!842625 (Intermediate!12706 false index!487 x!534))))

(declare-fun b!1508212 () Bool)

(declare-fun lt!654574 () SeekEntryResult!12706)

(assert (=> b!1508212 (and (bvsge (index!53221 lt!654574) #b00000000000000000000000000000000) (bvslt (index!53221 lt!654574) (size!49085 a!2804)))))

(declare-fun e!842624 () Bool)

(assert (=> b!1508212 (= e!842624 (= (select (arr!48535 a!2804) (index!53221 lt!654574)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1508213 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508213 (= e!842625 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48535 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1508214 () Bool)

(declare-fun e!842623 () SeekEntryResult!12706)

(assert (=> b!1508214 (= e!842623 e!842625)))

(declare-fun lt!654575 () (_ BitVec 64))

(declare-fun c!139531 () Bool)

(assert (=> b!1508214 (= c!139531 (or (= lt!654575 (select (arr!48535 a!2804) j!70)) (= (bvadd lt!654575 lt!654575) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1508215 () Bool)

(assert (=> b!1508215 (and (bvsge (index!53221 lt!654574) #b00000000000000000000000000000000) (bvslt (index!53221 lt!654574) (size!49085 a!2804)))))

