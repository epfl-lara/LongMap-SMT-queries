; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102016 () Bool)

(assert start!102016)

(declare-fun b!1228417 () Bool)

(declare-fun res!817037 () Bool)

(declare-fun e!697209 () Bool)

(assert (=> b!1228417 (=> (not res!817037) (not e!697209))))

(declare-datatypes ((List!27040 0))(
  ( (Nil!27037) (Cons!27036 (h!28245 (_ BitVec 64)) (t!40503 List!27040)) )
))
(declare-fun acc!823 () List!27040)

(declare-fun noDuplicate!1699 (List!27040) Bool)

(assert (=> b!1228417 (= res!817037 (noDuplicate!1699 acc!823))))

(declare-fun b!1228418 () Bool)

(declare-fun e!697211 () Bool)

(declare-datatypes ((array!79289 0))(
  ( (array!79290 (arr!38267 (Array (_ BitVec 32) (_ BitVec 64))) (size!38803 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79289)

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1228418 (= e!697211 (noDuplicate!1699 (Cons!27036 (select (arr!38267 a!3806) from!3184) Nil!27037)))))

(declare-fun b!1228419 () Bool)

(declare-fun res!817034 () Bool)

(assert (=> b!1228419 (=> (not res!817034) (not e!697209))))

(declare-fun arrayNoDuplicates!0 (array!79289 (_ BitVec 32) List!27040) Bool)

(assert (=> b!1228419 (= res!817034 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1228420 () Bool)

(declare-fun res!817038 () Bool)

(assert (=> b!1228420 (=> (not res!817038) (not e!697209))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79289 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1228420 (= res!817038 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1228421 () Bool)

(assert (=> b!1228421 (= e!697209 (not e!697211))))

(declare-fun res!817033 () Bool)

(assert (=> b!1228421 (=> res!817033 e!697211)))

(assert (=> b!1228421 (= res!817033 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1228421 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27037)))

(declare-datatypes ((Unit!40700 0))(
  ( (Unit!40701) )
))
(declare-fun lt!558996 () Unit!40700)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79289 List!27040 List!27040 (_ BitVec 32)) Unit!40700)

(assert (=> b!1228421 (= lt!558996 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27037 from!3184))))

(assert (=> b!1228421 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27036 (select (arr!38267 a!3806) from!3184) acc!823))))

(declare-fun res!817032 () Bool)

(assert (=> start!102016 (=> (not res!817032) (not e!697209))))

(assert (=> start!102016 (= res!817032 (bvslt (size!38803 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102016 e!697209))

(declare-fun array_inv!29115 (array!79289) Bool)

(assert (=> start!102016 (array_inv!29115 a!3806)))

(assert (=> start!102016 true))

(declare-fun b!1228422 () Bool)

(declare-fun res!817029 () Bool)

(assert (=> b!1228422 (=> (not res!817029) (not e!697209))))

(declare-fun contains!7102 (List!27040 (_ BitVec 64)) Bool)

(assert (=> b!1228422 (= res!817029 (not (contains!7102 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228423 () Bool)

(declare-fun res!817031 () Bool)

(assert (=> b!1228423 (=> (not res!817031) (not e!697209))))

(assert (=> b!1228423 (= res!817031 (not (contains!7102 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228424 () Bool)

(declare-fun res!817030 () Bool)

(assert (=> b!1228424 (=> (not res!817030) (not e!697209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1228424 (= res!817030 (validKeyInArray!0 k!2913))))

(declare-fun b!1228425 () Bool)

(declare-fun res!817036 () Bool)

(assert (=> b!1228425 (=> (not res!817036) (not e!697209))))

(assert (=> b!1228425 (= res!817036 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38803 a!3806)) (bvslt from!3184 (size!38803 a!3806))))))

(declare-fun b!1228426 () Bool)

(declare-fun res!817035 () Bool)

(assert (=> b!1228426 (=> (not res!817035) (not e!697209))))

(assert (=> b!1228426 (= res!817035 (validKeyInArray!0 (select (arr!38267 a!3806) from!3184)))))

(assert (= (and start!102016 res!817032) b!1228424))

(assert (= (and b!1228424 res!817030) b!1228425))

(assert (= (and b!1228425 res!817036) b!1228417))

(assert (= (and b!1228417 res!817037) b!1228422))

(assert (= (and b!1228422 res!817029) b!1228423))

(assert (= (and b!1228423 res!817031) b!1228420))

(assert (= (and b!1228420 res!817038) b!1228419))

(assert (= (and b!1228419 res!817034) b!1228426))

(assert (= (and b!1228426 res!817035) b!1228421))

(assert (= (and b!1228421 (not res!817033)) b!1228418))

(declare-fun m!1132959 () Bool)

(assert (=> start!102016 m!1132959))

(declare-fun m!1132961 () Bool)

(assert (=> b!1228419 m!1132961))

(declare-fun m!1132963 () Bool)

(assert (=> b!1228424 m!1132963))

(declare-fun m!1132965 () Bool)

(assert (=> b!1228426 m!1132965))

(assert (=> b!1228426 m!1132965))

(declare-fun m!1132967 () Bool)

(assert (=> b!1228426 m!1132967))

(declare-fun m!1132969 () Bool)

(assert (=> b!1228423 m!1132969))

(declare-fun m!1132971 () Bool)

(assert (=> b!1228422 m!1132971))

(declare-fun m!1132973 () Bool)

(assert (=> b!1228417 m!1132973))

(declare-fun m!1132975 () Bool)

(assert (=> b!1228421 m!1132975))

(declare-fun m!1132977 () Bool)

(assert (=> b!1228421 m!1132977))

(assert (=> b!1228421 m!1132965))

(declare-fun m!1132979 () Bool)

(assert (=> b!1228421 m!1132979))

(assert (=> b!1228418 m!1132965))

(declare-fun m!1132981 () Bool)

(assert (=> b!1228418 m!1132981))

(declare-fun m!1132983 () Bool)

(assert (=> b!1228420 m!1132983))

(push 1)

(assert (not b!1228423))

(assert (not start!102016))

(assert (not b!1228426))

(assert (not b!1228424))

(assert (not b!1228419))

(assert (not b!1228417))

(assert (not b!1228421))

(assert (not b!1228422))

(assert (not b!1228418))

(assert (not b!1228420))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!134209 () Bool)

(assert (=> d!134209 (= (validKeyInArray!0 (select (arr!38267 a!3806) from!3184)) (and (not (= (select (arr!38267 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38267 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1228426 d!134209))

(declare-fun d!134211 () Bool)

(declare-fun res!817116 () Bool)

(declare-fun e!697250 () Bool)

(assert (=> d!134211 (=> res!817116 e!697250)))

(assert (=> d!134211 (= res!817116 (= (select (arr!38267 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k!2913))))

(assert (=> d!134211 (= (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!697250)))

(declare-fun b!1228510 () Bool)

(declare-fun e!697251 () Bool)

(assert (=> b!1228510 (= e!697250 e!697251)))

(declare-fun res!817117 () Bool)

(assert (=> b!1228510 (=> (not res!817117) (not e!697251))))

(assert (=> b!1228510 (= res!817117 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38803 a!3806)))))

(declare-fun b!1228511 () Bool)

(assert (=> b!1228511 (= e!697251 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!134211 (not res!817116)) b!1228510))

(assert (= (and b!1228510 res!817117) b!1228511))

(declare-fun m!1133041 () Bool)

(assert (=> d!134211 m!1133041))

(declare-fun m!1133043 () Bool)

(assert (=> b!1228511 m!1133043))

(assert (=> b!1228420 d!134211))

(declare-fun e!697287 () Bool)

(declare-fun b!1228546 () Bool)

(assert (=> b!1228546 (= e!697287 (contains!7102 acc!823 (select (arr!38267 a!3806) from!3184)))))

(declare-fun b!1228547 () Bool)

(declare-fun e!697285 () Bool)

(declare-fun call!60814 () Bool)

(assert (=> b!1228547 (= e!697285 call!60814)))

(declare-fun c!120559 () Bool)

(declare-fun bm!60811 () Bool)

(assert (=> bm!60811 (= call!60814 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120559 (Cons!27036 (select (arr!38267 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun b!1228548 () Bool)

(declare-fun e!697286 () Bool)

(declare-fun e!697284 () Bool)

(assert (=> b!1228548 (= e!697286 e!697284)))

(declare-fun res!817150 () Bool)

(assert (=> b!1228548 (=> (not res!817150) (not e!697284))))

(assert (=> b!1228548 (= res!817150 (not e!697287))))

(declare-fun res!817148 () Bool)

(assert (=> b!1228548 (=> (not res!817148) (not e!697287))))

(assert (=> b!1228548 (= res!817148 (validKeyInArray!0 (select (arr!38267 a!3806) from!3184)))))

(declare-fun b!1228549 () Bool)

(assert (=> b!1228549 (= e!697285 call!60814)))

(declare-fun b!1228550 () Bool)

(assert (=> b!1228550 (= e!697284 e!697285)))

(assert (=> b!1228550 (= c!120559 (validKeyInArray!0 (select (arr!38267 a!3806) from!3184)))))

(declare-fun d!134217 () Bool)

(declare-fun res!817149 () Bool)

(assert (=> d!134217 (=> res!817149 e!697286)))

(assert (=> d!134217 (= res!817149 (bvsge from!3184 (size!38803 a!3806)))))

(assert (=> d!134217 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!697286)))

(assert (= (and d!134217 (not res!817149)) b!1228548))

(assert (= (and b!1228548 res!817148) b!1228546))

(assert (= (and b!1228548 res!817150) b!1228550))

(assert (= (and b!1228550 c!120559) b!1228549))

(assert (= (and b!1228550 (not c!120559)) b!1228547))

(assert (= (or b!1228549 b!1228547) bm!60811))

(assert (=> b!1228546 m!1132965))

(assert (=> b!1228546 m!1132965))

(declare-fun m!1133061 () Bool)

(assert (=> b!1228546 m!1133061))

(assert (=> bm!60811 m!1132965))

(declare-fun m!1133063 () Bool)

(assert (=> bm!60811 m!1133063))

(assert (=> b!1228548 m!1132965))

(assert (=> b!1228548 m!1132965))

(assert (=> b!1228548 m!1132967))

(assert (=> b!1228550 m!1132965))

(assert (=> b!1228550 m!1132965))

(assert (=> b!1228550 m!1132967))

(assert (=> b!1228419 d!134217))

(declare-fun d!134231 () Bool)

(assert (=> d!134231 (= (validKeyInArray!0 k!2913) (and (not (= k!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1228424 d!134231))

(declare-fun d!134233 () Bool)

(assert (=> d!134233 (= (array_inv!29115 a!3806) (bvsge (size!38803 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102016 d!134233))

(declare-fun d!134239 () Bool)

(declare-fun res!817168 () Bool)

(declare-fun e!697306 () Bool)

(assert (=> d!134239 (=> res!817168 e!697306)))

(assert (=> d!134239 (= res!817168 (is-Nil!27037 (Cons!27036 (select (arr!38267 a!3806) from!3184) Nil!27037)))))

(assert (=> d!134239 (= (noDuplicate!1699 (Cons!27036 (select (arr!38267 a!3806) from!3184) Nil!27037)) e!697306)))

(declare-fun b!1228570 () Bool)

(declare-fun e!697307 () Bool)

(assert (=> b!1228570 (= e!697306 e!697307)))

(declare-fun res!817169 () Bool)

(assert (=> b!1228570 (=> (not res!817169) (not e!697307))))

(assert (=> b!1228570 (= res!817169 (not (contains!7102 (t!40503 (Cons!27036 (select (arr!38267 a!3806) from!3184) Nil!27037)) (h!28245 (Cons!27036 (select (arr!38267 a!3806) from!3184) Nil!27037)))))))

(declare-fun b!1228571 () Bool)

(assert (=> b!1228571 (= e!697307 (noDuplicate!1699 (t!40503 (Cons!27036 (select (arr!38267 a!3806) from!3184) Nil!27037))))))

(assert (= (and d!134239 (not res!817168)) b!1228570))

(assert (= (and b!1228570 res!817169) b!1228571))

(declare-fun m!1133085 () Bool)

(assert (=> b!1228570 m!1133085))

(declare-fun m!1133087 () Bool)

(assert (=> b!1228571 m!1133087))

(assert (=> b!1228418 d!134239))

(declare-fun d!134245 () Bool)

(declare-fun lt!559016 () Bool)

(declare-fun content!555 (List!27040) (Set (_ BitVec 64)))

(assert (=> d!134245 (= lt!559016 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!555 acc!823)))))

(declare-fun e!697323 () Bool)

(assert (=> d!134245 (= lt!559016 e!697323)))

(declare-fun res!817184 () Bool)

(assert (=> d!134245 (=> (not res!817184) (not e!697323))))

(assert (=> d!134245 (= res!817184 (is-Cons!27036 acc!823))))

(assert (=> d!134245 (= (contains!7102 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559016)))

(declare-fun b!1228587 () Bool)

(declare-fun e!697322 () Bool)

(assert (=> b!1228587 (= e!697323 e!697322)))

(declare-fun res!817183 () Bool)

(assert (=> b!1228587 (=> res!817183 e!697322)))

(assert (=> b!1228587 (= res!817183 (= (h!28245 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228588 () Bool)

(assert (=> b!1228588 (= e!697322 (contains!7102 (t!40503 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134245 res!817184) b!1228587))

(assert (= (and b!1228587 (not res!817183)) b!1228588))

(declare-fun m!1133109 () Bool)

(assert (=> d!134245 m!1133109))

(declare-fun m!1133111 () Bool)

(assert (=> d!134245 m!1133111))

(declare-fun m!1133113 () Bool)

(assert (=> b!1228588 m!1133113))

(assert (=> b!1228423 d!134245))

(declare-fun d!134257 () Bool)

(declare-fun res!817185 () Bool)

(declare-fun e!697324 () Bool)

(assert (=> d!134257 (=> res!817185 e!697324)))

(assert (=> d!134257 (= res!817185 (is-Nil!27037 acc!823))))

(assert (=> d!134257 (= (noDuplicate!1699 acc!823) e!697324)))

(declare-fun b!1228589 () Bool)

(declare-fun e!697325 () Bool)

(assert (=> b!1228589 (= e!697324 e!697325)))

(declare-fun res!817186 () Bool)

(assert (=> b!1228589 (=> (not res!817186) (not e!697325))))

(assert (=> b!1228589 (= res!817186 (not (contains!7102 (t!40503 acc!823) (h!28245 acc!823))))))

(declare-fun b!1228590 () Bool)

(assert (=> b!1228590 (= e!697325 (noDuplicate!1699 (t!40503 acc!823)))))

(assert (= (and d!134257 (not res!817185)) b!1228589))

(assert (= (and b!1228589 res!817186) b!1228590))

(declare-fun m!1133115 () Bool)

(assert (=> b!1228589 m!1133115))

(declare-fun m!1133117 () Bool)

(assert (=> b!1228590 m!1133117))

(assert (=> b!1228417 d!134257))

(declare-fun d!134259 () Bool)

(declare-fun lt!559017 () Bool)

(assert (=> d!134259 (= lt!559017 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!555 acc!823)))))

(declare-fun e!697333 () Bool)

(assert (=> d!134259 (= lt!559017 e!697333)))

(declare-fun res!817194 () Bool)

(assert (=> d!134259 (=> (not res!817194) (not e!697333))))

(assert (=> d!134259 (= res!817194 (is-Cons!27036 acc!823))))

(assert (=> d!134259 (= (contains!7102 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559017)))

(declare-fun b!1228593 () Bool)

(declare-fun e!697330 () Bool)

(assert (=> b!1228593 (= e!697333 e!697330)))

(declare-fun res!817193 () Bool)

(assert (=> b!1228593 (=> res!817193 e!697330)))

(assert (=> b!1228593 (= res!817193 (= (h!28245 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228594 () Bool)

(assert (=> b!1228594 (= e!697330 (contains!7102 (t!40503 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134259 res!817194) b!1228593))

(assert (= (and b!1228593 (not res!817193)) b!1228594))

(assert (=> d!134259 m!1133109))

(declare-fun m!1133119 () Bool)

(assert (=> d!134259 m!1133119))

(declare-fun m!1133121 () Bool)

(assert (=> b!1228594 m!1133121))

(assert (=> b!1228422 d!134259))

(declare-fun b!1228603 () Bool)

(declare-fun e!697339 () Bool)

(assert (=> b!1228603 (= e!697339 (contains!7102 Nil!27037 (select (arr!38267 a!3806) from!3184)))))

(declare-fun b!1228604 () Bool)

(declare-fun e!697337 () Bool)

(declare-fun call!60819 () Bool)

(assert (=> b!1228604 (= e!697337 call!60819)))

(declare-fun c!120564 () Bool)

(declare-fun bm!60814 () Bool)

(assert (=> bm!60814 (= call!60819 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120564 (Cons!27036 (select (arr!38267 a!3806) from!3184) Nil!27037) Nil!27037)))))

(declare-fun b!1228605 () Bool)

(declare-fun e!697338 () Bool)

(declare-fun e!697336 () Bool)

(assert (=> b!1228605 (= e!697338 e!697336)))

(declare-fun res!817197 () Bool)

(assert (=> b!1228605 (=> (not res!817197) (not e!697336))))

(assert (=> b!1228605 (= res!817197 (not e!697339))))

(declare-fun res!817195 () Bool)

(assert (=> b!1228605 (=> (not res!817195) (not e!697339))))

(assert (=> b!1228605 (= res!817195 (validKeyInArray!0 (select (arr!38267 a!3806) from!3184)))))

(declare-fun b!1228606 () Bool)

(assert (=> b!1228606 (= e!697337 call!60819)))

(declare-fun b!1228607 () Bool)

(assert (=> b!1228607 (= e!697336 e!697337)))

(assert (=> b!1228607 (= c!120564 (validKeyInArray!0 (select (arr!38267 a!3806) from!3184)))))

(declare-fun d!134261 () Bool)

(declare-fun res!817196 () Bool)

(assert (=> d!134261 (=> res!817196 e!697338)))

(assert (=> d!134261 (= res!817196 (bvsge from!3184 (size!38803 a!3806)))))

(assert (=> d!134261 (= (arrayNoDuplicates!0 a!3806 from!3184 Nil!27037) e!697338)))

(assert (= (and d!134261 (not res!817196)) b!1228605))

(assert (= (and b!1228605 res!817195) b!1228603))

(assert (= (and b!1228605 res!817197) b!1228607))

(assert (= (and b!1228607 c!120564) b!1228606))

(assert (= (and b!1228607 (not c!120564)) b!1228604))

(assert (= (or b!1228606 b!1228604) bm!60814))

(assert (=> b!1228603 m!1132965))

(assert (=> b!1228603 m!1132965))

(declare-fun m!1133123 () Bool)

(assert (=> b!1228603 m!1133123))

(assert (=> bm!60814 m!1132965))

(declare-fun m!1133125 () Bool)

(assert (=> bm!60814 m!1133125))

(assert (=> b!1228605 m!1132965))

(assert (=> b!1228605 m!1132965))

(assert (=> b!1228605 m!1132967))

(assert (=> b!1228607 m!1132965))

(assert (=> b!1228607 m!1132965))

(assert (=> b!1228607 m!1132967))

(assert (=> b!1228421 d!134261))

(declare-fun d!134263 () Bool)

(assert (=> d!134263 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27037)))

(declare-fun lt!559020 () Unit!40700)

(declare-fun choose!80 (array!79289 List!27040 List!27040 (_ BitVec 32)) Unit!40700)

(assert (=> d!134263 (= lt!559020 (choose!80 a!3806 acc!823 Nil!27037 from!3184))))

(assert (=> d!134263 (bvslt (size!38803 a!3806) #b01111111111111111111111111111111)))

(assert (=> d!134263 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27037 from!3184) lt!559020)))

(declare-fun bs!34534 () Bool)

(assert (= bs!34534 d!134263))

(assert (=> bs!34534 m!1132975))

(declare-fun m!1133133 () Bool)

(assert (=> bs!34534 m!1133133))

(assert (=> b!1228421 d!134263))

(declare-fun b!1228618 () Bool)

(declare-fun e!697351 () Bool)

(assert (=> b!1228618 (= e!697351 (contains!7102 (Cons!27036 (select (arr!38267 a!3806) from!3184) acc!823) (select (arr!38267 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1228619 () Bool)

(declare-fun e!697349 () Bool)

(declare-fun call!60822 () Bool)

(assert (=> b!1228619 (= e!697349 call!60822)))

(declare-fun c!120567 () Bool)

(declare-fun bm!60819 () Bool)

(assert (=> bm!60819 (= call!60822 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120567 (Cons!27036 (select (arr!38267 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27036 (select (arr!38267 a!3806) from!3184) acc!823)) (Cons!27036 (select (arr!38267 a!3806) from!3184) acc!823))))))

(declare-fun b!1228620 () Bool)

(declare-fun e!697350 () Bool)

(declare-fun e!697348 () Bool)

(assert (=> b!1228620 (= e!697350 e!697348)))

(declare-fun res!817206 () Bool)

(assert (=> b!1228620 (=> (not res!817206) (not e!697348))))

(assert (=> b!1228620 (= res!817206 (not e!697351))))

(declare-fun res!817204 () Bool)

(assert (=> b!1228620 (=> (not res!817204) (not e!697351))))

(assert (=> b!1228620 (= res!817204 (validKeyInArray!0 (select (arr!38267 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1228621 () Bool)

(assert (=> b!1228621 (= e!697349 call!60822)))

(declare-fun b!1228622 () Bool)

(assert (=> b!1228622 (= e!697348 e!697349)))

(assert (=> b!1228622 (= c!120567 (validKeyInArray!0 (select (arr!38267 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun d!134267 () Bool)

(declare-fun res!817205 () Bool)

(assert (=> d!134267 (=> res!817205 e!697350)))

(assert (=> d!134267 (= res!817205 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38803 a!3806)))))

(assert (=> d!134267 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27036 (select (arr!38267 a!3806) from!3184) acc!823)) e!697350)))

(assert (= (and d!134267 (not res!817205)) b!1228620))

(assert (= (and b!1228620 res!817204) b!1228618))

(assert (= (and b!1228620 res!817206) b!1228622))

(assert (= (and b!1228622 c!120567) b!1228621))

(assert (= (and b!1228622 (not c!120567)) b!1228619))

(assert (= (or b!1228621 b!1228619) bm!60819))

(assert (=> b!1228618 m!1133041))

(assert (=> b!1228618 m!1133041))

(declare-fun m!1133137 () Bool)

(assert (=> b!1228618 m!1133137))

(assert (=> bm!60819 m!1133041))

(declare-fun m!1133139 () Bool)

(assert (=> bm!60819 m!1133139))

(assert (=> b!1228620 m!1133041))

(assert (=> b!1228620 m!1133041))

(declare-fun m!1133141 () Bool)

(assert (=> b!1228620 m!1133141))

(assert (=> b!1228622 m!1133041))

(assert (=> b!1228622 m!1133041))

(assert (=> b!1228622 m!1133141))

(assert (=> b!1228421 d!134267))

(push 1)

(assert (not b!1228511))

(assert (not bm!60811))

(assert (not b!1228607))

(assert (not b!1228622))

(assert (not d!134245))

(assert (not d!134263))

(assert (not b!1228620))

(assert (not b!1228546))

(assert (not b!1228550))

(assert (not b!1228589))

(assert (not bm!60814))

(assert (not b!1228570))

(assert (not b!1228588))

(assert (not b!1228603))

(assert (not d!134259))

(assert (not b!1228618))

(assert (not b!1228590))

(assert (not b!1228548))

(assert (not b!1228594))

(assert (not b!1228571))

(assert (not bm!60819))

(assert (not b!1228605))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!134307 () Bool)

(declare-fun c!120577 () Bool)

(assert (=> d!134307 (= c!120577 (is-Nil!27037 acc!823))))

(declare-fun e!697393 () (Set (_ BitVec 64)))

(assert (=> d!134307 (= (content!555 acc!823) e!697393)))

(declare-fun b!1228673 () Bool)

(assert (=> b!1228673 (= e!697393 (as set.empty (Set (_ BitVec 64))))))

(declare-fun b!1228674 () Bool)

(assert (=> b!1228674 (= e!697393 (set.union (set.insert (h!28245 acc!823) (as set.empty (Set (_ BitVec 64)))) (content!555 (t!40503 acc!823))))))

(assert (= (and d!134307 c!120577) b!1228673))

(assert (= (and d!134307 (not c!120577)) b!1228674))

(declare-fun m!1133219 () Bool)

(assert (=> b!1228674 m!1133219))

(declare-fun m!1133221 () Bool)

(assert (=> b!1228674 m!1133221))

(assert (=> d!134259 d!134307))

(declare-fun d!134309 () Bool)

(assert (=> d!134309 (= (validKeyInArray!0 (select (arr!38267 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))) (and (not (= (select (arr!38267 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38267 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1228620 d!134309))

(declare-fun d!134311 () Bool)

(declare-fun lt!559031 () Bool)

(assert (=> d!134311 (= lt!559031 (set.member (select (arr!38267 a!3806) from!3184) (content!555 acc!823)))))

(declare-fun e!697395 () Bool)

(assert (=> d!134311 (= lt!559031 e!697395)))

(declare-fun res!817240 () Bool)

(assert (=> d!134311 (=> (not res!817240) (not e!697395))))

(assert (=> d!134311 (= res!817240 (is-Cons!27036 acc!823))))

(assert (=> d!134311 (= (contains!7102 acc!823 (select (arr!38267 a!3806) from!3184)) lt!559031)))

(declare-fun b!1228675 () Bool)

(declare-fun e!697394 () Bool)

(assert (=> b!1228675 (= e!697395 e!697394)))

(declare-fun res!817239 () Bool)

(assert (=> b!1228675 (=> res!817239 e!697394)))

(assert (=> b!1228675 (= res!817239 (= (h!28245 acc!823) (select (arr!38267 a!3806) from!3184)))))

(declare-fun b!1228676 () Bool)

(assert (=> b!1228676 (= e!697394 (contains!7102 (t!40503 acc!823) (select (arr!38267 a!3806) from!3184)))))

(assert (= (and d!134311 res!817240) b!1228675))

(assert (= (and b!1228675 (not res!817239)) b!1228676))

(assert (=> d!134311 m!1133109))

(assert (=> d!134311 m!1132965))

(declare-fun m!1133223 () Bool)

(assert (=> d!134311 m!1133223))

(assert (=> b!1228676 m!1132965))

(declare-fun m!1133225 () Bool)

(assert (=> b!1228676 m!1133225))

(assert (=> b!1228546 d!134311))

(declare-fun b!1228677 () Bool)

(declare-fun e!697399 () Bool)

(assert (=> b!1228677 (= e!697399 (contains!7102 (ite c!120567 (Cons!27036 (select (arr!38267 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27036 (select (arr!38267 a!3806) from!3184) acc!823)) (Cons!27036 (select (arr!38267 a!3806) from!3184) acc!823)) (select (arr!38267 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1228678 () Bool)

(declare-fun e!697397 () Bool)

(declare-fun call!60827 () Bool)

(assert (=> b!1228678 (= e!697397 call!60827)))

(declare-fun bm!60824 () Bool)

(declare-fun c!120578 () Bool)

(assert (=> bm!60824 (= call!60827 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!120578 (Cons!27036 (select (arr!38267 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) (ite c!120567 (Cons!27036 (select (arr!38267 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27036 (select (arr!38267 a!3806) from!3184) acc!823)) (Cons!27036 (select (arr!38267 a!3806) from!3184) acc!823))) (ite c!120567 (Cons!27036 (select (arr!38267 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27036 (select (arr!38267 a!3806) from!3184) acc!823)) (Cons!27036 (select (arr!38267 a!3806) from!3184) acc!823)))))))

(declare-fun b!1228679 () Bool)

(declare-fun e!697398 () Bool)

(declare-fun e!697396 () Bool)

(assert (=> b!1228679 (= e!697398 e!697396)))

(declare-fun res!817243 () Bool)

(assert (=> b!1228679 (=> (not res!817243) (not e!697396))))

(assert (=> b!1228679 (= res!817243 (not e!697399))))

(declare-fun res!817241 () Bool)

(assert (=> b!1228679 (=> (not res!817241) (not e!697399))))

(assert (=> b!1228679 (= res!817241 (validKeyInArray!0 (select (arr!38267 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1228680 () Bool)

(assert (=> b!1228680 (= e!697397 call!60827)))

(declare-fun b!1228681 () Bool)

(assert (=> b!1228681 (= e!697396 e!697397)))

(assert (=> b!1228681 (= c!120578 (validKeyInArray!0 (select (arr!38267 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun d!134313 () Bool)

(declare-fun res!817242 () Bool)

(assert (=> d!134313 (=> res!817242 e!697398)))

(assert (=> d!134313 (= res!817242 (bvsge (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38803 a!3806)))))

(assert (=> d!134313 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120567 (Cons!27036 (select (arr!38267 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27036 (select (arr!38267 a!3806) from!3184) acc!823)) (Cons!27036 (select (arr!38267 a!3806) from!3184) acc!823))) e!697398)))

(assert (= (and d!134313 (not res!817242)) b!1228679))

(assert (= (and b!1228679 res!817241) b!1228677))

(assert (= (and b!1228679 res!817243) b!1228681))

(assert (= (and b!1228681 c!120578) b!1228680))

(assert (= (and b!1228681 (not c!120578)) b!1228678))

(assert (= (or b!1228680 b!1228678) bm!60824))

(declare-fun m!1133227 () Bool)

(assert (=> b!1228677 m!1133227))

(assert (=> b!1228677 m!1133227))

(declare-fun m!1133229 () Bool)

(assert (=> b!1228677 m!1133229))

(assert (=> bm!60824 m!1133227))

(declare-fun m!1133231 () Bool)

(assert (=> bm!60824 m!1133231))

(assert (=> b!1228679 m!1133227))

(assert (=> b!1228679 m!1133227))

(declare-fun m!1133233 () Bool)

(assert (=> b!1228679 m!1133233))

(assert (=> b!1228681 m!1133227))

(assert (=> b!1228681 m!1133227))

(assert (=> b!1228681 m!1133233))

(assert (=> bm!60819 d!134313))

(declare-fun d!134315 () Bool)

(declare-fun res!817244 () Bool)

(declare-fun e!697400 () Bool)

(assert (=> d!134315 (=> res!817244 e!697400)))

(assert (=> d!134315 (= res!817244 (= (select (arr!38267 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) k!2913))))

(assert (=> d!134315 (= (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) e!697400)))

(declare-fun b!1228682 () Bool)

(declare-fun e!697401 () Bool)

(assert (=> b!1228682 (= e!697400 e!697401)))

(declare-fun res!817245 () Bool)

(assert (=> b!1228682 (=> (not res!817245) (not e!697401))))

(assert (=> b!1228682 (= res!817245 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!38803 a!3806)))))

(declare-fun b!1228683 () Bool)

(assert (=> b!1228683 (= e!697401 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!134315 (not res!817244)) b!1228682))

(assert (= (and b!1228682 res!817245) b!1228683))

(assert (=> d!134315 m!1133227))

(declare-fun m!1133235 () Bool)

(assert (=> b!1228683 m!1133235))

(assert (=> b!1228511 d!134315))

(declare-fun d!134317 () Bool)

(declare-fun lt!559032 () Bool)

(assert (=> d!134317 (= lt!559032 (set.member (h!28245 (Cons!27036 (select (arr!38267 a!3806) from!3184) Nil!27037)) (content!555 (t!40503 (Cons!27036 (select (arr!38267 a!3806) from!3184) Nil!27037)))))))

(declare-fun e!697403 () Bool)

(assert (=> d!134317 (= lt!559032 e!697403)))

(declare-fun res!817247 () Bool)

(assert (=> d!134317 (=> (not res!817247) (not e!697403))))

(assert (=> d!134317 (= res!817247 (is-Cons!27036 (t!40503 (Cons!27036 (select (arr!38267 a!3806) from!3184) Nil!27037))))))

(assert (=> d!134317 (= (contains!7102 (t!40503 (Cons!27036 (select (arr!38267 a!3806) from!3184) Nil!27037)) (h!28245 (Cons!27036 (select (arr!38267 a!3806) from!3184) Nil!27037))) lt!559032)))

(declare-fun b!1228684 () Bool)

(declare-fun e!697402 () Bool)

(assert (=> b!1228684 (= e!697403 e!697402)))

(declare-fun res!817246 () Bool)

(assert (=> b!1228684 (=> res!817246 e!697402)))

(assert (=> b!1228684 (= res!817246 (= (h!28245 (t!40503 (Cons!27036 (select (arr!38267 a!3806) from!3184) Nil!27037))) (h!28245 (Cons!27036 (select (arr!38267 a!3806) from!3184) Nil!27037))))))

(declare-fun b!1228685 () Bool)

(assert (=> b!1228685 (= e!697402 (contains!7102 (t!40503 (t!40503 (Cons!27036 (select (arr!38267 a!3806) from!3184) Nil!27037))) (h!28245 (Cons!27036 (select (arr!38267 a!3806) from!3184) Nil!27037))))))

(assert (= (and d!134317 res!817247) b!1228684))

(assert (= (and b!1228684 (not res!817246)) b!1228685))

(declare-fun m!1133237 () Bool)

(assert (=> d!134317 m!1133237))

(declare-fun m!1133239 () Bool)

(assert (=> d!134317 m!1133239))

(declare-fun m!1133241 () Bool)

(assert (=> b!1228685 m!1133241))

(assert (=> b!1228570 d!134317))

(declare-fun d!134319 () Bool)

(declare-fun lt!559033 () Bool)

(assert (=> d!134319 (= lt!559033 (set.member (select (arr!38267 a!3806) from!3184) (content!555 Nil!27037)))))

(declare-fun e!697405 () Bool)

(assert (=> d!134319 (= lt!559033 e!697405)))

(declare-fun res!817249 () Bool)

(assert (=> d!134319 (=> (not res!817249) (not e!697405))))

(assert (=> d!134319 (= res!817249 (is-Cons!27036 Nil!27037))))

(assert (=> d!134319 (= (contains!7102 Nil!27037 (select (arr!38267 a!3806) from!3184)) lt!559033)))

(declare-fun b!1228686 () Bool)

(declare-fun e!697404 () Bool)

(assert (=> b!1228686 (= e!697405 e!697404)))

(declare-fun res!817248 () Bool)

(assert (=> b!1228686 (=> res!817248 e!697404)))

(assert (=> b!1228686 (= res!817248 (= (h!28245 Nil!27037) (select (arr!38267 a!3806) from!3184)))))

(declare-fun b!1228687 () Bool)

(assert (=> b!1228687 (= e!697404 (contains!7102 (t!40503 Nil!27037) (select (arr!38267 a!3806) from!3184)))))

(assert (= (and d!134319 res!817249) b!1228686))

(assert (= (and b!1228686 (not res!817248)) b!1228687))

(declare-fun m!1133243 () Bool)

(assert (=> d!134319 m!1133243))

(assert (=> d!134319 m!1132965))

(declare-fun m!1133245 () Bool)

(assert (=> d!134319 m!1133245))

(assert (=> b!1228687 m!1132965))

(declare-fun m!1133247 () Bool)

(assert (=> b!1228687 m!1133247))

(assert (=> b!1228603 d!134319))

(assert (=> b!1228548 d!134209))

(assert (=> b!1228622 d!134309))

(declare-fun b!1228688 () Bool)

(declare-fun e!697409 () Bool)

(assert (=> b!1228688 (= e!697409 (contains!7102 (ite c!120559 (Cons!27036 (select (arr!38267 a!3806) from!3184) acc!823) acc!823) (select (arr!38267 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1228689 () Bool)

(declare-fun e!697407 () Bool)

(declare-fun call!60828 () Bool)

(assert (=> b!1228689 (= e!697407 call!60828)))

(declare-fun bm!60825 () Bool)

(declare-fun c!120579 () Bool)

(assert (=> bm!60825 (= call!60828 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!120579 (Cons!27036 (select (arr!38267 a!3806) (bvadd from!3184 #b00000000000000000000000000000001)) (ite c!120559 (Cons!27036 (select (arr!38267 a!3806) from!3184) acc!823) acc!823)) (ite c!120559 (Cons!27036 (select (arr!38267 a!3806) from!3184) acc!823) acc!823))))))

(declare-fun b!1228690 () Bool)

(declare-fun e!697408 () Bool)

