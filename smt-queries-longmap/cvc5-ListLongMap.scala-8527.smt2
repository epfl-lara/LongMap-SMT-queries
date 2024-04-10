; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103958 () Bool)

(assert start!103958)

(declare-fun b!1244312 () Bool)

(declare-fun res!829996 () Bool)

(declare-fun e!705283 () Bool)

(assert (=> b!1244312 (=> (not res!829996) (not e!705283))))

(declare-datatypes ((array!80050 0))(
  ( (array!80051 (arr!38618 (Array (_ BitVec 32) (_ BitVec 64))) (size!39154 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80050)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27421 0))(
  ( (Nil!27418) (Cons!27417 (h!28626 (_ BitVec 64)) (t!40890 List!27421)) )
))
(declare-fun arrayNoDuplicates!0 (array!80050 (_ BitVec 32) List!27421) Bool)

(assert (=> b!1244312 (= res!829996 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27418))))

(declare-fun res!829995 () Bool)

(declare-fun e!705282 () Bool)

(assert (=> start!103958 (=> (not res!829995) (not e!705282))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!103958 (= res!829995 (and (bvslt (size!39154 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39154 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39154 a!3892))))))

(assert (=> start!103958 e!705282))

(declare-fun array_inv!29466 (array!80050) Bool)

(assert (=> start!103958 (array_inv!29466 a!3892)))

(assert (=> start!103958 true))

(declare-fun b!1244313 () Bool)

(declare-fun res!829999 () Bool)

(assert (=> b!1244313 (=> (not res!829999) (not e!705282))))

(assert (=> b!1244313 (= res!829999 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39154 a!3892)) (not (= newFrom!287 (size!39154 a!3892)))))))

(declare-fun b!1244314 () Bool)

(declare-datatypes ((Unit!41360 0))(
  ( (Unit!41361) )
))
(declare-fun e!705284 () Unit!41360)

(declare-fun lt!562691 () Unit!41360)

(assert (=> b!1244314 (= e!705284 lt!562691)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80050 List!27421 List!27421 (_ BitVec 32)) Unit!41360)

(assert (=> b!1244314 (= lt!562691 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27417 (select (arr!38618 a!3892) from!3270) Nil!27418) Nil!27418 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1244314 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27418)))

(declare-fun b!1244315 () Bool)

(declare-fun res!829997 () Bool)

(assert (=> b!1244315 (=> (not res!829997) (not e!705282))))

(assert (=> b!1244315 (= res!829997 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27418))))

(declare-fun b!1244316 () Bool)

(assert (=> b!1244316 (= e!705283 (not (bvsge newFrom!287 #b00000000000000000000000000000000)))))

(assert (=> b!1244316 (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27418)))

(declare-fun lt!562690 () Unit!41360)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!80050 (_ BitVec 32) (_ BitVec 32)) Unit!41360)

(assert (=> b!1244316 (= lt!562690 (lemmaNoDuplicateFromThenFromBigger!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287))))

(declare-fun b!1244317 () Bool)

(declare-fun Unit!41362 () Unit!41360)

(assert (=> b!1244317 (= e!705284 Unit!41362)))

(declare-fun b!1244318 () Bool)

(assert (=> b!1244318 (= e!705282 e!705283)))

(declare-fun res!829998 () Bool)

(assert (=> b!1244318 (=> (not res!829998) (not e!705283))))

(assert (=> b!1244318 (= res!829998 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!562689 () Unit!41360)

(assert (=> b!1244318 (= lt!562689 e!705284)))

(declare-fun c!121843 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244318 (= c!121843 (validKeyInArray!0 (select (arr!38618 a!3892) from!3270)))))

(assert (= (and start!103958 res!829995) b!1244315))

(assert (= (and b!1244315 res!829997) b!1244313))

(assert (= (and b!1244313 res!829999) b!1244318))

(assert (= (and b!1244318 c!121843) b!1244314))

(assert (= (and b!1244318 (not c!121843)) b!1244317))

(assert (= (and b!1244318 res!829998) b!1244312))

(assert (= (and b!1244312 res!829996) b!1244316))

(declare-fun m!1146623 () Bool)

(assert (=> start!103958 m!1146623))

(declare-fun m!1146625 () Bool)

(assert (=> b!1244312 m!1146625))

(declare-fun m!1146627 () Bool)

(assert (=> b!1244315 m!1146627))

(declare-fun m!1146629 () Bool)

(assert (=> b!1244316 m!1146629))

(declare-fun m!1146631 () Bool)

(assert (=> b!1244316 m!1146631))

(declare-fun m!1146633 () Bool)

(assert (=> b!1244318 m!1146633))

(assert (=> b!1244318 m!1146633))

(declare-fun m!1146635 () Bool)

(assert (=> b!1244318 m!1146635))

(assert (=> b!1244314 m!1146633))

(declare-fun m!1146637 () Bool)

(assert (=> b!1244314 m!1146637))

(assert (=> b!1244314 m!1146625))

(push 1)

(assert (not b!1244312))

(assert (not b!1244318))

(assert (not b!1244315))

