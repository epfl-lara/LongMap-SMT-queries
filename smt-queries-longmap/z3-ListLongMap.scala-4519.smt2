; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62638 () Bool)

(assert start!62638)

(declare-fun b!706138 () Bool)

(declare-fun res!469856 () Bool)

(declare-fun e!398000 () Bool)

(assert (=> b!706138 (=> (not res!469856) (not e!398000))))

(declare-datatypes ((List!13230 0))(
  ( (Nil!13227) (Cons!13226 (h!14274 (_ BitVec 64)) (t!19504 List!13230)) )
))
(declare-fun acc!652 () List!13230)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3882 (List!13230 (_ BitVec 64)) Bool)

(assert (=> b!706138 (= res!469856 (not (contains!3882 acc!652 k0!2824)))))

(declare-fun b!706139 () Bool)

(declare-fun res!469861 () Bool)

(assert (=> b!706139 (=> (not res!469861) (not e!398000))))

(declare-fun newAcc!49 () List!13230)

(declare-fun subseq!350 (List!13230 List!13230) Bool)

(assert (=> b!706139 (= res!469861 (subseq!350 acc!652 newAcc!49))))

(declare-fun b!706140 () Bool)

(declare-fun res!469863 () Bool)

(assert (=> b!706140 (=> (not res!469863) (not e!398000))))

(declare-fun noDuplicate!1156 (List!13230) Bool)

(assert (=> b!706140 (= res!469863 (noDuplicate!1156 newAcc!49))))

(declare-fun b!706141 () Bool)

(declare-fun res!469865 () Bool)

(assert (=> b!706141 (=> (not res!469865) (not e!398000))))

