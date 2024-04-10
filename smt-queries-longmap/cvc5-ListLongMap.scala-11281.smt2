; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131528 () Bool)

(assert start!131528)

(declare-fun res!1057801 () Bool)

(declare-fun e!857202 () Bool)

(assert (=> start!131528 (=> (not res!1057801) (not e!857202))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131528 (= res!1057801 (validMask!0 mask!4052))))

(assert (=> start!131528 e!857202))

(assert (=> start!131528 true))

(declare-datatypes ((array!102431 0))(
  ( (array!102432 (arr!49424 (Array (_ BitVec 32) (_ BitVec 64))) (size!49974 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102431)

(declare-fun array_inv!38452 (array!102431) Bool)

(assert (=> start!131528 (array_inv!38452 a!3920)))

(declare-fun b!1541254 () Bool)

(declare-fun res!1057800 () Bool)

(assert (=> b!1541254 (=> (not res!1057800) (not e!857202))))

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1541254 (= res!1057800 (and (= (size!49974 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49974 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49974 a!3920))))))

(declare-fun b!1541255 () Bool)

(assert (=> b!1541255 (= e!857202 false)))

(declare-fun lt!665635 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102431 (_ BitVec 32)) Bool)

(assert (=> b!1541255 (= lt!665635 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131528 res!1057801) b!1541254))

(assert (= (and b!1541254 res!1057800) b!1541255))

(declare-fun m!1423263 () Bool)

(assert (=> start!131528 m!1423263))

(declare-fun m!1423265 () Bool)

(assert (=> start!131528 m!1423265))

(declare-fun m!1423267 () Bool)

(assert (=> b!1541255 m!1423267))

(push 1)

(assert (not start!131528))

(assert (not b!1541255))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

