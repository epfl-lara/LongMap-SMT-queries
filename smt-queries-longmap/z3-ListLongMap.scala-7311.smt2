; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93470 () Bool)

(assert start!93470)

(declare-fun res!707273 () Bool)

(declare-fun e!602343 () Bool)

(assert (=> start!93470 (=> (not res!707273) (not e!602343))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66773 0))(
  ( (array!66774 (arr!32105 (Array (_ BitVec 32) (_ BitVec 64))) (size!32641 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66773)

(assert (=> start!93470 (= res!707273 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32641 a!3488)) (bvslt (size!32641 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93470 e!602343))

(assert (=> start!93470 true))

(declare-fun array_inv!24885 (array!66773) Bool)

(assert (=> start!93470 (array_inv!24885 a!3488)))

(declare-fun b!1058699 () Bool)

(assert (=> b!1058699 (= e!602343 false)))

(declare-fun lt!467028 () Bool)

(declare-datatypes ((List!22417 0))(
  ( (Nil!22414) (Cons!22413 (h!23622 (_ BitVec 64)) (t!31724 List!22417)) )
))
(declare-fun arrayNoDuplicates!0 (array!66773 (_ BitVec 32) List!22417) Bool)

(assert (=> b!1058699 (= lt!467028 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22414))))

(assert (= (and start!93470 res!707273) b!1058699))

(declare-fun m!978357 () Bool)

(assert (=> start!93470 m!978357))

(declare-fun m!978359 () Bool)

(assert (=> b!1058699 m!978359))

(check-sat (not start!93470) (not b!1058699))
(check-sat)
