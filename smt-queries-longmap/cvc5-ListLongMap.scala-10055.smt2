; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118464 () Bool)

(assert start!118464)

(declare-fun b!1385328 () Bool)

(declare-fun res!926622 () Bool)

(declare-fun e!784938 () Bool)

(assert (=> b!1385328 (=> (not res!926622) (not e!784938))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94693 0))(
  ( (array!94694 (arr!45723 (Array (_ BitVec 32) (_ BitVec 64))) (size!46275 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94693)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1385328 (= res!926622 (and (= (size!46275 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46275 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46275 a!2938))))))

(declare-fun b!1385330 () Bool)

(declare-fun res!926623 () Bool)

(assert (=> b!1385330 (=> (not res!926623) (not e!784938))))

(declare-datatypes ((List!32329 0))(
  ( (Nil!32326) (Cons!32325 (h!33534 (_ BitVec 64)) (t!47015 List!32329)) )
))
(declare-fun arrayNoDuplicates!0 (array!94693 (_ BitVec 32) List!32329) Bool)

(assert (=> b!1385330 (= res!926623 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32326))))

(declare-fun res!926624 () Bool)

(assert (=> start!118464 (=> (not res!926624) (not e!784938))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118464 (= res!926624 (validMask!0 mask!2987))))

(assert (=> start!118464 e!784938))

(assert (=> start!118464 true))

(declare-fun array_inv!34956 (array!94693) Bool)

(assert (=> start!118464 (array_inv!34956 a!2938)))

(declare-fun b!1385331 () Bool)

(assert (=> b!1385331 (= e!784938 false)))

(declare-fun lt!609050 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94693 (_ BitVec 32)) Bool)

(assert (=> b!1385331 (= lt!609050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385329 () Bool)

(declare-fun res!926621 () Bool)

(assert (=> b!1385329 (=> (not res!926621) (not e!784938))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385329 (= res!926621 (validKeyInArray!0 (select (arr!45723 a!2938) i!1065)))))

(assert (= (and start!118464 res!926624) b!1385328))

(assert (= (and b!1385328 res!926622) b!1385329))

(assert (= (and b!1385329 res!926621) b!1385330))

(assert (= (and b!1385330 res!926623) b!1385331))

(declare-fun m!1270185 () Bool)

(assert (=> b!1385330 m!1270185))

(declare-fun m!1270187 () Bool)

(assert (=> start!118464 m!1270187))

(declare-fun m!1270189 () Bool)

(assert (=> start!118464 m!1270189))

(declare-fun m!1270191 () Bool)

(assert (=> b!1385331 m!1270191))

(declare-fun m!1270193 () Bool)

(assert (=> b!1385329 m!1270193))

(assert (=> b!1385329 m!1270193))

(declare-fun m!1270195 () Bool)

(assert (=> b!1385329 m!1270195))

(push 1)

(assert (not b!1385331))

(assert (not b!1385329))

(assert (not start!118464))

(assert (not b!1385330))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

