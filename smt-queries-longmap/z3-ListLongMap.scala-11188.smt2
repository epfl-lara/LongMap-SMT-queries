; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130762 () Bool)

(assert start!130762)

(declare-fun b!1533559 () Bool)

(declare-fun res!1050646 () Bool)

(declare-fun e!854265 () Bool)

(assert (=> b!1533559 (=> (not res!1050646) (not e!854265))))

(declare-datatypes ((array!101860 0))(
  ( (array!101861 (arr!49146 (Array (_ BitVec 32) (_ BitVec 64))) (size!49696 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101860)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533559 (= res!1050646 (and (= (size!49696 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49696 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49696 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533560 () Bool)

(declare-fun res!1050645 () Bool)

(assert (=> b!1533560 (=> (not res!1050645) (not e!854265))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13278 0))(
  ( (MissingZero!13278 (index!55507 (_ BitVec 32))) (Found!13278 (index!55508 (_ BitVec 32))) (Intermediate!13278 (undefined!14090 Bool) (index!55509 (_ BitVec 32)) (x!137280 (_ BitVec 32))) (Undefined!13278) (MissingVacant!13278 (index!55510 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101860 (_ BitVec 32)) SeekEntryResult!13278)

(assert (=> b!1533560 (= res!1050645 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49146 a!2792) j!64) a!2792 mask!2480) (Found!13278 j!64)))))

(declare-fun res!1050649 () Bool)

(assert (=> start!130762 (=> (not res!1050649) (not e!854265))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130762 (= res!1050649 (validMask!0 mask!2480))))

(assert (=> start!130762 e!854265))

(assert (=> start!130762 true))

(declare-fun array_inv!38174 (array!101860) Bool)

(assert (=> start!130762 (array_inv!38174 a!2792)))

(declare-fun b!1533561 () Bool)

(declare-fun res!1050650 () Bool)

(assert (=> b!1533561 (=> (not res!1050650) (not e!854265))))

(assert (=> b!1533561 (= res!1050650 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49696 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49696 a!2792)) (= (select (arr!49146 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533562 () Bool)

(assert (=> b!1533562 (= e!854265 (and (= (select (arr!49146 a!2792) index!463) (select (arr!49146 a!2792) j!64)) (bvsge mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvslt vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480)) (not (= (select (store (arr!49146 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1533563 () Bool)

(declare-fun res!1050651 () Bool)

(assert (=> b!1533563 (=> (not res!1050651) (not e!854265))))

(declare-datatypes ((List!35620 0))(
  ( (Nil!35617) (Cons!35616 (h!37061 (_ BitVec 64)) (t!50314 List!35620)) )
))
(declare-fun arrayNoDuplicates!0 (array!101860 (_ BitVec 32) List!35620) Bool)

(assert (=> b!1533563 (= res!1050651 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35617))))

(declare-fun b!1533564 () Bool)

(declare-fun res!1050647 () Bool)

(assert (=> b!1533564 (=> (not res!1050647) (not e!854265))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533564 (= res!1050647 (validKeyInArray!0 (select (arr!49146 a!2792) j!64)))))

(declare-fun b!1533565 () Bool)

(declare-fun res!1050648 () Bool)

(assert (=> b!1533565 (=> (not res!1050648) (not e!854265))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101860 (_ BitVec 32)) Bool)

(assert (=> b!1533565 (= res!1050648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533566 () Bool)

(declare-fun res!1050652 () Bool)

(assert (=> b!1533566 (=> (not res!1050652) (not e!854265))))

(assert (=> b!1533566 (= res!1050652 (validKeyInArray!0 (select (arr!49146 a!2792) i!951)))))

(assert (= (and start!130762 res!1050649) b!1533559))

(assert (= (and b!1533559 res!1050646) b!1533566))

(assert (= (and b!1533566 res!1050652) b!1533564))

(assert (= (and b!1533564 res!1050647) b!1533565))

(assert (= (and b!1533565 res!1050648) b!1533563))

(assert (= (and b!1533563 res!1050651) b!1533561))

(assert (= (and b!1533561 res!1050650) b!1533560))

(assert (= (and b!1533560 res!1050645) b!1533562))

(declare-fun m!1416245 () Bool)

(assert (=> b!1533566 m!1416245))

(assert (=> b!1533566 m!1416245))

(declare-fun m!1416247 () Bool)

(assert (=> b!1533566 m!1416247))

(declare-fun m!1416249 () Bool)

(assert (=> b!1533562 m!1416249))

(declare-fun m!1416251 () Bool)

(assert (=> b!1533562 m!1416251))

(declare-fun m!1416253 () Bool)

(assert (=> b!1533562 m!1416253))

(declare-fun m!1416255 () Bool)

(assert (=> b!1533562 m!1416255))

(declare-fun m!1416257 () Bool)

(assert (=> b!1533565 m!1416257))

(declare-fun m!1416259 () Bool)

(assert (=> start!130762 m!1416259))

(declare-fun m!1416261 () Bool)

(assert (=> start!130762 m!1416261))

(declare-fun m!1416263 () Bool)

(assert (=> b!1533561 m!1416263))

(assert (=> b!1533560 m!1416251))

(assert (=> b!1533560 m!1416251))

(declare-fun m!1416265 () Bool)

(assert (=> b!1533560 m!1416265))

(declare-fun m!1416267 () Bool)

(assert (=> b!1533563 m!1416267))

(assert (=> b!1533564 m!1416251))

(assert (=> b!1533564 m!1416251))

(declare-fun m!1416269 () Bool)

(assert (=> b!1533564 m!1416269))

(check-sat (not b!1533565) (not start!130762) (not b!1533563) (not b!1533560) (not b!1533566) (not b!1533564))
(check-sat)
