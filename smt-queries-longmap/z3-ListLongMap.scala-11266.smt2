; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131440 () Bool)

(assert start!131440)

(declare-fun b!1540796 () Bool)

(declare-fun e!856939 () Bool)

(assert (=> b!1540796 (= e!856939 false)))

(declare-datatypes ((array!102343 0))(
  ( (array!102344 (arr!49380 (Array (_ BitVec 32) (_ BitVec 64))) (size!49930 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102343)

(declare-fun lt!665512 () Bool)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102343 (_ BitVec 32)) Bool)

(assert (=> b!1540796 (= lt!665512 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1540794 () Bool)

(declare-fun res!1057341 () Bool)

(assert (=> b!1540794 (=> (not res!1057341) (not e!856939))))

(assert (=> b!1540794 (= res!1057341 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1540795 () Bool)

(declare-fun res!1057342 () Bool)

(assert (=> b!1540795 (=> (not res!1057342) (not e!856939))))

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1540795 (= res!1057342 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49930 a!3920))))))

(declare-fun b!1540793 () Bool)

(declare-fun res!1057339 () Bool)

(assert (=> b!1540793 (=> (not res!1057339) (not e!856939))))

(assert (=> b!1540793 (= res!1057339 (and (= (size!49930 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49930 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49930 a!3920))))))

(declare-fun res!1057340 () Bool)

(assert (=> start!131440 (=> (not res!1057340) (not e!856939))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131440 (= res!1057340 (validMask!0 mask!4052))))

(assert (=> start!131440 e!856939))

(assert (=> start!131440 true))

(declare-fun array_inv!38408 (array!102343) Bool)

(assert (=> start!131440 (array_inv!38408 a!3920)))

(assert (= (and start!131440 res!1057340) b!1540793))

(assert (= (and b!1540793 res!1057339) b!1540794))

(assert (= (and b!1540794 res!1057341) b!1540795))

(assert (= (and b!1540795 res!1057342) b!1540796))

(declare-fun m!1422899 () Bool)

(assert (=> b!1540796 m!1422899))

(declare-fun m!1422901 () Bool)

(assert (=> b!1540794 m!1422901))

(declare-fun m!1422903 () Bool)

(assert (=> start!131440 m!1422903))

(declare-fun m!1422905 () Bool)

(assert (=> start!131440 m!1422905))

(check-sat (not start!131440) (not b!1540794) (not b!1540796))
