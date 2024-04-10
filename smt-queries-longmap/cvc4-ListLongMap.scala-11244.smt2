; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131136 () Bool)

(assert start!131136)

(declare-fun b!1538334 () Bool)

(declare-fun res!1055316 () Bool)

(declare-fun e!855973 () Bool)

(assert (=> b!1538334 (=> (not res!1055316) (not e!855973))))

(declare-datatypes ((array!102201 0))(
  ( (array!102202 (arr!49315 (Array (_ BitVec 32) (_ BitVec 64))) (size!49865 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102201)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(assert (=> b!1538334 (= res!1055316 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49865 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49865 a!2792)) (= (select (arr!49315 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538335 () Bool)

(declare-fun res!1055317 () Bool)

(assert (=> b!1538335 (=> (not res!1055317) (not e!855973))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1538335 (= res!1055317 (not (= (select (arr!49315 a!2792) index!463) (select (arr!49315 a!2792) j!64))))))

(declare-fun b!1538336 () Bool)

(declare-fun res!1055319 () Bool)

(assert (=> b!1538336 (=> (not res!1055319) (not e!855973))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13441 0))(
  ( (MissingZero!13441 (index!56159 (_ BitVec 32))) (Found!13441 (index!56160 (_ BitVec 32))) (Intermediate!13441 (undefined!14253 Bool) (index!56161 (_ BitVec 32)) (x!137894 (_ BitVec 32))) (Undefined!13441) (MissingVacant!13441 (index!56162 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102201 (_ BitVec 32)) SeekEntryResult!13441)

(assert (=> b!1538336 (= res!1055319 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49315 a!2792) j!64) a!2792 mask!2480) (Found!13441 j!64)))))

(declare-fun res!1055315 () Bool)

(assert (=> start!131136 (=> (not res!1055315) (not e!855973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131136 (= res!1055315 (validMask!0 mask!2480))))

(assert (=> start!131136 e!855973))

(assert (=> start!131136 true))

(declare-fun array_inv!38343 (array!102201) Bool)

(assert (=> start!131136 (array_inv!38343 a!2792)))

(declare-fun b!1538337 () Bool)

(declare-fun res!1055320 () Bool)

(assert (=> b!1538337 (=> (not res!1055320) (not e!855973))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538337 (= res!1055320 (validKeyInArray!0 (select (arr!49315 a!2792) i!951)))))

(declare-fun b!1538338 () Bool)

(declare-fun res!1055313 () Bool)

(assert (=> b!1538338 (=> (not res!1055313) (not e!855973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102201 (_ BitVec 32)) Bool)

(assert (=> b!1538338 (= res!1055313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538339 () Bool)

(declare-fun res!1055318 () Bool)

(assert (=> b!1538339 (=> (not res!1055318) (not e!855973))))

(declare-datatypes ((List!35789 0))(
  ( (Nil!35786) (Cons!35785 (h!37230 (_ BitVec 64)) (t!50483 List!35789)) )
))
(declare-fun arrayNoDuplicates!0 (array!102201 (_ BitVec 32) List!35789) Bool)

(assert (=> b!1538339 (= res!1055318 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35786))))

(declare-fun b!1538340 () Bool)

(declare-fun res!1055312 () Bool)

(assert (=> b!1538340 (=> (not res!1055312) (not e!855973))))

(assert (=> b!1538340 (= res!1055312 (validKeyInArray!0 (select (arr!49315 a!2792) j!64)))))

(declare-fun b!1538341 () Bool)

(assert (=> b!1538341 (= e!855973 false)))

(declare-fun lt!664888 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538341 (= lt!664888 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538342 () Bool)

(declare-fun res!1055314 () Bool)

(assert (=> b!1538342 (=> (not res!1055314) (not e!855973))))

(assert (=> b!1538342 (= res!1055314 (and (= (size!49865 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49865 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49865 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!131136 res!1055315) b!1538342))

(assert (= (and b!1538342 res!1055314) b!1538337))

(assert (= (and b!1538337 res!1055320) b!1538340))

(assert (= (and b!1538340 res!1055312) b!1538338))

(assert (= (and b!1538338 res!1055313) b!1538339))

(assert (= (and b!1538339 res!1055318) b!1538334))

(assert (= (and b!1538334 res!1055316) b!1538336))

(assert (= (and b!1538336 res!1055319) b!1538335))

(assert (= (and b!1538335 res!1055317) b!1538341))

(declare-fun m!1420779 () Bool)

(assert (=> start!131136 m!1420779))

(declare-fun m!1420781 () Bool)

(assert (=> start!131136 m!1420781))

(declare-fun m!1420783 () Bool)

(assert (=> b!1538341 m!1420783))

(declare-fun m!1420785 () Bool)

(assert (=> b!1538337 m!1420785))

(assert (=> b!1538337 m!1420785))

(declare-fun m!1420787 () Bool)

(assert (=> b!1538337 m!1420787))

(declare-fun m!1420789 () Bool)

(assert (=> b!1538340 m!1420789))

(assert (=> b!1538340 m!1420789))

(declare-fun m!1420791 () Bool)

(assert (=> b!1538340 m!1420791))

(declare-fun m!1420793 () Bool)

(assert (=> b!1538335 m!1420793))

(assert (=> b!1538335 m!1420789))

(declare-fun m!1420795 () Bool)

(assert (=> b!1538339 m!1420795))

(declare-fun m!1420797 () Bool)

(assert (=> b!1538334 m!1420797))

(assert (=> b!1538336 m!1420789))

(assert (=> b!1538336 m!1420789))

(declare-fun m!1420799 () Bool)

(assert (=> b!1538336 m!1420799))

(declare-fun m!1420801 () Bool)

(assert (=> b!1538338 m!1420801))

(push 1)

(assert (not b!1538337))

(assert (not b!1538339))

(assert (not b!1538336))

(assert (not b!1538338))

(assert (not b!1538340))

(assert (not start!131136))

(assert (not b!1538341))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

