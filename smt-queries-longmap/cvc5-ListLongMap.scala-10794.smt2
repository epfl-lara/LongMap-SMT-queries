; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126236 () Bool)

(assert start!126236)

(declare-fun lt!646118 () (_ BitVec 64))

(declare-datatypes ((array!99320 0))(
  ( (array!99321 (arr!47940 (Array (_ BitVec 32) (_ BitVec 64))) (size!48492 (_ BitVec 32))) )
))
(declare-fun lt!646122 () array!99320)

(declare-fun b!1480064 () Bool)

(declare-datatypes ((SeekEntryResult!12205 0))(
  ( (MissingZero!12205 (index!51212 (_ BitVec 32))) (Found!12205 (index!51213 (_ BitVec 32))) (Intermediate!12205 (undefined!13017 Bool) (index!51214 (_ BitVec 32)) (x!132783 (_ BitVec 32))) (Undefined!12205) (MissingVacant!12205 (index!51215 (_ BitVec 32))) )
))
(declare-fun lt!646120 () SeekEntryResult!12205)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!830142 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99320 (_ BitVec 32)) SeekEntryResult!12205)

(assert (=> b!1480064 (= e!830142 (= lt!646120 (seekEntryOrOpen!0 lt!646118 lt!646122 mask!2687)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!646119 () SeekEntryResult!12205)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99320 (_ BitVec 32)) SeekEntryResult!12205)

(assert (=> b!1480064 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646118 lt!646122 mask!2687) lt!646119)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((Unit!49591 0))(
  ( (Unit!49592) )
))
(declare-fun lt!646121 () Unit!49591)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99320)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!99320 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49591)

