; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129760 () Bool)

(assert start!129760)

(declare-fun b!1523017 () Bool)

(declare-fun res!1041927 () Bool)

(declare-fun e!849187 () Bool)

(assert (=> b!1523017 (=> (not res!1041927) (not e!849187))))

(declare-datatypes ((array!101356 0))(
  ( (array!101357 (arr!48909 (Array (_ BitVec 32) (_ BitVec 64))) (size!49459 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101356)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523017 (= res!1041927 (validKeyInArray!0 (select (arr!48909 a!2804) i!961)))))

(declare-fun b!1523018 () Bool)

(declare-fun res!1041926 () Bool)

(assert (=> b!1523018 (=> (not res!1041926) (not e!849187))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1523018 (= res!1041926 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49459 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49459 a!2804))))))

(declare-fun res!1041934 () Bool)

(assert (=> start!129760 (=> (not res!1041934) (not e!849187))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129760 (= res!1041934 (validMask!0 mask!2512))))

(assert (=> start!129760 e!849187))

(assert (=> start!129760 true))

(declare-fun array_inv!37937 (array!101356) Bool)

(assert (=> start!129760 (array_inv!37937 a!2804)))

(declare-fun b!1523019 () Bool)

(declare-fun res!1041931 () Bool)

(declare-fun e!849185 () Bool)

(assert (=> b!1523019 (=> (not res!1041931) (not e!849185))))

(declare-datatypes ((SeekEntryResult!13074 0))(
  ( (MissingZero!13074 (index!54691 (_ BitVec 32))) (Found!13074 (index!54692 (_ BitVec 32))) (Intermediate!13074 (undefined!13886 Bool) (index!54693 (_ BitVec 32)) (x!136384 (_ BitVec 32))) (Undefined!13074) (MissingVacant!13074 (index!54694 (_ BitVec 32))) )
))
(declare-fun lt!659839 () SeekEntryResult!13074)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101356 (_ BitVec 32)) SeekEntryResult!13074)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523019 (= res!1041931 (= lt!659839 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48909 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48909 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101357 (store (arr!48909 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49459 a!2804)) mask!2512)))))

(declare-fun e!849186 () Bool)

(declare-fun b!1523020 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101356 (_ BitVec 32)) SeekEntryResult!13074)

(assert (=> b!1523020 (= e!849186 (= (seekEntry!0 (select (arr!48909 a!2804) j!70) a!2804 mask!2512) (Found!13074 j!70)))))

(declare-fun b!1523021 () Bool)

(declare-fun res!1041928 () Bool)

(assert (=> b!1523021 (=> (not res!1041928) (not e!849187))))

(assert (=> b!1523021 (= res!1041928 (validKeyInArray!0 (select (arr!48909 a!2804) j!70)))))

(declare-fun b!1523022 () Bool)

(declare-fun res!1041925 () Bool)

(assert (=> b!1523022 (=> (not res!1041925) (not e!849187))))

(declare-datatypes ((List!35392 0))(
  ( (Nil!35389) (Cons!35388 (h!36812 (_ BitVec 64)) (t!50086 List!35392)) )
))
(declare-fun arrayNoDuplicates!0 (array!101356 (_ BitVec 32) List!35392) Bool)

(assert (=> b!1523022 (= res!1041925 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35389))))

(declare-fun b!1523023 () Bool)

(declare-fun res!1041924 () Bool)

(assert (=> b!1523023 (=> (not res!1041924) (not e!849185))))

(declare-fun lt!659837 () SeekEntryResult!13074)

(assert (=> b!1523023 (= res!1041924 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48909 a!2804) j!70) a!2804 mask!2512) lt!659837))))

(declare-fun b!1523024 () Bool)

(assert (=> b!1523024 (= e!849187 e!849185)))

(declare-fun res!1041932 () Bool)

(assert (=> b!1523024 (=> (not res!1041932) (not e!849185))))

(assert (=> b!1523024 (= res!1041932 (= lt!659839 lt!659837))))

(assert (=> b!1523024 (= lt!659837 (Intermediate!13074 false resIndex!21 resX!21))))

