; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129612 () Bool)

(assert start!129612)

(declare-fun b!1521570 () Bool)

(declare-fun res!1040798 () Bool)

(declare-fun e!848572 () Bool)

(assert (=> b!1521570 (=> (not res!1040798) (not e!848572))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13041 0))(
  ( (MissingZero!13041 (index!54559 (_ BitVec 32))) (Found!13041 (index!54560 (_ BitVec 32))) (Intermediate!13041 (undefined!13853 Bool) (index!54561 (_ BitVec 32)) (x!136253 (_ BitVec 32))) (Undefined!13041) (MissingVacant!13041 (index!54562 (_ BitVec 32))) )
))
(declare-fun lt!659380 () SeekEntryResult!13041)

(declare-datatypes ((array!101287 0))(
  ( (array!101288 (arr!48876 (Array (_ BitVec 32) (_ BitVec 64))) (size!49426 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101287)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101287 (_ BitVec 32)) SeekEntryResult!13041)

(assert (=> b!1521570 (= res!1040798 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48876 a!2804) j!70) a!2804 mask!2512) lt!659380))))

(declare-fun b!1521571 () Bool)

(declare-fun res!1040800 () Bool)

(declare-fun e!848570 () Bool)

(assert (=> b!1521571 (=> (not res!1040800) (not e!848570))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521571 (= res!1040800 (validKeyInArray!0 (select (arr!48876 a!2804) j!70)))))

(declare-fun res!1040794 () Bool)

(assert (=> start!129612 (=> (not res!1040794) (not e!848570))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129612 (= res!1040794 (validMask!0 mask!2512))))

(assert (=> start!129612 e!848570))

(assert (=> start!129612 true))

(declare-fun array_inv!37904 (array!101287) Bool)

(assert (=> start!129612 (array_inv!37904 a!2804)))

(declare-fun b!1521572 () Bool)

(declare-fun res!1040795 () Bool)

(assert (=> b!1521572 (=> (not res!1040795) (not e!848570))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1521572 (= res!1040795 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49426 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49426 a!2804))))))

(declare-fun b!1521573 () Bool)

(declare-fun res!1040792 () Bool)

(assert (=> b!1521573 (=> (not res!1040792) (not e!848570))))

(declare-datatypes ((List!35359 0))(
  ( (Nil!35356) (Cons!35355 (h!36776 (_ BitVec 64)) (t!50053 List!35359)) )
))
(declare-fun arrayNoDuplicates!0 (array!101287 (_ BitVec 32) List!35359) Bool)

(assert (=> b!1521573 (= res!1040792 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35356))))

(declare-fun b!1521574 () Bool)

(declare-fun res!1040796 () Bool)

(assert (=> b!1521574 (=> (not res!1040796) (not e!848570))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1521574 (= res!1040796 (and (= (size!49426 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49426 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49426 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521575 () Bool)

(assert (=> b!1521575 (= e!848570 e!848572)))

(declare-fun res!1040797 () Bool)

(assert (=> b!1521575 (=> (not res!1040797) (not e!848572))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521575 (= res!1040797 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48876 a!2804) j!70) mask!2512) (select (arr!48876 a!2804) j!70) a!2804 mask!2512) lt!659380))))

(assert (=> b!1521575 (= lt!659380 (Intermediate!13041 false resIndex!21 resX!21))))

(declare-fun b!1521576 () Bool)

(declare-fun res!1040793 () Bool)

(assert (=> b!1521576 (=> (not res!1040793) (not e!848570))))

(assert (=> b!1521576 (= res!1040793 (validKeyInArray!0 (select (arr!48876 a!2804) i!961)))))

(declare-fun b!1521577 () Bool)

(declare-fun res!1040799 () Bool)

(assert (=> b!1521577 (=> (not res!1040799) (not e!848570))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101287 (_ BitVec 32)) Bool)

(assert (=> b!1521577 (= res!1040799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521578 () Bool)

(assert (=> b!1521578 (= e!848572 false)))

(declare-fun lt!659379 () (_ BitVec 32))

(assert (=> b!1521578 (= lt!659379 (toIndex!0 (select (store (arr!48876 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(assert (= (and start!129612 res!1040794) b!1521574))

(assert (= (and b!1521574 res!1040796) b!1521576))

(assert (= (and b!1521576 res!1040793) b!1521571))

(assert (= (and b!1521571 res!1040800) b!1521577))

(assert (= (and b!1521577 res!1040799) b!1521573))

(assert (= (and b!1521573 res!1040792) b!1521572))

(assert (= (and b!1521572 res!1040795) b!1521575))

(assert (= (and b!1521575 res!1040797) b!1521570))

(assert (= (and b!1521570 res!1040798) b!1521578))

(declare-fun m!1404663 () Bool)

(assert (=> b!1521576 m!1404663))

(assert (=> b!1521576 m!1404663))

(declare-fun m!1404665 () Bool)

(assert (=> b!1521576 m!1404665))

(declare-fun m!1404667 () Bool)

(assert (=> b!1521575 m!1404667))

(assert (=> b!1521575 m!1404667))

(declare-fun m!1404669 () Bool)

(assert (=> b!1521575 m!1404669))

(assert (=> b!1521575 m!1404669))

(assert (=> b!1521575 m!1404667))

(declare-fun m!1404671 () Bool)

(assert (=> b!1521575 m!1404671))

(assert (=> b!1521570 m!1404667))

(assert (=> b!1521570 m!1404667))

(declare-fun m!1404673 () Bool)

(assert (=> b!1521570 m!1404673))

(assert (=> b!1521571 m!1404667))

(assert (=> b!1521571 m!1404667))

(declare-fun m!1404675 () Bool)

(assert (=> b!1521571 m!1404675))

(declare-fun m!1404677 () Bool)

(assert (=> b!1521577 m!1404677))

(declare-fun m!1404679 () Bool)

(assert (=> b!1521573 m!1404679))

(declare-fun m!1404681 () Bool)

(assert (=> start!129612 m!1404681))

(declare-fun m!1404683 () Bool)

(assert (=> start!129612 m!1404683))

(declare-fun m!1404685 () Bool)

(assert (=> b!1521578 m!1404685))

(declare-fun m!1404687 () Bool)

(assert (=> b!1521578 m!1404687))

(assert (=> b!1521578 m!1404687))

(declare-fun m!1404689 () Bool)

(assert (=> b!1521578 m!1404689))

(check-sat (not b!1521573) (not b!1521578) (not b!1521571) (not b!1521570) (not start!129612) (not b!1521577) (not b!1521575) (not b!1521576))
(check-sat)
