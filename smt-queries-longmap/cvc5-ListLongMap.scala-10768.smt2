; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125926 () Bool)

(assert start!125926)

(declare-fun b!1474668 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!99203 0))(
  ( (array!99204 (arr!47885 (Array (_ BitVec 32) (_ BitVec 64))) (size!48435 (_ BitVec 32))) )
))
(declare-fun lt!644321 () array!99203)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!827369 () Bool)

(declare-fun lt!644325 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12125 0))(
  ( (MissingZero!12125 (index!50892 (_ BitVec 32))) (Found!12125 (index!50893 (_ BitVec 32))) (Intermediate!12125 (undefined!12937 Bool) (index!50894 (_ BitVec 32)) (x!132473 (_ BitVec 32))) (Undefined!12125) (MissingVacant!12125 (index!50895 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99203 (_ BitVec 32)) SeekEntryResult!12125)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99203 (_ BitVec 32)) SeekEntryResult!12125)

(assert (=> b!1474668 (= e!827369 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644325 lt!644321 mask!2687) (seekEntryOrOpen!0 lt!644325 lt!644321 mask!2687)))))

(declare-fun b!1474669 () Bool)

(declare-fun e!827370 () Bool)

(declare-fun e!827367 () Bool)

(assert (=> b!1474669 (= e!827370 e!827367)))

(declare-fun res!1001856 () Bool)

