; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104444 () Bool)

(assert start!104444)

(declare-fun b!1246484 () Bool)

(declare-fun e!706942 () Bool)

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1246484 (= e!706942 (bvslt (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!41417 0))(
  ( (Unit!41418) )
))
(declare-fun lt!563099 () Unit!41417)

(declare-fun e!706941 () Unit!41417)

(assert (=> b!1246484 (= lt!563099 e!706941)))

(declare-fun c!122019 () Bool)

(declare-datatypes ((array!80236 0))(
  ( (array!80237 (arr!38695 (Array (_ BitVec 32) (_ BitVec 64))) (size!39231 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80236)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246484 (= c!122019 (validKeyInArray!0 (select (arr!38695 a!3892) from!3270)))))

(declare-fun res!831817 () Bool)

(assert (=> start!104444 (=> (not res!831817) (not e!706942))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!104444 (= res!831817 (and (bvslt (size!39231 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39231 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39231 a!3892))))))

(assert (=> start!104444 e!706942))

(declare-fun array_inv!29543 (array!80236) Bool)

(assert (=> start!104444 (array_inv!29543 a!3892)))

(assert (=> start!104444 true))

(declare-fun b!1246485 () Bool)

(declare-fun res!831816 () Bool)

(assert (=> b!1246485 (=> (not res!831816) (not e!706942))))

(declare-datatypes ((List!27498 0))(
  ( (Nil!27495) (Cons!27494 (h!28703 (_ BitVec 64)) (t!40967 List!27498)) )
))
(declare-fun arrayNoDuplicates!0 (array!80236 (_ BitVec 32) List!27498) Bool)

(assert (=> b!1246485 (= res!831816 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27495))))

(declare-fun b!1246486 () Bool)

(declare-fun lt!563100 () Unit!41417)

(assert (=> b!1246486 (= e!706941 lt!563100)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80236 List!27498 List!27498 (_ BitVec 32)) Unit!41417)

(assert (=> b!1246486 (= lt!563100 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27494 (select (arr!38695 a!3892) from!3270) Nil!27495) Nil!27495 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1246486 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27495)))

(declare-fun b!1246487 () Bool)

(declare-fun res!831815 () Bool)

(assert (=> b!1246487 (=> (not res!831815) (not e!706942))))

(assert (=> b!1246487 (= res!831815 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39231 a!3892)) (not (= newFrom!287 (size!39231 a!3892)))))))

(declare-fun b!1246488 () Bool)

(declare-fun Unit!41419 () Unit!41417)

(assert (=> b!1246488 (= e!706941 Unit!41419)))

(assert (= (and start!104444 res!831817) b!1246485))

(assert (= (and b!1246485 res!831816) b!1246487))

(assert (= (and b!1246487 res!831815) b!1246484))

(assert (= (and b!1246484 c!122019) b!1246486))

(assert (= (and b!1246484 (not c!122019)) b!1246488))

(declare-fun m!1148309 () Bool)

(assert (=> b!1246484 m!1148309))

(assert (=> b!1246484 m!1148309))

(declare-fun m!1148311 () Bool)

(assert (=> b!1246484 m!1148311))

(declare-fun m!1148313 () Bool)

(assert (=> start!104444 m!1148313))

(declare-fun m!1148315 () Bool)

(assert (=> b!1246485 m!1148315))

(assert (=> b!1246486 m!1148309))

(declare-fun m!1148317 () Bool)

(assert (=> b!1246486 m!1148317))

(declare-fun m!1148319 () Bool)

(assert (=> b!1246486 m!1148319))

(push 1)

(assert (not start!104444))

(assert (not b!1246484))

(assert (not b!1246485))

(assert (not b!1246486))

(check-sat)

(pop 1)

(push 1)

(check-sat)

