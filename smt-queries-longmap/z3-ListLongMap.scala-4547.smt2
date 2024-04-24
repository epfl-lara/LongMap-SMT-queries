; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63418 () Bool)

(assert start!63418)

(declare-fun b!713920 () Bool)

(declare-fun res!476893 () Bool)

(declare-fun e!401457 () Bool)

(assert (=> b!713920 (=> (not res!476893) (not e!401457))))

(declare-datatypes ((array!40458 0))(
  ( (array!40459 (arr!19366 (Array (_ BitVec 32) (_ BitVec 64))) (size!19778 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40458)

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((List!13314 0))(
  ( (Nil!13311) (Cons!13310 (h!14358 (_ BitVec 64)) (t!19621 List!13314)) )
))
(declare-fun acc!652 () List!13314)

(declare-fun arrayNoDuplicates!0 (array!40458 (_ BitVec 32) List!13314) Bool)

(assert (=> b!713920 (= res!476893 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!713921 () Bool)

(declare-fun res!476891 () Bool)

(assert (=> b!713921 (=> (not res!476891) (not e!401457))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!713921 (= res!476891 (validKeyInArray!0 k0!2824))))

(declare-fun b!713922 () Bool)

(declare-fun res!476892 () Bool)

(assert (=> b!713922 (=> (not res!476892) (not e!401457))))

(declare-fun newAcc!49 () List!13314)

(declare-fun contains!3966 (List!13314 (_ BitVec 64)) Bool)

(assert (=> b!713922 (= res!476892 (not (contains!3966 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713923 () Bool)

(assert (=> b!713923 (= e!401457 false)))

(declare-fun lt!318822 () Bool)

(assert (=> b!713923 (= lt!318822 (contains!3966 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713924 () Bool)

(declare-fun res!476885 () Bool)

(assert (=> b!713924 (=> (not res!476885) (not e!401457))))

(assert (=> b!713924 (= res!476885 (not (contains!3966 acc!652 k0!2824)))))

(declare-fun b!713925 () Bool)

(declare-fun res!476888 () Bool)

(assert (=> b!713925 (=> (not res!476888) (not e!401457))))

(assert (=> b!713925 (= res!476888 (contains!3966 newAcc!49 k0!2824))))

(declare-fun b!713926 () Bool)

(declare-fun res!476886 () Bool)

(assert (=> b!713926 (=> (not res!476886) (not e!401457))))

(declare-fun -!398 (List!13314 (_ BitVec 64)) List!13314)

(assert (=> b!713926 (= res!476886 (= (-!398 newAcc!49 k0!2824) acc!652))))

(declare-fun b!713928 () Bool)

(declare-fun res!476889 () Bool)

(assert (=> b!713928 (=> (not res!476889) (not e!401457))))

(declare-fun arrayContainsKey!0 (array!40458 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!713928 (= res!476889 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!713929 () Bool)

(declare-fun res!476883 () Bool)

(assert (=> b!713929 (=> (not res!476883) (not e!401457))))

(declare-fun subseq!434 (List!13314 List!13314) Bool)

(assert (=> b!713929 (= res!476883 (subseq!434 acc!652 newAcc!49))))

(declare-fun b!713930 () Bool)

(declare-fun res!476890 () Bool)

(assert (=> b!713930 (=> (not res!476890) (not e!401457))))

(assert (=> b!713930 (= res!476890 (not (contains!3966 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!476882 () Bool)

(assert (=> start!63418 (=> (not res!476882) (not e!401457))))

(assert (=> start!63418 (= res!476882 (and (bvslt (size!19778 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19778 a!3591))))))

(assert (=> start!63418 e!401457))

(assert (=> start!63418 true))

(declare-fun array_inv!15225 (array!40458) Bool)

(assert (=> start!63418 (array_inv!15225 a!3591)))

(declare-fun b!713927 () Bool)

(declare-fun res!476881 () Bool)

(assert (=> b!713927 (=> (not res!476881) (not e!401457))))

(declare-fun noDuplicate!1240 (List!13314) Bool)

(assert (=> b!713927 (= res!476881 (noDuplicate!1240 acc!652))))

(declare-fun b!713931 () Bool)

(declare-fun res!476884 () Bool)

(assert (=> b!713931 (=> (not res!476884) (not e!401457))))

(assert (=> b!713931 (= res!476884 (noDuplicate!1240 newAcc!49))))

(declare-fun b!713932 () Bool)

(declare-fun res!476887 () Bool)

(assert (=> b!713932 (=> (not res!476887) (not e!401457))))

(assert (=> b!713932 (= res!476887 (not (contains!3966 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!63418 res!476882) b!713927))

(assert (= (and b!713927 res!476881) b!713931))

(assert (= (and b!713931 res!476884) b!713932))

(assert (= (and b!713932 res!476887) b!713930))

(assert (= (and b!713930 res!476890) b!713928))

(assert (= (and b!713928 res!476889) b!713924))

(assert (= (and b!713924 res!476885) b!713921))

(assert (= (and b!713921 res!476891) b!713920))

(assert (= (and b!713920 res!476893) b!713929))

(assert (= (and b!713929 res!476883) b!713925))

(assert (= (and b!713925 res!476888) b!713926))

(assert (= (and b!713926 res!476886) b!713922))

(assert (= (and b!713922 res!476892) b!713923))

(declare-fun m!671157 () Bool)

(assert (=> b!713923 m!671157))

(declare-fun m!671159 () Bool)

(assert (=> b!713921 m!671159))

(declare-fun m!671161 () Bool)

(assert (=> b!713932 m!671161))

(declare-fun m!671163 () Bool)

(assert (=> b!713925 m!671163))

(declare-fun m!671165 () Bool)

(assert (=> b!713929 m!671165))

(declare-fun m!671167 () Bool)

(assert (=> b!713920 m!671167))

(declare-fun m!671169 () Bool)

(assert (=> b!713930 m!671169))

(declare-fun m!671171 () Bool)

(assert (=> b!713927 m!671171))

(declare-fun m!671173 () Bool)

(assert (=> b!713924 m!671173))

(declare-fun m!671175 () Bool)

(assert (=> b!713922 m!671175))

(declare-fun m!671177 () Bool)

(assert (=> b!713928 m!671177))

(declare-fun m!671179 () Bool)

(assert (=> start!63418 m!671179))

(declare-fun m!671181 () Bool)

(assert (=> b!713926 m!671181))

(declare-fun m!671183 () Bool)

(assert (=> b!713931 m!671183))

(check-sat (not b!713925) (not b!713920) (not b!713927) (not b!713923) (not b!713922) (not b!713926) (not b!713931) (not start!63418) (not b!713930) (not b!713928) (not b!713929) (not b!713924) (not b!713932) (not b!713921))
(check-sat)
