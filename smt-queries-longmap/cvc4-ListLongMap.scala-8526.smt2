; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103956 () Bool)

(assert start!103956)

(declare-fun b!1244292 () Bool)

(declare-datatypes ((Unit!41357 0))(
  ( (Unit!41358) )
))
(declare-fun e!705270 () Unit!41357)

(declare-fun lt!562682 () Unit!41357)

(assert (=> b!1244292 (= e!705270 lt!562682)))

(declare-datatypes ((array!80048 0))(
  ( (array!80049 (arr!38617 (Array (_ BitVec 32) (_ BitVec 64))) (size!39153 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80048)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27420 0))(
  ( (Nil!27417) (Cons!27416 (h!28625 (_ BitVec 64)) (t!40889 List!27420)) )
))
(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80048 List!27420 List!27420 (_ BitVec 32)) Unit!41357)

(assert (=> b!1244292 (= lt!562682 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27416 (select (arr!38617 a!3892) from!3270) Nil!27417) Nil!27417 (bvadd #b00000000000000000000000000000001 from!3270)))))

(declare-fun arrayNoDuplicates!0 (array!80048 (_ BitVec 32) List!27420) Bool)

(assert (=> b!1244292 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27417)))

(declare-fun res!829982 () Bool)

(declare-fun e!705273 () Bool)

(assert (=> start!103956 (=> (not res!829982) (not e!705273))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!103956 (= res!829982 (and (bvslt (size!39153 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39153 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39153 a!3892))))))

(assert (=> start!103956 e!705273))

(declare-fun array_inv!29465 (array!80048) Bool)

(assert (=> start!103956 (array_inv!29465 a!3892)))

(assert (=> start!103956 true))

(declare-fun b!1244293 () Bool)

(declare-fun res!829983 () Bool)

(assert (=> b!1244293 (=> (not res!829983) (not e!705273))))

(assert (=> b!1244293 (= res!829983 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39153 a!3892)) (not (= newFrom!287 (size!39153 a!3892)))))))

(declare-fun b!1244294 () Bool)

(declare-fun e!705271 () Bool)

(assert (=> b!1244294 (= e!705273 e!705271)))

(declare-fun res!829981 () Bool)

(assert (=> b!1244294 (=> (not res!829981) (not e!705271))))

(assert (=> b!1244294 (= res!829981 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!562680 () Unit!41357)

(assert (=> b!1244294 (= lt!562680 e!705270)))

(declare-fun c!121840 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244294 (= c!121840 (validKeyInArray!0 (select (arr!38617 a!3892) from!3270)))))

(declare-fun b!1244295 () Bool)

(declare-fun Unit!41359 () Unit!41357)

(assert (=> b!1244295 (= e!705270 Unit!41359)))

(declare-fun b!1244296 () Bool)

(assert (=> b!1244296 (= e!705271 false)))

(declare-fun lt!562681 () Bool)

(assert (=> b!1244296 (= lt!562681 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27417))))

(declare-fun b!1244297 () Bool)

(declare-fun res!829984 () Bool)

(assert (=> b!1244297 (=> (not res!829984) (not e!705273))))

(assert (=> b!1244297 (= res!829984 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27417))))

(assert (= (and start!103956 res!829982) b!1244297))

(assert (= (and b!1244297 res!829984) b!1244293))

(assert (= (and b!1244293 res!829983) b!1244294))

(assert (= (and b!1244294 c!121840) b!1244292))

(assert (= (and b!1244294 (not c!121840)) b!1244295))

(assert (= (and b!1244294 res!829981) b!1244296))

(declare-fun m!1146611 () Bool)

(assert (=> start!103956 m!1146611))

(declare-fun m!1146613 () Bool)

(assert (=> b!1244294 m!1146613))

(assert (=> b!1244294 m!1146613))

(declare-fun m!1146615 () Bool)

(assert (=> b!1244294 m!1146615))

(declare-fun m!1146617 () Bool)

(assert (=> b!1244296 m!1146617))

(assert (=> b!1244292 m!1146613))

(declare-fun m!1146619 () Bool)

(assert (=> b!1244292 m!1146619))

(assert (=> b!1244292 m!1146617))

(declare-fun m!1146621 () Bool)

(assert (=> b!1244297 m!1146621))

(push 1)

