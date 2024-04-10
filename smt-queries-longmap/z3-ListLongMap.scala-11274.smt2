; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131488 () Bool)

(assert start!131488)

(declare-fun b!1541113 () Bool)

(declare-fun res!1057661 () Bool)

(declare-fun e!857083 () Bool)

(assert (=> b!1541113 (=> (not res!1057661) (not e!857083))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-datatypes ((array!102391 0))(
  ( (array!102392 (arr!49404 (Array (_ BitVec 32) (_ BitVec 64))) (size!49954 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102391)

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1541113 (= res!1057661 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49954 a!3920))))))

(declare-fun res!1057662 () Bool)

(assert (=> start!131488 (=> (not res!1057662) (not e!857083))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131488 (= res!1057662 (validMask!0 mask!4052))))

(assert (=> start!131488 e!857083))

(assert (=> start!131488 true))

(declare-fun array_inv!38432 (array!102391) Bool)

(assert (=> start!131488 (array_inv!38432 a!3920)))

(declare-fun b!1541114 () Bool)

(declare-fun res!1057660 () Bool)

(assert (=> b!1541114 (=> (not res!1057660) (not e!857083))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102391 (_ BitVec 32)) Bool)

(assert (=> b!1541114 (= res!1057660 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1541115 () Bool)

(declare-fun res!1057659 () Bool)

(assert (=> b!1541115 (=> (not res!1057659) (not e!857083))))

(assert (=> b!1541115 (= res!1057659 (and (= (size!49954 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49954 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49954 a!3920))))))

(declare-fun b!1541116 () Bool)

(declare-fun res!1057663 () Bool)

(assert (=> b!1541116 (=> (not res!1057663) (not e!857083))))

(assert (=> b!1541116 (= res!1057663 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1541117 () Bool)

(assert (=> b!1541117 (= e!857083 (not true))))

(assert (=> b!1541117 (arrayForallSeekEntryOrOpenFound!0 newFrom!293 a!3920 mask!4052)))

(declare-datatypes ((Unit!51470 0))(
  ( (Unit!51471) )
))
(declare-fun lt!665584 () Unit!51470)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!102391 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51470)

(assert (=> b!1541117 (= lt!665584 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3920 mask!4052 (bvadd #b00000000000000000000000000000001 from!3298) newFrom!293))))

(assert (= (and start!131488 res!1057662) b!1541115))

(assert (= (and b!1541115 res!1057659) b!1541116))

(assert (= (and b!1541116 res!1057663) b!1541113))

(assert (= (and b!1541113 res!1057661) b!1541114))

(assert (= (and b!1541114 res!1057660) b!1541117))

(declare-fun m!1423131 () Bool)

(assert (=> start!131488 m!1423131))

(declare-fun m!1423133 () Bool)

(assert (=> start!131488 m!1423133))

(declare-fun m!1423135 () Bool)

(assert (=> b!1541114 m!1423135))

(declare-fun m!1423137 () Bool)

(assert (=> b!1541116 m!1423137))

(declare-fun m!1423139 () Bool)

(assert (=> b!1541117 m!1423139))

(declare-fun m!1423141 () Bool)

(assert (=> b!1541117 m!1423141))

(check-sat (not b!1541114) (not start!131488) (not b!1541116) (not b!1541117))
