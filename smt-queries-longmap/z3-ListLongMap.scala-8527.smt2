; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103952 () Bool)

(assert start!103952)

(declare-fun b!1244230 () Bool)

(declare-fun res!829955 () Bool)

(declare-fun e!705239 () Bool)

(assert (=> b!1244230 (=> (not res!829955) (not e!705239))))

(declare-datatypes ((array!79970 0))(
  ( (array!79971 (arr!38579 (Array (_ BitVec 32) (_ BitVec 64))) (size!39117 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79970)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27483 0))(
  ( (Nil!27480) (Cons!27479 (h!28688 (_ BitVec 64)) (t!40943 List!27483)) )
))
(declare-fun arrayNoDuplicates!0 (array!79970 (_ BitVec 32) List!27483) Bool)

(assert (=> b!1244230 (= res!829955 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27480))))

(declare-fun res!829958 () Bool)

(assert (=> start!103952 (=> (not res!829958) (not e!705239))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!103952 (= res!829958 (and (bvslt (size!39117 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39117 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39117 a!3892))))))

(assert (=> start!103952 e!705239))

(declare-fun array_inv!29562 (array!79970) Bool)

(assert (=> start!103952 (array_inv!29562 a!3892)))

(assert (=> start!103952 true))

(declare-fun b!1244231 () Bool)

(declare-datatypes ((Unit!41205 0))(
  ( (Unit!41206) )
))
(declare-fun e!705238 () Unit!41205)

(declare-fun Unit!41207 () Unit!41205)

(assert (=> b!1244231 (= e!705238 Unit!41207)))

(declare-fun b!1244232 () Bool)

(declare-fun res!829956 () Bool)

(assert (=> b!1244232 (=> (not res!829956) (not e!705239))))

(assert (=> b!1244232 (= res!829956 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39117 a!3892)) (not (= newFrom!287 (size!39117 a!3892)))))))

(declare-fun b!1244233 () Bool)

(declare-fun lt!562511 () Unit!41205)

(assert (=> b!1244233 (= e!705238 lt!562511)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79970 List!27483 List!27483 (_ BitVec 32)) Unit!41205)

(assert (=> b!1244233 (= lt!562511 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27479 (select (arr!38579 a!3892) from!3270) Nil!27480) Nil!27480 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1244233 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27480)))

(declare-fun b!1244234 () Bool)

(declare-fun res!829957 () Bool)

(declare-fun e!705237 () Bool)

(assert (=> b!1244234 (=> (not res!829957) (not e!705237))))

(assert (=> b!1244234 (= res!829957 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27480))))

(declare-fun b!1244235 () Bool)

(assert (=> b!1244235 (= e!705237 (not (bvsge newFrom!287 #b00000000000000000000000000000000)))))

(assert (=> b!1244235 (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27480)))

(declare-fun lt!562512 () Unit!41205)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!79970 (_ BitVec 32) (_ BitVec 32)) Unit!41205)

(assert (=> b!1244235 (= lt!562512 (lemmaNoDuplicateFromThenFromBigger!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287))))

(declare-fun b!1244236 () Bool)

(assert (=> b!1244236 (= e!705239 e!705237)))

(declare-fun res!829959 () Bool)

(assert (=> b!1244236 (=> (not res!829959) (not e!705237))))

(assert (=> b!1244236 (= res!829959 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!562510 () Unit!41205)

(assert (=> b!1244236 (= lt!562510 e!705238)))

(declare-fun c!121825 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244236 (= c!121825 (validKeyInArray!0 (select (arr!38579 a!3892) from!3270)))))

(assert (= (and start!103952 res!829958) b!1244230))

(assert (= (and b!1244230 res!829955) b!1244232))

(assert (= (and b!1244232 res!829956) b!1244236))

(assert (= (and b!1244236 c!121825) b!1244233))

(assert (= (and b!1244236 (not c!121825)) b!1244231))

(assert (= (and b!1244236 res!829959) b!1244234))

(assert (= (and b!1244234 res!829957) b!1244235))

(declare-fun m!1146093 () Bool)

(assert (=> b!1244234 m!1146093))

(declare-fun m!1146095 () Bool)

(assert (=> start!103952 m!1146095))

(declare-fun m!1146097 () Bool)

(assert (=> b!1244233 m!1146097))

(declare-fun m!1146099 () Bool)

(assert (=> b!1244233 m!1146099))

(assert (=> b!1244233 m!1146093))

(assert (=> b!1244236 m!1146097))

(assert (=> b!1244236 m!1146097))

(declare-fun m!1146101 () Bool)

(assert (=> b!1244236 m!1146101))

(declare-fun m!1146103 () Bool)

(assert (=> b!1244230 m!1146103))

(declare-fun m!1146105 () Bool)

(assert (=> b!1244235 m!1146105))

(declare-fun m!1146107 () Bool)

(assert (=> b!1244235 m!1146107))

(check-sat (not b!1244236) (not b!1244233) (not b!1244235) (not start!103952) (not b!1244230) (not b!1244234))
(check-sat)
