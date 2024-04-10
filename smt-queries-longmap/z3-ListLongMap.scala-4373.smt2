; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60268 () Bool)

(assert start!60268)

(declare-fun b!675874 () Bool)

(declare-fun e!385562 () Bool)

(declare-datatypes ((List!12891 0))(
  ( (Nil!12888) (Cons!12887 (h!13932 (_ BitVec 64)) (t!19119 List!12891)) )
))
(declare-fun acc!681 () List!12891)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3468 (List!12891 (_ BitVec 64)) Bool)

(assert (=> b!675874 (= e!385562 (contains!3468 acc!681 k0!2843))))

(declare-fun b!675875 () Bool)

(declare-fun res!442307 () Bool)

(declare-fun e!385566 () Bool)

(assert (=> b!675875 (=> (not res!442307) (not e!385566))))

(declare-datatypes ((array!39315 0))(
  ( (array!39316 (arr!18850 (Array (_ BitVec 32) (_ BitVec 64))) (size!19214 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39315)

(declare-fun arrayContainsKey!0 (array!39315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!675875 (= res!442307 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!675876 () Bool)

(declare-fun res!442308 () Bool)

(assert (=> b!675876 (=> (not res!442308) (not e!385566))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!675876 (= res!442308 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19214 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!675877 () Bool)

(declare-fun res!442313 () Bool)

(assert (=> b!675877 (=> (not res!442313) (not e!385566))))

(assert (=> b!675877 (= res!442313 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19214 a!3626))))))

(declare-fun b!675878 () Bool)

(assert (=> b!675878 (= e!385566 false)))

(declare-fun lt!312748 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39315 (_ BitVec 32) List!12891) Bool)

(assert (=> b!675878 (= lt!312748 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!675879 () Bool)

(declare-fun res!442302 () Bool)

(assert (=> b!675879 (=> (not res!442302) (not e!385566))))

(assert (=> b!675879 (= res!442302 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12888))))

(declare-fun b!675880 () Bool)

(declare-fun res!442312 () Bool)

(assert (=> b!675880 (=> (not res!442312) (not e!385566))))

(declare-fun e!385564 () Bool)

(assert (=> b!675880 (= res!442312 e!385564)))

(declare-fun res!442314 () Bool)

(assert (=> b!675880 (=> res!442314 e!385564)))

(assert (=> b!675880 (= res!442314 e!385562)))

(declare-fun res!442309 () Bool)

(assert (=> b!675880 (=> (not res!442309) (not e!385562))))

(assert (=> b!675880 (= res!442309 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675881 () Bool)

(declare-fun res!442311 () Bool)

(assert (=> b!675881 (=> (not res!442311) (not e!385566))))

(assert (=> b!675881 (= res!442311 (not (contains!3468 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675882 () Bool)

(declare-fun e!385560 () Bool)

(assert (=> b!675882 (= e!385560 (not (contains!3468 acc!681 k0!2843)))))

(declare-fun b!675883 () Bool)

(declare-fun res!442305 () Bool)

(assert (=> b!675883 (=> (not res!442305) (not e!385566))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!675883 (= res!442305 (validKeyInArray!0 k0!2843))))

(declare-fun b!675884 () Bool)

(declare-fun res!442301 () Bool)

(assert (=> b!675884 (=> (not res!442301) (not e!385566))))

(declare-fun noDuplicate!715 (List!12891) Bool)

(assert (=> b!675884 (= res!442301 (noDuplicate!715 acc!681))))

(declare-fun b!675885 () Bool)

(declare-fun res!442304 () Bool)

(assert (=> b!675885 (=> (not res!442304) (not e!385566))))

(assert (=> b!675885 (= res!442304 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!675886 () Bool)

(declare-fun res!442316 () Bool)

(assert (=> b!675886 (=> (not res!442316) (not e!385566))))

(assert (=> b!675886 (= res!442316 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!675887 () Bool)

(declare-fun res!442306 () Bool)

(assert (=> b!675887 (=> (not res!442306) (not e!385566))))

(assert (=> b!675887 (= res!442306 (not (contains!3468 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675888 () Bool)

(declare-fun e!385563 () Bool)

(declare-fun e!385561 () Bool)

(assert (=> b!675888 (= e!385563 e!385561)))

(declare-fun res!442319 () Bool)

(assert (=> b!675888 (=> (not res!442319) (not e!385561))))

(assert (=> b!675888 (= res!442319 (bvsle from!3004 i!1382))))

(declare-fun b!675889 () Bool)

(declare-fun e!385559 () Bool)

(assert (=> b!675889 (= e!385559 (contains!3468 acc!681 k0!2843))))

(declare-fun res!442303 () Bool)

(assert (=> start!60268 (=> (not res!442303) (not e!385566))))

(assert (=> start!60268 (= res!442303 (and (bvslt (size!19214 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19214 a!3626))))))

(assert (=> start!60268 e!385566))

(assert (=> start!60268 true))

(declare-fun array_inv!14646 (array!39315) Bool)

(assert (=> start!60268 (array_inv!14646 a!3626)))

(declare-fun b!675890 () Bool)

(assert (=> b!675890 (= e!385564 e!385560)))

(declare-fun res!442310 () Bool)

(assert (=> b!675890 (=> (not res!442310) (not e!385560))))

(assert (=> b!675890 (= res!442310 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675891 () Bool)

(declare-fun res!442317 () Bool)

(assert (=> b!675891 (=> (not res!442317) (not e!385566))))

(assert (=> b!675891 (= res!442317 (not (validKeyInArray!0 (select (arr!18850 a!3626) from!3004))))))

(declare-fun b!675892 () Bool)

(declare-fun res!442315 () Bool)

(assert (=> b!675892 (=> (not res!442315) (not e!385566))))

(assert (=> b!675892 (= res!442315 e!385563)))

(declare-fun res!442300 () Bool)

(assert (=> b!675892 (=> res!442300 e!385563)))

(assert (=> b!675892 (= res!442300 e!385559)))

(declare-fun res!442318 () Bool)

(assert (=> b!675892 (=> (not res!442318) (not e!385559))))

(assert (=> b!675892 (= res!442318 (bvsgt from!3004 i!1382))))

(declare-fun b!675893 () Bool)

(assert (=> b!675893 (= e!385561 (not (contains!3468 acc!681 k0!2843)))))

(assert (= (and start!60268 res!442303) b!675884))

(assert (= (and b!675884 res!442301) b!675887))

(assert (= (and b!675887 res!442306) b!675881))

(assert (= (and b!675881 res!442311) b!675892))

(assert (= (and b!675892 res!442318) b!675889))

(assert (= (and b!675892 (not res!442300)) b!675888))

(assert (= (and b!675888 res!442319) b!675893))

(assert (= (and b!675892 res!442315) b!675879))

(assert (= (and b!675879 res!442302) b!675886))

(assert (= (and b!675886 res!442316) b!675877))

(assert (= (and b!675877 res!442313) b!675883))

(assert (= (and b!675883 res!442305) b!675875))

(assert (= (and b!675875 res!442307) b!675876))

(assert (= (and b!675876 res!442308) b!675891))

(assert (= (and b!675891 res!442317) b!675885))

(assert (= (and b!675885 res!442304) b!675880))

(assert (= (and b!675880 res!442309) b!675874))

(assert (= (and b!675880 (not res!442314)) b!675890))

(assert (= (and b!675890 res!442310) b!675882))

(assert (= (and b!675880 res!442312) b!675878))

(declare-fun m!643067 () Bool)

(assert (=> b!675882 m!643067))

(declare-fun m!643069 () Bool)

(assert (=> b!675891 m!643069))

(assert (=> b!675891 m!643069))

(declare-fun m!643071 () Bool)

(assert (=> b!675891 m!643071))

(declare-fun m!643073 () Bool)

(assert (=> start!60268 m!643073))

(assert (=> b!675889 m!643067))

(declare-fun m!643075 () Bool)

(assert (=> b!675883 m!643075))

(assert (=> b!675874 m!643067))

(assert (=> b!675893 m!643067))

(declare-fun m!643077 () Bool)

(assert (=> b!675879 m!643077))

(declare-fun m!643079 () Bool)

(assert (=> b!675875 m!643079))

(declare-fun m!643081 () Bool)

(assert (=> b!675878 m!643081))

(declare-fun m!643083 () Bool)

(assert (=> b!675887 m!643083))

(declare-fun m!643085 () Bool)

(assert (=> b!675886 m!643085))

(declare-fun m!643087 () Bool)

(assert (=> b!675881 m!643087))

(declare-fun m!643089 () Bool)

(assert (=> b!675884 m!643089))

(check-sat (not b!675874) (not b!675886) (not b!675875) (not b!675884) (not b!675893) (not b!675878) (not b!675887) (not start!60268) (not b!675881) (not b!675879) (not b!675883) (not b!675889) (not b!675891) (not b!675882))
