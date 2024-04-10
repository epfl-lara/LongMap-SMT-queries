; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131456 () Bool)

(assert start!131456)

(declare-fun b!1540890 () Bool)

(declare-fun res!1057436 () Bool)

(declare-fun e!856986 () Bool)

(assert (=> b!1540890 (=> (not res!1057436) (not e!856986))))

(declare-datatypes ((array!102359 0))(
  ( (array!102360 (arr!49388 (Array (_ BitVec 32) (_ BitVec 64))) (size!49938 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102359)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102359 (_ BitVec 32)) Bool)

(assert (=> b!1540890 (= res!1057436 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun res!1057437 () Bool)

(assert (=> start!131456 (=> (not res!1057437) (not e!856986))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131456 (= res!1057437 (validMask!0 mask!4052))))

(assert (=> start!131456 e!856986))

(assert (=> start!131456 true))

(declare-fun array_inv!38416 (array!102359) Bool)

(assert (=> start!131456 (array_inv!38416 a!3920)))

(declare-fun b!1540891 () Bool)

(declare-fun res!1057435 () Bool)

(assert (=> b!1540891 (=> (not res!1057435) (not e!856986))))

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1540891 (= res!1057435 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49938 a!3920))))))

(declare-fun b!1540889 () Bool)

(declare-fun res!1057438 () Bool)

(assert (=> b!1540889 (=> (not res!1057438) (not e!856986))))

(assert (=> b!1540889 (= res!1057438 (and (= (size!49938 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49938 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49938 a!3920))))))

(declare-fun b!1540892 () Bool)

(assert (=> b!1540892 (= e!856986 false)))

(declare-fun lt!665536 () Bool)

(assert (=> b!1540892 (= lt!665536 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(assert (= (and start!131456 res!1057437) b!1540889))

(assert (= (and b!1540889 res!1057438) b!1540890))

(assert (= (and b!1540890 res!1057436) b!1540891))

(assert (= (and b!1540891 res!1057435) b!1540892))

(declare-fun m!1422963 () Bool)

(assert (=> b!1540890 m!1422963))

(declare-fun m!1422965 () Bool)

(assert (=> start!131456 m!1422965))

(declare-fun m!1422967 () Bool)

(assert (=> start!131456 m!1422967))

(declare-fun m!1422969 () Bool)

(assert (=> b!1540892 m!1422969))

(push 1)

(assert (not b!1540890))

(assert (not start!131456))

(assert (not b!1540892))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

