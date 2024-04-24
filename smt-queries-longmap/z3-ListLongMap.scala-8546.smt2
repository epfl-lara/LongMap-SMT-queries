; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104464 () Bool)

(assert start!104464)

(declare-fun b!1246716 () Bool)

(declare-fun res!831411 () Bool)

(declare-fun e!707035 () Bool)

(assert (=> b!1246716 (=> (not res!831411) (not e!707035))))

(declare-datatypes ((array!80215 0))(
  ( (array!80216 (arr!38687 (Array (_ BitVec 32) (_ BitVec 64))) (size!39224 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80215)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27503 0))(
  ( (Nil!27500) (Cons!27499 (h!28717 (_ BitVec 64)) (t!40964 List!27503)) )
))
(declare-fun arrayNoDuplicates!0 (array!80215 (_ BitVec 32) List!27503) Bool)

(assert (=> b!1246716 (= res!831411 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27500))))

(declare-fun b!1246717 () Bool)

(declare-fun res!831410 () Bool)

(assert (=> b!1246717 (=> (not res!831410) (not e!707035))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246717 (= res!831410 (validKeyInArray!0 (select (arr!38687 a!3892) from!3270)))))

(declare-fun b!1246718 () Bool)

(declare-fun noDuplicate!2041 (List!27503) Bool)

(assert (=> b!1246718 (= e!707035 (not (noDuplicate!2041 (Cons!27499 (select (arr!38687 a!3892) from!3270) Nil!27500))))))

(declare-fun res!831412 () Bool)

(assert (=> start!104464 (=> (not res!831412) (not e!707035))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!104464 (= res!831412 (and (bvslt (size!39224 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39224 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39224 a!3892))))))

(assert (=> start!104464 e!707035))

(declare-fun array_inv!29625 (array!80215) Bool)

(assert (=> start!104464 (array_inv!29625 a!3892)))

(assert (=> start!104464 true))

(declare-fun b!1246719 () Bool)

(declare-fun res!831414 () Bool)

(assert (=> b!1246719 (=> (not res!831414) (not e!707035))))

(assert (=> b!1246719 (= res!831414 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(declare-fun b!1246720 () Bool)

(declare-fun res!831413 () Bool)

(assert (=> b!1246720 (=> (not res!831413) (not e!707035))))

(assert (=> b!1246720 (= res!831413 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39224 a!3892)) (not (= newFrom!287 (size!39224 a!3892)))))))

(assert (= (and start!104464 res!831412) b!1246716))

(assert (= (and b!1246716 res!831411) b!1246720))

(assert (= (and b!1246720 res!831413) b!1246717))

(assert (= (and b!1246717 res!831410) b!1246719))

(assert (= (and b!1246719 res!831414) b!1246718))

(declare-fun m!1149097 () Bool)

(assert (=> b!1246716 m!1149097))

(declare-fun m!1149099 () Bool)

(assert (=> b!1246717 m!1149099))

(assert (=> b!1246717 m!1149099))

(declare-fun m!1149101 () Bool)

(assert (=> b!1246717 m!1149101))

(assert (=> b!1246718 m!1149099))

(declare-fun m!1149103 () Bool)

(assert (=> b!1246718 m!1149103))

(declare-fun m!1149105 () Bool)

(assert (=> start!104464 m!1149105))

(check-sat (not b!1246718) (not start!104464) (not b!1246716) (not b!1246717))
(check-sat)
(get-model)

(declare-fun d!137815 () Bool)

(declare-fun res!831449 () Bool)

(declare-fun e!707052 () Bool)

(assert (=> d!137815 (=> res!831449 e!707052)))

(get-info :version)

(assert (=> d!137815 (= res!831449 ((_ is Nil!27500) (Cons!27499 (select (arr!38687 a!3892) from!3270) Nil!27500)))))

(assert (=> d!137815 (= (noDuplicate!2041 (Cons!27499 (select (arr!38687 a!3892) from!3270) Nil!27500)) e!707052)))

(declare-fun b!1246755 () Bool)

(declare-fun e!707053 () Bool)

(assert (=> b!1246755 (= e!707052 e!707053)))

(declare-fun res!831450 () Bool)

(assert (=> b!1246755 (=> (not res!831450) (not e!707053))))

(declare-fun contains!7477 (List!27503 (_ BitVec 64)) Bool)

(assert (=> b!1246755 (= res!831450 (not (contains!7477 (t!40964 (Cons!27499 (select (arr!38687 a!3892) from!3270) Nil!27500)) (h!28717 (Cons!27499 (select (arr!38687 a!3892) from!3270) Nil!27500)))))))

(declare-fun b!1246756 () Bool)

