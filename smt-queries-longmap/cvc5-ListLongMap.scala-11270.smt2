; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131462 () Bool)

(assert start!131462)

(declare-fun b!1540928 () Bool)

(declare-fun e!857005 () Bool)

(assert (=> b!1540928 (= e!857005 false)))

(declare-datatypes ((array!102365 0))(
  ( (array!102366 (arr!49391 (Array (_ BitVec 32) (_ BitVec 64))) (size!49941 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102365)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun lt!665545 () Bool)

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102365 (_ BitVec 32)) Bool)

(assert (=> b!1540928 (= lt!665545 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1540926 () Bool)

(declare-fun res!1057473 () Bool)

(assert (=> b!1540926 (=> (not res!1057473) (not e!857005))))

(assert (=> b!1540926 (= res!1057473 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1540925 () Bool)

(declare-fun res!1057474 () Bool)

(assert (=> b!1540925 (=> (not res!1057474) (not e!857005))))

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1540925 (= res!1057474 (and (= (size!49941 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49941 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49941 a!3920))))))

(declare-fun res!1057472 () Bool)

(assert (=> start!131462 (=> (not res!1057472) (not e!857005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131462 (= res!1057472 (validMask!0 mask!4052))))

(assert (=> start!131462 e!857005))

(assert (=> start!131462 true))

(declare-fun array_inv!38419 (array!102365) Bool)

(assert (=> start!131462 (array_inv!38419 a!3920)))

(declare-fun b!1540927 () Bool)

(declare-fun res!1057471 () Bool)

(assert (=> b!1540927 (=> (not res!1057471) (not e!857005))))

(assert (=> b!1540927 (= res!1057471 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49941 a!3920))))))

(assert (= (and start!131462 res!1057472) b!1540925))

(assert (= (and b!1540925 res!1057474) b!1540926))

(assert (= (and b!1540926 res!1057473) b!1540927))

(assert (= (and b!1540927 res!1057471) b!1540928))

(declare-fun m!1422987 () Bool)

(assert (=> b!1540928 m!1422987))

(declare-fun m!1422989 () Bool)

(assert (=> b!1540926 m!1422989))

(declare-fun m!1422991 () Bool)

(assert (=> start!131462 m!1422991))

(declare-fun m!1422993 () Bool)

(assert (=> start!131462 m!1422993))

(push 1)

(assert (not b!1540926))

(assert (not start!131462))

(assert (not b!1540928))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

