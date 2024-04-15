; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131454 () Bool)

(assert start!131454)

(declare-fun res!1057592 () Bool)

(declare-fun e!856933 () Bool)

(assert (=> start!131454 (=> (not res!1057592) (not e!856933))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131454 (= res!1057592 (validMask!0 mask!4052))))

(assert (=> start!131454 e!856933))

(assert (=> start!131454 true))

(declare-datatypes ((array!102355 0))(
  ( (array!102356 (arr!49387 (Array (_ BitVec 32) (_ BitVec 64))) (size!49939 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102355)

(declare-fun array_inv!38620 (array!102355) Bool)

(assert (=> start!131454 (array_inv!38620 a!3920)))

(declare-fun b!1540862 () Bool)

(declare-fun res!1057593 () Bool)

(assert (=> b!1540862 (=> (not res!1057593) (not e!856933))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1540862 (= res!1057593 (and (= (size!49939 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49939 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49939 a!3920))))))

(declare-fun b!1540863 () Bool)

(declare-fun res!1057594 () Bool)

(assert (=> b!1540863 (=> (not res!1057594) (not e!856933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102355 (_ BitVec 32)) Bool)

(assert (=> b!1540863 (= res!1057594 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1540864 () Bool)

(assert (=> b!1540864 (= e!856933 (and (bvsge from!3298 newFrom!293) (bvslt newFrom!293 #b00000000000000000000000000000000)))))

(assert (= (and start!131454 res!1057592) b!1540862))

(assert (= (and b!1540862 res!1057593) b!1540863))

(assert (= (and b!1540863 res!1057594) b!1540864))

(declare-fun m!1422299 () Bool)

(assert (=> start!131454 m!1422299))

(declare-fun m!1422301 () Bool)

(assert (=> start!131454 m!1422301))

(declare-fun m!1422303 () Bool)

(assert (=> b!1540863 m!1422303))

(check-sat (not start!131454) (not b!1540863))
(check-sat)
