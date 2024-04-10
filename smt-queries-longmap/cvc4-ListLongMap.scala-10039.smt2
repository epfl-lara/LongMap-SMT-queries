; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118342 () Bool)

(assert start!118342)

(declare-fun res!925645 () Bool)

(declare-fun e!784365 () Bool)

(assert (=> start!118342 (=> (not res!925645) (not e!784365))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118342 (= res!925645 (validMask!0 mask!2987))))

(assert (=> start!118342 e!784365))

(assert (=> start!118342 true))

(declare-datatypes ((array!94645 0))(
  ( (array!94646 (arr!45700 (Array (_ BitVec 32) (_ BitVec 64))) (size!46250 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94645)

(declare-fun array_inv!34728 (array!94645) Bool)

(assert (=> start!118342 (array_inv!34728 a!2938)))

(declare-fun b!1384141 () Bool)

(declare-fun res!925648 () Bool)

(assert (=> b!1384141 (=> (not res!925648) (not e!784365))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94645 (_ BitVec 32)) Bool)

(assert (=> b!1384141 (= res!925648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384142 () Bool)

(declare-fun res!925650 () Bool)

(assert (=> b!1384142 (=> (not res!925650) (not e!784365))))

(declare-datatypes ((List!32228 0))(
  ( (Nil!32225) (Cons!32224 (h!33433 (_ BitVec 64)) (t!46922 List!32228)) )
))
(declare-fun arrayNoDuplicates!0 (array!94645 (_ BitVec 32) List!32228) Bool)

(assert (=> b!1384142 (= res!925650 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32225))))

(declare-fun b!1384143 () Bool)

(declare-fun res!925651 () Bool)

(assert (=> b!1384143 (=> (not res!925651) (not e!784365))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384143 (= res!925651 (validKeyInArray!0 (select (arr!45700 a!2938) i!1065)))))

(declare-fun b!1384144 () Bool)

(declare-fun e!784367 () Bool)

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1384144 (= e!784367 (validKeyInArray!0 (select (arr!45700 a!2938) startIndex!16)))))

(declare-fun b!1384145 () Bool)

(declare-datatypes ((Unit!46137 0))(
  ( (Unit!46138) )
))
(declare-fun e!784366 () Unit!46137)

(declare-fun lt!608793 () Unit!46137)

(assert (=> b!1384145 (= e!784366 lt!608793)))

(declare-fun lt!608792 () Unit!46137)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94645 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46137)

(assert (=> b!1384145 (= lt!608792 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10093 0))(
  ( (MissingZero!10093 (index!42743 (_ BitVec 32))) (Found!10093 (index!42744 (_ BitVec 32))) (Intermediate!10093 (undefined!10905 Bool) (index!42745 (_ BitVec 32)) (x!124246 (_ BitVec 32))) (Undefined!10093) (MissingVacant!10093 (index!42746 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94645 (_ BitVec 32)) SeekEntryResult!10093)

(assert (=> b!1384145 (= (seekEntryOrOpen!0 (select (arr!45700 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45700 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94646 (store (arr!45700 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46250 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94645 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46137)

(assert (=> b!1384145 (= lt!608793 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1384145 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384146 () Bool)

(declare-fun Unit!46139 () Unit!46137)

(assert (=> b!1384146 (= e!784366 Unit!46139)))

(declare-fun b!1384147 () Bool)

(declare-fun res!925647 () Bool)

(assert (=> b!1384147 (=> (not res!925647) (not e!784365))))

(assert (=> b!1384147 (= res!925647 (and (= (size!46250 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46250 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46250 a!2938))))))

(declare-fun b!1384148 () Bool)

(declare-fun res!925649 () Bool)

(assert (=> b!1384148 (=> (not res!925649) (not e!784365))))

(assert (=> b!1384148 (= res!925649 (and (not (= (select (arr!45700 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45700 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1384149 () Bool)

(assert (=> b!1384149 (= e!784365 false)))

(declare-fun lt!608791 () Unit!46137)

(assert (=> b!1384149 (= lt!608791 e!784366)))

(declare-fun c!128688 () Bool)

(assert (=> b!1384149 (= c!128688 e!784367)))

(declare-fun res!925646 () Bool)

(assert (=> b!1384149 (=> (not res!925646) (not e!784367))))

(assert (=> b!1384149 (= res!925646 (not (= startIndex!16 i!1065)))))

(assert (= (and start!118342 res!925645) b!1384147))

(assert (= (and b!1384147 res!925647) b!1384143))

(assert (= (and b!1384143 res!925651) b!1384142))

(assert (= (and b!1384142 res!925650) b!1384141))

(assert (= (and b!1384141 res!925648) b!1384148))

(assert (= (and b!1384148 res!925649) b!1384149))

(assert (= (and b!1384149 res!925646) b!1384144))

(assert (= (and b!1384149 c!128688) b!1384145))

(assert (= (and b!1384149 (not c!128688)) b!1384146))

(declare-fun m!1269351 () Bool)

(assert (=> b!1384141 m!1269351))

(declare-fun m!1269353 () Bool)

(assert (=> b!1384145 m!1269353))

(declare-fun m!1269355 () Bool)

(assert (=> b!1384145 m!1269355))

(assert (=> b!1384145 m!1269355))

(declare-fun m!1269357 () Bool)

(assert (=> b!1384145 m!1269357))

(declare-fun m!1269359 () Bool)

(assert (=> b!1384145 m!1269359))

(declare-fun m!1269361 () Bool)

(assert (=> b!1384145 m!1269361))

(declare-fun m!1269363 () Bool)

(assert (=> b!1384145 m!1269363))

(declare-fun m!1269365 () Bool)

(assert (=> b!1384145 m!1269365))

(assert (=> b!1384145 m!1269363))

(declare-fun m!1269367 () Bool)

(assert (=> b!1384145 m!1269367))

(declare-fun m!1269369 () Bool)

(assert (=> b!1384143 m!1269369))

(assert (=> b!1384143 m!1269369))

(declare-fun m!1269371 () Bool)

(assert (=> b!1384143 m!1269371))

(declare-fun m!1269373 () Bool)

(assert (=> start!118342 m!1269373))

(declare-fun m!1269375 () Bool)

(assert (=> start!118342 m!1269375))

(assert (=> b!1384148 m!1269369))

(assert (=> b!1384144 m!1269363))

(assert (=> b!1384144 m!1269363))

(declare-fun m!1269377 () Bool)

(assert (=> b!1384144 m!1269377))

(declare-fun m!1269379 () Bool)

(assert (=> b!1384142 m!1269379))

(push 1)

(assert (not b!1384145))

(assert (not b!1384144))

(assert (not start!118342))

(assert (not b!1384142))

(assert (not b!1384141))

(assert (not b!1384143))

(check-sat)

(pop 1)

(push 1)

(check-sat)

