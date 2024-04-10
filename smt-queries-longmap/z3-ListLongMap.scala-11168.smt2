; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130552 () Bool)

(assert start!130552)

(declare-fun b!1532251 () Bool)

(declare-fun e!853738 () Bool)

(declare-fun e!853737 () Bool)

(assert (=> b!1532251 (= e!853738 e!853737)))

(declare-fun res!1049404 () Bool)

(assert (=> b!1532251 (=> (not res!1049404) (not e!853737))))

(declare-datatypes ((SeekEntryResult!13251 0))(
  ( (MissingZero!13251 (index!55399 (_ BitVec 32))) (Found!13251 (index!55400 (_ BitVec 32))) (Intermediate!13251 (undefined!14063 Bool) (index!55401 (_ BitVec 32)) (x!137093 (_ BitVec 32))) (Undefined!13251) (MissingVacant!13251 (index!55402 (_ BitVec 32))) )
))
(declare-fun lt!663611 () SeekEntryResult!13251)

(declare-fun lt!663613 () SeekEntryResult!13251)

(assert (=> b!1532251 (= res!1049404 (= lt!663611 lt!663613))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1532251 (= lt!663613 (Intermediate!13251 false resIndex!21 resX!21))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101731 0))(
  ( (array!101732 (arr!49086 (Array (_ BitVec 32) (_ BitVec 64))) (size!49636 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101731)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101731 (_ BitVec 32)) SeekEntryResult!13251)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1532251 (= lt!663611 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49086 a!2804) j!70) mask!2512) (select (arr!49086 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1532253 () Bool)

(declare-fun res!1049397 () Bool)

(declare-fun e!853736 () Bool)

(assert (=> b!1532253 (=> res!1049397 e!853736)))

(declare-fun lt!663612 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1532253 (= res!1049397 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663612 (select (arr!49086 a!2804) j!70) a!2804 mask!2512) lt!663613)))))

(declare-fun b!1532254 () Bool)

(declare-fun res!1049401 () Bool)

(assert (=> b!1532254 (=> (not res!1049401) (not e!853738))))

(declare-datatypes ((List!35569 0))(
  ( (Nil!35566) (Cons!35565 (h!37010 (_ BitVec 64)) (t!50263 List!35569)) )
))
(declare-fun arrayNoDuplicates!0 (array!101731 (_ BitVec 32) List!35569) Bool)

(assert (=> b!1532254 (= res!1049401 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35566))))

(declare-fun b!1532255 () Bool)

(declare-fun res!1049402 () Bool)

(assert (=> b!1532255 (=> (not res!1049402) (not e!853738))))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1532255 (= res!1049402 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49636 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49636 a!2804))))))

(declare-fun e!853741 () Bool)

(declare-fun b!1532256 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101731 (_ BitVec 32)) SeekEntryResult!13251)

(assert (=> b!1532256 (= e!853741 (= (seekEntry!0 (select (arr!49086 a!2804) j!70) a!2804 mask!2512) (Found!13251 j!70)))))

(declare-fun b!1532257 () Bool)

(declare-fun e!853735 () Bool)

(declare-fun e!853739 () Bool)

(assert (=> b!1532257 (= e!853735 (not e!853739))))

(declare-fun res!1049394 () Bool)

(assert (=> b!1532257 (=> res!1049394 e!853739)))

(declare-fun lt!663614 () (_ BitVec 64))

(assert (=> b!1532257 (= res!1049394 (or (not (= (select (arr!49086 a!2804) j!70) lt!663614)) (= x!534 resX!21)))))

(assert (=> b!1532257 e!853741))

(declare-fun res!1049392 () Bool)

(assert (=> b!1532257 (=> (not res!1049392) (not e!853741))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101731 (_ BitVec 32)) Bool)

(assert (=> b!1532257 (= res!1049392 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51286 0))(
  ( (Unit!51287) )
))
(declare-fun lt!663616 () Unit!51286)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101731 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51286)

(assert (=> b!1532257 (= lt!663616 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1532258 () Bool)

(assert (=> b!1532258 (= e!853736 true)))

(declare-fun lt!663615 () array!101731)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101731 (_ BitVec 32)) SeekEntryResult!13251)

(assert (=> b!1532258 (= (seekEntryOrOpen!0 (select (arr!49086 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!663614 lt!663615 mask!2512))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun lt!663610 () Unit!51286)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101731 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51286)

(assert (=> b!1532258 (= lt!663610 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!663612 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1532259 () Bool)

(declare-fun res!1049395 () Bool)

(assert (=> b!1532259 (=> (not res!1049395) (not e!853738))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532259 (= res!1049395 (validKeyInArray!0 (select (arr!49086 a!2804) j!70)))))

(declare-fun b!1532260 () Bool)

(declare-fun res!1049403 () Bool)

(assert (=> b!1532260 (=> (not res!1049403) (not e!853737))))

(assert (=> b!1532260 (= res!1049403 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49086 a!2804) j!70) a!2804 mask!2512) lt!663613))))

(declare-fun b!1532261 () Bool)

(assert (=> b!1532261 (= e!853739 e!853736)))

(declare-fun res!1049396 () Bool)

(assert (=> b!1532261 (=> res!1049396 e!853736)))

