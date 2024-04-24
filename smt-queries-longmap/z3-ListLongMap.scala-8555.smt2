; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104690 () Bool)

(assert start!104690)

(declare-fun res!832407 () Bool)

(declare-fun e!707863 () Bool)

(assert (=> start!104690 (=> (not res!832407) (not e!707863))))

(declare-datatypes ((array!80284 0))(
  ( (array!80285 (arr!38714 (Array (_ BitVec 32) (_ BitVec 64))) (size!39251 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80284)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104690 (= res!832407 (and (bvslt (size!39251 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39251 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39251 a!3892))))))

(assert (=> start!104690 e!707863))

(declare-fun array_inv!29652 (array!80284) Bool)

(assert (=> start!104690 (array_inv!29652 a!3892)))

(assert (=> start!104690 true))

(declare-fun b!1247906 () Bool)

(declare-fun e!707864 () Bool)

(declare-datatypes ((List!27530 0))(
  ( (Nil!27527) (Cons!27526 (h!28744 (_ BitVec 64)) (t!40991 List!27530)) )
))
(declare-fun arrayNoDuplicates!0 (array!80284 (_ BitVec 32) List!27530) Bool)

(assert (=> b!1247906 (= e!707864 (not (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27527)))))

(declare-fun b!1247907 () Bool)

(declare-datatypes ((Unit!41411 0))(
  ( (Unit!41412) )
))
(declare-fun e!707861 () Unit!41411)

(declare-fun lt!563629 () Unit!41411)

(assert (=> b!1247907 (= e!707861 lt!563629)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80284 List!27530 List!27530 (_ BitVec 32)) Unit!41411)

(assert (=> b!1247907 (= lt!563629 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27526 (select (arr!38714 a!3892) from!3270) Nil!27527) Nil!27527 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1247907 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27527)))

(declare-fun b!1247908 () Bool)

(declare-fun res!832408 () Bool)

(assert (=> b!1247908 (=> (not res!832408) (not e!707863))))

(assert (=> b!1247908 (= res!832408 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27527))))

(declare-fun b!1247909 () Bool)

(declare-fun Unit!41413 () Unit!41411)

(assert (=> b!1247909 (= e!707861 Unit!41413)))

(declare-fun b!1247910 () Bool)

(declare-fun res!832409 () Bool)

(assert (=> b!1247910 (=> (not res!832409) (not e!707863))))

(assert (=> b!1247910 (= res!832409 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39251 a!3892)) (not (= newFrom!287 (size!39251 a!3892)))))))

(declare-fun b!1247911 () Bool)

(assert (=> b!1247911 (= e!707863 e!707864)))

(declare-fun res!832406 () Bool)

(assert (=> b!1247911 (=> (not res!832406) (not e!707864))))

