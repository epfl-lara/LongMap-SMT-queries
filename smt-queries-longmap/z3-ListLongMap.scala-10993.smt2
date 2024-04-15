; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128738 () Bool)

(assert start!128738)

(declare-fun b!1508753 () Bool)

(declare-fun res!1028865 () Bool)

(declare-fun e!842774 () Bool)

(assert (=> b!1508753 (=> (not res!1028865) (not e!842774))))

(declare-datatypes ((array!100594 0))(
  ( (array!100595 (arr!48535 (Array (_ BitVec 32) (_ BitVec 64))) (size!49087 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100594)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508753 (= res!1028865 (validKeyInArray!0 (select (arr!48535 a!2804) i!961)))))

(declare-fun b!1508754 () Bool)

(declare-fun e!842775 () Bool)

(assert (=> b!1508754 (= e!842775 false)))

(declare-datatypes ((SeekEntryResult!12729 0))(
  ( (MissingZero!12729 (index!53311 (_ BitVec 32))) (Found!12729 (index!53312 (_ BitVec 32))) (Intermediate!12729 (undefined!13541 Bool) (index!53313 (_ BitVec 32)) (x!135073 (_ BitVec 32))) (Undefined!12729) (MissingVacant!12729 (index!53314 (_ BitVec 32))) )
))
(declare-fun lt!654513 () SeekEntryResult!12729)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100594 (_ BitVec 32)) SeekEntryResult!12729)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508754 (= lt!654513 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48535 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48535 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100595 (store (arr!48535 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49087 a!2804)) mask!2512))))

(declare-fun b!1508755 () Bool)

(declare-fun res!1028864 () Bool)

(assert (=> b!1508755 (=> (not res!1028864) (not e!842774))))

(assert (=> b!1508755 (= res!1028864 (validKeyInArray!0 (select (arr!48535 a!2804) j!70)))))

(declare-fun res!1028870 () Bool)

(assert (=> start!128738 (=> (not res!1028870) (not e!842774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128738 (= res!1028870 (validMask!0 mask!2512))))

(assert (=> start!128738 e!842774))

(assert (=> start!128738 true))

(declare-fun array_inv!37768 (array!100594) Bool)

(assert (=> start!128738 (array_inv!37768 a!2804)))

(declare-fun b!1508756 () Bool)

(assert (=> b!1508756 (= e!842774 e!842775)))

(declare-fun res!1028869 () Bool)

(assert (=> b!1508756 (=> (not res!1028869) (not e!842775))))

(declare-fun lt!654512 () SeekEntryResult!12729)

(assert (=> b!1508756 (= res!1028869 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48535 a!2804) j!70) mask!2512) (select (arr!48535 a!2804) j!70) a!2804 mask!2512) lt!654512))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1508756 (= lt!654512 (Intermediate!12729 false resIndex!21 resX!21))))

(declare-fun b!1508757 () Bool)

(declare-fun res!1028867 () Bool)

(assert (=> b!1508757 (=> (not res!1028867) (not e!842774))))

(declare-datatypes ((List!35096 0))(
  ( (Nil!35093) (Cons!35092 (h!36505 (_ BitVec 64)) (t!49782 List!35096)) )
))
(declare-fun arrayNoDuplicates!0 (array!100594 (_ BitVec 32) List!35096) Bool)

(assert (=> b!1508757 (= res!1028867 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35093))))

(declare-fun b!1508758 () Bool)

(declare-fun res!1028863 () Bool)

(assert (=> b!1508758 (=> (not res!1028863) (not e!842775))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1508758 (= res!1028863 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48535 a!2804) j!70) a!2804 mask!2512) lt!654512))))

(declare-fun b!1508759 () Bool)

(declare-fun res!1028868 () Bool)

(assert (=> b!1508759 (=> (not res!1028868) (not e!842774))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100594 (_ BitVec 32)) Bool)

(assert (=> b!1508759 (= res!1028868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508760 () Bool)

(declare-fun res!1028862 () Bool)

(assert (=> b!1508760 (=> (not res!1028862) (not e!842774))))

(assert (=> b!1508760 (= res!1028862 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49087 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49087 a!2804))))))

(declare-fun b!1508761 () Bool)

(declare-fun res!1028866 () Bool)

(assert (=> b!1508761 (=> (not res!1028866) (not e!842774))))

(assert (=> b!1508761 (= res!1028866 (and (= (size!49087 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49087 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49087 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!128738 res!1028870) b!1508761))

(assert (= (and b!1508761 res!1028866) b!1508753))

(assert (= (and b!1508753 res!1028865) b!1508755))

(assert (= (and b!1508755 res!1028864) b!1508759))

(assert (= (and b!1508759 res!1028868) b!1508757))

(assert (= (and b!1508757 res!1028867) b!1508760))

(assert (= (and b!1508760 res!1028862) b!1508756))

(assert (= (and b!1508756 res!1028869) b!1508758))

(assert (= (and b!1508758 res!1028863) b!1508754))

(declare-fun m!1390625 () Bool)

(assert (=> b!1508755 m!1390625))

(assert (=> b!1508755 m!1390625))

(declare-fun m!1390627 () Bool)

(assert (=> b!1508755 m!1390627))

(assert (=> b!1508758 m!1390625))

(assert (=> b!1508758 m!1390625))

(declare-fun m!1390629 () Bool)

(assert (=> b!1508758 m!1390629))

(assert (=> b!1508756 m!1390625))

(assert (=> b!1508756 m!1390625))

(declare-fun m!1390631 () Bool)

(assert (=> b!1508756 m!1390631))

(assert (=> b!1508756 m!1390631))

(assert (=> b!1508756 m!1390625))

(declare-fun m!1390633 () Bool)

(assert (=> b!1508756 m!1390633))

(declare-fun m!1390635 () Bool)

(assert (=> b!1508753 m!1390635))

(assert (=> b!1508753 m!1390635))

(declare-fun m!1390637 () Bool)

(assert (=> b!1508753 m!1390637))

(declare-fun m!1390639 () Bool)

(assert (=> b!1508754 m!1390639))

(declare-fun m!1390641 () Bool)

(assert (=> b!1508754 m!1390641))

(assert (=> b!1508754 m!1390641))

(declare-fun m!1390643 () Bool)

(assert (=> b!1508754 m!1390643))

(assert (=> b!1508754 m!1390643))

(assert (=> b!1508754 m!1390641))

(declare-fun m!1390645 () Bool)

(assert (=> b!1508754 m!1390645))

(declare-fun m!1390647 () Bool)

(assert (=> start!128738 m!1390647))

(declare-fun m!1390649 () Bool)

(assert (=> start!128738 m!1390649))

(declare-fun m!1390651 () Bool)

(assert (=> b!1508757 m!1390651))

(declare-fun m!1390653 () Bool)

(assert (=> b!1508759 m!1390653))

(check-sat (not b!1508759) (not b!1508757) (not b!1508756) (not b!1508758) (not b!1508755) (not b!1508754) (not b!1508753) (not start!128738))
(check-sat)
