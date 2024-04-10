; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131088 () Bool)

(assert start!131088)

(declare-fun b!1538030 () Bool)

(declare-fun res!1055121 () Bool)

(declare-fun e!855828 () Bool)

(assert (=> b!1538030 (=> (not res!1055121) (not e!855828))))

(declare-datatypes ((array!102186 0))(
  ( (array!102187 (arr!49309 (Array (_ BitVec 32) (_ BitVec 64))) (size!49859 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102186)

(declare-datatypes ((List!35783 0))(
  ( (Nil!35780) (Cons!35779 (h!37224 (_ BitVec 64)) (t!50477 List!35783)) )
))
(declare-fun arrayNoDuplicates!0 (array!102186 (_ BitVec 32) List!35783) Bool)

(assert (=> b!1538030 (= res!1055121 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35780))))

(declare-fun res!1055120 () Bool)

(assert (=> start!131088 (=> (not res!1055120) (not e!855828))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131088 (= res!1055120 (validMask!0 mask!2480))))

(assert (=> start!131088 e!855828))

(assert (=> start!131088 true))

(declare-fun array_inv!38337 (array!102186) Bool)

(assert (=> start!131088 (array_inv!38337 a!2792)))

(declare-fun b!1538031 () Bool)

(declare-fun res!1055119 () Bool)

(assert (=> b!1538031 (=> (not res!1055119) (not e!855828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102186 (_ BitVec 32)) Bool)

(assert (=> b!1538031 (= res!1055119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538032 () Bool)

(declare-fun res!1055122 () Bool)

(assert (=> b!1538032 (=> (not res!1055122) (not e!855828))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538032 (= res!1055122 (validKeyInArray!0 (select (arr!49309 a!2792) i!951)))))

(declare-fun b!1538033 () Bool)

(declare-fun res!1055117 () Bool)

(assert (=> b!1538033 (=> (not res!1055117) (not e!855828))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1538033 (= res!1055117 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49859 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49859 a!2792)) (= (select (arr!49309 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538034 () Bool)

(assert (=> b!1538034 (= e!855828 false)))

(declare-datatypes ((SeekEntryResult!13435 0))(
  ( (MissingZero!13435 (index!56135 (_ BitVec 32))) (Found!13435 (index!56136 (_ BitVec 32))) (Intermediate!13435 (undefined!14247 Bool) (index!56137 (_ BitVec 32)) (x!137869 (_ BitVec 32))) (Undefined!13435) (MissingVacant!13435 (index!56138 (_ BitVec 32))) )
))
(declare-fun lt!664819 () SeekEntryResult!13435)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102186 (_ BitVec 32)) SeekEntryResult!13435)

(assert (=> b!1538034 (= lt!664819 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49309 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1538035 () Bool)

(declare-fun res!1055118 () Bool)

(assert (=> b!1538035 (=> (not res!1055118) (not e!855828))))

(assert (=> b!1538035 (= res!1055118 (validKeyInArray!0 (select (arr!49309 a!2792) j!64)))))

(declare-fun b!1538036 () Bool)

(declare-fun res!1055116 () Bool)

(assert (=> b!1538036 (=> (not res!1055116) (not e!855828))))

(assert (=> b!1538036 (= res!1055116 (and (= (size!49859 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49859 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49859 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!131088 res!1055120) b!1538036))

(assert (= (and b!1538036 res!1055116) b!1538032))

(assert (= (and b!1538032 res!1055122) b!1538035))

(assert (= (and b!1538035 res!1055118) b!1538031))

(assert (= (and b!1538031 res!1055119) b!1538030))

(assert (= (and b!1538030 res!1055121) b!1538033))

(assert (= (and b!1538033 res!1055117) b!1538034))

(declare-fun m!1420531 () Bool)

(assert (=> b!1538034 m!1420531))

(assert (=> b!1538034 m!1420531))

(declare-fun m!1420533 () Bool)

(assert (=> b!1538034 m!1420533))

(declare-fun m!1420535 () Bool)

(assert (=> b!1538032 m!1420535))

(assert (=> b!1538032 m!1420535))

(declare-fun m!1420537 () Bool)

(assert (=> b!1538032 m!1420537))

(declare-fun m!1420539 () Bool)

(assert (=> start!131088 m!1420539))

(declare-fun m!1420541 () Bool)

(assert (=> start!131088 m!1420541))

(declare-fun m!1420543 () Bool)

(assert (=> b!1538031 m!1420543))

(assert (=> b!1538035 m!1420531))

(assert (=> b!1538035 m!1420531))

(declare-fun m!1420545 () Bool)

(assert (=> b!1538035 m!1420545))

(declare-fun m!1420547 () Bool)

(assert (=> b!1538033 m!1420547))

(declare-fun m!1420549 () Bool)

(assert (=> b!1538030 m!1420549))

(push 1)

(assert (not b!1538031))

(assert (not start!131088))

(assert (not b!1538034))

(assert (not b!1538035))

(assert (not b!1538030))

(assert (not b!1538032))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

