; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104438 () Bool)

(assert start!104438)

(declare-fun b!1246439 () Bool)

(declare-fun e!706914 () Bool)

(assert (=> b!1246439 (= e!706914 false)))

(declare-datatypes ((Unit!41408 0))(
  ( (Unit!41409) )
))
(declare-fun lt!563081 () Unit!41408)

(declare-fun e!706916 () Unit!41408)

(assert (=> b!1246439 (= lt!563081 e!706916)))

(declare-fun c!122010 () Bool)

(declare-datatypes ((array!80230 0))(
  ( (array!80231 (arr!38692 (Array (_ BitVec 32) (_ BitVec 64))) (size!39228 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80230)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246439 (= c!122010 (validKeyInArray!0 (select (arr!38692 a!3892) from!3270)))))

(declare-fun res!831790 () Bool)

(assert (=> start!104438 (=> (not res!831790) (not e!706914))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!104438 (= res!831790 (and (bvslt (size!39228 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39228 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39228 a!3892))))))

(assert (=> start!104438 e!706914))

(declare-fun array_inv!29540 (array!80230) Bool)

(assert (=> start!104438 (array_inv!29540 a!3892)))

(assert (=> start!104438 true))

(declare-fun b!1246440 () Bool)

(declare-fun res!831789 () Bool)

(assert (=> b!1246440 (=> (not res!831789) (not e!706914))))

(declare-datatypes ((List!27495 0))(
  ( (Nil!27492) (Cons!27491 (h!28700 (_ BitVec 64)) (t!40964 List!27495)) )
))
(declare-fun arrayNoDuplicates!0 (array!80230 (_ BitVec 32) List!27495) Bool)

(assert (=> b!1246440 (= res!831789 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27492))))

(declare-fun b!1246441 () Bool)

(declare-fun Unit!41410 () Unit!41408)

(assert (=> b!1246441 (= e!706916 Unit!41410)))

(declare-fun b!1246442 () Bool)

(declare-fun lt!563082 () Unit!41408)

(assert (=> b!1246442 (= e!706916 lt!563082)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80230 List!27495 List!27495 (_ BitVec 32)) Unit!41408)

(assert (=> b!1246442 (= lt!563082 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27491 (select (arr!38692 a!3892) from!3270) Nil!27492) Nil!27492 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1246442 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27492)))

(declare-fun b!1246443 () Bool)

(declare-fun res!831788 () Bool)

(assert (=> b!1246443 (=> (not res!831788) (not e!706914))))

(assert (=> b!1246443 (= res!831788 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39228 a!3892)) (not (= newFrom!287 (size!39228 a!3892)))))))

(assert (= (and start!104438 res!831790) b!1246440))

(assert (= (and b!1246440 res!831789) b!1246443))

(assert (= (and b!1246443 res!831788) b!1246439))

(assert (= (and b!1246439 c!122010) b!1246442))

(assert (= (and b!1246439 (not c!122010)) b!1246441))

(declare-fun m!1148273 () Bool)

(assert (=> b!1246439 m!1148273))

(assert (=> b!1246439 m!1148273))

(declare-fun m!1148275 () Bool)

(assert (=> b!1246439 m!1148275))

(declare-fun m!1148277 () Bool)

(assert (=> start!104438 m!1148277))

(declare-fun m!1148279 () Bool)

(assert (=> b!1246440 m!1148279))

(assert (=> b!1246442 m!1148273))

(declare-fun m!1148281 () Bool)

(assert (=> b!1246442 m!1148281))

(declare-fun m!1148283 () Bool)

(assert (=> b!1246442 m!1148283))

(push 1)

(assert (not start!104438))

(assert (not b!1246439))

(assert (not b!1246440))

(assert (not b!1246442))

(check-sat)

