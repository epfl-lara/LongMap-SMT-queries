; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118370 () Bool)

(assert start!118370)

(declare-fun b!1384524 () Bool)

(declare-fun res!925944 () Bool)

(declare-fun e!784541 () Bool)

(assert (=> b!1384524 (=> (not res!925944) (not e!784541))))

(declare-datatypes ((array!94673 0))(
  ( (array!94674 (arr!45714 (Array (_ BitVec 32) (_ BitVec 64))) (size!46264 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94673)

(declare-datatypes ((List!32242 0))(
  ( (Nil!32239) (Cons!32238 (h!33447 (_ BitVec 64)) (t!46936 List!32242)) )
))
(declare-fun arrayNoDuplicates!0 (array!94673 (_ BitVec 32) List!32242) Bool)

(assert (=> b!1384524 (= res!925944 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32239))))

(declare-fun b!1384525 () Bool)

(declare-fun res!925950 () Bool)

(assert (=> b!1384525 (=> (not res!925950) (not e!784541))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94673 (_ BitVec 32)) Bool)

(assert (=> b!1384525 (= res!925950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384526 () Bool)

(declare-fun res!925948 () Bool)

(assert (=> b!1384526 (=> (not res!925948) (not e!784541))))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1384526 (= res!925948 (and (not (= (select (arr!45714 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45714 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1384527 () Bool)

(declare-datatypes ((Unit!46179 0))(
  ( (Unit!46180) )
))
(declare-fun e!784540 () Unit!46179)

(declare-fun Unit!46181 () Unit!46179)

(assert (=> b!1384527 (= e!784540 Unit!46181)))

(declare-fun b!1384528 () Bool)

(declare-fun res!925945 () Bool)

(assert (=> b!1384528 (=> (not res!925945) (not e!784541))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384528 (= res!925945 (validKeyInArray!0 (select (arr!45714 a!2938) i!1065)))))

(declare-fun res!925946 () Bool)

(assert (=> start!118370 (=> (not res!925946) (not e!784541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118370 (= res!925946 (validMask!0 mask!2987))))

(assert (=> start!118370 e!784541))

(assert (=> start!118370 true))

(declare-fun array_inv!34742 (array!94673) Bool)

(assert (=> start!118370 (array_inv!34742 a!2938)))

(declare-fun b!1384529 () Bool)

(declare-fun e!784537 () Bool)

(assert (=> b!1384529 (= e!784537 (not true))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun lt!608927 () array!94673)

(assert (=> b!1384529 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!608927 mask!2987)))

(declare-fun lt!608931 () Unit!46179)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94673 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46179)

(assert (=> b!1384529 (= lt!608931 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(declare-fun b!1384530 () Bool)

(declare-fun res!925947 () Bool)

(assert (=> b!1384530 (=> (not res!925947) (not e!784541))))

(assert (=> b!1384530 (= res!925947 (and (= (size!46264 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46264 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46264 a!2938))))))

(declare-fun b!1384531 () Bool)

(assert (=> b!1384531 (= e!784541 e!784537)))

(declare-fun res!925949 () Bool)

(assert (=> b!1384531 (=> (not res!925949) (not e!784537))))

(assert (=> b!1384531 (= res!925949 (and (bvslt startIndex!16 (bvsub (size!46264 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-fun lt!608928 () Unit!46179)

(assert (=> b!1384531 (= lt!608928 e!784540)))

(declare-fun c!128730 () Bool)

(declare-fun e!784538 () Bool)

(assert (=> b!1384531 (= c!128730 e!784538)))

(declare-fun res!925951 () Bool)

(assert (=> b!1384531 (=> (not res!925951) (not e!784538))))

(assert (=> b!1384531 (= res!925951 (not (= startIndex!16 i!1065)))))

(assert (=> b!1384531 (= lt!608927 (array!94674 (store (arr!45714 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46264 a!2938)))))

(declare-fun b!1384532 () Bool)

(declare-fun lt!608930 () Unit!46179)

(assert (=> b!1384532 (= e!784540 lt!608930)))

(declare-fun lt!608929 () Unit!46179)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94673 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46179)

(assert (=> b!1384532 (= lt!608929 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10107 0))(
  ( (MissingZero!10107 (index!42799 (_ BitVec 32))) (Found!10107 (index!42800 (_ BitVec 32))) (Intermediate!10107 (undefined!10919 Bool) (index!42801 (_ BitVec 32)) (x!124300 (_ BitVec 32))) (Undefined!10107) (MissingVacant!10107 (index!42802 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94673 (_ BitVec 32)) SeekEntryResult!10107)

(assert (=> b!1384532 (= (seekEntryOrOpen!0 (select (arr!45714 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45714 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!608927 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94673 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46179)

(assert (=> b!1384532 (= lt!608930 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1384532 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384533 () Bool)

(assert (=> b!1384533 (= e!784538 (validKeyInArray!0 (select (arr!45714 a!2938) startIndex!16)))))

(assert (= (and start!118370 res!925946) b!1384530))

(assert (= (and b!1384530 res!925947) b!1384528))

(assert (= (and b!1384528 res!925945) b!1384524))

(assert (= (and b!1384524 res!925944) b!1384525))

(assert (= (and b!1384525 res!925950) b!1384526))

(assert (= (and b!1384526 res!925948) b!1384531))

(assert (= (and b!1384531 res!925951) b!1384533))

(assert (= (and b!1384531 c!128730) b!1384532))

(assert (= (and b!1384531 (not c!128730)) b!1384527))

(assert (= (and b!1384531 res!925949) b!1384529))

(declare-fun m!1269775 () Bool)

(assert (=> b!1384525 m!1269775))

(declare-fun m!1269777 () Bool)

(assert (=> start!118370 m!1269777))

(declare-fun m!1269779 () Bool)

(assert (=> start!118370 m!1269779))

(declare-fun m!1269781 () Bool)

(assert (=> b!1384526 m!1269781))

(declare-fun m!1269783 () Bool)

(assert (=> b!1384533 m!1269783))

(assert (=> b!1384533 m!1269783))

(declare-fun m!1269785 () Bool)

(assert (=> b!1384533 m!1269785))

(declare-fun m!1269787 () Bool)

(assert (=> b!1384524 m!1269787))

(declare-fun m!1269789 () Bool)

(assert (=> b!1384529 m!1269789))

(declare-fun m!1269791 () Bool)

(assert (=> b!1384529 m!1269791))

(assert (=> b!1384528 m!1269781))

(assert (=> b!1384528 m!1269781))

(declare-fun m!1269793 () Bool)

(assert (=> b!1384528 m!1269793))

(declare-fun m!1269795 () Bool)

(assert (=> b!1384531 m!1269795))

(declare-fun m!1269797 () Bool)

(assert (=> b!1384532 m!1269797))

(declare-fun m!1269799 () Bool)

(assert (=> b!1384532 m!1269799))

(assert (=> b!1384532 m!1269795))

(declare-fun m!1269801 () Bool)

(assert (=> b!1384532 m!1269801))

(assert (=> b!1384532 m!1269799))

(declare-fun m!1269803 () Bool)

(assert (=> b!1384532 m!1269803))

(assert (=> b!1384532 m!1269783))

(declare-fun m!1269805 () Bool)

(assert (=> b!1384532 m!1269805))

(assert (=> b!1384532 m!1269783))

(declare-fun m!1269807 () Bool)

(assert (=> b!1384532 m!1269807))

(check-sat (not b!1384529) (not start!118370) (not b!1384528) (not b!1384532) (not b!1384533) (not b!1384524) (not b!1384525))
(check-sat)
