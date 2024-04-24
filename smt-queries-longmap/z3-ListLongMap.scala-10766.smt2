; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126192 () Bool)

(assert start!126192)

(declare-fun b!1476072 () Bool)

(declare-fun e!828304 () Bool)

(declare-fun e!828309 () Bool)

(assert (=> b!1476072 (= e!828304 e!828309)))

(declare-fun res!1002191 () Bool)

(assert (=> b!1476072 (=> (not res!1002191) (not e!828309))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12069 0))(
  ( (MissingZero!12069 (index!50668 (_ BitVec 32))) (Found!12069 (index!50669 (_ BitVec 32))) (Intermediate!12069 (undefined!12881 Bool) (index!50670 (_ BitVec 32)) (x!132434 (_ BitVec 32))) (Undefined!12069) (MissingVacant!12069 (index!50671 (_ BitVec 32))) )
))
(declare-fun lt!644869 () SeekEntryResult!12069)

(assert (=> b!1476072 (= res!1002191 (= lt!644869 (Intermediate!12069 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!644867 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!99307 0))(
  ( (array!99308 (arr!47932 (Array (_ BitVec 32) (_ BitVec 64))) (size!48483 (_ BitVec 32))) )
))
(declare-fun lt!644866 () array!99307)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99307 (_ BitVec 32)) SeekEntryResult!12069)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1476072 (= lt!644869 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644867 mask!2687) lt!644867 lt!644866 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99307)

(assert (=> b!1476072 (= lt!644867 (select (store (arr!47932 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1476073 () Bool)

(declare-fun res!1002188 () Bool)

(assert (=> b!1476073 (=> (not res!1002188) (not e!828304))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!644865 () SeekEntryResult!12069)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1476073 (= res!1002188 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47932 a!2862) j!93) a!2862 mask!2687) lt!644865))))

(declare-fun b!1476074 () Bool)

(declare-fun res!1002199 () Bool)

(declare-fun e!828306 () Bool)

(assert (=> b!1476074 (=> (not res!1002199) (not e!828306))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99307 (_ BitVec 32)) Bool)

(assert (=> b!1476074 (= res!1002199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1476076 () Bool)

(declare-fun res!1002198 () Bool)

(assert (=> b!1476076 (=> (not res!1002198) (not e!828306))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1476076 (= res!1002198 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48483 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48483 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48483 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1476077 () Bool)

(declare-fun res!1002190 () Bool)

(assert (=> b!1476077 (=> (not res!1002190) (not e!828306))))

(declare-datatypes ((List!34420 0))(
  ( (Nil!34417) (Cons!34416 (h!35789 (_ BitVec 64)) (t!49106 List!34420)) )
))
(declare-fun arrayNoDuplicates!0 (array!99307 (_ BitVec 32) List!34420) Bool)

(assert (=> b!1476077 (= res!1002190 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34417))))

(declare-fun b!1476078 () Bool)

(declare-fun res!1002193 () Bool)

(assert (=> b!1476078 (=> (not res!1002193) (not e!828306))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1476078 (= res!1002193 (validKeyInArray!0 (select (arr!47932 a!2862) j!93)))))

(declare-fun b!1476079 () Bool)

(declare-fun res!1002200 () Bool)

(assert (=> b!1476079 (=> (not res!1002200) (not e!828309))))

(declare-fun e!828308 () Bool)

(assert (=> b!1476079 (= res!1002200 e!828308)))

(declare-fun c!136468 () Bool)

(assert (=> b!1476079 (= c!136468 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1476080 () Bool)

(declare-fun e!828303 () Bool)

(assert (=> b!1476080 (= e!828303 e!828304)))

(declare-fun res!1002195 () Bool)

(assert (=> b!1476080 (=> (not res!1002195) (not e!828304))))

(assert (=> b!1476080 (= res!1002195 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47932 a!2862) j!93) mask!2687) (select (arr!47932 a!2862) j!93) a!2862 mask!2687) lt!644865))))

