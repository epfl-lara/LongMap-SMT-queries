; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131498 () Bool)

(assert start!131498)

(declare-fun res!1057702 () Bool)

(declare-fun e!857113 () Bool)

(assert (=> start!131498 (=> (not res!1057702) (not e!857113))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131498 (= res!1057702 (validMask!0 mask!4052))))

(assert (=> start!131498 e!857113))

(assert (=> start!131498 true))

(declare-datatypes ((array!102401 0))(
  ( (array!102402 (arr!49409 (Array (_ BitVec 32) (_ BitVec 64))) (size!49959 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102401)

(declare-fun array_inv!38437 (array!102401) Bool)

(assert (=> start!131498 (array_inv!38437 a!3920)))

(declare-fun b!1541155 () Bool)

(declare-fun res!1057701 () Bool)

(assert (=> b!1541155 (=> (not res!1057701) (not e!857113))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1541155 (= res!1057701 (and (= (size!49959 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49959 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49959 a!3920))))))

(declare-fun b!1541156 () Bool)

(assert (=> b!1541156 (= e!857113 false)))

(declare-fun lt!665599 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102401 (_ BitVec 32)) Bool)

(assert (=> b!1541156 (= lt!665599 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131498 res!1057702) b!1541155))

(assert (= (and b!1541155 res!1057701) b!1541156))

(declare-fun m!1423173 () Bool)

(assert (=> start!131498 m!1423173))

(declare-fun m!1423175 () Bool)

(assert (=> start!131498 m!1423175))

(declare-fun m!1423177 () Bool)

(assert (=> b!1541156 m!1423177))

(push 1)

(assert (not start!131498))

(assert (not b!1541156))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

