; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104074 () Bool)

(assert start!104074)

(declare-fun res!830394 () Bool)

(declare-fun e!705671 () Bool)

(assert (=> start!104074 (=> (not res!830394) (not e!705671))))

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((array!80094 0))(
  ( (array!80095 (arr!38637 (Array (_ BitVec 32) (_ BitVec 64))) (size!39173 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80094)

(assert (=> start!104074 (= res!830394 (and (bvslt (size!39173 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39173 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39173 a!3892))))))

(assert (=> start!104074 e!705671))

(declare-fun array_inv!29485 (array!80094) Bool)

(assert (=> start!104074 (array_inv!29485 a!3892)))

(assert (=> start!104074 true))

(declare-fun b!1244838 () Bool)

(declare-fun res!830395 () Bool)

(assert (=> b!1244838 (=> (not res!830395) (not e!705671))))

(declare-datatypes ((List!27440 0))(
  ( (Nil!27437) (Cons!27436 (h!28645 (_ BitVec 64)) (t!40909 List!27440)) )
))
(declare-fun arrayNoDuplicates!0 (array!80094 (_ BitVec 32) List!27440) Bool)

(assert (=> b!1244838 (= res!830395 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27437))))

(declare-fun b!1244839 () Bool)

(declare-fun res!830393 () Bool)

(assert (=> b!1244839 (=> (not res!830393) (not e!705671))))

(assert (=> b!1244839 (= res!830393 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39173 a!3892)) (= newFrom!287 (size!39173 a!3892)) (bvsge newFrom!287 #b00000000000000000000000000000000)))))

(declare-fun b!1244840 () Bool)

(declare-fun noDuplicate!2012 (List!27440) Bool)

(assert (=> b!1244840 (= e!705671 (not (noDuplicate!2012 Nil!27437)))))

(assert (= (and start!104074 res!830394) b!1244838))

(assert (= (and b!1244838 res!830395) b!1244839))

(assert (= (and b!1244839 res!830393) b!1244840))

(declare-fun m!1147067 () Bool)

(assert (=> start!104074 m!1147067))

(declare-fun m!1147069 () Bool)

(assert (=> b!1244838 m!1147069))

(declare-fun m!1147071 () Bool)

(assert (=> b!1244840 m!1147071))

(check-sat (not b!1244840) (not b!1244838) (not start!104074))
(check-sat)
(get-model)

(declare-fun d!137237 () Bool)

(declare-fun res!830409 () Bool)

(declare-fun e!705683 () Bool)

(assert (=> d!137237 (=> res!830409 e!705683)))

(get-info :version)

(assert (=> d!137237 (= res!830409 ((_ is Nil!27437) Nil!27437))))

(assert (=> d!137237 (= (noDuplicate!2012 Nil!27437) e!705683)))

(declare-fun b!1244854 () Bool)

(declare-fun e!705684 () Bool)

(assert (=> b!1244854 (= e!705683 e!705684)))

(declare-fun res!830410 () Bool)

(assert (=> b!1244854 (=> (not res!830410) (not e!705684))))

(declare-fun contains!7433 (List!27440 (_ BitVec 64)) Bool)

(assert (=> b!1244854 (= res!830410 (not (contains!7433 (t!40909 Nil!27437) (h!28645 Nil!27437))))))

(declare-fun b!1244855 () Bool)

(assert (=> b!1244855 (= e!705684 (noDuplicate!2012 (t!40909 Nil!27437)))))

(assert (= (and d!137237 (not res!830409)) b!1244854))

(assert (= (and b!1244854 res!830410) b!1244855))

(declare-fun m!1147079 () Bool)

(assert (=> b!1244854 m!1147079))

(declare-fun m!1147081 () Bool)

(assert (=> b!1244855 m!1147081))

(assert (=> b!1244840 d!137237))

(declare-fun b!1244882 () Bool)

(declare-fun e!705710 () Bool)

(declare-fun e!705707 () Bool)

(assert (=> b!1244882 (= e!705710 e!705707)))

(declare-fun res!830430 () Bool)

(assert (=> b!1244882 (=> (not res!830430) (not e!705707))))

(declare-fun e!705709 () Bool)

(assert (=> b!1244882 (= res!830430 (not e!705709))))

(declare-fun res!830429 () Bool)

(assert (=> b!1244882 (=> (not res!830429) (not e!705709))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244882 (= res!830429 (validKeyInArray!0 (select (arr!38637 a!3892) from!3270)))))

(declare-fun b!1244883 () Bool)

(declare-fun e!705708 () Bool)

(assert (=> b!1244883 (= e!705707 e!705708)))

(declare-fun c!121911 () Bool)

(assert (=> b!1244883 (= c!121911 (validKeyInArray!0 (select (arr!38637 a!3892) from!3270)))))

(declare-fun call!61441 () Bool)

(declare-fun bm!61438 () Bool)

(assert (=> bm!61438 (= call!61441 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121911 (Cons!27436 (select (arr!38637 a!3892) from!3270) Nil!27437) Nil!27437)))))

(declare-fun b!1244884 () Bool)

(assert (=> b!1244884 (= e!705708 call!61441)))

(declare-fun d!137241 () Bool)

(declare-fun res!830431 () Bool)

(assert (=> d!137241 (=> res!830431 e!705710)))

(assert (=> d!137241 (= res!830431 (bvsge from!3270 (size!39173 a!3892)))))

(assert (=> d!137241 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27437) e!705710)))

(declare-fun b!1244885 () Bool)

(assert (=> b!1244885 (= e!705708 call!61441)))

(declare-fun b!1244886 () Bool)

(assert (=> b!1244886 (= e!705709 (contains!7433 Nil!27437 (select (arr!38637 a!3892) from!3270)))))

(assert (= (and d!137241 (not res!830431)) b!1244882))

(assert (= (and b!1244882 res!830429) b!1244886))

(assert (= (and b!1244882 res!830430) b!1244883))

(assert (= (and b!1244883 c!121911) b!1244884))

(assert (= (and b!1244883 (not c!121911)) b!1244885))

(assert (= (or b!1244884 b!1244885) bm!61438))

(declare-fun m!1147087 () Bool)

(assert (=> b!1244882 m!1147087))

(assert (=> b!1244882 m!1147087))

(declare-fun m!1147089 () Bool)

(assert (=> b!1244882 m!1147089))

(assert (=> b!1244883 m!1147087))

(assert (=> b!1244883 m!1147087))

(assert (=> b!1244883 m!1147089))

(assert (=> bm!61438 m!1147087))

(declare-fun m!1147091 () Bool)

(assert (=> bm!61438 m!1147091))

(assert (=> b!1244886 m!1147087))

(assert (=> b!1244886 m!1147087))

(declare-fun m!1147093 () Bool)

(assert (=> b!1244886 m!1147093))

(assert (=> b!1244838 d!137241))

(declare-fun d!137247 () Bool)

(assert (=> d!137247 (= (array_inv!29485 a!3892) (bvsge (size!39173 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104074 d!137247))

(check-sat (not b!1244855) (not b!1244882) (not bm!61438) (not b!1244886) (not b!1244883) (not b!1244854))
(check-sat)
