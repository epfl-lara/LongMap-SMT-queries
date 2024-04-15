; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118308 () Bool)

(assert start!118308)

(declare-fun b!1383669 () Bool)

(declare-fun e!784156 () Bool)

(assert (=> b!1383669 (= e!784156 (not true))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94564 0))(
  ( (array!94565 (arr!45660 (Array (_ BitVec 32) (_ BitVec 64))) (size!46212 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94564)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10077 0))(
  ( (MissingZero!10077 (index!42679 (_ BitVec 32))) (Found!10077 (index!42680 (_ BitVec 32))) (Intermediate!10077 (undefined!10889 Bool) (index!42681 (_ BitVec 32)) (x!124187 (_ BitVec 32))) (Undefined!10077) (MissingVacant!10077 (index!42682 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94564 (_ BitVec 32)) SeekEntryResult!10077)

(assert (=> b!1383669 (= (seekEntryOrOpen!0 (select (arr!45660 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45660 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94565 (store (arr!45660 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46212 a!2938)) mask!2987))))

(declare-datatypes ((Unit!45934 0))(
  ( (Unit!45935) )
))
(declare-fun lt!608474 () Unit!45934)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94564 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45934)

(assert (=> b!1383669 (= lt!608474 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1383670 () Bool)

(declare-fun res!925310 () Bool)

(assert (=> b!1383670 (=> (not res!925310) (not e!784156))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383670 (= res!925310 (validKeyInArray!0 (select (arr!45660 a!2938) startIndex!16)))))

(declare-fun b!1383671 () Bool)

(declare-fun res!925305 () Bool)

(assert (=> b!1383671 (=> (not res!925305) (not e!784156))))

(declare-datatypes ((List!32266 0))(
  ( (Nil!32263) (Cons!32262 (h!33471 (_ BitVec 64)) (t!46952 List!32266)) )
))
(declare-fun arrayNoDuplicates!0 (array!94564 (_ BitVec 32) List!32266) Bool)

(assert (=> b!1383671 (= res!925305 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32263))))

(declare-fun b!1383672 () Bool)

(declare-fun res!925309 () Bool)

(assert (=> b!1383672 (=> (not res!925309) (not e!784156))))

(assert (=> b!1383672 (= res!925309 (validKeyInArray!0 (select (arr!45660 a!2938) i!1065)))))

(declare-fun b!1383674 () Bool)

(declare-fun res!925308 () Bool)

(assert (=> b!1383674 (=> (not res!925308) (not e!784156))))

(assert (=> b!1383674 (= res!925308 (and (not (= (select (arr!45660 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45660 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1383675 () Bool)

(declare-fun res!925306 () Bool)

(assert (=> b!1383675 (=> (not res!925306) (not e!784156))))

(assert (=> b!1383675 (= res!925306 (and (= (size!46212 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46212 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46212 a!2938))))))

(declare-fun res!925304 () Bool)

(assert (=> start!118308 (=> (not res!925304) (not e!784156))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118308 (= res!925304 (validMask!0 mask!2987))))

(assert (=> start!118308 e!784156))

(assert (=> start!118308 true))

(declare-fun array_inv!34893 (array!94564) Bool)

(assert (=> start!118308 (array_inv!34893 a!2938)))

(declare-fun b!1383673 () Bool)

(declare-fun res!925307 () Bool)

(assert (=> b!1383673 (=> (not res!925307) (not e!784156))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94564 (_ BitVec 32)) Bool)

(assert (=> b!1383673 (= res!925307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118308 res!925304) b!1383675))

(assert (= (and b!1383675 res!925306) b!1383672))

(assert (= (and b!1383672 res!925309) b!1383671))

(assert (= (and b!1383671 res!925305) b!1383673))

(assert (= (and b!1383673 res!925307) b!1383674))

(assert (= (and b!1383674 res!925308) b!1383670))

(assert (= (and b!1383670 res!925310) b!1383669))

(declare-fun m!1268401 () Bool)

(assert (=> b!1383671 m!1268401))

(declare-fun m!1268403 () Bool)

(assert (=> b!1383669 m!1268403))

(assert (=> b!1383669 m!1268403))

(declare-fun m!1268405 () Bool)

(assert (=> b!1383669 m!1268405))

(declare-fun m!1268407 () Bool)

(assert (=> b!1383669 m!1268407))

(declare-fun m!1268409 () Bool)

(assert (=> b!1383669 m!1268409))

(declare-fun m!1268411 () Bool)

(assert (=> b!1383669 m!1268411))

(assert (=> b!1383669 m!1268411))

(declare-fun m!1268413 () Bool)

(assert (=> b!1383669 m!1268413))

(declare-fun m!1268415 () Bool)

(assert (=> b!1383673 m!1268415))

(assert (=> b!1383670 m!1268411))

(assert (=> b!1383670 m!1268411))

(declare-fun m!1268417 () Bool)

(assert (=> b!1383670 m!1268417))

(declare-fun m!1268419 () Bool)

(assert (=> start!118308 m!1268419))

(declare-fun m!1268421 () Bool)

(assert (=> start!118308 m!1268421))

(declare-fun m!1268423 () Bool)

(assert (=> b!1383672 m!1268423))

(assert (=> b!1383672 m!1268423))

(declare-fun m!1268425 () Bool)

(assert (=> b!1383672 m!1268425))

(assert (=> b!1383674 m!1268423))

(push 1)

(assert (not b!1383670))

(assert (not b!1383673))

(assert (not b!1383669))

(assert (not start!118308))

(assert (not b!1383671))

(assert (not b!1383672))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

