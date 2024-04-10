; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129636 () Bool)

(assert start!129636)

(declare-fun b!1521899 () Bool)

(declare-fun e!848678 () Bool)

(declare-fun e!848679 () Bool)

(assert (=> b!1521899 (= e!848678 e!848679)))

(declare-fun res!1041126 () Bool)

(assert (=> b!1521899 (=> (not res!1041126) (not e!848679))))

(declare-datatypes ((SeekEntryResult!13053 0))(
  ( (MissingZero!13053 (index!54607 (_ BitVec 32))) (Found!13053 (index!54608 (_ BitVec 32))) (Intermediate!13053 (undefined!13865 Bool) (index!54609 (_ BitVec 32)) (x!136297 (_ BitVec 32))) (Undefined!13053) (MissingVacant!13053 (index!54610 (_ BitVec 32))) )
))
(declare-fun lt!659451 () SeekEntryResult!13053)

(declare-fun lt!659452 () SeekEntryResult!13053)

(assert (=> b!1521899 (= res!1041126 (= lt!659451 lt!659452))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1521899 (= lt!659452 (Intermediate!13053 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101311 0))(
  ( (array!101312 (arr!48888 (Array (_ BitVec 32) (_ BitVec 64))) (size!49438 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101311)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101311 (_ BitVec 32)) SeekEntryResult!13053)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521899 (= lt!659451 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48888 a!2804) j!70) mask!2512) (select (arr!48888 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1521900 () Bool)

(declare-fun res!1041129 () Bool)

(assert (=> b!1521900 (=> (not res!1041129) (not e!848678))))

(declare-datatypes ((List!35371 0))(
  ( (Nil!35368) (Cons!35367 (h!36788 (_ BitVec 64)) (t!50065 List!35371)) )
))
(declare-fun arrayNoDuplicates!0 (array!101311 (_ BitVec 32) List!35371) Bool)

(assert (=> b!1521900 (= res!1041129 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35368))))

(declare-fun b!1521901 () Bool)

(declare-fun res!1041130 () Bool)

(assert (=> b!1521901 (=> (not res!1041130) (not e!848678))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521901 (= res!1041130 (validKeyInArray!0 (select (arr!48888 a!2804) j!70)))))

(declare-fun b!1521902 () Bool)

(declare-fun res!1041124 () Bool)

(assert (=> b!1521902 (=> (not res!1041124) (not e!848678))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1521902 (= res!1041124 (and (= (size!49438 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49438 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49438 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521903 () Bool)

(assert (=> b!1521903 (= e!848679 (bvsgt #b00000000000000000000000000000000 (size!49438 a!2804)))))

(declare-fun b!1521904 () Bool)

(declare-fun res!1041127 () Bool)

(assert (=> b!1521904 (=> (not res!1041127) (not e!848678))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101311 (_ BitVec 32)) Bool)

(assert (=> b!1521904 (= res!1041127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1041125 () Bool)

(assert (=> start!129636 (=> (not res!1041125) (not e!848678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129636 (= res!1041125 (validMask!0 mask!2512))))

(assert (=> start!129636 e!848678))

(assert (=> start!129636 true))

(declare-fun array_inv!37916 (array!101311) Bool)

(assert (=> start!129636 (array_inv!37916 a!2804)))

(declare-fun b!1521905 () Bool)

(declare-fun res!1041123 () Bool)

(assert (=> b!1521905 (=> (not res!1041123) (not e!848679))))

(assert (=> b!1521905 (= res!1041123 (= lt!659451 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48888 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48888 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101312 (store (arr!48888 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49438 a!2804)) mask!2512)))))

(declare-fun b!1521906 () Bool)

(declare-fun res!1041122 () Bool)

(assert (=> b!1521906 (=> (not res!1041122) (not e!848678))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1521906 (= res!1041122 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49438 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49438 a!2804))))))

(declare-fun b!1521907 () Bool)

(declare-fun res!1041128 () Bool)

(assert (=> b!1521907 (=> (not res!1041128) (not e!848679))))

(assert (=> b!1521907 (= res!1041128 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48888 a!2804) j!70) a!2804 mask!2512) lt!659452))))

(declare-fun b!1521908 () Bool)

(declare-fun res!1041121 () Bool)

(assert (=> b!1521908 (=> (not res!1041121) (not e!848678))))

(assert (=> b!1521908 (= res!1041121 (validKeyInArray!0 (select (arr!48888 a!2804) i!961)))))

(assert (= (and start!129636 res!1041125) b!1521902))

(assert (= (and b!1521902 res!1041124) b!1521908))

(assert (= (and b!1521908 res!1041121) b!1521901))

(assert (= (and b!1521901 res!1041130) b!1521904))

(assert (= (and b!1521904 res!1041127) b!1521900))

(assert (= (and b!1521900 res!1041129) b!1521906))

(assert (= (and b!1521906 res!1041122) b!1521899))

(assert (= (and b!1521899 res!1041126) b!1521907))

(assert (= (and b!1521907 res!1041128) b!1521905))

(assert (= (and b!1521905 res!1041123) b!1521903))

(declare-fun m!1405019 () Bool)

(assert (=> b!1521904 m!1405019))

(declare-fun m!1405021 () Bool)

(assert (=> b!1521908 m!1405021))

(assert (=> b!1521908 m!1405021))

(declare-fun m!1405023 () Bool)

(assert (=> b!1521908 m!1405023))

(declare-fun m!1405025 () Bool)

(assert (=> b!1521905 m!1405025))

(declare-fun m!1405027 () Bool)

(assert (=> b!1521905 m!1405027))

(assert (=> b!1521905 m!1405027))

(declare-fun m!1405029 () Bool)

(assert (=> b!1521905 m!1405029))

(assert (=> b!1521905 m!1405029))

(assert (=> b!1521905 m!1405027))

(declare-fun m!1405031 () Bool)

(assert (=> b!1521905 m!1405031))

(declare-fun m!1405033 () Bool)

(assert (=> b!1521901 m!1405033))

(assert (=> b!1521901 m!1405033))

(declare-fun m!1405035 () Bool)

(assert (=> b!1521901 m!1405035))

(declare-fun m!1405037 () Bool)

(assert (=> start!129636 m!1405037))

(declare-fun m!1405039 () Bool)

(assert (=> start!129636 m!1405039))

(assert (=> b!1521899 m!1405033))

(assert (=> b!1521899 m!1405033))

(declare-fun m!1405041 () Bool)

(assert (=> b!1521899 m!1405041))

(assert (=> b!1521899 m!1405041))

(assert (=> b!1521899 m!1405033))

(declare-fun m!1405043 () Bool)

(assert (=> b!1521899 m!1405043))

(declare-fun m!1405045 () Bool)

(assert (=> b!1521900 m!1405045))

(assert (=> b!1521907 m!1405033))

(assert (=> b!1521907 m!1405033))

(declare-fun m!1405047 () Bool)

(assert (=> b!1521907 m!1405047))

(check-sat (not b!1521904) (not start!129636) (not b!1521907) (not b!1521908) (not b!1521901) (not b!1521905) (not b!1521899) (not b!1521900))
(check-sat)
