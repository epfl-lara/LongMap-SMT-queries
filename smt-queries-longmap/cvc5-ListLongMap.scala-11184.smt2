; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130736 () Bool)

(assert start!130736)

(declare-fun b!1533263 () Bool)

(declare-fun res!1050354 () Bool)

(declare-fun e!854187 () Bool)

(assert (=> b!1533263 (=> (not res!1050354) (not e!854187))))

(declare-datatypes ((array!101834 0))(
  ( (array!101835 (arr!49133 (Array (_ BitVec 32) (_ BitVec 64))) (size!49683 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101834)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533263 (= res!1050354 (and (= (size!49683 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49683 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49683 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533264 () Bool)

(declare-fun res!1050349 () Bool)

(assert (=> b!1533264 (=> (not res!1050349) (not e!854187))))

(declare-datatypes ((List!35607 0))(
  ( (Nil!35604) (Cons!35603 (h!37048 (_ BitVec 64)) (t!50301 List!35607)) )
))
(declare-fun arrayNoDuplicates!0 (array!101834 (_ BitVec 32) List!35607) Bool)

(assert (=> b!1533264 (= res!1050349 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35604))))

(declare-fun b!1533265 () Bool)

(declare-fun res!1050352 () Bool)

(assert (=> b!1533265 (=> (not res!1050352) (not e!854187))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1533265 (= res!1050352 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49683 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49683 a!2792)) (= (select (arr!49133 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1050350 () Bool)

(assert (=> start!130736 (=> (not res!1050350) (not e!854187))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130736 (= res!1050350 (validMask!0 mask!2480))))

(assert (=> start!130736 e!854187))

(assert (=> start!130736 true))

(declare-fun array_inv!38161 (array!101834) Bool)

(assert (=> start!130736 (array_inv!38161 a!2792)))

(declare-fun b!1533266 () Bool)

(declare-fun res!1050355 () Bool)

(assert (=> b!1533266 (=> (not res!1050355) (not e!854187))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533266 (= res!1050355 (validKeyInArray!0 (select (arr!49133 a!2792) i!951)))))

(declare-fun b!1533267 () Bool)

(declare-fun res!1050353 () Bool)

(assert (=> b!1533267 (=> (not res!1050353) (not e!854187))))

(assert (=> b!1533267 (= res!1050353 (validKeyInArray!0 (select (arr!49133 a!2792) j!64)))))

(declare-fun b!1533268 () Bool)

(declare-fun res!1050351 () Bool)

(assert (=> b!1533268 (=> (not res!1050351) (not e!854187))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101834 (_ BitVec 32)) Bool)

(assert (=> b!1533268 (= res!1050351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533269 () Bool)

(assert (=> b!1533269 (= e!854187 false)))

(declare-datatypes ((SeekEntryResult!13265 0))(
  ( (MissingZero!13265 (index!55455 (_ BitVec 32))) (Found!13265 (index!55456 (_ BitVec 32))) (Intermediate!13265 (undefined!14077 Bool) (index!55457 (_ BitVec 32)) (x!137235 (_ BitVec 32))) (Undefined!13265) (MissingVacant!13265 (index!55458 (_ BitVec 32))) )
))
(declare-fun lt!663787 () SeekEntryResult!13265)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101834 (_ BitVec 32)) SeekEntryResult!13265)

(assert (=> b!1533269 (= lt!663787 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49133 a!2792) j!64) a!2792 mask!2480))))

(assert (= (and start!130736 res!1050350) b!1533263))

(assert (= (and b!1533263 res!1050354) b!1533266))

(assert (= (and b!1533266 res!1050355) b!1533267))

(assert (= (and b!1533267 res!1050353) b!1533268))

(assert (= (and b!1533268 res!1050351) b!1533264))

(assert (= (and b!1533264 res!1050349) b!1533265))

(assert (= (and b!1533265 res!1050352) b!1533269))

(declare-fun m!1415967 () Bool)

(assert (=> start!130736 m!1415967))

(declare-fun m!1415969 () Bool)

(assert (=> start!130736 m!1415969))

(declare-fun m!1415971 () Bool)

(assert (=> b!1533268 m!1415971))

(declare-fun m!1415973 () Bool)

(assert (=> b!1533267 m!1415973))

(assert (=> b!1533267 m!1415973))

(declare-fun m!1415975 () Bool)

(assert (=> b!1533267 m!1415975))

(declare-fun m!1415977 () Bool)

(assert (=> b!1533266 m!1415977))

(assert (=> b!1533266 m!1415977))

(declare-fun m!1415979 () Bool)

(assert (=> b!1533266 m!1415979))

(declare-fun m!1415981 () Bool)

(assert (=> b!1533264 m!1415981))

(assert (=> b!1533269 m!1415973))

(assert (=> b!1533269 m!1415973))

(declare-fun m!1415983 () Bool)

(assert (=> b!1533269 m!1415983))

(declare-fun m!1415985 () Bool)

(assert (=> b!1533265 m!1415985))

(push 1)

(assert (not b!1533268))

(assert (not b!1533266))

(assert (not b!1533269))

(assert (not b!1533267))

(assert (not b!1533264))

(assert (not start!130736))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

