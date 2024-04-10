; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60874 () Bool)

(assert start!60874)

(declare-fun b!682785 () Bool)

(declare-fun res!448710 () Bool)

(declare-fun e!389002 () Bool)

(assert (=> b!682785 (=> (not res!448710) (not e!389002))))

(declare-datatypes ((List!13002 0))(
  ( (Nil!12999) (Cons!12998 (h!14043 (_ BitVec 64)) (t!19245 List!13002)) )
))
(declare-fun acc!681 () List!13002)

(declare-fun noDuplicate!826 (List!13002) Bool)

(assert (=> b!682785 (= res!448710 (noDuplicate!826 acc!681))))

(declare-fun b!682786 () Bool)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!682786 (= e!389002 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000)))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun -!130 (List!13002 (_ BitVec 64)) List!13002)

(declare-fun $colon$colon!330 (List!13002 (_ BitVec 64)) List!13002)

(assert (=> b!682786 (= (-!130 ($colon$colon!330 acc!681 k0!2843) k0!2843) acc!681)))

(declare-datatypes ((Unit!23972 0))(
  ( (Unit!23973) )
))
(declare-fun lt!313650 () Unit!23972)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13002) Unit!23972)

(assert (=> b!682786 (= lt!313650 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!165 (List!13002 List!13002) Bool)

(assert (=> b!682786 (subseq!165 acc!681 acc!681)))

(declare-fun lt!313649 () Unit!23972)

(declare-fun lemmaListSubSeqRefl!0 (List!13002) Unit!23972)

(assert (=> b!682786 (= lt!313649 (lemmaListSubSeqRefl!0 acc!681))))

(declare-datatypes ((array!39558 0))(
  ( (array!39559 (arr!18961 (Array (_ BitVec 32) (_ BitVec 64))) (size!19325 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39558)

(declare-fun arrayNoDuplicates!0 (array!39558 (_ BitVec 32) List!13002) Bool)

(assert (=> b!682786 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313652 () Unit!23972)

(declare-fun e!389007 () Unit!23972)

(assert (=> b!682786 (= lt!313652 e!389007)))

(declare-fun c!77407 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!682786 (= c!77407 (validKeyInArray!0 (select (arr!18961 a!3626) from!3004)))))

(declare-fun lt!313648 () Unit!23972)

(declare-fun e!389004 () Unit!23972)

(assert (=> b!682786 (= lt!313648 e!389004)))

(declare-fun c!77408 () Bool)

(declare-fun arrayContainsKey!0 (array!39558 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!682786 (= c!77408 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!682786 (arrayContainsKey!0 (array!39559 (store (arr!18961 a!3626) i!1382 k0!2843) (size!19325 a!3626)) k0!2843 from!3004)))

(declare-fun b!682787 () Bool)

(declare-fun res!448716 () Bool)

(assert (=> b!682787 (=> (not res!448716) (not e!389002))))

(assert (=> b!682787 (= res!448716 (validKeyInArray!0 k0!2843))))

(declare-fun b!682788 () Bool)

(declare-fun res!448712 () Bool)

(assert (=> b!682788 (=> (not res!448712) (not e!389002))))

(declare-fun contains!3579 (List!13002 (_ BitVec 64)) Bool)

(assert (=> b!682788 (= res!448712 (not (contains!3579 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682789 () Bool)

(declare-fun Unit!23974 () Unit!23972)

(assert (=> b!682789 (= e!389004 Unit!23974)))

(declare-fun lt!313651 () Unit!23972)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39558 (_ BitVec 64) (_ BitVec 32)) Unit!23972)

(assert (=> b!682789 (= lt!313651 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!682789 false))

(declare-fun b!682790 () Bool)

(declare-fun lt!313654 () Unit!23972)

(assert (=> b!682790 (= e!389007 lt!313654)))

(declare-fun lt!313653 () Unit!23972)

(assert (=> b!682790 (= lt!313653 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!682790 (subseq!165 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39558 List!13002 List!13002 (_ BitVec 32)) Unit!23972)

(assert (=> b!682790 (= lt!313654 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!330 acc!681 (select (arr!18961 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682790 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!682791 () Bool)

(declare-fun res!448708 () Bool)

(assert (=> b!682791 (=> (not res!448708) (not e!389002))))

(assert (=> b!682791 (= res!448708 (not (contains!3579 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682792 () Bool)

(declare-fun res!448715 () Bool)

(assert (=> b!682792 (=> (not res!448715) (not e!389002))))

(assert (=> b!682792 (= res!448715 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!682793 () Bool)

(declare-fun res!448709 () Bool)

(assert (=> b!682793 (=> (not res!448709) (not e!389002))))

(assert (=> b!682793 (= res!448709 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12999))))

(declare-fun res!448705 () Bool)

(assert (=> start!60874 (=> (not res!448705) (not e!389002))))

(assert (=> start!60874 (= res!448705 (and (bvslt (size!19325 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19325 a!3626))))))

(assert (=> start!60874 e!389002))

(assert (=> start!60874 true))

(declare-fun array_inv!14757 (array!39558) Bool)

(assert (=> start!60874 (array_inv!14757 a!3626)))

(declare-fun b!682794 () Bool)

(declare-fun res!448713 () Bool)

(assert (=> b!682794 (=> (not res!448713) (not e!389002))))

(declare-fun e!389003 () Bool)

(assert (=> b!682794 (= res!448713 e!389003)))

(declare-fun res!448717 () Bool)

(assert (=> b!682794 (=> res!448717 e!389003)))

(declare-fun e!389005 () Bool)

(assert (=> b!682794 (= res!448717 e!389005)))

(declare-fun res!448718 () Bool)

(assert (=> b!682794 (=> (not res!448718) (not e!389005))))

(assert (=> b!682794 (= res!448718 (bvsgt from!3004 i!1382))))

(declare-fun b!682795 () Bool)

(declare-fun e!389006 () Bool)

(assert (=> b!682795 (= e!389003 e!389006)))

(declare-fun res!448714 () Bool)

(assert (=> b!682795 (=> (not res!448714) (not e!389006))))

(assert (=> b!682795 (= res!448714 (bvsle from!3004 i!1382))))

(declare-fun b!682796 () Bool)

(declare-fun res!448706 () Bool)

(assert (=> b!682796 (=> (not res!448706) (not e!389002))))

(assert (=> b!682796 (= res!448706 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!682797 () Bool)

(declare-fun res!448711 () Bool)

(assert (=> b!682797 (=> (not res!448711) (not e!389002))))

(assert (=> b!682797 (= res!448711 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19325 a!3626))))))

(declare-fun b!682798 () Bool)

(declare-fun Unit!23975 () Unit!23972)

(assert (=> b!682798 (= e!389007 Unit!23975)))

(declare-fun b!682799 () Bool)

(declare-fun Unit!23976 () Unit!23972)

(assert (=> b!682799 (= e!389004 Unit!23976)))

(declare-fun b!682800 () Bool)

(declare-fun res!448707 () Bool)

(assert (=> b!682800 (=> (not res!448707) (not e!389002))))

(assert (=> b!682800 (= res!448707 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19325 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!682801 () Bool)

(assert (=> b!682801 (= e!389005 (contains!3579 acc!681 k0!2843))))

(declare-fun b!682802 () Bool)

(assert (=> b!682802 (= e!389006 (not (contains!3579 acc!681 k0!2843)))))

(assert (= (and start!60874 res!448705) b!682785))

(assert (= (and b!682785 res!448710) b!682791))

(assert (= (and b!682791 res!448708) b!682788))

(assert (= (and b!682788 res!448712) b!682794))

(assert (= (and b!682794 res!448718) b!682801))

(assert (= (and b!682794 (not res!448717)) b!682795))

(assert (= (and b!682795 res!448714) b!682802))

(assert (= (and b!682794 res!448713) b!682793))

(assert (= (and b!682793 res!448709) b!682796))

(assert (= (and b!682796 res!448706) b!682797))

(assert (= (and b!682797 res!448711) b!682787))

(assert (= (and b!682787 res!448716) b!682792))

(assert (= (and b!682792 res!448715) b!682800))

(assert (= (and b!682800 res!448707) b!682786))

(assert (= (and b!682786 c!77408) b!682789))

(assert (= (and b!682786 (not c!77408)) b!682799))

(assert (= (and b!682786 c!77407) b!682790))

(assert (= (and b!682786 (not c!77407)) b!682798))

(declare-fun m!647421 () Bool)

(assert (=> b!682801 m!647421))

(declare-fun m!647423 () Bool)

(assert (=> b!682792 m!647423))

(assert (=> b!682802 m!647421))

(declare-fun m!647425 () Bool)

(assert (=> b!682785 m!647425))

(declare-fun m!647427 () Bool)

(assert (=> b!682789 m!647427))

(declare-fun m!647429 () Bool)

(assert (=> b!682786 m!647429))

(declare-fun m!647431 () Bool)

(assert (=> b!682786 m!647431))

(declare-fun m!647433 () Bool)

(assert (=> b!682786 m!647433))

(declare-fun m!647435 () Bool)

(assert (=> b!682786 m!647435))

(declare-fun m!647437 () Bool)

(assert (=> b!682786 m!647437))

(declare-fun m!647439 () Bool)

(assert (=> b!682786 m!647439))

(declare-fun m!647441 () Bool)

(assert (=> b!682786 m!647441))

(declare-fun m!647443 () Bool)

(assert (=> b!682786 m!647443))

(assert (=> b!682786 m!647429))

(assert (=> b!682786 m!647435))

(declare-fun m!647445 () Bool)

(assert (=> b!682786 m!647445))

(declare-fun m!647447 () Bool)

(assert (=> b!682786 m!647447))

(declare-fun m!647449 () Bool)

(assert (=> b!682786 m!647449))

(declare-fun m!647451 () Bool)

(assert (=> b!682787 m!647451))

(declare-fun m!647453 () Bool)

(assert (=> b!682791 m!647453))

(declare-fun m!647455 () Bool)

(assert (=> start!60874 m!647455))

(assert (=> b!682790 m!647433))

(assert (=> b!682790 m!647435))

(declare-fun m!647457 () Bool)

(assert (=> b!682790 m!647457))

(declare-fun m!647459 () Bool)

(assert (=> b!682790 m!647459))

(assert (=> b!682790 m!647435))

(assert (=> b!682790 m!647457))

(assert (=> b!682790 m!647441))

(assert (=> b!682790 m!647449))

(declare-fun m!647461 () Bool)

(assert (=> b!682796 m!647461))

(declare-fun m!647463 () Bool)

(assert (=> b!682788 m!647463))

(declare-fun m!647465 () Bool)

(assert (=> b!682793 m!647465))

(check-sat (not b!682801) (not b!682793) (not start!60874) (not b!682787) (not b!682788) (not b!682785) (not b!682802) (not b!682790) (not b!682791) (not b!682786) (not b!682792) (not b!682796) (not b!682789))
(check-sat)
