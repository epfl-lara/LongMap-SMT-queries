; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129180 () Bool)

(assert start!129180)

(declare-fun b!1516279 () Bool)

(declare-fun e!846085 () Bool)

(assert (=> b!1516279 (= e!846085 (not true))))

(declare-fun e!846087 () Bool)

(assert (=> b!1516279 e!846087))

(declare-fun res!1036184 () Bool)

(assert (=> b!1516279 (=> (not res!1036184) (not e!846087))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101036 0))(
  ( (array!101037 (arr!48755 (Array (_ BitVec 32) (_ BitVec 64))) (size!49305 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101036)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101036 (_ BitVec 32)) Bool)

(assert (=> b!1516279 (= res!1036184 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50720 0))(
  ( (Unit!50721) )
))
(declare-fun lt!657348 () Unit!50720)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101036 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50720)

(assert (=> b!1516279 (= lt!657348 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516280 () Bool)

(declare-fun res!1036185 () Bool)

(declare-fun e!846086 () Bool)

(assert (=> b!1516280 (=> (not res!1036185) (not e!846086))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1516280 (= res!1036185 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49305 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49305 a!2804))))))

(declare-fun b!1516281 () Bool)

(declare-fun res!1036187 () Bool)

(assert (=> b!1516281 (=> (not res!1036187) (not e!846086))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516281 (= res!1036187 (validKeyInArray!0 (select (arr!48755 a!2804) i!961)))))

(declare-fun b!1516282 () Bool)

(declare-fun res!1036186 () Bool)

(assert (=> b!1516282 (=> (not res!1036186) (not e!846086))))

(assert (=> b!1516282 (= res!1036186 (validKeyInArray!0 (select (arr!48755 a!2804) j!70)))))

(declare-fun res!1036190 () Bool)

