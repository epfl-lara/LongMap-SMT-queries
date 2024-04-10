; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130516 () Bool)

(assert start!130516)

(declare-fun b!1531499 () Bool)

(declare-fun res!1048642 () Bool)

(declare-fun e!853371 () Bool)

(assert (=> b!1531499 (=> (not res!1048642) (not e!853371))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101695 0))(
  ( (array!101696 (arr!49068 (Array (_ BitVec 32) (_ BitVec 64))) (size!49618 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101695)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1531499 (= res!1048642 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49618 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49618 a!2804))))))

(declare-fun b!1531500 () Bool)

(declare-fun e!853375 () Bool)

(declare-fun e!853373 () Bool)

(assert (=> b!1531500 (= e!853375 e!853373)))

(declare-fun res!1048646 () Bool)

(assert (=> b!1531500 (=> res!1048646 e!853373)))

(declare-fun lt!663270 () (_ BitVec 32))

(assert (=> b!1531500 (= res!1048646 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!663270 #b00000000000000000000000000000000) (bvsge lt!663270 (size!49618 a!2804))))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531500 (= lt!663270 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1531501 () Bool)

(declare-fun e!853374 () Bool)

(assert (=> b!1531501 (= e!853371 e!853374)))

(declare-fun res!1048648 () Bool)

(assert (=> b!1531501 (=> (not res!1048648) (not e!853374))))

(declare-datatypes ((SeekEntryResult!13233 0))(
  ( (MissingZero!13233 (index!55327 (_ BitVec 32))) (Found!13233 (index!55328 (_ BitVec 32))) (Intermediate!13233 (undefined!14045 Bool) (index!55329 (_ BitVec 32)) (x!137027 (_ BitVec 32))) (Undefined!13233) (MissingVacant!13233 (index!55330 (_ BitVec 32))) )
))
(declare-fun lt!663269 () SeekEntryResult!13233)

(declare-fun lt!663271 () SeekEntryResult!13233)

(assert (=> b!1531501 (= res!1048648 (= lt!663269 lt!663271))))

(assert (=> b!1531501 (= lt!663271 (Intermediate!13233 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101695 (_ BitVec 32)) SeekEntryResult!13233)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531501 (= lt!663269 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49068 a!2804) j!70) mask!2512) (select (arr!49068 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1048645 () Bool)

(assert (=> start!130516 (=> (not res!1048645) (not e!853371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130516 (= res!1048645 (validMask!0 mask!2512))))

(assert (=> start!130516 e!853371))

(assert (=> start!130516 true))

(declare-fun array_inv!38096 (array!101695) Bool)

(assert (=> start!130516 (array_inv!38096 a!2804)))

(declare-fun b!1531502 () Bool)

(declare-fun res!1048644 () Bool)

(assert (=> b!1531502 (=> (not res!1048644) (not e!853374))))

(assert (=> b!1531502 (= res!1048644 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49068 a!2804) j!70) a!2804 mask!2512) lt!663271))))

(declare-fun b!1531503 () Bool)

(declare-fun res!1048639 () Bool)

(assert (=> b!1531503 (=> (not res!1048639) (not e!853371))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1531503 (= res!1048639 (validKeyInArray!0 (select (arr!49068 a!2804) i!961)))))

(declare-fun b!1531504 () Bool)

(declare-fun res!1048647 () Bool)

(assert (=> b!1531504 (=> (not res!1048647) (not e!853371))))

(assert (=> b!1531504 (= res!1048647 (validKeyInArray!0 (select (arr!49068 a!2804) j!70)))))

(declare-fun b!1531505 () Bool)

(declare-fun e!853370 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101695 (_ BitVec 32)) SeekEntryResult!13233)

(assert (=> b!1531505 (= e!853370 (= (seekEntry!0 (select (arr!49068 a!2804) j!70) a!2804 mask!2512) (Found!13233 j!70)))))

(declare-fun b!1531506 () Bool)

(assert (=> b!1531506 (= e!853373 true)))

(declare-fun lt!663267 () SeekEntryResult!13233)

(assert (=> b!1531506 (= lt!663267 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663270 (select (arr!49068 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531507 () Bool)

(declare-fun res!1048643 () Bool)

(assert (=> b!1531507 (=> (not res!1048643) (not e!853371))))

(declare-datatypes ((List!35551 0))(
  ( (Nil!35548) (Cons!35547 (h!36992 (_ BitVec 64)) (t!50245 List!35551)) )
))
(declare-fun arrayNoDuplicates!0 (array!101695 (_ BitVec 32) List!35551) Bool)

(assert (=> b!1531507 (= res!1048643 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35548))))

(declare-fun b!1531508 () Bool)

(assert (=> b!1531508 (= e!853374 (not e!853375))))

(declare-fun res!1048650 () Bool)

(assert (=> b!1531508 (=> res!1048650 e!853375)))

(assert (=> b!1531508 (= res!1048650 (or (not (= (select (arr!49068 a!2804) j!70) (select (store (arr!49068 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1531508 e!853370))

(declare-fun res!1048651 () Bool)

(assert (=> b!1531508 (=> (not res!1048651) (not e!853370))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101695 (_ BitVec 32)) Bool)

(assert (=> b!1531508 (= res!1048651 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51250 0))(
  ( (Unit!51251) )
))
(declare-fun lt!663268 () Unit!51250)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101695 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51250)

(assert (=> b!1531508 (= lt!663268 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1531509 () Bool)

(declare-fun res!1048649 () Bool)

(assert (=> b!1531509 (=> (not res!1048649) (not e!853374))))

(assert (=> b!1531509 (= res!1048649 (= lt!663269 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49068 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49068 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101696 (store (arr!49068 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49618 a!2804)) mask!2512)))))

(declare-fun b!1531510 () Bool)

(declare-fun res!1048641 () Bool)

(assert (=> b!1531510 (=> (not res!1048641) (not e!853371))))

(assert (=> b!1531510 (= res!1048641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1531511 () Bool)

(declare-fun res!1048640 () Bool)

(assert (=> b!1531511 (=> (not res!1048640) (not e!853371))))

(assert (=> b!1531511 (= res!1048640 (and (= (size!49618 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49618 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49618 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!130516 res!1048645) b!1531511))

(assert (= (and b!1531511 res!1048640) b!1531503))

(assert (= (and b!1531503 res!1048639) b!1531504))

(assert (= (and b!1531504 res!1048647) b!1531510))

(assert (= (and b!1531510 res!1048641) b!1531507))

(assert (= (and b!1531507 res!1048643) b!1531499))

(assert (= (and b!1531499 res!1048642) b!1531501))

(assert (= (and b!1531501 res!1048648) b!1531502))

(assert (= (and b!1531502 res!1048644) b!1531509))

(assert (= (and b!1531509 res!1048649) b!1531508))

(assert (= (and b!1531508 res!1048651) b!1531505))

(assert (= (and b!1531508 (not res!1048650)) b!1531500))

(assert (= (and b!1531500 (not res!1048646)) b!1531506))

(declare-fun m!1414159 () Bool)

(assert (=> b!1531500 m!1414159))

(declare-fun m!1414161 () Bool)

(assert (=> b!1531502 m!1414161))

(assert (=> b!1531502 m!1414161))

(declare-fun m!1414163 () Bool)

(assert (=> b!1531502 m!1414163))

(declare-fun m!1414165 () Bool)

(assert (=> b!1531509 m!1414165))

(declare-fun m!1414167 () Bool)

(assert (=> b!1531509 m!1414167))

(assert (=> b!1531509 m!1414167))

(declare-fun m!1414169 () Bool)

(assert (=> b!1531509 m!1414169))

(assert (=> b!1531509 m!1414169))

(assert (=> b!1531509 m!1414167))

(declare-fun m!1414171 () Bool)

(assert (=> b!1531509 m!1414171))

(declare-fun m!1414173 () Bool)

(assert (=> b!1531507 m!1414173))

(declare-fun m!1414175 () Bool)

(assert (=> b!1531503 m!1414175))

(assert (=> b!1531503 m!1414175))

(declare-fun m!1414177 () Bool)

(assert (=> b!1531503 m!1414177))

(assert (=> b!1531505 m!1414161))

(assert (=> b!1531505 m!1414161))

(declare-fun m!1414179 () Bool)

(assert (=> b!1531505 m!1414179))

(declare-fun m!1414181 () Bool)

(assert (=> start!130516 m!1414181))

(declare-fun m!1414183 () Bool)

(assert (=> start!130516 m!1414183))

(assert (=> b!1531506 m!1414161))

(assert (=> b!1531506 m!1414161))

(declare-fun m!1414185 () Bool)

(assert (=> b!1531506 m!1414185))

(assert (=> b!1531504 m!1414161))

(assert (=> b!1531504 m!1414161))

(declare-fun m!1414187 () Bool)

(assert (=> b!1531504 m!1414187))

(assert (=> b!1531508 m!1414161))

(declare-fun m!1414189 () Bool)

(assert (=> b!1531508 m!1414189))

(assert (=> b!1531508 m!1414165))

(assert (=> b!1531508 m!1414167))

(declare-fun m!1414191 () Bool)

(assert (=> b!1531508 m!1414191))

(declare-fun m!1414193 () Bool)

(assert (=> b!1531510 m!1414193))

(assert (=> b!1531501 m!1414161))

(assert (=> b!1531501 m!1414161))

(declare-fun m!1414195 () Bool)

(assert (=> b!1531501 m!1414195))

(assert (=> b!1531501 m!1414195))

(assert (=> b!1531501 m!1414161))

(declare-fun m!1414197 () Bool)

(assert (=> b!1531501 m!1414197))

(check-sat (not b!1531507) (not b!1531502) (not b!1531500) (not b!1531506) (not b!1531501) (not b!1531510) (not b!1531505) (not start!130516) (not b!1531504) (not b!1531508) (not b!1531509) (not b!1531503))
(check-sat)
