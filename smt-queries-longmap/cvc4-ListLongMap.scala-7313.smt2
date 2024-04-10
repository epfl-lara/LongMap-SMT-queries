; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93484 () Bool)

(assert start!93484)

(declare-fun res!707302 () Bool)

(declare-fun e!602385 () Bool)

(assert (=> start!93484 (=> (not res!707302) (not e!602385))))

(declare-fun from!2850 () (_ BitVec 32))

(declare-datatypes ((array!66787 0))(
  ( (array!66788 (arr!32112 (Array (_ BitVec 32) (_ BitVec 64))) (size!32648 (_ BitVec 32))) )
))
(declare-fun a!3475 () array!66787)

(assert (=> start!93484 (= res!707302 (and (bvsge from!2850 #b00000000000000000000000000000000) (bvslt from!2850 (size!32648 a!3475)) (bvslt (size!32648 a!3475) #b01111111111111111111111111111111)))))

(assert (=> start!93484 e!602385))

(assert (=> start!93484 true))

(declare-fun array_inv!24892 (array!66787) Bool)

(assert (=> start!93484 (array_inv!24892 a!3475)))

(declare-fun b!1058728 () Bool)

(declare-fun res!707303 () Bool)

(assert (=> b!1058728 (=> (not res!707303) (not e!602385))))

(declare-fun k!2741 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058728 (= res!707303 (arrayContainsKey!0 a!3475 k!2741 from!2850))))

(declare-fun b!1058729 () Bool)

(assert (=> b!1058729 (= e!602385 (and (not (= (select (arr!32112 a!3475) from!2850) k!2741)) (or (bvslt (bvadd #b00000000000000000000000000000001 from!2850) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!2850) (size!32648 a!3475)))))))

(assert (= (and start!93484 res!707302) b!1058728))

(assert (= (and b!1058728 res!707303) b!1058729))

(declare-fun m!978389 () Bool)

(assert (=> start!93484 m!978389))

(declare-fun m!978391 () Bool)

(assert (=> b!1058728 m!978391))

(declare-fun m!978393 () Bool)

(assert (=> b!1058729 m!978393))

(push 1)

(assert (not start!93484))

(assert (not b!1058728))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

