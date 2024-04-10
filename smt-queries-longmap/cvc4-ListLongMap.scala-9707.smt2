; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114750 () Bool)

(assert start!114750)

(declare-fun b!1360928 () Bool)

(declare-fun res!905140 () Bool)

(declare-fun e!772072 () Bool)

(assert (=> b!1360928 (=> (not res!905140) (not e!772072))))

(declare-datatypes ((List!31772 0))(
  ( (Nil!31769) (Cons!31768 (h!32977 (_ BitVec 64)) (t!46451 List!31772)) )
))
(declare-fun acc!759 () List!31772)

(declare-fun noDuplicate!2338 (List!31772) Bool)

(assert (=> b!1360928 (= res!905140 (noDuplicate!2338 acc!759))))

(declare-fun b!1360929 () Bool)

(declare-fun e!772069 () Bool)

(assert (=> b!1360929 (= e!772072 e!772069)))

(declare-fun res!905151 () Bool)

(assert (=> b!1360929 (=> (not res!905151) (not e!772069))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lt!600027 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1360929 (= res!905151 (and (not (= from!3120 i!1404)) lt!600027))))

(declare-datatypes ((Unit!44853 0))(
  ( (Unit!44854) )
))
(declare-fun lt!600028 () Unit!44853)

(declare-fun e!772070 () Unit!44853)

(assert (=> b!1360929 (= lt!600028 e!772070)))

(declare-fun c!127334 () Bool)

(assert (=> b!1360929 (= c!127334 lt!600027)))

(declare-datatypes ((array!92587 0))(
  ( (array!92588 (arr!44731 (Array (_ BitVec 32) (_ BitVec 64))) (size!45281 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92587)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360929 (= lt!600027 (validKeyInArray!0 (select (arr!44731 a!3742) from!3120)))))

(declare-fun b!1360930 () Bool)

(declare-fun res!905152 () Bool)

(assert (=> b!1360930 (=> (not res!905152) (not e!772072))))

(assert (=> b!1360930 (= res!905152 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45281 a!3742))))))

(declare-fun b!1360931 () Bool)

(declare-fun res!905145 () Bool)

(assert (=> b!1360931 (=> (not res!905145) (not e!772072))))

(declare-fun arrayNoDuplicates!0 (array!92587 (_ BitVec 32) List!31772) Bool)

(assert (=> b!1360931 (= res!905145 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31769))))

(declare-fun b!1360932 () Bool)

(declare-fun res!905146 () Bool)

(assert (=> b!1360932 (=> (not res!905146) (not e!772072))))

(declare-fun contains!9481 (List!31772 (_ BitVec 64)) Bool)

