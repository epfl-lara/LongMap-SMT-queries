; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126780 () Bool)

(assert start!126780)

(declare-fun b!1485312 () Bool)

(declare-fun res!1009083 () Bool)

(declare-fun e!832949 () Bool)

(assert (=> b!1485312 (=> (not res!1009083) (not e!832949))))

(declare-fun e!832943 () Bool)

(assert (=> b!1485312 (= res!1009083 e!832943)))

(declare-fun c!137653 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1485312 (= c!137653 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1485313 () Bool)

(declare-fun res!1009088 () Bool)

(declare-fun e!832941 () Bool)

(assert (=> b!1485313 (=> (not res!1009088) (not e!832941))))

(declare-datatypes ((array!99580 0))(
  ( (array!99581 (arr!48061 (Array (_ BitVec 32) (_ BitVec 64))) (size!48612 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99580)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1485313 (= res!1009088 (validKeyInArray!0 (select (arr!48061 a!2862) j!93)))))

(declare-fun b!1485314 () Bool)

(declare-fun e!832948 () Bool)

(declare-fun e!832950 () Bool)

(assert (=> b!1485314 (= e!832948 e!832950)))

(declare-fun res!1009074 () Bool)

(assert (=> b!1485314 (=> res!1009074 e!832950)))

(declare-fun lt!648122 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1485314 (= res!1009074 (or (and (= (select (arr!48061 a!2862) index!646) lt!648122) (= (select (arr!48061 a!2862) index!646) (select (arr!48061 a!2862) j!93))) (= (select (arr!48061 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1485314 (= lt!648122 (select (store (arr!48061 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1485315 () Bool)

(declare-fun res!1009077 () Bool)

(assert (=> b!1485315 (=> (not res!1009077) (not e!832941))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99580 (_ BitVec 32)) Bool)

(assert (=> b!1485315 (= res!1009077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1485316 () Bool)

(declare-fun e!832947 () Bool)

(assert (=> b!1485316 (= e!832950 e!832947)))

(declare-fun res!1009079 () Bool)

(assert (=> b!1485316 (=> (not res!1009079) (not e!832947))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1485316 (= res!1009079 (and (= index!646 intermediateAfterIndex!19) (= lt!648122 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1485317 () Bool)

(declare-fun lt!648118 () array!99580)

(declare-fun lt!648121 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12198 0))(
  ( (MissingZero!12198 (index!51184 (_ BitVec 32))) (Found!12198 (index!51185 (_ BitVec 32))) (Intermediate!12198 (undefined!13010 Bool) (index!51186 (_ BitVec 32)) (x!132955 (_ BitVec 32))) (Undefined!12198) (MissingVacant!12198 (index!51187 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99580 (_ BitVec 32)) SeekEntryResult!12198)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99580 (_ BitVec 32)) SeekEntryResult!12198)

(assert (=> b!1485317 (= e!832947 (= (seekEntryOrOpen!0 lt!648121 lt!648118 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648121 lt!648118 mask!2687)))))

(declare-fun b!1485318 () Bool)

(declare-fun res!1009086 () Bool)

(assert (=> b!1485318 (=> (not res!1009086) (not e!832941))))

(assert (=> b!1485318 (= res!1009086 (validKeyInArray!0 (select (arr!48061 a!2862) i!1006)))))

(declare-fun b!1485319 () Bool)

(declare-fun e!832944 () Bool)

(assert (=> b!1485319 (= e!832949 (not e!832944))))

(declare-fun res!1009087 () Bool)

(assert (=> b!1485319 (=> res!1009087 e!832944)))

(assert (=> b!1485319 (= res!1009087 (or (and (= (select (arr!48061 a!2862) index!646) (select (store (arr!48061 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48061 a!2862) index!646) (select (arr!48061 a!2862) j!93))) (= (select (arr!48061 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1485319 e!832948))

(declare-fun res!1009081 () Bool)

(assert (=> b!1485319 (=> (not res!1009081) (not e!832948))))

(assert (=> b!1485319 (= res!1009081 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49769 0))(
  ( (Unit!49770) )
))
(declare-fun lt!648124 () Unit!49769)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99580 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49769)

(assert (=> b!1485319 (= lt!648124 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1485320 () Bool)

(assert (=> b!1485320 (= e!832943 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648121 lt!648118 mask!2687) (seekEntryOrOpen!0 lt!648121 lt!648118 mask!2687)))))

(declare-fun b!1485321 () Bool)

(declare-fun e!832945 () Bool)

(assert (=> b!1485321 (= e!832945 e!832949)))

(declare-fun res!1009085 () Bool)

(assert (=> b!1485321 (=> (not res!1009085) (not e!832949))))

(declare-fun lt!648120 () SeekEntryResult!12198)

(assert (=> b!1485321 (= res!1009085 (= lt!648120 (Intermediate!12198 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99580 (_ BitVec 32)) SeekEntryResult!12198)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485321 (= lt!648120 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648121 mask!2687) lt!648121 lt!648118 mask!2687))))

(assert (=> b!1485321 (= lt!648121 (select (store (arr!48061 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!1009080 () Bool)

(assert (=> start!126780 (=> (not res!1009080) (not e!832941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126780 (= res!1009080 (validMask!0 mask!2687))))

(assert (=> start!126780 e!832941))

(assert (=> start!126780 true))

(declare-fun array_inv!37342 (array!99580) Bool)

(assert (=> start!126780 (array_inv!37342 a!2862)))

(declare-fun b!1485311 () Bool)

(assert (=> b!1485311 (= e!832943 (= lt!648120 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648121 lt!648118 mask!2687)))))

(declare-fun b!1485322 () Bool)

(declare-fun res!1009076 () Bool)

(assert (=> b!1485322 (=> (not res!1009076) (not e!832948))))

(assert (=> b!1485322 (= res!1009076 (= (seekEntryOrOpen!0 (select (arr!48061 a!2862) j!93) a!2862 mask!2687) (Found!12198 j!93)))))

(declare-fun b!1485323 () Bool)

(declare-fun res!1009075 () Bool)

(assert (=> b!1485323 (=> (not res!1009075) (not e!832941))))

(declare-datatypes ((List!34549 0))(
  ( (Nil!34546) (Cons!34545 (h!35933 (_ BitVec 64)) (t!49235 List!34549)) )
))
(declare-fun arrayNoDuplicates!0 (array!99580 (_ BitVec 32) List!34549) Bool)

(assert (=> b!1485323 (= res!1009075 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34546))))

(declare-fun b!1485324 () Bool)

(declare-fun e!832946 () Bool)

(assert (=> b!1485324 (= e!832941 e!832946)))

(declare-fun res!1009070 () Bool)

(assert (=> b!1485324 (=> (not res!1009070) (not e!832946))))

(assert (=> b!1485324 (= res!1009070 (= (select (store (arr!48061 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1485324 (= lt!648118 (array!99581 (store (arr!48061 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48612 a!2862)))))

(declare-fun b!1485325 () Bool)

(declare-fun res!1009082 () Bool)

(assert (=> b!1485325 (=> (not res!1009082) (not e!832941))))

(assert (=> b!1485325 (= res!1009082 (and (= (size!48612 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48612 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48612 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1485326 () Bool)

(assert (=> b!1485326 (= e!832944 true)))

(declare-fun lt!648119 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485326 (= lt!648119 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1485327 () Bool)

(assert (=> b!1485327 (= e!832946 e!832945)))

(declare-fun res!1009073 () Bool)

(assert (=> b!1485327 (=> (not res!1009073) (not e!832945))))

(declare-fun lt!648123 () SeekEntryResult!12198)

(assert (=> b!1485327 (= res!1009073 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48061 a!2862) j!93) mask!2687) (select (arr!48061 a!2862) j!93) a!2862 mask!2687) lt!648123))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1485327 (= lt!648123 (Intermediate!12198 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1485328 () Bool)

(declare-fun res!1009078 () Bool)

(assert (=> b!1485328 (=> (not res!1009078) (not e!832941))))

(assert (=> b!1485328 (= res!1009078 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48612 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48612 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48612 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1485329 () Bool)

(declare-fun res!1009072 () Bool)

(assert (=> b!1485329 (=> (not res!1009072) (not e!832948))))

(assert (=> b!1485329 (= res!1009072 (or (= (select (arr!48061 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48061 a!2862) intermediateBeforeIndex!19) (select (arr!48061 a!2862) j!93))))))

(declare-fun b!1485330 () Bool)

(declare-fun res!1009071 () Bool)

(assert (=> b!1485330 (=> (not res!1009071) (not e!832945))))

(assert (=> b!1485330 (= res!1009071 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48061 a!2862) j!93) a!2862 mask!2687) lt!648123))))

(declare-fun b!1485331 () Bool)

(declare-fun res!1009084 () Bool)

(assert (=> b!1485331 (=> (not res!1009084) (not e!832949))))

(assert (=> b!1485331 (= res!1009084 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!126780 res!1009080) b!1485325))

(assert (= (and b!1485325 res!1009082) b!1485318))

(assert (= (and b!1485318 res!1009086) b!1485313))

(assert (= (and b!1485313 res!1009088) b!1485315))

(assert (= (and b!1485315 res!1009077) b!1485323))

(assert (= (and b!1485323 res!1009075) b!1485328))

(assert (= (and b!1485328 res!1009078) b!1485324))

(assert (= (and b!1485324 res!1009070) b!1485327))

(assert (= (and b!1485327 res!1009073) b!1485330))

(assert (= (and b!1485330 res!1009071) b!1485321))

(assert (= (and b!1485321 res!1009085) b!1485312))

(assert (= (and b!1485312 c!137653) b!1485311))

(assert (= (and b!1485312 (not c!137653)) b!1485320))

(assert (= (and b!1485312 res!1009083) b!1485331))

(assert (= (and b!1485331 res!1009084) b!1485319))

(assert (= (and b!1485319 res!1009081) b!1485322))

(assert (= (and b!1485322 res!1009076) b!1485329))

(assert (= (and b!1485329 res!1009072) b!1485314))

(assert (= (and b!1485314 (not res!1009074)) b!1485316))

(assert (= (and b!1485316 res!1009079) b!1485317))

(assert (= (and b!1485319 (not res!1009087)) b!1485326))

(declare-fun m!1370743 () Bool)

(assert (=> b!1485311 m!1370743))

(declare-fun m!1370745 () Bool)

(assert (=> b!1485317 m!1370745))

(declare-fun m!1370747 () Bool)

(assert (=> b!1485317 m!1370747))

(declare-fun m!1370749 () Bool)

(assert (=> b!1485322 m!1370749))

(assert (=> b!1485322 m!1370749))

(declare-fun m!1370751 () Bool)

(assert (=> b!1485322 m!1370751))

(declare-fun m!1370753 () Bool)

(assert (=> b!1485329 m!1370753))

(assert (=> b!1485329 m!1370749))

(declare-fun m!1370755 () Bool)

(assert (=> b!1485324 m!1370755))

(declare-fun m!1370757 () Bool)

(assert (=> b!1485324 m!1370757))

(declare-fun m!1370759 () Bool)

(assert (=> b!1485326 m!1370759))

(assert (=> b!1485327 m!1370749))

(assert (=> b!1485327 m!1370749))

(declare-fun m!1370761 () Bool)

(assert (=> b!1485327 m!1370761))

(assert (=> b!1485327 m!1370761))

(assert (=> b!1485327 m!1370749))

(declare-fun m!1370763 () Bool)

(assert (=> b!1485327 m!1370763))

(declare-fun m!1370765 () Bool)

(assert (=> start!126780 m!1370765))

(declare-fun m!1370767 () Bool)

(assert (=> start!126780 m!1370767))

(assert (=> b!1485320 m!1370747))

(assert (=> b!1485320 m!1370745))

(declare-fun m!1370769 () Bool)

(assert (=> b!1485315 m!1370769))

(declare-fun m!1370771 () Bool)

(assert (=> b!1485323 m!1370771))

(declare-fun m!1370773 () Bool)

(assert (=> b!1485321 m!1370773))

(assert (=> b!1485321 m!1370773))

(declare-fun m!1370775 () Bool)

(assert (=> b!1485321 m!1370775))

(assert (=> b!1485321 m!1370755))

(declare-fun m!1370777 () Bool)

(assert (=> b!1485321 m!1370777))

(assert (=> b!1485330 m!1370749))

(assert (=> b!1485330 m!1370749))

(declare-fun m!1370779 () Bool)

(assert (=> b!1485330 m!1370779))

(declare-fun m!1370781 () Bool)

(assert (=> b!1485314 m!1370781))

(assert (=> b!1485314 m!1370749))

(assert (=> b!1485314 m!1370755))

(declare-fun m!1370783 () Bool)

(assert (=> b!1485314 m!1370783))

(declare-fun m!1370785 () Bool)

(assert (=> b!1485319 m!1370785))

(assert (=> b!1485319 m!1370755))

(assert (=> b!1485319 m!1370783))

(assert (=> b!1485319 m!1370781))

(declare-fun m!1370787 () Bool)

(assert (=> b!1485319 m!1370787))

(assert (=> b!1485319 m!1370749))

(declare-fun m!1370789 () Bool)

(assert (=> b!1485318 m!1370789))

(assert (=> b!1485318 m!1370789))

(declare-fun m!1370791 () Bool)

(assert (=> b!1485318 m!1370791))

(assert (=> b!1485313 m!1370749))

(assert (=> b!1485313 m!1370749))

(declare-fun m!1370793 () Bool)

(assert (=> b!1485313 m!1370793))

(check-sat (not b!1485330) (not start!126780) (not b!1485323) (not b!1485317) (not b!1485326) (not b!1485320) (not b!1485315) (not b!1485319) (not b!1485322) (not b!1485321) (not b!1485327) (not b!1485313) (not b!1485318) (not b!1485311))
(check-sat)
