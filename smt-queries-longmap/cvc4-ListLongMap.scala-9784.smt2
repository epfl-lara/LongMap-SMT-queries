; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116040 () Bool)

(assert start!116040)

(declare-fun b!1371028 () Bool)

(declare-fun res!914448 () Bool)

(declare-fun e!776611 () Bool)

(assert (=> b!1371028 (=> (not res!914448) (not e!776611))))

(declare-datatypes ((List!32003 0))(
  ( (Nil!32000) (Cons!31999 (h!33208 (_ BitVec 64)) (t!46697 List!32003)) )
))
(declare-fun lt!602563 () List!32003)

(declare-fun contains!9685 (List!32003 (_ BitVec 64)) Bool)

(assert (=> b!1371028 (= res!914448 (not (contains!9685 lt!602563 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371029 () Bool)

(declare-fun res!914439 () Bool)

(assert (=> b!1371029 (=> (not res!914439) (not e!776611))))

(declare-fun lt!602561 () List!32003)

(assert (=> b!1371029 (= res!914439 (not (contains!9685 lt!602561 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371030 () Bool)

(declare-fun res!914433 () Bool)

(declare-fun e!776612 () Bool)

(assert (=> b!1371030 (=> (not res!914433) (not e!776612))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!93037 0))(
  ( (array!93038 (arr!44935 (Array (_ BitVec 32) (_ BitVec 64))) (size!45485 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93037)

(assert (=> b!1371030 (= res!914433 (bvslt from!3239 (size!45485 a!3861)))))

(declare-fun b!1371031 () Bool)

(assert (=> b!1371031 (= e!776612 e!776611)))

(declare-fun res!914449 () Bool)

(assert (=> b!1371031 (=> (not res!914449) (not e!776611))))

(assert (=> b!1371031 (= res!914449 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun newAcc!98 () List!32003)

(assert (=> b!1371031 (= lt!602563 (Cons!31999 (select (arr!44935 a!3861) from!3239) newAcc!98))))

(declare-fun acc!866 () List!32003)

(assert (=> b!1371031 (= lt!602561 (Cons!31999 (select (arr!44935 a!3861) from!3239) acc!866))))

(declare-fun b!1371032 () Bool)

(declare-fun res!914438 () Bool)

(declare-fun e!776613 () Bool)

(assert (=> b!1371032 (=> (not res!914438) (not e!776613))))

(declare-fun subseq!1087 (List!32003 List!32003) Bool)

(assert (=> b!1371032 (= res!914438 (subseq!1087 newAcc!98 acc!866))))

(declare-fun b!1371033 () Bool)

(declare-fun res!914441 () Bool)

(assert (=> b!1371033 (=> (not res!914441) (not e!776611))))

(assert (=> b!1371033 (= res!914441 (not (contains!9685 lt!602563 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371034 () Bool)

(declare-fun res!914440 () Bool)

(assert (=> b!1371034 (=> (not res!914440) (not e!776612))))

(assert (=> b!1371034 (= res!914440 (not (contains!9685 acc!866 (select (arr!44935 a!3861) from!3239))))))

(declare-fun b!1371035 () Bool)

(declare-fun res!914437 () Bool)

(assert (=> b!1371035 (=> (not res!914437) (not e!776613))))

(assert (=> b!1371035 (= res!914437 (not (contains!9685 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371036 () Bool)

(declare-fun res!914443 () Bool)

(assert (=> b!1371036 (=> (not res!914443) (not e!776613))))

(assert (=> b!1371036 (= res!914443 (not (contains!9685 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371037 () Bool)

(declare-fun res!914446 () Bool)

(assert (=> b!1371037 (=> (not res!914446) (not e!776611))))

(declare-fun noDuplicate!2542 (List!32003) Bool)

(assert (=> b!1371037 (= res!914446 (noDuplicate!2542 lt!602561))))

(declare-fun res!914434 () Bool)

(assert (=> start!116040 (=> (not res!914434) (not e!776613))))

(assert (=> start!116040 (= res!914434 (and (bvslt (size!45485 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45485 a!3861))))))

(assert (=> start!116040 e!776613))

(declare-fun array_inv!33963 (array!93037) Bool)

(assert (=> start!116040 (array_inv!33963 a!3861)))

(assert (=> start!116040 true))

(declare-fun b!1371027 () Bool)

(declare-fun res!914447 () Bool)

(assert (=> b!1371027 (=> (not res!914447) (not e!776613))))

(assert (=> b!1371027 (= res!914447 (not (contains!9685 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371038 () Bool)

(assert (=> b!1371038 (= e!776613 e!776612)))

(declare-fun res!914436 () Bool)

(assert (=> b!1371038 (=> (not res!914436) (not e!776612))))

(declare-fun arrayNoDuplicates!0 (array!93037 (_ BitVec 32) List!32003) Bool)

(assert (=> b!1371038 (= res!914436 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45307 0))(
  ( (Unit!45308) )
))
(declare-fun lt!602562 () Unit!45307)

(declare-fun noDuplicateSubseq!274 (List!32003 List!32003) Unit!45307)

(assert (=> b!1371038 (= lt!602562 (noDuplicateSubseq!274 newAcc!98 acc!866))))

(declare-fun b!1371039 () Bool)

(declare-fun res!914435 () Bool)

(assert (=> b!1371039 (=> (not res!914435) (not e!776611))))

(assert (=> b!1371039 (= res!914435 (not (contains!9685 lt!602561 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371040 () Bool)

(declare-fun res!914445 () Bool)

(assert (=> b!1371040 (=> (not res!914445) (not e!776613))))

(assert (=> b!1371040 (= res!914445 (not (contains!9685 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371041 () Bool)

(declare-fun res!914444 () Bool)

(assert (=> b!1371041 (=> (not res!914444) (not e!776612))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1371041 (= res!914444 (validKeyInArray!0 (select (arr!44935 a!3861) from!3239)))))

(declare-fun b!1371042 () Bool)

(declare-fun res!914442 () Bool)

(assert (=> b!1371042 (=> (not res!914442) (not e!776613))))

(assert (=> b!1371042 (= res!914442 (noDuplicate!2542 acc!866))))

(declare-fun b!1371043 () Bool)

(assert (=> b!1371043 (= e!776611 (not (subseq!1087 lt!602563 lt!602561)))))

(assert (= (and start!116040 res!914434) b!1371042))

(assert (= (and b!1371042 res!914442) b!1371040))

(assert (= (and b!1371040 res!914445) b!1371027))

(assert (= (and b!1371027 res!914447) b!1371036))

(assert (= (and b!1371036 res!914443) b!1371035))

(assert (= (and b!1371035 res!914437) b!1371032))

(assert (= (and b!1371032 res!914438) b!1371038))

(assert (= (and b!1371038 res!914436) b!1371030))

(assert (= (and b!1371030 res!914433) b!1371041))

(assert (= (and b!1371041 res!914444) b!1371034))

(assert (= (and b!1371034 res!914440) b!1371031))

(assert (= (and b!1371031 res!914449) b!1371037))

(assert (= (and b!1371037 res!914446) b!1371029))

(assert (= (and b!1371029 res!914439) b!1371039))

(assert (= (and b!1371039 res!914435) b!1371033))

(assert (= (and b!1371033 res!914441) b!1371028))

(assert (= (and b!1371028 res!914448) b!1371043))

(declare-fun m!1254499 () Bool)

(assert (=> start!116040 m!1254499))

(declare-fun m!1254501 () Bool)

(assert (=> b!1371027 m!1254501))

(declare-fun m!1254503 () Bool)

(assert (=> b!1371032 m!1254503))

(declare-fun m!1254505 () Bool)

(assert (=> b!1371028 m!1254505))

(declare-fun m!1254507 () Bool)

(assert (=> b!1371035 m!1254507))

(declare-fun m!1254509 () Bool)

(assert (=> b!1371039 m!1254509))

(declare-fun m!1254511 () Bool)

(assert (=> b!1371031 m!1254511))

(assert (=> b!1371041 m!1254511))

(assert (=> b!1371041 m!1254511))

(declare-fun m!1254513 () Bool)

(assert (=> b!1371041 m!1254513))

(declare-fun m!1254515 () Bool)

(assert (=> b!1371037 m!1254515))

(declare-fun m!1254517 () Bool)

(assert (=> b!1371036 m!1254517))

(declare-fun m!1254519 () Bool)

(assert (=> b!1371043 m!1254519))

(declare-fun m!1254521 () Bool)

(assert (=> b!1371038 m!1254521))

(declare-fun m!1254523 () Bool)

(assert (=> b!1371038 m!1254523))

(assert (=> b!1371034 m!1254511))

(assert (=> b!1371034 m!1254511))

(declare-fun m!1254525 () Bool)

(assert (=> b!1371034 m!1254525))

(declare-fun m!1254527 () Bool)

(assert (=> b!1371033 m!1254527))

(declare-fun m!1254529 () Bool)

(assert (=> b!1371029 m!1254529))

(declare-fun m!1254531 () Bool)

(assert (=> b!1371042 m!1254531))

(declare-fun m!1254533 () Bool)

(assert (=> b!1371040 m!1254533))

(push 1)

(assert (not b!1371038))

(assert (not b!1371043))

(assert (not b!1371042))

(assert (not b!1371027))

(assert (not b!1371029))

(assert (not b!1371032))

(assert (not b!1371040))

(assert (not b!1371041))

(assert (not b!1371034))

(assert (not b!1371037))

(assert (not b!1371033))

(assert (not start!116040))

(assert (not b!1371028))

(assert (not b!1371036))

(assert (not b!1371035))

(assert (not b!1371039))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!147351 () Bool)

(declare-fun res!914486 () Bool)

(declare-fun e!776656 () Bool)

(assert (=> d!147351 (=> res!914486 e!776656)))

(assert (=> d!147351 (= res!914486 (is-Nil!32000 acc!866))))

(assert (=> d!147351 (= (noDuplicate!2542 acc!866) e!776656)))

(declare-fun b!1371090 () Bool)

(declare-fun e!776657 () Bool)

(assert (=> b!1371090 (= e!776656 e!776657)))

(declare-fun res!914487 () Bool)

(assert (=> b!1371090 (=> (not res!914487) (not e!776657))))

(assert (=> b!1371090 (= res!914487 (not (contains!9685 (t!46697 acc!866) (h!33208 acc!866))))))

(declare-fun b!1371091 () Bool)

(assert (=> b!1371091 (= e!776657 (noDuplicate!2542 (t!46697 acc!866)))))

(assert (= (and d!147351 (not res!914486)) b!1371090))

(assert (= (and b!1371090 res!914487) b!1371091))

(declare-fun m!1254557 () Bool)

(assert (=> b!1371090 m!1254557))

(declare-fun m!1254559 () Bool)

(assert (=> b!1371091 m!1254559))

(assert (=> b!1371042 d!147351))

(declare-fun d!147355 () Bool)

(declare-fun lt!602574 () Bool)

(declare-fun content!737 (List!32003) (Set (_ BitVec 64)))

(assert (=> d!147355 (= lt!602574 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!737 lt!602563)))))

(declare-fun e!776668 () Bool)

(assert (=> d!147355 (= lt!602574 e!776668)))

(declare-fun res!914498 () Bool)

(assert (=> d!147355 (=> (not res!914498) (not e!776668))))

(assert (=> d!147355 (= res!914498 (is-Cons!31999 lt!602563))))

(assert (=> d!147355 (= (contains!9685 lt!602563 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602574)))

(declare-fun b!1371103 () Bool)

(declare-fun e!776669 () Bool)

(assert (=> b!1371103 (= e!776668 e!776669)))

(declare-fun res!914497 () Bool)

(assert (=> b!1371103 (=> res!914497 e!776669)))

(assert (=> b!1371103 (= res!914497 (= (h!33208 lt!602563) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1371104 () Bool)

(assert (=> b!1371104 (= e!776669 (contains!9685 (t!46697 lt!602563) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147355 res!914498) b!1371103))

(assert (= (and b!1371103 (not res!914497)) b!1371104))

(declare-fun m!1254567 () Bool)

(assert (=> d!147355 m!1254567))

(declare-fun m!1254569 () Bool)

(assert (=> d!147355 m!1254569))

(declare-fun m!1254571 () Bool)

(assert (=> b!1371104 m!1254571))

(assert (=> b!1371033 d!147355))

(declare-fun b!1371132 () Bool)

(declare-fun e!776698 () Bool)

(assert (=> b!1371132 (= e!776698 (subseq!1087 (t!46697 lt!602563) (t!46697 lt!602561)))))

(declare-fun d!147363 () Bool)

(declare-fun res!914524 () Bool)

(declare-fun e!776695 () Bool)

(assert (=> d!147363 (=> res!914524 e!776695)))

(assert (=> d!147363 (= res!914524 (is-Nil!32000 lt!602563))))

(assert (=> d!147363 (= (subseq!1087 lt!602563 lt!602561) e!776695)))

(declare-fun b!1371131 () Bool)

(declare-fun e!776696 () Bool)

(declare-fun e!776697 () Bool)

(assert (=> b!1371131 (= e!776696 e!776697)))

(declare-fun res!914527 () Bool)

(assert (=> b!1371131 (=> res!914527 e!776697)))

(assert (=> b!1371131 (= res!914527 e!776698)))

(declare-fun res!914525 () Bool)

(assert (=> b!1371131 (=> (not res!914525) (not e!776698))))

(assert (=> b!1371131 (= res!914525 (= (h!33208 lt!602563) (h!33208 lt!602561)))))

(declare-fun b!1371133 () Bool)

(assert (=> b!1371133 (= e!776697 (subseq!1087 lt!602563 (t!46697 lt!602561)))))

(declare-fun b!1371130 () Bool)

(assert (=> b!1371130 (= e!776695 e!776696)))

(declare-fun res!914526 () Bool)

(assert (=> b!1371130 (=> (not res!914526) (not e!776696))))

(assert (=> b!1371130 (= res!914526 (is-Cons!31999 lt!602561))))

(assert (= (and d!147363 (not res!914524)) b!1371130))

(assert (= (and b!1371130 res!914526) b!1371131))

(assert (= (and b!1371131 res!914525) b!1371132))

(assert (= (and b!1371131 (not res!914527)) b!1371133))

(declare-fun m!1254585 () Bool)

(assert (=> b!1371132 m!1254585))

(declare-fun m!1254587 () Bool)

(assert (=> b!1371133 m!1254587))

(assert (=> b!1371043 d!147363))

(declare-fun b!1371144 () Bool)

(declare-fun e!776710 () Bool)

(assert (=> b!1371144 (= e!776710 (subseq!1087 (t!46697 newAcc!98) (t!46697 acc!866)))))

(declare-fun d!147373 () Bool)

(declare-fun res!914536 () Bool)

(declare-fun e!776707 () Bool)

(assert (=> d!147373 (=> res!914536 e!776707)))

(assert (=> d!147373 (= res!914536 (is-Nil!32000 newAcc!98))))

(assert (=> d!147373 (= (subseq!1087 newAcc!98 acc!866) e!776707)))

(declare-fun b!1371143 () Bool)

(declare-fun e!776708 () Bool)

(declare-fun e!776709 () Bool)

(assert (=> b!1371143 (= e!776708 e!776709)))

(declare-fun res!914539 () Bool)

(assert (=> b!1371143 (=> res!914539 e!776709)))

(assert (=> b!1371143 (= res!914539 e!776710)))

(declare-fun res!914537 () Bool)

(assert (=> b!1371143 (=> (not res!914537) (not e!776710))))

(assert (=> b!1371143 (= res!914537 (= (h!33208 newAcc!98) (h!33208 acc!866)))))

(declare-fun b!1371145 () Bool)

(assert (=> b!1371145 (= e!776709 (subseq!1087 newAcc!98 (t!46697 acc!866)))))

(declare-fun b!1371142 () Bool)

(assert (=> b!1371142 (= e!776707 e!776708)))

(declare-fun res!914538 () Bool)

(assert (=> b!1371142 (=> (not res!914538) (not e!776708))))

(assert (=> b!1371142 (= res!914538 (is-Cons!31999 acc!866))))

(assert (= (and d!147373 (not res!914536)) b!1371142))

(assert (= (and b!1371142 res!914538) b!1371143))

(assert (= (and b!1371143 res!914537) b!1371144))

(assert (= (and b!1371143 (not res!914539)) b!1371145))

(declare-fun m!1254589 () Bool)

(assert (=> b!1371144 m!1254589))

(declare-fun m!1254591 () Bool)

(assert (=> b!1371145 m!1254591))

(assert (=> b!1371032 d!147373))

(declare-fun lt!602581 () Bool)

(declare-fun d!147375 () Bool)

(assert (=> d!147375 (= lt!602581 (member (select (arr!44935 a!3861) from!3239) (content!737 acc!866)))))

(declare-fun e!776711 () Bool)

(assert (=> d!147375 (= lt!602581 e!776711)))

(declare-fun res!914541 () Bool)

(assert (=> d!147375 (=> (not res!914541) (not e!776711))))

(assert (=> d!147375 (= res!914541 (is-Cons!31999 acc!866))))

(assert (=> d!147375 (= (contains!9685 acc!866 (select (arr!44935 a!3861) from!3239)) lt!602581)))

(declare-fun b!1371146 () Bool)

(declare-fun e!776712 () Bool)

(assert (=> b!1371146 (= e!776711 e!776712)))

(declare-fun res!914540 () Bool)

(assert (=> b!1371146 (=> res!914540 e!776712)))

(assert (=> b!1371146 (= res!914540 (= (h!33208 acc!866) (select (arr!44935 a!3861) from!3239)))))

(declare-fun b!1371147 () Bool)

(assert (=> b!1371147 (= e!776712 (contains!9685 (t!46697 acc!866) (select (arr!44935 a!3861) from!3239)))))

(assert (= (and d!147375 res!914541) b!1371146))

(assert (= (and b!1371146 (not res!914540)) b!1371147))

(declare-fun m!1254593 () Bool)

(assert (=> d!147375 m!1254593))

(assert (=> d!147375 m!1254511))

(declare-fun m!1254595 () Bool)

(assert (=> d!147375 m!1254595))

(assert (=> b!1371147 m!1254511))

(declare-fun m!1254597 () Bool)

(assert (=> b!1371147 m!1254597))

(assert (=> b!1371034 d!147375))

(declare-fun d!147377 () Bool)

(declare-fun lt!602583 () Bool)

(assert (=> d!147377 (= lt!602583 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!737 newAcc!98)))))

(declare-fun e!776717 () Bool)

(assert (=> d!147377 (= lt!602583 e!776717)))

(declare-fun res!914547 () Bool)

(assert (=> d!147377 (=> (not res!914547) (not e!776717))))

(assert (=> d!147377 (= res!914547 (is-Cons!31999 newAcc!98))))

(assert (=> d!147377 (= (contains!9685 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602583)))

(declare-fun b!1371152 () Bool)

(declare-fun e!776718 () Bool)

(assert (=> b!1371152 (= e!776717 e!776718)))

(declare-fun res!914546 () Bool)

(assert (=> b!1371152 (=> res!914546 e!776718)))

(assert (=> b!1371152 (= res!914546 (= (h!33208 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1371153 () Bool)

(assert (=> b!1371153 (= e!776718 (contains!9685 (t!46697 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147377 res!914547) b!1371152))

(assert (= (and b!1371152 (not res!914546)) b!1371153))

(declare-fun m!1254605 () Bool)

(assert (=> d!147377 m!1254605))

(declare-fun m!1254609 () Bool)

(assert (=> d!147377 m!1254609))

(declare-fun m!1254613 () Bool)

(assert (=> b!1371153 m!1254613))

(assert (=> b!1371035 d!147377))

(declare-fun d!147383 () Bool)

(declare-fun res!914548 () Bool)

(declare-fun e!776719 () Bool)

(assert (=> d!147383 (=> res!914548 e!776719)))

(assert (=> d!147383 (= res!914548 (is-Nil!32000 lt!602561))))

(assert (=> d!147383 (= (noDuplicate!2542 lt!602561) e!776719)))

(declare-fun b!1371154 () Bool)

(declare-fun e!776720 () Bool)

(assert (=> b!1371154 (= e!776719 e!776720)))

(declare-fun res!914549 () Bool)

(assert (=> b!1371154 (=> (not res!914549) (not e!776720))))

(assert (=> b!1371154 (= res!914549 (not (contains!9685 (t!46697 lt!602561) (h!33208 lt!602561))))))

(declare-fun b!1371155 () Bool)

(assert (=> b!1371155 (= e!776720 (noDuplicate!2542 (t!46697 lt!602561)))))

(assert (= (and d!147383 (not res!914548)) b!1371154))

(assert (= (and b!1371154 res!914549) b!1371155))

(declare-fun m!1254615 () Bool)

(assert (=> b!1371154 m!1254615))

(declare-fun m!1254617 () Bool)

(assert (=> b!1371155 m!1254617))

(assert (=> b!1371037 d!147383))

(declare-fun d!147385 () Bool)

(declare-fun lt!602585 () Bool)

(assert (=> d!147385 (= lt!602585 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!737 newAcc!98)))))

(declare-fun e!776723 () Bool)

(assert (=> d!147385 (= lt!602585 e!776723)))

(declare-fun res!914553 () Bool)

(assert (=> d!147385 (=> (not res!914553) (not e!776723))))

(assert (=> d!147385 (= res!914553 (is-Cons!31999 newAcc!98))))

(assert (=> d!147385 (= (contains!9685 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602585)))

(declare-fun b!1371158 () Bool)

(declare-fun e!776724 () Bool)

(assert (=> b!1371158 (= e!776723 e!776724)))

(declare-fun res!914552 () Bool)

(assert (=> b!1371158 (=> res!914552 e!776724)))

(assert (=> b!1371158 (= res!914552 (= (h!33208 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1371159 () Bool)

