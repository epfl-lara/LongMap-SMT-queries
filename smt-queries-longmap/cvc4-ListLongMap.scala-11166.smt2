; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130542 () Bool)

(assert start!130542)

(declare-fun b!1532041 () Bool)

(declare-fun res!1049181 () Bool)

(declare-fun e!853636 () Bool)

(assert (=> b!1532041 (=> (not res!1049181) (not e!853636))))

(declare-datatypes ((array!101721 0))(
  ( (array!101722 (arr!49081 (Array (_ BitVec 32) (_ BitVec 64))) (size!49631 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101721)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532041 (= res!1049181 (validKeyInArray!0 (select (arr!49081 a!2804) j!70)))))

(declare-fun b!1532042 () Bool)

(declare-fun res!1049186 () Bool)

(assert (=> b!1532042 (=> (not res!1049186) (not e!853636))))

(declare-datatypes ((List!35564 0))(
  ( (Nil!35561) (Cons!35560 (h!37005 (_ BitVec 64)) (t!50258 List!35564)) )
))
(declare-fun arrayNoDuplicates!0 (array!101721 (_ BitVec 32) List!35564) Bool)

(assert (=> b!1532042 (= res!1049186 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35561))))

(declare-fun b!1532043 () Bool)

(declare-fun res!1049184 () Bool)

(declare-fun e!853633 () Bool)

(assert (=> b!1532043 (=> (not res!1049184) (not e!853633))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13246 0))(
  ( (MissingZero!13246 (index!55379 (_ BitVec 32))) (Found!13246 (index!55380 (_ BitVec 32))) (Intermediate!13246 (undefined!14058 Bool) (index!55381 (_ BitVec 32)) (x!137072 (_ BitVec 32))) (Undefined!13246) (MissingVacant!13246 (index!55382 (_ BitVec 32))) )
))
(declare-fun lt!663510 () SeekEntryResult!13246)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101721 (_ BitVec 32)) SeekEntryResult!13246)

(assert (=> b!1532043 (= res!1049184 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49081 a!2804) j!70) a!2804 mask!2512) lt!663510))))

(declare-fun b!1532044 () Bool)

(declare-fun res!1049191 () Bool)

