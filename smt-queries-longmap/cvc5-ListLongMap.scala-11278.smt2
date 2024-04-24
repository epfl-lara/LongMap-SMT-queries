; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131926 () Bool)

(assert start!131926)

(declare-fun res!1058618 () Bool)

(declare-fun e!858670 () Bool)

(assert (=> start!131926 (=> (not res!1058618) (not e!858670))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131926 (= res!1058618 (validMask!0 mask!4052))))

(assert (=> start!131926 e!858670))

(assert (=> start!131926 true))

(declare-datatypes ((array!102537 0))(
  ( (array!102538 (arr!49470 (Array (_ BitVec 32) (_ BitVec 64))) (size!50021 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102537)

(declare-fun array_inv!38751 (array!102537) Bool)

(assert (=> start!131926 (array_inv!38751 a!3920)))

(declare-fun b!1543648 () Bool)

(declare-fun res!1058619 () Bool)

(assert (=> b!1543648 (=> (not res!1058619) (not e!858670))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1543648 (= res!1058619 (and (= (size!50021 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!50021 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!50021 a!3920))))))

(declare-fun b!1543649 () Bool)

(assert (=> b!1543649 (= e!858670 false)))

(declare-fun lt!666522 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102537 (_ BitVec 32)) Bool)

(assert (=> b!1543649 (= lt!666522 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131926 res!1058618) b!1543648))

(assert (= (and b!1543648 res!1058619) b!1543649))

(declare-fun m!1425479 () Bool)

(assert (=> start!131926 m!1425479))

(declare-fun m!1425481 () Bool)

(assert (=> start!131926 m!1425481))

(declare-fun m!1425483 () Bool)

(assert (=> b!1543649 m!1425483))

(push 1)

(assert (not b!1543649))

(assert (not start!131926))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

