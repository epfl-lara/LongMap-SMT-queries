; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131540 () Bool)

(assert start!131540)

(declare-fun res!1057846 () Bool)

(declare-fun e!857239 () Bool)

(assert (=> start!131540 (=> (not res!1057846) (not e!857239))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131540 (= res!1057846 (validMask!0 mask!4052))))

(assert (=> start!131540 e!857239))

(assert (=> start!131540 true))

(declare-datatypes ((array!102443 0))(
  ( (array!102444 (arr!49430 (Array (_ BitVec 32) (_ BitVec 64))) (size!49980 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102443)

(declare-fun array_inv!38458 (array!102443) Bool)

(assert (=> start!131540 (array_inv!38458 a!3920)))

(declare-fun b!1541299 () Bool)

(declare-fun res!1057845 () Bool)

(assert (=> b!1541299 (=> (not res!1057845) (not e!857239))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1541299 (= res!1057845 (and (= (size!49980 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49980 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49980 a!3920))))))

(declare-fun b!1541300 () Bool)

(assert (=> b!1541300 (= e!857239 false)))

(declare-fun lt!665644 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102443 (_ BitVec 32)) Bool)

(assert (=> b!1541300 (= lt!665644 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131540 res!1057846) b!1541299))

(assert (= (and b!1541299 res!1057845) b!1541300))

(declare-fun m!1423299 () Bool)

(assert (=> start!131540 m!1423299))

(declare-fun m!1423301 () Bool)

(assert (=> start!131540 m!1423301))

(declare-fun m!1423303 () Bool)

(assert (=> b!1541300 m!1423303))

(push 1)

(assert (not start!131540))

(assert (not b!1541300))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

