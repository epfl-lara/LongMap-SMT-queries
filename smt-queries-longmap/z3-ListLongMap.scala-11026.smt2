; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128936 () Bool)

(assert start!128936)

(declare-fun e!843992 () Bool)

(declare-fun b!1512091 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100792 0))(
  ( (array!100793 (arr!48634 (Array (_ BitVec 32) (_ BitVec 64))) (size!49186 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100792)

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12828 0))(
  ( (MissingZero!12828 (index!53707 (_ BitVec 32))) (Found!12828 (index!53708 (_ BitVec 32))) (Intermediate!12828 (undefined!13640 Bool) (index!53709 (_ BitVec 32)) (x!135436 (_ BitVec 32))) (Undefined!12828) (MissingVacant!12828 (index!53710 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100792 (_ BitVec 32)) SeekEntryResult!12828)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100792 (_ BitVec 32)) SeekEntryResult!12828)

(assert (=> b!1512091 (= e!843992 (= (seekEntryOrOpen!0 (select (arr!48634 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48634 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1512092 () Bool)

(declare-fun res!1032202 () Bool)

(declare-fun e!843995 () Bool)

(assert (=> b!1512092 (=> (not res!1032202) (not e!843995))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512092 (= res!1032202 (validKeyInArray!0 (select (arr!48634 a!2804) i!961)))))

(declare-fun b!1512093 () Bool)

(declare-fun e!843996 () Bool)

(assert (=> b!1512093 (= e!843995 e!843996)))

(declare-fun res!1032210 () Bool)

(assert (=> b!1512093 (=> (not res!1032210) (not e!843996))))

(declare-fun lt!655379 () SeekEntryResult!12828)

(declare-fun lt!655380 () SeekEntryResult!12828)

(assert (=> b!1512093 (= res!1032210 (= lt!655379 lt!655380))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1512093 (= lt!655380 (Intermediate!12828 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100792 (_ BitVec 32)) SeekEntryResult!12828)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512093 (= lt!655379 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48634 a!2804) j!70) mask!2512) (select (arr!48634 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512094 () Bool)

(assert (=> b!1512094 (= e!843996 (not (or (not (= (select (arr!48634 a!2804) j!70) (select (store (arr!48634 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48634 a!2804) index!487) (select (arr!48634 a!2804) j!70)) (not (= (select (arr!48634 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!2512 #b00000000000000000000000000000000) (bvslt index!487 (bvadd #b00000000000000000000000000000001 mask!2512)))))))

(declare-fun e!843994 () Bool)

(assert (=> b!1512094 e!843994))

(declare-fun res!1032207 () Bool)

(assert (=> b!1512094 (=> (not res!1032207) (not e!843994))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100792 (_ BitVec 32)) Bool)

(assert (=> b!1512094 (= res!1032207 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50363 0))(
  ( (Unit!50364) )
))
(declare-fun lt!655378 () Unit!50363)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100792 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50363)

(assert (=> b!1512094 (= lt!655378 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512095 () Bool)

(declare-fun res!1032200 () Bool)

(assert (=> b!1512095 (=> (not res!1032200) (not e!843994))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100792 (_ BitVec 32)) SeekEntryResult!12828)

(assert (=> b!1512095 (= res!1032200 (= (seekEntry!0 (select (arr!48634 a!2804) j!70) a!2804 mask!2512) (Found!12828 j!70)))))

(declare-fun b!1512096 () Bool)

(declare-fun res!1032212 () Bool)

(assert (=> b!1512096 (=> (not res!1032212) (not e!843995))))

(assert (=> b!1512096 (= res!1032212 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49186 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49186 a!2804))))))

(declare-fun b!1512097 () Bool)

(assert (=> b!1512097 (= e!843994 e!843992)))

(declare-fun res!1032201 () Bool)

(assert (=> b!1512097 (=> res!1032201 e!843992)))

(assert (=> b!1512097 (= res!1032201 (or (not (= (select (arr!48634 a!2804) j!70) (select (store (arr!48634 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48634 a!2804) index!487) (select (arr!48634 a!2804) j!70)) (not (= (select (arr!48634 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1512099 () Bool)

(declare-fun res!1032209 () Bool)

(assert (=> b!1512099 (=> (not res!1032209) (not e!843996))))

(assert (=> b!1512099 (= res!1032209 (= lt!655379 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48634 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48634 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100793 (store (arr!48634 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49186 a!2804)) mask!2512)))))

(declare-fun b!1512100 () Bool)

(declare-fun res!1032204 () Bool)

(assert (=> b!1512100 (=> (not res!1032204) (not e!843995))))

(assert (=> b!1512100 (= res!1032204 (validKeyInArray!0 (select (arr!48634 a!2804) j!70)))))

(declare-fun b!1512101 () Bool)

(declare-fun res!1032203 () Bool)

(assert (=> b!1512101 (=> (not res!1032203) (not e!843995))))

(declare-datatypes ((List!35195 0))(
  ( (Nil!35192) (Cons!35191 (h!36604 (_ BitVec 64)) (t!49881 List!35195)) )
))
(declare-fun arrayNoDuplicates!0 (array!100792 (_ BitVec 32) List!35195) Bool)

(assert (=> b!1512101 (= res!1032203 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35192))))

(declare-fun b!1512102 () Bool)

(declare-fun res!1032205 () Bool)

(assert (=> b!1512102 (=> (not res!1032205) (not e!843995))))

(assert (=> b!1512102 (= res!1032205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512103 () Bool)

(declare-fun res!1032208 () Bool)

(assert (=> b!1512103 (=> (not res!1032208) (not e!843996))))

(assert (=> b!1512103 (= res!1032208 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48634 a!2804) j!70) a!2804 mask!2512) lt!655380))))

(declare-fun b!1512098 () Bool)

(declare-fun res!1032211 () Bool)

(assert (=> b!1512098 (=> (not res!1032211) (not e!843995))))

(assert (=> b!1512098 (= res!1032211 (and (= (size!49186 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49186 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49186 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1032206 () Bool)

(assert (=> start!128936 (=> (not res!1032206) (not e!843995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128936 (= res!1032206 (validMask!0 mask!2512))))

(assert (=> start!128936 e!843995))

(assert (=> start!128936 true))

(declare-fun array_inv!37867 (array!100792) Bool)

(assert (=> start!128936 (array_inv!37867 a!2804)))

(assert (= (and start!128936 res!1032206) b!1512098))

(assert (= (and b!1512098 res!1032211) b!1512092))

(assert (= (and b!1512092 res!1032202) b!1512100))

(assert (= (and b!1512100 res!1032204) b!1512102))

(assert (= (and b!1512102 res!1032205) b!1512101))

(assert (= (and b!1512101 res!1032203) b!1512096))

(assert (= (and b!1512096 res!1032212) b!1512093))

(assert (= (and b!1512093 res!1032210) b!1512103))

(assert (= (and b!1512103 res!1032208) b!1512099))

(assert (= (and b!1512099 res!1032209) b!1512094))

(assert (= (and b!1512094 res!1032207) b!1512095))

(assert (= (and b!1512095 res!1032200) b!1512097))

(assert (= (and b!1512097 (not res!1032201)) b!1512091))

(declare-fun m!1394291 () Bool)

(assert (=> b!1512095 m!1394291))

(assert (=> b!1512095 m!1394291))

(declare-fun m!1394293 () Bool)

(assert (=> b!1512095 m!1394293))

(declare-fun m!1394295 () Bool)

(assert (=> b!1512102 m!1394295))

(assert (=> b!1512093 m!1394291))

(assert (=> b!1512093 m!1394291))

(declare-fun m!1394297 () Bool)

(assert (=> b!1512093 m!1394297))

(assert (=> b!1512093 m!1394297))

(assert (=> b!1512093 m!1394291))

(declare-fun m!1394299 () Bool)

(assert (=> b!1512093 m!1394299))

(declare-fun m!1394301 () Bool)

(assert (=> b!1512099 m!1394301))

(declare-fun m!1394303 () Bool)

(assert (=> b!1512099 m!1394303))

(assert (=> b!1512099 m!1394303))

(declare-fun m!1394305 () Bool)

(assert (=> b!1512099 m!1394305))

(assert (=> b!1512099 m!1394305))

(assert (=> b!1512099 m!1394303))

(declare-fun m!1394307 () Bool)

(assert (=> b!1512099 m!1394307))

(assert (=> b!1512103 m!1394291))

(assert (=> b!1512103 m!1394291))

(declare-fun m!1394309 () Bool)

(assert (=> b!1512103 m!1394309))

(assert (=> b!1512091 m!1394291))

(assert (=> b!1512091 m!1394291))

(declare-fun m!1394311 () Bool)

(assert (=> b!1512091 m!1394311))

(assert (=> b!1512091 m!1394291))

(declare-fun m!1394313 () Bool)

(assert (=> b!1512091 m!1394313))

(declare-fun m!1394315 () Bool)

(assert (=> b!1512101 m!1394315))

(assert (=> b!1512097 m!1394291))

(assert (=> b!1512097 m!1394301))

(assert (=> b!1512097 m!1394303))

(declare-fun m!1394317 () Bool)

(assert (=> b!1512097 m!1394317))

(declare-fun m!1394319 () Bool)

(assert (=> b!1512092 m!1394319))

(assert (=> b!1512092 m!1394319))

(declare-fun m!1394321 () Bool)

(assert (=> b!1512092 m!1394321))

(assert (=> b!1512094 m!1394291))

(declare-fun m!1394323 () Bool)

(assert (=> b!1512094 m!1394323))

(assert (=> b!1512094 m!1394301))

(assert (=> b!1512094 m!1394317))

(assert (=> b!1512094 m!1394303))

(declare-fun m!1394325 () Bool)

(assert (=> b!1512094 m!1394325))

(assert (=> b!1512100 m!1394291))

(assert (=> b!1512100 m!1394291))

(declare-fun m!1394327 () Bool)

(assert (=> b!1512100 m!1394327))

(declare-fun m!1394329 () Bool)

(assert (=> start!128936 m!1394329))

(declare-fun m!1394331 () Bool)

(assert (=> start!128936 m!1394331))

(check-sat (not start!128936) (not b!1512100) (not b!1512095) (not b!1512102) (not b!1512093) (not b!1512099) (not b!1512091) (not b!1512103) (not b!1512101) (not b!1512094) (not b!1512092))
(check-sat)
