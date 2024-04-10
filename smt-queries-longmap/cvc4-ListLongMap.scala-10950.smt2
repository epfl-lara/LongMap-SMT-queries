; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128122 () Bool)

(assert start!128122)

(declare-fun b!1504559 () Bool)

(declare-fun res!1025265 () Bool)

(declare-fun e!840997 () Bool)

(assert (=> b!1504559 (=> (not res!1025265) (not e!840997))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100359 0))(
  ( (array!100360 (arr!48433 (Array (_ BitVec 32) (_ BitVec 64))) (size!48983 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100359)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1504559 (= res!1025265 (and (= (size!48983 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48983 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48983 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1504561 () Bool)

(declare-fun res!1025258 () Bool)

(assert (=> b!1504561 (=> (not res!1025258) (not e!840997))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504561 (= res!1025258 (validKeyInArray!0 (select (arr!48433 a!2850) j!87)))))

(declare-fun b!1504562 () Bool)

(declare-fun res!1025263 () Bool)

(assert (=> b!1504562 (=> (not res!1025263) (not e!840997))))

(assert (=> b!1504562 (= res!1025263 (validKeyInArray!0 (select (arr!48433 a!2850) i!996)))))

(declare-fun lt!653736 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun b!1504563 () Bool)

(declare-fun e!840994 () Bool)

(declare-datatypes ((SeekEntryResult!12631 0))(
  ( (MissingZero!12631 (index!52916 (_ BitVec 32))) (Found!12631 (index!52917 (_ BitVec 32))) (Intermediate!12631 (undefined!13443 Bool) (index!52918 (_ BitVec 32)) (x!134595 (_ BitVec 32))) (Undefined!12631) (MissingVacant!12631 (index!52919 (_ BitVec 32))) )
))
(declare-fun lt!653737 () SeekEntryResult!12631)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100359 (_ BitVec 32)) SeekEntryResult!12631)

(assert (=> b!1504563 (= e!840994 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653736 vacantBefore!10 (select (arr!48433 a!2850) j!87) a!2850 mask!2661) lt!653737)))))

(declare-fun b!1504564 () Bool)

(declare-fun e!840995 () Bool)

(assert (=> b!1504564 (= e!840997 e!840995)))

(declare-fun res!1025266 () Bool)

(assert (=> b!1504564 (=> (not res!1025266) (not e!840995))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1504564 (= res!1025266 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48433 a!2850) j!87) a!2850 mask!2661) lt!653737))))

(assert (=> b!1504564 (= lt!653737 (Found!12631 j!87))))

(declare-fun b!1504565 () Bool)

(declare-fun res!1025262 () Bool)

(assert (=> b!1504565 (=> (not res!1025262) (not e!840997))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1504565 (= res!1025262 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48983 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48983 a!2850)) (= (select (arr!48433 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48433 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48983 a!2850))))))

(declare-fun b!1504566 () Bool)

(declare-fun res!1025259 () Bool)

