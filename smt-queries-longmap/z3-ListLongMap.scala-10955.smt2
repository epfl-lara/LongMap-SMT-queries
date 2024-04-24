; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128492 () Bool)

(assert start!128492)

(declare-fun b!1506974 () Bool)

(declare-fun e!842388 () Bool)

(declare-fun e!842390 () Bool)

(assert (=> b!1506974 (= e!842388 e!842390)))

(declare-fun res!1026396 () Bool)

(assert (=> b!1506974 (=> (not res!1026396) (not e!842390))))

(declare-datatypes ((array!100504 0))(
  ( (array!100505 (arr!48499 (Array (_ BitVec 32) (_ BitVec 64))) (size!49050 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100504)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1506974 (= res!1026396 (and (= (select (store (arr!48499 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!49050 a!2850))))))

(declare-fun lt!654574 () array!100504)

(assert (=> b!1506974 (= lt!654574 (array!100505 (store (arr!48499 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49050 a!2850)))))

(declare-fun b!1506975 () Bool)

(declare-fun res!1026394 () Bool)

(assert (=> b!1506975 (=> (not res!1026394) (not e!842388))))

(declare-datatypes ((List!34978 0))(
  ( (Nil!34975) (Cons!34974 (h!36386 (_ BitVec 64)) (t!49664 List!34978)) )
))
(declare-fun arrayNoDuplicates!0 (array!100504 (_ BitVec 32) List!34978) Bool)

(assert (=> b!1506975 (= res!1026394 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34975))))

(declare-fun res!1026390 () Bool)

(assert (=> start!128492 (=> (not res!1026390) (not e!842388))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128492 (= res!1026390 (validMask!0 mask!2661))))

(assert (=> start!128492 e!842388))

(assert (=> start!128492 true))

(declare-fun array_inv!37780 (array!100504) Bool)

(assert (=> start!128492 (array_inv!37780 a!2850)))

(declare-fun b!1506976 () Bool)

(declare-fun res!1026388 () Bool)

(assert (=> b!1506976 (=> (not res!1026388) (not e!842388))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506976 (= res!1026388 (validKeyInArray!0 (select (arr!48499 a!2850) j!87)))))

(declare-fun b!1506977 () Bool)

(declare-fun res!1026393 () Bool)

(assert (=> b!1506977 (=> (not res!1026393) (not e!842388))))

(assert (=> b!1506977 (= res!1026393 (validKeyInArray!0 (select (arr!48499 a!2850) i!996)))))

(declare-fun b!1506978 () Bool)

(declare-fun res!1026387 () Bool)

(declare-fun e!842387 () Bool)

(assert (=> b!1506978 (=> (not res!1026387) (not e!842387))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12590 0))(
  ( (MissingZero!12590 (index!52752 (_ BitVec 32))) (Found!12590 (index!52753 (_ BitVec 32))) (Intermediate!12590 (undefined!13402 Bool) (index!52754 (_ BitVec 32)) (x!134637 (_ BitVec 32))) (Undefined!12590) (MissingVacant!12590 (index!52755 (_ BitVec 32))) )
))
(declare-fun lt!654570 () SeekEntryResult!12590)

(declare-fun lt!654573 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100504 (_ BitVec 32)) SeekEntryResult!12590)

(assert (=> b!1506978 (= res!1026387 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!654573 vacantBefore!10 (select (arr!48499 a!2850) j!87) a!2850 mask!2661) lt!654570))))

(declare-fun b!1506979 () Bool)

(declare-fun e!842391 () Bool)

(assert (=> b!1506979 (= e!842390 e!842391)))

(declare-fun res!1026397 () Bool)

(assert (=> b!1506979 (=> (not res!1026397) (not e!842391))))

(assert (=> b!1506979 (= res!1026397 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48499 a!2850) j!87) a!2850 mask!2661) lt!654570))))

(assert (=> b!1506979 (= lt!654570 (Found!12590 j!87))))

(declare-fun lt!654571 () (_ BitVec 64))

(declare-fun b!1506980 () Bool)

(assert (=> b!1506980 (= e!842387 (not (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantAfter!10 lt!654571 lt!654574 mask!2661) lt!654570)))))

(assert (=> b!1506980 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!654573 vacantAfter!10 lt!654571 lt!654574 mask!2661) lt!654570)))

