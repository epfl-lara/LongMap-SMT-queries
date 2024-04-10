; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104522 () Bool)

(assert start!104522)

(declare-fun res!832123 () Bool)

(declare-fun e!707237 () Bool)

(assert (=> start!104522 (=> (not res!832123) (not e!707237))))

(declare-datatypes ((array!80284 0))(
  ( (array!80285 (arr!38716 (Array (_ BitVec 32) (_ BitVec 64))) (size!39252 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80284)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104522 (= res!832123 (and (bvslt (size!39252 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39252 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39252 a!3892))))))

(assert (=> start!104522 e!707237))

(declare-fun array_inv!29564 (array!80284) Bool)

(assert (=> start!104522 (array_inv!29564 a!3892)))

(assert (=> start!104522 true))

(declare-fun b!1246930 () Bool)

(declare-fun res!832121 () Bool)

(assert (=> b!1246930 (=> (not res!832121) (not e!707237))))

(declare-datatypes ((List!27519 0))(
  ( (Nil!27516) (Cons!27515 (h!28724 (_ BitVec 64)) (t!40988 List!27519)) )
))
(declare-fun arrayNoDuplicates!0 (array!80284 (_ BitVec 32) List!27519) Bool)

(assert (=> b!1246930 (= res!832121 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27516))))

(declare-fun b!1246931 () Bool)

(declare-fun res!832122 () Bool)

(assert (=> b!1246931 (=> (not res!832122) (not e!707237))))

(assert (=> b!1246931 (= res!832122 (= from!3270 newFrom!287))))

(declare-fun b!1246932 () Bool)

(assert (=> b!1246932 (= e!707237 (not (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27516)))))

(assert (= (and start!104522 res!832123) b!1246930))

(assert (= (and b!1246930 res!832121) b!1246931))

(assert (= (and b!1246931 res!832122) b!1246932))

(declare-fun m!1148633 () Bool)

(assert (=> start!104522 m!1148633))

(declare-fun m!1148635 () Bool)

(assert (=> b!1246930 m!1148635))

(declare-fun m!1148637 () Bool)

(assert (=> b!1246932 m!1148637))

(push 1)

(assert (not b!1246932))

(assert (not start!104522))

(assert (not b!1246930))

(check-sat)

