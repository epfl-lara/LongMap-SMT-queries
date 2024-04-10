; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104450 () Bool)

(assert start!104450)

(declare-fun b!1246529 () Bool)

(declare-fun e!706970 () Bool)

(assert (=> b!1246529 (= e!706970 false)))

(declare-datatypes ((Unit!41426 0))(
  ( (Unit!41427) )
))
(declare-fun lt!563118 () Unit!41426)

(declare-fun e!706969 () Unit!41426)

(assert (=> b!1246529 (= lt!563118 e!706969)))

(declare-fun c!122028 () Bool)

(declare-datatypes ((array!80242 0))(
  ( (array!80243 (arr!38698 (Array (_ BitVec 32) (_ BitVec 64))) (size!39234 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80242)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246529 (= c!122028 (validKeyInArray!0 (select (arr!38698 a!3892) from!3270)))))

(declare-fun b!1246530 () Bool)

(declare-fun res!831843 () Bool)

(assert (=> b!1246530 (=> (not res!831843) (not e!706970))))

(declare-datatypes ((List!27501 0))(
  ( (Nil!27498) (Cons!27497 (h!28706 (_ BitVec 64)) (t!40970 List!27501)) )
))
(declare-fun arrayNoDuplicates!0 (array!80242 (_ BitVec 32) List!27501) Bool)

(assert (=> b!1246530 (= res!831843 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27498))))

(declare-fun b!1246531 () Bool)

(declare-fun Unit!41428 () Unit!41426)

(assert (=> b!1246531 (= e!706969 Unit!41428)))

(declare-fun res!831842 () Bool)

(assert (=> start!104450 (=> (not res!831842) (not e!706970))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!104450 (= res!831842 (and (bvslt (size!39234 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39234 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39234 a!3892))))))

(assert (=> start!104450 e!706970))

(declare-fun array_inv!29546 (array!80242) Bool)

(assert (=> start!104450 (array_inv!29546 a!3892)))

(assert (=> start!104450 true))

(declare-fun b!1246532 () Bool)

(declare-fun res!831844 () Bool)

(assert (=> b!1246532 (=> (not res!831844) (not e!706970))))

(assert (=> b!1246532 (= res!831844 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39234 a!3892)) (not (= newFrom!287 (size!39234 a!3892)))))))

(declare-fun b!1246533 () Bool)

(declare-fun lt!563117 () Unit!41426)

(assert (=> b!1246533 (= e!706969 lt!563117)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80242 List!27501 List!27501 (_ BitVec 32)) Unit!41426)

(assert (=> b!1246533 (= lt!563117 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27497 (select (arr!38698 a!3892) from!3270) Nil!27498) Nil!27498 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1246533 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27498)))

(assert (= (and start!104450 res!831842) b!1246530))

(assert (= (and b!1246530 res!831843) b!1246532))

(assert (= (and b!1246532 res!831844) b!1246529))

(assert (= (and b!1246529 c!122028) b!1246533))

(assert (= (and b!1246529 (not c!122028)) b!1246531))

(declare-fun m!1148345 () Bool)

(assert (=> b!1246529 m!1148345))

(assert (=> b!1246529 m!1148345))

(declare-fun m!1148347 () Bool)

(assert (=> b!1246529 m!1148347))

(declare-fun m!1148349 () Bool)

(assert (=> b!1246530 m!1148349))

(declare-fun m!1148351 () Bool)

(assert (=> start!104450 m!1148351))

(assert (=> b!1246533 m!1148345))

(declare-fun m!1148353 () Bool)

(assert (=> b!1246533 m!1148353))

(declare-fun m!1148355 () Bool)

(assert (=> b!1246533 m!1148355))

(push 1)

(assert (not b!1246533))

(assert (not start!104450))

(assert (not b!1246529))

(assert (not b!1246530))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

