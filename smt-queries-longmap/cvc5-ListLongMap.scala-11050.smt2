; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129132 () Bool)

(assert start!129132)

(declare-fun b!1515392 () Bool)

(declare-fun res!1035296 () Bool)

(declare-fun e!845664 () Bool)

(assert (=> b!1515392 (=> (not res!1035296) (not e!845664))))

(declare-datatypes ((array!100988 0))(
  ( (array!100989 (arr!48731 (Array (_ BitVec 32) (_ BitVec 64))) (size!49281 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100988)

(declare-datatypes ((List!35214 0))(
  ( (Nil!35211) (Cons!35210 (h!36622 (_ BitVec 64)) (t!49908 List!35214)) )
))
(declare-fun arrayNoDuplicates!0 (array!100988 (_ BitVec 32) List!35214) Bool)

(assert (=> b!1515392 (= res!1035296 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35211))))

(declare-fun res!1035303 () Bool)

(assert (=> start!129132 (=> (not res!1035303) (not e!845664))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129132 (= res!1035303 (validMask!0 mask!2512))))

(assert (=> start!129132 e!845664))

(assert (=> start!129132 true))

(declare-fun array_inv!37759 (array!100988) Bool)

(assert (=> start!129132 (array_inv!37759 a!2804)))

(declare-fun b!1515393 () Bool)

(declare-fun res!1035300 () Bool)

(assert (=> b!1515393 (=> (not res!1035300) (not e!845664))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515393 (= res!1035300 (validKeyInArray!0 (select (arr!48731 a!2804) j!70)))))

(declare-fun b!1515394 () Bool)

(declare-fun e!845662 () Bool)

(declare-fun e!845659 () Bool)

(assert (=> b!1515394 (= e!845662 e!845659)))

(declare-fun res!1035304 () Bool)

(assert (=> b!1515394 (=> (not res!1035304) (not e!845659))))

(declare-fun lt!656830 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12902 0))(
  ( (MissingZero!12902 (index!54003 (_ BitVec 32))) (Found!12902 (index!54004 (_ BitVec 32))) (Intermediate!12902 (undefined!13714 Bool) (index!54005 (_ BitVec 32)) (x!135708 (_ BitVec 32))) (Undefined!12902) (MissingVacant!12902 (index!54006 (_ BitVec 32))) )
))
(declare-fun lt!656836 () SeekEntryResult!12902)

(declare-fun lt!656832 () array!100988)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100988 (_ BitVec 32)) SeekEntryResult!12902)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515394 (= res!1035304 (= lt!656836 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656830 mask!2512) lt!656830 lt!656832 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1515394 (= lt!656830 (select (store (arr!48731 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515394 (= lt!656832 (array!100989 (store (arr!48731 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49281 a!2804)))))

(declare-fun b!1515395 () Bool)

(declare-fun res!1035307 () Bool)

(assert (=> b!1515395 (=> (not res!1035307) (not e!845664))))

(assert (=> b!1515395 (= res!1035307 (validKeyInArray!0 (select (arr!48731 a!2804) i!961)))))

(declare-fun b!1515396 () Bool)

(declare-fun res!1035301 () Bool)

(assert (=> b!1515396 (=> (not res!1035301) (not e!845664))))

(assert (=> b!1515396 (= res!1035301 (and (= (size!49281 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49281 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49281 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515397 () Bool)

(declare-fun res!1035297 () Bool)

(assert (=> b!1515397 (=> (not res!1035297) (not e!845664))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1515397 (= res!1035297 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49281 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49281 a!2804))))))

(declare-fun b!1515398 () Bool)

(declare-fun e!845665 () Bool)

(assert (=> b!1515398 (= e!845665 true)))

(declare-fun lt!656834 () SeekEntryResult!12902)

(declare-fun lt!656837 () SeekEntryResult!12902)

(assert (=> b!1515398 (= lt!656834 lt!656837)))

(declare-datatypes ((Unit!50672 0))(
  ( (Unit!50673) )
))
(declare-fun lt!656833 () Unit!50672)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!100988 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50672)

(assert (=> b!1515398 (= lt!656833 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1515399 () Bool)

(declare-fun e!845661 () Bool)

(assert (=> b!1515399 (= e!845661 e!845665)))

(declare-fun res!1035299 () Bool)

(assert (=> b!1515399 (=> res!1035299 e!845665)))

(assert (=> b!1515399 (= res!1035299 (not (= lt!656837 (Found!12902 j!70))))))

(declare-fun lt!656839 () SeekEntryResult!12902)

(assert (=> b!1515399 (= lt!656839 lt!656834)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100988 (_ BitVec 32)) SeekEntryResult!12902)

(assert (=> b!1515399 (= lt!656834 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656830 lt!656832 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100988 (_ BitVec 32)) SeekEntryResult!12902)

(assert (=> b!1515399 (= lt!656839 (seekEntryOrOpen!0 lt!656830 lt!656832 mask!2512))))

(declare-fun lt!656835 () SeekEntryResult!12902)

(assert (=> b!1515399 (= lt!656835 lt!656837)))

(assert (=> b!1515399 (= lt!656837 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48731 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1515399 (= lt!656835 (seekEntryOrOpen!0 (select (arr!48731 a!2804) j!70) a!2804 mask!2512))))

(declare-fun e!845660 () Bool)

(declare-fun b!1515400 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100988 (_ BitVec 32)) SeekEntryResult!12902)

(assert (=> b!1515400 (= e!845660 (= (seekEntry!0 (select (arr!48731 a!2804) j!70) a!2804 mask!2512) (Found!12902 j!70)))))

(declare-fun b!1515401 () Bool)

(assert (=> b!1515401 (= e!845664 e!845662)))

(declare-fun res!1035298 () Bool)

(assert (=> b!1515401 (=> (not res!1035298) (not e!845662))))

(declare-fun lt!656831 () SeekEntryResult!12902)

(assert (=> b!1515401 (= res!1035298 (= lt!656836 lt!656831))))

(assert (=> b!1515401 (= lt!656831 (Intermediate!12902 false resIndex!21 resX!21))))

(assert (=> b!1515401 (= lt!656836 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48731 a!2804) j!70) mask!2512) (select (arr!48731 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515402 () Bool)

(assert (=> b!1515402 (= e!845659 (not e!845661))))

(declare-fun res!1035305 () Bool)

(assert (=> b!1515402 (=> res!1035305 e!845661)))

(assert (=> b!1515402 (= res!1035305 (or (not (= (select (arr!48731 a!2804) j!70) lt!656830)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48731 a!2804) index!487) (select (arr!48731 a!2804) j!70)) (not (= (select (arr!48731 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1515402 e!845660))

(declare-fun res!1035302 () Bool)

(assert (=> b!1515402 (=> (not res!1035302) (not e!845660))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100988 (_ BitVec 32)) Bool)

(assert (=> b!1515402 (= res!1035302 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!656838 () Unit!50672)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100988 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50672)

(assert (=> b!1515402 (= lt!656838 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515403 () Bool)

(declare-fun res!1035295 () Bool)

(assert (=> b!1515403 (=> (not res!1035295) (not e!845664))))

(assert (=> b!1515403 (= res!1035295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515404 () Bool)

(declare-fun res!1035306 () Bool)

(assert (=> b!1515404 (=> (not res!1035306) (not e!845662))))

(assert (=> b!1515404 (= res!1035306 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48731 a!2804) j!70) a!2804 mask!2512) lt!656831))))

(assert (= (and start!129132 res!1035303) b!1515396))

(assert (= (and b!1515396 res!1035301) b!1515395))

(assert (= (and b!1515395 res!1035307) b!1515393))

(assert (= (and b!1515393 res!1035300) b!1515403))

(assert (= (and b!1515403 res!1035295) b!1515392))

(assert (= (and b!1515392 res!1035296) b!1515397))

(assert (= (and b!1515397 res!1035297) b!1515401))

(assert (= (and b!1515401 res!1035298) b!1515404))

(assert (= (and b!1515404 res!1035306) b!1515394))

(assert (= (and b!1515394 res!1035304) b!1515402))

(assert (= (and b!1515402 res!1035302) b!1515400))

(assert (= (and b!1515402 (not res!1035305)) b!1515399))

(assert (= (and b!1515399 (not res!1035299)) b!1515398))

(declare-fun m!1398487 () Bool)

(assert (=> start!129132 m!1398487))

(declare-fun m!1398489 () Bool)

(assert (=> start!129132 m!1398489))

(declare-fun m!1398491 () Bool)

(assert (=> b!1515394 m!1398491))

(assert (=> b!1515394 m!1398491))

(declare-fun m!1398493 () Bool)

(assert (=> b!1515394 m!1398493))

(declare-fun m!1398495 () Bool)

(assert (=> b!1515394 m!1398495))

(declare-fun m!1398497 () Bool)

(assert (=> b!1515394 m!1398497))

(declare-fun m!1398499 () Bool)

(assert (=> b!1515393 m!1398499))

(assert (=> b!1515393 m!1398499))

(declare-fun m!1398501 () Bool)

(assert (=> b!1515393 m!1398501))

(declare-fun m!1398503 () Bool)

(assert (=> b!1515398 m!1398503))

(declare-fun m!1398505 () Bool)

(assert (=> b!1515392 m!1398505))

(assert (=> b!1515404 m!1398499))

(assert (=> b!1515404 m!1398499))

(declare-fun m!1398507 () Bool)

(assert (=> b!1515404 m!1398507))

(assert (=> b!1515401 m!1398499))

(assert (=> b!1515401 m!1398499))

(declare-fun m!1398509 () Bool)

(assert (=> b!1515401 m!1398509))

(assert (=> b!1515401 m!1398509))

(assert (=> b!1515401 m!1398499))

(declare-fun m!1398511 () Bool)

(assert (=> b!1515401 m!1398511))

(assert (=> b!1515402 m!1398499))

(declare-fun m!1398513 () Bool)

(assert (=> b!1515402 m!1398513))

(declare-fun m!1398515 () Bool)

(assert (=> b!1515402 m!1398515))

(declare-fun m!1398517 () Bool)

(assert (=> b!1515402 m!1398517))

(assert (=> b!1515399 m!1398499))

(declare-fun m!1398519 () Bool)

(assert (=> b!1515399 m!1398519))

(assert (=> b!1515399 m!1398499))

(assert (=> b!1515399 m!1398499))

(declare-fun m!1398521 () Bool)

(assert (=> b!1515399 m!1398521))

(declare-fun m!1398523 () Bool)

(assert (=> b!1515399 m!1398523))

(declare-fun m!1398525 () Bool)

(assert (=> b!1515399 m!1398525))

(assert (=> b!1515400 m!1398499))

(assert (=> b!1515400 m!1398499))

(declare-fun m!1398527 () Bool)

(assert (=> b!1515400 m!1398527))

(declare-fun m!1398529 () Bool)

(assert (=> b!1515403 m!1398529))

(declare-fun m!1398531 () Bool)

(assert (=> b!1515395 m!1398531))

(assert (=> b!1515395 m!1398531))

(declare-fun m!1398533 () Bool)

(assert (=> b!1515395 m!1398533))

(push 1)

