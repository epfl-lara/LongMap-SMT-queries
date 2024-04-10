; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104504 () Bool)

(assert start!104504)

(declare-fun res!832059 () Bool)

(declare-fun e!707171 () Bool)

(assert (=> start!104504 (=> (not res!832059) (not e!707171))))

(declare-datatypes ((array!80275 0))(
  ( (array!80276 (arr!38713 (Array (_ BitVec 32) (_ BitVec 64))) (size!39249 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80275)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104504 (= res!832059 (and (bvslt (size!39249 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39249 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39249 a!3892))))))

(assert (=> start!104504 e!707171))

(declare-fun array_inv!29561 (array!80275) Bool)

(assert (=> start!104504 (array_inv!29561 a!3892)))

(assert (=> start!104504 true))

(declare-fun b!1246843 () Bool)

(declare-fun res!832060 () Bool)

(assert (=> b!1246843 (=> (not res!832060) (not e!707171))))

(declare-datatypes ((List!27516 0))(
  ( (Nil!27513) (Cons!27512 (h!28721 (_ BitVec 64)) (t!40985 List!27516)) )
))
(declare-fun arrayNoDuplicates!0 (array!80275 (_ BitVec 32) List!27516) Bool)

(assert (=> b!1246843 (= res!832060 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27513))))

(declare-fun b!1246844 () Bool)

(declare-fun res!832058 () Bool)

(assert (=> b!1246844 (=> (not res!832058) (not e!707171))))

(assert (=> b!1246844 (= res!832058 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39249 a!3892)) (= newFrom!287 (size!39249 a!3892))))))

(declare-fun b!1246845 () Bool)

(assert (=> b!1246845 (= e!707171 (not (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27513)))))

(assert (= (and start!104504 res!832059) b!1246843))

(assert (= (and b!1246843 res!832060) b!1246844))

(assert (= (and b!1246844 res!832058) b!1246845))

(declare-fun m!1148567 () Bool)

(assert (=> start!104504 m!1148567))

(declare-fun m!1148569 () Bool)

(assert (=> b!1246843 m!1148569))

(declare-fun m!1148571 () Bool)

(assert (=> b!1246845 m!1148571))

(push 1)

(assert (not b!1246843))

(assert (not start!104504))

(assert (not b!1246845))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1246881 () Bool)

(declare-fun e!707200 () Bool)

(declare-fun e!707201 () Bool)

(assert (=> b!1246881 (= e!707200 e!707201)))

(declare-fun res!832083 () Bool)

(assert (=> b!1246881 (=> (not res!832083) (not e!707201))))

(declare-fun e!707202 () Bool)

(assert (=> b!1246881 (= res!832083 (not e!707202))))

(declare-fun res!832084 () Bool)

(assert (=> b!1246881 (=> (not res!832084) (not e!707202))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246881 (= res!832084 (validKeyInArray!0 (select (arr!38713 a!3892) from!3270)))))

(declare-fun b!1246882 () Bool)

(declare-fun e!707203 () Bool)

(declare-fun call!61547 () Bool)

(assert (=> b!1246882 (= e!707203 call!61547)))

(declare-fun bm!61544 () Bool)

(declare-fun c!122084 () Bool)

(assert (=> bm!61544 (= call!61547 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!122084 (Cons!27512 (select (arr!38713 a!3892) from!3270) Nil!27513) Nil!27513)))))

(declare-fun b!1246883 () Bool)

(assert (=> b!1246883 (= e!707201 e!707203)))

(assert (=> b!1246883 (= c!122084 (validKeyInArray!0 (select (arr!38713 a!3892) from!3270)))))

(declare-fun b!1246884 () Bool)

(assert (=> b!1246884 (= e!707203 call!61547)))

(declare-fun b!1246885 () Bool)

(declare-fun contains!7464 (List!27516 (_ BitVec 64)) Bool)

(assert (=> b!1246885 (= e!707202 (contains!7464 Nil!27513 (select (arr!38713 a!3892) from!3270)))))

(declare-fun d!137689 () Bool)

(declare-fun res!832082 () Bool)

(assert (=> d!137689 (=> res!832082 e!707200)))

(assert (=> d!137689 (= res!832082 (bvsge from!3270 (size!39249 a!3892)))))

(assert (=> d!137689 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27513) e!707200)))

(assert (= (and d!137689 (not res!832082)) b!1246881))

(assert (= (and b!1246881 res!832084) b!1246885))

(assert (= (and b!1246881 res!832083) b!1246883))

(assert (= (and b!1246883 c!122084) b!1246882))

