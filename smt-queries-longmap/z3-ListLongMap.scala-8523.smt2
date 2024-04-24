; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104170 () Bool)

(assert start!104170)

(declare-fun b!1245418 () Bool)

(declare-datatypes ((Unit!41297 0))(
  ( (Unit!41298) )
))
(declare-fun e!706003 () Unit!41297)

(declare-fun lt!563068 () Unit!41297)

(assert (=> b!1245418 (= e!706003 lt!563068)))

(declare-datatypes ((array!80061 0))(
  ( (array!80062 (arr!38618 (Array (_ BitVec 32) (_ BitVec 64))) (size!39155 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80061)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27434 0))(
  ( (Nil!27431) (Cons!27430 (h!28648 (_ BitVec 64)) (t!40895 List!27434)) )
))
(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80061 List!27434 List!27434 (_ BitVec 32)) Unit!41297)

(assert (=> b!1245418 (= lt!563068 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27430 (select (arr!38618 a!3892) from!3270) Nil!27431) Nil!27431 (bvadd #b00000000000000000000000000000001 from!3270)))))

(declare-fun arrayNoDuplicates!0 (array!80061 (_ BitVec 32) List!27434) Bool)

(assert (=> b!1245418 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27431)))

(declare-fun b!1245419 () Bool)

(declare-fun Unit!41299 () Unit!41297)

(assert (=> b!1245419 (= e!706003 Unit!41299)))

(declare-fun b!1245420 () Bool)

(declare-fun res!830382 () Bool)

(declare-fun e!706004 () Bool)

(assert (=> b!1245420 (=> (not res!830382) (not e!706004))))

(assert (=> b!1245420 (= res!830382 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27431))))

(declare-fun b!1245421 () Bool)

(declare-fun res!830384 () Bool)

(assert (=> b!1245421 (=> (not res!830384) (not e!706004))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1245421 (= res!830384 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39155 a!3892)) (not (= newFrom!287 (size!39155 a!3892)))))))

(declare-fun b!1245422 () Bool)

(declare-fun e!706002 () Bool)

(assert (=> b!1245422 (= e!706002 false)))

(declare-fun lt!563067 () Bool)

(assert (=> b!1245422 (= lt!563067 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27431))))

(declare-fun res!830383 () Bool)

(assert (=> start!104170 (=> (not res!830383) (not e!706004))))

(assert (=> start!104170 (= res!830383 (and (bvslt (size!39155 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39155 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39155 a!3892))))))

(assert (=> start!104170 e!706004))

(declare-fun array_inv!29556 (array!80061) Bool)

(assert (=> start!104170 (array_inv!29556 a!3892)))

(assert (=> start!104170 true))

(declare-fun b!1245423 () Bool)

(assert (=> b!1245423 (= e!706004 e!706002)))

(declare-fun res!830385 () Bool)

(assert (=> b!1245423 (=> (not res!830385) (not e!706002))))

(assert (=> b!1245423 (= res!830385 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!563069 () Unit!41297)

(assert (=> b!1245423 (= lt!563069 e!706003)))

(declare-fun c!122210 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245423 (= c!122210 (validKeyInArray!0 (select (arr!38618 a!3892) from!3270)))))

(assert (= (and start!104170 res!830383) b!1245420))

(assert (= (and b!1245420 res!830382) b!1245421))

(assert (= (and b!1245421 res!830384) b!1245423))

(assert (= (and b!1245423 c!122210) b!1245418))

(assert (= (and b!1245423 (not c!122210)) b!1245419))

(assert (= (and b!1245423 res!830385) b!1245422))

(declare-fun m!1148119 () Bool)

(assert (=> start!104170 m!1148119))

(declare-fun m!1148121 () Bool)

(assert (=> b!1245422 m!1148121))

(declare-fun m!1148123 () Bool)

(assert (=> b!1245418 m!1148123))

(declare-fun m!1148125 () Bool)

(assert (=> b!1245418 m!1148125))

(assert (=> b!1245418 m!1148121))

(declare-fun m!1148127 () Bool)

(assert (=> b!1245420 m!1148127))

(assert (=> b!1245423 m!1148123))

(assert (=> b!1245423 m!1148123))

(declare-fun m!1148129 () Bool)

(assert (=> b!1245423 m!1148129))

(check-sat (not b!1245423) (not start!104170) (not b!1245420) (not b!1245422) (not b!1245418))
(check-sat)
