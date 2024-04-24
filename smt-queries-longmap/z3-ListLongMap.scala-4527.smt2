; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62686 () Bool)

(assert start!62686)

(declare-fun b!707135 () Bool)

(declare-fun res!470854 () Bool)

(declare-fun e!398145 () Bool)

(assert (=> b!707135 (=> (not res!470854) (not e!398145))))

(declare-datatypes ((List!13254 0))(
  ( (Nil!13251) (Cons!13250 (h!14298 (_ BitVec 64)) (t!19528 List!13254)) )
))
(declare-fun acc!652 () List!13254)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3906 (List!13254 (_ BitVec 64)) Bool)

(assert (=> b!707135 (= res!470854 (not (contains!3906 acc!652 k0!2824)))))

(declare-fun b!707136 () Bool)

(declare-fun res!470851 () Bool)

(assert (=> b!707136 (=> (not res!470851) (not e!398145))))

(declare-fun newAcc!49 () List!13254)

(assert (=> b!707136 (= res!470851 (contains!3906 newAcc!49 k0!2824))))

(declare-fun b!707137 () Bool)

(declare-fun res!470850 () Bool)

(assert (=> b!707137 (=> (not res!470850) (not e!398145))))

(declare-fun -!338 (List!13254 (_ BitVec 64)) List!13254)

(assert (=> b!707137 (= res!470850 (= (-!338 newAcc!49 k0!2824) acc!652))))

(declare-fun b!707138 () Bool)

(declare-fun res!470845 () Bool)

(assert (=> b!707138 (=> (not res!470845) (not e!398145))))

(declare-fun noDuplicate!1180 (List!13254) Bool)

(assert (=> b!707138 (= res!470845 (noDuplicate!1180 newAcc!49))))

(declare-fun b!707139 () Bool)

(declare-fun res!470847 () Bool)

(assert (=> b!707139 (=> (not res!470847) (not e!398145))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!707139 (= res!470847 (validKeyInArray!0 k0!2824))))

(declare-fun b!707140 () Bool)

(declare-fun res!470857 () Bool)

(assert (=> b!707140 (=> (not res!470857) (not e!398145))))

(assert (=> b!707140 (= res!470857 (not (contains!3906 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707141 () Bool)

(declare-fun res!470852 () Bool)

(assert (=> b!707141 (=> (not res!470852) (not e!398145))))

(assert (=> b!707141 (= res!470852 (not (contains!3906 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707142 () Bool)

(declare-fun res!470846 () Bool)

(assert (=> b!707142 (=> (not res!470846) (not e!398145))))

(assert (=> b!707142 (= res!470846 (noDuplicate!1180 acc!652))))

(declare-fun b!707134 () Bool)

(assert (=> b!707134 (= e!398145 false)))

(declare-fun lt!318078 () Bool)

(assert (=> b!707134 (= lt!318078 (contains!3906 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!470848 () Bool)

(assert (=> start!62686 (=> (not res!470848) (not e!398145))))

(declare-datatypes ((array!40305 0))(
  ( (array!40306 (arr!19306 (Array (_ BitVec 32) (_ BitVec 64))) (size!19689 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40305)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62686 (= res!470848 (and (bvslt (size!19689 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19689 a!3591))))))

(assert (=> start!62686 e!398145))

(assert (=> start!62686 true))

(declare-fun array_inv!15165 (array!40305) Bool)

(assert (=> start!62686 (array_inv!15165 a!3591)))

(declare-fun b!707143 () Bool)

(declare-fun res!470849 () Bool)

(assert (=> b!707143 (=> (not res!470849) (not e!398145))))

(assert (=> b!707143 (= res!470849 (not (contains!3906 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707144 () Bool)

(declare-fun res!470856 () Bool)

(assert (=> b!707144 (=> (not res!470856) (not e!398145))))

(declare-fun subseq!374 (List!13254 List!13254) Bool)

(assert (=> b!707144 (= res!470856 (subseq!374 acc!652 newAcc!49))))

(declare-fun b!707145 () Bool)

(declare-fun res!470853 () Bool)

(assert (=> b!707145 (=> (not res!470853) (not e!398145))))

(declare-fun arrayContainsKey!0 (array!40305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!707145 (= res!470853 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!707146 () Bool)

(declare-fun res!470855 () Bool)

(assert (=> b!707146 (=> (not res!470855) (not e!398145))))

(declare-fun arrayNoDuplicates!0 (array!40305 (_ BitVec 32) List!13254) Bool)

(assert (=> b!707146 (= res!470855 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(assert (= (and start!62686 res!470848) b!707142))

(assert (= (and b!707142 res!470846) b!707138))

(assert (= (and b!707138 res!470845) b!707141))

(assert (= (and b!707141 res!470852) b!707140))

(assert (= (and b!707140 res!470857) b!707145))

(assert (= (and b!707145 res!470853) b!707135))

(assert (= (and b!707135 res!470854) b!707139))

(assert (= (and b!707139 res!470847) b!707146))

(assert (= (and b!707146 res!470855) b!707144))

(assert (= (and b!707144 res!470856) b!707136))

(assert (= (and b!707136 res!470851) b!707137))

(assert (= (and b!707137 res!470850) b!707143))

(assert (= (and b!707143 res!470849) b!707134))

(declare-fun m!665319 () Bool)

(assert (=> b!707142 m!665319))

(declare-fun m!665321 () Bool)

(assert (=> b!707136 m!665321))

(declare-fun m!665323 () Bool)

(assert (=> b!707140 m!665323))

(declare-fun m!665325 () Bool)

(assert (=> b!707141 m!665325))

(declare-fun m!665327 () Bool)

(assert (=> start!62686 m!665327))

(declare-fun m!665329 () Bool)

(assert (=> b!707137 m!665329))

(declare-fun m!665331 () Bool)

(assert (=> b!707143 m!665331))

(declare-fun m!665333 () Bool)

(assert (=> b!707146 m!665333))

(declare-fun m!665335 () Bool)

(assert (=> b!707134 m!665335))

(declare-fun m!665337 () Bool)

(assert (=> b!707138 m!665337))

(declare-fun m!665339 () Bool)

(assert (=> b!707135 m!665339))

(declare-fun m!665341 () Bool)

(assert (=> b!707144 m!665341))

(declare-fun m!665343 () Bool)

(assert (=> b!707145 m!665343))

(declare-fun m!665345 () Bool)

(assert (=> b!707139 m!665345))

(check-sat (not b!707139) (not b!707140) (not b!707138) (not start!62686) (not b!707142) (not b!707141) (not b!707134) (not b!707145) (not b!707135) (not b!707143) (not b!707136) (not b!707144) (not b!707146) (not b!707137))
(check-sat)
