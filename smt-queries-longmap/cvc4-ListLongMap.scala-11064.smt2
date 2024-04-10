; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129220 () Bool)

(assert start!129220)

(declare-fun res!1036957 () Bool)

(declare-fun e!846436 () Bool)

(assert (=> start!129220 (=> (not res!1036957) (not e!846436))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129220 (= res!1036957 (validMask!0 mask!2512))))

(assert (=> start!129220 e!846436))

(assert (=> start!129220 true))

(declare-datatypes ((array!101076 0))(
  ( (array!101077 (arr!48775 (Array (_ BitVec 32) (_ BitVec 64))) (size!49325 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101076)

(declare-fun array_inv!37803 (array!101076) Bool)

(assert (=> start!129220 (array_inv!37803 a!2804)))

(declare-fun b!1517045 () Bool)

(declare-fun res!1036955 () Bool)

(assert (=> b!1517045 (=> (not res!1036955) (not e!846436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101076 (_ BitVec 32)) Bool)

(assert (=> b!1517045 (= res!1036955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517046 () Bool)

(declare-fun res!1036956 () Bool)

(declare-fun e!846431 () Bool)

(assert (=> b!1517046 (=> (not res!1036956) (not e!846431))))

(declare-datatypes ((SeekEntryResult!12946 0))(
  ( (MissingZero!12946 (index!54179 (_ BitVec 32))) (Found!12946 (index!54180 (_ BitVec 32))) (Intermediate!12946 (undefined!13758 Bool) (index!54181 (_ BitVec 32)) (x!135864 (_ BitVec 32))) (Undefined!12946) (MissingVacant!12946 (index!54182 (_ BitVec 32))) )
))
(declare-fun lt!657634 () SeekEntryResult!12946)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101076 (_ BitVec 32)) SeekEntryResult!12946)

(assert (=> b!1517046 (= res!1036956 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48775 a!2804) j!70) a!2804 mask!2512) lt!657634))))

(declare-fun b!1517047 () Bool)

(declare-fun res!1036958 () Bool)

(assert (=> b!1517047 (=> (not res!1036958) (not e!846436))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517047 (= res!1036958 (validKeyInArray!0 (select (arr!48775 a!2804) i!961)))))

(declare-fun b!1517048 () Bool)

(declare-fun e!846433 () Bool)

(assert (=> b!1517048 (= e!846433 true)))

(declare-fun lt!657635 () SeekEntryResult!12946)

(declare-fun lt!657637 () (_ BitVec 32))

(assert (=> b!1517048 (= lt!657635 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657637 (select (arr!48775 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517049 () Bool)

(declare-fun res!1036948 () Bool)

(assert (=> b!1517049 (=> (not res!1036948) (not e!846436))))

(declare-datatypes ((List!35258 0))(
  ( (Nil!35255) (Cons!35254 (h!36666 (_ BitVec 64)) (t!49952 List!35258)) )
))
(declare-fun arrayNoDuplicates!0 (array!101076 (_ BitVec 32) List!35258) Bool)

(assert (=> b!1517049 (= res!1036948 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35255))))

(declare-fun b!1517050 () Bool)

(declare-fun e!846434 () Bool)

(assert (=> b!1517050 (= e!846434 e!846433)))

(declare-fun res!1036959 () Bool)

(assert (=> b!1517050 (=> res!1036959 e!846433)))

(assert (=> b!1517050 (= res!1036959 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657637 #b00000000000000000000000000000000) (bvsge lt!657637 (size!49325 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517050 (= lt!657637 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1517051 () Bool)

(declare-fun res!1036949 () Bool)

(assert (=> b!1517051 (=> (not res!1036949) (not e!846436))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1517051 (= res!1036949 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49325 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49325 a!2804))))))

(declare-fun b!1517052 () Bool)

(declare-fun res!1036951 () Bool)

(assert (=> b!1517052 (=> (not res!1036951) (not e!846436))))

(assert (=> b!1517052 (= res!1036951 (and (= (size!49325 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49325 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49325 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517053 () Bool)

(declare-fun res!1036954 () Bool)

(assert (=> b!1517053 (=> (not res!1036954) (not e!846436))))

(assert (=> b!1517053 (= res!1036954 (validKeyInArray!0 (select (arr!48775 a!2804) j!70)))))

(declare-fun b!1517054 () Bool)

(declare-fun res!1036960 () Bool)

(assert (=> b!1517054 (=> (not res!1036960) (not e!846431))))

(declare-fun lt!657636 () SeekEntryResult!12946)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517054 (= res!1036960 (= lt!657636 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48775 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48775 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101077 (store (arr!48775 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49325 a!2804)) mask!2512)))))

(declare-fun b!1517055 () Bool)

(assert (=> b!1517055 (= e!846436 e!846431)))

(declare-fun res!1036950 () Bool)

(assert (=> b!1517055 (=> (not res!1036950) (not e!846431))))

(assert (=> b!1517055 (= res!1036950 (= lt!657636 lt!657634))))

(assert (=> b!1517055 (= lt!657634 (Intermediate!12946 false resIndex!21 resX!21))))

(assert (=> b!1517055 (= lt!657636 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48775 a!2804) j!70) mask!2512) (select (arr!48775 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517056 () Bool)

(declare-fun e!846432 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101076 (_ BitVec 32)) SeekEntryResult!12946)

(assert (=> b!1517056 (= e!846432 (= (seekEntry!0 (select (arr!48775 a!2804) j!70) a!2804 mask!2512) (Found!12946 j!70)))))

(declare-fun b!1517057 () Bool)

(assert (=> b!1517057 (= e!846431 (not e!846434))))

(declare-fun res!1036952 () Bool)

(assert (=> b!1517057 (=> res!1036952 e!846434)))

(assert (=> b!1517057 (= res!1036952 (or (not (= (select (arr!48775 a!2804) j!70) (select (store (arr!48775 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1517057 e!846432))

(declare-fun res!1036953 () Bool)

(assert (=> b!1517057 (=> (not res!1036953) (not e!846432))))

(assert (=> b!1517057 (= res!1036953 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50760 0))(
  ( (Unit!50761) )
))
(declare-fun lt!657633 () Unit!50760)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101076 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50760)

(assert (=> b!1517057 (= lt!657633 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!129220 res!1036957) b!1517052))

(assert (= (and b!1517052 res!1036951) b!1517047))

(assert (= (and b!1517047 res!1036958) b!1517053))

(assert (= (and b!1517053 res!1036954) b!1517045))

(assert (= (and b!1517045 res!1036955) b!1517049))

(assert (= (and b!1517049 res!1036948) b!1517051))

(assert (= (and b!1517051 res!1036949) b!1517055))

(assert (= (and b!1517055 res!1036950) b!1517046))

(assert (= (and b!1517046 res!1036956) b!1517054))

(assert (= (and b!1517054 res!1036960) b!1517057))

(assert (= (and b!1517057 res!1036953) b!1517056))

(assert (= (and b!1517057 (not res!1036952)) b!1517050))

(assert (= (and b!1517050 (not res!1036959)) b!1517048))

(declare-fun m!1400325 () Bool)

(assert (=> b!1517048 m!1400325))

(assert (=> b!1517048 m!1400325))

(declare-fun m!1400327 () Bool)

(assert (=> b!1517048 m!1400327))

(declare-fun m!1400329 () Bool)

(assert (=> b!1517054 m!1400329))

(declare-fun m!1400331 () Bool)

(assert (=> b!1517054 m!1400331))

(assert (=> b!1517054 m!1400331))

(declare-fun m!1400333 () Bool)

(assert (=> b!1517054 m!1400333))

(assert (=> b!1517054 m!1400333))

(assert (=> b!1517054 m!1400331))

(declare-fun m!1400335 () Bool)

(assert (=> b!1517054 m!1400335))

(declare-fun m!1400337 () Bool)

(assert (=> start!129220 m!1400337))

(declare-fun m!1400339 () Bool)

(assert (=> start!129220 m!1400339))

(assert (=> b!1517046 m!1400325))

(assert (=> b!1517046 m!1400325))

(declare-fun m!1400341 () Bool)

(assert (=> b!1517046 m!1400341))

(assert (=> b!1517055 m!1400325))

(assert (=> b!1517055 m!1400325))

(declare-fun m!1400343 () Bool)

(assert (=> b!1517055 m!1400343))

(assert (=> b!1517055 m!1400343))

(assert (=> b!1517055 m!1400325))

(declare-fun m!1400345 () Bool)

(assert (=> b!1517055 m!1400345))

(assert (=> b!1517057 m!1400325))

(declare-fun m!1400347 () Bool)

(assert (=> b!1517057 m!1400347))

(assert (=> b!1517057 m!1400329))

(assert (=> b!1517057 m!1400331))

(declare-fun m!1400349 () Bool)

(assert (=> b!1517057 m!1400349))

(declare-fun m!1400351 () Bool)

(assert (=> b!1517045 m!1400351))

(assert (=> b!1517053 m!1400325))

(assert (=> b!1517053 m!1400325))

(declare-fun m!1400353 () Bool)

(assert (=> b!1517053 m!1400353))

(declare-fun m!1400355 () Bool)

(assert (=> b!1517047 m!1400355))

(assert (=> b!1517047 m!1400355))

(declare-fun m!1400357 () Bool)

(assert (=> b!1517047 m!1400357))

(declare-fun m!1400359 () Bool)

(assert (=> b!1517050 m!1400359))

(declare-fun m!1400361 () Bool)

(assert (=> b!1517049 m!1400361))

(assert (=> b!1517056 m!1400325))

(assert (=> b!1517056 m!1400325))

(declare-fun m!1400363 () Bool)

(assert (=> b!1517056 m!1400363))

(push 1)

(assert (not b!1517055))

