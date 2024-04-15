; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103958 () Bool)

(assert start!103958)

(declare-fun b!1244293 () Bool)

(declare-fun e!705273 () Bool)

(declare-fun e!705274 () Bool)

(assert (=> b!1244293 (= e!705273 e!705274)))

(declare-fun res!830003 () Bool)

(assert (=> b!1244293 (=> (not res!830003) (not e!705274))))

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1244293 (= res!830003 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-datatypes ((Unit!41214 0))(
  ( (Unit!41215) )
))
(declare-fun lt!562538 () Unit!41214)

(declare-fun e!705275 () Unit!41214)

(assert (=> b!1244293 (= lt!562538 e!705275)))

(declare-fun c!121834 () Bool)

(declare-datatypes ((array!79976 0))(
  ( (array!79977 (arr!38582 (Array (_ BitVec 32) (_ BitVec 64))) (size!39120 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79976)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244293 (= c!121834 (validKeyInArray!0 (select (arr!38582 a!3892) from!3270)))))

(declare-fun b!1244294 () Bool)

(declare-fun res!830004 () Bool)

(assert (=> b!1244294 (=> (not res!830004) (not e!705273))))

(assert (=> b!1244294 (= res!830004 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39120 a!3892)) (not (= newFrom!287 (size!39120 a!3892)))))))

(declare-fun b!1244295 () Bool)

(assert (=> b!1244295 (= e!705274 (not true))))

(declare-datatypes ((List!27486 0))(
  ( (Nil!27483) (Cons!27482 (h!28691 (_ BitVec 64)) (t!40946 List!27486)) )
))
(declare-fun arrayNoDuplicates!0 (array!79976 (_ BitVec 32) List!27486) Bool)

(assert (=> b!1244295 (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27483)))

(declare-fun lt!562539 () Unit!41214)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!79976 (_ BitVec 32) (_ BitVec 32)) Unit!41214)

(assert (=> b!1244295 (= lt!562539 (lemmaNoDuplicateFromThenFromBigger!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287))))

(declare-fun res!830002 () Bool)

(assert (=> start!103958 (=> (not res!830002) (not e!705273))))

(assert (=> start!103958 (= res!830002 (and (bvslt (size!39120 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39120 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39120 a!3892))))))

(assert (=> start!103958 e!705273))

(declare-fun array_inv!29565 (array!79976) Bool)

(assert (=> start!103958 (array_inv!29565 a!3892)))

(assert (=> start!103958 true))

(declare-fun b!1244296 () Bool)

(declare-fun Unit!41216 () Unit!41214)

(assert (=> b!1244296 (= e!705275 Unit!41216)))

(declare-fun b!1244297 () Bool)

(declare-fun res!830000 () Bool)

(assert (=> b!1244297 (=> (not res!830000) (not e!705273))))

(assert (=> b!1244297 (= res!830000 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27483))))

(declare-fun b!1244298 () Bool)

(declare-fun res!830001 () Bool)

(assert (=> b!1244298 (=> (not res!830001) (not e!705274))))

(assert (=> b!1244298 (= res!830001 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27483))))

(declare-fun b!1244299 () Bool)

(declare-fun lt!562537 () Unit!41214)

(assert (=> b!1244299 (= e!705275 lt!562537)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79976 List!27486 List!27486 (_ BitVec 32)) Unit!41214)

(assert (=> b!1244299 (= lt!562537 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27482 (select (arr!38582 a!3892) from!3270) Nil!27483) Nil!27483 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1244299 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27483)))

(assert (= (and start!103958 res!830002) b!1244297))

(assert (= (and b!1244297 res!830000) b!1244294))

(assert (= (and b!1244294 res!830004) b!1244293))

(assert (= (and b!1244293 c!121834) b!1244299))

(assert (= (and b!1244293 (not c!121834)) b!1244296))

(assert (= (and b!1244293 res!830003) b!1244298))

(assert (= (and b!1244298 res!830001) b!1244295))

(declare-fun m!1146141 () Bool)

(assert (=> b!1244295 m!1146141))

(declare-fun m!1146143 () Bool)

(assert (=> b!1244295 m!1146143))

(declare-fun m!1146145 () Bool)

(assert (=> b!1244293 m!1146145))

(assert (=> b!1244293 m!1146145))

(declare-fun m!1146147 () Bool)

(assert (=> b!1244293 m!1146147))

(declare-fun m!1146149 () Bool)

(assert (=> start!103958 m!1146149))

(declare-fun m!1146151 () Bool)

(assert (=> b!1244298 m!1146151))

(assert (=> b!1244299 m!1146145))

(declare-fun m!1146153 () Bool)

(assert (=> b!1244299 m!1146153))

(assert (=> b!1244299 m!1146151))

(declare-fun m!1146155 () Bool)

(assert (=> b!1244297 m!1146155))

(check-sat (not b!1244297) (not b!1244295) (not b!1244293) (not b!1244299) (not start!103958) (not b!1244298))
(check-sat)
