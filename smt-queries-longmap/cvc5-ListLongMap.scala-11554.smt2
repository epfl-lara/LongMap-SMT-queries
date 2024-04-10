; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134570 () Bool)

(assert start!134570)

(declare-fun res!1073400 () Bool)

(declare-fun e!875998 () Bool)

(assert (=> start!134570 (=> (not res!1073400) (not e!875998))))

(declare-fun mask!4043 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134570 (= res!1073400 (validMask!0 mask!4043))))

(assert (=> start!134570 e!875998))

(assert (=> start!134570 true))

(declare-datatypes ((array!104802 0))(
  ( (array!104803 (arr!50581 (Array (_ BitVec 32) (_ BitVec 64))) (size!51131 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104802)

(declare-fun array_inv!39308 (array!104802) Bool)

(assert (=> start!134570 (array_inv!39308 a!3462)))

(declare-fun b!1571145 () Bool)

(assert (=> b!1571145 (= e!875998 (and (= (size!51131 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)) (bvsgt #b00000000000000000000000000000000 (size!51131 a!3462))))))

(assert (= (and start!134570 res!1073400) b!1571145))

(declare-fun m!1445143 () Bool)

(assert (=> start!134570 m!1445143))

(declare-fun m!1445145 () Bool)

(assert (=> start!134570 m!1445145))

(push 1)

(assert (not start!134570))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!164477 () Bool)

(assert (=> d!164477 (= (validMask!0 mask!4043) (and (or (= mask!4043 #b00000000000000000000000000000111) (= mask!4043 #b00000000000000000000000000001111) (= mask!4043 #b00000000000000000000000000011111) (= mask!4043 #b00000000000000000000000000111111) (= mask!4043 #b00000000000000000000000001111111) (= mask!4043 #b00000000000000000000000011111111) (= mask!4043 #b00000000000000000000000111111111) (= mask!4043 #b00000000000000000000001111111111) (= mask!4043 