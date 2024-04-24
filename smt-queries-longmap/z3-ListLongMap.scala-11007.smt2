; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129176 () Bool)

(assert start!129176)

(declare-fun b!1512243 () Bool)

(declare-fun res!1030970 () Bool)

(declare-fun e!844585 () Bool)

(assert (=> b!1512243 (=> (not res!1030970) (not e!844585))))

(declare-datatypes ((SeekEntryResult!12719 0))(
  ( (MissingZero!12719 (index!53271 (_ BitVec 32))) (Found!12719 (index!53272 (_ BitVec 32))) (Intermediate!12719 (undefined!13531 Bool) (index!53273 (_ BitVec 32)) (x!135218 (_ BitVec 32))) (Undefined!12719) (MissingVacant!12719 (index!53274 (_ BitVec 32))) )
))
(declare-fun lt!655823 () SeekEntryResult!12719)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100846 0))(
  ( (array!100847 (arr!48655 (Array (_ BitVec 32) (_ BitVec 64))) (size!49206 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100846)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100846 (_ BitVec 32)) SeekEntryResult!12719)

(assert (=> b!1512243 (= res!1030970 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48655 a!2804) j!70) a!2804 mask!2512) lt!655823))))

(declare-fun b!1512244 () Bool)

(declare-fun res!1030975 () Bool)

(declare-fun e!844587 () Bool)

(assert (=> b!1512244 (=> (not res!1030975) (not e!844587))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100846 (_ BitVec 32)) Bool)

