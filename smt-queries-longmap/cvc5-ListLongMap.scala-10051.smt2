; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118410 () Bool)

(assert start!118410)

(declare-fun b!1385095 () Bool)

(declare-datatypes ((Unit!46239 0))(
  ( (Unit!46240) )
))
(declare-fun e!784809 () Unit!46239)

(declare-fun Unit!46241 () Unit!46239)

(assert (=> b!1385095 (= e!784809 Unit!46241)))

(declare-fun b!1385096 () Bool)

(declare-fun res!926400 () Bool)

(declare-fun e!784810 () Bool)

(assert (=> b!1385096 (=> (not res!926400) (not e!784810))))

(declare-datatypes ((array!94713 0))(
  ( (array!94714 (arr!45734 (Array (_ BitVec 32) (_ BitVec 64))) (size!46284 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94713)

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1385096 (= res!926400 (and (not (= (select (arr!45734 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45734 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1385097 () Bool)

(declare-fun res!926395 () Bool)

(assert (=> b!1385097 (=> (not res!926395) (not e!784810))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385097 (= res!926395 (validKeyInArray!0 (select (arr!45734 a!2938) i!1065)))))

(declare-fun b!1385098 () Bool)

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385098 (= e!784810 (and (bvsge startIndex!16 (bvsub (size!46284 a!2938) #b00000000000000000000000000000001)) (bvsgt startIndex!16 (size!46284 a!2938))))))

(declare-fun lt!609170 () Unit!46239)

(assert (=> b!1385098 (= lt!609170 e!784809)))

(declare-fun c!128790 () Bool)

(declare-fun e!784811 () Bool)

(assert (=> b!1385098 (= c!128790 e!784811)))

(declare-fun res!926396 () Bool)

(assert (=> b!1385098 (=> (not res!926396) (not e!784811))))

(assert (=> b!1385098 (= res!926396 (not (= startIndex!16 i!1065)))))

(declare-fun b!1385099 () Bool)

(declare-fun res!926397 () Bool)

(assert (=> b!1385099 (=> (not res!926397) (not e!784810))))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1385099 (= res!926397 (and (= (size!46284 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46284 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46284 a!2938))))))

(declare-fun b!1385100 () Bool)

(assert (=> b!1385100 (= e!784811 (validKeyInArray!0 (select (arr!45734 a!2938) startIndex!16)))))

(declare-fun res!926398 () Bool)

(assert (=> start!118410 (=> (not res!926398) (not e!784810))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118410 (= res!926398 (validMask!0 mask!2987))))

(assert (=> start!118410 e!784810))

(assert (=> start!118410 true))

(declare-fun array_inv!34762 (array!94713) Bool)

(assert (=> start!118410 (array_inv!34762 a!2938)))

(declare-fun b!1385101 () Bool)

(declare-fun res!926399 () Bool)

(assert (=> b!1385101 (=> (not res!926399) (not e!784810))))

(declare-datatypes ((List!32262 0))(
  ( (Nil!32259) (Cons!32258 (h!33467 (_ BitVec 64)) (t!46956 List!32262)) )
))
(declare-fun arrayNoDuplicates!0 (array!94713 (_ BitVec 32) List!32262) Bool)

(assert (=> b!1385101 (= res!926399 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32259))))

(declare-fun b!1385102 () Bool)

(declare-fun res!926401 () Bool)

(assert (=> b!1385102 (=> (not res!926401) (not e!784810))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94713 (_ BitVec 32)) Bool)

(assert (=> b!1385102 (= res!926401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385103 () Bool)

(declare-fun lt!609171 () Unit!46239)

(assert (=> b!1385103 (= e!784809 lt!609171)))

(declare-fun lt!609169 () Unit!46239)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94713 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46239)

(assert (=> b!1385103 (= lt!609169 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10127 0))(
  ( (MissingZero!10127 (index!42879 (_ BitVec 32))) (Found!10127 (index!42880 (_ BitVec 32))) (Intermediate!10127 (undefined!10939 Bool) (index!42881 (_ BitVec 32)) (x!124376 (_ BitVec 32))) (Undefined!10127) (MissingVacant!10127 (index!42882 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94713 (_ BitVec 32)) SeekEntryResult!10127)

(assert (=> b!1385103 (= (seekEntryOrOpen!0 (select (arr!45734 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45734 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94714 (store (arr!45734 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46284 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94713 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46239)

(assert (=> b!1385103 (= lt!609171 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1385103 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(assert (= (and start!118410 res!926398) b!1385099))

(assert (= (and b!1385099 res!926397) b!1385097))

(assert (= (and b!1385097 res!926395) b!1385101))

(assert (= (and b!1385101 res!926399) b!1385102))

(assert (= (and b!1385102 res!926401) b!1385096))

(assert (= (and b!1385096 res!926400) b!1385098))

(assert (= (and b!1385098 res!926396) b!1385100))

(assert (= (and b!1385098 c!128790) b!1385103))

(assert (= (and b!1385098 (not c!128790)) b!1385095))

(declare-fun m!1270419 () Bool)

(assert (=> start!118410 m!1270419))

(declare-fun m!1270421 () Bool)

(assert (=> start!118410 m!1270421))

(declare-fun m!1270423 () Bool)

(assert (=> b!1385100 m!1270423))

(assert (=> b!1385100 m!1270423))

(declare-fun m!1270425 () Bool)

(assert (=> b!1385100 m!1270425))

(declare-fun m!1270427 () Bool)

(assert (=> b!1385096 m!1270427))

(declare-fun m!1270429 () Bool)

(assert (=> b!1385101 m!1270429))

(declare-fun m!1270431 () Bool)

(assert (=> b!1385103 m!1270431))

(declare-fun m!1270433 () Bool)

(assert (=> b!1385103 m!1270433))

(assert (=> b!1385103 m!1270433))

(declare-fun m!1270435 () Bool)

(assert (=> b!1385103 m!1270435))

(declare-fun m!1270437 () Bool)

(assert (=> b!1385103 m!1270437))

(declare-fun m!1270439 () Bool)

(assert (=> b!1385103 m!1270439))

(assert (=> b!1385103 m!1270423))

(declare-fun m!1270441 () Bool)

(assert (=> b!1385103 m!1270441))

(assert (=> b!1385103 m!1270423))

(declare-fun m!1270443 () Bool)

(assert (=> b!1385103 m!1270443))

(declare-fun m!1270445 () Bool)

(assert (=> b!1385102 m!1270445))

(assert (=> b!1385097 m!1270427))

(assert (=> b!1385097 m!1270427))

(declare-fun m!1270447 () Bool)

(assert (=> b!1385097 m!1270447))

(push 1)

(assert (not b!1385103))

(assert (not b!1385101))

(assert (not start!118410))

(assert (not b!1385100))

(assert (not b!1385102))

(assert (not b!1385097))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

