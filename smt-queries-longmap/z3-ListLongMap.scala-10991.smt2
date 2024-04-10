; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128780 () Bool)

(assert start!128780)

(declare-fun res!1028866 () Bool)

(declare-fun e!842942 () Bool)

(assert (=> start!128780 (=> (not res!1028866) (not e!842942))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128780 (= res!1028866 (validMask!0 mask!2512))))

(assert (=> start!128780 e!842942))

(assert (=> start!128780 true))

(declare-datatypes ((array!100636 0))(
  ( (array!100637 (arr!48555 (Array (_ BitVec 32) (_ BitVec 64))) (size!49105 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100636)

(declare-fun array_inv!37583 (array!100636) Bool)

(assert (=> start!128780 (array_inv!37583 a!2804)))

(declare-fun b!1508958 () Bool)

(declare-fun res!1028861 () Bool)

(assert (=> b!1508958 (=> (not res!1028861) (not e!842942))))

(declare-datatypes ((List!35038 0))(
  ( (Nil!35035) (Cons!35034 (h!36446 (_ BitVec 64)) (t!49732 List!35038)) )
))
(declare-fun arrayNoDuplicates!0 (array!100636 (_ BitVec 32) List!35038) Bool)

(assert (=> b!1508958 (= res!1028861 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35035))))

(declare-fun b!1508959 () Bool)

(declare-fun res!1028869 () Bool)

(assert (=> b!1508959 (=> (not res!1028869) (not e!842942))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100636 (_ BitVec 32)) Bool)

(assert (=> b!1508959 (= res!1028869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508960 () Bool)

(declare-fun res!1028862 () Bool)

(assert (=> b!1508960 (=> (not res!1028862) (not e!842942))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508960 (= res!1028862 (validKeyInArray!0 (select (arr!48555 a!2804) j!70)))))

(declare-fun b!1508961 () Bool)

(declare-fun res!1028867 () Bool)

(assert (=> b!1508961 (=> (not res!1028867) (not e!842942))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1508961 (= res!1028867 (validKeyInArray!0 (select (arr!48555 a!2804) i!961)))))

(declare-fun b!1508962 () Bool)

(declare-fun e!842943 () Bool)

(assert (=> b!1508962 (= e!842942 e!842943)))

(declare-fun res!1028868 () Bool)

(assert (=> b!1508962 (=> (not res!1028868) (not e!842943))))

(declare-datatypes ((SeekEntryResult!12726 0))(
  ( (MissingZero!12726 (index!53299 (_ BitVec 32))) (Found!12726 (index!53300 (_ BitVec 32))) (Intermediate!12726 (undefined!13538 Bool) (index!53301 (_ BitVec 32)) (x!135060 (_ BitVec 32))) (Undefined!12726) (MissingVacant!12726 (index!53302 (_ BitVec 32))) )
))
(declare-fun lt!654778 () SeekEntryResult!12726)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100636 (_ BitVec 32)) SeekEntryResult!12726)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508962 (= res!1028868 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48555 a!2804) j!70) mask!2512) (select (arr!48555 a!2804) j!70) a!2804 mask!2512) lt!654778))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1508962 (= lt!654778 (Intermediate!12726 false resIndex!21 resX!21))))

(declare-fun b!1508963 () Bool)

(declare-fun res!1028865 () Bool)

(assert (=> b!1508963 (=> (not res!1028865) (not e!842942))))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1508963 (= res!1028865 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49105 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49105 a!2804))))))

(declare-fun b!1508964 () Bool)

(declare-fun res!1028863 () Bool)

(assert (=> b!1508964 (=> (not res!1028863) (not e!842942))))

(assert (=> b!1508964 (= res!1028863 (and (= (size!49105 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49105 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49105 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508965 () Bool)

(assert (=> b!1508965 (= e!842943 false)))

(declare-fun lt!654777 () SeekEntryResult!12726)

(assert (=> b!1508965 (= lt!654777 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48555 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48555 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100637 (store (arr!48555 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49105 a!2804)) mask!2512))))

(declare-fun b!1508966 () Bool)

(declare-fun res!1028864 () Bool)

(assert (=> b!1508966 (=> (not res!1028864) (not e!842943))))

(assert (=> b!1508966 (= res!1028864 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48555 a!2804) j!70) a!2804 mask!2512) lt!654778))))

(assert (= (and start!128780 res!1028866) b!1508964))

(assert (= (and b!1508964 res!1028863) b!1508961))

(assert (= (and b!1508961 res!1028867) b!1508960))

(assert (= (and b!1508960 res!1028862) b!1508959))

(assert (= (and b!1508959 res!1028869) b!1508958))

(assert (= (and b!1508958 res!1028861) b!1508963))

(assert (= (and b!1508963 res!1028865) b!1508962))

(assert (= (and b!1508962 res!1028868) b!1508966))

(assert (= (and b!1508966 res!1028864) b!1508965))

(declare-fun m!1391383 () Bool)

(assert (=> start!128780 m!1391383))

(declare-fun m!1391385 () Bool)

(assert (=> start!128780 m!1391385))

(declare-fun m!1391387 () Bool)

(assert (=> b!1508959 m!1391387))

(declare-fun m!1391389 () Bool)

(assert (=> b!1508962 m!1391389))

(assert (=> b!1508962 m!1391389))

(declare-fun m!1391391 () Bool)

(assert (=> b!1508962 m!1391391))

(assert (=> b!1508962 m!1391391))

(assert (=> b!1508962 m!1391389))

(declare-fun m!1391393 () Bool)

(assert (=> b!1508962 m!1391393))

(assert (=> b!1508960 m!1391389))

(assert (=> b!1508960 m!1391389))

(declare-fun m!1391395 () Bool)

(assert (=> b!1508960 m!1391395))

(assert (=> b!1508966 m!1391389))

(assert (=> b!1508966 m!1391389))

(declare-fun m!1391397 () Bool)

(assert (=> b!1508966 m!1391397))

(declare-fun m!1391399 () Bool)

(assert (=> b!1508965 m!1391399))

(declare-fun m!1391401 () Bool)

(assert (=> b!1508965 m!1391401))

(assert (=> b!1508965 m!1391401))

(declare-fun m!1391403 () Bool)

(assert (=> b!1508965 m!1391403))

(assert (=> b!1508965 m!1391403))

(assert (=> b!1508965 m!1391401))

(declare-fun m!1391405 () Bool)

(assert (=> b!1508965 m!1391405))

(declare-fun m!1391407 () Bool)

(assert (=> b!1508958 m!1391407))

(declare-fun m!1391409 () Bool)

(assert (=> b!1508961 m!1391409))

(assert (=> b!1508961 m!1391409))

(declare-fun m!1391411 () Bool)

(assert (=> b!1508961 m!1391411))

(check-sat (not b!1508961) (not b!1508959) (not b!1508958) (not b!1508966) (not b!1508965) (not b!1508960) (not start!128780) (not b!1508962))
(check-sat)
