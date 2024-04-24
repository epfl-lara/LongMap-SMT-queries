; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118578 () Bool)

(assert start!118578)

(declare-fun b!1385773 () Bool)

(declare-datatypes ((Unit!46112 0))(
  ( (Unit!46113) )
))
(declare-fun e!785357 () Unit!46112)

(declare-fun lt!609379 () Unit!46112)

(assert (=> b!1385773 (= e!785357 lt!609379)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94779 0))(
  ( (array!94780 (arr!45765 (Array (_ BitVec 32) (_ BitVec 64))) (size!46316 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94779)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun lt!609380 () Unit!46112)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94779 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46112)

(assert (=> b!1385773 (= lt!609380 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10061 0))(
  ( (MissingZero!10061 (index!42615 (_ BitVec 32))) (Found!10061 (index!42616 (_ BitVec 32))) (Intermediate!10061 (undefined!10873 Bool) (index!42617 (_ BitVec 32)) (x!124268 (_ BitVec 32))) (Undefined!10061) (MissingVacant!10061 (index!42618 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94779 (_ BitVec 32)) SeekEntryResult!10061)

(assert (=> b!1385773 (= (seekEntryOrOpen!0 (select (arr!45765 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45765 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94780 (store (arr!45765 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46316 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94779 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46112)

(assert (=> b!1385773 (= lt!609379 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94779 (_ BitVec 32)) Bool)

(assert (=> b!1385773 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1385774 () Bool)

(declare-fun e!785359 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385774 (= e!785359 (validKeyInArray!0 (select (arr!45765 a!2938) startIndex!16)))))

(declare-fun b!1385775 () Bool)

(declare-fun res!926419 () Bool)

(declare-fun e!785356 () Bool)

(assert (=> b!1385775 (=> (not res!926419) (not e!785356))))

(assert (=> b!1385775 (= res!926419 (and (= (size!46316 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46316 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46316 a!2938))))))

(declare-fun b!1385776 () Bool)

(declare-fun res!926417 () Bool)

(assert (=> b!1385776 (=> (not res!926417) (not e!785356))))

(declare-datatypes ((List!32280 0))(
  ( (Nil!32277) (Cons!32276 (h!33494 (_ BitVec 64)) (t!46966 List!32280)) )
))
(declare-fun arrayNoDuplicates!0 (array!94779 (_ BitVec 32) List!32280) Bool)

(assert (=> b!1385776 (= res!926417 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32277))))

(declare-fun res!926418 () Bool)

(assert (=> start!118578 (=> (not res!926418) (not e!785356))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118578 (= res!926418 (validMask!0 mask!2987))))

(assert (=> start!118578 e!785356))

(assert (=> start!118578 true))

(declare-fun array_inv!35046 (array!94779) Bool)

(assert (=> start!118578 (array_inv!35046 a!2938)))

(declare-fun b!1385777 () Bool)

(declare-fun res!926422 () Bool)

(assert (=> b!1385777 (=> (not res!926422) (not e!785356))))

(assert (=> b!1385777 (= res!926422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385778 () Bool)

(declare-fun res!926420 () Bool)

(assert (=> b!1385778 (=> (not res!926420) (not e!785356))))

(assert (=> b!1385778 (= res!926420 (validKeyInArray!0 (select (arr!45765 a!2938) i!1065)))))

(declare-fun b!1385779 () Bool)

(declare-fun res!926421 () Bool)

(assert (=> b!1385779 (=> (not res!926421) (not e!785356))))

(assert (=> b!1385779 (= res!926421 (and (not (= (select (arr!45765 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45765 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1385780 () Bool)

(declare-fun Unit!46114 () Unit!46112)

(assert (=> b!1385780 (= e!785357 Unit!46114)))

(declare-fun b!1385781 () Bool)

(assert (=> b!1385781 (= e!785356 false)))

(declare-fun lt!609381 () Unit!46112)

(assert (=> b!1385781 (= lt!609381 e!785357)))

(declare-fun c!129126 () Bool)

(assert (=> b!1385781 (= c!129126 e!785359)))

(declare-fun res!926416 () Bool)

(assert (=> b!1385781 (=> (not res!926416) (not e!785359))))

(assert (=> b!1385781 (= res!926416 (not (= startIndex!16 i!1065)))))

(assert (= (and start!118578 res!926418) b!1385775))

(assert (= (and b!1385775 res!926419) b!1385778))

(assert (= (and b!1385778 res!926420) b!1385776))

(assert (= (and b!1385776 res!926417) b!1385777))

(assert (= (and b!1385777 res!926422) b!1385779))

(assert (= (and b!1385779 res!926421) b!1385781))

(assert (= (and b!1385781 res!926416) b!1385774))

(assert (= (and b!1385781 c!129126) b!1385773))

(assert (= (and b!1385781 (not c!129126)) b!1385780))

(declare-fun m!1271343 () Bool)

(assert (=> b!1385773 m!1271343))

(declare-fun m!1271345 () Bool)

(assert (=> b!1385773 m!1271345))

(assert (=> b!1385773 m!1271345))

(declare-fun m!1271347 () Bool)

(assert (=> b!1385773 m!1271347))

(declare-fun m!1271349 () Bool)

(assert (=> b!1385773 m!1271349))

(declare-fun m!1271351 () Bool)

(assert (=> b!1385773 m!1271351))

(declare-fun m!1271353 () Bool)

(assert (=> b!1385773 m!1271353))

(declare-fun m!1271355 () Bool)

(assert (=> b!1385773 m!1271355))

(assert (=> b!1385773 m!1271353))

(declare-fun m!1271357 () Bool)

(assert (=> b!1385773 m!1271357))

(declare-fun m!1271359 () Bool)

(assert (=> start!118578 m!1271359))

(declare-fun m!1271361 () Bool)

(assert (=> start!118578 m!1271361))

(declare-fun m!1271363 () Bool)

(assert (=> b!1385777 m!1271363))

(declare-fun m!1271365 () Bool)

(assert (=> b!1385779 m!1271365))

(assert (=> b!1385774 m!1271353))

(assert (=> b!1385774 m!1271353))

(declare-fun m!1271367 () Bool)

(assert (=> b!1385774 m!1271367))

(declare-fun m!1271369 () Bool)

(assert (=> b!1385776 m!1271369))

(assert (=> b!1385778 m!1271365))

(assert (=> b!1385778 m!1271365))

(declare-fun m!1271371 () Bool)

(assert (=> b!1385778 m!1271371))

(push 1)

(assert (not b!1385776))

(assert (not b!1385777))

(assert (not b!1385778))

(assert (not b!1385774))

(assert (not start!118578))

(assert (not b!1385773))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

