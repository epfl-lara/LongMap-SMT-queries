; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59732 () Bool)

(assert start!59732)

(declare-fun b!659899 () Bool)

(declare-fun e!379175 () Bool)

(declare-datatypes ((List!12632 0))(
  ( (Nil!12629) (Cons!12628 (h!13673 (_ BitVec 64)) (t!18860 List!12632)) )
))
(declare-fun acc!681 () List!12632)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3209 (List!12632 (_ BitVec 64)) Bool)

(assert (=> b!659899 (= e!379175 (not (contains!3209 acc!681 k!2843)))))

(declare-fun b!659900 () Bool)

(declare-fun res!427968 () Bool)

(declare-fun e!379179 () Bool)

(assert (=> b!659900 (=> (not res!427968) (not e!379179))))

(assert (=> b!659900 (= res!427968 (not (contains!3209 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659901 () Bool)

(declare-fun e!379177 () Bool)

(assert (=> b!659901 (= e!379177 (contains!3209 Nil!12629 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!659902 () Bool)

(declare-fun e!379176 () Bool)

(assert (=> b!659902 (= e!379176 e!379175)))

(declare-fun res!427964 () Bool)

(assert (=> b!659902 (=> (not res!427964) (not e!379175))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!659902 (= res!427964 (bvsle from!3004 i!1382))))

(declare-fun b!659903 () Bool)

(declare-fun res!427969 () Bool)

(assert (=> b!659903 (=> (not res!427969) (not e!379179))))

(declare-fun noDuplicate!456 (List!12632) Bool)

(assert (=> b!659903 (= res!427969 (noDuplicate!456 acc!681))))

(declare-fun b!659904 () Bool)

(declare-fun res!427967 () Bool)

(assert (=> b!659904 (=> (not res!427967) (not e!379179))))

(assert (=> b!659904 (= res!427967 (not (contains!3209 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659905 () Bool)

(declare-fun res!427972 () Bool)

(assert (=> b!659905 (=> (not res!427972) (not e!379179))))

(assert (=> b!659905 (= res!427972 e!379176)))

(declare-fun res!427963 () Bool)

(assert (=> b!659905 (=> res!427963 e!379176)))

(declare-fun e!379174 () Bool)

(assert (=> b!659905 (= res!427963 e!379174)))

(declare-fun res!427965 () Bool)

(assert (=> b!659905 (=> (not res!427965) (not e!379174))))

(assert (=> b!659905 (= res!427965 (bvsgt from!3004 i!1382))))

(declare-fun b!659906 () Bool)

(declare-fun res!427970 () Bool)

(assert (=> b!659906 (=> (not res!427970) (not e!379179))))

(assert (=> b!659906 (= res!427970 (noDuplicate!456 Nil!12629))))

(declare-fun b!659907 () Bool)

(assert (=> b!659907 (= e!379174 (contains!3209 acc!681 k!2843))))

(declare-fun res!427971 () Bool)

(assert (=> start!59732 (=> (not res!427971) (not e!379179))))

(declare-datatypes ((array!38794 0))(
  ( (array!38795 (arr!18591 (Array (_ BitVec 32) (_ BitVec 64))) (size!18955 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38794)

(assert (=> start!59732 (= res!427971 (and (bvslt (size!18955 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18955 a!3626))))))

(assert (=> start!59732 e!379179))

(assert (=> start!59732 true))

(declare-fun array_inv!14387 (array!38794) Bool)

(assert (=> start!59732 (array_inv!14387 a!3626)))

(declare-fun b!659908 () Bool)

(assert (=> b!659908 (= e!379179 e!379177)))

(declare-fun res!427966 () Bool)

(assert (=> b!659908 (=> res!427966 e!379177)))

(assert (=> b!659908 (= res!427966 (contains!3209 Nil!12629 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!659909 () Bool)

(declare-fun res!427973 () Bool)

(assert (=> b!659909 (=> (not res!427973) (not e!379179))))

(assert (=> b!659909 (= res!427973 (bvsle #b00000000000000000000000000000000 (size!18955 a!3626)))))

(assert (= (and start!59732 res!427971) b!659903))

(assert (= (and b!659903 res!427969) b!659900))

(assert (= (and b!659900 res!427968) b!659904))

(assert (= (and b!659904 res!427967) b!659905))

(assert (= (and b!659905 res!427965) b!659907))

(assert (= (and b!659905 (not res!427963)) b!659902))

(assert (= (and b!659902 res!427964) b!659899))

(assert (= (and b!659905 res!427972) b!659909))

(assert (= (and b!659909 res!427973) b!659906))

(assert (= (and b!659906 res!427970) b!659908))

(assert (= (and b!659908 (not res!427966)) b!659901))

(declare-fun m!632789 () Bool)

(assert (=> b!659900 m!632789))

(declare-fun m!632791 () Bool)

(assert (=> b!659908 m!632791))

(declare-fun m!632793 () Bool)

(assert (=> b!659906 m!632793))

(declare-fun m!632795 () Bool)

(assert (=> b!659907 m!632795))

(assert (=> b!659899 m!632795))

(declare-fun m!632797 () Bool)

(assert (=> b!659901 m!632797))

(declare-fun m!632799 () Bool)

(assert (=> b!659904 m!632799))

(declare-fun m!632801 () Bool)

(assert (=> b!659903 m!632801))

(declare-fun m!632803 () Bool)

(assert (=> start!59732 m!632803))

(push 1)

(assert (not start!59732))

(assert (not b!659903))

(assert (not b!659908))

(assert (not b!659900))

(assert (not b!659904))

(assert (not b!659901))

(assert (not b!659907))

(assert (not b!659906))

(assert (not b!659899))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93179 () Bool)

(declare-fun lt!308735 () Bool)

(declare-fun content!259 (List!12632) (Set (_ BitVec 64)))

(assert (=> d!93179 (= lt!308735 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!259 acc!681)))))

(declare-fun e!379242 () Bool)

(assert (=> d!93179 (= lt!308735 e!379242)))

(declare-fun res!428066 () Bool)

(assert (=> d!93179 (=> (not res!428066) (not e!379242))))

(assert (=> d!93179 (= res!428066 (is-Cons!12628 acc!681))))

(assert (=> d!93179 (= (contains!3209 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!308735)))

(declare-fun b!660002 () Bool)

(declare-fun e!379243 () Bool)

(assert (=> b!660002 (= e!379242 e!379243)))

(declare-fun res!428067 () Bool)

(assert (=> b!660002 (=> res!428067 e!379243)))

(assert (=> b!660002 (= res!428067 (= (h!13673 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!660003 () Bool)

(assert (=> b!660003 (= e!379243 (contains!3209 (t!18860 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93179 res!428066) b!660002))

(assert (= (and b!660002 (not res!428067)) b!660003))

(declare-fun m!632869 () Bool)

(assert (=> d!93179 m!632869))

(declare-fun m!632871 () Bool)

(assert (=> d!93179 m!632871))

(declare-fun m!632873 () Bool)

(assert (=> b!660003 m!632873))

(assert (=> b!659900 d!93179))

(declare-fun d!93183 () Bool)

(declare-fun res!428078 () Bool)

(declare-fun e!379254 () Bool)

(assert (=> d!93183 (=> res!428078 e!379254)))

(assert (=> d!93183 (= res!428078 (is-Nil!12629 Nil!12629))))

(assert (=> d!93183 (= (noDuplicate!456 Nil!12629) e!379254)))

(declare-fun b!660014 () Bool)

(declare-fun e!379255 () Bool)

(assert (=> b!660014 (= e!379254 e!379255)))

(declare-fun res!428079 () Bool)

(assert (=> b!660014 (=> (not res!428079) (not e!379255))))

(assert (=> b!660014 (= res!428079 (not (contains!3209 (t!18860 Nil!12629) (h!13673 Nil!12629))))))

(declare-fun b!660015 () Bool)

(assert (=> b!660015 (= e!379255 (noDuplicate!456 (t!18860 Nil!12629)))))

(assert (= (and d!93183 (not res!428078)) b!660014))

(assert (= (and b!660014 res!428079) b!660015))

(declare-fun m!632879 () Bool)

(assert (=> b!660014 m!632879))

(declare-fun m!632881 () Bool)

(assert (=> b!660015 m!632881))

(assert (=> b!659906 d!93183))

(declare-fun d!93187 () Bool)

(declare-fun lt!308736 () Bool)

(assert (=> d!93187 (= lt!308736 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!259 Nil!12629)))))

(declare-fun e!379256 () Bool)

(assert (=> d!93187 (= lt!308736 e!379256)))

(declare-fun res!428080 () Bool)

(assert (=> d!93187 (=> (not res!428080) (not e!379256))))

(assert (=> d!93187 (= res!428080 (is-Cons!12628 Nil!12629))))

(assert (=> d!93187 (= (contains!3209 Nil!12629 #b1000000000000000000000000000000000000000000000000000000000000000) lt!308736)))

(declare-fun b!660016 () Bool)

(declare-fun e!379257 () Bool)

(assert (=> b!660016 (= e!379256 e!379257)))

(declare-fun res!428081 () Bool)

(assert (=> b!660016 (=> res!428081 e!379257)))

(assert (=> b!660016 (= res!428081 (= (h!13673 Nil!12629) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!660017 () Bool)

(assert (=> b!660017 (= e!379257 (contains!3209 (t!18860 Nil!12629) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93187 res!428080) b!660016))

(assert (= (and b!660016 (not res!428081)) b!660017))

(declare-fun m!632883 () Bool)

(assert (=> d!93187 m!632883))

(declare-fun m!632885 () Bool)

(assert (=> d!93187 m!632885))

(declare-fun m!632887 () Bool)

(assert (=> b!660017 m!632887))

(assert (=> b!659901 d!93187))

(declare-fun d!93189 () Bool)

(declare-fun lt!308737 () Bool)

(assert (=> d!93189 (= lt!308737 (set.member k!2843 (content!259 acc!681)))))

(declare-fun e!379258 () Bool)

(assert (=> d!93189 (= lt!308737 e!379258)))

(declare-fun res!428082 () Bool)

(assert (=> d!93189 (=> (not res!428082) (not e!379258))))

(assert (=> d!93189 (= res!428082 (is-Cons!12628 acc!681))))

(assert (=> d!93189 (= (contains!3209 acc!681 k!2843) lt!308737)))

(declare-fun b!660018 () Bool)

(declare-fun e!379259 () Bool)

(assert (=> b!660018 (= e!379258 e!379259)))

(declare-fun res!428083 () Bool)

(assert (=> b!660018 (=> res!428083 e!379259)))

(assert (=> b!660018 (= res!428083 (= (h!13673 acc!681) k!2843))))

(declare-fun b!660019 () Bool)

(assert (=> b!660019 (= e!379259 (contains!3209 (t!18860 acc!681) k!2843))))

(assert (= (and d!93189 res!428082) b!660018))

(assert (= (and b!660018 (not res!428083)) b!660019))

(assert (=> d!93189 m!632869))

(declare-fun m!632889 () Bool)

(assert (=> d!93189 m!632889))

(declare-fun m!632891 () Bool)

(assert (=> b!660019 m!632891))

(assert (=> b!659907 d!93189))

(declare-fun d!93191 () Bool)

(declare-fun lt!308738 () Bool)

(assert (=> d!93191 (= lt!308738 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!259 Nil!12629)))))

(declare-fun e!379260 () Bool)

(assert (=> d!93191 (= lt!308738 e!379260)))

(declare-fun res!428084 () Bool)

(assert (=> d!93191 (=> (not res!428084) (not e!379260))))

(assert (=> d!93191 (= res!428084 (is-Cons!12628 Nil!12629))))

(assert (=> d!93191 (= (contains!3209 Nil!12629 #b0000000000000000000000000000000000000000000000000000000000000000) lt!308738)))

(declare-fun b!660020 () Bool)

