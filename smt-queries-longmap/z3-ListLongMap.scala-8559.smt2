; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104520 () Bool)

(assert start!104520)

(declare-fun res!832114 () Bool)

(declare-fun e!707230 () Bool)

(assert (=> start!104520 (=> (not res!832114) (not e!707230))))

(declare-datatypes ((array!80282 0))(
  ( (array!80283 (arr!38715 (Array (_ BitVec 32) (_ BitVec 64))) (size!39251 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80282)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104520 (= res!832114 (and (bvslt (size!39251 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39251 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39251 a!3892))))))

(assert (=> start!104520 e!707230))

(declare-fun array_inv!29563 (array!80282) Bool)

(assert (=> start!104520 (array_inv!29563 a!3892)))

(assert (=> start!104520 true))

(declare-fun b!1246921 () Bool)

(declare-fun res!832112 () Bool)

(assert (=> b!1246921 (=> (not res!832112) (not e!707230))))

(declare-datatypes ((List!27518 0))(
  ( (Nil!27515) (Cons!27514 (h!28723 (_ BitVec 64)) (t!40987 List!27518)) )
))
(declare-fun arrayNoDuplicates!0 (array!80282 (_ BitVec 32) List!27518) Bool)

(assert (=> b!1246921 (= res!832112 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27515))))

(declare-fun b!1246922 () Bool)

(declare-fun res!832113 () Bool)

(assert (=> b!1246922 (=> (not res!832113) (not e!707230))))

(assert (=> b!1246922 (= res!832113 (= from!3270 newFrom!287))))

(declare-fun b!1246923 () Bool)

(assert (=> b!1246923 (= e!707230 (not (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27515)))))

(assert (= (and start!104520 res!832114) b!1246921))

(assert (= (and b!1246921 res!832112) b!1246922))

(assert (= (and b!1246922 res!832113) b!1246923))

(declare-fun m!1148627 () Bool)

(assert (=> start!104520 m!1148627))

(declare-fun m!1148629 () Bool)

(assert (=> b!1246921 m!1148629))

(declare-fun m!1148631 () Bool)

(assert (=> b!1246923 m!1148631))

(check-sat (not b!1246923) (not b!1246921) (not start!104520))
