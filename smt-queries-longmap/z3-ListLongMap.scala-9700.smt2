; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114590 () Bool)

(assert start!114590)

(declare-fun b!1359693 () Bool)

(declare-datatypes ((Unit!44625 0))(
  ( (Unit!44626) )
))
(declare-fun e!771475 () Unit!44625)

(declare-fun lt!599516 () Unit!44625)

(assert (=> b!1359693 (= e!771475 lt!599516)))

(declare-fun lt!599518 () Unit!44625)

(declare-datatypes ((List!31802 0))(
  ( (Nil!31799) (Cons!31798 (h!33007 (_ BitVec 64)) (t!46467 List!31802)) )
))
(declare-fun acc!759 () List!31802)

(declare-fun lemmaListSubSeqRefl!0 (List!31802) Unit!44625)

(assert (=> b!1359693 (= lt!599518 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!860 (List!31802 List!31802) Bool)

(assert (=> b!1359693 (subseq!860 acc!759 acc!759)))

(declare-datatypes ((array!92484 0))(
  ( (array!92485 (arr!44683 (Array (_ BitVec 32) (_ BitVec 64))) (size!45235 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92484)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92484 List!31802 List!31802 (_ BitVec 32)) Unit!44625)

(declare-fun $colon$colon!865 (List!31802 (_ BitVec 64)) List!31802)

(assert (=> b!1359693 (= lt!599516 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!865 acc!759 (select (arr!44683 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92484 (_ BitVec 32) List!31802) Bool)

(assert (=> b!1359693 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1359694 () Bool)

(declare-fun res!904164 () Bool)

(declare-fun e!771474 () Bool)

(assert (=> b!1359694 (=> (not res!904164) (not e!771474))))

(declare-fun contains!9422 (List!31802 (_ BitVec 64)) Bool)

(assert (=> b!1359694 (= res!904164 (not (contains!9422 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359695 () Bool)

(declare-fun res!904166 () Bool)

(assert (=> b!1359695 (=> (not res!904166) (not e!771474))))

(declare-fun noDuplicate!2337 (List!31802) Bool)

(assert (=> b!1359695 (= res!904166 (noDuplicate!2337 acc!759))))

(declare-fun b!1359696 () Bool)

(declare-fun res!904165 () Bool)

(assert (=> b!1359696 (=> (not res!904165) (not e!771474))))

(assert (=> b!1359696 (= res!904165 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45235 a!3742)))))

(declare-fun b!1359697 () Bool)

(declare-fun res!904162 () Bool)

(assert (=> b!1359697 (=> (not res!904162) (not e!771474))))

(assert (=> b!1359697 (= res!904162 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31799))))

(declare-fun b!1359698 () Bool)

(declare-fun res!904157 () Bool)

(assert (=> b!1359698 (=> (not res!904157) (not e!771474))))

(assert (=> b!1359698 (= res!904157 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1359699 () Bool)

(declare-fun res!904159 () Bool)

(assert (=> b!1359699 (=> (not res!904159) (not e!771474))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1359699 (= res!904159 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45235 a!3742))))))

(declare-fun b!1359700 () Bool)

(declare-fun Unit!44627 () Unit!44625)

(assert (=> b!1359700 (= e!771475 Unit!44627)))

(declare-fun b!1359701 () Bool)

(declare-fun res!904161 () Bool)

(declare-fun e!771472 () Bool)

(assert (=> b!1359701 (=> (not res!904161) (not e!771472))))

(assert (=> b!1359701 (= res!904161 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1359702 () Bool)

(declare-fun lt!599514 () array!92484)

(assert (=> b!1359702 (= e!771472 (not (arrayNoDuplicates!0 lt!599514 from!3120 acc!759)))))

(assert (=> b!1359702 (arrayNoDuplicates!0 lt!599514 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1359702 (= lt!599514 (array!92485 (store (arr!44683 a!3742) i!1404 l!3587) (size!45235 a!3742)))))

(declare-fun lt!599517 () Unit!44625)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92484 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31802) Unit!44625)

(assert (=> b!1359702 (= lt!599517 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1359703 () Bool)

(declare-fun res!904158 () Bool)

(assert (=> b!1359703 (=> (not res!904158) (not e!771474))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1359703 (= res!904158 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1359704 () Bool)

(declare-fun res!904156 () Bool)

(assert (=> b!1359704 (=> (not res!904156) (not e!771474))))

(assert (=> b!1359704 (= res!904156 (not (contains!9422 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359705 () Bool)

(assert (=> b!1359705 (= e!771474 e!771472)))

(declare-fun res!904163 () Bool)

(assert (=> b!1359705 (=> (not res!904163) (not e!771472))))

(assert (=> b!1359705 (= res!904163 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599515 () Unit!44625)

(assert (=> b!1359705 (= lt!599515 e!771475)))

(declare-fun c!127211 () Bool)

(assert (=> b!1359705 (= c!127211 (validKeyInArray!0 (select (arr!44683 a!3742) from!3120)))))

(declare-fun res!904160 () Bool)

(assert (=> start!114590 (=> (not res!904160) (not e!771474))))

(assert (=> start!114590 (= res!904160 (and (bvslt (size!45235 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45235 a!3742))))))

(assert (=> start!114590 e!771474))

(assert (=> start!114590 true))

(declare-fun array_inv!33916 (array!92484) Bool)

(assert (=> start!114590 (array_inv!33916 a!3742)))

(assert (= (and start!114590 res!904160) b!1359695))

(assert (= (and b!1359695 res!904166) b!1359704))

(assert (= (and b!1359704 res!904156) b!1359694))

(assert (= (and b!1359694 res!904164) b!1359697))

(assert (= (and b!1359697 res!904162) b!1359698))

(assert (= (and b!1359698 res!904157) b!1359699))

(assert (= (and b!1359699 res!904159) b!1359703))

(assert (= (and b!1359703 res!904158) b!1359696))

(assert (= (and b!1359696 res!904165) b!1359705))

(assert (= (and b!1359705 c!127211) b!1359693))

(assert (= (and b!1359705 (not c!127211)) b!1359700))

(assert (= (and b!1359705 res!904163) b!1359701))

(assert (= (and b!1359701 res!904161) b!1359702))

(declare-fun m!1244587 () Bool)

(assert (=> b!1359695 m!1244587))

(declare-fun m!1244589 () Bool)

(assert (=> b!1359702 m!1244589))

(declare-fun m!1244591 () Bool)

(assert (=> b!1359702 m!1244591))

(declare-fun m!1244593 () Bool)

(assert (=> b!1359702 m!1244593))

(declare-fun m!1244595 () Bool)

(assert (=> b!1359702 m!1244595))

(declare-fun m!1244597 () Bool)

(assert (=> b!1359704 m!1244597))

(declare-fun m!1244599 () Bool)

(assert (=> start!114590 m!1244599))

(declare-fun m!1244601 () Bool)

(assert (=> b!1359693 m!1244601))

(declare-fun m!1244603 () Bool)

(assert (=> b!1359693 m!1244603))

(declare-fun m!1244605 () Bool)

(assert (=> b!1359693 m!1244605))

(declare-fun m!1244607 () Bool)

(assert (=> b!1359693 m!1244607))

(declare-fun m!1244609 () Bool)

(assert (=> b!1359693 m!1244609))

(assert (=> b!1359693 m!1244603))

(assert (=> b!1359693 m!1244605))

(declare-fun m!1244611 () Bool)

(assert (=> b!1359693 m!1244611))

(declare-fun m!1244613 () Bool)

(assert (=> b!1359703 m!1244613))

(declare-fun m!1244615 () Bool)

(assert (=> b!1359694 m!1244615))

(assert (=> b!1359705 m!1244603))

(assert (=> b!1359705 m!1244603))

(declare-fun m!1244617 () Bool)

(assert (=> b!1359705 m!1244617))

(declare-fun m!1244619 () Bool)

(assert (=> b!1359698 m!1244619))

(assert (=> b!1359701 m!1244609))

(declare-fun m!1244621 () Bool)

(assert (=> b!1359697 m!1244621))

(check-sat (not start!114590) (not b!1359697) (not b!1359694) (not b!1359704) (not b!1359703) (not b!1359701) (not b!1359693) (not b!1359698) (not b!1359705) (not b!1359702) (not b!1359695))
(check-sat)
(get-model)

(declare-fun d!145429 () Bool)

(declare-fun res!904240 () Bool)

(declare-fun e!771509 () Bool)

(assert (=> d!145429 (=> res!904240 e!771509)))

(assert (=> d!145429 (= res!904240 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45235 a!3742)))))

(assert (=> d!145429 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!771509)))

(declare-fun b!1359794 () Bool)

(declare-fun e!771510 () Bool)

(declare-fun call!65290 () Bool)

(assert (=> b!1359794 (= e!771510 call!65290)))

(declare-fun b!1359795 () Bool)

(assert (=> b!1359795 (= e!771510 call!65290)))

(declare-fun b!1359796 () Bool)

(declare-fun e!771508 () Bool)

(assert (=> b!1359796 (= e!771508 e!771510)))

(declare-fun c!127220 () Bool)

(assert (=> b!1359796 (= c!127220 (validKeyInArray!0 (select (arr!44683 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun bm!65287 () Bool)

(assert (=> bm!65287 (= call!65290 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127220 (Cons!31798 (select (arr!44683 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun e!771511 () Bool)

(declare-fun b!1359797 () Bool)

(assert (=> b!1359797 (= e!771511 (contains!9422 acc!759 (select (arr!44683 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1359798 () Bool)

(assert (=> b!1359798 (= e!771509 e!771508)))

(declare-fun res!904239 () Bool)

(assert (=> b!1359798 (=> (not res!904239) (not e!771508))))

(assert (=> b!1359798 (= res!904239 (not e!771511))))

(declare-fun res!904241 () Bool)

(assert (=> b!1359798 (=> (not res!904241) (not e!771511))))

(assert (=> b!1359798 (= res!904241 (validKeyInArray!0 (select (arr!44683 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(assert (= (and d!145429 (not res!904240)) b!1359798))

(assert (= (and b!1359798 res!904241) b!1359797))

(assert (= (and b!1359798 res!904239) b!1359796))

(assert (= (and b!1359796 c!127220) b!1359795))

(assert (= (and b!1359796 (not c!127220)) b!1359794))

(assert (= (or b!1359795 b!1359794) bm!65287))

(declare-fun m!1244695 () Bool)

(assert (=> b!1359796 m!1244695))

(assert (=> b!1359796 m!1244695))

(declare-fun m!1244697 () Bool)

(assert (=> b!1359796 m!1244697))

(assert (=> bm!65287 m!1244695))

(declare-fun m!1244699 () Bool)

(assert (=> bm!65287 m!1244699))

(assert (=> b!1359797 m!1244695))

(assert (=> b!1359797 m!1244695))

(declare-fun m!1244701 () Bool)

(assert (=> b!1359797 m!1244701))

(assert (=> b!1359798 m!1244695))

(assert (=> b!1359798 m!1244695))

(assert (=> b!1359798 m!1244697))

(assert (=> b!1359701 d!145429))

(declare-fun d!145431 () Bool)

(assert (=> d!145431 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1359703 d!145431))

(declare-fun d!145433 () Bool)

(declare-fun res!904243 () Bool)

(declare-fun e!771513 () Bool)

(assert (=> d!145433 (=> res!904243 e!771513)))

(assert (=> d!145433 (= res!904243 (bvsge #b00000000000000000000000000000000 (size!45235 a!3742)))))

(assert (=> d!145433 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31799) e!771513)))

(declare-fun b!1359799 () Bool)

(declare-fun e!771514 () Bool)

(declare-fun call!65291 () Bool)

(assert (=> b!1359799 (= e!771514 call!65291)))

(declare-fun b!1359800 () Bool)

(assert (=> b!1359800 (= e!771514 call!65291)))

(declare-fun b!1359801 () Bool)

(declare-fun e!771512 () Bool)

(assert (=> b!1359801 (= e!771512 e!771514)))

(declare-fun c!127221 () Bool)

(assert (=> b!1359801 (= c!127221 (validKeyInArray!0 (select (arr!44683 a!3742) #b00000000000000000000000000000000)))))

(declare-fun bm!65288 () Bool)

(assert (=> bm!65288 (= call!65291 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127221 (Cons!31798 (select (arr!44683 a!3742) #b00000000000000000000000000000000) Nil!31799) Nil!31799)))))

(declare-fun b!1359802 () Bool)

(declare-fun e!771515 () Bool)

(assert (=> b!1359802 (= e!771515 (contains!9422 Nil!31799 (select (arr!44683 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1359803 () Bool)

(assert (=> b!1359803 (= e!771513 e!771512)))

(declare-fun res!904242 () Bool)

(assert (=> b!1359803 (=> (not res!904242) (not e!771512))))

(assert (=> b!1359803 (= res!904242 (not e!771515))))

(declare-fun res!904244 () Bool)

(assert (=> b!1359803 (=> (not res!904244) (not e!771515))))

(assert (=> b!1359803 (= res!904244 (validKeyInArray!0 (select (arr!44683 a!3742) #b00000000000000000000000000000000)))))

(assert (= (and d!145433 (not res!904243)) b!1359803))

(assert (= (and b!1359803 res!904244) b!1359802))

(assert (= (and b!1359803 res!904242) b!1359801))

(assert (= (and b!1359801 c!127221) b!1359800))

(assert (= (and b!1359801 (not c!127221)) b!1359799))

(assert (= (or b!1359800 b!1359799) bm!65288))

(declare-fun m!1244703 () Bool)

(assert (=> b!1359801 m!1244703))

(assert (=> b!1359801 m!1244703))

(declare-fun m!1244705 () Bool)

(assert (=> b!1359801 m!1244705))

(assert (=> bm!65288 m!1244703))

(declare-fun m!1244707 () Bool)

(assert (=> bm!65288 m!1244707))

(assert (=> b!1359802 m!1244703))

(assert (=> b!1359802 m!1244703))

(declare-fun m!1244709 () Bool)

(assert (=> b!1359802 m!1244709))

(assert (=> b!1359803 m!1244703))

(assert (=> b!1359803 m!1244703))

(assert (=> b!1359803 m!1244705))

(assert (=> b!1359697 d!145433))

(declare-fun d!145435 () Bool)

(declare-fun res!904246 () Bool)

(declare-fun e!771517 () Bool)

(assert (=> d!145435 (=> res!904246 e!771517)))

(assert (=> d!145435 (= res!904246 (bvsge from!3120 (size!45235 lt!599514)))))

(assert (=> d!145435 (= (arrayNoDuplicates!0 lt!599514 from!3120 acc!759) e!771517)))

(declare-fun b!1359804 () Bool)

(declare-fun e!771518 () Bool)

(declare-fun call!65292 () Bool)

(assert (=> b!1359804 (= e!771518 call!65292)))

(declare-fun b!1359805 () Bool)

(assert (=> b!1359805 (= e!771518 call!65292)))

(declare-fun b!1359806 () Bool)

(declare-fun e!771516 () Bool)

(assert (=> b!1359806 (= e!771516 e!771518)))

(declare-fun c!127222 () Bool)

(assert (=> b!1359806 (= c!127222 (validKeyInArray!0 (select (arr!44683 lt!599514) from!3120)))))

(declare-fun bm!65289 () Bool)

(assert (=> bm!65289 (= call!65292 (arrayNoDuplicates!0 lt!599514 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127222 (Cons!31798 (select (arr!44683 lt!599514) from!3120) acc!759) acc!759)))))

(declare-fun e!771519 () Bool)

(declare-fun b!1359807 () Bool)

(assert (=> b!1359807 (= e!771519 (contains!9422 acc!759 (select (arr!44683 lt!599514) from!3120)))))

(declare-fun b!1359808 () Bool)

(assert (=> b!1359808 (= e!771517 e!771516)))

(declare-fun res!904245 () Bool)

(assert (=> b!1359808 (=> (not res!904245) (not e!771516))))

(assert (=> b!1359808 (= res!904245 (not e!771519))))

(declare-fun res!904247 () Bool)

(assert (=> b!1359808 (=> (not res!904247) (not e!771519))))

(assert (=> b!1359808 (= res!904247 (validKeyInArray!0 (select (arr!44683 lt!599514) from!3120)))))

(assert (= (and d!145435 (not res!904246)) b!1359808))

(assert (= (and b!1359808 res!904247) b!1359807))

(assert (= (and b!1359808 res!904245) b!1359806))

(assert (= (and b!1359806 c!127222) b!1359805))

(assert (= (and b!1359806 (not c!127222)) b!1359804))

(assert (= (or b!1359805 b!1359804) bm!65289))

(declare-fun m!1244711 () Bool)

(assert (=> b!1359806 m!1244711))

(assert (=> b!1359806 m!1244711))

(declare-fun m!1244713 () Bool)

(assert (=> b!1359806 m!1244713))

(assert (=> bm!65289 m!1244711))

(declare-fun m!1244715 () Bool)

(assert (=> bm!65289 m!1244715))

(assert (=> b!1359807 m!1244711))

(assert (=> b!1359807 m!1244711))

(declare-fun m!1244717 () Bool)

(assert (=> b!1359807 m!1244717))

(assert (=> b!1359808 m!1244711))

(assert (=> b!1359808 m!1244711))

(assert (=> b!1359808 m!1244713))

(assert (=> b!1359702 d!145435))

(declare-fun d!145437 () Bool)

(declare-fun res!904249 () Bool)

(declare-fun e!771521 () Bool)

(assert (=> d!145437 (=> res!904249 e!771521)))

(assert (=> d!145437 (= res!904249 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45235 lt!599514)))))

(assert (=> d!145437 (= (arrayNoDuplicates!0 lt!599514 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!771521)))

(declare-fun b!1359809 () Bool)

(declare-fun e!771522 () Bool)

(declare-fun call!65293 () Bool)

(assert (=> b!1359809 (= e!771522 call!65293)))

(declare-fun b!1359810 () Bool)

(assert (=> b!1359810 (= e!771522 call!65293)))

(declare-fun b!1359811 () Bool)

(declare-fun e!771520 () Bool)

(assert (=> b!1359811 (= e!771520 e!771522)))

(declare-fun c!127223 () Bool)

(assert (=> b!1359811 (= c!127223 (validKeyInArray!0 (select (arr!44683 lt!599514) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun bm!65290 () Bool)

(assert (=> bm!65290 (= call!65293 (arrayNoDuplicates!0 lt!599514 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127223 (Cons!31798 (select (arr!44683 lt!599514) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun b!1359812 () Bool)

(declare-fun e!771523 () Bool)

(assert (=> b!1359812 (= e!771523 (contains!9422 acc!759 (select (arr!44683 lt!599514) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1359813 () Bool)

(assert (=> b!1359813 (= e!771521 e!771520)))

(declare-fun res!904248 () Bool)

(assert (=> b!1359813 (=> (not res!904248) (not e!771520))))

(assert (=> b!1359813 (= res!904248 (not e!771523))))

(declare-fun res!904250 () Bool)

(assert (=> b!1359813 (=> (not res!904250) (not e!771523))))

(assert (=> b!1359813 (= res!904250 (validKeyInArray!0 (select (arr!44683 lt!599514) (bvadd #b00000000000000000000000000000001 from!3120))))))

(assert (= (and d!145437 (not res!904249)) b!1359813))

(assert (= (and b!1359813 res!904250) b!1359812))

(assert (= (and b!1359813 res!904248) b!1359811))

(assert (= (and b!1359811 c!127223) b!1359810))

(assert (= (and b!1359811 (not c!127223)) b!1359809))

(assert (= (or b!1359810 b!1359809) bm!65290))

(declare-fun m!1244719 () Bool)

(assert (=> b!1359811 m!1244719))

(assert (=> b!1359811 m!1244719))

(declare-fun m!1244721 () Bool)

(assert (=> b!1359811 m!1244721))

(assert (=> bm!65290 m!1244719))

(declare-fun m!1244723 () Bool)

(assert (=> bm!65290 m!1244723))

(assert (=> b!1359812 m!1244719))

(assert (=> b!1359812 m!1244719))

(declare-fun m!1244725 () Bool)

(assert (=> b!1359812 m!1244725))

(assert (=> b!1359813 m!1244719))

(assert (=> b!1359813 m!1244719))

(assert (=> b!1359813 m!1244721))

(assert (=> b!1359702 d!145437))

(declare-fun d!145439 () Bool)

(declare-fun e!771526 () Bool)

(assert (=> d!145439 e!771526))

(declare-fun res!904253 () Bool)

(assert (=> d!145439 (=> (not res!904253) (not e!771526))))

(assert (=> d!145439 (= res!904253 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45235 a!3742))))))

(declare-fun lt!599551 () Unit!44625)

(declare-fun choose!53 (array!92484 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31802) Unit!44625)

(assert (=> d!145439 (= lt!599551 (choose!53 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (=> d!145439 (bvslt (size!45235 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!145439 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) lt!599551)))

(declare-fun b!1359816 () Bool)

(assert (=> b!1359816 (= e!771526 (arrayNoDuplicates!0 (array!92485 (store (arr!44683 a!3742) i!1404 l!3587) (size!45235 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (= (and d!145439 res!904253) b!1359816))

(declare-fun m!1244727 () Bool)

(assert (=> d!145439 m!1244727))

(assert (=> b!1359816 m!1244593))

(declare-fun m!1244729 () Bool)

(assert (=> b!1359816 m!1244729))

(assert (=> b!1359702 d!145439))

(declare-fun d!145441 () Bool)

(assert (=> d!145441 (= (array_inv!33916 a!3742) (bvsge (size!45235 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114590 d!145441))

(declare-fun d!145443 () Bool)

(declare-fun lt!599554 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!686 (List!31802) (InoxSet (_ BitVec 64)))

(assert (=> d!145443 (= lt!599554 (select (content!686 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!771532 () Bool)

(assert (=> d!145443 (= lt!599554 e!771532)))

(declare-fun res!904258 () Bool)

(assert (=> d!145443 (=> (not res!904258) (not e!771532))))

(get-info :version)

(assert (=> d!145443 (= res!904258 ((_ is Cons!31798) acc!759))))

(assert (=> d!145443 (= (contains!9422 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599554)))

(declare-fun b!1359821 () Bool)

(declare-fun e!771531 () Bool)

(assert (=> b!1359821 (= e!771532 e!771531)))

(declare-fun res!904259 () Bool)

(assert (=> b!1359821 (=> res!904259 e!771531)))

(assert (=> b!1359821 (= res!904259 (= (h!33007 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1359822 () Bool)

(assert (=> b!1359822 (= e!771531 (contains!9422 (t!46467 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145443 res!904258) b!1359821))

(assert (= (and b!1359821 (not res!904259)) b!1359822))

(declare-fun m!1244731 () Bool)

(assert (=> d!145443 m!1244731))

(declare-fun m!1244733 () Bool)

(assert (=> d!145443 m!1244733))

(declare-fun m!1244735 () Bool)

(assert (=> b!1359822 m!1244735))

(assert (=> b!1359704 d!145443))

(declare-fun d!145445 () Bool)

(assert (=> d!145445 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!599557 () Unit!44625)

(declare-fun choose!80 (array!92484 List!31802 List!31802 (_ BitVec 32)) Unit!44625)

(assert (=> d!145445 (= lt!599557 (choose!80 a!3742 ($colon$colon!865 acc!759 (select (arr!44683 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> d!145445 (bvslt (size!45235 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!145445 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!865 acc!759 (select (arr!44683 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)) lt!599557)))

(declare-fun bs!38967 () Bool)

(assert (= bs!38967 d!145445))

(assert (=> bs!38967 m!1244609))

(assert (=> bs!38967 m!1244605))

(declare-fun m!1244737 () Bool)

(assert (=> bs!38967 m!1244737))

(assert (=> b!1359693 d!145445))

(declare-fun b!1359844 () Bool)

(declare-fun e!771551 () Bool)

(assert (=> b!1359844 (= e!771551 (subseq!860 acc!759 (t!46467 acc!759)))))

(declare-fun b!1359842 () Bool)

(declare-fun e!771553 () Bool)

(assert (=> b!1359842 (= e!771553 e!771551)))

(declare-fun res!904281 () Bool)

(assert (=> b!1359842 (=> res!904281 e!771551)))

(declare-fun e!771552 () Bool)

(assert (=> b!1359842 (= res!904281 e!771552)))

(declare-fun res!904280 () Bool)

(assert (=> b!1359842 (=> (not res!904280) (not e!771552))))

(assert (=> b!1359842 (= res!904280 (= (h!33007 acc!759) (h!33007 acc!759)))))

(declare-fun d!145449 () Bool)

(declare-fun res!904279 () Bool)

(declare-fun e!771554 () Bool)

(assert (=> d!145449 (=> res!904279 e!771554)))

(assert (=> d!145449 (= res!904279 ((_ is Nil!31799) acc!759))))

(assert (=> d!145449 (= (subseq!860 acc!759 acc!759) e!771554)))

(declare-fun b!1359841 () Bool)

(assert (=> b!1359841 (= e!771554 e!771553)))

(declare-fun res!904278 () Bool)

(assert (=> b!1359841 (=> (not res!904278) (not e!771553))))

(assert (=> b!1359841 (= res!904278 ((_ is Cons!31798) acc!759))))

(declare-fun b!1359843 () Bool)

(assert (=> b!1359843 (= e!771552 (subseq!860 (t!46467 acc!759) (t!46467 acc!759)))))

(assert (= (and d!145449 (not res!904279)) b!1359841))

(assert (= (and b!1359841 res!904278) b!1359842))

(assert (= (and b!1359842 res!904280) b!1359843))

(assert (= (and b!1359842 (not res!904281)) b!1359844))

(declare-fun m!1244745 () Bool)

(assert (=> b!1359844 m!1244745))

(declare-fun m!1244747 () Bool)

(assert (=> b!1359843 m!1244747))

(assert (=> b!1359693 d!145449))

(assert (=> b!1359693 d!145429))

(declare-fun d!145455 () Bool)

(assert (=> d!145455 (= ($colon$colon!865 acc!759 (select (arr!44683 a!3742) from!3120)) (Cons!31798 (select (arr!44683 a!3742) from!3120) acc!759))))

(assert (=> b!1359693 d!145455))

(declare-fun d!145459 () Bool)

(assert (=> d!145459 (subseq!860 acc!759 acc!759)))

(declare-fun lt!599567 () Unit!44625)

(declare-fun choose!36 (List!31802) Unit!44625)

(assert (=> d!145459 (= lt!599567 (choose!36 acc!759))))

(assert (=> d!145459 (= (lemmaListSubSeqRefl!0 acc!759) lt!599567)))

(declare-fun bs!38968 () Bool)

(assert (= bs!38968 d!145459))

(assert (=> bs!38968 m!1244611))

(declare-fun m!1244759 () Bool)

(assert (=> bs!38968 m!1244759))

(assert (=> b!1359693 d!145459))

(declare-fun d!145465 () Bool)

(declare-fun res!904287 () Bool)

(declare-fun e!771560 () Bool)

(assert (=> d!145465 (=> res!904287 e!771560)))

(assert (=> d!145465 (= res!904287 (bvsge from!3120 (size!45235 a!3742)))))

(assert (=> d!145465 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!771560)))

(declare-fun b!1359849 () Bool)

(declare-fun e!771561 () Bool)

(declare-fun call!65294 () Bool)

(assert (=> b!1359849 (= e!771561 call!65294)))

(declare-fun b!1359850 () Bool)

(assert (=> b!1359850 (= e!771561 call!65294)))

(declare-fun b!1359851 () Bool)

(declare-fun e!771559 () Bool)

(assert (=> b!1359851 (= e!771559 e!771561)))

(declare-fun c!127224 () Bool)

(assert (=> b!1359851 (= c!127224 (validKeyInArray!0 (select (arr!44683 a!3742) from!3120)))))

(declare-fun bm!65291 () Bool)

(assert (=> bm!65291 (= call!65294 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127224 (Cons!31798 (select (arr!44683 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1359852 () Bool)

(declare-fun e!771562 () Bool)

(assert (=> b!1359852 (= e!771562 (contains!9422 acc!759 (select (arr!44683 a!3742) from!3120)))))

(declare-fun b!1359853 () Bool)

(assert (=> b!1359853 (= e!771560 e!771559)))

(declare-fun res!904286 () Bool)

(assert (=> b!1359853 (=> (not res!904286) (not e!771559))))

(assert (=> b!1359853 (= res!904286 (not e!771562))))

(declare-fun res!904288 () Bool)

(assert (=> b!1359853 (=> (not res!904288) (not e!771562))))

(assert (=> b!1359853 (= res!904288 (validKeyInArray!0 (select (arr!44683 a!3742) from!3120)))))

(assert (= (and d!145465 (not res!904287)) b!1359853))

(assert (= (and b!1359853 res!904288) b!1359852))

(assert (= (and b!1359853 res!904286) b!1359851))

(assert (= (and b!1359851 c!127224) b!1359850))

(assert (= (and b!1359851 (not c!127224)) b!1359849))

(assert (= (or b!1359850 b!1359849) bm!65291))

(assert (=> b!1359851 m!1244603))

(assert (=> b!1359851 m!1244603))

(assert (=> b!1359851 m!1244617))

(assert (=> bm!65291 m!1244603))

(declare-fun m!1244761 () Bool)

(assert (=> bm!65291 m!1244761))

(assert (=> b!1359852 m!1244603))

(assert (=> b!1359852 m!1244603))

(declare-fun m!1244763 () Bool)

(assert (=> b!1359852 m!1244763))

(assert (=> b!1359853 m!1244603))

(assert (=> b!1359853 m!1244603))

(assert (=> b!1359853 m!1244617))

(assert (=> b!1359698 d!145465))

(declare-fun d!145467 () Bool)

(declare-fun res!904303 () Bool)

(declare-fun e!771579 () Bool)

(assert (=> d!145467 (=> res!904303 e!771579)))

(assert (=> d!145467 (= res!904303 ((_ is Nil!31799) acc!759))))

(assert (=> d!145467 (= (noDuplicate!2337 acc!759) e!771579)))

(declare-fun b!1359872 () Bool)

(declare-fun e!771580 () Bool)

(assert (=> b!1359872 (= e!771579 e!771580)))

(declare-fun res!904304 () Bool)

(assert (=> b!1359872 (=> (not res!904304) (not e!771580))))

(assert (=> b!1359872 (= res!904304 (not (contains!9422 (t!46467 acc!759) (h!33007 acc!759))))))

(declare-fun b!1359873 () Bool)

(assert (=> b!1359873 (= e!771580 (noDuplicate!2337 (t!46467 acc!759)))))

(assert (= (and d!145467 (not res!904303)) b!1359872))

(assert (= (and b!1359872 res!904304) b!1359873))

(declare-fun m!1244765 () Bool)

(assert (=> b!1359872 m!1244765))

(declare-fun m!1244767 () Bool)

(assert (=> b!1359873 m!1244767))

(assert (=> b!1359695 d!145467))

(declare-fun d!145469 () Bool)

(assert (=> d!145469 (= (validKeyInArray!0 (select (arr!44683 a!3742) from!3120)) (and (not (= (select (arr!44683 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44683 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1359705 d!145469))

(declare-fun d!145471 () Bool)

(declare-fun lt!599568 () Bool)

(assert (=> d!145471 (= lt!599568 (select (content!686 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!771584 () Bool)

(assert (=> d!145471 (= lt!599568 e!771584)))

(declare-fun res!904307 () Bool)

(assert (=> d!145471 (=> (not res!904307) (not e!771584))))

(assert (=> d!145471 (= res!904307 ((_ is Cons!31798) acc!759))))

(assert (=> d!145471 (= (contains!9422 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599568)))

(declare-fun b!1359876 () Bool)

(declare-fun e!771583 () Bool)

(assert (=> b!1359876 (= e!771584 e!771583)))

(declare-fun res!904308 () Bool)

(assert (=> b!1359876 (=> res!904308 e!771583)))

(assert (=> b!1359876 (= res!904308 (= (h!33007 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1359877 () Bool)

(assert (=> b!1359877 (= e!771583 (contains!9422 (t!46467 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145471 res!904307) b!1359876))

(assert (= (and b!1359876 (not res!904308)) b!1359877))

(assert (=> d!145471 m!1244731))

(declare-fun m!1244771 () Bool)

(assert (=> d!145471 m!1244771))

(declare-fun m!1244773 () Bool)

(assert (=> b!1359877 m!1244773))

(assert (=> b!1359694 d!145471))

(check-sat (not bm!65287) (not b!1359844) (not bm!65291) (not b!1359822) (not b!1359872) (not d!145459) (not b!1359796) (not bm!65289) (not bm!65290) (not b!1359807) (not b!1359816) (not b!1359812) (not b!1359806) (not b!1359873) (not b!1359802) (not b!1359877) (not b!1359843) (not b!1359853) (not d!145471) (not d!145443) (not b!1359798) (not bm!65288) (not b!1359852) (not d!145445) (not b!1359813) (not b!1359797) (not b!1359801) (not d!145439) (not b!1359811) (not b!1359851) (not b!1359808) (not b!1359803))
(check-sat)
