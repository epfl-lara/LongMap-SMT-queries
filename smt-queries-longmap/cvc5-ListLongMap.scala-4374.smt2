; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60264 () Bool)

(assert start!60264)

(declare-fun b!675818 () Bool)

(declare-fun res!442413 () Bool)

(declare-fun e!385471 () Bool)

(assert (=> b!675818 (=> (not res!442413) (not e!385471))))

(declare-fun e!385469 () Bool)

(assert (=> b!675818 (= res!442413 e!385469)))

(declare-fun res!442423 () Bool)

(assert (=> b!675818 (=> res!442423 e!385469)))

(declare-fun e!385467 () Bool)

(assert (=> b!675818 (= res!442423 e!385467)))

(declare-fun res!442419 () Bool)

(assert (=> b!675818 (=> (not res!442419) (not e!385467))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!675818 (= res!442419 (bvsgt from!3004 i!1382))))

(declare-fun b!675819 () Bool)

(declare-fun res!442406 () Bool)

(assert (=> b!675819 (=> (not res!442406) (not e!385471))))

(assert (=> b!675819 (= res!442406 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!675820 () Bool)

(declare-fun res!442422 () Bool)

(assert (=> b!675820 (=> (not res!442422) (not e!385471))))

(declare-datatypes ((array!39322 0))(
  ( (array!39323 (arr!18853 (Array (_ BitVec 32) (_ BitVec 64))) (size!19218 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39322)

(declare-datatypes ((List!12933 0))(
  ( (Nil!12930) (Cons!12929 (h!13974 (_ BitVec 64)) (t!19152 List!12933)) )
))
(declare-fun arrayNoDuplicates!0 (array!39322 (_ BitVec 32) List!12933) Bool)

(assert (=> b!675820 (= res!442422 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12930))))

(declare-fun b!675821 () Bool)

(declare-fun res!442414 () Bool)

(assert (=> b!675821 (=> (not res!442414) (not e!385471))))

(declare-fun acc!681 () List!12933)

(declare-fun noDuplicate!724 (List!12933) Bool)

(assert (=> b!675821 (= res!442414 (noDuplicate!724 acc!681))))

(declare-fun b!675822 () Bool)

(declare-fun res!442417 () Bool)

(assert (=> b!675822 (=> (not res!442417) (not e!385471))))

(assert (=> b!675822 (= res!442417 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19218 a!3626))))))

(declare-fun b!675823 () Bool)

(declare-fun res!442418 () Bool)

(assert (=> b!675823 (=> (not res!442418) (not e!385471))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39322 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!675823 (= res!442418 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!675824 () Bool)

(declare-fun e!385468 () Bool)

(declare-fun e!385472 () Bool)

(assert (=> b!675824 (= e!385468 e!385472)))

(declare-fun res!442404 () Bool)

(assert (=> b!675824 (=> (not res!442404) (not e!385472))))

(assert (=> b!675824 (= res!442404 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675825 () Bool)

(declare-fun res!442412 () Bool)

(assert (=> b!675825 (=> (not res!442412) (not e!385471))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!675825 (= res!442412 (not (validKeyInArray!0 (select (arr!18853 a!3626) from!3004))))))

(declare-fun b!675826 () Bool)

(declare-fun res!442415 () Bool)

(assert (=> b!675826 (=> (not res!442415) (not e!385471))))

(assert (=> b!675826 (= res!442415 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19218 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!675827 () Bool)

(declare-fun contains!3455 (List!12933 (_ BitVec 64)) Bool)

(assert (=> b!675827 (= e!385472 (not (contains!3455 acc!681 k!2843)))))

(declare-fun res!442411 () Bool)

(assert (=> start!60264 (=> (not res!442411) (not e!385471))))

(assert (=> start!60264 (= res!442411 (and (bvslt (size!19218 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19218 a!3626))))))

(assert (=> start!60264 e!385471))

(assert (=> start!60264 true))

(declare-fun array_inv!14736 (array!39322) Bool)

(assert (=> start!60264 (array_inv!14736 a!3626)))

(declare-fun b!675828 () Bool)

(declare-fun e!385466 () Bool)

(assert (=> b!675828 (= e!385466 (contains!3455 acc!681 k!2843))))

(declare-fun b!675829 () Bool)

(declare-fun e!385465 () Bool)

(assert (=> b!675829 (= e!385465 (not (contains!3455 acc!681 k!2843)))))

(declare-fun b!675830 () Bool)

(assert (=> b!675830 (= e!385469 e!385465)))

(declare-fun res!442410 () Bool)

(assert (=> b!675830 (=> (not res!442410) (not e!385465))))

(assert (=> b!675830 (= res!442410 (bvsle from!3004 i!1382))))

(declare-fun b!675831 () Bool)

(declare-fun res!442420 () Bool)

(assert (=> b!675831 (=> (not res!442420) (not e!385471))))

(assert (=> b!675831 (= res!442420 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!675832 () Bool)

(declare-fun res!442409 () Bool)

(assert (=> b!675832 (=> (not res!442409) (not e!385471))))

(assert (=> b!675832 (= res!442409 (validKeyInArray!0 k!2843))))

(declare-fun b!675833 () Bool)

(declare-fun res!442421 () Bool)

(assert (=> b!675833 (=> (not res!442421) (not e!385471))))

(assert (=> b!675833 (= res!442421 (not (contains!3455 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675834 () Bool)

(declare-fun res!442407 () Bool)

(assert (=> b!675834 (=> (not res!442407) (not e!385471))))

(assert (=> b!675834 (= res!442407 e!385468)))

(declare-fun res!442416 () Bool)

(assert (=> b!675834 (=> res!442416 e!385468)))

(assert (=> b!675834 (= res!442416 e!385466)))

(declare-fun res!442408 () Bool)

(assert (=> b!675834 (=> (not res!442408) (not e!385466))))

(assert (=> b!675834 (= res!442408 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675835 () Bool)

(assert (=> b!675835 (= e!385467 (contains!3455 acc!681 k!2843))))

(declare-fun b!675836 () Bool)

(declare-fun res!442405 () Bool)

(assert (=> b!675836 (=> (not res!442405) (not e!385471))))

(assert (=> b!675836 (= res!442405 (not (contains!3455 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675837 () Bool)

(assert (=> b!675837 (= e!385471 false)))

(declare-fun lt!312504 () Bool)

(assert (=> b!675837 (= lt!312504 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(assert (= (and start!60264 res!442411) b!675821))

(assert (= (and b!675821 res!442414) b!675836))

(assert (= (and b!675836 res!442405) b!675833))

(assert (= (and b!675833 res!442421) b!675818))

(assert (= (and b!675818 res!442419) b!675835))

(assert (= (and b!675818 (not res!442423)) b!675830))

(assert (= (and b!675830 res!442410) b!675829))

(assert (= (and b!675818 res!442413) b!675820))

(assert (= (and b!675820 res!442422) b!675831))

(assert (= (and b!675831 res!442420) b!675822))

(assert (= (and b!675822 res!442417) b!675832))

(assert (= (and b!675832 res!442409) b!675823))

(assert (= (and b!675823 res!442418) b!675826))

(assert (= (and b!675826 res!442415) b!675825))

(assert (= (and b!675825 res!442412) b!675819))

(assert (= (and b!675819 res!442406) b!675834))

(assert (= (and b!675834 res!442408) b!675828))

(assert (= (and b!675834 (not res!442416)) b!675824))

(assert (= (and b!675824 res!442404) b!675827))

(assert (= (and b!675834 res!442407) b!675837))

(declare-fun m!642381 () Bool)

(assert (=> b!675820 m!642381))

(declare-fun m!642383 () Bool)

(assert (=> b!675836 m!642383))

(declare-fun m!642385 () Bool)

(assert (=> b!675821 m!642385))

(declare-fun m!642387 () Bool)

(assert (=> b!675825 m!642387))

(assert (=> b!675825 m!642387))

(declare-fun m!642389 () Bool)

(assert (=> b!675825 m!642389))

(declare-fun m!642391 () Bool)

(assert (=> b!675823 m!642391))

(declare-fun m!642393 () Bool)

(assert (=> b!675832 m!642393))

(declare-fun m!642395 () Bool)

(assert (=> b!675827 m!642395))

(assert (=> b!675828 m!642395))

(assert (=> b!675829 m!642395))

(assert (=> b!675835 m!642395))

(declare-fun m!642397 () Bool)

(assert (=> b!675837 m!642397))

(declare-fun m!642399 () Bool)

(assert (=> start!60264 m!642399))

(declare-fun m!642401 () Bool)

(assert (=> b!675831 m!642401))

(declare-fun m!642403 () Bool)

(assert (=> b!675833 m!642403))

(push 1)

(assert (not b!675828))

(assert (not b!675835))

(assert (not b!675820))

(assert (not b!675836))

(assert (not b!675823))

(assert (not b!675821))

(assert (not b!675825))

(assert (not b!675829))

(assert (not b!675837))

(assert (not b!675832))

(assert (not b!675827))

(assert (not start!60264))

(assert (not b!675833))

(assert (not b!675831))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

