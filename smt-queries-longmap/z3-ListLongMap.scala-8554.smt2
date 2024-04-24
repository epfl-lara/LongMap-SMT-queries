; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104684 () Bool)

(assert start!104684)

(declare-fun b!1247859 () Bool)

(declare-fun res!832379 () Bool)

(declare-fun e!707834 () Bool)

(assert (=> b!1247859 (=> (not res!832379) (not e!707834))))

(declare-datatypes ((array!80278 0))(
  ( (array!80279 (arr!38711 (Array (_ BitVec 32) (_ BitVec 64))) (size!39248 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80278)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1247859 (= res!832379 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39248 a!3892)) (not (= newFrom!287 (size!39248 a!3892)))))))

(declare-fun b!1247860 () Bool)

(declare-fun res!832377 () Bool)

(assert (=> b!1247860 (=> (not res!832377) (not e!707834))))

(declare-datatypes ((List!27527 0))(
  ( (Nil!27524) (Cons!27523 (h!28741 (_ BitVec 64)) (t!40988 List!27527)) )
))
(declare-fun arrayNoDuplicates!0 (array!80278 (_ BitVec 32) List!27527) Bool)

(assert (=> b!1247860 (= res!832377 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27524))))

(declare-fun b!1247861 () Bool)

(assert (=> b!1247861 (= e!707834 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvslt newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-datatypes ((Unit!41402 0))(
  ( (Unit!41403) )
))
(declare-fun lt!563611 () Unit!41402)

(declare-fun e!707833 () Unit!41402)

(assert (=> b!1247861 (= lt!563611 e!707833)))

(declare-fun c!122433 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1247861 (= c!122433 (validKeyInArray!0 (select (arr!38711 a!3892) from!3270)))))

(declare-fun b!1247862 () Bool)

(declare-fun Unit!41404 () Unit!41402)

(assert (=> b!1247862 (= e!707833 Unit!41404)))

(declare-fun b!1247863 () Bool)

(declare-fun lt!563610 () Unit!41402)

(assert (=> b!1247863 (= e!707833 lt!563610)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80278 List!27527 List!27527 (_ BitVec 32)) Unit!41402)

(assert (=> b!1247863 (= lt!563610 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27523 (select (arr!38711 a!3892) from!3270) Nil!27524) Nil!27524 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1247863 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27524)))

(declare-fun res!832378 () Bool)

(assert (=> start!104684 (=> (not res!832378) (not e!707834))))

(assert (=> start!104684 (= res!832378 (and (bvslt (size!39248 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39248 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39248 a!3892))))))

(assert (=> start!104684 e!707834))

(declare-fun array_inv!29649 (array!80278) Bool)

(assert (=> start!104684 (array_inv!29649 a!3892)))

(assert (=> start!104684 true))

(assert (= (and start!104684 res!832378) b!1247860))

(assert (= (and b!1247860 res!832377) b!1247859))

(assert (= (and b!1247859 res!832379) b!1247861))

(assert (= (and b!1247861 c!122433) b!1247863))

(assert (= (and b!1247861 (not c!122433)) b!1247862))

(declare-fun m!1149985 () Bool)

(assert (=> b!1247860 m!1149985))

(declare-fun m!1149987 () Bool)

(assert (=> b!1247861 m!1149987))

(assert (=> b!1247861 m!1149987))

(declare-fun m!1149989 () Bool)

(assert (=> b!1247861 m!1149989))

(assert (=> b!1247863 m!1149987))

(declare-fun m!1149991 () Bool)

(assert (=> b!1247863 m!1149991))

(declare-fun m!1149993 () Bool)

(assert (=> b!1247863 m!1149993))

(declare-fun m!1149995 () Bool)

(assert (=> start!104684 m!1149995))

(check-sat (not b!1247861) (not start!104684) (not b!1247863) (not b!1247860))
(check-sat)