(assert (=> b!1476080 (= lt!644865 (Intermediate!12069 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1476081 () Bool)

(declare-fun e!828307 () Bool)

(assert (=> b!1476081 (= e!828307 (or (= (select (arr!47932 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47932 a!2862) intermediateBeforeIndex!19) (select (arr!47932 a!2862) j!93))))))

(declare-fun b!1476082 () Bool)

(assert (=> b!1476082 (= e!828306 e!828303)))

(declare-fun res!1002189 () Bool)

(assert (=> b!1476082 (=> (not res!1002189) (not e!828303))))

(assert (=> b!1476082 (= res!1002189 (= (select (store (arr!47932 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1476082 (= lt!644866 (array!99308 (store (arr!47932 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48483 a!2862)))))

(declare-fun b!1476083 () Bool)

(assert (=> b!1476083 (= e!828309 (not true))))

(assert (=> b!1476083 e!828307))

(declare-fun res!1002196 () Bool)

(assert (=> b!1476083 (=> (not res!1002196) (not e!828307))))

(assert (=> b!1476083 (= res!1002196 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49511 0))(
  ( (Unit!49512) )
))
(declare-fun lt!644868 () Unit!49511)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99307 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49511)

(assert (=> b!1476083 (= lt!644868 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1476084 () Bool)

(declare-fun res!1002187 () Bool)

(assert (=> b!1476084 (=> (not res!1002187) (not e!828309))))

(assert (=> b!1476084 (= res!1002187 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1476075 () Bool)

(declare-fun res!1002192 () Bool)

(assert (=> b!1476075 (=> (not res!1002192) (not e!828306))))

(assert (=> b!1476075 (= res!1002192 (validKeyInArray!0 (select (arr!47932 a!2862) i!1006)))))

(declare-fun res!1002186 () Bool)

(assert (=> start!126192 (=> (not res!1002186) (not e!828306))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126192 (= res!1002186 (validMask!0 mask!2687))))

(assert (=> start!126192 e!828306))

(assert (=> start!126192 true))

(declare-fun array_inv!37213 (array!99307) Bool)

(assert (=> start!126192 (array_inv!37213 a!2862)))

(declare-fun b!1476085 () Bool)

(declare-fun res!1002194 () Bool)

(assert (=> b!1476085 (=> (not res!1002194) (not e!828306))))

(assert (=> b!1476085 (= res!1002194 (and (= (size!48483 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48483 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48483 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1476086 () Bool)

(assert (=> b!1476086 (= e!828308 (= lt!644869 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644867 lt!644866 mask!2687)))))

(declare-fun b!1476087 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99307 (_ BitVec 32)) SeekEntryResult!12069)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99307 (_ BitVec 32)) SeekEntryResult!12069)

(assert (=> b!1476087 (= e!828308 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644867 lt!644866 mask!2687) (seekEntryOrOpen!0 lt!644867 lt!644866 mask!2687)))))

(declare-fun b!1476088 () Bool)

(declare-fun res!1002197 () Bool)

(assert (=> b!1476088 (=> (not res!1002197) (not e!828307))))

(assert (=> b!1476088 (= res!1002197 (= (seekEntryOrOpen!0 (select (arr!47932 a!2862) j!93) a!2862 mask!2687) (Found!12069 j!93)))))

(assert (= (and start!126192 res!1002186) b!1476085))

(assert (= (and b!1476085 res!1002194) b!1476075))

(assert (= (and b!1476075 res!1002192) b!1476078))

(assert (= (and b!1476078 res!1002193) b!1476074))

(assert (= (and b!1476074 res!1002199) b!1476077))

(assert (= (and b!1476077 res!1002190) b!1476076))

(assert (= (and b!1476076 res!1002198) b!1476082))

(assert (= (and b!1476082 res!1002189) b!1476080))

(assert (= (and b!1476080 res!1002195) b!1476073))

(assert (= (and b!1476073 res!1002188) b!1476072))

(assert (= (and b!1476072 res!1002191) b!1476079))

(assert (= (and b!1476079 c!136468) b!1476086))

(assert (= (and b!1476079 (not c!136468)) b!1476087))

(assert (= (and b!1476079 res!1002200) b!1476084))

(assert (= (and b!1476084 res!1002187) b!1476083))

(assert (= (and b!1476083 res!1002196) b!1476088))

(assert (= (and b!1476088 res!1002197) b!1476081))

(declare-fun m!1362505 () Bool)

(assert (=> b!1476073 m!1362505))

(assert (=> b!1476073 m!1362505))

(declare-fun m!1362507 () Bool)

(assert (=> b!1476073 m!1362507))

(assert (=> b!1476080 m!1362505))

(assert (=> b!1476080 m!1362505))

(declare-fun m!1362509 () Bool)

(assert (=> b!1476080 m!1362509))

(assert (=> b!1476080 m!1362509))

(assert (=> b!1476080 m!1362505))

(declare-fun m!1362511 () Bool)

(assert (=> b!1476080 m!1362511))

(declare-fun m!1362513 () Bool)

(assert (=> b!1476077 m!1362513))

(assert (=> b!1476088 m!1362505))

(assert (=> b!1476088 m!1362505))

(declare-fun m!1362515 () Bool)

(assert (=> b!1476088 m!1362515))

(declare-fun m!1362517 () Bool)

(assert (=> b!1476074 m!1362517))

(declare-fun m!1362519 () Bool)

(assert (=> b!1476086 m!1362519))

(declare-fun m!1362521 () Bool)

(assert (=> b!1476087 m!1362521))

(declare-fun m!1362523 () Bool)

(assert (=> b!1476087 m!1362523))

(assert (=> b!1476078 m!1362505))

(assert (=> b!1476078 m!1362505))

(declare-fun m!1362525 () Bool)

(assert (=> b!1476078 m!1362525))

(declare-fun m!1362527 () Bool)

(assert (=> b!1476082 m!1362527))

(declare-fun m!1362529 () Bool)

(assert (=> b!1476082 m!1362529))

(declare-fun m!1362531 () Bool)

(assert (=> start!126192 m!1362531))

(declare-fun m!1362533 () Bool)

(assert (=> start!126192 m!1362533))

(declare-fun m!1362535 () Bool)

(assert (=> b!1476083 m!1362535))

(declare-fun m!1362537 () Bool)

(assert (=> b!1476083 m!1362537))

(declare-fun m!1362539 () Bool)

(assert (=> b!1476072 m!1362539))

(assert (=> b!1476072 m!1362539))

(declare-fun m!1362541 () Bool)

(assert (=> b!1476072 m!1362541))

(assert (=> b!1476072 m!1362527))

(declare-fun m!1362543 () Bool)

(assert (=> b!1476072 m!1362543))

(declare-fun m!1362545 () Bool)

(assert (=> b!1476075 m!1362545))

(assert (=> b!1476075 m!1362545))

(declare-fun m!1362547 () Bool)

(assert (=> b!1476075 m!1362547))

(declare-fun m!1362549 () Bool)

(assert (=> b!1476081 m!1362549))

(assert (=> b!1476081 m!1362505))

(check-sat (not b!1476072) (not b!1476088) (not b!1476073) (not b!1476083) (not b!1476086) (not b!1476087) (not b!1476078) (not start!126192) (not b!1476077) (not b!1476075) (not b!1476080) (not b!1476074))
(check-sat)
