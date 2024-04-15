; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130776 () Bool)

(assert start!130776)

(declare-fun b!1533969 () Bool)

(declare-fun res!1051241 () Bool)

(declare-fun e!854259 () Bool)

(assert (=> b!1533969 (=> (not res!1051241) (not e!854259))))

(declare-datatypes ((array!101872 0))(
  ( (array!101873 (arr!49153 (Array (_ BitVec 32) (_ BitVec 64))) (size!49705 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101872)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533969 (= res!1051241 (and (= (size!49705 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49705 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49705 a!2792)) (not (= i!951 j!64))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun b!1533970 () Bool)

(assert (=> b!1533970 (= e!854259 (and (not (= (select (arr!49153 a!2792) index!463) (select (arr!49153 a!2792) j!64))) (bvslt mask!2480 #b00000000000000000000000000000000)))))

(declare-fun b!1533971 () Bool)

(declare-fun res!1051243 () Bool)

(assert (=> b!1533971 (=> (not res!1051243) (not e!854259))))

(declare-datatypes ((List!35705 0))(
  ( (Nil!35702) (Cons!35701 (h!37147 (_ BitVec 64)) (t!50391 List!35705)) )
))
(declare-fun arrayNoDuplicates!0 (array!101872 (_ BitVec 32) List!35705) Bool)

(assert (=> b!1533971 (= res!1051243 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35702))))

(declare-fun b!1533972 () Bool)

(declare-fun res!1051239 () Bool)

(assert (=> b!1533972 (=> (not res!1051239) (not e!854259))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533972 (= res!1051239 (validKeyInArray!0 (select (arr!49153 a!2792) i!951)))))

(declare-fun b!1533974 () Bool)

(declare-fun res!1051244 () Bool)

(assert (=> b!1533974 (=> (not res!1051244) (not e!854259))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1533974 (= res!1051244 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49705 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49705 a!2792)) (= (select (arr!49153 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533975 () Bool)

(declare-fun res!1051240 () Bool)

(assert (=> b!1533975 (=> (not res!1051240) (not e!854259))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101872 (_ BitVec 32)) Bool)

(assert (=> b!1533975 (= res!1051240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533976 () Bool)

(declare-fun res!1051245 () Bool)

(assert (=> b!1533976 (=> (not res!1051245) (not e!854259))))

(assert (=> b!1533976 (= res!1051245 (validKeyInArray!0 (select (arr!49153 a!2792) j!64)))))

(declare-fun res!1051242 () Bool)

(assert (=> start!130776 (=> (not res!1051242) (not e!854259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130776 (= res!1051242 (validMask!0 mask!2480))))

(assert (=> start!130776 e!854259))

(assert (=> start!130776 true))

(declare-fun array_inv!38386 (array!101872) Bool)

(assert (=> start!130776 (array_inv!38386 a!2792)))

(declare-fun b!1533973 () Bool)

(declare-fun res!1051246 () Bool)

(assert (=> b!1533973 (=> (not res!1051246) (not e!854259))))

(declare-datatypes ((SeekEntryResult!13310 0))(
  ( (MissingZero!13310 (index!55635 (_ BitVec 32))) (Found!13310 (index!55636 (_ BitVec 32))) (Intermediate!13310 (undefined!14122 Bool) (index!55637 (_ BitVec 32)) (x!137395 (_ BitVec 32))) (Undefined!13310) (MissingVacant!13310 (index!55638 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101872 (_ BitVec 32)) SeekEntryResult!13310)

(assert (=> b!1533973 (= res!1051246 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49153 a!2792) j!64) a!2792 mask!2480) (Found!13310 j!64)))))

(assert (= (and start!130776 res!1051242) b!1533969))

(assert (= (and b!1533969 res!1051241) b!1533972))

(assert (= (and b!1533972 res!1051239) b!1533976))

(assert (= (and b!1533976 res!1051245) b!1533975))

(assert (= (and b!1533975 res!1051240) b!1533971))

(assert (= (and b!1533971 res!1051243) b!1533974))

(assert (= (and b!1533974 res!1051244) b!1533973))

(assert (= (and b!1533973 res!1051246) b!1533970))

(declare-fun m!1416053 () Bool)

(assert (=> start!130776 m!1416053))

(declare-fun m!1416055 () Bool)

(assert (=> start!130776 m!1416055))

(declare-fun m!1416057 () Bool)

(assert (=> b!1533975 m!1416057))

(declare-fun m!1416059 () Bool)

(assert (=> b!1533973 m!1416059))

(assert (=> b!1533973 m!1416059))

(declare-fun m!1416061 () Bool)

(assert (=> b!1533973 m!1416061))

(declare-fun m!1416063 () Bool)

(assert (=> b!1533972 m!1416063))

(assert (=> b!1533972 m!1416063))

(declare-fun m!1416065 () Bool)

(assert (=> b!1533972 m!1416065))

(declare-fun m!1416067 () Bool)

(assert (=> b!1533971 m!1416067))

(declare-fun m!1416069 () Bool)

(assert (=> b!1533974 m!1416069))

(assert (=> b!1533976 m!1416059))

(assert (=> b!1533976 m!1416059))

(declare-fun m!1416071 () Bool)

(assert (=> b!1533976 m!1416071))

(declare-fun m!1416073 () Bool)

(assert (=> b!1533970 m!1416073))

(assert (=> b!1533970 m!1416059))

(check-sat (not b!1533971) (not b!1533975) (not b!1533973) (not b!1533972) (not start!130776) (not b!1533976))
(check-sat)
