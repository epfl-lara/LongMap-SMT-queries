; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131438 () Bool)

(assert start!131438)

(declare-fun b!1540783 () Bool)

(declare-fun res!1057329 () Bool)

(declare-fun e!856933 () Bool)

(assert (=> b!1540783 (=> (not res!1057329) (not e!856933))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-datatypes ((array!102341 0))(
  ( (array!102342 (arr!49379 (Array (_ BitVec 32) (_ BitVec 64))) (size!49929 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102341)

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1540783 (= res!1057329 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49929 a!3920))))))

(declare-fun b!1540781 () Bool)

(declare-fun res!1057327 () Bool)

(assert (=> b!1540781 (=> (not res!1057327) (not e!856933))))

(declare-fun mask!4052 () (_ BitVec 32))

(assert (=> b!1540781 (= res!1057327 (and (= (size!49929 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49929 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49929 a!3920))))))

(declare-fun res!1057328 () Bool)

(assert (=> start!131438 (=> (not res!1057328) (not e!856933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131438 (= res!1057328 (validMask!0 mask!4052))))

(assert (=> start!131438 e!856933))

(assert (=> start!131438 true))

(declare-fun array_inv!38407 (array!102341) Bool)

(assert (=> start!131438 (array_inv!38407 a!3920)))

(declare-fun b!1540782 () Bool)

(declare-fun res!1057330 () Bool)

(assert (=> b!1540782 (=> (not res!1057330) (not e!856933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102341 (_ BitVec 32)) Bool)

(assert (=> b!1540782 (= res!1057330 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1540784 () Bool)

(assert (=> b!1540784 (= e!856933 false)))

(declare-fun lt!665509 () Bool)

(assert (=> b!1540784 (= lt!665509 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(assert (= (and start!131438 res!1057328) b!1540781))

(assert (= (and b!1540781 res!1057327) b!1540782))

(assert (= (and b!1540782 res!1057330) b!1540783))

(assert (= (and b!1540783 res!1057329) b!1540784))

(declare-fun m!1422891 () Bool)

(assert (=> start!131438 m!1422891))

(declare-fun m!1422893 () Bool)

(assert (=> start!131438 m!1422893))

(declare-fun m!1422895 () Bool)

(assert (=> b!1540782 m!1422895))

(declare-fun m!1422897 () Bool)

(assert (=> b!1540784 m!1422897))

(push 1)

(assert (not start!131438))

(assert (not b!1540782))

(assert (not b!1540784))

(check-sat)

(pop 1)

