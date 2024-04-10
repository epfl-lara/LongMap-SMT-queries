; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129042 () Bool)

(assert start!129042)

(declare-fun b!1513531 () Bool)

(declare-fun e!844720 () Bool)

(assert (=> b!1513531 (= e!844720 (not true))))

(declare-fun e!844719 () Bool)

(assert (=> b!1513531 e!844719))

(declare-fun res!1033438 () Bool)

(assert (=> b!1513531 (=> (not res!1033438) (not e!844719))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100898 0))(
  ( (array!100899 (arr!48686 (Array (_ BitVec 32) (_ BitVec 64))) (size!49236 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100898)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100898 (_ BitVec 32)) Bool)

(assert (=> b!1513531 (= res!1033438 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50582 0))(
  ( (Unit!50583) )
))
(declare-fun lt!656011 () Unit!50582)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100898 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50582)

(assert (=> b!1513531 (= lt!656011 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1513533 () Bool)

(declare-fun res!1033441 () Bool)

(declare-fun e!844718 () Bool)

(assert (=> b!1513533 (=> (not res!1033441) (not e!844718))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513533 (= res!1033441 (validKeyInArray!0 (select (arr!48686 a!2804) i!961)))))

(declare-fun b!1513534 () Bool)

(declare-fun res!1033434 () Bool)

(assert (=> b!1513534 (=> (not res!1033434) (not e!844718))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1513534 (= res!1033434 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49236 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49236 a!2804))))))

(declare-fun e!844716 () Bool)

(declare-fun lt!656012 () (_ BitVec 64))

(declare-fun b!1513535 () Bool)

(declare-fun lt!656013 () array!100898)

(declare-datatypes ((SeekEntryResult!12857 0))(
  ( (MissingZero!12857 (index!53823 (_ BitVec 32))) (Found!12857 (index!53824 (_ BitVec 32))) (Intermediate!12857 (undefined!13669 Bool) (index!53825 (_ BitVec 32)) (x!135543 (_ BitVec 32))) (Undefined!12857) (MissingVacant!12857 (index!53826 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100898 (_ BitVec 32)) SeekEntryResult!12857)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100898 (_ BitVec 32)) SeekEntryResult!12857)

(assert (=> b!1513535 (= e!844716 (= (seekEntryOrOpen!0 lt!656012 lt!656013 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656012 lt!656013 mask!2512)))))

(declare-fun b!1513536 () Bool)

(declare-fun res!1033442 () Bool)

(assert (=> b!1513536 (=> (not res!1033442) (not e!844718))))

(assert (=> b!1513536 (= res!1033442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513537 () Bool)

(declare-fun res!1033436 () Bool)

(declare-fun e!844715 () Bool)

(assert (=> b!1513537 (=> (not res!1033436) (not e!844715))))

(declare-fun lt!656010 () SeekEntryResult!12857)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100898 (_ BitVec 32)) SeekEntryResult!12857)

(assert (=> b!1513537 (= res!1033436 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48686 a!2804) j!70) a!2804 mask!2512) lt!656010))))

(declare-fun b!1513538 () Bool)

(declare-fun res!1033440 () Bool)

(assert (=> b!1513538 (=> (not res!1033440) (not e!844718))))

(declare-datatypes ((List!35169 0))(
  ( (Nil!35166) (Cons!35165 (h!36577 (_ BitVec 64)) (t!49863 List!35169)) )
))
(declare-fun arrayNoDuplicates!0 (array!100898 (_ BitVec 32) List!35169) Bool)

(assert (=> b!1513538 (= res!1033440 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35166))))

(declare-fun b!1513539 () Bool)

(declare-fun e!844717 () Bool)

(assert (=> b!1513539 (= e!844719 e!844717)))

(declare-fun res!1033446 () Bool)

(assert (=> b!1513539 (=> res!1033446 e!844717)))

