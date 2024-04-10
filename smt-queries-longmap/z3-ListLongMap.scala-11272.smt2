; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131476 () Bool)

(assert start!131476)

(declare-fun b!1541023 () Bool)

(declare-fun e!857047 () Bool)

(assert (=> b!1541023 (= e!857047 (not true))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-datatypes ((array!102379 0))(
  ( (array!102380 (arr!49398 (Array (_ BitVec 32) (_ BitVec 64))) (size!49948 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102379)

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102379 (_ BitVec 32)) Bool)

(assert (=> b!1541023 (arrayForallSeekEntryOrOpenFound!0 newFrom!293 a!3920 mask!4052)))

(declare-datatypes ((Unit!51458 0))(
  ( (Unit!51459) )
))
(declare-fun lt!665566 () Unit!51458)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!102379 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51458)

(assert (=> b!1541023 (= lt!665566 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3920 mask!4052 (bvadd #b00000000000000000000000000000001 from!3298) newFrom!293))))

(declare-fun b!1541025 () Bool)

(declare-fun res!1057570 () Bool)

(assert (=> b!1541025 (=> (not res!1057570) (not e!857047))))

(assert (=> b!1541025 (= res!1057570 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49948 a!3920))))))

(declare-fun b!1541026 () Bool)

(declare-fun res!1057571 () Bool)

(assert (=> b!1541026 (=> (not res!1057571) (not e!857047))))

(assert (=> b!1541026 (= res!1057571 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1541027 () Bool)

(declare-fun res!1057569 () Bool)

(assert (=> b!1541027 (=> (not res!1057569) (not e!857047))))

(assert (=> b!1541027 (= res!1057569 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1541024 () Bool)

(declare-fun res!1057572 () Bool)

(assert (=> b!1541024 (=> (not res!1057572) (not e!857047))))

(assert (=> b!1541024 (= res!1057572 (and (= (size!49948 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49948 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49948 a!3920))))))

(declare-fun res!1057573 () Bool)

(assert (=> start!131476 (=> (not res!1057573) (not e!857047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131476 (= res!1057573 (validMask!0 mask!4052))))

(assert (=> start!131476 e!857047))

(assert (=> start!131476 true))

(declare-fun array_inv!38426 (array!102379) Bool)

(assert (=> start!131476 (array_inv!38426 a!3920)))

(assert (= (and start!131476 res!1057573) b!1541024))

(assert (= (and b!1541024 res!1057572) b!1541027))

(assert (= (and b!1541027 res!1057569) b!1541025))

(assert (= (and b!1541025 res!1057570) b!1541026))

(assert (= (and b!1541026 res!1057571) b!1541023))

(declare-fun m!1423059 () Bool)

(assert (=> b!1541023 m!1423059))

(declare-fun m!1423061 () Bool)

(assert (=> b!1541023 m!1423061))

(declare-fun m!1423063 () Bool)

(assert (=> b!1541026 m!1423063))

(declare-fun m!1423065 () Bool)

(assert (=> b!1541027 m!1423065))

(declare-fun m!1423067 () Bool)

(assert (=> start!131476 m!1423067))

(declare-fun m!1423069 () Bool)

(assert (=> start!131476 m!1423069))

(check-sat (not b!1541027) (not b!1541023) (not start!131476) (not b!1541026))
