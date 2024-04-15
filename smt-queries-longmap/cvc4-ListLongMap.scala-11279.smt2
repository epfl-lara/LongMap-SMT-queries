; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131468 () Bool)

(assert start!131468)

(declare-fun res!1057642 () Bool)

(declare-fun e!856975 () Bool)

(assert (=> start!131468 (=> (not res!1057642) (not e!856975))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131468 (= res!1057642 (validMask!0 mask!4052))))

(assert (=> start!131468 e!856975))

(assert (=> start!131468 true))

(declare-datatypes ((array!102369 0))(
  ( (array!102370 (arr!49394 (Array (_ BitVec 32) (_ BitVec 64))) (size!49946 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102369)

(declare-fun array_inv!38627 (array!102369) Bool)

(assert (=> start!131468 (array_inv!38627 a!3920)))

(declare-fun b!1540911 () Bool)

(declare-fun res!1057641 () Bool)

(assert (=> b!1540911 (=> (not res!1057641) (not e!856975))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1540911 (= res!1057641 (and (= (size!49946 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49946 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49946 a!3920))))))

(declare-fun b!1540912 () Bool)

(assert (=> b!1540912 (= e!856975 false)))

(declare-fun lt!665334 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102369 (_ BitVec 32)) Bool)

(assert (=> b!1540912 (= lt!665334 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131468 res!1057642) b!1540911))

(assert (= (and b!1540911 res!1057641) b!1540912))

(declare-fun m!1422341 () Bool)

(assert (=> start!131468 m!1422341))

(declare-fun m!1422343 () Bool)

(assert (=> start!131468 m!1422343))

(declare-fun m!1422345 () Bool)

(assert (=> b!1540912 m!1422345))

(push 1)

(assert (not b!1540912))

(assert (not start!131468))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

