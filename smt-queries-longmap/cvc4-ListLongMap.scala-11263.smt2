; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131376 () Bool)

(assert start!131376)

(declare-fun b!1540375 () Bool)

(declare-fun e!856708 () Bool)

(assert (=> b!1540375 (= e!856708 (not true))))

(declare-datatypes ((SeekEntryResult!13498 0))(
  ( (MissingZero!13498 (index!56387 (_ BitVec 32))) (Found!13498 (index!56388 (_ BitVec 32))) (Intermediate!13498 (undefined!14310 Bool) (index!56389 (_ BitVec 32)) (x!138121 (_ BitVec 32))) (Undefined!13498) (MissingVacant!13498 (index!56390 (_ BitVec 32))) )
))
(declare-fun lt!665325 () SeekEntryResult!13498)

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102324 0))(
  ( (array!102325 (arr!49372 (Array (_ BitVec 32) (_ BitVec 64))) (size!49922 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102324)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun lt!665323 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102324 (_ BitVec 32)) SeekEntryResult!13498)

(assert (=> b!1540375 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665323 vacantIndex!5 (select (store (arr!49372 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102325 (store (arr!49372 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49922 a!2792)) mask!2480) lt!665325)))

(declare-datatypes ((Unit!51436 0))(
  ( (Unit!51437) )
))
(declare-fun lt!665326 () Unit!51436)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102324 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51436)

(assert (=> b!1540375 (= lt!665326 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665323 vacantIndex!5 mask!2480))))

(declare-fun b!1540376 () Bool)

(declare-fun res!1057073 () Bool)

(declare-fun e!856711 () Bool)

(assert (=> b!1540376 (=> (not res!1057073) (not e!856711))))

