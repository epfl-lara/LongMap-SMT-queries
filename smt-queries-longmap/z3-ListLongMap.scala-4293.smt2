; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59774 () Bool)

(assert start!59774)

(declare-fun b!660148 () Bool)

(declare-fun res!428374 () Bool)

(declare-fun e!379330 () Bool)

(assert (=> b!660148 (=> (not res!428374) (not e!379330))))

(declare-fun e!379327 () Bool)

(assert (=> b!660148 (= res!428374 e!379327)))

(declare-fun res!428379 () Bool)

(assert (=> b!660148 (=> res!428379 e!379327)))

(declare-fun e!379331 () Bool)

(assert (=> b!660148 (= res!428379 e!379331)))

(declare-fun res!428376 () Bool)

(assert (=> b!660148 (=> (not res!428376) (not e!379331))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660148 (= res!428376 (bvsgt from!3004 i!1382))))

(declare-fun b!660150 () Bool)

(declare-datatypes ((List!12688 0))(
  ( (Nil!12685) (Cons!12684 (h!13729 (_ BitVec 64)) (t!18907 List!12688)) )
))
(declare-fun acc!681 () List!12688)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3210 (List!12688 (_ BitVec 64)) Bool)

(assert (=> b!660150 (= e!379331 (contains!3210 acc!681 k0!2843))))

(declare-fun b!660151 () Bool)

(declare-fun e!379329 () Bool)

(assert (=> b!660151 (= e!379327 e!379329)))

(declare-fun res!428377 () Bool)

(assert (=> b!660151 (=> (not res!428377) (not e!379329))))

(assert (=> b!660151 (= res!428377 (bvsle from!3004 i!1382))))

(declare-fun b!660152 () Bool)

(declare-fun res!428378 () Bool)

(assert (=> b!660152 (=> (not res!428378) (not e!379330))))

(declare-datatypes ((array!38832 0))(
  ( (array!38833 (arr!18608 (Array (_ BitVec 32) (_ BitVec 64))) (size!18973 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38832)

(assert (=> b!660152 (= res!428378 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!18973 a!3626))))))

(declare-fun b!660153 () Bool)

(declare-fun res!428380 () Bool)

(assert (=> b!660153 (=> (not res!428380) (not e!379330))))

(assert (=> b!660153 (= res!428380 (not (contains!3210 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660154 () Bool)

(declare-fun res!428375 () Bool)

(assert (=> b!660154 (=> (not res!428375) (not e!379330))))

(declare-fun arrayNoDuplicates!0 (array!38832 (_ BitVec 32) List!12688) Bool)

(assert (=> b!660154 (= res!428375 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!660155 () Bool)

(declare-fun res!428373 () Bool)

(assert (=> b!660155 (=> (not res!428373) (not e!379330))))

(declare-fun noDuplicate!479 (List!12688) Bool)

(assert (=> b!660155 (= res!428373 (noDuplicate!479 acc!681))))

(declare-fun res!428381 () Bool)

(assert (=> start!59774 (=> (not res!428381) (not e!379330))))

(assert (=> start!59774 (= res!428381 (and (bvslt (size!18973 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18973 a!3626))))))

(assert (=> start!59774 e!379330))

(assert (=> start!59774 true))

(declare-fun array_inv!14491 (array!38832) Bool)

(assert (=> start!59774 (array_inv!14491 a!3626)))

(declare-fun b!660149 () Bool)

(assert (=> b!660149 (= e!379330 (bvsge #b00000000000000000000000000000000 (size!18973 a!3626)))))

(declare-fun b!660156 () Bool)

(declare-fun res!428382 () Bool)

(assert (=> b!660156 (=> (not res!428382) (not e!379330))))

(assert (=> b!660156 (= res!428382 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12685))))

(declare-fun b!660157 () Bool)

(declare-fun res!428372 () Bool)

(assert (=> b!660157 (=> (not res!428372) (not e!379330))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!660157 (= res!428372 (validKeyInArray!0 k0!2843))))

(declare-fun b!660158 () Bool)

(assert (=> b!660158 (= e!379329 (not (contains!3210 acc!681 k0!2843)))))

(declare-fun b!660159 () Bool)

(declare-fun res!428383 () Bool)

(assert (=> b!660159 (=> (not res!428383) (not e!379330))))

(assert (=> b!660159 (= res!428383 (not (contains!3210 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59774 res!428381) b!660155))

(assert (= (and b!660155 res!428373) b!660159))

(assert (= (and b!660159 res!428383) b!660153))

(assert (= (and b!660153 res!428380) b!660148))

(assert (= (and b!660148 res!428376) b!660150))

(assert (= (and b!660148 (not res!428379)) b!660151))

(assert (= (and b!660151 res!428377) b!660158))

(assert (= (and b!660148 res!428374) b!660156))

(assert (= (and b!660156 res!428382) b!660154))

(assert (= (and b!660154 res!428375) b!660152))

(assert (= (and b!660152 res!428378) b!660157))

(assert (= (and b!660157 res!428372) b!660149))

(declare-fun m!632337 () Bool)

(assert (=> b!660159 m!632337))

(declare-fun m!632339 () Bool)

(assert (=> start!59774 m!632339))

(declare-fun m!632341 () Bool)

(assert (=> b!660155 m!632341))

(declare-fun m!632343 () Bool)

(assert (=> b!660153 m!632343))

(declare-fun m!632345 () Bool)

(assert (=> b!660156 m!632345))

(declare-fun m!632347 () Bool)

(assert (=> b!660150 m!632347))

(assert (=> b!660158 m!632347))

(declare-fun m!632349 () Bool)

(assert (=> b!660154 m!632349))

(declare-fun m!632351 () Bool)

(assert (=> b!660157 m!632351))

(check-sat (not b!660159) (not b!660156) (not start!59774) (not b!660154) (not b!660158) (not b!660155) (not b!660153) (not b!660150) (not b!660157))
(check-sat)
