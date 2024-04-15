; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60258 () Bool)

(assert start!60258)

(declare-fun b!675638 () Bool)

(declare-fun e!385397 () Bool)

(declare-datatypes ((List!12930 0))(
  ( (Nil!12927) (Cons!12926 (h!13971 (_ BitVec 64)) (t!19149 List!12930)) )
))
(declare-fun acc!681 () List!12930)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3452 (List!12930 (_ BitVec 64)) Bool)

(assert (=> b!675638 (= e!385397 (contains!3452 acc!681 k!2843))))

(declare-fun b!675639 () Bool)

(declare-fun res!442229 () Bool)

(declare-fun e!385393 () Bool)

(assert (=> b!675639 (=> (not res!442229) (not e!385393))))

(declare-datatypes ((array!39316 0))(
  ( (array!39317 (arr!18850 (Array (_ BitVec 32) (_ BitVec 64))) (size!19215 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39316)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39316 (_ BitVec 32) List!12930) Bool)

(assert (=> b!675639 (= res!442229 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!675640 () Bool)

(declare-fun res!442233 () Bool)

(assert (=> b!675640 (=> (not res!442233) (not e!385393))))

(declare-fun noDuplicate!721 (List!12930) Bool)

(assert (=> b!675640 (= res!442233 (noDuplicate!721 acc!681))))

(declare-fun b!675641 () Bool)

(declare-fun res!442225 () Bool)

(assert (=> b!675641 (=> (not res!442225) (not e!385393))))

(assert (=> b!675641 (= res!442225 (not (contains!3452 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675642 () Bool)

(declare-fun e!385398 () Bool)

(assert (=> b!675642 (= e!385398 (contains!3452 acc!681 k!2843))))

(declare-fun res!442228 () Bool)

(assert (=> start!60258 (=> (not res!442228) (not e!385393))))

(assert (=> start!60258 (= res!442228 (and (bvslt (size!19215 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19215 a!3626))))))

(assert (=> start!60258 e!385393))

(assert (=> start!60258 true))

(declare-fun array_inv!14733 (array!39316) Bool)

(assert (=> start!60258 (array_inv!14733 a!3626)))

(declare-fun b!675643 () Bool)

(assert (=> b!675643 (= e!385393 false)))

(declare-fun lt!312495 () Bool)

(assert (=> b!675643 (= lt!312495 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!675644 () Bool)

(declare-fun res!442239 () Bool)

(assert (=> b!675644 (=> (not res!442239) (not e!385393))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!675644 (= res!442239 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19215 a!3626))))))

(declare-fun b!675645 () Bool)

(declare-fun e!385394 () Bool)

(assert (=> b!675645 (= e!385394 (not (contains!3452 acc!681 k!2843)))))

(declare-fun b!675646 () Bool)

(declare-fun e!385395 () Bool)

(assert (=> b!675646 (= e!385395 (not (contains!3452 acc!681 k!2843)))))

(declare-fun b!675647 () Bool)

(declare-fun res!442237 () Bool)

(assert (=> b!675647 (=> (not res!442237) (not e!385393))))

(assert (=> b!675647 (= res!442237 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19215 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!675648 () Bool)

(declare-fun res!442235 () Bool)

(assert (=> b!675648 (=> (not res!442235) (not e!385393))))

(declare-fun e!385396 () Bool)

(assert (=> b!675648 (= res!442235 e!385396)))

(declare-fun res!442241 () Bool)

(assert (=> b!675648 (=> res!442241 e!385396)))

(assert (=> b!675648 (= res!442241 e!385398)))

(declare-fun res!442232 () Bool)

(assert (=> b!675648 (=> (not res!442232) (not e!385398))))

(assert (=> b!675648 (= res!442232 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675649 () Bool)

(assert (=> b!675649 (= e!385396 e!385395)))

(declare-fun res!442227 () Bool)

(assert (=> b!675649 (=> (not res!442227) (not e!385395))))

(assert (=> b!675649 (= res!442227 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675650 () Bool)

(declare-fun res!442243 () Bool)

(assert (=> b!675650 (=> (not res!442243) (not e!385393))))

(declare-fun arrayContainsKey!0 (array!39316 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!675650 (= res!442243 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!675651 () Bool)

(declare-fun res!442242 () Bool)

(assert (=> b!675651 (=> (not res!442242) (not e!385393))))

(assert (=> b!675651 (= res!442242 (not (contains!3452 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675652 () Bool)

(declare-fun res!442240 () Bool)

(assert (=> b!675652 (=> (not res!442240) (not e!385393))))

(declare-fun e!385400 () Bool)

(assert (=> b!675652 (= res!442240 e!385400)))

(declare-fun res!442231 () Bool)

(assert (=> b!675652 (=> res!442231 e!385400)))

(assert (=> b!675652 (= res!442231 e!385397)))

(declare-fun res!442230 () Bool)

(assert (=> b!675652 (=> (not res!442230) (not e!385397))))

(assert (=> b!675652 (= res!442230 (bvsgt from!3004 i!1382))))

(declare-fun b!675653 () Bool)

(declare-fun res!442224 () Bool)

(assert (=> b!675653 (=> (not res!442224) (not e!385393))))

(assert (=> b!675653 (= res!442224 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!675654 () Bool)

(declare-fun res!442236 () Bool)

(assert (=> b!675654 (=> (not res!442236) (not e!385393))))

(assert (=> b!675654 (= res!442236 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12927))))

(declare-fun b!675655 () Bool)

(declare-fun res!442238 () Bool)

(assert (=> b!675655 (=> (not res!442238) (not e!385393))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!675655 (= res!442238 (validKeyInArray!0 k!2843))))

(declare-fun b!675656 () Bool)

(assert (=> b!675656 (= e!385400 e!385394)))

(declare-fun res!442226 () Bool)

(assert (=> b!675656 (=> (not res!442226) (not e!385394))))

(assert (=> b!675656 (= res!442226 (bvsle from!3004 i!1382))))

(declare-fun b!675657 () Bool)

(declare-fun res!442234 () Bool)

(assert (=> b!675657 (=> (not res!442234) (not e!385393))))

(assert (=> b!675657 (= res!442234 (not (validKeyInArray!0 (select (arr!18850 a!3626) from!3004))))))

(assert (= (and start!60258 res!442228) b!675640))

(assert (= (and b!675640 res!442233) b!675641))

(assert (= (and b!675641 res!442225) b!675651))

(assert (= (and b!675651 res!442242) b!675652))

(assert (= (and b!675652 res!442230) b!675638))

(assert (= (and b!675652 (not res!442231)) b!675656))

(assert (= (and b!675656 res!442226) b!675645))

(assert (= (and b!675652 res!442240) b!675654))

(assert (= (and b!675654 res!442236) b!675639))

(assert (= (and b!675639 res!442229) b!675644))

(assert (= (and b!675644 res!442239) b!675655))

(assert (= (and b!675655 res!442238) b!675650))

(assert (= (and b!675650 res!442243) b!675647))

(assert (= (and b!675647 res!442237) b!675657))

(assert (= (and b!675657 res!442234) b!675653))

(assert (= (and b!675653 res!442224) b!675648))

(assert (= (and b!675648 res!442232) b!675642))

(assert (= (and b!675648 (not res!442241)) b!675649))

(assert (= (and b!675649 res!442227) b!675646))

(assert (= (and b!675648 res!442235) b!675643))

(declare-fun m!642309 () Bool)

(assert (=> b!675639 m!642309))

(declare-fun m!642311 () Bool)

(assert (=> b!675650 m!642311))

(declare-fun m!642313 () Bool)

(assert (=> b!675646 m!642313))

(declare-fun m!642315 () Bool)

(assert (=> b!675654 m!642315))

(assert (=> b!675638 m!642313))

(declare-fun m!642317 () Bool)

(assert (=> b!675651 m!642317))

(declare-fun m!642319 () Bool)

(assert (=> b!675640 m!642319))

(assert (=> b!675642 m!642313))

(declare-fun m!642321 () Bool)

(assert (=> b!675657 m!642321))

(assert (=> b!675657 m!642321))

(declare-fun m!642323 () Bool)

(assert (=> b!675657 m!642323))

(declare-fun m!642325 () Bool)

(assert (=> b!675643 m!642325))

(declare-fun m!642327 () Bool)

(assert (=> start!60258 m!642327))

(assert (=> b!675645 m!642313))

(declare-fun m!642329 () Bool)

(assert (=> b!675641 m!642329))

(declare-fun m!642331 () Bool)

(assert (=> b!675655 m!642331))

(push 1)

(assert (not b!675646))

(assert (not b!675654))

(assert (not b!675641))

(assert (not b!675655))

(assert (not b!675645))

(assert (not b!675643))

(assert (not b!675642))

(assert (not start!60258))

(assert (not b!675657))

(assert (not b!675639))

(assert (not b!675638))

(assert (not b!675651))

(assert (not b!675650))

(assert (not b!675640))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

