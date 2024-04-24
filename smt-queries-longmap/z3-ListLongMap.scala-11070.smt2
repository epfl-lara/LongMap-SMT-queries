; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129608 () Bool)

(assert start!129608)

(declare-fun b!1519783 () Bool)

(declare-fun res!1038335 () Bool)

(declare-fun e!848029 () Bool)

(assert (=> b!1519783 (=> (not res!1038335) (not e!848029))))

(declare-datatypes ((array!101227 0))(
  ( (array!101228 (arr!48844 (Array (_ BitVec 32) (_ BitVec 64))) (size!49395 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101227)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1519783 (= res!1038335 (validKeyInArray!0 (select (arr!48844 a!2804) j!70)))))

(declare-fun b!1519784 () Bool)

(declare-fun e!848034 () Bool)

(assert (=> b!1519784 (= e!848034 true)))

(declare-datatypes ((SeekEntryResult!12908 0))(
  ( (MissingZero!12908 (index!54027 (_ BitVec 32))) (Found!12908 (index!54028 (_ BitVec 32))) (Intermediate!12908 (undefined!13720 Bool) (index!54029 (_ BitVec 32)) (x!135917 (_ BitVec 32))) (Undefined!12908) (MissingVacant!12908 (index!54030 (_ BitVec 32))) )
))
(declare-fun lt!658672 () SeekEntryResult!12908)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun lt!658675 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101227 (_ BitVec 32)) SeekEntryResult!12908)

