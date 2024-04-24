; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127882 () Bool)

(assert start!127882)

(declare-fun res!1020878 () Bool)

(declare-fun e!840278 () Bool)

(assert (=> start!127882 (=> (not res!1020878) (not e!840278))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127882 (= res!1020878 (validMask!0 mask!2661))))

(assert (=> start!127882 e!840278))

(assert (=> start!127882 true))

(declare-datatypes ((array!100108 0))(
  ( (array!100109 (arr!48310 (Array (_ BitVec 32) (_ BitVec 64))) (size!48861 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100108)

(declare-fun array_inv!37591 (array!100108) Bool)

(assert (=> start!127882 (array_inv!37591 a!2850)))

(declare-fun b!1500900 () Bool)

(declare-fun res!1020877 () Bool)

(assert (=> b!1500900 (=> (not res!1020877) (not e!840278))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12413 0))(
  ( (MissingZero!12413 (index!52044 (_ BitVec 32))) (Found!12413 (index!52045 (_ BitVec 32))) (Intermediate!12413 (undefined!13225 Bool) (index!52046 (_ BitVec 32)) (x!133929 (_ BitVec 32))) (Undefined!12413) (MissingVacant!12413 (index!52047 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100108 (_ BitVec 32)) SeekEntryResult!12413)

(assert (=> b!1500900 (= res!1020877 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48310 a!2850) j!87) a!2850 mask!2661) (Found!12413 j!87)))))

(declare-fun b!1500901 () Bool)

(declare-fun res!1020883 () Bool)

(assert (=> b!1500901 (=> (not res!1020883) (not e!840278))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1500901 (= res!1020883 (and (= (size!48861 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48861 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48861 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500902 () Bool)

(declare-fun res!1020881 () Bool)

(assert (=> b!1500902 (=> (not res!1020881) (not e!840278))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100108 (_ BitVec 32)) Bool)

(assert (=> b!1500902 (= res!1020881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500903 () Bool)

(declare-fun res!1020879 () Bool)

(assert (=> b!1500903 (=> (not res!1020879) (not e!840278))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500903 (= res!1020879 (validKeyInArray!0 (select (arr!48310 a!2850) j!87)))))

(declare-fun b!1500904 () Bool)

(declare-fun res!1020880 () Bool)

(assert (=> b!1500904 (=> (not res!1020880) (not e!840278))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500904 (= res!1020880 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48861 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48861 a!2850)) (= (select (arr!48310 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48310 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48861 a!2850))))))

(declare-fun b!1500905 () Bool)

(declare-fun res!1020884 () Bool)

(assert (=> b!1500905 (=> (not res!1020884) (not e!840278))))

(assert (=> b!1500905 (= res!1020884 (validKeyInArray!0 (select (arr!48310 a!2850) i!996)))))

(declare-fun b!1500906 () Bool)

(declare-fun res!1020882 () Bool)

(assert (=> b!1500906 (=> (not res!1020882) (not e!840278))))

(declare-datatypes ((List!34789 0))(
  ( (Nil!34786) (Cons!34785 (h!36197 (_ BitVec 64)) (t!49475 List!34789)) )
))
(declare-fun arrayNoDuplicates!0 (array!100108 (_ BitVec 32) List!34789) Bool)

(assert (=> b!1500906 (= res!1020882 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34786))))

(declare-fun b!1500907 () Bool)

(assert (=> b!1500907 (= e!840278 (and (not (= (select (arr!48310 a!2850) index!625) (select (arr!48310 a!2850) j!87))) (bvsge mask!2661 #b00000000000000000000000000000000) (bvslt index!625 (bvadd #b00000000000000000000000000000001 mask!2661)) (or (bvsgt (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000))))))

(assert (= (and start!127882 res!1020878) b!1500901))

(assert (= (and b!1500901 res!1020883) b!1500905))

(assert (= (and b!1500905 res!1020884) b!1500903))

(assert (= (and b!1500903 res!1020879) b!1500902))

(assert (= (and b!1500902 res!1020881) b!1500906))

(assert (= (and b!1500906 res!1020882) b!1500904))

(assert (= (and b!1500904 res!1020880) b!1500900))

(assert (= (and b!1500900 res!1020877) b!1500907))

(declare-fun m!1384109 () Bool)

(assert (=> b!1500907 m!1384109))

(declare-fun m!1384111 () Bool)

(assert (=> b!1500907 m!1384111))

(declare-fun m!1384113 () Bool)

(assert (=> b!1500906 m!1384113))

(assert (=> b!1500903 m!1384111))

(assert (=> b!1500903 m!1384111))

(declare-fun m!1384115 () Bool)

(assert (=> b!1500903 m!1384115))

(declare-fun m!1384117 () Bool)

(assert (=> b!1500904 m!1384117))

(declare-fun m!1384119 () Bool)

(assert (=> b!1500904 m!1384119))

(declare-fun m!1384121 () Bool)

(assert (=> b!1500904 m!1384121))

(declare-fun m!1384123 () Bool)

(assert (=> b!1500902 m!1384123))

(declare-fun m!1384125 () Bool)

(assert (=> start!127882 m!1384125))

(declare-fun m!1384127 () Bool)

(assert (=> start!127882 m!1384127))

(assert (=> b!1500900 m!1384111))

(assert (=> b!1500900 m!1384111))

(declare-fun m!1384129 () Bool)

(assert (=> b!1500900 m!1384129))

(declare-fun m!1384131 () Bool)

(assert (=> b!1500905 m!1384131))

(assert (=> b!1500905 m!1384131))

(declare-fun m!1384133 () Bool)

(assert (=> b!1500905 m!1384133))

(check-sat (not b!1500906) (not b!1500902) (not b!1500903) (not b!1500900) (not b!1500905) (not start!127882))
(check-sat)
(get-model)

(declare-fun d!158063 () Bool)

(assert (=> d!158063 (= (validKeyInArray!0 (select (arr!48310 a!2850) j!87)) (and (not (= (select (arr!48310 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48310 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1500903 d!158063))

(declare-fun e!840298 () SeekEntryResult!12413)

(declare-fun b!1500968 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500968 (= e!840298 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 (bvadd x!647 #b00000000000000000000000000000001) mask!2661) vacantBefore!10 (select (arr!48310 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1500969 () Bool)

(assert (=> b!1500969 (= e!840298 (MissingVacant!12413 vacantBefore!10))))

(declare-fun b!1500970 () Bool)

(declare-fun c!139563 () Bool)

(declare-fun lt!653330 () (_ BitVec 64))

(assert (=> b!1500970 (= c!139563 (= lt!653330 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!840299 () SeekEntryResult!12413)

(assert (=> b!1500970 (= e!840299 e!840298)))

(declare-fun b!1500971 () Bool)

(assert (=> b!1500971 (= e!840299 (Found!12413 index!625))))

(declare-fun d!158065 () Bool)

(declare-fun lt!653331 () SeekEntryResult!12413)

(get-info :version)

(assert (=> d!158065 (and (or ((_ is Undefined!12413) lt!653331) (not ((_ is Found!12413) lt!653331)) (and (bvsge (index!52045 lt!653331) #b00000000000000000000000000000000) (bvslt (index!52045 lt!653331) (size!48861 a!2850)))) (or ((_ is Undefined!12413) lt!653331) ((_ is Found!12413) lt!653331) (not ((_ is MissingVacant!12413) lt!653331)) (not (= (index!52047 lt!653331) vacantBefore!10)) (and (bvsge (index!52047 lt!653331) #b00000000000000000000000000000000) (bvslt (index!52047 lt!653331) (size!48861 a!2850)))) (or ((_ is Undefined!12413) lt!653331) (ite ((_ is Found!12413) lt!653331) (= (select (arr!48310 a!2850) (index!52045 lt!653331)) (select (arr!48310 a!2850) j!87)) (and ((_ is MissingVacant!12413) lt!653331) (= (index!52047 lt!653331) vacantBefore!10) (= (select (arr!48310 a!2850) (index!52047 lt!653331)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!840300 () SeekEntryResult!12413)

(assert (=> d!158065 (= lt!653331 e!840300)))

(declare-fun c!139562 () Bool)

(assert (=> d!158065 (= c!139562 (bvsge x!647 #b01111111111111111111111111111110))))

(assert (=> d!158065 (= lt!653330 (select (arr!48310 a!2850) index!625))))

(assert (=> d!158065 (validMask!0 mask!2661)))

(assert (=> d!158065 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48310 a!2850) j!87) a!2850 mask!2661) lt!653331)))

(declare-fun b!1500972 () Bool)

(assert (=> b!1500972 (= e!840300 e!840299)))

(declare-fun c!139564 () Bool)

(assert (=> b!1500972 (= c!139564 (= lt!653330 (select (arr!48310 a!2850) j!87)))))

(declare-fun b!1500973 () Bool)

(assert (=> b!1500973 (= e!840300 Undefined!12413)))

(assert (= (and d!158065 c!139562) b!1500973))

(assert (= (and d!158065 (not c!139562)) b!1500972))

(assert (= (and b!1500972 c!139564) b!1500971))

(assert (= (and b!1500972 (not c!139564)) b!1500970))

(assert (= (and b!1500970 c!139563) b!1500969))

(assert (= (and b!1500970 (not c!139563)) b!1500968))

(declare-fun m!1384187 () Bool)

(assert (=> b!1500968 m!1384187))

(assert (=> b!1500968 m!1384187))

(assert (=> b!1500968 m!1384111))

(declare-fun m!1384189 () Bool)

(assert (=> b!1500968 m!1384189))

(declare-fun m!1384191 () Bool)

(assert (=> d!158065 m!1384191))

(declare-fun m!1384193 () Bool)

(assert (=> d!158065 m!1384193))

(assert (=> d!158065 m!1384109))

(assert (=> d!158065 m!1384125))

(assert (=> b!1500900 d!158065))

(declare-fun d!158069 () Bool)

(assert (=> d!158069 (= (validKeyInArray!0 (select (arr!48310 a!2850) i!996)) (and (not (= (select (arr!48310 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48310 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1500905 d!158069))

(declare-fun b!1500992 () Bool)

(declare-fun e!840316 () Bool)

(declare-fun contains!9988 (List!34789 (_ BitVec 64)) Bool)

(assert (=> b!1500992 (= e!840316 (contains!9988 Nil!34786 (select (arr!48310 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1500993 () Bool)

(declare-fun e!840315 () Bool)

(declare-fun e!840318 () Bool)

(assert (=> b!1500993 (= e!840315 e!840318)))

(declare-fun res!1020943 () Bool)

(assert (=> b!1500993 (=> (not res!1020943) (not e!840318))))

(assert (=> b!1500993 (= res!1020943 (not e!840316))))

(declare-fun res!1020944 () Bool)

(assert (=> b!1500993 (=> (not res!1020944) (not e!840316))))

(assert (=> b!1500993 (= res!1020944 (validKeyInArray!0 (select (arr!48310 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1500994 () Bool)

(declare-fun e!840317 () Bool)

(declare-fun call!68162 () Bool)

(assert (=> b!1500994 (= e!840317 call!68162)))

(declare-fun b!1500995 () Bool)

(assert (=> b!1500995 (= e!840317 call!68162)))

(declare-fun b!1500996 () Bool)

(assert (=> b!1500996 (= e!840318 e!840317)))

(declare-fun c!139569 () Bool)

(assert (=> b!1500996 (= c!139569 (validKeyInArray!0 (select (arr!48310 a!2850) #b00000000000000000000000000000000)))))

(declare-fun bm!68159 () Bool)

(assert (=> bm!68159 (= call!68162 (arrayNoDuplicates!0 a!2850 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139569 (Cons!34785 (select (arr!48310 a!2850) #b00000000000000000000000000000000) Nil!34786) Nil!34786)))))

(declare-fun d!158071 () Bool)

(declare-fun res!1020945 () Bool)

(assert (=> d!158071 (=> res!1020945 e!840315)))

(assert (=> d!158071 (= res!1020945 (bvsge #b00000000000000000000000000000000 (size!48861 a!2850)))))

(assert (=> d!158071 (= (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34786) e!840315)))

(assert (= (and d!158071 (not res!1020945)) b!1500993))

(assert (= (and b!1500993 res!1020944) b!1500992))

(assert (= (and b!1500993 res!1020943) b!1500996))

(assert (= (and b!1500996 c!139569) b!1500994))

(assert (= (and b!1500996 (not c!139569)) b!1500995))

(assert (= (or b!1500994 b!1500995) bm!68159))

(declare-fun m!1384195 () Bool)

(assert (=> b!1500992 m!1384195))

(assert (=> b!1500992 m!1384195))

(declare-fun m!1384197 () Bool)

(assert (=> b!1500992 m!1384197))

(assert (=> b!1500993 m!1384195))

(assert (=> b!1500993 m!1384195))

(declare-fun m!1384199 () Bool)

(assert (=> b!1500993 m!1384199))

(assert (=> b!1500996 m!1384195))

(assert (=> b!1500996 m!1384195))

(assert (=> b!1500996 m!1384199))

(assert (=> bm!68159 m!1384195))

(declare-fun m!1384201 () Bool)

(assert (=> bm!68159 m!1384201))

(assert (=> b!1500906 d!158071))

(declare-fun d!158073 () Bool)

(assert (=> d!158073 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!127882 d!158073))

(declare-fun d!158081 () Bool)

(assert (=> d!158081 (= (array_inv!37591 a!2850) (bvsge (size!48861 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!127882 d!158081))

(declare-fun b!1501027 () Bool)

(declare-fun e!840338 () Bool)

(declare-fun call!68166 () Bool)

(assert (=> b!1501027 (= e!840338 call!68166)))

(declare-fun d!158083 () Bool)

(declare-fun res!1020952 () Bool)

(declare-fun e!840337 () Bool)

(assert (=> d!158083 (=> res!1020952 e!840337)))

(assert (=> d!158083 (= res!1020952 (bvsge #b00000000000000000000000000000000 (size!48861 a!2850)))))

(assert (=> d!158083 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!840337)))

(declare-fun b!1501028 () Bool)

(declare-fun e!840339 () Bool)

(assert (=> b!1501028 (= e!840338 e!840339)))

(declare-fun lt!653355 () (_ BitVec 64))

(assert (=> b!1501028 (= lt!653355 (select (arr!48310 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50133 0))(
  ( (Unit!50134) )
))
(declare-fun lt!653353 () Unit!50133)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100108 (_ BitVec 64) (_ BitVec 32)) Unit!50133)

(assert (=> b!1501028 (= lt!653353 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!653355 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100108 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1501028 (arrayContainsKey!0 a!2850 lt!653355 #b00000000000000000000000000000000)))

(declare-fun lt!653354 () Unit!50133)

(assert (=> b!1501028 (= lt!653354 lt!653353)))

(declare-fun res!1020953 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100108 (_ BitVec 32)) SeekEntryResult!12413)

(assert (=> b!1501028 (= res!1020953 (= (seekEntryOrOpen!0 (select (arr!48310 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12413 #b00000000000000000000000000000000)))))

(assert (=> b!1501028 (=> (not res!1020953) (not e!840339))))

(declare-fun b!1501029 () Bool)

(assert (=> b!1501029 (= e!840337 e!840338)))

(declare-fun c!139582 () Bool)

(assert (=> b!1501029 (= c!139582 (validKeyInArray!0 (select (arr!48310 a!2850) #b00000000000000000000000000000000)))))

(declare-fun bm!68163 () Bool)

(assert (=> bm!68163 (= call!68166 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(declare-fun b!1501030 () Bool)

(assert (=> b!1501030 (= e!840339 call!68166)))

(assert (= (and d!158083 (not res!1020952)) b!1501029))

(assert (= (and b!1501029 c!139582) b!1501028))

(assert (= (and b!1501029 (not c!139582)) b!1501027))

(assert (= (and b!1501028 res!1020953) b!1501030))

(assert (= (or b!1501030 b!1501027) bm!68163))

(assert (=> b!1501028 m!1384195))

(declare-fun m!1384223 () Bool)

(assert (=> b!1501028 m!1384223))

(declare-fun m!1384225 () Bool)

(assert (=> b!1501028 m!1384225))

(assert (=> b!1501028 m!1384195))

(declare-fun m!1384227 () Bool)

(assert (=> b!1501028 m!1384227))

(assert (=> b!1501029 m!1384195))

(assert (=> b!1501029 m!1384195))

(assert (=> b!1501029 m!1384199))

(declare-fun m!1384229 () Bool)

(assert (=> bm!68163 m!1384229))

(assert (=> b!1500902 d!158083))

(check-sat (not bm!68159) (not b!1500993) (not d!158065) (not b!1500992) (not b!1501029) (not b!1501028) (not b!1500996) (not b!1500968) (not bm!68163))
(check-sat)
