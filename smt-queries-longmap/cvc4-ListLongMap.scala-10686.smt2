; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125258 () Bool)

(assert start!125258)

(declare-fun b!1461987 () Bool)

(declare-fun e!821866 () Bool)

(declare-fun e!821868 () Bool)

(assert (=> b!1461987 (= e!821866 e!821868)))

(declare-fun res!991512 () Bool)

(assert (=> b!1461987 (=> (not res!991512) (not e!821868))))

(declare-datatypes ((SeekEntryResult!11893 0))(
  ( (MissingZero!11893 (index!49964 (_ BitVec 32))) (Found!11893 (index!49965 (_ BitVec 32))) (Intermediate!11893 (undefined!12705 Bool) (index!49966 (_ BitVec 32)) (x!131558 (_ BitVec 32))) (Undefined!11893) (MissingVacant!11893 (index!49967 (_ BitVec 32))) )
))
(declare-fun lt!640310 () SeekEntryResult!11893)

(declare-datatypes ((array!98706 0))(
  ( (array!98707 (arr!47641 (Array (_ BitVec 32) (_ BitVec 64))) (size!48191 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98706)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98706 (_ BitVec 32)) SeekEntryResult!11893)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461987 (= res!991512 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47641 a!2862) j!93) mask!2687) (select (arr!47641 a!2862) j!93) a!2862 mask!2687) lt!640310))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1461987 (= lt!640310 (Intermediate!11893 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1461988 () Bool)

(declare-fun res!991506 () Bool)

(declare-fun e!821861 () Bool)

(assert (=> b!1461988 (=> (not res!991506) (not e!821861))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98706 (_ BitVec 32)) Bool)

(assert (=> b!1461988 (= res!991506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1461989 () Bool)

(declare-fun res!991509 () Bool)

(declare-fun e!821870 () Bool)

(assert (=> b!1461989 (=> res!991509 e!821870)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!640309 () (_ BitVec 32))

(assert (=> b!1461989 (= res!991509 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640309 (select (arr!47641 a!2862) j!93) a!2862 mask!2687) lt!640310)))))

(declare-fun b!1461990 () Bool)

(declare-fun e!821862 () Bool)

(declare-fun e!821865 () Bool)

(assert (=> b!1461990 (= e!821862 (not e!821865))))

(declare-fun res!991514 () Bool)

(assert (=> b!1461990 (=> res!991514 e!821865)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1461990 (= res!991514 (or (and (= (select (arr!47641 a!2862) index!646) (select (store (arr!47641 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47641 a!2862) index!646) (select (arr!47641 a!2862) j!93))) (= (select (arr!47641 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!821867 () Bool)

(assert (=> b!1461990 e!821867))

(declare-fun res!991505 () Bool)

(assert (=> b!1461990 (=> (not res!991505) (not e!821867))))

(assert (=> b!1461990 (= res!991505 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49282 0))(
  ( (Unit!49283) )
))
(declare-fun lt!640306 () Unit!49282)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98706 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49282)

(assert (=> b!1461990 (= lt!640306 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1461991 () Bool)

(declare-fun res!991515 () Bool)

(assert (=> b!1461991 (=> (not res!991515) (not e!821862))))

(declare-fun e!821864 () Bool)

(assert (=> b!1461991 (= res!991515 e!821864)))

(declare-fun c!134753 () Bool)

(assert (=> b!1461991 (= c!134753 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1461992 () Bool)

(declare-fun res!991513 () Bool)

(assert (=> b!1461992 (=> (not res!991513) (not e!821861))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1461992 (= res!991513 (validKeyInArray!0 (select (arr!47641 a!2862) j!93)))))

(declare-fun b!1461993 () Bool)

(declare-fun res!991507 () Bool)

(assert (=> b!1461993 (=> (not res!991507) (not e!821861))))

(assert (=> b!1461993 (= res!991507 (and (= (size!48191 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48191 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48191 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1461994 () Bool)

(assert (=> b!1461994 (= e!821865 e!821870)))

(declare-fun res!991511 () Bool)

(assert (=> b!1461994 (=> res!991511 e!821870)))

(assert (=> b!1461994 (= res!991511 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640309 #b00000000000000000000000000000000) (bvsge lt!640309 (size!48191 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461994 (= lt!640309 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1461995 () Bool)

(assert (=> b!1461995 (= e!821868 e!821862)))

(declare-fun res!991518 () Bool)

(assert (=> b!1461995 (=> (not res!991518) (not e!821862))))

(declare-fun lt!640308 () SeekEntryResult!11893)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1461995 (= res!991518 (= lt!640308 (Intermediate!11893 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!640311 () array!98706)

(declare-fun lt!640307 () (_ BitVec 64))

(assert (=> b!1461995 (= lt!640308 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640307 mask!2687) lt!640307 lt!640311 mask!2687))))

(assert (=> b!1461995 (= lt!640307 (select (store (arr!47641 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1461996 () Bool)

(assert (=> b!1461996 (= e!821870 true)))

(declare-fun lt!640305 () Bool)

(declare-fun e!821869 () Bool)

(assert (=> b!1461996 (= lt!640305 e!821869)))

(declare-fun c!134754 () Bool)

(assert (=> b!1461996 (= c!134754 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1461997 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98706 (_ BitVec 32)) SeekEntryResult!11893)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98706 (_ BitVec 32)) SeekEntryResult!11893)

(assert (=> b!1461997 (= e!821869 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640309 intermediateAfterIndex!19 lt!640307 lt!640311 mask!2687) (seekEntryOrOpen!0 lt!640307 lt!640311 mask!2687))))))

(declare-fun b!1461998 () Bool)

(declare-fun res!991510 () Bool)

(assert (=> b!1461998 (=> (not res!991510) (not e!821867))))

(assert (=> b!1461998 (= res!991510 (= (seekEntryOrOpen!0 (select (arr!47641 a!2862) j!93) a!2862 mask!2687) (Found!11893 j!93)))))

(declare-fun b!1461999 () Bool)

(declare-fun res!991502 () Bool)

(assert (=> b!1461999 (=> (not res!991502) (not e!821861))))

(assert (=> b!1461999 (= res!991502 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48191 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48191 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48191 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1462000 () Bool)

(assert (=> b!1462000 (= e!821869 (not (= lt!640308 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640309 lt!640307 lt!640311 mask!2687))))))

(declare-fun res!991517 () Bool)

(assert (=> start!125258 (=> (not res!991517) (not e!821861))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125258 (= res!991517 (validMask!0 mask!2687))))

(assert (=> start!125258 e!821861))

(assert (=> start!125258 true))

(declare-fun array_inv!36669 (array!98706) Bool)

(assert (=> start!125258 (array_inv!36669 a!2862)))

(declare-fun b!1462001 () Bool)

(declare-fun res!991519 () Bool)

(assert (=> b!1462001 (=> (not res!991519) (not e!821868))))

(assert (=> b!1462001 (= res!991519 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47641 a!2862) j!93) a!2862 mask!2687) lt!640310))))

(declare-fun b!1462002 () Bool)

(declare-fun res!991504 () Bool)

(assert (=> b!1462002 (=> (not res!991504) (not e!821862))))

(assert (=> b!1462002 (= res!991504 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1462003 () Bool)

(assert (=> b!1462003 (= e!821864 (= lt!640308 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640307 lt!640311 mask!2687)))))

(declare-fun b!1462004 () Bool)

(assert (=> b!1462004 (= e!821861 e!821866)))

(declare-fun res!991516 () Bool)

(assert (=> b!1462004 (=> (not res!991516) (not e!821866))))

(assert (=> b!1462004 (= res!991516 (= (select (store (arr!47641 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1462004 (= lt!640311 (array!98707 (store (arr!47641 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48191 a!2862)))))

(declare-fun b!1462005 () Bool)

(assert (=> b!1462005 (= e!821867 (or (= (select (arr!47641 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47641 a!2862) intermediateBeforeIndex!19) (select (arr!47641 a!2862) j!93))))))

(declare-fun b!1462006 () Bool)

(declare-fun res!991508 () Bool)

(assert (=> b!1462006 (=> (not res!991508) (not e!821861))))

(declare-datatypes ((List!34142 0))(
  ( (Nil!34139) (Cons!34138 (h!35488 (_ BitVec 64)) (t!48836 List!34142)) )
))
(declare-fun arrayNoDuplicates!0 (array!98706 (_ BitVec 32) List!34142) Bool)

(assert (=> b!1462006 (= res!991508 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34139))))

(declare-fun b!1462007 () Bool)

(assert (=> b!1462007 (= e!821864 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640307 lt!640311 mask!2687) (seekEntryOrOpen!0 lt!640307 lt!640311 mask!2687)))))

(declare-fun b!1462008 () Bool)

(declare-fun res!991503 () Bool)

(assert (=> b!1462008 (=> (not res!991503) (not e!821861))))

(assert (=> b!1462008 (= res!991503 (validKeyInArray!0 (select (arr!47641 a!2862) i!1006)))))

(assert (= (and start!125258 res!991517) b!1461993))

(assert (= (and b!1461993 res!991507) b!1462008))

(assert (= (and b!1462008 res!991503) b!1461992))

(assert (= (and b!1461992 res!991513) b!1461988))

(assert (= (and b!1461988 res!991506) b!1462006))

(assert (= (and b!1462006 res!991508) b!1461999))

(assert (= (and b!1461999 res!991502) b!1462004))

(assert (= (and b!1462004 res!991516) b!1461987))

(assert (= (and b!1461987 res!991512) b!1462001))

(assert (= (and b!1462001 res!991519) b!1461995))

(assert (= (and b!1461995 res!991518) b!1461991))

(assert (= (and b!1461991 c!134753) b!1462003))

(assert (= (and b!1461991 (not c!134753)) b!1462007))

(assert (= (and b!1461991 res!991515) b!1462002))

(assert (= (and b!1462002 res!991504) b!1461990))

(assert (= (and b!1461990 res!991505) b!1461998))

(assert (= (and b!1461998 res!991510) b!1462005))

(assert (= (and b!1461990 (not res!991514)) b!1461994))

(assert (= (and b!1461994 (not res!991511)) b!1461989))

(assert (= (and b!1461989 (not res!991509)) b!1461996))

(assert (= (and b!1461996 c!134754) b!1462000))

(assert (= (and b!1461996 (not c!134754)) b!1461997))

(declare-fun m!1349499 () Bool)

(assert (=> b!1462001 m!1349499))

(assert (=> b!1462001 m!1349499))

(declare-fun m!1349501 () Bool)

(assert (=> b!1462001 m!1349501))

(assert (=> b!1461998 m!1349499))

(assert (=> b!1461998 m!1349499))

(declare-fun m!1349503 () Bool)

(assert (=> b!1461998 m!1349503))

(assert (=> b!1461987 m!1349499))

(assert (=> b!1461987 m!1349499))

(declare-fun m!1349505 () Bool)

(assert (=> b!1461987 m!1349505))

(assert (=> b!1461987 m!1349505))

(assert (=> b!1461987 m!1349499))

(declare-fun m!1349507 () Bool)

(assert (=> b!1461987 m!1349507))

(declare-fun m!1349509 () Bool)

(assert (=> b!1461997 m!1349509))

(declare-fun m!1349511 () Bool)

(assert (=> b!1461997 m!1349511))

(declare-fun m!1349513 () Bool)

(assert (=> b!1462000 m!1349513))

(declare-fun m!1349515 () Bool)

(assert (=> start!125258 m!1349515))

(declare-fun m!1349517 () Bool)

(assert (=> start!125258 m!1349517))

(assert (=> b!1461992 m!1349499))

(assert (=> b!1461992 m!1349499))

(declare-fun m!1349519 () Bool)

(assert (=> b!1461992 m!1349519))

(declare-fun m!1349521 () Bool)

(assert (=> b!1462003 m!1349521))

(declare-fun m!1349523 () Bool)

(assert (=> b!1462005 m!1349523))

(assert (=> b!1462005 m!1349499))

(declare-fun m!1349525 () Bool)

(assert (=> b!1461995 m!1349525))

(assert (=> b!1461995 m!1349525))

(declare-fun m!1349527 () Bool)

(assert (=> b!1461995 m!1349527))

(declare-fun m!1349529 () Bool)

(assert (=> b!1461995 m!1349529))

(declare-fun m!1349531 () Bool)

(assert (=> b!1461995 m!1349531))

(assert (=> b!1461989 m!1349499))

(assert (=> b!1461989 m!1349499))

(declare-fun m!1349533 () Bool)

(assert (=> b!1461989 m!1349533))

(assert (=> b!1462004 m!1349529))

(declare-fun m!1349535 () Bool)

(assert (=> b!1462004 m!1349535))

(declare-fun m!1349537 () Bool)

(assert (=> b!1462006 m!1349537))

(declare-fun m!1349539 () Bool)

(assert (=> b!1461994 m!1349539))

(declare-fun m!1349541 () Bool)

(assert (=> b!1462007 m!1349541))

(assert (=> b!1462007 m!1349511))

(declare-fun m!1349543 () Bool)

(assert (=> b!1461988 m!1349543))

(declare-fun m!1349545 () Bool)

(assert (=> b!1461990 m!1349545))

(assert (=> b!1461990 m!1349529))

(declare-fun m!1349547 () Bool)

(assert (=> b!1461990 m!1349547))

(declare-fun m!1349549 () Bool)

(assert (=> b!1461990 m!1349549))

(declare-fun m!1349551 () Bool)

(assert (=> b!1461990 m!1349551))

(assert (=> b!1461990 m!1349499))

(declare-fun m!1349553 () Bool)

(assert (=> b!1462008 m!1349553))

(assert (=> b!1462008 m!1349553))

(declare-fun m!1349555 () Bool)

(assert (=> b!1462008 m!1349555))

(push 1)

