; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59770 () Bool)

(assert start!59770)

(declare-fun b!660235 () Bool)

(declare-fun e!379399 () Bool)

(assert (=> b!660235 (= e!379399 false)))

(declare-fun lt!308761 () Bool)

(declare-datatypes ((array!38817 0))(
  ( (array!38818 (arr!18601 (Array (_ BitVec 32) (_ BitVec 64))) (size!18965 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38817)

(declare-datatypes ((List!12642 0))(
  ( (Nil!12639) (Cons!12638 (h!13683 (_ BitVec 64)) (t!18870 List!12642)) )
))
(declare-fun arrayNoDuplicates!0 (array!38817 (_ BitVec 32) List!12642) Bool)

(assert (=> b!660235 (= lt!308761 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12639))))

(declare-fun b!660236 () Bool)

(declare-fun res!428302 () Bool)

(assert (=> b!660236 (=> (not res!428302) (not e!379399))))

(declare-fun acc!681 () List!12642)

(declare-fun contains!3219 (List!12642 (_ BitVec 64)) Bool)

(assert (=> b!660236 (= res!428302 (not (contains!3219 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660237 () Bool)

(declare-fun res!428304 () Bool)

(assert (=> b!660237 (=> (not res!428304) (not e!379399))))

(assert (=> b!660237 (= res!428304 (not (contains!3219 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!428299 () Bool)

(assert (=> start!59770 (=> (not res!428299) (not e!379399))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59770 (= res!428299 (and (bvslt (size!18965 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18965 a!3626))))))

(assert (=> start!59770 e!379399))

(assert (=> start!59770 true))

(declare-fun array_inv!14397 (array!38817) Bool)

(assert (=> start!59770 (array_inv!14397 a!3626)))

(declare-fun b!660238 () Bool)

(declare-fun e!379400 () Bool)

(declare-fun e!379398 () Bool)

(assert (=> b!660238 (= e!379400 e!379398)))

(declare-fun res!428300 () Bool)

(assert (=> b!660238 (=> (not res!428300) (not e!379398))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660238 (= res!428300 (bvsle from!3004 i!1382))))

(declare-fun b!660239 () Bool)

(declare-fun res!428303 () Bool)

(assert (=> b!660239 (=> (not res!428303) (not e!379399))))

(assert (=> b!660239 (= res!428303 e!379400)))

(declare-fun res!428301 () Bool)

(assert (=> b!660239 (=> res!428301 e!379400)))

(declare-fun e!379401 () Bool)

(assert (=> b!660239 (= res!428301 e!379401)))

(declare-fun res!428306 () Bool)

(assert (=> b!660239 (=> (not res!428306) (not e!379401))))

(assert (=> b!660239 (= res!428306 (bvsgt from!3004 i!1382))))

(declare-fun b!660240 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!660240 (= e!379398 (not (contains!3219 acc!681 k0!2843)))))

(declare-fun b!660241 () Bool)

(assert (=> b!660241 (= e!379401 (contains!3219 acc!681 k0!2843))))

(declare-fun b!660242 () Bool)

(declare-fun res!428305 () Bool)

(assert (=> b!660242 (=> (not res!428305) (not e!379399))))

(declare-fun noDuplicate!466 (List!12642) Bool)

(assert (=> b!660242 (= res!428305 (noDuplicate!466 acc!681))))

(assert (= (and start!59770 res!428299) b!660242))

(assert (= (and b!660242 res!428305) b!660237))

(assert (= (and b!660237 res!428304) b!660236))

(assert (= (and b!660236 res!428302) b!660239))

(assert (= (and b!660239 res!428306) b!660241))

(assert (= (and b!660239 (not res!428301)) b!660238))

(assert (= (and b!660238 res!428300) b!660240))

(assert (= (and b!660239 res!428303) b!660235))

(declare-fun m!633017 () Bool)

(assert (=> b!660241 m!633017))

(declare-fun m!633019 () Bool)

(assert (=> b!660237 m!633019))

(declare-fun m!633021 () Bool)

(assert (=> b!660236 m!633021))

(declare-fun m!633023 () Bool)

(assert (=> b!660242 m!633023))

(declare-fun m!633025 () Bool)

(assert (=> b!660235 m!633025))

(declare-fun m!633027 () Bool)

(assert (=> start!59770 m!633027))

(assert (=> b!660240 m!633017))

(check-sat (not b!660235) (not b!660241) (not b!660237) (not start!59770) (not b!660240) (not b!660236) (not b!660242))
