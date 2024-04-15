; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128822 () Bool)

(assert start!128822)

(declare-fun b!1510071 () Bool)

(declare-fun res!1030188 () Bool)

(declare-fun e!843237 () Bool)

(assert (=> b!1510071 (=> (not res!1030188) (not e!843237))))

(declare-datatypes ((array!100678 0))(
  ( (array!100679 (arr!48577 (Array (_ BitVec 32) (_ BitVec 64))) (size!49129 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100678)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510071 (= res!1030188 (validKeyInArray!0 (select (arr!48577 a!2804) i!961)))))

(declare-fun b!1510072 () Bool)

(declare-fun res!1030181 () Bool)

(assert (=> b!1510072 (=> (not res!1030181) (not e!843237))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1510072 (= res!1030181 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49129 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49129 a!2804))))))

(declare-fun b!1510073 () Bool)

(declare-fun res!1030190 () Bool)

(declare-fun e!843234 () Bool)

(assert (=> b!1510073 (=> (not res!1030190) (not e!843234))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12771 0))(
  ( (MissingZero!12771 (index!53479 (_ BitVec 32))) (Found!12771 (index!53480 (_ BitVec 32))) (Intermediate!12771 (undefined!13583 Bool) (index!53481 (_ BitVec 32)) (x!135227 (_ BitVec 32))) (Undefined!12771) (MissingVacant!12771 (index!53482 (_ BitVec 32))) )
))
(declare-fun lt!654865 () SeekEntryResult!12771)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100678 (_ BitVec 32)) SeekEntryResult!12771)

(assert (=> b!1510073 (= res!1030190 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48577 a!2804) j!70) a!2804 mask!2512) lt!654865))))

(declare-fun b!1510074 () Bool)

(assert (=> b!1510074 (= e!843234 (not true))))

(declare-fun e!843236 () Bool)

(assert (=> b!1510074 e!843236))

(declare-fun res!1030183 () Bool)

(assert (=> b!1510074 (=> (not res!1030183) (not e!843236))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100678 (_ BitVec 32)) Bool)

(assert (=> b!1510074 (= res!1030183 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50249 0))(
  ( (Unit!50250) )
))
(declare-fun lt!654867 () Unit!50249)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100678 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50249)

