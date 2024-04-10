; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130742 () Bool)

(assert start!130742)

(declare-fun b!1533328 () Bool)

(declare-fun res!1050419 () Bool)

(declare-fun e!854206 () Bool)

(assert (=> b!1533328 (=> (not res!1050419) (not e!854206))))

(declare-datatypes ((array!101840 0))(
  ( (array!101841 (arr!49136 (Array (_ BitVec 32) (_ BitVec 64))) (size!49686 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101840)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533328 (= res!1050419 (validKeyInArray!0 (select (arr!49136 a!2792) i!951)))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun b!1533329 () Bool)

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1533329 (= e!854206 (and (= (select (arr!49136 a!2792) index!463) (select (arr!49136 a!2792) j!64)) (bvsge mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(declare-fun b!1533330 () Bool)

(declare-fun res!1050415 () Bool)

(assert (=> b!1533330 (=> (not res!1050415) (not e!854206))))

(declare-datatypes ((List!35610 0))(
  ( (Nil!35607) (Cons!35606 (h!37051 (_ BitVec 64)) (t!50304 List!35610)) )
))
(declare-fun arrayNoDuplicates!0 (array!101840 (_ BitVec 32) List!35610) Bool)

(assert (=> b!1533330 (= res!1050415 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35607))))

(declare-fun b!1533331 () Bool)

(declare-fun res!1050418 () Bool)

(assert (=> b!1533331 (=> (not res!1050418) (not e!854206))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101840 (_ BitVec 32)) Bool)

(assert (=> b!1533331 (= res!1050418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1050416 () Bool)

(assert (=> start!130742 (=> (not res!1050416) (not e!854206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130742 (= res!1050416 (validMask!0 mask!2480))))

(assert (=> start!130742 e!854206))

(assert (=> start!130742 true))

(declare-fun array_inv!38164 (array!101840) Bool)

(assert (=> start!130742 (array_inv!38164 a!2792)))

(declare-fun b!1533332 () Bool)

(declare-fun res!1050417 () Bool)

(assert (=> b!1533332 (=> (not res!1050417) (not e!854206))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13268 0))(
  ( (MissingZero!13268 (index!55467 (_ BitVec 32))) (Found!13268 (index!55468 (_ BitVec 32))) (Intermediate!13268 (undefined!14080 Bool) (index!55469 (_ BitVec 32)) (x!137246 (_ BitVec 32))) (Undefined!13268) (MissingVacant!13268 (index!55470 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101840 (_ BitVec 32)) SeekEntryResult!13268)

(assert (=> b!1533332 (= res!1050417 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49136 a!2792) j!64) a!2792 mask!2480) (Found!13268 j!64)))))

(declare-fun b!1533333 () Bool)

(declare-fun res!1050414 () Bool)

(assert (=> b!1533333 (=> (not res!1050414) (not e!854206))))

(assert (=> b!1533333 (= res!1050414 (validKeyInArray!0 (select (arr!49136 a!2792) j!64)))))

(declare-fun b!1533334 () Bool)

(declare-fun res!1050420 () Bool)

(assert (=> b!1533334 (=> (not res!1050420) (not e!854206))))

(assert (=> b!1533334 (= res!1050420 (and (= (size!49686 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49686 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49686 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533335 () Bool)

(declare-fun res!1050421 () Bool)

(assert (=> b!1533335 (=> (not res!1050421) (not e!854206))))

(assert (=> b!1533335 (= res!1050421 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49686 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49686 a!2792)) (= (select (arr!49136 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!130742 res!1050416) b!1533334))

(assert (= (and b!1533334 res!1050420) b!1533328))

(assert (= (and b!1533328 res!1050419) b!1533333))

(assert (= (and b!1533333 res!1050414) b!1533331))

(assert (= (and b!1533331 res!1050418) b!1533330))

(assert (= (and b!1533330 res!1050415) b!1533335))

(assert (= (and b!1533335 res!1050421) b!1533332))

(assert (= (and b!1533332 res!1050417) b!1533329))

(declare-fun m!1416027 () Bool)

(assert (=> b!1533335 m!1416027))

(declare-fun m!1416029 () Bool)

(assert (=> b!1533331 m!1416029))

(declare-fun m!1416031 () Bool)

(assert (=> b!1533333 m!1416031))

(assert (=> b!1533333 m!1416031))

(declare-fun m!1416033 () Bool)

(assert (=> b!1533333 m!1416033))

(declare-fun m!1416035 () Bool)

(assert (=> b!1533330 m!1416035))

(declare-fun m!1416037 () Bool)

(assert (=> b!1533328 m!1416037))

(assert (=> b!1533328 m!1416037))

(declare-fun m!1416039 () Bool)

(assert (=> b!1533328 m!1416039))

(declare-fun m!1416041 () Bool)

(assert (=> start!130742 m!1416041))

(declare-fun m!1416043 () Bool)

(assert (=> start!130742 m!1416043))

(assert (=> b!1533332 m!1416031))

(assert (=> b!1533332 m!1416031))

(declare-fun m!1416045 () Bool)

(assert (=> b!1533332 m!1416045))

(declare-fun m!1416047 () Bool)

(assert (=> b!1533329 m!1416047))

(assert (=> b!1533329 m!1416031))

(push 1)

(assert (not b!1533328))

(assert (not b!1533332))

(assert (not b!1533333))

(assert (not start!130742))

(assert (not b!1533330))

(assert (not b!1533331))

(check-sat)

(pop 1)

(push 1)

(check-sat)