(assert (=> b!1480064 (= lt!646121 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1480065 () Bool)

(declare-fun e!830145 () Bool)

(declare-fun e!830151 () Bool)

(assert (=> b!1480065 (= e!830145 e!830151)))

(declare-fun res!1006014 () Bool)

(assert (=> b!1480065 (=> res!1006014 e!830151)))

(assert (=> b!1480065 (= res!1006014 (or (and (= (select (arr!47940 a!2862) index!646) (select (store (arr!47940 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47940 a!2862) index!646) (select (arr!47940 a!2862) j!93))) (not (= (select (arr!47940 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1480066 () Bool)

(declare-fun e!830150 () Bool)

(declare-fun e!830148 () Bool)

(assert (=> b!1480066 (= e!830150 e!830148)))

(declare-fun res!1006011 () Bool)

(assert (=> b!1480066 (=> (not res!1006011) (not e!830148))))

(declare-fun lt!646124 () SeekEntryResult!12205)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1480066 (= res!1006011 (= lt!646124 (Intermediate!12205 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99320 (_ BitVec 32)) SeekEntryResult!12205)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1480066 (= lt!646124 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646118 mask!2687) lt!646118 lt!646122 mask!2687))))

(assert (=> b!1480066 (= lt!646118 (select (store (arr!47940 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1480067 () Bool)

(declare-fun res!1006012 () Bool)

(declare-fun e!830143 () Bool)

(assert (=> b!1480067 (=> (not res!1006012) (not e!830143))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1480067 (= res!1006012 (validKeyInArray!0 (select (arr!47940 a!2862) j!93)))))

(declare-fun b!1480068 () Bool)

(declare-fun e!830144 () Bool)

(assert (=> b!1480068 (= e!830144 e!830150)))

(declare-fun res!1006015 () Bool)

(assert (=> b!1480068 (=> (not res!1006015) (not e!830150))))

(declare-fun lt!646123 () SeekEntryResult!12205)

(assert (=> b!1480068 (= res!1006015 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47940 a!2862) j!93) mask!2687) (select (arr!47940 a!2862) j!93) a!2862 mask!2687) lt!646123))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1480068 (= lt!646123 (Intermediate!12205 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1480069 () Bool)

(declare-fun e!830147 () Bool)

(assert (=> b!1480069 (= e!830147 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646118 lt!646122 mask!2687) (seekEntryOrOpen!0 lt!646118 lt!646122 mask!2687)))))

(declare-fun b!1480071 () Bool)

(declare-fun res!1006020 () Bool)

(assert (=> b!1480071 (=> (not res!1006020) (not e!830143))))

(declare-datatypes ((List!34519 0))(
  ( (Nil!34516) (Cons!34515 (h!35883 (_ BitVec 64)) (t!49205 List!34519)) )
))
(declare-fun arrayNoDuplicates!0 (array!99320 (_ BitVec 32) List!34519) Bool)

(assert (=> b!1480071 (= res!1006020 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34516))))

(declare-fun e!830146 () Bool)

(declare-fun b!1480072 () Bool)

(assert (=> b!1480072 (= e!830146 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1480073 () Bool)

(declare-fun res!1006005 () Bool)

(assert (=> b!1480073 (=> (not res!1006005) (not e!830143))))

(assert (=> b!1480073 (= res!1006005 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48492 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48492 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48492 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1480074 () Bool)

(assert (=> b!1480074 (= e!830143 e!830144)))

(declare-fun res!1006007 () Bool)

(assert (=> b!1480074 (=> (not res!1006007) (not e!830144))))

(assert (=> b!1480074 (= res!1006007 (= (select (store (arr!47940 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480074 (= lt!646122 (array!99321 (store (arr!47940 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48492 a!2862)))))

(declare-fun b!1480075 () Bool)

(declare-fun res!1006006 () Bool)

(assert (=> b!1480075 (=> (not res!1006006) (not e!830143))))

(assert (=> b!1480075 (= res!1006006 (validKeyInArray!0 (select (arr!47940 a!2862) i!1006)))))

(declare-fun b!1480076 () Bool)

(declare-fun res!1006009 () Bool)

(assert (=> b!1480076 (=> (not res!1006009) (not e!830143))))

(assert (=> b!1480076 (= res!1006009 (and (= (size!48492 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48492 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48492 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1480077 () Bool)

(declare-fun res!1006008 () Bool)

(assert (=> b!1480077 (=> (not res!1006008) (not e!830148))))

(assert (=> b!1480077 (= res!1006008 e!830147)))

(declare-fun c!136552 () Bool)

(assert (=> b!1480077 (= c!136552 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1480078 () Bool)

(declare-fun res!1006016 () Bool)

(assert (=> b!1480078 (=> (not res!1006016) (not e!830143))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99320 (_ BitVec 32)) Bool)

(assert (=> b!1480078 (= res!1006016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1480079 () Bool)

(assert (=> b!1480079 (= e!830151 e!830146)))

(declare-fun res!1006021 () Bool)

(assert (=> b!1480079 (=> (not res!1006021) (not e!830146))))

(assert (=> b!1480079 (= res!1006021 (= lt!646120 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47940 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1480080 () Bool)

(declare-fun res!1006018 () Bool)

(assert (=> b!1480080 (=> (not res!1006018) (not e!830150))))

(assert (=> b!1480080 (= res!1006018 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47940 a!2862) j!93) a!2862 mask!2687) lt!646123))))

(declare-fun b!1480081 () Bool)

(assert (=> b!1480081 (= e!830147 (= lt!646124 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646118 lt!646122 mask!2687)))))

(declare-fun res!1006013 () Bool)

(assert (=> start!126236 (=> (not res!1006013) (not e!830143))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126236 (= res!1006013 (validMask!0 mask!2687))))

(assert (=> start!126236 e!830143))

(assert (=> start!126236 true))

(declare-fun array_inv!37173 (array!99320) Bool)

(assert (=> start!126236 (array_inv!37173 a!2862)))

(declare-fun b!1480070 () Bool)

(declare-fun res!1006010 () Bool)

(assert (=> b!1480070 (=> (not res!1006010) (not e!830148))))

(assert (=> b!1480070 (= res!1006010 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1480082 () Bool)

(assert (=> b!1480082 (= e!830148 (not e!830142))))

(declare-fun res!1006017 () Bool)

(assert (=> b!1480082 (=> res!1006017 e!830142)))

(assert (=> b!1480082 (= res!1006017 (or (and (= (select (arr!47940 a!2862) index!646) (select (store (arr!47940 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47940 a!2862) index!646) (select (arr!47940 a!2862) j!93))) (not (= (select (arr!47940 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47940 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1480082 e!830145))

(declare-fun res!1006004 () Bool)

(assert (=> b!1480082 (=> (not res!1006004) (not e!830145))))

(assert (=> b!1480082 (= res!1006004 (and (= lt!646120 lt!646119) (or (= (select (arr!47940 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47940 a!2862) intermediateBeforeIndex!19) (select (arr!47940 a!2862) j!93)))))))

(assert (=> b!1480082 (= lt!646119 (Found!12205 j!93))))

(assert (=> b!1480082 (= lt!646120 (seekEntryOrOpen!0 (select (arr!47940 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1480082 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!646125 () Unit!49591)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99320 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49591)

(assert (=> b!1480082 (= lt!646125 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1480083 () Bool)

(declare-fun res!1006019 () Bool)

(assert (=> b!1480083 (=> res!1006019 e!830142)))

(assert (=> b!1480083 (= res!1006019 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47940 a!2862) j!93) a!2862 mask!2687) lt!646119)))))

(assert (= (and start!126236 res!1006013) b!1480076))

(assert (= (and b!1480076 res!1006009) b!1480075))

(assert (= (and b!1480075 res!1006006) b!1480067))

(assert (= (and b!1480067 res!1006012) b!1480078))

(assert (= (and b!1480078 res!1006016) b!1480071))

(assert (= (and b!1480071 res!1006020) b!1480073))

(assert (= (and b!1480073 res!1006005) b!1480074))

(assert (= (and b!1480074 res!1006007) b!1480068))

(assert (= (and b!1480068 res!1006015) b!1480080))

(assert (= (and b!1480080 res!1006018) b!1480066))

(assert (= (and b!1480066 res!1006011) b!1480077))

(assert (= (and b!1480077 c!136552) b!1480081))

(assert (= (and b!1480077 (not c!136552)) b!1480069))

(assert (= (and b!1480077 res!1006008) b!1480070))

(assert (= (and b!1480070 res!1006010) b!1480082))

(assert (= (and b!1480082 res!1006004) b!1480065))

(assert (= (and b!1480065 (not res!1006014)) b!1480079))

(assert (= (and b!1480079 res!1006021) b!1480072))

(assert (= (and b!1480082 (not res!1006017)) b!1480083))

(assert (= (and b!1480083 (not res!1006019)) b!1480064))

(declare-fun m!1365397 () Bool)

(assert (=> b!1480064 m!1365397))

(declare-fun m!1365399 () Bool)

(assert (=> b!1480064 m!1365399))

(declare-fun m!1365401 () Bool)

(assert (=> b!1480064 m!1365401))

(declare-fun m!1365403 () Bool)

(assert (=> b!1480078 m!1365403))

(declare-fun m!1365405 () Bool)

(assert (=> b!1480083 m!1365405))

(assert (=> b!1480083 m!1365405))

(declare-fun m!1365407 () Bool)

(assert (=> b!1480083 m!1365407))

(declare-fun m!1365409 () Bool)

(assert (=> b!1480065 m!1365409))

(declare-fun m!1365411 () Bool)

(assert (=> b!1480065 m!1365411))

(declare-fun m!1365413 () Bool)

(assert (=> b!1480065 m!1365413))

(assert (=> b!1480065 m!1365405))

(declare-fun m!1365415 () Bool)

(assert (=> start!126236 m!1365415))

(declare-fun m!1365417 () Bool)

(assert (=> start!126236 m!1365417))

(assert (=> b!1480068 m!1365405))

(assert (=> b!1480068 m!1365405))

(declare-fun m!1365419 () Bool)

(assert (=> b!1480068 m!1365419))

(assert (=> b!1480068 m!1365419))

(assert (=> b!1480068 m!1365405))

(declare-fun m!1365421 () Bool)

(assert (=> b!1480068 m!1365421))

(assert (=> b!1480074 m!1365411))

(declare-fun m!1365423 () Bool)

(assert (=> b!1480074 m!1365423))

(declare-fun m!1365425 () Bool)

(assert (=> b!1480066 m!1365425))

(assert (=> b!1480066 m!1365425))

(declare-fun m!1365427 () Bool)

(assert (=> b!1480066 m!1365427))

(assert (=> b!1480066 m!1365411))

(declare-fun m!1365429 () Bool)

(assert (=> b!1480066 m!1365429))

(assert (=> b!1480067 m!1365405))

(assert (=> b!1480067 m!1365405))

(declare-fun m!1365431 () Bool)

(assert (=> b!1480067 m!1365431))

(declare-fun m!1365433 () Bool)

(assert (=> b!1480075 m!1365433))

(assert (=> b!1480075 m!1365433))

(declare-fun m!1365435 () Bool)

(assert (=> b!1480075 m!1365435))

(declare-fun m!1365437 () Bool)

(assert (=> b!1480071 m!1365437))

(assert (=> b!1480080 m!1365405))

(assert (=> b!1480080 m!1365405))

(declare-fun m!1365439 () Bool)

(assert (=> b!1480080 m!1365439))

(assert (=> b!1480069 m!1365399))

(assert (=> b!1480069 m!1365397))

(assert (=> b!1480079 m!1365405))

(assert (=> b!1480079 m!1365405))

(declare-fun m!1365441 () Bool)

(assert (=> b!1480079 m!1365441))

(declare-fun m!1365443 () Bool)

(assert (=> b!1480081 m!1365443))

(declare-fun m!1365445 () Bool)

(assert (=> b!1480082 m!1365445))

(assert (=> b!1480082 m!1365411))

(declare-fun m!1365447 () Bool)

(assert (=> b!1480082 m!1365447))

(assert (=> b!1480082 m!1365413))

(assert (=> b!1480082 m!1365409))

(assert (=> b!1480082 m!1365405))

(declare-fun m!1365449 () Bool)

(assert (=> b!1480082 m!1365449))

(declare-fun m!1365451 () Bool)

(assert (=> b!1480082 m!1365451))

(assert (=> b!1480082 m!1365405))

(push 1)

(assert (not start!126236))

(assert (not b!1480078))

(assert (not b!1480081))

(assert (not b!1480082))

(assert (not b!1480071))

(assert (not b!1480069))

(assert (not b!1480083))

(assert (not b!1480064))

(assert (not b!1480068))

(assert (not b!1480067))

(assert (not b!1480080))

(assert (not b!1480079))

(assert (not b!1480075))

(assert (not b!1480066))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

