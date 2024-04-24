; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131932 () Bool)

(assert start!131932)

(declare-fun res!1058636 () Bool)

(declare-fun e!858687 () Bool)

(assert (=> start!131932 (=> (not res!1058636) (not e!858687))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131932 (= res!1058636 (validMask!0 mask!4052))))

(assert (=> start!131932 e!858687))

(assert (=> start!131932 true))

(declare-datatypes ((array!102543 0))(
  ( (array!102544 (arr!49473 (Array (_ BitVec 32) (_ BitVec 64))) (size!50024 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102543)

(declare-fun array_inv!38754 (array!102543) Bool)

(assert (=> start!131932 (array_inv!38754 a!3920)))

(declare-fun b!1543666 () Bool)

(declare-fun res!1058637 () Bool)

(assert (=> b!1543666 (=> (not res!1058637) (not e!858687))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1543666 (= res!1058637 (and (= (size!50024 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!50024 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!50024 a!3920))))))

(declare-fun b!1543667 () Bool)

(assert (=> b!1543667 (= e!858687 false)))

(declare-fun lt!666531 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102543 (_ BitVec 32)) Bool)

(assert (=> b!1543667 (= lt!666531 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131932 res!1058636) b!1543666))

(assert (= (and b!1543666 res!1058637) b!1543667))

(declare-fun m!1425497 () Bool)

(assert (=> start!131932 m!1425497))

(declare-fun m!1425499 () Bool)

(assert (=> start!131932 m!1425499))

(declare-fun m!1425501 () Bool)

(assert (=> b!1543667 m!1425501))

(push 1)

(assert (not b!1543667))

(assert (not start!131932))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

