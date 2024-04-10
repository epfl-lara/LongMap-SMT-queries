; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60282 () Bool)

(assert start!60282)

(declare-fun b!676294 () Bool)

(declare-fun e!385733 () Bool)

(declare-datatypes ((List!12898 0))(
  ( (Nil!12895) (Cons!12894 (h!13939 (_ BitVec 64)) (t!19126 List!12898)) )
))
(declare-fun acc!681 () List!12898)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3475 (List!12898 (_ BitVec 64)) Bool)

(assert (=> b!676294 (= e!385733 (contains!3475 acc!681 k!2843))))

(declare-fun b!676295 () Bool)

(declare-fun e!385730 () Bool)

(assert (=> b!676295 (= e!385730 false)))

(declare-fun lt!312769 () Bool)

(declare-datatypes ((array!39329 0))(
  ( (array!39330 (arr!18857 (Array (_ BitVec 32) (_ BitVec 64))) (size!19221 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39329)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39329 (_ BitVec 32) List!12898) Bool)

(assert (=> b!676295 (= lt!312769 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!676296 () Bool)

(declare-fun e!385728 () Bool)

(assert (=> b!676296 (= e!385728 (not (contains!3475 acc!681 k!2843)))))

(declare-fun b!676297 () Bool)

(declare-fun res!442737 () Bool)

(assert (=> b!676297 (=> (not res!442737) (not e!385730))))

(assert (=> b!676297 (= res!442737 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!676298 () Bool)

(declare-fun res!442727 () Bool)

(assert (=> b!676298 (=> (not res!442727) (not e!385730))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!676298 (= res!442727 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19221 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!676300 () Bool)

(declare-fun res!442725 () Bool)

(assert (=> b!676300 (=> (not res!442725) (not e!385730))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!676300 (= res!442725 (validKeyInArray!0 k!2843))))

(declare-fun b!676301 () Bool)

(declare-fun res!442721 () Bool)

(assert (=> b!676301 (=> (not res!442721) (not e!385730))))

(assert (=> b!676301 (= res!442721 (not (contains!3475 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676302 () Bool)

(declare-fun res!442732 () Bool)

(assert (=> b!676302 (=> (not res!442732) (not e!385730))))

(assert (=> b!676302 (= res!442732 (not (contains!3475 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676303 () Bool)

(declare-fun res!442739 () Bool)

(assert (=> b!676303 (=> (not res!442739) (not e!385730))))

(declare-fun arrayContainsKey!0 (array!39329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!676303 (= res!442739 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!676304 () Bool)

(declare-fun res!442726 () Bool)

(assert (=> b!676304 (=> (not res!442726) (not e!385730))))

(declare-fun e!385729 () Bool)

(assert (=> b!676304 (= res!442726 e!385729)))

(declare-fun res!442720 () Bool)

(assert (=> b!676304 (=> res!442720 e!385729)))

(declare-fun e!385732 () Bool)

(assert (=> b!676304 (= res!442720 e!385732)))

(declare-fun res!442728 () Bool)

(assert (=> b!676304 (=> (not res!442728) (not e!385732))))

(assert (=> b!676304 (= res!442728 (bvsgt from!3004 i!1382))))

(declare-fun b!676305 () Bool)

(declare-fun res!442730 () Bool)

(assert (=> b!676305 (=> (not res!442730) (not e!385730))))

(declare-fun noDuplicate!722 (List!12898) Bool)

(assert (=> b!676305 (= res!442730 (noDuplicate!722 acc!681))))

(declare-fun b!676306 () Bool)

(assert (=> b!676306 (= e!385732 (contains!3475 acc!681 k!2843))))

(declare-fun b!676307 () Bool)

(assert (=> b!676307 (= e!385729 e!385728)))

(declare-fun res!442733 () Bool)

(assert (=> b!676307 (=> (not res!442733) (not e!385728))))

(assert (=> b!676307 (= res!442733 (bvsle from!3004 i!1382))))

(declare-fun res!442723 () Bool)

(assert (=> start!60282 (=> (not res!442723) (not e!385730))))

(assert (=> start!60282 (= res!442723 (and (bvslt (size!19221 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19221 a!3626))))))

(assert (=> start!60282 e!385730))

(assert (=> start!60282 true))

(declare-fun array_inv!14653 (array!39329) Bool)

(assert (=> start!60282 (array_inv!14653 a!3626)))

(declare-fun b!676299 () Bool)

(declare-fun res!442734 () Bool)

(assert (=> b!676299 (=> (not res!442734) (not e!385730))))

(assert (=> b!676299 (= res!442734 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!676308 () Bool)

(declare-fun res!442722 () Bool)

(assert (=> b!676308 (=> (not res!442722) (not e!385730))))

(declare-fun e!385731 () Bool)

(assert (=> b!676308 (= res!442722 e!385731)))

(declare-fun res!442735 () Bool)

(assert (=> b!676308 (=> res!442735 e!385731)))

(assert (=> b!676308 (= res!442735 e!385733)))

(declare-fun res!442738 () Bool)

(assert (=> b!676308 (=> (not res!442738) (not e!385733))))

(assert (=> b!676308 (= res!442738 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676309 () Bool)

(declare-fun e!385727 () Bool)

(assert (=> b!676309 (= e!385727 (not (contains!3475 acc!681 k!2843)))))

(declare-fun b!676310 () Bool)

(declare-fun res!442724 () Bool)

(assert (=> b!676310 (=> (not res!442724) (not e!385730))))

(assert (=> b!676310 (= res!442724 (not (validKeyInArray!0 (select (arr!18857 a!3626) from!3004))))))

(declare-fun b!676311 () Bool)

(declare-fun res!442729 () Bool)

(assert (=> b!676311 (=> (not res!442729) (not e!385730))))

(assert (=> b!676311 (= res!442729 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19221 a!3626))))))

(declare-fun b!676312 () Bool)

(assert (=> b!676312 (= e!385731 e!385727)))

(declare-fun res!442736 () Bool)

(assert (=> b!676312 (=> (not res!442736) (not e!385727))))

(assert (=> b!676312 (= res!442736 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676313 () Bool)

(declare-fun res!442731 () Bool)

(assert (=> b!676313 (=> (not res!442731) (not e!385730))))

(assert (=> b!676313 (= res!442731 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12895))))

(assert (= (and start!60282 res!442723) b!676305))

(assert (= (and b!676305 res!442730) b!676301))

(assert (= (and b!676301 res!442721) b!676302))

(assert (= (and b!676302 res!442732) b!676304))

(assert (= (and b!676304 res!442728) b!676306))

(assert (= (and b!676304 (not res!442720)) b!676307))

(assert (= (and b!676307 res!442733) b!676296))

(assert (= (and b!676304 res!442726) b!676313))

(assert (= (and b!676313 res!442731) b!676297))

(assert (= (and b!676297 res!442737) b!676311))

(assert (= (and b!676311 res!442729) b!676300))

(assert (= (and b!676300 res!442725) b!676303))

(assert (= (and b!676303 res!442739) b!676298))

(assert (= (and b!676298 res!442727) b!676310))

(assert (= (and b!676310 res!442724) b!676299))

(assert (= (and b!676299 res!442734) b!676308))

(assert (= (and b!676308 res!442738) b!676294))

(assert (= (and b!676308 (not res!442735)) b!676312))

(assert (= (and b!676312 res!442736) b!676309))

(assert (= (and b!676308 res!442722) b!676295))

(declare-fun m!643235 () Bool)

(assert (=> b!676309 m!643235))

(declare-fun m!643237 () Bool)

(assert (=> b!676310 m!643237))

(assert (=> b!676310 m!643237))

(declare-fun m!643239 () Bool)

(assert (=> b!676310 m!643239))

(declare-fun m!643241 () Bool)

(assert (=> start!60282 m!643241))

(assert (=> b!676306 m!643235))

(declare-fun m!643243 () Bool)

(assert (=> b!676303 m!643243))

(declare-fun m!643245 () Bool)

(assert (=> b!676297 m!643245))

(assert (=> b!676296 m!643235))

(declare-fun m!643247 () Bool)

(assert (=> b!676301 m!643247))

(declare-fun m!643249 () Bool)

(assert (=> b!676302 m!643249))

(assert (=> b!676294 m!643235))

(declare-fun m!643251 () Bool)

(assert (=> b!676305 m!643251))

(declare-fun m!643253 () Bool)

(assert (=> b!676295 m!643253))

(declare-fun m!643255 () Bool)

(assert (=> b!676313 m!643255))

(declare-fun m!643257 () Bool)

(assert (=> b!676300 m!643257))

(push 1)

(assert (not b!676301))

(assert (not b!676303))

(assert (not b!676300))

(assert (not b!676296))

(assert (not b!676309))

(assert (not start!60282))

(assert (not b!676297))

(assert (not b!676294))

(assert (not b!676310))

(assert (not b!676313))

(assert (not b!676302))

(assert (not b!676305))

(assert (not b!676306))

(assert (not b!676295))

