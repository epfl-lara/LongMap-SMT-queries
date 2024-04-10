; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62474 () Bool)

(assert start!62474)

(declare-fun b!702923 () Bool)

(declare-fun res!466755 () Bool)

(declare-fun e!397553 () Bool)

(assert (=> b!702923 (=> (not res!466755) (not e!397553))))

(declare-datatypes ((List!13274 0))(
  ( (Nil!13271) (Cons!13270 (h!14315 (_ BitVec 64)) (t!19556 List!13274)) )
))
(declare-fun acc!652 () List!13274)

(declare-fun noDuplicate!1098 (List!13274) Bool)

(assert (=> b!702923 (= res!466755 (noDuplicate!1098 acc!652))))

(declare-fun b!702924 () Bool)

(declare-fun res!466738 () Bool)

(assert (=> b!702924 (=> (not res!466738) (not e!397553))))

(declare-fun newAcc!49 () List!13274)

(declare-fun contains!3851 (List!13274 (_ BitVec 64)) Bool)

(assert (=> b!702924 (= res!466738 (not (contains!3851 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702926 () Bool)

(declare-fun res!466745 () Bool)

(declare-fun e!397555 () Bool)

(assert (=> b!702926 (=> (not res!466745) (not e!397555))))

(declare-fun lt!317750 () List!13274)

(assert (=> b!702926 (= res!466745 (not (contains!3851 lt!317750 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702927 () Bool)

(declare-fun res!466735 () Bool)

(assert (=> b!702927 (=> (not res!466735) (not e!397553))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun -!261 (List!13274 (_ BitVec 64)) List!13274)

(assert (=> b!702927 (= res!466735 (= (-!261 newAcc!49 k!2824) acc!652))))

(declare-fun b!702928 () Bool)

(declare-fun res!466751 () Bool)

(assert (=> b!702928 (=> (not res!466751) (not e!397555))))

(declare-fun lt!317749 () List!13274)

(assert (=> b!702928 (= res!466751 (= (-!261 lt!317750 k!2824) lt!317749))))

(declare-fun b!702929 () Bool)

(declare-fun res!466736 () Bool)

(assert (=> b!702929 (=> (not res!466736) (not e!397553))))

(assert (=> b!702929 (= res!466736 (not (contains!3851 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702930 () Bool)

(declare-fun res!466734 () Bool)

(assert (=> b!702930 (=> (not res!466734) (not e!397553))))

(declare-datatypes ((array!40153 0))(
  ( (array!40154 (arr!19233 (Array (_ BitVec 32) (_ BitVec 64))) (size!19618 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40153)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40153 (_ BitVec 32) List!13274) Bool)

(assert (=> b!702930 (= res!466734 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!702931 () Bool)

(declare-fun res!466747 () Bool)

(assert (=> b!702931 (=> (not res!466747) (not e!397553))))

(assert (=> b!702931 (= res!466747 (contains!3851 newAcc!49 k!2824))))

(declare-fun b!702932 () Bool)

(declare-fun res!466746 () Bool)

(assert (=> b!702932 (=> (not res!466746) (not e!397553))))

(assert (=> b!702932 (= res!466746 (not (contains!3851 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702933 () Bool)

(declare-fun res!466761 () Bool)

(assert (=> b!702933 (=> (not res!466761) (not e!397555))))

(declare-fun subseq!296 (List!13274 List!13274) Bool)

(assert (=> b!702933 (= res!466761 (subseq!296 lt!317749 lt!317750))))

(declare-fun b!702934 () Bool)

(declare-fun res!466740 () Bool)

(assert (=> b!702934 (=> (not res!466740) (not e!397555))))

(assert (=> b!702934 (= res!466740 (not (contains!3851 lt!317749 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702935 () Bool)

(declare-fun res!466757 () Bool)

(assert (=> b!702935 (=> (not res!466757) (not e!397553))))

(assert (=> b!702935 (= res!466757 (not (contains!3851 acc!652 k!2824)))))

(declare-fun res!466748 () Bool)

(assert (=> start!62474 (=> (not res!466748) (not e!397553))))

(assert (=> start!62474 (= res!466748 (and (bvslt (size!19618 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19618 a!3591))))))

(assert (=> start!62474 e!397553))

(assert (=> start!62474 true))

(declare-fun array_inv!15029 (array!40153) Bool)

(assert (=> start!62474 (array_inv!15029 a!3591)))

(declare-fun b!702925 () Bool)

(declare-fun res!466753 () Bool)

(assert (=> b!702925 (=> (not res!466753) (not e!397553))))

(assert (=> b!702925 (= res!466753 (subseq!296 acc!652 newAcc!49))))

(declare-fun b!702936 () Bool)

(declare-fun res!466750 () Bool)

(assert (=> b!702936 (=> (not res!466750) (not e!397555))))

(assert (=> b!702936 (= res!466750 (noDuplicate!1098 lt!317749))))

(declare-fun b!702937 () Bool)

(declare-fun res!466744 () Bool)

(assert (=> b!702937 (=> (not res!466744) (not e!397553))))

(assert (=> b!702937 (= res!466744 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19618 a!3591)))))

(declare-fun b!702938 () Bool)

(declare-fun res!466758 () Bool)

(assert (=> b!702938 (=> (not res!466758) (not e!397555))))

(declare-fun arrayContainsKey!0 (array!40153 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!702938 (= res!466758 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!702939 () Bool)

(declare-fun res!466752 () Bool)

(assert (=> b!702939 (=> (not res!466752) (not e!397555))))

(assert (=> b!702939 (= res!466752 (not (contains!3851 lt!317750 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702940 () Bool)

(declare-fun res!466733 () Bool)

(assert (=> b!702940 (=> (not res!466733) (not e!397553))))

(assert (=> b!702940 (= res!466733 (not (contains!3851 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702941 () Bool)

(declare-fun res!466749 () Bool)

(assert (=> b!702941 (=> (not res!466749) (not e!397553))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!702941 (= res!466749 (validKeyInArray!0 (select (arr!19233 a!3591) from!2969)))))

(declare-fun b!702942 () Bool)

(declare-fun res!466742 () Bool)

(assert (=> b!702942 (=> (not res!466742) (not e!397553))))

(assert (=> b!702942 (= res!466742 (validKeyInArray!0 k!2824))))

(declare-fun b!702943 () Bool)

(declare-fun res!466741 () Bool)

(assert (=> b!702943 (=> (not res!466741) (not e!397555))))

(assert (=> b!702943 (= res!466741 (noDuplicate!1098 lt!317750))))

(declare-fun b!702944 () Bool)

(declare-fun res!466759 () Bool)

(assert (=> b!702944 (=> (not res!466759) (not e!397553))))

(assert (=> b!702944 (= res!466759 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!702945 () Bool)

(declare-fun res!466737 () Bool)

(assert (=> b!702945 (=> (not res!466737) (not e!397555))))

(assert (=> b!702945 (= res!466737 (not (contains!3851 lt!317749 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702946 () Bool)

(assert (=> b!702946 (= e!397555 (not true))))

(assert (=> b!702946 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317750)))

(declare-datatypes ((Unit!24600 0))(
  ( (Unit!24601) )
))
(declare-fun lt!317751 () Unit!24600)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40153 (_ BitVec 64) (_ BitVec 32) List!13274 List!13274) Unit!24600)

(assert (=> b!702946 (= lt!317751 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969) lt!317749 lt!317750))))

(declare-fun b!702947 () Bool)

(declare-fun res!466756 () Bool)

(assert (=> b!702947 (=> (not res!466756) (not e!397555))))

(assert (=> b!702947 (= res!466756 (not (contains!3851 lt!317749 k!2824)))))

(declare-fun b!702948 () Bool)

(declare-fun res!466760 () Bool)

(assert (=> b!702948 (=> (not res!466760) (not e!397555))))

(assert (=> b!702948 (= res!466760 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317749))))

(declare-fun b!702949 () Bool)

(assert (=> b!702949 (= e!397553 e!397555)))

(declare-fun res!466743 () Bool)

(assert (=> b!702949 (=> (not res!466743) (not e!397555))))

(assert (=> b!702949 (= res!466743 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!494 (List!13274 (_ BitVec 64)) List!13274)

(assert (=> b!702949 (= lt!317750 ($colon$colon!494 newAcc!49 (select (arr!19233 a!3591) from!2969)))))

(assert (=> b!702949 (= lt!317749 ($colon$colon!494 acc!652 (select (arr!19233 a!3591) from!2969)))))

(declare-fun b!702950 () Bool)

(declare-fun res!466739 () Bool)

(assert (=> b!702950 (=> (not res!466739) (not e!397553))))

(assert (=> b!702950 (= res!466739 (noDuplicate!1098 newAcc!49))))

(declare-fun b!702951 () Bool)

(declare-fun res!466754 () Bool)

(assert (=> b!702951 (=> (not res!466754) (not e!397555))))

(assert (=> b!702951 (= res!466754 (contains!3851 lt!317750 k!2824))))

(assert (= (and start!62474 res!466748) b!702923))

(assert (= (and b!702923 res!466755) b!702950))

(assert (= (and b!702950 res!466739) b!702929))

(assert (= (and b!702929 res!466736) b!702932))

(assert (= (and b!702932 res!466746) b!702944))

(assert (= (and b!702944 res!466759) b!702935))

(assert (= (and b!702935 res!466757) b!702942))

(assert (= (and b!702942 res!466742) b!702930))

(assert (= (and b!702930 res!466734) b!702925))

(assert (= (and b!702925 res!466753) b!702931))

(assert (= (and b!702931 res!466747) b!702927))

(assert (= (and b!702927 res!466735) b!702924))

(assert (= (and b!702924 res!466738) b!702940))

(assert (= (and b!702940 res!466733) b!702937))

(assert (= (and b!702937 res!466744) b!702941))

(assert (= (and b!702941 res!466749) b!702949))

(assert (= (and b!702949 res!466743) b!702936))

(assert (= (and b!702936 res!466750) b!702943))

(assert (= (and b!702943 res!466741) b!702945))

(assert (= (and b!702945 res!466737) b!702934))

(assert (= (and b!702934 res!466740) b!702938))

(assert (= (and b!702938 res!466758) b!702947))

(assert (= (and b!702947 res!466756) b!702948))

(assert (= (and b!702948 res!466760) b!702933))

(assert (= (and b!702933 res!466761) b!702951))

(assert (= (and b!702951 res!466754) b!702928))

(assert (= (and b!702928 res!466751) b!702926))

(assert (= (and b!702926 res!466745) b!702939))

(assert (= (and b!702939 res!466752) b!702946))

(declare-fun m!661891 () Bool)

(assert (=> b!702926 m!661891))

(declare-fun m!661893 () Bool)

(assert (=> b!702941 m!661893))

(assert (=> b!702941 m!661893))

(declare-fun m!661895 () Bool)

(assert (=> b!702941 m!661895))

(declare-fun m!661897 () Bool)

(assert (=> b!702934 m!661897))

(declare-fun m!661899 () Bool)

(assert (=> start!62474 m!661899))

(declare-fun m!661901 () Bool)

(assert (=> b!702950 m!661901))

(declare-fun m!661903 () Bool)

(assert (=> b!702931 m!661903))

(declare-fun m!661905 () Bool)

(assert (=> b!702932 m!661905))

(declare-fun m!661907 () Bool)

(assert (=> b!702942 m!661907))

(declare-fun m!661909 () Bool)

(assert (=> b!702929 m!661909))

(declare-fun m!661911 () Bool)

(assert (=> b!702933 m!661911))

(assert (=> b!702949 m!661893))

(assert (=> b!702949 m!661893))

(declare-fun m!661913 () Bool)

(assert (=> b!702949 m!661913))

(assert (=> b!702949 m!661893))

(declare-fun m!661915 () Bool)

(assert (=> b!702949 m!661915))

(declare-fun m!661917 () Bool)

(assert (=> b!702939 m!661917))

(declare-fun m!661919 () Bool)

(assert (=> b!702938 m!661919))

(declare-fun m!661921 () Bool)

(assert (=> b!702935 m!661921))

(declare-fun m!661923 () Bool)

(assert (=> b!702924 m!661923))

(declare-fun m!661925 () Bool)

(assert (=> b!702951 m!661925))

(declare-fun m!661927 () Bool)

(assert (=> b!702940 m!661927))

(declare-fun m!661929 () Bool)

(assert (=> b!702943 m!661929))

(declare-fun m!661931 () Bool)

(assert (=> b!702945 m!661931))

(declare-fun m!661933 () Bool)

(assert (=> b!702944 m!661933))

(declare-fun m!661935 () Bool)

(assert (=> b!702947 m!661935))

(declare-fun m!661937 () Bool)

(assert (=> b!702946 m!661937))

(declare-fun m!661939 () Bool)

(assert (=> b!702946 m!661939))

(declare-fun m!661941 () Bool)

(assert (=> b!702923 m!661941))

(declare-fun m!661943 () Bool)

(assert (=> b!702927 m!661943))

(declare-fun m!661945 () Bool)

(assert (=> b!702948 m!661945))

(declare-fun m!661947 () Bool)

(assert (=> b!702928 m!661947))

(declare-fun m!661949 () Bool)

(assert (=> b!702925 m!661949))

(declare-fun m!661951 () Bool)

(assert (=> b!702930 m!661951))

(declare-fun m!661953 () Bool)

(assert (=> b!702936 m!661953))

(push 1)

