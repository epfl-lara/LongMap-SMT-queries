; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104304 () Bool)

(assert start!104304)

(declare-fun res!830908 () Bool)

(declare-fun e!706518 () Bool)

(assert (=> start!104304 (=> (not res!830908) (not e!706518))))

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((array!80126 0))(
  ( (array!80127 (arr!38648 (Array (_ BitVec 32) (_ BitVec 64))) (size!39185 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80126)

(assert (=> start!104304 (= res!830908 (and (bvslt (size!39185 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39185 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39185 a!3892))))))

(assert (=> start!104304 e!706518))

(declare-fun array_inv!29586 (array!80126) Bool)

(assert (=> start!104304 (array_inv!29586 a!3892)))

(assert (=> start!104304 true))

(declare-fun b!1246142 () Bool)

(declare-fun res!830909 () Bool)

(assert (=> b!1246142 (=> (not res!830909) (not e!706518))))

(declare-datatypes ((List!27464 0))(
  ( (Nil!27461) (Cons!27460 (h!28678 (_ BitVec 64)) (t!40925 List!27464)) )
))
(declare-fun arrayNoDuplicates!0 (array!80126 (_ BitVec 32) List!27464) Bool)

(assert (=> b!1246142 (= res!830909 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27461))))

(declare-fun b!1246143 () Bool)

(declare-fun res!830910 () Bool)

(assert (=> b!1246143 (=> (not res!830910) (not e!706518))))

(assert (=> b!1246143 (= res!830910 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39185 a!3892)) (= newFrom!287 (size!39185 a!3892)) (bvsge newFrom!287 #b00000000000000000000000000000000)))))

(declare-fun b!1246144 () Bool)

(declare-fun noDuplicate!2029 (List!27464) Bool)

(assert (=> b!1246144 (= e!706518 (not (noDuplicate!2029 Nil!27461)))))

(assert (= (and start!104304 res!830908) b!1246142))

(assert (= (and b!1246142 res!830909) b!1246143))

(assert (= (and b!1246143 res!830910) b!1246144))

(declare-fun m!1148685 () Bool)

(assert (=> start!104304 m!1148685))

(declare-fun m!1148687 () Bool)

(assert (=> b!1246142 m!1148687))

(declare-fun m!1148689 () Bool)

(assert (=> b!1246144 m!1148689))

(check-sat (not b!1246144) (not start!104304) (not b!1246142))
(check-sat)
(get-model)

(declare-fun d!137695 () Bool)

(declare-fun res!830933 () Bool)

(declare-fun e!706536 () Bool)

(assert (=> d!137695 (=> res!830933 e!706536)))

(get-info :version)

(assert (=> d!137695 (= res!830933 ((_ is Nil!27461) Nil!27461))))

(assert (=> d!137695 (= (noDuplicate!2029 Nil!27461) e!706536)))

(declare-fun b!1246167 () Bool)

(declare-fun e!706537 () Bool)

(assert (=> b!1246167 (= e!706536 e!706537)))

(declare-fun res!830934 () Bool)

(assert (=> b!1246167 (=> (not res!830934) (not e!706537))))

(declare-fun contains!7466 (List!27464 (_ BitVec 64)) Bool)

(assert (=> b!1246167 (= res!830934 (not (contains!7466 (t!40925 Nil!27461) (h!28678 Nil!27461))))))

(declare-fun b!1246168 () Bool)

(assert (=> b!1246168 (= e!706537 (noDuplicate!2029 (t!40925 Nil!27461)))))

(assert (= (and d!137695 (not res!830933)) b!1246167))

(assert (= (and b!1246167 res!830934) b!1246168))

(declare-fun m!1148703 () Bool)

(assert (=> b!1246167 m!1148703))

(declare-fun m!1148705 () Bool)

(assert (=> b!1246168 m!1148705))

(assert (=> b!1246144 d!137695))

(declare-fun d!137697 () Bool)

(assert (=> d!137697 (= (array_inv!29586 a!3892) (bvsge (size!39185 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104304 d!137697))

(declare-fun d!137699 () Bool)

(declare-fun res!830954 () Bool)

(declare-fun e!706562 () Bool)

(assert (=> d!137699 (=> res!830954 e!706562)))

(assert (=> d!137699 (= res!830954 (bvsge from!3270 (size!39185 a!3892)))))

(assert (=> d!137699 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27461) e!706562)))

(declare-fun b!1246195 () Bool)

(declare-fun e!706560 () Bool)

(declare-fun e!706561 () Bool)

(assert (=> b!1246195 (= e!706560 e!706561)))

(declare-fun c!122313 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246195 (= c!122313 (validKeyInArray!0 (select (arr!38648 a!3892) from!3270)))))

(declare-fun b!1246196 () Bool)

(declare-fun call!61508 () Bool)

(assert (=> b!1246196 (= e!706561 call!61508)))

(declare-fun bm!61505 () Bool)

(assert (=> bm!61505 (= call!61508 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!122313 (Cons!27460 (select (arr!38648 a!3892) from!3270) Nil!27461) Nil!27461)))))

(declare-fun b!1246197 () Bool)

(assert (=> b!1246197 (= e!706561 call!61508)))

(declare-fun b!1246198 () Bool)

(declare-fun e!706563 () Bool)

(assert (=> b!1246198 (= e!706563 (contains!7466 Nil!27461 (select (arr!38648 a!3892) from!3270)))))

(declare-fun b!1246199 () Bool)

(assert (=> b!1246199 (= e!706562 e!706560)))

(declare-fun res!830955 () Bool)

(assert (=> b!1246199 (=> (not res!830955) (not e!706560))))

(assert (=> b!1246199 (= res!830955 (not e!706563))))

(declare-fun res!830953 () Bool)

(assert (=> b!1246199 (=> (not res!830953) (not e!706563))))

(assert (=> b!1246199 (= res!830953 (validKeyInArray!0 (select (arr!38648 a!3892) from!3270)))))

(assert (= (and d!137699 (not res!830954)) b!1246199))

(assert (= (and b!1246199 res!830953) b!1246198))

(assert (= (and b!1246199 res!830955) b!1246195))

(assert (= (and b!1246195 c!122313) b!1246197))

(assert (= (and b!1246195 (not c!122313)) b!1246196))

(assert (= (or b!1246197 b!1246196) bm!61505))

(declare-fun m!1148711 () Bool)

(assert (=> b!1246195 m!1148711))

(assert (=> b!1246195 m!1148711))

(declare-fun m!1148713 () Bool)

(assert (=> b!1246195 m!1148713))

(assert (=> bm!61505 m!1148711))

(declare-fun m!1148715 () Bool)

(assert (=> bm!61505 m!1148715))

(assert (=> b!1246198 m!1148711))

(assert (=> b!1246198 m!1148711))

(declare-fun m!1148717 () Bool)

(assert (=> b!1246198 m!1148717))

(assert (=> b!1246199 m!1148711))

(assert (=> b!1246199 m!1148711))

(assert (=> b!1246199 m!1148713))

(assert (=> b!1246142 d!137699))

(check-sat (not bm!61505) (not b!1246195) (not b!1246167) (not b!1246198) (not b!1246199) (not b!1246168))
(check-sat)
