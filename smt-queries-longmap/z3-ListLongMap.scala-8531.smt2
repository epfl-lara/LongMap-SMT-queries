; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104292 () Bool)

(assert start!104292)

(declare-fun res!830879 () Bool)

(declare-fun e!706482 () Bool)

(assert (=> start!104292 (=> (not res!830879) (not e!706482))))

(declare-datatypes ((array!80114 0))(
  ( (array!80115 (arr!38642 (Array (_ BitVec 32) (_ BitVec 64))) (size!39179 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80114)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!104292 (= res!830879 (and (bvslt (size!39179 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39179 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39179 a!3892))))))

(assert (=> start!104292 e!706482))

(declare-fun array_inv!29580 (array!80114) Bool)

(assert (=> start!104292 (array_inv!29580 a!3892)))

(assert (=> start!104292 true))

(declare-fun b!1246113 () Bool)

(declare-fun res!830880 () Bool)

(assert (=> b!1246113 (=> (not res!830880) (not e!706482))))

(declare-datatypes ((List!27458 0))(
  ( (Nil!27455) (Cons!27454 (h!28672 (_ BitVec 64)) (t!40919 List!27458)) )
))
(declare-fun arrayNoDuplicates!0 (array!80114 (_ BitVec 32) List!27458) Bool)

(assert (=> b!1246113 (= res!830880 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27455))))

(declare-fun b!1246114 () Bool)

(assert (=> b!1246114 (= e!706482 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39179 a!3892)) (= newFrom!287 (size!39179 a!3892)) (bvslt newFrom!287 #b00000000000000000000000000000000)))))

(assert (= (and start!104292 res!830879) b!1246113))

(assert (= (and b!1246113 res!830880) b!1246114))

(declare-fun m!1148661 () Bool)

(assert (=> start!104292 m!1148661))

(declare-fun m!1148663 () Bool)

(assert (=> b!1246113 m!1148663))

(check-sat (not b!1246113) (not start!104292))
(check-sat)
