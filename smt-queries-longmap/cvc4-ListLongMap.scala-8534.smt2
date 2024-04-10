; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104098 () Bool)

(assert start!104098)

(declare-fun res!830493 () Bool)

(declare-fun e!705758 () Bool)

(assert (=> start!104098 (=> (not res!830493) (not e!705758))))

(declare-datatypes ((array!80104 0))(
  ( (array!80105 (arr!38641 (Array (_ BitVec 32) (_ BitVec 64))) (size!39177 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80104)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104098 (= res!830493 (and (bvslt (size!39177 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39177 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39177 a!3892))))))

(assert (=> start!104098 e!705758))

(declare-fun array_inv!29489 (array!80104) Bool)

(assert (=> start!104098 (array_inv!29489 a!3892)))

(assert (=> start!104098 true))

(declare-fun b!1244953 () Bool)

(declare-fun res!830490 () Bool)

(assert (=> b!1244953 (=> (not res!830490) (not e!705758))))

(declare-datatypes ((List!27444 0))(
  ( (Nil!27441) (Cons!27440 (h!28649 (_ BitVec 64)) (t!40913 List!27444)) )
))
(declare-fun noDuplicate!2016 (List!27444) Bool)

(assert (=> b!1244953 (= res!830490 (noDuplicate!2016 Nil!27441))))

(declare-fun b!1244954 () Bool)

(declare-fun e!705759 () Bool)

(declare-fun contains!7437 (List!27444 (_ BitVec 64)) Bool)

(assert (=> b!1244954 (= e!705759 (contains!7437 Nil!27441 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1244955 () Bool)

(declare-fun res!830494 () Bool)

(assert (=> b!1244955 (=> (not res!830494) (not e!705758))))

(assert (=> b!1244955 (= res!830494 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39177 a!3892)) (= newFrom!287 (size!39177 a!3892)) (bvsge newFrom!287 #b00000000000000000000000000000000)))))

(declare-fun b!1244956 () Bool)

(assert (=> b!1244956 (= e!705758 e!705759)))

(declare-fun res!830491 () Bool)

(assert (=> b!1244956 (=> res!830491 e!705759)))

(assert (=> b!1244956 (= res!830491 (contains!7437 Nil!27441 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1244957 () Bool)

(declare-fun res!830492 () Bool)

(assert (=> b!1244957 (=> (not res!830492) (not e!705758))))

(declare-fun arrayNoDuplicates!0 (array!80104 (_ BitVec 32) List!27444) Bool)

(assert (=> b!1244957 (= res!830492 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27441))))

(assert (= (and start!104098 res!830493) b!1244957))

(assert (= (and b!1244957 res!830492) b!1244955))

(assert (= (and b!1244955 res!830494) b!1244953))

(assert (= (and b!1244953 res!830490) b!1244956))

(assert (= (and b!1244956 (not res!830491)) b!1244954))

(declare-fun m!1147127 () Bool)

(assert (=> b!1244954 m!1147127))

(declare-fun m!1147129 () Bool)

(assert (=> b!1244957 m!1147129))

(declare-fun m!1147131 () Bool)

(assert (=> b!1244956 m!1147131))

(declare-fun m!1147133 () Bool)

(assert (=> b!1244953 m!1147133))

(declare-fun m!1147135 () Bool)

(assert (=> start!104098 m!1147135))

(push 1)

(assert (not b!1244953))

(assert (not b!1244956))

(assert (not b!1244954))

(assert (not start!104098))

(assert (not b!1244957))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!137257 () Bool)

(assert (=> d!137257 (= (array_inv!29489 a!3892) (bvsge (size!39177 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104098 d!137257))

(declare-fun d!137259 () Bool)

(declare-fun lt!562853 () Bool)

(declare-fun content!615 (List!27444) (Set (_ BitVec 64)))

(assert (=> d!137259 (= lt!562853 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!615 Nil!27441)))))

(declare-fun e!705771 () Bool)

(assert (=> d!137259 (= lt!562853 e!705771)))

(declare-fun res!830505 () Bool)

(assert (=> d!137259 (=> (not res!830505) (not e!705771))))

(assert (=> d!137259 (= res!830505 (is-Cons!27440 Nil!27441))))

(assert (=> d!137259 (= (contains!7437 Nil!27441 #b0000000000000000000000000000000000000000000000000000000000000000) lt!562853)))

(declare-fun b!1244968 () Bool)

(declare-fun e!705770 () Bool)

(assert (=> b!1244968 (= e!705771 e!705770)))

(declare-fun res!830506 () Bool)

(assert (=> b!1244968 (=> res!830506 e!705770)))

(assert (=> b!1244968 (= res!830506 (= (h!28649 Nil!27441) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1244969 () Bool)

(assert (=> b!1244969 (= e!705770 (contains!7437 (t!40913 Nil!27441) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137259 res!830505) b!1244968))

(assert (= (and b!1244968 (not res!830506)) b!1244969))

(declare-fun m!1147143 () Bool)

(assert (=> d!137259 m!1147143))

(declare-fun m!1147145 () Bool)

(assert (=> d!137259 m!1147145))

(declare-fun m!1147147 () Bool)

(assert (=> b!1244969 m!1147147))

(assert (=> b!1244956 d!137259))

(declare-fun call!61452 () Bool)

(declare-fun c!121920 () Bool)

(declare-fun bm!61449 () Bool)

(assert (=> bm!61449 (= call!61452 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121920 (Cons!27440 (select (arr!38641 a!3892) from!3270) Nil!27441) Nil!27441)))))

(declare-fun b!1244998 () Bool)

(declare-fun e!705796 () Bool)

(declare-fun e!705799 () Bool)

(assert (=> b!1244998 (= e!705796 e!705799)))

(declare-fun res!830529 () Bool)

(assert (=> b!1244998 (=> (not res!830529) (not e!705799))))

(declare-fun e!705797 () Bool)

(assert (=> b!1244998 (= res!830529 (not e!705797))))

(declare-fun res!830528 () Bool)

(assert (=> b!1244998 (=> (not res!830528) (not e!705797))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244998 (= res!830528 (validKeyInArray!0 (select (arr!38641 a!3892) from!3270)))))

(declare-fun d!137265 () Bool)

(declare-fun res!830527 () Bool)

(assert (=> d!137265 (=> res!830527 e!705796)))

(assert (=> d!137265 (= res!830527 (bvsge from!3270 (size!39177 a!3892)))))

(assert (=> d!137265 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27441) e!705796)))

(declare-fun b!1244999 () Bool)

(declare-fun e!705798 () Bool)

(assert (=> b!1244999 (= e!705799 e!705798)))

(assert (=> b!1244999 (= c!121920 (validKeyInArray!0 (select (arr!38641 a!3892) from!3270)))))

(declare-fun b!1245000 () Bool)

(assert (=> b!1245000 (= e!705798 call!61452)))

(declare-fun b!1245001 () Bool)

(assert (=> b!1245001 (= e!705797 (contains!7437 Nil!27441 (select (arr!38641 a!3892) from!3270)))))

(declare-fun b!1245002 () Bool)

(assert (=> b!1245002 (= e!705798 call!61452)))

(assert (= (and d!137265 (not res!830527)) b!1244998))

(assert (= (and b!1244998 res!830528) b!1245001))

(assert (= (and b!1244998 res!830529) b!1244999))

(assert (= (and b!1244999 c!121920) b!1245000))

(assert (= (and b!1244999 (not c!121920)) b!1245002))

(assert (= (or b!1245000 b!1245002) bm!61449))

(declare-fun m!1147157 () Bool)

(assert (=> bm!61449 m!1147157))

(declare-fun m!1147159 () Bool)

(assert (=> bm!61449 m!1147159))

(assert (=> b!1244998 m!1147157))

(assert (=> b!1244998 m!1147157))

(declare-fun m!1147161 () Bool)

(assert (=> b!1244998 m!1147161))

(assert (=> b!1244999 m!1147157))

(assert (=> b!1244999 m!1147157))

(assert (=> b!1244999 m!1147161))

(assert (=> b!1245001 m!1147157))

(assert (=> b!1245001 m!1147157))

(declare-fun m!1147163 () Bool)

(assert (=> b!1245001 m!1147163))

(assert (=> b!1244957 d!137265))

(declare-fun d!137273 () Bool)

(declare-fun res!830539 () Bool)

(declare-fun e!705810 () Bool)

(assert (=> d!137273 (=> res!830539 e!705810)))

(assert (=> d!137273 (= res!830539 (is-Nil!27441 Nil!27441))))

(assert (=> d!137273 (= (noDuplicate!2016 Nil!27441) e!705810)))

(declare-fun b!1245014 () Bool)

(declare-fun e!705811 () Bool)

(assert (=> b!1245014 (= e!705810 e!705811)))

(declare-fun res!830540 () Bool)

(assert (=> b!1245014 (=> (not res!830540) (not e!705811))))

(assert (=> b!1245014 (= res!830540 (not (contains!7437 (t!40913 Nil!27441) (h!28649 Nil!27441))))))

(declare-fun b!1245015 () Bool)

(assert (=> b!1245015 (= e!705811 (noDuplicate!2016 (t!40913 Nil!27441)))))

(assert (= (and d!137273 (not res!830539)) b!1245014))

(assert (= (and b!1245014 res!830540) b!1245015))

(declare-fun m!1147173 () Bool)

(assert (=> b!1245014 m!1147173))

(declare-fun m!1147175 () Bool)

(assert (=> b!1245015 m!1147175))

(assert (=> b!1244953 d!137273))

(declare-fun d!137275 () Bool)

(declare-fun lt!562857 () Bool)

(assert (=> d!137275 (= lt!562857 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!615 Nil!27441)))))

(declare-fun e!705815 () Bool)

(assert (=> d!137275 (= lt!562857 e!705815)))

(declare-fun res!830543 () Bool)

(assert (=> d!137275 (=> (not res!830543) (not e!705815))))

(assert (=> d!137275 (= res!830543 (is-Cons!27440 Nil!27441))))

(assert (=> d!137275 (= (contains!7437 Nil!27441 #b1000000000000000000000000000000000000000000000000000000000000000) lt!562857)))

(declare-fun b!1245018 () Bool)

(declare-fun e!705814 () Bool)

(assert (=> b!1245018 (= e!705815 e!705814)))

(declare-fun res!830544 () Bool)

(assert (=> b!1245018 (=> res!830544 e!705814)))

(assert (=> b!1245018 (= res!830544 (= (h!28649 Nil!27441) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245019 () Bool)

(assert (=> b!1245019 (= e!705814 (contains!7437 (t!40913 Nil!27441) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137275 res!830543) b!1245018))

(assert (= (and b!1245018 (not res!830544)) b!1245019))

(assert (=> d!137275 m!1147143))

(declare-fun m!1147177 () Bool)

(assert (=> d!137275 m!1147177))

(declare-fun m!1147179 () Bool)

(assert (=> b!1245019 m!1147179))

(assert (=> b!1244954 d!137275))

(push 1)

