; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130546 () Bool)

(assert start!130546)

(declare-fun b!1532126 () Bool)

(declare-fun res!1049274 () Bool)

(declare-fun e!853672 () Bool)

(assert (=> b!1532126 (=> res!1049274 e!853672)))

(declare-datatypes ((SeekEntryResult!13248 0))(
  ( (MissingZero!13248 (index!55387 (_ BitVec 32))) (Found!13248 (index!55388 (_ BitVec 32))) (Intermediate!13248 (undefined!14060 Bool) (index!55389 (_ BitVec 32)) (x!137082 (_ BitVec 32))) (Undefined!13248) (MissingVacant!13248 (index!55390 (_ BitVec 32))) )
))
(declare-fun lt!663549 () SeekEntryResult!13248)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun lt!663550 () (_ BitVec 32))

(declare-datatypes ((array!101725 0))(
  ( (array!101726 (arr!49083 (Array (_ BitVec 32) (_ BitVec 64))) (size!49633 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101725)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101725 (_ BitVec 32)) SeekEntryResult!13248)

(assert (=> b!1532126 (= res!1049274 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663550 (select (arr!49083 a!2804) j!70) a!2804 mask!2512) lt!663549)))))

(declare-fun b!1532127 () Bool)

(declare-fun res!1049278 () Bool)

(declare-fun e!853676 () Bool)

(assert (=> b!1532127 (=> (not res!1049278) (not e!853676))))

(declare-datatypes ((List!35566 0))(
  ( (Nil!35563) (Cons!35562 (h!37007 (_ BitVec 64)) (t!50260 List!35566)) )
))
(declare-fun arrayNoDuplicates!0 (array!101725 (_ BitVec 32) List!35566) Bool)

(assert (=> b!1532127 (= res!1049278 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35563))))

(declare-fun b!1532128 () Bool)

(declare-fun res!1049273 () Bool)

(assert (=> b!1532128 (=> (not res!1049273) (not e!853676))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532128 (= res!1049273 (validKeyInArray!0 (select (arr!49083 a!2804) i!961)))))

(declare-fun b!1532129 () Bool)

(declare-fun res!1049271 () Bool)

(assert (=> b!1532129 (=> (not res!1049271) (not e!853676))))

