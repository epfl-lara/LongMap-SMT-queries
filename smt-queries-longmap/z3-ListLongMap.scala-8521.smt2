; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104158 () Bool)

(assert start!104158)

(declare-fun b!1245275 () Bool)

(declare-fun res!830263 () Bool)

(declare-fun e!705936 () Bool)

(assert (=> b!1245275 (=> (not res!830263) (not e!705936))))

(declare-datatypes ((List!27428 0))(
  ( (Nil!27425) (Cons!27424 (h!28642 (_ BitVec 64)) (t!40889 List!27428)) )
))
(declare-fun lt!563014 () List!27428)

(declare-fun subseq!650 (List!27428 List!27428) Bool)

(assert (=> b!1245275 (= res!830263 (subseq!650 Nil!27425 lt!563014))))

(declare-fun b!1245276 () Bool)

(declare-fun res!830267 () Bool)

(assert (=> b!1245276 (=> (not res!830267) (not e!705936))))

(declare-fun noDuplicate!2020 (List!27428) Bool)

(assert (=> b!1245276 (= res!830267 (noDuplicate!2020 lt!563014))))

(declare-fun b!1245277 () Bool)

(declare-fun e!705937 () Bool)

(assert (=> b!1245277 (= e!705937 e!705936)))

(declare-fun res!830262 () Bool)

(assert (=> b!1245277 (=> (not res!830262) (not e!705936))))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1245277 (= res!830262 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(declare-datatypes ((array!80049 0))(
  ( (array!80050 (arr!38612 (Array (_ BitVec 32) (_ BitVec 64))) (size!39149 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80049)

(assert (=> b!1245277 (= lt!563014 (Cons!27424 (select (arr!38612 a!3892) from!3270) Nil!27425))))

(declare-fun b!1245278 () Bool)

(declare-fun res!830268 () Bool)

(assert (=> b!1245278 (=> (not res!830268) (not e!705937))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245278 (= res!830268 (validKeyInArray!0 (select (arr!38612 a!3892) from!3270)))))

(declare-fun b!1245279 () Bool)

(declare-fun res!830269 () Bool)

(assert (=> b!1245279 (=> (not res!830269) (not e!705936))))

(declare-fun contains!7458 (List!27428 (_ BitVec 64)) Bool)

(assert (=> b!1245279 (= res!830269 (not (contains!7458 lt!563014 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1245280 () Bool)

(assert (=> b!1245280 (= e!705936 false)))

(declare-fun lt!563013 () Bool)

(declare-fun arrayNoDuplicates!0 (array!80049 (_ BitVec 32) List!27428) Bool)

(assert (=> b!1245280 (= lt!563013 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!563014))))

(declare-datatypes ((Unit!41282 0))(
  ( (Unit!41283) )
))
(declare-fun lt!563015 () Unit!41282)

(declare-fun noDuplicateSubseq!104 (List!27428 List!27428) Unit!41282)

(assert (=> b!1245280 (= lt!563015 (noDuplicateSubseq!104 Nil!27425 lt!563014))))

(declare-fun b!1245281 () Bool)

(declare-fun res!830264 () Bool)

(assert (=> b!1245281 (=> (not res!830264) (not e!705936))))

(assert (=> b!1245281 (= res!830264 (not (contains!7458 Nil!27425 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1245282 () Bool)

(declare-fun res!830271 () Bool)

(assert (=> b!1245282 (=> (not res!830271) (not e!705936))))

(assert (=> b!1245282 (= res!830271 (not (contains!7458 Nil!27425 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1245283 () Bool)

(declare-fun res!830266 () Bool)

(assert (=> b!1245283 (=> (not res!830266) (not e!705937))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1245283 (= res!830266 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39149 a!3892)) (not (= newFrom!287 (size!39149 a!3892)))))))

(declare-fun res!830261 () Bool)

(assert (=> start!104158 (=> (not res!830261) (not e!705937))))

(assert (=> start!104158 (= res!830261 (and (bvslt (size!39149 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39149 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39149 a!3892))))))

(assert (=> start!104158 e!705937))

(declare-fun array_inv!29550 (array!80049) Bool)

(assert (=> start!104158 (array_inv!29550 a!3892)))

(assert (=> start!104158 true))

(declare-fun b!1245284 () Bool)

(declare-fun res!830265 () Bool)

(assert (=> b!1245284 (=> (not res!830265) (not e!705937))))

(assert (=> b!1245284 (= res!830265 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27425))))

(declare-fun b!1245285 () Bool)

(declare-fun res!830270 () Bool)

(assert (=> b!1245285 (=> (not res!830270) (not e!705936))))

(assert (=> b!1245285 (= res!830270 (not (contains!7458 lt!563014 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!104158 res!830261) b!1245284))

(assert (= (and b!1245284 res!830265) b!1245283))

(assert (= (and b!1245283 res!830266) b!1245278))

(assert (= (and b!1245278 res!830268) b!1245277))

(assert (= (and b!1245277 res!830262) b!1245276))

(assert (= (and b!1245276 res!830267) b!1245279))

(assert (= (and b!1245279 res!830269) b!1245285))

(assert (= (and b!1245285 res!830270) b!1245281))

(assert (= (and b!1245281 res!830264) b!1245282))

(assert (= (and b!1245282 res!830271) b!1245275))

(assert (= (and b!1245275 res!830263) b!1245280))

(declare-fun m!1148011 () Bool)

(assert (=> b!1245285 m!1148011))

(declare-fun m!1148013 () Bool)

(assert (=> b!1245277 m!1148013))

(declare-fun m!1148015 () Bool)

(assert (=> b!1245281 m!1148015))

(declare-fun m!1148017 () Bool)

(assert (=> b!1245275 m!1148017))

(assert (=> b!1245278 m!1148013))

(assert (=> b!1245278 m!1148013))

(declare-fun m!1148019 () Bool)

(assert (=> b!1245278 m!1148019))

(declare-fun m!1148021 () Bool)

(assert (=> b!1245280 m!1148021))

(declare-fun m!1148023 () Bool)

(assert (=> b!1245280 m!1148023))

(declare-fun m!1148025 () Bool)

(assert (=> b!1245284 m!1148025))

(declare-fun m!1148027 () Bool)

(assert (=> b!1245276 m!1148027))

(declare-fun m!1148029 () Bool)

(assert (=> b!1245279 m!1148029))

(declare-fun m!1148031 () Bool)

(assert (=> b!1245282 m!1148031))

(declare-fun m!1148033 () Bool)

(assert (=> start!104158 m!1148033))

(check-sat (not b!1245278) (not b!1245281) (not b!1245279) (not start!104158) (not b!1245282) (not b!1245280) (not b!1245276) (not b!1245285) (not b!1245275) (not b!1245284))
(check-sat)
