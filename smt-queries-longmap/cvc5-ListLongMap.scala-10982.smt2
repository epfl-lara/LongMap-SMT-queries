; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128592 () Bool)

(assert start!128592)

(declare-fun b!1507530 () Bool)

(declare-fun res!1027850 () Bool)

(declare-fun e!842241 () Bool)

(assert (=> b!1507530 (=> (not res!1027850) (not e!842241))))

(declare-datatypes ((array!100526 0))(
  ( (array!100527 (arr!48504 (Array (_ BitVec 32) (_ BitVec 64))) (size!49056 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100526)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100526 (_ BitVec 32)) Bool)

(assert (=> b!1507530 (= res!1027850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1507531 () Bool)

(declare-fun res!1027853 () Bool)

(assert (=> b!1507531 (=> (not res!1027853) (not e!842241))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1507531 (= res!1027853 (and (= (size!49056 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49056 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49056 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1507532 () Bool)

(declare-fun res!1027856 () Bool)

(assert (=> b!1507532 (=> (not res!1027856) (not e!842241))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507532 (= res!1027856 (validKeyInArray!0 (select (arr!48504 a!2804) i!961)))))

(declare-fun res!1027855 () Bool)

(assert (=> start!128592 (=> (not res!1027855) (not e!842241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128592 (= res!1027855 (validMask!0 mask!2512))))

(assert (=> start!128592 e!842241))

(assert (=> start!128592 true))

(declare-fun array_inv!37737 (array!100526) Bool)

(assert (=> start!128592 (array_inv!37737 a!2804)))

(declare-fun b!1507533 () Bool)

(declare-fun res!1027852 () Bool)

(assert (=> b!1507533 (=> (not res!1027852) (not e!842241))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1507533 (= res!1027852 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49056 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49056 a!2804))))))

(declare-fun b!1507534 () Bool)

(declare-fun res!1027851 () Bool)

(assert (=> b!1507534 (=> (not res!1027851) (not e!842241))))

(assert (=> b!1507534 (= res!1027851 (validKeyInArray!0 (select (arr!48504 a!2804) j!70)))))

(declare-fun b!1507535 () Bool)

(declare-fun res!1027849 () Bool)

(assert (=> b!1507535 (=> (not res!1027849) (not e!842241))))

(declare-datatypes ((SeekEntryResult!12698 0))(
  ( (MissingZero!12698 (index!53187 (_ BitVec 32))) (Found!12698 (index!53188 (_ BitVec 32))) (Intermediate!12698 (undefined!13510 Bool) (index!53189 (_ BitVec 32)) (x!134942 (_ BitVec 32))) (Undefined!12698) (MissingVacant!12698 (index!53190 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100526 (_ BitVec 32)) SeekEntryResult!12698)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507535 (= res!1027849 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48504 a!2804) j!70) mask!2512) (select (arr!48504 a!2804) j!70) a!2804 mask!2512) (Intermediate!12698 false resIndex!21 resX!21)))))

(declare-fun b!1507536 () Bool)

(assert (=> b!1507536 (= e!842241 false)))

(declare-fun lt!654201 () SeekEntryResult!12698)

(assert (=> b!1507536 (= lt!654201 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48504 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1507537 () Bool)

(declare-fun res!1027854 () Bool)

(assert (=> b!1507537 (=> (not res!1027854) (not e!842241))))

(declare-datatypes ((List!35065 0))(
  ( (Nil!35062) (Cons!35061 (h!36468 (_ BitVec 64)) (t!49751 List!35065)) )
))
(declare-fun arrayNoDuplicates!0 (array!100526 (_ BitVec 32) List!35065) Bool)

(assert (=> b!1507537 (= res!1027854 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35062))))

(assert (= (and start!128592 res!1027855) b!1507531))

(assert (= (and b!1507531 res!1027853) b!1507532))

(assert (= (and b!1507532 res!1027856) b!1507534))

(assert (= (and b!1507534 res!1027851) b!1507530))

(assert (= (and b!1507530 res!1027850) b!1507537))

(assert (= (and b!1507537 res!1027854) b!1507533))

(assert (= (and b!1507533 res!1027852) b!1507535))

(assert (= (and b!1507535 res!1027849) b!1507536))

(declare-fun m!1389589 () Bool)

(assert (=> b!1507536 m!1389589))

(assert (=> b!1507536 m!1389589))

(declare-fun m!1389591 () Bool)

(assert (=> b!1507536 m!1389591))

(declare-fun m!1389593 () Bool)

(assert (=> start!128592 m!1389593))

(declare-fun m!1389595 () Bool)

(assert (=> start!128592 m!1389595))

(declare-fun m!1389597 () Bool)

(assert (=> b!1507530 m!1389597))

(declare-fun m!1389599 () Bool)

(assert (=> b!1507537 m!1389599))

(assert (=> b!1507535 m!1389589))

(assert (=> b!1507535 m!1389589))

(declare-fun m!1389601 () Bool)

(assert (=> b!1507535 m!1389601))

(assert (=> b!1507535 m!1389601))

(assert (=> b!1507535 m!1389589))

(declare-fun m!1389603 () Bool)

(assert (=> b!1507535 m!1389603))

(assert (=> b!1507534 m!1389589))

(assert (=> b!1507534 m!1389589))

(declare-fun m!1389605 () Bool)

(assert (=> b!1507534 m!1389605))

(declare-fun m!1389607 () Bool)

(assert (=> b!1507532 m!1389607))

(assert (=> b!1507532 m!1389607))

(declare-fun m!1389609 () Bool)

(assert (=> b!1507532 m!1389609))

(push 1)

(assert (not b!1507534))

(assert (not b!1507532))

(assert (not b!1507530))

(assert (not start!128592))

(assert (not b!1507537))

(assert (not b!1507535))

(assert (not b!1507536))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

