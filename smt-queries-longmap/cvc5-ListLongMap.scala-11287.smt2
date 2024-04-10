; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131582 () Bool)

(assert start!131582)

(declare-fun b!1541498 () Bool)

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-datatypes ((array!102470 0))(
  ( (array!102471 (arr!49442 (Array (_ BitVec 32) (_ BitVec 64))) (size!49992 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102470)

(declare-fun e!857347 () Bool)

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102470 (_ BitVec 32)) Bool)

(assert (=> b!1541498 (= e!857347 (not (arrayForallSeekEntryOrOpenFound!0 newFrom!293 a!3920 mask!4052)))))

(declare-fun res!1058017 () Bool)

(assert (=> start!131582 (=> (not res!1058017) (not e!857347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131582 (= res!1058017 (validMask!0 mask!4052))))

(assert (=> start!131582 e!857347))

(assert (=> start!131582 true))

(declare-fun array_inv!38470 (array!102470) Bool)

(assert (=> start!131582 (array_inv!38470 a!3920)))

(declare-fun b!1541495 () Bool)

(declare-fun res!1058020 () Bool)

(assert (=> b!1541495 (=> (not res!1058020) (not e!857347))))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1541495 (= res!1058020 (and (= (size!49992 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49992 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49992 a!3920))))))

(declare-fun b!1541497 () Bool)

(declare-fun res!1058018 () Bool)

(assert (=> b!1541497 (=> (not res!1058018) (not e!857347))))

(assert (=> b!1541497 (= res!1058018 (bvsge from!3298 newFrom!293))))

(declare-fun b!1541496 () Bool)

(declare-fun res!1058019 () Bool)

(assert (=> b!1541496 (=> (not res!1058019) (not e!857347))))

(assert (=> b!1541496 (= res!1058019 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131582 res!1058017) b!1541495))

(assert (= (and b!1541495 res!1058020) b!1541496))

(assert (= (and b!1541496 res!1058019) b!1541497))

(assert (= (and b!1541497 res!1058018) b!1541498))

(declare-fun m!1423473 () Bool)

(assert (=> b!1541498 m!1423473))

(declare-fun m!1423475 () Bool)

(assert (=> start!131582 m!1423475))

(declare-fun m!1423477 () Bool)

(assert (=> start!131582 m!1423477))

(declare-fun m!1423479 () Bool)

(assert (=> b!1541496 m!1423479))

(push 1)

(assert (not start!131582))

(assert (not b!1541498))

(assert (not b!1541496))

(check-sat)

(pop 1)

(push 1)

(check-sat)