(assert (=> b!1540376 (= res!1057073 (and (= (size!49922 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49922 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49922 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1057072 () Bool)

(assert (=> start!131376 (=> (not res!1057072) (not e!856711))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131376 (= res!1057072 (validMask!0 mask!2480))))

(assert (=> start!131376 e!856711))

(assert (=> start!131376 true))

(declare-fun array_inv!38400 (array!102324) Bool)

(assert (=> start!131376 (array_inv!38400 a!2792)))

(declare-fun b!1540377 () Bool)

(declare-fun res!1057074 () Bool)

(assert (=> b!1540377 (=> (not res!1057074) (not e!856711))))

(declare-datatypes ((List!35846 0))(
  ( (Nil!35843) (Cons!35842 (h!37287 (_ BitVec 64)) (t!50540 List!35846)) )
))
(declare-fun arrayNoDuplicates!0 (array!102324 (_ BitVec 32) List!35846) Bool)

(assert (=> b!1540377 (= res!1057074 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35843))))

(declare-fun b!1540378 () Bool)

(declare-fun res!1057069 () Bool)

(assert (=> b!1540378 (=> (not res!1057069) (not e!856711))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1540378 (= res!1057069 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49922 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49922 a!2792)) (= (select (arr!49372 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1540379 () Bool)

(declare-fun res!1057071 () Bool)

(assert (=> b!1540379 (=> (not res!1057071) (not e!856711))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1540379 (= res!1057071 (validKeyInArray!0 (select (arr!49372 a!2792) i!951)))))

(declare-fun b!1540380 () Bool)

(declare-fun res!1057075 () Bool)

(assert (=> b!1540380 (=> (not res!1057075) (not e!856711))))

(assert (=> b!1540380 (= res!1057075 (validKeyInArray!0 (select (arr!49372 a!2792) j!64)))))

(declare-fun b!1540381 () Bool)

(declare-fun e!856710 () Bool)

(assert (=> b!1540381 (= e!856710 e!856708)))

(declare-fun res!1057067 () Bool)

(assert (=> b!1540381 (=> (not res!1057067) (not e!856708))))

(declare-fun lt!665324 () SeekEntryResult!13498)

(assert (=> b!1540381 (= res!1057067 (= lt!665325 lt!665324))))

(assert (=> b!1540381 (= lt!665325 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665323 vacantIndex!5 (select (arr!49372 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1540382 () Bool)

(declare-fun e!856709 () Bool)

(assert (=> b!1540382 (= e!856709 e!856710)))

(declare-fun res!1057065 () Bool)

(assert (=> b!1540382 (=> (not res!1057065) (not e!856710))))

(assert (=> b!1540382 (= res!1057065 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665323 #b00000000000000000000000000000000) (bvslt lt!665323 (size!49922 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1540382 (= lt!665323 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1540383 () Bool)

(assert (=> b!1540383 (= e!856711 e!856709)))

(declare-fun res!1057070 () Bool)

(assert (=> b!1540383 (=> (not res!1057070) (not e!856709))))

(assert (=> b!1540383 (= res!1057070 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49372 a!2792) j!64) a!2792 mask!2480) lt!665324))))

(assert (=> b!1540383 (= lt!665324 (Found!13498 j!64))))

(declare-fun b!1540384 () Bool)

(declare-fun res!1057068 () Bool)

(assert (=> b!1540384 (=> (not res!1057068) (not e!856711))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102324 (_ BitVec 32)) Bool)

(assert (=> b!1540384 (= res!1057068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1540385 () Bool)

(declare-fun res!1057066 () Bool)

(assert (=> b!1540385 (=> (not res!1057066) (not e!856709))))

(assert (=> b!1540385 (= res!1057066 (not (= (select (arr!49372 a!2792) index!463) (select (arr!49372 a!2792) j!64))))))

(assert (= (and start!131376 res!1057072) b!1540376))

(assert (= (and b!1540376 res!1057073) b!1540379))

(assert (= (and b!1540379 res!1057071) b!1540380))

(assert (= (and b!1540380 res!1057075) b!1540384))

(assert (= (and b!1540384 res!1057068) b!1540377))

(assert (= (and b!1540377 res!1057074) b!1540378))

(assert (= (and b!1540378 res!1057069) b!1540383))

(assert (= (and b!1540383 res!1057070) b!1540385))

(assert (= (and b!1540385 res!1057066) b!1540382))

(assert (= (and b!1540382 res!1057065) b!1540381))

(assert (= (and b!1540381 res!1057067) b!1540375))

(declare-fun m!1422485 () Bool)

(assert (=> b!1540380 m!1422485))

(assert (=> b!1540380 m!1422485))

(declare-fun m!1422487 () Bool)

(assert (=> b!1540380 m!1422487))

(declare-fun m!1422489 () Bool)

(assert (=> b!1540375 m!1422489))

(declare-fun m!1422491 () Bool)

(assert (=> b!1540375 m!1422491))

(assert (=> b!1540375 m!1422491))

(declare-fun m!1422493 () Bool)

(assert (=> b!1540375 m!1422493))

(declare-fun m!1422495 () Bool)

(assert (=> b!1540375 m!1422495))

(declare-fun m!1422497 () Bool)

(assert (=> b!1540379 m!1422497))

(assert (=> b!1540379 m!1422497))

(declare-fun m!1422499 () Bool)

(assert (=> b!1540379 m!1422499))

(assert (=> b!1540381 m!1422485))

(assert (=> b!1540381 m!1422485))

(declare-fun m!1422501 () Bool)

(assert (=> b!1540381 m!1422501))

(declare-fun m!1422503 () Bool)

(assert (=> b!1540378 m!1422503))

(declare-fun m!1422505 () Bool)

(assert (=> b!1540384 m!1422505))

(declare-fun m!1422507 () Bool)

(assert (=> start!131376 m!1422507))

(declare-fun m!1422509 () Bool)

(assert (=> start!131376 m!1422509))

(declare-fun m!1422511 () Bool)

(assert (=> b!1540385 m!1422511))

(assert (=> b!1540385 m!1422485))

(declare-fun m!1422513 () Bool)

(assert (=> b!1540382 m!1422513))

(assert (=> b!1540383 m!1422485))

(assert (=> b!1540383 m!1422485))

(declare-fun m!1422515 () Bool)

(assert (=> b!1540383 m!1422515))

(declare-fun m!1422517 () Bool)

(assert (=> b!1540377 m!1422517))

(push 1)

(assert (not start!131376))

(assert (not b!1540382))