(assert (=> b!1532261 (= res!1049396 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!663612 #b00000000000000000000000000000000) (bvsge lt!663612 (size!49636 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1532261 (= lt!663612 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1532262 () Bool)

(declare-fun res!1049393 () Bool)

(assert (=> b!1532262 (=> (not res!1049393) (not e!853738))))

(assert (=> b!1532262 (= res!1049393 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1532263 () Bool)

(declare-fun res!1049399 () Bool)

(assert (=> b!1532263 (=> (not res!1049399) (not e!853738))))

(assert (=> b!1532263 (= res!1049399 (and (= (size!49636 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49636 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49636 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1532264 () Bool)

(declare-fun res!1049391 () Bool)

(assert (=> b!1532264 (=> (not res!1049391) (not e!853738))))

(assert (=> b!1532264 (= res!1049391 (validKeyInArray!0 (select (arr!49086 a!2804) i!961)))))

(declare-fun res!1049400 () Bool)

(assert (=> start!130552 (=> (not res!1049400) (not e!853738))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130552 (= res!1049400 (validMask!0 mask!2512))))

(assert (=> start!130552 e!853738))

(assert (=> start!130552 true))

(declare-fun array_inv!38114 (array!101731) Bool)

(assert (=> start!130552 (array_inv!38114 a!2804)))

(declare-fun b!1532252 () Bool)

(assert (=> b!1532252 (= e!853737 e!853735)))

(declare-fun res!1049398 () Bool)

(assert (=> b!1532252 (=> (not res!1049398) (not e!853735))))

(assert (=> b!1532252 (= res!1049398 (= lt!663611 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!663614 mask!2512) lt!663614 lt!663615 mask!2512)))))

(assert (=> b!1532252 (= lt!663614 (select (store (arr!49086 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1532252 (= lt!663615 (array!101732 (store (arr!49086 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49636 a!2804)))))

(assert (= (and start!130552 res!1049400) b!1532263))

(assert (= (and b!1532263 res!1049399) b!1532264))

(assert (= (and b!1532264 res!1049391) b!1532259))

(assert (= (and b!1532259 res!1049395) b!1532262))

(assert (= (and b!1532262 res!1049393) b!1532254))

(assert (= (and b!1532254 res!1049401) b!1532255))

(assert (= (and b!1532255 res!1049402) b!1532251))

(assert (= (and b!1532251 res!1049404) b!1532260))

(assert (= (and b!1532260 res!1049403) b!1532252))

(assert (= (and b!1532252 res!1049398) b!1532257))

(assert (= (and b!1532257 res!1049392) b!1532256))

(assert (= (and b!1532257 (not res!1049394)) b!1532261))

(assert (= (and b!1532261 (not res!1049396)) b!1532253))

(assert (= (and b!1532253 (not res!1049397)) b!1532258))

(declare-fun m!1414957 () Bool)

(assert (=> b!1532253 m!1414957))

(assert (=> b!1532253 m!1414957))

(declare-fun m!1414959 () Bool)

(assert (=> b!1532253 m!1414959))

(declare-fun m!1414961 () Bool)

(assert (=> b!1532262 m!1414961))

(declare-fun m!1414963 () Bool)

(assert (=> b!1532264 m!1414963))

(assert (=> b!1532264 m!1414963))

(declare-fun m!1414965 () Bool)

(assert (=> b!1532264 m!1414965))

(declare-fun m!1414967 () Bool)

(assert (=> b!1532252 m!1414967))

(assert (=> b!1532252 m!1414967))

(declare-fun m!1414969 () Bool)

(assert (=> b!1532252 m!1414969))

(declare-fun m!1414971 () Bool)

(assert (=> b!1532252 m!1414971))

(declare-fun m!1414973 () Bool)

(assert (=> b!1532252 m!1414973))

(declare-fun m!1414975 () Bool)

(assert (=> b!1532261 m!1414975))

(assert (=> b!1532259 m!1414957))

(assert (=> b!1532259 m!1414957))

(declare-fun m!1414977 () Bool)

(assert (=> b!1532259 m!1414977))

(assert (=> b!1532257 m!1414957))

(declare-fun m!1414979 () Bool)

(assert (=> b!1532257 m!1414979))

(declare-fun m!1414981 () Bool)

(assert (=> b!1532257 m!1414981))

(declare-fun m!1414983 () Bool)

(assert (=> b!1532254 m!1414983))

(assert (=> b!1532260 m!1414957))

(assert (=> b!1532260 m!1414957))

(declare-fun m!1414985 () Bool)

(assert (=> b!1532260 m!1414985))

(declare-fun m!1414987 () Bool)

(assert (=> start!130552 m!1414987))

(declare-fun m!1414989 () Bool)

(assert (=> start!130552 m!1414989))

(assert (=> b!1532251 m!1414957))

(assert (=> b!1532251 m!1414957))

(declare-fun m!1414991 () Bool)

(assert (=> b!1532251 m!1414991))

(assert (=> b!1532251 m!1414991))

(assert (=> b!1532251 m!1414957))

(declare-fun m!1414993 () Bool)

(assert (=> b!1532251 m!1414993))

(assert (=> b!1532256 m!1414957))

(assert (=> b!1532256 m!1414957))

(declare-fun m!1414995 () Bool)

(assert (=> b!1532256 m!1414995))

(assert (=> b!1532258 m!1414957))

(assert (=> b!1532258 m!1414957))

(declare-fun m!1414997 () Bool)

(assert (=> b!1532258 m!1414997))

(declare-fun m!1414999 () Bool)

(assert (=> b!1532258 m!1414999))

(declare-fun m!1415001 () Bool)

(assert (=> b!1532258 m!1415001))

(check-sat (not b!1532259) (not b!1532254) (not b!1532256) (not b!1532257) (not b!1532258) (not b!1532251) (not b!1532252) (not b!1532260) (not b!1532253) (not b!1532261) (not b!1532264) (not start!130552) (not b!1532262))
(check-sat)
