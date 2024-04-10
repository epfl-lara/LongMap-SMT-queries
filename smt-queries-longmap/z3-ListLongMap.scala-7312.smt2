; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93476 () Bool)

(assert start!93476)

(declare-fun res!707282 () Bool)

(declare-fun e!602361 () Bool)

(assert (=> start!93476 (=> (not res!707282) (not e!602361))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66779 0))(
  ( (array!66780 (arr!32108 (Array (_ BitVec 32) (_ BitVec 64))) (size!32644 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66779)

(assert (=> start!93476 (= res!707282 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32644 a!3488)) (bvslt (size!32644 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93476 e!602361))

(assert (=> start!93476 true))

(declare-fun array_inv!24888 (array!66779) Bool)

(assert (=> start!93476 (array_inv!24888 a!3488)))

(declare-fun b!1058708 () Bool)

(assert (=> b!1058708 (= e!602361 false)))

(declare-fun lt!467037 () Bool)

(declare-datatypes ((List!22420 0))(
  ( (Nil!22417) (Cons!22416 (h!23625 (_ BitVec 64)) (t!31727 List!22420)) )
))
(declare-fun arrayNoDuplicates!0 (array!66779 (_ BitVec 32) List!22420) Bool)

(assert (=> b!1058708 (= lt!467037 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22417))))

(assert (= (and start!93476 res!707282) b!1058708))

(declare-fun m!978369 () Bool)

(assert (=> start!93476 m!978369))

(declare-fun m!978371 () Bool)

(assert (=> b!1058708 m!978371))

(check-sat (not start!93476) (not b!1058708))
