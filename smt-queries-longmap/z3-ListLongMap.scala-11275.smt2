; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131494 () Bool)

(assert start!131494)

(declare-fun res!1057690 () Bool)

(declare-fun e!857101 () Bool)

(assert (=> start!131494 (=> (not res!1057690) (not e!857101))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131494 (= res!1057690 (validMask!0 mask!4052))))

(assert (=> start!131494 e!857101))

(assert (=> start!131494 true))

(declare-datatypes ((array!102397 0))(
  ( (array!102398 (arr!49407 (Array (_ BitVec 32) (_ BitVec 64))) (size!49957 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102397)

(declare-fun array_inv!38435 (array!102397) Bool)

(assert (=> start!131494 (array_inv!38435 a!3920)))

(declare-fun b!1541143 () Bool)

(declare-fun res!1057689 () Bool)

(assert (=> b!1541143 (=> (not res!1057689) (not e!857101))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1541143 (= res!1057689 (and (= (size!49957 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49957 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49957 a!3920))))))

(declare-fun b!1541144 () Bool)

(assert (=> b!1541144 (= e!857101 false)))

(declare-fun lt!665593 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102397 (_ BitVec 32)) Bool)

(assert (=> b!1541144 (= lt!665593 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131494 res!1057690) b!1541143))

(assert (= (and b!1541143 res!1057689) b!1541144))

(declare-fun m!1423161 () Bool)

(assert (=> start!131494 m!1423161))

(declare-fun m!1423163 () Bool)

(assert (=> start!131494 m!1423163))

(declare-fun m!1423165 () Bool)

(assert (=> b!1541144 m!1423165))

(check-sat (not start!131494) (not b!1541144))
