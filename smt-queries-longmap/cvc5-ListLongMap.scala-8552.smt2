; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104440 () Bool)

(assert start!104440)

(declare-fun b!1246454 () Bool)

(declare-datatypes ((Unit!41411 0))(
  ( (Unit!41412) )
))
(declare-fun e!706923 () Unit!41411)

(declare-fun lt!563088 () Unit!41411)

(assert (=> b!1246454 (= e!706923 lt!563088)))

(declare-datatypes ((array!80232 0))(
  ( (array!80233 (arr!38693 (Array (_ BitVec 32) (_ BitVec 64))) (size!39229 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80232)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27496 0))(
  ( (Nil!27493) (Cons!27492 (h!28701 (_ BitVec 64)) (t!40965 List!27496)) )
))
(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80232 List!27496 List!27496 (_ BitVec 32)) Unit!41411)

(assert (=> b!1246454 (= lt!563088 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27492 (select (arr!38693 a!3892) from!3270) Nil!27493) Nil!27493 (bvadd #b00000000000000000000000000000001 from!3270)))))

(declare-fun arrayNoDuplicates!0 (array!80232 (_ BitVec 32) List!27496) Bool)

(assert (=> b!1246454 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27493)))

(declare-fun b!1246455 () Bool)

(declare-fun res!831799 () Bool)

(declare-fun e!706925 () Bool)

(assert (=> b!1246455 (=> (not res!831799) (not e!706925))))

(assert (=> b!1246455 (= res!831799 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27493))))

(declare-fun b!1246456 () Bool)

(declare-fun res!831797 () Bool)

(assert (=> b!1246456 (=> (not res!831797) (not e!706925))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1246456 (= res!831797 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39229 a!3892)) (not (= newFrom!287 (size!39229 a!3892)))))))

(declare-fun b!1246457 () Bool)

(declare-fun Unit!41413 () Unit!41411)

(assert (=> b!1246457 (= e!706923 Unit!41413)))

(declare-fun b!1246458 () Bool)

(assert (=> b!1246458 (= e!706925 (bvslt (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(declare-fun lt!563087 () Unit!41411)

(assert (=> b!1246458 (= lt!563087 e!706923)))

(declare-fun c!122013 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246458 (= c!122013 (validKeyInArray!0 (select (arr!38693 a!3892) from!3270)))))

(declare-fun res!831798 () Bool)

(assert (=> start!104440 (=> (not res!831798) (not e!706925))))

(assert (=> start!104440 (= res!831798 (and (bvslt (size!39229 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39229 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39229 a!3892))))))

(assert (=> start!104440 e!706925))

(declare-fun array_inv!29541 (array!80232) Bool)

(assert (=> start!104440 (array_inv!29541 a!3892)))

(assert (=> start!104440 true))

(assert (= (and start!104440 res!831798) b!1246455))

(assert (= (and b!1246455 res!831799) b!1246456))

(assert (= (and b!1246456 res!831797) b!1246458))

(assert (= (and b!1246458 c!122013) b!1246454))

(assert (= (and b!1246458 (not c!122013)) b!1246457))

(declare-fun m!1148285 () Bool)

(assert (=> b!1246454 m!1148285))

(declare-fun m!1148287 () Bool)

(assert (=> b!1246454 m!1148287))

(declare-fun m!1148289 () Bool)

(assert (=> b!1246454 m!1148289))

(declare-fun m!1148291 () Bool)

(assert (=> b!1246455 m!1148291))

(assert (=> b!1246458 m!1148285))

(assert (=> b!1246458 m!1148285))

(declare-fun m!1148293 () Bool)

(assert (=> b!1246458 m!1148293))

(declare-fun m!1148295 () Bool)

(assert (=> start!104440 m!1148295))

(push 1)

(assert (not b!1246458))

(assert (not start!104440))

(assert (not b!1246454))

(assert (not b!1246455))

(check-sat)

(pop 1)

(push 1)

(check-sat)

