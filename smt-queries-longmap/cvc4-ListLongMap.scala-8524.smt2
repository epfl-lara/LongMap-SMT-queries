; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103936 () Bool)

(assert start!103936)

(declare-fun b!1244084 () Bool)

(declare-datatypes ((Unit!41181 0))(
  ( (Unit!41182) )
))
(declare-fun e!705141 () Unit!41181)

(declare-fun lt!562440 () Unit!41181)

(assert (=> b!1244084 (= e!705141 lt!562440)))

(declare-datatypes ((array!79954 0))(
  ( (array!79955 (arr!38571 (Array (_ BitVec 32) (_ BitVec 64))) (size!39109 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79954)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27475 0))(
  ( (Nil!27472) (Cons!27471 (h!28680 (_ BitVec 64)) (t!40935 List!27475)) )
))
(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79954 List!27475 List!27475 (_ BitVec 32)) Unit!41181)

(assert (=> b!1244084 (= lt!562440 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27471 (select (arr!38571 a!3892) from!3270) Nil!27472) Nil!27472 (bvadd #b00000000000000000000000000000001 from!3270)))))

(declare-fun arrayNoDuplicates!0 (array!79954 (_ BitVec 32) List!27475) Bool)

(assert (=> b!1244084 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27472)))

(declare-fun b!1244085 () Bool)

(declare-fun res!829857 () Bool)

(declare-fun e!705143 () Bool)

(assert (=> b!1244085 (=> (not res!829857) (not e!705143))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1244085 (= res!829857 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39109 a!3892)) (not (= newFrom!287 (size!39109 a!3892)))))))

(declare-fun res!829859 () Bool)

(assert (=> start!103936 (=> (not res!829859) (not e!705143))))

(assert (=> start!103936 (= res!829859 (and (bvslt (size!39109 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39109 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39109 a!3892))))))

(assert (=> start!103936 e!705143))

(declare-fun array_inv!29554 (array!79954) Bool)

(assert (=> start!103936 (array_inv!29554 a!3892)))

(assert (=> start!103936 true))

(declare-fun b!1244086 () Bool)

(declare-fun res!829858 () Bool)

(assert (=> b!1244086 (=> (not res!829858) (not e!705143))))

(assert (=> b!1244086 (= res!829858 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27472))))

(declare-fun b!1244087 () Bool)

(declare-fun e!705144 () Bool)

(assert (=> b!1244087 (= e!705144 false)))

(declare-fun lt!562439 () Bool)

(assert (=> b!1244087 (= lt!562439 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27472))))

(declare-fun b!1244088 () Bool)

(assert (=> b!1244088 (= e!705143 e!705144)))

(declare-fun res!829860 () Bool)

(assert (=> b!1244088 (=> (not res!829860) (not e!705144))))

(assert (=> b!1244088 (= res!829860 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!562438 () Unit!41181)

(assert (=> b!1244088 (= lt!562438 e!705141)))

(declare-fun c!121801 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244088 (= c!121801 (validKeyInArray!0 (select (arr!38571 a!3892) from!3270)))))

(declare-fun b!1244089 () Bool)

(declare-fun Unit!41183 () Unit!41181)

(assert (=> b!1244089 (= e!705141 Unit!41183)))

(assert (= (and start!103936 res!829859) b!1244086))

(assert (= (and b!1244086 res!829858) b!1244085))

(assert (= (and b!1244085 res!829857) b!1244088))

(assert (= (and b!1244088 c!121801) b!1244084))

(assert (= (and b!1244088 (not c!121801)) b!1244089))

(assert (= (and b!1244088 res!829860) b!1244087))

(declare-fun m!1145997 () Bool)

(assert (=> b!1244088 m!1145997))

(assert (=> b!1244088 m!1145997))

(declare-fun m!1145999 () Bool)

(assert (=> b!1244088 m!1145999))

(assert (=> b!1244084 m!1145997))

(declare-fun m!1146001 () Bool)

(assert (=> b!1244084 m!1146001))

(declare-fun m!1146003 () Bool)

(assert (=> b!1244084 m!1146003))

(declare-fun m!1146005 () Bool)

(assert (=> b!1244086 m!1146005))

(declare-fun m!1146007 () Bool)

(assert (=> start!103936 m!1146007))

(assert (=> b!1244087 m!1146003))

(push 1)

(assert (not b!1244084))

(assert (not b!1244087))

(assert (not b!1244088))

(assert (not start!103936))

(assert (not b!1244086))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

