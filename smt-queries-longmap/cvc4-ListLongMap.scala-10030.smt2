; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118282 () Bool)

(assert start!118282)

(declare-fun b!1383396 () Bool)

(declare-fun res!925034 () Bool)

(declare-fun e!784077 () Bool)

(assert (=> b!1383396 (=> (not res!925034) (not e!784077))))

(declare-datatypes ((array!94538 0))(
  ( (array!94539 (arr!45647 (Array (_ BitVec 32) (_ BitVec 64))) (size!46199 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94538)

(declare-datatypes ((List!32253 0))(
  ( (Nil!32250) (Cons!32249 (h!33458 (_ BitVec 64)) (t!46939 List!32253)) )
))
(declare-fun arrayNoDuplicates!0 (array!94538 (_ BitVec 32) List!32253) Bool)

(assert (=> b!1383396 (= res!925034 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32250))))

(declare-fun b!1383397 () Bool)

(declare-fun res!925032 () Bool)

(assert (=> b!1383397 (=> (not res!925032) (not e!784077))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383397 (= res!925032 (and (not (= (select (arr!45647 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45647 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1383398 () Bool)

(declare-fun res!925031 () Bool)

(assert (=> b!1383398 (=> (not res!925031) (not e!784077))))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1383398 (= res!925031 (and (= (size!46199 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46199 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46199 a!2938))))))

(declare-fun b!1383399 () Bool)

(declare-fun res!925035 () Bool)

(assert (=> b!1383399 (=> (not res!925035) (not e!784077))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383399 (= res!925035 (validKeyInArray!0 (select (arr!45647 a!2938) i!1065)))))

(declare-fun b!1383400 () Bool)

(assert (=> b!1383400 (= e!784077 (not true))))

(declare-datatypes ((SeekEntryResult!10064 0))(
  ( (MissingZero!10064 (index!42627 (_ BitVec 32))) (Found!10064 (index!42628 (_ BitVec 32))) (Intermediate!10064 (undefined!10876 Bool) (index!42629 (_ BitVec 32)) (x!124142 (_ BitVec 32))) (Undefined!10064) (MissingVacant!10064 (index!42630 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94538 (_ BitVec 32)) SeekEntryResult!10064)

(assert (=> b!1383400 (= (seekEntryOrOpen!0 (select (arr!45647 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45647 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94539 (store (arr!45647 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46199 a!2938)) mask!2987))))

(declare-datatypes ((Unit!45908 0))(
  ( (Unit!45909) )
))
(declare-fun lt!608435 () Unit!45908)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94538 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45908)

(assert (=> b!1383400 (= lt!608435 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1383401 () Bool)

(declare-fun res!925036 () Bool)

(assert (=> b!1383401 (=> (not res!925036) (not e!784077))))

(assert (=> b!1383401 (= res!925036 (validKeyInArray!0 (select (arr!45647 a!2938) startIndex!16)))))

(declare-fun b!1383402 () Bool)

(declare-fun res!925037 () Bool)

(assert (=> b!1383402 (=> (not res!925037) (not e!784077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94538 (_ BitVec 32)) Bool)

(assert (=> b!1383402 (= res!925037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!925033 () Bool)

(assert (=> start!118282 (=> (not res!925033) (not e!784077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118282 (= res!925033 (validMask!0 mask!2987))))

(assert (=> start!118282 e!784077))

(assert (=> start!118282 true))

(declare-fun array_inv!34880 (array!94538) Bool)

(assert (=> start!118282 (array_inv!34880 a!2938)))

(assert (= (and start!118282 res!925033) b!1383398))

(assert (= (and b!1383398 res!925031) b!1383399))

(assert (= (and b!1383399 res!925035) b!1383396))

(assert (= (and b!1383396 res!925034) b!1383402))

(assert (= (and b!1383402 res!925037) b!1383397))

(assert (= (and b!1383397 res!925032) b!1383401))

(assert (= (and b!1383401 res!925036) b!1383400))

(declare-fun m!1268063 () Bool)

(assert (=> start!118282 m!1268063))

(declare-fun m!1268065 () Bool)

(assert (=> start!118282 m!1268065))

(declare-fun m!1268067 () Bool)

(assert (=> b!1383396 m!1268067))

(declare-fun m!1268069 () Bool)

(assert (=> b!1383401 m!1268069))

(assert (=> b!1383401 m!1268069))

(declare-fun m!1268071 () Bool)

(assert (=> b!1383401 m!1268071))

(declare-fun m!1268073 () Bool)

(assert (=> b!1383402 m!1268073))

(declare-fun m!1268075 () Bool)

(assert (=> b!1383400 m!1268075))

(assert (=> b!1383400 m!1268075))

(declare-fun m!1268077 () Bool)

(assert (=> b!1383400 m!1268077))

(declare-fun m!1268079 () Bool)

(assert (=> b!1383400 m!1268079))

(declare-fun m!1268081 () Bool)

(assert (=> b!1383400 m!1268081))

(assert (=> b!1383400 m!1268069))

(assert (=> b!1383400 m!1268069))

(declare-fun m!1268083 () Bool)

(assert (=> b!1383400 m!1268083))

(declare-fun m!1268085 () Bool)

(assert (=> b!1383399 m!1268085))

(assert (=> b!1383399 m!1268085))

(declare-fun m!1268087 () Bool)

(assert (=> b!1383399 m!1268087))

(assert (=> b!1383397 m!1268085))

(push 1)

(assert (not b!1383396))

(assert (not b!1383402))

(assert (not b!1383399))

(assert (not b!1383401))

(assert (not start!118282))

(assert (not b!1383400))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

