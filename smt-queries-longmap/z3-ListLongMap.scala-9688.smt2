; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114412 () Bool)

(assert start!114412)

(declare-fun b!1358180 () Bool)

(declare-fun res!902870 () Bool)

(declare-fun e!770828 () Bool)

(assert (=> b!1358180 (=> (not res!902870) (not e!770828))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92459 0))(
  ( (array!92460 (arr!44673 (Array (_ BitVec 32) (_ BitVec 64))) (size!45223 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92459)

(assert (=> b!1358180 (= res!902870 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45223 a!3742))))))

(declare-fun res!902876 () Bool)

(assert (=> start!114412 (=> (not res!902876) (not e!770828))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114412 (= res!902876 (and (bvslt (size!45223 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45223 a!3742))))))

(assert (=> start!114412 e!770828))

(assert (=> start!114412 true))

(declare-fun array_inv!33701 (array!92459) Bool)

(assert (=> start!114412 (array_inv!33701 a!3742)))

(declare-fun b!1358181 () Bool)

(declare-fun res!902869 () Bool)

(declare-fun e!770829 () Bool)

(assert (=> b!1358181 (=> res!902869 e!770829)))

(declare-datatypes ((List!31714 0))(
  ( (Nil!31711) (Cons!31710 (h!32919 (_ BitVec 64)) (t!46381 List!31714)) )
))
(declare-fun lt!599288 () List!31714)

(declare-fun contains!9423 (List!31714 (_ BitVec 64)) Bool)

