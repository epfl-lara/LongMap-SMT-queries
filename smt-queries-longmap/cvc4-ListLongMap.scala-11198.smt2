; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130824 () Bool)

(assert start!130824)

(declare-fun b!1534259 () Bool)

(declare-fun res!1051351 () Bool)

(declare-fun e!854452 () Bool)

(assert (=> b!1534259 (=> (not res!1051351) (not e!854452))))

(declare-datatypes ((array!101922 0))(
  ( (array!101923 (arr!49177 (Array (_ BitVec 32) (_ BitVec 64))) (size!49727 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101922)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534259 (= res!1051351 (validKeyInArray!0 (select (arr!49177 a!2792) i!951)))))

(declare-fun b!1534260 () Bool)

(declare-fun res!1051345 () Bool)

(assert (=> b!1534260 (=> (not res!1051345) (not e!854452))))

(declare-datatypes ((List!35651 0))(
  ( (Nil!35648) (Cons!35647 (h!37092 (_ BitVec 64)) (t!50345 List!35651)) )
))
(declare-fun arrayNoDuplicates!0 (array!101922 (_ BitVec 32) List!35651) Bool)

(assert (=> b!1534260 (= res!1051345 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35648))))

(declare-fun b!1534261 () Bool)

(declare-fun res!1051347 () Bool)

(assert (=> b!1534261 (=> (not res!1051347) (not e!854452))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1534261 (= res!1051347 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49727 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49727 a!2792)) (= (select (arr!49177 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534262 () Bool)

(assert (=> b!1534262 (= e!854452 false)))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13309 0))(
  ( (MissingZero!13309 (index!55631 (_ BitVec 32))) (Found!13309 (index!55632 (_ BitVec 32))) (Intermediate!13309 (undefined!14121 Bool) (index!55633 (_ BitVec 32)) (x!137391 (_ BitVec 32))) (Undefined!13309) (MissingVacant!13309 (index!55634 (_ BitVec 32))) )
))
(declare-fun lt!663856 () SeekEntryResult!13309)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101922 (_ BitVec 32)) SeekEntryResult!13309)

(assert (=> b!1534262 (= lt!663856 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49177 a!2792) j!64) a!2792 mask!2480))))

(declare-fun res!1051348 () Bool)

(assert (=> start!130824 (=> (not res!1051348) (not e!854452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130824 (= res!1051348 (validMask!0 mask!2480))))

(assert (=> start!130824 e!854452))

(assert (=> start!130824 true))

(declare-fun array_inv!38205 (array!101922) Bool)

(assert (=> start!130824 (array_inv!38205 a!2792)))

(declare-fun b!1534263 () Bool)

(declare-fun res!1051350 () Bool)

(assert (=> b!1534263 (=> (not res!1051350) (not e!854452))))

(assert (=> b!1534263 (= res!1051350 (and (= (size!49727 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49727 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49727 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534264 () Bool)

(declare-fun res!1051346 () Bool)

(assert (=> b!1534264 (=> (not res!1051346) (not e!854452))))

(assert (=> b!1534264 (= res!1051346 (validKeyInArray!0 (select (arr!49177 a!2792) j!64)))))

(declare-fun b!1534265 () Bool)

(declare-fun res!1051349 () Bool)

(assert (=> b!1534265 (=> (not res!1051349) (not e!854452))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101922 (_ BitVec 32)) Bool)

(assert (=> b!1534265 (= res!1051349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!130824 res!1051348) b!1534263))

(assert (= (and b!1534263 res!1051350) b!1534259))

(assert (= (and b!1534259 res!1051351) b!1534264))

(assert (= (and b!1534264 res!1051346) b!1534265))

(assert (= (and b!1534265 res!1051349) b!1534260))

(assert (= (and b!1534260 res!1051345) b!1534261))

(assert (= (and b!1534261 res!1051347) b!1534262))

(declare-fun m!1416925 () Bool)

(assert (=> b!1534264 m!1416925))

(assert (=> b!1534264 m!1416925))

(declare-fun m!1416927 () Bool)

(assert (=> b!1534264 m!1416927))

(declare-fun m!1416929 () Bool)

(assert (=> b!1534260 m!1416929))

(declare-fun m!1416931 () Bool)

(assert (=> start!130824 m!1416931))

(declare-fun m!1416933 () Bool)

(assert (=> start!130824 m!1416933))

(declare-fun m!1416935 () Bool)

(assert (=> b!1534265 m!1416935))

(declare-fun m!1416937 () Bool)

(assert (=> b!1534259 m!1416937))

(assert (=> b!1534259 m!1416937))

(declare-fun m!1416939 () Bool)

(assert (=> b!1534259 m!1416939))

(declare-fun m!1416941 () Bool)

(assert (=> b!1534261 m!1416941))

(assert (=> b!1534262 m!1416925))

(assert (=> b!1534262 m!1416925))

(declare-fun m!1416943 () Bool)

(assert (=> b!1534262 m!1416943))

(push 1)

(assert (not b!1534259))

(assert (not b!1534260))

(assert (not start!130824))

(assert (not b!1534264))

(assert (not b!1534262))

(assert (not b!1534265))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

