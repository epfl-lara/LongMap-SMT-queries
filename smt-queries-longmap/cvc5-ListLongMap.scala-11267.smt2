; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131444 () Bool)

(assert start!131444)

(declare-fun b!1540818 () Bool)

(declare-fun res!1057364 () Bool)

(declare-fun e!856950 () Bool)

(assert (=> b!1540818 (=> (not res!1057364) (not e!856950))))

(declare-datatypes ((array!102347 0))(
  ( (array!102348 (arr!49382 (Array (_ BitVec 32) (_ BitVec 64))) (size!49932 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102347)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102347 (_ BitVec 32)) Bool)

(assert (=> b!1540818 (= res!1057364 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1540819 () Bool)

(declare-fun res!1057366 () Bool)

(assert (=> b!1540819 (=> (not res!1057366) (not e!856950))))

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1540819 (= res!1057366 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49932 a!3920))))))

(declare-fun res!1057365 () Bool)

(assert (=> start!131444 (=> (not res!1057365) (not e!856950))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131444 (= res!1057365 (validMask!0 mask!4052))))

(assert (=> start!131444 e!856950))

(assert (=> start!131444 true))

(declare-fun array_inv!38410 (array!102347) Bool)

(assert (=> start!131444 (array_inv!38410 a!3920)))

(declare-fun b!1540817 () Bool)

(declare-fun res!1057363 () Bool)

(assert (=> b!1540817 (=> (not res!1057363) (not e!856950))))

(assert (=> b!1540817 (= res!1057363 (and (= (size!49932 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49932 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49932 a!3920))))))

(declare-fun b!1540820 () Bool)

(assert (=> b!1540820 (= e!856950 false)))

(declare-fun lt!665518 () Bool)

(assert (=> b!1540820 (= lt!665518 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(assert (= (and start!131444 res!1057365) b!1540817))

(assert (= (and b!1540817 res!1057363) b!1540818))

(assert (= (and b!1540818 res!1057364) b!1540819))

(assert (= (and b!1540819 res!1057366) b!1540820))

(declare-fun m!1422915 () Bool)

(assert (=> b!1540818 m!1422915))

(declare-fun m!1422917 () Bool)

(assert (=> start!131444 m!1422917))

(declare-fun m!1422919 () Bool)

(assert (=> start!131444 m!1422919))

(declare-fun m!1422921 () Bool)

(assert (=> b!1540820 m!1422921))

(push 1)

(assert (not b!1540818))

(assert (not b!1540820))

(assert (not start!131444))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

