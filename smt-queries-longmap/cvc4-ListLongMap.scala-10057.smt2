; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118480 () Bool)

(assert start!118480)

(declare-fun b!1385472 () Bool)

(declare-fun e!785005 () Bool)

(assert (=> b!1385472 (= e!785005 false)))

(declare-fun lt!609252 () Bool)

(declare-datatypes ((array!94756 0))(
  ( (array!94757 (arr!45754 (Array (_ BitVec 32) (_ BitVec 64))) (size!46304 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94756)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94756 (_ BitVec 32)) Bool)

(assert (=> b!1385472 (= lt!609252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385471 () Bool)

(declare-fun res!926719 () Bool)

(assert (=> b!1385471 (=> (not res!926719) (not e!785005))))

(declare-datatypes ((List!32282 0))(
  ( (Nil!32279) (Cons!32278 (h!33487 (_ BitVec 64)) (t!46976 List!32282)) )
))
(declare-fun arrayNoDuplicates!0 (array!94756 (_ BitVec 32) List!32282) Bool)

(assert (=> b!1385471 (= res!926719 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32279))))

(declare-fun res!926721 () Bool)

(assert (=> start!118480 (=> (not res!926721) (not e!785005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118480 (= res!926721 (validMask!0 mask!2987))))

(assert (=> start!118480 e!785005))

(assert (=> start!118480 true))

(declare-fun array_inv!34782 (array!94756) Bool)

(assert (=> start!118480 (array_inv!34782 a!2938)))

(declare-fun b!1385470 () Bool)

(declare-fun res!926722 () Bool)

(assert (=> b!1385470 (=> (not res!926722) (not e!785005))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385470 (= res!926722 (validKeyInArray!0 (select (arr!45754 a!2938) i!1065)))))

(declare-fun b!1385469 () Bool)

(declare-fun res!926720 () Bool)

(assert (=> b!1385469 (=> (not res!926720) (not e!785005))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385469 (= res!926720 (and (= (size!46304 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46304 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46304 a!2938))))))

(assert (= (and start!118480 res!926721) b!1385469))

(assert (= (and b!1385469 res!926720) b!1385470))

(assert (= (and b!1385470 res!926722) b!1385471))

(assert (= (and b!1385471 res!926719) b!1385472))

(declare-fun m!1270761 () Bool)

(assert (=> b!1385472 m!1270761))

(declare-fun m!1270763 () Bool)

(assert (=> b!1385471 m!1270763))

(declare-fun m!1270765 () Bool)

(assert (=> start!118480 m!1270765))

(declare-fun m!1270767 () Bool)

(assert (=> start!118480 m!1270767))

(declare-fun m!1270769 () Bool)

(assert (=> b!1385470 m!1270769))

(assert (=> b!1385470 m!1270769))

(declare-fun m!1270771 () Bool)

(assert (=> b!1385470 m!1270771))

(push 1)

(assert (not b!1385470))

(assert (not b!1385471))

(assert (not start!118480))

(assert (not b!1385472))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

