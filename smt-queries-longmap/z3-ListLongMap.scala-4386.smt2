; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60346 () Bool)

(assert start!60346)

(declare-fun res!444461 () Bool)

(declare-fun e!386430 () Bool)

(assert (=> start!60346 (=> (not res!444461) (not e!386430))))

(declare-datatypes ((array!39393 0))(
  ( (array!39394 (arr!18889 (Array (_ BitVec 32) (_ BitVec 64))) (size!19253 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39393)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60346 (= res!444461 (and (bvslt (size!19253 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19253 a!3626))))))

(assert (=> start!60346 e!386430))

(assert (=> start!60346 true))

(declare-fun array_inv!14685 (array!39393) Bool)

(assert (=> start!60346 (array_inv!14685 a!3626)))

(declare-fun b!678033 () Bool)

(declare-fun e!386426 () Bool)

(declare-datatypes ((List!12930 0))(
  ( (Nil!12927) (Cons!12926 (h!13971 (_ BitVec 64)) (t!19158 List!12930)) )
))
(declare-fun acc!681 () List!12930)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3507 (List!12930 (_ BitVec 64)) Bool)

(assert (=> b!678033 (= e!386426 (contains!3507 acc!681 k0!2843))))

(declare-fun b!678034 () Bool)

(declare-fun res!444466 () Bool)

(assert (=> b!678034 (=> (not res!444466) (not e!386430))))

(declare-fun arrayNoDuplicates!0 (array!39393 (_ BitVec 32) List!12930) Bool)

(assert (=> b!678034 (= res!444466 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12927))))

(declare-fun b!678035 () Bool)

(declare-fun res!444465 () Bool)

(assert (=> b!678035 (=> (not res!444465) (not e!386430))))

(assert (=> b!678035 (= res!444465 (not (contains!3507 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678036 () Bool)

(assert (=> b!678036 (= e!386430 false)))

(declare-fun lt!312856 () Bool)

(assert (=> b!678036 (= lt!312856 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678037 () Bool)

(declare-fun res!444462 () Bool)

(assert (=> b!678037 (=> (not res!444462) (not e!386430))))

(assert (=> b!678037 (= res!444462 (not (contains!3507 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678038 () Bool)

(declare-fun res!444464 () Bool)

(assert (=> b!678038 (=> (not res!444464) (not e!386430))))

(declare-fun noDuplicate!754 (List!12930) Bool)

(assert (=> b!678038 (= res!444464 (noDuplicate!754 acc!681))))

(declare-fun b!678039 () Bool)

(declare-fun e!386427 () Bool)

(assert (=> b!678039 (= e!386427 (not (contains!3507 acc!681 k0!2843)))))

(declare-fun b!678040 () Bool)

(declare-fun res!444467 () Bool)

(assert (=> b!678040 (=> (not res!444467) (not e!386430))))

(declare-fun e!386428 () Bool)

(assert (=> b!678040 (= res!444467 e!386428)))

(declare-fun res!444460 () Bool)

(assert (=> b!678040 (=> res!444460 e!386428)))

(assert (=> b!678040 (= res!444460 e!386426)))

(declare-fun res!444459 () Bool)

(assert (=> b!678040 (=> (not res!444459) (not e!386426))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!678040 (= res!444459 (bvsgt from!3004 i!1382))))

(declare-fun b!678041 () Bool)

(assert (=> b!678041 (= e!386428 e!386427)))

(declare-fun res!444463 () Bool)

(assert (=> b!678041 (=> (not res!444463) (not e!386427))))

(assert (=> b!678041 (= res!444463 (bvsle from!3004 i!1382))))

(assert (= (and start!60346 res!444461) b!678038))

(assert (= (and b!678038 res!444464) b!678035))

(assert (= (and b!678035 res!444465) b!678037))

(assert (= (and b!678037 res!444462) b!678040))

(assert (= (and b!678040 res!444459) b!678033))

(assert (= (and b!678040 (not res!444460)) b!678041))

(assert (= (and b!678041 res!444463) b!678039))

(assert (= (and b!678040 res!444467) b!678034))

(assert (= (and b!678034 res!444466) b!678036))

(declare-fun m!644017 () Bool)

(assert (=> b!678037 m!644017))

(declare-fun m!644019 () Bool)

(assert (=> b!678038 m!644019))

(declare-fun m!644021 () Bool)

(assert (=> b!678034 m!644021))

(declare-fun m!644023 () Bool)

(assert (=> b!678036 m!644023))

(declare-fun m!644025 () Bool)

(assert (=> start!60346 m!644025))

(declare-fun m!644027 () Bool)

(assert (=> b!678033 m!644027))

(assert (=> b!678039 m!644027))

(declare-fun m!644029 () Bool)

(assert (=> b!678035 m!644029))

(check-sat (not start!60346) (not b!678037) (not b!678034) (not b!678036) (not b!678033) (not b!678039) (not b!678035) (not b!678038))
(check-sat)
