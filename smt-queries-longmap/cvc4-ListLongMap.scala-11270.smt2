; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131466 () Bool)

(assert start!131466)

(declare-fun b!1540951 () Bool)

(declare-fun res!1057496 () Bool)

(declare-fun e!857016 () Bool)

(assert (=> b!1540951 (=> (not res!1057496) (not e!857016))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-datatypes ((array!102369 0))(
  ( (array!102370 (arr!49393 (Array (_ BitVec 32) (_ BitVec 64))) (size!49943 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102369)

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1540951 (= res!1057496 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49943 a!3920))))))

(declare-fun b!1540949 () Bool)

(declare-fun res!1057495 () Bool)

(assert (=> b!1540949 (=> (not res!1057495) (not e!857016))))

(declare-fun mask!4052 () (_ BitVec 32))

(assert (=> b!1540949 (= res!1057495 (and (= (size!49943 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49943 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49943 a!3920))))))

(declare-fun b!1540952 () Bool)

(assert (=> b!1540952 (= e!857016 false)))

(declare-fun lt!665551 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102369 (_ BitVec 32)) Bool)

(assert (=> b!1540952 (= lt!665551 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun res!1057498 () Bool)

(assert (=> start!131466 (=> (not res!1057498) (not e!857016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131466 (= res!1057498 (validMask!0 mask!4052))))

(assert (=> start!131466 e!857016))

(assert (=> start!131466 true))

(declare-fun array_inv!38421 (array!102369) Bool)

(assert (=> start!131466 (array_inv!38421 a!3920)))

(declare-fun b!1540950 () Bool)

(declare-fun res!1057497 () Bool)

(assert (=> b!1540950 (=> (not res!1057497) (not e!857016))))

(assert (=> b!1540950 (= res!1057497 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131466 res!1057498) b!1540949))

(assert (= (and b!1540949 res!1057495) b!1540950))

(assert (= (and b!1540950 res!1057497) b!1540951))

(assert (= (and b!1540951 res!1057496) b!1540952))

(declare-fun m!1423003 () Bool)

(assert (=> b!1540952 m!1423003))

(declare-fun m!1423005 () Bool)

(assert (=> start!131466 m!1423005))

(declare-fun m!1423007 () Bool)

(assert (=> start!131466 m!1423007))

(declare-fun m!1423009 () Bool)

(assert (=> b!1540950 m!1423009))

(push 1)

(assert (not b!1540950))

(assert (not start!131466))

(assert (not b!1540952))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

