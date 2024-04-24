; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104458 () Bool)

(assert start!104458)

(declare-fun res!831393 () Bool)

(declare-fun e!707016 () Bool)

(assert (=> start!104458 (=> (not res!831393) (not e!707016))))

(declare-datatypes ((array!80209 0))(
  ( (array!80210 (arr!38684 (Array (_ BitVec 32) (_ BitVec 64))) (size!39221 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80209)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104458 (= res!831393 (and (bvslt (size!39221 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39221 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39221 a!3892))))))

(assert (=> start!104458 e!707016))

(declare-fun array_inv!29622 (array!80209) Bool)

(assert (=> start!104458 (array_inv!29622 a!3892)))

(assert (=> start!104458 true))

(declare-fun b!1246699 () Bool)

(assert (=> b!1246699 (= e!707016 false)))

(declare-fun lt!563405 () Bool)

(declare-datatypes ((List!27500 0))(
  ( (Nil!27497) (Cons!27496 (h!28714 (_ BitVec 64)) (t!40961 List!27500)) )
))
(declare-fun arrayNoDuplicates!0 (array!80209 (_ BitVec 32) List!27500) Bool)

(assert (=> b!1246699 (= lt!563405 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27497))))

(assert (= (and start!104458 res!831393) b!1246699))

(declare-fun m!1149085 () Bool)

(assert (=> start!104458 m!1149085))

(declare-fun m!1149087 () Bool)

(assert (=> b!1246699 m!1149087))

(check-sat (not b!1246699) (not start!104458))
(check-sat)
