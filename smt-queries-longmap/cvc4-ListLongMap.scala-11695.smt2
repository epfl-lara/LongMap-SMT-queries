; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136782 () Bool)

(assert start!136782)

(declare-fun res!1078613 () Bool)

(declare-fun e!880546 () Bool)

(assert (=> start!136782 (=> (not res!1078613) (not e!880546))))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105780 0))(
  ( (array!105781 (arr!51000 (Array (_ BitVec 32) (_ BitVec 64))) (size!51550 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105780)

(assert (=> start!136782 (= res!1078613 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51550 a!3559)) (bvslt (size!51550 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136782 e!880546))

(assert (=> start!136782 true))

(declare-fun array_inv!39727 (array!105780) Bool)

(assert (=> start!136782 (array_inv!39727 a!3559)))

(declare-fun b!1578674 () Bool)

(declare-fun res!1078614 () Bool)

(assert (=> b!1578674 (=> (not res!1078614) (not e!880546))))

(declare-fun k!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105780 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578674 (= res!1078614 (arrayContainsKey!0 a!3559 k!2792 from!2937))))

(declare-fun b!1578675 () Bool)

(assert (=> b!1578675 (= e!880546 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvsge (bvsub from!2937 #b00000000000000000000000000000001) (size!51550 a!3559))))))

(assert (= (and start!136782 res!1078613) b!1578674))

(assert (= (and b!1578674 res!1078614) b!1578675))

(declare-fun m!1450731 () Bool)

(assert (=> start!136782 m!1450731))

(declare-fun m!1450733 () Bool)

(assert (=> b!1578674 m!1450733))

(push 1)

(assert (not b!1578674))

(assert (not start!136782))

(check-sat)

(pop 1)

(push 1)

(check-sat)

