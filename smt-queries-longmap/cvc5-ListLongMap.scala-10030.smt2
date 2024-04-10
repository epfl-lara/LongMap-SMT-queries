; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118284 () Bool)

(assert start!118284)

(declare-fun b!1383444 () Bool)

(declare-fun res!925039 () Bool)

(declare-fun e!784102 () Bool)

(assert (=> b!1383444 (=> (not res!925039) (not e!784102))))

(declare-datatypes ((array!94587 0))(
  ( (array!94588 (arr!45671 (Array (_ BitVec 32) (_ BitVec 64))) (size!46221 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94587)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94587 (_ BitVec 32)) Bool)

(assert (=> b!1383444 (= res!925039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383445 () Bool)

(declare-fun res!925041 () Bool)

(assert (=> b!1383445 (=> (not res!925041) (not e!784102))))

(declare-datatypes ((List!32199 0))(
  ( (Nil!32196) (Cons!32195 (h!33404 (_ BitVec 64)) (t!46893 List!32199)) )
))
(declare-fun arrayNoDuplicates!0 (array!94587 (_ BitVec 32) List!32199) Bool)

(assert (=> b!1383445 (= res!925041 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32196))))

(declare-fun b!1383446 () Bool)

(assert (=> b!1383446 (= e!784102 (not true))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10064 0))(
  ( (MissingZero!10064 (index!42627 (_ BitVec 32))) (Found!10064 (index!42628 (_ BitVec 32))) (Intermediate!10064 (undefined!10876 Bool) (index!42629 (_ BitVec 32)) (x!124145 (_ BitVec 32))) (Undefined!10064) (MissingVacant!10064 (index!42630 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94587 (_ BitVec 32)) SeekEntryResult!10064)

(assert (=> b!1383446 (= (seekEntryOrOpen!0 (select (arr!45671 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45671 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94588 (store (arr!45671 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46221 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46065 0))(
  ( (Unit!46066) )
))
(declare-fun lt!608616 () Unit!46065)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94587 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46065)

(assert (=> b!1383446 (= lt!608616 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1383448 () Bool)

(declare-fun res!925042 () Bool)

(assert (=> b!1383448 (=> (not res!925042) (not e!784102))))

(assert (=> b!1383448 (= res!925042 (and (not (= (select (arr!45671 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45671 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1383449 () Bool)

(declare-fun res!925040 () Bool)

(assert (=> b!1383449 (=> (not res!925040) (not e!784102))))

(assert (=> b!1383449 (= res!925040 (and (= (size!46221 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46221 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46221 a!2938))))))

(declare-fun b!1383450 () Bool)

(declare-fun res!925037 () Bool)

(assert (=> b!1383450 (=> (not res!925037) (not e!784102))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383450 (= res!925037 (validKeyInArray!0 (select (arr!45671 a!2938) i!1065)))))

(declare-fun b!1383447 () Bool)

(declare-fun res!925038 () Bool)

(assert (=> b!1383447 (=> (not res!925038) (not e!784102))))

(assert (=> b!1383447 (= res!925038 (validKeyInArray!0 (select (arr!45671 a!2938) startIndex!16)))))

(declare-fun res!925036 () Bool)

(assert (=> start!118284 (=> (not res!925036) (not e!784102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118284 (= res!925036 (validMask!0 mask!2987))))

(assert (=> start!118284 e!784102))

(assert (=> start!118284 true))

(declare-fun array_inv!34699 (array!94587) Bool)

(assert (=> start!118284 (array_inv!34699 a!2938)))

(assert (= (and start!118284 res!925036) b!1383449))

(assert (= (and b!1383449 res!925040) b!1383450))

(assert (= (and b!1383450 res!925037) b!1383445))

(assert (= (and b!1383445 res!925041) b!1383444))

(assert (= (and b!1383444 res!925039) b!1383448))

(assert (= (and b!1383448 res!925042) b!1383447))

(assert (= (and b!1383447 res!925038) b!1383446))

(declare-fun m!1268541 () Bool)

(assert (=> b!1383448 m!1268541))

(declare-fun m!1268543 () Bool)

(assert (=> b!1383445 m!1268543))

(declare-fun m!1268545 () Bool)

(assert (=> b!1383446 m!1268545))

(assert (=> b!1383446 m!1268545))

(declare-fun m!1268547 () Bool)

(assert (=> b!1383446 m!1268547))

(declare-fun m!1268549 () Bool)

(assert (=> b!1383446 m!1268549))

(declare-fun m!1268551 () Bool)

(assert (=> b!1383446 m!1268551))

(declare-fun m!1268553 () Bool)

(assert (=> b!1383446 m!1268553))

(assert (=> b!1383446 m!1268553))

(declare-fun m!1268555 () Bool)

(assert (=> b!1383446 m!1268555))

(declare-fun m!1268557 () Bool)

(assert (=> b!1383444 m!1268557))

(assert (=> b!1383450 m!1268541))

(assert (=> b!1383450 m!1268541))

(declare-fun m!1268559 () Bool)

(assert (=> b!1383450 m!1268559))

(declare-fun m!1268561 () Bool)

(assert (=> start!118284 m!1268561))

(declare-fun m!1268563 () Bool)

(assert (=> start!118284 m!1268563))

(assert (=> b!1383447 m!1268553))

(assert (=> b!1383447 m!1268553))

(declare-fun m!1268565 () Bool)

(assert (=> b!1383447 m!1268565))

(push 1)

(assert (not start!118284))

(assert (not b!1383445))

(assert (not b!1383446))

(assert (not b!1383444))

(assert (not b!1383450))

(assert (not b!1383447))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

