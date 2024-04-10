; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115990 () Bool)

(assert start!115990)

(declare-fun b!1370647 () Bool)

(declare-fun res!914081 () Bool)

(declare-fun e!776391 () Bool)

(assert (=> b!1370647 (=> (not res!914081) (not e!776391))))

(declare-datatypes ((List!31999 0))(
  ( (Nil!31996) (Cons!31995 (h!33204 (_ BitVec 64)) (t!46693 List!31999)) )
))
(declare-fun acc!866 () List!31999)

(declare-fun noDuplicate!2538 (List!31999) Bool)

(assert (=> b!1370647 (= res!914081 (noDuplicate!2538 acc!866))))

(declare-fun b!1370648 () Bool)

(declare-fun res!914080 () Bool)

(declare-fun e!776389 () Bool)

(assert (=> b!1370648 (=> (not res!914080) (not e!776389))))

(declare-datatypes ((array!93026 0))(
  ( (array!93027 (arr!44931 (Array (_ BitVec 32) (_ BitVec 64))) (size!45481 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93026)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1370648 (= res!914080 (validKeyInArray!0 (select (arr!44931 a!3861) from!3239)))))

(declare-fun b!1370649 () Bool)

(declare-fun res!914076 () Bool)

(declare-fun e!776392 () Bool)

(assert (=> b!1370649 (=> (not res!914076) (not e!776392))))

(declare-fun lt!602483 () List!31999)

(assert (=> b!1370649 (= res!914076 (noDuplicate!2538 lt!602483))))

(declare-fun b!1370650 () Bool)

(declare-fun res!914084 () Bool)

(assert (=> b!1370650 (=> (not res!914084) (not e!776392))))

(declare-fun contains!9681 (List!31999 (_ BitVec 64)) Bool)

(assert (=> b!1370650 (= res!914084 (not (contains!9681 lt!602483 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370651 () Bool)

(declare-fun res!914078 () Bool)

(assert (=> b!1370651 (=> (not res!914078) (not e!776391))))

(assert (=> b!1370651 (= res!914078 (not (contains!9681 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370652 () Bool)

(assert (=> b!1370652 (= e!776389 e!776392)))

(declare-fun res!914079 () Bool)

(assert (=> b!1370652 (=> (not res!914079) (not e!776392))))

(assert (=> b!1370652 (= res!914079 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun newAcc!98 () List!31999)

(declare-fun lt!602484 () List!31999)

(assert (=> b!1370652 (= lt!602484 (Cons!31995 (select (arr!44931 a!3861) from!3239) newAcc!98))))

(assert (=> b!1370652 (= lt!602483 (Cons!31995 (select (arr!44931 a!3861) from!3239) acc!866))))

(declare-fun b!1370653 () Bool)

(declare-fun res!914085 () Bool)

(assert (=> b!1370653 (=> (not res!914085) (not e!776391))))

(assert (=> b!1370653 (= res!914085 (not (contains!9681 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370654 () Bool)

(declare-fun res!914083 () Bool)

(assert (=> b!1370654 (=> (not res!914083) (not e!776391))))

(declare-fun subseq!1083 (List!31999 List!31999) Bool)

(assert (=> b!1370654 (= res!914083 (subseq!1083 newAcc!98 acc!866))))

(declare-fun b!1370655 () Bool)

(declare-fun e!776388 () Bool)

(assert (=> b!1370655 (= e!776392 e!776388)))

(declare-fun res!914075 () Bool)

(assert (=> b!1370655 (=> res!914075 e!776388)))

(assert (=> b!1370655 (= res!914075 (contains!9681 lt!602484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370656 () Bool)

(declare-fun res!914071 () Bool)

(assert (=> b!1370656 (=> (not res!914071) (not e!776389))))

(assert (=> b!1370656 (= res!914071 (bvslt from!3239 (size!45481 a!3861)))))

(declare-fun b!1370657 () Bool)

(declare-fun res!914072 () Bool)

(assert (=> b!1370657 (=> (not res!914072) (not e!776392))))

(assert (=> b!1370657 (= res!914072 (not (contains!9681 lt!602483 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370658 () Bool)

(declare-fun res!914086 () Bool)

(assert (=> b!1370658 (=> (not res!914086) (not e!776391))))

(assert (=> b!1370658 (= res!914086 (not (contains!9681 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370659 () Bool)

(declare-fun res!914077 () Bool)

(assert (=> b!1370659 (=> (not res!914077) (not e!776391))))

(assert (=> b!1370659 (= res!914077 (not (contains!9681 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370660 () Bool)

(declare-fun res!914074 () Bool)

(assert (=> b!1370660 (=> (not res!914074) (not e!776389))))

(assert (=> b!1370660 (= res!914074 (not (contains!9681 acc!866 (select (arr!44931 a!3861) from!3239))))))

(declare-fun b!1370661 () Bool)

(assert (=> b!1370661 (= e!776388 (contains!9681 lt!602484 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!914073 () Bool)

(assert (=> start!115990 (=> (not res!914073) (not e!776391))))

(assert (=> start!115990 (= res!914073 (and (bvslt (size!45481 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45481 a!3861))))))

(assert (=> start!115990 e!776391))

(declare-fun array_inv!33959 (array!93026) Bool)

(assert (=> start!115990 (array_inv!33959 a!3861)))

(assert (=> start!115990 true))

(declare-fun b!1370662 () Bool)

(assert (=> b!1370662 (= e!776391 e!776389)))

(declare-fun res!914082 () Bool)

(assert (=> b!1370662 (=> (not res!914082) (not e!776389))))

(declare-fun arrayNoDuplicates!0 (array!93026 (_ BitVec 32) List!31999) Bool)

(assert (=> b!1370662 (= res!914082 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45299 0))(
  ( (Unit!45300) )
))
(declare-fun lt!602485 () Unit!45299)

(declare-fun noDuplicateSubseq!270 (List!31999 List!31999) Unit!45299)

(assert (=> b!1370662 (= lt!602485 (noDuplicateSubseq!270 newAcc!98 acc!866))))

(assert (= (and start!115990 res!914073) b!1370647))

(assert (= (and b!1370647 res!914081) b!1370658))

(assert (= (and b!1370658 res!914086) b!1370651))

(assert (= (and b!1370651 res!914078) b!1370653))

(assert (= (and b!1370653 res!914085) b!1370659))

(assert (= (and b!1370659 res!914077) b!1370654))

(assert (= (and b!1370654 res!914083) b!1370662))

(assert (= (and b!1370662 res!914082) b!1370656))

(assert (= (and b!1370656 res!914071) b!1370648))

(assert (= (and b!1370648 res!914080) b!1370660))

(assert (= (and b!1370660 res!914074) b!1370652))

(assert (= (and b!1370652 res!914079) b!1370649))

(assert (= (and b!1370649 res!914076) b!1370650))

(assert (= (and b!1370650 res!914084) b!1370657))

(assert (= (and b!1370657 res!914072) b!1370655))

(assert (= (and b!1370655 (not res!914075)) b!1370661))

(declare-fun m!1254173 () Bool)

(assert (=> b!1370655 m!1254173))

(declare-fun m!1254175 () Bool)

(assert (=> b!1370657 m!1254175))

(declare-fun m!1254177 () Bool)

(assert (=> b!1370652 m!1254177))

(declare-fun m!1254179 () Bool)

(assert (=> b!1370662 m!1254179))

(declare-fun m!1254181 () Bool)

(assert (=> b!1370662 m!1254181))

(declare-fun m!1254183 () Bool)

(assert (=> b!1370659 m!1254183))

(declare-fun m!1254185 () Bool)

(assert (=> b!1370658 m!1254185))

(declare-fun m!1254187 () Bool)

(assert (=> start!115990 m!1254187))

(declare-fun m!1254189 () Bool)

(assert (=> b!1370649 m!1254189))

(declare-fun m!1254191 () Bool)

(assert (=> b!1370651 m!1254191))

(assert (=> b!1370660 m!1254177))

(assert (=> b!1370660 m!1254177))

(declare-fun m!1254193 () Bool)

(assert (=> b!1370660 m!1254193))

(declare-fun m!1254195 () Bool)

(assert (=> b!1370650 m!1254195))

(assert (=> b!1370648 m!1254177))

(assert (=> b!1370648 m!1254177))

(declare-fun m!1254197 () Bool)

(assert (=> b!1370648 m!1254197))

(declare-fun m!1254199 () Bool)

(assert (=> b!1370661 m!1254199))

(declare-fun m!1254201 () Bool)

(assert (=> b!1370653 m!1254201))

(declare-fun m!1254203 () Bool)

(assert (=> b!1370654 m!1254203))

(declare-fun m!1254205 () Bool)

(assert (=> b!1370647 m!1254205))

(check-sat (not b!1370654) (not b!1370649) (not b!1370661) (not b!1370650) (not b!1370655) (not b!1370648) (not b!1370658) (not b!1370662) (not b!1370653) (not start!115990) (not b!1370660) (not b!1370659) (not b!1370647) (not b!1370651) (not b!1370657))
(check-sat)
(get-model)

(declare-fun d!147241 () Bool)

(assert (=> d!147241 (= (validKeyInArray!0 (select (arr!44931 a!3861) from!3239)) (and (not (= (select (arr!44931 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44931 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1370648 d!147241))

(declare-fun d!147245 () Bool)

(declare-fun lt!602497 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!732 (List!31999) (InoxSet (_ BitVec 64)))

(assert (=> d!147245 (= lt!602497 (select (content!732 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776425 () Bool)

(assert (=> d!147245 (= lt!602497 e!776425)))

(declare-fun res!914151 () Bool)

(assert (=> d!147245 (=> (not res!914151) (not e!776425))))

(get-info :version)

(assert (=> d!147245 (= res!914151 ((_ is Cons!31995) newAcc!98))))

(assert (=> d!147245 (= (contains!9681 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602497)))

(declare-fun b!1370727 () Bool)

(declare-fun e!776424 () Bool)

(assert (=> b!1370727 (= e!776425 e!776424)))

(declare-fun res!914152 () Bool)

(assert (=> b!1370727 (=> res!914152 e!776424)))

(assert (=> b!1370727 (= res!914152 (= (h!33204 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370728 () Bool)

(assert (=> b!1370728 (= e!776424 (contains!9681 (t!46693 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147245 res!914151) b!1370727))

(assert (= (and b!1370727 (not res!914152)) b!1370728))

(declare-fun m!1254245 () Bool)

(assert (=> d!147245 m!1254245))

(declare-fun m!1254247 () Bool)

(assert (=> d!147245 m!1254247))

(declare-fun m!1254249 () Bool)

(assert (=> b!1370728 m!1254249))

(assert (=> b!1370659 d!147245))

(declare-fun d!147249 () Bool)

(assert (=> d!147249 (= (array_inv!33959 a!3861) (bvsge (size!45481 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!115990 d!147249))

(declare-fun d!147251 () Bool)

(declare-fun res!914161 () Bool)

(declare-fun e!776434 () Bool)

(assert (=> d!147251 (=> res!914161 e!776434)))

(assert (=> d!147251 (= res!914161 ((_ is Nil!31996) lt!602483))))

(assert (=> d!147251 (= (noDuplicate!2538 lt!602483) e!776434)))

(declare-fun b!1370737 () Bool)

(declare-fun e!776435 () Bool)

(assert (=> b!1370737 (= e!776434 e!776435)))

(declare-fun res!914162 () Bool)

(assert (=> b!1370737 (=> (not res!914162) (not e!776435))))

(assert (=> b!1370737 (= res!914162 (not (contains!9681 (t!46693 lt!602483) (h!33204 lt!602483))))))

(declare-fun b!1370738 () Bool)

(assert (=> b!1370738 (= e!776435 (noDuplicate!2538 (t!46693 lt!602483)))))

(assert (= (and d!147251 (not res!914161)) b!1370737))

(assert (= (and b!1370737 res!914162) b!1370738))

(declare-fun m!1254251 () Bool)

(assert (=> b!1370737 m!1254251))

(declare-fun m!1254253 () Bool)

(assert (=> b!1370738 m!1254253))

(assert (=> b!1370649 d!147251))

(declare-fun d!147255 () Bool)

(declare-fun res!914165 () Bool)

(declare-fun e!776438 () Bool)

(assert (=> d!147255 (=> res!914165 e!776438)))

(assert (=> d!147255 (= res!914165 ((_ is Nil!31996) acc!866))))

(assert (=> d!147255 (= (noDuplicate!2538 acc!866) e!776438)))

(declare-fun b!1370741 () Bool)

(declare-fun e!776439 () Bool)

(assert (=> b!1370741 (= e!776438 e!776439)))

(declare-fun res!914166 () Bool)

(assert (=> b!1370741 (=> (not res!914166) (not e!776439))))

(assert (=> b!1370741 (= res!914166 (not (contains!9681 (t!46693 acc!866) (h!33204 acc!866))))))

(declare-fun b!1370742 () Bool)

(assert (=> b!1370742 (= e!776439 (noDuplicate!2538 (t!46693 acc!866)))))

(assert (= (and d!147255 (not res!914165)) b!1370741))

(assert (= (and b!1370741 res!914166) b!1370742))

(declare-fun m!1254259 () Bool)

(assert (=> b!1370741 m!1254259))

(declare-fun m!1254263 () Bool)

(assert (=> b!1370742 m!1254263))

(assert (=> b!1370647 d!147255))

(declare-fun d!147259 () Bool)

(declare-fun lt!602502 () Bool)

(assert (=> d!147259 (= lt!602502 (select (content!732 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776443 () Bool)

(assert (=> d!147259 (= lt!602502 e!776443)))

(declare-fun res!914169 () Bool)

(assert (=> d!147259 (=> (not res!914169) (not e!776443))))

(assert (=> d!147259 (= res!914169 ((_ is Cons!31995) acc!866))))

(assert (=> d!147259 (= (contains!9681 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602502)))

(declare-fun b!1370745 () Bool)

(declare-fun e!776442 () Bool)

(assert (=> b!1370745 (= e!776443 e!776442)))

(declare-fun res!914170 () Bool)

(assert (=> b!1370745 (=> res!914170 e!776442)))

(assert (=> b!1370745 (= res!914170 (= (h!33204 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370746 () Bool)

(assert (=> b!1370746 (= e!776442 (contains!9681 (t!46693 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147259 res!914169) b!1370745))

(assert (= (and b!1370745 (not res!914170)) b!1370746))

(declare-fun m!1254267 () Bool)

(assert (=> d!147259 m!1254267))

(declare-fun m!1254271 () Bool)

(assert (=> d!147259 m!1254271))

(declare-fun m!1254275 () Bool)

(assert (=> b!1370746 m!1254275))

(assert (=> b!1370658 d!147259))

(declare-fun d!147263 () Bool)

(declare-fun lt!602503 () Bool)

(assert (=> d!147263 (= lt!602503 (select (content!732 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776445 () Bool)

(assert (=> d!147263 (= lt!602503 e!776445)))

(declare-fun res!914171 () Bool)

(assert (=> d!147263 (=> (not res!914171) (not e!776445))))

(assert (=> d!147263 (= res!914171 ((_ is Cons!31995) acc!866))))

(assert (=> d!147263 (= (contains!9681 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602503)))

(declare-fun b!1370747 () Bool)

(declare-fun e!776444 () Bool)

(assert (=> b!1370747 (= e!776445 e!776444)))

(declare-fun res!914172 () Bool)

(assert (=> b!1370747 (=> res!914172 e!776444)))

(assert (=> b!1370747 (= res!914172 (= (h!33204 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370748 () Bool)

(assert (=> b!1370748 (= e!776444 (contains!9681 (t!46693 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147263 res!914171) b!1370747))

(assert (= (and b!1370747 (not res!914172)) b!1370748))

(assert (=> d!147263 m!1254267))

(declare-fun m!1254277 () Bool)

(assert (=> d!147263 m!1254277))

(declare-fun m!1254279 () Bool)

(assert (=> b!1370748 m!1254279))

(assert (=> b!1370651 d!147263))

(declare-fun b!1370794 () Bool)

(declare-fun e!776488 () Bool)

(declare-fun call!65540 () Bool)

(assert (=> b!1370794 (= e!776488 call!65540)))

(declare-fun d!147265 () Bool)

(declare-fun res!914208 () Bool)

(declare-fun e!776486 () Bool)

(assert (=> d!147265 (=> res!914208 e!776486)))

(assert (=> d!147265 (= res!914208 (bvsge from!3239 (size!45481 a!3861)))))

(assert (=> d!147265 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!776486)))

(declare-fun b!1370795 () Bool)

(assert (=> b!1370795 (= e!776488 call!65540)))

(declare-fun b!1370796 () Bool)

(declare-fun e!776487 () Bool)

(assert (=> b!1370796 (= e!776487 e!776488)))

(declare-fun c!127733 () Bool)

(assert (=> b!1370796 (= c!127733 (validKeyInArray!0 (select (arr!44931 a!3861) from!3239)))))

(declare-fun bm!65537 () Bool)

(assert (=> bm!65537 (= call!65540 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127733 (Cons!31995 (select (arr!44931 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1370797 () Bool)

(assert (=> b!1370797 (= e!776486 e!776487)))

(declare-fun res!914209 () Bool)

(assert (=> b!1370797 (=> (not res!914209) (not e!776487))))

(declare-fun e!776489 () Bool)

(assert (=> b!1370797 (= res!914209 (not e!776489))))

(declare-fun res!914210 () Bool)

(assert (=> b!1370797 (=> (not res!914210) (not e!776489))))

(assert (=> b!1370797 (= res!914210 (validKeyInArray!0 (select (arr!44931 a!3861) from!3239)))))

(declare-fun b!1370798 () Bool)

(assert (=> b!1370798 (= e!776489 (contains!9681 acc!866 (select (arr!44931 a!3861) from!3239)))))

(assert (= (and d!147265 (not res!914208)) b!1370797))

(assert (= (and b!1370797 res!914210) b!1370798))

(assert (= (and b!1370797 res!914209) b!1370796))

(assert (= (and b!1370796 c!127733) b!1370794))

(assert (= (and b!1370796 (not c!127733)) b!1370795))

(assert (= (or b!1370794 b!1370795) bm!65537))

(assert (=> b!1370796 m!1254177))

(assert (=> b!1370796 m!1254177))

(assert (=> b!1370796 m!1254197))

(assert (=> bm!65537 m!1254177))

(declare-fun m!1254319 () Bool)

(assert (=> bm!65537 m!1254319))

(assert (=> b!1370797 m!1254177))

(assert (=> b!1370797 m!1254177))

(assert (=> b!1370797 m!1254197))

(assert (=> b!1370798 m!1254177))

(assert (=> b!1370798 m!1254177))

(assert (=> b!1370798 m!1254193))

(assert (=> b!1370662 d!147265))

(declare-fun d!147283 () Bool)

(assert (=> d!147283 (noDuplicate!2538 newAcc!98)))

(declare-fun lt!602517 () Unit!45299)

(declare-fun choose!2011 (List!31999 List!31999) Unit!45299)

(assert (=> d!147283 (= lt!602517 (choose!2011 newAcc!98 acc!866))))

(declare-fun e!776505 () Bool)

(assert (=> d!147283 e!776505))

(declare-fun res!914226 () Bool)

(assert (=> d!147283 (=> (not res!914226) (not e!776505))))

(assert (=> d!147283 (= res!914226 (subseq!1083 newAcc!98 acc!866))))

(assert (=> d!147283 (= (noDuplicateSubseq!270 newAcc!98 acc!866) lt!602517)))

(declare-fun b!1370814 () Bool)

(assert (=> b!1370814 (= e!776505 (noDuplicate!2538 acc!866))))

(assert (= (and d!147283 res!914226) b!1370814))

(declare-fun m!1254325 () Bool)

(assert (=> d!147283 m!1254325))

(declare-fun m!1254327 () Bool)

(assert (=> d!147283 m!1254327))

(assert (=> d!147283 m!1254203))

(assert (=> b!1370814 m!1254205))

(assert (=> b!1370662 d!147283))

(declare-fun d!147287 () Bool)

(declare-fun lt!602518 () Bool)

(assert (=> d!147287 (= lt!602518 (select (content!732 acc!866) (select (arr!44931 a!3861) from!3239)))))

(declare-fun e!776507 () Bool)

(assert (=> d!147287 (= lt!602518 e!776507)))

(declare-fun res!914227 () Bool)

(assert (=> d!147287 (=> (not res!914227) (not e!776507))))

(assert (=> d!147287 (= res!914227 ((_ is Cons!31995) acc!866))))

(assert (=> d!147287 (= (contains!9681 acc!866 (select (arr!44931 a!3861) from!3239)) lt!602518)))

(declare-fun b!1370815 () Bool)

(declare-fun e!776506 () Bool)

(assert (=> b!1370815 (= e!776507 e!776506)))

(declare-fun res!914228 () Bool)

(assert (=> b!1370815 (=> res!914228 e!776506)))

(assert (=> b!1370815 (= res!914228 (= (h!33204 acc!866) (select (arr!44931 a!3861) from!3239)))))

(declare-fun b!1370816 () Bool)

(assert (=> b!1370816 (= e!776506 (contains!9681 (t!46693 acc!866) (select (arr!44931 a!3861) from!3239)))))

(assert (= (and d!147287 res!914227) b!1370815))

(assert (= (and b!1370815 (not res!914228)) b!1370816))

(assert (=> d!147287 m!1254267))

(assert (=> d!147287 m!1254177))

(declare-fun m!1254329 () Bool)

(assert (=> d!147287 m!1254329))

(assert (=> b!1370816 m!1254177))

(declare-fun m!1254331 () Bool)

(assert (=> b!1370816 m!1254331))

(assert (=> b!1370660 d!147287))

(declare-fun d!147291 () Bool)

(declare-fun lt!602520 () Bool)

(assert (=> d!147291 (= lt!602520 (select (content!732 lt!602483) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776511 () Bool)

(assert (=> d!147291 (= lt!602520 e!776511)))

(declare-fun res!914231 () Bool)

(assert (=> d!147291 (=> (not res!914231) (not e!776511))))

(assert (=> d!147291 (= res!914231 ((_ is Cons!31995) lt!602483))))

(assert (=> d!147291 (= (contains!9681 lt!602483 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602520)))

(declare-fun b!1370819 () Bool)

(declare-fun e!776510 () Bool)

(assert (=> b!1370819 (= e!776511 e!776510)))

(declare-fun res!914232 () Bool)

(assert (=> b!1370819 (=> res!914232 e!776510)))

(assert (=> b!1370819 (= res!914232 (= (h!33204 lt!602483) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370820 () Bool)

(assert (=> b!1370820 (= e!776510 (contains!9681 (t!46693 lt!602483) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147291 res!914231) b!1370819))

(assert (= (and b!1370819 (not res!914232)) b!1370820))

(declare-fun m!1254337 () Bool)

(assert (=> d!147291 m!1254337))

(declare-fun m!1254339 () Bool)

(assert (=> d!147291 m!1254339))

(declare-fun m!1254341 () Bool)

(assert (=> b!1370820 m!1254341))

(assert (=> b!1370650 d!147291))

(declare-fun d!147295 () Bool)

(declare-fun lt!602522 () Bool)

(assert (=> d!147295 (= lt!602522 (select (content!732 lt!602484) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776519 () Bool)

(assert (=> d!147295 (= lt!602522 e!776519)))

(declare-fun res!914239 () Bool)

(assert (=> d!147295 (=> (not res!914239) (not e!776519))))

(assert (=> d!147295 (= res!914239 ((_ is Cons!31995) lt!602484))))

(assert (=> d!147295 (= (contains!9681 lt!602484 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602522)))

(declare-fun b!1370827 () Bool)

(declare-fun e!776518 () Bool)

(assert (=> b!1370827 (= e!776519 e!776518)))

(declare-fun res!914240 () Bool)

(assert (=> b!1370827 (=> res!914240 e!776518)))

(assert (=> b!1370827 (= res!914240 (= (h!33204 lt!602484) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370828 () Bool)

(assert (=> b!1370828 (= e!776518 (contains!9681 (t!46693 lt!602484) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147295 res!914239) b!1370827))

(assert (= (and b!1370827 (not res!914240)) b!1370828))

(declare-fun m!1254353 () Bool)

(assert (=> d!147295 m!1254353))

(declare-fun m!1254355 () Bool)

(assert (=> d!147295 m!1254355))

(declare-fun m!1254357 () Bool)

(assert (=> b!1370828 m!1254357))

(assert (=> b!1370661 d!147295))

(declare-fun b!1370861 () Bool)

(declare-fun e!776550 () Bool)

(assert (=> b!1370861 (= e!776550 (subseq!1083 (t!46693 newAcc!98) (t!46693 acc!866)))))

(declare-fun d!147301 () Bool)

(declare-fun res!914272 () Bool)

(declare-fun e!776553 () Bool)

(assert (=> d!147301 (=> res!914272 e!776553)))

(assert (=> d!147301 (= res!914272 ((_ is Nil!31996) newAcc!98))))

(assert (=> d!147301 (= (subseq!1083 newAcc!98 acc!866) e!776553)))

(declare-fun b!1370860 () Bool)

(declare-fun e!776551 () Bool)

(declare-fun e!776552 () Bool)

(assert (=> b!1370860 (= e!776551 e!776552)))

(declare-fun res!914273 () Bool)

(assert (=> b!1370860 (=> res!914273 e!776552)))

(assert (=> b!1370860 (= res!914273 e!776550)))

(declare-fun res!914271 () Bool)

(assert (=> b!1370860 (=> (not res!914271) (not e!776550))))

(assert (=> b!1370860 (= res!914271 (= (h!33204 newAcc!98) (h!33204 acc!866)))))

(declare-fun b!1370859 () Bool)

(assert (=> b!1370859 (= e!776553 e!776551)))

(declare-fun res!914274 () Bool)

(assert (=> b!1370859 (=> (not res!914274) (not e!776551))))

(assert (=> b!1370859 (= res!914274 ((_ is Cons!31995) acc!866))))

(declare-fun b!1370862 () Bool)

(assert (=> b!1370862 (= e!776552 (subseq!1083 newAcc!98 (t!46693 acc!866)))))

(assert (= (and d!147301 (not res!914272)) b!1370859))

(assert (= (and b!1370859 res!914274) b!1370860))

(assert (= (and b!1370860 res!914271) b!1370861))

(assert (= (and b!1370860 (not res!914273)) b!1370862))

(declare-fun m!1254397 () Bool)

(assert (=> b!1370861 m!1254397))

(declare-fun m!1254399 () Bool)

(assert (=> b!1370862 m!1254399))

(assert (=> b!1370654 d!147301))

(declare-fun d!147325 () Bool)

(declare-fun lt!602530 () Bool)

(assert (=> d!147325 (= lt!602530 (select (content!732 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776555 () Bool)

(assert (=> d!147325 (= lt!602530 e!776555)))

(declare-fun res!914275 () Bool)

(assert (=> d!147325 (=> (not res!914275) (not e!776555))))

(assert (=> d!147325 (= res!914275 ((_ is Cons!31995) newAcc!98))))

(assert (=> d!147325 (= (contains!9681 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602530)))

(declare-fun b!1370863 () Bool)

(declare-fun e!776554 () Bool)

(assert (=> b!1370863 (= e!776555 e!776554)))

(declare-fun res!914276 () Bool)

(assert (=> b!1370863 (=> res!914276 e!776554)))

(assert (=> b!1370863 (= res!914276 (= (h!33204 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370864 () Bool)

(assert (=> b!1370864 (= e!776554 (contains!9681 (t!46693 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147325 res!914275) b!1370863))

(assert (= (and b!1370863 (not res!914276)) b!1370864))

(assert (=> d!147325 m!1254245))

(declare-fun m!1254401 () Bool)

(assert (=> d!147325 m!1254401))

(declare-fun m!1254403 () Bool)

(assert (=> b!1370864 m!1254403))

(assert (=> b!1370653 d!147325))

(declare-fun d!147327 () Bool)

(declare-fun lt!602531 () Bool)

(assert (=> d!147327 (= lt!602531 (select (content!732 lt!602483) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776557 () Bool)

(assert (=> d!147327 (= lt!602531 e!776557)))

(declare-fun res!914277 () Bool)

(assert (=> d!147327 (=> (not res!914277) (not e!776557))))

(assert (=> d!147327 (= res!914277 ((_ is Cons!31995) lt!602483))))

(assert (=> d!147327 (= (contains!9681 lt!602483 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602531)))

(declare-fun b!1370865 () Bool)

(declare-fun e!776556 () Bool)

(assert (=> b!1370865 (= e!776557 e!776556)))

(declare-fun res!914278 () Bool)

(assert (=> b!1370865 (=> res!914278 e!776556)))

(assert (=> b!1370865 (= res!914278 (= (h!33204 lt!602483) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370866 () Bool)

(assert (=> b!1370866 (= e!776556 (contains!9681 (t!46693 lt!602483) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147327 res!914277) b!1370865))

(assert (= (and b!1370865 (not res!914278)) b!1370866))

(assert (=> d!147327 m!1254337))

(declare-fun m!1254405 () Bool)

(assert (=> d!147327 m!1254405))

(declare-fun m!1254407 () Bool)

(assert (=> b!1370866 m!1254407))

(assert (=> b!1370657 d!147327))

(declare-fun d!147331 () Bool)

(declare-fun lt!602533 () Bool)

(assert (=> d!147331 (= lt!602533 (select (content!732 lt!602484) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776561 () Bool)

(assert (=> d!147331 (= lt!602533 e!776561)))

(declare-fun res!914281 () Bool)

(assert (=> d!147331 (=> (not res!914281) (not e!776561))))

(assert (=> d!147331 (= res!914281 ((_ is Cons!31995) lt!602484))))

(assert (=> d!147331 (= (contains!9681 lt!602484 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602533)))

(declare-fun b!1370869 () Bool)

(declare-fun e!776560 () Bool)

(assert (=> b!1370869 (= e!776561 e!776560)))

(declare-fun res!914282 () Bool)

(assert (=> b!1370869 (=> res!914282 e!776560)))

(assert (=> b!1370869 (= res!914282 (= (h!33204 lt!602484) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370870 () Bool)

(assert (=> b!1370870 (= e!776560 (contains!9681 (t!46693 lt!602484) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147331 res!914281) b!1370869))

(assert (= (and b!1370869 (not res!914282)) b!1370870))

(assert (=> d!147331 m!1254353))

(declare-fun m!1254413 () Bool)

(assert (=> d!147331 m!1254413))

(declare-fun m!1254417 () Bool)

(assert (=> b!1370870 m!1254417))

(assert (=> b!1370655 d!147331))

(check-sat (not d!147287) (not b!1370866) (not d!147259) (not b!1370742) (not d!147325) (not b!1370814) (not b!1370737) (not b!1370797) (not d!147283) (not b!1370864) (not d!147263) (not d!147245) (not b!1370748) (not d!147331) (not b!1370820) (not b!1370738) (not b!1370861) (not b!1370746) (not b!1370798) (not d!147291) (not b!1370728) (not b!1370741) (not bm!65537) (not d!147327) (not b!1370816) (not b!1370870) (not d!147295) (not b!1370828) (not b!1370796) (not b!1370862))
(check-sat)
