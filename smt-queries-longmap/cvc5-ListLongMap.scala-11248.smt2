; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131110 () Bool)

(assert start!131110)

(declare-fun b!1538345 () Bool)

(declare-fun res!1055513 () Bool)

(declare-fun e!855846 () Bool)

(assert (=> b!1538345 (=> (not res!1055513) (not e!855846))))

(declare-datatypes ((array!102173 0))(
  ( (array!102174 (arr!49302 (Array (_ BitVec 32) (_ BitVec 64))) (size!49854 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102173)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102173 (_ BitVec 32)) Bool)

(assert (=> b!1538345 (= res!1055513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538346 () Bool)

(declare-fun res!1055511 () Bool)

(assert (=> b!1538346 (=> (not res!1055511) (not e!855846))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538346 (= res!1055511 (validKeyInArray!0 (select (arr!49302 a!2792) j!64)))))

(declare-fun b!1538347 () Bool)

(declare-fun res!1055507 () Bool)

(assert (=> b!1538347 (=> (not res!1055507) (not e!855846))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1538347 (= res!1055507 (and (= (size!49854 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49854 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49854 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538348 () Bool)

(declare-fun res!1055509 () Bool)

(assert (=> b!1538348 (=> (not res!1055509) (not e!855846))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1538348 (= res!1055509 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49854 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49854 a!2792)) (= (select (arr!49302 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538349 () Bool)

(declare-fun res!1055515 () Bool)

(assert (=> b!1538349 (=> (not res!1055515) (not e!855846))))

(assert (=> b!1538349 (= res!1055515 (validKeyInArray!0 (select (arr!49302 a!2792) i!951)))))

(declare-fun b!1538350 () Bool)

(declare-fun res!1055514 () Bool)

(assert (=> b!1538350 (=> (not res!1055514) (not e!855846))))

(assert (=> b!1538350 (= res!1055514 (not (= (select (arr!49302 a!2792) index!463) (select (arr!49302 a!2792) j!64))))))

(declare-fun b!1538351 () Bool)

(assert (=> b!1538351 (= e!855846 false)))

(declare-fun lt!664638 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538351 (= lt!664638 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538352 () Bool)

(declare-fun res!1055512 () Bool)

(assert (=> b!1538352 (=> (not res!1055512) (not e!855846))))

(declare-datatypes ((List!35854 0))(
  ( (Nil!35851) (Cons!35850 (h!37296 (_ BitVec 64)) (t!50540 List!35854)) )
))
(declare-fun arrayNoDuplicates!0 (array!102173 (_ BitVec 32) List!35854) Bool)

(assert (=> b!1538352 (= res!1055512 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35851))))

(declare-fun res!1055508 () Bool)

(assert (=> start!131110 (=> (not res!1055508) (not e!855846))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131110 (= res!1055508 (validMask!0 mask!2480))))

(assert (=> start!131110 e!855846))

(assert (=> start!131110 true))

(declare-fun array_inv!38535 (array!102173) Bool)

(assert (=> start!131110 (array_inv!38535 a!2792)))

(declare-fun b!1538353 () Bool)

(declare-fun res!1055510 () Bool)

(assert (=> b!1538353 (=> (not res!1055510) (not e!855846))))

(declare-datatypes ((SeekEntryResult!13453 0))(
  ( (MissingZero!13453 (index!56207 (_ BitVec 32))) (Found!13453 (index!56208 (_ BitVec 32))) (Intermediate!13453 (undefined!14265 Bool) (index!56209 (_ BitVec 32)) (x!137933 (_ BitVec 32))) (Undefined!13453) (MissingVacant!13453 (index!56210 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102173 (_ BitVec 32)) SeekEntryResult!13453)

(assert (=> b!1538353 (= res!1055510 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49302 a!2792) j!64) a!2792 mask!2480) (Found!13453 j!64)))))

(assert (= (and start!131110 res!1055508) b!1538347))

(assert (= (and b!1538347 res!1055507) b!1538349))

(assert (= (and b!1538349 res!1055515) b!1538346))

(assert (= (and b!1538346 res!1055511) b!1538345))

(assert (= (and b!1538345 res!1055513) b!1538352))

(assert (= (and b!1538352 res!1055512) b!1538348))

(assert (= (and b!1538348 res!1055509) b!1538353))

(assert (= (and b!1538353 res!1055510) b!1538350))

(assert (= (and b!1538350 res!1055514) b!1538351))

(declare-fun m!1420175 () Bool)

(assert (=> b!1538345 m!1420175))

(declare-fun m!1420177 () Bool)

(assert (=> b!1538353 m!1420177))

(assert (=> b!1538353 m!1420177))

(declare-fun m!1420179 () Bool)

(assert (=> b!1538353 m!1420179))

(declare-fun m!1420181 () Bool)

(assert (=> b!1538350 m!1420181))

(assert (=> b!1538350 m!1420177))

(assert (=> b!1538346 m!1420177))

(assert (=> b!1538346 m!1420177))

(declare-fun m!1420183 () Bool)

(assert (=> b!1538346 m!1420183))

(declare-fun m!1420185 () Bool)

(assert (=> b!1538348 m!1420185))

(declare-fun m!1420187 () Bool)

(assert (=> start!131110 m!1420187))

(declare-fun m!1420189 () Bool)

(assert (=> start!131110 m!1420189))

(declare-fun m!1420191 () Bool)

(assert (=> b!1538351 m!1420191))

(declare-fun m!1420193 () Bool)

(assert (=> b!1538352 m!1420193))

(declare-fun m!1420195 () Bool)

(assert (=> b!1538349 m!1420195))

(assert (=> b!1538349 m!1420195))

(declare-fun m!1420197 () Bool)

(assert (=> b!1538349 m!1420197))

(push 1)

(assert (not b!1538351))

(assert (not start!131110))

(assert (not b!1538345))

(assert (not b!1538352))

(assert (not b!1538353))

(assert (not b!1538346))

(assert (not b!1538349))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

