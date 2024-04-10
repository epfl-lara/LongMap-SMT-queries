; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131150 () Bool)

(assert start!131150)

(declare-fun b!1538523 () Bool)

(declare-fun res!1055502 () Bool)

(declare-fun e!856014 () Bool)

(assert (=> b!1538523 (=> (not res!1055502) (not e!856014))))

(declare-datatypes ((array!102215 0))(
  ( (array!102216 (arr!49322 (Array (_ BitVec 32) (_ BitVec 64))) (size!49872 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102215)

(declare-datatypes ((List!35796 0))(
  ( (Nil!35793) (Cons!35792 (h!37237 (_ BitVec 64)) (t!50490 List!35796)) )
))
(declare-fun arrayNoDuplicates!0 (array!102215 (_ BitVec 32) List!35796) Bool)

(assert (=> b!1538523 (= res!1055502 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35793))))

(declare-fun b!1538524 () Bool)

(declare-fun res!1055509 () Bool)

(assert (=> b!1538524 (=> (not res!1055509) (not e!856014))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102215 (_ BitVec 32)) Bool)

(assert (=> b!1538524 (= res!1055509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538525 () Bool)

(declare-fun res!1055506 () Bool)

(assert (=> b!1538525 (=> (not res!1055506) (not e!856014))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1538525 (= res!1055506 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49872 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49872 a!2792)) (= (select (arr!49322 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538526 () Bool)

(assert (=> b!1538526 (= e!856014 false)))

(declare-fun lt!664909 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538526 (= lt!664909 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538527 () Bool)

(declare-fun res!1055501 () Bool)

(assert (=> b!1538527 (=> (not res!1055501) (not e!856014))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538527 (= res!1055501 (validKeyInArray!0 (select (arr!49322 a!2792) i!951)))))

(declare-fun b!1538528 () Bool)

(declare-fun res!1055504 () Bool)

(assert (=> b!1538528 (=> (not res!1055504) (not e!856014))))

(declare-fun j!64 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13448 0))(
  ( (MissingZero!13448 (index!56187 (_ BitVec 32))) (Found!13448 (index!56188 (_ BitVec 32))) (Intermediate!13448 (undefined!14260 Bool) (index!56189 (_ BitVec 32)) (x!137925 (_ BitVec 32))) (Undefined!13448) (MissingVacant!13448 (index!56190 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102215 (_ BitVec 32)) SeekEntryResult!13448)

(assert (=> b!1538528 (= res!1055504 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49322 a!2792) j!64) a!2792 mask!2480) (Found!13448 j!64)))))

(declare-fun b!1538529 () Bool)

(declare-fun res!1055503 () Bool)

(assert (=> b!1538529 (=> (not res!1055503) (not e!856014))))

(assert (=> b!1538529 (= res!1055503 (validKeyInArray!0 (select (arr!49322 a!2792) j!64)))))

(declare-fun res!1055505 () Bool)

(assert (=> start!131150 (=> (not res!1055505) (not e!856014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131150 (= res!1055505 (validMask!0 mask!2480))))

(assert (=> start!131150 e!856014))

(assert (=> start!131150 true))

(declare-fun array_inv!38350 (array!102215) Bool)

(assert (=> start!131150 (array_inv!38350 a!2792)))

(declare-fun b!1538530 () Bool)

(declare-fun res!1055507 () Bool)

(assert (=> b!1538530 (=> (not res!1055507) (not e!856014))))

(assert (=> b!1538530 (= res!1055507 (not (= (select (arr!49322 a!2792) index!463) (select (arr!49322 a!2792) j!64))))))

(declare-fun b!1538531 () Bool)

(declare-fun res!1055508 () Bool)

(assert (=> b!1538531 (=> (not res!1055508) (not e!856014))))

(assert (=> b!1538531 (= res!1055508 (and (= (size!49872 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49872 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49872 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!131150 res!1055505) b!1538531))

(assert (= (and b!1538531 res!1055508) b!1538527))

(assert (= (and b!1538527 res!1055501) b!1538529))

(assert (= (and b!1538529 res!1055503) b!1538524))

(assert (= (and b!1538524 res!1055509) b!1538523))

(assert (= (and b!1538523 res!1055502) b!1538525))

(assert (= (and b!1538525 res!1055506) b!1538528))

(assert (= (and b!1538528 res!1055504) b!1538530))

(assert (= (and b!1538530 res!1055507) b!1538526))

(declare-fun m!1420947 () Bool)

(assert (=> b!1538529 m!1420947))

(assert (=> b!1538529 m!1420947))

(declare-fun m!1420949 () Bool)

(assert (=> b!1538529 m!1420949))

(assert (=> b!1538528 m!1420947))

(assert (=> b!1538528 m!1420947))

(declare-fun m!1420951 () Bool)

(assert (=> b!1538528 m!1420951))

(declare-fun m!1420953 () Bool)

(assert (=> b!1538524 m!1420953))

(declare-fun m!1420955 () Bool)

(assert (=> start!131150 m!1420955))

(declare-fun m!1420957 () Bool)

(assert (=> start!131150 m!1420957))

(declare-fun m!1420959 () Bool)

(assert (=> b!1538526 m!1420959))

(declare-fun m!1420961 () Bool)

(assert (=> b!1538527 m!1420961))

(assert (=> b!1538527 m!1420961))

(declare-fun m!1420963 () Bool)

(assert (=> b!1538527 m!1420963))

(declare-fun m!1420965 () Bool)

(assert (=> b!1538530 m!1420965))

(assert (=> b!1538530 m!1420947))

(declare-fun m!1420967 () Bool)

(assert (=> b!1538525 m!1420967))

(declare-fun m!1420969 () Bool)

(assert (=> b!1538523 m!1420969))

(push 1)

(assert (not b!1538524))

(assert (not start!131150))

(assert (not b!1538527))

(assert (not b!1538529))

(assert (not b!1538526))

(assert (not b!1538523))

(assert (not b!1538528))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

