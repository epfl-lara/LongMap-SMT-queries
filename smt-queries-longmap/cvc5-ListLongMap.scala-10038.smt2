; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118332 () Bool)

(assert start!118332)

(declare-fun b!1384006 () Bool)

(declare-fun res!925544 () Bool)

(declare-fun e!784305 () Bool)

(assert (=> b!1384006 (=> (not res!925544) (not e!784305))))

(declare-datatypes ((array!94635 0))(
  ( (array!94636 (arr!45695 (Array (_ BitVec 32) (_ BitVec 64))) (size!46245 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94635)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94635 (_ BitVec 32)) Bool)

(assert (=> b!1384006 (= res!925544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384007 () Bool)

(declare-datatypes ((Unit!46122 0))(
  ( (Unit!46123) )
))
(declare-fun e!784304 () Unit!46122)

(declare-fun lt!608746 () Unit!46122)

(assert (=> b!1384007 (= e!784304 lt!608746)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun lt!608748 () Unit!46122)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94635 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46122)

(assert (=> b!1384007 (= lt!608748 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10088 0))(
  ( (MissingZero!10088 (index!42723 (_ BitVec 32))) (Found!10088 (index!42724 (_ BitVec 32))) (Intermediate!10088 (undefined!10900 Bool) (index!42725 (_ BitVec 32)) (x!124233 (_ BitVec 32))) (Undefined!10088) (MissingVacant!10088 (index!42726 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94635 (_ BitVec 32)) SeekEntryResult!10088)

(assert (=> b!1384007 (= (seekEntryOrOpen!0 (select (arr!45695 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45695 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94636 (store (arr!45695 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46245 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94635 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46122)

(assert (=> b!1384007 (= lt!608746 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1384007 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384008 () Bool)

(declare-fun e!784307 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384008 (= e!784307 (validKeyInArray!0 (select (arr!45695 a!2938) startIndex!16)))))

(declare-fun b!1384009 () Bool)

(assert (=> b!1384009 (= e!784305 false)))

(declare-fun lt!608747 () Unit!46122)

(assert (=> b!1384009 (= lt!608747 e!784304)))

(declare-fun c!128673 () Bool)

(assert (=> b!1384009 (= c!128673 e!784307)))

(declare-fun res!925541 () Bool)

(assert (=> b!1384009 (=> (not res!925541) (not e!784307))))

(assert (=> b!1384009 (= res!925541 (not (= startIndex!16 i!1065)))))

(declare-fun b!1384010 () Bool)

(declare-fun res!925542 () Bool)

(assert (=> b!1384010 (=> (not res!925542) (not e!784305))))

(assert (=> b!1384010 (= res!925542 (and (= (size!46245 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46245 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46245 a!2938))))))

(declare-fun b!1384012 () Bool)

(declare-fun res!925540 () Bool)

(assert (=> b!1384012 (=> (not res!925540) (not e!784305))))

(assert (=> b!1384012 (= res!925540 (and (not (= (select (arr!45695 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45695 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1384013 () Bool)

(declare-fun Unit!46124 () Unit!46122)

(assert (=> b!1384013 (= e!784304 Unit!46124)))

(declare-fun b!1384014 () Bool)

(declare-fun res!925546 () Bool)

(assert (=> b!1384014 (=> (not res!925546) (not e!784305))))

(declare-datatypes ((List!32223 0))(
  ( (Nil!32220) (Cons!32219 (h!33428 (_ BitVec 64)) (t!46917 List!32223)) )
))
(declare-fun arrayNoDuplicates!0 (array!94635 (_ BitVec 32) List!32223) Bool)

(assert (=> b!1384014 (= res!925546 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32220))))

(declare-fun res!925545 () Bool)

(assert (=> start!118332 (=> (not res!925545) (not e!784305))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118332 (= res!925545 (validMask!0 mask!2987))))

(assert (=> start!118332 e!784305))

(assert (=> start!118332 true))

(declare-fun array_inv!34723 (array!94635) Bool)

(assert (=> start!118332 (array_inv!34723 a!2938)))

(declare-fun b!1384011 () Bool)

(declare-fun res!925543 () Bool)

(assert (=> b!1384011 (=> (not res!925543) (not e!784305))))

(assert (=> b!1384011 (= res!925543 (validKeyInArray!0 (select (arr!45695 a!2938) i!1065)))))

(assert (= (and start!118332 res!925545) b!1384010))

(assert (= (and b!1384010 res!925542) b!1384011))

(assert (= (and b!1384011 res!925543) b!1384014))

(assert (= (and b!1384014 res!925546) b!1384006))

(assert (= (and b!1384006 res!925544) b!1384012))

(assert (= (and b!1384012 res!925540) b!1384009))

(assert (= (and b!1384009 res!925541) b!1384008))

(assert (= (and b!1384009 c!128673) b!1384007))

(assert (= (and b!1384009 (not c!128673)) b!1384013))

(declare-fun m!1269201 () Bool)

(assert (=> b!1384007 m!1269201))

(declare-fun m!1269203 () Bool)

(assert (=> b!1384007 m!1269203))

(assert (=> b!1384007 m!1269203))

(declare-fun m!1269205 () Bool)

(assert (=> b!1384007 m!1269205))

(declare-fun m!1269207 () Bool)

(assert (=> b!1384007 m!1269207))

(declare-fun m!1269209 () Bool)

(assert (=> b!1384007 m!1269209))

(declare-fun m!1269211 () Bool)

(assert (=> b!1384007 m!1269211))

(declare-fun m!1269213 () Bool)

(assert (=> b!1384007 m!1269213))

(assert (=> b!1384007 m!1269211))

(declare-fun m!1269215 () Bool)

(assert (=> b!1384007 m!1269215))

(declare-fun m!1269217 () Bool)

(assert (=> b!1384012 m!1269217))

(assert (=> b!1384011 m!1269217))

(assert (=> b!1384011 m!1269217))

(declare-fun m!1269219 () Bool)

(assert (=> b!1384011 m!1269219))

(assert (=> b!1384008 m!1269211))

(assert (=> b!1384008 m!1269211))

(declare-fun m!1269221 () Bool)

(assert (=> b!1384008 m!1269221))

(declare-fun m!1269223 () Bool)

(assert (=> b!1384006 m!1269223))

(declare-fun m!1269225 () Bool)

(assert (=> b!1384014 m!1269225))

(declare-fun m!1269227 () Bool)

(assert (=> start!118332 m!1269227))

(declare-fun m!1269229 () Bool)

(assert (=> start!118332 m!1269229))

(push 1)

(assert (not b!1384007))

(assert (not b!1384014))

(assert (not b!1384008))

(assert (not start!118332))

(assert (not b!1384011))

(assert (not b!1384006))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

