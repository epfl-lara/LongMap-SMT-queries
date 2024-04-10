; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131586 () Bool)

(assert start!131586)

(declare-fun b!1541519 () Bool)

(declare-fun res!1058041 () Bool)

(declare-fun e!857359 () Bool)

(assert (=> b!1541519 (=> (not res!1058041) (not e!857359))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-datatypes ((array!102474 0))(
  ( (array!102475 (arr!49444 (Array (_ BitVec 32) (_ BitVec 64))) (size!49994 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102474)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun mask!4052 () (_ BitVec 32))

(assert (=> b!1541519 (= res!1058041 (and (= (size!49994 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49994 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49994 a!3920))))))

(declare-fun b!1541521 () Bool)

(declare-fun res!1058044 () Bool)

(assert (=> b!1541521 (=> (not res!1058044) (not e!857359))))

(assert (=> b!1541521 (= res!1058044 (bvsge from!3298 newFrom!293))))

(declare-fun b!1541520 () Bool)

(declare-fun res!1058042 () Bool)

(assert (=> b!1541520 (=> (not res!1058042) (not e!857359))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102474 (_ BitVec 32)) Bool)

(assert (=> b!1541520 (= res!1058042 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun res!1058043 () Bool)

(assert (=> start!131586 (=> (not res!1058043) (not e!857359))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131586 (= res!1058043 (validMask!0 mask!4052))))

(assert (=> start!131586 e!857359))

(assert (=> start!131586 true))

(declare-fun array_inv!38472 (array!102474) Bool)

(assert (=> start!131586 (array_inv!38472 a!3920)))

(declare-fun b!1541522 () Bool)

(assert (=> b!1541522 (= e!857359 (not (arrayForallSeekEntryOrOpenFound!0 newFrom!293 a!3920 mask!4052)))))

(assert (= (and start!131586 res!1058043) b!1541519))

(assert (= (and b!1541519 res!1058041) b!1541520))

(assert (= (and b!1541520 res!1058042) b!1541521))

(assert (= (and b!1541521 res!1058044) b!1541522))

(declare-fun m!1423489 () Bool)

(assert (=> b!1541520 m!1423489))

(declare-fun m!1423491 () Bool)

(assert (=> start!131586 m!1423491))

(declare-fun m!1423493 () Bool)

(assert (=> start!131586 m!1423493))

(declare-fun m!1423495 () Bool)

(assert (=> b!1541522 m!1423495))

(push 1)

(assert (not start!131586))

(assert (not b!1541522))

(assert (not b!1541520))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

