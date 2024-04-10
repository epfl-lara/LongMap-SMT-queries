; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124982 () Bool)

(assert start!124982)

(declare-fun b!1453106 () Bool)

(declare-fun e!817926 () Bool)

(declare-fun e!817921 () Bool)

(assert (=> b!1453106 (= e!817926 e!817921)))

(declare-fun res!984166 () Bool)

(assert (=> b!1453106 (=> (not res!984166) (not e!817921))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98430 0))(
  ( (array!98431 (arr!47503 (Array (_ BitVec 32) (_ BitVec 64))) (size!48053 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98430)

(assert (=> b!1453106 (= res!984166 (= (select (store (arr!47503 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!637138 () array!98430)

(assert (=> b!1453106 (= lt!637138 (array!98431 (store (arr!47503 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48053 a!2862)))))

(declare-fun b!1453107 () Bool)

(declare-fun res!984158 () Bool)

(assert (=> b!1453107 (=> (not res!984158) (not e!817926))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1453107 (= res!984158 (and (= (size!48053 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48053 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48053 a!2862)) (not (= i!1006 j!93))))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!637142 () (_ BitVec 64))

(declare-fun e!817925 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1453108 () Bool)

(declare-datatypes ((SeekEntryResult!11755 0))(
  ( (MissingZero!11755 (index!49412 (_ BitVec 32))) (Found!11755 (index!49413 (_ BitVec 32))) (Intermediate!11755 (undefined!12567 Bool) (index!49414 (_ BitVec 32)) (x!131052 (_ BitVec 32))) (Undefined!11755) (MissingVacant!11755 (index!49415 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98430 (_ BitVec 32)) SeekEntryResult!11755)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98430 (_ BitVec 32)) SeekEntryResult!11755)

(assert (=> b!1453108 (= e!817925 (= (seekEntryOrOpen!0 lt!637142 lt!637138 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637142 lt!637138 mask!2687)))))

(declare-fun b!1453109 () Bool)

(declare-fun e!817928 () Bool)

(assert (=> b!1453109 (= e!817921 e!817928)))

(declare-fun res!984150 () Bool)

(assert (=> b!1453109 (=> (not res!984150) (not e!817928))))

(declare-fun lt!637139 () SeekEntryResult!11755)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98430 (_ BitVec 32)) SeekEntryResult!11755)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453109 (= res!984150 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47503 a!2862) j!93) mask!2687) (select (arr!47503 a!2862) j!93) a!2862 mask!2687) lt!637139))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1453109 (= lt!637139 (Intermediate!11755 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1453110 () Bool)

(declare-fun e!817920 () Bool)

(assert (=> b!1453110 (= e!817928 e!817920)))

(declare-fun res!984153 () Bool)

(assert (=> b!1453110 (=> (not res!984153) (not e!817920))))

(declare-fun lt!637141 () SeekEntryResult!11755)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1453110 (= res!984153 (= lt!637141 (Intermediate!11755 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1453110 (= lt!637141 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637142 mask!2687) lt!637142 lt!637138 mask!2687))))

(assert (=> b!1453110 (= lt!637142 (select (store (arr!47503 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1453112 () Bool)

(declare-fun res!984152 () Bool)

(declare-fun e!817927 () Bool)

(assert (=> b!1453112 (=> (not res!984152) (not e!817927))))

(assert (=> b!1453112 (= res!984152 (= (seekEntryOrOpen!0 (select (arr!47503 a!2862) j!93) a!2862 mask!2687) (Found!11755 j!93)))))

(declare-fun b!1453113 () Bool)

(declare-fun e!817922 () Bool)

(assert (=> b!1453113 (= e!817922 (= lt!637141 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637142 lt!637138 mask!2687)))))

(declare-fun b!1453114 () Bool)

(declare-fun res!984155 () Bool)

(assert (=> b!1453114 (=> (not res!984155) (not e!817926))))

(assert (=> b!1453114 (= res!984155 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48053 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48053 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48053 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1453115 () Bool)

(declare-fun res!984165 () Bool)

(assert (=> b!1453115 (=> (not res!984165) (not e!817926))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1453115 (= res!984165 (validKeyInArray!0 (select (arr!47503 a!2862) j!93)))))

(declare-fun b!1453116 () Bool)

(assert (=> b!1453116 (= e!817922 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637142 lt!637138 mask!2687) (seekEntryOrOpen!0 lt!637142 lt!637138 mask!2687)))))

(declare-fun b!1453117 () Bool)

(declare-fun res!984162 () Bool)

(assert (=> b!1453117 (=> (not res!984162) (not e!817926))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98430 (_ BitVec 32)) Bool)

(assert (=> b!1453117 (= res!984162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1453118 () Bool)

(declare-fun res!984154 () Bool)

(assert (=> b!1453118 (=> (not res!984154) (not e!817928))))

(assert (=> b!1453118 (= res!984154 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47503 a!2862) j!93) a!2862 mask!2687) lt!637139))))

(declare-fun b!1453119 () Bool)

(declare-fun res!984164 () Bool)

(assert (=> b!1453119 (=> (not res!984164) (not e!817920))))

(assert (=> b!1453119 (= res!984164 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1453120 () Bool)

(declare-fun e!817924 () Bool)

(assert (=> b!1453120 (= e!817927 e!817924)))

(declare-fun res!984159 () Bool)

(assert (=> b!1453120 (=> res!984159 e!817924)))

(declare-fun lt!637143 () (_ BitVec 64))

(assert (=> b!1453120 (= res!984159 (or (and (= (select (arr!47503 a!2862) index!646) lt!637143) (= (select (arr!47503 a!2862) index!646) (select (arr!47503 a!2862) j!93))) (= (select (arr!47503 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1453120 (= lt!637143 (select (store (arr!47503 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1453121 () Bool)

(declare-fun res!984151 () Bool)

(assert (=> b!1453121 (=> (not res!984151) (not e!817926))))

(assert (=> b!1453121 (= res!984151 (validKeyInArray!0 (select (arr!47503 a!2862) i!1006)))))

(declare-fun b!1453122 () Bool)

(assert (=> b!1453122 (= e!817924 e!817925)))

(declare-fun res!984157 () Bool)

(assert (=> b!1453122 (=> (not res!984157) (not e!817925))))

(assert (=> b!1453122 (= res!984157 (and (= index!646 intermediateAfterIndex!19) (= lt!637143 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1453123 () Bool)

(declare-fun res!984149 () Bool)

(assert (=> b!1453123 (=> (not res!984149) (not e!817926))))

(declare-datatypes ((List!34004 0))(
  ( (Nil!34001) (Cons!34000 (h!35350 (_ BitVec 64)) (t!48698 List!34004)) )
))
(declare-fun arrayNoDuplicates!0 (array!98430 (_ BitVec 32) List!34004) Bool)

(assert (=> b!1453123 (= res!984149 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34001))))

(declare-fun b!1453124 () Bool)

(assert (=> b!1453124 (= e!817920 (not true))))

(assert (=> b!1453124 e!817927))

(declare-fun res!984156 () Bool)

(assert (=> b!1453124 (=> (not res!984156) (not e!817927))))

(assert (=> b!1453124 (= res!984156 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49006 0))(
  ( (Unit!49007) )
))
(declare-fun lt!637140 () Unit!49006)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98430 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49006)

(assert (=> b!1453124 (= lt!637140 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1453125 () Bool)

(declare-fun res!984163 () Bool)

(assert (=> b!1453125 (=> (not res!984163) (not e!817920))))

(assert (=> b!1453125 (= res!984163 e!817922)))

(declare-fun c!133989 () Bool)

(assert (=> b!1453125 (= c!133989 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!984161 () Bool)

(assert (=> start!124982 (=> (not res!984161) (not e!817926))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124982 (= res!984161 (validMask!0 mask!2687))))

(assert (=> start!124982 e!817926))

(assert (=> start!124982 true))

(declare-fun array_inv!36531 (array!98430) Bool)

(assert (=> start!124982 (array_inv!36531 a!2862)))

(declare-fun b!1453111 () Bool)

(declare-fun res!984160 () Bool)

(assert (=> b!1453111 (=> (not res!984160) (not e!817927))))

(assert (=> b!1453111 (= res!984160 (or (= (select (arr!47503 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47503 a!2862) intermediateBeforeIndex!19) (select (arr!47503 a!2862) j!93))))))

(assert (= (and start!124982 res!984161) b!1453107))

(assert (= (and b!1453107 res!984158) b!1453121))

(assert (= (and b!1453121 res!984151) b!1453115))

(assert (= (and b!1453115 res!984165) b!1453117))

(assert (= (and b!1453117 res!984162) b!1453123))

(assert (= (and b!1453123 res!984149) b!1453114))

(assert (= (and b!1453114 res!984155) b!1453106))

(assert (= (and b!1453106 res!984166) b!1453109))

(assert (= (and b!1453109 res!984150) b!1453118))

(assert (= (and b!1453118 res!984154) b!1453110))

(assert (= (and b!1453110 res!984153) b!1453125))

(assert (= (and b!1453125 c!133989) b!1453113))

(assert (= (and b!1453125 (not c!133989)) b!1453116))

(assert (= (and b!1453125 res!984163) b!1453119))

(assert (= (and b!1453119 res!984164) b!1453124))

(assert (= (and b!1453124 res!984156) b!1453112))

(assert (= (and b!1453112 res!984152) b!1453111))

(assert (= (and b!1453111 res!984160) b!1453120))

(assert (= (and b!1453120 (not res!984159)) b!1453122))

(assert (= (and b!1453122 res!984157) b!1453108))

(declare-fun m!1341641 () Bool)

(assert (=> b!1453106 m!1341641))

(declare-fun m!1341643 () Bool)

(assert (=> b!1453106 m!1341643))

(declare-fun m!1341645 () Bool)

(assert (=> b!1453118 m!1341645))

(assert (=> b!1453118 m!1341645))

(declare-fun m!1341647 () Bool)

(assert (=> b!1453118 m!1341647))

(declare-fun m!1341649 () Bool)

(assert (=> b!1453110 m!1341649))

(assert (=> b!1453110 m!1341649))

(declare-fun m!1341651 () Bool)

(assert (=> b!1453110 m!1341651))

(assert (=> b!1453110 m!1341641))

(declare-fun m!1341653 () Bool)

(assert (=> b!1453110 m!1341653))

(declare-fun m!1341655 () Bool)

(assert (=> start!124982 m!1341655))

(declare-fun m!1341657 () Bool)

(assert (=> start!124982 m!1341657))

(declare-fun m!1341659 () Bool)

(assert (=> b!1453124 m!1341659))

(declare-fun m!1341661 () Bool)

(assert (=> b!1453124 m!1341661))

(declare-fun m!1341663 () Bool)

(assert (=> b!1453116 m!1341663))

(declare-fun m!1341665 () Bool)

(assert (=> b!1453116 m!1341665))

(declare-fun m!1341667 () Bool)

(assert (=> b!1453111 m!1341667))

(assert (=> b!1453111 m!1341645))

(assert (=> b!1453108 m!1341665))

(assert (=> b!1453108 m!1341663))

(declare-fun m!1341669 () Bool)

(assert (=> b!1453123 m!1341669))

(declare-fun m!1341671 () Bool)

(assert (=> b!1453121 m!1341671))

(assert (=> b!1453121 m!1341671))

(declare-fun m!1341673 () Bool)

(assert (=> b!1453121 m!1341673))

(declare-fun m!1341675 () Bool)

(assert (=> b!1453117 m!1341675))

(assert (=> b!1453109 m!1341645))

(assert (=> b!1453109 m!1341645))

(declare-fun m!1341677 () Bool)

(assert (=> b!1453109 m!1341677))

(assert (=> b!1453109 m!1341677))

(assert (=> b!1453109 m!1341645))

(declare-fun m!1341679 () Bool)

(assert (=> b!1453109 m!1341679))

(assert (=> b!1453115 m!1341645))

(assert (=> b!1453115 m!1341645))

(declare-fun m!1341681 () Bool)

(assert (=> b!1453115 m!1341681))

(assert (=> b!1453112 m!1341645))

(assert (=> b!1453112 m!1341645))

(declare-fun m!1341683 () Bool)

(assert (=> b!1453112 m!1341683))

(declare-fun m!1341685 () Bool)

(assert (=> b!1453113 m!1341685))

(declare-fun m!1341687 () Bool)

(assert (=> b!1453120 m!1341687))

(assert (=> b!1453120 m!1341645))

(assert (=> b!1453120 m!1341641))

(declare-fun m!1341689 () Bool)

(assert (=> b!1453120 m!1341689))

(push 1)

