; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61172 () Bool)

(assert start!61172)

(declare-fun b!685471 () Bool)

(declare-fun res!450826 () Bool)

(declare-fun e!390413 () Bool)

(assert (=> b!685471 (=> (not res!450826) (not e!390413))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39631 0))(
  ( (array!39632 (arr!18993 (Array (_ BitVec 32) (_ BitVec 64))) (size!19365 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39631)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!685471 (= res!450826 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19365 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!685472 () Bool)

(declare-datatypes ((Unit!24132 0))(
  ( (Unit!24133) )
))
(declare-fun e!390407 () Unit!24132)

(declare-fun Unit!24134 () Unit!24132)

(assert (=> b!685472 (= e!390407 Unit!24134)))

(declare-fun b!685473 () Bool)

(declare-fun e!390408 () Bool)

(declare-fun e!390412 () Bool)

(assert (=> b!685473 (= e!390408 e!390412)))

(declare-fun res!450815 () Bool)

(assert (=> b!685473 (=> (not res!450815) (not e!390412))))

(assert (=> b!685473 (= res!450815 (bvsle from!3004 i!1382))))

(declare-fun b!685474 () Bool)

(declare-fun e!390410 () Unit!24132)

(declare-fun Unit!24135 () Unit!24132)

(assert (=> b!685474 (= e!390410 Unit!24135)))

(declare-fun b!685475 () Bool)

(declare-fun e!390411 () Bool)

(assert (=> b!685475 (= e!390413 (not e!390411))))

(declare-fun res!450809 () Bool)

(assert (=> b!685475 (=> res!450809 e!390411)))

(assert (=> b!685475 (= res!450809 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((List!13034 0))(
  ( (Nil!13031) (Cons!13030 (h!14075 (_ BitVec 64)) (t!19286 List!13034)) )
))
(declare-fun lt!314664 () List!13034)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun acc!681 () List!13034)

(declare-fun -!162 (List!13034 (_ BitVec 64)) List!13034)

(assert (=> b!685475 (= (-!162 lt!314664 k!2843) acc!681)))

(declare-fun $colon$colon!362 (List!13034 (_ BitVec 64)) List!13034)

(assert (=> b!685475 (= lt!314664 ($colon$colon!362 acc!681 k!2843))))

(declare-fun lt!314668 () Unit!24132)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13034) Unit!24132)

(assert (=> b!685475 (= lt!314668 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!197 (List!13034 List!13034) Bool)

(assert (=> b!685475 (subseq!197 acc!681 acc!681)))

(declare-fun lt!314671 () Unit!24132)

(declare-fun lemmaListSubSeqRefl!0 (List!13034) Unit!24132)

(assert (=> b!685475 (= lt!314671 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun arrayNoDuplicates!0 (array!39631 (_ BitVec 32) List!13034) Bool)

(assert (=> b!685475 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314665 () Unit!24132)

(assert (=> b!685475 (= lt!314665 e!390410)))

(declare-fun c!77698 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!685475 (= c!77698 (validKeyInArray!0 (select (arr!18993 a!3626) from!3004)))))

(declare-fun lt!314666 () Unit!24132)

(assert (=> b!685475 (= lt!314666 e!390407)))

(declare-fun c!77699 () Bool)

(declare-fun lt!314667 () Bool)

(assert (=> b!685475 (= c!77699 lt!314667)))

(declare-fun arrayContainsKey!0 (array!39631 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!685475 (= lt!314667 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!685475 (arrayContainsKey!0 (array!39632 (store (arr!18993 a!3626) i!1382 k!2843) (size!19365 a!3626)) k!2843 from!3004)))

(declare-fun b!685476 () Bool)

(declare-fun contains!3611 (List!13034 (_ BitVec 64)) Bool)

(assert (=> b!685476 (= e!390412 (not (contains!3611 acc!681 k!2843)))))

(declare-fun b!685478 () Bool)

(declare-fun Unit!24136 () Unit!24132)

(assert (=> b!685478 (= e!390407 Unit!24136)))

(declare-fun lt!314670 () Unit!24132)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39631 (_ BitVec 64) (_ BitVec 32)) Unit!24132)

(assert (=> b!685478 (= lt!314670 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!685478 false))

(declare-fun b!685479 () Bool)

(declare-fun res!450812 () Bool)

(assert (=> b!685479 (=> (not res!450812) (not e!390413))))

(assert (=> b!685479 (= res!450812 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13031))))

(declare-fun b!685480 () Bool)

(declare-fun res!450811 () Bool)

(assert (=> b!685480 (=> (not res!450811) (not e!390413))))

(assert (=> b!685480 (= res!450811 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!685481 () Bool)

(declare-fun res!450814 () Bool)

(assert (=> b!685481 (=> (not res!450814) (not e!390413))))

(assert (=> b!685481 (= res!450814 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!685482 () Bool)

(declare-fun res!450810 () Bool)

(assert (=> b!685482 (=> (not res!450810) (not e!390413))))

(assert (=> b!685482 (= res!450810 (not (contains!3611 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685483 () Bool)

(assert (=> b!685483 (= e!390411 true)))

(declare-fun lt!314669 () Bool)

(assert (=> b!685483 (= lt!314669 (contains!3611 lt!314664 k!2843))))

(declare-fun b!685484 () Bool)

(declare-fun res!450821 () Bool)

(assert (=> b!685484 (=> (not res!450821) (not e!390413))))

(assert (=> b!685484 (= res!450821 (validKeyInArray!0 k!2843))))

(declare-fun b!685485 () Bool)

(declare-fun res!450822 () Bool)

(assert (=> b!685485 (=> (not res!450822) (not e!390413))))

(assert (=> b!685485 (= res!450822 e!390408)))

(declare-fun res!450816 () Bool)

(assert (=> b!685485 (=> res!450816 e!390408)))

(declare-fun e!390409 () Bool)

(assert (=> b!685485 (= res!450816 e!390409)))

(declare-fun res!450824 () Bool)

(assert (=> b!685485 (=> (not res!450824) (not e!390409))))

(assert (=> b!685485 (= res!450824 (bvsgt from!3004 i!1382))))

(declare-fun b!685486 () Bool)

(declare-fun res!450819 () Bool)

(assert (=> b!685486 (=> (not res!450819) (not e!390413))))

(assert (=> b!685486 (= res!450819 (not (contains!3611 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685487 () Bool)

(declare-fun lt!314662 () Unit!24132)

(assert (=> b!685487 (= e!390410 lt!314662)))

(declare-fun lt!314663 () Unit!24132)

(assert (=> b!685487 (= lt!314663 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!685487 (subseq!197 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39631 List!13034 List!13034 (_ BitVec 32)) Unit!24132)

(assert (=> b!685487 (= lt!314662 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!362 acc!681 (select (arr!18993 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!685487 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!685488 () Bool)

(declare-fun res!450817 () Bool)

(assert (=> b!685488 (=> (not res!450817) (not e!390413))))

(declare-fun noDuplicate!858 (List!13034) Bool)

(assert (=> b!685488 (= res!450817 (noDuplicate!858 acc!681))))

(declare-fun b!685489 () Bool)

(declare-fun res!450813 () Bool)

(assert (=> b!685489 (=> res!450813 e!390411)))

(assert (=> b!685489 (= res!450813 (not (subseq!197 acc!681 lt!314664)))))

(declare-fun b!685477 () Bool)

(declare-fun res!450820 () Bool)

(assert (=> b!685477 (=> res!450820 e!390411)))

(assert (=> b!685477 (= res!450820 (contains!3611 acc!681 k!2843))))

(declare-fun res!450825 () Bool)

(assert (=> start!61172 (=> (not res!450825) (not e!390413))))

(assert (=> start!61172 (= res!450825 (and (bvslt (size!19365 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19365 a!3626))))))

(assert (=> start!61172 e!390413))

(assert (=> start!61172 true))

(declare-fun array_inv!14789 (array!39631) Bool)

(assert (=> start!61172 (array_inv!14789 a!3626)))

(declare-fun b!685490 () Bool)

(declare-fun res!450827 () Bool)

(assert (=> b!685490 (=> (not res!450827) (not e!390413))))

(assert (=> b!685490 (= res!450827 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19365 a!3626))))))

(declare-fun b!685491 () Bool)

(declare-fun res!450818 () Bool)

(assert (=> b!685491 (=> res!450818 e!390411)))

(assert (=> b!685491 (= res!450818 (not (noDuplicate!858 lt!314664)))))

(declare-fun b!685492 () Bool)

(assert (=> b!685492 (= e!390409 (contains!3611 acc!681 k!2843))))

(declare-fun b!685493 () Bool)

(declare-fun res!450823 () Bool)

(assert (=> b!685493 (=> res!450823 e!390411)))

(assert (=> b!685493 (= res!450823 lt!314667)))

(assert (= (and start!61172 res!450825) b!685488))

(assert (= (and b!685488 res!450817) b!685486))

(assert (= (and b!685486 res!450819) b!685482))

(assert (= (and b!685482 res!450810) b!685485))

(assert (= (and b!685485 res!450824) b!685492))

(assert (= (and b!685485 (not res!450816)) b!685473))

(assert (= (and b!685473 res!450815) b!685476))

(assert (= (and b!685485 res!450822) b!685479))

(assert (= (and b!685479 res!450812) b!685480))

(assert (= (and b!685480 res!450811) b!685490))

(assert (= (and b!685490 res!450827) b!685484))

(assert (= (and b!685484 res!450821) b!685481))

(assert (= (and b!685481 res!450814) b!685471))

(assert (= (and b!685471 res!450826) b!685475))

(assert (= (and b!685475 c!77699) b!685478))

(assert (= (and b!685475 (not c!77699)) b!685472))

(assert (= (and b!685475 c!77698) b!685487))

(assert (= (and b!685475 (not c!77698)) b!685474))

(assert (= (and b!685475 (not res!450809)) b!685491))

(assert (= (and b!685491 (not res!450818)) b!685493))

(assert (= (and b!685493 (not res!450823)) b!685477))

(assert (= (and b!685477 (not res!450820)) b!685489))

(assert (= (and b!685489 (not res!450813)) b!685483))

(declare-fun m!649679 () Bool)

(assert (=> b!685491 m!649679))

(declare-fun m!649681 () Bool)

(assert (=> b!685477 m!649681))

(declare-fun m!649683 () Bool)

(assert (=> b!685475 m!649683))

(declare-fun m!649685 () Bool)

(assert (=> b!685475 m!649685))

(declare-fun m!649687 () Bool)

(assert (=> b!685475 m!649687))

(declare-fun m!649689 () Bool)

(assert (=> b!685475 m!649689))

(declare-fun m!649691 () Bool)

(assert (=> b!685475 m!649691))

(declare-fun m!649693 () Bool)

(assert (=> b!685475 m!649693))

(declare-fun m!649695 () Bool)

(assert (=> b!685475 m!649695))

(declare-fun m!649697 () Bool)

(assert (=> b!685475 m!649697))

(assert (=> b!685475 m!649685))

(declare-fun m!649699 () Bool)

(assert (=> b!685475 m!649699))

(declare-fun m!649701 () Bool)

(assert (=> b!685475 m!649701))

(declare-fun m!649703 () Bool)

(assert (=> b!685475 m!649703))

(declare-fun m!649705 () Bool)

(assert (=> b!685482 m!649705))

(declare-fun m!649707 () Bool)

(assert (=> b!685489 m!649707))

(declare-fun m!649709 () Bool)

(assert (=> b!685488 m!649709))

(assert (=> b!685476 m!649681))

(declare-fun m!649711 () Bool)

(assert (=> b!685486 m!649711))

(declare-fun m!649713 () Bool)

(assert (=> b!685481 m!649713))

(declare-fun m!649715 () Bool)

(assert (=> b!685478 m!649715))

(declare-fun m!649717 () Bool)

(assert (=> b!685479 m!649717))

(assert (=> b!685487 m!649683))

(assert (=> b!685487 m!649685))

(declare-fun m!649719 () Bool)

(assert (=> b!685487 m!649719))

(declare-fun m!649721 () Bool)

(assert (=> b!685487 m!649721))

(assert (=> b!685487 m!649685))

(assert (=> b!685487 m!649719))

(assert (=> b!685487 m!649693))

(assert (=> b!685487 m!649703))

(declare-fun m!649723 () Bool)

(assert (=> b!685484 m!649723))

(declare-fun m!649725 () Bool)

(assert (=> b!685480 m!649725))

(declare-fun m!649727 () Bool)

(assert (=> start!61172 m!649727))

(declare-fun m!649729 () Bool)

(assert (=> b!685483 m!649729))

(assert (=> b!685492 m!649681))

(push 1)

(assert (not b!685481))

(assert (not b!685492))

(assert (not b!685480))

(assert (not b!685489))

(assert (not b!685486))

(assert (not b!685482))

(assert (not b!685479))

(assert (not b!685487))

(assert (not b!685475))

(assert (not b!685483))

(assert (not b!685478))

(assert (not b!685477))

(assert (not b!685491))

(assert (not b!685488))

(assert (not b!685476))

(assert (not start!61172))

(assert (not b!685484))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