(assert (=> b!1246756 (= e!707053 (noDuplicate!2041 (t!40964 (Cons!27499 (select (arr!38687 a!3892) from!3270) Nil!27500))))))

(assert (= (and d!137815 (not res!831449)) b!1246755))

(assert (= (and b!1246755 res!831450) b!1246756))

(declare-fun m!1149127 () Bool)

(assert (=> b!1246755 m!1149127))

(declare-fun m!1149129 () Bool)

(assert (=> b!1246756 m!1149129))

(assert (=> b!1246718 d!137815))

(declare-fun d!137817 () Bool)

(assert (=> d!137817 (= (array_inv!29625 a!3892) (bvsge (size!39224 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104464 d!137817))

(declare-fun b!1246777 () Bool)

(declare-fun e!707074 () Bool)

(declare-fun call!61544 () Bool)

(assert (=> b!1246777 (= e!707074 call!61544)))

(declare-fun b!1246778 () Bool)

(declare-fun e!707075 () Bool)

(assert (=> b!1246778 (= e!707075 (contains!7477 Nil!27500 (select (arr!38687 a!3892) from!3270)))))

(declare-fun b!1246779 () Bool)

(assert (=> b!1246779 (= e!707074 call!61544)))

(declare-fun b!1246780 () Bool)

(declare-fun e!707073 () Bool)

(assert (=> b!1246780 (= e!707073 e!707074)))

(declare-fun c!122347 () Bool)

(assert (=> b!1246780 (= c!122347 (validKeyInArray!0 (select (arr!38687 a!3892) from!3270)))))

(declare-fun bm!61541 () Bool)

(assert (=> bm!61541 (= call!61544 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!122347 (Cons!27499 (select (arr!38687 a!3892) from!3270) Nil!27500) Nil!27500)))))

(declare-fun b!1246781 () Bool)

(declare-fun e!707072 () Bool)

(assert (=> b!1246781 (= e!707072 e!707073)))

(declare-fun res!831468 () Bool)

(assert (=> b!1246781 (=> (not res!831468) (not e!707073))))

(assert (=> b!1246781 (= res!831468 (not e!707075))))

(declare-fun res!831469 () Bool)

(assert (=> b!1246781 (=> (not res!831469) (not e!707075))))

(assert (=> b!1246781 (= res!831469 (validKeyInArray!0 (select (arr!38687 a!3892) from!3270)))))

(declare-fun d!137819 () Bool)

(declare-fun res!831467 () Bool)

(assert (=> d!137819 (=> res!831467 e!707072)))

(assert (=> d!137819 (= res!831467 (bvsge from!3270 (size!39224 a!3892)))))

(assert (=> d!137819 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27500) e!707072)))

(assert (= (and d!137819 (not res!831467)) b!1246781))

(assert (= (and b!1246781 res!831469) b!1246778))

(assert (= (and b!1246781 res!831468) b!1246780))

(assert (= (and b!1246780 c!122347) b!1246779))

(assert (= (and b!1246780 (not c!122347)) b!1246777))

(assert (= (or b!1246779 b!1246777) bm!61541))

(assert (=> b!1246778 m!1149099))

(assert (=> b!1246778 m!1149099))

(declare-fun m!1149135 () Bool)

(assert (=> b!1246778 m!1149135))

(assert (=> b!1246780 m!1149099))

(assert (=> b!1246780 m!1149099))

(assert (=> b!1246780 m!1149101))

(assert (=> bm!61541 m!1149099))

(declare-fun m!1149137 () Bool)

(assert (=> bm!61541 m!1149137))

(assert (=> b!1246781 m!1149099))

(assert (=> b!1246781 m!1149099))

(assert (=> b!1246781 m!1149101))

(assert (=> b!1246716 d!137819))

(declare-fun d!137833 () Bool)

