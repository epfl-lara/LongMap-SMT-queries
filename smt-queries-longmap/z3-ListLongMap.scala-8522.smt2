; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103930 () Bool)

(assert start!103930)

(declare-fun b!1244058 () Bool)

(declare-fun res!829827 () Bool)

(declare-fun e!705117 () Bool)

(assert (=> b!1244058 (=> (not res!829827) (not e!705117))))

(declare-datatypes ((array!80022 0))(
  ( (array!80023 (arr!38604 (Array (_ BitVec 32) (_ BitVec 64))) (size!39140 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80022)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1244058 (= res!829827 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39140 a!3892)) (not (= newFrom!287 (size!39140 a!3892)))))))

(declare-fun b!1244059 () Bool)

(declare-fun e!705114 () Bool)

(assert (=> b!1244059 (= e!705117 e!705114)))

(declare-fun res!829825 () Bool)

(assert (=> b!1244059 (=> (not res!829825) (not e!705114))))

(assert (=> b!1244059 (= res!829825 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-datatypes ((Unit!41318 0))(
  ( (Unit!41319) )
))
(declare-fun lt!562564 () Unit!41318)

(declare-fun e!705116 () Unit!41318)

(assert (=> b!1244059 (= lt!562564 e!705116)))

(declare-fun c!121801 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244059 (= c!121801 (validKeyInArray!0 (select (arr!38604 a!3892) from!3270)))))

(declare-fun res!829828 () Bool)

(assert (=> start!103930 (=> (not res!829828) (not e!705117))))

(assert (=> start!103930 (= res!829828 (and (bvslt (size!39140 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39140 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39140 a!3892))))))

(assert (=> start!103930 e!705117))

(declare-fun array_inv!29452 (array!80022) Bool)

(assert (=> start!103930 (array_inv!29452 a!3892)))

(assert (=> start!103930 true))

(declare-fun b!1244060 () Bool)

(declare-fun lt!562565 () Unit!41318)

(assert (=> b!1244060 (= e!705116 lt!562565)))

(declare-datatypes ((List!27407 0))(
  ( (Nil!27404) (Cons!27403 (h!28612 (_ BitVec 64)) (t!40876 List!27407)) )
))
(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80022 List!27407 List!27407 (_ BitVec 32)) Unit!41318)

(assert (=> b!1244060 (= lt!562565 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27403 (select (arr!38604 a!3892) from!3270) Nil!27404) Nil!27404 (bvadd #b00000000000000000000000000000001 from!3270)))))

(declare-fun arrayNoDuplicates!0 (array!80022 (_ BitVec 32) List!27407) Bool)

(assert (=> b!1244060 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27404)))

(declare-fun b!1244061 () Bool)

(declare-fun Unit!41320 () Unit!41318)

(assert (=> b!1244061 (= e!705116 Unit!41320)))

(declare-fun b!1244062 () Bool)

(assert (=> b!1244062 (= e!705114 false)))

(declare-fun lt!562563 () Bool)

(assert (=> b!1244062 (= lt!562563 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27404))))

(declare-fun b!1244063 () Bool)

(declare-fun res!829826 () Bool)

(assert (=> b!1244063 (=> (not res!829826) (not e!705117))))

(assert (=> b!1244063 (= res!829826 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27404))))

(assert (= (and start!103930 res!829828) b!1244063))

(assert (= (and b!1244063 res!829826) b!1244058))

(assert (= (and b!1244058 res!829827) b!1244059))

(assert (= (and b!1244059 c!121801) b!1244060))

(assert (= (and b!1244059 (not c!121801)) b!1244061))

(assert (= (and b!1244059 res!829825) b!1244062))

(declare-fun m!1146455 () Bool)

(assert (=> start!103930 m!1146455))

(declare-fun m!1146457 () Bool)

(assert (=> b!1244063 m!1146457))

(declare-fun m!1146459 () Bool)

(assert (=> b!1244062 m!1146459))

(declare-fun m!1146461 () Bool)

(assert (=> b!1244059 m!1146461))

(assert (=> b!1244059 m!1146461))

(declare-fun m!1146463 () Bool)

(assert (=> b!1244059 m!1146463))

(assert (=> b!1244060 m!1146461))

(declare-fun m!1146465 () Bool)

(assert (=> b!1244060 m!1146465))

(assert (=> b!1244060 m!1146459))

(check-sat (not b!1244062) (not b!1244059) (not start!103930) (not b!1244060) (not b!1244063))
