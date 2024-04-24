; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118758 () Bool)

(assert start!118758)

(declare-fun res!927662 () Bool)

(declare-fun e!786052 () Bool)

(assert (=> start!118758 (=> (not res!927662) (not e!786052))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118758 (= res!927662 (validMask!0 mask!2987))))

(assert (=> start!118758 e!786052))

(assert (=> start!118758 true))

(declare-datatypes ((array!94932 0))(
  ( (array!94933 (arr!45840 (Array (_ BitVec 32) (_ BitVec 64))) (size!46391 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94932)

(declare-fun array_inv!35121 (array!94932) Bool)

(assert (=> start!118758 (array_inv!35121 a!2938)))

(declare-fun b!1387201 () Bool)

(declare-fun res!927664 () Bool)

(assert (=> b!1387201 (=> (not res!927664) (not e!786052))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1387201 (= res!927664 (validKeyInArray!0 (select (arr!45840 a!2938) i!1065)))))

(declare-fun b!1387200 () Bool)

(declare-fun res!927661 () Bool)

(assert (=> b!1387200 (=> (not res!927661) (not e!786052))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1387200 (= res!927661 (and (= (size!46391 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46391 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46391 a!2938))))))

(declare-fun b!1387203 () Bool)

(assert (=> b!1387203 (= e!786052 false)))

(declare-fun lt!609822 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94932 (_ BitVec 32)) Bool)

(assert (=> b!1387203 (= lt!609822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1387202 () Bool)

(declare-fun res!927663 () Bool)

(assert (=> b!1387202 (=> (not res!927663) (not e!786052))))

(declare-datatypes ((List!32355 0))(
  ( (Nil!32352) (Cons!32351 (h!33569 (_ BitVec 64)) (t!47041 List!32355)) )
))
(declare-fun arrayNoDuplicates!0 (array!94932 (_ BitVec 32) List!32355) Bool)

(assert (=> b!1387202 (= res!927663 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32352))))

(assert (= (and start!118758 res!927662) b!1387200))

(assert (= (and b!1387200 res!927661) b!1387201))

(assert (= (and b!1387201 res!927664) b!1387202))

(assert (= (and b!1387202 res!927663) b!1387203))

(declare-fun m!1272801 () Bool)

(assert (=> start!118758 m!1272801))

(declare-fun m!1272803 () Bool)

(assert (=> start!118758 m!1272803))

(declare-fun m!1272805 () Bool)

(assert (=> b!1387201 m!1272805))

(assert (=> b!1387201 m!1272805))

(declare-fun m!1272807 () Bool)

(assert (=> b!1387201 m!1272807))

(declare-fun m!1272809 () Bool)

(assert (=> b!1387203 m!1272809))

(declare-fun m!1272811 () Bool)

(assert (=> b!1387202 m!1272811))

(push 1)

(assert (not b!1387202))

(assert (not start!118758))

(assert (not b!1387203))

(assert (not b!1387201))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

