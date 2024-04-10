; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60304 () Bool)

(assert start!60304)

(declare-fun b!676954 () Bool)

(declare-fun res!443398 () Bool)

(declare-fun e!385995 () Bool)

(assert (=> b!676954 (=> (not res!443398) (not e!385995))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!676954 (= res!443398 (validKeyInArray!0 k0!2843))))

(declare-fun b!676955 () Bool)

(declare-fun res!443394 () Bool)

(assert (=> b!676955 (=> (not res!443394) (not e!385995))))

(declare-datatypes ((List!12909 0))(
  ( (Nil!12906) (Cons!12905 (h!13950 (_ BitVec 64)) (t!19137 List!12909)) )
))
(declare-fun acc!681 () List!12909)

(declare-fun contains!3486 (List!12909 (_ BitVec 64)) Bool)

(assert (=> b!676955 (= res!443394 (not (contains!3486 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676956 () Bool)

(declare-fun res!443380 () Bool)

(assert (=> b!676956 (=> (not res!443380) (not e!385995))))

(declare-datatypes ((array!39351 0))(
  ( (array!39352 (arr!18868 (Array (_ BitVec 32) (_ BitVec 64))) (size!19232 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39351)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!676956 (= res!443380 (not (validKeyInArray!0 (select (arr!18868 a!3626) from!3004))))))

(declare-fun b!676957 () Bool)

(declare-fun e!385991 () Bool)

(assert (=> b!676957 (= e!385991 (not (contains!3486 acc!681 k0!2843)))))

(declare-fun b!676958 () Bool)

(declare-fun res!443388 () Bool)

(assert (=> b!676958 (=> (not res!443388) (not e!385995))))

(assert (=> b!676958 (= res!443388 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!676959 () Bool)

(declare-fun e!385997 () Bool)

(assert (=> b!676959 (= e!385997 e!385991)))

(declare-fun res!443397 () Bool)

(assert (=> b!676959 (=> (not res!443397) (not e!385991))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!676959 (= res!443397 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun res!443381 () Bool)

(assert (=> start!60304 (=> (not res!443381) (not e!385995))))

(assert (=> start!60304 (= res!443381 (and (bvslt (size!19232 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19232 a!3626))))))

(assert (=> start!60304 e!385995))

(assert (=> start!60304 true))

(declare-fun array_inv!14664 (array!39351) Bool)

(assert (=> start!60304 (array_inv!14664 a!3626)))

(declare-fun b!676960 () Bool)

(declare-fun e!385992 () Bool)

(declare-fun e!385994 () Bool)

(assert (=> b!676960 (= e!385992 e!385994)))

(declare-fun res!443395 () Bool)

(assert (=> b!676960 (=> (not res!443395) (not e!385994))))

(assert (=> b!676960 (= res!443395 (bvsle from!3004 i!1382))))

(declare-fun b!676961 () Bool)

(declare-fun res!443393 () Bool)

(assert (=> b!676961 (=> (not res!443393) (not e!385995))))

(assert (=> b!676961 (= res!443393 e!385997)))

(declare-fun res!443382 () Bool)

(assert (=> b!676961 (=> res!443382 e!385997)))

(declare-fun e!385996 () Bool)

(assert (=> b!676961 (= res!443382 e!385996)))

(declare-fun res!443386 () Bool)

(assert (=> b!676961 (=> (not res!443386) (not e!385996))))

(assert (=> b!676961 (= res!443386 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676962 () Bool)

(declare-fun res!443384 () Bool)

(assert (=> b!676962 (=> (not res!443384) (not e!385995))))

(assert (=> b!676962 (= res!443384 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19232 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!676963 () Bool)

(assert (=> b!676963 (= e!385995 false)))

(declare-fun lt!312802 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39351 (_ BitVec 32) List!12909) Bool)

(assert (=> b!676963 (= lt!312802 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!676964 () Bool)

(declare-fun res!443390 () Bool)

(assert (=> b!676964 (=> (not res!443390) (not e!385995))))

(declare-fun arrayContainsKey!0 (array!39351 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!676964 (= res!443390 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!676965 () Bool)

(declare-fun e!385998 () Bool)

(assert (=> b!676965 (= e!385998 (contains!3486 acc!681 k0!2843))))

(declare-fun b!676966 () Bool)

(declare-fun res!443387 () Bool)

(assert (=> b!676966 (=> (not res!443387) (not e!385995))))

(assert (=> b!676966 (= res!443387 (not (contains!3486 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676967 () Bool)

(assert (=> b!676967 (= e!385996 (contains!3486 acc!681 k0!2843))))

(declare-fun b!676968 () Bool)

(assert (=> b!676968 (= e!385994 (not (contains!3486 acc!681 k0!2843)))))

(declare-fun b!676969 () Bool)

(declare-fun res!443383 () Bool)

(assert (=> b!676969 (=> (not res!443383) (not e!385995))))

(declare-fun noDuplicate!733 (List!12909) Bool)

(assert (=> b!676969 (= res!443383 (noDuplicate!733 acc!681))))

(declare-fun b!676970 () Bool)

(declare-fun res!443399 () Bool)

(assert (=> b!676970 (=> (not res!443399) (not e!385995))))

(assert (=> b!676970 (= res!443399 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!676971 () Bool)

(declare-fun res!443392 () Bool)

(assert (=> b!676971 (=> (not res!443392) (not e!385995))))

(assert (=> b!676971 (= res!443392 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19232 a!3626))))))

(declare-fun b!676972 () Bool)

(declare-fun res!443396 () Bool)

(assert (=> b!676972 (=> (not res!443396) (not e!385995))))

(assert (=> b!676972 (= res!443396 e!385992)))

(declare-fun res!443389 () Bool)

(assert (=> b!676972 (=> res!443389 e!385992)))

(assert (=> b!676972 (= res!443389 e!385998)))

(declare-fun res!443385 () Bool)

(assert (=> b!676972 (=> (not res!443385) (not e!385998))))

(assert (=> b!676972 (= res!443385 (bvsgt from!3004 i!1382))))

(declare-fun b!676973 () Bool)

(declare-fun res!443391 () Bool)

(assert (=> b!676973 (=> (not res!443391) (not e!385995))))

(assert (=> b!676973 (= res!443391 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12906))))

(assert (= (and start!60304 res!443381) b!676969))

(assert (= (and b!676969 res!443383) b!676966))

(assert (= (and b!676966 res!443387) b!676955))

(assert (= (and b!676955 res!443394) b!676972))

(assert (= (and b!676972 res!443385) b!676965))

(assert (= (and b!676972 (not res!443389)) b!676960))

(assert (= (and b!676960 res!443395) b!676968))

(assert (= (and b!676972 res!443396) b!676973))

(assert (= (and b!676973 res!443391) b!676970))

(assert (= (and b!676970 res!443399) b!676971))

(assert (= (and b!676971 res!443392) b!676954))

(assert (= (and b!676954 res!443398) b!676964))

(assert (= (and b!676964 res!443390) b!676962))

(assert (= (and b!676962 res!443384) b!676956))

(assert (= (and b!676956 res!443380) b!676958))

(assert (= (and b!676958 res!443388) b!676961))

(assert (= (and b!676961 res!443386) b!676967))

(assert (= (and b!676961 (not res!443382)) b!676959))

(assert (= (and b!676959 res!443397) b!676957))

(assert (= (and b!676961 res!443393) b!676963))

(declare-fun m!643499 () Bool)

(assert (=> b!676956 m!643499))

(assert (=> b!676956 m!643499))

(declare-fun m!643501 () Bool)

(assert (=> b!676956 m!643501))

(declare-fun m!643503 () Bool)

(assert (=> b!676955 m!643503))

(declare-fun m!643505 () Bool)

(assert (=> b!676967 m!643505))

(assert (=> b!676968 m!643505))

(assert (=> b!676965 m!643505))

(declare-fun m!643507 () Bool)

(assert (=> b!676969 m!643507))

(declare-fun m!643509 () Bool)

(assert (=> b!676964 m!643509))

(declare-fun m!643511 () Bool)

(assert (=> b!676954 m!643511))

(declare-fun m!643513 () Bool)

(assert (=> start!60304 m!643513))

(declare-fun m!643515 () Bool)

(assert (=> b!676963 m!643515))

(declare-fun m!643517 () Bool)

(assert (=> b!676973 m!643517))

(assert (=> b!676957 m!643505))

(declare-fun m!643519 () Bool)

(assert (=> b!676970 m!643519))

(declare-fun m!643521 () Bool)

(assert (=> b!676966 m!643521))

(check-sat (not b!676970) (not b!676963) (not start!60304) (not b!676966) (not b!676955) (not b!676956) (not b!676954) (not b!676965) (not b!676968) (not b!676957) (not b!676969) (not b!676967) (not b!676973) (not b!676964))
(check-sat)
