; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129192 () Bool)

(assert start!129192)

(declare-fun b!1516500 () Bool)

(declare-fun res!1036411 () Bool)

(declare-fun e!846181 () Bool)

(assert (=> b!1516500 (=> (not res!1036411) (not e!846181))))

(declare-datatypes ((SeekEntryResult!12932 0))(
  ( (MissingZero!12932 (index!54123 (_ BitVec 32))) (Found!12932 (index!54124 (_ BitVec 32))) (Intermediate!12932 (undefined!13744 Bool) (index!54125 (_ BitVec 32)) (x!135818 (_ BitVec 32))) (Undefined!12932) (MissingVacant!12932 (index!54126 (_ BitVec 32))) )
))
(declare-fun lt!657423 () SeekEntryResult!12932)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101048 0))(
  ( (array!101049 (arr!48761 (Array (_ BitVec 32) (_ BitVec 64))) (size!49311 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101048)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101048 (_ BitVec 32)) SeekEntryResult!12932)

(assert (=> b!1516500 (= res!1036411 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48761 a!2804) j!70) a!2804 mask!2512) lt!657423))))

(declare-fun b!1516501 () Bool)

(declare-fun res!1036402 () Bool)

(declare-fun e!846183 () Bool)

(assert (=> b!1516501 (=> (not res!1036402) (not e!846183))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1516501 (= res!1036402 (and (= (size!49311 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49311 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49311 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516502 () Bool)

(declare-fun res!1036403 () Bool)

(assert (=> b!1516502 (=> (not res!1036403) (not e!846183))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1516502 (= res!1036403 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49311 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49311 a!2804))))))

(declare-fun b!1516503 () Bool)

(declare-fun res!1036405 () Bool)

(assert (=> b!1516503 (=> (not res!1036405) (not e!846183))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101048 (_ BitVec 32)) Bool)

(assert (=> b!1516503 (= res!1036405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1516504 () Bool)

(declare-fun res!1036410 () Bool)

(assert (=> b!1516504 (=> (not res!1036410) (not e!846181))))

(declare-fun lt!657427 () SeekEntryResult!12932)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516504 (= res!1036410 (= lt!657427 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48761 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48761 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101049 (store (arr!48761 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49311 a!2804)) mask!2512)))))

(declare-fun b!1516505 () Bool)

(declare-fun res!1036408 () Bool)

(assert (=> b!1516505 (=> (not res!1036408) (not e!846183))))

(declare-datatypes ((List!35244 0))(
  ( (Nil!35241) (Cons!35240 (h!36652 (_ BitVec 64)) (t!49938 List!35244)) )
))
(declare-fun arrayNoDuplicates!0 (array!101048 (_ BitVec 32) List!35244) Bool)

(assert (=> b!1516505 (= res!1036408 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35241))))

(declare-fun res!1036412 () Bool)

(assert (=> start!129192 (=> (not res!1036412) (not e!846183))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129192 (= res!1036412 (validMask!0 mask!2512))))

(assert (=> start!129192 e!846183))

(assert (=> start!129192 true))

(declare-fun array_inv!37789 (array!101048) Bool)

(assert (=> start!129192 (array_inv!37789 a!2804)))

(declare-fun b!1516499 () Bool)

(declare-fun e!846184 () Bool)

(declare-fun e!846182 () Bool)

(assert (=> b!1516499 (= e!846184 e!846182)))

(declare-fun res!1036413 () Bool)

(assert (=> b!1516499 (=> res!1036413 e!846182)))

(declare-fun lt!657425 () (_ BitVec 32))