(assert (=> b!1519784 (= lt!658672 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658675 (select (arr!48844 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519786 () Bool)

(declare-fun res!1038331 () Bool)

(assert (=> b!1519786 (=> (not res!1038331) (not e!848029))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1519786 (= res!1038331 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49395 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49395 a!2804))))))

(declare-fun b!1519787 () Bool)

(declare-fun e!848030 () Bool)

(declare-fun e!848031 () Bool)

(assert (=> b!1519787 (= e!848030 (not e!848031))))

(declare-fun res!1038333 () Bool)

(assert (=> b!1519787 (=> res!1038333 e!848031)))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1519787 (= res!1038333 (or (not (= (select (arr!48844 a!2804) j!70) (select (store (arr!48844 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!848033 () Bool)

(assert (=> b!1519787 e!848033))

(declare-fun res!1038338 () Bool)

(assert (=> b!1519787 (=> (not res!1038338) (not e!848033))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101227 (_ BitVec 32)) Bool)

(assert (=> b!1519787 (= res!1038338 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50719 0))(
  ( (Unit!50720) )
))
(declare-fun lt!658674 () Unit!50719)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101227 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50719)

(assert (=> b!1519787 (= lt!658674 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1519788 () Bool)

(declare-fun res!1038336 () Bool)

(assert (=> b!1519788 (=> (not res!1038336) (not e!848030))))

(declare-fun lt!658673 () SeekEntryResult!12908)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519788 (= res!1038336 (= lt!658673 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48844 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48844 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101228 (store (arr!48844 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49395 a!2804)) mask!2512)))))

(declare-fun b!1519789 () Bool)

(assert (=> b!1519789 (= e!848031 e!848034)))

(declare-fun res!1038328 () Bool)

(assert (=> b!1519789 (=> res!1038328 e!848034)))

(assert (=> b!1519789 (= res!1038328 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658675 #b00000000000000000000000000000000) (bvsge lt!658675 (size!49395 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519789 (= lt!658675 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1519790 () Bool)

(declare-fun res!1038337 () Bool)

(assert (=> b!1519790 (=> (not res!1038337) (not e!848029))))

(assert (=> b!1519790 (= res!1038337 (and (= (size!49395 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49395 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49395 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1519791 () Bool)

(assert (=> b!1519791 (= e!848029 e!848030)))

(declare-fun res!1038326 () Bool)

(assert (=> b!1519791 (=> (not res!1038326) (not e!848030))))

(declare-fun lt!658671 () SeekEntryResult!12908)

(assert (=> b!1519791 (= res!1038326 (= lt!658673 lt!658671))))

(assert (=> b!1519791 (= lt!658671 (Intermediate!12908 false resIndex!21 resX!21))))

(assert (=> b!1519791 (= lt!658673 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48844 a!2804) j!70) mask!2512) (select (arr!48844 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519792 () Bool)

(declare-fun res!1038329 () Bool)

(assert (=> b!1519792 (=> (not res!1038329) (not e!848029))))

(declare-datatypes ((List!35314 0))(
  ( (Nil!35311) (Cons!35310 (h!36740 (_ BitVec 64)) (t!50000 List!35314)) )
))
(declare-fun arrayNoDuplicates!0 (array!101227 (_ BitVec 32) List!35314) Bool)

(assert (=> b!1519792 (= res!1038329 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35311))))

(declare-fun b!1519793 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101227 (_ BitVec 32)) SeekEntryResult!12908)

(assert (=> b!1519793 (= e!848033 (= (seekEntry!0 (select (arr!48844 a!2804) j!70) a!2804 mask!2512) (Found!12908 j!70)))))

(declare-fun res!1038334 () Bool)

(assert (=> start!129608 (=> (not res!1038334) (not e!848029))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129608 (= res!1038334 (validMask!0 mask!2512))))

(assert (=> start!129608 e!848029))

(assert (=> start!129608 true))

(declare-fun array_inv!38125 (array!101227) Bool)

(assert (=> start!129608 (array_inv!38125 a!2804)))

(declare-fun b!1519785 () Bool)

(declare-fun res!1038327 () Bool)

(assert (=> b!1519785 (=> (not res!1038327) (not e!848029))))

(assert (=> b!1519785 (= res!1038327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1519794 () Bool)

(declare-fun res!1038332 () Bool)

(assert (=> b!1519794 (=> (not res!1038332) (not e!848030))))

(assert (=> b!1519794 (= res!1038332 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48844 a!2804) j!70) a!2804 mask!2512) lt!658671))))

(declare-fun b!1519795 () Bool)

(declare-fun res!1038330 () Bool)

(assert (=> b!1519795 (=> (not res!1038330) (not e!848029))))

(assert (=> b!1519795 (= res!1038330 (validKeyInArray!0 (select (arr!48844 a!2804) i!961)))))

(assert (= (and start!129608 res!1038334) b!1519790))

(assert (= (and b!1519790 res!1038337) b!1519795))

(assert (= (and b!1519795 res!1038330) b!1519783))

(assert (= (and b!1519783 res!1038335) b!1519785))

(assert (= (and b!1519785 res!1038327) b!1519792))

(assert (= (and b!1519792 res!1038329) b!1519786))

(assert (= (and b!1519786 res!1038331) b!1519791))

(assert (= (and b!1519791 res!1038326) b!1519794))

(assert (= (and b!1519794 res!1038332) b!1519788))

(assert (= (and b!1519788 res!1038336) b!1519787))

(assert (= (and b!1519787 res!1038338) b!1519793))

(assert (= (and b!1519787 (not res!1038333)) b!1519789))

(assert (= (and b!1519789 (not res!1038328)) b!1519784))

(declare-fun m!1402929 () Bool)

(assert (=> b!1519788 m!1402929))

(declare-fun m!1402931 () Bool)

(assert (=> b!1519788 m!1402931))

(assert (=> b!1519788 m!1402931))

(declare-fun m!1402933 () Bool)

(assert (=> b!1519788 m!1402933))

(assert (=> b!1519788 m!1402933))

(assert (=> b!1519788 m!1402931))

(declare-fun m!1402935 () Bool)

(assert (=> b!1519788 m!1402935))

(declare-fun m!1402937 () Bool)

(assert (=> b!1519795 m!1402937))

(assert (=> b!1519795 m!1402937))

(declare-fun m!1402939 () Bool)

(assert (=> b!1519795 m!1402939))

(declare-fun m!1402941 () Bool)

(assert (=> b!1519794 m!1402941))

(assert (=> b!1519794 m!1402941))

(declare-fun m!1402943 () Bool)

(assert (=> b!1519794 m!1402943))

(declare-fun m!1402945 () Bool)

(assert (=> b!1519792 m!1402945))

(assert (=> b!1519784 m!1402941))

(assert (=> b!1519784 m!1402941))

(declare-fun m!1402947 () Bool)

(assert (=> b!1519784 m!1402947))

(assert (=> b!1519793 m!1402941))

(assert (=> b!1519793 m!1402941))

(declare-fun m!1402949 () Bool)

(assert (=> b!1519793 m!1402949))

(declare-fun m!1402951 () Bool)

(assert (=> b!1519785 m!1402951))

(assert (=> b!1519783 m!1402941))

(assert (=> b!1519783 m!1402941))

(declare-fun m!1402953 () Bool)

(assert (=> b!1519783 m!1402953))

(assert (=> b!1519787 m!1402941))

(declare-fun m!1402955 () Bool)

(assert (=> b!1519787 m!1402955))

(assert (=> b!1519787 m!1402929))

(assert (=> b!1519787 m!1402931))

(declare-fun m!1402957 () Bool)

(assert (=> b!1519787 m!1402957))

(assert (=> b!1519791 m!1402941))

(assert (=> b!1519791 m!1402941))

(declare-fun m!1402959 () Bool)

(assert (=> b!1519791 m!1402959))

(assert (=> b!1519791 m!1402959))

(assert (=> b!1519791 m!1402941))

(declare-fun m!1402961 () Bool)

(assert (=> b!1519791 m!1402961))

(declare-fun m!1402963 () Bool)

(assert (=> start!129608 m!1402963))

(declare-fun m!1402965 () Bool)

(assert (=> start!129608 m!1402965))

(declare-fun m!1402967 () Bool)

(assert (=> b!1519789 m!1402967))

(check-sat (not b!1519794) (not b!1519793) (not b!1519789) (not b!1519783) (not b!1519784) (not b!1519787) (not b!1519785) (not b!1519788) (not start!129608) (not b!1519792) (not b!1519795) (not b!1519791))
(check-sat)
