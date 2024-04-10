; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134574 () Bool)

(assert start!134574)

(declare-fun res!1073406 () Bool)

(declare-fun e!876010 () Bool)

(assert (=> start!134574 (=> (not res!1073406) (not e!876010))))

(declare-fun mask!4043 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134574 (= res!1073406 (validMask!0 mask!4043))))

(assert (=> start!134574 e!876010))

(assert (=> start!134574 true))

(declare-datatypes ((array!104806 0))(
  ( (array!104807 (arr!50583 (Array (_ BitVec 32) (_ BitVec 64))) (size!51133 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104806)

(declare-fun array_inv!39310 (array!104806) Bool)

(assert (=> start!134574 (array_inv!39310 a!3462)))

(declare-fun b!1571151 () Bool)

(assert (=> b!1571151 (= e!876010 (and (= (size!51133 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)) (bvsgt #b00000000000000000000000000000000 (size!51133 a!3462))))))

(assert (= (and start!134574 res!1073406) b!1571151))

(declare-fun m!1445151 () Bool)

(assert (=> start!134574 m!1445151))

(declare-fun m!1445153 () Bool)

(assert (=> start!134574 m!1445153))

(push 1)

(assert (not start!134574))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!164479 () Bool)

