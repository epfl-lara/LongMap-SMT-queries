; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60170 () Bool)

(assert start!60170)

(declare-fun b!672434 () Bool)

(declare-datatypes ((Unit!23618 0))(
  ( (Unit!23619) )
))
(declare-fun e!384076 () Unit!23618)

(declare-fun Unit!23620 () Unit!23618)

(assert (=> b!672434 (= e!384076 Unit!23620)))

(declare-datatypes ((array!39228 0))(
  ( (array!39229 (arr!18806 (Array (_ BitVec 32) (_ BitVec 64))) (size!19171 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39228)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!39228 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!672434 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312101 () Unit!23618)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39228 (_ BitVec 64) (_ BitVec 32)) Unit!23618)

(assert (=> b!672434 (= lt!312101 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!672434 false))

(declare-fun b!672435 () Bool)

(declare-fun e!384074 () Bool)

(declare-fun e!384082 () Bool)

(assert (=> b!672435 (= e!384074 e!384082)))

(declare-fun res!439207 () Bool)

(assert (=> b!672435 (=> (not res!439207) (not e!384082))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!672435 (= res!439207 (bvsle from!3004 i!1382))))

(declare-fun b!672436 () Bool)

(declare-fun res!439203 () Bool)

(declare-fun e!384077 () Bool)

(assert (=> b!672436 (=> (not res!439203) (not e!384077))))

(assert (=> b!672436 (= res!439203 e!384074)))

(declare-fun res!439216 () Bool)

(assert (=> b!672436 (=> res!439216 e!384074)))

(declare-fun e!384080 () Bool)

(assert (=> b!672436 (= res!439216 e!384080)))

(declare-fun res!439206 () Bool)

(assert (=> b!672436 (=> (not res!439206) (not e!384080))))

(assert (=> b!672436 (= res!439206 (bvsgt from!3004 i!1382))))

(declare-fun b!672437 () Bool)

(declare-fun res!439199 () Bool)

(assert (=> b!672437 (=> (not res!439199) (not e!384077))))

(assert (=> b!672437 (= res!439199 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19171 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!672438 () Bool)

(declare-fun res!439208 () Bool)

(declare-fun e!384075 () Bool)

(assert (=> b!672438 (=> (not res!439208) (not e!384075))))

(declare-datatypes ((List!12886 0))(
  ( (Nil!12883) (Cons!12882 (h!13927 (_ BitVec 64)) (t!19105 List!12886)) )
))
(declare-fun lt!312102 () List!12886)

(declare-fun noDuplicate!677 (List!12886) Bool)

(assert (=> b!672438 (= res!439208 (noDuplicate!677 lt!312102))))

(declare-fun b!672439 () Bool)

(declare-fun res!439214 () Bool)

(assert (=> b!672439 (=> (not res!439214) (not e!384075))))

(declare-fun contains!3408 (List!12886 (_ BitVec 64)) Bool)

(assert (=> b!672439 (= res!439214 (not (contains!3408 lt!312102 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672441 () Bool)

(assert (=> b!672441 (= e!384075 false)))

(declare-fun lt!312099 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39228 (_ BitVec 32) List!12886) Bool)

(assert (=> b!672441 (= lt!312099 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312102))))

(declare-fun b!672442 () Bool)

(declare-fun res!439205 () Bool)

(assert (=> b!672442 (=> (not res!439205) (not e!384077))))

(assert (=> b!672442 (= res!439205 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12883))))

(declare-fun b!672443 () Bool)

(declare-fun res!439218 () Bool)

(assert (=> b!672443 (=> (not res!439218) (not e!384077))))

(declare-fun acc!681 () List!12886)

(assert (=> b!672443 (= res!439218 (noDuplicate!677 acc!681))))

(declare-fun b!672444 () Bool)

(declare-fun res!439217 () Bool)

(assert (=> b!672444 (=> (not res!439217) (not e!384077))))

(assert (=> b!672444 (= res!439217 (not (contains!3408 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672445 () Bool)

(declare-fun res!439215 () Bool)

(assert (=> b!672445 (=> (not res!439215) (not e!384077))))

(assert (=> b!672445 (= res!439215 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!672446 () Bool)

(declare-fun res!439200 () Bool)

(assert (=> b!672446 (=> (not res!439200) (not e!384075))))

(declare-fun e!384078 () Bool)

(assert (=> b!672446 (= res!439200 e!384078)))

(declare-fun res!439209 () Bool)

(assert (=> b!672446 (=> res!439209 e!384078)))

(declare-fun e!384083 () Bool)

(assert (=> b!672446 (= res!439209 e!384083)))

(declare-fun res!439211 () Bool)

(assert (=> b!672446 (=> (not res!439211) (not e!384083))))

(assert (=> b!672446 (= res!439211 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672447 () Bool)

(declare-fun e!384079 () Bool)

(assert (=> b!672447 (= e!384079 (not (contains!3408 lt!312102 k0!2843)))))

(declare-fun b!672448 () Bool)

(declare-fun res!439204 () Bool)

(assert (=> b!672448 (=> (not res!439204) (not e!384077))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!672448 (= res!439204 (validKeyInArray!0 k0!2843))))

(declare-fun b!672449 () Bool)

(declare-fun e!384081 () Bool)

(assert (=> b!672449 (= e!384077 e!384081)))

(declare-fun res!439202 () Bool)

(assert (=> b!672449 (=> (not res!439202) (not e!384081))))

(assert (=> b!672449 (= res!439202 (not (= (select (arr!18806 a!3626) from!3004) k0!2843)))))

(declare-fun lt!312100 () Unit!23618)

(assert (=> b!672449 (= lt!312100 e!384076)))

(declare-fun c!76986 () Bool)

(assert (=> b!672449 (= c!76986 (= (select (arr!18806 a!3626) from!3004) k0!2843))))

(declare-fun b!672450 () Bool)

(declare-fun res!439210 () Bool)

(assert (=> b!672450 (=> (not res!439210) (not e!384077))))

(assert (=> b!672450 (= res!439210 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!672451 () Bool)

(declare-fun res!439212 () Bool)

(assert (=> b!672451 (=> (not res!439212) (not e!384077))))

(assert (=> b!672451 (= res!439212 (not (contains!3408 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672452 () Bool)

(assert (=> b!672452 (= e!384080 (contains!3408 acc!681 k0!2843))))

(declare-fun b!672453 () Bool)

(declare-fun res!439201 () Bool)

(assert (=> b!672453 (=> (not res!439201) (not e!384077))))

(assert (=> b!672453 (= res!439201 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19171 a!3626))))))

(declare-fun b!672454 () Bool)

(assert (=> b!672454 (= e!384078 e!384079)))

(declare-fun res!439196 () Bool)

(assert (=> b!672454 (=> (not res!439196) (not e!384079))))

(assert (=> b!672454 (= res!439196 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672455 () Bool)

(declare-fun res!439197 () Bool)

(assert (=> b!672455 (=> (not res!439197) (not e!384075))))

(assert (=> b!672455 (= res!439197 (not (contains!3408 lt!312102 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672456 () Bool)

(declare-fun res!439213 () Bool)

(assert (=> b!672456 (=> (not res!439213) (not e!384077))))

(assert (=> b!672456 (= res!439213 (validKeyInArray!0 (select (arr!18806 a!3626) from!3004)))))

(declare-fun b!672457 () Bool)

(assert (=> b!672457 (= e!384081 e!384075)))

(declare-fun res!439219 () Bool)

(assert (=> b!672457 (=> (not res!439219) (not e!384075))))

(assert (=> b!672457 (= res!439219 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!274 (List!12886 (_ BitVec 64)) List!12886)

(assert (=> b!672457 (= lt!312102 ($colon$colon!274 acc!681 (select (arr!18806 a!3626) from!3004)))))

(declare-fun b!672458 () Bool)

(assert (=> b!672458 (= e!384083 (contains!3408 lt!312102 k0!2843))))

(declare-fun b!672459 () Bool)

(assert (=> b!672459 (= e!384082 (not (contains!3408 acc!681 k0!2843)))))

(declare-fun res!439198 () Bool)

(assert (=> start!60170 (=> (not res!439198) (not e!384077))))

(assert (=> start!60170 (= res!439198 (and (bvslt (size!19171 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19171 a!3626))))))

(assert (=> start!60170 e!384077))

(assert (=> start!60170 true))

(declare-fun array_inv!14689 (array!39228) Bool)

(assert (=> start!60170 (array_inv!14689 a!3626)))

(declare-fun b!672440 () Bool)

(declare-fun Unit!23621 () Unit!23618)

(assert (=> b!672440 (= e!384076 Unit!23621)))

(assert (= (and start!60170 res!439198) b!672443))

(assert (= (and b!672443 res!439218) b!672444))

(assert (= (and b!672444 res!439217) b!672451))

(assert (= (and b!672451 res!439212) b!672436))

(assert (= (and b!672436 res!439206) b!672452))

(assert (= (and b!672436 (not res!439216)) b!672435))

(assert (= (and b!672435 res!439207) b!672459))

(assert (= (and b!672436 res!439203) b!672442))

(assert (= (and b!672442 res!439205) b!672445))

(assert (= (and b!672445 res!439215) b!672453))

(assert (= (and b!672453 res!439201) b!672448))

(assert (= (and b!672448 res!439204) b!672450))

(assert (= (and b!672450 res!439210) b!672437))

(assert (= (and b!672437 res!439199) b!672456))

(assert (= (and b!672456 res!439213) b!672449))

(assert (= (and b!672449 c!76986) b!672434))

(assert (= (and b!672449 (not c!76986)) b!672440))

(assert (= (and b!672449 res!439202) b!672457))

(assert (= (and b!672457 res!439219) b!672438))

(assert (= (and b!672438 res!439208) b!672439))

(assert (= (and b!672439 res!439214) b!672455))

(assert (= (and b!672455 res!439197) b!672446))

(assert (= (and b!672446 res!439211) b!672458))

(assert (= (and b!672446 (not res!439209)) b!672454))

(assert (= (and b!672454 res!439196) b!672447))

(assert (= (and b!672446 res!439200) b!672441))

(declare-fun m!640761 () Bool)

(assert (=> b!672442 m!640761))

(declare-fun m!640763 () Bool)

(assert (=> b!672449 m!640763))

(declare-fun m!640765 () Bool)

(assert (=> b!672448 m!640765))

(declare-fun m!640767 () Bool)

(assert (=> b!672438 m!640767))

(declare-fun m!640769 () Bool)

(assert (=> b!672458 m!640769))

(declare-fun m!640771 () Bool)

(assert (=> b!672434 m!640771))

(declare-fun m!640773 () Bool)

(assert (=> b!672434 m!640773))

(declare-fun m!640775 () Bool)

(assert (=> b!672444 m!640775))

(declare-fun m!640777 () Bool)

(assert (=> start!60170 m!640777))

(declare-fun m!640779 () Bool)

(assert (=> b!672459 m!640779))

(assert (=> b!672452 m!640779))

(assert (=> b!672457 m!640763))

(assert (=> b!672457 m!640763))

(declare-fun m!640781 () Bool)

(assert (=> b!672457 m!640781))

(declare-fun m!640783 () Bool)

(assert (=> b!672451 m!640783))

(declare-fun m!640785 () Bool)

(assert (=> b!672443 m!640785))

(assert (=> b!672456 m!640763))

(assert (=> b!672456 m!640763))

(declare-fun m!640787 () Bool)

(assert (=> b!672456 m!640787))

(declare-fun m!640789 () Bool)

(assert (=> b!672455 m!640789))

(assert (=> b!672447 m!640769))

(declare-fun m!640791 () Bool)

(assert (=> b!672441 m!640791))

(declare-fun m!640793 () Bool)

(assert (=> b!672450 m!640793))

(declare-fun m!640795 () Bool)

(assert (=> b!672445 m!640795))

(declare-fun m!640797 () Bool)

(assert (=> b!672439 m!640797))

(check-sat (not start!60170) (not b!672444) (not b!672448) (not b!672455) (not b!672457) (not b!672451) (not b!672447) (not b!672445) (not b!672459) (not b!672442) (not b!672456) (not b!672458) (not b!672434) (not b!672452) (not b!672439) (not b!672438) (not b!672441) (not b!672450) (not b!672443))
(check-sat)
