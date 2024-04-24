; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129008 () Bool)

(assert start!129008)

(declare-fun res!1028997 () Bool)

(declare-fun e!843803 () Bool)

(assert (=> start!129008 (=> (not res!1028997) (not e!843803))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129008 (= res!1028997 (validMask!0 mask!2512))))

(assert (=> start!129008 e!843803))

(assert (=> start!129008 true))

(declare-datatypes ((array!100717 0))(
  ( (array!100718 (arr!48592 (Array (_ BitVec 32) (_ BitVec 64))) (size!49143 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100717)

(declare-fun array_inv!37873 (array!100717) Bool)

(assert (=> start!129008 (array_inv!37873 a!2804)))

(declare-fun b!1510160 () Bool)

(declare-fun res!1028998 () Bool)

(declare-fun e!843804 () Bool)

(assert (=> b!1510160 (=> (not res!1028998) (not e!843804))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12656 0))(
  ( (MissingZero!12656 (index!53019 (_ BitVec 32))) (Found!12656 (index!53020 (_ BitVec 32))) (Intermediate!12656 (undefined!13468 Bool) (index!53021 (_ BitVec 32)) (x!134981 (_ BitVec 32))) (Undefined!12656) (MissingVacant!12656 (index!53022 (_ BitVec 32))) )
))
(declare-fun lt!655270 () SeekEntryResult!12656)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100717 (_ BitVec 32)) SeekEntryResult!12656)

(assert (=> b!1510160 (= res!1028998 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48592 a!2804) j!70) a!2804 mask!2512) lt!655270))))

(declare-fun b!1510161 () Bool)

(assert (=> b!1510161 (= e!843803 e!843804)))

(declare-fun res!1028996 () Bool)

(assert (=> b!1510161 (=> (not res!1028996) (not e!843804))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510161 (= res!1028996 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48592 a!2804) j!70) mask!2512) (select (arr!48592 a!2804) j!70) a!2804 mask!2512) lt!655270))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1510161 (= lt!655270 (Intermediate!12656 false resIndex!21 resX!21))))

(declare-fun b!1510162 () Bool)

(declare-fun res!1028991 () Bool)

(assert (=> b!1510162 (=> (not res!1028991) (not e!843803))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100717 (_ BitVec 32)) Bool)

(assert (=> b!1510162 (= res!1028991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510163 () Bool)

(declare-fun res!1028993 () Bool)

(assert (=> b!1510163 (=> (not res!1028993) (not e!843803))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510163 (= res!1028993 (validKeyInArray!0 (select (arr!48592 a!2804) i!961)))))

(declare-fun b!1510164 () Bool)

(declare-fun res!1028995 () Bool)

(assert (=> b!1510164 (=> (not res!1028995) (not e!843803))))

(declare-datatypes ((List!35062 0))(
  ( (Nil!35059) (Cons!35058 (h!36482 (_ BitVec 64)) (t!49748 List!35062)) )
))
(declare-fun arrayNoDuplicates!0 (array!100717 (_ BitVec 32) List!35062) Bool)

(assert (=> b!1510164 (= res!1028995 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35059))))

(declare-fun b!1510165 () Bool)

(declare-fun res!1028994 () Bool)

(assert (=> b!1510165 (=> (not res!1028994) (not e!843803))))

(assert (=> b!1510165 (= res!1028994 (validKeyInArray!0 (select (arr!48592 a!2804) j!70)))))

(declare-fun b!1510166 () Bool)

(declare-fun res!1028992 () Bool)

(assert (=> b!1510166 (=> (not res!1028992) (not e!843803))))

(assert (=> b!1510166 (= res!1028992 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49143 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49143 a!2804))))))

(declare-fun b!1510167 () Bool)

(assert (=> b!1510167 (= e!843804 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun lt!655269 () (_ BitVec 32))

(assert (=> b!1510167 (= lt!655269 (toIndex!0 (select (store (arr!48592 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1510168 () Bool)

(declare-fun res!1028999 () Bool)

(assert (=> b!1510168 (=> (not res!1028999) (not e!843803))))

(assert (=> b!1510168 (= res!1028999 (and (= (size!49143 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49143 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49143 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129008 res!1028997) b!1510168))

(assert (= (and b!1510168 res!1028999) b!1510163))

(assert (= (and b!1510163 res!1028993) b!1510165))

(assert (= (and b!1510165 res!1028994) b!1510162))

(assert (= (and b!1510162 res!1028991) b!1510164))

(assert (= (and b!1510164 res!1028995) b!1510166))

(assert (= (and b!1510166 res!1028992) b!1510161))

(assert (= (and b!1510161 res!1028996) b!1510160))

(assert (= (and b!1510160 res!1028998) b!1510167))

(declare-fun m!1392627 () Bool)

(assert (=> b!1510164 m!1392627))

(declare-fun m!1392629 () Bool)

(assert (=> start!129008 m!1392629))

(declare-fun m!1392631 () Bool)

(assert (=> start!129008 m!1392631))

(declare-fun m!1392633 () Bool)

(assert (=> b!1510163 m!1392633))

(assert (=> b!1510163 m!1392633))

(declare-fun m!1392635 () Bool)

(assert (=> b!1510163 m!1392635))

(declare-fun m!1392637 () Bool)

(assert (=> b!1510161 m!1392637))

(assert (=> b!1510161 m!1392637))

(declare-fun m!1392639 () Bool)

(assert (=> b!1510161 m!1392639))

(assert (=> b!1510161 m!1392639))

(assert (=> b!1510161 m!1392637))

(declare-fun m!1392641 () Bool)

(assert (=> b!1510161 m!1392641))

(assert (=> b!1510165 m!1392637))

(assert (=> b!1510165 m!1392637))

(declare-fun m!1392643 () Bool)

(assert (=> b!1510165 m!1392643))

(declare-fun m!1392645 () Bool)

(assert (=> b!1510167 m!1392645))

(declare-fun m!1392647 () Bool)

(assert (=> b!1510167 m!1392647))

(assert (=> b!1510167 m!1392647))

(declare-fun m!1392649 () Bool)

(assert (=> b!1510167 m!1392649))

(assert (=> b!1510160 m!1392637))

(assert (=> b!1510160 m!1392637))

(declare-fun m!1392651 () Bool)

(assert (=> b!1510160 m!1392651))

(declare-fun m!1392653 () Bool)

(assert (=> b!1510162 m!1392653))

(check-sat (not start!129008) (not b!1510163) (not b!1510162) (not b!1510164) (not b!1510160) (not b!1510167) (not b!1510165) (not b!1510161))
(check-sat)
