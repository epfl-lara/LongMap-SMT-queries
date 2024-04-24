; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131916 () Bool)

(assert start!131916)

(declare-fun res!1058583 () Bool)

(declare-fun e!858639 () Bool)

(assert (=> start!131916 (=> (not res!1058583) (not e!858639))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131916 (= res!1058583 (validMask!0 mask!4052))))

(assert (=> start!131916 e!858639))

(assert (=> start!131916 true))

(declare-datatypes ((array!102527 0))(
  ( (array!102528 (arr!49465 (Array (_ BitVec 32) (_ BitVec 64))) (size!50016 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102527)

(declare-fun array_inv!38746 (array!102527) Bool)

(assert (=> start!131916 (array_inv!38746 a!3920)))

(declare-fun b!1543611 () Bool)

(declare-fun res!1058581 () Bool)

(assert (=> b!1543611 (=> (not res!1058581) (not e!858639))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1543611 (= res!1058581 (and (= (size!50016 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!50016 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!50016 a!3920))))))

(declare-fun b!1543612 () Bool)

(declare-fun res!1058582 () Bool)

(assert (=> b!1543612 (=> (not res!1058582) (not e!858639))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102527 (_ BitVec 32)) Bool)

(assert (=> b!1543612 (= res!1058582 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1543613 () Bool)

(assert (=> b!1543613 (= e!858639 (and (bvsge from!3298 newFrom!293) (bvslt newFrom!293 #b00000000000000000000000000000000)))))

(assert (= (and start!131916 res!1058583) b!1543611))

(assert (= (and b!1543611 res!1058581) b!1543612))

(assert (= (and b!1543612 res!1058582) b!1543613))

(declare-fun m!1425449 () Bool)

(assert (=> start!131916 m!1425449))

(declare-fun m!1425451 () Bool)

(assert (=> start!131916 m!1425451))

(declare-fun m!1425453 () Bool)

(assert (=> b!1543612 m!1425453))

(check-sat (not start!131916) (not b!1543612))
(check-sat)
