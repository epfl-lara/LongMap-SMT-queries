; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127992 () Bool)

(assert start!127992)

(declare-fun b!1503660 () Bool)

(declare-fun res!1024539 () Bool)

(declare-fun e!840661 () Bool)

(assert (=> b!1503660 (=> (not res!1024539) (not e!840661))))

(declare-datatypes ((array!100307 0))(
  ( (array!100308 (arr!48410 (Array (_ BitVec 32) (_ BitVec 64))) (size!48960 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100307)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100307 (_ BitVec 32)) Bool)

(assert (=> b!1503660 (= res!1024539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503661 () Bool)

(declare-fun res!1024544 () Bool)

(assert (=> b!1503661 (=> (not res!1024544) (not e!840661))))

(declare-datatypes ((List!34902 0))(
  ( (Nil!34899) (Cons!34898 (h!36295 (_ BitVec 64)) (t!49596 List!34902)) )
))
(declare-fun arrayNoDuplicates!0 (array!100307 (_ BitVec 32) List!34902) Bool)

(assert (=> b!1503661 (= res!1024544 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34899))))

(declare-fun b!1503662 () Bool)

(declare-fun res!1024543 () Bool)

(assert (=> b!1503662 (=> (not res!1024543) (not e!840661))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503662 (= res!1024543 (validKeyInArray!0 (select (arr!48410 a!2850) i!996)))))

(declare-fun b!1503663 () Bool)

(declare-fun res!1024545 () Bool)

(assert (=> b!1503663 (=> (not res!1024545) (not e!840661))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503663 (= res!1024545 (not (= (select (arr!48410 a!2850) index!625) (select (arr!48410 a!2850) j!87))))))

(declare-fun b!1503664 () Bool)

(declare-fun res!1024541 () Bool)

(assert (=> b!1503664 (=> (not res!1024541) (not e!840661))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12608 0))(
  ( (MissingZero!12608 (index!52824 (_ BitVec 32))) (Found!12608 (index!52825 (_ BitVec 32))) (Intermediate!12608 (undefined!13420 Bool) (index!52826 (_ BitVec 32)) (x!134504 (_ BitVec 32))) (Undefined!12608) (MissingVacant!12608 (index!52827 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100307 (_ BitVec 32)) SeekEntryResult!12608)

(assert (=> b!1503664 (= res!1024541 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48410 a!2850) j!87) a!2850 mask!2661) (Found!12608 j!87)))))

(declare-fun res!1024542 () Bool)

(assert (=> start!127992 (=> (not res!1024542) (not e!840661))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127992 (= res!1024542 (validMask!0 mask!2661))))

(assert (=> start!127992 e!840661))

(assert (=> start!127992 true))

(declare-fun array_inv!37438 (array!100307) Bool)

(assert (=> start!127992 (array_inv!37438 a!2850)))

(declare-fun b!1503665 () Bool)

(declare-fun res!1024540 () Bool)

(assert (=> b!1503665 (=> (not res!1024540) (not e!840661))))

(assert (=> b!1503665 (= res!1024540 (and (= (size!48960 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48960 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48960 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503666 () Bool)

(assert (=> b!1503666 (= e!840661 (or (bvslt (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110)))))

(declare-fun lt!653551 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503666 (= lt!653551 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1503667 () Bool)

(declare-fun res!1024538 () Bool)

(assert (=> b!1503667 (=> (not res!1024538) (not e!840661))))

(assert (=> b!1503667 (= res!1024538 (validKeyInArray!0 (select (arr!48410 a!2850) j!87)))))

(declare-fun b!1503668 () Bool)

(declare-fun res!1024546 () Bool)

(assert (=> b!1503668 (=> (not res!1024546) (not e!840661))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503668 (= res!1024546 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48960 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48960 a!2850)) (= (select (arr!48410 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48410 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48960 a!2850))))))

(assert (= (and start!127992 res!1024542) b!1503665))

(assert (= (and b!1503665 res!1024540) b!1503662))

(assert (= (and b!1503662 res!1024543) b!1503667))

(assert (= (and b!1503667 res!1024538) b!1503660))

(assert (= (and b!1503660 res!1024539) b!1503661))

(assert (= (and b!1503661 res!1024544) b!1503668))

(assert (= (and b!1503668 res!1024546) b!1503664))

(assert (= (and b!1503664 res!1024541) b!1503663))

(assert (= (and b!1503663 res!1024545) b!1503666))

(declare-fun m!1386919 () Bool)

(assert (=> b!1503664 m!1386919))

(assert (=> b!1503664 m!1386919))

(declare-fun m!1386921 () Bool)

(assert (=> b!1503664 m!1386921))

(declare-fun m!1386923 () Bool)

(assert (=> b!1503663 m!1386923))

(assert (=> b!1503663 m!1386919))

(declare-fun m!1386925 () Bool)

(assert (=> b!1503661 m!1386925))

(declare-fun m!1386927 () Bool)

(assert (=> b!1503668 m!1386927))

(declare-fun m!1386929 () Bool)

(assert (=> b!1503668 m!1386929))

(declare-fun m!1386931 () Bool)

(assert (=> b!1503668 m!1386931))

(declare-fun m!1386933 () Bool)

(assert (=> b!1503660 m!1386933))

(declare-fun m!1386935 () Bool)

(assert (=> b!1503662 m!1386935))

(assert (=> b!1503662 m!1386935))

(declare-fun m!1386937 () Bool)

(assert (=> b!1503662 m!1386937))

(assert (=> b!1503667 m!1386919))

(assert (=> b!1503667 m!1386919))

(declare-fun m!1386939 () Bool)

(assert (=> b!1503667 m!1386939))

(declare-fun m!1386941 () Bool)

(assert (=> b!1503666 m!1386941))

(declare-fun m!1386943 () Bool)

(assert (=> start!127992 m!1386943))

(declare-fun m!1386945 () Bool)

(assert (=> start!127992 m!1386945))

(push 1)

(assert (not start!127992))

(assert (not b!1503661))

(assert (not b!1503667))

(assert (not b!1503660))

(assert (not b!1503664))

(assert (not b!1503666))

(assert (not b!1503662))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!157787 () Bool)

(assert (=> d!157787 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!127992 d!157787))

(declare-fun d!157795 () Bool)

(assert (=> d!157795 (= (array_inv!37438 a!2850) (bvsge (size!48960 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!127992 d!157795))

(declare-fun b!1503792 () Bool)

(declare-fun e!840718 () SeekEntryResult!12608)

(assert (=> b!1503792 (= e!840718 (MissingVacant!12608 vacantBefore!10))))

(declare-fun b!1503793 () Bool)

(declare-fun c!139124 () Bool)

(declare-fun lt!653585 () (_ BitVec 64))

(assert (=> b!1503793 (= c!139124 (= lt!653585 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!840716 () SeekEntryResult!12608)

(assert (=> b!1503793 (= e!840716 e!840718)))

(declare-fun b!1503794 () Bool)

(declare-fun e!840717 () SeekEntryResult!12608)

(assert (=> b!1503794 (= e!840717 Undefined!12608)))

(declare-fun lt!653584 () SeekEntryResult!12608)

(declare-fun d!157797 () Bool)

(assert (=> d!157797 (and (or (is-Undefined!12608 lt!653584) (not (is-Found!12608 lt!653584)) (and (bvsge (index!52825 lt!653584) #b00000000000000000000000000000000) (bvslt (index!52825 lt!653584) (size!48960 a!2850)))) (or (is-Undefined!12608 lt!653584) (is-Found!12608 lt!653584) (not (is-MissingVacant!12608 lt!653584)) (not (= (index!52827 lt!653584) vacantBefore!10)) (and (bvsge (index!52827 lt!653584) #b00000000000000000000000000000000) (bvslt (index!52827 lt!653584) (size!48960 a!2850)))) (or (is-Undefined!12608 lt!653584) (ite (is-Found!12608 lt!653584) (= (select (arr!48410 a!2850) (index!52825 lt!653584)) (select (arr!48410 a!2850) j!87)) (and (is-MissingVacant!12608 lt!653584) (= (index!52827 lt!653584) vacantBefore!10) (= (select (arr!48410 a!2850) (index!52827 lt!653584)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157797 (= lt!653584 e!840717)))

(declare-fun c!139122 () Bool)

(assert (=> d!157797 (= c!139122 (bvsge x!647 #b01111111111111111111111111111110))))

(assert (=> d!157797 (= lt!653585 (select (arr!48410 a!2850) index!625))))

(assert (=> d!157797 (validMask!0 mask!2661)))

(assert (=> d!157797 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48410 a!2850) j!87) a!2850 mask!2661) lt!653584)))

(declare-fun b!1503795 () Bool)

(assert (=> b!1503795 (= e!840716 (Found!12608 index!625))))

(declare-fun b!1503796 () Bool)

(assert (=> b!1503796 (= e!840718 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 x!647 mask!2661) vacantBefore!10 (select (arr!48410 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1503797 () Bool)

(assert (=> b!1503797 (= e!840717 e!840716)))

(declare-fun c!139123 () Bool)

(assert (=> b!1503797 (= c!139123 (= lt!653585 (select (arr!48410 a!2850) j!87)))))

(assert (= (and d!157797 c!139122) b!1503794))

(assert (= (and d!157797 (not c!139122)) b!1503797))

(assert (= (and b!1503797 c!139123) b!1503795))

(assert (= (and b!1503797 (not c!139123)) b!1503793))

(assert (= (and b!1503793 c!139124) b!1503792))

(assert (= (and b!1503793 (not c!139124)) b!1503796))

(declare-fun m!1387027 () Bool)

(assert (=> d!157797 m!1387027))

(declare-fun m!1387029 () Bool)

(assert (=> d!157797 m!1387029))

(assert (=> d!157797 m!1386923))

(assert (=> d!157797 m!1386943))

(assert (=> b!1503796 m!1386941))

(assert (=> b!1503796 m!1386941))

(assert (=> b!1503796 m!1386919))

(declare-fun m!1387031 () Bool)

(assert (=> b!1503796 m!1387031))

(assert (=> b!1503664 d!157797))

(declare-fun d!157811 () Bool)

(declare-fun res!1024629 () Bool)

(declare-fun e!840742 () Bool)

(assert (=> d!157811 (=> res!1024629 e!840742)))

(assert (=> d!157811 (= res!1024629 (bvsge #b00000000000000000000000000000000 (size!48960 a!2850)))))

(assert (=> d!157811 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!840742)))

(declare-fun b!1503827 () Bool)

(declare-fun e!840741 () Bool)

(declare-fun call!68115 () Bool)

(assert (=> b!1503827 (= e!840741 call!68115)))

(declare-fun b!1503828 () Bool)

(declare-fun e!840740 () Bool)

(assert (=> b!1503828 (= e!840740 call!68115)))

(declare-fun b!1503829 () Bool)

(assert (=> b!1503829 (= e!840742 e!840740)))

(declare-fun c!139133 () Bool)

(assert (=> b!1503829 (= c!139133 (validKeyInArray!0 (select (arr!48410 a!2850) #b00000000000000000000000000000000)))))

(declare-fun bm!68112 () Bool)

(assert (=> bm!68112 (= call!68115 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(declare-fun b!1503830 () Bool)

(assert (=> b!1503830 (= e!840740 e!840741)))

(declare-fun lt!653599 () (_ BitVec 64))

(assert (=> b!1503830 (= lt!653599 (select (arr!48410 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50264 0))(
  ( (Unit!50265) )
))
(declare-fun lt!653598 () Unit!50264)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100307 (_ BitVec 64) (_ BitVec 32)) Unit!50264)

(assert (=> b!1503830 (= lt!653598 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!653599 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1503830 (arrayContainsKey!0 a!2850 lt!653599 #b00000000000000000000000000000000)))

(declare-fun lt!653597 () Unit!50264)

(assert (=> b!1503830 (= lt!653597 lt!653598)))

(declare-fun res!1024630 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100307 (_ BitVec 32)) SeekEntryResult!12608)

(assert (=> b!1503830 (= res!1024630 (= (seekEntryOrOpen!0 (select (arr!48410 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12608 #b00000000000000000000000000000000)))))

(assert (=> b!1503830 (=> (not res!1024630) (not e!840741))))

(assert (= (and d!157811 (not res!1024629)) b!1503829))

(assert (= (and b!1503829 c!139133) b!1503830))

(assert (= (and b!1503829 (not c!139133)) b!1503828))

(assert (= (and b!1503830 res!1024630) b!1503827))

(assert (= (or b!1503827 b!1503828) bm!68112))

(declare-fun m!1387049 () Bool)

(assert (=> b!1503829 m!1387049))

(assert (=> b!1503829 m!1387049))

(declare-fun m!1387051 () Bool)

(assert (=> b!1503829 m!1387051))

(declare-fun m!1387053 () Bool)

(assert (=> bm!68112 m!1387053))

(assert (=> b!1503830 m!1387049))

(declare-fun m!1387055 () Bool)

(assert (=> b!1503830 m!1387055))

(declare-fun m!1387057 () Bool)

(assert (=> b!1503830 m!1387057))

(assert (=> b!1503830 m!1387049))

(declare-fun m!1387059 () Bool)

(assert (=> b!1503830 m!1387059))

(assert (=> b!1503660 d!157811))

(declare-fun d!157819 () Bool)

(declare-fun lt!653602 () (_ BitVec 32))

(assert (=> d!157819 (and (bvsge lt!653602 #b00000000000000000000000000000000) (bvslt lt!653602 (bvadd mask!2661 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!157819 (= lt!653602 (choose!52 index!625 x!647 mask!2661))))

(assert (=> d!157819 (validMask!0 mask!2661)))

(assert (=> d!157819 (= (nextIndex!0 index!625 x!647 mask!2661) lt!653602)))

(declare-fun bs!43176 () Bool)

(assert (= bs!43176 d!157819))

(declare-fun m!1387061 () Bool)

(assert (=> bs!43176 m!1387061))

(assert (=> bs!43176 m!1386943))

(assert (=> b!1503666 d!157819))

(declare-fun bm!68118 () Bool)

(declare-fun call!68121 () Bool)

(declare-fun c!139139 () Bool)

(assert (=> bm!68118 (= call!68121 (arrayNoDuplicates!0 a!2850 (bvadd 