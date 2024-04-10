; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103944 () Bool)

(assert start!103944)

(declare-fun res!829912 () Bool)

(declare-fun e!705199 () Bool)

(assert (=> start!103944 (=> (not res!829912) (not e!705199))))

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((array!80036 0))(
  ( (array!80037 (arr!38611 (Array (_ BitVec 32) (_ BitVec 64))) (size!39147 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80036)

(assert (=> start!103944 (= res!829912 (and (bvslt (size!39147 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39147 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39147 a!3892))))))

(assert (=> start!103944 e!705199))

(declare-fun array_inv!29459 (array!80036) Bool)

(assert (=> start!103944 (array_inv!29459 a!3892)))

(assert (=> start!103944 true))

(declare-fun b!1244184 () Bool)

(declare-fun res!829909 () Bool)

(assert (=> b!1244184 (=> (not res!829909) (not e!705199))))

(declare-datatypes ((List!27414 0))(
  ( (Nil!27411) (Cons!27410 (h!28619 (_ BitVec 64)) (t!40883 List!27414)) )
))
(declare-fun arrayNoDuplicates!0 (array!80036 (_ BitVec 32) List!27414) Bool)

(assert (=> b!1244184 (= res!829909 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27411))))

(declare-fun b!1244185 () Bool)

(declare-fun e!705201 () Bool)

(assert (=> b!1244185 (= e!705201 false)))

(declare-fun lt!562626 () Bool)

(assert (=> b!1244185 (= lt!562626 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27411))))

(declare-fun b!1244186 () Bool)

(declare-datatypes ((Unit!41339 0))(
  ( (Unit!41340) )
))
(declare-fun e!705200 () Unit!41339)

(declare-fun lt!562628 () Unit!41339)

(assert (=> b!1244186 (= e!705200 lt!562628)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80036 List!27414 List!27414 (_ BitVec 32)) Unit!41339)

(assert (=> b!1244186 (= lt!562628 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27410 (select (arr!38611 a!3892) from!3270) Nil!27411) Nil!27411 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1244186 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27411)))

(declare-fun b!1244187 () Bool)

(declare-fun res!829911 () Bool)

(assert (=> b!1244187 (=> (not res!829911) (not e!705199))))

(assert (=> b!1244187 (= res!829911 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39147 a!3892)) (not (= newFrom!287 (size!39147 a!3892)))))))

(declare-fun b!1244188 () Bool)

(declare-fun Unit!41341 () Unit!41339)

(assert (=> b!1244188 (= e!705200 Unit!41341)))

(declare-fun b!1244189 () Bool)

(assert (=> b!1244189 (= e!705199 e!705201)))

(declare-fun res!829910 () Bool)

(assert (=> b!1244189 (=> (not res!829910) (not e!705201))))

(assert (=> b!1244189 (= res!829910 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!562627 () Unit!41339)

(assert (=> b!1244189 (= lt!562627 e!705200)))

(declare-fun c!121822 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244189 (= c!121822 (validKeyInArray!0 (select (arr!38611 a!3892) from!3270)))))

(assert (= (and start!103944 res!829912) b!1244184))

(assert (= (and b!1244184 res!829909) b!1244187))

(assert (= (and b!1244187 res!829911) b!1244189))

(assert (= (and b!1244189 c!121822) b!1244186))

(assert (= (and b!1244189 (not c!121822)) b!1244188))

(assert (= (and b!1244189 res!829910) b!1244185))

(declare-fun m!1146539 () Bool)

(assert (=> start!103944 m!1146539))

(declare-fun m!1146541 () Bool)

(assert (=> b!1244189 m!1146541))

(assert (=> b!1244189 m!1146541))

(declare-fun m!1146543 () Bool)

(assert (=> b!1244189 m!1146543))

(assert (=> b!1244186 m!1146541))

(declare-fun m!1146545 () Bool)

(assert (=> b!1244186 m!1146545))

(declare-fun m!1146547 () Bool)

(assert (=> b!1244186 m!1146547))

(declare-fun m!1146549 () Bool)

(assert (=> b!1244184 m!1146549))

(assert (=> b!1244185 m!1146547))

(push 1)

