; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124868 () Bool)

(assert start!124868)

(declare-fun b!1449983 () Bool)

(declare-fun e!816521 () Bool)

(declare-fun e!816517 () Bool)

(assert (=> b!1449983 (= e!816521 e!816517)))

(declare-fun res!981383 () Bool)

(assert (=> b!1449983 (=> (not res!981383) (not e!816517))))

(declare-datatypes ((SeekEntryResult!11698 0))(
  ( (MissingZero!11698 (index!49184 (_ BitVec 32))) (Found!11698 (index!49185 (_ BitVec 32))) (Intermediate!11698 (undefined!12510 Bool) (index!49186 (_ BitVec 32)) (x!130843 (_ BitVec 32))) (Undefined!11698) (MissingVacant!11698 (index!49187 (_ BitVec 32))) )
))
(declare-fun lt!636117 () SeekEntryResult!11698)

(declare-datatypes ((array!98316 0))(
  ( (array!98317 (arr!47446 (Array (_ BitVec 32) (_ BitVec 64))) (size!47996 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98316)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98316 (_ BitVec 32)) SeekEntryResult!11698)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1449983 (= res!981383 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47446 a!2862) j!93) mask!2687) (select (arr!47446 a!2862) j!93) a!2862 mask!2687) lt!636117))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1449983 (= lt!636117 (Intermediate!11698 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1449984 () Bool)

(declare-fun res!981369 () Bool)

(declare-fun e!816523 () Bool)

(assert (=> b!1449984 (=> (not res!981369) (not e!816523))))

(declare-fun e!816524 () Bool)

(assert (=> b!1449984 (= res!981369 e!816524)))

(declare-fun c!133818 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1449984 (= c!133818 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1449985 () Bool)

(declare-fun res!981368 () Bool)

(assert (=> b!1449985 (=> (not res!981368) (not e!816517))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1449985 (= res!981368 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47446 a!2862) j!93) a!2862 mask!2687) lt!636117))))

(declare-fun b!1449986 () Bool)

(declare-fun res!981377 () Bool)

(declare-fun e!816522 () Bool)

(assert (=> b!1449986 (=> (not res!981377) (not e!816522))))

(declare-datatypes ((List!33947 0))(
  ( (Nil!33944) (Cons!33943 (h!35293 (_ BitVec 64)) (t!48641 List!33947)) )
))
(declare-fun arrayNoDuplicates!0 (array!98316 (_ BitVec 32) List!33947) Bool)

(assert (=> b!1449986 (= res!981377 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33944))))

(declare-fun b!1449987 () Bool)

(assert (=> b!1449987 (= e!816522 e!816521)))

(declare-fun res!981381 () Bool)

