; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129542 () Bool)

(assert start!129542)

(declare-fun b!1518496 () Bool)

(declare-fun e!847440 () Bool)

(declare-fun e!847436 () Bool)

(assert (=> b!1518496 (= e!847440 e!847436)))

(declare-fun res!1037043 () Bool)

(assert (=> b!1518496 (=> (not res!1037043) (not e!847436))))

(declare-datatypes ((SeekEntryResult!12875 0))(
  ( (MissingZero!12875 (index!53895 (_ BitVec 32))) (Found!12875 (index!53896 (_ BitVec 32))) (Intermediate!12875 (undefined!13687 Bool) (index!53897 (_ BitVec 32)) (x!135796 (_ BitVec 32))) (Undefined!12875) (MissingVacant!12875 (index!53898 (_ BitVec 32))) )
))
(declare-fun lt!658179 () SeekEntryResult!12875)

(declare-fun lt!658178 () SeekEntryResult!12875)

(assert (=> b!1518496 (= res!1037043 (= lt!658179 lt!658178))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1518496 (= lt!658178 (Intermediate!12875 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101161 0))(
  ( (array!101162 (arr!48811 (Array (_ BitVec 32) (_ BitVec 64))) (size!49362 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101161)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101161 (_ BitVec 32)) SeekEntryResult!12875)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518496 (= lt!658179 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48811 a!2804) j!70) mask!2512) (select (arr!48811 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518497 () Bool)

(declare-fun res!1037040 () Bool)

(assert (=> b!1518497 (=> (not res!1037040) (not e!847440))))

(declare-datatypes ((List!35281 0))(
  ( (Nil!35278) (Cons!35277 (h!36707 (_ BitVec 64)) (t!49967 List!35281)) )
))
(declare-fun arrayNoDuplicates!0 (array!101161 (_ BitVec 32) List!35281) Bool)

(assert (=> b!1518497 (= res!1037040 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35278))))

(declare-fun b!1518498 () Bool)

(declare-fun res!1037044 () Bool)

(assert (=> b!1518498 (=> (not res!1037044) (not e!847440))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1518498 (= res!1037044 (and (= (size!49362 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49362 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49362 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518499 () Bool)

(declare-fun res!1037051 () Bool)

(assert (=> b!1518499 (=> (not res!1037051) (not e!847440))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101161 (_ BitVec 32)) Bool)

(assert (=> b!1518499 (= res!1037051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518500 () Bool)

(declare-fun res!1037047 () Bool)

(assert (=> b!1518500 (=> (not res!1037047) (not e!847440))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518500 (= res!1037047 (validKeyInArray!0 (select (arr!48811 a!2804) j!70)))))

(declare-fun b!1518502 () Bool)

(declare-fun res!1037049 () Bool)

(assert (=> b!1518502 (=> (not res!1037049) (not e!847440))))

(assert (=> b!1518502 (= res!1037049 (validKeyInArray!0 (select (arr!48811 a!2804) i!961)))))

(declare-fun e!847439 () Bool)

(declare-fun b!1518503 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101161 (_ BitVec 32)) SeekEntryResult!12875)

(assert (=> b!1518503 (= e!847439 (= (seekEntry!0 (select (arr!48811 a!2804) j!70) a!2804 mask!2512) (Found!12875 j!70)))))

(declare-fun b!1518504 () Bool)

(declare-fun e!847435 () Bool)

(assert (=> b!1518504 (= e!847436 (not e!847435))))

(declare-fun res!1037050 () Bool)

(assert (=> b!1518504 (=> res!1037050 e!847435)))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1518504 (= res!1037050 (or (not (= (select (arr!48811 a!2804) j!70) (select (store (arr!48811 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1518504 e!847439))

(declare-fun res!1037041 () Bool)

(assert (=> b!1518504 (=> (not res!1037041) (not e!847439))))

(assert (=> b!1518504 (= res!1037041 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50653 0))(
  ( (Unit!50654) )
))
(declare-fun lt!658177 () Unit!50653)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101161 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50653)

(assert (=> b!1518504 (= lt!658177 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518505 () Bool)

(declare-fun res!1037046 () Bool)

(assert (=> b!1518505 (=> (not res!1037046) (not e!847436))))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1518505 (= res!1037046 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48811 a!2804) j!70) a!2804 mask!2512) lt!658178))))

(declare-fun b!1518506 () Bool)

(declare-fun res!1037048 () Bool)

(assert (=> b!1518506 (=> (not res!1037048) (not e!847440))))

(assert (=> b!1518506 (= res!1037048 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49362 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49362 a!2804))))))

(declare-fun b!1518507 () Bool)

(declare-fun e!847438 () Bool)

(assert (=> b!1518507 (= e!847435 e!847438)))

(declare-fun res!1037039 () Bool)

(assert (=> b!1518507 (=> res!1037039 e!847438)))

(declare-fun lt!658176 () (_ BitVec 32))

(assert (=> b!1518507 (= res!1037039 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658176 #b00000000000000000000000000000000) (bvsge lt!658176 (size!49362 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518507 (= lt!658176 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1518508 () Bool)

(assert (=> b!1518508 (= e!847438 true)))

(declare-fun lt!658180 () SeekEntryResult!12875)

(assert (=> b!1518508 (= lt!658180 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658176 (select (arr!48811 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518501 () Bool)

(declare-fun res!1037045 () Bool)

(assert (=> b!1518501 (=> (not res!1037045) (not e!847436))))

(assert (=> b!1518501 (= res!1037045 (= lt!658179 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48811 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48811 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101162 (store (arr!48811 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49362 a!2804)) mask!2512)))))

(declare-fun res!1037042 () Bool)

(assert (=> start!129542 (=> (not res!1037042) (not e!847440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129542 (= res!1037042 (validMask!0 mask!2512))))

(assert (=> start!129542 e!847440))

(assert (=> start!129542 true))

(declare-fun array_inv!38092 (array!101161) Bool)

(assert (=> start!129542 (array_inv!38092 a!2804)))

(assert (= (and start!129542 res!1037042) b!1518498))

(assert (= (and b!1518498 res!1037044) b!1518502))

(assert (= (and b!1518502 res!1037049) b!1518500))

(assert (= (and b!1518500 res!1037047) b!1518499))

(assert (= (and b!1518499 res!1037051) b!1518497))

(assert (= (and b!1518497 res!1037040) b!1518506))

(assert (= (and b!1518506 res!1037048) b!1518496))

(assert (= (and b!1518496 res!1037043) b!1518505))

(assert (= (and b!1518505 res!1037046) b!1518501))

(assert (= (and b!1518501 res!1037045) b!1518504))

(assert (= (and b!1518504 res!1037041) b!1518503))

(assert (= (and b!1518504 (not res!1037050)) b!1518507))

(assert (= (and b!1518507 (not res!1037039)) b!1518508))

(declare-fun m!1401609 () Bool)

(assert (=> b!1518503 m!1401609))

(assert (=> b!1518503 m!1401609))

(declare-fun m!1401611 () Bool)

(assert (=> b!1518503 m!1401611))

(declare-fun m!1401613 () Bool)

(assert (=> start!129542 m!1401613))

(declare-fun m!1401615 () Bool)

(assert (=> start!129542 m!1401615))

(assert (=> b!1518505 m!1401609))

(assert (=> b!1518505 m!1401609))

(declare-fun m!1401617 () Bool)

(assert (=> b!1518505 m!1401617))

(assert (=> b!1518496 m!1401609))

(assert (=> b!1518496 m!1401609))

(declare-fun m!1401619 () Bool)

(assert (=> b!1518496 m!1401619))

(assert (=> b!1518496 m!1401619))

(assert (=> b!1518496 m!1401609))

(declare-fun m!1401621 () Bool)

(assert (=> b!1518496 m!1401621))

(declare-fun m!1401623 () Bool)

(assert (=> b!1518497 m!1401623))

(declare-fun m!1401625 () Bool)

(assert (=> b!1518507 m!1401625))

(declare-fun m!1401627 () Bool)

(assert (=> b!1518501 m!1401627))

(declare-fun m!1401629 () Bool)

(assert (=> b!1518501 m!1401629))

(assert (=> b!1518501 m!1401629))

(declare-fun m!1401631 () Bool)

(assert (=> b!1518501 m!1401631))

(assert (=> b!1518501 m!1401631))

(assert (=> b!1518501 m!1401629))

(declare-fun m!1401633 () Bool)

(assert (=> b!1518501 m!1401633))

(declare-fun m!1401635 () Bool)

(assert (=> b!1518499 m!1401635))

(assert (=> b!1518500 m!1401609))

(assert (=> b!1518500 m!1401609))

(declare-fun m!1401637 () Bool)

(assert (=> b!1518500 m!1401637))

(assert (=> b!1518504 m!1401609))

(declare-fun m!1401639 () Bool)

(assert (=> b!1518504 m!1401639))

(assert (=> b!1518504 m!1401627))

(assert (=> b!1518504 m!1401629))

(declare-fun m!1401641 () Bool)

(assert (=> b!1518504 m!1401641))

(declare-fun m!1401643 () Bool)

(assert (=> b!1518502 m!1401643))

(assert (=> b!1518502 m!1401643))

(declare-fun m!1401645 () Bool)

(assert (=> b!1518502 m!1401645))

(assert (=> b!1518508 m!1401609))

(assert (=> b!1518508 m!1401609))

(declare-fun m!1401647 () Bool)

(assert (=> b!1518508 m!1401647))

(check-sat (not b!1518499) (not start!129542) (not b!1518501) (not b!1518502) (not b!1518496) (not b!1518497) (not b!1518505) (not b!1518507) (not b!1518508) (not b!1518504) (not b!1518500) (not b!1518503))
(check-sat)
