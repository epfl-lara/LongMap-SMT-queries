; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104494 () Bool)

(assert start!104494)

(declare-fun res!832002 () Bool)

(declare-fun e!707128 () Bool)

(assert (=> start!104494 (=> (not res!832002) (not e!707128))))

(declare-datatypes ((array!80265 0))(
  ( (array!80266 (arr!38708 (Array (_ BitVec 32) (_ BitVec 64))) (size!39244 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80265)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104494 (= res!832002 (and (bvslt (size!39244 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39244 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39244 a!3892))))))

(assert (=> start!104494 e!707128))

(declare-fun array_inv!29556 (array!80265) Bool)

(assert (=> start!104494 (array_inv!29556 a!3892)))

(assert (=> start!104494 true))

(declare-fun b!1246770 () Bool)

(declare-fun res!832003 () Bool)

(declare-fun e!707126 () Bool)

(assert (=> b!1246770 (=> (not res!832003) (not e!707126))))

(declare-datatypes ((List!27511 0))(
  ( (Nil!27508) (Cons!27507 (h!28716 (_ BitVec 64)) (t!40980 List!27511)) )
))
(declare-fun arrayNoDuplicates!0 (array!80265 (_ BitVec 32) List!27511) Bool)

(assert (=> b!1246770 (= res!832003 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27508))))

(declare-fun b!1246771 () Bool)

(declare-datatypes ((Unit!41456 0))(
  ( (Unit!41457) )
))
(declare-fun e!707127 () Unit!41456)

(declare-fun lt!563188 () Unit!41456)

(assert (=> b!1246771 (= e!707127 lt!563188)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80265 List!27511 List!27511 (_ BitVec 32)) Unit!41456)

(assert (=> b!1246771 (= lt!563188 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27507 (select (arr!38708 a!3892) from!3270) Nil!27508) Nil!27508 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1246771 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27508)))

(declare-fun b!1246772 () Bool)

(declare-fun res!832001 () Bool)

(assert (=> b!1246772 (=> (not res!832001) (not e!707128))))

(assert (=> b!1246772 (= res!832001 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27508))))

(declare-fun b!1246773 () Bool)

(declare-fun Unit!41458 () Unit!41456)

(assert (=> b!1246773 (= e!707127 Unit!41458)))

(declare-fun b!1246774 () Bool)

(assert (=> b!1246774 (= e!707128 e!707126)))

(declare-fun res!832000 () Bool)

(assert (=> b!1246774 (=> (not res!832000) (not e!707126))))

(assert (=> b!1246774 (= res!832000 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!563189 () Unit!41456)

(assert (=> b!1246774 (= lt!563189 e!707127)))

(declare-fun c!122070 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246774 (= c!122070 (validKeyInArray!0 (select (arr!38708 a!3892) from!3270)))))

(declare-fun b!1246775 () Bool)

(declare-fun res!831999 () Bool)

(assert (=> b!1246775 (=> (not res!831999) (not e!707128))))

(assert (=> b!1246775 (= res!831999 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39244 a!3892)) (not (= newFrom!287 (size!39244 a!3892)))))))

(declare-fun b!1246776 () Bool)

(assert (=> b!1246776 (= e!707126 (not true))))

(assert (=> b!1246776 (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27508)))

(declare-fun lt!563190 () Unit!41456)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!80265 (_ BitVec 32) (_ BitVec 32)) Unit!41456)

(assert (=> b!1246776 (= lt!563190 (lemmaNoDuplicateFromThenFromBigger!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287))))

(assert (= (and start!104494 res!832002) b!1246772))

(assert (= (and b!1246772 res!832001) b!1246775))

(assert (= (and b!1246775 res!831999) b!1246774))

(assert (= (and b!1246774 c!122070) b!1246771))

(assert (= (and b!1246774 (not c!122070)) b!1246773))

(assert (= (and b!1246774 res!832000) b!1246770))

(assert (= (and b!1246770 res!832003) b!1246776))

(declare-fun m!1148507 () Bool)

(assert (=> b!1246776 m!1148507))

(declare-fun m!1148509 () Bool)

(assert (=> b!1246776 m!1148509))

(declare-fun m!1148511 () Bool)

(assert (=> b!1246772 m!1148511))

(declare-fun m!1148513 () Bool)

(assert (=> b!1246774 m!1148513))

(assert (=> b!1246774 m!1148513))

(declare-fun m!1148515 () Bool)

(assert (=> b!1246774 m!1148515))

(assert (=> b!1246771 m!1148513))

(declare-fun m!1148517 () Bool)

(assert (=> b!1246771 m!1148517))

(declare-fun m!1148519 () Bool)

(assert (=> b!1246771 m!1148519))

(assert (=> b!1246770 m!1148519))

(declare-fun m!1148521 () Bool)

(assert (=> start!104494 m!1148521))

(push 1)

(assert (not b!1246772))

(assert (not start!104494))

(assert (not b!1246774))

(assert (not b!1246770))

(assert (not b!1246776))

(assert (not b!1246771))

