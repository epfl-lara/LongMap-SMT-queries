; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129616 () Bool)

(assert start!129616)

(declare-fun b!1521624 () Bool)

(declare-fun res!1040853 () Bool)

(declare-fun e!848589 () Bool)

(assert (=> b!1521624 (=> (not res!1040853) (not e!848589))))

(declare-datatypes ((array!101291 0))(
  ( (array!101292 (arr!48878 (Array (_ BitVec 32) (_ BitVec 64))) (size!49428 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101291)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521624 (= res!1040853 (validKeyInArray!0 (select (arr!48878 a!2804) j!70)))))

(declare-fun b!1521626 () Bool)

(declare-fun res!1040851 () Bool)

(declare-fun e!848588 () Bool)

(assert (=> b!1521626 (=> (not res!1040851) (not e!848588))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13043 0))(
  ( (MissingZero!13043 (index!54567 (_ BitVec 32))) (Found!13043 (index!54568 (_ BitVec 32))) (Intermediate!13043 (undefined!13855 Bool) (index!54569 (_ BitVec 32)) (x!136263 (_ BitVec 32))) (Undefined!13043) (MissingVacant!13043 (index!54570 (_ BitVec 32))) )
))
(declare-fun lt!659392 () SeekEntryResult!13043)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101291 (_ BitVec 32)) SeekEntryResult!13043)

(assert (=> b!1521626 (= res!1040851 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48878 a!2804) j!70) a!2804 mask!2512) lt!659392))))

(declare-fun b!1521627 () Bool)

(declare-fun res!1040847 () Bool)

(assert (=> b!1521627 (=> (not res!1040847) (not e!848589))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1521627 (= res!1040847 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49428 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49428 a!2804))))))

(declare-fun b!1521628 () Bool)

(declare-fun res!1040854 () Bool)

(assert (=> b!1521628 (=> (not res!1040854) (not e!848589))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1521628 (= res!1040854 (validKeyInArray!0 (select (arr!48878 a!2804) i!961)))))

(declare-fun b!1521629 () Bool)

(declare-fun res!1040852 () Bool)

(assert (=> b!1521629 (=> (not res!1040852) (not e!848589))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101291 (_ BitVec 32)) Bool)

(assert (=> b!1521629 (= res!1040852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521630 () Bool)

(declare-fun res!1040849 () Bool)

(assert (=> b!1521630 (=> (not res!1040849) (not e!848589))))

(declare-datatypes ((List!35361 0))(
  ( (Nil!35358) (Cons!35357 (h!36778 (_ BitVec 64)) (t!50055 List!35361)) )
))
(declare-fun arrayNoDuplicates!0 (array!101291 (_ BitVec 32) List!35361) Bool)

(assert (=> b!1521630 (= res!1040849 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35358))))

(declare-fun b!1521631 () Bool)

(declare-fun res!1040846 () Bool)

(assert (=> b!1521631 (=> (not res!1040846) (not e!848589))))

(assert (=> b!1521631 (= res!1040846 (and (= (size!49428 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49428 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49428 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521632 () Bool)

(assert (=> b!1521632 (= e!848589 e!848588)))

(declare-fun res!1040848 () Bool)

(assert (=> b!1521632 (=> (not res!1040848) (not e!848588))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521632 (= res!1040848 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48878 a!2804) j!70) mask!2512) (select (arr!48878 a!2804) j!70) a!2804 mask!2512) lt!659392))))

(assert (=> b!1521632 (= lt!659392 (Intermediate!13043 false resIndex!21 resX!21))))

(declare-fun b!1521625 () Bool)

(assert (=> b!1521625 (= e!848588 false)))

(declare-fun lt!659391 () SeekEntryResult!13043)

(assert (=> b!1521625 (= lt!659391 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48878 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48878 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101292 (store (arr!48878 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49428 a!2804)) mask!2512))))

(declare-fun res!1040850 () Bool)

(assert (=> start!129616 (=> (not res!1040850) (not e!848589))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129616 (= res!1040850 (validMask!0 mask!2512))))

(assert (=> start!129616 e!848589))

(assert (=> start!129616 true))

(declare-fun array_inv!37906 (array!101291) Bool)

(assert (=> start!129616 (array_inv!37906 a!2804)))

(assert (= (and start!129616 res!1040850) b!1521631))

(assert (= (and b!1521631 res!1040846) b!1521628))

(assert (= (and b!1521628 res!1040854) b!1521624))

(assert (= (and b!1521624 res!1040853) b!1521629))

(assert (= (and b!1521629 res!1040852) b!1521630))

(assert (= (and b!1521630 res!1040849) b!1521627))

(assert (= (and b!1521627 res!1040847) b!1521632))

(assert (= (and b!1521632 res!1040848) b!1521626))

(assert (= (and b!1521626 res!1040851) b!1521625))

(declare-fun m!1404719 () Bool)

(assert (=> b!1521629 m!1404719))

(declare-fun m!1404721 () Bool)

(assert (=> b!1521632 m!1404721))

(assert (=> b!1521632 m!1404721))

(declare-fun m!1404723 () Bool)

(assert (=> b!1521632 m!1404723))

(assert (=> b!1521632 m!1404723))

(assert (=> b!1521632 m!1404721))

(declare-fun m!1404725 () Bool)

(assert (=> b!1521632 m!1404725))

(declare-fun m!1404727 () Bool)

(assert (=> b!1521630 m!1404727))

(assert (=> b!1521624 m!1404721))

(assert (=> b!1521624 m!1404721))

(declare-fun m!1404729 () Bool)

(assert (=> b!1521624 m!1404729))

(declare-fun m!1404731 () Bool)

(assert (=> b!1521625 m!1404731))

(declare-fun m!1404733 () Bool)

(assert (=> b!1521625 m!1404733))

(assert (=> b!1521625 m!1404733))

(declare-fun m!1404735 () Bool)

(assert (=> b!1521625 m!1404735))

(assert (=> b!1521625 m!1404735))

(assert (=> b!1521625 m!1404733))

(declare-fun m!1404737 () Bool)

(assert (=> b!1521625 m!1404737))

(declare-fun m!1404739 () Bool)

(assert (=> b!1521628 m!1404739))

(assert (=> b!1521628 m!1404739))

(declare-fun m!1404741 () Bool)

(assert (=> b!1521628 m!1404741))

(declare-fun m!1404743 () Bool)

(assert (=> start!129616 m!1404743))

(declare-fun m!1404745 () Bool)

(assert (=> start!129616 m!1404745))

(assert (=> b!1521626 m!1404721))

(assert (=> b!1521626 m!1404721))

(declare-fun m!1404747 () Bool)

(assert (=> b!1521626 m!1404747))

(push 1)

