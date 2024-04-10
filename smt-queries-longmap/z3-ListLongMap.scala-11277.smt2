; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131506 () Bool)

(assert start!131506)

(declare-fun res!1057731 () Bool)

(declare-fun e!857137 () Bool)

(assert (=> start!131506 (=> (not res!1057731) (not e!857137))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131506 (= res!1057731 (validMask!0 mask!4052))))

(assert (=> start!131506 e!857137))

(assert (=> start!131506 true))

(declare-datatypes ((array!102409 0))(
  ( (array!102410 (arr!49413 (Array (_ BitVec 32) (_ BitVec 64))) (size!49963 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102409)

(declare-fun array_inv!38441 (array!102409) Bool)

(assert (=> start!131506 (array_inv!38441 a!3920)))

(declare-fun b!1541184 () Bool)

(declare-fun res!1057732 () Bool)

(assert (=> b!1541184 (=> (not res!1057732) (not e!857137))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1541184 (= res!1057732 (and (= (size!49963 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49963 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49963 a!3920))))))

(declare-fun b!1541185 () Bool)

(declare-fun res!1057730 () Bool)

(assert (=> b!1541185 (=> (not res!1057730) (not e!857137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102409 (_ BitVec 32)) Bool)

(assert (=> b!1541185 (= res!1057730 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1541186 () Bool)

(assert (=> b!1541186 (= e!857137 (and (bvsge from!3298 newFrom!293) (bvslt newFrom!293 #b00000000000000000000000000000000)))))

(assert (= (and start!131506 res!1057731) b!1541184))

(assert (= (and b!1541184 res!1057732) b!1541185))

(assert (= (and b!1541185 res!1057730) b!1541186))

(declare-fun m!1423197 () Bool)

(assert (=> start!131506 m!1423197))

(declare-fun m!1423199 () Bool)

(assert (=> start!131506 m!1423199))

(declare-fun m!1423201 () Bool)

(assert (=> b!1541185 m!1423201))

(check-sat (not b!1541185) (not start!131506))
(check-sat)
