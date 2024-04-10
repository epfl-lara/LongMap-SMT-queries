; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62582 () Bool)

(assert start!62582)

(declare-fun b!705945 () Bool)

(declare-fun res!469757 () Bool)

(declare-fun e!397884 () Bool)

(assert (=> b!705945 (=> (not res!469757) (not e!397884))))

(declare-datatypes ((List!13328 0))(
  ( (Nil!13325) (Cons!13324 (h!14369 (_ BitVec 64)) (t!19610 List!13328)) )
))
(declare-fun acc!652 () List!13328)

(declare-fun newAcc!49 () List!13328)

(declare-fun subseq!350 (List!13328 List!13328) Bool)

(assert (=> b!705945 (= res!469757 (subseq!350 acc!652 newAcc!49))))

(declare-fun b!705946 () Bool)

(declare-fun res!469769 () Bool)

(assert (=> b!705946 (=> (not res!469769) (not e!397884))))

(declare-datatypes ((array!40261 0))(
  ( (array!40262 (arr!19287 (Array (_ BitVec 32) (_ BitVec 64))) (size!19672 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40261)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40261 (_ BitVec 32) List!13328) Bool)

(assert (=> b!705946 (= res!469769 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!705947 () Bool)

(declare-fun res!469772 () Bool)

(assert (=> b!705947 (=> (not res!469772) (not e!397884))))

(declare-fun contains!3905 (List!13328 (_ BitVec 64)) Bool)

(assert (=> b!705947 (= res!469772 (not (contains!3905 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705948 () Bool)

(declare-fun res!469761 () Bool)

(assert (=> b!705948 (=> (not res!469761) (not e!397884))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!705948 (= res!469761 (validKeyInArray!0 k!2824))))

(declare-fun b!705949 () Bool)

(assert (=> b!705949 (= e!397884 (not true))))

(assert (=> b!705949 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49)))

(declare-datatypes ((Unit!24624 0))(
  ( (Unit!24625) )
))
(declare-fun lt!317925 () Unit!24624)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40261 (_ BitVec 64) (_ BitVec 32) List!13328 List!13328) Unit!24624)

(assert (=> b!705949 (= lt!317925 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49))))

(declare-fun b!705950 () Bool)

(declare-fun res!469768 () Bool)

(assert (=> b!705950 (=> (not res!469768) (not e!397884))))

(declare-fun arrayContainsKey!0 (array!40261 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!705950 (= res!469768 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!705951 () Bool)

(declare-fun res!469771 () Bool)

(assert (=> b!705951 (=> (not res!469771) (not e!397884))))

(assert (=> b!705951 (= res!469771 (not (contains!3905 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705952 () Bool)

(declare-fun res!469762 () Bool)

(assert (=> b!705952 (=> (not res!469762) (not e!397884))))

(assert (=> b!705952 (= res!469762 (contains!3905 newAcc!49 k!2824))))

(declare-fun b!705953 () Bool)

(declare-fun res!469756 () Bool)

(assert (=> b!705953 (=> (not res!469756) (not e!397884))))

(declare-fun noDuplicate!1152 (List!13328) Bool)

(assert (=> b!705953 (= res!469756 (noDuplicate!1152 newAcc!49))))

(declare-fun b!705954 () Bool)

(declare-fun res!469773 () Bool)

(assert (=> b!705954 (=> (not res!469773) (not e!397884))))

(assert (=> b!705954 (= res!469773 (not (validKeyInArray!0 (select (arr!19287 a!3591) from!2969))))))

(declare-fun b!705956 () Bool)

(declare-fun res!469765 () Bool)

(assert (=> b!705956 (=> (not res!469765) (not e!397884))))

(assert (=> b!705956 (= res!469765 (noDuplicate!1152 acc!652))))

(declare-fun b!705957 () Bool)

(declare-fun res!469760 () Bool)

(assert (=> b!705957 (=> (not res!469760) (not e!397884))))

(assert (=> b!705957 (= res!469760 (not (contains!3905 acc!652 k!2824)))))

(declare-fun b!705958 () Bool)

(declare-fun res!469763 () Bool)

(assert (=> b!705958 (=> (not res!469763) (not e!397884))))

(assert (=> b!705958 (= res!469763 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19672 a!3591)))))

(declare-fun b!705959 () Bool)

(declare-fun res!469770 () Bool)

(assert (=> b!705959 (=> (not res!469770) (not e!397884))))

(declare-fun -!315 (List!13328 (_ BitVec 64)) List!13328)

(assert (=> b!705959 (= res!469770 (= (-!315 newAcc!49 k!2824) acc!652))))

(declare-fun b!705960 () Bool)

(declare-fun res!469759 () Bool)

(assert (=> b!705960 (=> (not res!469759) (not e!397884))))

(assert (=> b!705960 (= res!469759 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!705961 () Bool)

(declare-fun res!469758 () Bool)

(assert (=> b!705961 (=> (not res!469758) (not e!397884))))

(assert (=> b!705961 (= res!469758 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!705962 () Bool)

(declare-fun res!469764 () Bool)

(assert (=> b!705962 (=> (not res!469764) (not e!397884))))

(assert (=> b!705962 (= res!469764 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!705963 () Bool)

(declare-fun res!469766 () Bool)

(assert (=> b!705963 (=> (not res!469766) (not e!397884))))

(assert (=> b!705963 (= res!469766 (not (contains!3905 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705955 () Bool)

(declare-fun res!469767 () Bool)

(assert (=> b!705955 (=> (not res!469767) (not e!397884))))

(assert (=> b!705955 (= res!469767 (not (contains!3905 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!469755 () Bool)

(assert (=> start!62582 (=> (not res!469755) (not e!397884))))

(assert (=> start!62582 (= res!469755 (and (bvslt (size!19672 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19672 a!3591))))))

(assert (=> start!62582 e!397884))

(assert (=> start!62582 true))

(declare-fun array_inv!15083 (array!40261) Bool)

(assert (=> start!62582 (array_inv!15083 a!3591)))

(assert (= (and start!62582 res!469755) b!705956))

(assert (= (and b!705956 res!469765) b!705953))

(assert (= (and b!705953 res!469756) b!705947))

(assert (= (and b!705947 res!469772) b!705963))

(assert (= (and b!705963 res!469766) b!705962))

(assert (= (and b!705962 res!469764) b!705957))

(assert (= (and b!705957 res!469760) b!705948))

(assert (= (and b!705948 res!469761) b!705961))

(assert (= (and b!705961 res!469758) b!705945))

(assert (= (and b!705945 res!469757) b!705952))

(assert (= (and b!705952 res!469762) b!705959))

(assert (= (and b!705959 res!469770) b!705955))

(assert (= (and b!705955 res!469767) b!705951))

(assert (= (and b!705951 res!469771) b!705958))

(assert (= (and b!705958 res!469763) b!705954))

(assert (= (and b!705954 res!469773) b!705960))

(assert (= (and b!705960 res!469759) b!705950))

(assert (= (and b!705950 res!469768) b!705946))

(assert (= (and b!705946 res!469769) b!705949))

(declare-fun m!663955 () Bool)

(assert (=> b!705950 m!663955))

(declare-fun m!663957 () Bool)

(assert (=> b!705962 m!663957))

(declare-fun m!663959 () Bool)

(assert (=> b!705945 m!663959))

(declare-fun m!663961 () Bool)

(assert (=> b!705951 m!663961))

(declare-fun m!663963 () Bool)

(assert (=> b!705955 m!663963))

(declare-fun m!663965 () Bool)

(assert (=> b!705953 m!663965))

(declare-fun m!663967 () Bool)

(assert (=> b!705948 m!663967))

(declare-fun m!663969 () Bool)

(assert (=> b!705947 m!663969))

(declare-fun m!663971 () Bool)

(assert (=> b!705959 m!663971))

(declare-fun m!663973 () Bool)

(assert (=> b!705956 m!663973))

(declare-fun m!663975 () Bool)

(assert (=> b!705946 m!663975))

(declare-fun m!663977 () Bool)

(assert (=> b!705957 m!663977))

(declare-fun m!663979 () Bool)

(assert (=> b!705954 m!663979))

(assert (=> b!705954 m!663979))

(declare-fun m!663981 () Bool)

(assert (=> b!705954 m!663981))

(declare-fun m!663983 () Bool)

(assert (=> b!705949 m!663983))

(declare-fun m!663985 () Bool)

(assert (=> b!705949 m!663985))

(declare-fun m!663987 () Bool)

(assert (=> b!705961 m!663987))

(declare-fun m!663989 () Bool)

(assert (=> b!705952 m!663989))

(declare-fun m!663991 () Bool)

(assert (=> start!62582 m!663991))

(declare-fun m!663993 () Bool)

(assert (=> b!705963 m!663993))

(push 1)

(assert (not b!705951))

(assert (not b!705954))

(assert (not b!705963))

(assert (not b!705946))

(assert (not b!705955))

(assert (not b!705962))

(assert (not b!705950))

(assert (not b!705945))

(assert (not b!705961))

(assert (not start!62582))

(assert (not b!705959))

(assert (not b!705956))

(assert (not b!705949))

(assert (not b!705948))

(assert (not b!705953))

(assert (not b!705947))

(assert (not b!705957))

(assert (not b!705952))

(check-sat)

