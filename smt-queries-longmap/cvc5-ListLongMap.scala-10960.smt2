; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128322 () Bool)

(assert start!128322)

(declare-fun res!1026123 () Bool)

(declare-fun e!841563 () Bool)

(assert (=> start!128322 (=> (not res!1026123) (not e!841563))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128322 (= res!1026123 (validMask!0 mask!2512))))

(assert (=> start!128322 e!841563))

(assert (=> start!128322 true))

(declare-datatypes ((array!100427 0))(
  ( (array!100428 (arr!48461 (Array (_ BitVec 32) (_ BitVec 64))) (size!49011 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100427)

(declare-fun array_inv!37489 (array!100427) Bool)

(assert (=> start!128322 (array_inv!37489 a!2804)))

(declare-fun b!1505710 () Bool)

(declare-fun res!1026126 () Bool)

(assert (=> b!1505710 (=> (not res!1026126) (not e!841563))))

(declare-datatypes ((List!34944 0))(
  ( (Nil!34941) (Cons!34940 (h!36337 (_ BitVec 64)) (t!49638 List!34944)) )
))
(declare-fun noDuplicate!2627 (List!34944) Bool)

(assert (=> b!1505710 (= res!1026126 (noDuplicate!2627 Nil!34941))))

(declare-fun b!1505711 () Bool)

(declare-fun res!1026125 () Bool)

(assert (=> b!1505711 (=> (not res!1026125) (not e!841563))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1505711 (= res!1026125 (and (= (size!49011 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49011 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49011 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1505712 () Bool)

(declare-fun res!1026127 () Bool)

(assert (=> b!1505712 (=> (not res!1026127) (not e!841563))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505712 (= res!1026127 (validKeyInArray!0 (select (arr!48461 a!2804) j!70)))))

(declare-fun b!1505713 () Bool)

(declare-fun res!1026124 () Bool)

(assert (=> b!1505713 (=> (not res!1026124) (not e!841563))))

(assert (=> b!1505713 (= res!1026124 (validKeyInArray!0 (select (arr!48461 a!2804) i!961)))))

(declare-fun b!1505714 () Bool)

(declare-fun res!1026122 () Bool)

(assert (=> b!1505714 (=> (not res!1026122) (not e!841563))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100427 (_ BitVec 32)) Bool)

(assert (=> b!1505714 (= res!1026122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1505715 () Bool)

(declare-fun e!841562 () Bool)

(assert (=> b!1505715 (= e!841563 e!841562)))

(declare-fun res!1026120 () Bool)

(assert (=> b!1505715 (=> res!1026120 e!841562)))

(declare-fun contains!9958 (List!34944 (_ BitVec 64)) Bool)

(assert (=> b!1505715 (= res!1026120 (contains!9958 Nil!34941 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1505716 () Bool)

(assert (=> b!1505716 (= e!841562 (contains!9958 Nil!34941 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1505717 () Bool)

(declare-fun res!1026121 () Bool)

(assert (=> b!1505717 (=> (not res!1026121) (not e!841563))))

(assert (=> b!1505717 (= res!1026121 (and (bvsle #b00000000000000000000000000000000 (size!49011 a!2804)) (bvslt (size!49011 a!2804) #b01111111111111111111111111111111)))))

(assert (= (and start!128322 res!1026123) b!1505711))

(assert (= (and b!1505711 res!1026125) b!1505713))

(assert (= (and b!1505713 res!1026124) b!1505712))

(assert (= (and b!1505712 res!1026127) b!1505714))

(assert (= (and b!1505714 res!1026122) b!1505717))

(assert (= (and b!1505717 res!1026121) b!1505710))

(assert (= (and b!1505710 res!1026126) b!1505715))

(assert (= (and b!1505715 (not res!1026120)) b!1505716))

(declare-fun m!1388785 () Bool)

(assert (=> b!1505710 m!1388785))

(declare-fun m!1388787 () Bool)

(assert (=> start!128322 m!1388787))

(declare-fun m!1388789 () Bool)

(assert (=> start!128322 m!1388789))

(declare-fun m!1388791 () Bool)

(assert (=> b!1505712 m!1388791))

(assert (=> b!1505712 m!1388791))

(declare-fun m!1388793 () Bool)

(assert (=> b!1505712 m!1388793))

(declare-fun m!1388795 () Bool)

(assert (=> b!1505716 m!1388795))

(declare-fun m!1388797 () Bool)

(assert (=> b!1505713 m!1388797))

(assert (=> b!1505713 m!1388797))

(declare-fun m!1388799 () Bool)

(assert (=> b!1505713 m!1388799))

(declare-fun m!1388801 () Bool)

(assert (=> b!1505715 m!1388801))

(declare-fun m!1388803 () Bool)

(assert (=> b!1505714 m!1388803))

(push 1)

(assert (not start!128322))

(assert (not b!1505710))

(assert (not b!1505713))

(assert (not b!1505716))

(assert (not b!1505714))

(assert (not b!1505715))

(assert (not b!1505712))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!158103 () Bool)

(assert (=> d!158103 (= (validKeyInArray!0 (select (arr!48461 a!2804) i!961)) (and (not (= (select (arr!48461 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48461 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505713 d!158103))

(declare-fun d!158107 () Bool)

(assert (=> d!158107 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128322 d!158107))

(declare-fun d!158123 () Bool)

(assert (=> d!158123 (= (array_inv!37489 a!2804) (bvsge (size!49011 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128322 d!158123))

(declare-fun d!158125 () Bool)

(assert (=> d!158125 (= (validKeyInArray!0 (select (arr!48461 a!2804) j!70)) (and (not (= (select (arr!48461 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48461 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505712 d!158125))

(declare-fun d!158127 () Bool)

(declare-fun res!1026200 () Bool)

(declare-fun e!841607 () Bool)

(assert (=> d!158127 (=> res!1026200 e!841607)))

(assert (=> d!158127 (= res!1026200 (is-Nil!34941 Nil!34941))))

(assert (=> d!158127 (= (noDuplicate!2627 Nil!34941) e!841607)))

(declare-fun b!1505790 () Bool)

(declare-fun e!841608 () Bool)

(assert (=> b!1505790 (= e!841607 e!841608)))

(declare-fun res!1026201 () Bool)

(assert (=> b!1505790 (=> (not res!1026201) (not e!841608))))

(assert (=> b!1505790 (= res!1026201 (not (contains!9958 (t!49638 Nil!34941) (h!36337 Nil!34941))))))

(declare-fun b!1505791 () Bool)

(assert (=> b!1505791 (= e!841608 (noDuplicate!2627 (t!49638 Nil!34941)))))

(assert (= (and d!158127 (not res!1026200)) b!1505790))

(assert (= (and b!1505790 res!1026201) b!1505791))

(declare-fun m!1388865 () Bool)

(assert (=> b!1505790 m!1388865))

(declare-fun m!1388867 () Bool)

(assert (=> b!1505791 m!1388867))

(assert (=> b!1505710 d!158127))

(declare-fun d!158135 () Bool)

(declare-fun lt!654092 () Bool)

(declare-fun content!786 (List!34944) (Set (_ BitVec 64)))

(assert (=> d!158135 (= lt!654092 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!786 Nil!34941)))))

(declare-fun e!841625 () Bool)

(assert (=> d!158135 (= lt!654092 e!841625)))

(declare-fun res!1026216 () Bool)

(assert (=> d!158135 (=> (not res!1026216) (not e!841625))))

(assert (=> d!158135 (= res!1026216 (is-Cons!34940 Nil!34941))))

(assert (=> d!158135 (= (contains!9958 Nil!34941 #b1000000000000000000000000000000000000000000000000000000000000000) lt!654092)))

(declare-fun b!1505810 () Bool)

(declare-fun e!841626 () Bool)

(assert (=> b!1505810 (= e!841625 e!841626)))

(declare-fun res!1026217 () Bool)

(assert (=> b!1505810 (=> res!1026217 e!841626)))

(assert (=> b!1505810 (= res!1026217 (= (h!36337 Nil!34941) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1505811 () Bool)

(assert (=> b!1505811 (= e!841626 (contains!9958 (t!49638 Nil!34941) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!158135 res!1026216) b!1505810))

(assert (= (and b!1505810 (not res!1026217)) b!1505811))

(declare-fun m!1388873 () Bool)

(assert (=> d!158135 m!1388873))

(declare-fun m!1388875 () Bool)

(assert (=> d!158135 m!1388875))

(declare-fun m!1388877 () Bool)

(assert (=> b!1505811 m!1388877))

(assert (=> b!1505716 d!158135))

(declare-fun d!158139 () Bool)

(declare-fun res!1026233 () Bool)

(declare-fun e!841647 () Bool)

(assert (=> d!158139 (=> res!1026233 e!841647)))

(assert (=> d!158139 (= res!1026233 (bvsge #b00000000000000000000000000000000 (size!49011 a!2804)))))

(assert (=> d!158139 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!841647)))

(declare-fun b!1505838 () Bool)

(declare-fun e!841648 () Bool)

(declare-fun call!68202 () Bool)

(assert (=> b!1505838 (= e!841648 call!68202)))

(declare-fun b!1505839 () Bool)

(assert (=> b!1505839 (= e!841647 e!841648)))

(declare-fun c!139337 () Bool)

(assert (=> b!1505839 (= c!139337 (validKeyInArray!0 (select (arr!48461 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68199 () Bool)

(assert (=> bm!68199 (= call!68202 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1505840 () Bool)

(declare-fun e!841649 () Bool)

(assert (=> b!1505840 (= e!841648 e!841649)))

(declare-fun lt!654112 () (_ BitVec 64))

(assert (=> b!1505840 (= lt!654112 (select (arr!48461 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50310 0))(
  ( (Unit!50311) )
))
(declare-fun lt!654114 () Unit!50310)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100427 (_ BitVec 64) (_ BitVec 32)) Unit!50310)

(assert (=> b!1505840 (= lt!654114 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!654112 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100427 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1505840 (arrayContainsKey!0 a!2804 lt!654112 #b00000000000000000000000000000000)))

(declare-fun lt!654113 () Unit!50310)

(assert (=> b!1505840 (= lt!654113 lt!654114)))

(declare-fun res!1026232 () Bool)

(declare-datatypes ((SeekEntryResult!12652 0))(
  ( (MissingZero!12652 (index!53003 (_ BitVec 32))) (Found!12652 (index!53004 (_ BitVec 32))) (Intermediate!12652 (undefined!13464 Bool) (index!53005 (_ BitVec 32)) (x!134711 (_ BitVec 32))) (Undefined!12652) (MissingVacant!12652 (index!53006 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100427 (_ BitVec 32)) SeekEntryResult!12652)

(assert (=> b!1505840 (= res!1026232 (= (seekEntryOrOpen!0 (select (arr!48461 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12652 #b00000000000000000000000000000000)))))

(assert (=> b!1505840 (=> (not res!1026232) (not e!841649))))

(declare-fun b!1505841 () Bool)

(assert (=> b!1505841 (= e!841649 call!68202)))

(assert (= (and d!158139 (not res!1026233)) b!1505839))

(assert (= (and b!1505839 c!139337) b!1505840))

(assert (= (and b!1505839 (not c!139337)) b!1505838))

(assert (= (and b!1505840 res!1026232) b!1505841))

(assert (= (or b!1505841 b!1505838) bm!68199))

(declare-fun m!1388907 () Bool)

(assert (=> b!1505839 m!1388907))

(assert (=> b!1505839 m!1388907))

(declare-fun m!1388909 () Bool)

(assert (=> b!1505839 m!1388909))

(declare-fun m!1388911 () Bool)

(assert (=> bm!68199 m!1388911))

(assert (=> b!1505840 m!1388907))

(declare-fun m!1388913 () Bool)

(assert (=> b!1505840 m!1388913))

(declare-fun m!1388915 () Bool)

(assert (=> b!1505840 m!1388915))

(assert (=> b!1505840 m!1388907))

(declare-fun m!1388917 () Bool)

(assert (=> b!1505840 m!1388917))

(assert (=> b!1505714 d!158139))

(declare-fun d!158145 () Bool)

(declare-fun lt!654115 () Bool)

(assert (=> d!158145 (= lt!654115 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!786 Nil!34941)))))

(declare-fun e!841650 () Bool)

(assert (=> d!158145 (= lt!654115 e!841650)))

(declare-fun res!1026234 () Bool)

(assert (=> d!158145 (=> (not res!1026234) (not e!841650))))

(assert (=> d!158145 (= res!1026234 (is-Cons!34940 Nil!34941))))

(assert (=> d!158145 (= (contains!9958 Nil!34941 #b0000000000000000000000000000000000000000000000000000000000000000) lt!654115)))

(declare-fun b!1505842 () Bool)

(declare-fun e!841651 () Bool)

(assert (=> b!1505842 (= e!841650 e!841651)))

(declare-fun res!1026235 () Bool)

(assert (=> b!1505842 (=> res!1026235 e!841651)))

(assert (=> b!1505842 (= res!1026235 (= (h!36337 Nil!34941) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1505843 () Bool)

(assert (=> b!1505843 (= e!841651 (contains!9958 (t!49638 Nil!34941) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!158145 res!1026234) b!1505842))

(assert (= (and b!1505842 (not res!1026235)) b!1505843))

(assert (=> d!158145 m!1388873))

(declare-fun m!1388919 () Bool)

(assert (=> d!158145 m!1388919))

(declare-fun m!1388921 () Bool)

(assert (=> b!1505843 m!1388921))

(assert (=> b!1505715 d!158145))

(push 1)

