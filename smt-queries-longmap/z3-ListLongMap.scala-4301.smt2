; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59836 () Bool)

(assert start!59836)

(declare-fun b!661300 () Bool)

(declare-fun e!379893 () Bool)

(declare-fun e!379895 () Bool)

(assert (=> b!661300 (= e!379893 e!379895)))

(declare-fun res!429372 () Bool)

(assert (=> b!661300 (=> (not res!429372) (not e!379895))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!661300 (= res!429372 (bvsle from!3004 i!1382))))

(declare-fun b!661301 () Bool)

(declare-fun res!429375 () Bool)

(declare-fun e!379892 () Bool)

(assert (=> b!661301 (=> (not res!429375) (not e!379892))))

(declare-datatypes ((array!38883 0))(
  ( (array!38884 (arr!18634 (Array (_ BitVec 32) (_ BitVec 64))) (size!18998 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38883)

(declare-datatypes ((List!12675 0))(
  ( (Nil!12672) (Cons!12671 (h!13716 (_ BitVec 64)) (t!18903 List!12675)) )
))
(declare-fun acc!681 () List!12675)

(declare-fun arrayNoDuplicates!0 (array!38883 (_ BitVec 32) List!12675) Bool)

(assert (=> b!661301 (= res!429375 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!661302 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3252 (List!12675 (_ BitVec 64)) Bool)

(assert (=> b!661302 (= e!379895 (not (contains!3252 acc!681 k0!2843)))))

(declare-fun b!661303 () Bool)

(declare-fun res!429371 () Bool)

(assert (=> b!661303 (=> (not res!429371) (not e!379892))))

(assert (=> b!661303 (= res!429371 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!18998 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!661304 () Bool)

(declare-fun e!379894 () Bool)

(assert (=> b!661304 (= e!379894 (contains!3252 acc!681 k0!2843))))

(declare-fun b!661305 () Bool)

(declare-fun res!429369 () Bool)

(assert (=> b!661305 (=> (not res!429369) (not e!379892))))

(assert (=> b!661305 (= res!429369 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12672))))

(declare-fun b!661306 () Bool)

(declare-fun res!429370 () Bool)

(assert (=> b!661306 (=> (not res!429370) (not e!379892))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!661306 (= res!429370 (validKeyInArray!0 k0!2843))))

(declare-fun b!661307 () Bool)

(assert (=> b!661307 (= e!379892 (not true))))

(declare-fun arrayContainsKey!0 (array!38883 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!661307 (arrayContainsKey!0 (array!38884 (store (arr!18634 a!3626) i!1382 k0!2843) (size!18998 a!3626)) k0!2843 from!3004)))

(declare-fun res!429377 () Bool)

(assert (=> start!59836 (=> (not res!429377) (not e!379892))))

(assert (=> start!59836 (= res!429377 (and (bvslt (size!18998 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18998 a!3626))))))

(assert (=> start!59836 e!379892))

(assert (=> start!59836 true))

(declare-fun array_inv!14430 (array!38883) Bool)

(assert (=> start!59836 (array_inv!14430 a!3626)))

(declare-fun b!661308 () Bool)

(declare-fun res!429376 () Bool)

(assert (=> b!661308 (=> (not res!429376) (not e!379892))))

(declare-fun noDuplicate!499 (List!12675) Bool)

(assert (=> b!661308 (= res!429376 (noDuplicate!499 acc!681))))

(declare-fun b!661309 () Bool)

(declare-fun res!429373 () Bool)

(assert (=> b!661309 (=> (not res!429373) (not e!379892))))

(assert (=> b!661309 (= res!429373 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!661310 () Bool)

(declare-fun res!429365 () Bool)

(assert (=> b!661310 (=> (not res!429365) (not e!379892))))

(assert (=> b!661310 (= res!429365 (not (contains!3252 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661311 () Bool)

(declare-fun res!429367 () Bool)

(assert (=> b!661311 (=> (not res!429367) (not e!379892))))

(assert (=> b!661311 (= res!429367 e!379893)))

(declare-fun res!429374 () Bool)

(assert (=> b!661311 (=> res!429374 e!379893)))

(assert (=> b!661311 (= res!429374 e!379894)))

(declare-fun res!429366 () Bool)

(assert (=> b!661311 (=> (not res!429366) (not e!379894))))

(assert (=> b!661311 (= res!429366 (bvsgt from!3004 i!1382))))

(declare-fun b!661312 () Bool)

(declare-fun res!429364 () Bool)

(assert (=> b!661312 (=> (not res!429364) (not e!379892))))

(assert (=> b!661312 (= res!429364 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!18998 a!3626))))))

(declare-fun b!661313 () Bool)

(declare-fun res!429368 () Bool)

(assert (=> b!661313 (=> (not res!429368) (not e!379892))))

(assert (=> b!661313 (= res!429368 (not (contains!3252 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59836 res!429377) b!661308))

(assert (= (and b!661308 res!429376) b!661310))

(assert (= (and b!661310 res!429365) b!661313))

(assert (= (and b!661313 res!429368) b!661311))

(assert (= (and b!661311 res!429366) b!661304))

(assert (= (and b!661311 (not res!429374)) b!661300))

(assert (= (and b!661300 res!429372) b!661302))

(assert (= (and b!661311 res!429367) b!661305))

(assert (= (and b!661305 res!429369) b!661301))

(assert (= (and b!661301 res!429375) b!661312))

(assert (= (and b!661312 res!429364) b!661306))

(assert (= (and b!661306 res!429370) b!661309))

(assert (= (and b!661309 res!429373) b!661303))

(assert (= (and b!661303 res!429371) b!661307))

(declare-fun m!633555 () Bool)

(assert (=> b!661313 m!633555))

(declare-fun m!633557 () Bool)

(assert (=> b!661308 m!633557))

(declare-fun m!633559 () Bool)

(assert (=> b!661306 m!633559))

(declare-fun m!633561 () Bool)

(assert (=> b!661304 m!633561))

(declare-fun m!633563 () Bool)

(assert (=> b!661301 m!633563))

(declare-fun m!633565 () Bool)

(assert (=> b!661309 m!633565))

(declare-fun m!633567 () Bool)

(assert (=> b!661307 m!633567))

(declare-fun m!633569 () Bool)

(assert (=> b!661307 m!633569))

(assert (=> b!661302 m!633561))

(declare-fun m!633571 () Bool)

(assert (=> start!59836 m!633571))

(declare-fun m!633573 () Bool)

(assert (=> b!661310 m!633573))

(declare-fun m!633575 () Bool)

(assert (=> b!661305 m!633575))

(check-sat (not b!661304) (not b!661313) (not b!661308) (not b!661301) (not b!661307) (not b!661306) (not start!59836) (not b!661310) (not b!661305) (not b!661302) (not b!661309))
