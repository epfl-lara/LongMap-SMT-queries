; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130748 () Bool)

(assert start!130748)

(declare-fun b!1533398 () Bool)

(declare-fun res!1050485 () Bool)

(declare-fun e!854224 () Bool)

(assert (=> b!1533398 (=> (not res!1050485) (not e!854224))))

(declare-datatypes ((array!101846 0))(
  ( (array!101847 (arr!49139 (Array (_ BitVec 32) (_ BitVec 64))) (size!49689 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101846)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533398 (= res!1050485 (validKeyInArray!0 (select (arr!49139 a!2792) j!64)))))

(declare-fun b!1533399 () Bool)

(declare-fun res!1050488 () Bool)

(assert (=> b!1533399 (=> (not res!1050488) (not e!854224))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533399 (= res!1050488 (validKeyInArray!0 (select (arr!49139 a!2792) i!951)))))

(declare-fun b!1533400 () Bool)

(declare-fun res!1050486 () Bool)

(assert (=> b!1533400 (=> (not res!1050486) (not e!854224))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101846 (_ BitVec 32)) Bool)

(assert (=> b!1533400 (= res!1050486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533401 () Bool)

(declare-fun res!1050487 () Bool)

(assert (=> b!1533401 (=> (not res!1050487) (not e!854224))))

(assert (=> b!1533401 (= res!1050487 (and (= (size!49689 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49689 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49689 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533403 () Bool)

(assert (=> b!1533403 (= e!854224 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13271 0))(
  ( (MissingZero!13271 (index!55479 (_ BitVec 32))) (Found!13271 (index!55480 (_ BitVec 32))) (Intermediate!13271 (undefined!14083 Bool) (index!55481 (_ BitVec 32)) (x!137257 (_ BitVec 32))) (Undefined!13271) (MissingVacant!13271 (index!55482 (_ BitVec 32))) )
))
(declare-fun lt!663796 () SeekEntryResult!13271)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101846 (_ BitVec 32)) SeekEntryResult!13271)

(assert (=> b!1533403 (= lt!663796 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49139 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1533404 () Bool)

(declare-fun res!1050484 () Bool)

(assert (=> b!1533404 (=> (not res!1050484) (not e!854224))))

(assert (=> b!1533404 (= res!1050484 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49689 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49689 a!2792)) (= (select (arr!49139 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533402 () Bool)

(declare-fun res!1050489 () Bool)

(assert (=> b!1533402 (=> (not res!1050489) (not e!854224))))

(declare-datatypes ((List!35613 0))(
  ( (Nil!35610) (Cons!35609 (h!37054 (_ BitVec 64)) (t!50307 List!35613)) )
))
(declare-fun arrayNoDuplicates!0 (array!101846 (_ BitVec 32) List!35613) Bool)

(assert (=> b!1533402 (= res!1050489 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35610))))

(declare-fun res!1050490 () Bool)

(assert (=> start!130748 (=> (not res!1050490) (not e!854224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130748 (= res!1050490 (validMask!0 mask!2480))))

(assert (=> start!130748 e!854224))

(assert (=> start!130748 true))

(declare-fun array_inv!38167 (array!101846) Bool)

(assert (=> start!130748 (array_inv!38167 a!2792)))

(assert (= (and start!130748 res!1050490) b!1533401))

(assert (= (and b!1533401 res!1050487) b!1533399))

(assert (= (and b!1533399 res!1050488) b!1533398))

(assert (= (and b!1533398 res!1050485) b!1533400))

(assert (= (and b!1533400 res!1050486) b!1533402))

(assert (= (and b!1533402 res!1050489) b!1533404))

(assert (= (and b!1533404 res!1050484) b!1533403))

(declare-fun m!1416093 () Bool)

(assert (=> b!1533404 m!1416093))

(declare-fun m!1416095 () Bool)

(assert (=> b!1533398 m!1416095))

(assert (=> b!1533398 m!1416095))

(declare-fun m!1416097 () Bool)

(assert (=> b!1533398 m!1416097))

(declare-fun m!1416099 () Bool)

(assert (=> b!1533400 m!1416099))

(declare-fun m!1416101 () Bool)

(assert (=> b!1533402 m!1416101))

(declare-fun m!1416103 () Bool)

(assert (=> b!1533399 m!1416103))

(assert (=> b!1533399 m!1416103))

(declare-fun m!1416105 () Bool)

(assert (=> b!1533399 m!1416105))

(declare-fun m!1416107 () Bool)

(assert (=> start!130748 m!1416107))

(declare-fun m!1416109 () Bool)

(assert (=> start!130748 m!1416109))

(assert (=> b!1533403 m!1416095))

(assert (=> b!1533403 m!1416095))

(declare-fun m!1416111 () Bool)

(assert (=> b!1533403 m!1416111))

(push 1)

(assert (not b!1533403))

(assert (not start!130748))

(assert (not b!1533400))

(assert (not b!1533398))

(assert (not b!1533399))

(assert (not b!1533402))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

