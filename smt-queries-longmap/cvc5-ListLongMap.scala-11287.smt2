; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131998 () Bool)

(assert start!131998)

(declare-fun b!1543956 () Bool)

(declare-fun res!1058903 () Bool)

(declare-fun e!858868 () Bool)

(assert (=> b!1543956 (=> (not res!1058903) (not e!858868))))

(declare-datatypes ((array!102594 0))(
  ( (array!102595 (arr!49497 (Array (_ BitVec 32) (_ BitVec 64))) (size!50048 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102594)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102594 (_ BitVec 32)) Bool)

(assert (=> b!1543956 (= res!1058903 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun b!1543958 () Bool)

(assert (=> b!1543958 (= e!858868 (not (arrayForallSeekEntryOrOpenFound!0 newFrom!293 a!3920 mask!4052)))))

(declare-fun b!1543955 () Bool)

(declare-fun res!1058901 () Bool)

(assert (=> b!1543955 (=> (not res!1058901) (not e!858868))))

(assert (=> b!1543955 (= res!1058901 (and (= (size!50048 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!50048 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!50048 a!3920))))))

(declare-fun b!1543957 () Bool)

(declare-fun res!1058904 () Bool)

(assert (=> b!1543957 (=> (not res!1058904) (not e!858868))))

(assert (=> b!1543957 (= res!1058904 (bvsge from!3298 newFrom!293))))

(declare-fun res!1058902 () Bool)

(assert (=> start!131998 (=> (not res!1058902) (not e!858868))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131998 (= res!1058902 (validMask!0 mask!4052))))

(assert (=> start!131998 e!858868))

(assert (=> start!131998 true))

(declare-fun array_inv!38778 (array!102594) Bool)

(assert (=> start!131998 (array_inv!38778 a!3920)))

(assert (= (and start!131998 res!1058902) b!1543955))

(assert (= (and b!1543955 res!1058901) b!1543956))

(assert (= (and b!1543956 res!1058903) b!1543957))

(assert (= (and b!1543957 res!1058904) b!1543958))

(declare-fun m!1425747 () Bool)

(assert (=> b!1543956 m!1425747))

(declare-fun m!1425749 () Bool)

(assert (=> b!1543958 m!1425749))

(declare-fun m!1425751 () Bool)

(assert (=> start!131998 m!1425751))

(declare-fun m!1425753 () Bool)

(assert (=> start!131998 m!1425753))

(push 1)

(assert (not b!1543956))

(assert (not b!1543958))

(assert (not start!131998))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

