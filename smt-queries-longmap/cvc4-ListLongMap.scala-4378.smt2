; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60300 () Bool)

(assert start!60300)

(declare-fun b!676835 () Bool)

(declare-fun e!385943 () Bool)

(declare-datatypes ((List!12907 0))(
  ( (Nil!12904) (Cons!12903 (h!13948 (_ BitVec 64)) (t!19135 List!12907)) )
))
(declare-fun acc!681 () List!12907)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3484 (List!12907 (_ BitVec 64)) Bool)

(assert (=> b!676835 (= e!385943 (contains!3484 acc!681 k!2843))))

(declare-fun b!676836 () Bool)

(declare-fun res!443270 () Bool)

(declare-fun e!385949 () Bool)

(assert (=> b!676836 (=> (not res!443270) (not e!385949))))

(declare-datatypes ((array!39347 0))(
  ( (array!39348 (arr!18866 (Array (_ BitVec 32) (_ BitVec 64))) (size!19230 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39347)

(declare-fun arrayNoDuplicates!0 (array!39347 (_ BitVec 32) List!12907) Bool)

(assert (=> b!676836 (= res!443270 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12904))))

(declare-fun b!676837 () Bool)

(declare-fun res!443274 () Bool)

(assert (=> b!676837 (=> (not res!443274) (not e!385949))))

(declare-fun e!385950 () Bool)

(assert (=> b!676837 (= res!443274 e!385950)))

(declare-fun res!443262 () Bool)

(assert (=> b!676837 (=> res!443262 e!385950)))

(assert (=> b!676837 (= res!443262 e!385943)))

(declare-fun res!443263 () Bool)

(assert (=> b!676837 (=> (not res!443263) (not e!385943))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!676837 (= res!443263 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676838 () Bool)

(declare-fun res!443264 () Bool)

(assert (=> b!676838 (=> (not res!443264) (not e!385949))))

(declare-fun noDuplicate!731 (List!12907) Bool)

(assert (=> b!676838 (= res!443264 (noDuplicate!731 acc!681))))

(declare-fun b!676839 () Bool)

(declare-fun res!443266 () Bool)

(assert (=> b!676839 (=> (not res!443266) (not e!385949))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!676839 (= res!443266 (not (validKeyInArray!0 (select (arr!18866 a!3626) from!3004))))))

(declare-fun b!676840 () Bool)

(declare-fun res!443272 () Bool)

(assert (=> b!676840 (=> (not res!443272) (not e!385949))))

(declare-fun e!385947 () Bool)

(assert (=> b!676840 (= res!443272 e!385947)))

(declare-fun res!443269 () Bool)

(assert (=> b!676840 (=> res!443269 e!385947)))

(declare-fun e!385944 () Bool)

(assert (=> b!676840 (= res!443269 e!385944)))

(declare-fun res!443260 () Bool)

(assert (=> b!676840 (=> (not res!443260) (not e!385944))))

(assert (=> b!676840 (= res!443260 (bvsgt from!3004 i!1382))))

(declare-fun b!676841 () Bool)

(declare-fun res!443268 () Bool)

(assert (=> b!676841 (=> (not res!443268) (not e!385949))))

(assert (=> b!676841 (= res!443268 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19230 a!3626))))))

(declare-fun b!676834 () Bool)

(declare-fun res!443267 () Bool)

(assert (=> b!676834 (=> (not res!443267) (not e!385949))))

(assert (=> b!676834 (= res!443267 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!443279 () Bool)

(assert (=> start!60300 (=> (not res!443279) (not e!385949))))

(assert (=> start!60300 (= res!443279 (and (bvslt (size!19230 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19230 a!3626))))))

(assert (=> start!60300 e!385949))

(assert (=> start!60300 true))

(declare-fun array_inv!14662 (array!39347) Bool)

(assert (=> start!60300 (array_inv!14662 a!3626)))

(declare-fun b!676842 () Bool)

(declare-fun res!443277 () Bool)

(assert (=> b!676842 (=> (not res!443277) (not e!385949))))

(declare-fun arrayContainsKey!0 (array!39347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!676842 (= res!443277 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!676843 () Bool)

(declare-fun res!443276 () Bool)

(assert (=> b!676843 (=> (not res!443276) (not e!385949))))

(assert (=> b!676843 (= res!443276 (not (contains!3484 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676844 () Bool)

(declare-fun res!443271 () Bool)

(assert (=> b!676844 (=> (not res!443271) (not e!385949))))

(assert (=> b!676844 (= res!443271 (validKeyInArray!0 k!2843))))

(declare-fun b!676845 () Bool)

(declare-fun e!385945 () Bool)

(assert (=> b!676845 (= e!385950 e!385945)))

(declare-fun res!443278 () Bool)

(assert (=> b!676845 (=> (not res!443278) (not e!385945))))

(assert (=> b!676845 (= res!443278 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676846 () Bool)

(assert (=> b!676846 (= e!385945 (not (contains!3484 acc!681 k!2843)))))

(declare-fun b!676847 () Bool)

(declare-fun res!443273 () Bool)

(assert (=> b!676847 (=> (not res!443273) (not e!385949))))

(assert (=> b!676847 (= res!443273 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!676848 () Bool)

(declare-fun e!385946 () Bool)

(assert (=> b!676848 (= e!385946 (not (contains!3484 acc!681 k!2843)))))

(declare-fun b!676849 () Bool)

(declare-fun res!443265 () Bool)

(assert (=> b!676849 (=> (not res!443265) (not e!385949))))

(assert (=> b!676849 (= res!443265 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19230 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!676850 () Bool)

(declare-fun res!443275 () Bool)

(assert (=> b!676850 (=> (not res!443275) (not e!385949))))

(assert (=> b!676850 (= res!443275 (not (contains!3484 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676851 () Bool)

(assert (=> b!676851 (= e!385944 (contains!3484 acc!681 k!2843))))

(declare-fun b!676852 () Bool)

(assert (=> b!676852 (= e!385949 false)))

(declare-fun lt!312796 () Bool)

(assert (=> b!676852 (= lt!312796 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!676853 () Bool)

(assert (=> b!676853 (= e!385947 e!385946)))

(declare-fun res!443261 () Bool)

(assert (=> b!676853 (=> (not res!443261) (not e!385946))))

(assert (=> b!676853 (= res!443261 (bvsle from!3004 i!1382))))

(assert (= (and start!60300 res!443279) b!676838))

(assert (= (and b!676838 res!443264) b!676850))

(assert (= (and b!676850 res!443275) b!676843))

(assert (= (and b!676843 res!443276) b!676840))

(assert (= (and b!676840 res!443260) b!676851))

(assert (= (and b!676840 (not res!443269)) b!676853))

(assert (= (and b!676853 res!443261) b!676848))

(assert (= (and b!676840 res!443272) b!676836))

(assert (= (and b!676836 res!443270) b!676834))

(assert (= (and b!676834 res!443267) b!676841))

(assert (= (and b!676841 res!443268) b!676844))

(assert (= (and b!676844 res!443271) b!676842))

(assert (= (and b!676842 res!443277) b!676849))

(assert (= (and b!676849 res!443265) b!676839))

(assert (= (and b!676839 res!443266) b!676847))

(assert (= (and b!676847 res!443273) b!676837))

(assert (= (and b!676837 res!443263) b!676835))

(assert (= (and b!676837 (not res!443262)) b!676845))

(assert (= (and b!676845 res!443278) b!676846))

(assert (= (and b!676837 res!443274) b!676852))

(declare-fun m!643451 () Bool)

(assert (=> b!676848 m!643451))

(assert (=> b!676835 m!643451))

(declare-fun m!643453 () Bool)

(assert (=> b!676850 m!643453))

(declare-fun m!643455 () Bool)

(assert (=> b!676844 m!643455))

(declare-fun m!643457 () Bool)

(assert (=> b!676834 m!643457))

(declare-fun m!643459 () Bool)

(assert (=> b!676843 m!643459))

(assert (=> b!676851 m!643451))

(declare-fun m!643461 () Bool)

(assert (=> start!60300 m!643461))

(declare-fun m!643463 () Bool)

(assert (=> b!676836 m!643463))

(assert (=> b!676846 m!643451))

(declare-fun m!643465 () Bool)

(assert (=> b!676842 m!643465))

(declare-fun m!643467 () Bool)

(assert (=> b!676852 m!643467))

(declare-fun m!643469 () Bool)

(assert (=> b!676839 m!643469))

(assert (=> b!676839 m!643469))

(declare-fun m!643471 () Bool)

(assert (=> b!676839 m!643471))

(declare-fun m!643473 () Bool)

(assert (=> b!676838 m!643473))

(push 1)

(assert (not b!676835))

(assert (not b!676848))

(assert (not b!676834))

(assert (not b!676836))

(assert (not b!676851))

(assert (not b!676844))

(assert (not b!676838))

(assert (not b!676852))

(assert (not b!676842))

(assert (not b!676843))

(assert (not b!676846))

(assert (not b!676850))

(assert (not start!60300))

(assert (not b!676839))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

