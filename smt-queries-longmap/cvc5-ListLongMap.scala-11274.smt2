; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131440 () Bool)

(assert start!131440)

(declare-fun b!1540815 () Bool)

(declare-fun res!1057549 () Bool)

(declare-fun e!856891 () Bool)

(assert (=> b!1540815 (=> (not res!1057549) (not e!856891))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-datatypes ((array!102341 0))(
  ( (array!102342 (arr!49380 (Array (_ BitVec 32) (_ BitVec 64))) (size!49932 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102341)

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1540815 (= res!1057549 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49932 a!3920))))))

(declare-fun res!1057545 () Bool)

(assert (=> start!131440 (=> (not res!1057545) (not e!856891))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131440 (= res!1057545 (validMask!0 mask!4052))))

(assert (=> start!131440 e!856891))

(assert (=> start!131440 true))

(declare-fun array_inv!38613 (array!102341) Bool)

(assert (=> start!131440 (array_inv!38613 a!3920)))

(declare-fun b!1540816 () Bool)

(declare-fun res!1057548 () Bool)

(assert (=> b!1540816 (=> (not res!1057548) (not e!856891))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102341 (_ BitVec 32)) Bool)

(assert (=> b!1540816 (= res!1057548 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1540817 () Bool)

(declare-fun res!1057546 () Bool)

(assert (=> b!1540817 (=> (not res!1057546) (not e!856891))))

(assert (=> b!1540817 (= res!1057546 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1540818 () Bool)

(assert (=> b!1540818 (= e!856891 (not true))))

(assert (=> b!1540818 (arrayForallSeekEntryOrOpenFound!0 newFrom!293 a!3920 mask!4052)))

(declare-datatypes ((Unit!51303 0))(
  ( (Unit!51304) )
))
(declare-fun lt!665301 () Unit!51303)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!102341 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51303)

(assert (=> b!1540818 (= lt!665301 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3920 mask!4052 (bvadd #b00000000000000000000000000000001 from!3298) newFrom!293))))

(declare-fun b!1540819 () Bool)

(declare-fun res!1057547 () Bool)

(assert (=> b!1540819 (=> (not res!1057547) (not e!856891))))

(assert (=> b!1540819 (= res!1057547 (and (= (size!49932 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49932 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49932 a!3920))))))

(assert (= (and start!131440 res!1057545) b!1540819))

(assert (= (and b!1540819 res!1057547) b!1540817))

(assert (= (and b!1540817 res!1057546) b!1540815))

(assert (= (and b!1540815 res!1057549) b!1540816))

(assert (= (and b!1540816 res!1057548) b!1540818))

(declare-fun m!1422251 () Bool)

(assert (=> start!131440 m!1422251))

(declare-fun m!1422253 () Bool)

(assert (=> start!131440 m!1422253))

(declare-fun m!1422255 () Bool)

(assert (=> b!1540816 m!1422255))

(declare-fun m!1422257 () Bool)

(assert (=> b!1540817 m!1422257))

(declare-fun m!1422259 () Bool)

(assert (=> b!1540818 m!1422259))

(declare-fun m!1422261 () Bool)

(assert (=> b!1540818 m!1422261))

(push 1)

(assert (not start!131440))

(assert (not b!1540817))

(assert (not b!1540818))

(assert (not b!1540816))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