(assert (=> d!137833 (= (validKeyInArray!0 (select (arr!38687 a!3892) from!3270)) (and (not (= (select (arr!38687 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38687 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1246717 d!137833))

(check-sat (not b!1246778) (not b!1246755) (not bm!61541) (not b!1246781) (not b!1246756) (not b!1246780))
(check-sat)
(get-model)

(declare-fun d!137839 () Bool)

(declare-fun lt!563414 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!618 (List!27503) (InoxSet (_ BitVec 64)))

(assert (=> d!137839 (= lt!563414 (select (content!618 Nil!27500) (select (arr!38687 a!3892) from!3270)))))

(declare-fun e!707106 () Bool)

(assert (=> d!137839 (= lt!563414 e!707106)))

(declare-fun res!831494 () Bool)

(assert (=> d!137839 (=> (not res!831494) (not e!707106))))

(assert (=> d!137839 (= res!831494 ((_ is Cons!27499) Nil!27500))))

(assert (=> d!137839 (= (contains!7477 Nil!27500 (select (arr!38687 a!3892) from!3270)) lt!563414)))

(declare-fun b!1246818 () Bool)

(declare-fun e!707107 () Bool)

(assert (=> b!1246818 (= e!707106 e!707107)))

(declare-fun res!831495 () Bool)

(assert (=> b!1246818 (=> res!831495 e!707107)))

(assert (=> b!1246818 (= res!831495 (= (h!28717 Nil!27500) (select (arr!38687 a!3892) from!3270)))))

(declare-fun b!1246819 () Bool)

(assert (=> b!1246819 (= e!707107 (contains!7477 (t!40964 Nil!27500) (select (arr!38687 a!3892) from!3270)))))

(assert (= (and d!137839 res!831494) b!1246818))

(assert (= (and b!1246818 (not res!831495)) b!1246819))

(declare-fun m!1149151 () Bool)

(assert (=> d!137839 m!1149151))

(assert (=> d!137839 m!1149099))

(declare-fun m!1149153 () Bool)

(assert (=> d!137839 m!1149153))

(assert (=> b!1246819 m!1149099))

(declare-fun m!1149155 () Bool)

(assert (=> b!1246819 m!1149155))

(assert (=> b!1246778 d!137839))

(declare-fun d!137841 () Bool)

(declare-fun res!831496 () Bool)

(declare-fun e!707108 () Bool)

(assert (=> d!137841 (=> res!831496 e!707108)))

(assert (=> d!137841 (= res!831496 ((_ is Nil!27500) (t!40964 (Cons!27499 (select (arr!38687 a!3892) from!3270) Nil!27500))))))

(assert (=> d!137841 (= (noDuplicate!2041 (t!40964 (Cons!27499 (select (arr!38687 a!3892) from!3270) Nil!27500))) e!707108)))

(declare-fun b!1246820 () Bool)

(declare-fun e!707109 () Bool)

(assert (=> b!1246820 (= e!707108 e!707109)))

(declare-fun res!831497 () Bool)

(assert (=> b!1246820 (=> (not res!831497) (not e!707109))))

(assert (=> b!1246820 (= res!831497 (not (contains!7477 (t!40964 (t!40964 (Cons!27499 (select (arr!38687 a!3892) from!3270) Nil!27500))) (h!28717 (t!40964 (Cons!27499 (select (arr!38687 a!3892) from!3270) Nil!27500))))))))

(declare-fun b!1246821 () Bool)

(assert (=> b!1246821 (= e!707109 (noDuplicate!2041 (t!40964 (t!40964 (Cons!27499 (select (arr!38687 a!3892) from!3270) Nil!27500)))))))

(assert (= (and d!137841 (not res!831496)) b!1246820))

(assert (= (and b!1246820 res!831497) b!1246821))

(declare-fun m!1149157 () Bool)

(assert (=> b!1246820 m!1149157))

(declare-fun m!1149159 () Bool)

(assert (=> b!1246821 m!1149159))

(assert (=> b!1246756 d!137841))

(assert (=> b!1246781 d!137833))

(declare-fun d!137843 () Bool)

(declare-fun lt!563415 () Bool)

(assert (=> d!137843 (= lt!563415 (select (content!618 (t!40964 (Cons!27499 (select (arr!38687 a!3892) from!3270) Nil!27500))) (h!28717 (Cons!27499 (select (arr!38687 a!3892) from!3270) Nil!27500))))))

(declare-fun e!707110 () Bool)

(assert (=> d!137843 (= lt!563415 e!707110)))

(declare-fun res!831498 () Bool)

(assert (=> d!137843 (=> (not res!831498) (not e!707110))))

(assert (=> d!137843 (= res!831498 ((_ is Cons!27499) (t!40964 (Cons!27499 (select (arr!38687 a!3892) from!3270) Nil!27500))))))

(assert (=> d!137843 (= (contains!7477 (t!40964 (Cons!27499 (select (arr!38687 a!3892) from!3270) Nil!27500)) (h!28717 (Cons!27499 (select (arr!38687 a!3892) from!3270) Nil!27500))) lt!563415)))

(declare-fun b!1246822 () Bool)

(declare-fun e!707111 () Bool)

(assert (=> b!1246822 (= e!707110 e!707111)))

(declare-fun res!831499 () Bool)

(assert (=> b!1246822 (=> res!831499 e!707111)))

(assert (=> b!1246822 (= res!831499 (= (h!28717 (t!40964 (Cons!27499 (select (arr!38687 a!3892) from!3270) Nil!27500))) (h!28717 (Cons!27499 (select (arr!38687 a!3892) from!3270) Nil!27500))))))

(declare-fun b!1246823 () Bool)

(assert (=> b!1246823 (= e!707111 (contains!7477 (t!40964 (t!40964 (Cons!27499 (select (arr!38687 a!3892) from!3270) Nil!27500))) (h!28717 (Cons!27499 (select (arr!38687 a!3892) from!3270) Nil!27500))))))

(assert (= (and d!137843 res!831498) b!1246822))

(assert (= (and b!1246822 (not res!831499)) b!1246823))

(declare-fun m!1149161 () Bool)

(assert (=> d!137843 m!1149161))

(declare-fun m!1149163 () Bool)

(assert (=> d!137843 m!1149163))

(declare-fun m!1149165 () Bool)

(assert (=> b!1246823 m!1149165))

(assert (=> b!1246755 d!137843))

(declare-fun b!1246824 () Bool)

(declare-fun e!707114 () Bool)

(declare-fun call!61551 () Bool)

(assert (=> b!1246824 (= e!707114 call!61551)))

(declare-fun b!1246825 () Bool)

(declare-fun e!707115 () Bool)

(assert (=> b!1246825 (= e!707115 (contains!7477 (ite c!122347 (Cons!27499 (select (arr!38687 a!3892) from!3270) Nil!27500) Nil!27500) (select (arr!38687 a!3892) (bvadd from!3270 #b00000000000000000000000000000001))))))

(declare-fun b!1246826 () Bool)

(assert (=> b!1246826 (= e!707114 call!61551)))

(declare-fun b!1246827 () Bool)

(declare-fun e!707113 () Bool)

(assert (=> b!1246827 (= e!707113 e!707114)))

(declare-fun c!122354 () Bool)

(assert (=> b!1246827 (= c!122354 (validKeyInArray!0 (select (arr!38687 a!3892) (bvadd from!3270 #b00000000000000000000000000000001))))))

(declare-fun bm!61548 () Bool)

(assert (=> bm!61548 (= call!61551 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!122354 (Cons!27499 (select (arr!38687 a!3892) (bvadd from!3270 #b00000000000000000000000000000001)) (ite c!122347 (Cons!27499 (select (arr!38687 a!3892) from!3270) Nil!27500) Nil!27500)) (ite c!122347 (Cons!27499 (select (arr!38687 a!3892) from!3270) Nil!27500) Nil!27500))))))

(declare-fun b!1246828 () Bool)

(declare-fun e!707112 () Bool)

(assert (=> b!1246828 (= e!707112 e!707113)))

(declare-fun res!831501 () Bool)

(assert (=> b!1246828 (=> (not res!831501) (not e!707113))))

(assert (=> b!1246828 (= res!831501 (not e!707115))))

(declare-fun res!831502 () Bool)

(assert (=> b!1246828 (=> (not res!831502) (not e!707115))))

(assert (=> b!1246828 (= res!831502 (validKeyInArray!0 (select (arr!38687 a!3892) (bvadd from!3270 #b00000000000000000000000000000001))))))

(declare-fun d!137845 () Bool)

(declare-fun res!831500 () Bool)

(assert (=> d!137845 (=> res!831500 e!707112)))

(assert (=> d!137845 (= res!831500 (bvsge (bvadd from!3270 #b00000000000000000000000000000001) (size!39224 a!3892)))))

(assert (=> d!137845 (= (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!122347 (Cons!27499 (select (arr!38687 a!3892) from!3270) Nil!27500) Nil!27500)) e!707112)))

(assert (= (and d!137845 (not res!831500)) b!1246828))

(assert (= (and b!1246828 res!831502) b!1246825))

(assert (= (and b!1246828 res!831501) b!1246827))

(assert (= (and b!1246827 c!122354) b!1246826))

(assert (= (and b!1246827 (not c!122354)) b!1246824))

(assert (= (or b!1246826 b!1246824) bm!61548))

(declare-fun m!1149167 () Bool)

(assert (=> b!1246825 m!1149167))

(assert (=> b!1246825 m!1149167))

(declare-fun m!1149169 () Bool)

(assert (=> b!1246825 m!1149169))

(assert (=> b!1246827 m!1149167))

(assert (=> b!1246827 m!1149167))

(declare-fun m!1149171 () Bool)

(assert (=> b!1246827 m!1149171))

(assert (=> bm!61548 m!1149167))

(declare-fun m!1149173 () Bool)

(assert (=> bm!61548 m!1149173))

(assert (=> b!1246828 m!1149167))

(assert (=> b!1246828 m!1149167))

(assert (=> b!1246828 m!1149171))

(assert (=> bm!61541 d!137845))

(assert (=> b!1246780 d!137833))

(check-sat (not d!137839) (not d!137843) (not b!1246823) (not b!1246820) (not b!1246821) (not b!1246828) (not bm!61548) (not b!1246819) (not b!1246825) (not b!1246827))
(check-sat)
