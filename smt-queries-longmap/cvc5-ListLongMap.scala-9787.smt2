; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116138 () Bool)

(assert start!116138)

(declare-fun b!1371801 () Bool)

(declare-fun res!915175 () Bool)

(declare-fun e!777084 () Bool)

(assert (=> b!1371801 (=> (not res!915175) (not e!777084))))

(declare-datatypes ((List!32010 0))(
  ( (Nil!32007) (Cons!32006 (h!33215 (_ BitVec 64)) (t!46704 List!32010)) )
))
(declare-fun acc!866 () List!32010)

(declare-fun contains!9692 (List!32010 (_ BitVec 64)) Bool)

(assert (=> b!1371801 (= res!915175 (not (contains!9692 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!915171 () Bool)

(assert (=> start!116138 (=> (not res!915171) (not e!777084))))

(declare-datatypes ((array!93057 0))(
  ( (array!93058 (arr!44942 (Array (_ BitVec 32) (_ BitVec 64))) (size!45492 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93057)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!116138 (= res!915171 (and (bvslt (size!45492 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45492 a!3861))))))

(assert (=> start!116138 e!777084))

(declare-fun array_inv!33970 (array!93057) Bool)

(assert (=> start!116138 (array_inv!33970 a!3861)))

(assert (=> start!116138 true))

(declare-fun b!1371802 () Bool)

(declare-fun res!915167 () Bool)

(declare-fun e!777083 () Bool)

(assert (=> b!1371802 (=> (not res!915167) (not e!777083))))

(assert (=> b!1371802 (= res!915167 (not (contains!9692 acc!866 (select (arr!44942 a!3861) from!3239))))))

(declare-fun b!1371803 () Bool)

(declare-fun res!915168 () Bool)

(assert (=> b!1371803 (=> (not res!915168) (not e!777083))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1371803 (= res!915168 (validKeyInArray!0 (select (arr!44942 a!3861) from!3239)))))

(declare-fun b!1371804 () Bool)

(declare-fun res!915172 () Bool)

(assert (=> b!1371804 (=> (not res!915172) (not e!777084))))

(assert (=> b!1371804 (= res!915172 (not (contains!9692 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371805 () Bool)

(declare-fun res!915166 () Bool)

(assert (=> b!1371805 (=> (not res!915166) (not e!777084))))

(declare-fun newAcc!98 () List!32010)

(assert (=> b!1371805 (= res!915166 (not (contains!9692 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371806 () Bool)

(assert (=> b!1371806 (= e!777084 e!777083)))

(declare-fun res!915174 () Bool)

(assert (=> b!1371806 (=> (not res!915174) (not e!777083))))

(declare-fun arrayNoDuplicates!0 (array!93057 (_ BitVec 32) List!32010) Bool)

(assert (=> b!1371806 (= res!915174 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45321 0))(
  ( (Unit!45322) )
))
(declare-fun lt!602734 () Unit!45321)

(declare-fun noDuplicateSubseq!281 (List!32010 List!32010) Unit!45321)

(assert (=> b!1371806 (= lt!602734 (noDuplicateSubseq!281 newAcc!98 acc!866))))

(declare-fun b!1371807 () Bool)

(declare-fun res!915173 () Bool)

(assert (=> b!1371807 (=> (not res!915173) (not e!777084))))

(declare-fun subseq!1094 (List!32010 List!32010) Bool)

(assert (=> b!1371807 (= res!915173 (subseq!1094 newAcc!98 acc!866))))

(declare-fun b!1371808 () Bool)

(declare-fun res!915170 () Bool)

(assert (=> b!1371808 (=> (not res!915170) (not e!777084))))

(assert (=> b!1371808 (= res!915170 (not (contains!9692 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371809 () Bool)

(assert (=> b!1371809 (= e!777083 (not (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98)))))

(declare-fun lt!602733 () Unit!45321)

(declare-fun lt!602737 () List!32010)

(declare-fun lt!602735 () List!32010)

(assert (=> b!1371809 (= lt!602733 (noDuplicateSubseq!281 lt!602737 lt!602735))))

(assert (=> b!1371809 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!602737)))

(declare-fun lt!602736 () Unit!45321)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!93057 List!32010 List!32010 (_ BitVec 32)) Unit!45321)

(assert (=> b!1371809 (= lt!602736 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!602735 lt!602737 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> b!1371809 (= lt!602737 (Cons!32006 (select (arr!44942 a!3861) from!3239) newAcc!98))))

(assert (=> b!1371809 (= lt!602735 (Cons!32006 (select (arr!44942 a!3861) from!3239) acc!866))))

(declare-fun b!1371810 () Bool)

(declare-fun res!915169 () Bool)

(assert (=> b!1371810 (=> (not res!915169) (not e!777084))))

(declare-fun noDuplicate!2549 (List!32010) Bool)

(assert (=> b!1371810 (= res!915169 (noDuplicate!2549 acc!866))))

(declare-fun b!1371811 () Bool)

(declare-fun res!915165 () Bool)

(assert (=> b!1371811 (=> (not res!915165) (not e!777083))))

(assert (=> b!1371811 (= res!915165 (bvslt from!3239 (size!45492 a!3861)))))

(assert (= (and start!116138 res!915171) b!1371810))

(assert (= (and b!1371810 res!915169) b!1371801))

(assert (= (and b!1371801 res!915175) b!1371804))

(assert (= (and b!1371804 res!915172) b!1371808))

(assert (= (and b!1371808 res!915170) b!1371805))

(assert (= (and b!1371805 res!915166) b!1371807))

(assert (= (and b!1371807 res!915173) b!1371806))

(assert (= (and b!1371806 res!915174) b!1371811))

(assert (= (and b!1371811 res!915165) b!1371803))

(assert (= (and b!1371803 res!915168) b!1371802))

(assert (= (and b!1371802 res!915167) b!1371809))

(declare-fun m!1255207 () Bool)

(assert (=> b!1371804 m!1255207))

(declare-fun m!1255209 () Bool)

(assert (=> start!116138 m!1255209))

(declare-fun m!1255211 () Bool)

(assert (=> b!1371807 m!1255211))

(declare-fun m!1255213 () Bool)

(assert (=> b!1371810 m!1255213))

(declare-fun m!1255215 () Bool)

(assert (=> b!1371802 m!1255215))

(assert (=> b!1371802 m!1255215))

(declare-fun m!1255217 () Bool)

(assert (=> b!1371802 m!1255217))

(declare-fun m!1255219 () Bool)

(assert (=> b!1371801 m!1255219))

(declare-fun m!1255221 () Bool)

(assert (=> b!1371805 m!1255221))

(declare-fun m!1255223 () Bool)

(assert (=> b!1371806 m!1255223))

(declare-fun m!1255225 () Bool)

(assert (=> b!1371806 m!1255225))

(declare-fun m!1255227 () Bool)

(assert (=> b!1371809 m!1255227))

(assert (=> b!1371809 m!1255215))

(declare-fun m!1255229 () Bool)

(assert (=> b!1371809 m!1255229))

(declare-fun m!1255231 () Bool)

(assert (=> b!1371809 m!1255231))

(declare-fun m!1255233 () Bool)

(assert (=> b!1371809 m!1255233))

(declare-fun m!1255235 () Bool)

(assert (=> b!1371808 m!1255235))

(assert (=> b!1371803 m!1255215))

(assert (=> b!1371803 m!1255215))

(declare-fun m!1255237 () Bool)

(assert (=> b!1371803 m!1255237))

(push 1)

(assert (not b!1371810))

(assert (not b!1371805))

(assert (not b!1371807))

(assert (not start!116138))

(assert (not b!1371809))

(assert (not b!1371806))

(assert (not b!1371804))

(assert (not b!1371803))

(assert (not b!1371808))

(assert (not b!1371801))

(assert (not b!1371802))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!147565 () Bool)

(assert (=> d!147565 (= (validKeyInArray!0 (select (arr!44942 a!3861) from!3239)) (and (not (= (select (arr!44942 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44942 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1371803 d!147565))

(declare-fun lt!602773 () Bool)

(declare-fun d!147571 () Bool)

(declare-fun content!742 (List!32010) (Set (_ BitVec 64)))

(assert (=> d!147571 (= lt!602773 (set.member (select (arr!44942 a!3861) from!3239) (content!742 acc!866)))))

(declare-fun e!777127 () Bool)

(assert (=> d!147571 (= lt!602773 e!777127)))

(declare-fun res!915264 () Bool)

(assert (=> d!147571 (=> (not res!915264) (not e!777127))))

(assert (=> d!147571 (= res!915264 (is-Cons!32006 acc!866))))

(assert (=> d!147571 (= (contains!9692 acc!866 (select (arr!44942 a!3861) from!3239)) lt!602773)))

(declare-fun b!1371900 () Bool)

(declare-fun e!777126 () Bool)

(assert (=> b!1371900 (= e!777127 e!777126)))

(declare-fun res!915265 () Bool)

(assert (=> b!1371900 (=> res!915265 e!777126)))

(assert (=> b!1371900 (= res!915265 (= (h!33215 acc!866) (select (arr!44942 a!3861) from!3239)))))

(declare-fun b!1371901 () Bool)

(assert (=> b!1371901 (= e!777126 (contains!9692 (t!46704 acc!866) (select (arr!44942 a!3861) from!3239)))))

(assert (= (and d!147571 res!915264) b!1371900))

(assert (= (and b!1371900 (not res!915265)) b!1371901))

(declare-fun m!1255311 () Bool)

(assert (=> d!147571 m!1255311))

(assert (=> d!147571 m!1255215))

(declare-fun m!1255315 () Bool)

(assert (=> d!147571 m!1255315))

(assert (=> b!1371901 m!1255215))

(declare-fun m!1255317 () Bool)

(assert (=> b!1371901 m!1255317))

(assert (=> b!1371802 d!147571))

(declare-fun d!147577 () Bool)

(declare-fun lt!602774 () Bool)

(assert (=> d!147577 (= lt!602774 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!742 acc!866)))))

(declare-fun e!777133 () Bool)

(assert (=> d!147577 (= lt!602774 e!777133)))

(declare-fun res!915270 () Bool)

(assert (=> d!147577 (=> (not res!915270) (not e!777133))))

(assert (=> d!147577 (= res!915270 (is-Cons!32006 acc!866))))

(assert (=> d!147577 (= (contains!9692 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602774)))

(declare-fun b!1371904 () Bool)

(declare-fun e!777132 () Bool)

(assert (=> b!1371904 (= e!777133 e!777132)))

(declare-fun res!915271 () Bool)

(assert (=> b!1371904 (=> res!915271 e!777132)))

(assert (=> b!1371904 (= res!915271 (= (h!33215 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1371905 () Bool)

(assert (=> b!1371905 (= e!777132 (contains!9692 (t!46704 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147577 res!915270) b!1371904))

(assert (= (and b!1371904 (not res!915271)) b!1371905))

(assert (=> d!147577 m!1255311))

(declare-fun m!1255319 () Bool)

(assert (=> d!147577 m!1255319))

(declare-fun m!1255321 () Bool)

(assert (=> b!1371905 m!1255321))

(assert (=> b!1371801 d!147577))

(declare-fun d!147579 () Bool)

(declare-fun res!915278 () Bool)

(declare-fun e!777142 () Bool)

(assert (=> d!147579 (=> res!915278 e!777142)))

(assert (=> d!147579 (= res!915278 (is-Nil!32007 acc!866))))

(assert (=> d!147579 (= (noDuplicate!2549 acc!866) e!777142)))

(declare-fun b!1371918 () Bool)

(declare-fun e!777143 () Bool)

(assert (=> b!1371918 (= e!777142 e!777143)))

(declare-fun res!915279 () Bool)

(assert (=> b!1371918 (=> (not res!915279) (not e!777143))))

(assert (=> b!1371918 (= res!915279 (not (contains!9692 (t!46704 acc!866) (h!33215 acc!866))))))

(declare-fun b!1371919 () Bool)

(assert (=> b!1371919 (= e!777143 (noDuplicate!2549 (t!46704 acc!866)))))

(assert (= (and d!147579 (not res!915278)) b!1371918))

(assert (= (and b!1371918 res!915279) b!1371919))

(declare-fun m!1255323 () Bool)

(assert (=> b!1371918 m!1255323))

(declare-fun m!1255325 () Bool)

(assert (=> b!1371919 m!1255325))

(assert (=> b!1371810 d!147579))

(declare-fun b!1371959 () Bool)

(declare-fun e!777177 () Bool)

(declare-fun e!777180 () Bool)

(assert (=> b!1371959 (= e!777177 e!777180)))

(declare-fun res!915308 () Bool)

(assert (=> b!1371959 (=> (not res!915308) (not e!777180))))

(declare-fun e!777178 () Bool)

(assert (=> b!1371959 (= res!915308 (not e!777178))))

(declare-fun res!915307 () Bool)

(assert (=> b!1371959 (=> (not res!915307) (not e!777178))))

(assert (=> b!1371959 (= res!915307 (validKeyInArray!0 (select (arr!44942 a!3861) from!3239)))))

(declare-fun b!1371960 () Bool)

(declare-fun e!777179 () Bool)

(assert (=> b!1371960 (= e!777180 e!777179)))

(declare-fun c!127766 () Bool)

(assert (=> b!1371960 (= c!127766 (validKeyInArray!0 (select (arr!44942 a!3861) from!3239)))))

(declare-fun b!1371961 () Bool)

(declare-fun call!65573 () Bool)

(assert (=> b!1371961 (= e!777179 call!65573)))

(declare-fun bm!65570 () Bool)

(assert (=> bm!65570 (= call!65573 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127766 (Cons!32006 (select (arr!44942 a!3861) from!3239) newAcc!98) newAcc!98)))))

(declare-fun b!1371962 () Bool)

(assert (=> b!1371962 (= e!777178 (contains!9692 newAcc!98 (select (arr!44942 a!3861) from!3239)))))

(declare-fun b!1371963 () Bool)

(assert (=> b!1371963 (= e!777179 call!65573)))

(declare-fun d!147581 () Bool)

(declare-fun res!915309 () Bool)

(assert (=> d!147581 (=> res!915309 e!777177)))

(assert (=> d!147581 (= res!915309 (bvsge from!3239 (size!45492 a!3861)))))

(assert (=> d!147581 (= (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98) e!777177)))

(assert (= (and d!147581 (not res!915309)) b!1371959))

(assert (= (and b!1371959 res!915307) b!1371962))

(assert (= (and b!1371959 res!915308) b!1371960))

(assert (= (and b!1371960 c!127766) b!1371963))

(assert (= (and b!1371960 (not c!127766)) b!1371961))

(assert (= (or b!1371963 b!1371961) bm!65570))

(assert (=> b!1371959 m!1255215))

(assert (=> b!1371959 m!1255215))

(assert (=> b!1371959 m!1255237))

(assert (=> b!1371960 m!1255215))

(assert (=> b!1371960 m!1255215))

(assert (=> b!1371960 m!1255237))

(assert (=> bm!65570 m!1255215))

(declare-fun m!1255337 () Bool)

(assert (=> bm!65570 m!1255337))

(assert (=> b!1371962 m!1255215))

(assert (=> b!1371962 m!1255215))

(declare-fun m!1255343 () Bool)

(assert (=> b!1371962 m!1255343))

(assert (=> b!1371809 d!147581))

(declare-fun d!147591 () Bool)

(assert (=> d!147591 (noDuplicate!2549 lt!602737)))

(declare-fun lt!602783 () Unit!45321)

(declare-fun choose!2019 (List!32010 List!32010) Unit!45321)

(assert (=> d!147591 (= lt!602783 (choose!2019 lt!602737 lt!602735))))

(declare-fun e!777198 () Bool)

(assert (=> d!147591 e!777198))

(declare-fun res!915326 () Bool)

(assert (=> d!147591 (=> (not res!915326) (not e!777198))))

(assert (=> d!147591 (= res!915326 (subseq!1094 lt!602737 lt!602735))))

(assert (=> d!147591 (= (noDuplicateSubseq!281 lt!602737 lt!602735) lt!602783)))

(declare-fun b!1371982 () Bool)

(assert (=> b!1371982 (= e!777198 (noDuplicate!2549 lt!602735))))

(assert (= (and d!147591 res!915326) b!1371982))

(declare-fun m!1255361 () Bool)

(assert (=> d!147591 m!1255361))

(declare-fun m!1255363 () Bool)

(assert (=> d!147591 m!1255363))

(declare-fun m!1255365 () Bool)

(assert (=> d!147591 m!1255365))

(declare-fun m!1255367 () Bool)

(assert (=> b!1371982 m!1255367))

(assert (=> b!1371809 d!147591))

(declare-fun b!1371983 () Bool)

(declare-fun e!777199 () Bool)

(declare-fun e!777202 () Bool)

(assert (=> b!1371983 (= e!777199 e!777202)))

(declare-fun res!915328 () Bool)

(assert (=> b!1371983 (=> (not res!915328) (not e!777202))))

(declare-fun e!777200 () Bool)

(assert (=> b!1371983 (= res!915328 (not e!777200))))

(declare-fun res!915327 () Bool)

(assert (=> b!1371983 (=> (not res!915327) (not e!777200))))

(assert (=> b!1371983 (= res!915327 (validKeyInArray!0 (select (arr!44942 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1371984 () Bool)

(declare-fun e!777201 () Bool)

(assert (=> b!1371984 (= e!777202 e!777201)))

(declare-fun c!127768 () Bool)

(assert (=> b!1371984 (= c!127768 (validKeyInArray!0 (select (arr!44942 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1371985 () Bool)

(declare-fun call!65575 () Bool)

(assert (=> b!1371985 (= e!777201 call!65575)))

(declare-fun bm!65572 () Bool)

(assert (=> bm!65572 (= call!65575 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!127768 (Cons!32006 (select (arr!44942 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) lt!602737) lt!602737)))))

(declare-fun b!1371986 () Bool)

(assert (=> b!1371986 (= e!777200 (contains!9692 lt!602737 (select (arr!44942 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1371987 () Bool)

(assert (=> b!1371987 (= e!777201 call!65575)))

(declare-fun d!147597 () Bool)

(declare-fun res!915329 () Bool)

(assert (=> d!147597 (=> res!915329 e!777199)))

(assert (=> d!147597 (= res!915329 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45492 a!3861)))))

(assert (=> d!147597 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!602737) e!777199)))

(assert (= (and d!147597 (not res!915329)) b!1371983))

(assert (= (and b!1371983 res!915327) b!1371986))

(assert (= (and b!1371983 res!915328) b!1371984))

(assert (= (and b!1371984 c!127768) b!1371987))

(assert (= (and b!1371984 (not c!127768)) b!1371985))

(assert (= (or b!1371987 b!1371985) bm!65572))

(declare-fun m!1255369 () Bool)

(assert (=> b!1371983 m!1255369))

(assert (=> b!1371983 m!1255369))

(declare-fun m!1255371 () Bool)

(assert (=> b!1371983 m!1255371))

(assert (=> b!1371984 m!1255369))

(assert (=> b!1371984 m!1255369))

(assert (=> b!1371984 m!1255371))

(assert (=> bm!65572 m!1255369))

(declare-fun m!1255375 () Bool)

(assert (=> bm!65572 m!1255375))

(assert (=> b!1371986 m!1255369))

(assert (=> b!1371986 m!1255369))

(declare-fun m!1255377 () Bool)

(assert (=> b!1371986 m!1255377))

(assert (=> b!1371809 d!147597))

(declare-fun d!147601 () Bool)

(assert (=> d!147601 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!602737)))

(declare-fun lt!602795 () Unit!45321)

(declare-fun choose!80 (array!93057 List!32010 List!32010 (_ BitVec 32)) Unit!45321)

(assert (=> d!147601 (= lt!602795 (choose!80 a!3861 lt!602735 lt!602737 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> d!147601 (bvslt (size!45492 a!3861) #b01111111111111111111111111111111)))

(assert (=> d!147601 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!602735 lt!602737 (bvadd #b00000000000000000000000000000001 from!3239)) lt!602795)))

(declare-fun bs!39322 () Bool)

(assert (= bs!39322 d!147601))

(assert (=> bs!39322 m!1255229))

(declare-fun m!1255403 () Bool)

(assert (=> bs!39322 m!1255403))

(assert (=> b!1371809 d!147601))

(declare-fun d!147615 () Bool)

(declare-fun lt!602796 () Bool)

(assert (=> d!147615 (= lt!602796 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!742 newAcc!98)))))

(declare-fun e!777223 () Bool)

(assert (=> d!147615 (= lt!602796 e!777223)))

(declare-fun res!915348 () Bool)

(assert (=> d!147615 (=> (not res!915348) (not e!777223))))

(assert (=> d!147615 (= res!915348 (is-Cons!32006 newAcc!98))))

(assert (=> d!147615 (= (contains!9692 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602796)))

(declare-fun b!1372008 () Bool)

(declare-fun e!777222 () Bool)

(assert (=> b!1372008 (= e!777223 e!777222)))

(declare-fun res!915349 () Bool)

(assert (=> b!1372008 (=> res!915349 e!777222)))

(assert (=> b!1372008 (= res!915349 (= (h!33215 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1372009 () Bool)

(assert (=> b!1372009 (= e!777222 (contains!9692 (t!46704 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147615 res!915348) b!1372008))

(assert (= (and b!1372008 (not res!915349)) b!1372009))

(declare-fun m!1255405 () Bool)

(assert (=> d!147615 m!1255405))

(declare-fun m!1255407 () Bool)

(assert (=> d!147615 m!1255407))

(declare-fun m!1255409 () Bool)

(assert (=> b!1372009 m!1255409))

(assert (=> b!1371808 d!147615))

(declare-fun b!1372042 () Bool)

(declare-fun e!777258 () Bool)

(declare-fun e!777255 () Bool)

(assert (=> b!1372042 (= e!777258 e!777255)))

(declare-fun res!915381 () Bool)

(assert (=> b!1372042 (=> (not res!915381) (not e!777255))))

(assert (=> b!1372042 (= res!915381 (is-Cons!32006 acc!866))))

(declare-fun b!1372044 () Bool)

(declare-fun e!777256 () Bool)

(assert (=> b!1372044 (= e!777256 (subseq!1094 (t!46704 newAcc!98) (t!46704 acc!866)))))

(declare-fun b!1372045 () Bool)

(declare-fun e!777257 () Bool)

(assert (=> b!1372045 (= e!777257 (subseq!1094 newAcc!98 (t!46704 acc!866)))))

(declare-fun b!1372043 () Bool)

(assert (=> b!1372043 (= e!777255 e!777257)))

(declare-fun res!915383 () Bool)

(assert (=> b!1372043 (=> res!915383 e!777257)))

(assert (=> b!1372043 (= res!915383 e!777256)))

(declare-fun res!915380 () Bool)

(assert (=> b!1372043 (=> (not res!915380) (not e!777256))))

(assert (=> b!1372043 (= res!915380 (= (h!33215 newAcc!98) (h!33215 acc!866)))))

(declare-fun d!147617 () Bool)

(declare-fun res!915382 () Bool)

(assert (=> d!147617 (=> res!915382 e!777258)))

(assert (=> d!147617 (= res!915382 (is-Nil!32007 newAcc!98))))

(assert (=> d!147617 (= (subseq!1094 newAcc!98 acc!866) e!777258)))

(assert (= (and d!147617 (not res!915382)) b!1372042))

(assert (= (and b!1372042 res!915381) b!1372043))

(assert (= (and b!1372043 res!915380) b!1372044))

(assert (= (and b!1372043 (not res!915383)) b!1372045))

(declare-fun m!1255455 () Bool)

(assert (=> b!1372044 m!1255455))

(declare-fun m!1255457 () Bool)

(assert (=> b!1372045 m!1255457))

(assert (=> b!1371807 d!147617))

(declare-fun d!147639 () Bool)

(assert (=> d!147639 (= (array_inv!33970 a!3861) (bvsge (size!45492 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!116138 d!147639))

(declare-fun b!1372051 () Bool)

(declare-fun e!777263 () Bool)

(declare-fun e!777266 () Bool)

(assert (=> b!1372051 (= e!777263 e!777266)))

(declare-fun res!915388 () Bool)

(assert (=> b!1372051 (=> (not res!915388) (not e!777266))))

(declare-fun e!777264 () Bool)

(assert (=> b!1372051 (= res!915388 (not e!777264))))

(declare-fun res!915387 () Bool)

(assert (=> b!1372051 (=> (not res!915387) (not e!777264))))

(assert (=> b!1372051 (= res!915387 (validKeyInArray!0 (select (arr!44942 a!3861) from!3239)))))

(declare-fun b!1372052 () Bool)

(declare-fun e!777265 () Bool)

(assert (=> b!1372052 (= e!777266 e!777265)))

(declare-fun c!127772 () Bool)

(assert (=> b!1372052 (= c!127772 (validKeyInArray!0 (select (arr!44942 a!3861) from!3239)))))

(declare-fun b!1372053 () Bool)

(declare-fun call!65579 () Bool)

(assert (=> b!1372053 (= e!777265 call!65579)))

(declare-fun bm!65576 () Bool)

(assert (=> bm!65576 (= call!65579 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127772 (Cons!32006 (select (arr!44942 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1372054 () Bool)

(assert (=> b!1372054 (= e!777264 (contains!9692 acc!866 (select (arr!44942 a!3861) from!3239)))))

(declare-fun b!1372055 () Bool)

(assert (=> b!1372055 (= e!777265 call!65579)))

(declare-fun d!147641 () Bool)

(declare-fun res!915389 () Bool)

(assert (=> d!147641 (=> res!915389 e!777263)))

(assert (=> d!147641 (= res!915389 (bvsge from!3239 (size!45492 a!3861)))))

(assert (=> d!147641 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!777263)))

(assert (= (and d!147641 (not res!915389)) b!1372051))

(assert (= (and b!1372051 res!915387) b!1372054))

(assert (= (and b!1372051 res!915388) b!1372052))

(assert (= (and b!1372052 c!127772) b!1372055))

(assert (= (and b!1372052 (not c!127772)) b!1372053))

(assert (= (or b!1372055 b!1372053) bm!65576))

(assert (=> b!1372051 m!1255215))

(assert (=> b!1372051 m!1255215))

(assert (=> b!1372051 m!1255237))

(assert (=> b!1372052 m!1255215))

(assert (=> b!1372052 m!1255215))

(assert (=> b!1372052 m!1255237))

(assert (=> bm!65576 m!1255215))

(declare-fun m!1255467 () Bool)

(assert (=> bm!65576 m!1255467))

(assert (=> b!1372054 m!1255215))

(assert (=> b!1372054 m!1255215))

(assert (=> b!1372054 m!1255217))

(assert (=> b!1371806 d!147641))

(declare-fun d!147645 () Bool)

(assert (=> d!147645 (noDuplicate!2549 newAcc!98)))

(declare-fun lt!602804 () Unit!45321)

(assert (=> d!147645 (= lt!602804 (choose!2019 newAcc!98 acc!866))))

(declare-fun e!777267 () Bool)

(assert (=> d!147645 e!777267))

(declare-fun res!915390 () Bool)

(assert (=> d!147645 (=> (not res!915390) (not e!777267))))

(assert (=> d!147645 (= res!915390 (subseq!1094 newAcc!98 acc!866))))

(assert (=> d!147645 (= (noDuplicateSubseq!281 newAcc!98 acc!866) lt!602804)))

(declare-fun b!1372056 () Bool)

(assert (=> b!1372056 (= e!777267 (noDuplicate!2549 acc!866))))

(assert (= (and d!147645 res!915390) b!1372056))

(declare-fun m!1255469 () Bool)

(assert (=> d!147645 m!1255469))

(declare-fun m!1255471 () Bool)

(assert (=> d!147645 m!1255471))

(assert (=> d!147645 m!1255211))

(assert (=> b!1372056 m!1255213))

(assert (=> b!1371806 d!147645))

(declare-fun d!147647 () Bool)

(declare-fun lt!602805 () Bool)

(assert (=> d!147647 (= lt!602805 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!742 newAcc!98)))))

(declare-fun e!777269 () Bool)

(assert (=> d!147647 (= lt!602805 e!777269)))

(declare-fun res!915391 () Bool)

(assert (=> d!147647 (=> (not res!915391) (not e!777269))))

(assert (=> d!147647 (= res!915391 (is-Cons!32006 newAcc!98))))

(assert (=> d!147647 (= (contains!9692 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602805)))

(declare-fun b!1372057 () Bool)

(declare-fun e!777268 () Bool)

(assert (=> b!1372057 (= e!777269 e!777268)))

(declare-fun res!915392 () Bool)

(assert (=> b!1372057 (=> res!915392 e!777268)))

(assert (=> b!1372057 (= res!915392 (= (h!33215 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1372058 () Bool)

(assert (=> b!1372058 (= e!777268 (contains!9692 (t!46704 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147647 res!915391) b!1372057))

(assert (= (and b!1372057 (not res!915392)) b!1372058))

(assert (=> d!147647 m!1255405))

(declare-fun m!1255473 () Bool)

(assert (=> d!147647 m!1255473))

(declare-fun m!1255475 () Bool)

(assert (=> b!1372058 m!1255475))

(assert (=> b!1371805 d!147647))

(declare-fun d!147649 () Bool)

(declare-fun lt!602808 () Bool)

(assert (=> d!147649 (= lt!602808 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!742 acc!866)))))

(declare-fun e!777271 () Bool)

(assert (=> d!147649 (= lt!602808 e!777271)))

(declare-fun res!915393 () Bool)

(assert (=> d!147649 (=> (not res!915393) (not e!777271))))

(assert (=> d!147649 (= res!915393 (is-Cons!32006 acc!866))))

(assert (=> d!147649 (= (contains!9692 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602808)))

(declare-fun b!1372059 () Bool)

(declare-fun e!777270 () Bool)

(assert (=> b!1372059 (= e!777271 e!777270)))

(declare-fun res!915394 () Bool)

(assert (=> b!1372059 (=> res!915394 e!777270)))

(assert (=> b!1372059 (= res!915394 (= (h!33215 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1372060 () Bool)

(assert (=> b!1372060 (= e!777270 (contains!9692 (t!46704 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147649 res!915393) b!1372059))

(assert (= (and b!1372059 (not res!915394)) b!1372060))

(assert (=> d!147649 m!1255311))

(declare-fun m!1255477 () Bool)

(assert (=> d!147649 m!1255477))

(declare-fun m!1255479 () Bool)

(assert (=> b!1372060 m!1255479))

(assert (=> b!1371804 d!147649))

(push 1)

(assert (not d!147645))

(assert (not d!147591))

(assert (not b!1372060))

(assert (not b!1372051))

(assert (not bm!65570))

(assert (not bm!65576))

(assert (not b!1372054))

(assert (not b!1371982))

(assert (not b!1371984))

(assert (not b!1372052))

(assert (not b!1371962))

(assert (not b!1371918))

(assert (not b!1372056))

(assert (not d!147577))

(assert (not d!147647))

(assert (not d!147571))

(assert (not b!1371919))

(assert (not b!1372045))

(assert (not b!1371960))

(assert (not b!1371983))

(assert (not b!1372044))

(assert (not b!1372009))

(assert (not b!1372058))

(assert (not b!1371959))

(assert (not d!147601))

(assert (not d!147649))

(assert (not bm!65572))

(assert (not d!147615))

(assert (not b!1371905))

(assert (not b!1371901))

(assert (not b!1371986))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun lt!602818 () Bool)

(declare-fun d!147699 () Bool)

(assert (=> d!147699 (= lt!602818 (set.member (select (arr!44942 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) (content!742 lt!602737)))))

(declare-fun e!777325 () Bool)

(assert (=> d!147699 (= lt!602818 e!777325)))

(declare-fun res!915440 () Bool)

(assert (=> d!147699 (=> (not res!915440) (not e!777325))))

(assert (=> d!147699 (= res!915440 (is-Cons!32006 lt!602737))))

(assert (=> d!147699 (= (contains!9692 lt!602737 (select (arr!44942 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))) lt!602818)))

(declare-fun b!1372120 () Bool)

(declare-fun e!777324 () Bool)

(assert (=> b!1372120 (= e!777325 e!777324)))

(declare-fun res!915441 () Bool)

(assert (=> b!1372120 (=> res!915441 e!777324)))

(assert (=> b!1372120 (= res!915441 (= (h!33215 lt!602737) (select (arr!44942 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1372121 () Bool)

(assert (=> b!1372121 (= e!777324 (contains!9692 (t!46704 lt!602737) (select (arr!44942 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(assert (= (and d!147699 res!915440) b!1372120))

(assert (= (and b!1372120 (not res!915441)) b!1372121))

(declare-fun m!1255571 () Bool)

(assert (=> d!147699 m!1255571))

(assert (=> d!147699 m!1255369))

(declare-fun m!1255573 () Bool)

(assert (=> d!147699 m!1255573))

(assert (=> b!1372121 m!1255369))

(declare-fun m!1255575 () Bool)

(assert (=> b!1372121 m!1255575))

(assert (=> b!1371986 d!147699))

(assert (=> b!1372056 d!147579))

(declare-fun b!1372122 () Bool)

(declare-fun e!777326 () Bool)

(declare-fun e!777329 () Bool)

(assert (=> b!1372122 (= e!777326 e!777329)))

(declare-fun res!915443 () Bool)

(assert (=> b!1372122 (=> (not res!915443) (not e!777329))))

(declare-fun e!777327 () Bool)

(assert (=> b!1372122 (= res!915443 (not e!777327))))

(declare-fun res!915442 () Bool)

(assert (=> b!1372122 (=> (not res!915442) (not e!777327))))

(assert (=> b!1372122 (= res!915442 (validKeyInArray!0 (select (arr!44942 a!3861) (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001))))))

(declare-fun b!1372123 () Bool)

(declare-fun e!777328 () Bool)

(assert (=> b!1372123 (= e!777329 e!777328)))

(declare-fun c!127780 () Bool)

(assert (=> b!1372123 (= c!127780 (validKeyInArray!0 (select (arr!44942 a!3861) (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001))))))

(declare-fun b!1372124 () Bool)

(declare-fun call!65583 () Bool)

(assert (=> b!1372124 (= e!777328 call!65583)))

(declare-fun bm!65580 () Bool)

(assert (=> bm!65580 (= call!65583 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!127780 (Cons!32006 (select (arr!44942 a!3861) (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001)) (ite c!127768 (Cons!32006 (select (arr!44942 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) lt!602737) lt!602737)) (ite c!127768 (Cons!32006 (select (arr!44942 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) lt!602737) lt!602737))))))

(declare-fun b!1372125 () Bool)

(assert (=> b!1372125 (= e!777327 (contains!9692 (ite c!127768 (Cons!32006 (select (arr!44942 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) lt!602737) lt!602737) (select (arr!44942 a!3861) (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001))))))

(declare-fun b!1372126 () Bool)

(assert (=> b!1372126 (= e!777328 call!65583)))

(declare-fun d!147701 () Bool)

(declare-fun res!915444 () Bool)

(assert (=> d!147701 (=> res!915444 e!777326)))

(assert (=> d!147701 (= res!915444 (bvsge (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (size!45492 a!3861)))))

(assert (=> d!147701 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!127768 (Cons!32006 (select (arr!44942 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) lt!602737) lt!602737)) e!777326)))

(assert (= (and d!147701 (not res!915444)) b!1372122))

(assert (= (and b!1372122 res!915442) b!1372125))

(assert (= (and b!1372122 res!915443) b!1372123))

(assert (= (and b!1372123 c!127780) b!1372126))

(assert (= (and b!1372123 (not c!127780)) b!1372124))

(assert (= (or b!1372126 b!1372124) bm!65580))

(declare-fun m!1255577 () Bool)

(assert (=> b!1372122 m!1255577))

(assert (=> b!1372122 m!1255577))

(declare-fun m!1255579 () Bool)

(assert (=> b!1372122 m!1255579))

(assert (=> b!1372123 m!1255577))

(assert (=> b!1372123 m!1255577))

(assert (=> b!1372123 m!1255579))

(assert (=> bm!65580 m!1255577))

(declare-fun m!1255581 () Bool)

(assert (=> bm!65580 m!1255581))

(assert (=> b!1372125 m!1255577))

(assert (=> b!1372125 m!1255577))

(declare-fun m!1255583 () Bool)

(assert (=> b!1372125 m!1255583))

(assert (=> bm!65572 d!147701))

(declare-fun d!147703 () Bool)

(assert (=> d!147703 (= (validKeyInArray!0 (select (arr!44942 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))) (and (not (= (select (arr!44942 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44942 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1371984 d!147703))

(assert (=> b!1371983 d!147703))

(declare-fun d!147705 () Bool)

(declare-fun res!915445 () Bool)

(declare-fun e!777330 () Bool)

(assert (=> d!147705 (=> res!915445 e!777330)))

(assert (=> d!147705 (= res!915445 (is-Nil!32007 lt!602737))))

(assert (=> d!147705 (= (noDuplicate!2549 lt!602737) e!777330)))

(declare-fun b!1372127 () Bool)

(declare-fun e!777331 () Bool)

(assert (=> b!1372127 (= e!777330 e!777331)))

(declare-fun res!915446 () Bool)

(assert (=> b!1372127 (=> (not res!915446) (not e!777331))))

(assert (=> b!1372127 (= res!915446 (not (contains!9692 (t!46704 lt!602737) (h!33215 lt!602737))))))

(declare-fun b!1372128 () Bool)

(assert (=> b!1372128 (= e!777331 (noDuplicate!2549 (t!46704 lt!602737)))))

(assert (= (and d!147705 (not res!915445)) b!1372127))

(assert (= (and b!1372127 res!915446) b!1372128))

(declare-fun m!1255585 () Bool)

(assert (=> b!1372127 m!1255585))

(declare-fun m!1255587 () Bool)

(assert (=> b!1372128 m!1255587))

(assert (=> d!147591 d!147705))

(declare-fun d!147707 () Bool)

(assert (=> d!147707 (noDuplicate!2549 lt!602737)))

(assert (=> d!147707 true))

(declare-fun _$12!475 () Unit!45321)

(assert (=> d!147707 (= (choose!2019 lt!602737 lt!602735) _$12!475)))

(declare-fun bs!39327 () Bool)

(assert (= bs!39327 d!147707))

(assert (=> bs!39327 m!1255361))

(assert (=> d!147591 d!147707))

(declare-fun b!1372129 () Bool)

(declare-fun e!777335 () Bool)

(declare-fun e!777332 () Bool)

(assert (=> b!1372129 (= e!777335 e!777332)))

(declare-fun res!915448 () Bool)

(assert (=> b!1372129 (=> (not res!915448) (not e!777332))))

(assert (=> b!1372129 (= res!915448 (is-Cons!32006 lt!602735))))

(declare-fun b!1372131 () Bool)

(declare-fun e!777333 () Bool)

(assert (=> b!1372131 (= e!777333 (subseq!1094 (t!46704 lt!602737) (t!46704 lt!602735)))))

(declare-fun b!1372132 () Bool)

(declare-fun e!777334 () Bool)

(assert (=> b!1372132 (= e!777334 (subseq!1094 lt!602737 (t!46704 lt!602735)))))

(declare-fun b!1372130 () Bool)

(assert (=> b!1372130 (= e!777332 e!777334)))

(declare-fun res!915450 () Bool)

(assert (=> b!1372130 (=> res!915450 e!777334)))

(assert (=> b!1372130 (= res!915450 e!777333)))

(declare-fun res!915447 () Bool)

(assert (=> b!1372130 (=> (not res!915447) (not e!777333))))

(assert (=> b!1372130 (= res!915447 (= (h!33215 lt!602737) (h!33215 lt!602735)))))

(declare-fun d!147709 () Bool)

(declare-fun res!915449 () Bool)

(assert (=> d!147709 (=> res!915449 e!777335)))

(assert (=> d!147709 (= res!915449 (is-Nil!32007 lt!602737))))

(assert (=> d!147709 (= (subseq!1094 lt!602737 lt!602735) e!777335)))

(assert (= (and d!147709 (not res!915449)) b!1372129))

(assert (= (and b!1372129 res!915448) b!1372130))

(assert (= (and b!1372130 res!915447) b!1372131))

(assert (= (and b!1372130 (not res!915450)) b!1372132))

(declare-fun m!1255589 () Bool)

(assert (=> b!1372131 m!1255589))

(declare-fun m!1255591 () Bool)

(assert (=> b!1372132 m!1255591))

(assert (=> d!147591 d!147709))

(declare-fun d!147711 () Bool)

(declare-fun lt!602819 () Bool)

(assert (=> d!147711 (= lt!602819 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!742 (t!46704 newAcc!98))))))

(declare-fun e!777337 () Bool)

(assert (=> d!147711 (= lt!602819 e!777337)))

(declare-fun res!915451 () Bool)

(assert (=> d!147711 (=> (not res!915451) (not e!777337))))

(assert (=> d!147711 (= res!915451 (is-Cons!32006 (t!46704 newAcc!98)))))

(assert (=> d!147711 (= (contains!9692 (t!46704 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000) lt!602819)))

(declare-fun b!1372133 () Bool)

(declare-fun e!777336 () Bool)

(assert (=> b!1372133 (= e!777337 e!777336)))

(declare-fun res!915452 () Bool)

(assert (=> b!1372133 (=> res!915452 e!777336)))

(assert (=> b!1372133 (= res!915452 (= (h!33215 (t!46704 newAcc!98)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1372134 () Bool)

(assert (=> b!1372134 (= e!777336 (contains!9692 (t!46704 (t!46704 newAcc!98)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147711 res!915451) b!1372133))

(assert (= (and b!1372133 (not res!915452)) b!1372134))

(declare-fun m!1255593 () Bool)

(assert (=> d!147711 m!1255593))

(declare-fun m!1255595 () Bool)

(assert (=> d!147711 m!1255595))

(declare-fun m!1255597 () Bool)

(assert (=> b!1372134 m!1255597))

(assert (=> b!1372009 d!147711))

(declare-fun d!147713 () Bool)

(declare-fun res!915453 () Bool)

(declare-fun e!777338 () Bool)

(assert (=> d!147713 (=> res!915453 e!777338)))

(assert (=> d!147713 (= res!915453 (is-Nil!32007 newAcc!98))))

(assert (=> d!147713 (= (noDuplicate!2549 newAcc!98) e!777338)))

(declare-fun b!1372135 () Bool)

(declare-fun e!777339 () Bool)

(assert (=> b!1372135 (= e!777338 e!777339)))

(declare-fun res!915454 () Bool)

(assert (=> b!1372135 (=> (not res!915454) (not e!777339))))

(assert (=> b!1372135 (= res!915454 (not (contains!9692 (t!46704 newAcc!98) (h!33215 newAcc!98))))))

(declare-fun b!1372136 () Bool)

(assert (=> b!1372136 (= e!777339 (noDuplicate!2549 (t!46704 newAcc!98)))))

(assert (= (and d!147713 (not res!915453)) b!1372135))

(assert (= (and b!1372135 res!915454) b!1372136))

(declare-fun m!1255599 () Bool)

(assert (=> b!1372135 m!1255599))

(declare-fun m!1255601 () Bool)

(assert (=> b!1372136 m!1255601))

(assert (=> d!147645 d!147713))

(declare-fun d!147715 () Bool)

(assert (=> d!147715 (noDuplicate!2549 newAcc!98)))

(assert (=> d!147715 true))

(declare-fun _$12!476 () Unit!45321)

(assert (=> d!147715 (= (choose!2019 newAcc!98 acc!866) _$12!476)))

(declare-fun bs!39328 () Bool)

(assert (= bs!39328 d!147715))

(assert (=> bs!39328 m!1255469))

(assert (=> d!147645 d!147715))

(assert (=> d!147645 d!147617))

(assert (=> d!147601 d!147597))

(declare-fun d!147717 () Bool)

(assert (=> d!147717 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!602737)))

(assert (=> d!147717 true))

(declare-fun _$70!110 () Unit!45321)

(assert (=> d!147717 (= (choose!80 a!3861 lt!602735 lt!602737 (bvadd #b00000000000000000000000000000001 from!3239)) _$70!110)))

(declare-fun bs!39329 () Bool)

(assert (= bs!39329 d!147717))

(assert (=> bs!39329 m!1255229))

(assert (=> d!147601 d!147717))

(declare-fun b!1372137 () Bool)

(declare-fun e!777343 () Bool)

(declare-fun e!777340 () Bool)

(assert (=> b!1372137 (= e!777343 e!777340)))

(declare-fun res!915456 () Bool)

(assert (=> b!1372137 (=> (not res!915456) (not e!777340))))

(assert (=> b!1372137 (= res!915456 (is-Cons!32006 (t!46704 acc!866)))))

(declare-fun b!1372139 () Bool)

(declare-fun e!777341 () Bool)

(assert (=> b!1372139 (= e!777341 (subseq!1094 (t!46704 newAcc!98) (t!46704 (t!46704 acc!866))))))

(declare-fun b!1372140 () Bool)

(declare-fun e!777342 () Bool)

(assert (=> b!1372140 (= e!777342 (subseq!1094 newAcc!98 (t!46704 (t!46704 acc!866))))))

(declare-fun b!1372138 () Bool)

(assert (=> b!1372138 (= e!777340 e!777342)))

(declare-fun res!915458 () Bool)

(assert (=> b!1372138 (=> res!915458 e!777342)))

(assert (=> b!1372138 (= res!915458 e!777341)))

(declare-fun res!915455 () Bool)

(assert (=> b!1372138 (=> (not res!915455) (not e!777341))))

(assert (=> b!1372138 (= res!915455 (= (h!33215 newAcc!98) (h!33215 (t!46704 acc!866))))))

(declare-fun d!147719 () Bool)

(declare-fun res!915457 () Bool)

(assert (=> d!147719 (=> res!915457 e!777343)))

(assert (=> d!147719 (= res!915457 (is-Nil!32007 newAcc!98))))

(assert (=> d!147719 (= (subseq!1094 newAcc!98 (t!46704 acc!866)) e!777343)))

(assert (= (and d!147719 (not res!915457)) b!1372137))

(assert (= (and b!1372137 res!915456) b!1372138))

(assert (= (and b!1372138 res!915455) b!1372139))

(assert (= (and b!1372138 (not res!915458)) b!1372140))

(declare-fun m!1255603 () Bool)

(assert (=> b!1372139 m!1255603))

(declare-fun m!1255605 () Bool)

(assert (=> b!1372140 m!1255605))

(assert (=> b!1372045 d!147719))

(declare-fun b!1372141 () Bool)

(declare-fun e!777347 () Bool)

(declare-fun e!777344 () Bool)

(assert (=> b!1372141 (= e!777347 e!777344)))

(declare-fun res!915460 () Bool)

(assert (=> b!1372141 (=> (not res!915460) (not e!777344))))

(assert (=> b!1372141 (= res!915460 (is-Cons!32006 (t!46704 acc!866)))))

(declare-fun b!1372143 () Bool)

(declare-fun e!777345 () Bool)

(assert (=> b!1372143 (= e!777345 (subseq!1094 (t!46704 (t!46704 newAcc!98)) (t!46704 (t!46704 acc!866))))))

(declare-fun b!1372144 () Bool)

(declare-fun e!777346 () Bool)

(assert (=> b!1372144 (= e!777346 (subseq!1094 (t!46704 newAcc!98) (t!46704 (t!46704 acc!866))))))

(declare-fun b!1372142 () Bool)

(assert (=> b!1372142 (= e!777344 e!777346)))

(declare-fun res!915462 () Bool)

(assert (=> b!1372142 (=> res!915462 e!777346)))

(assert (=> b!1372142 (= res!915462 e!777345)))

