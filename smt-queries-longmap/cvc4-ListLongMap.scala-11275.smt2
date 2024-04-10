; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131496 () Bool)

(assert start!131496)

(declare-fun res!1057695 () Bool)

(declare-fun e!857106 () Bool)

(assert (=> start!131496 (=> (not res!1057695) (not e!857106))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131496 (= res!1057695 (validMask!0 mask!4052))))

(assert (=> start!131496 e!857106))

(assert (=> start!131496 true))

(declare-datatypes ((array!102399 0))(
  ( (array!102400 (arr!49408 (Array (_ BitVec 32) (_ BitVec 64))) (size!49958 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102399)

(declare-fun array_inv!38436 (array!102399) Bool)

(assert (=> start!131496 (array_inv!38436 a!3920)))

(declare-fun b!1541149 () Bool)

(declare-fun res!1057696 () Bool)

(assert (=> b!1541149 (=> (not res!1057696) (not e!857106))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1541149 (= res!1057696 (and (= (size!49958 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49958 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49958 a!3920))))))

(declare-fun b!1541150 () Bool)

(assert (=> b!1541150 (= e!857106 false)))

(declare-fun lt!665596 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102399 (_ BitVec 32)) Bool)

(assert (=> b!1541150 (= lt!665596 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131496 res!1057695) b!1541149))

(assert (= (and b!1541149 res!1057696) b!1541150))

(declare-fun m!1423167 () Bool)

(assert (=> start!131496 m!1423167))

(declare-fun m!1423169 () Bool)

(assert (=> start!131496 m!1423169))

(declare-fun m!1423171 () Bool)

(assert (=> b!1541150 m!1423171))

(push 1)

(assert (not start!131496))

(assert (not b!1541150))

(check-sat)

(pop 1)

(push 1)

(check-sat)

