; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60286 () Bool)

(assert start!60286)

(declare-fun b!676414 () Bool)

(declare-fun res!442849 () Bool)

(declare-fun e!385779 () Bool)

(assert (=> b!676414 (=> (not res!442849) (not e!385779))))

(declare-datatypes ((List!12900 0))(
  ( (Nil!12897) (Cons!12896 (h!13941 (_ BitVec 64)) (t!19128 List!12900)) )
))
(declare-fun acc!681 () List!12900)

(declare-fun noDuplicate!724 (List!12900) Bool)

(assert (=> b!676414 (= res!442849 (noDuplicate!724 acc!681))))

(declare-fun b!676415 () Bool)

(declare-fun e!385782 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3477 (List!12900 (_ BitVec 64)) Bool)

(assert (=> b!676415 (= e!385782 (contains!3477 acc!681 k0!2843))))

(declare-fun b!676416 () Bool)

(declare-fun res!442845 () Bool)

(assert (=> b!676416 (=> (not res!442845) (not e!385779))))

(assert (=> b!676416 (= res!442845 (not (contains!3477 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676417 () Bool)

(declare-fun e!385775 () Bool)

(assert (=> b!676417 (= e!385775 (not (contains!3477 acc!681 k0!2843)))))

(declare-fun b!676418 () Bool)

(declare-fun res!442847 () Bool)

(assert (=> b!676418 (=> (not res!442847) (not e!385779))))

(declare-fun e!385777 () Bool)

(assert (=> b!676418 (= res!442847 e!385777)))

(declare-fun res!442854 () Bool)

(assert (=> b!676418 (=> res!442854 e!385777)))

(declare-fun e!385776 () Bool)

(assert (=> b!676418 (= res!442854 e!385776)))

(declare-fun res!442842 () Bool)

(assert (=> b!676418 (=> (not res!442842) (not e!385776))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!676418 (= res!442842 (bvsgt from!3004 i!1382))))

(declare-fun b!676419 () Bool)

(assert (=> b!676419 (= e!385779 false)))

(declare-datatypes ((array!39333 0))(
  ( (array!39334 (arr!18859 (Array (_ BitVec 32) (_ BitVec 64))) (size!19223 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39333)

(declare-fun lt!312775 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39333 (_ BitVec 32) List!12900) Bool)

(assert (=> b!676419 (= lt!312775 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!676420 () Bool)

(declare-fun res!442844 () Bool)

(assert (=> b!676420 (=> (not res!442844) (not e!385779))))

(assert (=> b!676420 (= res!442844 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19223 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!676421 () Bool)

(declare-fun res!442846 () Bool)

(assert (=> b!676421 (=> (not res!442846) (not e!385779))))

(assert (=> b!676421 (= res!442846 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12897))))

(declare-fun b!676422 () Bool)

(declare-fun res!442848 () Bool)

(assert (=> b!676422 (=> (not res!442848) (not e!385779))))

(assert (=> b!676422 (= res!442848 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!676423 () Bool)

(declare-fun res!442841 () Bool)

(assert (=> b!676423 (=> (not res!442841) (not e!385779))))

(assert (=> b!676423 (= res!442841 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19223 a!3626))))))

(declare-fun b!676424 () Bool)

(declare-fun res!442851 () Bool)

(assert (=> b!676424 (=> (not res!442851) (not e!385779))))

(declare-fun e!385780 () Bool)

(assert (=> b!676424 (= res!442851 e!385780)))

(declare-fun res!442857 () Bool)

(assert (=> b!676424 (=> res!442857 e!385780)))

(assert (=> b!676424 (= res!442857 e!385782)))

(declare-fun res!442859 () Bool)

(assert (=> b!676424 (=> (not res!442859) (not e!385782))))

(assert (=> b!676424 (= res!442859 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676425 () Bool)

(declare-fun res!442853 () Bool)

(assert (=> b!676425 (=> (not res!442853) (not e!385779))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!676425 (= res!442853 (validKeyInArray!0 k0!2843))))

(declare-fun b!676426 () Bool)

(declare-fun res!442843 () Bool)

(assert (=> b!676426 (=> (not res!442843) (not e!385779))))

(assert (=> b!676426 (= res!442843 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!676427 () Bool)

(assert (=> b!676427 (= e!385776 (contains!3477 acc!681 k0!2843))))

(declare-fun b!676428 () Bool)

(declare-fun res!442856 () Bool)

(assert (=> b!676428 (=> (not res!442856) (not e!385779))))

(assert (=> b!676428 (= res!442856 (not (contains!3477 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676429 () Bool)

(declare-fun e!385778 () Bool)

(assert (=> b!676429 (= e!385780 e!385778)))

(declare-fun res!442840 () Bool)

(assert (=> b!676429 (=> (not res!442840) (not e!385778))))

(assert (=> b!676429 (= res!442840 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676431 () Bool)

(assert (=> b!676431 (= e!385777 e!385775)))

(declare-fun res!442850 () Bool)

(assert (=> b!676431 (=> (not res!442850) (not e!385775))))

(assert (=> b!676431 (= res!442850 (bvsle from!3004 i!1382))))

(declare-fun res!442858 () Bool)

(assert (=> start!60286 (=> (not res!442858) (not e!385779))))

(assert (=> start!60286 (= res!442858 (and (bvslt (size!19223 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19223 a!3626))))))

(assert (=> start!60286 e!385779))

(assert (=> start!60286 true))

(declare-fun array_inv!14655 (array!39333) Bool)

(assert (=> start!60286 (array_inv!14655 a!3626)))

(declare-fun b!676430 () Bool)

(declare-fun res!442855 () Bool)

(assert (=> b!676430 (=> (not res!442855) (not e!385779))))

(assert (=> b!676430 (= res!442855 (not (validKeyInArray!0 (select (arr!18859 a!3626) from!3004))))))

(declare-fun b!676432 () Bool)

(assert (=> b!676432 (= e!385778 (not (contains!3477 acc!681 k0!2843)))))

(declare-fun b!676433 () Bool)

(declare-fun res!442852 () Bool)

(assert (=> b!676433 (=> (not res!442852) (not e!385779))))

(declare-fun arrayContainsKey!0 (array!39333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!676433 (= res!442852 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(assert (= (and start!60286 res!442858) b!676414))

(assert (= (and b!676414 res!442849) b!676416))

(assert (= (and b!676416 res!442845) b!676428))

(assert (= (and b!676428 res!442856) b!676418))

(assert (= (and b!676418 res!442842) b!676427))

(assert (= (and b!676418 (not res!442854)) b!676431))

(assert (= (and b!676431 res!442850) b!676417))

(assert (= (and b!676418 res!442847) b!676421))

(assert (= (and b!676421 res!442846) b!676426))

(assert (= (and b!676426 res!442843) b!676423))

(assert (= (and b!676423 res!442841) b!676425))

(assert (= (and b!676425 res!442853) b!676433))

(assert (= (and b!676433 res!442852) b!676420))

(assert (= (and b!676420 res!442844) b!676430))

(assert (= (and b!676430 res!442855) b!676422))

(assert (= (and b!676422 res!442848) b!676424))

(assert (= (and b!676424 res!442859) b!676415))

(assert (= (and b!676424 (not res!442857)) b!676429))

(assert (= (and b!676429 res!442840) b!676432))

(assert (= (and b!676424 res!442851) b!676419))

(declare-fun m!643283 () Bool)

(assert (=> b!676433 m!643283))

(declare-fun m!643285 () Bool)

(assert (=> start!60286 m!643285))

(declare-fun m!643287 () Bool)

(assert (=> b!676415 m!643287))

(declare-fun m!643289 () Bool)

(assert (=> b!676416 m!643289))

(assert (=> b!676432 m!643287))

(assert (=> b!676417 m!643287))

(declare-fun m!643291 () Bool)

(assert (=> b!676430 m!643291))

(assert (=> b!676430 m!643291))

(declare-fun m!643293 () Bool)

(assert (=> b!676430 m!643293))

(declare-fun m!643295 () Bool)

(assert (=> b!676419 m!643295))

(assert (=> b!676427 m!643287))

(declare-fun m!643297 () Bool)

(assert (=> b!676421 m!643297))

(declare-fun m!643299 () Bool)

(assert (=> b!676428 m!643299))

(declare-fun m!643301 () Bool)

(assert (=> b!676426 m!643301))

(declare-fun m!643303 () Bool)

(assert (=> b!676414 m!643303))

(declare-fun m!643305 () Bool)

(assert (=> b!676425 m!643305))

(check-sat (not b!676419) (not b!676414) (not b!676416) (not b!676432) (not b!676430) (not b!676428) (not b!676425) (not b!676417) (not b!676415) (not start!60286) (not b!676433) (not b!676426) (not b!676427) (not b!676421))
(check-sat)