(assert (= (and b!1246883 (not c!122084)) b!1246884))

(assert (= (or b!1246882 b!1246884) bm!61544))

(declare-fun m!1148581 () Bool)

(assert (=> b!1246881 m!1148581))

(assert (=> b!1246881 m!1148581))

(declare-fun m!1148583 () Bool)

(assert (=> b!1246881 m!1148583))

(assert (=> bm!61544 m!1148581))

(declare-fun m!1148585 () Bool)

(assert (=> bm!61544 m!1148585))

(assert (=> b!1246883 m!1148581))

(assert (=> b!1246883 m!1148581))

(assert (=> b!1246883 m!1148583))

(assert (=> b!1246885 m!1148581))

(assert (=> b!1246885 m!1148581))

(declare-fun m!1148587 () Bool)

(assert (=> b!1246885 m!1148587))

(assert (=> b!1246843 d!137689))

(declare-fun d!137699 () Bool)

(assert (=> d!137699 (= (array_inv!29561 a!3892) (bvsge (size!39249 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104504 d!137699))

(declare-fun b!1246896 () Bool)

(declare-fun e!707212 () Bool)

(declare-fun e!707213 () Bool)

(assert (=> b!1246896 (= e!707212 e!707213)))

(declare-fun res!832092 () Bool)

(assert (=> b!1246896 (=> (not res!832092) (not e!707213))))

(declare-fun e!707214 () Bool)

(assert (=> b!1246896 (= res!832092 (not e!707214))))

(declare-fun res!832093 () Bool)

(assert (=> b!1246896 (=> (not res!832093) (not e!707214))))

(assert (=> b!1246896 (= res!832093 (validKeyInArray!0 (select (arr!38713 a!3892) newFrom!287)))))

(declare-fun b!1246897 () Bool)

(declare-fun e!707215 () Bool)

(declare-fun call!61550 () Bool)

(assert (=> b!1246897 (= e!707215 call!61550)))

(declare-fun bm!61547 () Bool)

(declare-fun c!122087 () Bool)

(assert (=> bm!61547 (= call!61550 (arrayNoDuplicates!0 a!3892 (bvadd newFrom!287 #b00000000000000000000000000000001) (ite c!122087 (Cons!27512 (select (arr!38713 a!3892) newFrom!287) Nil!27513) Nil!27513)))))

(declare-fun b!1246898 () Bool)

(assert (=> b!1246898 (= e!707213 e!707215)))

(assert (=> b!1246898 (= c!122087 (validKeyInArray!0 (select (arr!38713 a!3892) newFrom!287)))))

(declare-fun b!1246899 () Bool)

(assert (=> b!1246899 (= e!707215 call!61550)))

(declare-fun b!1246900 () Bool)

(assert (=> b!1246900 (= e!707214 (contains!7464 Nil!27513 (select (arr!38713 a!3892) newFrom!287)))))

(declare-fun d!137703 () Bool)

(declare-fun res!832091 () Bool)

(assert (=> d!137703 (=> res!832091 e!707212)))

(assert (=> d!137703 (= res!832091 (bvsge newFrom!287 (size!39249 a!3892)))))

(assert (=> d!137703 (= (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27513) e!707212)))

(assert (= (and d!137703 (not res!832091)) b!1246896))

(assert (= (and b!1246896 res!832093) b!1246900))

(assert (= (and b!1246896 res!832092) b!1246898))

(assert (= (and b!1246898 c!122087) b!1246897))

(assert (= (and b!1246898 (not c!122087)) b!1246899))

(assert (= (or b!1246897 b!1246899) bm!61547))

(declare-fun m!1148605 () Bool)

(assert (=> b!1246896 m!1148605))

(assert (=> b!1246896 m!1148605))

(declare-fun m!1148607 () Bool)

(assert (=> b!1246896 m!1148607))

(assert (=> bm!61547 m!1148605))

(declare-fun m!1148611 () Bool)

(assert (=> bm!61547 m!1148611))

(assert (=> b!1246898 m!1148605))

(assert (=> b!1246898 m!1148605))

(assert (=> b!1246898 m!1148607))

(assert (=> b!1246900 m!1148605))

(assert (=> b!1246900 m!1148605))

(declare-fun m!1148615 () Bool)

(assert (=> b!1246900 m!1148615))

(assert (=> b!1246845 d!137703))

(push 1)

(assert (not bm!61547))

(assert (not b!1246896))

(assert (not b!1246900))

(assert (not b!1246883))

(assert (not bm!61544))

(assert (not b!1246881))

(assert (not b!1246885))

(assert (not b!1246898))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

