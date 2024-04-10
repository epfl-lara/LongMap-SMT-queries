; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62602 () Bool)

(assert start!62602)

(declare-fun b!706386 () Bool)

(declare-fun res!470196 () Bool)

(declare-fun e!397945 () Bool)

(assert (=> b!706386 (=> (not res!470196) (not e!397945))))

(declare-datatypes ((array!40281 0))(
  ( (array!40282 (arr!19297 (Array (_ BitVec 32) (_ BitVec 64))) (size!19682 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40281)

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((List!13338 0))(
  ( (Nil!13335) (Cons!13334 (h!14379 (_ BitVec 64)) (t!19620 List!13338)) )
))
(declare-fun acc!652 () List!13338)

(declare-fun arrayNoDuplicates!0 (array!40281 (_ BitVec 32) List!13338) Bool)

(assert (=> b!706386 (= res!470196 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706387 () Bool)

(declare-fun res!470204 () Bool)

(assert (=> b!706387 (=> (not res!470204) (not e!397945))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706387 (= res!470204 (validKeyInArray!0 k0!2824))))

(declare-fun b!706388 () Bool)

(declare-fun res!470201 () Bool)

(assert (=> b!706388 (=> (not res!470201) (not e!397945))))

(declare-fun contains!3915 (List!13338 (_ BitVec 64)) Bool)

(assert (=> b!706388 (= res!470201 (not (contains!3915 acc!652 k0!2824)))))

(declare-fun b!706389 () Bool)

(declare-fun res!470200 () Bool)

(assert (=> b!706389 (=> (not res!470200) (not e!397945))))

(declare-fun newAcc!49 () List!13338)

(assert (=> b!706389 (= res!470200 (contains!3915 newAcc!49 k0!2824))))

(declare-fun b!706390 () Bool)

(declare-fun res!470203 () Bool)

(assert (=> b!706390 (=> (not res!470203) (not e!397945))))

(declare-fun noDuplicate!1162 (List!13338) Bool)

(assert (=> b!706390 (= res!470203 (noDuplicate!1162 newAcc!49))))

(declare-fun b!706391 () Bool)

(declare-fun res!470205 () Bool)

(assert (=> b!706391 (=> (not res!470205) (not e!397945))))

(declare-fun arrayContainsKey!0 (array!40281 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706391 (= res!470205 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun res!470208 () Bool)

(assert (=> start!62602 (=> (not res!470208) (not e!397945))))

(assert (=> start!62602 (= res!470208 (and (bvslt (size!19682 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19682 a!3591))))))

(assert (=> start!62602 e!397945))

(assert (=> start!62602 true))

(declare-fun array_inv!15093 (array!40281) Bool)

(assert (=> start!62602 (array_inv!15093 a!3591)))

(declare-fun b!706392 () Bool)

(declare-fun res!470202 () Bool)

(assert (=> b!706392 (=> (not res!470202) (not e!397945))))

(assert (=> b!706392 (= res!470202 (noDuplicate!1162 acc!652))))

(declare-fun b!706393 () Bool)

(declare-fun res!470198 () Bool)

(assert (=> b!706393 (=> (not res!470198) (not e!397945))))

(assert (=> b!706393 (= res!470198 (not (contains!3915 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706394 () Bool)

(assert (=> b!706394 (= e!397945 false)))

(declare-fun lt!317946 () Bool)

(assert (=> b!706394 (= lt!317946 (contains!3915 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!706395 () Bool)

(declare-fun res!470207 () Bool)

(assert (=> b!706395 (=> (not res!470207) (not e!397945))))

(assert (=> b!706395 (= res!470207 (not (contains!3915 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706396 () Bool)

(declare-fun res!470197 () Bool)

(assert (=> b!706396 (=> (not res!470197) (not e!397945))))

(assert (=> b!706396 (= res!470197 (not (contains!3915 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706397 () Bool)

(declare-fun res!470206 () Bool)

(assert (=> b!706397 (=> (not res!470206) (not e!397945))))

(declare-fun -!325 (List!13338 (_ BitVec 64)) List!13338)

(assert (=> b!706397 (= res!470206 (= (-!325 newAcc!49 k0!2824) acc!652))))

(declare-fun b!706398 () Bool)

(declare-fun res!470199 () Bool)

(assert (=> b!706398 (=> (not res!470199) (not e!397945))))

(declare-fun subseq!360 (List!13338 List!13338) Bool)

(assert (=> b!706398 (= res!470199 (subseq!360 acc!652 newAcc!49))))

(assert (= (and start!62602 res!470208) b!706392))

(assert (= (and b!706392 res!470202) b!706390))

(assert (= (and b!706390 res!470203) b!706395))

(assert (= (and b!706395 res!470207) b!706396))

(assert (= (and b!706396 res!470197) b!706391))

(assert (= (and b!706391 res!470205) b!706388))

(assert (= (and b!706388 res!470201) b!706387))

(assert (= (and b!706387 res!470204) b!706386))

(assert (= (and b!706386 res!470196) b!706398))

(assert (= (and b!706398 res!470199) b!706389))

(assert (= (and b!706389 res!470200) b!706397))

(assert (= (and b!706397 res!470206) b!706393))

(assert (= (and b!706393 res!470198) b!706394))

(declare-fun m!664271 () Bool)

(assert (=> b!706397 m!664271))

(declare-fun m!664273 () Bool)

(assert (=> b!706389 m!664273))

(declare-fun m!664275 () Bool)

(assert (=> b!706387 m!664275))

(declare-fun m!664277 () Bool)

(assert (=> b!706390 m!664277))

(declare-fun m!664279 () Bool)

(assert (=> start!62602 m!664279))

(declare-fun m!664281 () Bool)

(assert (=> b!706391 m!664281))

(declare-fun m!664283 () Bool)

(assert (=> b!706395 m!664283))

(declare-fun m!664285 () Bool)

(assert (=> b!706396 m!664285))

(declare-fun m!664287 () Bool)

(assert (=> b!706392 m!664287))

(declare-fun m!664289 () Bool)

(assert (=> b!706386 m!664289))

(declare-fun m!664291 () Bool)

(assert (=> b!706398 m!664291))

(declare-fun m!664293 () Bool)

(assert (=> b!706393 m!664293))

(declare-fun m!664295 () Bool)

(assert (=> b!706394 m!664295))

(declare-fun m!664297 () Bool)

(assert (=> b!706388 m!664297))

(check-sat (not b!706394) (not b!706391) (not start!62602) (not b!706390) (not b!706386) (not b!706396) (not b!706388) (not b!706392) (not b!706389) (not b!706397) (not b!706395) (not b!706393) (not b!706387) (not b!706398))
(check-sat)
