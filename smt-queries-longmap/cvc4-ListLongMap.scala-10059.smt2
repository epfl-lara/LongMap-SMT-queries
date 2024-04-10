; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118492 () Bool)

(assert start!118492)

(declare-fun b!1385543 () Bool)

(declare-fun res!926793 () Bool)

(declare-fun e!785042 () Bool)

(assert (=> b!1385543 (=> (not res!926793) (not e!785042))))

(declare-datatypes ((array!94768 0))(
  ( (array!94769 (arr!45760 (Array (_ BitVec 32) (_ BitVec 64))) (size!46310 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94768)

(declare-datatypes ((List!32288 0))(
  ( (Nil!32285) (Cons!32284 (h!33493 (_ BitVec 64)) (t!46982 List!32288)) )
))
(declare-fun arrayNoDuplicates!0 (array!94768 (_ BitVec 32) List!32288) Bool)

(assert (=> b!1385543 (= res!926793 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32285))))

(declare-fun b!1385542 () Bool)

(declare-fun res!926792 () Bool)

(assert (=> b!1385542 (=> (not res!926792) (not e!785042))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385542 (= res!926792 (validKeyInArray!0 (select (arr!45760 a!2938) i!1065)))))

(declare-fun b!1385544 () Bool)

(assert (=> b!1385544 (= e!785042 false)))

(declare-fun lt!609270 () Bool)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94768 (_ BitVec 32)) Bool)

(assert (=> b!1385544 (= lt!609270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!926794 () Bool)

(assert (=> start!118492 (=> (not res!926794) (not e!785042))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118492 (= res!926794 (validMask!0 mask!2987))))

(assert (=> start!118492 e!785042))

(assert (=> start!118492 true))

(declare-fun array_inv!34788 (array!94768) Bool)

(assert (=> start!118492 (array_inv!34788 a!2938)))

(declare-fun b!1385541 () Bool)

(declare-fun res!926791 () Bool)

(assert (=> b!1385541 (=> (not res!926791) (not e!785042))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385541 (= res!926791 (and (= (size!46310 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46310 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46310 a!2938))))))

(assert (= (and start!118492 res!926794) b!1385541))

(assert (= (and b!1385541 res!926791) b!1385542))

(assert (= (and b!1385542 res!926792) b!1385543))

(assert (= (and b!1385543 res!926793) b!1385544))

(declare-fun m!1270833 () Bool)

(assert (=> b!1385543 m!1270833))

(declare-fun m!1270835 () Bool)

(assert (=> b!1385542 m!1270835))

(assert (=> b!1385542 m!1270835))

(declare-fun m!1270837 () Bool)

(assert (=> b!1385542 m!1270837))

(declare-fun m!1270839 () Bool)

(assert (=> b!1385544 m!1270839))

(declare-fun m!1270841 () Bool)

(assert (=> start!118492 m!1270841))

(declare-fun m!1270843 () Bool)

(assert (=> start!118492 m!1270843))

(push 1)

(assert (not b!1385542))

(assert (not b!1385543))

(assert (not start!118492))

(assert (not b!1385544))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

