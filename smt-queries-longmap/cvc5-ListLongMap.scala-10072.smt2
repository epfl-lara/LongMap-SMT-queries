; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118566 () Bool)

(assert start!118566)

(declare-fun b!1386099 () Bool)

(declare-fun e!785263 () Bool)

(declare-datatypes ((array!94842 0))(
  ( (array!94843 (arr!45797 (Array (_ BitVec 32) (_ BitVec 64))) (size!46347 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94842)

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1386099 (= e!785263 (not (or (bvsgt #b00000000000000000000000000000000 (size!46347 a!2938)) (bvsle startIndex!16 (size!46347 a!2938)))))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10140 0))(
  ( (MissingZero!10140 (index!42931 (_ BitVec 32))) (Found!10140 (index!42932 (_ BitVec 32))) (Intermediate!10140 (undefined!10952 Bool) (index!42933 (_ BitVec 32)) (x!124557 (_ BitVec 32))) (Undefined!10140) (MissingVacant!10140 (index!42934 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94842 (_ BitVec 32)) SeekEntryResult!10140)

(assert (=> b!1386099 (= (seekEntryOrOpen!0 (select (arr!45797 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45797 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94843 (store (arr!45797 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46347 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46268 0))(
  ( (Unit!46269) )
))
(declare-fun lt!609372 () Unit!46268)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94842 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46268)

(assert (=> b!1386099 (= lt!609372 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1386100 () Bool)

(declare-fun res!927354 () Bool)

(assert (=> b!1386100 (=> (not res!927354) (not e!785263))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94842 (_ BitVec 32)) Bool)

(assert (=> b!1386100 (= res!927354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386101 () Bool)

(declare-fun res!927355 () Bool)

(assert (=> b!1386101 (=> (not res!927355) (not e!785263))))

(assert (=> b!1386101 (= res!927355 (and (not (= (select (arr!45797 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45797 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1386102 () Bool)

(declare-fun res!927350 () Bool)

(assert (=> b!1386102 (=> (not res!927350) (not e!785263))))

(assert (=> b!1386102 (= res!927350 (and (= (size!46347 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46347 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46347 a!2938))))))

(declare-fun b!1386103 () Bool)

(declare-fun res!927352 () Bool)

(assert (=> b!1386103 (=> (not res!927352) (not e!785263))))

(declare-datatypes ((List!32325 0))(
  ( (Nil!32322) (Cons!32321 (h!33530 (_ BitVec 64)) (t!47019 List!32325)) )
))
(declare-fun arrayNoDuplicates!0 (array!94842 (_ BitVec 32) List!32325) Bool)

(assert (=> b!1386103 (= res!927352 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32322))))

(declare-fun b!1386104 () Bool)

(declare-fun res!927353 () Bool)

(assert (=> b!1386104 (=> (not res!927353) (not e!785263))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386104 (= res!927353 (validKeyInArray!0 (select (arr!45797 a!2938) startIndex!16)))))

(declare-fun res!927349 () Bool)

(assert (=> start!118566 (=> (not res!927349) (not e!785263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118566 (= res!927349 (validMask!0 mask!2987))))

(assert (=> start!118566 e!785263))

(assert (=> start!118566 true))

(declare-fun array_inv!34825 (array!94842) Bool)

(assert (=> start!118566 (array_inv!34825 a!2938)))

(declare-fun b!1386105 () Bool)

(declare-fun res!927351 () Bool)

(assert (=> b!1386105 (=> (not res!927351) (not e!785263))))

(assert (=> b!1386105 (= res!927351 (validKeyInArray!0 (select (arr!45797 a!2938) i!1065)))))

(assert (= (and start!118566 res!927349) b!1386102))

(assert (= (and b!1386102 res!927350) b!1386105))

(assert (= (and b!1386105 res!927351) b!1386103))

(assert (= (and b!1386103 res!927352) b!1386100))

(assert (= (and b!1386100 res!927354) b!1386101))

(assert (= (and b!1386101 res!927355) b!1386104))

(assert (= (and b!1386104 res!927353) b!1386099))

(declare-fun m!1271415 () Bool)

(assert (=> b!1386099 m!1271415))

(assert (=> b!1386099 m!1271415))

(declare-fun m!1271417 () Bool)

(assert (=> b!1386099 m!1271417))

(declare-fun m!1271419 () Bool)

(assert (=> b!1386099 m!1271419))

(declare-fun m!1271421 () Bool)

(assert (=> b!1386099 m!1271421))

(declare-fun m!1271423 () Bool)

(assert (=> b!1386099 m!1271423))

(assert (=> b!1386099 m!1271423))

(declare-fun m!1271425 () Bool)

(assert (=> b!1386099 m!1271425))

(declare-fun m!1271427 () Bool)

(assert (=> b!1386105 m!1271427))

(assert (=> b!1386105 m!1271427))

(declare-fun m!1271429 () Bool)

(assert (=> b!1386105 m!1271429))

(assert (=> b!1386101 m!1271427))

(assert (=> b!1386104 m!1271423))

(assert (=> b!1386104 m!1271423))

(declare-fun m!1271431 () Bool)

(assert (=> b!1386104 m!1271431))

(declare-fun m!1271433 () Bool)

(assert (=> b!1386100 m!1271433))

(declare-fun m!1271435 () Bool)

(assert (=> start!118566 m!1271435))

(declare-fun m!1271437 () Bool)

(assert (=> start!118566 m!1271437))

(declare-fun m!1271439 () Bool)

(assert (=> b!1386103 m!1271439))

(push 1)

(assert (not b!1386105))

(assert (not b!1386099))

(assert (not start!118566))

(assert (not b!1386104))

(assert (not b!1386103))

(assert (not b!1386100))

(check-sat)

(pop 1)

(push 1)

(check-sat)