(assert (=> b!1516499 (= res!1036413 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657425 #b00000000000000000000000000000000) (bvsge lt!657425 (size!49311 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516499 (= lt!657425 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1516506 () Bool)

(assert (=> b!1516506 (= e!846181 (not e!846184))))

(declare-fun res!1036404 () Bool)

(assert (=> b!1516506 (=> res!1036404 e!846184)))

(assert (=> b!1516506 (= res!1036404 (or (not (= (select (arr!48761 a!2804) j!70) (select (store (arr!48761 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846180 () Bool)

(assert (=> b!1516506 e!846180))

(declare-fun res!1036407 () Bool)

(assert (=> b!1516506 (=> (not res!1036407) (not e!846180))))

(assert (=> b!1516506 (= res!1036407 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50732 0))(
  ( (Unit!50733) )
))
(declare-fun lt!657424 () Unit!50732)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101048 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50732)

(assert (=> b!1516506 (= lt!657424 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516507 () Bool)

(assert (=> b!1516507 (= e!846182 true)))

(declare-fun lt!657426 () SeekEntryResult!12932)

(assert (=> b!1516507 (= lt!657426 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657425 (select (arr!48761 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516508 () Bool)

(assert (=> b!1516508 (= e!846183 e!846181)))

(declare-fun res!1036409 () Bool)

(assert (=> b!1516508 (=> (not res!1036409) (not e!846181))))

(assert (=> b!1516508 (= res!1036409 (= lt!657427 lt!657423))))

(assert (=> b!1516508 (= lt!657423 (Intermediate!12932 false resIndex!21 resX!21))))

(assert (=> b!1516508 (= lt!657427 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48761 a!2804) j!70) mask!2512) (select (arr!48761 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516509 () Bool)

(declare-fun res!1036414 () Bool)

(assert (=> b!1516509 (=> (not res!1036414) (not e!846183))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516509 (= res!1036414 (validKeyInArray!0 (select (arr!48761 a!2804) j!70)))))

(declare-fun b!1516510 () Bool)

(declare-fun res!1036406 () Bool)

(assert (=> b!1516510 (=> (not res!1036406) (not e!846183))))

(assert (=> b!1516510 (= res!1036406 (validKeyInArray!0 (select (arr!48761 a!2804) i!961)))))

(declare-fun b!1516511 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101048 (_ BitVec 32)) SeekEntryResult!12932)

(assert (=> b!1516511 (= e!846180 (= (seekEntry!0 (select (arr!48761 a!2804) j!70) a!2804 mask!2512) (Found!12932 j!70)))))

(assert (= (and start!129192 res!1036412) b!1516501))

(assert (= (and b!1516501 res!1036402) b!1516510))

(assert (= (and b!1516510 res!1036406) b!1516509))

(assert (= (and b!1516509 res!1036414) b!1516503))

(assert (= (and b!1516503 res!1036405) b!1516505))

(assert (= (and b!1516505 res!1036408) b!1516502))

(assert (= (and b!1516502 res!1036403) b!1516508))

(assert (= (and b!1516508 res!1036409) b!1516500))

(assert (= (and b!1516500 res!1036411) b!1516504))

(assert (= (and b!1516504 res!1036410) b!1516506))

(assert (= (and b!1516506 res!1036407) b!1516511))

(assert (= (and b!1516506 (not res!1036404)) b!1516499))

(assert (= (and b!1516499 (not res!1036413)) b!1516507))

(declare-fun m!1399765 () Bool)

(assert (=> b!1516507 m!1399765))

(assert (=> b!1516507 m!1399765))

(declare-fun m!1399767 () Bool)

(assert (=> b!1516507 m!1399767))

(declare-fun m!1399769 () Bool)

(assert (=> b!1516499 m!1399769))

(declare-fun m!1399771 () Bool)

(assert (=> start!129192 m!1399771))

(declare-fun m!1399773 () Bool)

(assert (=> start!129192 m!1399773))

(assert (=> b!1516509 m!1399765))

(assert (=> b!1516509 m!1399765))

(declare-fun m!1399775 () Bool)

(assert (=> b!1516509 m!1399775))

(declare-fun m!1399777 () Bool)

(assert (=> b!1516503 m!1399777))

(assert (=> b!1516511 m!1399765))

(assert (=> b!1516511 m!1399765))

(declare-fun m!1399779 () Bool)

(assert (=> b!1516511 m!1399779))

(assert (=> b!1516500 m!1399765))

(assert (=> b!1516500 m!1399765))

(declare-fun m!1399781 () Bool)

(assert (=> b!1516500 m!1399781))

(assert (=> b!1516506 m!1399765))

(declare-fun m!1399783 () Bool)

(assert (=> b!1516506 m!1399783))

(declare-fun m!1399785 () Bool)

(assert (=> b!1516506 m!1399785))

(declare-fun m!1399787 () Bool)

(assert (=> b!1516506 m!1399787))

(declare-fun m!1399789 () Bool)

(assert (=> b!1516506 m!1399789))

(assert (=> b!1516508 m!1399765))

(assert (=> b!1516508 m!1399765))

(declare-fun m!1399791 () Bool)

(assert (=> b!1516508 m!1399791))

(assert (=> b!1516508 m!1399791))

(assert (=> b!1516508 m!1399765))

(declare-fun m!1399793 () Bool)

(assert (=> b!1516508 m!1399793))

(assert (=> b!1516504 m!1399785))

(assert (=> b!1516504 m!1399787))

(assert (=> b!1516504 m!1399787))

(declare-fun m!1399795 () Bool)

(assert (=> b!1516504 m!1399795))

(assert (=> b!1516504 m!1399795))

(assert (=> b!1516504 m!1399787))

(declare-fun m!1399797 () Bool)

(assert (=> b!1516504 m!1399797))

(declare-fun m!1399799 () Bool)

(assert (=> b!1516505 m!1399799))

(declare-fun m!1399801 () Bool)

(assert (=> b!1516510 m!1399801))

(assert (=> b!1516510 m!1399801))

(declare-fun m!1399803 () Bool)

(assert (=> b!1516510 m!1399803))

(push 1)

