; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126562 () Bool)

(assert start!126562)

(declare-fun b!1485493 () Bool)

(declare-fun e!832779 () Bool)

(declare-fun e!832784 () Bool)

(assert (=> b!1485493 (= e!832779 e!832784)))

(declare-fun res!1010186 () Bool)

(assert (=> b!1485493 (=> (not res!1010186) (not e!832784))))

(declare-datatypes ((SeekEntryResult!12278 0))(
  ( (MissingZero!12278 (index!51504 (_ BitVec 32))) (Found!12278 (index!51505 (_ BitVec 32))) (Intermediate!12278 (undefined!13090 Bool) (index!51506 (_ BitVec 32)) (x!133082 (_ BitVec 32))) (Undefined!12278) (MissingVacant!12278 (index!51507 (_ BitVec 32))) )
))
(declare-fun lt!648116 () SeekEntryResult!12278)

(declare-datatypes ((array!99524 0))(
  ( (array!99525 (arr!48038 (Array (_ BitVec 32) (_ BitVec 64))) (size!48588 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99524)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99524 (_ BitVec 32)) SeekEntryResult!12278)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485493 (= res!1010186 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48038 a!2862) j!93) mask!2687) (select (arr!48038 a!2862) j!93) a!2862 mask!2687) lt!648116))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1485493 (= lt!648116 (Intermediate!12278 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1485494 () Bool)

(declare-fun res!1010185 () Bool)

(declare-fun e!832787 () Bool)

(assert (=> b!1485494 (=> (not res!1010185) (not e!832787))))

(assert (=> b!1485494 (= res!1010185 (or (= (select (arr!48038 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48038 a!2862) intermediateBeforeIndex!19) (select (arr!48038 a!2862) j!93))))))

(declare-fun b!1485495 () Bool)

(declare-fun res!1010176 () Bool)

(assert (=> b!1485495 (=> (not res!1010176) (not e!832784))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1485495 (= res!1010176 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48038 a!2862) j!93) a!2862 mask!2687) lt!648116))))

(declare-fun b!1485496 () Bool)

(declare-fun res!1010175 () Bool)

(declare-fun e!832778 () Bool)

(assert (=> b!1485496 (=> (not res!1010175) (not e!832778))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99524 (_ BitVec 32)) Bool)