(assert (=> b!1532044 (=> (not res!1049191) (not e!853636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101721 (_ BitVec 32)) Bool)

(assert (=> b!1532044 (= res!1049191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1532045 () Bool)

(declare-fun res!1049190 () Bool)

(assert (=> b!1532045 (=> (not res!1049190) (not e!853636))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1532045 (= res!1049190 (and (= (size!49631 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49631 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49631 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1532046 () Bool)

(declare-fun e!853631 () Bool)

(declare-fun e!853630 () Bool)

(assert (=> b!1532046 (= e!853631 e!853630)))

(declare-fun res!1049192 () Bool)

(assert (=> b!1532046 (=> res!1049192 e!853630)))

(declare-fun lt!663508 () (_ BitVec 32))

(assert (=> b!1532046 (= res!1049192 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!663508 #b00000000000000000000000000000000) (bvsge lt!663508 (size!49631 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1532046 (= lt!663508 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1532047 () Bool)

(declare-fun e!853635 () Bool)

(assert (=> b!1532047 (= e!853633 e!853635)))

(declare-fun res!1049188 () Bool)

(assert (=> b!1532047 (=> (not res!1049188) (not e!853635))))

(declare-fun lt!663507 () SeekEntryResult!13246)

(declare-fun lt!663509 () array!101721)

(declare-fun lt!663505 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1532047 (= res!1049188 (= lt!663507 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!663505 mask!2512) lt!663505 lt!663509 mask!2512)))))

(assert (=> b!1532047 (= lt!663505 (select (store (arr!49081 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1532047 (= lt!663509 (array!101722 (store (arr!49081 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49631 a!2804)))))

(declare-fun res!1049189 () Bool)

(assert (=> start!130542 (=> (not res!1049189) (not e!853636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130542 (= res!1049189 (validMask!0 mask!2512))))

(assert (=> start!130542 e!853636))

(assert (=> start!130542 true))

(declare-fun array_inv!38109 (array!101721) Bool)

(assert (=> start!130542 (array_inv!38109 a!2804)))

(declare-fun b!1532048 () Bool)

(assert (=> b!1532048 (= e!853630 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101721 (_ BitVec 32)) SeekEntryResult!13246)

(assert (=> b!1532048 (= (seekEntryOrOpen!0 (select (arr!49081 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!663505 lt!663509 mask!2512))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-datatypes ((Unit!51276 0))(
  ( (Unit!51277) )
))
(declare-fun lt!663511 () Unit!51276)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101721 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51276)

(assert (=> b!1532048 (= lt!663511 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!663508 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1532049 () Bool)

(declare-fun res!1049193 () Bool)

(assert (=> b!1532049 (=> (not res!1049193) (not e!853636))))

(assert (=> b!1532049 (= res!1049193 (validKeyInArray!0 (select (arr!49081 a!2804) i!961)))))

(declare-fun b!1532050 () Bool)

(assert (=> b!1532050 (= e!853635 (not e!853631))))

(declare-fun res!1049194 () Bool)

(assert (=> b!1532050 (=> res!1049194 e!853631)))

(assert (=> b!1532050 (= res!1049194 (or (not (= (select (arr!49081 a!2804) j!70) lt!663505)) (= x!534 resX!21)))))

(declare-fun e!853632 () Bool)

(assert (=> b!1532050 e!853632))

(declare-fun res!1049183 () Bool)

(assert (=> b!1532050 (=> (not res!1049183) (not e!853632))))

(assert (=> b!1532050 (= res!1049183 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!663506 () Unit!51276)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101721 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51276)

(assert (=> b!1532050 (= lt!663506 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1532051 () Bool)

(declare-fun res!1049182 () Bool)

(assert (=> b!1532051 (=> (not res!1049182) (not e!853636))))

(assert (=> b!1532051 (= res!1049182 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49631 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49631 a!2804))))))

(declare-fun b!1532052 () Bool)

(declare-fun res!1049187 () Bool)

(assert (=> b!1532052 (=> res!1049187 e!853630)))

(assert (=> b!1532052 (= res!1049187 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663508 (select (arr!49081 a!2804) j!70) a!2804 mask!2512) lt!663510)))))

(declare-fun b!1532053 () Bool)

(assert (=> b!1532053 (= e!853636 e!853633)))

(declare-fun res!1049185 () Bool)

(assert (=> b!1532053 (=> (not res!1049185) (not e!853633))))

(assert (=> b!1532053 (= res!1049185 (= lt!663507 lt!663510))))

(assert (=> b!1532053 (= lt!663510 (Intermediate!13246 false resIndex!21 resX!21))))

(assert (=> b!1532053 (= lt!663507 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49081 a!2804) j!70) mask!2512) (select (arr!49081 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1532054 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101721 (_ BitVec 32)) SeekEntryResult!13246)

(assert (=> b!1532054 (= e!853632 (= (seekEntry!0 (select (arr!49081 a!2804) j!70) a!2804 mask!2512) (Found!13246 j!70)))))

(assert (= (and start!130542 res!1049189) b!1532045))

(assert (= (and b!1532045 res!1049190) b!1532049))

(assert (= (and b!1532049 res!1049193) b!1532041))

(assert (= (and b!1532041 res!1049181) b!1532044))

(assert (= (and b!1532044 res!1049191) b!1532042))

(assert (= (and b!1532042 res!1049186) b!1532051))

(assert (= (and b!1532051 res!1049182) b!1532053))

(assert (= (and b!1532053 res!1049185) b!1532043))

(assert (= (and b!1532043 res!1049184) b!1532047))

(assert (= (and b!1532047 res!1049188) b!1532050))

(assert (= (and b!1532050 res!1049183) b!1532054))

(assert (= (and b!1532050 (not res!1049194)) b!1532046))

(assert (= (and b!1532046 (not res!1049192)) b!1532052))

(assert (= (and b!1532052 (not res!1049187)) b!1532048))

(declare-fun m!1414727 () Bool)

(assert (=> b!1532043 m!1414727))

(assert (=> b!1532043 m!1414727))

(declare-fun m!1414729 () Bool)

(assert (=> b!1532043 m!1414729))

(assert (=> b!1532052 m!1414727))

(assert (=> b!1532052 m!1414727))

(declare-fun m!1414731 () Bool)

(assert (=> b!1532052 m!1414731))

(assert (=> b!1532050 m!1414727))

(declare-fun m!1414733 () Bool)

(assert (=> b!1532050 m!1414733))

(declare-fun m!1414735 () Bool)

(assert (=> b!1532050 m!1414735))

(declare-fun m!1414737 () Bool)

(assert (=> b!1532042 m!1414737))

(assert (=> b!1532048 m!1414727))

(assert (=> b!1532048 m!1414727))

(declare-fun m!1414739 () Bool)

(assert (=> b!1532048 m!1414739))

(declare-fun m!1414741 () Bool)

(assert (=> b!1532048 m!1414741))

(declare-fun m!1414743 () Bool)

(assert (=> b!1532048 m!1414743))

(declare-fun m!1414745 () Bool)

(assert (=> b!1532047 m!1414745))

(assert (=> b!1532047 m!1414745))

(declare-fun m!1414747 () Bool)

(assert (=> b!1532047 m!1414747))

(declare-fun m!1414749 () Bool)

(assert (=> b!1532047 m!1414749))

(declare-fun m!1414751 () Bool)

(assert (=> b!1532047 m!1414751))

(declare-fun m!1414753 () Bool)

(assert (=> b!1532044 m!1414753))

(declare-fun m!1414755 () Bool)

(assert (=> b!1532049 m!1414755))

(assert (=> b!1532049 m!1414755))

(declare-fun m!1414757 () Bool)

(assert (=> b!1532049 m!1414757))

(assert (=> b!1532053 m!1414727))

(assert (=> b!1532053 m!1414727))

(declare-fun m!1414759 () Bool)

(assert (=> b!1532053 m!1414759))

(assert (=> b!1532053 m!1414759))

(assert (=> b!1532053 m!1414727))

(declare-fun m!1414761 () Bool)

(assert (=> b!1532053 m!1414761))

(declare-fun m!1414763 () Bool)

(assert (=> start!130542 m!1414763))

(declare-fun m!1414765 () Bool)

(assert (=> start!130542 m!1414765))

(assert (=> b!1532054 m!1414727))

(assert (=> b!1532054 m!1414727))

(declare-fun m!1414767 () Bool)

(assert (=> b!1532054 m!1414767))

(assert (=> b!1532041 m!1414727))

(assert (=> b!1532041 m!1414727))

(declare-fun m!1414769 () Bool)

(assert (=> b!1532041 m!1414769))

(declare-fun m!1414771 () Bool)

(assert (=> b!1532046 m!1414771))

(push 1)

(assert (not b!1532046))

(assert (not b!1532047))

(assert (not b!1532041))

(assert (not b!1532050))

(assert (not start!130542))

(assert (not b!1532042))

(assert (not b!1532043))

(assert (not b!1532053))

(assert (not b!1532052))

(assert (not b!1532054))

(assert (not b!1532048))

(assert (not b!1532044))

(assert (not b!1532049))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

