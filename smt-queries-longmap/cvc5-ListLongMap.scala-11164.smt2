; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130526 () Bool)

(assert start!130526)

(declare-fun b!1531705 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101705 0))(
  ( (array!101706 (arr!49073 (Array (_ BitVec 32) (_ BitVec 64))) (size!49623 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101705)

(declare-fun e!853468 () Bool)

(declare-datatypes ((SeekEntryResult!13238 0))(
  ( (MissingZero!13238 (index!55347 (_ BitVec 32))) (Found!13238 (index!55348 (_ BitVec 32))) (Intermediate!13238 (undefined!14050 Bool) (index!55349 (_ BitVec 32)) (x!137048 (_ BitVec 32))) (Undefined!13238) (MissingVacant!13238 (index!55350 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101705 (_ BitVec 32)) SeekEntryResult!13238)

(assert (=> b!1531705 (= e!853468 (= (seekEntry!0 (select (arr!49073 a!2804) j!70) a!2804 mask!2512) (Found!13238 j!70)))))

(declare-fun b!1531706 () Bool)

(declare-fun e!853463 () Bool)

(declare-fun e!853466 () Bool)

(assert (=> b!1531706 (= e!853463 e!853466)))

(declare-fun res!1048845 () Bool)

(assert (=> b!1531706 (=> res!1048845 e!853466)))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!663337 () (_ BitVec 32))

(assert (=> b!1531706 (= res!1048845 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!663337 #b00000000000000000000000000000000) (bvsge lt!663337 (size!49623 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531706 (= lt!663337 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1531707 () Bool)

(declare-fun e!853465 () Bool)

(declare-fun e!853467 () Bool)

(assert (=> b!1531707 (= e!853465 e!853467)))

(declare-fun res!1048857 () Bool)

(assert (=> b!1531707 (=> (not res!1048857) (not e!853467))))

(declare-fun lt!663341 () SeekEntryResult!13238)

(declare-fun lt!663338 () array!101705)

(declare-fun lt!663343 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101705 (_ BitVec 32)) SeekEntryResult!13238)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531707 (= res!1048857 (= lt!663341 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!663343 mask!2512) lt!663343 lt!663338 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1531707 (= lt!663343 (select (store (arr!49073 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1531707 (= lt!663338 (array!101706 (store (arr!49073 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49623 a!2804)))))

(declare-fun res!1048847 () Bool)

(declare-fun e!853464 () Bool)

(assert (=> start!130526 (=> (not res!1048847) (not e!853464))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130526 (= res!1048847 (validMask!0 mask!2512))))

(assert (=> start!130526 e!853464))

(assert (=> start!130526 true))

(declare-fun array_inv!38101 (array!101705) Bool)

(assert (=> start!130526 (array_inv!38101 a!2804)))

(declare-fun b!1531708 () Bool)

(declare-fun res!1048852 () Bool)

(assert (=> b!1531708 (=> (not res!1048852) (not e!853464))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101705 (_ BitVec 32)) Bool)

(assert (=> b!1531708 (= res!1048852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1531709 () Bool)

(declare-fun res!1048858 () Bool)

(assert (=> b!1531709 (=> res!1048858 e!853466)))

(declare-fun lt!663339 () SeekEntryResult!13238)

(assert (=> b!1531709 (= res!1048858 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663337 (select (arr!49073 a!2804) j!70) a!2804 mask!2512) lt!663339)))))

(declare-fun b!1531710 () Bool)

(assert (=> b!1531710 (= e!853466 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101705 (_ BitVec 32)) SeekEntryResult!13238)

(assert (=> b!1531710 (= (seekEntryOrOpen!0 (select (arr!49073 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!663343 lt!663338 mask!2512))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-datatypes ((Unit!51260 0))(
  ( (Unit!51261) )
))
(declare-fun lt!663342 () Unit!51260)

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101705 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51260)

(assert (=> b!1531710 (= lt!663342 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!663337 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1531711 () Bool)

(assert (=> b!1531711 (= e!853464 e!853465)))

(declare-fun res!1048849 () Bool)

(assert (=> b!1531711 (=> (not res!1048849) (not e!853465))))

(assert (=> b!1531711 (= res!1048849 (= lt!663341 lt!663339))))

(assert (=> b!1531711 (= lt!663339 (Intermediate!13238 false resIndex!21 resX!21))))

(assert (=> b!1531711 (= lt!663341 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49073 a!2804) j!70) mask!2512) (select (arr!49073 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531712 () Bool)

(declare-fun res!1048850 () Bool)

(assert (=> b!1531712 (=> (not res!1048850) (not e!853464))))

(declare-datatypes ((List!35556 0))(
  ( (Nil!35553) (Cons!35552 (h!36997 (_ BitVec 64)) (t!50250 List!35556)) )
))
(declare-fun arrayNoDuplicates!0 (array!101705 (_ BitVec 32) List!35556) Bool)

(assert (=> b!1531712 (= res!1048850 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35553))))

(declare-fun b!1531713 () Bool)

(declare-fun res!1048853 () Bool)

(assert (=> b!1531713 (=> (not res!1048853) (not e!853464))))

(assert (=> b!1531713 (= res!1048853 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49623 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49623 a!2804))))))

(declare-fun b!1531714 () Bool)

(declare-fun res!1048851 () Bool)

(assert (=> b!1531714 (=> (not res!1048851) (not e!853464))))

(assert (=> b!1531714 (= res!1048851 (and (= (size!49623 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49623 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49623 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1531715 () Bool)

(declare-fun res!1048856 () Bool)

(assert (=> b!1531715 (=> (not res!1048856) (not e!853464))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1531715 (= res!1048856 (validKeyInArray!0 (select (arr!49073 a!2804) j!70)))))

(declare-fun b!1531716 () Bool)

(declare-fun res!1048848 () Bool)

(assert (=> b!1531716 (=> (not res!1048848) (not e!853465))))

(assert (=> b!1531716 (= res!1048848 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49073 a!2804) j!70) a!2804 mask!2512) lt!663339))))

(declare-fun b!1531717 () Bool)

(assert (=> b!1531717 (= e!853467 (not e!853463))))

(declare-fun res!1048846 () Bool)

(assert (=> b!1531717 (=> res!1048846 e!853463)))

(assert (=> b!1531717 (= res!1048846 (or (not (= (select (arr!49073 a!2804) j!70) lt!663343)) (= x!534 resX!21)))))

(assert (=> b!1531717 e!853468))

(declare-fun res!1048854 () Bool)

(assert (=> b!1531717 (=> (not res!1048854) (not e!853468))))

(assert (=> b!1531717 (= res!1048854 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!663340 () Unit!51260)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101705 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51260)

(assert (=> b!1531717 (= lt!663340 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1531718 () Bool)

(declare-fun res!1048855 () Bool)

(assert (=> b!1531718 (=> (not res!1048855) (not e!853464))))

(assert (=> b!1531718 (= res!1048855 (validKeyInArray!0 (select (arr!49073 a!2804) i!961)))))

(assert (= (and start!130526 res!1048847) b!1531714))

(assert (= (and b!1531714 res!1048851) b!1531718))

(assert (= (and b!1531718 res!1048855) b!1531715))

(assert (= (and b!1531715 res!1048856) b!1531708))

(assert (= (and b!1531708 res!1048852) b!1531712))

(assert (= (and b!1531712 res!1048850) b!1531713))

(assert (= (and b!1531713 res!1048853) b!1531711))

(assert (= (and b!1531711 res!1048849) b!1531716))

(assert (= (and b!1531716 res!1048848) b!1531707))

(assert (= (and b!1531707 res!1048857) b!1531717))

(assert (= (and b!1531717 res!1048854) b!1531705))

(assert (= (and b!1531717 (not res!1048846)) b!1531706))

(assert (= (and b!1531706 (not res!1048845)) b!1531709))

(assert (= (and b!1531709 (not res!1048858)) b!1531710))

(declare-fun m!1414359 () Bool)

(assert (=> b!1531707 m!1414359))

(assert (=> b!1531707 m!1414359))

(declare-fun m!1414361 () Bool)

(assert (=> b!1531707 m!1414361))

(declare-fun m!1414363 () Bool)

(assert (=> b!1531707 m!1414363))

(declare-fun m!1414365 () Bool)

(assert (=> b!1531707 m!1414365))

(declare-fun m!1414367 () Bool)

(assert (=> b!1531706 m!1414367))

(declare-fun m!1414369 () Bool)

(assert (=> b!1531708 m!1414369))

(declare-fun m!1414371 () Bool)

(assert (=> b!1531705 m!1414371))

(assert (=> b!1531705 m!1414371))

(declare-fun m!1414373 () Bool)

(assert (=> b!1531705 m!1414373))

(assert (=> b!1531717 m!1414371))

(declare-fun m!1414375 () Bool)

(assert (=> b!1531717 m!1414375))

(declare-fun m!1414377 () Bool)

(assert (=> b!1531717 m!1414377))

(assert (=> b!1531715 m!1414371))

(assert (=> b!1531715 m!1414371))

(declare-fun m!1414379 () Bool)

(assert (=> b!1531715 m!1414379))

(assert (=> b!1531716 m!1414371))

(assert (=> b!1531716 m!1414371))

(declare-fun m!1414381 () Bool)

(assert (=> b!1531716 m!1414381))

(assert (=> b!1531711 m!1414371))

(assert (=> b!1531711 m!1414371))

(declare-fun m!1414383 () Bool)

(assert (=> b!1531711 m!1414383))

(assert (=> b!1531711 m!1414383))

(assert (=> b!1531711 m!1414371))

(declare-fun m!1414385 () Bool)

(assert (=> b!1531711 m!1414385))

(declare-fun m!1414387 () Bool)

(assert (=> start!130526 m!1414387))

(declare-fun m!1414389 () Bool)

(assert (=> start!130526 m!1414389))

(declare-fun m!1414391 () Bool)

(assert (=> b!1531712 m!1414391))

(assert (=> b!1531710 m!1414371))

(assert (=> b!1531710 m!1414371))

(declare-fun m!1414393 () Bool)

(assert (=> b!1531710 m!1414393))

(declare-fun m!1414395 () Bool)

(assert (=> b!1531710 m!1414395))

(declare-fun m!1414397 () Bool)

(assert (=> b!1531710 m!1414397))

(declare-fun m!1414399 () Bool)

(assert (=> b!1531718 m!1414399))

(assert (=> b!1531718 m!1414399))

(declare-fun m!1414401 () Bool)

(assert (=> b!1531718 m!1414401))

(assert (=> b!1531709 m!1414371))

(assert (=> b!1531709 m!1414371))

(declare-fun m!1414403 () Bool)

(assert (=> b!1531709 m!1414403))

(push 1)

