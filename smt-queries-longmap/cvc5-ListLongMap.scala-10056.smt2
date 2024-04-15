; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118470 () Bool)

(assert start!118470)

(declare-fun b!1385364 () Bool)

(declare-fun res!926658 () Bool)

(declare-fun e!784956 () Bool)

(assert (=> b!1385364 (=> (not res!926658) (not e!784956))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94699 0))(
  ( (array!94700 (arr!45726 (Array (_ BitVec 32) (_ BitVec 64))) (size!46278 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94699)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1385364 (= res!926658 (and (= (size!46278 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46278 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46278 a!2938))))))

(declare-fun res!926660 () Bool)

(assert (=> start!118470 (=> (not res!926660) (not e!784956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118470 (= res!926660 (validMask!0 mask!2987))))

(assert (=> start!118470 e!784956))

(assert (=> start!118470 true))

(declare-fun array_inv!34959 (array!94699) Bool)

(assert (=> start!118470 (array_inv!34959 a!2938)))

(declare-fun b!1385366 () Bool)

(declare-fun res!926659 () Bool)

(assert (=> b!1385366 (=> (not res!926659) (not e!784956))))

(declare-datatypes ((List!32332 0))(
  ( (Nil!32329) (Cons!32328 (h!33537 (_ BitVec 64)) (t!47018 List!32332)) )
))
(declare-fun arrayNoDuplicates!0 (array!94699 (_ BitVec 32) List!32332) Bool)

(assert (=> b!1385366 (= res!926659 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32329))))

(declare-fun b!1385367 () Bool)

(assert (=> b!1385367 (= e!784956 false)))

(declare-fun lt!609059 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94699 (_ BitVec 32)) Bool)

(assert (=> b!1385367 (= lt!609059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385365 () Bool)

(declare-fun res!926657 () Bool)

(assert (=> b!1385365 (=> (not res!926657) (not e!784956))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385365 (= res!926657 (validKeyInArray!0 (select (arr!45726 a!2938) i!1065)))))

(assert (= (and start!118470 res!926660) b!1385364))

(assert (= (and b!1385364 res!926658) b!1385365))

(assert (= (and b!1385365 res!926657) b!1385366))

(assert (= (and b!1385366 res!926659) b!1385367))

(declare-fun m!1270221 () Bool)

(assert (=> start!118470 m!1270221))

(declare-fun m!1270223 () Bool)

(assert (=> start!118470 m!1270223))

(declare-fun m!1270225 () Bool)

(assert (=> b!1385366 m!1270225))

(declare-fun m!1270227 () Bool)

(assert (=> b!1385367 m!1270227))

(declare-fun m!1270229 () Bool)

(assert (=> b!1385365 m!1270229))

(assert (=> b!1385365 m!1270229))

(declare-fun m!1270231 () Bool)

(assert (=> b!1385365 m!1270231))

(push 1)

(assert (not b!1385366))

(assert (not start!118470))

(assert (not b!1385365))

(assert (not b!1385367))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

