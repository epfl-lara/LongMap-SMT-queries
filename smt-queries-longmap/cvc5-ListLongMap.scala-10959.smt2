; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128238 () Bool)

(assert start!128238)

(declare-fun b!1505294 () Bool)

(declare-fun res!1025932 () Bool)

(declare-fun e!841295 () Bool)

(assert (=> b!1505294 (=> (not res!1025932) (not e!841295))))

(declare-datatypes ((array!100370 0))(
  ( (array!100371 (arr!48435 (Array (_ BitVec 32) (_ BitVec 64))) (size!48987 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100370)

(assert (=> b!1505294 (= res!1025932 (and (bvsle #b00000000000000000000000000000000 (size!48987 a!2804)) (bvslt (size!48987 a!2804) #b01111111111111111111111111111111)))))

(declare-fun b!1505295 () Bool)

(declare-datatypes ((List!34996 0))(
  ( (Nil!34993) (Cons!34992 (h!36390 (_ BitVec 64)) (t!49682 List!34996)) )
))
(declare-fun noDuplicate!2648 (List!34996) Bool)

(assert (=> b!1505295 (= e!841295 (not (noDuplicate!2648 Nil!34993)))))

(declare-fun res!1025930 () Bool)

(assert (=> start!128238 (=> (not res!1025930) (not e!841295))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128238 (= res!1025930 (validMask!0 mask!2512))))

(assert (=> start!128238 e!841295))

(assert (=> start!128238 true))

(declare-fun array_inv!37668 (array!100370) Bool)

(assert (=> start!128238 (array_inv!37668 a!2804)))

(declare-fun b!1505296 () Bool)

(declare-fun res!1025928 () Bool)

(assert (=> b!1505296 (=> (not res!1025928) (not e!841295))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505296 (= res!1025928 (validKeyInArray!0 (select (arr!48435 a!2804) j!70)))))

(declare-fun b!1505297 () Bool)

(declare-fun res!1025929 () Bool)

(assert (=> b!1505297 (=> (not res!1025929) (not e!841295))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1505297 (= res!1025929 (and (= (size!48987 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!48987 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!48987 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1505298 () Bool)

(declare-fun res!1025933 () Bool)

(assert (=> b!1505298 (=> (not res!1025933) (not e!841295))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100370 (_ BitVec 32)) Bool)

(assert (=> b!1505298 (= res!1025933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1505299 () Bool)

(declare-fun res!1025931 () Bool)

(assert (=> b!1505299 (=> (not res!1025931) (not e!841295))))

(assert (=> b!1505299 (= res!1025931 (validKeyInArray!0 (select (arr!48435 a!2804) i!961)))))

(assert (= (and start!128238 res!1025930) b!1505297))

(assert (= (and b!1505297 res!1025929) b!1505299))

(assert (= (and b!1505299 res!1025931) b!1505296))

(assert (= (and b!1505296 res!1025928) b!1505298))

(assert (= (and b!1505298 res!1025933) b!1505294))

(assert (= (and b!1505294 res!1025932) b!1505295))

(declare-fun m!1387813 () Bool)

(assert (=> b!1505298 m!1387813))

(declare-fun m!1387815 () Bool)

(assert (=> b!1505299 m!1387815))

(assert (=> b!1505299 m!1387815))

(declare-fun m!1387817 () Bool)

(assert (=> b!1505299 m!1387817))

(declare-fun m!1387819 () Bool)

(assert (=> b!1505295 m!1387819))

(declare-fun m!1387821 () Bool)

(assert (=> b!1505296 m!1387821))

(assert (=> b!1505296 m!1387821))

(declare-fun m!1387823 () Bool)

(assert (=> b!1505296 m!1387823))

(declare-fun m!1387825 () Bool)

(assert (=> start!128238 m!1387825))

(declare-fun m!1387827 () Bool)

(assert (=> start!128238 m!1387827))

(push 1)

(assert (not b!1505296))

(assert (not b!1505295))

(assert (not start!128238))

(assert (not b!1505298))

(assert (not b!1505299))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!157801 () Bool)

(assert (=> d!157801 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128238 d!157801))

(declare-fun d!157805 () Bool)

(assert (=> d!157805 (= (array_inv!37668 a!2804) (bvsge (size!48987 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128238 d!157805))

(declare-fun d!157809 () Bool)

(declare-fun res!1025938 () Bool)

(declare-fun e!841301 () Bool)

(assert (=> d!157809 (=> res!1025938 e!841301)))

(assert (=> d!157809 (= res!1025938 (is-Nil!34993 Nil!34993))))

(assert (=> d!157809 (= (noDuplicate!2648 Nil!34993) e!841301)))

(declare-fun b!1505304 () Bool)

(declare-fun e!841302 () Bool)

(assert (=> b!1505304 (= e!841301 e!841302)))

(declare-fun res!1025939 () Bool)

(assert (=> b!1505304 (=> (not res!1025939) (not e!841302))))

(declare-fun contains!9921 (List!34996 (_ BitVec 64)) Bool)

(assert (=> b!1505304 (= res!1025939 (not (contains!9921 (t!49682 Nil!34993) (h!36390 Nil!34993))))))

(declare-fun b!1505305 () Bool)

(assert (=> b!1505305 (= e!841302 (noDuplicate!2648 (t!49682 Nil!34993)))))

(assert (= (and d!157809 (not res!1025938)) b!1505304))

(assert (= (and b!1505304 res!1025939) b!1505305))

(declare-fun m!1387829 () Bool)

(assert (=> b!1505304 m!1387829))

(declare-fun m!1387831 () Bool)

(assert (=> b!1505305 m!1387831))

(assert (=> b!1505295 d!157809))

(declare-fun d!157813 () Bool)

(assert (=> d!157813 (= (validKeyInArray!0 (select (arr!48435 a!2804) j!70)) (and (not (= (select (arr!48435 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48435 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505296 d!157813))

(declare-fun b!1505342 () Bool)

(declare-fun e!841331 () Bool)

(declare-fun call!68156 () Bool)

(assert (=> b!1505342 (= e!841331 call!68156)))

(declare-fun bm!68153 () Bool)

(assert (=> bm!68153 (= call!68156 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1505343 () Bool)

(declare-fun e!841333 () Bool)

(assert (=> b!1505343 (= e!841331 e!841333)))

(declare-fun lt!653779 () (_ BitVec 64))

(assert (=> b!1505343 (= lt!653779 (select (arr!48435 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50137 0))(
  ( (Unit!50138) )
))
(declare-fun lt!653781 () Unit!50137)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100370 (_ BitVec 64) (_ BitVec 32)) Unit!50137)

(assert (=> b!1505343 (= lt!653781 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!653779 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100370 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1505343 (arrayContainsKey!0 a!2804 lt!653779 #b00000000000000000000000000000000)))

(declare-fun lt!653780 () Unit!50137)

(assert (=> b!1505343 (= lt!653780 lt!653781)))

(declare-fun res!1025960 () Bool)

(declare-datatypes ((SeekEntryResult!12645 0))(
  ( (MissingZero!12645 (index!52975 (_ BitVec 32))) (Found!12645 (index!52976 (_ BitVec 32))) (Intermediate!12645 (undefined!13457 Bool) (index!52977 (_ BitVec 32)) (x!134690 (_ BitVec 32))) (Undefined!12645) (MissingVacant!12645 (index!52978 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100370 (_ BitVec 32)) SeekEntryResult!12645)

(assert (=> b!1505343 (= res!1025960 (= (seekEntryOrOpen!0 (select (arr!48435 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12645 #b00000000000000000000000000000000)))))

(assert (=> b!1505343 (=> (not res!1025960) (not e!841333))))

(declare-fun b!1505345 () Bool)

(declare-fun e!841332 () Bool)

(assert (=> b!1505345 (= e!841332 e!841331)))

(declare-fun c!139228 () Bool)

(assert (=> b!1505345 (= c!139228 (validKeyInArray!0 (select (arr!48435 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1505344 () Bool)

(assert (=> b!1505344 (= e!841333 call!68156)))

(declare-fun d!157815 () Bool)

(declare-fun res!1025961 () Bool)

(assert (=> d!157815 (=> res!1025961 e!841332)))

(assert (=> d!157815 (= res!1025961 (bvsge #b00000000000000000000000000000000 (size!48987 a!2804)))))

(assert (=> d!157815 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!841332)))

(assert (= (and d!157815 (not res!1025961)) b!1505345))

(assert (= (and b!1505345 c!139228) b!1505343))

(assert (= (and b!1505345 (not c!139228)) b!1505342))

(assert (= (and b!1505343 res!1025960) b!1505344))

(assert (= (or b!1505344 b!1505342) bm!68153))

(declare-fun m!1387861 () Bool)

(assert (=> bm!68153 m!1387861))

(declare-fun m!1387863 () Bool)

(assert (=> b!1505343 m!1387863))

(declare-fun m!1387865 () Bool)

(assert (=> b!1505343 m!1387865))

(declare-fun m!1387867 () Bool)

(assert (=> b!1505343 m!1387867))

(assert (=> b!1505343 m!1387863))

(declare-fun m!1387869 () Bool)

(assert (=> b!1505343 m!1387869))

(assert (=> b!1505345 m!1387863))

(assert (=> b!1505345 m!1387863))

(declare-fun m!1387871 () Bool)

(assert (=> b!1505345 m!1387871))

(assert (=> b!1505298 d!157815))

(declare-fun d!157825 () Bool)

(assert (=> d!157825 (= (validKeyInArray!0 (select (arr!48435 a!2804) i!961)) (and (not (= (select (arr!48435 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48435 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505299 d!157825))

(push 1)

(assert (not b!1505304))

(assert (not b!1505305))

(assert (not bm!68153))

(assert (not b!1505345))

(assert (not b!1505343))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