(assert (=> b!1247911 (= res!832406 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!563628 () Unit!41411)

(assert (=> b!1247911 (= lt!563628 e!707861)))

(declare-fun c!122442 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1247911 (= c!122442 (validKeyInArray!0 (select (arr!38714 a!3892) from!3270)))))

(assert (= (and start!104690 res!832407) b!1247908))

(assert (= (and b!1247908 res!832408) b!1247910))

(assert (= (and b!1247910 res!832409) b!1247911))

(assert (= (and b!1247911 c!122442) b!1247907))

(assert (= (and b!1247911 (not c!122442)) b!1247909))

(assert (= (and b!1247911 res!832406) b!1247906))

(declare-fun m!1150021 () Bool)

(assert (=> b!1247906 m!1150021))

(declare-fun m!1150023 () Bool)

(assert (=> start!104690 m!1150023))

(declare-fun m!1150025 () Bool)

(assert (=> b!1247907 m!1150025))

(declare-fun m!1150027 () Bool)

(assert (=> b!1247907 m!1150027))

(assert (=> b!1247907 m!1150021))

(assert (=> b!1247911 m!1150025))

(assert (=> b!1247911 m!1150025))

(declare-fun m!1150029 () Bool)

(assert (=> b!1247911 m!1150029))

(declare-fun m!1150031 () Bool)

(assert (=> b!1247908 m!1150031))

(check-sat (not b!1247911) (not b!1247906) (not b!1247907) (not b!1247908) (not start!104690))
(check-sat)
(get-model)

(declare-fun b!1247958 () Bool)

(declare-fun e!707897 () Bool)

(declare-fun e!707898 () Bool)

(assert (=> b!1247958 (= e!707897 e!707898)))

(declare-fun c!122451 () Bool)

(assert (=> b!1247958 (= c!122451 (validKeyInArray!0 (select (arr!38714 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1247959 () Bool)

(declare-fun call!61597 () Bool)

(assert (=> b!1247959 (= e!707898 call!61597)))

(declare-fun b!1247960 () Bool)

(declare-fun e!707899 () Bool)

(declare-fun contains!7492 (List!27530 (_ BitVec 64)) Bool)

(assert (=> b!1247960 (= e!707899 (contains!7492 Nil!27527 (select (arr!38714 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun d!138113 () Bool)

(declare-fun res!832440 () Bool)

(declare-fun e!707900 () Bool)

(assert (=> d!138113 (=> res!832440 e!707900)))

(assert (=> d!138113 (= res!832440 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) (size!39251 a!3892)))))

(assert (=> d!138113 (= (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27527) e!707900)))

(declare-fun b!1247961 () Bool)

(assert (=> b!1247961 (= e!707900 e!707897)))

(declare-fun res!832441 () Bool)

(assert (=> b!1247961 (=> (not res!832441) (not e!707897))))

(assert (=> b!1247961 (= res!832441 (not e!707899))))

(declare-fun res!832442 () Bool)

(assert (=> b!1247961 (=> (not res!832442) (not e!707899))))

(assert (=> b!1247961 (= res!832442 (validKeyInArray!0 (select (arr!38714 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1247962 () Bool)

(assert (=> b!1247962 (= e!707898 call!61597)))

(declare-fun bm!61594 () Bool)

(assert (=> bm!61594 (= call!61597 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270 #b00000000000000000000000000000001) (ite c!122451 (Cons!27526 (select (arr!38714 a!3892) (bvadd #b00000000000000000000000000000001 from!3270)) Nil!27527) Nil!27527)))))

(assert (= (and d!138113 (not res!832440)) b!1247961))

(assert (= (and b!1247961 res!832442) b!1247960))

(assert (= (and b!1247961 res!832441) b!1247958))

(assert (= (and b!1247958 c!122451) b!1247959))

(assert (= (and b!1247958 (not c!122451)) b!1247962))

(assert (= (or b!1247959 b!1247962) bm!61594))

(declare-fun m!1150057 () Bool)

(assert (=> b!1247958 m!1150057))

(assert (=> b!1247958 m!1150057))

(declare-fun m!1150059 () Bool)

(assert (=> b!1247958 m!1150059))

(assert (=> b!1247960 m!1150057))

(assert (=> b!1247960 m!1150057))

(declare-fun m!1150061 () Bool)

(assert (=> b!1247960 m!1150061))

(assert (=> b!1247961 m!1150057))

(assert (=> b!1247961 m!1150057))

(assert (=> b!1247961 m!1150059))

(assert (=> bm!61594 m!1150057))

(declare-fun m!1150063 () Bool)

(assert (=> bm!61594 m!1150063))

(assert (=> b!1247906 d!138113))

(declare-fun d!138115 () Bool)

(assert (=> d!138115 (= (validKeyInArray!0 (select (arr!38714 a!3892) from!3270)) (and (not (= (select (arr!38714 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38714 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1247911 d!138115))

(declare-fun d!138117 () Bool)

(assert (=> d!138117 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27527)))

(declare-fun lt!563644 () Unit!41411)

(declare-fun choose!80 (array!80284 List!27530 List!27530 (_ BitVec 32)) Unit!41411)

(assert (=> d!138117 (= lt!563644 (choose!80 a!3892 (Cons!27526 (select (arr!38714 a!3892) from!3270) Nil!27527) Nil!27527 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> d!138117 (bvslt (size!39251 a!3892) #b01111111111111111111111111111111)))

(assert (=> d!138117 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27526 (select (arr!38714 a!3892) from!3270) Nil!27527) Nil!27527 (bvadd #b00000000000000000000000000000001 from!3270)) lt!563644)))

(declare-fun bs!35147 () Bool)

(assert (= bs!35147 d!138117))

(assert (=> bs!35147 m!1150021))

(declare-fun m!1150065 () Bool)

(assert (=> bs!35147 m!1150065))

(assert (=> b!1247907 d!138117))

(assert (=> b!1247907 d!138113))

(declare-fun d!138119 () Bool)

(assert (=> d!138119 (= (array_inv!29652 a!3892) (bvsge (size!39251 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104690 d!138119))

(declare-fun b!1247963 () Bool)

(declare-fun e!707901 () Bool)

(declare-fun e!707902 () Bool)

(assert (=> b!1247963 (= e!707901 e!707902)))

(declare-fun c!122452 () Bool)

(assert (=> b!1247963 (= c!122452 (validKeyInArray!0 (select (arr!38714 a!3892) from!3270)))))

(declare-fun b!1247964 () Bool)

(declare-fun call!61598 () Bool)

(assert (=> b!1247964 (= e!707902 call!61598)))

(declare-fun b!1247965 () Bool)

(declare-fun e!707903 () Bool)

(assert (=> b!1247965 (= e!707903 (contains!7492 Nil!27527 (select (arr!38714 a!3892) from!3270)))))

(declare-fun d!138121 () Bool)

(declare-fun res!832443 () Bool)

(declare-fun e!707904 () Bool)

(assert (=> d!138121 (=> res!832443 e!707904)))

(assert (=> d!138121 (= res!832443 (bvsge from!3270 (size!39251 a!3892)))))

(assert (=> d!138121 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27527) e!707904)))

(declare-fun b!1247966 () Bool)

(assert (=> b!1247966 (= e!707904 e!707901)))

(declare-fun res!832444 () Bool)

(assert (=> b!1247966 (=> (not res!832444) (not e!707901))))

(assert (=> b!1247966 (= res!832444 (not e!707903))))

(declare-fun res!832445 () Bool)

(assert (=> b!1247966 (=> (not res!832445) (not e!707903))))

(assert (=> b!1247966 (= res!832445 (validKeyInArray!0 (select (arr!38714 a!3892) from!3270)))))

(declare-fun b!1247967 () Bool)

(assert (=> b!1247967 (= e!707902 call!61598)))

(declare-fun bm!61595 () Bool)

(assert (=> bm!61595 (= call!61598 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!122452 (Cons!27526 (select (arr!38714 a!3892) from!3270) Nil!27527) Nil!27527)))))

(assert (= (and d!138121 (not res!832443)) b!1247966))

(assert (= (and b!1247966 res!832445) b!1247965))

(assert (= (and b!1247966 res!832444) b!1247963))

(assert (= (and b!1247963 c!122452) b!1247964))

(assert (= (and b!1247963 (not c!122452)) b!1247967))

(assert (= (or b!1247964 b!1247967) bm!61595))

(assert (=> b!1247963 m!1150025))

(assert (=> b!1247963 m!1150025))

(assert (=> b!1247963 m!1150029))

(assert (=> b!1247965 m!1150025))

(assert (=> b!1247965 m!1150025))

(declare-fun m!1150067 () Bool)

(assert (=> b!1247965 m!1150067))

(assert (=> b!1247966 m!1150025))

(assert (=> b!1247966 m!1150025))

(assert (=> b!1247966 m!1150029))

(assert (=> bm!61595 m!1150025))

(declare-fun m!1150069 () Bool)

(assert (=> bm!61595 m!1150069))

(assert (=> b!1247908 d!138121))

(check-sat (not b!1247960) (not b!1247961) (not bm!61595) (not b!1247963) (not bm!61594) (not b!1247958) (not d!138117) (not b!1247966) (not b!1247965))
(check-sat)
