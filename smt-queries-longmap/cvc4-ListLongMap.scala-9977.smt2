; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117802 () Bool)

(assert start!117802)

(declare-fun res!922894 () Bool)

(declare-fun e!782960 () Bool)

(assert (=> start!117802 (=> (not res!922894) (not e!782960))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117802 (= res!922894 (validMask!0 mask!3034))))

(assert (=> start!117802 e!782960))

(assert (=> start!117802 true))

(declare-datatypes ((array!94254 0))(
  ( (array!94255 (arr!45514 (Array (_ BitVec 32) (_ BitVec 64))) (size!46064 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94254)

(declare-fun array_inv!34542 (array!94254) Bool)

(assert (=> start!117802 (array_inv!34542 a!2971)))

(declare-fun b!1381264 () Bool)

(declare-fun res!922892 () Bool)

(assert (=> b!1381264 (=> (not res!922892) (not e!782960))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381264 (= res!922892 (and (= (size!46064 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46064 a!2971))))))

(declare-fun b!1381265 () Bool)

(declare-fun res!922893 () Bool)

(assert (=> b!1381265 (=> (not res!922893) (not e!782960))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381265 (= res!922893 (validKeyInArray!0 (select (arr!45514 a!2971) i!1094)))))

(declare-fun b!1381266 () Bool)

(assert (=> b!1381266 (= e!782960 (and (bvsle #b00000000000000000000000000000000 (size!46064 a!2971)) (bvsge (size!46064 a!2971) #b01111111111111111111111111111111)))))

(assert (= (and start!117802 res!922894) b!1381264))

(assert (= (and b!1381264 res!922892) b!1381265))

(assert (= (and b!1381265 res!922893) b!1381266))

(declare-fun m!1266469 () Bool)

(assert (=> start!117802 m!1266469))

(declare-fun m!1266471 () Bool)

(assert (=> start!117802 m!1266471))

(declare-fun m!1266473 () Bool)

(assert (=> b!1381265 m!1266473))

(assert (=> b!1381265 m!1266473))

(declare-fun m!1266475 () Bool)

(assert (=> b!1381265 m!1266475))

(push 1)

(assert (not start!117802))

(assert (not b!1381265))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

