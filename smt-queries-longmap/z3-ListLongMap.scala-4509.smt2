; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62510 () Bool)

(assert start!62510)

(declare-fun b!704008 () Bool)

(declare-fun res!467989 () Bool)

(declare-fun e!397523 () Bool)

(assert (=> b!704008 (=> (not res!467989) (not e!397523))))

(declare-datatypes ((List!13336 0))(
  ( (Nil!13333) (Cons!13332 (h!14377 (_ BitVec 64)) (t!19609 List!13336)) )
))
(declare-fun newAcc!49 () List!13336)

(declare-fun noDuplicate!1127 (List!13336) Bool)

(assert (=> b!704008 (= res!467989 (noDuplicate!1127 newAcc!49))))

(declare-fun b!704010 () Bool)

(declare-fun res!467988 () Bool)

(assert (=> b!704010 (=> (not res!467988) (not e!397523))))

(declare-datatypes ((array!40200 0))(
  ( (array!40201 (arr!19256 (Array (_ BitVec 32) (_ BitVec 64))) (size!19638 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40200)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40200 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!704010 (= res!467988 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!704011 () Bool)

(declare-fun res!467981 () Bool)

(assert (=> b!704011 (=> (not res!467981) (not e!397523))))

(declare-fun acc!652 () List!13336)

(declare-fun -!285 (List!13336 (_ BitVec 64)) List!13336)

(assert (=> b!704011 (= res!467981 (= (-!285 newAcc!49 k0!2824) acc!652))))

(declare-fun b!704012 () Bool)

(assert (=> b!704012 (= e!397523 false)))

(declare-fun lt!317583 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40200 (_ BitVec 32) List!13336) Bool)

(assert (=> b!704012 (= lt!317583 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!704013 () Bool)

(declare-fun res!467980 () Bool)

(assert (=> b!704013 (=> (not res!467980) (not e!397523))))

(declare-fun contains!3858 (List!13336 (_ BitVec 64)) Bool)

(assert (=> b!704013 (= res!467980 (contains!3858 newAcc!49 k0!2824))))

(declare-fun b!704014 () Bool)

(declare-fun res!467983 () Bool)

(assert (=> b!704014 (=> (not res!467983) (not e!397523))))

(assert (=> b!704014 (= res!467983 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19638 a!3591)))))

(declare-fun b!704015 () Bool)

(declare-fun res!467991 () Bool)

(assert (=> b!704015 (=> (not res!467991) (not e!397523))))

(assert (=> b!704015 (= res!467991 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!704016 () Bool)

(declare-fun res!467986 () Bool)

(assert (=> b!704016 (=> (not res!467986) (not e!397523))))

(assert (=> b!704016 (= res!467986 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!704017 () Bool)

(declare-fun res!467990 () Bool)

(assert (=> b!704017 (=> (not res!467990) (not e!397523))))

(assert (=> b!704017 (= res!467990 (not (contains!3858 acc!652 k0!2824)))))

(declare-fun b!704018 () Bool)

(declare-fun res!467982 () Bool)

(assert (=> b!704018 (=> (not res!467982) (not e!397523))))

(assert (=> b!704018 (= res!467982 (not (contains!3858 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704019 () Bool)

(declare-fun res!467984 () Bool)

(assert (=> b!704019 (=> (not res!467984) (not e!397523))))

(assert (=> b!704019 (= res!467984 (not (contains!3858 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!467992 () Bool)

(assert (=> start!62510 (=> (not res!467992) (not e!397523))))

(assert (=> start!62510 (= res!467992 (and (bvslt (size!19638 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19638 a!3591))))))

(assert (=> start!62510 e!397523))

(assert (=> start!62510 true))

(declare-fun array_inv!15139 (array!40200) Bool)

(assert (=> start!62510 (array_inv!15139 a!3591)))

(declare-fun b!704009 () Bool)

(declare-fun res!467985 () Bool)

(assert (=> b!704009 (=> (not res!467985) (not e!397523))))

(assert (=> b!704009 (= res!467985 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!704020 () Bool)

(declare-fun res!467995 () Bool)

(assert (=> b!704020 (=> (not res!467995) (not e!397523))))

(declare-fun subseq!320 (List!13336 List!13336) Bool)

(assert (=> b!704020 (= res!467995 (subseq!320 acc!652 newAcc!49))))

(declare-fun b!704021 () Bool)

(declare-fun res!467993 () Bool)

(assert (=> b!704021 (=> (not res!467993) (not e!397523))))

(assert (=> b!704021 (= res!467993 (noDuplicate!1127 acc!652))))

(declare-fun b!704022 () Bool)

(declare-fun res!467987 () Bool)

(assert (=> b!704022 (=> (not res!467987) (not e!397523))))

(assert (=> b!704022 (= res!467987 (not (contains!3858 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704023 () Bool)

(declare-fun res!467979 () Bool)

(assert (=> b!704023 (=> (not res!467979) (not e!397523))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!704023 (= res!467979 (validKeyInArray!0 k0!2824))))

(declare-fun b!704024 () Bool)

(declare-fun res!467978 () Bool)

(assert (=> b!704024 (=> (not res!467978) (not e!397523))))

(assert (=> b!704024 (= res!467978 (not (contains!3858 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704025 () Bool)

(declare-fun res!467994 () Bool)

(assert (=> b!704025 (=> (not res!467994) (not e!397523))))

(assert (=> b!704025 (= res!467994 (not (validKeyInArray!0 (select (arr!19256 a!3591) from!2969))))))

(assert (= (and start!62510 res!467992) b!704021))

(assert (= (and b!704021 res!467993) b!704008))

(assert (= (and b!704008 res!467989) b!704024))

(assert (= (and b!704024 res!467978) b!704019))

(assert (= (and b!704019 res!467984) b!704009))

(assert (= (and b!704009 res!467985) b!704017))

(assert (= (and b!704017 res!467990) b!704023))

(assert (= (and b!704023 res!467979) b!704015))

(assert (= (and b!704015 res!467991) b!704020))

(assert (= (and b!704020 res!467995) b!704013))

(assert (= (and b!704013 res!467980) b!704011))

(assert (= (and b!704011 res!467981) b!704018))

(assert (= (and b!704018 res!467982) b!704022))

(assert (= (and b!704022 res!467987) b!704014))

(assert (= (and b!704014 res!467983) b!704025))

(assert (= (and b!704025 res!467994) b!704016))

(assert (= (and b!704016 res!467986) b!704010))

(assert (= (and b!704010 res!467988) b!704012))

(declare-fun m!662079 () Bool)

(assert (=> b!704011 m!662079))

(declare-fun m!662081 () Bool)

(assert (=> start!62510 m!662081))

(declare-fun m!662083 () Bool)

(assert (=> b!704012 m!662083))

(declare-fun m!662085 () Bool)

(assert (=> b!704010 m!662085))

(declare-fun m!662087 () Bool)

(assert (=> b!704023 m!662087))

(declare-fun m!662089 () Bool)

(assert (=> b!704018 m!662089))

(declare-fun m!662091 () Bool)

(assert (=> b!704013 m!662091))

(declare-fun m!662093 () Bool)

(assert (=> b!704021 m!662093))

(declare-fun m!662095 () Bool)

(assert (=> b!704009 m!662095))

(declare-fun m!662097 () Bool)

(assert (=> b!704008 m!662097))

(declare-fun m!662099 () Bool)

(assert (=> b!704022 m!662099))

(declare-fun m!662101 () Bool)

(assert (=> b!704015 m!662101))

(declare-fun m!662103 () Bool)

(assert (=> b!704024 m!662103))

(declare-fun m!662105 () Bool)

(assert (=> b!704025 m!662105))

(assert (=> b!704025 m!662105))

(declare-fun m!662107 () Bool)

(assert (=> b!704025 m!662107))

(declare-fun m!662109 () Bool)

(assert (=> b!704017 m!662109))

(declare-fun m!662111 () Bool)

(assert (=> b!704020 m!662111))

(declare-fun m!662113 () Bool)

(assert (=> b!704019 m!662113))

(check-sat (not start!62510) (not b!704008) (not b!704015) (not b!704019) (not b!704012) (not b!704025) (not b!704010) (not b!704018) (not b!704017) (not b!704020) (not b!704022) (not b!704011) (not b!704023) (not b!704009) (not b!704013) (not b!704024) (not b!704021))
(check-sat)
