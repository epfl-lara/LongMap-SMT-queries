; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59924 () Bool)

(assert start!59924)

(declare-fun b!663841 () Bool)

(declare-fun res!431656 () Bool)

(declare-fun e!380827 () Bool)

(assert (=> b!663841 (=> (not res!431656) (not e!380827))))

(declare-datatypes ((array!38971 0))(
  ( (array!38972 (arr!18678 (Array (_ BitVec 32) (_ BitVec 64))) (size!19042 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38971)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38971 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!663841 (= res!431656 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!663842 () Bool)

(declare-fun res!431653 () Bool)

(assert (=> b!663842 (=> (not res!431653) (not e!380827))))

(declare-fun e!380831 () Bool)

(assert (=> b!663842 (= res!431653 e!380831)))

(declare-fun res!431645 () Bool)

(assert (=> b!663842 (=> res!431645 e!380831)))

(declare-fun e!380832 () Bool)

(assert (=> b!663842 (= res!431645 e!380832)))

(declare-fun res!431655 () Bool)

(assert (=> b!663842 (=> (not res!431655) (not e!380832))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!663842 (= res!431655 (bvsgt from!3004 i!1382))))

(declare-fun b!663843 () Bool)

(declare-fun e!380826 () Bool)

(assert (=> b!663843 (= e!380831 e!380826)))

(declare-fun res!431651 () Bool)

(assert (=> b!663843 (=> (not res!431651) (not e!380826))))

(assert (=> b!663843 (= res!431651 (bvsle from!3004 i!1382))))

(declare-fun b!663844 () Bool)

(declare-fun res!431649 () Bool)

(assert (=> b!663844 (=> (not res!431649) (not e!380827))))

(declare-datatypes ((List!12719 0))(
  ( (Nil!12716) (Cons!12715 (h!13760 (_ BitVec 64)) (t!18947 List!12719)) )
))
(declare-fun acc!681 () List!12719)

(declare-fun contains!3296 (List!12719 (_ BitVec 64)) Bool)

(assert (=> b!663844 (= res!431649 (not (contains!3296 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663845 () Bool)

(declare-datatypes ((Unit!23115 0))(
  ( (Unit!23116) )
))
(declare-fun e!380828 () Unit!23115)

(declare-fun Unit!23117 () Unit!23115)

(assert (=> b!663845 (= e!380828 Unit!23117)))

(declare-fun b!663846 () Bool)

(declare-fun res!431646 () Bool)

(assert (=> b!663846 (=> (not res!431646) (not e!380827))))

(declare-fun arrayNoDuplicates!0 (array!38971 (_ BitVec 32) List!12719) Bool)

(assert (=> b!663846 (= res!431646 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!663847 () Bool)

(declare-fun res!431654 () Bool)

(assert (=> b!663847 (=> (not res!431654) (not e!380827))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!663847 (= res!431654 (validKeyInArray!0 k!2843))))

(declare-fun b!663848 () Bool)

(assert (=> b!663848 (= e!380826 (not (contains!3296 acc!681 k!2843)))))

(declare-fun b!663849 () Bool)

(declare-fun e!380830 () Unit!23115)

(declare-fun Unit!23118 () Unit!23115)

(assert (=> b!663849 (= e!380830 Unit!23118)))

(declare-fun b!663850 () Bool)

(declare-fun res!431652 () Bool)

(assert (=> b!663850 (=> (not res!431652) (not e!380827))))

(assert (=> b!663850 (= res!431652 (not (contains!3296 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663851 () Bool)

(declare-fun res!431647 () Bool)

(assert (=> b!663851 (=> (not res!431647) (not e!380827))))

(assert (=> b!663851 (= res!431647 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19042 a!3626)) (= from!3004 i!1382)))))

(declare-fun res!431650 () Bool)

(assert (=> start!59924 (=> (not res!431650) (not e!380827))))

(assert (=> start!59924 (= res!431650 (and (bvslt (size!19042 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19042 a!3626))))))

(assert (=> start!59924 e!380827))

(assert (=> start!59924 true))

(declare-fun array_inv!14474 (array!38971) Bool)

(assert (=> start!59924 (array_inv!14474 a!3626)))

(declare-fun b!663840 () Bool)

(declare-fun res!431657 () Bool)

(assert (=> b!663840 (=> (not res!431657) (not e!380827))))

(assert (=> b!663840 (= res!431657 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19042 a!3626))))))

(declare-fun b!663852 () Bool)

(declare-fun Unit!23119 () Unit!23115)

(assert (=> b!663852 (= e!380830 Unit!23119)))

(declare-fun lt!309397 () Unit!23115)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38971 (_ BitVec 64) (_ BitVec 32)) Unit!23115)

(assert (=> b!663852 (= lt!309397 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!663852 false))

(declare-fun b!663853 () Bool)

(assert (=> b!663853 (= e!380827 (not true))))

(declare-fun lt!309396 () Unit!23115)

(assert (=> b!663853 (= lt!309396 e!380828)))

(declare-fun c!76465 () Bool)

(assert (=> b!663853 (= c!76465 (validKeyInArray!0 (select (arr!18678 a!3626) from!3004)))))

(declare-fun lt!309400 () Unit!23115)

(assert (=> b!663853 (= lt!309400 e!380830)))

(declare-fun c!76466 () Bool)

(assert (=> b!663853 (= c!76466 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663853 (arrayContainsKey!0 (array!38972 (store (arr!18678 a!3626) i!1382 k!2843) (size!19042 a!3626)) k!2843 from!3004)))

(declare-fun b!663854 () Bool)

(assert (=> b!663854 (= e!380832 (contains!3296 acc!681 k!2843))))

(declare-fun b!663855 () Bool)

(declare-fun lt!309398 () Unit!23115)

(assert (=> b!663855 (= e!380828 lt!309398)))

(declare-fun lt!309399 () Unit!23115)

(declare-fun lemmaListSubSeqRefl!0 (List!12719) Unit!23115)

(assert (=> b!663855 (= lt!309399 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!35 (List!12719 List!12719) Bool)

(assert (=> b!663855 (subseq!35 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38971 List!12719 List!12719 (_ BitVec 32)) Unit!23115)

(declare-fun $colon$colon!167 (List!12719 (_ BitVec 64)) List!12719)

(assert (=> b!663855 (= lt!309398 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!167 acc!681 (select (arr!18678 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663855 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!663856 () Bool)

(declare-fun res!431644 () Bool)

(assert (=> b!663856 (=> (not res!431644) (not e!380827))))

(assert (=> b!663856 (= res!431644 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12716))))

(declare-fun b!663857 () Bool)

(declare-fun res!431648 () Bool)

(assert (=> b!663857 (=> (not res!431648) (not e!380827))))

(declare-fun noDuplicate!543 (List!12719) Bool)

(assert (=> b!663857 (= res!431648 (noDuplicate!543 acc!681))))

(assert (= (and start!59924 res!431650) b!663857))

(assert (= (and b!663857 res!431648) b!663844))

(assert (= (and b!663844 res!431649) b!663850))

(assert (= (and b!663850 res!431652) b!663842))

(assert (= (and b!663842 res!431655) b!663854))

(assert (= (and b!663842 (not res!431645)) b!663843))

(assert (= (and b!663843 res!431651) b!663848))

(assert (= (and b!663842 res!431653) b!663856))

(assert (= (and b!663856 res!431644) b!663846))

(assert (= (and b!663846 res!431646) b!663840))

(assert (= (and b!663840 res!431657) b!663847))

(assert (= (and b!663847 res!431654) b!663841))

(assert (= (and b!663841 res!431656) b!663851))

(assert (= (and b!663851 res!431647) b!663853))

(assert (= (and b!663853 c!76466) b!663852))

(assert (= (and b!663853 (not c!76466)) b!663849))

(assert (= (and b!663853 c!76465) b!663855))

(assert (= (and b!663853 (not c!76465)) b!663845))

(declare-fun m!635309 () Bool)

(assert (=> b!663844 m!635309))

(declare-fun m!635311 () Bool)

(assert (=> b!663854 m!635311))

(declare-fun m!635313 () Bool)

(assert (=> b!663846 m!635313))

(declare-fun m!635315 () Bool)

(assert (=> start!59924 m!635315))

(declare-fun m!635317 () Bool)

(assert (=> b!663853 m!635317))

(declare-fun m!635319 () Bool)

(assert (=> b!663853 m!635319))

(declare-fun m!635321 () Bool)

(assert (=> b!663853 m!635321))

(assert (=> b!663853 m!635317))

(declare-fun m!635323 () Bool)

(assert (=> b!663853 m!635323))

(declare-fun m!635325 () Bool)

(assert (=> b!663853 m!635325))

(declare-fun m!635327 () Bool)

(assert (=> b!663852 m!635327))

(declare-fun m!635329 () Bool)

(assert (=> b!663841 m!635329))

(declare-fun m!635331 () Bool)

(assert (=> b!663850 m!635331))

(declare-fun m!635333 () Bool)

(assert (=> b!663856 m!635333))

(declare-fun m!635335 () Bool)

(assert (=> b!663857 m!635335))

(declare-fun m!635337 () Bool)

(assert (=> b!663847 m!635337))

(declare-fun m!635339 () Bool)

(assert (=> b!663855 m!635339))

(assert (=> b!663855 m!635317))

(declare-fun m!635341 () Bool)

(assert (=> b!663855 m!635341))

(declare-fun m!635343 () Bool)

(assert (=> b!663855 m!635343))

(assert (=> b!663855 m!635317))

(assert (=> b!663855 m!635341))

(declare-fun m!635345 () Bool)

(assert (=> b!663855 m!635345))

(declare-fun m!635347 () Bool)

(assert (=> b!663855 m!635347))

(assert (=> b!663848 m!635311))

(push 1)

(assert (not b!663857))

(assert (not b!663848))

(assert (not b!663852))

(assert (not start!59924))

(assert (not b!663844))

(assert (not b!663846))

(assert (not b!663850))

(assert (not b!663841))

(assert (not b!663855))

(assert (not b!663853))

(assert (not b!663847))

(assert (not b!663854))

(assert (not b!663856))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

