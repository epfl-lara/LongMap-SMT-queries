; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60022 () Bool)

(assert start!60022)

(declare-fun b!667557 () Bool)

(declare-datatypes ((Unit!23368 0))(
  ( (Unit!23369) )
))
(declare-fun e!382013 () Unit!23368)

(declare-fun lt!310733 () Unit!23368)

(assert (=> b!667557 (= e!382013 lt!310733)))

(declare-fun lt!310735 () Unit!23368)

(declare-datatypes ((List!12812 0))(
  ( (Nil!12809) (Cons!12808 (h!13853 (_ BitVec 64)) (t!19031 List!12812)) )
))
(declare-fun acc!681 () List!12812)

(declare-fun lemmaListSubSeqRefl!0 (List!12812) Unit!23368)

(assert (=> b!667557 (= lt!310735 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!90 (List!12812 List!12812) Bool)

(assert (=> b!667557 (subseq!90 acc!681 acc!681)))

(declare-datatypes ((array!39080 0))(
  ( (array!39081 (arr!18732 (Array (_ BitVec 32) (_ BitVec 64))) (size!19097 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39080)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39080 List!12812 List!12812 (_ BitVec 32)) Unit!23368)

(declare-fun $colon$colon!221 (List!12812 (_ BitVec 64)) List!12812)

(assert (=> b!667557 (= lt!310733 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!221 acc!681 (select (arr!18732 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39080 (_ BitVec 32) List!12812) Bool)

(assert (=> b!667557 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!667558 () Bool)

(declare-fun res!434880 () Bool)

(declare-fun e!382011 () Bool)

(assert (=> b!667558 (=> (not res!434880) (not e!382011))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!667558 (= res!434880 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19097 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!667559 () Bool)

(declare-fun res!434865 () Bool)

(assert (=> b!667559 (=> (not res!434865) (not e!382011))))

(declare-fun noDuplicate!603 (List!12812) Bool)

(assert (=> b!667559 (= res!434865 (noDuplicate!603 acc!681))))

(declare-fun b!667561 () Bool)

(declare-fun e!382012 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3334 (List!12812 (_ BitVec 64)) Bool)

(assert (=> b!667561 (= e!382012 (contains!3334 acc!681 k!2843))))

(declare-fun b!667562 () Bool)

(declare-fun Unit!23370 () Unit!23368)

(assert (=> b!667562 (= e!382013 Unit!23370)))

(declare-fun b!667563 () Bool)

(declare-fun res!434872 () Bool)

(assert (=> b!667563 (=> (not res!434872) (not e!382011))))

(assert (=> b!667563 (= res!434872 (not (contains!3334 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667564 () Bool)

(declare-fun res!434864 () Bool)

(assert (=> b!667564 (=> (not res!434864) (not e!382011))))

(declare-fun arrayContainsKey!0 (array!39080 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!667564 (= res!434864 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!667565 () Bool)

(declare-fun res!434879 () Bool)

(assert (=> b!667565 (=> (not res!434879) (not e!382011))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!667565 (= res!434879 (validKeyInArray!0 k!2843))))

(declare-fun b!667566 () Bool)

(declare-fun e!382016 () Bool)

(declare-fun e!382010 () Bool)

(assert (=> b!667566 (= e!382016 e!382010)))

(declare-fun res!434869 () Bool)

(assert (=> b!667566 (=> (not res!434869) (not e!382010))))

(assert (=> b!667566 (= res!434869 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!667567 () Bool)

(declare-fun e!382009 () Bool)

(declare-fun e!382015 () Bool)

(assert (=> b!667567 (= e!382009 e!382015)))

(declare-fun res!434862 () Bool)

(assert (=> b!667567 (=> (not res!434862) (not e!382015))))

(assert (=> b!667567 (= res!434862 (bvsle from!3004 i!1382))))

(declare-fun b!667568 () Bool)

(declare-fun e!382014 () Bool)

(assert (=> b!667568 (= e!382014 true)))

(declare-fun lt!310736 () Bool)

(assert (=> b!667568 (= lt!310736 e!382016)))

(declare-fun res!434881 () Bool)

(assert (=> b!667568 (=> res!434881 e!382016)))

(declare-fun e!382017 () Bool)

(assert (=> b!667568 (= res!434881 e!382017)))

(declare-fun res!434878 () Bool)

(assert (=> b!667568 (=> (not res!434878) (not e!382017))))

(assert (=> b!667568 (= res!434878 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!667569 () Bool)

(declare-fun res!434873 () Bool)

(assert (=> b!667569 (=> (not res!434873) (not e!382011))))

(assert (=> b!667569 (= res!434873 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19097 a!3626))))))

(declare-fun b!667570 () Bool)

(declare-fun e!382018 () Unit!23368)

(declare-fun Unit!23371 () Unit!23368)

(assert (=> b!667570 (= e!382018 Unit!23371)))

(declare-fun lt!310737 () Unit!23368)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39080 (_ BitVec 64) (_ BitVec 32)) Unit!23368)

(assert (=> b!667570 (= lt!310737 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!667570 false))

(declare-fun b!667571 () Bool)

(assert (=> b!667571 (= e!382015 (not (contains!3334 acc!681 k!2843)))))

(declare-fun b!667572 () Bool)

(declare-fun lt!310729 () List!12812)

(assert (=> b!667572 (= e!382017 (contains!3334 lt!310729 k!2843))))

(declare-fun res!434871 () Bool)

(assert (=> start!60022 (=> (not res!434871) (not e!382011))))

(assert (=> start!60022 (= res!434871 (and (bvslt (size!19097 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19097 a!3626))))))

(assert (=> start!60022 e!382011))

(assert (=> start!60022 true))

(declare-fun array_inv!14615 (array!39080) Bool)

(assert (=> start!60022 (array_inv!14615 a!3626)))

(declare-fun b!667560 () Bool)

(declare-fun Unit!23372 () Unit!23368)

(assert (=> b!667560 (= e!382018 Unit!23372)))

(declare-fun b!667573 () Bool)

(declare-fun res!434870 () Bool)

(assert (=> b!667573 (=> res!434870 e!382014)))

(assert (=> b!667573 (= res!434870 (contains!3334 lt!310729 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667574 () Bool)

(declare-fun res!434861 () Bool)

(assert (=> b!667574 (=> (not res!434861) (not e!382011))))

(assert (=> b!667574 (= res!434861 e!382009)))

(declare-fun res!434868 () Bool)

(assert (=> b!667574 (=> res!434868 e!382009)))

(assert (=> b!667574 (= res!434868 e!382012)))

(declare-fun res!434867 () Bool)

(assert (=> b!667574 (=> (not res!434867) (not e!382012))))

(assert (=> b!667574 (= res!434867 (bvsgt from!3004 i!1382))))

(declare-fun b!667575 () Bool)

(assert (=> b!667575 (= e!382011 (not e!382014))))

(declare-fun res!434863 () Bool)

(assert (=> b!667575 (=> res!434863 e!382014)))

(assert (=> b!667575 (= res!434863 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!667575 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!310729)))

(declare-fun lt!310731 () Unit!23368)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39080 (_ BitVec 64) (_ BitVec 32) List!12812 List!12812) Unit!23368)

(assert (=> b!667575 (= lt!310731 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!310729))))

(declare-fun -!88 (List!12812 (_ BitVec 64)) List!12812)

(assert (=> b!667575 (= (-!88 lt!310729 k!2843) acc!681)))

(assert (=> b!667575 (= lt!310729 ($colon$colon!221 acc!681 k!2843))))

(declare-fun lt!310730 () Unit!23368)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12812) Unit!23368)

(assert (=> b!667575 (= lt!310730 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!667575 (subseq!90 acc!681 acc!681)))

(declare-fun lt!310732 () Unit!23368)

(assert (=> b!667575 (= lt!310732 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667575 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310734 () Unit!23368)

(assert (=> b!667575 (= lt!310734 e!382013)))

(declare-fun c!76716 () Bool)

(assert (=> b!667575 (= c!76716 (validKeyInArray!0 (select (arr!18732 a!3626) from!3004)))))

(declare-fun lt!310728 () Unit!23368)

(assert (=> b!667575 (= lt!310728 e!382018)))

(declare-fun c!76715 () Bool)

(assert (=> b!667575 (= c!76715 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667575 (arrayContainsKey!0 (array!39081 (store (arr!18732 a!3626) i!1382 k!2843) (size!19097 a!3626)) k!2843 from!3004)))

(declare-fun b!667576 () Bool)

(declare-fun res!434876 () Bool)

(assert (=> b!667576 (=> res!434876 e!382014)))

(assert (=> b!667576 (= res!434876 (not (noDuplicate!603 lt!310729)))))

(declare-fun b!667577 () Bool)

(assert (=> b!667577 (= e!382010 (not (contains!3334 lt!310729 k!2843)))))

(declare-fun b!667578 () Bool)

(declare-fun res!434874 () Bool)

(assert (=> b!667578 (=> (not res!434874) (not e!382011))))

(assert (=> b!667578 (= res!434874 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12809))))

(declare-fun b!667579 () Bool)

(declare-fun res!434877 () Bool)

(assert (=> b!667579 (=> (not res!434877) (not e!382011))))

(assert (=> b!667579 (= res!434877 (not (contains!3334 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667580 () Bool)

(declare-fun res!434866 () Bool)

(assert (=> b!667580 (=> res!434866 e!382014)))

(assert (=> b!667580 (= res!434866 (contains!3334 lt!310729 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667581 () Bool)

(declare-fun res!434875 () Bool)

(assert (=> b!667581 (=> (not res!434875) (not e!382011))))

(assert (=> b!667581 (= res!434875 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!60022 res!434871) b!667559))

(assert (= (and b!667559 res!434865) b!667563))

(assert (= (and b!667563 res!434872) b!667579))

(assert (= (and b!667579 res!434877) b!667574))

(assert (= (and b!667574 res!434867) b!667561))

(assert (= (and b!667574 (not res!434868)) b!667567))

(assert (= (and b!667567 res!434862) b!667571))

(assert (= (and b!667574 res!434861) b!667578))

(assert (= (and b!667578 res!434874) b!667581))

(assert (= (and b!667581 res!434875) b!667569))

(assert (= (and b!667569 res!434873) b!667565))

(assert (= (and b!667565 res!434879) b!667564))

(assert (= (and b!667564 res!434864) b!667558))

(assert (= (and b!667558 res!434880) b!667575))

(assert (= (and b!667575 c!76715) b!667570))

(assert (= (and b!667575 (not c!76715)) b!667560))

(assert (= (and b!667575 c!76716) b!667557))

(assert (= (and b!667575 (not c!76716)) b!667562))

(assert (= (and b!667575 (not res!434863)) b!667576))

(assert (= (and b!667576 (not res!434876)) b!667573))

(assert (= (and b!667573 (not res!434870)) b!667580))

(assert (= (and b!667580 (not res!434866)) b!667568))

(assert (= (and b!667568 res!434878) b!667572))

(assert (= (and b!667568 (not res!434881)) b!667566))

(assert (= (and b!667566 res!434869) b!667577))

(declare-fun m!637525 () Bool)

(assert (=> b!667579 m!637525))

(declare-fun m!637527 () Bool)

(assert (=> b!667565 m!637527))

(declare-fun m!637529 () Bool)

(assert (=> b!667578 m!637529))

(declare-fun m!637531 () Bool)

(assert (=> b!667571 m!637531))

(declare-fun m!637533 () Bool)

(assert (=> b!667580 m!637533))

(declare-fun m!637535 () Bool)

(assert (=> b!667581 m!637535))

(declare-fun m!637537 () Bool)

(assert (=> b!667575 m!637537))

(declare-fun m!637539 () Bool)

(assert (=> b!667575 m!637539))

(declare-fun m!637541 () Bool)

(assert (=> b!667575 m!637541))

(declare-fun m!637543 () Bool)

(assert (=> b!667575 m!637543))

(declare-fun m!637545 () Bool)

(assert (=> b!667575 m!637545))

(declare-fun m!637547 () Bool)

(assert (=> b!667575 m!637547))

(declare-fun m!637549 () Bool)

(assert (=> b!667575 m!637549))

(declare-fun m!637551 () Bool)

(assert (=> b!667575 m!637551))

(declare-fun m!637553 () Bool)

(assert (=> b!667575 m!637553))

(declare-fun m!637555 () Bool)

(assert (=> b!667575 m!637555))

(assert (=> b!667575 m!637543))

(declare-fun m!637557 () Bool)

(assert (=> b!667575 m!637557))

(declare-fun m!637559 () Bool)

(assert (=> b!667575 m!637559))

(declare-fun m!637561 () Bool)

(assert (=> b!667575 m!637561))

(declare-fun m!637563 () Bool)

(assert (=> b!667563 m!637563))

(declare-fun m!637565 () Bool)

(assert (=> b!667572 m!637565))

(assert (=> b!667577 m!637565))

(declare-fun m!637567 () Bool)

(assert (=> b!667570 m!637567))

(declare-fun m!637569 () Bool)

(assert (=> b!667559 m!637569))

(declare-fun m!637571 () Bool)

(assert (=> b!667576 m!637571))

(declare-fun m!637573 () Bool)

(assert (=> start!60022 m!637573))

(assert (=> b!667561 m!637531))

(declare-fun m!637575 () Bool)

(assert (=> b!667564 m!637575))

(assert (=> b!667557 m!637541))

(assert (=> b!667557 m!637543))

(declare-fun m!637577 () Bool)

(assert (=> b!667557 m!637577))

(declare-fun m!637579 () Bool)

(assert (=> b!667557 m!637579))

(assert (=> b!667557 m!637543))

(assert (=> b!667557 m!637577))

(assert (=> b!667557 m!637551))

(assert (=> b!667557 m!637561))

(declare-fun m!637581 () Bool)

(assert (=> b!667573 m!637581))

(push 1)

(assert (not b!667581))

(assert (not b!667570))

(assert (not b!667557))

(assert (not b!667559))

(assert (not b!667571))

(assert (not b!667575))

(assert (not b!667572))

(assert (not start!60022))

(assert (not b!667579))

(assert (not b!667577))

(assert (not b!667580))

(assert (not b!667573))

(assert (not b!667563))

(assert (not b!667565))

(assert (not b!667561))

(assert (not b!667578))

(assert (not b!667564))

(assert (not b!667576))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