(assert (=> b!1358181 (= res!902869 (contains!9423 lt!599288 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1358182 () Bool)

(declare-fun res!902868 () Bool)

(assert (=> b!1358182 (=> res!902868 e!770829)))

(assert (=> b!1358182 (= res!902868 (contains!9423 lt!599288 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1358183 () Bool)

(declare-fun res!902867 () Bool)

(assert (=> b!1358183 (=> (not res!902867) (not e!770828))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358183 (= res!902867 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1358184 () Bool)

(assert (=> b!1358184 (= e!770828 (not e!770829))))

(declare-fun res!902875 () Bool)

(assert (=> b!1358184 (=> res!902875 e!770829)))

(assert (=> b!1358184 (= res!902875 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun acc!759 () List!31714)

(declare-fun $colon$colon!828 (List!31714 (_ BitVec 64)) List!31714)

(assert (=> b!1358184 (= lt!599288 ($colon$colon!828 acc!759 (select (arr!44673 a!3742) from!3120)))))

(declare-fun subseq!825 (List!31714 List!31714) Bool)

(assert (=> b!1358184 (subseq!825 acc!759 acc!759)))

(declare-datatypes ((Unit!44681 0))(
  ( (Unit!44682) )
))
(declare-fun lt!599290 () Unit!44681)

(declare-fun lemmaListSubSeqRefl!0 (List!31714) Unit!44681)

(assert (=> b!1358184 (= lt!599290 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1358185 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92459 (_ BitVec 32) List!31714) Bool)

(assert (=> b!1358185 (= e!770829 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!599288))))

(declare-fun lt!599289 () Unit!44681)

(declare-fun noDuplicateSubseq!135 (List!31714 List!31714) Unit!44681)

(assert (=> b!1358185 (= lt!599289 (noDuplicateSubseq!135 acc!759 lt!599288))))

(declare-fun b!1358186 () Bool)

(declare-fun res!902874 () Bool)

(assert (=> b!1358186 (=> (not res!902874) (not e!770828))))

(declare-fun noDuplicate!2280 (List!31714) Bool)

(assert (=> b!1358186 (= res!902874 (noDuplicate!2280 acc!759))))

(declare-fun b!1358187 () Bool)

(declare-fun res!902877 () Bool)

(assert (=> b!1358187 (=> res!902877 e!770829)))

(assert (=> b!1358187 (= res!902877 (not (subseq!825 acc!759 lt!599288)))))

(declare-fun b!1358188 () Bool)

(declare-fun res!902872 () Bool)

(assert (=> b!1358188 (=> (not res!902872) (not e!770828))))

(assert (=> b!1358188 (= res!902872 (validKeyInArray!0 (select (arr!44673 a!3742) from!3120)))))

(declare-fun b!1358189 () Bool)

(declare-fun res!902873 () Bool)

(assert (=> b!1358189 (=> (not res!902873) (not e!770828))))

(assert (=> b!1358189 (= res!902873 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1358190 () Bool)

(declare-fun res!902871 () Bool)

(assert (=> b!1358190 (=> (not res!902871) (not e!770828))))

(assert (=> b!1358190 (= res!902871 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45223 a!3742)))))

(declare-fun b!1358191 () Bool)

(declare-fun res!902866 () Bool)

(assert (=> b!1358191 (=> (not res!902866) (not e!770828))))

(assert (=> b!1358191 (= res!902866 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31711))))

(declare-fun b!1358192 () Bool)

(declare-fun res!902864 () Bool)

(assert (=> b!1358192 (=> (not res!902864) (not e!770828))))

(assert (=> b!1358192 (= res!902864 (not (contains!9423 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358193 () Bool)

(declare-fun res!902865 () Bool)

(assert (=> b!1358193 (=> (not res!902865) (not e!770828))))

(assert (=> b!1358193 (= res!902865 (not (contains!9423 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358194 () Bool)

(declare-fun res!902878 () Bool)

(assert (=> b!1358194 (=> res!902878 e!770829)))

(assert (=> b!1358194 (= res!902878 (not (noDuplicate!2280 lt!599288)))))

(assert (= (and start!114412 res!902876) b!1358186))

(assert (= (and b!1358186 res!902874) b!1358193))

(assert (= (and b!1358193 res!902865) b!1358192))

(assert (= (and b!1358192 res!902864) b!1358191))

(assert (= (and b!1358191 res!902866) b!1358189))

(assert (= (and b!1358189 res!902873) b!1358180))

(assert (= (and b!1358180 res!902870) b!1358183))

(assert (= (and b!1358183 res!902867) b!1358190))

(assert (= (and b!1358190 res!902871) b!1358188))

(assert (= (and b!1358188 res!902872) b!1358184))

(assert (= (and b!1358184 (not res!902875)) b!1358194))

(assert (= (and b!1358194 (not res!902878)) b!1358182))

(assert (= (and b!1358182 (not res!902868)) b!1358181))

(assert (= (and b!1358181 (not res!902869)) b!1358187))

(assert (= (and b!1358187 (not res!902877)) b!1358185))

(declare-fun m!1243783 () Bool)

(assert (=> b!1358182 m!1243783))

(declare-fun m!1243785 () Bool)

(assert (=> b!1358184 m!1243785))

(assert (=> b!1358184 m!1243785))

(declare-fun m!1243787 () Bool)

(assert (=> b!1358184 m!1243787))

(declare-fun m!1243789 () Bool)

(assert (=> b!1358184 m!1243789))

(declare-fun m!1243791 () Bool)

(assert (=> b!1358184 m!1243791))

(declare-fun m!1243793 () Bool)

(assert (=> b!1358194 m!1243793))

(declare-fun m!1243795 () Bool)

(assert (=> b!1358185 m!1243795))

(declare-fun m!1243797 () Bool)

(assert (=> b!1358185 m!1243797))

(declare-fun m!1243799 () Bool)

(assert (=> b!1358189 m!1243799))

(assert (=> b!1358188 m!1243785))

(assert (=> b!1358188 m!1243785))

(declare-fun m!1243801 () Bool)

(assert (=> b!1358188 m!1243801))

(declare-fun m!1243803 () Bool)

(assert (=> b!1358192 m!1243803))

(declare-fun m!1243805 () Bool)

(assert (=> b!1358191 m!1243805))

(declare-fun m!1243807 () Bool)

(assert (=> b!1358187 m!1243807))

(declare-fun m!1243809 () Bool)

(assert (=> start!114412 m!1243809))

(declare-fun m!1243811 () Bool)

(assert (=> b!1358181 m!1243811))

(declare-fun m!1243813 () Bool)

(assert (=> b!1358186 m!1243813))

(declare-fun m!1243815 () Bool)

(assert (=> b!1358193 m!1243815))

(declare-fun m!1243817 () Bool)

(assert (=> b!1358183 m!1243817))

(check-sat (not b!1358181) (not b!1358188) (not b!1358182) (not b!1358189) (not b!1358193) (not b!1358191) (not b!1358194) (not b!1358184) (not b!1358192) (not b!1358183) (not b!1358185) (not start!114412) (not b!1358186) (not b!1358187))
(check-sat)
(get-model)

(declare-fun d!145341 () Bool)

(assert (=> d!145341 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1358183 d!145341))

(declare-fun d!145343 () Bool)

(assert (=> d!145343 (= (array_inv!33701 a!3742) (bvsge (size!45223 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114412 d!145343))

(declare-fun d!145345 () Bool)

(declare-fun lt!599302 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!682 (List!31714) (InoxSet (_ BitVec 64)))

(assert (=> d!145345 (= lt!599302 (select (content!682 lt!599288) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!770844 () Bool)

(assert (=> d!145345 (= lt!599302 e!770844)))

(declare-fun res!902928 () Bool)

(assert (=> d!145345 (=> (not res!902928) (not e!770844))))

(get-info :version)

(assert (=> d!145345 (= res!902928 ((_ is Cons!31710) lt!599288))))

(assert (=> d!145345 (= (contains!9423 lt!599288 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599302)))

(declare-fun b!1358244 () Bool)

(declare-fun e!770845 () Bool)

(assert (=> b!1358244 (= e!770844 e!770845)))

(declare-fun res!902929 () Bool)

(assert (=> b!1358244 (=> res!902929 e!770845)))

(assert (=> b!1358244 (= res!902929 (= (h!32919 lt!599288) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1358245 () Bool)

(assert (=> b!1358245 (= e!770845 (contains!9423 (t!46381 lt!599288) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145345 res!902928) b!1358244))

(assert (= (and b!1358244 (not res!902929)) b!1358245))

(declare-fun m!1243855 () Bool)

(assert (=> d!145345 m!1243855))

(declare-fun m!1243857 () Bool)

(assert (=> d!145345 m!1243857))

(declare-fun m!1243859 () Bool)

(assert (=> b!1358245 m!1243859))

(assert (=> b!1358182 d!145345))

(declare-fun d!145347 () Bool)

(declare-fun lt!599303 () Bool)

(assert (=> d!145347 (= lt!599303 (select (content!682 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!770846 () Bool)

(assert (=> d!145347 (= lt!599303 e!770846)))

(declare-fun res!902930 () Bool)

(assert (=> d!145347 (=> (not res!902930) (not e!770846))))

(assert (=> d!145347 (= res!902930 ((_ is Cons!31710) acc!759))))

(assert (=> d!145347 (= (contains!9423 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599303)))

(declare-fun b!1358246 () Bool)

(declare-fun e!770847 () Bool)

(assert (=> b!1358246 (= e!770846 e!770847)))

(declare-fun res!902931 () Bool)

(assert (=> b!1358246 (=> res!902931 e!770847)))

(assert (=> b!1358246 (= res!902931 (= (h!32919 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1358247 () Bool)

(assert (=> b!1358247 (= e!770847 (contains!9423 (t!46381 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145347 res!902930) b!1358246))

(assert (= (and b!1358246 (not res!902931)) b!1358247))

(declare-fun m!1243861 () Bool)

(assert (=> d!145347 m!1243861))

(declare-fun m!1243863 () Bool)

(assert (=> d!145347 m!1243863))

(declare-fun m!1243865 () Bool)

(assert (=> b!1358247 m!1243865))

(assert (=> b!1358193 d!145347))

(declare-fun d!145349 () Bool)

(assert (=> d!145349 (= ($colon$colon!828 acc!759 (select (arr!44673 a!3742) from!3120)) (Cons!31710 (select (arr!44673 a!3742) from!3120) acc!759))))

(assert (=> b!1358184 d!145349))

(declare-fun d!145351 () Bool)

(declare-fun res!902942 () Bool)

(declare-fun e!770858 () Bool)

(assert (=> d!145351 (=> res!902942 e!770858)))

(assert (=> d!145351 (= res!902942 ((_ is Nil!31711) acc!759))))

(assert (=> d!145351 (= (subseq!825 acc!759 acc!759) e!770858)))

(declare-fun b!1358259 () Bool)

(declare-fun e!770857 () Bool)

(assert (=> b!1358259 (= e!770857 (subseq!825 acc!759 (t!46381 acc!759)))))

(declare-fun b!1358258 () Bool)

(declare-fun e!770856 () Bool)

(assert (=> b!1358258 (= e!770856 (subseq!825 (t!46381 acc!759) (t!46381 acc!759)))))

(declare-fun b!1358257 () Bool)

(declare-fun e!770859 () Bool)

(assert (=> b!1358257 (= e!770859 e!770857)))

(declare-fun res!902941 () Bool)

(assert (=> b!1358257 (=> res!902941 e!770857)))

(assert (=> b!1358257 (= res!902941 e!770856)))

(declare-fun res!902940 () Bool)

(assert (=> b!1358257 (=> (not res!902940) (not e!770856))))

(assert (=> b!1358257 (= res!902940 (= (h!32919 acc!759) (h!32919 acc!759)))))

(declare-fun b!1358256 () Bool)

(assert (=> b!1358256 (= e!770858 e!770859)))

(declare-fun res!902943 () Bool)

(assert (=> b!1358256 (=> (not res!902943) (not e!770859))))

(assert (=> b!1358256 (= res!902943 ((_ is Cons!31710) acc!759))))

(assert (= (and d!145351 (not res!902942)) b!1358256))

(assert (= (and b!1358256 res!902943) b!1358257))

(assert (= (and b!1358257 res!902940) b!1358258))

(assert (= (and b!1358257 (not res!902941)) b!1358259))

(declare-fun m!1243867 () Bool)

(assert (=> b!1358259 m!1243867))

(declare-fun m!1243869 () Bool)

(assert (=> b!1358258 m!1243869))

(assert (=> b!1358184 d!145351))

(declare-fun d!145353 () Bool)

(assert (=> d!145353 (subseq!825 acc!759 acc!759)))

(declare-fun lt!599306 () Unit!44681)

(declare-fun choose!36 (List!31714) Unit!44681)

(assert (=> d!145353 (= lt!599306 (choose!36 acc!759))))

(assert (=> d!145353 (= (lemmaListSubSeqRefl!0 acc!759) lt!599306)))

(declare-fun bs!38949 () Bool)

(assert (= bs!38949 d!145353))

(assert (=> bs!38949 m!1243789))

(declare-fun m!1243871 () Bool)

(assert (=> bs!38949 m!1243871))

(assert (=> b!1358184 d!145353))

(declare-fun d!145355 () Bool)

(declare-fun res!902948 () Bool)

(declare-fun e!770864 () Bool)

(assert (=> d!145355 (=> res!902948 e!770864)))

(assert (=> d!145355 (= res!902948 ((_ is Nil!31711) lt!599288))))

(assert (=> d!145355 (= (noDuplicate!2280 lt!599288) e!770864)))

(declare-fun b!1358264 () Bool)

(declare-fun e!770865 () Bool)

(assert (=> b!1358264 (= e!770864 e!770865)))

(declare-fun res!902949 () Bool)

(assert (=> b!1358264 (=> (not res!902949) (not e!770865))))

(assert (=> b!1358264 (= res!902949 (not (contains!9423 (t!46381 lt!599288) (h!32919 lt!599288))))))

(declare-fun b!1358265 () Bool)

(assert (=> b!1358265 (= e!770865 (noDuplicate!2280 (t!46381 lt!599288)))))

(assert (= (and d!145355 (not res!902948)) b!1358264))

(assert (= (and b!1358264 res!902949) b!1358265))

(declare-fun m!1243873 () Bool)

(assert (=> b!1358264 m!1243873))

(declare-fun m!1243875 () Bool)

(assert (=> b!1358265 m!1243875))

(assert (=> b!1358194 d!145355))

(declare-fun b!1358276 () Bool)

(declare-fun e!770876 () Bool)

(declare-fun e!770877 () Bool)

(assert (=> b!1358276 (= e!770876 e!770877)))

(declare-fun c!127100 () Bool)

(assert (=> b!1358276 (= c!127100 (validKeyInArray!0 (select (arr!44673 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun call!65279 () Bool)

(declare-fun bm!65276 () Bool)

(assert (=> bm!65276 (= call!65279 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127100 (Cons!31710 (select (arr!44673 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) lt!599288) lt!599288)))))

(declare-fun e!770874 () Bool)

(declare-fun b!1358277 () Bool)

(assert (=> b!1358277 (= e!770874 (contains!9423 lt!599288 (select (arr!44673 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1358278 () Bool)

(declare-fun e!770875 () Bool)

(assert (=> b!1358278 (= e!770875 e!770876)))

(declare-fun res!902958 () Bool)

(assert (=> b!1358278 (=> (not res!902958) (not e!770876))))

(assert (=> b!1358278 (= res!902958 (not e!770874))))

(declare-fun res!902956 () Bool)

(assert (=> b!1358278 (=> (not res!902956) (not e!770874))))

(assert (=> b!1358278 (= res!902956 (validKeyInArray!0 (select (arr!44673 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun d!145357 () Bool)

(declare-fun res!902957 () Bool)

(assert (=> d!145357 (=> res!902957 e!770875)))

(assert (=> d!145357 (= res!902957 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45223 a!3742)))))

(assert (=> d!145357 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!599288) e!770875)))

(declare-fun b!1358279 () Bool)

(assert (=> b!1358279 (= e!770877 call!65279)))

(declare-fun b!1358280 () Bool)

(assert (=> b!1358280 (= e!770877 call!65279)))

(assert (= (and d!145357 (not res!902957)) b!1358278))

(assert (= (and b!1358278 res!902956) b!1358277))

(assert (= (and b!1358278 res!902958) b!1358276))

(assert (= (and b!1358276 c!127100) b!1358279))

(assert (= (and b!1358276 (not c!127100)) b!1358280))

(assert (= (or b!1358279 b!1358280) bm!65276))

(declare-fun m!1243877 () Bool)

(assert (=> b!1358276 m!1243877))

(assert (=> b!1358276 m!1243877))

(declare-fun m!1243879 () Bool)

(assert (=> b!1358276 m!1243879))

(assert (=> bm!65276 m!1243877))

(declare-fun m!1243881 () Bool)

(assert (=> bm!65276 m!1243881))

(assert (=> b!1358277 m!1243877))

(assert (=> b!1358277 m!1243877))

(declare-fun m!1243883 () Bool)

(assert (=> b!1358277 m!1243883))

(assert (=> b!1358278 m!1243877))

(assert (=> b!1358278 m!1243877))

(assert (=> b!1358278 m!1243879))

(assert (=> b!1358185 d!145357))

(declare-fun d!145359 () Bool)

(assert (=> d!145359 (noDuplicate!2280 acc!759)))

(declare-fun lt!599309 () Unit!44681)

(declare-fun choose!1990 (List!31714 List!31714) Unit!44681)

(assert (=> d!145359 (= lt!599309 (choose!1990 acc!759 lt!599288))))

(declare-fun e!770880 () Bool)

(assert (=> d!145359 e!770880))

(declare-fun res!902961 () Bool)

(assert (=> d!145359 (=> (not res!902961) (not e!770880))))

(assert (=> d!145359 (= res!902961 (subseq!825 acc!759 lt!599288))))

(assert (=> d!145359 (= (noDuplicateSubseq!135 acc!759 lt!599288) lt!599309)))

(declare-fun b!1358283 () Bool)

(assert (=> b!1358283 (= e!770880 (noDuplicate!2280 lt!599288))))

(assert (= (and d!145359 res!902961) b!1358283))

(assert (=> d!145359 m!1243813))

(declare-fun m!1243885 () Bool)

(assert (=> d!145359 m!1243885))

(assert (=> d!145359 m!1243807))

(assert (=> b!1358283 m!1243793))

(assert (=> b!1358185 d!145359))

(declare-fun d!145361 () Bool)

(declare-fun res!902964 () Bool)

(declare-fun e!770883 () Bool)

(assert (=> d!145361 (=> res!902964 e!770883)))

(assert (=> d!145361 (= res!902964 ((_ is Nil!31711) acc!759))))

(assert (=> d!145361 (= (subseq!825 acc!759 lt!599288) e!770883)))

(declare-fun b!1358287 () Bool)

(declare-fun e!770882 () Bool)

(assert (=> b!1358287 (= e!770882 (subseq!825 acc!759 (t!46381 lt!599288)))))

(declare-fun b!1358286 () Bool)

(declare-fun e!770881 () Bool)

(assert (=> b!1358286 (= e!770881 (subseq!825 (t!46381 acc!759) (t!46381 lt!599288)))))

(declare-fun b!1358285 () Bool)

(declare-fun e!770884 () Bool)

(assert (=> b!1358285 (= e!770884 e!770882)))

(declare-fun res!902963 () Bool)

(assert (=> b!1358285 (=> res!902963 e!770882)))

(assert (=> b!1358285 (= res!902963 e!770881)))

(declare-fun res!902962 () Bool)

(assert (=> b!1358285 (=> (not res!902962) (not e!770881))))

(assert (=> b!1358285 (= res!902962 (= (h!32919 acc!759) (h!32919 lt!599288)))))

(declare-fun b!1358284 () Bool)

(assert (=> b!1358284 (= e!770883 e!770884)))

(declare-fun res!902965 () Bool)

(assert (=> b!1358284 (=> (not res!902965) (not e!770884))))

(assert (=> b!1358284 (= res!902965 ((_ is Cons!31710) lt!599288))))

(assert (= (and d!145361 (not res!902964)) b!1358284))

(assert (= (and b!1358284 res!902965) b!1358285))

(assert (= (and b!1358285 res!902962) b!1358286))

(assert (= (and b!1358285 (not res!902963)) b!1358287))

(declare-fun m!1243887 () Bool)

(assert (=> b!1358287 m!1243887))

(declare-fun m!1243889 () Bool)

(assert (=> b!1358286 m!1243889))

(assert (=> b!1358187 d!145361))

(declare-fun d!145363 () Bool)

(declare-fun res!902966 () Bool)

(declare-fun e!770885 () Bool)

(assert (=> d!145363 (=> res!902966 e!770885)))

(assert (=> d!145363 (= res!902966 ((_ is Nil!31711) acc!759))))

(assert (=> d!145363 (= (noDuplicate!2280 acc!759) e!770885)))

(declare-fun b!1358288 () Bool)

(declare-fun e!770886 () Bool)

(assert (=> b!1358288 (= e!770885 e!770886)))

(declare-fun res!902967 () Bool)

(assert (=> b!1358288 (=> (not res!902967) (not e!770886))))

(assert (=> b!1358288 (= res!902967 (not (contains!9423 (t!46381 acc!759) (h!32919 acc!759))))))

(declare-fun b!1358289 () Bool)

(assert (=> b!1358289 (= e!770886 (noDuplicate!2280 (t!46381 acc!759)))))

(assert (= (and d!145363 (not res!902966)) b!1358288))

(assert (= (and b!1358288 res!902967) b!1358289))

(declare-fun m!1243891 () Bool)

(assert (=> b!1358288 m!1243891))

(declare-fun m!1243893 () Bool)

(assert (=> b!1358289 m!1243893))

(assert (=> b!1358186 d!145363))

(declare-fun d!145365 () Bool)

(assert (=> d!145365 (= (validKeyInArray!0 (select (arr!44673 a!3742) from!3120)) (and (not (= (select (arr!44673 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44673 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1358188 d!145365))

(declare-fun b!1358290 () Bool)

(declare-fun e!770889 () Bool)

(declare-fun e!770890 () Bool)

(assert (=> b!1358290 (= e!770889 e!770890)))

(declare-fun c!127101 () Bool)

(assert (=> b!1358290 (= c!127101 (validKeyInArray!0 (select (arr!44673 a!3742) from!3120)))))

(declare-fun call!65280 () Bool)

(declare-fun bm!65277 () Bool)

(assert (=> bm!65277 (= call!65280 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127101 (Cons!31710 (select (arr!44673 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1358291 () Bool)

(declare-fun e!770887 () Bool)

(assert (=> b!1358291 (= e!770887 (contains!9423 acc!759 (select (arr!44673 a!3742) from!3120)))))

(declare-fun b!1358292 () Bool)

(declare-fun e!770888 () Bool)

(assert (=> b!1358292 (= e!770888 e!770889)))

(declare-fun res!902970 () Bool)

(assert (=> b!1358292 (=> (not res!902970) (not e!770889))))

(assert (=> b!1358292 (= res!902970 (not e!770887))))

(declare-fun res!902968 () Bool)

(assert (=> b!1358292 (=> (not res!902968) (not e!770887))))

(assert (=> b!1358292 (= res!902968 (validKeyInArray!0 (select (arr!44673 a!3742) from!3120)))))

(declare-fun d!145367 () Bool)

(declare-fun res!902969 () Bool)

(assert (=> d!145367 (=> res!902969 e!770888)))

(assert (=> d!145367 (= res!902969 (bvsge from!3120 (size!45223 a!3742)))))

(assert (=> d!145367 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!770888)))

(declare-fun b!1358293 () Bool)

(assert (=> b!1358293 (= e!770890 call!65280)))

(declare-fun b!1358294 () Bool)

(assert (=> b!1358294 (= e!770890 call!65280)))

(assert (= (and d!145367 (not res!902969)) b!1358292))

(assert (= (and b!1358292 res!902968) b!1358291))

(assert (= (and b!1358292 res!902970) b!1358290))

(assert (= (and b!1358290 c!127101) b!1358293))

(assert (= (and b!1358290 (not c!127101)) b!1358294))

(assert (= (or b!1358293 b!1358294) bm!65277))

(assert (=> b!1358290 m!1243785))

(assert (=> b!1358290 m!1243785))

(assert (=> b!1358290 m!1243801))

(assert (=> bm!65277 m!1243785))

(declare-fun m!1243895 () Bool)

(assert (=> bm!65277 m!1243895))

(assert (=> b!1358291 m!1243785))

(assert (=> b!1358291 m!1243785))

(declare-fun m!1243897 () Bool)

(assert (=> b!1358291 m!1243897))

(assert (=> b!1358292 m!1243785))

(assert (=> b!1358292 m!1243785))

(assert (=> b!1358292 m!1243801))

(assert (=> b!1358189 d!145367))

(declare-fun b!1358295 () Bool)

(declare-fun e!770893 () Bool)

(declare-fun e!770894 () Bool)

(assert (=> b!1358295 (= e!770893 e!770894)))

(declare-fun c!127102 () Bool)

(assert (=> b!1358295 (= c!127102 (validKeyInArray!0 (select (arr!44673 a!3742) #b00000000000000000000000000000000)))))

(declare-fun bm!65278 () Bool)

(declare-fun call!65281 () Bool)

(assert (=> bm!65278 (= call!65281 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127102 (Cons!31710 (select (arr!44673 a!3742) #b00000000000000000000000000000000) Nil!31711) Nil!31711)))))

(declare-fun b!1358296 () Bool)

(declare-fun e!770891 () Bool)

(assert (=> b!1358296 (= e!770891 (contains!9423 Nil!31711 (select (arr!44673 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1358297 () Bool)

(declare-fun e!770892 () Bool)

(assert (=> b!1358297 (= e!770892 e!770893)))

(declare-fun res!902973 () Bool)

(assert (=> b!1358297 (=> (not res!902973) (not e!770893))))

(assert (=> b!1358297 (= res!902973 (not e!770891))))

(declare-fun res!902971 () Bool)

(assert (=> b!1358297 (=> (not res!902971) (not e!770891))))

(assert (=> b!1358297 (= res!902971 (validKeyInArray!0 (select (arr!44673 a!3742) #b00000000000000000000000000000000)))))

(declare-fun d!145369 () Bool)

(declare-fun res!902972 () Bool)

(assert (=> d!145369 (=> res!902972 e!770892)))

(assert (=> d!145369 (= res!902972 (bvsge #b00000000000000000000000000000000 (size!45223 a!3742)))))

(assert (=> d!145369 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31711) e!770892)))

(declare-fun b!1358298 () Bool)

(assert (=> b!1358298 (= e!770894 call!65281)))

(declare-fun b!1358299 () Bool)

(assert (=> b!1358299 (= e!770894 call!65281)))

(assert (= (and d!145369 (not res!902972)) b!1358297))

(assert (= (and b!1358297 res!902971) b!1358296))

(assert (= (and b!1358297 res!902973) b!1358295))

(assert (= (and b!1358295 c!127102) b!1358298))

(assert (= (and b!1358295 (not c!127102)) b!1358299))

(assert (= (or b!1358298 b!1358299) bm!65278))

(declare-fun m!1243899 () Bool)

(assert (=> b!1358295 m!1243899))

(assert (=> b!1358295 m!1243899))

(declare-fun m!1243901 () Bool)

(assert (=> b!1358295 m!1243901))

(assert (=> bm!65278 m!1243899))

(declare-fun m!1243903 () Bool)

(assert (=> bm!65278 m!1243903))

(assert (=> b!1358296 m!1243899))

(assert (=> b!1358296 m!1243899))

(declare-fun m!1243905 () Bool)

(assert (=> b!1358296 m!1243905))

(assert (=> b!1358297 m!1243899))

(assert (=> b!1358297 m!1243899))

(assert (=> b!1358297 m!1243901))

(assert (=> b!1358191 d!145369))

(declare-fun d!145373 () Bool)

(declare-fun lt!599310 () Bool)

(assert (=> d!145373 (= lt!599310 (select (content!682 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!770895 () Bool)

(assert (=> d!145373 (= lt!599310 e!770895)))

(declare-fun res!902974 () Bool)

(assert (=> d!145373 (=> (not res!902974) (not e!770895))))

(assert (=> d!145373 (= res!902974 ((_ is Cons!31710) acc!759))))

(assert (=> d!145373 (= (contains!9423 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599310)))

(declare-fun b!1358300 () Bool)

(declare-fun e!770896 () Bool)

(assert (=> b!1358300 (= e!770895 e!770896)))

(declare-fun res!902975 () Bool)

(assert (=> b!1358300 (=> res!902975 e!770896)))

(assert (=> b!1358300 (= res!902975 (= (h!32919 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1358301 () Bool)

(assert (=> b!1358301 (= e!770896 (contains!9423 (t!46381 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145373 res!902974) b!1358300))

(assert (= (and b!1358300 (not res!902975)) b!1358301))

(assert (=> d!145373 m!1243861))

(declare-fun m!1243907 () Bool)

(assert (=> d!145373 m!1243907))

(declare-fun m!1243909 () Bool)

(assert (=> b!1358301 m!1243909))

(assert (=> b!1358192 d!145373))

(declare-fun d!145377 () Bool)

(declare-fun lt!599311 () Bool)

(assert (=> d!145377 (= lt!599311 (select (content!682 lt!599288) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!770897 () Bool)

(assert (=> d!145377 (= lt!599311 e!770897)))

(declare-fun res!902976 () Bool)

(assert (=> d!145377 (=> (not res!902976) (not e!770897))))

(assert (=> d!145377 (= res!902976 ((_ is Cons!31710) lt!599288))))

(assert (=> d!145377 (= (contains!9423 lt!599288 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599311)))

(declare-fun b!1358302 () Bool)

(declare-fun e!770898 () Bool)

(assert (=> b!1358302 (= e!770897 e!770898)))

(declare-fun res!902977 () Bool)

(assert (=> b!1358302 (=> res!902977 e!770898)))

(assert (=> b!1358302 (= res!902977 (= (h!32919 lt!599288) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1358303 () Bool)

(assert (=> b!1358303 (= e!770898 (contains!9423 (t!46381 lt!599288) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145377 res!902976) b!1358302))

(assert (= (and b!1358302 (not res!902977)) b!1358303))

(assert (=> d!145377 m!1243855))

(declare-fun m!1243911 () Bool)

(assert (=> d!145377 m!1243911))

(declare-fun m!1243913 () Bool)

(assert (=> b!1358303 m!1243913))

(assert (=> b!1358181 d!145377))

(check-sat (not b!1358288) (not b!1358283) (not d!145377) (not b!1358278) (not d!145347) (not d!145345) (not b!1358258) (not b!1358286) (not b!1358290) (not d!145353) (not b!1358297) (not b!1358265) (not b!1358292) (not b!1358296) (not b!1358289) (not b!1358264) (not b!1358301) (not bm!65276) (not b!1358276) (not b!1358287) (not b!1358295) (not b!1358303) (not b!1358247) (not bm!65278) (not b!1358291) (not b!1358259) (not bm!65277) (not d!145359) (not b!1358245) (not b!1358277) (not d!145373))
(check-sat)
