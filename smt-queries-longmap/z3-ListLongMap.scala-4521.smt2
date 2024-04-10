; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62596 () Bool)

(assert start!62596)

(declare-fun res!470082 () Bool)

(declare-fun e!397927 () Bool)

(assert (=> start!62596 (=> (not res!470082) (not e!397927))))

(declare-datatypes ((array!40275 0))(
  ( (array!40276 (arr!19294 (Array (_ BitVec 32) (_ BitVec 64))) (size!19679 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40275)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62596 (= res!470082 (and (bvslt (size!19679 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19679 a!3591))))))

(assert (=> start!62596 e!397927))

(assert (=> start!62596 true))

(declare-fun array_inv!15090 (array!40275) Bool)

(assert (=> start!62596 (array_inv!15090 a!3591)))

(declare-fun b!706269 () Bool)

(declare-fun res!470081 () Bool)

(assert (=> b!706269 (=> (not res!470081) (not e!397927))))

(declare-datatypes ((List!13335 0))(
  ( (Nil!13332) (Cons!13331 (h!14376 (_ BitVec 64)) (t!19617 List!13335)) )
))
(declare-fun newAcc!49 () List!13335)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun acc!652 () List!13335)

(declare-fun -!322 (List!13335 (_ BitVec 64)) List!13335)

(assert (=> b!706269 (= res!470081 (= (-!322 newAcc!49 k0!2824) acc!652))))

(declare-fun b!706270 () Bool)

(declare-fun res!470085 () Bool)

(assert (=> b!706270 (=> (not res!470085) (not e!397927))))

(declare-fun contains!3912 (List!13335 (_ BitVec 64)) Bool)

(assert (=> b!706270 (= res!470085 (not (contains!3912 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706271 () Bool)

(declare-fun res!470088 () Bool)

(assert (=> b!706271 (=> (not res!470088) (not e!397927))))

(declare-fun subseq!357 (List!13335 List!13335) Bool)

(assert (=> b!706271 (= res!470088 (subseq!357 acc!652 newAcc!49))))

(declare-fun b!706272 () Bool)

(declare-fun res!470086 () Bool)

(assert (=> b!706272 (=> (not res!470086) (not e!397927))))

(declare-fun arrayContainsKey!0 (array!40275 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706272 (= res!470086 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!706273 () Bool)

(declare-fun res!470084 () Bool)

(assert (=> b!706273 (=> (not res!470084) (not e!397927))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706273 (= res!470084 (validKeyInArray!0 k0!2824))))

(declare-fun b!706274 () Bool)

(declare-fun res!470091 () Bool)

(assert (=> b!706274 (=> (not res!470091) (not e!397927))))

(assert (=> b!706274 (= res!470091 (contains!3912 newAcc!49 k0!2824))))

(declare-fun b!706275 () Bool)

(declare-fun res!470079 () Bool)

(assert (=> b!706275 (=> (not res!470079) (not e!397927))))

(assert (=> b!706275 (= res!470079 (not (contains!3912 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706276 () Bool)

(assert (=> b!706276 (= e!397927 false)))

(declare-fun lt!317937 () Bool)

(assert (=> b!706276 (= lt!317937 (contains!3912 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!706277 () Bool)

(declare-fun res!470080 () Bool)

(assert (=> b!706277 (=> (not res!470080) (not e!397927))))

(assert (=> b!706277 (= res!470080 (not (contains!3912 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706278 () Bool)

(declare-fun res!470087 () Bool)

(assert (=> b!706278 (=> (not res!470087) (not e!397927))))

(declare-fun noDuplicate!1159 (List!13335) Bool)

(assert (=> b!706278 (= res!470087 (noDuplicate!1159 newAcc!49))))

(declare-fun b!706279 () Bool)

(declare-fun res!470089 () Bool)

(assert (=> b!706279 (=> (not res!470089) (not e!397927))))

(assert (=> b!706279 (= res!470089 (noDuplicate!1159 acc!652))))

(declare-fun b!706280 () Bool)

(declare-fun res!470083 () Bool)

(assert (=> b!706280 (=> (not res!470083) (not e!397927))))

(declare-fun arrayNoDuplicates!0 (array!40275 (_ BitVec 32) List!13335) Bool)

(assert (=> b!706280 (= res!470083 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706281 () Bool)

(declare-fun res!470090 () Bool)

(assert (=> b!706281 (=> (not res!470090) (not e!397927))))

(assert (=> b!706281 (= res!470090 (not (contains!3912 acc!652 k0!2824)))))

(assert (= (and start!62596 res!470082) b!706279))

(assert (= (and b!706279 res!470089) b!706278))

(assert (= (and b!706278 res!470087) b!706277))

(assert (= (and b!706277 res!470080) b!706275))

(assert (= (and b!706275 res!470079) b!706272))

(assert (= (and b!706272 res!470086) b!706281))

(assert (= (and b!706281 res!470090) b!706273))

(assert (= (and b!706273 res!470084) b!706280))

(assert (= (and b!706280 res!470083) b!706271))

(assert (= (and b!706271 res!470088) b!706274))

(assert (= (and b!706274 res!470091) b!706269))

(assert (= (and b!706269 res!470081) b!706270))

(assert (= (and b!706270 res!470085) b!706276))

(declare-fun m!664187 () Bool)

(assert (=> b!706280 m!664187))

(declare-fun m!664189 () Bool)

(assert (=> b!706272 m!664189))

(declare-fun m!664191 () Bool)

(assert (=> b!706271 m!664191))

(declare-fun m!664193 () Bool)

(assert (=> b!706275 m!664193))

(declare-fun m!664195 () Bool)

(assert (=> b!706269 m!664195))

(declare-fun m!664197 () Bool)

(assert (=> b!706281 m!664197))

(declare-fun m!664199 () Bool)

(assert (=> b!706276 m!664199))

(declare-fun m!664201 () Bool)

(assert (=> b!706279 m!664201))

(declare-fun m!664203 () Bool)

(assert (=> b!706274 m!664203))

(declare-fun m!664205 () Bool)

(assert (=> b!706270 m!664205))

(declare-fun m!664207 () Bool)

(assert (=> start!62596 m!664207))

(declare-fun m!664209 () Bool)

(assert (=> b!706277 m!664209))

(declare-fun m!664211 () Bool)

(assert (=> b!706278 m!664211))

(declare-fun m!664213 () Bool)

(assert (=> b!706273 m!664213))

(check-sat (not start!62596) (not b!706280) (not b!706274) (not b!706278) (not b!706277) (not b!706272) (not b!706279) (not b!706281) (not b!706271) (not b!706270) (not b!706275) (not b!706269) (not b!706276) (not b!706273))
(check-sat)
