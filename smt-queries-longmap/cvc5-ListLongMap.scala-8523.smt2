; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103934 () Bool)

(assert start!103934)

(declare-fun b!1244094 () Bool)

(declare-fun res!829849 () Bool)

(declare-fun e!705138 () Bool)

(assert (=> b!1244094 (=> (not res!829849) (not e!705138))))

(declare-datatypes ((array!80026 0))(
  ( (array!80027 (arr!38606 (Array (_ BitVec 32) (_ BitVec 64))) (size!39142 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80026)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1244094 (= res!829849 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39142 a!3892)) (not (= newFrom!287 (size!39142 a!3892)))))))

(declare-fun b!1244095 () Bool)

(declare-fun e!705140 () Bool)

(assert (=> b!1244095 (= e!705140 false)))

(declare-fun lt!562582 () Bool)

(declare-datatypes ((List!27409 0))(
  ( (Nil!27406) (Cons!27405 (h!28614 (_ BitVec 64)) (t!40878 List!27409)) )
))
(declare-fun arrayNoDuplicates!0 (array!80026 (_ BitVec 32) List!27409) Bool)

(assert (=> b!1244095 (= lt!562582 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27406))))

(declare-fun b!1244096 () Bool)

(declare-fun res!829851 () Bool)

(assert (=> b!1244096 (=> (not res!829851) (not e!705138))))

(assert (=> b!1244096 (= res!829851 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27406))))

(declare-fun b!1244097 () Bool)

(declare-datatypes ((Unit!41324 0))(
  ( (Unit!41325) )
))
(declare-fun e!705139 () Unit!41324)

(declare-fun lt!562581 () Unit!41324)

(assert (=> b!1244097 (= e!705139 lt!562581)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80026 List!27409 List!27409 (_ BitVec 32)) Unit!41324)

(assert (=> b!1244097 (= lt!562581 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27405 (select (arr!38606 a!3892) from!3270) Nil!27406) Nil!27406 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1244097 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27406)))

(declare-fun res!829852 () Bool)

(assert (=> start!103934 (=> (not res!829852) (not e!705138))))

(assert (=> start!103934 (= res!829852 (and (bvslt (size!39142 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39142 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39142 a!3892))))))

(assert (=> start!103934 e!705138))

(declare-fun array_inv!29454 (array!80026) Bool)

(assert (=> start!103934 (array_inv!29454 a!3892)))

(assert (=> start!103934 true))

(declare-fun b!1244098 () Bool)

(assert (=> b!1244098 (= e!705138 e!705140)))

(declare-fun res!829850 () Bool)

(assert (=> b!1244098 (=> (not res!829850) (not e!705140))))

(assert (=> b!1244098 (= res!829850 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!562583 () Unit!41324)

(assert (=> b!1244098 (= lt!562583 e!705139)))

(declare-fun c!121807 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244098 (= c!121807 (validKeyInArray!0 (select (arr!38606 a!3892) from!3270)))))

(declare-fun b!1244099 () Bool)

(declare-fun Unit!41326 () Unit!41324)

(assert (=> b!1244099 (= e!705139 Unit!41326)))

(assert (= (and start!103934 res!829852) b!1244096))

(assert (= (and b!1244096 res!829851) b!1244094))

(assert (= (and b!1244094 res!829849) b!1244098))

(assert (= (and b!1244098 c!121807) b!1244097))

(assert (= (and b!1244098 (not c!121807)) b!1244099))

(assert (= (and b!1244098 res!829850) b!1244095))

(declare-fun m!1146479 () Bool)

(assert (=> b!1244095 m!1146479))

(declare-fun m!1146481 () Bool)

(assert (=> start!103934 m!1146481))

(declare-fun m!1146483 () Bool)

(assert (=> b!1244098 m!1146483))

(assert (=> b!1244098 m!1146483))

(declare-fun m!1146485 () Bool)

(assert (=> b!1244098 m!1146485))

(declare-fun m!1146487 () Bool)

(assert (=> b!1244096 m!1146487))

(assert (=> b!1244097 m!1146483))

(declare-fun m!1146489 () Bool)

(assert (=> b!1244097 m!1146489))

(assert (=> b!1244097 m!1146479))

(push 1)

(assert (not b!1244098))

(assert (not b!1244095))

(assert (not start!103934))

(assert (not b!1244097))

(assert (not b!1244096))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