(declare-datatypes ((array!40257 0))(
  ( (array!40258 (arr!19282 (Array (_ BitVec 32) (_ BitVec 64))) (size!19665 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40257)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706141 (= res!469865 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!706142 () Bool)

(declare-fun res!469860 () Bool)

(assert (=> b!706142 (=> (not res!469860) (not e!398000))))

(assert (=> b!706142 (= res!469860 (not (contains!3882 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706143 () Bool)

(declare-fun res!469850 () Bool)

(assert (=> b!706143 (=> (not res!469850) (not e!398000))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706143 (= res!469850 (not (validKeyInArray!0 (select (arr!19282 a!3591) from!2969))))))

(declare-fun b!706144 () Bool)

(declare-fun res!469854 () Bool)

(assert (=> b!706144 (=> (not res!469854) (not e!398000))))

(assert (=> b!706144 (= res!469854 (noDuplicate!1156 acc!652))))

(declare-fun b!706145 () Bool)

(declare-fun res!469857 () Bool)

(assert (=> b!706145 (=> (not res!469857) (not e!398000))))

(assert (=> b!706145 (= res!469857 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!706146 () Bool)

(declare-fun res!469851 () Bool)

(assert (=> b!706146 (=> (not res!469851) (not e!398000))))

(assert (=> b!706146 (= res!469851 (validKeyInArray!0 k0!2824))))

(declare-fun b!706148 () Bool)

(declare-fun res!469864 () Bool)

(assert (=> b!706148 (=> (not res!469864) (not e!398000))))

(assert (=> b!706148 (= res!469864 (not (contains!3882 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706149 () Bool)

(declare-fun res!469867 () Bool)

(assert (=> b!706149 (=> (not res!469867) (not e!398000))))

(declare-fun -!314 (List!13230 (_ BitVec 64)) List!13230)

(assert (=> b!706149 (= res!469867 (= (-!314 newAcc!49 k0!2824) acc!652))))

(declare-fun b!706150 () Bool)

(declare-fun res!469852 () Bool)

(assert (=> b!706150 (=> (not res!469852) (not e!398000))))

(declare-fun arrayNoDuplicates!0 (array!40257 (_ BitVec 32) List!13230) Bool)

(assert (=> b!706150 (= res!469852 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706151 () Bool)

(declare-fun res!469855 () Bool)

(assert (=> b!706151 (=> (not res!469855) (not e!398000))))

(assert (=> b!706151 (= res!469855 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19665 a!3591)))))

(declare-fun b!706152 () Bool)

(declare-fun res!469866 () Bool)

(assert (=> b!706152 (=> (not res!469866) (not e!398000))))

(assert (=> b!706152 (= res!469866 (contains!3882 newAcc!49 k0!2824))))

(declare-fun b!706153 () Bool)

(declare-fun res!469849 () Bool)

(assert (=> b!706153 (=> (not res!469849) (not e!398000))))

(assert (=> b!706153 (= res!469849 (not (contains!3882 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706154 () Bool)

(declare-fun res!469858 () Bool)

(assert (=> b!706154 (=> (not res!469858) (not e!398000))))

(assert (=> b!706154 (= res!469858 (not (contains!3882 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!469859 () Bool)

(assert (=> start!62638 (=> (not res!469859) (not e!398000))))

(assert (=> start!62638 (= res!469859 (and (bvslt (size!19665 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19665 a!3591))))))

(assert (=> start!62638 e!398000))

(assert (=> start!62638 true))

(declare-fun array_inv!15141 (array!40257) Bool)

(assert (=> start!62638 (array_inv!15141 a!3591)))

(declare-fun b!706147 () Bool)

(declare-fun res!469862 () Bool)

(assert (=> b!706147 (=> (not res!469862) (not e!398000))))

(assert (=> b!706147 (= res!469862 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!706155 () Bool)

(declare-fun res!469853 () Bool)

(assert (=> b!706155 (=> (not res!469853) (not e!398000))))

(assert (=> b!706155 (= res!469853 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!706156 () Bool)

(assert (=> b!706156 (= e!398000 (not true))))

(assert (=> b!706156 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49)))

(declare-datatypes ((Unit!24603 0))(
  ( (Unit!24604) )
))
(declare-fun lt!318024 () Unit!24603)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40257 (_ BitVec 64) (_ BitVec 32) List!13230 List!13230) Unit!24603)

(assert (=> b!706156 (= lt!318024 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49))))

(assert (= (and start!62638 res!469859) b!706144))

(assert (= (and b!706144 res!469854) b!706140))

(assert (= (and b!706140 res!469863) b!706142))

(assert (= (and b!706142 res!469860) b!706154))

(assert (= (and b!706154 res!469858) b!706141))

(assert (= (and b!706141 res!469865) b!706138))

(assert (= (and b!706138 res!469856) b!706146))

(assert (= (and b!706146 res!469851) b!706150))

(assert (= (and b!706150 res!469852) b!706139))

(assert (= (and b!706139 res!469861) b!706152))

(assert (= (and b!706152 res!469866) b!706149))

(assert (= (and b!706149 res!469867) b!706153))

(assert (= (and b!706153 res!469849) b!706148))

(assert (= (and b!706148 res!469864) b!706151))

(assert (= (and b!706151 res!469855) b!706143))

(assert (= (and b!706143 res!469850) b!706147))

(assert (= (and b!706147 res!469862) b!706145))

(assert (= (and b!706145 res!469857) b!706155))

(assert (= (and b!706155 res!469853) b!706156))

(declare-fun m!664611 () Bool)

(assert (=> b!706152 m!664611))

(declare-fun m!664613 () Bool)

(assert (=> b!706142 m!664613))

(declare-fun m!664615 () Bool)

(assert (=> b!706146 m!664615))

(declare-fun m!664617 () Bool)

(assert (=> b!706140 m!664617))

(declare-fun m!664619 () Bool)

(assert (=> b!706139 m!664619))

(declare-fun m!664621 () Bool)

(assert (=> b!706149 m!664621))

(declare-fun m!664623 () Bool)

(assert (=> b!706145 m!664623))

(declare-fun m!664625 () Bool)

(assert (=> b!706150 m!664625))

(declare-fun m!664627 () Bool)

(assert (=> b!706143 m!664627))

(assert (=> b!706143 m!664627))

(declare-fun m!664629 () Bool)

(assert (=> b!706143 m!664629))

(declare-fun m!664631 () Bool)

(assert (=> b!706138 m!664631))

(declare-fun m!664633 () Bool)

(assert (=> start!62638 m!664633))

(declare-fun m!664635 () Bool)

(assert (=> b!706156 m!664635))

(declare-fun m!664637 () Bool)

(assert (=> b!706156 m!664637))

(declare-fun m!664639 () Bool)

(assert (=> b!706144 m!664639))

(declare-fun m!664641 () Bool)

(assert (=> b!706153 m!664641))

(declare-fun m!664643 () Bool)

(assert (=> b!706141 m!664643))

(declare-fun m!664645 () Bool)

(assert (=> b!706154 m!664645))

(declare-fun m!664647 () Bool)

(assert (=> b!706148 m!664647))

(declare-fun m!664649 () Bool)

(assert (=> b!706155 m!664649))

(check-sat (not b!706154) (not b!706153) (not b!706143) (not b!706141) (not b!706144) (not b!706149) (not start!62638) (not b!706139) (not b!706155) (not b!706148) (not b!706138) (not b!706152) (not b!706142) (not b!706140) (not b!706156) (not b!706150) (not b!706145) (not b!706146))
(check-sat)
