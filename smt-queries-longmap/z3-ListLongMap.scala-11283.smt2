; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131542 () Bool)

(assert start!131542)

(declare-fun res!1057852 () Bool)

(declare-fun e!857245 () Bool)

(assert (=> start!131542 (=> (not res!1057852) (not e!857245))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131542 (= res!1057852 (validMask!0 mask!4052))))

(assert (=> start!131542 e!857245))

(assert (=> start!131542 true))

(declare-datatypes ((array!102445 0))(
  ( (array!102446 (arr!49431 (Array (_ BitVec 32) (_ BitVec 64))) (size!49981 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102445)

(declare-fun array_inv!38459 (array!102445) Bool)

(assert (=> start!131542 (array_inv!38459 a!3920)))

(declare-fun b!1541305 () Bool)

(declare-fun res!1057851 () Bool)

(assert (=> b!1541305 (=> (not res!1057851) (not e!857245))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1541305 (= res!1057851 (and (= (size!49981 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49981 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49981 a!3920))))))

(declare-fun b!1541306 () Bool)

(assert (=> b!1541306 (= e!857245 false)))

(declare-fun lt!665647 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102445 (_ BitVec 32)) Bool)

(assert (=> b!1541306 (= lt!665647 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131542 res!1057852) b!1541305))

(assert (= (and b!1541305 res!1057851) b!1541306))

(declare-fun m!1423305 () Bool)

(assert (=> start!131542 m!1423305))

(declare-fun m!1423307 () Bool)

(assert (=> start!131542 m!1423307))

(declare-fun m!1423309 () Bool)

(assert (=> b!1541306 m!1423309))

(check-sat (not start!131542) (not b!1541306))
