; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130826 () Bool)

(assert start!130826)

(declare-fun b!1534282 () Bool)

(declare-fun res!1051371 () Bool)

(declare-fun e!854458 () Bool)

(assert (=> b!1534282 (=> (not res!1051371) (not e!854458))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!101924 0))(
  ( (array!101925 (arr!49178 (Array (_ BitVec 32) (_ BitVec 64))) (size!49728 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101924)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1534282 (= res!1051371 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49728 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49728 a!2792)) (= (select (arr!49178 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534283 () Bool)

(declare-fun res!1051369 () Bool)

(assert (=> b!1534283 (=> (not res!1051369) (not e!854458))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534283 (= res!1051369 (and (= (size!49728 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49728 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49728 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534284 () Bool)

(declare-fun res!1051375 () Bool)

(assert (=> b!1534284 (=> (not res!1051375) (not e!854458))))

(declare-datatypes ((SeekEntryResult!13310 0))(
  ( (MissingZero!13310 (index!55635 (_ BitVec 32))) (Found!13310 (index!55636 (_ BitVec 32))) (Intermediate!13310 (undefined!14122 Bool) (index!55637 (_ BitVec 32)) (x!137400 (_ BitVec 32))) (Undefined!13310) (MissingVacant!13310 (index!55638 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101924 (_ BitVec 32)) SeekEntryResult!13310)

(assert (=> b!1534284 (= res!1051375 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49178 a!2792) j!64) a!2792 mask!2480) (Found!13310 j!64)))))

(declare-fun b!1534285 () Bool)

(assert (=> b!1534285 (= e!854458 (and (not (= (select (arr!49178 a!2792) index!463) (select (arr!49178 a!2792) j!64))) (bvslt mask!2480 #b00000000000000000000000000000000)))))

(declare-fun b!1534286 () Bool)

(declare-fun res!1051374 () Bool)

(assert (=> b!1534286 (=> (not res!1051374) (not e!854458))))

(declare-datatypes ((List!35652 0))(
  ( (Nil!35649) (Cons!35648 (h!37093 (_ BitVec 64)) (t!50346 List!35652)) )
))
(declare-fun arrayNoDuplicates!0 (array!101924 (_ BitVec 32) List!35652) Bool)

(assert (=> b!1534286 (= res!1051374 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35649))))

(declare-fun b!1534287 () Bool)

(declare-fun res!1051370 () Bool)

(assert (=> b!1534287 (=> (not res!1051370) (not e!854458))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101924 (_ BitVec 32)) Bool)

(assert (=> b!1534287 (= res!1051370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534289 () Bool)

(declare-fun res!1051373 () Bool)

(assert (=> b!1534289 (=> (not res!1051373) (not e!854458))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534289 (= res!1051373 (validKeyInArray!0 (select (arr!49178 a!2792) i!951)))))

(declare-fun res!1051368 () Bool)

(assert (=> start!130826 (=> (not res!1051368) (not e!854458))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130826 (= res!1051368 (validMask!0 mask!2480))))

(assert (=> start!130826 e!854458))

(assert (=> start!130826 true))

(declare-fun array_inv!38206 (array!101924) Bool)

(assert (=> start!130826 (array_inv!38206 a!2792)))

(declare-fun b!1534288 () Bool)

(declare-fun res!1051372 () Bool)

(assert (=> b!1534288 (=> (not res!1051372) (not e!854458))))

(assert (=> b!1534288 (= res!1051372 (validKeyInArray!0 (select (arr!49178 a!2792) j!64)))))

(assert (= (and start!130826 res!1051368) b!1534283))

(assert (= (and b!1534283 res!1051369) b!1534289))

(assert (= (and b!1534289 res!1051373) b!1534288))

(assert (= (and b!1534288 res!1051372) b!1534287))

(assert (= (and b!1534287 res!1051370) b!1534286))

(assert (= (and b!1534286 res!1051374) b!1534282))

(assert (= (and b!1534282 res!1051371) b!1534284))

(assert (= (and b!1534284 res!1051375) b!1534285))

(declare-fun m!1416945 () Bool)

(assert (=> b!1534286 m!1416945))

(declare-fun m!1416947 () Bool)

(assert (=> start!130826 m!1416947))

(declare-fun m!1416949 () Bool)

(assert (=> start!130826 m!1416949))

(declare-fun m!1416951 () Bool)

(assert (=> b!1534284 m!1416951))

(assert (=> b!1534284 m!1416951))

(declare-fun m!1416953 () Bool)

(assert (=> b!1534284 m!1416953))

(assert (=> b!1534288 m!1416951))

(assert (=> b!1534288 m!1416951))

(declare-fun m!1416955 () Bool)

(assert (=> b!1534288 m!1416955))

(declare-fun m!1416957 () Bool)

(assert (=> b!1534282 m!1416957))

(declare-fun m!1416959 () Bool)

(assert (=> b!1534289 m!1416959))

(assert (=> b!1534289 m!1416959))

(declare-fun m!1416961 () Bool)

(assert (=> b!1534289 m!1416961))

(declare-fun m!1416963 () Bool)

(assert (=> b!1534287 m!1416963))

(declare-fun m!1416965 () Bool)

(assert (=> b!1534285 m!1416965))

(assert (=> b!1534285 m!1416951))

(push 1)

(assert (not b!1534284))

(assert (not b!1534286))

(assert (not b!1534287))

