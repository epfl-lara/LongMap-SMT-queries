; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62644 () Bool)

(assert start!62644)

(declare-fun b!706299 () Bool)

(declare-fun res!470017 () Bool)

(declare-fun e!398018 () Bool)

(assert (=> b!706299 (=> (not res!470017) (not e!398018))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706299 (= res!470017 (validKeyInArray!0 k0!2824))))

(declare-fun b!706300 () Bool)

(declare-fun res!470015 () Bool)

(assert (=> b!706300 (=> (not res!470015) (not e!398018))))

(declare-datatypes ((List!13233 0))(
  ( (Nil!13230) (Cons!13229 (h!14277 (_ BitVec 64)) (t!19507 List!13233)) )
))
(declare-fun newAcc!49 () List!13233)

(declare-fun noDuplicate!1159 (List!13233) Bool)

(assert (=> b!706300 (= res!470015 (noDuplicate!1159 newAcc!49))))

(declare-fun b!706302 () Bool)

(declare-fun res!470021 () Bool)

(assert (=> b!706302 (=> (not res!470021) (not e!398018))))

(declare-fun contains!3885 (List!13233 (_ BitVec 64)) Bool)

(assert (=> b!706302 (= res!470021 (not (contains!3885 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706303 () Bool)

(declare-fun res!470014 () Bool)

(assert (=> b!706303 (=> (not res!470014) (not e!398018))))

(assert (=> b!706303 (= res!470014 (not (contains!3885 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706304 () Bool)

(declare-fun res!470019 () Bool)

(assert (=> b!706304 (=> (not res!470019) (not e!398018))))

(declare-fun acc!652 () List!13233)

(declare-fun -!317 (List!13233 (_ BitVec 64)) List!13233)

(assert (=> b!706304 (= res!470019 (= (-!317 newAcc!49 k0!2824) acc!652))))

(declare-fun b!706305 () Bool)

(declare-fun res!470016 () Bool)

(assert (=> b!706305 (=> (not res!470016) (not e!398018))))

(declare-datatypes ((array!40263 0))(
  ( (array!40264 (arr!19285 (Array (_ BitVec 32) (_ BitVec 64))) (size!19668 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40263)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706305 (= res!470016 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!706306 () Bool)

(declare-fun res!470022 () Bool)

(assert (=> b!706306 (=> (not res!470022) (not e!398018))))

(assert (=> b!706306 (= res!470022 (contains!3885 newAcc!49 k0!2824))))

(declare-fun b!706307 () Bool)

(assert (=> b!706307 (= e!398018 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19668 a!3591)) (bvsgt from!2969 (size!19668 a!3591))))))

(declare-fun b!706308 () Bool)

(declare-fun res!470013 () Bool)

(assert (=> b!706308 (=> (not res!470013) (not e!398018))))

(assert (=> b!706308 (= res!470013 (not (contains!3885 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706309 () Bool)

(declare-fun res!470020 () Bool)

(assert (=> b!706309 (=> (not res!470020) (not e!398018))))

(assert (=> b!706309 (= res!470020 (noDuplicate!1159 acc!652))))

(declare-fun b!706310 () Bool)

(declare-fun res!470023 () Bool)

(assert (=> b!706310 (=> (not res!470023) (not e!398018))))

(declare-fun arrayNoDuplicates!0 (array!40263 (_ BitVec 32) List!13233) Bool)

(assert (=> b!706310 (= res!470023 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun res!470010 () Bool)

(assert (=> start!62644 (=> (not res!470010) (not e!398018))))

(assert (=> start!62644 (= res!470010 (and (bvslt (size!19668 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19668 a!3591))))))

(assert (=> start!62644 e!398018))

(assert (=> start!62644 true))

(declare-fun array_inv!15144 (array!40263) Bool)

(assert (=> start!62644 (array_inv!15144 a!3591)))

(declare-fun b!706301 () Bool)

(declare-fun res!470018 () Bool)

(assert (=> b!706301 (=> (not res!470018) (not e!398018))))

(assert (=> b!706301 (= res!470018 (not (contains!3885 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706311 () Bool)

(declare-fun res!470011 () Bool)

(assert (=> b!706311 (=> (not res!470011) (not e!398018))))

(declare-fun subseq!353 (List!13233 List!13233) Bool)

(assert (=> b!706311 (= res!470011 (subseq!353 acc!652 newAcc!49))))

(declare-fun b!706312 () Bool)

(declare-fun res!470012 () Bool)

(assert (=> b!706312 (=> (not res!470012) (not e!398018))))

(assert (=> b!706312 (= res!470012 (not (contains!3885 acc!652 k0!2824)))))

(assert (= (and start!62644 res!470010) b!706309))

(assert (= (and b!706309 res!470020) b!706300))

(assert (= (and b!706300 res!470015) b!706301))

(assert (= (and b!706301 res!470018) b!706308))

(assert (= (and b!706308 res!470013) b!706305))

(assert (= (and b!706305 res!470016) b!706312))

(assert (= (and b!706312 res!470012) b!706299))

(assert (= (and b!706299 res!470017) b!706310))

(assert (= (and b!706310 res!470023) b!706311))

(assert (= (and b!706311 res!470011) b!706306))

(assert (= (and b!706306 res!470022) b!706304))

(assert (= (and b!706304 res!470019) b!706303))

(assert (= (and b!706303 res!470014) b!706302))

(assert (= (and b!706302 res!470021) b!706307))

(declare-fun m!664731 () Bool)

(assert (=> b!706300 m!664731))

(declare-fun m!664733 () Bool)

(assert (=> b!706301 m!664733))

(declare-fun m!664735 () Bool)

(assert (=> b!706306 m!664735))

(declare-fun m!664737 () Bool)

(assert (=> b!706299 m!664737))

(declare-fun m!664739 () Bool)

(assert (=> b!706304 m!664739))

(declare-fun m!664741 () Bool)

(assert (=> b!706310 m!664741))

(declare-fun m!664743 () Bool)

(assert (=> b!706302 m!664743))

(declare-fun m!664745 () Bool)

(assert (=> b!706309 m!664745))

(declare-fun m!664747 () Bool)

(assert (=> b!706303 m!664747))

(declare-fun m!664749 () Bool)

(assert (=> start!62644 m!664749))

(declare-fun m!664751 () Bool)

(assert (=> b!706305 m!664751))

(declare-fun m!664753 () Bool)

(assert (=> b!706312 m!664753))

(declare-fun m!664755 () Bool)

(assert (=> b!706311 m!664755))

(declare-fun m!664757 () Bool)

(assert (=> b!706308 m!664757))

(check-sat (not start!62644) (not b!706302) (not b!706304) (not b!706301) (not b!706306) (not b!706300) (not b!706299) (not b!706312) (not b!706310) (not b!706311) (not b!706308) (not b!706305) (not b!706303) (not b!706309))
(check-sat)
