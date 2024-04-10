; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60424 () Bool)

(assert start!60424)

(declare-fun b!678955 () Bool)

(declare-fun res!445348 () Bool)

(declare-fun e!386872 () Bool)

(assert (=> b!678955 (=> (not res!445348) (not e!386872))))

(declare-datatypes ((array!39438 0))(
  ( (array!39439 (arr!18910 (Array (_ BitVec 32) (_ BitVec 64))) (size!19274 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39438)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39438 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!678955 (= res!445348 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!678956 () Bool)

(declare-fun res!445342 () Bool)

(assert (=> b!678956 (=> (not res!445342) (not e!386872))))

(declare-datatypes ((List!12951 0))(
  ( (Nil!12948) (Cons!12947 (h!13992 (_ BitVec 64)) (t!19179 List!12951)) )
))
(declare-fun acc!681 () List!12951)

(declare-fun noDuplicate!775 (List!12951) Bool)

(assert (=> b!678956 (= res!445342 (noDuplicate!775 acc!681))))

(declare-fun b!678957 () Bool)

(declare-fun res!445344 () Bool)

(assert (=> b!678957 (=> (not res!445344) (not e!386872))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!678957 (= res!445344 (validKeyInArray!0 k0!2843))))

(declare-fun b!678958 () Bool)

(declare-fun e!386874 () Bool)

(declare-fun contains!3528 (List!12951 (_ BitVec 64)) Bool)

(assert (=> b!678958 (= e!386874 (contains!3528 acc!681 k0!2843))))

(declare-fun b!678959 () Bool)

(declare-fun res!445343 () Bool)

(assert (=> b!678959 (=> (not res!445343) (not e!386872))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39438 (_ BitVec 32) List!12951) Bool)

(assert (=> b!678959 (= res!445343 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678960 () Bool)

(declare-fun e!386871 () Bool)

(assert (=> b!678960 (= e!386871 (not (contains!3528 acc!681 k0!2843)))))

(declare-fun b!678961 () Bool)

(declare-fun e!386870 () Bool)

(assert (=> b!678961 (= e!386870 e!386871)))

(declare-fun res!445341 () Bool)

(assert (=> b!678961 (=> (not res!445341) (not e!386871))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!678961 (= res!445341 (bvsle from!3004 i!1382))))

(declare-fun b!678962 () Bool)

(assert (=> b!678962 (= e!386872 (not true))))

(assert (=> b!678962 (arrayContainsKey!0 (array!39439 (store (arr!18910 a!3626) i!1382 k0!2843) (size!19274 a!3626)) k0!2843 from!3004)))

(declare-fun b!678963 () Bool)

(declare-fun res!445340 () Bool)

(assert (=> b!678963 (=> (not res!445340) (not e!386872))))

(assert (=> b!678963 (= res!445340 (not (contains!3528 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678964 () Bool)

(declare-fun res!445347 () Bool)

(assert (=> b!678964 (=> (not res!445347) (not e!386872))))

(assert (=> b!678964 (= res!445347 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12948))))

(declare-fun b!678965 () Bool)

(declare-fun res!445350 () Bool)

(assert (=> b!678965 (=> (not res!445350) (not e!386872))))

(assert (=> b!678965 (= res!445350 e!386870)))

(declare-fun res!445345 () Bool)

(assert (=> b!678965 (=> res!445345 e!386870)))

(assert (=> b!678965 (= res!445345 e!386874)))

(declare-fun res!445339 () Bool)

(assert (=> b!678965 (=> (not res!445339) (not e!386874))))

(assert (=> b!678965 (= res!445339 (bvsgt from!3004 i!1382))))

(declare-fun b!678966 () Bool)

(declare-fun res!445346 () Bool)

(assert (=> b!678966 (=> (not res!445346) (not e!386872))))

(assert (=> b!678966 (= res!445346 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19274 a!3626)) (= from!3004 i!1382)))))

(declare-fun res!445352 () Bool)

(assert (=> start!60424 (=> (not res!445352) (not e!386872))))

(assert (=> start!60424 (= res!445352 (and (bvslt (size!19274 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19274 a!3626))))))

(assert (=> start!60424 e!386872))

(assert (=> start!60424 true))

(declare-fun array_inv!14706 (array!39438) Bool)

(assert (=> start!60424 (array_inv!14706 a!3626)))

(declare-fun b!678967 () Bool)

(declare-fun res!445349 () Bool)

(assert (=> b!678967 (=> (not res!445349) (not e!386872))))

(assert (=> b!678967 (= res!445349 (not (contains!3528 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678968 () Bool)

(declare-fun res!445351 () Bool)

(assert (=> b!678968 (=> (not res!445351) (not e!386872))))

(assert (=> b!678968 (= res!445351 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19274 a!3626))))))

(assert (= (and start!60424 res!445352) b!678956))

(assert (= (and b!678956 res!445342) b!678963))

(assert (= (and b!678963 res!445340) b!678967))

(assert (= (and b!678967 res!445349) b!678965))

(assert (= (and b!678965 res!445339) b!678958))

(assert (= (and b!678965 (not res!445345)) b!678961))

(assert (= (and b!678961 res!445341) b!678960))

(assert (= (and b!678965 res!445350) b!678964))

(assert (= (and b!678964 res!445347) b!678959))

(assert (= (and b!678959 res!445343) b!678968))

(assert (= (and b!678968 res!445351) b!678957))

(assert (= (and b!678957 res!445344) b!678955))

(assert (= (and b!678955 res!445348) b!678966))

(assert (= (and b!678966 res!445346) b!678962))

(declare-fun m!644535 () Bool)

(assert (=> b!678963 m!644535))

(declare-fun m!644537 () Bool)

(assert (=> b!678955 m!644537))

(declare-fun m!644539 () Bool)

(assert (=> b!678964 m!644539))

(declare-fun m!644541 () Bool)

(assert (=> b!678962 m!644541))

(declare-fun m!644543 () Bool)

(assert (=> b!678962 m!644543))

(declare-fun m!644545 () Bool)

(assert (=> b!678957 m!644545))

(declare-fun m!644547 () Bool)

(assert (=> b!678960 m!644547))

(declare-fun m!644549 () Bool)

(assert (=> b!678967 m!644549))

(declare-fun m!644551 () Bool)

(assert (=> b!678959 m!644551))

(declare-fun m!644553 () Bool)

(assert (=> b!678956 m!644553))

(declare-fun m!644555 () Bool)

(assert (=> start!60424 m!644555))

(assert (=> b!678958 m!644547))

(check-sat (not b!678963) (not b!678960) (not b!678962) (not b!678964) (not b!678955) (not b!678967) (not start!60424) (not b!678958) (not b!678957) (not b!678956) (not b!678959))