(assert (=> b!1474669 (=> (not res!1001856) (not e!827367))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99203)

(assert (=> b!1474669 (= res!1001856 (= (select (store (arr!47885 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1474669 (= lt!644321 (array!99204 (store (arr!47885 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48435 a!2862)))))

(declare-fun b!1474670 () Bool)

(declare-fun res!1001855 () Bool)

(assert (=> b!1474670 (=> (not res!1001855) (not e!827370))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1474670 (= res!1001855 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48435 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48435 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48435 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1474671 () Bool)

(declare-fun res!1001857 () Bool)

(declare-fun e!827371 () Bool)

(assert (=> b!1474671 (=> (not res!1001857) (not e!827371))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!644322 () SeekEntryResult!12125)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99203 (_ BitVec 32)) SeekEntryResult!12125)

(assert (=> b!1474671 (= res!1001857 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47885 a!2862) j!93) a!2862 mask!2687) lt!644322))))

(declare-fun b!1474672 () Bool)

(declare-fun res!1001845 () Bool)

(assert (=> b!1474672 (=> (not res!1001845) (not e!827370))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99203 (_ BitVec 32)) Bool)

(assert (=> b!1474672 (= res!1001845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1474673 () Bool)

(declare-fun res!1001851 () Bool)

(declare-fun e!827372 () Bool)

(assert (=> b!1474673 (=> (not res!1001851) (not e!827372))))

(assert (=> b!1474673 (= res!1001851 e!827369)))

(declare-fun c!135927 () Bool)

(assert (=> b!1474673 (= c!135927 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!644323 () SeekEntryResult!12125)

(declare-fun b!1474674 () Bool)

(declare-fun e!827366 () Bool)

(assert (=> b!1474674 (= e!827366 (= lt!644323 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47885 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1474675 () Bool)

(declare-fun res!1001852 () Bool)

(assert (=> b!1474675 (=> (not res!1001852) (not e!827370))))

(assert (=> b!1474675 (= res!1001852 (and (= (size!48435 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48435 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48435 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1474676 () Bool)

(declare-fun res!1001848 () Bool)

(assert (=> b!1474676 (=> (not res!1001848) (not e!827370))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1474676 (= res!1001848 (validKeyInArray!0 (select (arr!47885 a!2862) j!93)))))

(declare-fun res!1001850 () Bool)

(assert (=> start!125926 (=> (not res!1001850) (not e!827370))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125926 (= res!1001850 (validMask!0 mask!2687))))

(assert (=> start!125926 e!827370))

(assert (=> start!125926 true))

(declare-fun array_inv!36913 (array!99203) Bool)

(assert (=> start!125926 (array_inv!36913 a!2862)))

(declare-fun b!1474677 () Bool)

(assert (=> b!1474677 (= e!827372 (not e!827366))))

(declare-fun res!1001849 () Bool)

(assert (=> b!1474677 (=> res!1001849 e!827366)))

(assert (=> b!1474677 (= res!1001849 (or (and (= (select (arr!47885 a!2862) index!646) (select (store (arr!47885 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47885 a!2862) index!646) (select (arr!47885 a!2862) j!93))) (not (= (select (arr!47885 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1474677 (and (= lt!644323 (Found!12125 j!93)) (or (= (select (arr!47885 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47885 a!2862) intermediateBeforeIndex!19) (select (arr!47885 a!2862) j!93))))))

(assert (=> b!1474677 (= lt!644323 (seekEntryOrOpen!0 (select (arr!47885 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1474677 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49590 0))(
  ( (Unit!49591) )
))
(declare-fun lt!644320 () Unit!49590)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99203 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49590)

(assert (=> b!1474677 (= lt!644320 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1474678 () Bool)

(declare-fun res!1001844 () Bool)

(assert (=> b!1474678 (=> (not res!1001844) (not e!827370))))

(assert (=> b!1474678 (= res!1001844 (validKeyInArray!0 (select (arr!47885 a!2862) i!1006)))))

(declare-fun b!1474679 () Bool)

(assert (=> b!1474679 (= e!827367 e!827371)))

(declare-fun res!1001847 () Bool)

(assert (=> b!1474679 (=> (not res!1001847) (not e!827371))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1474679 (= res!1001847 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47885 a!2862) j!93) mask!2687) (select (arr!47885 a!2862) j!93) a!2862 mask!2687) lt!644322))))

(assert (=> b!1474679 (= lt!644322 (Intermediate!12125 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1474680 () Bool)

(assert (=> b!1474680 (= e!827371 e!827372)))

(declare-fun res!1001854 () Bool)

(assert (=> b!1474680 (=> (not res!1001854) (not e!827372))))

(declare-fun lt!644324 () SeekEntryResult!12125)

(assert (=> b!1474680 (= res!1001854 (= lt!644324 (Intermediate!12125 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1474680 (= lt!644324 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644325 mask!2687) lt!644325 lt!644321 mask!2687))))

(assert (=> b!1474680 (= lt!644325 (select (store (arr!47885 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1474681 () Bool)

(declare-fun res!1001853 () Bool)

(assert (=> b!1474681 (=> (not res!1001853) (not e!827370))))

(declare-datatypes ((List!34386 0))(
  ( (Nil!34383) (Cons!34382 (h!35741 (_ BitVec 64)) (t!49080 List!34386)) )
))
(declare-fun arrayNoDuplicates!0 (array!99203 (_ BitVec 32) List!34386) Bool)

(assert (=> b!1474681 (= res!1001853 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34383))))

(declare-fun b!1474682 () Bool)

(declare-fun res!1001846 () Bool)

(assert (=> b!1474682 (=> (not res!1001846) (not e!827372))))

(assert (=> b!1474682 (= res!1001846 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1474683 () Bool)

(assert (=> b!1474683 (= e!827369 (= lt!644324 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644325 lt!644321 mask!2687)))))

(assert (= (and start!125926 res!1001850) b!1474675))

(assert (= (and b!1474675 res!1001852) b!1474678))

(assert (= (and b!1474678 res!1001844) b!1474676))

(assert (= (and b!1474676 res!1001848) b!1474672))

(assert (= (and b!1474672 res!1001845) b!1474681))

(assert (= (and b!1474681 res!1001853) b!1474670))

(assert (= (and b!1474670 res!1001855) b!1474669))

(assert (= (and b!1474669 res!1001856) b!1474679))

(assert (= (and b!1474679 res!1001847) b!1474671))

(assert (= (and b!1474671 res!1001857) b!1474680))

(assert (= (and b!1474680 res!1001854) b!1474673))

(assert (= (and b!1474673 c!135927) b!1474683))

(assert (= (and b!1474673 (not c!135927)) b!1474668))

(assert (= (and b!1474673 res!1001851) b!1474682))

(assert (= (and b!1474682 res!1001846) b!1474677))

(assert (= (and b!1474677 (not res!1001849)) b!1474674))

(declare-fun m!1361095 () Bool)

(assert (=> b!1474681 m!1361095))

(declare-fun m!1361097 () Bool)

(assert (=> b!1474677 m!1361097))

(declare-fun m!1361099 () Bool)

(assert (=> b!1474677 m!1361099))

(declare-fun m!1361101 () Bool)

(assert (=> b!1474677 m!1361101))

(declare-fun m!1361103 () Bool)

(assert (=> b!1474677 m!1361103))

(declare-fun m!1361105 () Bool)

(assert (=> b!1474677 m!1361105))

(declare-fun m!1361107 () Bool)

(assert (=> b!1474677 m!1361107))

(declare-fun m!1361109 () Bool)

(assert (=> b!1474677 m!1361109))

(declare-fun m!1361111 () Bool)

(assert (=> b!1474677 m!1361111))

(assert (=> b!1474677 m!1361107))

(assert (=> b!1474669 m!1361099))

(declare-fun m!1361113 () Bool)

(assert (=> b!1474669 m!1361113))

(declare-fun m!1361115 () Bool)

(assert (=> b!1474678 m!1361115))

(assert (=> b!1474678 m!1361115))

(declare-fun m!1361117 () Bool)

(assert (=> b!1474678 m!1361117))

(assert (=> b!1474679 m!1361107))

(assert (=> b!1474679 m!1361107))

(declare-fun m!1361119 () Bool)

(assert (=> b!1474679 m!1361119))

(assert (=> b!1474679 m!1361119))

(assert (=> b!1474679 m!1361107))

(declare-fun m!1361121 () Bool)

(assert (=> b!1474679 m!1361121))

(declare-fun m!1361123 () Bool)

(assert (=> b!1474683 m!1361123))

(assert (=> b!1474676 m!1361107))

(assert (=> b!1474676 m!1361107))

(declare-fun m!1361125 () Bool)

(assert (=> b!1474676 m!1361125))

(declare-fun m!1361127 () Bool)

(assert (=> b!1474668 m!1361127))

(declare-fun m!1361129 () Bool)

(assert (=> b!1474668 m!1361129))

(declare-fun m!1361131 () Bool)

(assert (=> b!1474672 m!1361131))

(assert (=> b!1474671 m!1361107))

(assert (=> b!1474671 m!1361107))

(declare-fun m!1361133 () Bool)

(assert (=> b!1474671 m!1361133))

(assert (=> b!1474674 m!1361107))

(assert (=> b!1474674 m!1361107))

(declare-fun m!1361135 () Bool)

(assert (=> b!1474674 m!1361135))

(declare-fun m!1361137 () Bool)

(assert (=> start!125926 m!1361137))

(declare-fun m!1361139 () Bool)

(assert (=> start!125926 m!1361139))

(declare-fun m!1361141 () Bool)

(assert (=> b!1474680 m!1361141))

(assert (=> b!1474680 m!1361141))

(declare-fun m!1361143 () Bool)

(assert (=> b!1474680 m!1361143))

(assert (=> b!1474680 m!1361099))

(declare-fun m!1361145 () Bool)

(assert (=> b!1474680 m!1361145))

(push 1)

(assert (not b!1474677))

(assert (not b!1474681))

(assert (not b!1474672))

(assert (not b!1474674))

(assert (not b!1474683))

(assert (not b!1474668))

(assert (not b!1474678))

(assert (not b!1474671))

(assert (not start!125926))

(assert (not b!1474679))

(assert (not b!1474680))

(assert (not b!1474676))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!155673 () Bool)

(declare-fun res!1001959 () Bool)

(declare-fun e!827461 () Bool)

(assert (=> d!155673 (=> res!1001959 e!827461)))

(assert (=> d!155673 (= res!1001959 (bvsge #b00000000000000000000000000000000 (size!48435 a!2862)))))

(assert (=> d!155673 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!827461)))

(declare-fun b!1474860 () Bool)

(declare-fun e!827459 () Bool)

(declare-fun call!67762 () Bool)

(assert (=> b!1474860 (= e!827459 call!67762)))

(declare-fun b!1474861 () Bool)

(declare-fun e!827460 () Bool)

(assert (=> b!1474861 (= e!827460 call!67762)))

(declare-fun b!1474862 () Bool)

(assert (=> b!1474862 (= e!827461 e!827459)))

(declare-fun c!135966 () Bool)

(assert (=> b!1474862 (= c!135966 (validKeyInArray!0 (select (arr!47885 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1474863 () Bool)

(assert (=> b!1474863 (= e!827459 e!827460)))

(declare-fun lt!644396 () (_ BitVec 64))

(assert (=> b!1474863 (= lt!644396 (select (arr!47885 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!644397 () Unit!49590)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99203 (_ BitVec 64) (_ BitVec 32)) Unit!49590)

(assert (=> b!1474863 (= lt!644397 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!644396 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99203 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1474863 (arrayContainsKey!0 a!2862 lt!644396 #b00000000000000000000000000000000)))

(declare-fun lt!644395 () Unit!49590)

(assert (=> b!1474863 (= lt!644395 lt!644397)))

(declare-fun res!1001960 () Bool)

(assert (=> b!1474863 (= res!1001960 (= (seekEntryOrOpen!0 (select (arr!47885 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12125 #b00000000000000000000000000000000)))))

(assert (=> b!1474863 (=> (not res!1001960) (not e!827460))))

(declare-fun bm!67759 () Bool)

(assert (=> bm!67759 (= call!67762 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!155673 (not res!1001959)) b!1474862))

(assert (= (and b!1474862 c!135966) b!1474863))

(assert (= (and b!1474862 (not c!135966)) b!1474860))

(assert (= (and b!1474863 res!1001960) b!1474861))

(assert (= (or b!1474861 b!1474860) bm!67759))

(declare-fun m!1361283 () Bool)

(assert (=> b!1474862 m!1361283))

(assert (=> b!1474862 m!1361283))

(declare-fun m!1361285 () Bool)

(assert (=> b!1474862 m!1361285))

(assert (=> b!1474863 m!1361283))

(declare-fun m!1361287 () Bool)

(assert (=> b!1474863 m!1361287))

(declare-fun m!1361289 () Bool)

(assert (=> b!1474863 m!1361289))

(assert (=> b!1474863 m!1361283))

(declare-fun m!1361291 () Bool)

(assert (=> b!1474863 m!1361291))

(declare-fun m!1361293 () Bool)

(assert (=> bm!67759 m!1361293))

(assert (=> b!1474672 d!155673))

(declare-fun b!1474955 () Bool)

(declare-fun lt!644436 () SeekEntryResult!12125)

(assert (=> b!1474955 (and (bvsge (index!50894 lt!644436) #b00000000000000000000000000000000) (bvslt (index!50894 lt!644436) (size!48435 lt!644321)))))

(declare-fun res!1001992 () Bool)

(assert (=> b!1474955 (= res!1001992 (= (select (arr!47885 lt!644321) (index!50894 lt!644436)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!827515 () Bool)

(assert (=> b!1474955 (=> res!1001992 e!827515)))

(declare-fun b!1474956 () Bool)

(declare-fun e!827517 () SeekEntryResult!12125)

(assert (=> b!1474956 (= e!827517 (Intermediate!12125 false index!646 x!665))))

(declare-fun b!1474957 () Bool)

(assert (=> b!1474957 (and (bvsge (index!50894 lt!644436) #b00000000000000000000000000000000) (bvslt (index!50894 lt!644436) (size!48435 lt!644321)))))

(assert (=> b!1474957 (= e!827515 (= (select (arr!47885 lt!644321) (index!50894 lt!644436)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!155685 () Bool)

(declare-fun e!827519 () Bool)

(assert (=> d!155685 e!827519))

(declare-fun c!135999 () Bool)

(assert (=> d!155685 (= c!135999 (and (is-Intermediate!12125 lt!644436) (undefined!12937 lt!644436)))))

(declare-fun e!827516 () SeekEntryResult!12125)

(assert (=> d!155685 (= lt!644436 e!827516)))

(declare-fun c!136000 () Bool)

(assert (=> d!155685 (= c!136000 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!644437 () (_ BitVec 64))

(assert (=> d!155685 (= lt!644437 (select (arr!47885 lt!644321) index!646))))

(assert (=> d!155685 (validMask!0 mask!2687)))

(assert (=> d!155685 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644325 lt!644321 mask!2687) lt!644436)))

(declare-fun b!1474958 () Bool)

(assert (=> b!1474958 (and (bvsge (index!50894 lt!644436) #b00000000000000000000000000000000) (bvslt (index!50894 lt!644436) (size!48435 lt!644321)))))

(declare-fun res!1001991 () Bool)

(assert (=> b!1474958 (= res!1001991 (= (select (arr!47885 lt!644321) (index!50894 lt!644436)) lt!644325))))

(assert (=> b!1474958 (=> res!1001991 e!827515)))

(declare-fun e!827518 () Bool)

(assert (=> b!1474958 (= e!827518 e!827515)))

(declare-fun b!1474959 () Bool)

(assert (=> b!1474959 (= e!827516 e!827517)))

(declare-fun c!135998 () Bool)

(assert (=> b!1474959 (= c!135998 (or (= lt!644437 lt!644325) (= (bvadd lt!644437 lt!644437) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1474960 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1474960 (= e!827517 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!644325 lt!644321 mask!2687))))

(declare-fun b!1474961 () Bool)

(assert (=> b!1474961 (= e!827516 (Intermediate!12125 true index!646 x!665))))

(declare-fun b!1474962 () Bool)

(assert (=> b!1474962 (= e!827519 (bvsge (x!132473 lt!644436) #b01111111111111111111111111111110))))

(declare-fun b!1474963 () Bool)

(assert (=> b!1474963 (= e!827519 e!827518)))

(declare-fun res!1001993 () Bool)

(assert (=> b!1474963 (= res!1001993 (and (is-Intermediate!12125 lt!644436) (not (undefined!12937 lt!644436)) (bvslt (x!132473 lt!644436) #b01111111111111111111111111111110) (bvsge (x!132473 lt!644436) #b00000000000000000000000000000000) (bvsge (x!132473 lt!644436) x!665)))))

(assert (=> b!1474963 (=> (not res!1001993) (not e!827518))))

(assert (= (and d!155685 c!136000) b!1474961))

(assert (= (and d!155685 (not c!136000)) b!1474959))

(assert (= (and b!1474959 c!135998) b!1474956))

(assert (= (and b!1474959 (not c!135998)) b!1474960))

(assert (= (and d!155685 c!135999) b!1474962))

(assert (= (and d!155685 (not c!135999)) b!1474963))

(assert (= (and b!1474963 res!1001993) b!1474958))

(assert (= (and b!1474958 (not res!1001991)) b!1474955))

(assert (= (and b!1474955 (not res!1001992)) b!1474957))

(declare-fun m!1361351 () Bool)

(assert (=> b!1474960 m!1361351))

(assert (=> b!1474960 m!1361351))

(declare-fun m!1361353 () Bool)

(assert (=> b!1474960 m!1361353))

(declare-fun m!1361355 () Bool)

(assert (=> d!155685 m!1361355))

(assert (=> d!155685 m!1361137))

(declare-fun m!1361357 () Bool)

(assert (=> b!1474955 m!1361357))

(assert (=> b!1474958 m!1361357))

(assert (=> b!1474957 m!1361357))

(assert (=> b!1474683 d!155685))

(declare-fun b!1474991 () Bool)

(declare-fun e!827539 () SeekEntryResult!12125)

(assert (=> b!1474991 (= e!827539 Undefined!12125)))

(declare-fun d!155707 () Bool)

(declare-fun lt!644448 () SeekEntryResult!12125)

(assert (=> d!155707 (and (or (is-Undefined!12125 lt!644448) (not (is-Found!12125 lt!644448)) (and (bvsge (index!50893 lt!644448) #b00000000000000000000000000000000) (bvslt (index!50893 lt!644448) (size!48435 a!2862)))) (or (is-Undefined!12125 lt!644448) (is-Found!12125 lt!644448) (not (is-MissingVacant!12125 lt!644448)) (not (= (index!50895 lt!644448) index!646)) (and (bvsge (index!50895 lt!644448) #b00000000000000000000000000000000) (bvslt (index!50895 lt!644448) (size!48435 a!2862)))) (or (is-Undefined!12125 lt!644448) (ite (is-Found!12125 lt!644448) (= (select (arr!47885 a!2862) (index!50893 lt!644448)) (select (arr!47885 a!2862) j!93)) (and (is-MissingVacant!12125 lt!644448) (= (index!50895 lt!644448) index!646) (= (select (arr!47885 a!2862) (index!50895 lt!644448)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!155707 (= lt!644448 e!827539)))

(declare-fun c!136010 () Bool)

(assert (=> d!155707 (= c!136010 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!644449 () (_ BitVec 64))

(assert (=> d!155707 (= lt!644449 (select (arr!47885 a!2862) index!646))))

(assert (=> d!155707 (validMask!0 mask!2687)))

(assert (=> d!155707 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47885 a!2862) j!93) a!2862 mask!2687) lt!644448)))

(declare-fun b!1474992 () Bool)

(declare-fun e!827538 () SeekEntryResult!12125)

(assert (=> b!1474992 (= e!827538 (MissingVacant!12125 index!646))))

(declare-fun b!1474993 () Bool)

(declare-fun c!136011 () Bool)

(assert (=> b!1474993 (= c!136011 (= lt!644449 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!827540 () SeekEntryResult!12125)

(assert (=> b!1474993 (= e!827540 e!827538)))

(declare-fun b!1474994 () Bool)

(assert (=> b!1474994 (= e!827538 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) index!646 (select (arr!47885 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1474995 () Bool)

(assert (=> b!1474995 (= e!827540 (Found!12125 index!646))))

(declare-fun b!1474996 () Bool)

(assert (=> b!1474996 (= e!827539 e!827540)))

(declare-fun c!136012 () Bool)

(assert (=> b!1474996 (= c!136012 (= lt!644449 (select (arr!47885 a!2862) j!93)))))

(assert (= (and d!155707 c!136010) b!1474991))

(assert (= (and d!155707 (not c!136010)) b!1474996))

(assert (= (and b!1474996 c!136012) b!1474995))

(assert (= (and b!1474996 (not c!136012)) b!1474993))

(assert (= (and b!1474993 c!136011) b!1474992))

(assert (= (and b!1474993 (not c!136011)) b!1474994))

(declare-fun m!1361363 () Bool)

(assert (=> d!155707 m!1361363))

(declare-fun m!1361365 () Bool)

(assert (=> d!155707 m!1361365))

(assert (=> d!155707 m!1361105))

(assert (=> d!155707 m!1361137))

(assert (=> b!1474994 m!1361351))

(assert (=> b!1474994 m!1361351))

(assert (=> b!1474994 m!1361107))

(declare-fun m!1361367 () Bool)

(assert (=> b!1474994 m!1361367))

(assert (=> b!1474674 d!155707))

(declare-fun d!155715 () Bool)

(assert (=> d!155715 (= (validKeyInArray!0 (select (arr!47885 a!2862) j!93)) (and (not (= (select (arr!47885 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47885 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1474676 d!155715))

(declare-fun b!1475033 () Bool)

(declare-fun e!827562 () SeekEntryResult!12125)

(declare-fun lt!644469 () SeekEntryResult!12125)

(assert (=> b!1475033 (= e!827562 (MissingZero!12125 (index!50894 lt!644469)))))

(declare-fun b!1475034 () Bool)

(declare-fun e!827563 () SeekEntryResult!12125)

(assert (=> b!1475034 (= e!827563 (Found!12125 (index!50894 lt!644469)))))

(declare-fun b!1475035 () Bool)

(assert (=> b!1475035 (= e!827562 (seekKeyOrZeroReturnVacant!0 (x!132473 lt!644469) (index!50894 lt!644469) (index!50894 lt!644469) (select (arr!47885 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1475036 () Bool)

(declare-fun c!136028 () Bool)

(declare-fun lt!644470 () (_ BitVec 64))

(assert (=> b!1475036 (= c!136028 (= lt!644470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475036 (= e!827563 e!827562)))

(declare-fun d!155717 () Bool)

(declare-fun lt!644471 () SeekEntryResult!12125)

(assert (=> d!155717 (and (or (is-Undefined!12125 lt!644471) (not (is-Found!12125 lt!644471)) (and (bvsge (index!50893 lt!644471) #b00000000000000000000000000000000) (bvslt (index!50893 lt!644471) (size!48435 a!2862)))) (or (is-Undefined!12125 lt!644471) (is-Found!12125 lt!644471) (not (is-MissingZero!12125 lt!644471)) (and (bvsge (index!50892 lt!644471) #b00000000000000000000000000000000) (bvslt (index!50892 lt!644471) (size!48435 a!2862)))) (or (is-Undefined!12125 lt!644471) (is-Found!12125 lt!644471) (is-MissingZero!12125 lt!644471) (not (is-MissingVacant!12125 lt!644471)) (and (bvsge (index!50895 lt!644471) #b00000000000000000000000000000000) (bvslt (index!50895 lt!644471) (size!48435 a!2862)))) (or (is-Undefined!12125 lt!644471) (ite (is-Found!12125 lt!644471) (= (select (arr!47885 a!2862) (index!50893 lt!644471)) (select (arr!47885 a!2862) j!93)) (ite (is-MissingZero!12125 lt!644471) (= (select (arr!47885 a!2862) (index!50892 lt!644471)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12125 lt!644471) (= (select (arr!47885 a!2862) (index!50895 lt!644471)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!827564 () SeekEntryResult!12125)

(assert (=> d!155717 (= lt!644471 e!827564)))

(declare-fun c!136030 () Bool)

(assert (=> d!155717 (= c!136030 (and (is-Intermediate!12125 lt!644469) (undefined!12937 lt!644469)))))

(assert (=> d!155717 (= lt!644469 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47885 a!2862) j!93) mask!2687) (select (arr!47885 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!155717 (validMask!0 mask!2687)))

(assert (=> d!155717 (= (seekEntryOrOpen!0 (select (arr!47885 a!2862) j!93) a!2862 mask!2687) lt!644471)))

(declare-fun b!1475037 () Bool)

(assert (=> b!1475037 (= e!827564 Undefined!12125)))

(declare-fun b!1475038 () Bool)

(assert (=> b!1475038 (= e!827564 e!827563)))

(assert (=> b!1475038 (= lt!644470 (select (arr!47885 a!2862) (index!50894 lt!644469)))))

(declare-fun c!136029 () Bool)

(assert (=> b!1475038 (= c!136029 (= lt!644470 (select (arr!47885 a!2862) j!93)))))

(assert (= (and d!155717 c!136030) b!1475037))

(assert (= (and d!155717 (not c!136030)) b!1475038))

(assert (= (and b!1475038 c!136029) b!1475034))

(assert (= (and b!1475038 (not c!136029)) b!1475036))

(assert (= (and b!1475036 c!136028) b!1475033))

(assert (= (and b!1475036 (not c!136028)) b!1475035))

(assert (=> b!1475035 m!1361107))

(declare-fun m!1361381 () Bool)

(assert (=> b!1475035 m!1361381))

(assert (=> d!155717 m!1361137))

(declare-fun m!1361383 () Bool)

(assert (=> d!155717 m!1361383))

(declare-fun m!1361385 () Bool)

(assert (=> d!155717 m!1361385))

(assert (=> d!155717 m!1361119))

(assert (=> d!155717 m!1361107))

(assert (=> d!155717 m!1361121))

(declare-fun m!1361387 () Bool)

(assert (=> d!155717 m!1361387))

(assert (=> d!155717 m!1361107))

(assert (=> d!155717 m!1361119))

(declare-fun m!1361393 () Bool)

(assert (=> b!1475038 m!1361393))

(assert (=> b!1474677 d!155717))

(declare-fun d!155721 () Bool)

(declare-fun res!1002009 () Bool)

(declare-fun e!827570 () Bool)

(assert (=> d!155721 (=> res!1002009 e!827570)))

(assert (=> d!155721 (= res!1002009 (bvsge j!93 (size!48435 a!2862)))))

(assert (=> d!155721 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!827570)))

(declare-fun b!1475045 () Bool)

(declare-fun e!827568 () Bool)

(declare-fun call!67773 () Bool)

(assert (=> b!1475045 (= e!827568 call!67773)))

(declare-fun b!1475046 () Bool)

(declare-fun e!827569 () Bool)

(assert (=> b!1475046 (= e!827569 call!67773)))

(declare-fun b!1475047 () Bool)

(assert (=> b!1475047 (= e!827570 e!827568)))

(declare-fun c!136034 () Bool)

(assert (=> b!1475047 (= c!136034 (validKeyInArray!0 (select (arr!47885 a!2862) j!93)))))

(declare-fun b!1475048 () Bool)

(assert (=> b!1475048 (= e!827568 e!827569)))

(declare-fun lt!644475 () (_ BitVec 64))

(assert (=> b!1475048 (= lt!644475 (select (arr!47885 a!2862) j!93))))

(declare-fun lt!644476 () Unit!49590)

(assert (=> b!1475048 (= lt!644476 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!644475 j!93))))

(assert (=> b!1475048 (arrayContainsKey!0 a!2862 lt!644475 #b00000000000000000000000000000000)))

(declare-fun lt!644474 () Unit!49590)

(assert (=> b!1475048 (= lt!644474 lt!644476)))

(declare-fun res!1002010 () Bool)

(assert (=> b!1475048 (= res!1002010 (= (seekEntryOrOpen!0 (select (arr!47885 a!2862) j!93) a!2862 mask!2687) (Found!12125 j!93)))))

(assert (=> b!1475048 (=> (not res!1002010) (not e!827569))))

(declare-fun bm!67770 () Bool)

(assert (=> bm!67770 (= call!67773 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!155721 (not res!1002009)) b!1475047))

(assert (= (and b!1475047 c!136034) b!1475048))

(assert (= (and b!1475047 (not c!136034)) b!1475045))

(assert (= (and b!1475048 res!1002010) b!1475046))

(assert (= (or b!1475046 b!1475045) bm!67770))

(assert (=> b!1475047 m!1361107))

(assert (=> b!1475047 m!1361107))

(assert (=> b!1475047 m!1361125))

(assert (=> b!1475048 m!1361107))

(declare-fun m!1361399 () Bool)

(assert (=> b!1475048 m!1361399))

(declare-fun m!1361401 () Bool)

(assert (=> b!1475048 m!1361401))

(assert (=> b!1475048 m!1361107))

(assert (=> b!1475048 m!1361109))

(declare-fun m!1361403 () Bool)

(assert (=> bm!67770 m!1361403))

(assert (=> b!1474677 d!155721))

(declare-fun d!155725 () Bool)

(assert (=> d!155725 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!644479 () Unit!49590)

(declare-fun choose!38 (array!99203 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49590)

(assert (=> d!155725 (= lt!644479 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!155725 (validMask!0 mask!2687)))

(assert (=> d!155725 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!644479)))

(declare-fun bs!42570 () Bool)

(assert (= bs!42570 d!155725))

(assert (=> bs!42570 m!1361111))

(declare-fun m!1361405 () Bool)

(assert (=> bs!42570 m!1361405))

(assert (=> bs!42570 m!1361137))

(assert (=> b!1474677 d!155725))

(declare-fun d!155729 () Bool)

(assert (=> d!155729 (= (validKeyInArray!0 (select (arr!47885 a!2862) i!1006)) (and (not (= (select (arr!47885 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47885 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1474678 d!155729))

(declare-fun b!1475059 () Bool)

(declare-fun e!827580 () SeekEntryResult!12125)

(assert (=> b!1475059 (= e!827580 Undefined!12125)))

(declare-fun d!155731 () Bool)

(declare-fun lt!644480 () SeekEntryResult!12125)

(assert (=> d!155731 (and (or (is-Undefined!12125 lt!644480) (not (is-Found!12125 lt!644480)) (and (bvsge (index!50893 lt!644480) #b00000000000000000000000000000000) (bvslt (index!50893 lt!644480) (size!48435 lt!644321)))) (or (is-Undefined!12125 lt!644480) (is-Found!12125 lt!644480) (not (is-MissingVacant!12125 lt!644480)) (not (= (index!50895 lt!644480) intermediateAfterIndex!19)) (and (bvsge (index!50895 lt!644480) #b00000000000000000000000000000000) (bvslt (index!50895 lt!644480) (size!48435 lt!644321)))) (or (is-Undefined!12125 lt!644480) (ite (is-Found!12125 lt!644480) (= (select (arr!47885 lt!644321) (index!50893 lt!644480)) lt!644325) (and (is-MissingVacant!12125 lt!644480) (= (index!50895 lt!644480) intermediateAfterIndex!19) (= (select (arr!47885 lt!644321) (index!50895 lt!644480)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!155731 (= lt!644480 e!827580)))

(declare-fun c!136037 () Bool)

(assert (=> d!155731 (= c!136037 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!644481 () (_ BitVec 64))

(assert (=> d!155731 (= lt!644481 (select (arr!47885 lt!644321) index!646))))

(assert (=> d!155731 (validMask!0 mask!2687)))

(assert (=> d!155731 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644325 lt!644321 mask!2687) lt!644480)))

(declare-fun b!1475060 () Bool)

(declare-fun e!827579 () SeekEntryResult!12125)

(assert (=> b!1475060 (= e!827579 (MissingVacant!12125 intermediateAfterIndex!19))))

(declare-fun b!1475061 () Bool)

(declare-fun c!136038 () Bool)

(assert (=> b!1475061 (= c!136038 (= lt!644481 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!827581 () SeekEntryResult!12125)

(assert (=> b!1475061 (= e!827581 e!827579)))

(declare-fun b!1475062 () Bool)

(assert (=> b!1475062 (= e!827579 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!644325 lt!644321 mask!2687))))

(declare-fun b!1475063 () Bool)

(assert (=> b!1475063 (= e!827581 (Found!12125 index!646))))

(declare-fun b!1475064 () Bool)

(assert (=> b!1475064 (= e!827580 e!827581)))

(declare-fun c!136039 () Bool)

(assert (=> b!1475064 (= c!136039 (= lt!644481 lt!644325))))

(assert (= (and d!155731 c!136037) b!1475059))

(assert (= (and d!155731 (not c!136037)) b!1475064))

(assert (= (and b!1475064 c!136039) b!1475063))

(assert (= (and b!1475064 (not c!136039)) b!1475061))

(assert (= (and b!1475061 c!136038) b!1475060))

(assert (= (and b!1475061 (not c!136038)) b!1475062))

(declare-fun m!1361407 () Bool)

(assert (=> d!155731 m!1361407))

(declare-fun m!1361409 () Bool)

(assert (=> d!155731 m!1361409))

(assert (=> d!155731 m!1361355))

(assert (=> d!155731 m!1361137))

(assert (=> b!1475062 m!1361351))

(assert (=> b!1475062 m!1361351))

(declare-fun m!1361411 () Bool)

(assert (=> b!1475062 m!1361411))

(assert (=> b!1474668 d!155731))

(declare-fun b!1475065 () Bool)

(declare-fun e!827582 () SeekEntryResult!12125)

(declare-fun lt!644482 () SeekEntryResult!12125)

(assert (=> b!1475065 (= e!827582 (MissingZero!12125 (index!50894 lt!644482)))))

(declare-fun b!1475066 () Bool)

(declare-fun e!827583 () SeekEntryResult!12125)

(assert (=> b!1475066 (= e!827583 (Found!12125 (index!50894 lt!644482)))))

(declare-fun b!1475067 () Bool)

(assert (=> b!1475067 (= e!827582 (seekKeyOrZeroReturnVacant!0 (x!132473 lt!644482) (index!50894 lt!644482) (index!50894 lt!644482) lt!644325 lt!644321 mask!2687))))

(declare-fun b!1475068 () Bool)

(declare-fun c!136040 () Bool)

(declare-fun lt!644483 () (_ BitVec 64))

(assert (=> b!1475068 (= c!136040 (= lt!644483 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475068 (= e!827583 e!827582)))

(declare-fun d!155733 () Bool)

(declare-fun lt!644484 () SeekEntryResult!12125)

(assert (=> d!155733 (and (or (is-Undefined!12125 lt!644484) (not (is-Found!12125 lt!644484)) (and (bvsge (index!50893 lt!644484) #b00000000000000000000000000000000) (bvslt (index!50893 lt!644484) (size!48435 lt!644321)))) (or (is-Undefined!12125 lt!644484) (is-Found!12125 lt!644484) (not (is-MissingZero!12125 lt!644484)) (and (bvsge (index!50892 lt!644484) #b00000000000000000000000000000000) (bvslt (index!50892 lt!644484) (size!48435 lt!644321)))) (or (is-Undefined!12125 lt!644484) (is-Found!12125 lt!644484) (is-MissingZero!12125 lt!644484) (not (is-MissingVacant!12125 lt!644484)) (and (bvsge (index!50895 lt!644484) #b00000000000000000000000000000000) (bvslt (index!50895 lt!644484) (size!48435 lt!644321)))) (or (is-Undefined!12125 lt!644484) (ite (is-Found!12125 lt!644484) (= (select (arr!47885 lt!644321) (index!50893 lt!644484)) lt!644325) (ite (is-MissingZero!12125 lt!644484) (= (select (arr!47885 lt!644321) (index!50892 lt!644484)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12125 lt!644484) (= (select (arr!47885 lt!644321) (index!50895 lt!644484)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!827584 () SeekEntryResult!12125)

(assert (=> d!155733 (= lt!644484 e!827584)))

(declare-fun c!136042 () Bool)

(assert (=> d!155733 (= c!136042 (and (is-Intermediate!12125 lt!644482) (undefined!12937 lt!644482)))))

(assert (=> d!155733 (= lt!644482 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644325 mask!2687) lt!644325 lt!644321 mask!2687))))

(assert (=> d!155733 (validMask!0 mask!2687)))

(assert (=> d!155733 (= (seekEntryOrOpen!0 lt!644325 lt!644321 mask!2687) lt!644484)))

(declare-fun b!1475069 () Bool)

(assert (=> b!1475069 (= e!827584 Undefined!12125)))

(declare-fun b!1475070 () Bool)

(assert (=> b!1475070 (= e!827584 e!827583)))

(assert (=> b!1475070 (= lt!644483 (select (arr!47885 lt!644321) (index!50894 lt!644482)))))

(declare-fun c!136041 () Bool)

(assert (=> b!1475070 (= c!136041 (= lt!644483 lt!644325))))

(assert (= (and d!155733 c!136042) b!1475069))

(assert (= (and d!155733 (not c!136042)) b!1475070))

(assert (= (and b!1475070 c!136041) b!1475066))

(assert (= (and b!1475070 (not c!136041)) b!1475068))

(assert (= (and b!1475068 c!136040) b!1475065))

(assert (= (and b!1475068 (not c!136040)) b!1475067))

(declare-fun m!1361413 () Bool)

(assert (=> b!1475067 m!1361413))

(assert (=> d!155733 m!1361137))

(declare-fun m!1361415 () Bool)

(assert (=> d!155733 m!1361415))

(declare-fun m!1361417 () Bool)

(assert (=> d!155733 m!1361417))

(assert (=> d!155733 m!1361141))

(assert (=> d!155733 m!1361143))

(declare-fun m!1361419 () Bool)

(assert (=> d!155733 m!1361419))

(assert (=> d!155733 m!1361141))

(declare-fun m!1361421 () Bool)

(assert (=> b!1475070 m!1361421))

(assert (=> b!1474668 d!155733))

(declare-fun d!155735 () Bool)

(assert (=> d!155735 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!125926 d!155735))

(declare-fun d!155741 () Bool)

(assert (=> d!155741 (= (array_inv!36913 a!2862) (bvsge (size!48435 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!125926 d!155741))

(declare-fun b!1475085 () Bool)

(declare-fun lt!644487 () SeekEntryResult!12125)

(assert (=> b!1475085 (and (bvsge (index!50894 lt!644487) #b00000000000000000000000000000000) (bvslt (index!50894 lt!644487) (size!48435 a!2862)))))

(declare-fun res!1002024 () Bool)

(assert (=> b!1475085 (= res!1002024 (= (select (arr!47885 a!2862) (index!50894 lt!644487)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!827594 () Bool)

(assert (=> b!1475085 (=> res!1002024 e!827594)))

(declare-fun b!1475086 () Bool)

(declare-fun e!827596 () SeekEntryResult!12125)

(assert (=> b!1475086 (= e!827596 (Intermediate!12125 false (toIndex!0 (select (arr!47885 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1475087 () Bool)

(assert (=> b!1475087 (and (bvsge (index!50894 lt!644487) #b00000000000000000000000000000000) (bvslt (index!50894 lt!644487) (size!48435 a!2862)))))

(assert (=> b!1475087 (= e!827594 (= (select (arr!47885 a!2862) (index!50894 lt!644487)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!155743 () Bool)

(declare-fun e!827598 () Bool)

(assert (=> d!155743 e!827598))

(declare-fun c!136048 () Bool)

(assert (=> d!155743 (= c!136048 (and (is-Intermediate!12125 lt!644487) (undefined!12937 lt!644487)))))

(declare-fun e!827595 () SeekEntryResult!12125)

(assert (=> d!155743 (= lt!644487 e!827595)))

(declare-fun c!136049 () Bool)

(assert (=> d!155743 (= c!136049 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!644488 () (_ BitVec 64))

(assert (=> d!155743 (= lt!644488 (select (arr!47885 a!2862) (toIndex!0 (select (arr!47885 a!2862) j!93) mask!2687)))))

(assert (=> d!155743 (validMask!0 mask!2687)))

(assert (=> d!155743 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47885 a!2862) j!93) mask!2687) (select (arr!47885 a!2862) j!93) a!2862 mask!2687) lt!644487)))

(declare-fun b!1475088 () Bool)

(assert (=> b!1475088 (and (bvsge (index!50894 lt!644487) #b00000000000000000000000000000000) (bvslt (index!50894 lt!644487) (size!48435 a!2862)))))

(declare-fun res!1002023 () Bool)

(assert (=> b!1475088 (= res!1002023 (= (select (arr!47885 a!2862) (index!50894 lt!644487)) (select (arr!47885 a!2862) j!93)))))

(assert (=> b!1475088 (=> res!1002023 e!827594)))

(declare-fun e!827597 () Bool)

(assert (=> b!1475088 (= e!827597 e!827594)))

(declare-fun b!1475089 () Bool)

(assert (=> b!1475089 (= e!827595 e!827596)))

(declare-fun c!136047 () Bool)

(assert (=> b!1475089 (= c!136047 (or (= lt!644488 (select (arr!47885 a!2862) j!93)) (= (bvadd lt!644488 lt!644488) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1475090 () Bool)

(assert (=> b!1475090 (= e!827596 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47885 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47885 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1475091 () Bool)

(assert (=> b!1475091 (= e!827595 (Intermediate!12125 true (toIndex!0 (select (arr!47885 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1475092 () Bool)

(assert (=> b!1475092 (= e!827598 (bvsge (x!132473 lt!644487) #b01111111111111111111111111111110))))

(declare-fun b!1475093 () Bool)

(assert (=> b!1475093 (= e!827598 e!827597)))

(declare-fun res!1002025 () Bool)

(assert (=> b!1475093 (= res!1002025 (and (is-Intermediate!12125 lt!644487) (not (undefined!12937 lt!644487)) (bvslt (x!132473 lt!644487) #b01111111111111111111111111111110) (bvsge (x!132473 lt!644487) #b00000000000000000000000000000000) (bvsge (x!132473 lt!644487) #b00000000000000000000000000000000)))))

(assert (=> b!1475093 (=> (not res!1002025) (not e!827597))))

(assert (= (and d!155743 c!136049) b!1475091))

(assert (= (and d!155743 (not c!136049)) b!1475089))

(assert (= (and b!1475089 c!136047) b!1475086))

(assert (= (and b!1475089 (not c!136047)) b!1475090))

(assert (= (and d!155743 c!136048) b!1475092))

(assert (= (and d!155743 (not c!136048)) b!1475093))

(assert (= (and b!1475093 res!1002025) b!1475088))

(assert (= (and b!1475088 (not res!1002023)) b!1475085))

(assert (= (and b!1475085 (not res!1002024)) b!1475087))

(assert (=> b!1475090 m!1361119))

(declare-fun m!1361433 () Bool)

(assert (=> b!1475090 m!1361433))

(assert (=> b!1475090 m!1361433))

(assert (=> b!1475090 m!1361107))

(declare-fun m!1361435 () Bool)

(assert (=> b!1475090 m!1361435))

(assert (=> d!155743 m!1361119))

(declare-fun m!1361437 () Bool)

(assert (=> d!155743 m!1361437))

(assert (=> d!155743 m!1361137))

(declare-fun m!1361439 () Bool)

(assert (=> b!1475085 m!1361439))

(assert (=> b!1475088 m!1361439))

(assert (=> b!1475087 m!1361439))

(assert (=> b!1474679 d!155743))

(declare-fun d!155745 () Bool)

(declare-fun lt!644494 () (_ BitVec 32))

(declare-fun lt!644493 () (_ BitVec 32))

(assert (=> d!155745 (= lt!644494 (bvmul (bvxor lt!644493 (bvlshr lt!644493 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155745 (= lt!644493 ((_ extract 31 0) (bvand (bvxor (select (arr!47885 a!2862) j!93) (bvlshr (select (arr!47885 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155745 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1002026 (let ((h!35746 ((_ extract 31 0) (bvand (bvxor (select (arr!47885 a!2862) j!93) (bvlshr (select (arr!47885 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132484 (bvmul (bvxor h!35746 (bvlshr h!35746 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132484 (bvlshr x!132484 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1002026 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1002026 #b00000000000000000000000000000000))))))

(assert (=> d!155745 (= (toIndex!0 (select (arr!47885 a!2862) j!93) mask!2687) (bvand (bvxor lt!644494 (bvlshr lt!644494 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1474679 d!155745))

(declare-fun b!1475094 () Bool)

(declare-fun lt!644495 () SeekEntryResult!12125)

(assert (=> b!1475094 (and (bvsge (index!50894 lt!644495) #b00000000000000000000000000000000) (bvslt (index!50894 lt!644495) (size!48435 lt!644321)))))

(declare-fun res!1002028 () Bool)

