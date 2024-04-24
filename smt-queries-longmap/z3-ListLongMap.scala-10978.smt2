; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128876 () Bool)

(assert start!128876)

(declare-fun b!1509161 () Bool)

(declare-fun res!1028202 () Bool)

(declare-fun e!843367 () Bool)

(assert (=> b!1509161 (=> (not res!1028202) (not e!843367))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100663 0))(
  ( (array!100664 (arr!48568 (Array (_ BitVec 32) (_ BitVec 64))) (size!49119 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100663)

(assert (=> b!1509161 (= res!1028202 (and (= (size!49119 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49119 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49119 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509162 () Bool)

(declare-fun e!843368 () Bool)

(assert (=> b!1509162 (= e!843367 e!843368)))

(declare-fun res!1028203 () Bool)

(assert (=> b!1509162 (=> (not res!1028203) (not e!843368))))

(declare-datatypes ((SeekEntryResult!12632 0))(
  ( (MissingZero!12632 (index!52923 (_ BitVec 32))) (Found!12632 (index!52924 (_ BitVec 32))) (Intermediate!12632 (undefined!13444 Bool) (index!52925 (_ BitVec 32)) (x!134881 (_ BitVec 32))) (Undefined!12632) (MissingVacant!12632 (index!52926 (_ BitVec 32))) )
))
(declare-fun lt!655039 () SeekEntryResult!12632)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100663 (_ BitVec 32)) SeekEntryResult!12632)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509162 (= res!1028203 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48568 a!2804) j!70) mask!2512) (select (arr!48568 a!2804) j!70) a!2804 mask!2512) lt!655039))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1509162 (= lt!655039 (Intermediate!12632 false resIndex!21 resX!21))))

(declare-fun res!1028205 () Bool)

(assert (=> start!128876 (=> (not res!1028205) (not e!843367))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128876 (= res!1028205 (validMask!0 mask!2512))))

(assert (=> start!128876 e!843367))

(assert (=> start!128876 true))

(declare-fun array_inv!37849 (array!100663) Bool)

(assert (=> start!128876 (array_inv!37849 a!2804)))

(declare-fun b!1509163 () Bool)

(declare-fun res!1028208 () Bool)

(assert (=> b!1509163 (=> (not res!1028208) (not e!843367))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509163 (= res!1028208 (validKeyInArray!0 (select (arr!48568 a!2804) i!961)))))

(declare-fun b!1509164 () Bool)

(declare-fun res!1028210 () Bool)

(assert (=> b!1509164 (=> (not res!1028210) (not e!843368))))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1509164 (= res!1028210 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48568 a!2804) j!70) a!2804 mask!2512) lt!655039))))

(declare-fun b!1509165 () Bool)

(declare-fun res!1028204 () Bool)

(assert (=> b!1509165 (=> (not res!1028204) (not e!843367))))

(declare-datatypes ((List!35038 0))(
  ( (Nil!35035) (Cons!35034 (h!36452 (_ BitVec 64)) (t!49724 List!35038)) )
))
(declare-fun arrayNoDuplicates!0 (array!100663 (_ BitVec 32) List!35038) Bool)

(assert (=> b!1509165 (= res!1028204 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35035))))

(declare-fun b!1509166 () Bool)

(declare-fun res!1028206 () Bool)

(assert (=> b!1509166 (=> (not res!1028206) (not e!843367))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100663 (_ BitVec 32)) Bool)

(assert (=> b!1509166 (= res!1028206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509167 () Bool)

(declare-fun res!1028209 () Bool)

(assert (=> b!1509167 (=> (not res!1028209) (not e!843367))))

(assert (=> b!1509167 (= res!1028209 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49119 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49119 a!2804))))))

(declare-fun b!1509168 () Bool)

(assert (=> b!1509168 (= e!843368 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun b!1509169 () Bool)

(declare-fun res!1028207 () Bool)

(assert (=> b!1509169 (=> (not res!1028207) (not e!843367))))

(assert (=> b!1509169 (= res!1028207 (validKeyInArray!0 (select (arr!48568 a!2804) j!70)))))

(assert (= (and start!128876 res!1028205) b!1509161))

(assert (= (and b!1509161 res!1028202) b!1509163))

(assert (= (and b!1509163 res!1028208) b!1509169))

(assert (= (and b!1509169 res!1028207) b!1509166))

(assert (= (and b!1509166 res!1028206) b!1509165))

(assert (= (and b!1509165 res!1028204) b!1509167))

(assert (= (and b!1509167 res!1028209) b!1509162))

(assert (= (and b!1509162 res!1028203) b!1509164))

(assert (= (and b!1509164 res!1028210) b!1509168))

(declare-fun m!1391889 () Bool)

(assert (=> b!1509162 m!1391889))

(assert (=> b!1509162 m!1391889))

(declare-fun m!1391891 () Bool)

(assert (=> b!1509162 m!1391891))

(assert (=> b!1509162 m!1391891))

(assert (=> b!1509162 m!1391889))

(declare-fun m!1391893 () Bool)

(assert (=> b!1509162 m!1391893))

(declare-fun m!1391895 () Bool)

(assert (=> b!1509163 m!1391895))

(assert (=> b!1509163 m!1391895))

(declare-fun m!1391897 () Bool)

(assert (=> b!1509163 m!1391897))

(declare-fun m!1391899 () Bool)

(assert (=> b!1509165 m!1391899))

(declare-fun m!1391901 () Bool)

(assert (=> b!1509166 m!1391901))

(declare-fun m!1391903 () Bool)

(assert (=> start!128876 m!1391903))

(declare-fun m!1391905 () Bool)

(assert (=> start!128876 m!1391905))

(assert (=> b!1509169 m!1391889))

(assert (=> b!1509169 m!1391889))

(declare-fun m!1391907 () Bool)

(assert (=> b!1509169 m!1391907))

(assert (=> b!1509164 m!1391889))

(assert (=> b!1509164 m!1391889))

(declare-fun m!1391909 () Bool)

(assert (=> b!1509164 m!1391909))

(check-sat (not b!1509169) (not start!128876) (not b!1509166) (not b!1509162) (not b!1509165) (not b!1509163) (not b!1509164))
(check-sat)
