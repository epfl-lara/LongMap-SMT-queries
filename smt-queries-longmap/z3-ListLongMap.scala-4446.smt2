; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61780 () Bool)

(assert start!61780)

(declare-fun b!691528 () Bool)

(declare-fun res!455891 () Bool)

(declare-fun e!393541 () Bool)

(assert (=> b!691528 (=> (not res!455891) (not e!393541))))

(declare-datatypes ((List!13110 0))(
  ( (Nil!13107) (Cons!13106 (h!14151 (_ BitVec 64)) (t!19377 List!13110)) )
))
(declare-fun acc!681 () List!13110)

(declare-fun contains!3687 (List!13110 (_ BitVec 64)) Bool)

(assert (=> b!691528 (= res!455891 (not (contains!3687 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691529 () Bool)

(declare-fun res!455883 () Bool)

(assert (=> b!691529 (=> (not res!455883) (not e!393541))))

(assert (=> b!691529 (= res!455883 (not (contains!3687 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691530 () Bool)

(declare-fun res!455892 () Bool)

(assert (=> b!691530 (=> (not res!455892) (not e!393541))))

(declare-datatypes ((array!39801 0))(
  ( (array!39802 (arr!19069 (Array (_ BitVec 32) (_ BitVec 64))) (size!19454 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39801)

(declare-fun arrayNoDuplicates!0 (array!39801 (_ BitVec 32) List!13110) Bool)

(assert (=> b!691530 (= res!455892 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13107))))

(declare-fun b!691531 () Bool)

(declare-fun e!393543 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!691531 (= e!393543 (not (contains!3687 acc!681 k0!2843)))))

(declare-fun b!691532 () Bool)

(declare-fun res!455887 () Bool)

(assert (=> b!691532 (=> (not res!455887) (not e!393541))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!691532 (= res!455887 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19454 a!3626))))))

(declare-fun b!691533 () Bool)

(declare-fun res!455880 () Bool)

(assert (=> b!691533 (=> (not res!455880) (not e!393541))))

(declare-fun arrayContainsKey!0 (array!39801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!691533 (= res!455880 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun res!455885 () Bool)

(assert (=> start!61780 (=> (not res!455885) (not e!393541))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!61780 (= res!455885 (and (bvslt (size!19454 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19454 a!3626))))))

(assert (=> start!61780 e!393541))

(assert (=> start!61780 true))

(declare-fun array_inv!14865 (array!39801) Bool)

(assert (=> start!61780 (array_inv!14865 a!3626)))

(declare-fun b!691534 () Bool)

(declare-fun res!455884 () Bool)

(assert (=> b!691534 (=> (not res!455884) (not e!393541))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!691534 (= res!455884 (validKeyInArray!0 (select (arr!19069 a!3626) from!3004)))))

(declare-fun b!691535 () Bool)

(declare-datatypes ((Unit!24394 0))(
  ( (Unit!24395) )
))
(declare-fun e!393542 () Unit!24394)

(declare-fun Unit!24396 () Unit!24394)

(assert (=> b!691535 (= e!393542 Unit!24396)))

(declare-fun b!691536 () Bool)

(declare-fun res!455890 () Bool)

(assert (=> b!691536 (=> (not res!455890) (not e!393541))))

(assert (=> b!691536 (= res!455890 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!691537 () Bool)

(declare-fun e!393544 () Bool)

(assert (=> b!691537 (= e!393544 e!393543)))

(declare-fun res!455888 () Bool)

(assert (=> b!691537 (=> (not res!455888) (not e!393543))))

(assert (=> b!691537 (= res!455888 (bvsle from!3004 i!1382))))

(declare-fun b!691538 () Bool)

(declare-fun res!455893 () Bool)

(assert (=> b!691538 (=> (not res!455893) (not e!393541))))

(assert (=> b!691538 (= res!455893 (validKeyInArray!0 k0!2843))))

(declare-fun b!691539 () Bool)

(declare-fun e!393546 () Bool)

(assert (=> b!691539 (= e!393546 (contains!3687 acc!681 k0!2843))))

(declare-fun b!691540 () Bool)

(declare-fun res!455894 () Bool)

(assert (=> b!691540 (=> (not res!455894) (not e!393541))))

(assert (=> b!691540 (= res!455894 e!393544)))

(declare-fun res!455889 () Bool)

(assert (=> b!691540 (=> res!455889 e!393544)))

(assert (=> b!691540 (= res!455889 e!393546)))

(declare-fun res!455886 () Bool)

(assert (=> b!691540 (=> (not res!455886) (not e!393546))))

(assert (=> b!691540 (= res!455886 (bvsgt from!3004 i!1382))))

(declare-fun b!691541 () Bool)

(declare-fun Unit!24397 () Unit!24394)

(assert (=> b!691541 (= e!393542 Unit!24397)))

(assert (=> b!691541 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!316477 () Unit!24394)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39801 (_ BitVec 64) (_ BitVec 32)) Unit!24394)

(assert (=> b!691541 (= lt!316477 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!691541 false))

(declare-fun b!691542 () Bool)

(declare-fun res!455882 () Bool)

(assert (=> b!691542 (=> (not res!455882) (not e!393541))))

(assert (=> b!691542 (= res!455882 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19454 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!691543 () Bool)

(declare-fun res!455881 () Bool)

(assert (=> b!691543 (=> (not res!455881) (not e!393541))))

(declare-fun noDuplicate!934 (List!13110) Bool)

(assert (=> b!691543 (= res!455881 (noDuplicate!934 acc!681))))

(declare-fun b!691544 () Bool)

(assert (=> b!691544 (= e!393541 false)))

(declare-fun lt!316476 () Unit!24394)

(assert (=> b!691544 (= lt!316476 e!393542)))

(declare-fun c!78191 () Bool)

(assert (=> b!691544 (= c!78191 (= (select (arr!19069 a!3626) from!3004) k0!2843))))

(assert (= (and start!61780 res!455885) b!691543))

(assert (= (and b!691543 res!455881) b!691528))

(assert (= (and b!691528 res!455891) b!691529))

(assert (= (and b!691529 res!455883) b!691540))

(assert (= (and b!691540 res!455886) b!691539))

(assert (= (and b!691540 (not res!455889)) b!691537))

(assert (= (and b!691537 res!455888) b!691531))

(assert (= (and b!691540 res!455894) b!691530))

(assert (= (and b!691530 res!455892) b!691536))

(assert (= (and b!691536 res!455890) b!691532))

(assert (= (and b!691532 res!455887) b!691538))

(assert (= (and b!691538 res!455893) b!691533))

(assert (= (and b!691533 res!455880) b!691542))

(assert (= (and b!691542 res!455882) b!691534))

(assert (= (and b!691534 res!455884) b!691544))

(assert (= (and b!691544 c!78191) b!691541))

(assert (= (and b!691544 (not c!78191)) b!691535))

(declare-fun m!654511 () Bool)

(assert (=> b!691529 m!654511))

(declare-fun m!654513 () Bool)

(assert (=> start!61780 m!654513))

(declare-fun m!654515 () Bool)

(assert (=> b!691530 m!654515))

(declare-fun m!654517 () Bool)

(assert (=> b!691531 m!654517))

(declare-fun m!654519 () Bool)

(assert (=> b!691528 m!654519))

(declare-fun m!654521 () Bool)

(assert (=> b!691533 m!654521))

(declare-fun m!654523 () Bool)

(assert (=> b!691538 m!654523))

(declare-fun m!654525 () Bool)

(assert (=> b!691541 m!654525))

(declare-fun m!654527 () Bool)

(assert (=> b!691541 m!654527))

(assert (=> b!691539 m!654517))

(declare-fun m!654529 () Bool)

(assert (=> b!691544 m!654529))

(declare-fun m!654531 () Bool)

(assert (=> b!691543 m!654531))

(declare-fun m!654533 () Bool)

(assert (=> b!691536 m!654533))

(assert (=> b!691534 m!654529))

(assert (=> b!691534 m!654529))

(declare-fun m!654535 () Bool)

(assert (=> b!691534 m!654535))

(check-sat (not b!691543) (not start!61780) (not b!691536) (not b!691533) (not b!691538) (not b!691539) (not b!691528) (not b!691531) (not b!691530) (not b!691529) (not b!691534) (not b!691541))
