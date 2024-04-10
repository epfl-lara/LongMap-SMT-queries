; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118468 () Bool)

(assert start!118468)

(declare-fun res!926648 () Bool)

(declare-fun e!784970 () Bool)

(assert (=> start!118468 (=> (not res!926648) (not e!784970))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118468 (= res!926648 (validMask!0 mask!2987))))

(assert (=> start!118468 e!784970))

(assert (=> start!118468 true))

(declare-datatypes ((array!94744 0))(
  ( (array!94745 (arr!45748 (Array (_ BitVec 32) (_ BitVec 64))) (size!46298 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94744)

(declare-fun array_inv!34776 (array!94744) Bool)

(assert (=> start!118468 (array_inv!34776 a!2938)))

(declare-fun b!1385400 () Bool)

(assert (=> b!1385400 (= e!784970 false)))

(declare-fun lt!609234 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94744 (_ BitVec 32)) Bool)

(assert (=> b!1385400 (= lt!609234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385399 () Bool)

(declare-fun res!926650 () Bool)

(assert (=> b!1385399 (=> (not res!926650) (not e!784970))))

(declare-datatypes ((List!32276 0))(
  ( (Nil!32273) (Cons!32272 (h!33481 (_ BitVec 64)) (t!46970 List!32276)) )
))
(declare-fun arrayNoDuplicates!0 (array!94744 (_ BitVec 32) List!32276) Bool)

(assert (=> b!1385399 (= res!926650 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32273))))

(declare-fun b!1385397 () Bool)

(declare-fun res!926647 () Bool)

(assert (=> b!1385397 (=> (not res!926647) (not e!784970))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385397 (= res!926647 (and (= (size!46298 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46298 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46298 a!2938))))))

(declare-fun b!1385398 () Bool)

(declare-fun res!926649 () Bool)

(assert (=> b!1385398 (=> (not res!926649) (not e!784970))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385398 (= res!926649 (validKeyInArray!0 (select (arr!45748 a!2938) i!1065)))))

(assert (= (and start!118468 res!926648) b!1385397))

(assert (= (and b!1385397 res!926647) b!1385398))

(assert (= (and b!1385398 res!926649) b!1385399))

(assert (= (and b!1385399 res!926650) b!1385400))

(declare-fun m!1270689 () Bool)

(assert (=> start!118468 m!1270689))

(declare-fun m!1270691 () Bool)

(assert (=> start!118468 m!1270691))

(declare-fun m!1270693 () Bool)

(assert (=> b!1385400 m!1270693))

(declare-fun m!1270695 () Bool)

(assert (=> b!1385399 m!1270695))

(declare-fun m!1270697 () Bool)

(assert (=> b!1385398 m!1270697))

(assert (=> b!1385398 m!1270697))

(declare-fun m!1270699 () Bool)

(assert (=> b!1385398 m!1270699))

(push 1)

(assert (not start!118468))

(assert (not b!1385399))

(assert (not b!1385400))

(assert (not b!1385398))

(check-sat)

(pop 1)

(push 1)

(check-sat)