(assert (=> b!1512244 (= res!1030975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun e!844584 () Bool)

(declare-fun b!1512245 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100846 (_ BitVec 32)) SeekEntryResult!12719)

(assert (=> b!1512245 (= e!844584 (= (seekEntry!0 (select (arr!48655 a!2804) j!70) a!2804 mask!2512) (Found!12719 j!70)))))

(declare-fun res!1030972 () Bool)

(assert (=> start!129176 (=> (not res!1030972) (not e!844587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129176 (= res!1030972 (validMask!0 mask!2512))))

(assert (=> start!129176 e!844587))

(assert (=> start!129176 true))

(declare-fun array_inv!37936 (array!100846) Bool)

(assert (=> start!129176 (array_inv!37936 a!2804)))

(declare-fun b!1512246 () Bool)

(assert (=> b!1512246 (= e!844585 (not true))))

(assert (=> b!1512246 e!844584))

(declare-fun res!1030976 () Bool)

(assert (=> b!1512246 (=> (not res!1030976) (not e!844584))))

(assert (=> b!1512246 (= res!1030976 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50341 0))(
  ( (Unit!50342) )
))
(declare-fun lt!655825 () Unit!50341)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100846 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50341)

(assert (=> b!1512246 (= lt!655825 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512247 () Bool)

(declare-fun res!1030973 () Bool)

(assert (=> b!1512247 (=> (not res!1030973) (not e!844587))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1512247 (= res!1030973 (and (= (size!49206 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49206 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49206 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512248 () Bool)

(declare-fun res!1030974 () Bool)

(assert (=> b!1512248 (=> (not res!1030974) (not e!844585))))

(declare-fun lt!655824 () SeekEntryResult!12719)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512248 (= res!1030974 (= lt!655824 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48655 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48655 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100847 (store (arr!48655 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49206 a!2804)) mask!2512)))))

(declare-fun b!1512249 () Bool)

(declare-fun res!1030979 () Bool)

(assert (=> b!1512249 (=> (not res!1030979) (not e!844587))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512249 (= res!1030979 (validKeyInArray!0 (select (arr!48655 a!2804) j!70)))))

(declare-fun b!1512250 () Bool)

(declare-fun res!1030971 () Bool)

(assert (=> b!1512250 (=> (not res!1030971) (not e!844587))))

(assert (=> b!1512250 (= res!1030971 (validKeyInArray!0 (select (arr!48655 a!2804) i!961)))))

(declare-fun b!1512251 () Bool)

(assert (=> b!1512251 (= e!844587 e!844585)))

(declare-fun res!1030977 () Bool)

(assert (=> b!1512251 (=> (not res!1030977) (not e!844585))))

(assert (=> b!1512251 (= res!1030977 (= lt!655824 lt!655823))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1512251 (= lt!655823 (Intermediate!12719 false resIndex!21 resX!21))))

(assert (=> b!1512251 (= lt!655824 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48655 a!2804) j!70) mask!2512) (select (arr!48655 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512252 () Bool)

(declare-fun res!1030969 () Bool)

(assert (=> b!1512252 (=> (not res!1030969) (not e!844587))))

(declare-datatypes ((List!35125 0))(
  ( (Nil!35122) (Cons!35121 (h!36548 (_ BitVec 64)) (t!49811 List!35125)) )
))
(declare-fun arrayNoDuplicates!0 (array!100846 (_ BitVec 32) List!35125) Bool)

(assert (=> b!1512252 (= res!1030969 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35122))))

(declare-fun b!1512253 () Bool)

(declare-fun res!1030978 () Bool)

(assert (=> b!1512253 (=> (not res!1030978) (not e!844587))))

(assert (=> b!1512253 (= res!1030978 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49206 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49206 a!2804))))))

(assert (= (and start!129176 res!1030972) b!1512247))

(assert (= (and b!1512247 res!1030973) b!1512250))

(assert (= (and b!1512250 res!1030971) b!1512249))

(assert (= (and b!1512249 res!1030979) b!1512244))

(assert (= (and b!1512244 res!1030975) b!1512252))

(assert (= (and b!1512252 res!1030969) b!1512253))

(assert (= (and b!1512253 res!1030978) b!1512251))

(assert (= (and b!1512251 res!1030977) b!1512243))

(assert (= (and b!1512243 res!1030970) b!1512248))

(assert (= (and b!1512248 res!1030974) b!1512246))

(assert (= (and b!1512246 res!1030976) b!1512245))

(declare-fun m!1394793 () Bool)

(assert (=> b!1512249 m!1394793))

(assert (=> b!1512249 m!1394793))

(declare-fun m!1394795 () Bool)

(assert (=> b!1512249 m!1394795))

(declare-fun m!1394797 () Bool)

(assert (=> b!1512244 m!1394797))

(declare-fun m!1394799 () Bool)

(assert (=> b!1512246 m!1394799))

(declare-fun m!1394801 () Bool)

(assert (=> b!1512246 m!1394801))

(declare-fun m!1394803 () Bool)

(assert (=> b!1512250 m!1394803))

(assert (=> b!1512250 m!1394803))

(declare-fun m!1394805 () Bool)

(assert (=> b!1512250 m!1394805))

(declare-fun m!1394807 () Bool)

(assert (=> start!129176 m!1394807))

(declare-fun m!1394809 () Bool)

(assert (=> start!129176 m!1394809))

(declare-fun m!1394811 () Bool)

(assert (=> b!1512248 m!1394811))

(declare-fun m!1394813 () Bool)

(assert (=> b!1512248 m!1394813))

(assert (=> b!1512248 m!1394813))

(declare-fun m!1394815 () Bool)

(assert (=> b!1512248 m!1394815))

(assert (=> b!1512248 m!1394815))

(assert (=> b!1512248 m!1394813))

(declare-fun m!1394817 () Bool)

(assert (=> b!1512248 m!1394817))

(assert (=> b!1512245 m!1394793))

(assert (=> b!1512245 m!1394793))

(declare-fun m!1394819 () Bool)

(assert (=> b!1512245 m!1394819))

(assert (=> b!1512243 m!1394793))

(assert (=> b!1512243 m!1394793))

(declare-fun m!1394821 () Bool)

(assert (=> b!1512243 m!1394821))

(declare-fun m!1394823 () Bool)

(assert (=> b!1512252 m!1394823))

(assert (=> b!1512251 m!1394793))

(assert (=> b!1512251 m!1394793))

(declare-fun m!1394825 () Bool)

(assert (=> b!1512251 m!1394825))

(assert (=> b!1512251 m!1394825))

(assert (=> b!1512251 m!1394793))

(declare-fun m!1394827 () Bool)

(assert (=> b!1512251 m!1394827))

(check-sat (not start!129176) (not b!1512248) (not b!1512252) (not b!1512249) (not b!1512251) (not b!1512250) (not b!1512245) (not b!1512244) (not b!1512243) (not b!1512246))
(check-sat)
