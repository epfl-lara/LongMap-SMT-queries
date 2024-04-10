; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131524 () Bool)

(assert start!131524)

(declare-fun res!1057789 () Bool)

(declare-fun e!857190 () Bool)

(assert (=> start!131524 (=> (not res!1057789) (not e!857190))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131524 (= res!1057789 (validMask!0 mask!4052))))

(assert (=> start!131524 e!857190))

(assert (=> start!131524 true))

(declare-datatypes ((array!102427 0))(
  ( (array!102428 (arr!49422 (Array (_ BitVec 32) (_ BitVec 64))) (size!49972 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102427)

(declare-fun array_inv!38450 (array!102427) Bool)

(assert (=> start!131524 (array_inv!38450 a!3920)))

(declare-fun b!1541242 () Bool)

(declare-fun res!1057788 () Bool)

(assert (=> b!1541242 (=> (not res!1057788) (not e!857190))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1541242 (= res!1057788 (and (= (size!49972 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49972 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49972 a!3920))))))

(declare-fun b!1541243 () Bool)

(assert (=> b!1541243 (= e!857190 false)))

(declare-fun lt!665629 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102427 (_ BitVec 32)) Bool)

(assert (=> b!1541243 (= lt!665629 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131524 res!1057789) b!1541242))

(assert (= (and b!1541242 res!1057788) b!1541243))

(declare-fun m!1423251 () Bool)

(assert (=> start!131524 m!1423251))

(declare-fun m!1423253 () Bool)

(assert (=> start!131524 m!1423253))

(declare-fun m!1423255 () Bool)

(assert (=> b!1541243 m!1423255))

(check-sat (not b!1541243) (not start!131524))