(assert (=> b!1523024 (= lt!659839 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48909 a!2804) j!70) mask!2512) (select (arr!48909 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523025 () Bool)

(declare-fun res!1041933 () Bool)

(assert (=> b!1523025 (=> (not res!1041933) (not e!849187))))

(assert (=> b!1523025 (= res!1041933 (and (= (size!49459 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49459 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49459 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1523026 () Bool)

(assert (=> b!1523026 (= e!849185 (not true))))

(assert (=> b!1523026 e!849186))

(declare-fun res!1041930 () Bool)

(assert (=> b!1523026 (=> (not res!1041930) (not e!849186))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101356 (_ BitVec 32)) Bool)

(assert (=> b!1523026 (= res!1041930 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50932 0))(
  ( (Unit!50933) )
))
(declare-fun lt!659838 () Unit!50932)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101356 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50932)

(assert (=> b!1523026 (= lt!659838 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1523027 () Bool)

(declare-fun res!1041929 () Bool)

(assert (=> b!1523027 (=> (not res!1041929) (not e!849187))))

(assert (=> b!1523027 (= res!1041929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!129760 res!1041934) b!1523025))

(assert (= (and b!1523025 res!1041933) b!1523017))

(assert (= (and b!1523017 res!1041927) b!1523021))

(assert (= (and b!1523021 res!1041928) b!1523027))

(assert (= (and b!1523027 res!1041929) b!1523022))

(assert (= (and b!1523022 res!1041925) b!1523018))

(assert (= (and b!1523018 res!1041926) b!1523024))

(assert (= (and b!1523024 res!1041932) b!1523023))

(assert (= (and b!1523023 res!1041924) b!1523019))

(assert (= (and b!1523019 res!1041931) b!1523026))

(assert (= (and b!1523026 res!1041930) b!1523020))

(declare-fun m!1406097 () Bool)

(assert (=> start!129760 m!1406097))

(declare-fun m!1406099 () Bool)

(assert (=> start!129760 m!1406099))

(declare-fun m!1406101 () Bool)

(assert (=> b!1523017 m!1406101))

(assert (=> b!1523017 m!1406101))

(declare-fun m!1406103 () Bool)

(assert (=> b!1523017 m!1406103))

(declare-fun m!1406105 () Bool)

(assert (=> b!1523027 m!1406105))

(declare-fun m!1406107 () Bool)

(assert (=> b!1523026 m!1406107))

(declare-fun m!1406109 () Bool)

(assert (=> b!1523026 m!1406109))

(declare-fun m!1406111 () Bool)

(assert (=> b!1523019 m!1406111))

(declare-fun m!1406113 () Bool)

(assert (=> b!1523019 m!1406113))

(assert (=> b!1523019 m!1406113))

(declare-fun m!1406115 () Bool)

(assert (=> b!1523019 m!1406115))

(assert (=> b!1523019 m!1406115))

(assert (=> b!1523019 m!1406113))

(declare-fun m!1406117 () Bool)

(assert (=> b!1523019 m!1406117))

(declare-fun m!1406119 () Bool)

(assert (=> b!1523024 m!1406119))

(assert (=> b!1523024 m!1406119))

(declare-fun m!1406121 () Bool)

(assert (=> b!1523024 m!1406121))

(assert (=> b!1523024 m!1406121))

(assert (=> b!1523024 m!1406119))

(declare-fun m!1406123 () Bool)

(assert (=> b!1523024 m!1406123))

(assert (=> b!1523023 m!1406119))

(assert (=> b!1523023 m!1406119))

(declare-fun m!1406125 () Bool)

(assert (=> b!1523023 m!1406125))

(assert (=> b!1523021 m!1406119))

(assert (=> b!1523021 m!1406119))

(declare-fun m!1406127 () Bool)

(assert (=> b!1523021 m!1406127))

(declare-fun m!1406129 () Bool)

(assert (=> b!1523022 m!1406129))

(assert (=> b!1523020 m!1406119))

(assert (=> b!1523020 m!1406119))

(declare-fun m!1406131 () Bool)

(assert (=> b!1523020 m!1406131))

(check-sat (not b!1523022) (not b!1523021) (not b!1523024) (not b!1523027) (not b!1523017) (not start!129760) (not b!1523020) (not b!1523023) (not b!1523026) (not b!1523019))
(check-sat)
