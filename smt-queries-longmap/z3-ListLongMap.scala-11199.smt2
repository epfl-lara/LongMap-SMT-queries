; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131208 () Bool)

(assert start!131208)

(declare-fun b!1536574 () Bool)

(declare-fun res!1052177 () Bool)

(declare-fun e!855876 () Bool)

(assert (=> b!1536574 (=> (not res!1052177) (not e!855876))))

(declare-datatypes ((array!102043 0))(
  ( (array!102044 (arr!49231 (Array (_ BitVec 32) (_ BitVec 64))) (size!49782 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102043)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536574 (= res!1052177 (validKeyInArray!0 (select (arr!49231 a!2792) i!951)))))

(declare-fun b!1536575 () Bool)

(declare-fun res!1052178 () Bool)

(assert (=> b!1536575 (=> (not res!1052178) (not e!855876))))

(declare-datatypes ((List!35692 0))(
  ( (Nil!35689) (Cons!35688 (h!37151 (_ BitVec 64)) (t!50378 List!35692)) )
))
(declare-fun arrayNoDuplicates!0 (array!102043 (_ BitVec 32) List!35692) Bool)

(assert (=> b!1536575 (= res!1052178 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35689))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun b!1536576 () Bool)

(assert (=> b!1536576 (= e!855876 (and (not (= (select (arr!49231 a!2792) index!463) (select (arr!49231 a!2792) j!64))) (bvslt mask!2480 #b00000000000000000000000000000000)))))

(declare-fun b!1536577 () Bool)

(declare-fun res!1052179 () Bool)

(assert (=> b!1536577 (=> (not res!1052179) (not e!855876))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1536577 (= res!1052179 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49782 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49782 a!2792)) (= (select (arr!49231 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536578 () Bool)

(declare-fun res!1052181 () Bool)

(assert (=> b!1536578 (=> (not res!1052181) (not e!855876))))

(assert (=> b!1536578 (= res!1052181 (and (= (size!49782 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49782 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49782 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536579 () Bool)

(declare-fun res!1052180 () Bool)

(assert (=> b!1536579 (=> (not res!1052180) (not e!855876))))

(assert (=> b!1536579 (= res!1052180 (validKeyInArray!0 (select (arr!49231 a!2792) j!64)))))

(declare-fun b!1536580 () Bool)

(declare-fun res!1052175 () Bool)

(assert (=> b!1536580 (=> (not res!1052175) (not e!855876))))

(declare-datatypes ((SeekEntryResult!13258 0))(
  ( (MissingZero!13258 (index!55427 (_ BitVec 32))) (Found!13258 (index!55428 (_ BitVec 32))) (Intermediate!13258 (undefined!14070 Bool) (index!55429 (_ BitVec 32)) (x!137395 (_ BitVec 32))) (Undefined!13258) (MissingVacant!13258 (index!55430 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102043 (_ BitVec 32)) SeekEntryResult!13258)

(assert (=> b!1536580 (= res!1052175 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49231 a!2792) j!64) a!2792 mask!2480) (Found!13258 j!64)))))

(declare-fun res!1052176 () Bool)

(assert (=> start!131208 (=> (not res!1052176) (not e!855876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131208 (= res!1052176 (validMask!0 mask!2480))))

(assert (=> start!131208 e!855876))

(assert (=> start!131208 true))

(declare-fun array_inv!38512 (array!102043) Bool)

(assert (=> start!131208 (array_inv!38512 a!2792)))

(declare-fun b!1536581 () Bool)

(declare-fun res!1052174 () Bool)

(assert (=> b!1536581 (=> (not res!1052174) (not e!855876))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102043 (_ BitVec 32)) Bool)

(assert (=> b!1536581 (= res!1052174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!131208 res!1052176) b!1536578))

(assert (= (and b!1536578 res!1052181) b!1536574))

(assert (= (and b!1536574 res!1052177) b!1536579))

(assert (= (and b!1536579 res!1052180) b!1536581))

(assert (= (and b!1536581 res!1052174) b!1536575))

(assert (= (and b!1536575 res!1052178) b!1536577))

(assert (= (and b!1536577 res!1052179) b!1536580))

(assert (= (and b!1536580 res!1052175) b!1536576))

(declare-fun m!1419103 () Bool)

(assert (=> b!1536580 m!1419103))

(assert (=> b!1536580 m!1419103))

(declare-fun m!1419105 () Bool)

(assert (=> b!1536580 m!1419105))

(declare-fun m!1419107 () Bool)

(assert (=> b!1536575 m!1419107))

(declare-fun m!1419109 () Bool)

(assert (=> b!1536577 m!1419109))

(declare-fun m!1419111 () Bool)

(assert (=> b!1536574 m!1419111))

(assert (=> b!1536574 m!1419111))

(declare-fun m!1419113 () Bool)

(assert (=> b!1536574 m!1419113))

(assert (=> b!1536579 m!1419103))

(assert (=> b!1536579 m!1419103))

(declare-fun m!1419115 () Bool)

(assert (=> b!1536579 m!1419115))

(declare-fun m!1419117 () Bool)

(assert (=> b!1536576 m!1419117))

(assert (=> b!1536576 m!1419103))

(declare-fun m!1419119 () Bool)

(assert (=> start!131208 m!1419119))

(declare-fun m!1419121 () Bool)

(assert (=> start!131208 m!1419121))

(declare-fun m!1419123 () Bool)

(assert (=> b!1536581 m!1419123))

(check-sat (not b!1536580) (not b!1536579) (not b!1536581) (not b!1536575) (not b!1536574) (not start!131208))
(check-sat)
