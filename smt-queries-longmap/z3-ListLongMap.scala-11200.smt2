; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131214 () Bool)

(assert start!131214)

(declare-fun b!1536646 () Bool)

(declare-fun res!1052249 () Bool)

(declare-fun e!855895 () Bool)

(assert (=> b!1536646 (=> (not res!1052249) (not e!855895))))

(declare-datatypes ((array!102049 0))(
  ( (array!102050 (arr!49234 (Array (_ BitVec 32) (_ BitVec 64))) (size!49785 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102049)

(declare-datatypes ((List!35695 0))(
  ( (Nil!35692) (Cons!35691 (h!37154 (_ BitVec 64)) (t!50381 List!35695)) )
))
(declare-fun arrayNoDuplicates!0 (array!102049 (_ BitVec 32) List!35695) Bool)

(assert (=> b!1536646 (= res!1052249 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35692))))

(declare-fun b!1536647 () Bool)

(declare-fun res!1052252 () Bool)

(assert (=> b!1536647 (=> (not res!1052252) (not e!855895))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1536647 (= res!1052252 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49785 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49785 a!2792)) (= (select (arr!49234 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536648 () Bool)

(declare-fun res!1052246 () Bool)

(assert (=> b!1536648 (=> (not res!1052246) (not e!855895))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536648 (= res!1052246 (validKeyInArray!0 (select (arr!49234 a!2792) j!64)))))

(declare-fun b!1536649 () Bool)

(declare-fun res!1052250 () Bool)

(assert (=> b!1536649 (=> (not res!1052250) (not e!855895))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1536649 (= res!1052250 (and (= (size!49785 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49785 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49785 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536650 () Bool)

(declare-fun res!1052253 () Bool)

(assert (=> b!1536650 (=> (not res!1052253) (not e!855895))))

(assert (=> b!1536650 (= res!1052253 (validKeyInArray!0 (select (arr!49234 a!2792) i!951)))))

(declare-fun b!1536651 () Bool)

(declare-fun res!1052247 () Bool)

(assert (=> b!1536651 (=> (not res!1052247) (not e!855895))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102049 (_ BitVec 32)) Bool)

(assert (=> b!1536651 (= res!1052247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536652 () Bool)

(assert (=> b!1536652 (= e!855895 (and (not (= (select (arr!49234 a!2792) index!463) (select (arr!49234 a!2792) j!64))) (bvsge mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(declare-fun b!1536653 () Bool)

(declare-fun res!1052251 () Bool)

(assert (=> b!1536653 (=> (not res!1052251) (not e!855895))))

(declare-datatypes ((SeekEntryResult!13261 0))(
  ( (MissingZero!13261 (index!55439 (_ BitVec 32))) (Found!13261 (index!55440 (_ BitVec 32))) (Intermediate!13261 (undefined!14073 Bool) (index!55441 (_ BitVec 32)) (x!137406 (_ BitVec 32))) (Undefined!13261) (MissingVacant!13261 (index!55442 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102049 (_ BitVec 32)) SeekEntryResult!13261)

(assert (=> b!1536653 (= res!1052251 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49234 a!2792) j!64) a!2792 mask!2480) (Found!13261 j!64)))))

(declare-fun res!1052248 () Bool)

(assert (=> start!131214 (=> (not res!1052248) (not e!855895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131214 (= res!1052248 (validMask!0 mask!2480))))

(assert (=> start!131214 e!855895))

(assert (=> start!131214 true))

(declare-fun array_inv!38515 (array!102049) Bool)

(assert (=> start!131214 (array_inv!38515 a!2792)))

(assert (= (and start!131214 res!1052248) b!1536649))

(assert (= (and b!1536649 res!1052250) b!1536650))

(assert (= (and b!1536650 res!1052253) b!1536648))

(assert (= (and b!1536648 res!1052246) b!1536651))

(assert (= (and b!1536651 res!1052247) b!1536646))

(assert (= (and b!1536646 res!1052249) b!1536647))

(assert (= (and b!1536647 res!1052252) b!1536653))

(assert (= (and b!1536653 res!1052251) b!1536652))

(declare-fun m!1419169 () Bool)

(assert (=> start!131214 m!1419169))

(declare-fun m!1419171 () Bool)

(assert (=> start!131214 m!1419171))

(declare-fun m!1419173 () Bool)

(assert (=> b!1536651 m!1419173))

(declare-fun m!1419175 () Bool)

(assert (=> b!1536647 m!1419175))

(declare-fun m!1419177 () Bool)

(assert (=> b!1536653 m!1419177))

(assert (=> b!1536653 m!1419177))

(declare-fun m!1419179 () Bool)

(assert (=> b!1536653 m!1419179))

(assert (=> b!1536648 m!1419177))

(assert (=> b!1536648 m!1419177))

(declare-fun m!1419181 () Bool)

(assert (=> b!1536648 m!1419181))

(declare-fun m!1419183 () Bool)

(assert (=> b!1536650 m!1419183))

(assert (=> b!1536650 m!1419183))

(declare-fun m!1419185 () Bool)

(assert (=> b!1536650 m!1419185))

(declare-fun m!1419187 () Bool)

(assert (=> b!1536646 m!1419187))

(declare-fun m!1419189 () Bool)

(assert (=> b!1536652 m!1419189))

(assert (=> b!1536652 m!1419177))

(check-sat (not b!1536653) (not b!1536646) (not b!1536648) (not start!131214) (not b!1536650) (not b!1536651))
(check-sat)
