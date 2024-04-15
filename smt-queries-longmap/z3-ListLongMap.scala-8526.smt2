; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103946 () Bool)

(assert start!103946)

(declare-fun b!1244174 () Bool)

(declare-fun res!829918 () Bool)

(declare-fun e!705202 () Bool)

(assert (=> b!1244174 (=> (not res!829918) (not e!705202))))

(declare-datatypes ((array!79964 0))(
  ( (array!79965 (arr!38576 (Array (_ BitVec 32) (_ BitVec 64))) (size!39114 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79964)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27480 0))(
  ( (Nil!27477) (Cons!27476 (h!28685 (_ BitVec 64)) (t!40940 List!27480)) )
))
(declare-fun arrayNoDuplicates!0 (array!79964 (_ BitVec 32) List!27480) Bool)

(assert (=> b!1244174 (= res!829918 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27477))))

(declare-fun b!1244175 () Bool)

(declare-fun res!829920 () Bool)

(assert (=> b!1244175 (=> (not res!829920) (not e!705202))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1244175 (= res!829920 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39114 a!3892)) (not (= newFrom!287 (size!39114 a!3892)))))))

(declare-fun b!1244176 () Bool)

(declare-datatypes ((Unit!41196 0))(
  ( (Unit!41197) )
))
(declare-fun e!705204 () Unit!41196)

(declare-fun lt!562485 () Unit!41196)

(assert (=> b!1244176 (= e!705204 lt!562485)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79964 List!27480 List!27480 (_ BitVec 32)) Unit!41196)

(assert (=> b!1244176 (= lt!562485 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27476 (select (arr!38576 a!3892) from!3270) Nil!27477) Nil!27477 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1244176 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27477)))

(declare-fun res!829919 () Bool)

(assert (=> start!103946 (=> (not res!829919) (not e!705202))))

(assert (=> start!103946 (= res!829919 (and (bvslt (size!39114 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39114 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39114 a!3892))))))

(assert (=> start!103946 e!705202))

(declare-fun array_inv!29559 (array!79964) Bool)

(assert (=> start!103946 (array_inv!29559 a!3892)))

(assert (=> start!103946 true))

(declare-fun b!1244177 () Bool)

(declare-fun e!705201 () Bool)

(assert (=> b!1244177 (= e!705201 false)))

(declare-fun lt!562483 () Bool)

(assert (=> b!1244177 (= lt!562483 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27477))))

(declare-fun b!1244178 () Bool)

(declare-fun Unit!41198 () Unit!41196)

(assert (=> b!1244178 (= e!705204 Unit!41198)))

(declare-fun b!1244179 () Bool)

(assert (=> b!1244179 (= e!705202 e!705201)))

(declare-fun res!829917 () Bool)

(assert (=> b!1244179 (=> (not res!829917) (not e!705201))))

(assert (=> b!1244179 (= res!829917 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!562484 () Unit!41196)

(assert (=> b!1244179 (= lt!562484 e!705204)))

(declare-fun c!121816 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244179 (= c!121816 (validKeyInArray!0 (select (arr!38576 a!3892) from!3270)))))

(assert (= (and start!103946 res!829919) b!1244174))

(assert (= (and b!1244174 res!829918) b!1244175))

(assert (= (and b!1244175 res!829920) b!1244179))

(assert (= (and b!1244179 c!121816) b!1244176))

(assert (= (and b!1244179 (not c!121816)) b!1244178))

(assert (= (and b!1244179 res!829917) b!1244177))

(declare-fun m!1146057 () Bool)

(assert (=> b!1244174 m!1146057))

(declare-fun m!1146059 () Bool)

(assert (=> b!1244177 m!1146059))

(declare-fun m!1146061 () Bool)

(assert (=> start!103946 m!1146061))

(declare-fun m!1146063 () Bool)

(assert (=> b!1244176 m!1146063))

(declare-fun m!1146065 () Bool)

(assert (=> b!1244176 m!1146065))

(assert (=> b!1244176 m!1146059))

(assert (=> b!1244179 m!1146063))

(assert (=> b!1244179 m!1146063))

(declare-fun m!1146067 () Bool)

(assert (=> b!1244179 m!1146067))

(check-sat (not b!1244179) (not b!1244177) (not b!1244174) (not start!103946) (not b!1244176))
(check-sat)
