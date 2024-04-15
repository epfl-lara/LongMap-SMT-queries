; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104436 () Bool)

(assert start!104436)

(declare-fun b!1246372 () Bool)

(declare-datatypes ((Unit!41256 0))(
  ( (Unit!41257) )
))
(declare-fun e!706879 () Unit!41256)

(declare-fun lt!562908 () Unit!41256)

(assert (=> b!1246372 (= e!706879 lt!562908)))

(declare-datatypes ((array!80153 0))(
  ( (array!80154 (arr!38654 (Array (_ BitVec 32) (_ BitVec 64))) (size!39192 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80153)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27558 0))(
  ( (Nil!27555) (Cons!27554 (h!28763 (_ BitVec 64)) (t!41018 List!27558)) )
))
(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80153 List!27558 List!27558 (_ BitVec 32)) Unit!41256)

(assert (=> b!1246372 (= lt!562908 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27554 (select (arr!38654 a!3892) from!3270) Nil!27555) Nil!27555 (bvadd #b00000000000000000000000000000001 from!3270)))))

(declare-fun arrayNoDuplicates!0 (array!80153 (_ BitVec 32) List!27558) Bool)

(assert (=> b!1246372 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27555)))

(declare-fun res!831757 () Bool)

(declare-fun e!706878 () Bool)

(assert (=> start!104436 (=> (not res!831757) (not e!706878))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!104436 (= res!831757 (and (bvslt (size!39192 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39192 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39192 a!3892))))))

(assert (=> start!104436 e!706878))

(declare-fun array_inv!29637 (array!80153) Bool)

(assert (=> start!104436 (array_inv!29637 a!3892)))

(assert (=> start!104436 true))

(declare-fun b!1246373 () Bool)

(assert (=> b!1246373 (= e!706878 (bvslt (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(declare-fun lt!562909 () Unit!41256)

(assert (=> b!1246373 (= lt!562909 e!706879)))

(declare-fun c!121995 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246373 (= c!121995 (validKeyInArray!0 (select (arr!38654 a!3892) from!3270)))))

(declare-fun b!1246374 () Bool)

(declare-fun res!831758 () Bool)

(assert (=> b!1246374 (=> (not res!831758) (not e!706878))))

(assert (=> b!1246374 (= res!831758 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27555))))

(declare-fun b!1246375 () Bool)

(declare-fun Unit!41258 () Unit!41256)

(assert (=> b!1246375 (= e!706879 Unit!41258)))

(declare-fun b!1246376 () Bool)

(declare-fun res!831759 () Bool)

(assert (=> b!1246376 (=> (not res!831759) (not e!706878))))

(assert (=> b!1246376 (= res!831759 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39192 a!3892)) (not (= newFrom!287 (size!39192 a!3892)))))))

(assert (= (and start!104436 res!831757) b!1246374))

(assert (= (and b!1246374 res!831758) b!1246376))

(assert (= (and b!1246376 res!831759) b!1246373))

(assert (= (and b!1246373 c!121995) b!1246372))

(assert (= (and b!1246373 (not c!121995)) b!1246375))

(declare-fun m!1147765 () Bool)

(assert (=> b!1246372 m!1147765))

(declare-fun m!1147767 () Bool)

(assert (=> b!1246372 m!1147767))

(declare-fun m!1147769 () Bool)

(assert (=> b!1246372 m!1147769))

(declare-fun m!1147771 () Bool)

(assert (=> start!104436 m!1147771))

(assert (=> b!1246373 m!1147765))

(assert (=> b!1246373 m!1147765))

(declare-fun m!1147773 () Bool)

(assert (=> b!1246373 m!1147773))

(declare-fun m!1147775 () Bool)

(assert (=> b!1246374 m!1147775))

(check-sat (not b!1246372) (not b!1246373) (not b!1246374) (not start!104436))
(check-sat)
