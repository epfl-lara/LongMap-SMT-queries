; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104500 () Bool)

(assert start!104500)

(declare-fun res!832040 () Bool)

(declare-fun e!707158 () Bool)

(assert (=> start!104500 (=> (not res!832040) (not e!707158))))

(declare-datatypes ((array!80271 0))(
  ( (array!80272 (arr!38711 (Array (_ BitVec 32) (_ BitVec 64))) (size!39247 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80271)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104500 (= res!832040 (and (bvslt (size!39247 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39247 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39247 a!3892))))))

(assert (=> start!104500 e!707158))

(declare-fun array_inv!29559 (array!80271) Bool)

(assert (=> start!104500 (array_inv!29559 a!3892)))

(assert (=> start!104500 true))

(declare-fun b!1246825 () Bool)

(declare-fun res!832042 () Bool)

(assert (=> b!1246825 (=> (not res!832042) (not e!707158))))

(declare-datatypes ((List!27514 0))(
  ( (Nil!27511) (Cons!27510 (h!28719 (_ BitVec 64)) (t!40983 List!27514)) )
))
(declare-fun arrayNoDuplicates!0 (array!80271 (_ BitVec 32) List!27514) Bool)

(assert (=> b!1246825 (= res!832042 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27511))))

(declare-fun b!1246826 () Bool)

(declare-fun res!832041 () Bool)

(assert (=> b!1246826 (=> (not res!832041) (not e!707158))))

(assert (=> b!1246826 (= res!832041 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39247 a!3892)) (= newFrom!287 (size!39247 a!3892))))))

(declare-fun b!1246827 () Bool)

(assert (=> b!1246827 (= e!707158 (not (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27511)))))

(assert (= (and start!104500 res!832040) b!1246825))

(assert (= (and b!1246825 res!832042) b!1246826))

(assert (= (and b!1246826 res!832041) b!1246827))

(declare-fun m!1148555 () Bool)

(assert (=> start!104500 m!1148555))

(declare-fun m!1148557 () Bool)

(assert (=> b!1246825 m!1148557))

(declare-fun m!1148559 () Bool)

(assert (=> b!1246827 m!1148559))

(push 1)

(assert (not start!104500))

(assert (not b!1246827))

(assert (not b!1246825))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!137693 () Bool)

