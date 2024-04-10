; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131518 () Bool)

(assert start!131518)

(declare-fun res!1057770 () Bool)

(declare-fun e!857172 () Bool)

(assert (=> start!131518 (=> (not res!1057770) (not e!857172))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131518 (= res!1057770 (validMask!0 mask!4052))))

(assert (=> start!131518 e!857172))

(assert (=> start!131518 true))

(declare-datatypes ((array!102421 0))(
  ( (array!102422 (arr!49419 (Array (_ BitVec 32) (_ BitVec 64))) (size!49969 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102421)

(declare-fun array_inv!38447 (array!102421) Bool)

(assert (=> start!131518 (array_inv!38447 a!3920)))

(declare-fun b!1541224 () Bool)

(declare-fun res!1057771 () Bool)

(assert (=> b!1541224 (=> (not res!1057771) (not e!857172))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1541224 (= res!1057771 (and (= (size!49969 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49969 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49969 a!3920))))))

(declare-fun b!1541225 () Bool)

(assert (=> b!1541225 (= e!857172 false)))

(declare-fun lt!665620 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102421 (_ BitVec 32)) Bool)

(assert (=> b!1541225 (= lt!665620 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131518 res!1057770) b!1541224))

(assert (= (and b!1541224 res!1057771) b!1541225))

(declare-fun m!1423233 () Bool)

(assert (=> start!131518 m!1423233))

(declare-fun m!1423235 () Bool)

(assert (=> start!131518 m!1423235))

(declare-fun m!1423237 () Bool)

(assert (=> b!1541225 m!1423237))

(check-sat (not start!131518) (not b!1541225))
