; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131492 () Bool)

(assert start!131492)

(declare-fun res!1057684 () Bool)

(declare-fun e!857094 () Bool)

(assert (=> start!131492 (=> (not res!1057684) (not e!857094))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131492 (= res!1057684 (validMask!0 mask!4052))))

(assert (=> start!131492 e!857094))

(assert (=> start!131492 true))

(declare-datatypes ((array!102395 0))(
  ( (array!102396 (arr!49406 (Array (_ BitVec 32) (_ BitVec 64))) (size!49956 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102395)

(declare-fun array_inv!38434 (array!102395) Bool)

(assert (=> start!131492 (array_inv!38434 a!3920)))

(declare-fun b!1541137 () Bool)

(declare-fun res!1057683 () Bool)

(assert (=> b!1541137 (=> (not res!1057683) (not e!857094))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1541137 (= res!1057683 (and (= (size!49956 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49956 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49956 a!3920))))))

(declare-fun b!1541138 () Bool)

(assert (=> b!1541138 (= e!857094 false)))

(declare-fun lt!665590 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102395 (_ BitVec 32)) Bool)

(assert (=> b!1541138 (= lt!665590 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131492 res!1057684) b!1541137))

(assert (= (and b!1541137 res!1057683) b!1541138))

(declare-fun m!1423155 () Bool)

(assert (=> start!131492 m!1423155))

(declare-fun m!1423157 () Bool)

(assert (=> start!131492 m!1423157))

(declare-fun m!1423159 () Bool)

(assert (=> b!1541138 m!1423159))

(push 1)

(assert (not b!1541138))

(assert (not start!131492))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

