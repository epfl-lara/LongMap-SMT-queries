; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130896 () Bool)

(assert start!130896)

(declare-fun b!1535273 () Bool)

(declare-fun res!1052360 () Bool)

(declare-fun e!854748 () Bool)

(assert (=> b!1535273 (=> (not res!1052360) (not e!854748))))

(declare-datatypes ((array!101994 0))(
  ( (array!101995 (arr!49213 (Array (_ BitVec 32) (_ BitVec 64))) (size!49763 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101994)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535273 (= res!1052360 (validKeyInArray!0 (select (arr!49213 a!2792) i!951)))))

(declare-fun b!1535274 () Bool)

(declare-fun e!854747 () Bool)

(assert (=> b!1535274 (= e!854748 e!854747)))

(declare-fun res!1052366 () Bool)

(assert (=> b!1535274 (=> (not res!1052366) (not e!854747))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!664026 () (_ BitVec 32))

(assert (=> b!1535274 (= res!1052366 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664026 #b00000000000000000000000000000000) (bvslt lt!664026 (size!49763 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535274 (= lt!664026 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535275 () Bool)

(declare-fun res!1052364 () Bool)

(assert (=> b!1535275 (=> (not res!1052364) (not e!854748))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13345 0))(
  ( (MissingZero!13345 (index!55775 (_ BitVec 32))) (Found!13345 (index!55776 (_ BitVec 32))) (Intermediate!13345 (undefined!14157 Bool) (index!55777 (_ BitVec 32)) (x!137523 (_ BitVec 32))) (Undefined!13345) (MissingVacant!13345 (index!55778 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101994 (_ BitVec 32)) SeekEntryResult!13345)

(assert (=> b!1535275 (= res!1052364 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49213 a!2792) j!64) a!2792 mask!2480) (Found!13345 j!64)))))

(declare-fun b!1535276 () Bool)

(declare-fun res!1052361 () Bool)

(assert (=> b!1535276 (=> (not res!1052361) (not e!854748))))

(assert (=> b!1535276 (= res!1052361 (validKeyInArray!0 (select (arr!49213 a!2792) j!64)))))

(declare-fun res!1052362 () Bool)

(assert (=> start!130896 (=> (not res!1052362) (not e!854748))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130896 (= res!1052362 (validMask!0 mask!2480))))

(assert (=> start!130896 e!854748))

(assert (=> start!130896 true))

(declare-fun array_inv!38241 (array!101994) Bool)

(assert (=> start!130896 (array_inv!38241 a!2792)))

(declare-fun b!1535277 () Bool)

(assert (=> b!1535277 (= e!854747 false)))

(declare-fun lt!664027 () SeekEntryResult!13345)

(assert (=> b!1535277 (= lt!664027 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664026 vacantIndex!5 (select (arr!49213 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535278 () Bool)

(declare-fun res!1052363 () Bool)

(assert (=> b!1535278 (=> (not res!1052363) (not e!854748))))

(assert (=> b!1535278 (= res!1052363 (not (= (select (arr!49213 a!2792) index!463) (select (arr!49213 a!2792) j!64))))))

(declare-fun b!1535279 () Bool)

(declare-fun res!1052359 () Bool)

(assert (=> b!1535279 (=> (not res!1052359) (not e!854748))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101994 (_ BitVec 32)) Bool)

(assert (=> b!1535279 (= res!1052359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535280 () Bool)

(declare-fun res!1052368 () Bool)

(assert (=> b!1535280 (=> (not res!1052368) (not e!854748))))

(assert (=> b!1535280 (= res!1052368 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49763 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49763 a!2792)) (= (select (arr!49213 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535281 () Bool)

(declare-fun res!1052365 () Bool)

(assert (=> b!1535281 (=> (not res!1052365) (not e!854748))))

(assert (=> b!1535281 (= res!1052365 (and (= (size!49763 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49763 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49763 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535282 () Bool)

(declare-fun res!1052367 () Bool)

(assert (=> b!1535282 (=> (not res!1052367) (not e!854748))))

(declare-datatypes ((List!35687 0))(
  ( (Nil!35684) (Cons!35683 (h!37128 (_ BitVec 64)) (t!50381 List!35687)) )
))
(declare-fun arrayNoDuplicates!0 (array!101994 (_ BitVec 32) List!35687) Bool)

(assert (=> b!1535282 (= res!1052367 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35684))))

(assert (= (and start!130896 res!1052362) b!1535281))

(assert (= (and b!1535281 res!1052365) b!1535273))

(assert (= (and b!1535273 res!1052360) b!1535276))

(assert (= (and b!1535276 res!1052361) b!1535279))

(assert (= (and b!1535279 res!1052359) b!1535282))

(assert (= (and b!1535282 res!1052367) b!1535280))

(assert (= (and b!1535280 res!1052368) b!1535275))

(assert (= (and b!1535275 res!1052364) b!1535278))

(assert (= (and b!1535278 res!1052363) b!1535274))

(assert (= (and b!1535274 res!1052366) b!1535277))

(declare-fun m!1417813 () Bool)

(assert (=> b!1535277 m!1417813))

(assert (=> b!1535277 m!1417813))

(declare-fun m!1417815 () Bool)

(assert (=> b!1535277 m!1417815))

(declare-fun m!1417817 () Bool)

(assert (=> b!1535274 m!1417817))

(declare-fun m!1417819 () Bool)

(assert (=> b!1535273 m!1417819))

(assert (=> b!1535273 m!1417819))

(declare-fun m!1417821 () Bool)

(assert (=> b!1535273 m!1417821))

(assert (=> b!1535275 m!1417813))

(assert (=> b!1535275 m!1417813))

(declare-fun m!1417823 () Bool)

(assert (=> b!1535275 m!1417823))

(declare-fun m!1417825 () Bool)

(assert (=> b!1535279 m!1417825))

(declare-fun m!1417827 () Bool)

(assert (=> b!1535278 m!1417827))

(assert (=> b!1535278 m!1417813))

(declare-fun m!1417829 () Bool)

(assert (=> b!1535280 m!1417829))

(declare-fun m!1417831 () Bool)

(assert (=> start!130896 m!1417831))

(declare-fun m!1417833 () Bool)

(assert (=> start!130896 m!1417833))

(assert (=> b!1535276 m!1417813))

(assert (=> b!1535276 m!1417813))

(declare-fun m!1417835 () Bool)

(assert (=> b!1535276 m!1417835))

(declare-fun m!1417837 () Bool)

(assert (=> b!1535282 m!1417837))

(push 1)

(assert (not b!1535277))

(assert (not b!1535273))

(assert (not b!1535274))

(assert (not b!1535275))

(assert (not b!1535276))

(assert (not b!1535279))

(assert (not start!130896))

(assert (not b!1535282))

(check-sat)

