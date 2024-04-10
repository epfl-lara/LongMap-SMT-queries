; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131452 () Bool)

(assert start!131452)

(declare-fun b!1540866 () Bool)

(declare-fun res!1057414 () Bool)

(declare-fun e!856974 () Bool)

(assert (=> b!1540866 (=> (not res!1057414) (not e!856974))))

(declare-datatypes ((array!102355 0))(
  ( (array!102356 (arr!49386 (Array (_ BitVec 32) (_ BitVec 64))) (size!49936 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102355)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102355 (_ BitVec 32)) Bool)

(assert (=> b!1540866 (= res!1057414 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1540867 () Bool)

(declare-fun res!1057412 () Bool)

(assert (=> b!1540867 (=> (not res!1057412) (not e!856974))))

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1540867 (= res!1057412 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49936 a!3920))))))

(declare-fun res!1057411 () Bool)

(assert (=> start!131452 (=> (not res!1057411) (not e!856974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131452 (= res!1057411 (validMask!0 mask!4052))))

(assert (=> start!131452 e!856974))

(assert (=> start!131452 true))

(declare-fun array_inv!38414 (array!102355) Bool)

(assert (=> start!131452 (array_inv!38414 a!3920)))

(declare-fun b!1540868 () Bool)

(assert (=> b!1540868 (= e!856974 false)))

(declare-fun lt!665530 () Bool)

(assert (=> b!1540868 (= lt!665530 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1540865 () Bool)

(declare-fun res!1057413 () Bool)

(assert (=> b!1540865 (=> (not res!1057413) (not e!856974))))

(assert (=> b!1540865 (= res!1057413 (and (= (size!49936 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49936 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49936 a!3920))))))

(assert (= (and start!131452 res!1057411) b!1540865))

(assert (= (and b!1540865 res!1057413) b!1540866))

(assert (= (and b!1540866 res!1057414) b!1540867))

(assert (= (and b!1540867 res!1057412) b!1540868))

(declare-fun m!1422947 () Bool)

(assert (=> b!1540866 m!1422947))

(declare-fun m!1422949 () Bool)

(assert (=> start!131452 m!1422949))

(declare-fun m!1422951 () Bool)

(assert (=> start!131452 m!1422951))

(declare-fun m!1422953 () Bool)

(assert (=> b!1540868 m!1422953))

(check-sat (not b!1540866) (not start!131452) (not b!1540868))
