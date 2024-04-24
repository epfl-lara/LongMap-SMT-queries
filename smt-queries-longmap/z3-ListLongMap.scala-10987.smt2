; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129014 () Bool)

(assert start!129014)

(declare-fun b!1510242 () Bool)

(declare-fun e!843831 () Bool)

(assert (=> b!1510242 (= e!843831 false)))

(declare-fun lt!655288 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100723 0))(
  ( (array!100724 (arr!48595 (Array (_ BitVec 32) (_ BitVec 64))) (size!49146 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100723)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510242 (= lt!655288 (toIndex!0 (select (store (arr!48595 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1510243 () Bool)

(declare-fun res!1029073 () Bool)

(declare-fun e!843830 () Bool)

(assert (=> b!1510243 (=> (not res!1029073) (not e!843830))))

(declare-datatypes ((List!35065 0))(
  ( (Nil!35062) (Cons!35061 (h!36485 (_ BitVec 64)) (t!49751 List!35065)) )
))
(declare-fun arrayNoDuplicates!0 (array!100723 (_ BitVec 32) List!35065) Bool)

(assert (=> b!1510243 (= res!1029073 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35062))))

(declare-fun b!1510244 () Bool)

(assert (=> b!1510244 (= e!843830 e!843831)))

(declare-fun res!1029075 () Bool)

(assert (=> b!1510244 (=> (not res!1029075) (not e!843831))))

(declare-datatypes ((SeekEntryResult!12659 0))(
  ( (MissingZero!12659 (index!53031 (_ BitVec 32))) (Found!12659 (index!53032 (_ BitVec 32))) (Intermediate!12659 (undefined!13471 Bool) (index!53033 (_ BitVec 32)) (x!134992 (_ BitVec 32))) (Undefined!12659) (MissingVacant!12659 (index!53034 (_ BitVec 32))) )
))
(declare-fun lt!655287 () SeekEntryResult!12659)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100723 (_ BitVec 32)) SeekEntryResult!12659)

(assert (=> b!1510244 (= res!1029075 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48595 a!2804) j!70) mask!2512) (select (arr!48595 a!2804) j!70) a!2804 mask!2512) lt!655287))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1510244 (= lt!655287 (Intermediate!12659 false resIndex!21 resX!21))))

(declare-fun b!1510245 () Bool)

(declare-fun res!1029077 () Bool)

(assert (=> b!1510245 (=> (not res!1029077) (not e!843831))))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1510245 (= res!1029077 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48595 a!2804) j!70) a!2804 mask!2512) lt!655287))))

(declare-fun b!1510246 () Bool)

(declare-fun res!1029074 () Bool)

(assert (=> b!1510246 (=> (not res!1029074) (not e!843830))))

(assert (=> b!1510246 (= res!1029074 (and (= (size!49146 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49146 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49146 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510247 () Bool)

(declare-fun res!1029078 () Bool)

(assert (=> b!1510247 (=> (not res!1029078) (not e!843830))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100723 (_ BitVec 32)) Bool)

(assert (=> b!1510247 (= res!1029078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510248 () Bool)

(declare-fun res!1029072 () Bool)

(assert (=> b!1510248 (=> (not res!1029072) (not e!843830))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510248 (= res!1029072 (validKeyInArray!0 (select (arr!48595 a!2804) i!961)))))

(declare-fun b!1510249 () Bool)

(declare-fun res!1029076 () Bool)

(assert (=> b!1510249 (=> (not res!1029076) (not e!843830))))

(assert (=> b!1510249 (= res!1029076 (validKeyInArray!0 (select (arr!48595 a!2804) j!70)))))

(declare-fun res!1029079 () Bool)

(assert (=> start!129014 (=> (not res!1029079) (not e!843830))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129014 (= res!1029079 (validMask!0 mask!2512))))

(assert (=> start!129014 e!843830))

(assert (=> start!129014 true))

(declare-fun array_inv!37876 (array!100723) Bool)

(assert (=> start!129014 (array_inv!37876 a!2804)))

(declare-fun b!1510241 () Bool)

(declare-fun res!1029080 () Bool)

(assert (=> b!1510241 (=> (not res!1029080) (not e!843830))))

(assert (=> b!1510241 (= res!1029080 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49146 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49146 a!2804))))))

(assert (= (and start!129014 res!1029079) b!1510246))

(assert (= (and b!1510246 res!1029074) b!1510248))

(assert (= (and b!1510248 res!1029072) b!1510249))

(assert (= (and b!1510249 res!1029076) b!1510247))

(assert (= (and b!1510247 res!1029078) b!1510243))

(assert (= (and b!1510243 res!1029073) b!1510241))

(assert (= (and b!1510241 res!1029080) b!1510244))

(assert (= (and b!1510244 res!1029075) b!1510245))

(assert (= (and b!1510245 res!1029077) b!1510242))

(declare-fun m!1392711 () Bool)

(assert (=> b!1510245 m!1392711))

(assert (=> b!1510245 m!1392711))

(declare-fun m!1392713 () Bool)

(assert (=> b!1510245 m!1392713))

(assert (=> b!1510244 m!1392711))

(assert (=> b!1510244 m!1392711))

(declare-fun m!1392715 () Bool)

(assert (=> b!1510244 m!1392715))

(assert (=> b!1510244 m!1392715))

(assert (=> b!1510244 m!1392711))

(declare-fun m!1392717 () Bool)

(assert (=> b!1510244 m!1392717))

(assert (=> b!1510249 m!1392711))

(assert (=> b!1510249 m!1392711))

(declare-fun m!1392719 () Bool)

(assert (=> b!1510249 m!1392719))

(declare-fun m!1392721 () Bool)

(assert (=> b!1510247 m!1392721))

(declare-fun m!1392723 () Bool)

(assert (=> b!1510243 m!1392723))

(declare-fun m!1392725 () Bool)

(assert (=> b!1510248 m!1392725))

(assert (=> b!1510248 m!1392725))

(declare-fun m!1392727 () Bool)

(assert (=> b!1510248 m!1392727))

(declare-fun m!1392729 () Bool)

(assert (=> start!129014 m!1392729))

(declare-fun m!1392731 () Bool)

(assert (=> start!129014 m!1392731))

(declare-fun m!1392733 () Bool)

(assert (=> b!1510242 m!1392733))

(declare-fun m!1392735 () Bool)

(assert (=> b!1510242 m!1392735))

(assert (=> b!1510242 m!1392735))

(declare-fun m!1392737 () Bool)

(assert (=> b!1510242 m!1392737))

(check-sat (not b!1510249) (not b!1510245) (not start!129014) (not b!1510243) (not b!1510248) (not b!1510242) (not b!1510247) (not b!1510244))
(check-sat)
