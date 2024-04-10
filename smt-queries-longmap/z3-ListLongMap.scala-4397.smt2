; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60484 () Bool)

(assert start!60484)

(declare-fun b!679631 () Bool)

(declare-datatypes ((Unit!23806 0))(
  ( (Unit!23807) )
))
(declare-fun e!387207 () Unit!23806)

(declare-fun Unit!23808 () Unit!23806)

(assert (=> b!679631 (= e!387207 Unit!23808)))

(declare-fun b!679632 () Bool)

(declare-fun res!445986 () Bool)

(declare-fun e!387209 () Bool)

(assert (=> b!679632 (=> (not res!445986) (not e!387209))))

(declare-datatypes ((array!39465 0))(
  ( (array!39466 (arr!18922 (Array (_ BitVec 32) (_ BitVec 64))) (size!19286 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39465)

(declare-datatypes ((List!12963 0))(
  ( (Nil!12960) (Cons!12959 (h!14004 (_ BitVec 64)) (t!19191 List!12963)) )
))
(declare-fun arrayNoDuplicates!0 (array!39465 (_ BitVec 32) List!12963) Bool)

(assert (=> b!679632 (= res!445986 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12960))))

(declare-fun b!679633 () Bool)

(declare-fun res!445991 () Bool)

(assert (=> b!679633 (=> (not res!445991) (not e!387209))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!679633 (= res!445991 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19286 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!679634 () Bool)

(declare-fun Unit!23809 () Unit!23806)

(assert (=> b!679634 (= e!387207 Unit!23809)))

(declare-fun lt!312946 () Unit!23806)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39465 (_ BitVec 64) (_ BitVec 32)) Unit!23806)

(assert (=> b!679634 (= lt!312946 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!679634 false))

(declare-fun res!445982 () Bool)

(assert (=> start!60484 (=> (not res!445982) (not e!387209))))

(assert (=> start!60484 (= res!445982 (and (bvslt (size!19286 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19286 a!3626))))))

(assert (=> start!60484 e!387209))

(assert (=> start!60484 true))

(declare-fun array_inv!14718 (array!39465) Bool)

(assert (=> start!60484 (array_inv!14718 a!3626)))

(declare-fun b!679635 () Bool)

(declare-fun res!445994 () Bool)

(assert (=> b!679635 (=> (not res!445994) (not e!387209))))

(declare-fun e!387210 () Bool)

(assert (=> b!679635 (= res!445994 e!387210)))

(declare-fun res!445984 () Bool)

(assert (=> b!679635 (=> res!445984 e!387210)))

(declare-fun e!387205 () Bool)

(assert (=> b!679635 (= res!445984 e!387205)))

(declare-fun res!445990 () Bool)

(assert (=> b!679635 (=> (not res!445990) (not e!387205))))

(assert (=> b!679635 (= res!445990 (bvsgt from!3004 i!1382))))

(declare-fun b!679636 () Bool)

(declare-fun res!445993 () Bool)

(assert (=> b!679636 (=> (not res!445993) (not e!387209))))

(declare-fun arrayContainsKey!0 (array!39465 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!679636 (= res!445993 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!679637 () Bool)

(declare-fun res!445987 () Bool)

(assert (=> b!679637 (=> (not res!445987) (not e!387209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!679637 (= res!445987 (validKeyInArray!0 k0!2843))))

(declare-fun b!679638 () Bool)

(declare-fun res!445985 () Bool)

(assert (=> b!679638 (=> (not res!445985) (not e!387209))))

(assert (=> b!679638 (= res!445985 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19286 a!3626))))))

(declare-fun b!679639 () Bool)

(declare-fun acc!681 () List!12963)

(declare-fun contains!3540 (List!12963 (_ BitVec 64)) Bool)

(assert (=> b!679639 (= e!387205 (contains!3540 acc!681 k0!2843))))

(declare-fun b!679640 () Bool)

(declare-fun res!445981 () Bool)

(assert (=> b!679640 (=> (not res!445981) (not e!387209))))

(assert (=> b!679640 (= res!445981 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!679641 () Bool)

(declare-fun res!445988 () Bool)

(assert (=> b!679641 (=> (not res!445988) (not e!387209))))

(declare-fun noDuplicate!787 (List!12963) Bool)

(assert (=> b!679641 (= res!445988 (noDuplicate!787 acc!681))))

(declare-fun b!679642 () Bool)

(declare-fun e!387208 () Bool)

(assert (=> b!679642 (= e!387208 (not (contains!3540 acc!681 k0!2843)))))

(declare-fun b!679643 () Bool)

(declare-fun res!445992 () Bool)

(assert (=> b!679643 (=> (not res!445992) (not e!387209))))

(assert (=> b!679643 (= res!445992 (not (contains!3540 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679644 () Bool)

(assert (=> b!679644 (= e!387210 e!387208)))

(declare-fun res!445989 () Bool)

(assert (=> b!679644 (=> (not res!445989) (not e!387208))))

(assert (=> b!679644 (= res!445989 (bvsle from!3004 i!1382))))

(declare-fun b!679645 () Bool)

(assert (=> b!679645 (= e!387209 (not true))))

(declare-fun lt!312945 () Unit!23806)

(assert (=> b!679645 (= lt!312945 e!387207)))

(declare-fun c!77192 () Bool)

(assert (=> b!679645 (= c!77192 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!679645 (arrayContainsKey!0 (array!39466 (store (arr!18922 a!3626) i!1382 k0!2843) (size!19286 a!3626)) k0!2843 from!3004)))

(declare-fun b!679646 () Bool)

(declare-fun res!445983 () Bool)

(assert (=> b!679646 (=> (not res!445983) (not e!387209))))

(assert (=> b!679646 (= res!445983 (not (contains!3540 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60484 res!445982) b!679641))

(assert (= (and b!679641 res!445988) b!679643))

(assert (= (and b!679643 res!445992) b!679646))

(assert (= (and b!679646 res!445983) b!679635))

(assert (= (and b!679635 res!445990) b!679639))

(assert (= (and b!679635 (not res!445984)) b!679644))

(assert (= (and b!679644 res!445989) b!679642))

(assert (= (and b!679635 res!445994) b!679632))

(assert (= (and b!679632 res!445986) b!679640))

(assert (= (and b!679640 res!445981) b!679638))

(assert (= (and b!679638 res!445985) b!679637))

(assert (= (and b!679637 res!445987) b!679636))

(assert (= (and b!679636 res!445993) b!679633))

(assert (= (and b!679633 res!445991) b!679645))

(assert (= (and b!679645 c!77192) b!679634))

(assert (= (and b!679645 (not c!77192)) b!679631))

(declare-fun m!644965 () Bool)

(assert (=> b!679643 m!644965))

(declare-fun m!644967 () Bool)

(assert (=> b!679645 m!644967))

(declare-fun m!644969 () Bool)

(assert (=> b!679645 m!644969))

(declare-fun m!644971 () Bool)

(assert (=> b!679645 m!644971))

(declare-fun m!644973 () Bool)

(assert (=> b!679634 m!644973))

(declare-fun m!644975 () Bool)

(assert (=> b!679642 m!644975))

(declare-fun m!644977 () Bool)

(assert (=> b!679632 m!644977))

(declare-fun m!644979 () Bool)

(assert (=> b!679646 m!644979))

(declare-fun m!644981 () Bool)

(assert (=> start!60484 m!644981))

(assert (=> b!679639 m!644975))

(declare-fun m!644983 () Bool)

(assert (=> b!679641 m!644983))

(declare-fun m!644985 () Bool)

(assert (=> b!679636 m!644985))

(declare-fun m!644987 () Bool)

(assert (=> b!679637 m!644987))

(declare-fun m!644989 () Bool)

(assert (=> b!679640 m!644989))

(check-sat (not b!679641) (not b!679639) (not b!679645) (not b!679640) (not b!679636) (not start!60484) (not b!679634) (not b!679637) (not b!679643) (not b!679632) (not b!679642) (not b!679646))