(assert (=> start!129180 (=> (not res!1036190) (not e!846086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129180 (= res!1036190 (validMask!0 mask!2512))))

(assert (=> start!129180 e!846086))

(assert (=> start!129180 true))

(declare-fun array_inv!37783 (array!101036) Bool)

(assert (=> start!129180 (array_inv!37783 a!2804)))

(declare-fun b!1516283 () Bool)

(declare-fun res!1036191 () Bool)

(assert (=> b!1516283 (=> (not res!1036191) (not e!846086))))

(assert (=> b!1516283 (= res!1036191 (and (= (size!49305 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49305 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49305 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516284 () Bool)

(declare-datatypes ((SeekEntryResult!12926 0))(
  ( (MissingZero!12926 (index!54099 (_ BitVec 32))) (Found!12926 (index!54100 (_ BitVec 32))) (Intermediate!12926 (undefined!13738 Bool) (index!54101 (_ BitVec 32)) (x!135796 (_ BitVec 32))) (Undefined!12926) (MissingVacant!12926 (index!54102 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101036 (_ BitVec 32)) SeekEntryResult!12926)

(assert (=> b!1516284 (= e!846087 (= (seekEntry!0 (select (arr!48755 a!2804) j!70) a!2804 mask!2512) (Found!12926 j!70)))))

(declare-fun b!1516285 () Bool)

(declare-fun res!1036192 () Bool)

(assert (=> b!1516285 (=> (not res!1036192) (not e!846085))))

(declare-fun lt!657347 () SeekEntryResult!12926)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101036 (_ BitVec 32)) SeekEntryResult!12926)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516285 (= res!1036192 (= lt!657347 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48755 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48755 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101037 (store (arr!48755 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49305 a!2804)) mask!2512)))))

(declare-fun b!1516286 () Bool)

(assert (=> b!1516286 (= e!846086 e!846085)))

(declare-fun res!1036183 () Bool)

(assert (=> b!1516286 (=> (not res!1036183) (not e!846085))))

(declare-fun lt!657349 () SeekEntryResult!12926)

(assert (=> b!1516286 (= res!1036183 (= lt!657347 lt!657349))))

(assert (=> b!1516286 (= lt!657349 (Intermediate!12926 false resIndex!21 resX!21))))

(assert (=> b!1516286 (= lt!657347 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48755 a!2804) j!70) mask!2512) (select (arr!48755 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516287 () Bool)

(declare-fun res!1036188 () Bool)

(assert (=> b!1516287 (=> (not res!1036188) (not e!846086))))

(assert (=> b!1516287 (= res!1036188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1516288 () Bool)

(declare-fun res!1036182 () Bool)

(assert (=> b!1516288 (=> (not res!1036182) (not e!846085))))

(assert (=> b!1516288 (= res!1036182 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48755 a!2804) j!70) a!2804 mask!2512) lt!657349))))

(declare-fun b!1516289 () Bool)

(declare-fun res!1036189 () Bool)

(assert (=> b!1516289 (=> (not res!1036189) (not e!846086))))

(declare-datatypes ((List!35238 0))(
  ( (Nil!35235) (Cons!35234 (h!36646 (_ BitVec 64)) (t!49932 List!35238)) )
))
(declare-fun arrayNoDuplicates!0 (array!101036 (_ BitVec 32) List!35238) Bool)

(assert (=> b!1516289 (= res!1036189 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35235))))

(assert (= (and start!129180 res!1036190) b!1516283))

(assert (= (and b!1516283 res!1036191) b!1516281))

(assert (= (and b!1516281 res!1036187) b!1516282))

(assert (= (and b!1516282 res!1036186) b!1516287))

(assert (= (and b!1516287 res!1036188) b!1516289))

(assert (= (and b!1516289 res!1036189) b!1516280))

(assert (= (and b!1516280 res!1036185) b!1516286))

(assert (= (and b!1516286 res!1036183) b!1516288))

(assert (= (and b!1516288 res!1036182) b!1516285))

(assert (= (and b!1516285 res!1036192) b!1516279))

(assert (= (and b!1516279 res!1036184) b!1516284))

(declare-fun m!1399537 () Bool)

(assert (=> b!1516285 m!1399537))

(declare-fun m!1399539 () Bool)

(assert (=> b!1516285 m!1399539))

(assert (=> b!1516285 m!1399539))

(declare-fun m!1399541 () Bool)

(assert (=> b!1516285 m!1399541))

(assert (=> b!1516285 m!1399541))

(assert (=> b!1516285 m!1399539))

(declare-fun m!1399543 () Bool)

(assert (=> b!1516285 m!1399543))

(declare-fun m!1399545 () Bool)

(assert (=> b!1516287 m!1399545))

(declare-fun m!1399547 () Bool)

(assert (=> b!1516284 m!1399547))

(assert (=> b!1516284 m!1399547))

(declare-fun m!1399549 () Bool)

(assert (=> b!1516284 m!1399549))

(declare-fun m!1399551 () Bool)

(assert (=> b!1516289 m!1399551))

(declare-fun m!1399553 () Bool)

(assert (=> start!129180 m!1399553))

(declare-fun m!1399555 () Bool)

(assert (=> start!129180 m!1399555))

(assert (=> b!1516288 m!1399547))

(assert (=> b!1516288 m!1399547))

(declare-fun m!1399557 () Bool)

(assert (=> b!1516288 m!1399557))

(declare-fun m!1399559 () Bool)

(assert (=> b!1516281 m!1399559))

(assert (=> b!1516281 m!1399559))

(declare-fun m!1399561 () Bool)

(assert (=> b!1516281 m!1399561))

(assert (=> b!1516286 m!1399547))

(assert (=> b!1516286 m!1399547))

(declare-fun m!1399563 () Bool)

(assert (=> b!1516286 m!1399563))

(assert (=> b!1516286 m!1399563))

(assert (=> b!1516286 m!1399547))

(declare-fun m!1399565 () Bool)

(assert (=> b!1516286 m!1399565))

(declare-fun m!1399567 () Bool)

(assert (=> b!1516279 m!1399567))

(declare-fun m!1399569 () Bool)

(assert (=> b!1516279 m!1399569))

(assert (=> b!1516282 m!1399547))

(assert (=> b!1516282 m!1399547))

(declare-fun m!1399571 () Bool)

(assert (=> b!1516282 m!1399571))

(push 1)

