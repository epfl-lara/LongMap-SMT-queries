; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103928 () Bool)

(assert start!103928)

(declare-fun b!1244012 () Bool)

(declare-datatypes ((Unit!41169 0))(
  ( (Unit!41170) )
))
(declare-fun e!705095 () Unit!41169)

(declare-fun lt!562403 () Unit!41169)

(assert (=> b!1244012 (= e!705095 lt!562403)))

(declare-datatypes ((array!79946 0))(
  ( (array!79947 (arr!38567 (Array (_ BitVec 32) (_ BitVec 64))) (size!39105 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79946)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27471 0))(
  ( (Nil!27468) (Cons!27467 (h!28676 (_ BitVec 64)) (t!40931 List!27471)) )
))
(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79946 List!27471 List!27471 (_ BitVec 32)) Unit!41169)

(assert (=> b!1244012 (= lt!562403 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27467 (select (arr!38567 a!3892) from!3270) Nil!27468) Nil!27468 (bvadd #b00000000000000000000000000000001 from!3270)))))

(declare-fun arrayNoDuplicates!0 (array!79946 (_ BitVec 32) List!27471) Bool)

(assert (=> b!1244012 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27468)))

(declare-fun b!1244013 () Bool)

(declare-fun e!705093 () Bool)

(declare-fun e!705096 () Bool)

(assert (=> b!1244013 (= e!705093 e!705096)))

(declare-fun res!829812 () Bool)

(assert (=> b!1244013 (=> (not res!829812) (not e!705096))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1244013 (= res!829812 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!562404 () Unit!41169)

(assert (=> b!1244013 (= lt!562404 e!705095)))

(declare-fun c!121789 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244013 (= c!121789 (validKeyInArray!0 (select (arr!38567 a!3892) from!3270)))))

(declare-fun b!1244014 () Bool)

(declare-fun res!829809 () Bool)

(assert (=> b!1244014 (=> (not res!829809) (not e!705093))))

(assert (=> b!1244014 (= res!829809 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27468))))

(declare-fun b!1244015 () Bool)

(declare-fun res!829811 () Bool)

(assert (=> b!1244015 (=> (not res!829811) (not e!705093))))

(assert (=> b!1244015 (= res!829811 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39105 a!3892)) (not (= newFrom!287 (size!39105 a!3892)))))))

(declare-fun b!1244016 () Bool)

(declare-fun Unit!41171 () Unit!41169)

(assert (=> b!1244016 (= e!705095 Unit!41171)))

(declare-fun b!1244017 () Bool)

(assert (=> b!1244017 (= e!705096 false)))

(declare-fun lt!562402 () Bool)

(assert (=> b!1244017 (= lt!562402 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27468))))

(declare-fun res!829810 () Bool)

(assert (=> start!103928 (=> (not res!829810) (not e!705093))))

(assert (=> start!103928 (= res!829810 (and (bvslt (size!39105 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39105 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39105 a!3892))))))

(assert (=> start!103928 e!705093))

(declare-fun array_inv!29550 (array!79946) Bool)

(assert (=> start!103928 (array_inv!29550 a!3892)))

(assert (=> start!103928 true))

(assert (= (and start!103928 res!829810) b!1244014))

(assert (= (and b!1244014 res!829809) b!1244015))

(assert (= (and b!1244015 res!829811) b!1244013))

(assert (= (and b!1244013 c!121789) b!1244012))

(assert (= (and b!1244013 (not c!121789)) b!1244016))

(assert (= (and b!1244013 res!829812) b!1244017))

(declare-fun m!1145949 () Bool)

(assert (=> b!1244013 m!1145949))

(assert (=> b!1244013 m!1145949))

(declare-fun m!1145951 () Bool)

(assert (=> b!1244013 m!1145951))

(declare-fun m!1145953 () Bool)

(assert (=> b!1244017 m!1145953))

(declare-fun m!1145955 () Bool)

(assert (=> b!1244014 m!1145955))

(declare-fun m!1145957 () Bool)

(assert (=> start!103928 m!1145957))

(assert (=> b!1244012 m!1145949))

(declare-fun m!1145959 () Bool)

(assert (=> b!1244012 m!1145959))

(assert (=> b!1244012 m!1145953))

(check-sat (not start!103928) (not b!1244012) (not b!1244017) (not b!1244013) (not b!1244014))
(check-sat)
