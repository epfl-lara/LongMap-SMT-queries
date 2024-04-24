; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118158 () Bool)

(assert start!118158)

(declare-fun res!923894 () Bool)

(declare-fun e!784093 () Bool)

(assert (=> start!118158 (=> (not res!923894) (not e!784093))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118158 (= res!923894 (validMask!0 mask!3034))))

(assert (=> start!118158 e!784093))

(assert (=> start!118158 true))

(declare-datatypes ((array!94445 0))(
  ( (array!94446 (arr!45603 (Array (_ BitVec 32) (_ BitVec 64))) (size!46154 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94445)

(declare-fun array_inv!34884 (array!94445) Bool)

(assert (=> start!118158 (array_inv!34884 a!2971)))

(declare-fun b!1383054 () Bool)

(declare-fun res!923893 () Bool)

(assert (=> b!1383054 (=> (not res!923893) (not e!784093))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1383054 (= res!923893 (and (= (size!46154 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46154 a!2971))))))

(declare-fun b!1383057 () Bool)

(assert (=> b!1383057 (= e!784093 false)))

(declare-fun lt!608757 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94445 (_ BitVec 32)) Bool)

(assert (=> b!1383057 (= lt!608757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1383056 () Bool)

(declare-fun res!923895 () Bool)

(assert (=> b!1383056 (=> (not res!923895) (not e!784093))))

(declare-datatypes ((List!32124 0))(
  ( (Nil!32121) (Cons!32120 (h!33338 (_ BitVec 64)) (t!46810 List!32124)) )
))
(declare-fun arrayNoDuplicates!0 (array!94445 (_ BitVec 32) List!32124) Bool)

(assert (=> b!1383056 (= res!923895 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32121))))

(declare-fun b!1383055 () Bool)

(declare-fun res!923896 () Bool)

(assert (=> b!1383055 (=> (not res!923896) (not e!784093))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383055 (= res!923896 (validKeyInArray!0 (select (arr!45603 a!2971) i!1094)))))

(assert (= (and start!118158 res!923894) b!1383054))

(assert (= (and b!1383054 res!923893) b!1383055))

(assert (= (and b!1383055 res!923896) b!1383056))

(assert (= (and b!1383056 res!923895) b!1383057))

(declare-fun m!1268559 () Bool)

(assert (=> start!118158 m!1268559))

(declare-fun m!1268561 () Bool)

(assert (=> start!118158 m!1268561))

(declare-fun m!1268563 () Bool)

(assert (=> b!1383057 m!1268563))

(declare-fun m!1268565 () Bool)

(assert (=> b!1383056 m!1268565))

(declare-fun m!1268567 () Bool)

(assert (=> b!1383055 m!1268567))

(assert (=> b!1383055 m!1268567))

(declare-fun m!1268569 () Bool)

(assert (=> b!1383055 m!1268569))

(push 1)

(assert (not b!1383057))

(assert (not start!118158))

(assert (not b!1383056))

(assert (not b!1383055))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

