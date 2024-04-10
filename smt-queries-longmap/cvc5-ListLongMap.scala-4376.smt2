; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60284 () Bool)

(assert start!60284)

(declare-fun b!676354 () Bool)

(declare-fun res!442782 () Bool)

(declare-fun e!385757 () Bool)

(assert (=> b!676354 (=> (not res!442782) (not e!385757))))

(declare-datatypes ((List!12899 0))(
  ( (Nil!12896) (Cons!12895 (h!13940 (_ BitVec 64)) (t!19127 List!12899)) )
))
(declare-fun acc!681 () List!12899)

(declare-fun contains!3476 (List!12899 (_ BitVec 64)) Bool)

(assert (=> b!676354 (= res!442782 (not (contains!3476 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676355 () Bool)

(declare-fun e!385753 () Bool)

(declare-fun e!385751 () Bool)

(assert (=> b!676355 (= e!385753 e!385751)))

(declare-fun res!442789 () Bool)

(assert (=> b!676355 (=> (not res!442789) (not e!385751))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!676355 (= res!442789 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun res!442781 () Bool)

(assert (=> start!60284 (=> (not res!442781) (not e!385757))))

(declare-datatypes ((array!39331 0))(
  ( (array!39332 (arr!18858 (Array (_ BitVec 32) (_ BitVec 64))) (size!19222 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39331)

(assert (=> start!60284 (= res!442781 (and (bvslt (size!19222 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19222 a!3626))))))

(assert (=> start!60284 e!385757))

(assert (=> start!60284 true))

(declare-fun array_inv!14654 (array!39331) Bool)

(assert (=> start!60284 (array_inv!14654 a!3626)))

(declare-fun b!676356 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!676356 (= e!385751 (not (contains!3476 acc!681 k!2843)))))

(declare-fun b!676357 () Bool)

(declare-fun res!442788 () Bool)

(assert (=> b!676357 (=> (not res!442788) (not e!385757))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!676357 (= res!442788 (validKeyInArray!0 k!2843))))

(declare-fun b!676358 () Bool)

(declare-fun e!385756 () Bool)

(assert (=> b!676358 (= e!385756 (not (contains!3476 acc!681 k!2843)))))

(declare-fun b!676359 () Bool)

(declare-fun res!442799 () Bool)

(assert (=> b!676359 (=> (not res!442799) (not e!385757))))

(assert (=> b!676359 (= res!442799 (not (contains!3476 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676360 () Bool)

(declare-fun res!442791 () Bool)

(assert (=> b!676360 (=> (not res!442791) (not e!385757))))

(assert (=> b!676360 (= res!442791 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19222 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!676361 () Bool)

(declare-fun res!442793 () Bool)

(assert (=> b!676361 (=> (not res!442793) (not e!385757))))

(assert (=> b!676361 (= res!442793 e!385753)))

(declare-fun res!442784 () Bool)

(assert (=> b!676361 (=> res!442784 e!385753)))

(declare-fun e!385752 () Bool)

(assert (=> b!676361 (= res!442784 e!385752)))

(declare-fun res!442796 () Bool)

(assert (=> b!676361 (=> (not res!442796) (not e!385752))))

(assert (=> b!676361 (= res!442796 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676362 () Bool)

(declare-fun res!442780 () Bool)

(assert (=> b!676362 (=> (not res!442780) (not e!385757))))

(declare-fun arrayContainsKey!0 (array!39331 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!676362 (= res!442780 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!676363 () Bool)

(declare-fun res!442785 () Bool)

(assert (=> b!676363 (=> (not res!442785) (not e!385757))))

(assert (=> b!676363 (= res!442785 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19222 a!3626))))))

(declare-fun b!676364 () Bool)

(declare-fun res!442794 () Bool)

(assert (=> b!676364 (=> (not res!442794) (not e!385757))))

(declare-fun arrayNoDuplicates!0 (array!39331 (_ BitVec 32) List!12899) Bool)

(assert (=> b!676364 (= res!442794 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!676365 () Bool)

(declare-fun res!442786 () Bool)

(assert (=> b!676365 (=> (not res!442786) (not e!385757))))

(assert (=> b!676365 (= res!442786 (not (validKeyInArray!0 (select (arr!18858 a!3626) from!3004))))))

(declare-fun b!676366 () Bool)

(declare-fun res!442798 () Bool)

(assert (=> b!676366 (=> (not res!442798) (not e!385757))))

(assert (=> b!676366 (= res!442798 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12896))))

(declare-fun b!676367 () Bool)

(declare-fun e!385754 () Bool)

(assert (=> b!676367 (= e!385754 e!385756)))

(declare-fun res!442787 () Bool)

(assert (=> b!676367 (=> (not res!442787) (not e!385756))))

(assert (=> b!676367 (= res!442787 (bvsle from!3004 i!1382))))

(declare-fun b!676368 () Bool)

(declare-fun e!385755 () Bool)

(assert (=> b!676368 (= e!385755 (contains!3476 acc!681 k!2843))))

(declare-fun b!676369 () Bool)

(assert (=> b!676369 (= e!385752 (contains!3476 acc!681 k!2843))))

(declare-fun b!676370 () Bool)

(assert (=> b!676370 (= e!385757 false)))

(declare-fun lt!312772 () Bool)

(assert (=> b!676370 (= lt!312772 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!676371 () Bool)

(declare-fun res!442783 () Bool)

(assert (=> b!676371 (=> (not res!442783) (not e!385757))))

(assert (=> b!676371 (= res!442783 e!385754)))

(declare-fun res!442792 () Bool)

(assert (=> b!676371 (=> res!442792 e!385754)))

(assert (=> b!676371 (= res!442792 e!385755)))

(declare-fun res!442797 () Bool)

(assert (=> b!676371 (=> (not res!442797) (not e!385755))))

(assert (=> b!676371 (= res!442797 (bvsgt from!3004 i!1382))))

(declare-fun b!676372 () Bool)

(declare-fun res!442795 () Bool)

(assert (=> b!676372 (=> (not res!442795) (not e!385757))))

(assert (=> b!676372 (= res!442795 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!676373 () Bool)

(declare-fun res!442790 () Bool)

(assert (=> b!676373 (=> (not res!442790) (not e!385757))))

(declare-fun noDuplicate!723 (List!12899) Bool)

(assert (=> b!676373 (= res!442790 (noDuplicate!723 acc!681))))

(assert (= (and start!60284 res!442781) b!676373))

(assert (= (and b!676373 res!442790) b!676359))

(assert (= (and b!676359 res!442799) b!676354))

(assert (= (and b!676354 res!442782) b!676371))

(assert (= (and b!676371 res!442797) b!676368))

(assert (= (and b!676371 (not res!442792)) b!676367))

(assert (= (and b!676367 res!442787) b!676358))

(assert (= (and b!676371 res!442783) b!676366))

(assert (= (and b!676366 res!442798) b!676364))

(assert (= (and b!676364 res!442794) b!676363))

(assert (= (and b!676363 res!442785) b!676357))

(assert (= (and b!676357 res!442788) b!676362))

(assert (= (and b!676362 res!442780) b!676360))

(assert (= (and b!676360 res!442791) b!676365))

(assert (= (and b!676365 res!442786) b!676372))

(assert (= (and b!676372 res!442795) b!676361))

(assert (= (and b!676361 res!442796) b!676369))

(assert (= (and b!676361 (not res!442784)) b!676355))

(assert (= (and b!676355 res!442789) b!676356))

(assert (= (and b!676361 res!442793) b!676370))

(declare-fun m!643259 () Bool)

(assert (=> b!676359 m!643259))

(declare-fun m!643261 () Bool)

(assert (=> b!676356 m!643261))

(assert (=> b!676369 m!643261))

(declare-fun m!643263 () Bool)

(assert (=> b!676370 m!643263))

(declare-fun m!643265 () Bool)

(assert (=> b!676365 m!643265))

(assert (=> b!676365 m!643265))

(declare-fun m!643267 () Bool)

(assert (=> b!676365 m!643267))

(declare-fun m!643269 () Bool)

(assert (=> b!676366 m!643269))

(declare-fun m!643271 () Bool)

(assert (=> start!60284 m!643271))

(declare-fun m!643273 () Bool)

(assert (=> b!676354 m!643273))

(declare-fun m!643275 () Bool)

(assert (=> b!676357 m!643275))

(declare-fun m!643277 () Bool)

(assert (=> b!676362 m!643277))

(declare-fun m!643279 () Bool)

(assert (=> b!676364 m!643279))

(assert (=> b!676358 m!643261))

(assert (=> b!676368 m!643261))

(declare-fun m!643281 () Bool)

(assert (=> b!676373 m!643281))

(push 1)

(assert (not b!676354))

(assert (not b!676373))

(assert (not b!676362))

(assert (not b!676359))

(assert (not b!676357))

(assert (not b!676370))

(assert (not b!676368))

(assert (not b!676369))

(assert (not b!676356))

(assert (not b!676366))

(assert (not b!676365))

(assert (not b!676358))

(assert (not b!676364))

(assert (not start!60284))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