(assert (=> b!1360932 (= res!905146 (not (contains!9481 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360933 () Bool)

(declare-fun e!772067 () Bool)

(declare-fun lt!600025 () List!31772)

(assert (=> b!1360933 (= e!772067 (contains!9481 lt!600025 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1360934 () Bool)

(declare-fun e!772071 () Bool)

(assert (=> b!1360934 (= e!772069 e!772071)))

(declare-fun res!905144 () Bool)

(assert (=> b!1360934 (=> (not res!905144) (not e!772071))))

(assert (=> b!1360934 (= res!905144 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!886 (List!31772 (_ BitVec 64)) List!31772)

(assert (=> b!1360934 (= lt!600025 ($colon$colon!886 acc!759 (select (arr!44731 a!3742) from!3120)))))

(declare-fun b!1360935 () Bool)

(declare-fun lt!600024 () Unit!44853)

(assert (=> b!1360935 (= e!772070 lt!600024)))

(declare-fun lt!600026 () Unit!44853)

(declare-fun lemmaListSubSeqRefl!0 (List!31772) Unit!44853)

(assert (=> b!1360935 (= lt!600026 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!883 (List!31772 List!31772) Bool)

(assert (=> b!1360935 (subseq!883 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92587 List!31772 List!31772 (_ BitVec 32)) Unit!44853)

(assert (=> b!1360935 (= lt!600024 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!886 acc!759 (select (arr!44731 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1360935 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360936 () Bool)

(declare-fun res!905148 () Bool)

(assert (=> b!1360936 (=> (not res!905148) (not e!772072))))

(assert (=> b!1360936 (= res!905148 (not (contains!9481 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360937 () Bool)

(assert (=> b!1360937 (= e!772071 e!772067)))

(declare-fun res!905143 () Bool)

(assert (=> b!1360937 (=> res!905143 e!772067)))

(assert (=> b!1360937 (= res!905143 (contains!9481 lt!600025 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1360938 () Bool)

(declare-fun res!905142 () Bool)

(assert (=> b!1360938 (=> (not res!905142) (not e!772072))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1360938 (= res!905142 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!905147 () Bool)

(assert (=> start!114750 (=> (not res!905147) (not e!772072))))

(assert (=> start!114750 (= res!905147 (and (bvslt (size!45281 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45281 a!3742))))))

(assert (=> start!114750 e!772072))

(assert (=> start!114750 true))

(declare-fun array_inv!33759 (array!92587) Bool)

(assert (=> start!114750 (array_inv!33759 a!3742)))

(declare-fun b!1360939 () Bool)

(declare-fun res!905141 () Bool)

(assert (=> b!1360939 (=> (not res!905141) (not e!772072))))

(assert (=> b!1360939 (= res!905141 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1360940 () Bool)

(declare-fun res!905149 () Bool)

(assert (=> b!1360940 (=> (not res!905149) (not e!772071))))

(assert (=> b!1360940 (= res!905149 (noDuplicate!2338 lt!600025))))

(declare-fun b!1360941 () Bool)

(declare-fun res!905150 () Bool)

(assert (=> b!1360941 (=> (not res!905150) (not e!772072))))

(assert (=> b!1360941 (= res!905150 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45281 a!3742)))))

(declare-fun b!1360942 () Bool)

(declare-fun Unit!44855 () Unit!44853)

(assert (=> b!1360942 (= e!772070 Unit!44855)))

(assert (= (and start!114750 res!905147) b!1360928))

(assert (= (and b!1360928 res!905140) b!1360936))

(assert (= (and b!1360936 res!905148) b!1360932))

(assert (= (and b!1360932 res!905146) b!1360931))

(assert (= (and b!1360931 res!905145) b!1360939))

(assert (= (and b!1360939 res!905141) b!1360930))

(assert (= (and b!1360930 res!905152) b!1360938))

(assert (= (and b!1360938 res!905142) b!1360941))

(assert (= (and b!1360941 res!905150) b!1360929))

(assert (= (and b!1360929 c!127334) b!1360935))

(assert (= (and b!1360929 (not c!127334)) b!1360942))

(assert (= (and b!1360929 res!905151) b!1360934))

(assert (= (and b!1360934 res!905144) b!1360940))

(assert (= (and b!1360940 res!905149) b!1360937))

(assert (= (and b!1360937 (not res!905143)) b!1360933))

(declare-fun m!1246113 () Bool)

(assert (=> b!1360939 m!1246113))

(declare-fun m!1246115 () Bool)

(assert (=> b!1360931 m!1246115))

(declare-fun m!1246117 () Bool)

(assert (=> b!1360933 m!1246117))

(declare-fun m!1246119 () Bool)

(assert (=> b!1360932 m!1246119))

(declare-fun m!1246121 () Bool)

(assert (=> b!1360938 m!1246121))

(declare-fun m!1246123 () Bool)

(assert (=> b!1360928 m!1246123))

(declare-fun m!1246125 () Bool)

(assert (=> start!114750 m!1246125))

(declare-fun m!1246127 () Bool)

(assert (=> b!1360935 m!1246127))

(declare-fun m!1246129 () Bool)

(assert (=> b!1360935 m!1246129))

(declare-fun m!1246131 () Bool)

(assert (=> b!1360935 m!1246131))

(declare-fun m!1246133 () Bool)

(assert (=> b!1360935 m!1246133))

(declare-fun m!1246135 () Bool)

(assert (=> b!1360935 m!1246135))

(assert (=> b!1360935 m!1246129))

(assert (=> b!1360935 m!1246131))

(declare-fun m!1246137 () Bool)

(assert (=> b!1360935 m!1246137))

(assert (=> b!1360934 m!1246129))

(assert (=> b!1360934 m!1246129))

(assert (=> b!1360934 m!1246131))

(assert (=> b!1360929 m!1246129))

(assert (=> b!1360929 m!1246129))

(declare-fun m!1246139 () Bool)

(assert (=> b!1360929 m!1246139))

(declare-fun m!1246141 () Bool)

(assert (=> b!1360936 m!1246141))

(declare-fun m!1246143 () Bool)

(assert (=> b!1360940 m!1246143))

(declare-fun m!1246145 () Bool)

(assert (=> b!1360937 m!1246145))

(push 1)

(assert (not b!1360938))

(assert (not b!1360932))

(assert (not b!1360940))

(assert (not b!1360935))

(assert (not b!1360939))

(assert (not b!1360933))

(assert (not b!1360937))

(assert (not b!1360931))

(assert (not b!1360929))

(assert (not b!1360928))

(assert (not b!1360934))

(assert (not b!1360936))

(assert (not start!114750))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!145755 () Bool)

(declare-fun lt!600041 () Bool)

(declare-fun content!694 (List!31772) (Set (_ BitVec 64)))

(assert (=> d!145755 (= lt!600041 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!694 lt!600025)))))

(declare-fun e!772113 () Bool)

(assert (=> d!145755 (= lt!600041 e!772113)))

(declare-fun res!905190 () Bool)

(assert (=> d!145755 (=> (not res!905190) (not e!772113))))

(assert (=> d!145755 (= res!905190 (is-Cons!31768 lt!600025))))

(assert (=> d!145755 (= (contains!9481 lt!600025 #b1000000000000000000000000000000000000000000000000000000000000000) lt!600041)))

(declare-fun b!1360986 () Bool)

(declare-fun e!772114 () Bool)

(assert (=> b!1360986 (= e!772113 e!772114)))

(declare-fun res!905191 () Bool)

(assert (=> b!1360986 (=> res!905191 e!772114)))

(assert (=> b!1360986 (= res!905191 (= (h!32977 lt!600025) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1360987 () Bool)

(assert (=> b!1360987 (= e!772114 (contains!9481 (t!46451 lt!600025) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145755 res!905190) b!1360986))

(assert (= (and b!1360986 (not res!905191)) b!1360987))

(declare-fun m!1246183 () Bool)

(assert (=> d!145755 m!1246183))

(declare-fun m!1246187 () Bool)

(assert (=> d!145755 m!1246187))

(declare-fun m!1246193 () Bool)

(assert (=> b!1360987 m!1246193))

(assert (=> b!1360933 d!145755))

(declare-fun b!1361025 () Bool)

(declare-fun e!772152 () Bool)

(declare-fun e!772149 () Bool)

(assert (=> b!1361025 (= e!772152 e!772149)))

(declare-fun res!905224 () Bool)

(assert (=> b!1361025 (=> (not res!905224) (not e!772149))))

(declare-fun e!772150 () Bool)

(assert (=> b!1361025 (= res!905224 (not e!772150))))

(declare-fun res!905223 () Bool)

(assert (=> b!1361025 (=> (not res!905223) (not e!772150))))

(assert (=> b!1361025 (= res!905223 (validKeyInArray!0 (select (arr!44731 a!3742) #b00000000000000000000000000000000)))))

(declare-fun d!145765 () Bool)

(declare-fun res!905225 () Bool)

(assert (=> d!145765 (=> res!905225 e!772152)))

(assert (=> d!145765 (= res!905225 (bvsge #b00000000000000000000000000000000 (size!45281 a!3742)))))

(assert (=> d!145765 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31769) e!772152)))

(declare-fun b!1361026 () Bool)

(declare-fun e!772151 () Bool)

(declare-fun call!65349 () Bool)

(assert (=> b!1361026 (= e!772151 call!65349)))

(declare-fun bm!65346 () Bool)

(declare-fun c!127341 () Bool)

(assert (=> bm!65346 (= call!65349 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127341 (Cons!31768 (select (arr!44731 a!3742) #b00000000000000000000000000000000) Nil!31769) Nil!31769)))))

(declare-fun b!1361027 () Bool)

(assert (=> b!1361027 (= e!772150 (contains!9481 Nil!31769 (select (arr!44731 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1361028 () Bool)

(assert (=> b!1361028 (= e!772149 e!772151)))

(assert (=> b!1361028 (= c!127341 (validKeyInArray!0 (select (arr!44731 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1361029 () Bool)

(assert (=> b!1361029 (= e!772151 call!65349)))

(assert (= (and d!145765 (not res!905225)) b!1361025))

(assert (= (and b!1361025 res!905223) b!1361027))

(assert (= (and b!1361025 res!905224) b!1361028))

(assert (= (and b!1361028 c!127341) b!1361029))

(assert (= (and b!1361028 (not c!127341)) b!1361026))

(assert (= (or b!1361029 b!1361026) bm!65346))

(declare-fun m!1246221 () Bool)

(assert (=> b!1361025 m!1246221))

(assert (=> b!1361025 m!1246221))

(declare-fun m!1246225 () Bool)

(assert (=> b!1361025 m!1246225))

(assert (=> bm!65346 m!1246221))

(declare-fun m!1246227 () Bool)

(assert (=> bm!65346 m!1246227))

(assert (=> b!1361027 m!1246221))

(assert (=> b!1361027 m!1246221))

(declare-fun m!1246229 () Bool)

(assert (=> b!1361027 m!1246229))

(assert (=> b!1361028 m!1246221))

(assert (=> b!1361028 m!1246221))

(assert (=> b!1361028 m!1246225))

(assert (=> b!1360931 d!145765))

(declare-fun d!145785 () Bool)

(declare-fun lt!600051 () Bool)

(assert (=> d!145785 (= lt!600051 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!694 acc!759)))))

(declare-fun e!772157 () Bool)

(assert (=> d!145785 (= lt!600051 e!772157)))

(declare-fun res!905229 () Bool)

(assert (=> d!145785 (=> (not res!905229) (not e!772157))))

(assert (=> d!145785 (= res!905229 (is-Cons!31768 acc!759))))

(assert (=> d!145785 (= (contains!9481 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!600051)))

(declare-fun b!1361035 () Bool)

(declare-fun e!772158 () Bool)

(assert (=> b!1361035 (= e!772157 e!772158)))

(declare-fun res!905230 () Bool)

(assert (=> b!1361035 (=> res!905230 e!772158)))

(assert (=> b!1361035 (= res!905230 (= (h!32977 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1361036 () Bool)

(assert (=> b!1361036 (= e!772158 (contains!9481 (t!46451 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145785 res!905229) b!1361035))

(assert (= (and b!1361035 (not res!905230)) b!1361036))

(declare-fun m!1246231 () Bool)

(assert (=> d!145785 m!1246231))

(declare-fun m!1246233 () Bool)

(assert (=> d!145785 m!1246233))

(declare-fun m!1246235 () Bool)

(assert (=> b!1361036 m!1246235))

(assert (=> b!1360932 d!145785))

(declare-fun d!145787 () Bool)

(assert (=> d!145787 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!600054 () Unit!44853)

(declare-fun choose!80 (array!92587 List!31772 List!31772 (_ BitVec 32)) Unit!44853)

(assert (=> d!145787 (= lt!600054 (choose!80 a!3742 ($colon$colon!886 acc!759 (select (arr!44731 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> d!145787 (bvslt (size!45281 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!145787 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!886 acc!759 (select (arr!44731 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)) lt!600054)))

(declare-fun bs!39030 () Bool)

(assert (= bs!39030 d!145787))

(assert (=> bs!39030 m!1246135))

(assert (=> bs!39030 m!1246131))

(declare-fun m!1246241 () Bool)

(assert (=> bs!39030 m!1246241))

(assert (=> b!1360935 d!145787))

(declare-fun b!1361069 () Bool)

(declare-fun e!772189 () Bool)

(assert (=> b!1361069 (= e!772189 (subseq!883 (t!46451 acc!759) (t!46451 acc!759)))))

(declare-fun b!1361068 () Bool)

(declare-fun e!772188 () Bool)

(declare-fun e!772187 () Bool)

(assert (=> b!1361068 (= e!772188 e!772187)))

(declare-fun res!905259 () Bool)

(assert (=> b!1361068 (=> res!905259 e!772187)))

(assert (=> b!1361068 (= res!905259 e!772189)))

(declare-fun res!905257 () Bool)

(assert (=> b!1361068 (=> (not res!905257) (not e!772189))))

(assert (=> b!1361068 (= res!905257 (= (h!32977 acc!759) (h!32977 acc!759)))))

(declare-fun b!1361070 () Bool)

(assert (=> b!1361070 (= e!772187 (subseq!883 acc!759 (t!46451 acc!759)))))

(declare-fun b!1361067 () Bool)

(declare-fun e!772190 () Bool)

(assert (=> b!1361067 (= e!772190 e!772188)))

(declare-fun res!905258 () Bool)

(assert (=> b!1361067 (=> (not res!905258) (not e!772188))))

(assert (=> b!1361067 (= res!905258 (is-Cons!31768 acc!759))))

(declare-fun d!145791 () Bool)

(declare-fun res!905260 () Bool)

(assert (=> d!145791 (=> res!905260 e!772190)))

(assert (=> d!145791 (= res!905260 (is-Nil!31769 acc!759))))

(assert (=> d!145791 (= (subseq!883 acc!759 acc!759) e!772190)))

(assert (= (and d!145791 (not res!905260)) b!1361067))

(assert (= (and b!1361067 res!905258) b!1361068))

(assert (= (and b!1361068 res!905257) b!1361069))

(assert (= (and b!1361068 (not res!905259)) b!1361070))

(declare-fun m!1246247 () Bool)

(assert (=> b!1361069 m!1246247))

(declare-fun m!1246249 () Bool)

(assert (=> b!1361070 m!1246249))

(assert (=> b!1360935 d!145791))

(declare-fun b!1361071 () Bool)

(declare-fun e!772194 () Bool)

(declare-fun e!772191 () Bool)

(assert (=> b!1361071 (= e!772194 e!772191)))

(declare-fun res!905262 () Bool)

(assert (=> b!1361071 (=> (not res!905262) (not e!772191))))

(declare-fun e!772192 () Bool)

(assert (=> b!1361071 (= res!905262 (not e!772192))))

(declare-fun res!905261 () Bool)

(assert (=> b!1361071 (=> (not res!905261) (not e!772192))))

(assert (=> b!1361071 (= res!905261 (validKeyInArray!0 (select (arr!44731 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun d!145795 () Bool)

(declare-fun res!905263 () Bool)

(assert (=> d!145795 (=> res!905263 e!772194)))

(assert (=> d!145795 (= res!905263 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45281 a!3742)))))

(assert (=> d!145795 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!772194)))

(declare-fun b!1361072 () Bool)

(declare-fun e!772193 () Bool)

(declare-fun call!65353 () Bool)

(assert (=> b!1361072 (= e!772193 call!65353)))

(declare-fun bm!65350 () Bool)

(declare-fun c!127345 () Bool)

(assert (=> bm!65350 (= call!65353 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127345 (Cons!31768 (select (arr!44731 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun b!1361073 () Bool)

(assert (=> b!1361073 (= e!772192 (contains!9481 acc!759 (select (arr!44731 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1361074 () Bool)

(assert (=> b!1361074 (= e!772191 e!772193)))

(assert (=> b!1361074 (= c!127345 (validKeyInArray!0 (select (arr!44731 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1361075 () Bool)

(assert (=> b!1361075 (= e!772193 call!65353)))

(assert (= (and d!145795 (not res!905263)) b!1361071))

(assert (= (and b!1361071 res!905261) b!1361073))

(assert (= (and b!1361071 res!905262) b!1361074))

(assert (= (and b!1361074 c!127345) b!1361075))

(assert (= (and b!1361074 (not c!127345)) b!1361072))

(assert (= (or b!1361075 b!1361072) bm!65350))

(declare-fun m!1246251 () Bool)

(assert (=> b!1361071 m!1246251))

(assert (=> b!1361071 m!1246251))

(declare-fun m!1246253 () Bool)

(assert (=> b!1361071 m!1246253))

(assert (=> bm!65350 m!1246251))

(declare-fun m!1246255 () Bool)

(assert (=> bm!65350 m!1246255))

(assert (=> b!1361073 m!1246251))

(assert (=> b!1361073 m!1246251))

(declare-fun m!1246257 () Bool)

(assert (=> b!1361073 m!1246257))

(assert (=> b!1361074 m!1246251))

(assert (=> b!1361074 m!1246251))

(assert (=> b!1361074 m!1246253))

(assert (=> b!1360935 d!145795))

(declare-fun d!145797 () Bool)

(assert (=> d!145797 (= ($colon$colon!886 acc!759 (select (arr!44731 a!3742) from!3120)) (Cons!31768 (select (arr!44731 a!3742) from!3120) acc!759))))

(assert (=> b!1360935 d!145797))

(declare-fun d!145799 () Bool)

(assert (=> d!145799 (subseq!883 acc!759 acc!759)))

(declare-fun lt!600057 () Unit!44853)

(declare-fun choose!36 (List!31772) Unit!44853)

