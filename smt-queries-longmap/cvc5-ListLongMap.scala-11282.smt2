; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131488 () Bool)

(assert start!131488)

(declare-fun res!1057710 () Bool)

(declare-fun e!857034 () Bool)

(assert (=> start!131488 (=> (not res!1057710) (not e!857034))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131488 (= res!1057710 (validMask!0 mask!4052))))

(assert (=> start!131488 e!857034))

(assert (=> start!131488 true))

(declare-datatypes ((array!102389 0))(
  ( (array!102390 (arr!49404 (Array (_ BitVec 32) (_ BitVec 64))) (size!49956 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102389)

(declare-fun array_inv!38637 (array!102389) Bool)

(assert (=> start!131488 (array_inv!38637 a!3920)))

(declare-fun b!1540979 () Bool)

(declare-fun res!1057711 () Bool)

(assert (=> b!1540979 (=> (not res!1057711) (not e!857034))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1540979 (= res!1057711 (and (= (size!49956 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49956 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49956 a!3920))))))

(declare-fun b!1540980 () Bool)

(declare-fun res!1057709 () Bool)

(assert (=> b!1540980 (=> (not res!1057709) (not e!857034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102389 (_ BitVec 32)) Bool)

(assert (=> b!1540980 (= res!1057709 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1540981 () Bool)

(assert (=> b!1540981 (= e!857034 (and (bvslt from!3298 newFrom!293) (or (bvslt (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!3298) (size!49956 a!3920)))))))

(assert (= (and start!131488 res!1057710) b!1540979))

(assert (= (and b!1540979 res!1057711) b!1540980))

(assert (= (and b!1540980 res!1057709) b!1540981))

(declare-fun m!1422401 () Bool)

(assert (=> start!131488 m!1422401))

(declare-fun m!1422403 () Bool)

(assert (=> start!131488 m!1422403))

(declare-fun m!1422405 () Bool)

(assert (=> b!1540980 m!1422405))

(push 1)

(assert (not b!1540980))

(assert (not start!131488))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

