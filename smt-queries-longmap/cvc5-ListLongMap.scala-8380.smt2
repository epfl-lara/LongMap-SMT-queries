; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101954 () Bool)

(assert start!101954)

(declare-fun b!1227294 () Bool)

(declare-fun res!815962 () Bool)

(declare-fun e!696908 () Bool)

(assert (=> b!1227294 (=> (not res!815962) (not e!696908))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79154 0))(
  ( (array!79155 (arr!38200 (Array (_ BitVec 32) (_ BitVec 64))) (size!38738 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79154)

(assert (=> b!1227294 (= res!815962 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38738 a!3806)) (bvslt from!3184 (size!38738 a!3806))))))

(declare-fun b!1227295 () Bool)

(declare-fun res!815957 () Bool)

(assert (=> b!1227295 (=> (not res!815957) (not e!696908))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79154 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1227295 (= res!815957 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1227296 () Bool)

(declare-fun res!815966 () Bool)

(declare-fun e!696906 () Bool)

(assert (=> b!1227296 (=> res!815966 e!696906)))

(declare-datatypes ((List!27074 0))(
  ( (Nil!27071) (Cons!27070 (h!28279 (_ BitVec 64)) (t!40528 List!27074)) )
))
(declare-fun contains!7046 (List!27074 (_ BitVec 64)) Bool)

(assert (=> b!1227296 (= res!815966 (contains!7046 Nil!27071 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227297 () Bool)

(declare-fun res!815958 () Bool)

(assert (=> b!1227297 (=> res!815958 e!696906)))

(assert (=> b!1227297 (= res!815958 (contains!7046 Nil!27071 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227298 () Bool)

(declare-fun res!815961 () Bool)

(assert (=> b!1227298 (=> (not res!815961) (not e!696908))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227298 (= res!815961 (validKeyInArray!0 (select (arr!38200 a!3806) from!3184)))))

(declare-fun b!1227299 () Bool)

(declare-fun res!815964 () Bool)

(assert (=> b!1227299 (=> res!815964 e!696906)))

(declare-fun acc!823 () List!27074)

(declare-fun subseq!478 (List!27074 List!27074) Bool)

(assert (=> b!1227299 (= res!815964 (not (subseq!478 Nil!27071 acc!823)))))

(declare-fun b!1227300 () Bool)

(declare-fun res!815965 () Bool)

(assert (=> b!1227300 (=> (not res!815965) (not e!696908))))

(declare-fun noDuplicate!1689 (List!27074) Bool)

(assert (=> b!1227300 (= res!815965 (noDuplicate!1689 acc!823))))

(declare-fun b!1227302 () Bool)

(declare-fun res!815956 () Bool)

(assert (=> b!1227302 (=> (not res!815956) (not e!696908))))

(assert (=> b!1227302 (= res!815956 (not (contains!7046 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227303 () Bool)

(assert (=> b!1227303 (= e!696906 true)))

(declare-datatypes ((Unit!40491 0))(
  ( (Unit!40492) )
))
(declare-fun lt!558731 () Unit!40491)

(declare-fun noDuplicateSubseq!31 (List!27074 List!27074) Unit!40491)

(assert (=> b!1227303 (= lt!558731 (noDuplicateSubseq!31 Nil!27071 acc!823))))

(declare-fun b!1227304 () Bool)

(assert (=> b!1227304 (= e!696908 (not e!696906))))

(declare-fun res!815960 () Bool)

(assert (=> b!1227304 (=> res!815960 e!696906)))

(assert (=> b!1227304 (= res!815960 (bvsgt from!3184 (size!38738 a!3806)))))

(declare-fun arrayNoDuplicates!0 (array!79154 (_ BitVec 32) List!27074) Bool)

(assert (=> b!1227304 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27070 (select (arr!38200 a!3806) from!3184) acc!823))))

(declare-fun res!815955 () Bool)

(assert (=> start!101954 (=> (not res!815955) (not e!696908))))

(assert (=> start!101954 (= res!815955 (bvslt (size!38738 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101954 e!696908))

(declare-fun array_inv!29183 (array!79154) Bool)

(assert (=> start!101954 (array_inv!29183 a!3806)))

(assert (=> start!101954 true))

(declare-fun b!1227301 () Bool)

(declare-fun res!815963 () Bool)

(assert (=> b!1227301 (=> (not res!815963) (not e!696908))))

(assert (=> b!1227301 (= res!815963 (not (contains!7046 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227305 () Bool)

(declare-fun res!815954 () Bool)

(assert (=> b!1227305 (=> (not res!815954) (not e!696908))))

(assert (=> b!1227305 (= res!815954 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1227306 () Bool)

(declare-fun res!815959 () Bool)

(assert (=> b!1227306 (=> (not res!815959) (not e!696908))))

(assert (=> b!1227306 (= res!815959 (validKeyInArray!0 k!2913))))

(assert (= (and start!101954 res!815955) b!1227306))

(assert (= (and b!1227306 res!815959) b!1227294))

(assert (= (and b!1227294 res!815962) b!1227300))

(assert (= (and b!1227300 res!815965) b!1227302))

(assert (= (and b!1227302 res!815956) b!1227301))

(assert (= (and b!1227301 res!815963) b!1227295))

(assert (= (and b!1227295 res!815957) b!1227305))

(assert (= (and b!1227305 res!815954) b!1227298))

(assert (= (and b!1227298 res!815961) b!1227304))

(assert (= (and b!1227304 (not res!815960)) b!1227296))

(assert (= (and b!1227296 (not res!815966)) b!1227297))

(assert (= (and b!1227297 (not res!815958)) b!1227299))

(assert (= (and b!1227299 (not res!815964)) b!1227303))

(declare-fun m!1131635 () Bool)

(assert (=> b!1227304 m!1131635))

(declare-fun m!1131637 () Bool)

(assert (=> b!1227304 m!1131637))

(declare-fun m!1131639 () Bool)

(assert (=> b!1227296 m!1131639))

(assert (=> b!1227298 m!1131635))

(assert (=> b!1227298 m!1131635))

(declare-fun m!1131641 () Bool)

(assert (=> b!1227298 m!1131641))

(declare-fun m!1131643 () Bool)

(assert (=> b!1227301 m!1131643))

(declare-fun m!1131645 () Bool)

(assert (=> b!1227306 m!1131645))

(declare-fun m!1131647 () Bool)

(assert (=> b!1227305 m!1131647))

(declare-fun m!1131649 () Bool)

(assert (=> b!1227297 m!1131649))

(declare-fun m!1131651 () Bool)

(assert (=> b!1227303 m!1131651))

(declare-fun m!1131653 () Bool)

(assert (=> b!1227300 m!1131653))

(declare-fun m!1131655 () Bool)

(assert (=> b!1227302 m!1131655))

(declare-fun m!1131657 () Bool)

(assert (=> b!1227295 m!1131657))

(declare-fun m!1131659 () Bool)

(assert (=> b!1227299 m!1131659))

(declare-fun m!1131661 () Bool)

(assert (=> start!101954 m!1131661))

(push 1)

(assert (not b!1227299))

(assert (not b!1227300))

(assert (not b!1227306))

(assert (not b!1227301))

(assert (not b!1227295))

(assert (not b!1227296))

(assert (not start!101954))

(assert (not b!1227305))

(assert (not b!1227302))

(assert (not b!1227304))

(assert (not b!1227303))

(assert (not b!1227298))

(assert (not b!1227297))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