(assert (=> b!1449987 (=> (not res!981381) (not e!816521))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1449987 (= res!981381 (= (select (store (arr!47446 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!636111 () array!98316)

(assert (=> b!1449987 (= lt!636111 (array!98317 (store (arr!47446 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47996 a!2862)))))

(declare-fun lt!636116 () (_ BitVec 64))

(declare-fun b!1449989 () Bool)

(declare-fun lt!636113 () SeekEntryResult!11698)

(assert (=> b!1449989 (= e!816524 (= lt!636113 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636116 lt!636111 mask!2687)))))

(declare-fun b!1449990 () Bool)

(assert (=> b!1449990 (= e!816517 e!816523)))

(declare-fun res!981378 () Bool)

(assert (=> b!1449990 (=> (not res!981378) (not e!816523))))

(assert (=> b!1449990 (= res!981378 (= lt!636113 (Intermediate!11698 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1449990 (= lt!636113 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636116 mask!2687) lt!636116 lt!636111 mask!2687))))

(assert (=> b!1449990 (= lt!636116 (select (store (arr!47446 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1449991 () Bool)

(declare-fun res!981375 () Bool)

(assert (=> b!1449991 (=> (not res!981375) (not e!816523))))

(assert (=> b!1449991 (= res!981375 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1449992 () Bool)

(declare-fun res!981370 () Bool)

(assert (=> b!1449992 (=> (not res!981370) (not e!816522))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98316 (_ BitVec 32)) Bool)

(assert (=> b!1449992 (= res!981370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun e!816518 () Bool)

(declare-fun b!1449993 () Bool)

(assert (=> b!1449993 (= e!816518 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1449994 () Bool)

(declare-fun e!816516 () Bool)

(assert (=> b!1449994 (= e!816523 (not e!816516))))

(declare-fun res!981379 () Bool)

(assert (=> b!1449994 (=> res!981379 e!816516)))

(assert (=> b!1449994 (= res!981379 (or (and (= (select (arr!47446 a!2862) index!646) (select (store (arr!47446 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47446 a!2862) index!646) (select (arr!47446 a!2862) j!93))) (not (= (select (arr!47446 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47446 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!816519 () Bool)

(assert (=> b!1449994 e!816519))

(declare-fun res!981384 () Bool)

(assert (=> b!1449994 (=> (not res!981384) (not e!816519))))

(declare-fun lt!636115 () SeekEntryResult!11698)

(declare-fun lt!636112 () SeekEntryResult!11698)

(assert (=> b!1449994 (= res!981384 (and (= lt!636115 lt!636112) (or (= (select (arr!47446 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47446 a!2862) intermediateBeforeIndex!19) (select (arr!47446 a!2862) j!93)))))))

(assert (=> b!1449994 (= lt!636112 (Found!11698 j!93))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98316 (_ BitVec 32)) SeekEntryResult!11698)

(assert (=> b!1449994 (= lt!636115 (seekEntryOrOpen!0 (select (arr!47446 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1449994 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48892 0))(
  ( (Unit!48893) )
))
(declare-fun lt!636114 () Unit!48892)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98316 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48892)

(assert (=> b!1449994 (= lt!636114 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1449995 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98316 (_ BitVec 32)) SeekEntryResult!11698)

(assert (=> b!1449995 (= e!816524 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636116 lt!636111 mask!2687) (seekEntryOrOpen!0 lt!636116 lt!636111 mask!2687)))))

(declare-fun b!1449996 () Bool)

(declare-fun e!816520 () Bool)

(assert (=> b!1449996 (= e!816519 e!816520)))

(declare-fun res!981380 () Bool)

(assert (=> b!1449996 (=> res!981380 e!816520)))

(assert (=> b!1449996 (= res!981380 (or (and (= (select (arr!47446 a!2862) index!646) (select (store (arr!47446 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47446 a!2862) index!646) (select (arr!47446 a!2862) j!93))) (not (= (select (arr!47446 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1449997 () Bool)

(declare-fun res!981382 () Bool)

(assert (=> b!1449997 (=> (not res!981382) (not e!816522))))

(assert (=> b!1449997 (= res!981382 (and (= (size!47996 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47996 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47996 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1449998 () Bool)

(assert (=> b!1449998 (= e!816516 (bvsge mask!2687 #b00000000000000000000000000000000))))

(assert (=> b!1449998 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636116 lt!636111 mask!2687) lt!636112)))

(declare-fun lt!636110 () Unit!48892)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98316 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48892)

(assert (=> b!1449998 (= lt!636110 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1449999 () Bool)

(declare-fun res!981385 () Bool)

(assert (=> b!1449999 (=> (not res!981385) (not e!816522))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1449999 (= res!981385 (validKeyInArray!0 (select (arr!47446 a!2862) i!1006)))))

(declare-fun b!1450000 () Bool)

(declare-fun res!981372 () Bool)

(assert (=> b!1450000 (=> (not res!981372) (not e!816522))))

(assert (=> b!1450000 (= res!981372 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47996 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47996 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47996 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1450001 () Bool)

(declare-fun res!981371 () Bool)

(assert (=> b!1450001 (=> (not res!981371) (not e!816522))))

(assert (=> b!1450001 (= res!981371 (validKeyInArray!0 (select (arr!47446 a!2862) j!93)))))

(declare-fun b!1450002 () Bool)

(assert (=> b!1450002 (= e!816520 e!816518)))

(declare-fun res!981374 () Bool)

(assert (=> b!1450002 (=> (not res!981374) (not e!816518))))

(assert (=> b!1450002 (= res!981374 (= lt!636115 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47446 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun res!981373 () Bool)

(assert (=> start!124868 (=> (not res!981373) (not e!816522))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124868 (= res!981373 (validMask!0 mask!2687))))

(assert (=> start!124868 e!816522))

(assert (=> start!124868 true))

(declare-fun array_inv!36474 (array!98316) Bool)

(assert (=> start!124868 (array_inv!36474 a!2862)))

(declare-fun b!1449988 () Bool)

(declare-fun res!981376 () Bool)

(assert (=> b!1449988 (=> res!981376 e!816516)))

(assert (=> b!1449988 (= res!981376 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47446 a!2862) j!93) a!2862 mask!2687) lt!636112)))))

(assert (= (and start!124868 res!981373) b!1449997))

(assert (= (and b!1449997 res!981382) b!1449999))

(assert (= (and b!1449999 res!981385) b!1450001))

(assert (= (and b!1450001 res!981371) b!1449992))

(assert (= (and b!1449992 res!981370) b!1449986))

(assert (= (and b!1449986 res!981377) b!1450000))

(assert (= (and b!1450000 res!981372) b!1449987))

(assert (= (and b!1449987 res!981381) b!1449983))

(assert (= (and b!1449983 res!981383) b!1449985))

(assert (= (and b!1449985 res!981368) b!1449990))

(assert (= (and b!1449990 res!981378) b!1449984))

(assert (= (and b!1449984 c!133818) b!1449989))

(assert (= (and b!1449984 (not c!133818)) b!1449995))

(assert (= (and b!1449984 res!981369) b!1449991))

(assert (= (and b!1449991 res!981375) b!1449994))

(assert (= (and b!1449994 res!981384) b!1449996))

(assert (= (and b!1449996 (not res!981380)) b!1450002))

(assert (= (and b!1450002 res!981374) b!1449993))

(assert (= (and b!1449994 (not res!981379)) b!1449988))

(assert (= (and b!1449988 (not res!981376)) b!1449998))

(declare-fun m!1338659 () Bool)

(assert (=> b!1449996 m!1338659))

(declare-fun m!1338661 () Bool)

(assert (=> b!1449996 m!1338661))

(declare-fun m!1338663 () Bool)

(assert (=> b!1449996 m!1338663))

(declare-fun m!1338665 () Bool)

(assert (=> b!1449996 m!1338665))

(declare-fun m!1338667 () Bool)

(assert (=> b!1449995 m!1338667))

(declare-fun m!1338669 () Bool)

(assert (=> b!1449995 m!1338669))

(declare-fun m!1338671 () Bool)

(assert (=> b!1449994 m!1338671))

(assert (=> b!1449994 m!1338661))

(declare-fun m!1338673 () Bool)

(assert (=> b!1449994 m!1338673))

(assert (=> b!1449994 m!1338663))

(assert (=> b!1449994 m!1338659))

(assert (=> b!1449994 m!1338665))

(declare-fun m!1338675 () Bool)

(assert (=> b!1449994 m!1338675))

(declare-fun m!1338677 () Bool)

(assert (=> b!1449994 m!1338677))

(assert (=> b!1449994 m!1338665))

(declare-fun m!1338679 () Bool)

(assert (=> b!1449989 m!1338679))

(assert (=> b!1450002 m!1338665))

(assert (=> b!1450002 m!1338665))

(declare-fun m!1338681 () Bool)

(assert (=> b!1450002 m!1338681))

(declare-fun m!1338683 () Bool)

(assert (=> start!124868 m!1338683))

(declare-fun m!1338685 () Bool)

(assert (=> start!124868 m!1338685))

(declare-fun m!1338687 () Bool)

(assert (=> b!1449990 m!1338687))

(assert (=> b!1449990 m!1338687))

(declare-fun m!1338689 () Bool)

(assert (=> b!1449990 m!1338689))

(assert (=> b!1449990 m!1338661))

(declare-fun m!1338691 () Bool)

(assert (=> b!1449990 m!1338691))

(assert (=> b!1450001 m!1338665))

(assert (=> b!1450001 m!1338665))

(declare-fun m!1338693 () Bool)

(assert (=> b!1450001 m!1338693))

(assert (=> b!1449998 m!1338667))

(declare-fun m!1338695 () Bool)

(assert (=> b!1449998 m!1338695))

(assert (=> b!1449988 m!1338665))

(assert (=> b!1449988 m!1338665))

(declare-fun m!1338697 () Bool)

(assert (=> b!1449988 m!1338697))

(assert (=> b!1449987 m!1338661))

(declare-fun m!1338699 () Bool)

(assert (=> b!1449987 m!1338699))

(declare-fun m!1338701 () Bool)

(assert (=> b!1449986 m!1338701))

(assert (=> b!1449985 m!1338665))

(assert (=> b!1449985 m!1338665))

(declare-fun m!1338703 () Bool)

(assert (=> b!1449985 m!1338703))

(assert (=> b!1449983 m!1338665))

(assert (=> b!1449983 m!1338665))

(declare-fun m!1338705 () Bool)

(assert (=> b!1449983 m!1338705))

(assert (=> b!1449983 m!1338705))

(assert (=> b!1449983 m!1338665))

(declare-fun m!1338707 () Bool)

(assert (=> b!1449983 m!1338707))

(declare-fun m!1338709 () Bool)

(assert (=> b!1449999 m!1338709))

(assert (=> b!1449999 m!1338709))

(declare-fun m!1338711 () Bool)

(assert (=> b!1449999 m!1338711))

(declare-fun m!1338713 () Bool)

(assert (=> b!1449992 m!1338713))

(push 1)

