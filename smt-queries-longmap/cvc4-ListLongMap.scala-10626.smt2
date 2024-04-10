; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124898 () Bool)

(assert start!124898)

(declare-fun b!1450883 () Bool)

(declare-fun res!982194 () Bool)

(declare-fun e!816972 () Bool)

(assert (=> b!1450883 (=> (not res!982194) (not e!816972))))

(declare-datatypes ((array!98346 0))(
  ( (array!98347 (arr!47461 (Array (_ BitVec 32) (_ BitVec 64))) (size!48011 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98346)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98346 (_ BitVec 32)) Bool)

(assert (=> b!1450883 (= res!982194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1450884 () Bool)

(declare-fun res!982192 () Bool)

(declare-fun e!816970 () Bool)

(assert (=> b!1450884 (=> (not res!982192) (not e!816970))))

(declare-fun e!816966 () Bool)

(assert (=> b!1450884 (= res!982192 e!816966)))

(declare-fun c!133863 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1450884 (= c!133863 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1450885 () Bool)

(declare-fun e!816967 () Bool)

(assert (=> b!1450885 (= e!816967 e!816970)))

(declare-fun res!982182 () Bool)

(assert (=> b!1450885 (=> (not res!982182) (not e!816970))))

(declare-datatypes ((SeekEntryResult!11713 0))(
  ( (MissingZero!11713 (index!49244 (_ BitVec 32))) (Found!11713 (index!49245 (_ BitVec 32))) (Intermediate!11713 (undefined!12525 Bool) (index!49246 (_ BitVec 32)) (x!130898 (_ BitVec 32))) (Undefined!11713) (MissingVacant!11713 (index!49247 (_ BitVec 32))) )
))
(declare-fun lt!636472 () SeekEntryResult!11713)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1450885 (= res!982182 (= lt!636472 (Intermediate!11713 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!636473 () array!98346)

(declare-fun lt!636477 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98346 (_ BitVec 32)) SeekEntryResult!11713)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1450885 (= lt!636472 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636477 mask!2687) lt!636477 lt!636473 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1450885 (= lt!636477 (select (store (arr!47461 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1450886 () Bool)

(declare-fun e!816969 () Bool)

(assert (=> b!1450886 (= e!816969 e!816967)))

(declare-fun res!982187 () Bool)

(assert (=> b!1450886 (=> (not res!982187) (not e!816967))))

(declare-fun lt!636475 () SeekEntryResult!11713)

(assert (=> b!1450886 (= res!982187 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47461 a!2862) j!93) mask!2687) (select (arr!47461 a!2862) j!93) a!2862 mask!2687) lt!636475))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1450886 (= lt!636475 (Intermediate!11713 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1450887 () Bool)

(declare-fun res!982190 () Bool)

(assert (=> b!1450887 (=> (not res!982190) (not e!816970))))

(assert (=> b!1450887 (= res!982190 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!982193 () Bool)

(assert (=> start!124898 (=> (not res!982193) (not e!816972))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124898 (= res!982193 (validMask!0 mask!2687))))

(assert (=> start!124898 e!816972))

(assert (=> start!124898 true))

(declare-fun array_inv!36489 (array!98346) Bool)

(assert (=> start!124898 (array_inv!36489 a!2862)))

(declare-fun b!1450888 () Bool)

(declare-fun e!816965 () Bool)

(declare-fun e!816971 () Bool)

(assert (=> b!1450888 (= e!816965 e!816971)))

(declare-fun res!982189 () Bool)

(assert (=> b!1450888 (=> (not res!982189) (not e!816971))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!636476 () SeekEntryResult!11713)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98346 (_ BitVec 32)) SeekEntryResult!11713)

(assert (=> b!1450888 (= res!982189 (= lt!636476 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47461 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1450889 () Bool)

(declare-fun e!816973 () Bool)

(assert (=> b!1450889 (= e!816973 e!816965)))

(declare-fun res!982184 () Bool)

(assert (=> b!1450889 (=> res!982184 e!816965)))

(assert (=> b!1450889 (= res!982184 (or (and (= (select (arr!47461 a!2862) index!646) (select (store (arr!47461 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47461 a!2862) index!646) (select (arr!47461 a!2862) j!93))) (not (= (select (arr!47461 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1450890 () Bool)

(declare-fun res!982195 () Bool)

(assert (=> b!1450890 (=> (not res!982195) (not e!816967))))

(assert (=> b!1450890 (= res!982195 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47461 a!2862) j!93) a!2862 mask!2687) lt!636475))))

(declare-fun b!1450891 () Bool)

(declare-fun e!816968 () Bool)

(assert (=> b!1450891 (= e!816970 (not e!816968))))

(declare-fun res!982180 () Bool)

(assert (=> b!1450891 (=> res!982180 e!816968)))

(assert (=> b!1450891 (= res!982180 (or (and (= (select (arr!47461 a!2862) index!646) (select (store (arr!47461 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47461 a!2862) index!646) (select (arr!47461 a!2862) j!93))) (not (= (select (arr!47461 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47461 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1450891 e!816973))

(declare-fun res!982179 () Bool)

(assert (=> b!1450891 (=> (not res!982179) (not e!816973))))

(declare-fun lt!636474 () SeekEntryResult!11713)

(assert (=> b!1450891 (= res!982179 (and (= lt!636476 lt!636474) (or (= (select (arr!47461 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47461 a!2862) intermediateBeforeIndex!19) (select (arr!47461 a!2862) j!93)))))))

(assert (=> b!1450891 (= lt!636474 (Found!11713 j!93))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98346 (_ BitVec 32)) SeekEntryResult!11713)

(assert (=> b!1450891 (= lt!636476 (seekEntryOrOpen!0 (select (arr!47461 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1450891 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48922 0))(
  ( (Unit!48923) )
))
(declare-fun lt!636470 () Unit!48922)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98346 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48922)

(assert (=> b!1450891 (= lt!636470 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1450892 () Bool)

(assert (=> b!1450892 (= e!816972 e!816969)))

(declare-fun res!982186 () Bool)

(assert (=> b!1450892 (=> (not res!982186) (not e!816969))))

(assert (=> b!1450892 (= res!982186 (= (select (store (arr!47461 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1450892 (= lt!636473 (array!98347 (store (arr!47461 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48011 a!2862)))))

(declare-fun b!1450893 () Bool)

(declare-fun res!982183 () Bool)

(assert (=> b!1450893 (=> (not res!982183) (not e!816972))))

(assert (=> b!1450893 (= res!982183 (and (= (size!48011 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48011 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48011 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1450894 () Bool)

(assert (=> b!1450894 (= e!816966 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636477 lt!636473 mask!2687) (seekEntryOrOpen!0 lt!636477 lt!636473 mask!2687)))))

(declare-fun b!1450895 () Bool)

(assert (=> b!1450895 (= e!816971 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1450896 () Bool)

(declare-fun res!982188 () Bool)

(assert (=> b!1450896 (=> (not res!982188) (not e!816972))))

(assert (=> b!1450896 (= res!982188 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48011 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48011 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48011 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1450897 () Bool)

(declare-fun res!982191 () Bool)

(assert (=> b!1450897 (=> (not res!982191) (not e!816972))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1450897 (= res!982191 (validKeyInArray!0 (select (arr!47461 a!2862) j!93)))))

(declare-fun b!1450898 () Bool)

(declare-fun res!982178 () Bool)

(assert (=> b!1450898 (=> (not res!982178) (not e!816972))))

(declare-datatypes ((List!33962 0))(
  ( (Nil!33959) (Cons!33958 (h!35308 (_ BitVec 64)) (t!48656 List!33962)) )
))
(declare-fun arrayNoDuplicates!0 (array!98346 (_ BitVec 32) List!33962) Bool)

(assert (=> b!1450898 (= res!982178 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33959))))

(declare-fun b!1450899 () Bool)

(declare-fun res!982181 () Bool)

(assert (=> b!1450899 (=> (not res!982181) (not e!816972))))

(assert (=> b!1450899 (= res!982181 (validKeyInArray!0 (select (arr!47461 a!2862) i!1006)))))

(declare-fun b!1450900 () Bool)

(declare-fun res!982185 () Bool)

(assert (=> b!1450900 (=> res!982185 e!816968)))

(assert (=> b!1450900 (= res!982185 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47461 a!2862) j!93) a!2862 mask!2687) lt!636474)))))

(declare-fun b!1450901 () Bool)

(assert (=> b!1450901 (= e!816966 (= lt!636472 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636477 lt!636473 mask!2687)))))

(declare-fun b!1450902 () Bool)

(assert (=> b!1450902 (= e!816968 true)))

(assert (=> b!1450902 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636477 lt!636473 mask!2687) lt!636474)))

(declare-fun lt!636471 () Unit!48922)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98346 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48922)

(assert (=> b!1450902 (= lt!636471 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(assert (= (and start!124898 res!982193) b!1450893))

(assert (= (and b!1450893 res!982183) b!1450899))

(assert (= (and b!1450899 res!982181) b!1450897))

(assert (= (and b!1450897 res!982191) b!1450883))

(assert (= (and b!1450883 res!982194) b!1450898))

(assert (= (and b!1450898 res!982178) b!1450896))

(assert (= (and b!1450896 res!982188) b!1450892))

(assert (= (and b!1450892 res!982186) b!1450886))

(assert (= (and b!1450886 res!982187) b!1450890))

(assert (= (and b!1450890 res!982195) b!1450885))

(assert (= (and b!1450885 res!982182) b!1450884))

(assert (= (and b!1450884 c!133863) b!1450901))

(assert (= (and b!1450884 (not c!133863)) b!1450894))

(assert (= (and b!1450884 res!982192) b!1450887))

(assert (= (and b!1450887 res!982190) b!1450891))

(assert (= (and b!1450891 res!982179) b!1450889))

(assert (= (and b!1450889 (not res!982184)) b!1450888))

(assert (= (and b!1450888 res!982189) b!1450895))

(assert (= (and b!1450891 (not res!982180)) b!1450900))

(assert (= (and b!1450900 (not res!982185)) b!1450902))

(declare-fun m!1339499 () Bool)

(assert (=> start!124898 m!1339499))

(declare-fun m!1339501 () Bool)

(assert (=> start!124898 m!1339501))

(declare-fun m!1339503 () Bool)

(assert (=> b!1450891 m!1339503))

(declare-fun m!1339505 () Bool)

(assert (=> b!1450891 m!1339505))

(declare-fun m!1339507 () Bool)

(assert (=> b!1450891 m!1339507))

(declare-fun m!1339509 () Bool)

(assert (=> b!1450891 m!1339509))

(declare-fun m!1339511 () Bool)

(assert (=> b!1450891 m!1339511))

(declare-fun m!1339513 () Bool)

(assert (=> b!1450891 m!1339513))

(declare-fun m!1339515 () Bool)

(assert (=> b!1450891 m!1339515))

(declare-fun m!1339517 () Bool)

(assert (=> b!1450891 m!1339517))

(assert (=> b!1450891 m!1339513))

(declare-fun m!1339519 () Bool)

(assert (=> b!1450898 m!1339519))

(declare-fun m!1339521 () Bool)

(assert (=> b!1450894 m!1339521))

(declare-fun m!1339523 () Bool)

(assert (=> b!1450894 m!1339523))

(assert (=> b!1450900 m!1339513))

(assert (=> b!1450900 m!1339513))

(declare-fun m!1339525 () Bool)

(assert (=> b!1450900 m!1339525))

(assert (=> b!1450897 m!1339513))

(assert (=> b!1450897 m!1339513))

(declare-fun m!1339527 () Bool)

(assert (=> b!1450897 m!1339527))

(declare-fun m!1339529 () Bool)

(assert (=> b!1450901 m!1339529))

(assert (=> b!1450886 m!1339513))

(assert (=> b!1450886 m!1339513))

(declare-fun m!1339531 () Bool)

(assert (=> b!1450886 m!1339531))

(assert (=> b!1450886 m!1339531))

(assert (=> b!1450886 m!1339513))

(declare-fun m!1339533 () Bool)

(assert (=> b!1450886 m!1339533))

(assert (=> b!1450888 m!1339513))

(assert (=> b!1450888 m!1339513))

(declare-fun m!1339535 () Bool)

(assert (=> b!1450888 m!1339535))

(declare-fun m!1339537 () Bool)

(assert (=> b!1450883 m!1339537))

(declare-fun m!1339539 () Bool)

(assert (=> b!1450885 m!1339539))

(assert (=> b!1450885 m!1339539))

(declare-fun m!1339541 () Bool)

(assert (=> b!1450885 m!1339541))

(assert (=> b!1450885 m!1339505))

(declare-fun m!1339543 () Bool)

(assert (=> b!1450885 m!1339543))

(assert (=> b!1450892 m!1339505))

(declare-fun m!1339545 () Bool)

(assert (=> b!1450892 m!1339545))

(assert (=> b!1450902 m!1339521))

(declare-fun m!1339547 () Bool)

(assert (=> b!1450902 m!1339547))

(assert (=> b!1450890 m!1339513))

(assert (=> b!1450890 m!1339513))

(declare-fun m!1339549 () Bool)

(assert (=> b!1450890 m!1339549))

(declare-fun m!1339551 () Bool)

(assert (=> b!1450899 m!1339551))

(assert (=> b!1450899 m!1339551))

(declare-fun m!1339553 () Bool)

(assert (=> b!1450899 m!1339553))

(assert (=> b!1450889 m!1339511))

(assert (=> b!1450889 m!1339505))

(assert (=> b!1450889 m!1339509))

(assert (=> b!1450889 m!1339513))

(push 1)