(assert (=> d!137693 (= (array_inv!29559 a!3892) (bvsge (size!39247 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104500 d!137693))

(declare-fun b!1246886 () Bool)

(declare-fun e!707207 () Bool)

(declare-fun call!61548 () Bool)

(assert (=> b!1246886 (= e!707207 call!61548)))

(declare-fun b!1246887 () Bool)

(assert (=> b!1246887 (= e!707207 call!61548)))

(declare-fun c!122085 () Bool)

(declare-fun bm!61545 () Bool)

(assert (=> bm!61545 (= call!61548 (arrayNoDuplicates!0 a!3892 (bvadd newFrom!287 #b00000000000000000000000000000001) (ite c!122085 (Cons!27510 (select (arr!38711 a!3892) newFrom!287) Nil!27511) Nil!27511)))))

(declare-fun b!1246889 () Bool)

(declare-fun e!707206 () Bool)

(declare-fun e!707205 () Bool)

(assert (=> b!1246889 (= e!707206 e!707205)))

(declare-fun res!832087 () Bool)

(assert (=> b!1246889 (=> (not res!832087) (not e!707205))))

(declare-fun e!707204 () Bool)

(assert (=> b!1246889 (= res!832087 (not e!707204))))

(declare-fun res!832086 () Bool)

(assert (=> b!1246889 (=> (not res!832086) (not e!707204))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246889 (= res!832086 (validKeyInArray!0 (select (arr!38711 a!3892) newFrom!287)))))

(declare-fun b!1246890 () Bool)

(assert (=> b!1246890 (= e!707205 e!707207)))

(assert (=> b!1246890 (= c!122085 (validKeyInArray!0 (select (arr!38711 a!3892) newFrom!287)))))

(declare-fun b!1246888 () Bool)

(declare-fun contains!7463 (List!27514 (_ BitVec 64)) Bool)

(assert (=> b!1246888 (= e!707204 (contains!7463 Nil!27511 (select (arr!38711 a!3892) newFrom!287)))))

(declare-fun d!137695 () Bool)

(declare-fun res!832085 () Bool)

(assert (=> d!137695 (=> res!832085 e!707206)))

(assert (=> d!137695 (= res!832085 (bvsge newFrom!287 (size!39247 a!3892)))))

(assert (=> d!137695 (= (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27511) e!707206)))

(assert (= (and d!137695 (not res!832085)) b!1246889))

(assert (= (and b!1246889 res!832086) b!1246888))

(assert (= (and b!1246889 res!832087) b!1246890))

(assert (= (and b!1246890 c!122085) b!1246887))

(assert (= (and b!1246890 (not c!122085)) b!1246886))

(assert (= (or b!1246887 b!1246886) bm!61545))

(declare-fun m!1148589 () Bool)

(assert (=> bm!61545 m!1148589))

(declare-fun m!1148591 () Bool)

(assert (=> bm!61545 m!1148591))

(assert (=> b!1246889 m!1148589))

(assert (=> b!1246889 m!1148589))

(declare-fun m!1148593 () Bool)

(assert (=> b!1246889 m!1148593))

(assert (=> b!1246890 m!1148589))

(assert (=> b!1246890 m!1148589))

(assert (=> b!1246890 m!1148593))

(assert (=> b!1246888 m!1148589))

(assert (=> b!1246888 m!1148589))

(declare-fun m!1148597 () Bool)

(assert (=> b!1246888 m!1148597))

(assert (=> b!1246827 d!137695))

(declare-fun b!1246901 () Bool)

(declare-fun e!707219 () Bool)

(declare-fun call!61551 () Bool)

(assert (=> b!1246901 (= e!707219 call!61551)))

(declare-fun b!1246902 () Bool)

(assert (=> b!1246902 (= e!707219 call!61551)))

(declare-fun bm!61548 () Bool)

(declare-fun c!122088 () Bool)

(assert (=> bm!61548 (= call!61551 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!122088 (Cons!27510 (select (arr!38711 a!3892) from!3270) Nil!27511) Nil!27511)))))

(declare-fun b!1246904 () Bool)

(declare-fun e!707218 () Bool)

(declare-fun e!707217 () Bool)

(assert (=> b!1246904 (= e!707218 e!707217)))

(declare-fun res!832096 () Bool)

(assert (=> b!1246904 (=> (not res!832096) (not e!707217))))

(declare-fun e!707216 () Bool)

(assert (=> b!1246904 (= res!832096 (not e!707216))))

(declare-fun res!832095 () Bool)

(assert (=> b!1246904 (=> (not res!832095) (not e!707216))))

(assert (=> b!1246904 (= res!832095 (validKeyInArray!0 (select (arr!38711 a!3892) from!3270)))))

(declare-fun b!1246905 () Bool)

(assert (=> b!1246905 (= e!707217 e!707219)))

(assert (=> b!1246905 (= c!122088 (validKeyInArray!0 (select (arr!38711 a!3892) from!3270)))))

(declare-fun b!1246903 () Bool)

(assert (=> b!1246903 (= e!707216 (contains!7463 Nil!27511 (select (arr!38711 a!3892) from!3270)))))

(declare-fun d!137705 () Bool)

(declare-fun res!832094 () Bool)

(assert (=> d!137705 (=> res!832094 e!707218)))

(assert (=> d!137705 (= res!832094 (bvsge from!3270 (size!39247 a!3892)))))

(assert (=> d!137705 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27511) e!707218)))

(assert (= (and d!137705 (not res!832094)) b!1246904))

(assert (= (and b!1246904 res!832095) b!1246903))

(assert (= (and b!1246904 res!832096) b!1246905))

(assert (= (and b!1246905 c!122088) b!1246902))

(assert (= (and b!1246905 (not c!122088)) b!1246901))

(assert (= (or b!1246902 b!1246901) bm!61548))

(declare-fun m!1148609 () Bool)

(assert (=> bm!61548 m!1148609))

(declare-fun m!1148613 () Bool)

(assert (=> bm!61548 m!1148613))

(assert (=> b!1246904 m!1148609))

(assert (=> b!1246904 m!1148609))

(declare-fun m!1148617 () Bool)

(assert (=> b!1246904 m!1148617))

(assert (=> b!1246905 m!1148609))

(assert (=> b!1246905 m!1148609))

(assert (=> b!1246905 m!1148617))

(assert (=> b!1246903 m!1148609))

(assert (=> b!1246903 m!1148609))

(declare-fun m!1148619 () Bool)

(assert (=> b!1246903 m!1148619))

(assert (=> b!1246825 d!137705))

(push 1)

(assert (not bm!61548))

(assert (not b!1246905))

(assert (not b!1246903))

(assert (not b!1246890))

(assert (not bm!61545))

(assert (not b!1246889))

(assert (not b!1246904))

(assert (not b!1246888))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