(assert (=> b!1485496 (= res!1010175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1485497 () Bool)

(assert (=> b!1485497 (= e!832778 e!832779)))

(declare-fun res!1010180 () Bool)

(assert (=> b!1485497 (=> (not res!1010180) (not e!832779))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1485497 (= res!1010180 (= (select (store (arr!48038 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!648111 () array!99524)

(assert (=> b!1485497 (= lt!648111 (array!99525 (store (arr!48038 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48588 a!2862)))))

(declare-fun b!1485498 () Bool)

(declare-fun e!832783 () Bool)

(declare-fun e!832785 () Bool)

(assert (=> b!1485498 (= e!832783 e!832785)))

(declare-fun res!1010188 () Bool)

(assert (=> b!1485498 (=> (not res!1010188) (not e!832785))))

(declare-fun lt!648113 () (_ BitVec 64))

(assert (=> b!1485498 (= res!1010188 (and (= index!646 intermediateAfterIndex!19) (= lt!648113 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!832781 () Bool)

(declare-fun lt!648114 () (_ BitVec 64))

(declare-fun b!1485499 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99524 (_ BitVec 32)) SeekEntryResult!12278)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99524 (_ BitVec 32)) SeekEntryResult!12278)

(assert (=> b!1485499 (= e!832781 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648114 lt!648111 mask!2687) (seekEntryOrOpen!0 lt!648114 lt!648111 mask!2687)))))

(declare-fun res!1010179 () Bool)

(assert (=> start!126562 (=> (not res!1010179) (not e!832778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126562 (= res!1010179 (validMask!0 mask!2687))))

(assert (=> start!126562 e!832778))

(assert (=> start!126562 true))

(declare-fun array_inv!37066 (array!99524) Bool)

(assert (=> start!126562 (array_inv!37066 a!2862)))

(declare-fun b!1485500 () Bool)

(assert (=> b!1485500 (= e!832785 (= (seekEntryOrOpen!0 lt!648114 lt!648111 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648114 lt!648111 mask!2687)))))

(declare-fun b!1485501 () Bool)

(declare-fun e!832786 () Bool)

(assert (=> b!1485501 (= e!832786 true)))

(declare-fun lt!648115 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485501 (= lt!648115 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1485502 () Bool)

(declare-fun res!1010171 () Bool)

(assert (=> b!1485502 (=> (not res!1010171) (not e!832787))))

(assert (=> b!1485502 (= res!1010171 (= (seekEntryOrOpen!0 (select (arr!48038 a!2862) j!93) a!2862 mask!2687) (Found!12278 j!93)))))

(declare-fun b!1485503 () Bool)

(declare-fun e!832782 () Bool)

(assert (=> b!1485503 (= e!832782 (not e!832786))))

(declare-fun res!1010173 () Bool)

(assert (=> b!1485503 (=> res!1010173 e!832786)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1485503 (= res!1010173 (or (and (= (select (arr!48038 a!2862) index!646) (select (store (arr!48038 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48038 a!2862) index!646) (select (arr!48038 a!2862) j!93))) (= (select (arr!48038 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1485503 e!832787))

(declare-fun res!1010184 () Bool)

(assert (=> b!1485503 (=> (not res!1010184) (not e!832787))))

(assert (=> b!1485503 (= res!1010184 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49896 0))(
  ( (Unit!49897) )
))
(declare-fun lt!648112 () Unit!49896)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99524 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49896)

(assert (=> b!1485503 (= lt!648112 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1485504 () Bool)

(declare-fun res!1010178 () Bool)

(assert (=> b!1485504 (=> (not res!1010178) (not e!832778))))

(assert (=> b!1485504 (= res!1010178 (and (= (size!48588 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48588 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48588 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1485505 () Bool)

(declare-fun res!1010174 () Bool)

(assert (=> b!1485505 (=> (not res!1010174) (not e!832778))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1485505 (= res!1010174 (validKeyInArray!0 (select (arr!48038 a!2862) j!93)))))

(declare-fun b!1485506 () Bool)

(declare-fun res!1010177 () Bool)

(assert (=> b!1485506 (=> (not res!1010177) (not e!832782))))

(assert (=> b!1485506 (= res!1010177 e!832781)))

(declare-fun c!137184 () Bool)

(assert (=> b!1485506 (= c!137184 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1485507 () Bool)

(declare-fun res!1010182 () Bool)

(assert (=> b!1485507 (=> (not res!1010182) (not e!832782))))

(assert (=> b!1485507 (= res!1010182 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1485508 () Bool)

(declare-fun res!1010170 () Bool)

(assert (=> b!1485508 (=> (not res!1010170) (not e!832778))))

(assert (=> b!1485508 (= res!1010170 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48588 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48588 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48588 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1485509 () Bool)

(assert (=> b!1485509 (= e!832787 e!832783)))

(declare-fun res!1010183 () Bool)

(assert (=> b!1485509 (=> res!1010183 e!832783)))

(assert (=> b!1485509 (= res!1010183 (or (and (= (select (arr!48038 a!2862) index!646) lt!648113) (= (select (arr!48038 a!2862) index!646) (select (arr!48038 a!2862) j!93))) (= (select (arr!48038 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1485509 (= lt!648113 (select (store (arr!48038 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1485510 () Bool)

(declare-fun res!1010187 () Bool)

(assert (=> b!1485510 (=> (not res!1010187) (not e!832778))))

(assert (=> b!1485510 (= res!1010187 (validKeyInArray!0 (select (arr!48038 a!2862) i!1006)))))

(declare-fun b!1485511 () Bool)

(declare-fun res!1010172 () Bool)

(assert (=> b!1485511 (=> (not res!1010172) (not e!832778))))

(declare-datatypes ((List!34539 0))(
  ( (Nil!34536) (Cons!34535 (h!35909 (_ BitVec 64)) (t!49233 List!34539)) )
))
(declare-fun arrayNoDuplicates!0 (array!99524 (_ BitVec 32) List!34539) Bool)

(assert (=> b!1485511 (= res!1010172 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34536))))

(declare-fun b!1485512 () Bool)

(declare-fun lt!648117 () SeekEntryResult!12278)

(assert (=> b!1485512 (= e!832781 (= lt!648117 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648114 lt!648111 mask!2687)))))

(declare-fun b!1485513 () Bool)

(assert (=> b!1485513 (= e!832784 e!832782)))

(declare-fun res!1010181 () Bool)

(assert (=> b!1485513 (=> (not res!1010181) (not e!832782))))

(assert (=> b!1485513 (= res!1010181 (= lt!648117 (Intermediate!12278 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1485513 (= lt!648117 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648114 mask!2687) lt!648114 lt!648111 mask!2687))))

(assert (=> b!1485513 (= lt!648114 (select (store (arr!48038 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!126562 res!1010179) b!1485504))

(assert (= (and b!1485504 res!1010178) b!1485510))

(assert (= (and b!1485510 res!1010187) b!1485505))

(assert (= (and b!1485505 res!1010174) b!1485496))

(assert (= (and b!1485496 res!1010175) b!1485511))

(assert (= (and b!1485511 res!1010172) b!1485508))

(assert (= (and b!1485508 res!1010170) b!1485497))

(assert (= (and b!1485497 res!1010180) b!1485493))

(assert (= (and b!1485493 res!1010186) b!1485495))

(assert (= (and b!1485495 res!1010176) b!1485513))

(assert (= (and b!1485513 res!1010181) b!1485506))

(assert (= (and b!1485506 c!137184) b!1485512))

(assert (= (and b!1485506 (not c!137184)) b!1485499))

(assert (= (and b!1485506 res!1010177) b!1485507))

(assert (= (and b!1485507 res!1010182) b!1485503))

(assert (= (and b!1485503 res!1010184) b!1485502))

(assert (= (and b!1485502 res!1010171) b!1485494))

(assert (= (and b!1485494 res!1010185) b!1485509))

(assert (= (and b!1485509 (not res!1010183)) b!1485498))

(assert (= (and b!1485498 res!1010188) b!1485500))

(assert (= (and b!1485503 (not res!1010173)) b!1485501))

(declare-fun m!1370617 () Bool)

(assert (=> b!1485513 m!1370617))

(assert (=> b!1485513 m!1370617))

(declare-fun m!1370619 () Bool)

(assert (=> b!1485513 m!1370619))

(declare-fun m!1370621 () Bool)

(assert (=> b!1485513 m!1370621))

(declare-fun m!1370623 () Bool)

(assert (=> b!1485513 m!1370623))

(declare-fun m!1370625 () Bool)

(assert (=> b!1485495 m!1370625))

(assert (=> b!1485495 m!1370625))

(declare-fun m!1370627 () Bool)

(assert (=> b!1485495 m!1370627))

(declare-fun m!1370629 () Bool)

(assert (=> b!1485512 m!1370629))

(assert (=> b!1485497 m!1370621))

(declare-fun m!1370631 () Bool)

(assert (=> b!1485497 m!1370631))

(declare-fun m!1370633 () Bool)

(assert (=> b!1485494 m!1370633))

(assert (=> b!1485494 m!1370625))

(declare-fun m!1370635 () Bool)

(assert (=> start!126562 m!1370635))

(declare-fun m!1370637 () Bool)

(assert (=> start!126562 m!1370637))

(assert (=> b!1485505 m!1370625))

(assert (=> b!1485505 m!1370625))

(declare-fun m!1370639 () Bool)

(assert (=> b!1485505 m!1370639))

(declare-fun m!1370641 () Bool)

(assert (=> b!1485499 m!1370641))

(declare-fun m!1370643 () Bool)

(assert (=> b!1485499 m!1370643))

(declare-fun m!1370645 () Bool)

(assert (=> b!1485509 m!1370645))

(assert (=> b!1485509 m!1370625))

(assert (=> b!1485509 m!1370621))

(declare-fun m!1370647 () Bool)

(assert (=> b!1485509 m!1370647))

(assert (=> b!1485493 m!1370625))

(assert (=> b!1485493 m!1370625))

(declare-fun m!1370649 () Bool)

(assert (=> b!1485493 m!1370649))

(assert (=> b!1485493 m!1370649))

(assert (=> b!1485493 m!1370625))

(declare-fun m!1370651 () Bool)

(assert (=> b!1485493 m!1370651))

(declare-fun m!1370653 () Bool)

(assert (=> b!1485503 m!1370653))

(assert (=> b!1485503 m!1370621))

(assert (=> b!1485503 m!1370647))

(assert (=> b!1485503 m!1370645))

(declare-fun m!1370655 () Bool)

(assert (=> b!1485503 m!1370655))

(assert (=> b!1485503 m!1370625))

(declare-fun m!1370657 () Bool)

(assert (=> b!1485496 m!1370657))

(assert (=> b!1485500 m!1370643))

(assert (=> b!1485500 m!1370641))

(declare-fun m!1370659 () Bool)

(assert (=> b!1485510 m!1370659))

(assert (=> b!1485510 m!1370659))

(declare-fun m!1370661 () Bool)

(assert (=> b!1485510 m!1370661))

(declare-fun m!1370663 () Bool)

(assert (=> b!1485501 m!1370663))

(assert (=> b!1485502 m!1370625))

(assert (=> b!1485502 m!1370625))

(declare-fun m!1370665 () Bool)

(assert (=> b!1485502 m!1370665))

(declare-fun m!1370667 () Bool)

(assert (=> b!1485511 m!1370667))

(push 1)

