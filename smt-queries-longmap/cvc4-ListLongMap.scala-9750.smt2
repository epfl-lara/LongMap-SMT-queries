; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115488 () Bool)

(assert start!115488)

(declare-fun b!1366349 () Bool)

(declare-fun res!909932 () Bool)

(declare-fun e!774413 () Bool)

(assert (=> b!1366349 (=> (not res!909932) (not e!774413))))

(declare-datatypes ((List!31901 0))(
  ( (Nil!31898) (Cons!31897 (h!33106 (_ BitVec 64)) (t!46595 List!31901)) )
))
(declare-fun lt!601542 () List!31901)

(declare-fun contains!9583 (List!31901 (_ BitVec 64)) Bool)

(assert (=> b!1366349 (= res!909932 (not (contains!9583 lt!601542 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366350 () Bool)

(declare-fun res!909930 () Bool)

(assert (=> b!1366350 (=> (not res!909930) (not e!774413))))

(assert (=> b!1366350 (= res!909930 (not (contains!9583 lt!601542 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366351 () Bool)

(declare-fun res!909933 () Bool)

(assert (=> b!1366351 (=> (not res!909933) (not e!774413))))

(declare-fun noDuplicate!2440 (List!31901) Bool)

(assert (=> b!1366351 (= res!909933 (noDuplicate!2440 lt!601542))))

(declare-fun b!1366353 () Bool)

(declare-fun res!909935 () Bool)

(declare-fun e!774414 () Bool)

(assert (=> b!1366353 (=> (not res!909935) (not e!774414))))

(declare-fun acc!866 () List!31901)

(assert (=> b!1366353 (= res!909935 (noDuplicate!2440 acc!866))))

(declare-fun b!1366354 () Bool)

(declare-fun res!909927 () Bool)

(assert (=> b!1366354 (=> (not res!909927) (not e!774413))))

(declare-fun lt!601543 () List!31901)

(assert (=> b!1366354 (= res!909927 (not (contains!9583 lt!601543 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366355 () Bool)

(declare-fun res!909934 () Bool)

(assert (=> b!1366355 (=> (not res!909934) (not e!774414))))

(declare-fun newAcc!98 () List!31901)

(declare-fun subseq!985 (List!31901 List!31901) Bool)

(assert (=> b!1366355 (= res!909934 (subseq!985 newAcc!98 acc!866))))

(declare-fun b!1366356 () Bool)

(declare-fun e!774412 () Bool)

(assert (=> b!1366356 (= e!774414 e!774412)))

(declare-fun res!909924 () Bool)

(assert (=> b!1366356 (=> (not res!909924) (not e!774412))))

(declare-datatypes ((array!92809 0))(
  ( (array!92810 (arr!44833 (Array (_ BitVec 32) (_ BitVec 64))) (size!45383 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92809)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92809 (_ BitVec 32) List!31901) Bool)

(assert (=> b!1366356 (= res!909924 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45103 0))(
  ( (Unit!45104) )
))
(declare-fun lt!601539 () Unit!45103)

(declare-fun noDuplicateSubseq!172 (List!31901 List!31901) Unit!45103)

(assert (=> b!1366356 (= lt!601539 (noDuplicateSubseq!172 newAcc!98 acc!866))))

(declare-fun b!1366357 () Bool)

(declare-fun res!909926 () Bool)

(assert (=> b!1366357 (=> (not res!909926) (not e!774413))))

(assert (=> b!1366357 (= res!909926 (not (contains!9583 lt!601543 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366358 () Bool)

(declare-fun res!909938 () Bool)

(assert (=> b!1366358 (=> (not res!909938) (not e!774414))))

(assert (=> b!1366358 (= res!909938 (not (contains!9583 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366359 () Bool)

(assert (=> b!1366359 (= e!774412 e!774413)))

(declare-fun res!909931 () Bool)

(assert (=> b!1366359 (=> (not res!909931) (not e!774413))))

(assert (=> b!1366359 (= res!909931 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (=> b!1366359 (= lt!601543 (Cons!31897 (select (arr!44833 a!3861) from!3239) newAcc!98))))

(assert (=> b!1366359 (= lt!601542 (Cons!31897 (select (arr!44833 a!3861) from!3239) acc!866))))

(declare-fun b!1366360 () Bool)

(declare-fun res!909925 () Bool)

(assert (=> b!1366360 (=> (not res!909925) (not e!774414))))

(assert (=> b!1366360 (= res!909925 (not (contains!9583 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!909929 () Bool)

(assert (=> start!115488 (=> (not res!909929) (not e!774414))))

(assert (=> start!115488 (= res!909929 (and (bvslt (size!45383 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45383 a!3861))))))

(assert (=> start!115488 e!774414))

(declare-fun array_inv!33861 (array!92809) Bool)

(assert (=> start!115488 (array_inv!33861 a!3861)))

(assert (=> start!115488 true))

(declare-fun b!1366352 () Bool)

(declare-fun res!909928 () Bool)

(assert (=> b!1366352 (=> (not res!909928) (not e!774412))))

(assert (=> b!1366352 (= res!909928 (not (contains!9583 acc!866 (select (arr!44833 a!3861) from!3239))))))

(declare-fun b!1366361 () Bool)

(declare-fun res!909940 () Bool)

(assert (=> b!1366361 (=> (not res!909940) (not e!774414))))

(assert (=> b!1366361 (= res!909940 (not (contains!9583 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366362 () Bool)

(declare-fun res!909939 () Bool)

(assert (=> b!1366362 (=> (not res!909939) (not e!774412))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1366362 (= res!909939 (validKeyInArray!0 (select (arr!44833 a!3861) from!3239)))))

(declare-fun b!1366363 () Bool)

(assert (=> b!1366363 (= e!774413 false)))

(declare-fun lt!601540 () Bool)

(assert (=> b!1366363 (= lt!601540 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601542))))

(declare-fun lt!601541 () Unit!45103)

(assert (=> b!1366363 (= lt!601541 (noDuplicateSubseq!172 lt!601543 lt!601542))))

(declare-fun b!1366364 () Bool)

(declare-fun res!909937 () Bool)

(assert (=> b!1366364 (=> (not res!909937) (not e!774413))))

(assert (=> b!1366364 (= res!909937 (subseq!985 lt!601543 lt!601542))))

(declare-fun b!1366365 () Bool)

(declare-fun res!909936 () Bool)

(assert (=> b!1366365 (=> (not res!909936) (not e!774414))))

(assert (=> b!1366365 (= res!909936 (not (contains!9583 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366366 () Bool)

(declare-fun res!909923 () Bool)

(assert (=> b!1366366 (=> (not res!909923) (not e!774412))))

(assert (=> b!1366366 (= res!909923 (bvslt from!3239 (size!45383 a!3861)))))

(assert (= (and start!115488 res!909929) b!1366353))

(assert (= (and b!1366353 res!909935) b!1366358))

(assert (= (and b!1366358 res!909938) b!1366361))

(assert (= (and b!1366361 res!909940) b!1366365))

(assert (= (and b!1366365 res!909936) b!1366360))

(assert (= (and b!1366360 res!909925) b!1366355))

(assert (= (and b!1366355 res!909934) b!1366356))

(assert (= (and b!1366356 res!909924) b!1366366))

(assert (= (and b!1366366 res!909923) b!1366362))

(assert (= (and b!1366362 res!909939) b!1366352))

(assert (= (and b!1366352 res!909928) b!1366359))

(assert (= (and b!1366359 res!909931) b!1366351))

(assert (= (and b!1366351 res!909933) b!1366349))

(assert (= (and b!1366349 res!909932) b!1366350))

(assert (= (and b!1366350 res!909930) b!1366354))

(assert (= (and b!1366354 res!909927) b!1366357))

(assert (= (and b!1366357 res!909926) b!1366364))

(assert (= (and b!1366364 res!909937) b!1366363))

(declare-fun m!1250661 () Bool)

(assert (=> b!1366364 m!1250661))

(declare-fun m!1250663 () Bool)

(assert (=> b!1366358 m!1250663))

(declare-fun m!1250665 () Bool)

(assert (=> b!1366363 m!1250665))

(declare-fun m!1250667 () Bool)

(assert (=> b!1366363 m!1250667))

(declare-fun m!1250669 () Bool)

(assert (=> b!1366354 m!1250669))

(declare-fun m!1250671 () Bool)

(assert (=> start!115488 m!1250671))

(declare-fun m!1250673 () Bool)

(assert (=> b!1366361 m!1250673))

(declare-fun m!1250675 () Bool)

(assert (=> b!1366365 m!1250675))

(declare-fun m!1250677 () Bool)

(assert (=> b!1366356 m!1250677))

(declare-fun m!1250679 () Bool)

(assert (=> b!1366356 m!1250679))

(declare-fun m!1250681 () Bool)

(assert (=> b!1366360 m!1250681))

(declare-fun m!1250683 () Bool)

(assert (=> b!1366353 m!1250683))

(declare-fun m!1250685 () Bool)

(assert (=> b!1366355 m!1250685))

(declare-fun m!1250687 () Bool)

(assert (=> b!1366362 m!1250687))

(assert (=> b!1366362 m!1250687))

(declare-fun m!1250689 () Bool)

(assert (=> b!1366362 m!1250689))

(declare-fun m!1250691 () Bool)

(assert (=> b!1366350 m!1250691))

(assert (=> b!1366352 m!1250687))

(assert (=> b!1366352 m!1250687))

(declare-fun m!1250693 () Bool)

(assert (=> b!1366352 m!1250693))

(declare-fun m!1250695 () Bool)

(assert (=> b!1366349 m!1250695))

(declare-fun m!1250697 () Bool)

(assert (=> b!1366351 m!1250697))

(assert (=> b!1366359 m!1250687))

(declare-fun m!1250699 () Bool)

(assert (=> b!1366357 m!1250699))

(push 1)

