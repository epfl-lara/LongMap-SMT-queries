; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131982 () Bool)

(assert start!131982)

(declare-fun b!1543843 () Bool)

(declare-fun e!858819 () Bool)

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1543843 (= e!858819 (bvsge (bvsub newFrom!293 (bvadd #b00000000000000000000000000000001 from!3298)) (bvsub newFrom!293 from!3298)))))

(declare-fun res!1058790 () Bool)

(assert (=> start!131982 (=> (not res!1058790) (not e!858819))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131982 (= res!1058790 (validMask!0 mask!4052))))

(assert (=> start!131982 e!858819))

(assert (=> start!131982 true))

(declare-datatypes ((array!102578 0))(
  ( (array!102579 (arr!49489 (Array (_ BitVec 32) (_ BitVec 64))) (size!50040 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102578)

(declare-fun array_inv!38770 (array!102578) Bool)

(assert (=> start!131982 (array_inv!38770 a!3920)))

(declare-fun b!1543844 () Bool)

(declare-fun res!1058792 () Bool)

(assert (=> b!1543844 (=> (not res!1058792) (not e!858819))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102578 (_ BitVec 32)) Bool)

(assert (=> b!1543844 (= res!1058792 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1543845 () Bool)

(declare-fun res!1058789 () Bool)

(assert (=> b!1543845 (=> (not res!1058789) (not e!858819))))

(assert (=> b!1543845 (= res!1058789 (and (= (size!50040 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!50040 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!50040 a!3920))))))

(declare-fun b!1543846 () Bool)

(declare-fun res!1058793 () Bool)

(assert (=> b!1543846 (=> (not res!1058793) (not e!858819))))

(assert (=> b!1543846 (= res!1058793 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!50040 a!3920))))))

(declare-fun b!1543847 () Bool)

(declare-fun res!1058791 () Bool)

(assert (=> b!1543847 (=> (not res!1058791) (not e!858819))))

(assert (=> b!1543847 (= res!1058791 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131982 res!1058790) b!1543845))

(assert (= (and b!1543845 res!1058789) b!1543847))

(assert (= (and b!1543847 res!1058791) b!1543846))

(assert (= (and b!1543846 res!1058793) b!1543844))

(assert (= (and b!1543844 res!1058792) b!1543843))

(declare-fun m!1425671 () Bool)

(assert (=> start!131982 m!1425671))

(declare-fun m!1425673 () Bool)

(assert (=> start!131982 m!1425673))

(declare-fun m!1425675 () Bool)

(assert (=> b!1543844 m!1425675))

(declare-fun m!1425677 () Bool)

(assert (=> b!1543847 m!1425677))

(check-sat (not b!1543847) (not start!131982) (not b!1543844))
(check-sat)
