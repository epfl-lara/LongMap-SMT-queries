; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128768 () Bool)

(assert start!128768)

(declare-fun b!1509178 () Bool)

(declare-fun e!842909 () Bool)

(assert (=> b!1509178 (= e!842909 (not true))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!100624 0))(
  ( (array!100625 (arr!48550 (Array (_ BitVec 32) (_ BitVec 64))) (size!49102 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100624)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100624 (_ BitVec 32)) Bool)

(assert (=> b!1509178 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-datatypes ((Unit!50195 0))(
  ( (Unit!50196) )
))
(declare-fun lt!654622 () Unit!50195)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100624 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50195)

(assert (=> b!1509178 (= lt!654622 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1029295 () Bool)

(declare-fun e!842910 () Bool)

(assert (=> start!128768 (=> (not res!1029295) (not e!842910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128768 (= res!1029295 (validMask!0 mask!2512))))

(assert (=> start!128768 e!842910))

(assert (=> start!128768 true))

(declare-fun array_inv!37783 (array!100624) Bool)

(assert (=> start!128768 (array_inv!37783 a!2804)))

(declare-fun b!1509179 () Bool)

(declare-fun res!1029294 () Bool)

(assert (=> b!1509179 (=> (not res!1029294) (not e!842910))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1509179 (= res!1029294 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49102 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49102 a!2804))))))

(declare-fun b!1509180 () Bool)

(declare-fun res!1029290 () Bool)

(assert (=> b!1509180 (=> (not res!1029290) (not e!842909))))

(declare-datatypes ((SeekEntryResult!12744 0))(
  ( (MissingZero!12744 (index!53371 (_ BitVec 32))) (Found!12744 (index!53372 (_ BitVec 32))) (Intermediate!12744 (undefined!13556 Bool) (index!53373 (_ BitVec 32)) (x!135128 (_ BitVec 32))) (Undefined!12744) (MissingVacant!12744 (index!53374 (_ BitVec 32))) )
))
(declare-fun lt!654623 () SeekEntryResult!12744)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100624 (_ BitVec 32)) SeekEntryResult!12744)

(assert (=> b!1509180 (= res!1029290 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48550 a!2804) j!70) a!2804 mask!2512) lt!654623))))

(declare-fun b!1509181 () Bool)

(declare-fun res!1029296 () Bool)

(assert (=> b!1509181 (=> (not res!1029296) (not e!842910))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509181 (= res!1029296 (validKeyInArray!0 (select (arr!48550 a!2804) i!961)))))

(declare-fun b!1509182 () Bool)

(declare-fun res!1029288 () Bool)

(assert (=> b!1509182 (=> (not res!1029288) (not e!842910))))

(declare-datatypes ((List!35111 0))(
  ( (Nil!35108) (Cons!35107 (h!36520 (_ BitVec 64)) (t!49797 List!35111)) )
))
(declare-fun arrayNoDuplicates!0 (array!100624 (_ BitVec 32) List!35111) Bool)

(assert (=> b!1509182 (= res!1029288 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35108))))

(declare-fun b!1509183 () Bool)

(assert (=> b!1509183 (= e!842910 e!842909)))

(declare-fun res!1029292 () Bool)

(assert (=> b!1509183 (=> (not res!1029292) (not e!842909))))

(declare-fun lt!654624 () SeekEntryResult!12744)

(assert (=> b!1509183 (= res!1029292 (= lt!654624 lt!654623))))

(assert (=> b!1509183 (= lt!654623 (Intermediate!12744 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509183 (= lt!654624 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48550 a!2804) j!70) mask!2512) (select (arr!48550 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509184 () Bool)

(declare-fun res!1029289 () Bool)

(assert (=> b!1509184 (=> (not res!1029289) (not e!842910))))

(assert (=> b!1509184 (= res!1029289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509185 () Bool)

(declare-fun res!1029293 () Bool)

(assert (=> b!1509185 (=> (not res!1029293) (not e!842910))))

(assert (=> b!1509185 (= res!1029293 (and (= (size!49102 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49102 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49102 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509186 () Bool)

(declare-fun res!1029291 () Bool)

(assert (=> b!1509186 (=> (not res!1029291) (not e!842910))))

(assert (=> b!1509186 (= res!1029291 (validKeyInArray!0 (select (arr!48550 a!2804) j!70)))))

(declare-fun b!1509187 () Bool)

(declare-fun res!1029287 () Bool)

(assert (=> b!1509187 (=> (not res!1029287) (not e!842909))))

(assert (=> b!1509187 (= res!1029287 (= lt!654624 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48550 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48550 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100625 (store (arr!48550 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49102 a!2804)) mask!2512)))))

(assert (= (and start!128768 res!1029295) b!1509185))

(assert (= (and b!1509185 res!1029293) b!1509181))

(assert (= (and b!1509181 res!1029296) b!1509186))

(assert (= (and b!1509186 res!1029291) b!1509184))

(assert (= (and b!1509184 res!1029289) b!1509182))

(assert (= (and b!1509182 res!1029288) b!1509179))

(assert (= (and b!1509179 res!1029294) b!1509183))

(assert (= (and b!1509183 res!1029292) b!1509180))

(assert (= (and b!1509180 res!1029290) b!1509187))

(assert (= (and b!1509187 res!1029287) b!1509178))

(declare-fun m!1391099 () Bool)

(assert (=> b!1509187 m!1391099))

(declare-fun m!1391101 () Bool)

(assert (=> b!1509187 m!1391101))

(assert (=> b!1509187 m!1391101))

(declare-fun m!1391103 () Bool)

(assert (=> b!1509187 m!1391103))

(assert (=> b!1509187 m!1391103))

(assert (=> b!1509187 m!1391101))

(declare-fun m!1391105 () Bool)

(assert (=> b!1509187 m!1391105))

(declare-fun m!1391107 () Bool)

(assert (=> start!128768 m!1391107))

(declare-fun m!1391109 () Bool)

(assert (=> start!128768 m!1391109))

(declare-fun m!1391111 () Bool)

(assert (=> b!1509182 m!1391111))

(declare-fun m!1391113 () Bool)

(assert (=> b!1509180 m!1391113))

(assert (=> b!1509180 m!1391113))

(declare-fun m!1391115 () Bool)

(assert (=> b!1509180 m!1391115))

(declare-fun m!1391117 () Bool)

(assert (=> b!1509184 m!1391117))

(assert (=> b!1509183 m!1391113))

(assert (=> b!1509183 m!1391113))

(declare-fun m!1391119 () Bool)

(assert (=> b!1509183 m!1391119))

(assert (=> b!1509183 m!1391119))

(assert (=> b!1509183 m!1391113))

(declare-fun m!1391121 () Bool)

(assert (=> b!1509183 m!1391121))

(declare-fun m!1391123 () Bool)

(assert (=> b!1509178 m!1391123))

(declare-fun m!1391125 () Bool)

(assert (=> b!1509178 m!1391125))

(declare-fun m!1391127 () Bool)

(assert (=> b!1509181 m!1391127))

(assert (=> b!1509181 m!1391127))

(declare-fun m!1391129 () Bool)

(assert (=> b!1509181 m!1391129))

(assert (=> b!1509186 m!1391113))

(assert (=> b!1509186 m!1391113))

(declare-fun m!1391131 () Bool)

(assert (=> b!1509186 m!1391131))

(check-sat (not b!1509182) (not start!128768) (not b!1509184) (not b!1509183) (not b!1509180) (not b!1509187) (not b!1509181) (not b!1509178) (not b!1509186))
(check-sat)
