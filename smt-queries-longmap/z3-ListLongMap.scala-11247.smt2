; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131152 () Bool)

(assert start!131152)

(declare-fun b!1538550 () Bool)

(declare-fun res!1055531 () Bool)

(declare-fun e!856021 () Bool)

(assert (=> b!1538550 (=> (not res!1055531) (not e!856021))))

(declare-datatypes ((array!102217 0))(
  ( (array!102218 (arr!49323 (Array (_ BitVec 32) (_ BitVec 64))) (size!49873 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102217)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538550 (= res!1055531 (validKeyInArray!0 (select (arr!49323 a!2792) j!64)))))

(declare-fun b!1538551 () Bool)

(declare-fun res!1055530 () Bool)

(assert (=> b!1538551 (=> (not res!1055530) (not e!856021))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1538551 (= res!1055530 (validKeyInArray!0 (select (arr!49323 a!2792) i!951)))))

(declare-fun res!1055535 () Bool)

(assert (=> start!131152 (=> (not res!1055535) (not e!856021))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131152 (= res!1055535 (validMask!0 mask!2480))))

(assert (=> start!131152 e!856021))

(assert (=> start!131152 true))

(declare-fun array_inv!38351 (array!102217) Bool)

(assert (=> start!131152 (array_inv!38351 a!2792)))

(declare-fun b!1538552 () Bool)

(declare-fun res!1055528 () Bool)

(assert (=> b!1538552 (=> (not res!1055528) (not e!856021))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1538552 (= res!1055528 (not (= (select (arr!49323 a!2792) index!463) (select (arr!49323 a!2792) j!64))))))

(declare-fun b!1538553 () Bool)

(declare-fun res!1055532 () Bool)

(assert (=> b!1538553 (=> (not res!1055532) (not e!856021))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13449 0))(
  ( (MissingZero!13449 (index!56191 (_ BitVec 32))) (Found!13449 (index!56192 (_ BitVec 32))) (Intermediate!13449 (undefined!14261 Bool) (index!56193 (_ BitVec 32)) (x!137926 (_ BitVec 32))) (Undefined!13449) (MissingVacant!13449 (index!56194 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102217 (_ BitVec 32)) SeekEntryResult!13449)

(assert (=> b!1538553 (= res!1055532 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49323 a!2792) j!64) a!2792 mask!2480) (Found!13449 j!64)))))

(declare-fun b!1538554 () Bool)

(declare-fun res!1055533 () Bool)

(assert (=> b!1538554 (=> (not res!1055533) (not e!856021))))

(assert (=> b!1538554 (= res!1055533 (and (= (size!49873 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49873 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49873 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538555 () Bool)

(assert (=> b!1538555 (= e!856021 false)))

(declare-fun lt!664912 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538555 (= lt!664912 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538556 () Bool)

(declare-fun res!1055529 () Bool)

(assert (=> b!1538556 (=> (not res!1055529) (not e!856021))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102217 (_ BitVec 32)) Bool)

(assert (=> b!1538556 (= res!1055529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538557 () Bool)

(declare-fun res!1055534 () Bool)

(assert (=> b!1538557 (=> (not res!1055534) (not e!856021))))

(assert (=> b!1538557 (= res!1055534 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49873 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49873 a!2792)) (= (select (arr!49323 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538558 () Bool)

(declare-fun res!1055536 () Bool)

(assert (=> b!1538558 (=> (not res!1055536) (not e!856021))))

(declare-datatypes ((List!35797 0))(
  ( (Nil!35794) (Cons!35793 (h!37238 (_ BitVec 64)) (t!50491 List!35797)) )
))
(declare-fun arrayNoDuplicates!0 (array!102217 (_ BitVec 32) List!35797) Bool)

(assert (=> b!1538558 (= res!1055536 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35794))))

(assert (= (and start!131152 res!1055535) b!1538554))

(assert (= (and b!1538554 res!1055533) b!1538551))

(assert (= (and b!1538551 res!1055530) b!1538550))

(assert (= (and b!1538550 res!1055531) b!1538556))

(assert (= (and b!1538556 res!1055529) b!1538558))

(assert (= (and b!1538558 res!1055536) b!1538557))

(assert (= (and b!1538557 res!1055534) b!1538553))

(assert (= (and b!1538553 res!1055532) b!1538552))

(assert (= (and b!1538552 res!1055528) b!1538555))

(declare-fun m!1420971 () Bool)

(assert (=> b!1538552 m!1420971))

(declare-fun m!1420973 () Bool)

(assert (=> b!1538552 m!1420973))

(assert (=> b!1538550 m!1420973))

(assert (=> b!1538550 m!1420973))

(declare-fun m!1420975 () Bool)

(assert (=> b!1538550 m!1420975))

(declare-fun m!1420977 () Bool)

(assert (=> b!1538557 m!1420977))

(declare-fun m!1420979 () Bool)

(assert (=> b!1538556 m!1420979))

(declare-fun m!1420981 () Bool)

(assert (=> b!1538555 m!1420981))

(declare-fun m!1420983 () Bool)

(assert (=> b!1538558 m!1420983))

(declare-fun m!1420985 () Bool)

(assert (=> start!131152 m!1420985))

(declare-fun m!1420987 () Bool)

(assert (=> start!131152 m!1420987))

(declare-fun m!1420989 () Bool)

(assert (=> b!1538551 m!1420989))

(assert (=> b!1538551 m!1420989))

(declare-fun m!1420991 () Bool)

(assert (=> b!1538551 m!1420991))

(assert (=> b!1538553 m!1420973))

(assert (=> b!1538553 m!1420973))

(declare-fun m!1420993 () Bool)

(assert (=> b!1538553 m!1420993))

(check-sat (not b!1538558) (not b!1538555) (not b!1538556) (not b!1538550) (not b!1538553) (not b!1538551) (not start!131152))
