; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131494 () Bool)

(assert start!131494)

(declare-fun res!1057728 () Bool)

(declare-fun e!857053 () Bool)

(assert (=> start!131494 (=> (not res!1057728) (not e!857053))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131494 (= res!1057728 (validMask!0 mask!4052))))

(assert (=> start!131494 e!857053))

(assert (=> start!131494 true))

(declare-datatypes ((array!102395 0))(
  ( (array!102396 (arr!49407 (Array (_ BitVec 32) (_ BitVec 64))) (size!49959 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102395)

(declare-fun array_inv!38640 (array!102395) Bool)

(assert (=> start!131494 (array_inv!38640 a!3920)))

(declare-fun b!1540998 () Bool)

(declare-fun res!1057729 () Bool)

(assert (=> b!1540998 (=> (not res!1057729) (not e!857053))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1540998 (= res!1057729 (and (= (size!49959 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49959 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49959 a!3920))))))

(declare-fun b!1540999 () Bool)

(assert (=> b!1540999 (= e!857053 false)))

(declare-fun lt!665364 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102395 (_ BitVec 32)) Bool)

(assert (=> b!1540999 (= lt!665364 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131494 res!1057728) b!1540998))

(assert (= (and b!1540998 res!1057729) b!1540999))

(declare-fun m!1422419 () Bool)

(assert (=> start!131494 m!1422419))

(declare-fun m!1422421 () Bool)

(assert (=> start!131494 m!1422421))

(declare-fun m!1422423 () Bool)

(assert (=> b!1540999 m!1422423))

(push 1)

(assert (not b!1540999))

(assert (not start!131494))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

