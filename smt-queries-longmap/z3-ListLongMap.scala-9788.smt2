; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116212 () Bool)

(assert start!116212)

(declare-fun b!1372293 () Bool)

(declare-fun res!915592 () Bool)

(declare-fun e!777443 () Bool)

(assert (=> b!1372293 (=> (not res!915592) (not e!777443))))

(declare-datatypes ((List!32014 0))(
  ( (Nil!32011) (Cons!32010 (h!33219 (_ BitVec 64)) (t!46708 List!32014)) )
))
(declare-fun acc!866 () List!32014)

(declare-fun noDuplicate!2553 (List!32014) Bool)

(assert (=> b!1372293 (= res!915592 (noDuplicate!2553 acc!866))))

(declare-fun b!1372294 () Bool)

(declare-fun res!915588 () Bool)

(assert (=> b!1372294 (=> (not res!915588) (not e!777443))))

(declare-fun contains!9696 (List!32014 (_ BitVec 64)) Bool)

(assert (=> b!1372294 (= res!915588 (not (contains!9696 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372295 () Bool)

(declare-fun res!915593 () Bool)

(assert (=> b!1372295 (=> (not res!915593) (not e!777443))))

(declare-fun newAcc!98 () List!32014)

(assert (=> b!1372295 (= res!915593 (not (contains!9696 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372296 () Bool)

(declare-fun res!915591 () Bool)

(assert (=> b!1372296 (=> (not res!915591) (not e!777443))))

(assert (=> b!1372296 (= res!915591 (not (contains!9696 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!915595 () Bool)

(assert (=> start!116212 (=> (not res!915595) (not e!777443))))

(declare-datatypes ((array!93068 0))(
  ( (array!93069 (arr!44946 (Array (_ BitVec 32) (_ BitVec 64))) (size!45496 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93068)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!116212 (= res!915595 (and (bvslt (size!45496 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45496 a!3861))))))

(assert (=> start!116212 e!777443))

(declare-fun array_inv!33974 (array!93068) Bool)

(assert (=> start!116212 (array_inv!33974 a!3861)))

(assert (=> start!116212 true))

(declare-fun b!1372297 () Bool)

(declare-fun res!915594 () Bool)

(declare-fun e!777444 () Bool)

(assert (=> b!1372297 (=> (not res!915594) (not e!777444))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1372297 (= res!915594 (validKeyInArray!0 (select (arr!44946 a!3861) from!3239)))))

(declare-fun b!1372298 () Bool)

(declare-fun res!915585 () Bool)

(assert (=> b!1372298 (=> (not res!915585) (not e!777443))))

(assert (=> b!1372298 (= res!915585 (not (contains!9696 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372299 () Bool)

(declare-fun res!915589 () Bool)

(assert (=> b!1372299 (=> (not res!915589) (not e!777444))))

(assert (=> b!1372299 (= res!915589 (bvslt from!3239 (size!45496 a!3861)))))

(declare-fun b!1372300 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93068 (_ BitVec 32) List!32014) Bool)

(assert (=> b!1372300 (= e!777444 (not (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98)))))

(declare-fun b!1372301 () Bool)

(declare-fun res!915590 () Bool)

(assert (=> b!1372301 (=> (not res!915590) (not e!777443))))

(declare-fun subseq!1098 (List!32014 List!32014) Bool)

(assert (=> b!1372301 (= res!915590 (subseq!1098 newAcc!98 acc!866))))

(declare-fun b!1372302 () Bool)

(declare-fun res!915587 () Bool)

(assert (=> b!1372302 (=> (not res!915587) (not e!777444))))

(assert (=> b!1372302 (= res!915587 (contains!9696 acc!866 (select (arr!44946 a!3861) from!3239)))))

(declare-fun b!1372303 () Bool)

(assert (=> b!1372303 (= e!777443 e!777444)))

(declare-fun res!915586 () Bool)

(assert (=> b!1372303 (=> (not res!915586) (not e!777444))))

(assert (=> b!1372303 (= res!915586 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45329 0))(
  ( (Unit!45330) )
))
(declare-fun lt!602839 () Unit!45329)

(declare-fun noDuplicateSubseq!285 (List!32014 List!32014) Unit!45329)

(assert (=> b!1372303 (= lt!602839 (noDuplicateSubseq!285 newAcc!98 acc!866))))

(assert (= (and start!116212 res!915595) b!1372293))

(assert (= (and b!1372293 res!915592) b!1372294))

(assert (= (and b!1372294 res!915588) b!1372296))

(assert (= (and b!1372296 res!915591) b!1372295))

(assert (= (and b!1372295 res!915593) b!1372298))

(assert (= (and b!1372298 res!915585) b!1372301))

(assert (= (and b!1372301 res!915590) b!1372303))

(assert (= (and b!1372303 res!915586) b!1372299))

(assert (= (and b!1372299 res!915589) b!1372297))

(assert (= (and b!1372297 res!915594) b!1372302))

(assert (= (and b!1372302 res!915587) b!1372300))

(declare-fun m!1255773 () Bool)

(assert (=> b!1372297 m!1255773))

(assert (=> b!1372297 m!1255773))

(declare-fun m!1255775 () Bool)

(assert (=> b!1372297 m!1255775))

(declare-fun m!1255777 () Bool)

(assert (=> b!1372296 m!1255777))

(declare-fun m!1255779 () Bool)

(assert (=> b!1372300 m!1255779))

(declare-fun m!1255781 () Bool)

(assert (=> b!1372298 m!1255781))

(declare-fun m!1255783 () Bool)

(assert (=> b!1372294 m!1255783))

(declare-fun m!1255785 () Bool)

(assert (=> b!1372301 m!1255785))

(declare-fun m!1255787 () Bool)

(assert (=> start!116212 m!1255787))

(declare-fun m!1255789 () Bool)

(assert (=> b!1372303 m!1255789))

(declare-fun m!1255791 () Bool)

(assert (=> b!1372303 m!1255791))

(assert (=> b!1372302 m!1255773))

(assert (=> b!1372302 m!1255773))

(declare-fun m!1255793 () Bool)

(assert (=> b!1372302 m!1255793))

(declare-fun m!1255795 () Bool)

(assert (=> b!1372295 m!1255795))

(declare-fun m!1255797 () Bool)

(assert (=> b!1372293 m!1255797))

(check-sat (not b!1372293) (not b!1372303) (not b!1372298) (not b!1372300) (not b!1372295) (not b!1372296) (not b!1372302) (not start!116212) (not b!1372297) (not b!1372301) (not b!1372294))
(check-sat)
(get-model)

(declare-fun d!147797 () Bool)

(declare-fun lt!602847 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!745 (List!32014) (InoxSet (_ BitVec 64)))

(assert (=> d!147797 (= lt!602847 (select (content!745 acc!866) (select (arr!44946 a!3861) from!3239)))))

(declare-fun e!777464 () Bool)

(assert (=> d!147797 (= lt!602847 e!777464)))

(declare-fun res!915638 () Bool)

(assert (=> d!147797 (=> (not res!915638) (not e!777464))))

(get-info :version)

(assert (=> d!147797 (= res!915638 ((_ is Cons!32010) acc!866))))

(assert (=> d!147797 (= (contains!9696 acc!866 (select (arr!44946 a!3861) from!3239)) lt!602847)))

(declare-fun b!1372345 () Bool)

(declare-fun e!777463 () Bool)

(assert (=> b!1372345 (= e!777464 e!777463)))

(declare-fun res!915637 () Bool)

(assert (=> b!1372345 (=> res!915637 e!777463)))

(assert (=> b!1372345 (= res!915637 (= (h!33219 acc!866) (select (arr!44946 a!3861) from!3239)))))

(declare-fun b!1372346 () Bool)

(assert (=> b!1372346 (= e!777463 (contains!9696 (t!46708 acc!866) (select (arr!44946 a!3861) from!3239)))))

(assert (= (and d!147797 res!915638) b!1372345))

(assert (= (and b!1372345 (not res!915637)) b!1372346))

(declare-fun m!1255825 () Bool)

(assert (=> d!147797 m!1255825))

(assert (=> d!147797 m!1255773))

(declare-fun m!1255827 () Bool)

(assert (=> d!147797 m!1255827))

(assert (=> b!1372346 m!1255773))

(declare-fun m!1255829 () Bool)

(assert (=> b!1372346 m!1255829))

(assert (=> b!1372302 d!147797))

(declare-fun d!147801 () Bool)

(assert (=> d!147801 (= (validKeyInArray!0 (select (arr!44946 a!3861) from!3239)) (and (not (= (select (arr!44946 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44946 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1372297 d!147801))

(declare-fun d!147807 () Bool)

(declare-fun lt!602850 () Bool)

(assert (=> d!147807 (= lt!602850 (select (content!745 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!777470 () Bool)

(assert (=> d!147807 (= lt!602850 e!777470)))

(declare-fun res!915644 () Bool)

(assert (=> d!147807 (=> (not res!915644) (not e!777470))))

(assert (=> d!147807 (= res!915644 ((_ is Cons!32010) newAcc!98))))

(assert (=> d!147807 (= (contains!9696 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602850)))

(declare-fun b!1372351 () Bool)

(declare-fun e!777469 () Bool)

(assert (=> b!1372351 (= e!777470 e!777469)))

(declare-fun res!915643 () Bool)

(assert (=> b!1372351 (=> res!915643 e!777469)))

(assert (=> b!1372351 (= res!915643 (= (h!33219 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1372352 () Bool)

(assert (=> b!1372352 (= e!777469 (contains!9696 (t!46708 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147807 res!915644) b!1372351))

(assert (= (and b!1372351 (not res!915643)) b!1372352))

(declare-fun m!1255843 () Bool)

(assert (=> d!147807 m!1255843))

(declare-fun m!1255845 () Bool)

(assert (=> d!147807 m!1255845))

(declare-fun m!1255847 () Bool)

(assert (=> b!1372352 m!1255847))

(assert (=> b!1372295 d!147807))

(declare-fun d!147809 () Bool)

(declare-fun lt!602851 () Bool)

(assert (=> d!147809 (= lt!602851 (select (content!745 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!777472 () Bool)

(assert (=> d!147809 (= lt!602851 e!777472)))

(declare-fun res!915646 () Bool)

(assert (=> d!147809 (=> (not res!915646) (not e!777472))))

(assert (=> d!147809 (= res!915646 ((_ is Cons!32010) acc!866))))

(assert (=> d!147809 (= (contains!9696 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602851)))

(declare-fun b!1372353 () Bool)

(declare-fun e!777471 () Bool)

(assert (=> b!1372353 (= e!777472 e!777471)))

(declare-fun res!915645 () Bool)

(assert (=> b!1372353 (=> res!915645 e!777471)))

(assert (=> b!1372353 (= res!915645 (= (h!33219 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1372354 () Bool)

(assert (=> b!1372354 (= e!777471 (contains!9696 (t!46708 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147809 res!915646) b!1372353))

(assert (= (and b!1372353 (not res!915645)) b!1372354))

(assert (=> d!147809 m!1255825))

(declare-fun m!1255849 () Bool)

(assert (=> d!147809 m!1255849))

(declare-fun m!1255851 () Bool)

(assert (=> b!1372354 m!1255851))

(assert (=> b!1372296 d!147809))

(declare-fun d!147811 () Bool)

(declare-fun res!915667 () Bool)

(declare-fun e!777495 () Bool)

(assert (=> d!147811 (=> res!915667 e!777495)))

(assert (=> d!147811 (= res!915667 ((_ is Nil!32011) newAcc!98))))

(assert (=> d!147811 (= (subseq!1098 newAcc!98 acc!866) e!777495)))

(declare-fun b!1372382 () Bool)

(declare-fun e!777497 () Bool)

(assert (=> b!1372382 (= e!777497 (subseq!1098 newAcc!98 (t!46708 acc!866)))))

(declare-fun b!1372380 () Bool)

(declare-fun e!777498 () Bool)

(assert (=> b!1372380 (= e!777498 e!777497)))

(declare-fun res!915669 () Bool)

(assert (=> b!1372380 (=> res!915669 e!777497)))

(declare-fun e!777496 () Bool)

(assert (=> b!1372380 (= res!915669 e!777496)))

(declare-fun res!915668 () Bool)

(assert (=> b!1372380 (=> (not res!915668) (not e!777496))))

(assert (=> b!1372380 (= res!915668 (= (h!33219 newAcc!98) (h!33219 acc!866)))))

(declare-fun b!1372379 () Bool)

(assert (=> b!1372379 (= e!777495 e!777498)))

(declare-fun res!915670 () Bool)

(assert (=> b!1372379 (=> (not res!915670) (not e!777498))))

(assert (=> b!1372379 (= res!915670 ((_ is Cons!32010) acc!866))))

(declare-fun b!1372381 () Bool)

(assert (=> b!1372381 (= e!777496 (subseq!1098 (t!46708 newAcc!98) (t!46708 acc!866)))))

(assert (= (and d!147811 (not res!915667)) b!1372379))

(assert (= (and b!1372379 res!915670) b!1372380))

(assert (= (and b!1372380 res!915668) b!1372381))

(assert (= (and b!1372380 (not res!915669)) b!1372382))

(declare-fun m!1255859 () Bool)

(assert (=> b!1372382 m!1255859))

(declare-fun m!1255861 () Bool)

(assert (=> b!1372381 m!1255861))

(assert (=> b!1372301 d!147811))

(declare-fun d!147817 () Bool)

(declare-fun lt!602855 () Bool)

(assert (=> d!147817 (= lt!602855 (select (content!745 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!777500 () Bool)

(assert (=> d!147817 (= lt!602855 e!777500)))

(declare-fun res!915672 () Bool)

(assert (=> d!147817 (=> (not res!915672) (not e!777500))))

(assert (=> d!147817 (= res!915672 ((_ is Cons!32010) acc!866))))

(assert (=> d!147817 (= (contains!9696 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602855)))

(declare-fun b!1372383 () Bool)

(declare-fun e!777499 () Bool)

(assert (=> b!1372383 (= e!777500 e!777499)))

(declare-fun res!915671 () Bool)

(assert (=> b!1372383 (=> res!915671 e!777499)))

(assert (=> b!1372383 (= res!915671 (= (h!33219 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1372384 () Bool)

(assert (=> b!1372384 (= e!777499 (contains!9696 (t!46708 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147817 res!915672) b!1372383))

(assert (= (and b!1372383 (not res!915671)) b!1372384))

(assert (=> d!147817 m!1255825))

(declare-fun m!1255863 () Bool)

(assert (=> d!147817 m!1255863))

(declare-fun m!1255865 () Bool)

(assert (=> b!1372384 m!1255865))

(assert (=> b!1372294 d!147817))

(declare-fun b!1372427 () Bool)

(declare-fun e!777543 () Bool)

(declare-fun e!777542 () Bool)

(assert (=> b!1372427 (= e!777543 e!777542)))

(declare-fun c!127799 () Bool)

(assert (=> b!1372427 (= c!127799 (validKeyInArray!0 (select (arr!44946 a!3861) from!3239)))))

(declare-fun e!777541 () Bool)

(declare-fun b!1372428 () Bool)

(assert (=> b!1372428 (= e!777541 (contains!9696 newAcc!98 (select (arr!44946 a!3861) from!3239)))))

(declare-fun b!1372429 () Bool)

(declare-fun call!65594 () Bool)

(assert (=> b!1372429 (= e!777542 call!65594)))

(declare-fun d!147819 () Bool)

(declare-fun res!915709 () Bool)

(declare-fun e!777540 () Bool)

(assert (=> d!147819 (=> res!915709 e!777540)))

(assert (=> d!147819 (= res!915709 (bvsge from!3239 (size!45496 a!3861)))))

(assert (=> d!147819 (= (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98) e!777540)))

(declare-fun bm!65591 () Bool)

(assert (=> bm!65591 (= call!65594 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127799 (Cons!32010 (select (arr!44946 a!3861) from!3239) newAcc!98) newAcc!98)))))

(declare-fun b!1372430 () Bool)

(assert (=> b!1372430 (= e!777540 e!777543)))

(declare-fun res!915711 () Bool)

(assert (=> b!1372430 (=> (not res!915711) (not e!777543))))

(assert (=> b!1372430 (= res!915711 (not e!777541))))

(declare-fun res!915710 () Bool)

(assert (=> b!1372430 (=> (not res!915710) (not e!777541))))

(assert (=> b!1372430 (= res!915710 (validKeyInArray!0 (select (arr!44946 a!3861) from!3239)))))

(declare-fun b!1372431 () Bool)

(assert (=> b!1372431 (= e!777542 call!65594)))

(assert (= (and d!147819 (not res!915709)) b!1372430))

(assert (= (and b!1372430 res!915710) b!1372428))

(assert (= (and b!1372430 res!915711) b!1372427))

(assert (= (and b!1372427 c!127799) b!1372431))

(assert (= (and b!1372427 (not c!127799)) b!1372429))

(assert (= (or b!1372431 b!1372429) bm!65591))

(assert (=> b!1372427 m!1255773))

(assert (=> b!1372427 m!1255773))

(assert (=> b!1372427 m!1255775))

(assert (=> b!1372428 m!1255773))

(assert (=> b!1372428 m!1255773))

(declare-fun m!1255885 () Bool)

(assert (=> b!1372428 m!1255885))

(assert (=> bm!65591 m!1255773))

(declare-fun m!1255887 () Bool)

(assert (=> bm!65591 m!1255887))

(assert (=> b!1372430 m!1255773))

(assert (=> b!1372430 m!1255773))

(assert (=> b!1372430 m!1255775))

(assert (=> b!1372300 d!147819))

(declare-fun d!147833 () Bool)

(assert (=> d!147833 (= (array_inv!33974 a!3861) (bvsge (size!45496 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!116212 d!147833))

(declare-fun d!147837 () Bool)

(declare-fun lt!602860 () Bool)

(assert (=> d!147837 (= lt!602860 (select (content!745 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!777547 () Bool)

(assert (=> d!147837 (= lt!602860 e!777547)))

(declare-fun res!915715 () Bool)

(assert (=> d!147837 (=> (not res!915715) (not e!777547))))

(assert (=> d!147837 (= res!915715 ((_ is Cons!32010) newAcc!98))))

(assert (=> d!147837 (= (contains!9696 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602860)))

(declare-fun b!1372434 () Bool)

(declare-fun e!777546 () Bool)

(assert (=> b!1372434 (= e!777547 e!777546)))

(declare-fun res!915714 () Bool)

(assert (=> b!1372434 (=> res!915714 e!777546)))

(assert (=> b!1372434 (= res!915714 (= (h!33219 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1372435 () Bool)

(assert (=> b!1372435 (= e!777546 (contains!9696 (t!46708 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147837 res!915715) b!1372434))

(assert (= (and b!1372434 (not res!915714)) b!1372435))

(assert (=> d!147837 m!1255843))

(declare-fun m!1255893 () Bool)

(assert (=> d!147837 m!1255893))

(declare-fun m!1255895 () Bool)

(assert (=> b!1372435 m!1255895))

(assert (=> b!1372298 d!147837))

(declare-fun b!1372436 () Bool)

(declare-fun e!777551 () Bool)

(declare-fun e!777550 () Bool)

(assert (=> b!1372436 (= e!777551 e!777550)))

(declare-fun c!127800 () Bool)

(assert (=> b!1372436 (= c!127800 (validKeyInArray!0 (select (arr!44946 a!3861) from!3239)))))

(declare-fun b!1372437 () Bool)

(declare-fun e!777549 () Bool)

(assert (=> b!1372437 (= e!777549 (contains!9696 acc!866 (select (arr!44946 a!3861) from!3239)))))

(declare-fun b!1372438 () Bool)

(declare-fun call!65595 () Bool)

(assert (=> b!1372438 (= e!777550 call!65595)))

(declare-fun d!147839 () Bool)

(declare-fun res!915716 () Bool)

(declare-fun e!777548 () Bool)

(assert (=> d!147839 (=> res!915716 e!777548)))

(assert (=> d!147839 (= res!915716 (bvsge from!3239 (size!45496 a!3861)))))

(assert (=> d!147839 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!777548)))

(declare-fun bm!65592 () Bool)

(assert (=> bm!65592 (= call!65595 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127800 (Cons!32010 (select (arr!44946 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1372439 () Bool)

(assert (=> b!1372439 (= e!777548 e!777551)))

(declare-fun res!915718 () Bool)

(assert (=> b!1372439 (=> (not res!915718) (not e!777551))))

(assert (=> b!1372439 (= res!915718 (not e!777549))))

(declare-fun res!915717 () Bool)

(assert (=> b!1372439 (=> (not res!915717) (not e!777549))))

(assert (=> b!1372439 (= res!915717 (validKeyInArray!0 (select (arr!44946 a!3861) from!3239)))))

(declare-fun b!1372440 () Bool)

(assert (=> b!1372440 (= e!777550 call!65595)))

(assert (= (and d!147839 (not res!915716)) b!1372439))

(assert (= (and b!1372439 res!915717) b!1372437))

(assert (= (and b!1372439 res!915718) b!1372436))

(assert (= (and b!1372436 c!127800) b!1372440))

(assert (= (and b!1372436 (not c!127800)) b!1372438))

(assert (= (or b!1372440 b!1372438) bm!65592))

(assert (=> b!1372436 m!1255773))

(assert (=> b!1372436 m!1255773))

(assert (=> b!1372436 m!1255775))

(assert (=> b!1372437 m!1255773))

(assert (=> b!1372437 m!1255773))

(assert (=> b!1372437 m!1255793))

(assert (=> bm!65592 m!1255773))

(declare-fun m!1255897 () Bool)

(assert (=> bm!65592 m!1255897))

(assert (=> b!1372439 m!1255773))

(assert (=> b!1372439 m!1255773))

(assert (=> b!1372439 m!1255775))

(assert (=> b!1372303 d!147839))

(declare-fun d!147843 () Bool)

(assert (=> d!147843 (noDuplicate!2553 newAcc!98)))

(declare-fun lt!602863 () Unit!45329)

(declare-fun choose!2021 (List!32014 List!32014) Unit!45329)

(assert (=> d!147843 (= lt!602863 (choose!2021 newAcc!98 acc!866))))

(declare-fun e!777574 () Bool)

(assert (=> d!147843 e!777574))

(declare-fun res!915738 () Bool)

(assert (=> d!147843 (=> (not res!915738) (not e!777574))))

(assert (=> d!147843 (= res!915738 (subseq!1098 newAcc!98 acc!866))))

(assert (=> d!147843 (= (noDuplicateSubseq!285 newAcc!98 acc!866) lt!602863)))

(declare-fun b!1372466 () Bool)

(assert (=> b!1372466 (= e!777574 (noDuplicate!2553 acc!866))))

(assert (= (and d!147843 res!915738) b!1372466))

(declare-fun m!1255903 () Bool)

(assert (=> d!147843 m!1255903))

(declare-fun m!1255905 () Bool)

(assert (=> d!147843 m!1255905))

(assert (=> d!147843 m!1255785))

(assert (=> b!1372466 m!1255797))

(assert (=> b!1372303 d!147843))

(declare-fun d!147847 () Bool)

(declare-fun res!915758 () Bool)

(declare-fun e!777595 () Bool)

(assert (=> d!147847 (=> res!915758 e!777595)))

(assert (=> d!147847 (= res!915758 ((_ is Nil!32011) acc!866))))

(assert (=> d!147847 (= (noDuplicate!2553 acc!866) e!777595)))

(declare-fun b!1372488 () Bool)

(declare-fun e!777596 () Bool)

(assert (=> b!1372488 (= e!777595 e!777596)))

(declare-fun res!915759 () Bool)

(assert (=> b!1372488 (=> (not res!915759) (not e!777596))))

(assert (=> b!1372488 (= res!915759 (not (contains!9696 (t!46708 acc!866) (h!33219 acc!866))))))

(declare-fun b!1372489 () Bool)

(assert (=> b!1372489 (= e!777596 (noDuplicate!2553 (t!46708 acc!866)))))

(assert (= (and d!147847 (not res!915758)) b!1372488))

(assert (= (and b!1372488 res!915759) b!1372489))

(declare-fun m!1255933 () Bool)

(assert (=> b!1372488 m!1255933))

(declare-fun m!1255935 () Bool)

(assert (=> b!1372489 m!1255935))

(assert (=> b!1372293 d!147847))

(check-sat (not b!1372354) (not b!1372384) (not bm!65591) (not b!1372381) (not b!1372430) (not b!1372427) (not b!1372435) (not d!147817) (not b!1372428) (not d!147797) (not b!1372352) (not b!1372489) (not b!1372346) (not b!1372439) (not b!1372437) (not bm!65592) (not d!147809) (not d!147837) (not b!1372488) (not d!147807) (not b!1372436) (not b!1372466) (not b!1372382) (not d!147843))
(check-sat)
