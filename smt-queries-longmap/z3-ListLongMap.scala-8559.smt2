; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104742 () Bool)

(assert start!104742)

(declare-fun res!832624 () Bool)

(declare-fun e!708071 () Bool)

(assert (=> start!104742 (=> (not res!832624) (not e!708071))))

(declare-datatypes ((array!80313 0))(
  ( (array!80314 (arr!38726 (Array (_ BitVec 32) (_ BitVec 64))) (size!39263 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80313)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104742 (= res!832624 (and (bvslt (size!39263 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39263 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39263 a!3892))))))

(assert (=> start!104742 e!708071))

(declare-fun array_inv!29664 (array!80313) Bool)

(assert (=> start!104742 (array_inv!29664 a!3892)))

(assert (=> start!104742 true))

(declare-fun b!1248217 () Bool)

(declare-fun res!832623 () Bool)

(assert (=> b!1248217 (=> (not res!832623) (not e!708071))))

(declare-datatypes ((List!27542 0))(
  ( (Nil!27539) (Cons!27538 (h!28756 (_ BitVec 64)) (t!41003 List!27542)) )
))
(declare-fun arrayNoDuplicates!0 (array!80313 (_ BitVec 32) List!27542) Bool)

(assert (=> b!1248217 (= res!832623 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27539))))

(declare-fun b!1248218 () Bool)

(declare-fun res!832625 () Bool)

(assert (=> b!1248218 (=> (not res!832625) (not e!708071))))

(assert (=> b!1248218 (= res!832625 (= from!3270 newFrom!287))))

(declare-fun b!1248219 () Bool)

(assert (=> b!1248219 (= e!708071 (not (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27539)))))

(assert (= (and start!104742 res!832624) b!1248217))

(assert (= (and b!1248217 res!832623) b!1248218))

(assert (= (and b!1248218 res!832625) b!1248219))

(declare-fun m!1150233 () Bool)

(assert (=> start!104742 m!1150233))

(declare-fun m!1150235 () Bool)

(assert (=> b!1248217 m!1150235))

(declare-fun m!1150237 () Bool)

(assert (=> b!1248219 m!1150237))

(check-sat (not b!1248217) (not b!1248219) (not start!104742))
(check-sat)
