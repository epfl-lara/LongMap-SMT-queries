; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131446 () Bool)

(assert start!131446)

(declare-fun b!1540829 () Bool)

(declare-fun res!1057377 () Bool)

(declare-fun e!856956 () Bool)

(assert (=> b!1540829 (=> (not res!1057377) (not e!856956))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-datatypes ((array!102349 0))(
  ( (array!102350 (arr!49383 (Array (_ BitVec 32) (_ BitVec 64))) (size!49933 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102349)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun mask!4052 () (_ BitVec 32))

(assert (=> b!1540829 (= res!1057377 (and (= (size!49933 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49933 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49933 a!3920))))))

(declare-fun b!1540830 () Bool)

(declare-fun res!1057378 () Bool)

(assert (=> b!1540830 (=> (not res!1057378) (not e!856956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102349 (_ BitVec 32)) Bool)

(assert (=> b!1540830 (= res!1057378 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun res!1057375 () Bool)

(assert (=> start!131446 (=> (not res!1057375) (not e!856956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131446 (= res!1057375 (validMask!0 mask!4052))))

(assert (=> start!131446 e!856956))

(assert (=> start!131446 true))

(declare-fun array_inv!38411 (array!102349) Bool)

(assert (=> start!131446 (array_inv!38411 a!3920)))

(declare-fun b!1540832 () Bool)

(assert (=> b!1540832 (= e!856956 false)))

(declare-fun lt!665521 () Bool)

(assert (=> b!1540832 (= lt!665521 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1540831 () Bool)

(declare-fun res!1057376 () Bool)

(assert (=> b!1540831 (=> (not res!1057376) (not e!856956))))

(assert (=> b!1540831 (= res!1057376 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49933 a!3920))))))

(assert (= (and start!131446 res!1057375) b!1540829))

(assert (= (and b!1540829 res!1057377) b!1540830))

(assert (= (and b!1540830 res!1057378) b!1540831))

(assert (= (and b!1540831 res!1057376) b!1540832))

(declare-fun m!1422923 () Bool)

(assert (=> b!1540830 m!1422923))

(declare-fun m!1422925 () Bool)

(assert (=> start!131446 m!1422925))

(declare-fun m!1422927 () Bool)

(assert (=> start!131446 m!1422927))

(declare-fun m!1422929 () Bool)

(assert (=> b!1540832 m!1422929))

(check-sat (not b!1540830) (not b!1540832) (not start!131446))