(assert (=> b!1510074 (= lt!654867 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1510075 () Bool)

(declare-fun res!1030189 () Bool)

(assert (=> b!1510075 (=> (not res!1030189) (not e!843237))))

(assert (=> b!1510075 (= res!1030189 (and (= (size!49129 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49129 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49129 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510076 () Bool)

(declare-fun res!1030180 () Bool)

(assert (=> b!1510076 (=> (not res!1030180) (not e!843237))))

(declare-datatypes ((List!35138 0))(
  ( (Nil!35135) (Cons!35134 (h!36547 (_ BitVec 64)) (t!49824 List!35138)) )
))
(declare-fun arrayNoDuplicates!0 (array!100678 (_ BitVec 32) List!35138) Bool)

(assert (=> b!1510076 (= res!1030180 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35135))))

(declare-fun b!1510077 () Bool)

(assert (=> b!1510077 (= e!843237 e!843234)))

(declare-fun res!1030186 () Bool)

(assert (=> b!1510077 (=> (not res!1030186) (not e!843234))))

(declare-fun lt!654866 () SeekEntryResult!12771)

(assert (=> b!1510077 (= res!1030186 (= lt!654866 lt!654865))))

(assert (=> b!1510077 (= lt!654865 (Intermediate!12771 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510077 (= lt!654866 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48577 a!2804) j!70) mask!2512) (select (arr!48577 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1030182 () Bool)

(assert (=> start!128822 (=> (not res!1030182) (not e!843237))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128822 (= res!1030182 (validMask!0 mask!2512))))

(assert (=> start!128822 e!843237))

(assert (=> start!128822 true))

(declare-fun array_inv!37810 (array!100678) Bool)

(assert (=> start!128822 (array_inv!37810 a!2804)))

(declare-fun b!1510078 () Bool)

(declare-fun res!1030187 () Bool)

(assert (=> b!1510078 (=> (not res!1030187) (not e!843237))))

(assert (=> b!1510078 (= res!1030187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510079 () Bool)

(declare-fun res!1030185 () Bool)

(assert (=> b!1510079 (=> (not res!1030185) (not e!843237))))

(assert (=> b!1510079 (= res!1030185 (validKeyInArray!0 (select (arr!48577 a!2804) j!70)))))

(declare-fun b!1510080 () Bool)

(declare-fun res!1030184 () Bool)

(assert (=> b!1510080 (=> (not res!1030184) (not e!843234))))

(assert (=> b!1510080 (= res!1030184 (= lt!654866 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48577 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48577 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100679 (store (arr!48577 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49129 a!2804)) mask!2512)))))

(declare-fun b!1510081 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100678 (_ BitVec 32)) SeekEntryResult!12771)

(assert (=> b!1510081 (= e!843236 (= (seekEntry!0 (select (arr!48577 a!2804) j!70) a!2804 mask!2512) (Found!12771 j!70)))))

(assert (= (and start!128822 res!1030182) b!1510075))

(assert (= (and b!1510075 res!1030189) b!1510071))

(assert (= (and b!1510071 res!1030188) b!1510079))

(assert (= (and b!1510079 res!1030185) b!1510078))

(assert (= (and b!1510078 res!1030187) b!1510076))

(assert (= (and b!1510076 res!1030180) b!1510072))

(assert (= (and b!1510072 res!1030181) b!1510077))

(assert (= (and b!1510077 res!1030186) b!1510073))

(assert (= (and b!1510073 res!1030190) b!1510080))

(assert (= (and b!1510080 res!1030184) b!1510074))

(assert (= (and b!1510074 res!1030183) b!1510081))

(declare-fun m!1392089 () Bool)

(assert (=> b!1510076 m!1392089))

(declare-fun m!1392091 () Bool)

(assert (=> start!128822 m!1392091))

(declare-fun m!1392093 () Bool)

(assert (=> start!128822 m!1392093))

(declare-fun m!1392095 () Bool)

(assert (=> b!1510081 m!1392095))

(assert (=> b!1510081 m!1392095))

(declare-fun m!1392097 () Bool)

(assert (=> b!1510081 m!1392097))

(assert (=> b!1510079 m!1392095))

(assert (=> b!1510079 m!1392095))

(declare-fun m!1392099 () Bool)

(assert (=> b!1510079 m!1392099))

(assert (=> b!1510077 m!1392095))

(assert (=> b!1510077 m!1392095))

(declare-fun m!1392101 () Bool)

(assert (=> b!1510077 m!1392101))

(assert (=> b!1510077 m!1392101))

(assert (=> b!1510077 m!1392095))

(declare-fun m!1392103 () Bool)

(assert (=> b!1510077 m!1392103))

(assert (=> b!1510073 m!1392095))

(assert (=> b!1510073 m!1392095))

(declare-fun m!1392105 () Bool)

(assert (=> b!1510073 m!1392105))

(declare-fun m!1392107 () Bool)

(assert (=> b!1510078 m!1392107))

(declare-fun m!1392109 () Bool)

(assert (=> b!1510080 m!1392109))

(declare-fun m!1392111 () Bool)

(assert (=> b!1510080 m!1392111))

(assert (=> b!1510080 m!1392111))

(declare-fun m!1392113 () Bool)

(assert (=> b!1510080 m!1392113))

(assert (=> b!1510080 m!1392113))

(assert (=> b!1510080 m!1392111))

(declare-fun m!1392115 () Bool)

(assert (=> b!1510080 m!1392115))

(declare-fun m!1392117 () Bool)

(assert (=> b!1510071 m!1392117))

(assert (=> b!1510071 m!1392117))

(declare-fun m!1392119 () Bool)

(assert (=> b!1510071 m!1392119))

(declare-fun m!1392121 () Bool)

(assert (=> b!1510074 m!1392121))

(declare-fun m!1392123 () Bool)

(assert (=> b!1510074 m!1392123))

(check-sat (not b!1510081) (not b!1510074) (not start!128822) (not b!1510078) (not b!1510080) (not b!1510071) (not b!1510076) (not b!1510077) (not b!1510073) (not b!1510079))
(check-sat)
