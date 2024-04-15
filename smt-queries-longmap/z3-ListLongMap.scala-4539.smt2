; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63076 () Bool)

(assert start!63076)

(declare-fun b!710528 () Bool)

(declare-fun e!399786 () Bool)

(declare-datatypes ((List!13426 0))(
  ( (Nil!13423) (Cons!13422 (h!14467 (_ BitVec 64)) (t!19720 List!13426)) )
))
(declare-fun lt!318128 () List!13426)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3948 (List!13426 (_ BitVec 64)) Bool)

(assert (=> b!710528 (= e!399786 (not (contains!3948 lt!318128 k0!2824)))))

(declare-fun b!710529 () Bool)

(declare-fun e!399785 () Bool)

(assert (=> b!710529 (= e!399785 e!399786)))

(declare-fun res!474071 () Bool)

(assert (=> b!710529 (=> (not res!474071) (not e!399786))))

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> b!710529 (= res!474071 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun newAcc!49 () List!13426)

(declare-datatypes ((array!40401 0))(
  ( (array!40402 (arr!19346 (Array (_ BitVec 32) (_ BitVec 64))) (size!19746 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40401)

(declare-fun $colon$colon!520 (List!13426 (_ BitVec 64)) List!13426)

(assert (=> b!710529 (= lt!318128 ($colon$colon!520 newAcc!49 (select (arr!19346 a!3591) from!2969)))))

(declare-fun lt!318127 () List!13426)

(declare-fun acc!652 () List!13426)

(assert (=> b!710529 (= lt!318127 ($colon$colon!520 acc!652 (select (arr!19346 a!3591) from!2969)))))

(declare-fun b!710530 () Bool)

(declare-fun res!474072 () Bool)

(assert (=> b!710530 (=> (not res!474072) (not e!399785))))

(declare-fun -!375 (List!13426 (_ BitVec 64)) List!13426)

(assert (=> b!710530 (= res!474072 (= (-!375 newAcc!49 k0!2824) acc!652))))

(declare-fun b!710531 () Bool)

(declare-fun res!474077 () Bool)

(assert (=> b!710531 (=> (not res!474077) (not e!399785))))

(assert (=> b!710531 (= res!474077 (not (contains!3948 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710532 () Bool)

(declare-fun res!474086 () Bool)

(assert (=> b!710532 (=> (not res!474086) (not e!399786))))

(declare-fun arrayContainsKey!0 (array!40401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!710532 (= res!474086 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!710533 () Bool)

(declare-fun res!474073 () Bool)

(assert (=> b!710533 (=> (not res!474073) (not e!399786))))

(assert (=> b!710533 (= res!474073 (not (contains!3948 lt!318127 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710534 () Bool)

(declare-fun res!474085 () Bool)

(assert (=> b!710534 (=> (not res!474085) (not e!399785))))

(assert (=> b!710534 (= res!474085 (not (contains!3948 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710535 () Bool)

(declare-fun res!474069 () Bool)

(assert (=> b!710535 (=> (not res!474069) (not e!399785))))

(assert (=> b!710535 (= res!474069 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19746 a!3591)))))

(declare-fun b!710536 () Bool)

(declare-fun res!474088 () Bool)

(assert (=> b!710536 (=> (not res!474088) (not e!399785))))

(assert (=> b!710536 (= res!474088 (not (contains!3948 acc!652 k0!2824)))))

(declare-fun b!710537 () Bool)

(declare-fun res!474067 () Bool)

(assert (=> b!710537 (=> (not res!474067) (not e!399785))))

(assert (=> b!710537 (= res!474067 (not (contains!3948 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710538 () Bool)

(declare-fun res!474084 () Bool)

(assert (=> b!710538 (=> (not res!474084) (not e!399785))))

(assert (=> b!710538 (= res!474084 (contains!3948 newAcc!49 k0!2824))))

(declare-fun b!710539 () Bool)

(declare-fun res!474074 () Bool)

(assert (=> b!710539 (=> (not res!474074) (not e!399785))))

(declare-fun subseq!410 (List!13426 List!13426) Bool)

(assert (=> b!710539 (= res!474074 (subseq!410 acc!652 newAcc!49))))

(declare-fun b!710540 () Bool)

(declare-fun res!474083 () Bool)

(assert (=> b!710540 (=> (not res!474083) (not e!399786))))

(assert (=> b!710540 (= res!474083 (subseq!410 lt!318127 lt!318128))))

(declare-fun b!710541 () Bool)

(declare-fun res!474076 () Bool)

(assert (=> b!710541 (=> (not res!474076) (not e!399786))))

(assert (=> b!710541 (= res!474076 (not (contains!3948 lt!318127 k0!2824)))))

(declare-fun b!710542 () Bool)

(declare-fun res!474079 () Bool)

(assert (=> b!710542 (=> (not res!474079) (not e!399786))))

(declare-fun noDuplicate!1217 (List!13426) Bool)

(assert (=> b!710542 (= res!474079 (noDuplicate!1217 lt!318127))))

(declare-fun b!710543 () Bool)

(declare-fun res!474089 () Bool)

(assert (=> b!710543 (=> (not res!474089) (not e!399785))))

(assert (=> b!710543 (= res!474089 (not (contains!3948 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!474080 () Bool)

(assert (=> start!63076 (=> (not res!474080) (not e!399785))))

(assert (=> start!63076 (= res!474080 (and (bvslt (size!19746 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19746 a!3591))))))

(assert (=> start!63076 e!399785))

(assert (=> start!63076 true))

(declare-fun array_inv!15229 (array!40401) Bool)

(assert (=> start!63076 (array_inv!15229 a!3591)))

(declare-fun b!710544 () Bool)

(declare-fun res!474075 () Bool)

(assert (=> b!710544 (=> (not res!474075) (not e!399785))))

(assert (=> b!710544 (= res!474075 (noDuplicate!1217 acc!652))))

(declare-fun b!710545 () Bool)

(declare-fun res!474070 () Bool)

(assert (=> b!710545 (=> (not res!474070) (not e!399786))))

(assert (=> b!710545 (= res!474070 (not (contains!3948 lt!318127 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710546 () Bool)

(declare-fun res!474068 () Bool)

(assert (=> b!710546 (=> (not res!474068) (not e!399785))))

(declare-fun arrayNoDuplicates!0 (array!40401 (_ BitVec 32) List!13426) Bool)

(assert (=> b!710546 (= res!474068 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!710547 () Bool)

(declare-fun res!474081 () Bool)

(assert (=> b!710547 (=> (not res!474081) (not e!399785))))

(assert (=> b!710547 (= res!474081 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!710548 () Bool)

(declare-fun res!474087 () Bool)

(assert (=> b!710548 (=> (not res!474087) (not e!399785))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!710548 (= res!474087 (validKeyInArray!0 (select (arr!19346 a!3591) from!2969)))))

(declare-fun b!710549 () Bool)

(declare-fun res!474090 () Bool)

(assert (=> b!710549 (=> (not res!474090) (not e!399786))))

(assert (=> b!710549 (= res!474090 (noDuplicate!1217 lt!318128))))

(declare-fun b!710550 () Bool)

(declare-fun res!474078 () Bool)

(assert (=> b!710550 (=> (not res!474078) (not e!399785))))

(assert (=> b!710550 (= res!474078 (noDuplicate!1217 newAcc!49))))

(declare-fun b!710551 () Bool)

(declare-fun res!474082 () Bool)

(assert (=> b!710551 (=> (not res!474082) (not e!399786))))

(assert (=> b!710551 (= res!474082 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318127))))

(declare-fun b!710552 () Bool)

(declare-fun res!474066 () Bool)

(assert (=> b!710552 (=> (not res!474066) (not e!399785))))

(assert (=> b!710552 (= res!474066 (validKeyInArray!0 k0!2824))))

(assert (= (and start!63076 res!474080) b!710544))

(assert (= (and b!710544 res!474075) b!710550))

(assert (= (and b!710550 res!474078) b!710534))

(assert (= (and b!710534 res!474085) b!710543))

(assert (= (and b!710543 res!474089) b!710547))

(assert (= (and b!710547 res!474081) b!710536))

(assert (= (and b!710536 res!474088) b!710552))

(assert (= (and b!710552 res!474066) b!710546))

(assert (= (and b!710546 res!474068) b!710539))

(assert (= (and b!710539 res!474074) b!710538))

(assert (= (and b!710538 res!474084) b!710530))

(assert (= (and b!710530 res!474072) b!710531))

(assert (= (and b!710531 res!474077) b!710537))

(assert (= (and b!710537 res!474067) b!710535))

(assert (= (and b!710535 res!474069) b!710548))

(assert (= (and b!710548 res!474087) b!710529))

(assert (= (and b!710529 res!474071) b!710542))

(assert (= (and b!710542 res!474079) b!710549))

(assert (= (and b!710549 res!474090) b!710533))

(assert (= (and b!710533 res!474073) b!710545))

(assert (= (and b!710545 res!474070) b!710532))

(assert (= (and b!710532 res!474086) b!710541))

(assert (= (and b!710541 res!474076) b!710551))

(assert (= (and b!710551 res!474082) b!710540))

(assert (= (and b!710540 res!474083) b!710528))

(declare-fun m!667131 () Bool)

(assert (=> b!710529 m!667131))

(assert (=> b!710529 m!667131))

(declare-fun m!667133 () Bool)

(assert (=> b!710529 m!667133))

(assert (=> b!710529 m!667131))

(declare-fun m!667135 () Bool)

(assert (=> b!710529 m!667135))

(declare-fun m!667137 () Bool)

(assert (=> b!710549 m!667137))

(declare-fun m!667139 () Bool)

(assert (=> b!710545 m!667139))

(declare-fun m!667141 () Bool)

(assert (=> b!710551 m!667141))

(declare-fun m!667143 () Bool)

(assert (=> b!710530 m!667143))

(declare-fun m!667145 () Bool)

(assert (=> start!63076 m!667145))

(declare-fun m!667147 () Bool)

(assert (=> b!710539 m!667147))

(declare-fun m!667149 () Bool)

(assert (=> b!710528 m!667149))

(declare-fun m!667151 () Bool)

(assert (=> b!710541 m!667151))

(declare-fun m!667153 () Bool)

(assert (=> b!710533 m!667153))

(declare-fun m!667155 () Bool)

(assert (=> b!710537 m!667155))

(declare-fun m!667157 () Bool)

(assert (=> b!710538 m!667157))

(declare-fun m!667159 () Bool)

(assert (=> b!710546 m!667159))

(declare-fun m!667161 () Bool)

(assert (=> b!710552 m!667161))

(declare-fun m!667163 () Bool)

(assert (=> b!710550 m!667163))

(declare-fun m!667165 () Bool)

(assert (=> b!710547 m!667165))

(declare-fun m!667167 () Bool)

(assert (=> b!710540 m!667167))

(declare-fun m!667169 () Bool)

(assert (=> b!710544 m!667169))

(declare-fun m!667171 () Bool)

(assert (=> b!710534 m!667171))

(declare-fun m!667173 () Bool)

(assert (=> b!710542 m!667173))

(assert (=> b!710548 m!667131))

(assert (=> b!710548 m!667131))

(declare-fun m!667175 () Bool)

(assert (=> b!710548 m!667175))

(declare-fun m!667177 () Bool)

(assert (=> b!710543 m!667177))

(declare-fun m!667179 () Bool)

(assert (=> b!710532 m!667179))

(declare-fun m!667181 () Bool)

(assert (=> b!710536 m!667181))

(declare-fun m!667183 () Bool)

(assert (=> b!710531 m!667183))

(check-sat (not b!710537) (not b!710540) (not b!710531) (not b!710551) (not b!710533) (not b!710550) (not b!710546) (not b!710549) (not b!710539) (not b!710538) (not b!710536) (not b!710548) (not b!710530) (not b!710547) (not b!710544) (not b!710534) (not b!710543) (not b!710528) (not b!710542) (not b!710552) (not b!710532) (not b!710545) (not b!710541) (not start!63076) (not b!710529))
(check-sat)
(get-model)

(declare-fun d!97299 () Bool)

(declare-fun res!474245 () Bool)

(declare-fun e!399810 () Bool)

(assert (=> d!97299 (=> res!474245 e!399810)))

(get-info :version)

(assert (=> d!97299 (= res!474245 ((_ is Nil!13423) acc!652))))

(assert (=> d!97299 (= (noDuplicate!1217 acc!652) e!399810)))

(declare-fun b!710707 () Bool)

(declare-fun e!399811 () Bool)

(assert (=> b!710707 (= e!399810 e!399811)))

(declare-fun res!474246 () Bool)

(assert (=> b!710707 (=> (not res!474246) (not e!399811))))

(assert (=> b!710707 (= res!474246 (not (contains!3948 (t!19720 acc!652) (h!14467 acc!652))))))

(declare-fun b!710708 () Bool)

(assert (=> b!710708 (= e!399811 (noDuplicate!1217 (t!19720 acc!652)))))

(assert (= (and d!97299 (not res!474245)) b!710707))

(assert (= (and b!710707 res!474246) b!710708))

(declare-fun m!667293 () Bool)

(assert (=> b!710707 m!667293))

(declare-fun m!667295 () Bool)

(assert (=> b!710708 m!667295))

(assert (=> b!710544 d!97299))

(declare-fun d!97301 () Bool)

(declare-fun lt!318143 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!352 (List!13426) (InoxSet (_ BitVec 64)))

(assert (=> d!97301 (= lt!318143 (select (content!352 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399816 () Bool)

(assert (=> d!97301 (= lt!318143 e!399816)))

(declare-fun res!474252 () Bool)

(assert (=> d!97301 (=> (not res!474252) (not e!399816))))

(assert (=> d!97301 (= res!474252 ((_ is Cons!13422) acc!652))))

(assert (=> d!97301 (= (contains!3948 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318143)))

(declare-fun b!710713 () Bool)

(declare-fun e!399817 () Bool)

(assert (=> b!710713 (= e!399816 e!399817)))

(declare-fun res!474251 () Bool)

(assert (=> b!710713 (=> res!474251 e!399817)))

(assert (=> b!710713 (= res!474251 (= (h!14467 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710714 () Bool)

(assert (=> b!710714 (= e!399817 (contains!3948 (t!19720 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97301 res!474252) b!710713))

(assert (= (and b!710713 (not res!474251)) b!710714))

(declare-fun m!667297 () Bool)

(assert (=> d!97301 m!667297))

(declare-fun m!667299 () Bool)

(assert (=> d!97301 m!667299))

(declare-fun m!667301 () Bool)

(assert (=> b!710714 m!667301))

(assert (=> b!710543 d!97301))

(declare-fun d!97303 () Bool)

(declare-fun lt!318144 () Bool)

(assert (=> d!97303 (= lt!318144 (select (content!352 lt!318127) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399818 () Bool)

(assert (=> d!97303 (= lt!318144 e!399818)))

(declare-fun res!474254 () Bool)

(assert (=> d!97303 (=> (not res!474254) (not e!399818))))

(assert (=> d!97303 (= res!474254 ((_ is Cons!13422) lt!318127))))

(assert (=> d!97303 (= (contains!3948 lt!318127 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318144)))

(declare-fun b!710715 () Bool)

(declare-fun e!399819 () Bool)

(assert (=> b!710715 (= e!399818 e!399819)))

(declare-fun res!474253 () Bool)

(assert (=> b!710715 (=> res!474253 e!399819)))

(assert (=> b!710715 (= res!474253 (= (h!14467 lt!318127) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710716 () Bool)

(assert (=> b!710716 (= e!399819 (contains!3948 (t!19720 lt!318127) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97303 res!474254) b!710715))

(assert (= (and b!710715 (not res!474253)) b!710716))

(declare-fun m!667303 () Bool)

(assert (=> d!97303 m!667303))

(declare-fun m!667305 () Bool)

(assert (=> d!97303 m!667305))

(declare-fun m!667307 () Bool)

(assert (=> b!710716 m!667307))

(assert (=> b!710545 d!97303))

(declare-fun d!97305 () Bool)

(declare-fun lt!318145 () Bool)

(assert (=> d!97305 (= lt!318145 (select (content!352 lt!318127) k0!2824))))

(declare-fun e!399820 () Bool)

(assert (=> d!97305 (= lt!318145 e!399820)))

(declare-fun res!474256 () Bool)

(assert (=> d!97305 (=> (not res!474256) (not e!399820))))

(assert (=> d!97305 (= res!474256 ((_ is Cons!13422) lt!318127))))

(assert (=> d!97305 (= (contains!3948 lt!318127 k0!2824) lt!318145)))

(declare-fun b!710717 () Bool)

(declare-fun e!399821 () Bool)

(assert (=> b!710717 (= e!399820 e!399821)))

(declare-fun res!474255 () Bool)

(assert (=> b!710717 (=> res!474255 e!399821)))

(assert (=> b!710717 (= res!474255 (= (h!14467 lt!318127) k0!2824))))

(declare-fun b!710718 () Bool)

(assert (=> b!710718 (= e!399821 (contains!3948 (t!19720 lt!318127) k0!2824))))

(assert (= (and d!97305 res!474256) b!710717))

(assert (= (and b!710717 (not res!474255)) b!710718))

(assert (=> d!97305 m!667303))

(declare-fun m!667309 () Bool)

(assert (=> d!97305 m!667309))

(declare-fun m!667311 () Bool)

(assert (=> b!710718 m!667311))

(assert (=> b!710541 d!97305))

(declare-fun d!97307 () Bool)

(declare-fun res!474257 () Bool)

(declare-fun e!399822 () Bool)

(assert (=> d!97307 (=> res!474257 e!399822)))

(assert (=> d!97307 (= res!474257 ((_ is Nil!13423) lt!318127))))

(assert (=> d!97307 (= (noDuplicate!1217 lt!318127) e!399822)))

(declare-fun b!710719 () Bool)

(declare-fun e!399823 () Bool)

(assert (=> b!710719 (= e!399822 e!399823)))

(declare-fun res!474258 () Bool)

(assert (=> b!710719 (=> (not res!474258) (not e!399823))))

(assert (=> b!710719 (= res!474258 (not (contains!3948 (t!19720 lt!318127) (h!14467 lt!318127))))))

(declare-fun b!710720 () Bool)

(assert (=> b!710720 (= e!399823 (noDuplicate!1217 (t!19720 lt!318127)))))

(assert (= (and d!97307 (not res!474257)) b!710719))

(assert (= (and b!710719 res!474258) b!710720))

(declare-fun m!667313 () Bool)

(assert (=> b!710719 m!667313))

(declare-fun m!667315 () Bool)

(assert (=> b!710720 m!667315))

(assert (=> b!710542 d!97307))

(declare-fun d!97309 () Bool)

(declare-fun res!474259 () Bool)

(declare-fun e!399824 () Bool)

(assert (=> d!97309 (=> res!474259 e!399824)))

(assert (=> d!97309 (= res!474259 ((_ is Nil!13423) lt!318128))))

(assert (=> d!97309 (= (noDuplicate!1217 lt!318128) e!399824)))

(declare-fun b!710721 () Bool)

(declare-fun e!399825 () Bool)

(assert (=> b!710721 (= e!399824 e!399825)))

(declare-fun res!474260 () Bool)

(assert (=> b!710721 (=> (not res!474260) (not e!399825))))

(assert (=> b!710721 (= res!474260 (not (contains!3948 (t!19720 lt!318128) (h!14467 lt!318128))))))

(declare-fun b!710722 () Bool)

(assert (=> b!710722 (= e!399825 (noDuplicate!1217 (t!19720 lt!318128)))))

(assert (= (and d!97309 (not res!474259)) b!710721))

(assert (= (and b!710721 res!474260) b!710722))

(declare-fun m!667317 () Bool)

(assert (=> b!710721 m!667317))

(declare-fun m!667319 () Bool)

(assert (=> b!710722 m!667319))

(assert (=> b!710549 d!97309))

(declare-fun d!97311 () Bool)

(declare-fun lt!318146 () Bool)

(assert (=> d!97311 (= lt!318146 (select (content!352 lt!318128) k0!2824))))

(declare-fun e!399826 () Bool)

(assert (=> d!97311 (= lt!318146 e!399826)))

(declare-fun res!474262 () Bool)

(assert (=> d!97311 (=> (not res!474262) (not e!399826))))

(assert (=> d!97311 (= res!474262 ((_ is Cons!13422) lt!318128))))

(assert (=> d!97311 (= (contains!3948 lt!318128 k0!2824) lt!318146)))

(declare-fun b!710723 () Bool)

(declare-fun e!399827 () Bool)

(assert (=> b!710723 (= e!399826 e!399827)))

(declare-fun res!474261 () Bool)

(assert (=> b!710723 (=> res!474261 e!399827)))

(assert (=> b!710723 (= res!474261 (= (h!14467 lt!318128) k0!2824))))

(declare-fun b!710724 () Bool)

(assert (=> b!710724 (= e!399827 (contains!3948 (t!19720 lt!318128) k0!2824))))

(assert (= (and d!97311 res!474262) b!710723))

(assert (= (and b!710723 (not res!474261)) b!710724))

(declare-fun m!667321 () Bool)

(assert (=> d!97311 m!667321))

(declare-fun m!667323 () Bool)

(assert (=> d!97311 m!667323))

(declare-fun m!667325 () Bool)

(assert (=> b!710724 m!667325))

(assert (=> b!710528 d!97311))

(declare-fun d!97315 () Bool)

(assert (=> d!97315 (= ($colon$colon!520 newAcc!49 (select (arr!19346 a!3591) from!2969)) (Cons!13422 (select (arr!19346 a!3591) from!2969) newAcc!49))))

(assert (=> b!710529 d!97315))

(declare-fun d!97317 () Bool)

(assert (=> d!97317 (= ($colon$colon!520 acc!652 (select (arr!19346 a!3591) from!2969)) (Cons!13422 (select (arr!19346 a!3591) from!2969) acc!652))))

(assert (=> b!710529 d!97317))

(declare-fun d!97321 () Bool)

(declare-fun res!474263 () Bool)

(declare-fun e!399828 () Bool)

(assert (=> d!97321 (=> res!474263 e!399828)))

(assert (=> d!97321 (= res!474263 ((_ is Nil!13423) newAcc!49))))

(assert (=> d!97321 (= (noDuplicate!1217 newAcc!49) e!399828)))

(declare-fun b!710725 () Bool)

(declare-fun e!399829 () Bool)

(assert (=> b!710725 (= e!399828 e!399829)))

(declare-fun res!474264 () Bool)

(assert (=> b!710725 (=> (not res!474264) (not e!399829))))

(assert (=> b!710725 (= res!474264 (not (contains!3948 (t!19720 newAcc!49) (h!14467 newAcc!49))))))

(declare-fun b!710726 () Bool)

(assert (=> b!710726 (= e!399829 (noDuplicate!1217 (t!19720 newAcc!49)))))

(assert (= (and d!97321 (not res!474263)) b!710725))

(assert (= (and b!710725 res!474264) b!710726))

(declare-fun m!667327 () Bool)

(assert (=> b!710725 m!667327))

(declare-fun m!667329 () Bool)

(assert (=> b!710726 m!667329))

(assert (=> b!710550 d!97321))

(declare-fun b!710758 () Bool)

(declare-fun e!399856 () Bool)

(declare-fun e!399857 () Bool)

(assert (=> b!710758 (= e!399856 e!399857)))

(declare-fun c!78603 () Bool)

(assert (=> b!710758 (= c!78603 (validKeyInArray!0 (select (arr!19346 a!3591) from!2969)))))

(declare-fun b!710759 () Bool)

(declare-fun call!34471 () Bool)

(assert (=> b!710759 (= e!399857 call!34471)))

(declare-fun b!710760 () Bool)

(declare-fun e!399859 () Bool)

(assert (=> b!710760 (= e!399859 e!399856)))

(declare-fun res!474288 () Bool)

(assert (=> b!710760 (=> (not res!474288) (not e!399856))))

(declare-fun e!399858 () Bool)

(assert (=> b!710760 (= res!474288 (not e!399858))))

(declare-fun res!474286 () Bool)

(assert (=> b!710760 (=> (not res!474286) (not e!399858))))

(assert (=> b!710760 (= res!474286 (validKeyInArray!0 (select (arr!19346 a!3591) from!2969)))))

(declare-fun b!710761 () Bool)

(assert (=> b!710761 (= e!399858 (contains!3948 acc!652 (select (arr!19346 a!3591) from!2969)))))

(declare-fun d!97323 () Bool)

(declare-fun res!474287 () Bool)

(assert (=> d!97323 (=> res!474287 e!399859)))

(assert (=> d!97323 (= res!474287 (bvsge from!2969 (size!19746 a!3591)))))

(assert (=> d!97323 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!399859)))

(declare-fun bm!34468 () Bool)

(assert (=> bm!34468 (= call!34471 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78603 (Cons!13422 (select (arr!19346 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!710762 () Bool)

(assert (=> b!710762 (= e!399857 call!34471)))

(assert (= (and d!97323 (not res!474287)) b!710760))

(assert (= (and b!710760 res!474286) b!710761))

(assert (= (and b!710760 res!474288) b!710758))

(assert (= (and b!710758 c!78603) b!710762))

(assert (= (and b!710758 (not c!78603)) b!710759))

(assert (= (or b!710762 b!710759) bm!34468))

(assert (=> b!710758 m!667131))

(assert (=> b!710758 m!667131))

(assert (=> b!710758 m!667175))

(assert (=> b!710760 m!667131))

(assert (=> b!710760 m!667131))

(assert (=> b!710760 m!667175))

(assert (=> b!710761 m!667131))

(assert (=> b!710761 m!667131))

(declare-fun m!667345 () Bool)

(assert (=> b!710761 m!667345))

(assert (=> bm!34468 m!667131))

(declare-fun m!667347 () Bool)

(assert (=> bm!34468 m!667347))

(assert (=> b!710546 d!97323))

(declare-fun d!97333 () Bool)

(assert (=> d!97333 (= (validKeyInArray!0 (select (arr!19346 a!3591) from!2969)) (and (not (= (select (arr!19346 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19346 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!710548 d!97333))

(declare-fun d!97335 () Bool)

(declare-fun res!474305 () Bool)

(declare-fun e!399876 () Bool)

(assert (=> d!97335 (=> res!474305 e!399876)))

(assert (=> d!97335 (= res!474305 (= (select (arr!19346 a!3591) from!2969) k0!2824))))

(assert (=> d!97335 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!399876)))

(declare-fun b!710779 () Bool)

(declare-fun e!399877 () Bool)

(assert (=> b!710779 (= e!399876 e!399877)))

(declare-fun res!474306 () Bool)

(assert (=> b!710779 (=> (not res!474306) (not e!399877))))

(assert (=> b!710779 (= res!474306 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19746 a!3591)))))

(declare-fun b!710780 () Bool)

(assert (=> b!710780 (= e!399877 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97335 (not res!474305)) b!710779))

(assert (= (and b!710779 res!474306) b!710780))

(assert (=> d!97335 m!667131))

(declare-fun m!667359 () Bool)

(assert (=> b!710780 m!667359))

(assert (=> b!710547 d!97335))

(declare-fun d!97343 () Bool)

(declare-fun lt!318153 () Bool)

(assert (=> d!97343 (= lt!318153 (select (content!352 lt!318127) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399880 () Bool)

(assert (=> d!97343 (= lt!318153 e!399880)))

(declare-fun res!474310 () Bool)

(assert (=> d!97343 (=> (not res!474310) (not e!399880))))

(assert (=> d!97343 (= res!474310 ((_ is Cons!13422) lt!318127))))

(assert (=> d!97343 (= (contains!3948 lt!318127 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318153)))

(declare-fun b!710783 () Bool)

(declare-fun e!399881 () Bool)

(assert (=> b!710783 (= e!399880 e!399881)))

(declare-fun res!474309 () Bool)

(assert (=> b!710783 (=> res!474309 e!399881)))

(assert (=> b!710783 (= res!474309 (= (h!14467 lt!318127) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710784 () Bool)

(assert (=> b!710784 (= e!399881 (contains!3948 (t!19720 lt!318127) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97343 res!474310) b!710783))

(assert (= (and b!710783 (not res!474309)) b!710784))

(assert (=> d!97343 m!667303))

(declare-fun m!667361 () Bool)

(assert (=> d!97343 m!667361))

(declare-fun m!667363 () Bool)

(assert (=> b!710784 m!667363))

(assert (=> b!710533 d!97343))

(declare-fun d!97345 () Bool)

(declare-fun lt!318154 () Bool)

(assert (=> d!97345 (= lt!318154 (select (content!352 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399888 () Bool)

(assert (=> d!97345 (= lt!318154 e!399888)))

(declare-fun res!474318 () Bool)

(assert (=> d!97345 (=> (not res!474318) (not e!399888))))

(assert (=> d!97345 (= res!474318 ((_ is Cons!13422) acc!652))))

(assert (=> d!97345 (= (contains!3948 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318154)))

(declare-fun b!710791 () Bool)

(declare-fun e!399889 () Bool)

(assert (=> b!710791 (= e!399888 e!399889)))

(declare-fun res!474317 () Bool)

(assert (=> b!710791 (=> res!474317 e!399889)))

(assert (=> b!710791 (= res!474317 (= (h!14467 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710792 () Bool)

(assert (=> b!710792 (= e!399889 (contains!3948 (t!19720 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97345 res!474318) b!710791))

(assert (= (and b!710791 (not res!474317)) b!710792))

(assert (=> d!97345 m!667297))

(declare-fun m!667365 () Bool)

(assert (=> d!97345 m!667365))

(declare-fun m!667367 () Bool)

(assert (=> b!710792 m!667367))

(assert (=> b!710534 d!97345))

(declare-fun d!97347 () Bool)

(assert (=> d!97347 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!710552 d!97347))

(declare-fun b!710793 () Bool)

(declare-fun e!399890 () Bool)

(declare-fun e!399891 () Bool)

(assert (=> b!710793 (= e!399890 e!399891)))

(declare-fun c!78604 () Bool)

(assert (=> b!710793 (= c!78604 (validKeyInArray!0 (select (arr!19346 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!710794 () Bool)

(declare-fun call!34472 () Bool)

(assert (=> b!710794 (= e!399891 call!34472)))

(declare-fun b!710795 () Bool)

(declare-fun e!399893 () Bool)

(assert (=> b!710795 (= e!399893 e!399890)))

(declare-fun res!474321 () Bool)

(assert (=> b!710795 (=> (not res!474321) (not e!399890))))

(declare-fun e!399892 () Bool)

(assert (=> b!710795 (= res!474321 (not e!399892))))

(declare-fun res!474319 () Bool)

(assert (=> b!710795 (=> (not res!474319) (not e!399892))))

(assert (=> b!710795 (= res!474319 (validKeyInArray!0 (select (arr!19346 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!710796 () Bool)

(assert (=> b!710796 (= e!399892 (contains!3948 lt!318127 (select (arr!19346 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun d!97349 () Bool)

(declare-fun res!474320 () Bool)

(assert (=> d!97349 (=> res!474320 e!399893)))

(assert (=> d!97349 (= res!474320 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19746 a!3591)))))

(assert (=> d!97349 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318127) e!399893)))

(declare-fun bm!34469 () Bool)

(assert (=> bm!34469 (= call!34472 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78604 (Cons!13422 (select (arr!19346 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) lt!318127) lt!318127)))))

(declare-fun b!710797 () Bool)

(assert (=> b!710797 (= e!399891 call!34472)))

(assert (= (and d!97349 (not res!474320)) b!710795))

(assert (= (and b!710795 res!474319) b!710796))

(assert (= (and b!710795 res!474321) b!710793))

(assert (= (and b!710793 c!78604) b!710797))

(assert (= (and b!710793 (not c!78604)) b!710794))

(assert (= (or b!710797 b!710794) bm!34469))

(declare-fun m!667369 () Bool)

(assert (=> b!710793 m!667369))

(assert (=> b!710793 m!667369))

(declare-fun m!667371 () Bool)

(assert (=> b!710793 m!667371))

(assert (=> b!710795 m!667369))

(assert (=> b!710795 m!667369))

(assert (=> b!710795 m!667371))

(assert (=> b!710796 m!667369))

(assert (=> b!710796 m!667369))

(declare-fun m!667373 () Bool)

(assert (=> b!710796 m!667373))

(assert (=> bm!34469 m!667369))

(declare-fun m!667375 () Bool)

(assert (=> bm!34469 m!667375))

(assert (=> b!710551 d!97349))

(declare-fun bm!34474 () Bool)

(declare-fun call!34477 () List!13426)

(assert (=> bm!34474 (= call!34477 (-!375 (t!19720 newAcc!49) k0!2824))))

(declare-fun d!97351 () Bool)

(declare-fun e!399935 () Bool)

(assert (=> d!97351 e!399935))

(declare-fun res!474356 () Bool)

(assert (=> d!97351 (=> (not res!474356) (not e!399935))))

(declare-fun lt!318159 () List!13426)

(declare-fun size!19749 (List!13426) Int)

(assert (=> d!97351 (= res!474356 (<= (size!19749 lt!318159) (size!19749 newAcc!49)))))

(declare-fun e!399937 () List!13426)

(assert (=> d!97351 (= lt!318159 e!399937)))

(declare-fun c!78611 () Bool)

(assert (=> d!97351 (= c!78611 ((_ is Cons!13422) newAcc!49))))

(assert (=> d!97351 (= (-!375 newAcc!49 k0!2824) lt!318159)))

(declare-fun b!710844 () Bool)

(assert (=> b!710844 (= e!399937 Nil!13423)))

(declare-fun b!710845 () Bool)

(assert (=> b!710845 (= e!399935 (= (content!352 lt!318159) ((_ map and) (content!352 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun b!710846 () Bool)

(declare-fun e!399936 () List!13426)

(assert (=> b!710846 (= e!399937 e!399936)))

(declare-fun c!78612 () Bool)

(assert (=> b!710846 (= c!78612 (= k0!2824 (h!14467 newAcc!49)))))

(declare-fun b!710847 () Bool)

(assert (=> b!710847 (= e!399936 (Cons!13422 (h!14467 newAcc!49) call!34477))))

(declare-fun b!710848 () Bool)

(assert (=> b!710848 (= e!399936 call!34477)))

(assert (= (and d!97351 c!78611) b!710846))

(assert (= (and d!97351 (not c!78611)) b!710844))

(assert (= (and b!710846 c!78612) b!710848))

(assert (= (and b!710846 (not c!78612)) b!710847))

(assert (= (or b!710848 b!710847) bm!34474))

(assert (= (and d!97351 res!474356) b!710845))

(declare-fun m!667397 () Bool)

(assert (=> bm!34474 m!667397))

(declare-fun m!667399 () Bool)

(assert (=> d!97351 m!667399))

(declare-fun m!667401 () Bool)

(assert (=> d!97351 m!667401))

(declare-fun m!667403 () Bool)

(assert (=> b!710845 m!667403))

(declare-fun m!667405 () Bool)

(assert (=> b!710845 m!667405))

(declare-fun m!667407 () Bool)

(assert (=> b!710845 m!667407))

(assert (=> b!710530 d!97351))

(declare-fun d!97363 () Bool)

(declare-fun res!474364 () Bool)

(declare-fun e!399946 () Bool)

(assert (=> d!97363 (=> res!474364 e!399946)))

(assert (=> d!97363 (= res!474364 (= (select (arr!19346 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k0!2824))))

(assert (=> d!97363 (= (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!399946)))

(declare-fun b!710856 () Bool)

(declare-fun e!399947 () Bool)

(assert (=> b!710856 (= e!399946 e!399947)))

(declare-fun res!474365 () Bool)

(assert (=> b!710856 (=> (not res!474365) (not e!399947))))

(assert (=> b!710856 (= res!474365 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19746 a!3591)))))

(declare-fun b!710857 () Bool)

(assert (=> b!710857 (= e!399947 (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97363 (not res!474364)) b!710856))

(assert (= (and b!710856 res!474365) b!710857))

(assert (=> d!97363 m!667369))

(declare-fun m!667411 () Bool)

(assert (=> b!710857 m!667411))

(assert (=> b!710532 d!97363))

(declare-fun d!97365 () Bool)

(declare-fun lt!318160 () Bool)

(assert (=> d!97365 (= lt!318160 (select (content!352 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399948 () Bool)

(assert (=> d!97365 (= lt!318160 e!399948)))

(declare-fun res!474367 () Bool)

(assert (=> d!97365 (=> (not res!474367) (not e!399948))))

(assert (=> d!97365 (= res!474367 ((_ is Cons!13422) newAcc!49))))

(assert (=> d!97365 (= (contains!3948 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318160)))

(declare-fun b!710860 () Bool)

(declare-fun e!399949 () Bool)

(assert (=> b!710860 (= e!399948 e!399949)))

(declare-fun res!474366 () Bool)

(assert (=> b!710860 (=> res!474366 e!399949)))

(assert (=> b!710860 (= res!474366 (= (h!14467 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710861 () Bool)

(assert (=> b!710861 (= e!399949 (contains!3948 (t!19720 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97365 res!474367) b!710860))

(assert (= (and b!710860 (not res!474366)) b!710861))

(assert (=> d!97365 m!667405))

(declare-fun m!667415 () Bool)

(assert (=> d!97365 m!667415))

(declare-fun m!667417 () Bool)

(assert (=> b!710861 m!667417))

(assert (=> b!710531 d!97365))

(declare-fun d!97369 () Bool)

(declare-fun lt!318162 () Bool)

(assert (=> d!97369 (= lt!318162 (select (content!352 newAcc!49) k0!2824))))

(declare-fun e!399952 () Bool)

(assert (=> d!97369 (= lt!318162 e!399952)))

(declare-fun res!474371 () Bool)

(assert (=> d!97369 (=> (not res!474371) (not e!399952))))

(assert (=> d!97369 (= res!474371 ((_ is Cons!13422) newAcc!49))))

(assert (=> d!97369 (= (contains!3948 newAcc!49 k0!2824) lt!318162)))

(declare-fun b!710864 () Bool)

(declare-fun e!399953 () Bool)

(assert (=> b!710864 (= e!399952 e!399953)))

(declare-fun res!474370 () Bool)

(assert (=> b!710864 (=> res!474370 e!399953)))

(assert (=> b!710864 (= res!474370 (= (h!14467 newAcc!49) k0!2824))))

(declare-fun b!710865 () Bool)

(assert (=> b!710865 (= e!399953 (contains!3948 (t!19720 newAcc!49) k0!2824))))

(assert (= (and d!97369 res!474371) b!710864))

(assert (= (and b!710864 (not res!474370)) b!710865))

(assert (=> d!97369 m!667405))

(declare-fun m!667425 () Bool)

(assert (=> d!97369 m!667425))

(declare-fun m!667427 () Bool)

(assert (=> b!710865 m!667427))

(assert (=> b!710538 d!97369))

(declare-fun b!710902 () Bool)

(declare-fun e!399992 () Bool)

(declare-fun e!399993 () Bool)

(assert (=> b!710902 (= e!399992 e!399993)))

(declare-fun res!474408 () Bool)

(assert (=> b!710902 (=> (not res!474408) (not e!399993))))

(assert (=> b!710902 (= res!474408 ((_ is Cons!13422) lt!318128))))

(declare-fun b!710903 () Bool)

(declare-fun e!399990 () Bool)

(assert (=> b!710903 (= e!399993 e!399990)))

(declare-fun res!474410 () Bool)

(assert (=> b!710903 (=> res!474410 e!399990)))

(declare-fun e!399991 () Bool)

(assert (=> b!710903 (= res!474410 e!399991)))

(declare-fun res!474411 () Bool)

(assert (=> b!710903 (=> (not res!474411) (not e!399991))))

(assert (=> b!710903 (= res!474411 (= (h!14467 lt!318127) (h!14467 lt!318128)))))

(declare-fun b!710905 () Bool)

(assert (=> b!710905 (= e!399990 (subseq!410 lt!318127 (t!19720 lt!318128)))))

(declare-fun d!97373 () Bool)

(declare-fun res!474409 () Bool)

(assert (=> d!97373 (=> res!474409 e!399992)))

(assert (=> d!97373 (= res!474409 ((_ is Nil!13423) lt!318127))))

(assert (=> d!97373 (= (subseq!410 lt!318127 lt!318128) e!399992)))

(declare-fun b!710904 () Bool)

(assert (=> b!710904 (= e!399991 (subseq!410 (t!19720 lt!318127) (t!19720 lt!318128)))))

(assert (= (and d!97373 (not res!474409)) b!710902))

(assert (= (and b!710902 res!474408) b!710903))

(assert (= (and b!710903 res!474411) b!710904))

(assert (= (and b!710903 (not res!474410)) b!710905))

(declare-fun m!667473 () Bool)

(assert (=> b!710905 m!667473))

(declare-fun m!667477 () Bool)

(assert (=> b!710904 m!667477))

(assert (=> b!710540 d!97373))

(declare-fun b!710908 () Bool)

(declare-fun e!399998 () Bool)

(declare-fun e!399999 () Bool)

(assert (=> b!710908 (= e!399998 e!399999)))

(declare-fun res!474414 () Bool)

(assert (=> b!710908 (=> (not res!474414) (not e!399999))))

(assert (=> b!710908 (= res!474414 ((_ is Cons!13422) newAcc!49))))

(declare-fun b!710909 () Bool)

(declare-fun e!399996 () Bool)

(assert (=> b!710909 (= e!399999 e!399996)))

(declare-fun res!474416 () Bool)

(assert (=> b!710909 (=> res!474416 e!399996)))

(declare-fun e!399997 () Bool)

(assert (=> b!710909 (= res!474416 e!399997)))

(declare-fun res!474417 () Bool)

(assert (=> b!710909 (=> (not res!474417) (not e!399997))))

(assert (=> b!710909 (= res!474417 (= (h!14467 acc!652) (h!14467 newAcc!49)))))

(declare-fun b!710911 () Bool)

(assert (=> b!710911 (= e!399996 (subseq!410 acc!652 (t!19720 newAcc!49)))))

(declare-fun d!97395 () Bool)

(declare-fun res!474415 () Bool)

(assert (=> d!97395 (=> res!474415 e!399998)))

(assert (=> d!97395 (= res!474415 ((_ is Nil!13423) acc!652))))

(assert (=> d!97395 (= (subseq!410 acc!652 newAcc!49) e!399998)))

(declare-fun b!710910 () Bool)

(assert (=> b!710910 (= e!399997 (subseq!410 (t!19720 acc!652) (t!19720 newAcc!49)))))

(assert (= (and d!97395 (not res!474415)) b!710908))

(assert (= (and b!710908 res!474414) b!710909))

(assert (= (and b!710909 res!474417) b!710910))

(assert (= (and b!710909 (not res!474416)) b!710911))

(declare-fun m!667485 () Bool)

(assert (=> b!710911 m!667485))

(declare-fun m!667487 () Bool)

(assert (=> b!710910 m!667487))

(assert (=> b!710539 d!97395))

(declare-fun d!97401 () Bool)

(declare-fun lt!318168 () Bool)

(assert (=> d!97401 (= lt!318168 (select (content!352 acc!652) k0!2824))))

(declare-fun e!400002 () Bool)

(assert (=> d!97401 (= lt!318168 e!400002)))

(declare-fun res!474421 () Bool)

(assert (=> d!97401 (=> (not res!474421) (not e!400002))))

(assert (=> d!97401 (= res!474421 ((_ is Cons!13422) acc!652))))

(assert (=> d!97401 (= (contains!3948 acc!652 k0!2824) lt!318168)))

(declare-fun b!710914 () Bool)

(declare-fun e!400003 () Bool)

(assert (=> b!710914 (= e!400002 e!400003)))

(declare-fun res!474420 () Bool)

(assert (=> b!710914 (=> res!474420 e!400003)))

(assert (=> b!710914 (= res!474420 (= (h!14467 acc!652) k0!2824))))

(declare-fun b!710915 () Bool)

(assert (=> b!710915 (= e!400003 (contains!3948 (t!19720 acc!652) k0!2824))))

(assert (= (and d!97401 res!474421) b!710914))

(assert (= (and b!710914 (not res!474420)) b!710915))

(assert (=> d!97401 m!667297))

(declare-fun m!667489 () Bool)

(assert (=> d!97401 m!667489))

(declare-fun m!667491 () Bool)

(assert (=> b!710915 m!667491))

(assert (=> b!710536 d!97401))

(declare-fun d!97403 () Bool)

(declare-fun lt!318171 () Bool)

(assert (=> d!97403 (= lt!318171 (select (content!352 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400009 () Bool)

(assert (=> d!97403 (= lt!318171 e!400009)))

(declare-fun res!474423 () Bool)

(assert (=> d!97403 (=> (not res!474423) (not e!400009))))

(assert (=> d!97403 (= res!474423 ((_ is Cons!13422) newAcc!49))))

(assert (=> d!97403 (= (contains!3948 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318171)))

(declare-fun b!710924 () Bool)

(declare-fun e!400010 () Bool)

(assert (=> b!710924 (= e!400009 e!400010)))

(declare-fun res!474422 () Bool)

(assert (=> b!710924 (=> res!474422 e!400010)))

(assert (=> b!710924 (= res!474422 (= (h!14467 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710925 () Bool)

(assert (=> b!710925 (= e!400010 (contains!3948 (t!19720 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97403 res!474423) b!710924))

(assert (= (and b!710924 (not res!474422)) b!710925))

(assert (=> d!97403 m!667405))

(declare-fun m!667493 () Bool)

(assert (=> d!97403 m!667493))

(declare-fun m!667495 () Bool)

(assert (=> b!710925 m!667495))

(assert (=> b!710537 d!97403))

(declare-fun d!97405 () Bool)

(assert (=> d!97405 (= (array_inv!15229 a!3591) (bvsge (size!19746 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63076 d!97405))

(check-sat (not d!97303) (not b!710724) (not b!710760) (not b!710796) (not b!710857) (not b!710707) (not b!710708) (not bm!34468) (not d!97345) (not b!710865) (not b!710784) (not b!710910) (not b!710720) (not d!97305) (not b!710758) (not b!710714) (not b!710845) (not b!710761) (not b!710792) (not b!710725) (not d!97403) (not bm!34474) (not b!710780) (not d!97301) (not b!710795) (not bm!34469) (not b!710911) (not d!97343) (not d!97351) (not b!710861) (not b!710722) (not b!710721) (not b!710904) (not b!710719) (not b!710726) (not d!97311) (not b!710905) (not d!97365) (not b!710716) (not b!710925) (not b!710915) (not d!97401) (not b!710718) (not b!710793) (not d!97369))
(check-sat)
