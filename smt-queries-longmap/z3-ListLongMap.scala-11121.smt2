; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129906 () Bool)

(assert start!129906)

(declare-fun b!1524625 () Bool)

(declare-fun e!849876 () Bool)

(assert (=> b!1524625 (= e!849876 (not true))))

(declare-fun e!849874 () Bool)

(assert (=> b!1524625 e!849874))

(declare-fun res!1043181 () Bool)

(assert (=> b!1524625 (=> (not res!1043181) (not e!849874))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101380 0))(
  ( (array!101381 (arr!48919 (Array (_ BitVec 32) (_ BitVec 64))) (size!49471 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101380)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101380 (_ BitVec 32)) Bool)

(assert (=> b!1524625 (= res!1043181 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50837 0))(
  ( (Unit!50838) )
))
(declare-fun lt!660236 () Unit!50837)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101380 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50837)

(assert (=> b!1524625 (= lt!660236 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1524626 () Bool)

(declare-fun res!1043175 () Bool)

(assert (=> b!1524626 (=> (not res!1043175) (not e!849876))))

(declare-datatypes ((SeekEntryResult!13107 0))(
  ( (MissingZero!13107 (index!54823 (_ BitVec 32))) (Found!13107 (index!54824 (_ BitVec 32))) (Intermediate!13107 (undefined!13919 Bool) (index!54825 (_ BitVec 32)) (x!136523 (_ BitVec 32))) (Undefined!13107) (MissingVacant!13107 (index!54826 (_ BitVec 32))) )
))
(declare-fun lt!660237 () SeekEntryResult!13107)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101380 (_ BitVec 32)) SeekEntryResult!13107)

(assert (=> b!1524626 (= res!1043175 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48919 a!2804) j!70) a!2804 mask!2512) lt!660237))))

(declare-fun e!849875 () Bool)

(declare-fun b!1524627 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101380 (_ BitVec 32)) SeekEntryResult!13107)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101380 (_ BitVec 32)) SeekEntryResult!13107)