(assert (=> b!1532129 (= res!1049271 (and (= (size!49633 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49633 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49633 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1532130 () Bool)

(declare-fun e!853673 () Bool)

(assert (=> b!1532130 (= e!853676 e!853673)))

(declare-fun res!1049267 () Bool)

(assert (=> b!1532130 (=> (not res!1049267) (not e!853673))))

(declare-fun lt!663553 () SeekEntryResult!13248)

(assert (=> b!1532130 (= res!1049267 (= lt!663553 lt!663549))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1532130 (= lt!663549 (Intermediate!13248 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1532130 (= lt!663553 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49083 a!2804) j!70) mask!2512) (select (arr!49083 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1532131 () Bool)

(declare-fun res!1049275 () Bool)

(assert (=> b!1532131 (=> (not res!1049275) (not e!853676))))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1532131 (= res!1049275 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49633 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49633 a!2804))))))

(declare-fun b!1532132 () Bool)

(declare-fun res!1049270 () Bool)

(assert (=> b!1532132 (=> (not res!1049270) (not e!853676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101725 (_ BitVec 32)) Bool)

(assert (=> b!1532132 (= res!1049270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1532133 () Bool)

(declare-fun res!1049276 () Bool)

(assert (=> b!1532133 (=> (not res!1049276) (not e!853673))))

(assert (=> b!1532133 (= res!1049276 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49083 a!2804) j!70) a!2804 mask!2512) lt!663549))))

(declare-fun b!1532134 () Bool)

(declare-fun e!853677 () Bool)

(assert (=> b!1532134 (= e!853677 e!853672)))

(declare-fun res!1049265 () Bool)

(assert (=> b!1532134 (=> res!1049265 e!853672)))

(assert (=> b!1532134 (= res!1049265 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!663550 #b00000000000000000000000000000000) (bvsge lt!663550 (size!49633 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1532134 (= lt!663550 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun res!1049268 () Bool)

(assert (=> start!130546 (=> (not res!1049268) (not e!853676))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130546 (= res!1049268 (validMask!0 mask!2512))))

(assert (=> start!130546 e!853676))

(assert (=> start!130546 true))

(declare-fun array_inv!38111 (array!101725) Bool)

(assert (=> start!130546 (array_inv!38111 a!2804)))

(declare-fun b!1532125 () Bool)

(declare-fun res!1049272 () Bool)

(assert (=> b!1532125 (=> (not res!1049272) (not e!853676))))

(assert (=> b!1532125 (= res!1049272 (validKeyInArray!0 (select (arr!49083 a!2804) j!70)))))

(declare-fun b!1532135 () Bool)

(declare-fun e!853678 () Bool)

(assert (=> b!1532135 (= e!853678 (not e!853677))))

(declare-fun res!1049269 () Bool)

(assert (=> b!1532135 (=> res!1049269 e!853677)))

(declare-fun lt!663547 () (_ BitVec 64))

(assert (=> b!1532135 (= res!1049269 (or (not (= (select (arr!49083 a!2804) j!70) lt!663547)) (= x!534 resX!21)))))

(declare-fun e!853675 () Bool)

(assert (=> b!1532135 e!853675))

(declare-fun res!1049266 () Bool)

(assert (=> b!1532135 (=> (not res!1049266) (not e!853675))))

(assert (=> b!1532135 (= res!1049266 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51280 0))(
  ( (Unit!51281) )
))
(declare-fun lt!663552 () Unit!51280)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101725 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51280)

(assert (=> b!1532135 (= lt!663552 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1532136 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101725 (_ BitVec 32)) SeekEntryResult!13248)

(assert (=> b!1532136 (= e!853675 (= (seekEntry!0 (select (arr!49083 a!2804) j!70) a!2804 mask!2512) (Found!13248 j!70)))))

(declare-fun b!1532137 () Bool)

(assert (=> b!1532137 (= e!853672 true)))

(declare-fun lt!663551 () array!101725)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101725 (_ BitVec 32)) SeekEntryResult!13248)

(assert (=> b!1532137 (= (seekEntryOrOpen!0 (select (arr!49083 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!663547 lt!663551 mask!2512))))

(declare-fun lt!663548 () Unit!51280)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101725 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51280)

(assert (=> b!1532137 (= lt!663548 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!663550 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1532138 () Bool)

(assert (=> b!1532138 (= e!853673 e!853678)))

(declare-fun res!1049277 () Bool)

(assert (=> b!1532138 (=> (not res!1049277) (not e!853678))))

(assert (=> b!1532138 (= res!1049277 (= lt!663553 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!663547 mask!2512) lt!663547 lt!663551 mask!2512)))))

(assert (=> b!1532138 (= lt!663547 (select (store (arr!49083 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1532138 (= lt!663551 (array!101726 (store (arr!49083 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49633 a!2804)))))

(assert (= (and start!130546 res!1049268) b!1532129))

(assert (= (and b!1532129 res!1049271) b!1532128))

(assert (= (and b!1532128 res!1049273) b!1532125))

(assert (= (and b!1532125 res!1049272) b!1532132))

(assert (= (and b!1532132 res!1049270) b!1532127))

(assert (= (and b!1532127 res!1049278) b!1532131))

(assert (= (and b!1532131 res!1049275) b!1532130))

(assert (= (and b!1532130 res!1049267) b!1532133))

(assert (= (and b!1532133 res!1049276) b!1532138))

(assert (= (and b!1532138 res!1049277) b!1532135))

(assert (= (and b!1532135 res!1049266) b!1532136))

(assert (= (and b!1532135 (not res!1049269)) b!1532134))

(assert (= (and b!1532134 (not res!1049265)) b!1532126))

(assert (= (and b!1532126 (not res!1049274)) b!1532137))

(declare-fun m!1414819 () Bool)

(assert (=> b!1532130 m!1414819))

(assert (=> b!1532130 m!1414819))

(declare-fun m!1414821 () Bool)

(assert (=> b!1532130 m!1414821))

(assert (=> b!1532130 m!1414821))

(assert (=> b!1532130 m!1414819))

(declare-fun m!1414823 () Bool)

(assert (=> b!1532130 m!1414823))

(declare-fun m!1414825 () Bool)

(assert (=> b!1532127 m!1414825))

(declare-fun m!1414827 () Bool)

(assert (=> b!1532128 m!1414827))

(assert (=> b!1532128 m!1414827))

(declare-fun m!1414829 () Bool)

(assert (=> b!1532128 m!1414829))

(assert (=> b!1532136 m!1414819))

(assert (=> b!1532136 m!1414819))

(declare-fun m!1414831 () Bool)

(assert (=> b!1532136 m!1414831))

(assert (=> b!1532133 m!1414819))

(assert (=> b!1532133 m!1414819))

(declare-fun m!1414833 () Bool)

(assert (=> b!1532133 m!1414833))

(declare-fun m!1414835 () Bool)

(assert (=> b!1532132 m!1414835))

(assert (=> b!1532126 m!1414819))

(assert (=> b!1532126 m!1414819))

(declare-fun m!1414837 () Bool)

(assert (=> b!1532126 m!1414837))

(assert (=> b!1532125 m!1414819))

(assert (=> b!1532125 m!1414819))

(declare-fun m!1414839 () Bool)

(assert (=> b!1532125 m!1414839))

(assert (=> b!1532135 m!1414819))

(declare-fun m!1414841 () Bool)

(assert (=> b!1532135 m!1414841))

(declare-fun m!1414843 () Bool)

(assert (=> b!1532135 m!1414843))

(assert (=> b!1532137 m!1414819))

(assert (=> b!1532137 m!1414819))

(declare-fun m!1414845 () Bool)

(assert (=> b!1532137 m!1414845))

(declare-fun m!1414847 () Bool)

(assert (=> b!1532137 m!1414847))

(declare-fun m!1414849 () Bool)

(assert (=> b!1532137 m!1414849))

(declare-fun m!1414851 () Bool)

(assert (=> b!1532138 m!1414851))

(assert (=> b!1532138 m!1414851))

(declare-fun m!1414853 () Bool)

(assert (=> b!1532138 m!1414853))

(declare-fun m!1414855 () Bool)

(assert (=> b!1532138 m!1414855))

(declare-fun m!1414857 () Bool)

(assert (=> b!1532138 m!1414857))

(declare-fun m!1414859 () Bool)

(assert (=> b!1532134 m!1414859))

(declare-fun m!1414861 () Bool)

(assert (=> start!130546 m!1414861))

(declare-fun m!1414863 () Bool)

(assert (=> start!130546 m!1414863))

(check-sat (not b!1532136) (not b!1532133) (not b!1532132) (not b!1532138) (not b!1532134) (not start!130546) (not b!1532137) (not b!1532130) (not b!1532135) (not b!1532128) (not b!1532125) (not b!1532127) (not b!1532126))
(check-sat)
