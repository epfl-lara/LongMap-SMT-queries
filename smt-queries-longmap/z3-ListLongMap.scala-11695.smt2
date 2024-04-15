; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136744 () Bool)

(assert start!136744)

(declare-fun res!1078472 () Bool)

(declare-fun e!880336 () Bool)

(assert (=> start!136744 (=> (not res!1078472) (not e!880336))))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105707 0))(
  ( (array!105708 (arr!50963 (Array (_ BitVec 32) (_ BitVec 64))) (size!51515 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105707)

(assert (=> start!136744 (= res!1078472 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51515 a!3559)) (bvslt (size!51515 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136744 e!880336))

(assert (=> start!136744 true))

(declare-fun array_inv!39899 (array!105707) Bool)

(assert (=> start!136744 (array_inv!39899 a!3559)))

(declare-fun b!1578349 () Bool)

(declare-fun res!1078473 () Bool)

(assert (=> b!1578349 (=> (not res!1078473) (not e!880336))))

(declare-fun k0!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578349 (= res!1078473 (arrayContainsKey!0 a!3559 k0!2792 from!2937))))

(declare-fun b!1578350 () Bool)

(assert (=> b!1578350 (= e!880336 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvsge (bvsub from!2937 #b00000000000000000000000000000001) (size!51515 a!3559))))))

(assert (= (and start!136744 res!1078472) b!1578349))

(assert (= (and b!1578349 res!1078473) b!1578350))

(declare-fun m!1449843 () Bool)

(assert (=> start!136744 m!1449843))

(declare-fun m!1449845 () Bool)

(assert (=> b!1578349 m!1449845))

(check-sat (not b!1578349) (not start!136744))
(check-sat)
