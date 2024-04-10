; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59914 () Bool)

(assert start!59914)

(declare-fun b!663570 () Bool)

(declare-fun res!431440 () Bool)

(declare-fun e!380724 () Bool)

(assert (=> b!663570 (=> (not res!431440) (not e!380724))))

(declare-datatypes ((array!38961 0))(
  ( (array!38962 (arr!18673 (Array (_ BitVec 32) (_ BitVec 64))) (size!19037 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38961)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38961 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!663570 (= res!431440 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun res!431438 () Bool)

(assert (=> start!59914 (=> (not res!431438) (not e!380724))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59914 (= res!431438 (and (bvslt (size!19037 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19037 a!3626))))))

(assert (=> start!59914 e!380724))

(assert (=> start!59914 true))

(declare-fun array_inv!14469 (array!38961) Bool)

(assert (=> start!59914 (array_inv!14469 a!3626)))

(declare-fun b!663571 () Bool)

(declare-fun res!431446 () Bool)

(assert (=> b!663571 (=> (not res!431446) (not e!380724))))

(declare-fun e!380722 () Bool)

(assert (=> b!663571 (= res!431446 e!380722)))

(declare-fun res!431434 () Bool)

(assert (=> b!663571 (=> res!431434 e!380722)))

(declare-fun e!380726 () Bool)

(assert (=> b!663571 (= res!431434 e!380726)))

(declare-fun res!431441 () Bool)

(assert (=> b!663571 (=> (not res!431441) (not e!380726))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!663571 (= res!431441 (bvsgt from!3004 i!1382))))

(declare-fun b!663572 () Bool)

(assert (=> b!663572 (= e!380724 (not true))))

(declare-datatypes ((Unit!23090 0))(
  ( (Unit!23091) )
))
(declare-fun lt!309322 () Unit!23090)

(declare-fun e!380725 () Unit!23090)

(assert (=> b!663572 (= lt!309322 e!380725)))

(declare-fun c!76435 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!663572 (= c!76435 (validKeyInArray!0 (select (arr!18673 a!3626) from!3004)))))

(declare-fun lt!309321 () Unit!23090)

(declare-fun e!380721 () Unit!23090)

(assert (=> b!663572 (= lt!309321 e!380721)))

(declare-fun c!76436 () Bool)

(assert (=> b!663572 (= c!76436 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663572 (arrayContainsKey!0 (array!38962 (store (arr!18673 a!3626) i!1382 k0!2843) (size!19037 a!3626)) k0!2843 from!3004)))

(declare-fun b!663573 () Bool)

(declare-fun res!431444 () Bool)

(assert (=> b!663573 (=> (not res!431444) (not e!380724))))

(declare-datatypes ((List!12714 0))(
  ( (Nil!12711) (Cons!12710 (h!13755 (_ BitVec 64)) (t!18942 List!12714)) )
))
(declare-fun acc!681 () List!12714)

(declare-fun contains!3291 (List!12714 (_ BitVec 64)) Bool)

(assert (=> b!663573 (= res!431444 (not (contains!3291 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663574 () Bool)

(declare-fun res!431436 () Bool)

(assert (=> b!663574 (=> (not res!431436) (not e!380724))))

(assert (=> b!663574 (= res!431436 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19037 a!3626))))))

(declare-fun b!663575 () Bool)

(declare-fun Unit!23092 () Unit!23090)

(assert (=> b!663575 (= e!380725 Unit!23092)))

(declare-fun b!663576 () Bool)

(declare-fun res!431447 () Bool)

(assert (=> b!663576 (=> (not res!431447) (not e!380724))))

(declare-fun arrayNoDuplicates!0 (array!38961 (_ BitVec 32) List!12714) Bool)

(assert (=> b!663576 (= res!431447 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!663577 () Bool)

(declare-fun Unit!23093 () Unit!23090)

(assert (=> b!663577 (= e!380721 Unit!23093)))

(declare-fun b!663578 () Bool)

(assert (=> b!663578 (= e!380726 (contains!3291 acc!681 k0!2843))))

(declare-fun b!663579 () Bool)

(declare-fun Unit!23094 () Unit!23090)

(assert (=> b!663579 (= e!380721 Unit!23094)))

(declare-fun lt!309325 () Unit!23090)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38961 (_ BitVec 64) (_ BitVec 32)) Unit!23090)

(assert (=> b!663579 (= lt!309325 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!663579 false))

(declare-fun b!663580 () Bool)

(declare-fun e!380723 () Bool)

(assert (=> b!663580 (= e!380722 e!380723)))

(declare-fun res!431442 () Bool)

(assert (=> b!663580 (=> (not res!431442) (not e!380723))))

(assert (=> b!663580 (= res!431442 (bvsle from!3004 i!1382))))

(declare-fun b!663581 () Bool)

(declare-fun res!431445 () Bool)

(assert (=> b!663581 (=> (not res!431445) (not e!380724))))

(declare-fun noDuplicate!538 (List!12714) Bool)

(assert (=> b!663581 (= res!431445 (noDuplicate!538 acc!681))))

(declare-fun b!663582 () Bool)

(assert (=> b!663582 (= e!380723 (not (contains!3291 acc!681 k0!2843)))))

(declare-fun b!663583 () Bool)

(declare-fun res!431437 () Bool)

(assert (=> b!663583 (=> (not res!431437) (not e!380724))))

(assert (=> b!663583 (= res!431437 (validKeyInArray!0 k0!2843))))

(declare-fun b!663584 () Bool)

(declare-fun res!431443 () Bool)

(assert (=> b!663584 (=> (not res!431443) (not e!380724))))

(assert (=> b!663584 (= res!431443 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12711))))

(declare-fun b!663585 () Bool)

(declare-fun res!431439 () Bool)

(assert (=> b!663585 (=> (not res!431439) (not e!380724))))

(assert (=> b!663585 (= res!431439 (not (contains!3291 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663586 () Bool)

(declare-fun res!431435 () Bool)

(assert (=> b!663586 (=> (not res!431435) (not e!380724))))

(assert (=> b!663586 (= res!431435 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19037 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!663587 () Bool)

(declare-fun lt!309323 () Unit!23090)

(assert (=> b!663587 (= e!380725 lt!309323)))

(declare-fun lt!309324 () Unit!23090)

(declare-fun lemmaListSubSeqRefl!0 (List!12714) Unit!23090)

(assert (=> b!663587 (= lt!309324 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!30 (List!12714 List!12714) Bool)

(assert (=> b!663587 (subseq!30 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38961 List!12714 List!12714 (_ BitVec 32)) Unit!23090)

(declare-fun $colon$colon!162 (List!12714 (_ BitVec 64)) List!12714)

(assert (=> b!663587 (= lt!309323 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!162 acc!681 (select (arr!18673 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663587 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(assert (= (and start!59914 res!431438) b!663581))

(assert (= (and b!663581 res!431445) b!663573))

(assert (= (and b!663573 res!431444) b!663585))

(assert (= (and b!663585 res!431439) b!663571))

(assert (= (and b!663571 res!431441) b!663578))

(assert (= (and b!663571 (not res!431434)) b!663580))

(assert (= (and b!663580 res!431442) b!663582))

(assert (= (and b!663571 res!431446) b!663584))

(assert (= (and b!663584 res!431443) b!663576))

(assert (= (and b!663576 res!431447) b!663574))

(assert (= (and b!663574 res!431436) b!663583))

(assert (= (and b!663583 res!431437) b!663570))

(assert (= (and b!663570 res!431440) b!663586))

(assert (= (and b!663586 res!431435) b!663572))

(assert (= (and b!663572 c!76436) b!663579))

(assert (= (and b!663572 (not c!76436)) b!663577))

(assert (= (and b!663572 c!76435) b!663587))

(assert (= (and b!663572 (not c!76435)) b!663575))

(declare-fun m!635109 () Bool)

(assert (=> b!663581 m!635109))

(declare-fun m!635111 () Bool)

(assert (=> b!663583 m!635111))

(declare-fun m!635113 () Bool)

(assert (=> start!59914 m!635113))

(declare-fun m!635115 () Bool)

(assert (=> b!663587 m!635115))

(declare-fun m!635117 () Bool)

(assert (=> b!663587 m!635117))

(declare-fun m!635119 () Bool)

(assert (=> b!663587 m!635119))

(declare-fun m!635121 () Bool)

(assert (=> b!663587 m!635121))

(assert (=> b!663587 m!635117))

(assert (=> b!663587 m!635119))

(declare-fun m!635123 () Bool)

(assert (=> b!663587 m!635123))

(declare-fun m!635125 () Bool)

(assert (=> b!663587 m!635125))

(declare-fun m!635127 () Bool)

(assert (=> b!663578 m!635127))

(declare-fun m!635129 () Bool)

(assert (=> b!663570 m!635129))

(assert (=> b!663572 m!635117))

(declare-fun m!635131 () Bool)

(assert (=> b!663572 m!635131))

(declare-fun m!635133 () Bool)

(assert (=> b!663572 m!635133))

(assert (=> b!663572 m!635117))

(declare-fun m!635135 () Bool)

(assert (=> b!663572 m!635135))

(declare-fun m!635137 () Bool)

(assert (=> b!663572 m!635137))

(declare-fun m!635139 () Bool)

(assert (=> b!663584 m!635139))

(declare-fun m!635141 () Bool)

(assert (=> b!663573 m!635141))

(declare-fun m!635143 () Bool)

(assert (=> b!663585 m!635143))

(declare-fun m!635145 () Bool)

(assert (=> b!663579 m!635145))

(declare-fun m!635147 () Bool)

(assert (=> b!663576 m!635147))

(assert (=> b!663582 m!635127))

(check-sat (not b!663583) (not b!663579) (not b!663585) (not b!663573) (not b!663581) (not b!663570) (not b!663576) (not b!663584) (not start!59914) (not b!663572) (not b!663587) (not b!663582) (not b!663578))
(check-sat)
