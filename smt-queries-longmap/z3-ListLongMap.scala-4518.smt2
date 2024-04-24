; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62632 () Bool)

(assert start!62632)

(declare-fun b!705967 () Bool)

(declare-fun res!469691 () Bool)

(declare-fun e!397982 () Bool)

(assert (=> b!705967 (=> (not res!469691) (not e!397982))))

(declare-datatypes ((array!40251 0))(
  ( (array!40252 (arr!19279 (Array (_ BitVec 32) (_ BitVec 64))) (size!19662 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40251)

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((List!13227 0))(
  ( (Nil!13224) (Cons!13223 (h!14271 (_ BitVec 64)) (t!19501 List!13227)) )
))
(declare-fun acc!652 () List!13227)

(declare-fun arrayNoDuplicates!0 (array!40251 (_ BitVec 32) List!13227) Bool)

(assert (=> b!705967 (= res!469691 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!705968 () Bool)

(declare-fun res!469689 () Bool)

(assert (=> b!705968 (=> (not res!469689) (not e!397982))))

(declare-fun contains!3879 (List!13227 (_ BitVec 64)) Bool)

(assert (=> b!705968 (= res!469689 (not (contains!3879 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705969 () Bool)

(declare-fun res!469690 () Bool)

(assert (=> b!705969 (=> (not res!469690) (not e!397982))))

(assert (=> b!705969 (= res!469690 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!705970 () Bool)

(declare-fun res!469679 () Bool)

(assert (=> b!705970 (=> (not res!469679) (not e!397982))))

(declare-fun newAcc!49 () List!13227)

(declare-fun subseq!347 (List!13227 List!13227) Bool)

(assert (=> b!705970 (= res!469679 (subseq!347 acc!652 newAcc!49))))

(declare-fun b!705971 () Bool)

(declare-fun res!469687 () Bool)

(assert (=> b!705971 (=> (not res!469687) (not e!397982))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!705971 (= res!469687 (validKeyInArray!0 k0!2824))))

(declare-fun b!705972 () Bool)

(declare-fun res!469682 () Bool)

(assert (=> b!705972 (=> (not res!469682) (not e!397982))))

(assert (=> b!705972 (= res!469682 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!705973 () Bool)

(declare-fun res!469683 () Bool)

(assert (=> b!705973 (=> (not res!469683) (not e!397982))))

(declare-fun noDuplicate!1153 (List!13227) Bool)

(assert (=> b!705973 (= res!469683 (noDuplicate!1153 newAcc!49))))

(declare-fun b!705974 () Bool)

(declare-fun res!469692 () Bool)

(assert (=> b!705974 (=> (not res!469692) (not e!397982))))

(declare-fun -!311 (List!13227 (_ BitVec 64)) List!13227)

(assert (=> b!705974 (= res!469692 (= (-!311 newAcc!49 k0!2824) acc!652))))

(declare-fun b!705976 () Bool)

(declare-fun res!469694 () Bool)

(assert (=> b!705976 (=> (not res!469694) (not e!397982))))

(assert (=> b!705976 (= res!469694 (not (contains!3879 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705977 () Bool)

(declare-fun res!469693 () Bool)

(assert (=> b!705977 (=> (not res!469693) (not e!397982))))

(assert (=> b!705977 (= res!469693 (not (validKeyInArray!0 (select (arr!19279 a!3591) from!2969))))))

(declare-fun b!705978 () Bool)

(declare-fun res!469686 () Bool)

(assert (=> b!705978 (=> (not res!469686) (not e!397982))))

(assert (=> b!705978 (= res!469686 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19662 a!3591)))))

(declare-fun b!705979 () Bool)

(declare-fun res!469681 () Bool)

(assert (=> b!705979 (=> (not res!469681) (not e!397982))))

(assert (=> b!705979 (= res!469681 (not (contains!3879 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705980 () Bool)

(declare-fun res!469688 () Bool)

(assert (=> b!705980 (=> (not res!469688) (not e!397982))))

(declare-fun arrayContainsKey!0 (array!40251 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!705980 (= res!469688 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!705981 () Bool)

(declare-fun res!469695 () Bool)

(assert (=> b!705981 (=> (not res!469695) (not e!397982))))

(assert (=> b!705981 (= res!469695 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!705982 () Bool)

(declare-fun res!469680 () Bool)

(assert (=> b!705982 (=> (not res!469680) (not e!397982))))

(assert (=> b!705982 (= res!469680 (not (contains!3879 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705983 () Bool)

(declare-fun res!469685 () Bool)

(assert (=> b!705983 (=> (not res!469685) (not e!397982))))

(assert (=> b!705983 (= res!469685 (not (contains!3879 acc!652 k0!2824)))))

(declare-fun b!705984 () Bool)

(declare-fun res!469678 () Bool)

(assert (=> b!705984 (=> (not res!469678) (not e!397982))))

(assert (=> b!705984 (= res!469678 (noDuplicate!1153 acc!652))))

(declare-fun b!705985 () Bool)

(assert (=> b!705985 (= e!397982 (not true))))

(assert (=> b!705985 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49)))

(declare-datatypes ((Unit!24597 0))(
  ( (Unit!24598) )
))
(declare-fun lt!318015 () Unit!24597)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40251 (_ BitVec 64) (_ BitVec 32) List!13227 List!13227) Unit!24597)

(assert (=> b!705985 (= lt!318015 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49))))

(declare-fun res!469696 () Bool)

(assert (=> start!62632 (=> (not res!469696) (not e!397982))))

(assert (=> start!62632 (= res!469696 (and (bvslt (size!19662 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19662 a!3591))))))

(assert (=> start!62632 e!397982))

(assert (=> start!62632 true))

(declare-fun array_inv!15138 (array!40251) Bool)

(assert (=> start!62632 (array_inv!15138 a!3591)))

(declare-fun b!705975 () Bool)

(declare-fun res!469684 () Bool)

(assert (=> b!705975 (=> (not res!469684) (not e!397982))))

(assert (=> b!705975 (= res!469684 (contains!3879 newAcc!49 k0!2824))))

(assert (= (and start!62632 res!469696) b!705984))

(assert (= (and b!705984 res!469678) b!705973))

(assert (= (and b!705973 res!469683) b!705976))

(assert (= (and b!705976 res!469694) b!705968))

(assert (= (and b!705968 res!469689) b!705981))

(assert (= (and b!705981 res!469695) b!705983))

(assert (= (and b!705983 res!469685) b!705971))

(assert (= (and b!705971 res!469687) b!705967))

(assert (= (and b!705967 res!469691) b!705970))

(assert (= (and b!705970 res!469679) b!705975))

(assert (= (and b!705975 res!469684) b!705974))

(assert (= (and b!705974 res!469692) b!705982))

(assert (= (and b!705982 res!469680) b!705979))

(assert (= (and b!705979 res!469681) b!705978))

(assert (= (and b!705978 res!469686) b!705977))

(assert (= (and b!705977 res!469693) b!705969))

(assert (= (and b!705969 res!469690) b!705980))

(assert (= (and b!705980 res!469688) b!705972))

(assert (= (and b!705972 res!469682) b!705985))

(declare-fun m!664491 () Bool)

(assert (=> b!705971 m!664491))

(declare-fun m!664493 () Bool)

(assert (=> b!705982 m!664493))

(declare-fun m!664495 () Bool)

(assert (=> start!62632 m!664495))

(declare-fun m!664497 () Bool)

(assert (=> b!705981 m!664497))

(declare-fun m!664499 () Bool)

(assert (=> b!705968 m!664499))

(declare-fun m!664501 () Bool)

(assert (=> b!705984 m!664501))

(declare-fun m!664503 () Bool)

(assert (=> b!705977 m!664503))

(assert (=> b!705977 m!664503))

(declare-fun m!664505 () Bool)

(assert (=> b!705977 m!664505))

(declare-fun m!664507 () Bool)

(assert (=> b!705976 m!664507))

(declare-fun m!664509 () Bool)

(assert (=> b!705974 m!664509))

(declare-fun m!664511 () Bool)

(assert (=> b!705979 m!664511))

(declare-fun m!664513 () Bool)

(assert (=> b!705973 m!664513))

(declare-fun m!664515 () Bool)

(assert (=> b!705980 m!664515))

(declare-fun m!664517 () Bool)

(assert (=> b!705972 m!664517))

(declare-fun m!664519 () Bool)

(assert (=> b!705985 m!664519))

(declare-fun m!664521 () Bool)

(assert (=> b!705985 m!664521))

(declare-fun m!664523 () Bool)

(assert (=> b!705983 m!664523))

(declare-fun m!664525 () Bool)

(assert (=> b!705975 m!664525))

(declare-fun m!664527 () Bool)

(assert (=> b!705970 m!664527))

(declare-fun m!664529 () Bool)

(assert (=> b!705967 m!664529))

(check-sat (not b!705974) (not b!705973) (not b!705976) (not b!705972) (not b!705985) (not b!705984) (not b!705977) (not b!705983) (not b!705971) (not b!705970) (not b!705967) (not b!705968) (not b!705980) (not b!705981) (not b!705979) (not b!705982) (not start!62632) (not b!705975))
(check-sat)
