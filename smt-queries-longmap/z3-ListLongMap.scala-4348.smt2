; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60118 () Bool)

(assert start!60118)

(declare-fun res!437519 () Bool)

(declare-fun e!383504 () Bool)

(assert (=> start!60118 (=> (not res!437519) (not e!383504))))

(declare-datatypes ((array!39165 0))(
  ( (array!39166 (arr!18775 (Array (_ BitVec 32) (_ BitVec 64))) (size!19139 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39165)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60118 (= res!437519 (and (bvslt (size!19139 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19139 a!3626))))))

(assert (=> start!60118 e!383504))

(assert (=> start!60118 true))

(declare-fun array_inv!14571 (array!39165) Bool)

(assert (=> start!60118 (array_inv!14571 a!3626)))

(declare-fun b!670815 () Bool)

(declare-fun res!437512 () Bool)

(assert (=> b!670815 (=> (not res!437512) (not e!383504))))

(declare-datatypes ((List!12816 0))(
  ( (Nil!12813) (Cons!12812 (h!13857 (_ BitVec 64)) (t!19044 List!12816)) )
))
(declare-fun acc!681 () List!12816)

(declare-fun contains!3393 (List!12816 (_ BitVec 64)) Bool)

(assert (=> b!670815 (= res!437512 (not (contains!3393 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670816 () Bool)

(declare-fun e!383502 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!670816 (= e!383502 (not (contains!3393 acc!681 k0!2843)))))

(declare-fun b!670817 () Bool)

(declare-fun e!383503 () Bool)

(assert (=> b!670817 (= e!383503 e!383502)))

(declare-fun res!437515 () Bool)

(assert (=> b!670817 (=> (not res!437515) (not e!383502))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!670817 (= res!437515 (bvsle from!3004 i!1382))))

(declare-fun b!670818 () Bool)

(declare-fun res!437518 () Bool)

(assert (=> b!670818 (=> (not res!437518) (not e!383504))))

(assert (=> b!670818 (= res!437518 (not (contains!3393 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670819 () Bool)

(declare-fun e!383505 () Bool)

(assert (=> b!670819 (= e!383505 (contains!3393 acc!681 k0!2843))))

(declare-fun b!670820 () Bool)

(declare-fun res!437517 () Bool)

(assert (=> b!670820 (=> (not res!437517) (not e!383504))))

(declare-fun noDuplicate!640 (List!12816) Bool)

(assert (=> b!670820 (= res!437517 (noDuplicate!640 acc!681))))

(declare-fun b!670821 () Bool)

(declare-fun res!437514 () Bool)

(assert (=> b!670821 (=> (not res!437514) (not e!383504))))

(declare-fun arrayNoDuplicates!0 (array!39165 (_ BitVec 32) List!12816) Bool)

(assert (=> b!670821 (= res!437514 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12813))))

(declare-fun b!670822 () Bool)

(declare-fun res!437513 () Bool)

(assert (=> b!670822 (=> (not res!437513) (not e!383504))))

(assert (=> b!670822 (= res!437513 e!383503)))

(declare-fun res!437516 () Bool)

(assert (=> b!670822 (=> res!437516 e!383503)))

(assert (=> b!670822 (= res!437516 e!383505)))

(declare-fun res!437511 () Bool)

(assert (=> b!670822 (=> (not res!437511) (not e!383505))))

(assert (=> b!670822 (= res!437511 (bvsgt from!3004 i!1382))))

(declare-fun b!670823 () Bool)

(assert (=> b!670823 (= e!383504 false)))

(declare-fun lt!312154 () Bool)

(assert (=> b!670823 (= lt!312154 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!60118 res!437519) b!670820))

(assert (= (and b!670820 res!437517) b!670815))

(assert (= (and b!670815 res!437512) b!670818))

(assert (= (and b!670818 res!437518) b!670822))

(assert (= (and b!670822 res!437511) b!670819))

(assert (= (and b!670822 (not res!437516)) b!670817))

(assert (= (and b!670817 res!437515) b!670816))

(assert (= (and b!670822 res!437513) b!670821))

(assert (= (and b!670821 res!437514) b!670823))

(declare-fun m!640615 () Bool)

(assert (=> b!670820 m!640615))

(declare-fun m!640617 () Bool)

(assert (=> b!670818 m!640617))

(declare-fun m!640619 () Bool)

(assert (=> b!670819 m!640619))

(assert (=> b!670816 m!640619))

(declare-fun m!640621 () Bool)

(assert (=> b!670821 m!640621))

(declare-fun m!640623 () Bool)

(assert (=> b!670823 m!640623))

(declare-fun m!640625 () Bool)

(assert (=> b!670815 m!640625))

(declare-fun m!640627 () Bool)

(assert (=> start!60118 m!640627))

(check-sat (not b!670820) (not b!670816) (not start!60118) (not b!670815) (not b!670819) (not b!670818) (not b!670821) (not b!670823))
(check-sat)
