; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129086 () Bool)

(assert start!129086)

(declare-fun b!1510844 () Bool)

(declare-fun res!1029574 () Bool)

(declare-fun e!844096 () Bool)

(assert (=> b!1510844 (=> (not res!1029574) (not e!844096))))

(declare-datatypes ((array!100756 0))(
  ( (array!100757 (arr!48610 (Array (_ BitVec 32) (_ BitVec 64))) (size!49161 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100756)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510844 (= res!1029574 (validKeyInArray!0 (select (arr!48610 a!2804) i!961)))))

(declare-fun res!1029578 () Bool)

(assert (=> start!129086 (=> (not res!1029578) (not e!844096))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129086 (= res!1029578 (validMask!0 mask!2512))))

(assert (=> start!129086 e!844096))

(assert (=> start!129086 true))

(declare-fun array_inv!37891 (array!100756) Bool)

(assert (=> start!129086 (array_inv!37891 a!2804)))

(declare-fun b!1510845 () Bool)

(declare-fun res!1029575 () Bool)

(declare-fun e!844098 () Bool)

(assert (=> b!1510845 (=> (not res!1029575) (not e!844098))))

(declare-datatypes ((SeekEntryResult!12674 0))(
  ( (MissingZero!12674 (index!53091 (_ BitVec 32))) (Found!12674 (index!53092 (_ BitVec 32))) (Intermediate!12674 (undefined!13486 Bool) (index!53093 (_ BitVec 32)) (x!135053 (_ BitVec 32))) (Undefined!12674) (MissingVacant!12674 (index!53094 (_ BitVec 32))) )
))
(declare-fun lt!655452 () SeekEntryResult!12674)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100756 (_ BitVec 32)) SeekEntryResult!12674)

(assert (=> b!1510845 (= res!1029575 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48610 a!2804) j!70) a!2804 mask!2512) lt!655452))))

(declare-fun b!1510846 () Bool)

(declare-fun res!1029570 () Bool)

(assert (=> b!1510846 (=> (not res!1029570) (not e!844096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100756 (_ BitVec 32)) Bool)

(assert (=> b!1510846 (= res!1029570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510847 () Bool)

(declare-fun res!1029577 () Bool)

(assert (=> b!1510847 (=> (not res!1029577) (not e!844096))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1510847 (= res!1029577 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49161 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49161 a!2804))))))

(declare-fun b!1510848 () Bool)

(declare-fun res!1029571 () Bool)

(assert (=> b!1510848 (=> (not res!1029571) (not e!844096))))

(assert (=> b!1510848 (= res!1029571 (validKeyInArray!0 (select (arr!48610 a!2804) j!70)))))

(declare-fun b!1510849 () Bool)

(declare-fun res!1029572 () Bool)

(assert (=> b!1510849 (=> (not res!1029572) (not e!844096))))

(declare-datatypes ((List!35080 0))(
  ( (Nil!35077) (Cons!35076 (h!36503 (_ BitVec 64)) (t!49766 List!35080)) )
))
(declare-fun arrayNoDuplicates!0 (array!100756 (_ BitVec 32) List!35080) Bool)

(assert (=> b!1510849 (= res!1029572 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35077))))

(declare-fun b!1510850 () Bool)

(assert (=> b!1510850 (= e!844098 false)))

(declare-fun lt!655453 () SeekEntryResult!12674)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510850 (= lt!655453 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48610 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48610 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100757 (store (arr!48610 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49161 a!2804)) mask!2512))))

(declare-fun b!1510851 () Bool)

(declare-fun res!1029576 () Bool)

(assert (=> b!1510851 (=> (not res!1029576) (not e!844096))))

(assert (=> b!1510851 (= res!1029576 (and (= (size!49161 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49161 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49161 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510852 () Bool)

(assert (=> b!1510852 (= e!844096 e!844098)))

(declare-fun res!1029573 () Bool)

(assert (=> b!1510852 (=> (not res!1029573) (not e!844098))))

(assert (=> b!1510852 (= res!1029573 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48610 a!2804) j!70) mask!2512) (select (arr!48610 a!2804) j!70) a!2804 mask!2512) lt!655452))))

(assert (=> b!1510852 (= lt!655452 (Intermediate!12674 false resIndex!21 resX!21))))

(assert (= (and start!129086 res!1029578) b!1510851))

(assert (= (and b!1510851 res!1029576) b!1510844))

(assert (= (and b!1510844 res!1029574) b!1510848))

(assert (= (and b!1510848 res!1029571) b!1510846))

(assert (= (and b!1510846 res!1029570) b!1510849))

(assert (= (and b!1510849 res!1029572) b!1510847))

(assert (= (and b!1510847 res!1029577) b!1510852))

(assert (= (and b!1510852 res!1029573) b!1510845))

(assert (= (and b!1510845 res!1029575) b!1510850))

(declare-fun m!1393239 () Bool)

(assert (=> b!1510845 m!1393239))

(assert (=> b!1510845 m!1393239))

(declare-fun m!1393241 () Bool)

(assert (=> b!1510845 m!1393241))

(assert (=> b!1510848 m!1393239))

(assert (=> b!1510848 m!1393239))

(declare-fun m!1393243 () Bool)

(assert (=> b!1510848 m!1393243))

(declare-fun m!1393245 () Bool)

(assert (=> b!1510846 m!1393245))

(assert (=> b!1510852 m!1393239))

(assert (=> b!1510852 m!1393239))

(declare-fun m!1393247 () Bool)

(assert (=> b!1510852 m!1393247))

(assert (=> b!1510852 m!1393247))

(assert (=> b!1510852 m!1393239))

(declare-fun m!1393249 () Bool)

(assert (=> b!1510852 m!1393249))

(declare-fun m!1393251 () Bool)

(assert (=> b!1510844 m!1393251))

(assert (=> b!1510844 m!1393251))

(declare-fun m!1393253 () Bool)

(assert (=> b!1510844 m!1393253))

(declare-fun m!1393255 () Bool)

(assert (=> b!1510849 m!1393255))

(declare-fun m!1393257 () Bool)

(assert (=> start!129086 m!1393257))

(declare-fun m!1393259 () Bool)

(assert (=> start!129086 m!1393259))

(declare-fun m!1393261 () Bool)

(assert (=> b!1510850 m!1393261))

(declare-fun m!1393263 () Bool)

(assert (=> b!1510850 m!1393263))

(assert (=> b!1510850 m!1393263))

(declare-fun m!1393265 () Bool)

(assert (=> b!1510850 m!1393265))

(assert (=> b!1510850 m!1393265))

(assert (=> b!1510850 m!1393263))

(declare-fun m!1393267 () Bool)

(assert (=> b!1510850 m!1393267))

(check-sat (not b!1510845) (not b!1510846) (not b!1510848) (not b!1510844) (not start!129086) (not b!1510852) (not b!1510850) (not b!1510849))
(check-sat)
