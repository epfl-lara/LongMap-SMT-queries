; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130874 () Bool)

(assert start!130874)

(declare-fun b!1534943 () Bool)

(declare-fun res!1052029 () Bool)

(declare-fun e!854649 () Bool)

(assert (=> b!1534943 (=> (not res!1052029) (not e!854649))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!101972 0))(
  ( (array!101973 (arr!49202 (Array (_ BitVec 32) (_ BitVec 64))) (size!49752 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101972)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1534943 (= res!1052029 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49752 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49752 a!2792)) (= (select (arr!49202 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534944 () Bool)

(declare-fun res!1052036 () Bool)

(assert (=> b!1534944 (=> (not res!1052036) (not e!854649))))

(declare-datatypes ((List!35676 0))(
  ( (Nil!35673) (Cons!35672 (h!37117 (_ BitVec 64)) (t!50370 List!35676)) )
))
(declare-fun arrayNoDuplicates!0 (array!101972 (_ BitVec 32) List!35676) Bool)

(assert (=> b!1534944 (= res!1052036 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35673))))

(declare-fun b!1534945 () Bool)

(declare-fun res!1052033 () Bool)

(assert (=> b!1534945 (=> (not res!1052033) (not e!854649))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534945 (= res!1052033 (validKeyInArray!0 (select (arr!49202 a!2792) i!951)))))

(declare-fun b!1534946 () Bool)

(declare-fun res!1052032 () Bool)

(assert (=> b!1534946 (=> (not res!1052032) (not e!854649))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1534946 (= res!1052032 (not (= (select (arr!49202 a!2792) index!463) (select (arr!49202 a!2792) j!64))))))

(declare-fun res!1052038 () Bool)

(assert (=> start!130874 (=> (not res!1052038) (not e!854649))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130874 (= res!1052038 (validMask!0 mask!2480))))

(assert (=> start!130874 e!854649))

(assert (=> start!130874 true))

(declare-fun array_inv!38230 (array!101972) Bool)

(assert (=> start!130874 (array_inv!38230 a!2792)))

(declare-fun b!1534947 () Bool)

(declare-fun res!1052030 () Bool)

(assert (=> b!1534947 (=> (not res!1052030) (not e!854649))))

(assert (=> b!1534947 (= res!1052030 (validKeyInArray!0 (select (arr!49202 a!2792) j!64)))))

(declare-fun b!1534948 () Bool)

(declare-fun res!1052034 () Bool)

(assert (=> b!1534948 (=> (not res!1052034) (not e!854649))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101972 (_ BitVec 32)) Bool)

(assert (=> b!1534948 (= res!1052034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534949 () Bool)

(declare-fun e!854648 () Bool)

(assert (=> b!1534949 (= e!854648 false)))

(declare-fun lt!663960 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13334 0))(
  ( (MissingZero!13334 (index!55731 (_ BitVec 32))) (Found!13334 (index!55732 (_ BitVec 32))) (Intermediate!13334 (undefined!14146 Bool) (index!55733 (_ BitVec 32)) (x!137488 (_ BitVec 32))) (Undefined!13334) (MissingVacant!13334 (index!55734 (_ BitVec 32))) )
))
(declare-fun lt!663961 () SeekEntryResult!13334)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101972 (_ BitVec 32)) SeekEntryResult!13334)

(assert (=> b!1534949 (= lt!663961 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663960 vacantIndex!5 (select (arr!49202 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1534950 () Bool)

(declare-fun res!1052037 () Bool)

(assert (=> b!1534950 (=> (not res!1052037) (not e!854649))))

(assert (=> b!1534950 (= res!1052037 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49202 a!2792) j!64) a!2792 mask!2480) (Found!13334 j!64)))))

(declare-fun b!1534951 () Bool)

(assert (=> b!1534951 (= e!854649 e!854648)))

(declare-fun res!1052035 () Bool)

(assert (=> b!1534951 (=> (not res!1052035) (not e!854648))))

(assert (=> b!1534951 (= res!1052035 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663960 #b00000000000000000000000000000000) (bvslt lt!663960 (size!49752 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534951 (= lt!663960 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1534952 () Bool)

(declare-fun res!1052031 () Bool)

(assert (=> b!1534952 (=> (not res!1052031) (not e!854649))))

(assert (=> b!1534952 (= res!1052031 (and (= (size!49752 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49752 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49752 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!130874 res!1052038) b!1534952))

(assert (= (and b!1534952 res!1052031) b!1534945))

(assert (= (and b!1534945 res!1052033) b!1534947))

(assert (= (and b!1534947 res!1052030) b!1534948))

(assert (= (and b!1534948 res!1052034) b!1534944))

(assert (= (and b!1534944 res!1052036) b!1534943))

(assert (= (and b!1534943 res!1052029) b!1534950))

(assert (= (and b!1534950 res!1052037) b!1534946))

(assert (= (and b!1534946 res!1052032) b!1534951))

(assert (= (and b!1534951 res!1052035) b!1534949))

(declare-fun m!1417527 () Bool)

(assert (=> b!1534945 m!1417527))

(assert (=> b!1534945 m!1417527))

(declare-fun m!1417529 () Bool)

(assert (=> b!1534945 m!1417529))

(declare-fun m!1417531 () Bool)

(assert (=> b!1534948 m!1417531))

(declare-fun m!1417533 () Bool)

(assert (=> b!1534944 m!1417533))

(declare-fun m!1417535 () Bool)

(assert (=> b!1534949 m!1417535))

(assert (=> b!1534949 m!1417535))

(declare-fun m!1417537 () Bool)

(assert (=> b!1534949 m!1417537))

(declare-fun m!1417539 () Bool)

(assert (=> b!1534946 m!1417539))

(assert (=> b!1534946 m!1417535))

(assert (=> b!1534950 m!1417535))

(assert (=> b!1534950 m!1417535))

(declare-fun m!1417541 () Bool)

(assert (=> b!1534950 m!1417541))

(declare-fun m!1417543 () Bool)

(assert (=> b!1534951 m!1417543))

(assert (=> b!1534947 m!1417535))

(assert (=> b!1534947 m!1417535))

(declare-fun m!1417545 () Bool)

(assert (=> b!1534947 m!1417545))

(declare-fun m!1417547 () Bool)

(assert (=> b!1534943 m!1417547))

(declare-fun m!1417549 () Bool)

(assert (=> start!130874 m!1417549))

(declare-fun m!1417551 () Bool)

(assert (=> start!130874 m!1417551))

(push 1)