(assert (=> b!1504566 (=> (not res!1025259) (not e!840997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100359 (_ BitVec 32)) Bool)

(assert (=> b!1504566 (= res!1025259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1504567 () Bool)

(declare-fun res!1025257 () Bool)

(assert (=> b!1504567 (=> (not res!1025257) (not e!840995))))

(assert (=> b!1504567 (= res!1025257 (not (= (select (arr!48433 a!2850) index!625) (select (arr!48433 a!2850) j!87))))))

(declare-fun b!1504568 () Bool)

(declare-fun res!1025264 () Bool)

(assert (=> b!1504568 (=> (not res!1025264) (not e!840997))))

(declare-datatypes ((List!34925 0))(
  ( (Nil!34922) (Cons!34921 (h!36318 (_ BitVec 64)) (t!49619 List!34925)) )
))
(declare-fun arrayNoDuplicates!0 (array!100359 (_ BitVec 32) List!34925) Bool)

(assert (=> b!1504568 (= res!1025264 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34922))))

(declare-fun res!1025260 () Bool)

(assert (=> start!128122 (=> (not res!1025260) (not e!840997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128122 (= res!1025260 (validMask!0 mask!2661))))

(assert (=> start!128122 e!840997))

(assert (=> start!128122 true))

(declare-fun array_inv!37461 (array!100359) Bool)

(assert (=> start!128122 (array_inv!37461 a!2850)))

(declare-fun b!1504560 () Bool)

(assert (=> b!1504560 (= e!840995 e!840994)))

(declare-fun res!1025261 () Bool)

(assert (=> b!1504560 (=> (not res!1025261) (not e!840994))))

(assert (=> b!1504560 (= res!1025261 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653736 #b00000000000000000000000000000000) (bvslt lt!653736 (size!48983 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504560 (= lt!653736 (nextIndex!0 index!625 x!647 mask!2661))))

(assert (= (and start!128122 res!1025260) b!1504559))

(assert (= (and b!1504559 res!1025265) b!1504562))

(assert (= (and b!1504562 res!1025263) b!1504561))

(assert (= (and b!1504561 res!1025258) b!1504566))

(assert (= (and b!1504566 res!1025259) b!1504568))

(assert (= (and b!1504568 res!1025264) b!1504565))

(assert (= (and b!1504565 res!1025262) b!1504564))

(assert (= (and b!1504564 res!1025266) b!1504567))

(assert (= (and b!1504567 res!1025257) b!1504560))

(assert (= (and b!1504560 res!1025261) b!1504563))

(declare-fun m!1387711 () Bool)

(assert (=> b!1504564 m!1387711))

(assert (=> b!1504564 m!1387711))

(declare-fun m!1387713 () Bool)

(assert (=> b!1504564 m!1387713))

(declare-fun m!1387715 () Bool)

(assert (=> b!1504568 m!1387715))

(declare-fun m!1387717 () Bool)

(assert (=> b!1504567 m!1387717))

(assert (=> b!1504567 m!1387711))

(declare-fun m!1387719 () Bool)

(assert (=> b!1504562 m!1387719))

(assert (=> b!1504562 m!1387719))

(declare-fun m!1387721 () Bool)

(assert (=> b!1504562 m!1387721))

(declare-fun m!1387723 () Bool)

(assert (=> b!1504560 m!1387723))

(assert (=> b!1504563 m!1387711))

(assert (=> b!1504563 m!1387711))

(declare-fun m!1387725 () Bool)

(assert (=> b!1504563 m!1387725))

(declare-fun m!1387727 () Bool)

(assert (=> start!128122 m!1387727))

(declare-fun m!1387729 () Bool)

(assert (=> start!128122 m!1387729))

(declare-fun m!1387731 () Bool)

(assert (=> b!1504565 m!1387731))

(declare-fun m!1387733 () Bool)

(assert (=> b!1504565 m!1387733))

(declare-fun m!1387735 () Bool)

(assert (=> b!1504565 m!1387735))

(declare-fun m!1387737 () Bool)

(assert (=> b!1504566 m!1387737))

(assert (=> b!1504561 m!1387711))

(assert (=> b!1504561 m!1387711))

(declare-fun m!1387739 () Bool)

(assert (=> b!1504561 m!1387739))

(push 1)

(assert (not b!1504563))

(assert (not b!1504561))

(assert (not b!1504564))

(assert (not b!1504566))

(assert (not start!128122))

(assert (not b!1504562))

(assert (not b!1504568))

(assert (not b!1504560))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!157897 () Bool)

(assert (=> d!157897 (= (validKeyInArray!0 (select (arr!48433 a!2850) i!996)) (and (not (= (select (arr!48433 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48433 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1504562 d!157897))

(declare-fun d!157901 () Bool)

(assert (=> d!157901 (= (validKeyInArray!0 (select (arr!48433 a!2850) j!87)) (and (not (= (select (arr!48433 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48433 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1504561 d!157901))

(declare-fun b!1504617 () Bool)

(declare-fun e!841025 () SeekEntryResult!12631)

(declare-fun e!841026 () SeekEntryResult!12631)

(assert (=> b!1504617 (= e!841025 e!841026)))

(declare-fun lt!653766 () (_ BitVec 64))

(declare-fun c!139208 () Bool)

(assert (=> b!1504617 (= c!139208 (= lt!653766 (select (arr!48433 a!2850) j!87)))))

(declare-fun e!841027 () SeekEntryResult!12631)

(declare-fun b!1504618 () Bool)

(assert (=> b!1504618 (= e!841027 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647 #b00000000000000000000000000000001) (nextIndex!0 lt!653736 (bvadd #b00000000000000000000000000000001 x!647) mask!2661) vacantBefore!10 (select (arr!48433 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1504619 () Bool)

(assert (=> b!1504619 (= e!841027 (MissingVacant!12631 vacantBefore!10))))

(declare-fun b!1504620 () Bool)

(declare-fun c!139207 () Bool)

(assert (=> b!1504620 (= c!139207 (= lt!653766 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1504620 (= e!841026 e!841027)))

(declare-fun b!1504622 () Bool)

(assert (=> b!1504622 (= e!841025 Undefined!12631)))

(declare-fun d!157903 () Bool)

(declare-fun lt!653765 () SeekEntryResult!12631)

(assert (=> d!157903 (and (or (is-Undefined!12631 lt!653765) (not (is-Found!12631 lt!653765)) (and (bvsge (index!52917 lt!653765) #b00000000000000000000000000000000) (bvslt (index!52917 lt!653765) (size!48983 a!2850)))) (or (is-Undefined!12631 lt!653765) (is-Found!12631 lt!653765) (not (is-MissingVacant!12631 lt!653765)) (not (= (index!52919 lt!653765) vacantBefore!10)) (and (bvsge (index!52919 lt!653765) #b00000000000000000000000000000000) (bvslt (index!52919 lt!653765) (size!48983 a!2850)))) (or (is-Undefined!12631 lt!653765) (ite (is-Found!12631 lt!653765) (= (select (arr!48433 a!2850) (index!52917 lt!653765)) (select (arr!48433 a!2850) j!87)) (and (is-MissingVacant!12631 lt!653765) (= (index!52919 lt!653765) vacantBefore!10) (= (select (arr!48433 a!2850) (index!52919 lt!653765)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157903 (= lt!653765 e!841025)))

(declare-fun c!139206 () Bool)

(assert (=> d!157903 (= c!139206 (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110))))

(assert (=> d!157903 (= lt!653766 (select (arr!48433 a!2850) lt!653736))))

(assert (=> d!157903 (validMask!0 mask!2661)))

(assert (=> d!157903 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653736 vacantBefore!10 (select (arr!48433 a!2850) j!87) a!2850 mask!2661) lt!653765)))

(declare-fun b!1504621 () Bool)

(assert (=> b!1504621 (= e!841026 (Found!12631 lt!653736))))

(assert (= (and d!157903 c!139206) b!1504622))

(assert (= (and d!157903 (not c!139206)) b!1504617))

(assert (= (and b!1504617 c!139208) b!1504621))

(assert (= (and b!1504617 (not c!139208)) b!1504620))

(assert (= (and b!1504620 c!139207) b!1504619))

(assert (= (and b!1504620 (not c!139207)) b!1504618))

(declare-fun m!1387773 () Bool)

(assert (=> b!1504618 m!1387773))

(assert (=> b!1504618 m!1387773))

(assert (=> b!1504618 m!1387711))

(declare-fun m!1387775 () Bool)

(assert (=> b!1504618 m!1387775))

(declare-fun m!1387777 () Bool)

(assert (=> d!157903 m!1387777))

(declare-fun m!1387779 () Bool)

(assert (=> d!157903 m!1387779))

(declare-fun m!1387781 () Bool)

(assert (=> d!157903 m!1387781))

(assert (=> d!157903 m!1387727))

(assert (=> b!1504563 d!157903))

(declare-fun b!1504655 () Bool)

(declare-fun e!841052 () Bool)

(declare-fun contains!9953 (List!34925 (_ BitVec 64)) Bool)

(assert (=> b!1504655 (= e!841052 (contains!9953 Nil!34922 (select (arr!48433 a!2850) #b00000000000000000000000000000000)))))

(declare-fun bm!68144 () Bool)

(declare-fun call!68147 () Bool)

(declare-fun c!139219 () Bool)

(assert (=> bm!68144 (= call!68147 (arrayNoDuplicates!0 a!2850 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139219 (Cons!34921 (select (arr!48433 a!2850) #b00000000000000000000000000000000) Nil!34922) Nil!34922)))))

(declare-fun b!1504656 () Bool)

(declare-fun e!841051 () Bool)

(assert (=> b!1504656 (= e!841051 call!68147)))

(declare-fun d!157921 () Bool)

(declare-fun res!1025286 () Bool)

(declare-fun e!841050 () Bool)

(assert (=> d!157921 (=> res!1025286 e!841050)))

(assert (=> d!157921 (= res!1025286 (bvsge #b00000000000000000000000000000000 (size!48983 a!2850)))))

(assert (=> d!157921 (= (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34922) e!841050)))

(declare-fun b!1504657 () Bool)

(declare-fun e!841053 () Bool)

(assert (=> b!1504657 (= e!841050 e!841053)))

(declare-fun res!1025285 () Bool)

(assert (=> b!1504657 (=> (not res!1025285) (not e!841053))))

(assert (=> b!1504657 (= res!1025285 (not e!841052))))

(declare-fun res!1025287 () Bool)

(assert (=> b!1504657 (=> (not res!1025287) (not e!841052))))

(assert (=> b!1504657 (= res!1025287 (validKeyInArray!0 (select (arr!48433 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1504658 () Bool)

(assert (=> b!1504658 (= e!841051 call!68147)))

(declare-fun b!1504659 () Bool)

(assert (=> b!1504659 (= e!841053 e!841051)))

(assert (=> b!1504659 (= c!139219 (validKeyInArray!0 (select (arr!48433 a!2850) #b00000000000000000000000000000000)))))

(assert (= (and d!157921 (not res!1025286)) b!1504657))

(assert (= (and b!1504657 res!1025287) b!1504655))

(assert (= (and b!1504657 res!1025285) b!1504659))

(assert (= (and b!1504659 c!139219) b!1504656))

(assert (= (and b!1504659 (not c!139219)) b!1504658))

(assert (= (or b!1504656 b!1504658) bm!68144))

(declare-fun m!1387783 () Bool)

(assert (=> b!1504655 m!1387783))

(assert (=> b!1504655 m!1387783))

(declare-fun m!1387785 () Bool)

(assert (=> b!1504655 m!1387785))

(assert (=> bm!68144 m!1387783))

(declare-fun m!1387787 () Bool)

(assert (=> bm!68144 m!1387787))

(assert (=> b!1504657 m!1387783))

(assert (=> b!1504657 m!1387783))

(declare-fun m!1387789 () Bool)

(assert (=> b!1504657 m!1387789))

(assert (=> b!1504659 m!1387783))

(assert (=> b!1504659 m!1387783))

(assert (=> b!1504659 m!1387789))

(assert (=> b!1504568 d!157921))

(declare-fun d!157927 () Bool)

(assert (=> d!157927 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!128122 d!157927))

(declare-fun d!157931 () Bool)

(assert (=> d!157931 (= (array_inv!37461 a!2850) (bvsge (size!48983 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!128122 d!157931))

(declare-fun b!1504679 () Bool)

