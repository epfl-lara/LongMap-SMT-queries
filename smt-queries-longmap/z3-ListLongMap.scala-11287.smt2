; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131584 () Bool)

(assert start!131584)

(declare-fun b!1541510 () Bool)

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-datatypes ((array!102472 0))(
  ( (array!102473 (arr!49443 (Array (_ BitVec 32) (_ BitVec 64))) (size!49993 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102472)

(declare-fun e!857352 () Bool)

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102472 (_ BitVec 32)) Bool)

(assert (=> b!1541510 (= e!857352 (not (arrayForallSeekEntryOrOpenFound!0 newFrom!293 a!3920 mask!4052)))))

(declare-fun b!1541509 () Bool)

(declare-fun res!1058032 () Bool)

(assert (=> b!1541509 (=> (not res!1058032) (not e!857352))))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1541509 (= res!1058032 (bvsge from!3298 newFrom!293))))

(declare-fun res!1058031 () Bool)

(assert (=> start!131584 (=> (not res!1058031) (not e!857352))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131584 (= res!1058031 (validMask!0 mask!4052))))

(assert (=> start!131584 e!857352))

(assert (=> start!131584 true))

(declare-fun array_inv!38471 (array!102472) Bool)

(assert (=> start!131584 (array_inv!38471 a!3920)))

(declare-fun b!1541507 () Bool)

(declare-fun res!1058030 () Bool)

(assert (=> b!1541507 (=> (not res!1058030) (not e!857352))))

(assert (=> b!1541507 (= res!1058030 (and (= (size!49993 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49993 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49993 a!3920))))))

(declare-fun b!1541508 () Bool)

(declare-fun res!1058029 () Bool)

(assert (=> b!1541508 (=> (not res!1058029) (not e!857352))))

(assert (=> b!1541508 (= res!1058029 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131584 res!1058031) b!1541507))

(assert (= (and b!1541507 res!1058030) b!1541508))

(assert (= (and b!1541508 res!1058029) b!1541509))

(assert (= (and b!1541509 res!1058032) b!1541510))

(declare-fun m!1423481 () Bool)

(assert (=> b!1541510 m!1423481))

(declare-fun m!1423483 () Bool)

(assert (=> start!131584 m!1423483))

(declare-fun m!1423485 () Bool)

(assert (=> start!131584 m!1423485))

(declare-fun m!1423487 () Bool)

(assert (=> b!1541508 m!1423487))

(check-sat (not b!1541510) (not b!1541508) (not start!131584))
(check-sat)
