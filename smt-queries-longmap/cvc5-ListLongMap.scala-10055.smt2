; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118464 () Bool)

(assert start!118464)

(declare-fun res!926626 () Bool)

(declare-fun e!784957 () Bool)

(assert (=> start!118464 (=> (not res!926626) (not e!784957))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118464 (= res!926626 (validMask!0 mask!2987))))

(assert (=> start!118464 e!784957))

(assert (=> start!118464 true))

(declare-datatypes ((array!94740 0))(
  ( (array!94741 (arr!45746 (Array (_ BitVec 32) (_ BitVec 64))) (size!46296 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94740)

(declare-fun array_inv!34774 (array!94740) Bool)

(assert (=> start!118464 (array_inv!34774 a!2938)))

(declare-fun b!1385373 () Bool)

(declare-fun res!926625 () Bool)

(assert (=> b!1385373 (=> (not res!926625) (not e!784957))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385373 (= res!926625 (and (= (size!46296 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46296 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46296 a!2938))))))

(declare-fun b!1385374 () Bool)

(declare-fun res!926623 () Bool)

(assert (=> b!1385374 (=> (not res!926623) (not e!784957))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385374 (= res!926623 (validKeyInArray!0 (select (arr!45746 a!2938) i!1065)))))

(declare-fun b!1385376 () Bool)

(assert (=> b!1385376 (= e!784957 false)))

(declare-fun lt!609228 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94740 (_ BitVec 32)) Bool)

(assert (=> b!1385376 (= lt!609228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385375 () Bool)

(declare-fun res!926624 () Bool)

(assert (=> b!1385375 (=> (not res!926624) (not e!784957))))

(declare-datatypes ((List!32274 0))(
  ( (Nil!32271) (Cons!32270 (h!33479 (_ BitVec 64)) (t!46968 List!32274)) )
))
(declare-fun arrayNoDuplicates!0 (array!94740 (_ BitVec 32) List!32274) Bool)

(assert (=> b!1385375 (= res!926624 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32271))))

(assert (= (and start!118464 res!926626) b!1385373))

(assert (= (and b!1385373 res!926625) b!1385374))

(assert (= (and b!1385374 res!926623) b!1385375))

(assert (= (and b!1385375 res!926624) b!1385376))

(declare-fun m!1270665 () Bool)

(assert (=> start!118464 m!1270665))

(declare-fun m!1270667 () Bool)

(assert (=> start!118464 m!1270667))

(declare-fun m!1270669 () Bool)

(assert (=> b!1385374 m!1270669))

(assert (=> b!1385374 m!1270669))

(declare-fun m!1270671 () Bool)

(assert (=> b!1385374 m!1270671))

(declare-fun m!1270673 () Bool)

(assert (=> b!1385376 m!1270673))

(declare-fun m!1270675 () Bool)

(assert (=> b!1385375 m!1270675))

(push 1)

(assert (not b!1385375))

(assert (not start!118464))

(assert (not b!1385374))

(assert (not b!1385376))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

