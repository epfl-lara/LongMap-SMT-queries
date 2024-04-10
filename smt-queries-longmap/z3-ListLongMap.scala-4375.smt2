; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60280 () Bool)

(assert start!60280)

(declare-fun b!676234 () Bool)

(declare-fun e!385704 () Bool)

(declare-datatypes ((List!12897 0))(
  ( (Nil!12894) (Cons!12893 (h!13938 (_ BitVec 64)) (t!19125 List!12897)) )
))
(declare-fun acc!681 () List!12897)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3474 (List!12897 (_ BitVec 64)) Bool)

(assert (=> b!676234 (= e!385704 (not (contains!3474 acc!681 k0!2843)))))

(declare-fun res!442673 () Bool)

(declare-fun e!385705 () Bool)

(assert (=> start!60280 (=> (not res!442673) (not e!385705))))

(declare-datatypes ((array!39327 0))(
  ( (array!39328 (arr!18856 (Array (_ BitVec 32) (_ BitVec 64))) (size!19220 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39327)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60280 (= res!442673 (and (bvslt (size!19220 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19220 a!3626))))))

(assert (=> start!60280 e!385705))

(assert (=> start!60280 true))

(declare-fun array_inv!14652 (array!39327) Bool)

(assert (=> start!60280 (array_inv!14652 a!3626)))

(declare-fun b!676235 () Bool)

(declare-fun e!385707 () Bool)

(assert (=> b!676235 (= e!385707 (contains!3474 acc!681 k0!2843))))

(declare-fun b!676236 () Bool)

(declare-fun res!442661 () Bool)

(assert (=> b!676236 (=> (not res!442661) (not e!385705))))

(assert (=> b!676236 (= res!442661 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!676237 () Bool)

(declare-fun res!442660 () Bool)

(assert (=> b!676237 (=> (not res!442660) (not e!385705))))

(assert (=> b!676237 (= res!442660 (not (contains!3474 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676238 () Bool)

(assert (=> b!676238 (= e!385705 false)))

(declare-fun lt!312766 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39327 (_ BitVec 32) List!12897) Bool)

(assert (=> b!676238 (= lt!312766 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!676239 () Bool)

(declare-fun res!442666 () Bool)

(assert (=> b!676239 (=> (not res!442666) (not e!385705))))

(declare-fun arrayContainsKey!0 (array!39327 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!676239 (= res!442666 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!676240 () Bool)

(declare-fun res!442662 () Bool)

(assert (=> b!676240 (=> (not res!442662) (not e!385705))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!676240 (= res!442662 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19220 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!676241 () Bool)

(declare-fun e!385706 () Bool)

(assert (=> b!676241 (= e!385706 (not (contains!3474 acc!681 k0!2843)))))

(declare-fun b!676242 () Bool)

(declare-fun res!442679 () Bool)

(assert (=> b!676242 (=> (not res!442679) (not e!385705))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!676242 (= res!442679 (not (validKeyInArray!0 (select (arr!18856 a!3626) from!3004))))))

(declare-fun b!676243 () Bool)

(declare-fun res!442663 () Bool)

(assert (=> b!676243 (=> (not res!442663) (not e!385705))))

(assert (=> b!676243 (= res!442663 (validKeyInArray!0 k0!2843))))

(declare-fun b!676244 () Bool)

(declare-fun res!442677 () Bool)

(assert (=> b!676244 (=> (not res!442677) (not e!385705))))

(declare-fun e!385703 () Bool)

(assert (=> b!676244 (= res!442677 e!385703)))

(declare-fun res!442668 () Bool)

(assert (=> b!676244 (=> res!442668 e!385703)))

(assert (=> b!676244 (= res!442668 e!385707)))

(declare-fun res!442676 () Bool)

(assert (=> b!676244 (=> (not res!442676) (not e!385707))))

(assert (=> b!676244 (= res!442676 (bvsgt from!3004 i!1382))))

(declare-fun b!676245 () Bool)

(declare-fun res!442669 () Bool)

(assert (=> b!676245 (=> (not res!442669) (not e!385705))))

(declare-fun noDuplicate!721 (List!12897) Bool)

(assert (=> b!676245 (= res!442669 (noDuplicate!721 acc!681))))

(declare-fun b!676246 () Bool)

(assert (=> b!676246 (= e!385703 e!385706)))

(declare-fun res!442675 () Bool)

(assert (=> b!676246 (=> (not res!442675) (not e!385706))))

(assert (=> b!676246 (= res!442675 (bvsle from!3004 i!1382))))

(declare-fun b!676247 () Bool)

(declare-fun e!385709 () Bool)

(assert (=> b!676247 (= e!385709 (contains!3474 acc!681 k0!2843))))

(declare-fun b!676248 () Bool)

(declare-fun e!385708 () Bool)

(assert (=> b!676248 (= e!385708 e!385704)))

(declare-fun res!442665 () Bool)

(assert (=> b!676248 (=> (not res!442665) (not e!385704))))

(assert (=> b!676248 (= res!442665 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676249 () Bool)

(declare-fun res!442670 () Bool)

(assert (=> b!676249 (=> (not res!442670) (not e!385705))))

(assert (=> b!676249 (= res!442670 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!676250 () Bool)

(declare-fun res!442664 () Bool)

(assert (=> b!676250 (=> (not res!442664) (not e!385705))))

(assert (=> b!676250 (= res!442664 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19220 a!3626))))))

(declare-fun b!676251 () Bool)

(declare-fun res!442678 () Bool)

(assert (=> b!676251 (=> (not res!442678) (not e!385705))))

(assert (=> b!676251 (= res!442678 (not (contains!3474 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676252 () Bool)

(declare-fun res!442674 () Bool)

(assert (=> b!676252 (=> (not res!442674) (not e!385705))))

(assert (=> b!676252 (= res!442674 e!385708)))

(declare-fun res!442671 () Bool)

(assert (=> b!676252 (=> res!442671 e!385708)))

(assert (=> b!676252 (= res!442671 e!385709)))

(declare-fun res!442672 () Bool)

(assert (=> b!676252 (=> (not res!442672) (not e!385709))))

(assert (=> b!676252 (= res!442672 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676253 () Bool)

(declare-fun res!442667 () Bool)

(assert (=> b!676253 (=> (not res!442667) (not e!385705))))

(assert (=> b!676253 (= res!442667 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12894))))

(assert (= (and start!60280 res!442673) b!676245))

(assert (= (and b!676245 res!442669) b!676251))

(assert (= (and b!676251 res!442678) b!676237))

(assert (= (and b!676237 res!442660) b!676244))

(assert (= (and b!676244 res!442676) b!676235))

(assert (= (and b!676244 (not res!442668)) b!676246))

(assert (= (and b!676246 res!442675) b!676241))

(assert (= (and b!676244 res!442677) b!676253))

(assert (= (and b!676253 res!442667) b!676249))

(assert (= (and b!676249 res!442670) b!676250))

(assert (= (and b!676250 res!442664) b!676243))

(assert (= (and b!676243 res!442663) b!676239))

(assert (= (and b!676239 res!442666) b!676240))

(assert (= (and b!676240 res!442662) b!676242))

(assert (= (and b!676242 res!442679) b!676236))

(assert (= (and b!676236 res!442661) b!676252))

(assert (= (and b!676252 res!442672) b!676247))

(assert (= (and b!676252 (not res!442671)) b!676248))

(assert (= (and b!676248 res!442665) b!676234))

(assert (= (and b!676252 res!442674) b!676238))

(declare-fun m!643211 () Bool)

(assert (=> b!676242 m!643211))

(assert (=> b!676242 m!643211))

(declare-fun m!643213 () Bool)

(assert (=> b!676242 m!643213))

(declare-fun m!643215 () Bool)

(assert (=> b!676243 m!643215))

(declare-fun m!643217 () Bool)

(assert (=> b!676239 m!643217))

(declare-fun m!643219 () Bool)

(assert (=> b!676247 m!643219))

(assert (=> b!676235 m!643219))

(declare-fun m!643221 () Bool)

(assert (=> start!60280 m!643221))

(declare-fun m!643223 () Bool)

(assert (=> b!676238 m!643223))

(assert (=> b!676241 m!643219))

(assert (=> b!676234 m!643219))

(declare-fun m!643225 () Bool)

(assert (=> b!676251 m!643225))

(declare-fun m!643227 () Bool)

(assert (=> b!676249 m!643227))

(declare-fun m!643229 () Bool)

(assert (=> b!676245 m!643229))

(declare-fun m!643231 () Bool)

(assert (=> b!676237 m!643231))

(declare-fun m!643233 () Bool)

(assert (=> b!676253 m!643233))

(check-sat (not start!60280) (not b!676239) (not b!676238) (not b!676247) (not b!676242) (not b!676241) (not b!676237) (not b!676251) (not b!676249) (not b!676234) (not b!676243) (not b!676245) (not b!676253) (not b!676235))