(assert (=> b!1524627 (= e!849875 (= (seekEntryOrOpen!0 (select (arr!48919 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48919 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1524628 () Bool)

(declare-fun res!1043182 () Bool)

(declare-fun e!849873 () Bool)

(assert (=> b!1524628 (=> (not res!1043182) (not e!849873))))

(declare-datatypes ((List!35480 0))(
  ( (Nil!35477) (Cons!35476 (h!36907 (_ BitVec 64)) (t!50166 List!35480)) )
))
(declare-fun arrayNoDuplicates!0 (array!101380 (_ BitVec 32) List!35480) Bool)

(assert (=> b!1524628 (= res!1043182 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35477))))

(declare-fun b!1524629 () Bool)

(declare-fun res!1043174 () Bool)

(assert (=> b!1524629 (=> (not res!1043174) (not e!849873))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1524629 (= res!1043174 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49471 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49471 a!2804))))))

(declare-fun res!1043177 () Bool)

(assert (=> start!129906 (=> (not res!1043177) (not e!849873))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129906 (= res!1043177 (validMask!0 mask!2512))))

(assert (=> start!129906 e!849873))

(assert (=> start!129906 true))

(declare-fun array_inv!38152 (array!101380) Bool)

(assert (=> start!129906 (array_inv!38152 a!2804)))

(declare-fun b!1524630 () Bool)

(assert (=> b!1524630 (= e!849874 e!849875)))

(declare-fun res!1043180 () Bool)

(assert (=> b!1524630 (=> res!1043180 e!849875)))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1524630 (= res!1043180 (or (not (= (select (arr!48919 a!2804) j!70) (select (store (arr!48919 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48919 a!2804) index!487) (select (arr!48919 a!2804) j!70)) (not (= (select (arr!48919 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1524631 () Bool)

(assert (=> b!1524631 (= e!849873 e!849876)))

(declare-fun res!1043172 () Bool)

(assert (=> b!1524631 (=> (not res!1043172) (not e!849876))))

(declare-fun lt!660235 () SeekEntryResult!13107)

(assert (=> b!1524631 (= res!1043172 (= lt!660235 lt!660237))))

(assert (=> b!1524631 (= lt!660237 (Intermediate!13107 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1524631 (= lt!660235 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48919 a!2804) j!70) mask!2512) (select (arr!48919 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524632 () Bool)

(declare-fun res!1043173 () Bool)

(assert (=> b!1524632 (=> (not res!1043173) (not e!849874))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101380 (_ BitVec 32)) SeekEntryResult!13107)

(assert (=> b!1524632 (= res!1043173 (= (seekEntry!0 (select (arr!48919 a!2804) j!70) a!2804 mask!2512) (Found!13107 j!70)))))

(declare-fun b!1524633 () Bool)

(declare-fun res!1043176 () Bool)

(assert (=> b!1524633 (=> (not res!1043176) (not e!849876))))

(assert (=> b!1524633 (= res!1043176 (= lt!660235 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48919 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48919 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101381 (store (arr!48919 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49471 a!2804)) mask!2512)))))

(declare-fun b!1524634 () Bool)

(declare-fun res!1043171 () Bool)

(assert (=> b!1524634 (=> (not res!1043171) (not e!849873))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1524634 (= res!1043171 (validKeyInArray!0 (select (arr!48919 a!2804) i!961)))))

(declare-fun b!1524635 () Bool)

(declare-fun res!1043178 () Bool)

(assert (=> b!1524635 (=> (not res!1043178) (not e!849873))))

(assert (=> b!1524635 (= res!1043178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1524636 () Bool)

(declare-fun res!1043170 () Bool)

(assert (=> b!1524636 (=> (not res!1043170) (not e!849873))))

(assert (=> b!1524636 (= res!1043170 (and (= (size!49471 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49471 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49471 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1524637 () Bool)

(declare-fun res!1043179 () Bool)

(assert (=> b!1524637 (=> (not res!1043179) (not e!849873))))

(assert (=> b!1524637 (= res!1043179 (validKeyInArray!0 (select (arr!48919 a!2804) j!70)))))

(assert (= (and start!129906 res!1043177) b!1524636))

(assert (= (and b!1524636 res!1043170) b!1524634))

(assert (= (and b!1524634 res!1043171) b!1524637))

(assert (= (and b!1524637 res!1043179) b!1524635))

(assert (= (and b!1524635 res!1043178) b!1524628))

(assert (= (and b!1524628 res!1043182) b!1524629))

(assert (= (and b!1524629 res!1043174) b!1524631))

(assert (= (and b!1524631 res!1043172) b!1524626))

(assert (= (and b!1524626 res!1043175) b!1524633))

(assert (= (and b!1524633 res!1043176) b!1524625))

(assert (= (and b!1524625 res!1043181) b!1524632))

(assert (= (and b!1524632 res!1043173) b!1524630))

(assert (= (and b!1524630 (not res!1043180)) b!1524627))

(declare-fun m!1406921 () Bool)

(assert (=> b!1524634 m!1406921))

(assert (=> b!1524634 m!1406921))

(declare-fun m!1406923 () Bool)

(assert (=> b!1524634 m!1406923))

(declare-fun m!1406925 () Bool)

(assert (=> b!1524627 m!1406925))

(assert (=> b!1524627 m!1406925))

(declare-fun m!1406927 () Bool)

(assert (=> b!1524627 m!1406927))

(assert (=> b!1524627 m!1406925))

(declare-fun m!1406929 () Bool)

(assert (=> b!1524627 m!1406929))

(declare-fun m!1406931 () Bool)

(assert (=> b!1524635 m!1406931))

(assert (=> b!1524630 m!1406925))

(declare-fun m!1406933 () Bool)

(assert (=> b!1524630 m!1406933))

(declare-fun m!1406935 () Bool)

(assert (=> b!1524630 m!1406935))

(declare-fun m!1406937 () Bool)

(assert (=> b!1524630 m!1406937))

(assert (=> b!1524633 m!1406933))

(assert (=> b!1524633 m!1406935))

(assert (=> b!1524633 m!1406935))

(declare-fun m!1406939 () Bool)

(assert (=> b!1524633 m!1406939))

(assert (=> b!1524633 m!1406939))

(assert (=> b!1524633 m!1406935))

(declare-fun m!1406941 () Bool)

(assert (=> b!1524633 m!1406941))

(declare-fun m!1406943 () Bool)

(assert (=> b!1524628 m!1406943))

(assert (=> b!1524637 m!1406925))

(assert (=> b!1524637 m!1406925))

(declare-fun m!1406945 () Bool)

(assert (=> b!1524637 m!1406945))

(assert (=> b!1524632 m!1406925))

(assert (=> b!1524632 m!1406925))

(declare-fun m!1406947 () Bool)

(assert (=> b!1524632 m!1406947))

(assert (=> b!1524626 m!1406925))

(assert (=> b!1524626 m!1406925))

(declare-fun m!1406949 () Bool)

(assert (=> b!1524626 m!1406949))

(declare-fun m!1406951 () Bool)

(assert (=> start!129906 m!1406951))

(declare-fun m!1406953 () Bool)

(assert (=> start!129906 m!1406953))

(assert (=> b!1524631 m!1406925))

(assert (=> b!1524631 m!1406925))

(declare-fun m!1406955 () Bool)

(assert (=> b!1524631 m!1406955))

(assert (=> b!1524631 m!1406955))

(assert (=> b!1524631 m!1406925))

(declare-fun m!1406957 () Bool)

(assert (=> b!1524631 m!1406957))

(declare-fun m!1406959 () Bool)

(assert (=> b!1524625 m!1406959))

(declare-fun m!1406961 () Bool)

(assert (=> b!1524625 m!1406961))

(check-sat (not b!1524627) (not b!1524637) (not b!1524634) (not b!1524632) (not b!1524626) (not b!1524631) (not start!129906) (not b!1524625) (not b!1524633) (not b!1524635) (not b!1524628))
(check-sat)