(assert (=> b!1506980 (= lt!654571 (select (store (arr!48499 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87))))

(declare-datatypes ((Unit!50221 0))(
  ( (Unit!50222) )
))
(declare-fun lt!654572 () Unit!50221)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100504 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50221)

(assert (=> b!1506980 (= lt!654572 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!654573 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1506981 () Bool)

(declare-fun res!1026392 () Bool)

(assert (=> b!1506981 (=> (not res!1026392) (not e!842388))))

(assert (=> b!1506981 (= res!1026392 (and (= (size!49050 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!49050 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!49050 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1506982 () Bool)

(declare-fun res!1026389 () Bool)

(assert (=> b!1506982 (=> (not res!1026389) (not e!842391))))

(assert (=> b!1506982 (= res!1026389 (not (= (select (arr!48499 a!2850) index!625) (select (arr!48499 a!2850) j!87))))))

(declare-fun b!1506983 () Bool)

(declare-fun res!1026398 () Bool)

(assert (=> b!1506983 (=> (not res!1026398) (not e!842388))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100504 (_ BitVec 32)) Bool)

(assert (=> b!1506983 (= res!1026398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1506984 () Bool)

(assert (=> b!1506984 (= e!842391 e!842387)))

(declare-fun res!1026391 () Bool)

(assert (=> b!1506984 (=> (not res!1026391) (not e!842387))))

(assert (=> b!1506984 (= res!1026391 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!654573 #b00000000000000000000000000000000) (bvslt lt!654573 (size!49050 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506984 (= lt!654573 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1506985 () Bool)

(declare-fun res!1026395 () Bool)

(assert (=> b!1506985 (=> (not res!1026395) (not e!842388))))

(assert (=> b!1506985 (= res!1026395 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!49050 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!49050 a!2850)) (= (select (arr!48499 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!128492 res!1026390) b!1506981))

(assert (= (and b!1506981 res!1026392) b!1506977))

(assert (= (and b!1506977 res!1026393) b!1506976))

(assert (= (and b!1506976 res!1026388) b!1506983))

(assert (= (and b!1506983 res!1026398) b!1506975))

(assert (= (and b!1506975 res!1026394) b!1506985))

(assert (= (and b!1506985 res!1026395) b!1506974))

(assert (= (and b!1506974 res!1026396) b!1506979))

(assert (= (and b!1506979 res!1026397) b!1506982))

(assert (= (and b!1506982 res!1026389) b!1506984))

(assert (= (and b!1506984 res!1026391) b!1506978))

(assert (= (and b!1506978 res!1026387) b!1506980))

(declare-fun m!1390047 () Bool)

(assert (=> b!1506975 m!1390047))

(declare-fun m!1390049 () Bool)

(assert (=> b!1506979 m!1390049))

(assert (=> b!1506979 m!1390049))

(declare-fun m!1390051 () Bool)

(assert (=> b!1506979 m!1390051))

(declare-fun m!1390053 () Bool)

(assert (=> b!1506977 m!1390053))

(assert (=> b!1506977 m!1390053))

(declare-fun m!1390055 () Bool)

(assert (=> b!1506977 m!1390055))

(declare-fun m!1390057 () Bool)

(assert (=> b!1506982 m!1390057))

(assert (=> b!1506982 m!1390049))

(assert (=> b!1506978 m!1390049))

(assert (=> b!1506978 m!1390049))

(declare-fun m!1390059 () Bool)

(assert (=> b!1506978 m!1390059))

(assert (=> b!1506976 m!1390049))

(assert (=> b!1506976 m!1390049))

(declare-fun m!1390061 () Bool)

(assert (=> b!1506976 m!1390061))

(declare-fun m!1390063 () Bool)

(assert (=> b!1506984 m!1390063))

(declare-fun m!1390065 () Bool)

(assert (=> b!1506980 m!1390065))

(declare-fun m!1390067 () Bool)

(assert (=> b!1506980 m!1390067))

(declare-fun m!1390069 () Bool)

(assert (=> b!1506980 m!1390069))

(declare-fun m!1390071 () Bool)

(assert (=> b!1506980 m!1390071))

(declare-fun m!1390073 () Bool)

(assert (=> b!1506980 m!1390073))

(declare-fun m!1390075 () Bool)

(assert (=> b!1506985 m!1390075))

(declare-fun m!1390077 () Bool)

(assert (=> b!1506983 m!1390077))

(declare-fun m!1390079 () Bool)

(assert (=> start!128492 m!1390079))

(declare-fun m!1390081 () Bool)

(assert (=> start!128492 m!1390081))

(assert (=> b!1506974 m!1390069))

(declare-fun m!1390083 () Bool)

(assert (=> b!1506974 m!1390083))

(check-sat (not b!1506979) (not b!1506975) (not b!1506978) (not start!128492) (not b!1506984) (not b!1506983) (not b!1506977) (not b!1506976) (not b!1506980))
(check-sat)
(get-model)

(declare-fun d!158467 () Bool)

(assert (=> d!158467 (= (validKeyInArray!0 (select (arr!48499 a!2850) j!87)) (and (not (= (select (arr!48499 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48499 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1506976 d!158467))

(declare-fun d!158469 () Bool)

(assert (=> d!158469 (= (validKeyInArray!0 (select (arr!48499 a!2850) i!996)) (and (not (= (select (arr!48499 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48499 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1506977 d!158469))

(declare-fun bm!68262 () Bool)

(declare-fun call!68265 () Bool)

(assert (=> bm!68262 (= call!68265 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(declare-fun b!1507066 () Bool)

(declare-fun e!842428 () Bool)

(declare-fun e!842430 () Bool)

(assert (=> b!1507066 (= e!842428 e!842430)))

(declare-fun lt!654613 () (_ BitVec 64))

(assert (=> b!1507066 (= lt!654613 (select (arr!48499 a!2850) #b00000000000000000000000000000000))))

(declare-fun lt!654612 () Unit!50221)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100504 (_ BitVec 64) (_ BitVec 32)) Unit!50221)

(assert (=> b!1507066 (= lt!654612 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!654613 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100504 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1507066 (arrayContainsKey!0 a!2850 lt!654613 #b00000000000000000000000000000000)))

(declare-fun lt!654611 () Unit!50221)

(assert (=> b!1507066 (= lt!654611 lt!654612)))

(declare-fun res!1026476 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100504 (_ BitVec 32)) SeekEntryResult!12590)

(assert (=> b!1507066 (= res!1026476 (= (seekEntryOrOpen!0 (select (arr!48499 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12590 #b00000000000000000000000000000000)))))

(assert (=> b!1507066 (=> (not res!1026476) (not e!842430))))

(declare-fun b!1507067 () Bool)

(assert (=> b!1507067 (= e!842428 call!68265)))

(declare-fun d!158471 () Bool)

(declare-fun res!1026475 () Bool)

(declare-fun e!842429 () Bool)

(assert (=> d!158471 (=> res!1026475 e!842429)))

(assert (=> d!158471 (= res!1026475 (bvsge #b00000000000000000000000000000000 (size!49050 a!2850)))))

(assert (=> d!158471 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!842429)))

(declare-fun b!1507068 () Bool)

(assert (=> b!1507068 (= e!842429 e!842428)))

(declare-fun c!139840 () Bool)

(assert (=> b!1507068 (= c!139840 (validKeyInArray!0 (select (arr!48499 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1507069 () Bool)

(assert (=> b!1507069 (= e!842430 call!68265)))

(assert (= (and d!158471 (not res!1026475)) b!1507068))

(assert (= (and b!1507068 c!139840) b!1507066))

(assert (= (and b!1507068 (not c!139840)) b!1507067))

(assert (= (and b!1507066 res!1026476) b!1507069))

(assert (= (or b!1507069 b!1507067) bm!68262))

(declare-fun m!1390161 () Bool)

(assert (=> bm!68262 m!1390161))

(declare-fun m!1390163 () Bool)

(assert (=> b!1507066 m!1390163))

(declare-fun m!1390165 () Bool)

(assert (=> b!1507066 m!1390165))

(declare-fun m!1390167 () Bool)

(assert (=> b!1507066 m!1390167))

(assert (=> b!1507066 m!1390163))

(declare-fun m!1390169 () Bool)

(assert (=> b!1507066 m!1390169))

(assert (=> b!1507068 m!1390163))

(assert (=> b!1507068 m!1390163))

(declare-fun m!1390171 () Bool)

(assert (=> b!1507068 m!1390171))

(assert (=> b!1506983 d!158471))

(declare-fun b!1507082 () Bool)

(declare-fun e!842438 () SeekEntryResult!12590)

(assert (=> b!1507082 (= e!842438 (MissingVacant!12590 vacantBefore!10))))

(declare-fun b!1507083 () Bool)

(declare-fun c!139847 () Bool)

(declare-fun lt!654618 () (_ BitVec 64))

(assert (=> b!1507083 (= c!139847 (= lt!654618 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!842437 () SeekEntryResult!12590)

(assert (=> b!1507083 (= e!842437 e!842438)))

(declare-fun d!158473 () Bool)

(declare-fun lt!654619 () SeekEntryResult!12590)

(get-info :version)

(assert (=> d!158473 (and (or ((_ is Undefined!12590) lt!654619) (not ((_ is Found!12590) lt!654619)) (and (bvsge (index!52753 lt!654619) #b00000000000000000000000000000000) (bvslt (index!52753 lt!654619) (size!49050 a!2850)))) (or ((_ is Undefined!12590) lt!654619) ((_ is Found!12590) lt!654619) (not ((_ is MissingVacant!12590) lt!654619)) (not (= (index!52755 lt!654619) vacantBefore!10)) (and (bvsge (index!52755 lt!654619) #b00000000000000000000000000000000) (bvslt (index!52755 lt!654619) (size!49050 a!2850)))) (or ((_ is Undefined!12590) lt!654619) (ite ((_ is Found!12590) lt!654619) (= (select (arr!48499 a!2850) (index!52753 lt!654619)) (select (arr!48499 a!2850) j!87)) (and ((_ is MissingVacant!12590) lt!654619) (= (index!52755 lt!654619) vacantBefore!10) (= (select (arr!48499 a!2850) (index!52755 lt!654619)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!842439 () SeekEntryResult!12590)

(assert (=> d!158473 (= lt!654619 e!842439)))

(declare-fun c!139848 () Bool)

(assert (=> d!158473 (= c!139848 (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110))))

(assert (=> d!158473 (= lt!654618 (select (arr!48499 a!2850) lt!654573))))

(assert (=> d!158473 (validMask!0 mask!2661)))

(assert (=> d!158473 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!654573 vacantBefore!10 (select (arr!48499 a!2850) j!87) a!2850 mask!2661) lt!654619)))

(declare-fun b!1507084 () Bool)

(assert (=> b!1507084 (= e!842437 (Found!12590 lt!654573))))

(declare-fun b!1507085 () Bool)

(assert (=> b!1507085 (= e!842439 Undefined!12590)))

(declare-fun b!1507086 () Bool)

(assert (=> b!1507086 (= e!842439 e!842437)))

(declare-fun c!139849 () Bool)

(assert (=> b!1507086 (= c!139849 (= lt!654618 (select (arr!48499 a!2850) j!87)))))

(declare-fun b!1507087 () Bool)

(assert (=> b!1507087 (= e!842438 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647 #b00000000000000000000000000000001) (nextIndex!0 lt!654573 (bvadd #b00000000000000000000000000000001 x!647 #b00000000000000000000000000000001) mask!2661) vacantBefore!10 (select (arr!48499 a!2850) j!87) a!2850 mask!2661))))

(assert (= (and d!158473 c!139848) b!1507085))

(assert (= (and d!158473 (not c!139848)) b!1507086))

(assert (= (and b!1507086 c!139849) b!1507084))

(assert (= (and b!1507086 (not c!139849)) b!1507083))

(assert (= (and b!1507083 c!139847) b!1507082))

(assert (= (and b!1507083 (not c!139847)) b!1507087))

(declare-fun m!1390173 () Bool)

(assert (=> d!158473 m!1390173))

(declare-fun m!1390175 () Bool)

(assert (=> d!158473 m!1390175))

(declare-fun m!1390177 () Bool)

(assert (=> d!158473 m!1390177))

(assert (=> d!158473 m!1390079))

(declare-fun m!1390179 () Bool)

(assert (=> b!1507087 m!1390179))

(assert (=> b!1507087 m!1390179))

(assert (=> b!1507087 m!1390049))

(declare-fun m!1390181 () Bool)

(assert (=> b!1507087 m!1390181))

(assert (=> b!1506978 d!158473))

(declare-fun d!158475 () Bool)

(declare-fun lt!654622 () (_ BitVec 32))

(assert (=> d!158475 (and (bvsge lt!654622 #b00000000000000000000000000000000) (bvslt lt!654622 (bvadd mask!2661 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!158475 (= lt!654622 (choose!52 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(assert (=> d!158475 (validMask!0 mask!2661)))

(assert (=> d!158475 (= (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661) lt!654622)))

(declare-fun bs!43224 () Bool)

(assert (= bs!43224 d!158475))

(declare-fun m!1390183 () Bool)

(assert (=> bs!43224 m!1390183))

(assert (=> bs!43224 m!1390079))

(assert (=> b!1506984 d!158475))

(declare-fun d!158477 () Bool)

(assert (=> d!158477 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!128492 d!158477))

(declare-fun d!158487 () Bool)

(assert (=> d!158487 (= (array_inv!37780 a!2850) (bvsge (size!49050 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!128492 d!158487))

(declare-fun b!1507088 () Bool)

(declare-fun e!842441 () SeekEntryResult!12590)

(assert (=> b!1507088 (= e!842441 (MissingVacant!12590 vacantBefore!10))))

(declare-fun b!1507089 () Bool)

(declare-fun c!139850 () Bool)

(declare-fun lt!654626 () (_ BitVec 64))

(assert (=> b!1507089 (= c!139850 (= lt!654626 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!842440 () SeekEntryResult!12590)

(assert (=> b!1507089 (= e!842440 e!842441)))

(declare-fun d!158489 () Bool)

(declare-fun lt!654627 () SeekEntryResult!12590)

(assert (=> d!158489 (and (or ((_ is Undefined!12590) lt!654627) (not ((_ is Found!12590) lt!654627)) (and (bvsge (index!52753 lt!654627) #b00000000000000000000000000000000) (bvslt (index!52753 lt!654627) (size!49050 a!2850)))) (or ((_ is Undefined!12590) lt!654627) ((_ is Found!12590) lt!654627) (not ((_ is MissingVacant!12590) lt!654627)) (not (= (index!52755 lt!654627) vacantBefore!10)) (and (bvsge (index!52755 lt!654627) #b00000000000000000000000000000000) (bvslt (index!52755 lt!654627) (size!49050 a!2850)))) (or ((_ is Undefined!12590) lt!654627) (ite ((_ is Found!12590) lt!654627) (= (select (arr!48499 a!2850) (index!52753 lt!654627)) (select (arr!48499 a!2850) j!87)) (and ((_ is MissingVacant!12590) lt!654627) (= (index!52755 lt!654627) vacantBefore!10) (= (select (arr!48499 a!2850) (index!52755 lt!654627)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!842442 () SeekEntryResult!12590)

(assert (=> d!158489 (= lt!654627 e!842442)))

(declare-fun c!139851 () Bool)

(assert (=> d!158489 (= c!139851 (bvsge x!647 #b01111111111111111111111111111110))))

(assert (=> d!158489 (= lt!654626 (select (arr!48499 a!2850) index!625))))

(assert (=> d!158489 (validMask!0 mask!2661)))

(assert (=> d!158489 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48499 a!2850) j!87) a!2850 mask!2661) lt!654627)))

(declare-fun b!1507090 () Bool)

(assert (=> b!1507090 (= e!842440 (Found!12590 index!625))))

(declare-fun b!1507091 () Bool)

(assert (=> b!1507091 (= e!842442 Undefined!12590)))

(declare-fun b!1507092 () Bool)

(assert (=> b!1507092 (= e!842442 e!842440)))

(declare-fun c!139852 () Bool)

(assert (=> b!1507092 (= c!139852 (= lt!654626 (select (arr!48499 a!2850) j!87)))))

(declare-fun b!1507093 () Bool)

(assert (=> b!1507093 (= e!842441 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 (bvadd x!647 #b00000000000000000000000000000001) mask!2661) vacantBefore!10 (select (arr!48499 a!2850) j!87) a!2850 mask!2661))))

(assert (= (and d!158489 c!139851) b!1507091))

(assert (= (and d!158489 (not c!139851)) b!1507092))

(assert (= (and b!1507092 c!139852) b!1507090))

(assert (= (and b!1507092 (not c!139852)) b!1507089))

(assert (= (and b!1507089 c!139850) b!1507088))

(assert (= (and b!1507089 (not c!139850)) b!1507093))

(declare-fun m!1390187 () Bool)

(assert (=> d!158489 m!1390187))

(declare-fun m!1390189 () Bool)

(assert (=> d!158489 m!1390189))

(assert (=> d!158489 m!1390057))

(assert (=> d!158489 m!1390079))

(declare-fun m!1390191 () Bool)

(assert (=> b!1507093 m!1390191))

(assert (=> b!1507093 m!1390191))

(assert (=> b!1507093 m!1390049))

(declare-fun m!1390193 () Bool)

(assert (=> b!1507093 m!1390193))

(assert (=> b!1506979 d!158489))

(declare-fun b!1507100 () Bool)

(declare-fun e!842448 () SeekEntryResult!12590)

(assert (=> b!1507100 (= e!842448 (MissingVacant!12590 vacantAfter!10))))

(declare-fun b!1507101 () Bool)

(declare-fun c!139855 () Bool)

(declare-fun lt!654634 () (_ BitVec 64))

(assert (=> b!1507101 (= c!139855 (= lt!654634 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!842447 () SeekEntryResult!12590)

(assert (=> b!1507101 (= e!842447 e!842448)))

(declare-fun lt!654635 () SeekEntryResult!12590)

(declare-fun d!158491 () Bool)

(assert (=> d!158491 (and (or ((_ is Undefined!12590) lt!654635) (not ((_ is Found!12590) lt!654635)) (and (bvsge (index!52753 lt!654635) #b00000000000000000000000000000000) (bvslt (index!52753 lt!654635) (size!49050 lt!654574)))) (or ((_ is Undefined!12590) lt!654635) ((_ is Found!12590) lt!654635) (not ((_ is MissingVacant!12590) lt!654635)) (not (= (index!52755 lt!654635) vacantAfter!10)) (and (bvsge (index!52755 lt!654635) #b00000000000000000000000000000000) (bvslt (index!52755 lt!654635) (size!49050 lt!654574)))) (or ((_ is Undefined!12590) lt!654635) (ite ((_ is Found!12590) lt!654635) (= (select (arr!48499 lt!654574) (index!52753 lt!654635)) lt!654571) (and ((_ is MissingVacant!12590) lt!654635) (= (index!52755 lt!654635) vacantAfter!10) (= (select (arr!48499 lt!654574) (index!52755 lt!654635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!842449 () SeekEntryResult!12590)

(assert (=> d!158491 (= lt!654635 e!842449)))

(declare-fun c!139856 () Bool)

(assert (=> d!158491 (= c!139856 (bvsge x!647 #b01111111111111111111111111111110))))

(assert (=> d!158491 (= lt!654634 (select (arr!48499 lt!654574) index!625))))

(assert (=> d!158491 (validMask!0 mask!2661)))

(assert (=> d!158491 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantAfter!10 lt!654571 lt!654574 mask!2661) lt!654635)))

(declare-fun b!1507102 () Bool)

(assert (=> b!1507102 (= e!842447 (Found!12590 index!625))))

(declare-fun b!1507103 () Bool)

(assert (=> b!1507103 (= e!842449 Undefined!12590)))

(declare-fun b!1507104 () Bool)

(assert (=> b!1507104 (= e!842449 e!842447)))

(declare-fun c!139857 () Bool)

(assert (=> b!1507104 (= c!139857 (= lt!654634 lt!654571))))

(declare-fun b!1507105 () Bool)

(assert (=> b!1507105 (= e!842448 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 (bvadd x!647 #b00000000000000000000000000000001) mask!2661) vacantAfter!10 lt!654571 lt!654574 mask!2661))))

(assert (= (and d!158491 c!139856) b!1507103))

(assert (= (and d!158491 (not c!139856)) b!1507104))

(assert (= (and b!1507104 c!139857) b!1507102))

(assert (= (and b!1507104 (not c!139857)) b!1507101))

(assert (= (and b!1507101 c!139855) b!1507100))

(assert (= (and b!1507101 (not c!139855)) b!1507105))

(declare-fun m!1390195 () Bool)

(assert (=> d!158491 m!1390195))

(declare-fun m!1390197 () Bool)

(assert (=> d!158491 m!1390197))

(declare-fun m!1390199 () Bool)

(assert (=> d!158491 m!1390199))

(assert (=> d!158491 m!1390079))

(assert (=> b!1507105 m!1390191))

(assert (=> b!1507105 m!1390191))

(declare-fun m!1390201 () Bool)

(assert (=> b!1507105 m!1390201))

(assert (=> b!1506980 d!158491))

(declare-fun b!1507108 () Bool)

(declare-fun e!842453 () SeekEntryResult!12590)

(assert (=> b!1507108 (= e!842453 (MissingVacant!12590 vacantAfter!10))))

(declare-fun b!1507109 () Bool)

(declare-fun c!139858 () Bool)

(declare-fun lt!654636 () (_ BitVec 64))

(assert (=> b!1507109 (= c!139858 (= lt!654636 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!842452 () SeekEntryResult!12590)

(assert (=> b!1507109 (= e!842452 e!842453)))

(declare-fun d!158495 () Bool)

(declare-fun lt!654637 () SeekEntryResult!12590)

(assert (=> d!158495 (and (or ((_ is Undefined!12590) lt!654637) (not ((_ is Found!12590) lt!654637)) (and (bvsge (index!52753 lt!654637) #b00000000000000000000000000000000) (bvslt (index!52753 lt!654637) (size!49050 lt!654574)))) (or ((_ is Undefined!12590) lt!654637) ((_ is Found!12590) lt!654637) (not ((_ is MissingVacant!12590) lt!654637)) (not (= (index!52755 lt!654637) vacantAfter!10)) (and (bvsge (index!52755 lt!654637) #b00000000000000000000000000000000) (bvslt (index!52755 lt!654637) (size!49050 lt!654574)))) (or ((_ is Undefined!12590) lt!654637) (ite ((_ is Found!12590) lt!654637) (= (select (arr!48499 lt!654574) (index!52753 lt!654637)) lt!654571) (and ((_ is MissingVacant!12590) lt!654637) (= (index!52755 lt!654637) vacantAfter!10) (= (select (arr!48499 lt!654574) (index!52755 lt!654637)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!842454 () SeekEntryResult!12590)

(assert (=> d!158495 (= lt!654637 e!842454)))

(declare-fun c!139859 () Bool)

(assert (=> d!158495 (= c!139859 (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110))))

(assert (=> d!158495 (= lt!654636 (select (arr!48499 lt!654574) lt!654573))))

(assert (=> d!158495 (validMask!0 mask!2661)))

(assert (=> d!158495 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!654573 vacantAfter!10 lt!654571 lt!654574 mask!2661) lt!654637)))

(declare-fun b!1507110 () Bool)

(assert (=> b!1507110 (= e!842452 (Found!12590 lt!654573))))

(declare-fun b!1507111 () Bool)

(assert (=> b!1507111 (= e!842454 Undefined!12590)))

(declare-fun b!1507112 () Bool)

(assert (=> b!1507112 (= e!842454 e!842452)))

(declare-fun c!139860 () Bool)

(assert (=> b!1507112 (= c!139860 (= lt!654636 lt!654571))))

(declare-fun b!1507113 () Bool)

(assert (=> b!1507113 (= e!842453 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647 #b00000000000000000000000000000001) (nextIndex!0 lt!654573 (bvadd #b00000000000000000000000000000001 x!647 #b00000000000000000000000000000001) mask!2661) vacantAfter!10 lt!654571 lt!654574 mask!2661))))

(assert (= (and d!158495 c!139859) b!1507111))

(assert (= (and d!158495 (not c!139859)) b!1507112))

(assert (= (and b!1507112 c!139860) b!1507110))

(assert (= (and b!1507112 (not c!139860)) b!1507109))

(assert (= (and b!1507109 c!139858) b!1507108))

(assert (= (and b!1507109 (not c!139858)) b!1507113))

(declare-fun m!1390203 () Bool)

(assert (=> d!158495 m!1390203))

(declare-fun m!1390205 () Bool)

(assert (=> d!158495 m!1390205))

(declare-fun m!1390207 () Bool)

(assert (=> d!158495 m!1390207))

(assert (=> d!158495 m!1390079))

(assert (=> b!1507113 m!1390179))

(assert (=> b!1507113 m!1390179))

(declare-fun m!1390209 () Bool)

(assert (=> b!1507113 m!1390209))

(assert (=> b!1506980 d!158495))

(declare-fun d!158497 () Bool)

(declare-fun e!842469 () Bool)

(assert (=> d!158497 e!842469))

(declare-fun res!1026491 () Bool)

(assert (=> d!158497 (=> (not res!1026491) (not e!842469))))

(assert (=> d!158497 (= res!1026491 (and (or (bvslt i!996 #b00000000000000000000000000000000) (bvsge i!996 (size!49050 a!2850)) (and (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!49050 a!2850)))) (or (bvslt i!996 #b00000000000000000000000000000000) (bvsge i!996 (size!49050 a!2850)) (and (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!49050 a!2850)))) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!49050 a!2850))))))

(declare-fun lt!654655 () Unit!50221)

(declare-fun choose!27 (array!100504 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50221)

(assert (=> d!158497 (= lt!654655 (choose!27 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!654573 vacantBefore!10 vacantAfter!10 mask!2661))))

(assert (=> d!158497 (validMask!0 mask!2661)))

(assert (=> d!158497 (= (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!654573 vacantBefore!10 vacantAfter!10 mask!2661) lt!654655)))

(declare-fun b!1507132 () Bool)

(assert (=> b!1507132 (= e!842469 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!654573 vacantAfter!10 (select (store (arr!48499 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100505 (store (arr!48499 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49050 a!2850)) mask!2661) (Found!12590 j!87)))))

(assert (= (and d!158497 res!1026491) b!1507132))

(declare-fun m!1390237 () Bool)

(assert (=> d!158497 m!1390237))

(assert (=> d!158497 m!1390079))

(assert (=> b!1507132 m!1390069))

(assert (=> b!1507132 m!1390065))

(assert (=> b!1507132 m!1390065))

(declare-fun m!1390239 () Bool)

(assert (=> b!1507132 m!1390239))

(assert (=> b!1506980 d!158497))

(declare-fun b!1507161 () Bool)

(declare-fun e!842490 () Bool)

(declare-fun call!68274 () Bool)

(assert (=> b!1507161 (= e!842490 call!68274)))

(declare-fun b!1507162 () Bool)

(declare-fun e!842488 () Bool)

(declare-fun contains!9997 (List!34978 (_ BitVec 64)) Bool)

(assert (=> b!1507162 (= e!842488 (contains!9997 Nil!34975 (select (arr!48499 a!2850) #b00000000000000000000000000000000)))))

(declare-fun d!158505 () Bool)

(declare-fun res!1026500 () Bool)

(declare-fun e!842487 () Bool)

(assert (=> d!158505 (=> res!1026500 e!842487)))

(assert (=> d!158505 (= res!1026500 (bvsge #b00000000000000000000000000000000 (size!49050 a!2850)))))

(assert (=> d!158505 (= (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34975) e!842487)))

(declare-fun b!1507163 () Bool)

(declare-fun e!842489 () Bool)

(assert (=> b!1507163 (= e!842489 e!842490)))

(declare-fun c!139876 () Bool)

(assert (=> b!1507163 (= c!139876 (validKeyInArray!0 (select (arr!48499 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1507164 () Bool)

(assert (=> b!1507164 (= e!842490 call!68274)))

(declare-fun b!1507165 () Bool)

(assert (=> b!1507165 (= e!842487 e!842489)))

(declare-fun res!1026498 () Bool)

(assert (=> b!1507165 (=> (not res!1026498) (not e!842489))))

(assert (=> b!1507165 (= res!1026498 (not e!842488))))

(declare-fun res!1026499 () Bool)

(assert (=> b!1507165 (=> (not res!1026499) (not e!842488))))

(assert (=> b!1507165 (= res!1026499 (validKeyInArray!0 (select (arr!48499 a!2850) #b00000000000000000000000000000000)))))

(declare-fun bm!68271 () Bool)

(assert (=> bm!68271 (= call!68274 (arrayNoDuplicates!0 a!2850 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139876 (Cons!34974 (select (arr!48499 a!2850) #b00000000000000000000000000000000) Nil!34975) Nil!34975)))))

(assert (= (and d!158505 (not res!1026500)) b!1507165))

(assert (= (and b!1507165 res!1026499) b!1507162))

(assert (= (and b!1507165 res!1026498) b!1507163))

(assert (= (and b!1507163 c!139876) b!1507164))

(assert (= (and b!1507163 (not c!139876)) b!1507161))

(assert (= (or b!1507164 b!1507161) bm!68271))

(assert (=> b!1507162 m!1390163))

(assert (=> b!1507162 m!1390163))

(declare-fun m!1390251 () Bool)

(assert (=> b!1507162 m!1390251))

(assert (=> b!1507163 m!1390163))

(assert (=> b!1507163 m!1390163))

(assert (=> b!1507163 m!1390171))

(assert (=> b!1507165 m!1390163))

(assert (=> b!1507165 m!1390163))

(assert (=> b!1507165 m!1390171))

(assert (=> bm!68271 m!1390163))

(declare-fun m!1390253 () Bool)

(assert (=> bm!68271 m!1390253))

(assert (=> b!1506975 d!158505))

(check-sat (not b!1507087) (not b!1507132) (not b!1507163) (not b!1507165) (not b!1507068) (not d!158475) (not bm!68271) (not bm!68262) (not b!1507105) (not d!158473) (not b!1507093) (not b!1507066) (not b!1507162) (not d!158497) (not d!158489) (not d!158495) (not d!158491) (not b!1507113))
(check-sat)
