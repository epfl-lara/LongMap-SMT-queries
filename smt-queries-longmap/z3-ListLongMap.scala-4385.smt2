; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60340 () Bool)

(assert start!60340)

(declare-fun b!677952 () Bool)

(declare-fun e!386382 () Bool)

(declare-datatypes ((List!12927 0))(
  ( (Nil!12924) (Cons!12923 (h!13968 (_ BitVec 64)) (t!19155 List!12927)) )
))
(declare-fun acc!681 () List!12927)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3504 (List!12927 (_ BitVec 64)) Bool)

(assert (=> b!677952 (= e!386382 (contains!3504 acc!681 k0!2843))))

(declare-fun b!677953 () Bool)

(declare-fun res!444380 () Bool)

(declare-fun e!386384 () Bool)

(assert (=> b!677953 (=> (not res!444380) (not e!386384))))

(declare-fun e!386385 () Bool)

(assert (=> b!677953 (= res!444380 e!386385)))

(declare-fun res!444379 () Bool)

(assert (=> b!677953 (=> res!444379 e!386385)))

(assert (=> b!677953 (= res!444379 e!386382)))

(declare-fun res!444384 () Bool)

(assert (=> b!677953 (=> (not res!444384) (not e!386382))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!677953 (= res!444384 (bvsgt from!3004 i!1382))))

(declare-fun b!677954 () Bool)

(declare-fun res!444385 () Bool)

(assert (=> b!677954 (=> (not res!444385) (not e!386384))))

(assert (=> b!677954 (= res!444385 (not (contains!3504 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677955 () Bool)

(assert (=> b!677955 (= e!386384 false)))

(declare-datatypes ((array!39387 0))(
  ( (array!39388 (arr!18886 (Array (_ BitVec 32) (_ BitVec 64))) (size!19250 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39387)

(declare-fun lt!312847 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39387 (_ BitVec 32) List!12927) Bool)

(assert (=> b!677955 (= lt!312847 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!677956 () Bool)

(declare-fun res!444386 () Bool)

(assert (=> b!677956 (=> (not res!444386) (not e!386384))))

(assert (=> b!677956 (= res!444386 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12924))))

(declare-fun b!677957 () Bool)

(declare-fun res!444383 () Bool)

(assert (=> b!677957 (=> (not res!444383) (not e!386384))))

(assert (=> b!677957 (= res!444383 (not (contains!3504 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677959 () Bool)

(declare-fun e!386383 () Bool)

(assert (=> b!677959 (= e!386385 e!386383)))

(declare-fun res!444381 () Bool)

(assert (=> b!677959 (=> (not res!444381) (not e!386383))))

(assert (=> b!677959 (= res!444381 (bvsle from!3004 i!1382))))

(declare-fun b!677960 () Bool)

(declare-fun res!444378 () Bool)

(assert (=> b!677960 (=> (not res!444378) (not e!386384))))

(declare-fun noDuplicate!751 (List!12927) Bool)

(assert (=> b!677960 (= res!444378 (noDuplicate!751 acc!681))))

(declare-fun res!444382 () Bool)

(assert (=> start!60340 (=> (not res!444382) (not e!386384))))

(assert (=> start!60340 (= res!444382 (and (bvslt (size!19250 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19250 a!3626))))))

(assert (=> start!60340 e!386384))

(assert (=> start!60340 true))

(declare-fun array_inv!14682 (array!39387) Bool)

(assert (=> start!60340 (array_inv!14682 a!3626)))

(declare-fun b!677958 () Bool)

(assert (=> b!677958 (= e!386383 (not (contains!3504 acc!681 k0!2843)))))

(assert (= (and start!60340 res!444382) b!677960))

(assert (= (and b!677960 res!444378) b!677957))

(assert (= (and b!677957 res!444383) b!677954))

(assert (= (and b!677954 res!444385) b!677953))

(assert (= (and b!677953 res!444384) b!677952))

(assert (= (and b!677953 (not res!444379)) b!677959))

(assert (= (and b!677959 res!444381) b!677958))

(assert (= (and b!677953 res!444380) b!677956))

(assert (= (and b!677956 res!444386) b!677955))

(declare-fun m!643975 () Bool)

(assert (=> b!677956 m!643975))

(declare-fun m!643977 () Bool)

(assert (=> b!677958 m!643977))

(declare-fun m!643979 () Bool)

(assert (=> b!677954 m!643979))

(assert (=> b!677952 m!643977))

(declare-fun m!643981 () Bool)

(assert (=> start!60340 m!643981))

(declare-fun m!643983 () Bool)

(assert (=> b!677960 m!643983))

(declare-fun m!643985 () Bool)

(assert (=> b!677957 m!643985))

(declare-fun m!643987 () Bool)

(assert (=> b!677955 m!643987))

(check-sat (not b!677955) (not start!60340) (not b!677954) (not b!677960) (not b!677957) (not b!677956) (not b!677958) (not b!677952))
(check-sat)