(assert (=> b!1513539 (= res!1033446 (or (not (= (select (arr!48686 a!2804) j!70) lt!656012)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48686 a!2804) index!487) (select (arr!48686 a!2804) j!70)) (not (= (select (arr!48686 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1513532 () Bool)

(assert (=> b!1513532 (= e!844718 e!844715)))

(declare-fun res!1033447 () Bool)

(assert (=> b!1513532 (=> (not res!1033447) (not e!844715))))

(declare-fun lt!656014 () SeekEntryResult!12857)

(assert (=> b!1513532 (= res!1033447 (= lt!656014 lt!656010))))

(assert (=> b!1513532 (= lt!656010 (Intermediate!12857 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513532 (= lt!656014 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48686 a!2804) j!70) mask!2512) (select (arr!48686 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1033437 () Bool)

(assert (=> start!129042 (=> (not res!1033437) (not e!844718))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129042 (= res!1033437 (validMask!0 mask!2512))))

(assert (=> start!129042 e!844718))

(assert (=> start!129042 true))

(declare-fun array_inv!37714 (array!100898) Bool)

(assert (=> start!129042 (array_inv!37714 a!2804)))

(declare-fun b!1513540 () Bool)

(assert (=> b!1513540 (= e!844717 e!844716)))

(declare-fun res!1033444 () Bool)

(assert (=> b!1513540 (=> (not res!1033444) (not e!844716))))

(assert (=> b!1513540 (= res!1033444 (= (seekEntryOrOpen!0 (select (arr!48686 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48686 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1513541 () Bool)

(declare-fun res!1033435 () Bool)

(assert (=> b!1513541 (=> (not res!1033435) (not e!844719))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100898 (_ BitVec 32)) SeekEntryResult!12857)

(assert (=> b!1513541 (= res!1033435 (= (seekEntry!0 (select (arr!48686 a!2804) j!70) a!2804 mask!2512) (Found!12857 j!70)))))

(declare-fun b!1513542 () Bool)

(declare-fun res!1033439 () Bool)

(assert (=> b!1513542 (=> (not res!1033439) (not e!844718))))

(assert (=> b!1513542 (= res!1033439 (validKeyInArray!0 (select (arr!48686 a!2804) j!70)))))

(declare-fun b!1513543 () Bool)

(assert (=> b!1513543 (= e!844715 e!844720)))

(declare-fun res!1033445 () Bool)

(assert (=> b!1513543 (=> (not res!1033445) (not e!844720))))

(assert (=> b!1513543 (= res!1033445 (= lt!656014 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656012 mask!2512) lt!656012 lt!656013 mask!2512)))))

(assert (=> b!1513543 (= lt!656012 (select (store (arr!48686 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1513543 (= lt!656013 (array!100899 (store (arr!48686 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49236 a!2804)))))

(declare-fun b!1513544 () Bool)

(declare-fun res!1033443 () Bool)

(assert (=> b!1513544 (=> (not res!1033443) (not e!844718))))

(assert (=> b!1513544 (= res!1033443 (and (= (size!49236 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49236 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49236 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129042 res!1033437) b!1513544))

(assert (= (and b!1513544 res!1033443) b!1513533))

(assert (= (and b!1513533 res!1033441) b!1513542))

(assert (= (and b!1513542 res!1033439) b!1513536))

(assert (= (and b!1513536 res!1033442) b!1513538))

(assert (= (and b!1513538 res!1033440) b!1513534))

(assert (= (and b!1513534 res!1033434) b!1513532))

(assert (= (and b!1513532 res!1033447) b!1513537))

(assert (= (and b!1513537 res!1033436) b!1513543))

(assert (= (and b!1513543 res!1033445) b!1513531))

(assert (= (and b!1513531 res!1033438) b!1513541))

(assert (= (and b!1513541 res!1033435) b!1513539))

(assert (= (and b!1513539 (not res!1033446)) b!1513540))

(assert (= (and b!1513540 res!1033444) b!1513535))

(declare-fun m!1396399 () Bool)

(assert (=> b!1513540 m!1396399))

(assert (=> b!1513540 m!1396399))

(declare-fun m!1396401 () Bool)

(assert (=> b!1513540 m!1396401))

(assert (=> b!1513540 m!1396399))

(declare-fun m!1396403 () Bool)

(assert (=> b!1513540 m!1396403))

(assert (=> b!1513537 m!1396399))

(assert (=> b!1513537 m!1396399))

(declare-fun m!1396405 () Bool)

(assert (=> b!1513537 m!1396405))

(declare-fun m!1396407 () Bool)

(assert (=> b!1513538 m!1396407))

(declare-fun m!1396409 () Bool)

(assert (=> start!129042 m!1396409))

(declare-fun m!1396411 () Bool)

(assert (=> start!129042 m!1396411))

(assert (=> b!1513542 m!1396399))

(assert (=> b!1513542 m!1396399))

(declare-fun m!1396413 () Bool)

(assert (=> b!1513542 m!1396413))

(assert (=> b!1513532 m!1396399))

(assert (=> b!1513532 m!1396399))

(declare-fun m!1396415 () Bool)

(assert (=> b!1513532 m!1396415))

(assert (=> b!1513532 m!1396415))

(assert (=> b!1513532 m!1396399))

(declare-fun m!1396417 () Bool)

(assert (=> b!1513532 m!1396417))

(assert (=> b!1513541 m!1396399))

(assert (=> b!1513541 m!1396399))

(declare-fun m!1396419 () Bool)

(assert (=> b!1513541 m!1396419))

(declare-fun m!1396421 () Bool)

(assert (=> b!1513533 m!1396421))

(assert (=> b!1513533 m!1396421))

(declare-fun m!1396423 () Bool)

(assert (=> b!1513533 m!1396423))

(assert (=> b!1513539 m!1396399))

(declare-fun m!1396425 () Bool)

(assert (=> b!1513539 m!1396425))

(declare-fun m!1396427 () Bool)

(assert (=> b!1513535 m!1396427))

(declare-fun m!1396429 () Bool)

(assert (=> b!1513535 m!1396429))

(declare-fun m!1396431 () Bool)

(assert (=> b!1513543 m!1396431))

(assert (=> b!1513543 m!1396431))

(declare-fun m!1396433 () Bool)

(assert (=> b!1513543 m!1396433))

(declare-fun m!1396435 () Bool)

(assert (=> b!1513543 m!1396435))

(declare-fun m!1396437 () Bool)

(assert (=> b!1513543 m!1396437))

(declare-fun m!1396439 () Bool)

(assert (=> b!1513531 m!1396439))

(declare-fun m!1396441 () Bool)

(assert (=> b!1513531 m!1396441))

(declare-fun m!1396443 () Bool)

(assert (=> b!1513536 m!1396443))

(push 1)

