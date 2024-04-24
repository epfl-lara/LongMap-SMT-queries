; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62680 () Bool)

(assert start!62680)

(declare-fun b!707018 () Bool)

(declare-fun res!470733 () Bool)

(declare-fun e!398127 () Bool)

(assert (=> b!707018 (=> (not res!470733) (not e!398127))))

(declare-datatypes ((array!40299 0))(
  ( (array!40300 (arr!19303 (Array (_ BitVec 32) (_ BitVec 64))) (size!19686 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40299)

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((List!13251 0))(
  ( (Nil!13248) (Cons!13247 (h!14295 (_ BitVec 64)) (t!19525 List!13251)) )
))
(declare-fun acc!652 () List!13251)

(declare-fun arrayNoDuplicates!0 (array!40299 (_ BitVec 32) List!13251) Bool)

(assert (=> b!707018 (= res!470733 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!707019 () Bool)

(declare-fun res!470738 () Bool)

(assert (=> b!707019 (=> (not res!470738) (not e!398127))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!707019 (= res!470738 (validKeyInArray!0 k0!2824))))

(declare-fun b!707020 () Bool)

(declare-fun res!470734 () Bool)

(assert (=> b!707020 (=> (not res!470734) (not e!398127))))

(declare-fun contains!3903 (List!13251 (_ BitVec 64)) Bool)

(assert (=> b!707020 (= res!470734 (not (contains!3903 acc!652 k0!2824)))))

(declare-fun b!707021 () Bool)

(declare-fun res!470737 () Bool)

(assert (=> b!707021 (=> (not res!470737) (not e!398127))))

(declare-fun newAcc!49 () List!13251)

(assert (=> b!707021 (= res!470737 (not (contains!3903 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707022 () Bool)

(declare-fun res!470728 () Bool)

(assert (=> b!707022 (=> (not res!470728) (not e!398127))))

(declare-fun noDuplicate!1177 (List!13251) Bool)

(assert (=> b!707022 (= res!470728 (noDuplicate!1177 acc!652))))

(declare-fun b!707023 () Bool)

(declare-fun res!470730 () Bool)

(assert (=> b!707023 (=> (not res!470730) (not e!398127))))

(assert (=> b!707023 (= res!470730 (contains!3903 newAcc!49 k0!2824))))

(declare-fun b!707024 () Bool)

(declare-fun res!470729 () Bool)

(assert (=> b!707024 (=> (not res!470729) (not e!398127))))

(assert (=> b!707024 (= res!470729 (noDuplicate!1177 newAcc!49))))

(declare-fun b!707025 () Bool)

(declare-fun res!470740 () Bool)

(assert (=> b!707025 (=> (not res!470740) (not e!398127))))

(declare-fun arrayContainsKey!0 (array!40299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!707025 (= res!470740 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!707026 () Bool)

(declare-fun res!470739 () Bool)

(assert (=> b!707026 (=> (not res!470739) (not e!398127))))

(assert (=> b!707026 (= res!470739 (not (contains!3903 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707027 () Bool)

(declare-fun res!470735 () Bool)

(assert (=> b!707027 (=> (not res!470735) (not e!398127))))

(declare-fun -!335 (List!13251 (_ BitVec 64)) List!13251)

(assert (=> b!707027 (= res!470735 (= (-!335 newAcc!49 k0!2824) acc!652))))

(declare-fun res!470732 () Bool)

(assert (=> start!62680 (=> (not res!470732) (not e!398127))))

(assert (=> start!62680 (= res!470732 (and (bvslt (size!19686 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19686 a!3591))))))

(assert (=> start!62680 e!398127))

(assert (=> start!62680 true))

(declare-fun array_inv!15162 (array!40299) Bool)

(assert (=> start!62680 (array_inv!15162 a!3591)))

(declare-fun b!707017 () Bool)

(assert (=> b!707017 (= e!398127 false)))

(declare-fun lt!318069 () Bool)

(assert (=> b!707017 (= lt!318069 (contains!3903 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707028 () Bool)

(declare-fun res!470731 () Bool)

(assert (=> b!707028 (=> (not res!470731) (not e!398127))))

(assert (=> b!707028 (= res!470731 (not (contains!3903 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707029 () Bool)

(declare-fun res!470736 () Bool)

(assert (=> b!707029 (=> (not res!470736) (not e!398127))))

(declare-fun subseq!371 (List!13251 List!13251) Bool)

(assert (=> b!707029 (= res!470736 (subseq!371 acc!652 newAcc!49))))

(assert (= (and start!62680 res!470732) b!707022))

(assert (= (and b!707022 res!470728) b!707024))

(assert (= (and b!707024 res!470729) b!707028))

(assert (= (and b!707028 res!470731) b!707026))

(assert (= (and b!707026 res!470739) b!707025))

(assert (= (and b!707025 res!470740) b!707020))

(assert (= (and b!707020 res!470734) b!707019))

(assert (= (and b!707019 res!470738) b!707018))

(assert (= (and b!707018 res!470733) b!707029))

(assert (= (and b!707029 res!470736) b!707023))

(assert (= (and b!707023 res!470730) b!707027))

(assert (= (and b!707027 res!470735) b!707021))

(assert (= (and b!707021 res!470737) b!707017))

(declare-fun m!665235 () Bool)

(assert (=> b!707021 m!665235))

(declare-fun m!665237 () Bool)

(assert (=> b!707023 m!665237))

(declare-fun m!665239 () Bool)

(assert (=> b!707024 m!665239))

(declare-fun m!665241 () Bool)

(assert (=> b!707022 m!665241))

(declare-fun m!665243 () Bool)

(assert (=> b!707025 m!665243))

(declare-fun m!665245 () Bool)

(assert (=> b!707026 m!665245))

(declare-fun m!665247 () Bool)

(assert (=> b!707019 m!665247))

(declare-fun m!665249 () Bool)

(assert (=> start!62680 m!665249))

(declare-fun m!665251 () Bool)

(assert (=> b!707017 m!665251))

(declare-fun m!665253 () Bool)

(assert (=> b!707018 m!665253))

(declare-fun m!665255 () Bool)

(assert (=> b!707027 m!665255))

(declare-fun m!665257 () Bool)

(assert (=> b!707028 m!665257))

(declare-fun m!665259 () Bool)

(assert (=> b!707020 m!665259))

(declare-fun m!665261 () Bool)

(assert (=> b!707029 m!665261))

(check-sat (not b!707019) (not b!707027) (not b!707025) (not b!707017) (not b!707024) (not b!707018) (not start!62680) (not b!707021) (not b!707020) (not b!707029) (not b!707028) (not b!707022) (not b!707026) (not b!707023))
(check-sat)
