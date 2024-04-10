; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103928 () Bool)

(assert start!103928)

(declare-fun b!1244040 () Bool)

(declare-fun res!829813 () Bool)

(declare-fun e!705102 () Bool)

(assert (=> b!1244040 (=> (not res!829813) (not e!705102))))

(declare-datatypes ((array!80020 0))(
  ( (array!80021 (arr!38603 (Array (_ BitVec 32) (_ BitVec 64))) (size!39139 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80020)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27406 0))(
  ( (Nil!27403) (Cons!27402 (h!28611 (_ BitVec 64)) (t!40875 List!27406)) )
))
(declare-fun arrayNoDuplicates!0 (array!80020 (_ BitVec 32) List!27406) Bool)

(assert (=> b!1244040 (= res!829813 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27403))))

(declare-fun b!1244042 () Bool)

(declare-datatypes ((Unit!41315 0))(
  ( (Unit!41316) )
))
(declare-fun e!705104 () Unit!41315)

(declare-fun lt!562554 () Unit!41315)

(assert (=> b!1244042 (= e!705104 lt!562554)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80020 List!27406 List!27406 (_ BitVec 32)) Unit!41315)

(assert (=> b!1244042 (= lt!562554 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27402 (select (arr!38603 a!3892) from!3270) Nil!27403) Nil!27403 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1244042 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27403)))

(declare-fun b!1244043 () Bool)

(declare-fun e!705103 () Bool)

(assert (=> b!1244043 (= e!705102 e!705103)))

(declare-fun res!829814 () Bool)

(assert (=> b!1244043 (=> (not res!829814) (not e!705103))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1244043 (= res!829814 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!562556 () Unit!41315)

(assert (=> b!1244043 (= lt!562556 e!705104)))

(declare-fun c!121798 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244043 (= c!121798 (validKeyInArray!0 (select (arr!38603 a!3892) from!3270)))))

(declare-fun res!829815 () Bool)

(assert (=> start!103928 (=> (not res!829815) (not e!705102))))

(assert (=> start!103928 (= res!829815 (and (bvslt (size!39139 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39139 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39139 a!3892))))))

(assert (=> start!103928 e!705102))

(declare-fun array_inv!29451 (array!80020) Bool)

(assert (=> start!103928 (array_inv!29451 a!3892)))

(assert (=> start!103928 true))

(declare-fun b!1244041 () Bool)

(declare-fun Unit!41317 () Unit!41315)

(assert (=> b!1244041 (= e!705104 Unit!41317)))

(declare-fun b!1244044 () Bool)

(declare-fun res!829816 () Bool)

(assert (=> b!1244044 (=> (not res!829816) (not e!705102))))

(assert (=> b!1244044 (= res!829816 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39139 a!3892)) (not (= newFrom!287 (size!39139 a!3892)))))))

(declare-fun b!1244045 () Bool)

(assert (=> b!1244045 (= e!705103 false)))

(declare-fun lt!562555 () Bool)

(assert (=> b!1244045 (= lt!562555 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27403))))

(assert (= (and start!103928 res!829815) b!1244040))

(assert (= (and b!1244040 res!829813) b!1244044))

(assert (= (and b!1244044 res!829816) b!1244043))

(assert (= (and b!1244043 c!121798) b!1244042))

(assert (= (and b!1244043 (not c!121798)) b!1244041))

(assert (= (and b!1244043 res!829814) b!1244045))

(declare-fun m!1146443 () Bool)

(assert (=> b!1244040 m!1146443))

(declare-fun m!1146445 () Bool)

(assert (=> start!103928 m!1146445))

(declare-fun m!1146447 () Bool)

(assert (=> b!1244043 m!1146447))

(assert (=> b!1244043 m!1146447))

(declare-fun m!1146449 () Bool)

(assert (=> b!1244043 m!1146449))

(assert (=> b!1244042 m!1146447))

(declare-fun m!1146451 () Bool)

(assert (=> b!1244042 m!1146451))

(declare-fun m!1146453 () Bool)

(assert (=> b!1244042 m!1146453))

(assert (=> b!1244045 m!1146453))

(push 1)

(assert (not b!1244043))

(assert (not start!103928))

(assert (not b!1244045))

(assert (not b!1244042))

(assert (not b!1244040))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

