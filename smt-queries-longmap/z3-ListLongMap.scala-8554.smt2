; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104448 () Bool)

(assert start!104448)

(declare-fun b!1246462 () Bool)

(declare-datatypes ((Unit!41274 0))(
  ( (Unit!41275) )
))
(declare-fun e!706933 () Unit!41274)

(declare-fun Unit!41276 () Unit!41274)

(assert (=> b!1246462 (= e!706933 Unit!41276)))

(declare-fun b!1246463 () Bool)

(declare-fun res!831813 () Bool)

(declare-fun e!706932 () Bool)

(assert (=> b!1246463 (=> (not res!831813) (not e!706932))))

(declare-datatypes ((array!80165 0))(
  ( (array!80166 (arr!38660 (Array (_ BitVec 32) (_ BitVec 64))) (size!39198 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80165)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27564 0))(
  ( (Nil!27561) (Cons!27560 (h!28769 (_ BitVec 64)) (t!41024 List!27564)) )
))
(declare-fun arrayNoDuplicates!0 (array!80165 (_ BitVec 32) List!27564) Bool)

(assert (=> b!1246463 (= res!831813 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27561))))

(declare-fun b!1246464 () Bool)

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1246464 (= e!706932 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvslt newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!562945 () Unit!41274)

(assert (=> b!1246464 (= lt!562945 e!706933)))

(declare-fun c!122013 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246464 (= c!122013 (validKeyInArray!0 (select (arr!38660 a!3892) from!3270)))))

(declare-fun b!1246465 () Bool)

(declare-fun lt!562944 () Unit!41274)

(assert (=> b!1246465 (= e!706933 lt!562944)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80165 List!27564 List!27564 (_ BitVec 32)) Unit!41274)

(assert (=> b!1246465 (= lt!562944 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27560 (select (arr!38660 a!3892) from!3270) Nil!27561) Nil!27561 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1246465 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27561)))

(declare-fun res!831811 () Bool)

(assert (=> start!104448 (=> (not res!831811) (not e!706932))))

(assert (=> start!104448 (= res!831811 (and (bvslt (size!39198 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39198 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39198 a!3892))))))

(assert (=> start!104448 e!706932))

(declare-fun array_inv!29643 (array!80165) Bool)

(assert (=> start!104448 (array_inv!29643 a!3892)))

(assert (=> start!104448 true))

(declare-fun b!1246466 () Bool)

(declare-fun res!831812 () Bool)

(assert (=> b!1246466 (=> (not res!831812) (not e!706932))))

(assert (=> b!1246466 (= res!831812 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39198 a!3892)) (not (= newFrom!287 (size!39198 a!3892)))))))

(assert (= (and start!104448 res!831811) b!1246463))

(assert (= (and b!1246463 res!831813) b!1246466))

(assert (= (and b!1246466 res!831812) b!1246464))

(assert (= (and b!1246464 c!122013) b!1246465))

(assert (= (and b!1246464 (not c!122013)) b!1246462))

(declare-fun m!1147837 () Bool)

(assert (=> b!1246463 m!1147837))

(declare-fun m!1147839 () Bool)

(assert (=> b!1246464 m!1147839))

(assert (=> b!1246464 m!1147839))

(declare-fun m!1147841 () Bool)

(assert (=> b!1246464 m!1147841))

(assert (=> b!1246465 m!1147839))

(declare-fun m!1147843 () Bool)

(assert (=> b!1246465 m!1147843))

(declare-fun m!1147845 () Bool)

(assert (=> b!1246465 m!1147845))

(declare-fun m!1147847 () Bool)

(assert (=> start!104448 m!1147847))

(check-sat (not start!104448) (not b!1246463) (not b!1246464) (not b!1246465))
(check-sat)
