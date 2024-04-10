; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131570 () Bool)

(assert start!131570)

(declare-fun b!1541407 () Bool)

(declare-fun res!1057932 () Bool)

(declare-fun e!857311 () Bool)

(assert (=> b!1541407 (=> (not res!1057932) (not e!857311))))

(declare-datatypes ((array!102458 0))(
  ( (array!102459 (arr!49436 (Array (_ BitVec 32) (_ BitVec 64))) (size!49986 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102458)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102458 (_ BitVec 32)) Bool)

(assert (=> b!1541407 (= res!1057932 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1541408 () Bool)

(declare-fun res!1057933 () Bool)

(assert (=> b!1541408 (=> (not res!1057933) (not e!857311))))

(assert (=> b!1541408 (= res!1057933 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1541409 () Bool)

(declare-fun res!1057931 () Bool)

(assert (=> b!1541409 (=> (not res!1057931) (not e!857311))))

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1541409 (= res!1057931 (and (= (size!49986 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49986 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49986 a!3920))))))

(declare-fun res!1057930 () Bool)

(assert (=> start!131570 (=> (not res!1057930) (not e!857311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131570 (= res!1057930 (validMask!0 mask!4052))))

(assert (=> start!131570 e!857311))

(assert (=> start!131570 true))

(declare-fun array_inv!38464 (array!102458) Bool)

(assert (=> start!131570 (array_inv!38464 a!3920)))

(declare-fun b!1541410 () Bool)

(declare-fun res!1057929 () Bool)

(assert (=> b!1541410 (=> (not res!1057929) (not e!857311))))

(assert (=> b!1541410 (= res!1057929 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49986 a!3920))))))

(declare-fun b!1541411 () Bool)

(assert (=> b!1541411 (= e!857311 (bvsge (bvsub newFrom!293 (bvadd #b00000000000000000000000000000001 from!3298)) (bvsub newFrom!293 from!3298)))))

(assert (= (and start!131570 res!1057930) b!1541409))

(assert (= (and b!1541409 res!1057931) b!1541408))

(assert (= (and b!1541408 res!1057933) b!1541410))

(assert (= (and b!1541410 res!1057929) b!1541407))

(assert (= (and b!1541407 res!1057932) b!1541411))

(declare-fun m!1423413 () Bool)

(assert (=> b!1541407 m!1423413))

(declare-fun m!1423415 () Bool)

(assert (=> b!1541408 m!1423415))

(declare-fun m!1423417 () Bool)

(assert (=> start!131570 m!1423417))

(declare-fun m!1423419 () Bool)

(assert (=> start!131570 m!1423419))

(push 1)

(assert (not start!131570))

(assert (not b!1541407))

(assert (not b!1541408))

(check-sat)

(pop 1)

(push 1)

(check-sat)

