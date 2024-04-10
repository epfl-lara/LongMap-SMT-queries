; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131502 () Bool)

(assert start!131502)

(declare-fun res!1057713 () Bool)

(declare-fun e!857125 () Bool)

(assert (=> start!131502 (=> (not res!1057713) (not e!857125))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131502 (= res!1057713 (validMask!0 mask!4052))))

(assert (=> start!131502 e!857125))

(assert (=> start!131502 true))

(declare-datatypes ((array!102405 0))(
  ( (array!102406 (arr!49411 (Array (_ BitVec 32) (_ BitVec 64))) (size!49961 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102405)

(declare-fun array_inv!38439 (array!102405) Bool)

(assert (=> start!131502 (array_inv!38439 a!3920)))

(declare-fun b!1541167 () Bool)

(declare-fun res!1057714 () Bool)

(assert (=> b!1541167 (=> (not res!1057714) (not e!857125))))

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1541167 (= res!1057714 (and (= (size!49961 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49961 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49961 a!3920))))))

(declare-fun b!1541168 () Bool)

(assert (=> b!1541168 (= e!857125 false)))

(declare-fun lt!665605 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102405 (_ BitVec 32)) Bool)

(assert (=> b!1541168 (= lt!665605 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131502 res!1057713) b!1541167))

(assert (= (and b!1541167 res!1057714) b!1541168))

(declare-fun m!1423185 () Bool)

(assert (=> start!131502 m!1423185))

(declare-fun m!1423187 () Bool)

(assert (=> start!131502 m!1423187))

(declare-fun m!1423189 () Bool)

(assert (=> b!1541168 m!1423189))

(push 1)

(assert (not start!131502))

(assert (not b!1541168))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

