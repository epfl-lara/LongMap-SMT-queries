; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60332 () Bool)

(assert start!60332)

(declare-fun b!677710 () Bool)

(declare-fun e!386223 () Bool)

(assert (=> b!677710 (= e!386223 false)))

(declare-datatypes ((array!39390 0))(
  ( (array!39391 (arr!18887 (Array (_ BitVec 32) (_ BitVec 64))) (size!19252 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39390)

(declare-fun lt!312597 () Bool)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12967 0))(
  ( (Nil!12964) (Cons!12963 (h!14008 (_ BitVec 64)) (t!19186 List!12967)) )
))
(declare-fun acc!681 () List!12967)

(declare-fun arrayNoDuplicates!0 (array!39390 (_ BitVec 32) List!12967) Bool)

(assert (=> b!677710 (= lt!312597 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!677711 () Bool)

(declare-fun e!386221 () Bool)

(declare-fun e!386224 () Bool)

(assert (=> b!677711 (= e!386221 e!386224)))

(declare-fun res!444301 () Bool)

(assert (=> b!677711 (=> (not res!444301) (not e!386224))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!677711 (= res!444301 (bvsle from!3004 i!1382))))

(declare-fun res!444304 () Bool)

(assert (=> start!60332 (=> (not res!444304) (not e!386223))))

(assert (=> start!60332 (= res!444304 (and (bvslt (size!19252 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19252 a!3626))))))

(assert (=> start!60332 e!386223))

(assert (=> start!60332 true))

(declare-fun array_inv!14770 (array!39390) Bool)

(assert (=> start!60332 (array_inv!14770 a!3626)))

(declare-fun b!677712 () Bool)

(declare-fun res!444302 () Bool)

(assert (=> b!677712 (=> (not res!444302) (not e!386223))))

(assert (=> b!677712 (= res!444302 e!386221)))

(declare-fun res!444298 () Bool)

(assert (=> b!677712 (=> res!444298 e!386221)))

(declare-fun e!386225 () Bool)

(assert (=> b!677712 (= res!444298 e!386225)))

(declare-fun res!444296 () Bool)

(assert (=> b!677712 (=> (not res!444296) (not e!386225))))

(assert (=> b!677712 (= res!444296 (bvsgt from!3004 i!1382))))

(declare-fun b!677713 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3489 (List!12967 (_ BitVec 64)) Bool)

(assert (=> b!677713 (= e!386225 (contains!3489 acc!681 k0!2843))))

(declare-fun b!677714 () Bool)

(declare-fun res!444297 () Bool)

(assert (=> b!677714 (=> (not res!444297) (not e!386223))))

(assert (=> b!677714 (= res!444297 (not (contains!3489 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677715 () Bool)

(declare-fun res!444300 () Bool)

(assert (=> b!677715 (=> (not res!444300) (not e!386223))))

(declare-fun noDuplicate!758 (List!12967) Bool)

(assert (=> b!677715 (= res!444300 (noDuplicate!758 acc!681))))

(declare-fun b!677716 () Bool)

(assert (=> b!677716 (= e!386224 (not (contains!3489 acc!681 k0!2843)))))

(declare-fun b!677717 () Bool)

(declare-fun res!444303 () Bool)

(assert (=> b!677717 (=> (not res!444303) (not e!386223))))

(assert (=> b!677717 (= res!444303 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12964))))

(declare-fun b!677718 () Bool)

(declare-fun res!444299 () Bool)

(assert (=> b!677718 (=> (not res!444299) (not e!386223))))

(assert (=> b!677718 (= res!444299 (not (contains!3489 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60332 res!444304) b!677715))

(assert (= (and b!677715 res!444300) b!677718))

(assert (= (and b!677718 res!444299) b!677714))

(assert (= (and b!677714 res!444297) b!677712))

(assert (= (and b!677712 res!444296) b!677713))

(assert (= (and b!677712 (not res!444298)) b!677711))

(assert (= (and b!677711 res!444301) b!677716))

(assert (= (and b!677712 res!444302) b!677717))

(assert (= (and b!677717 res!444303) b!677710))

(declare-fun m!643221 () Bool)

(assert (=> b!677715 m!643221))

(declare-fun m!643223 () Bool)

(assert (=> start!60332 m!643223))

(declare-fun m!643225 () Bool)

(assert (=> b!677714 m!643225))

(declare-fun m!643227 () Bool)

(assert (=> b!677716 m!643227))

(declare-fun m!643229 () Bool)

(assert (=> b!677718 m!643229))

(assert (=> b!677713 m!643227))

(declare-fun m!643231 () Bool)

(assert (=> b!677710 m!643231))

(declare-fun m!643233 () Bool)

(assert (=> b!677717 m!643233))

(check-sat (not b!677717) (not b!677710) (not start!60332) (not b!677718) (not b!677713) (not b!677715) (not b!677716) (not b!677714))
(check-sat)
