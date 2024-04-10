; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103952 () Bool)

(assert start!103952)

(declare-fun b!1244256 () Bool)

(declare-fun e!705248 () Bool)

(declare-fun e!705246 () Bool)

(assert (=> b!1244256 (= e!705248 e!705246)))

(declare-fun res!829957 () Bool)

(assert (=> b!1244256 (=> (not res!829957) (not e!705246))))

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1244256 (= res!829957 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-datatypes ((Unit!41351 0))(
  ( (Unit!41352) )
))
(declare-fun lt!562664 () Unit!41351)

(declare-fun e!705247 () Unit!41351)

(assert (=> b!1244256 (= lt!562664 e!705247)))

(declare-fun c!121834 () Bool)

(declare-datatypes ((array!80044 0))(
  ( (array!80045 (arr!38615 (Array (_ BitVec 32) (_ BitVec 64))) (size!39151 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80044)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244256 (= c!121834 (validKeyInArray!0 (select (arr!38615 a!3892) from!3270)))))

(declare-fun b!1244257 () Bool)

(declare-fun res!829960 () Bool)

(assert (=> b!1244257 (=> (not res!829960) (not e!705248))))

(declare-datatypes ((List!27418 0))(
  ( (Nil!27415) (Cons!27414 (h!28623 (_ BitVec 64)) (t!40887 List!27418)) )
))
(declare-fun arrayNoDuplicates!0 (array!80044 (_ BitVec 32) List!27418) Bool)

(assert (=> b!1244257 (= res!829960 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27415))))

(declare-fun b!1244258 () Bool)

(declare-fun res!829959 () Bool)

(assert (=> b!1244258 (=> (not res!829959) (not e!705248))))

(assert (=> b!1244258 (= res!829959 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39151 a!3892)) (not (= newFrom!287 (size!39151 a!3892)))))))

(declare-fun res!829958 () Bool)

(assert (=> start!103952 (=> (not res!829958) (not e!705248))))

(assert (=> start!103952 (= res!829958 (and (bvslt (size!39151 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39151 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39151 a!3892))))))

(assert (=> start!103952 e!705248))

(declare-fun array_inv!29463 (array!80044) Bool)

(assert (=> start!103952 (array_inv!29463 a!3892)))

(assert (=> start!103952 true))

(declare-fun b!1244259 () Bool)

(declare-fun lt!562663 () Unit!41351)

(assert (=> b!1244259 (= e!705247 lt!562663)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80044 List!27418 List!27418 (_ BitVec 32)) Unit!41351)

(assert (=> b!1244259 (= lt!562663 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27414 (select (arr!38615 a!3892) from!3270) Nil!27415) Nil!27415 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1244259 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27415)))

(declare-fun b!1244260 () Bool)

(declare-fun Unit!41353 () Unit!41351)

(assert (=> b!1244260 (= e!705247 Unit!41353)))

(declare-fun b!1244261 () Bool)

(assert (=> b!1244261 (= e!705246 false)))

(declare-fun lt!562662 () Bool)

(assert (=> b!1244261 (= lt!562662 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27415))))

(assert (= (and start!103952 res!829958) b!1244257))

(assert (= (and b!1244257 res!829960) b!1244258))

(assert (= (and b!1244258 res!829959) b!1244256))

(assert (= (and b!1244256 c!121834) b!1244259))

(assert (= (and b!1244256 (not c!121834)) b!1244260))

(assert (= (and b!1244256 res!829957) b!1244261))

(declare-fun m!1146587 () Bool)

(assert (=> start!103952 m!1146587))

(declare-fun m!1146589 () Bool)

(assert (=> b!1244261 m!1146589))

(declare-fun m!1146591 () Bool)

(assert (=> b!1244256 m!1146591))

(assert (=> b!1244256 m!1146591))

(declare-fun m!1146593 () Bool)

(assert (=> b!1244256 m!1146593))

(assert (=> b!1244259 m!1146591))

(declare-fun m!1146595 () Bool)

(assert (=> b!1244259 m!1146595))

(assert (=> b!1244259 m!1146589))

(declare-fun m!1146597 () Bool)

(assert (=> b!1244257 m!1146597))

(push 1)

(assert (not b!1244256))

(assert (not b!1244257))

(assert (not start!103952))

(assert (not b!1244259))

(assert (not b!1244261))

(check-sat)

(pop 1)

