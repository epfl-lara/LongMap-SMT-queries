; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104434 () Bool)

(assert start!104434)

(declare-fun b!1246409 () Bool)

(declare-fun res!831770 () Bool)

(declare-fun e!706897 () Bool)

(assert (=> b!1246409 (=> (not res!831770) (not e!706897))))

(declare-datatypes ((array!80226 0))(
  ( (array!80227 (arr!38690 (Array (_ BitVec 32) (_ BitVec 64))) (size!39226 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80226)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1246409 (= res!831770 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39226 a!3892)) (not (= newFrom!287 (size!39226 a!3892)))))))

(declare-fun res!831771 () Bool)

(assert (=> start!104434 (=> (not res!831771) (not e!706897))))

(assert (=> start!104434 (= res!831771 (and (bvslt (size!39226 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39226 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39226 a!3892))))))

(assert (=> start!104434 e!706897))

(declare-fun array_inv!29538 (array!80226) Bool)

(assert (=> start!104434 (array_inv!29538 a!3892)))

(assert (=> start!104434 true))

(declare-fun b!1246410 () Bool)

(declare-datatypes ((Unit!41402 0))(
  ( (Unit!41403) )
))
(declare-fun e!706896 () Unit!41402)

(declare-fun Unit!41404 () Unit!41402)

(assert (=> b!1246410 (= e!706896 Unit!41404)))

(declare-fun b!1246411 () Bool)

(declare-fun res!831772 () Bool)

(assert (=> b!1246411 (=> (not res!831772) (not e!706897))))

(declare-datatypes ((List!27493 0))(
  ( (Nil!27490) (Cons!27489 (h!28698 (_ BitVec 64)) (t!40962 List!27493)) )
))
(declare-fun arrayNoDuplicates!0 (array!80226 (_ BitVec 32) List!27493) Bool)

(assert (=> b!1246411 (= res!831772 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27490))))

(declare-fun b!1246412 () Bool)

(assert (=> b!1246412 (= e!706897 false)))

(declare-fun lt!563070 () Unit!41402)

(assert (=> b!1246412 (= lt!563070 e!706896)))

(declare-fun c!122004 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246412 (= c!122004 (validKeyInArray!0 (select (arr!38690 a!3892) from!3270)))))

(declare-fun b!1246413 () Bool)

(declare-fun lt!563069 () Unit!41402)

(assert (=> b!1246413 (= e!706896 lt!563069)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80226 List!27493 List!27493 (_ BitVec 32)) Unit!41402)

(assert (=> b!1246413 (= lt!563069 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27489 (select (arr!38690 a!3892) from!3270) Nil!27490) Nil!27490 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1246413 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27490)))

(assert (= (and start!104434 res!831771) b!1246411))

(assert (= (and b!1246411 res!831772) b!1246409))

(assert (= (and b!1246409 res!831770) b!1246412))

(assert (= (and b!1246412 c!122004) b!1246413))

(assert (= (and b!1246412 (not c!122004)) b!1246410))

(declare-fun m!1148249 () Bool)

(assert (=> start!104434 m!1148249))

(declare-fun m!1148251 () Bool)

(assert (=> b!1246411 m!1148251))

(declare-fun m!1148253 () Bool)

(assert (=> b!1246412 m!1148253))

(assert (=> b!1246412 m!1148253))

(declare-fun m!1148255 () Bool)

(assert (=> b!1246412 m!1148255))

(assert (=> b!1246413 m!1148253))

(declare-fun m!1148257 () Bool)

(assert (=> b!1246413 m!1148257))

(declare-fun m!1148259 () Bool)

(assert (=> b!1246413 m!1148259))

(push 1)

(assert (not b!1246413))

(assert (not start!104434))

(assert (not b!1246411))

(assert (not b!1246412))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

