; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131512 () Bool)

(assert start!131512)

(declare-fun res!1057752 () Bool)

(declare-fun e!857154 () Bool)

(assert (=> start!131512 (=> (not res!1057752) (not e!857154))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131512 (= res!1057752 (validMask!0 mask!4052))))

(assert (=> start!131512 e!857154))

(assert (=> start!131512 true))

(declare-datatypes ((array!102415 0))(
  ( (array!102416 (arr!49416 (Array (_ BitVec 32) (_ BitVec 64))) (size!49966 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102415)

(declare-fun array_inv!38444 (array!102415) Bool)

(assert (=> start!131512 (array_inv!38444 a!3920)))

(declare-fun b!1541206 () Bool)

(declare-fun res!1057753 () Bool)

(assert (=> b!1541206 (=> (not res!1057753) (not e!857154))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1541206 (= res!1057753 (and (= (size!49966 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49966 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49966 a!3920))))))

(declare-fun b!1541207 () Bool)

(assert (=> b!1541207 (= e!857154 false)))

(declare-fun lt!665611 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102415 (_ BitVec 32)) Bool)

(assert (=> b!1541207 (= lt!665611 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131512 res!1057752) b!1541206))

(assert (= (and b!1541206 res!1057753) b!1541207))

(declare-fun m!1423215 () Bool)

(assert (=> start!131512 m!1423215))

(declare-fun m!1423217 () Bool)

(assert (=> start!131512 m!1423217))

(declare-fun m!1423219 () Bool)

(assert (=> b!1541207 m!1423219))

(check-sat (not start!131512) (not b!1541207))
