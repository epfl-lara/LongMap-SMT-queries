; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102836 () Bool)

(assert start!102836)

(declare-fun b!1236016 () Bool)

(declare-fun res!824050 () Bool)

(declare-fun e!700674 () Bool)

(assert (=> b!1236016 (=> (not res!824050) (not e!700674))))

(declare-datatypes ((List!27221 0))(
  ( (Nil!27218) (Cons!27217 (h!28426 (_ BitVec 64)) (t!40684 List!27221)) )
))
(declare-fun acc!846 () List!27221)

(declare-fun contains!7283 (List!27221 (_ BitVec 64)) Bool)

(assert (=> b!1236016 (= res!824050 (not (contains!7283 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236017 () Bool)

(declare-fun res!824044 () Bool)

(assert (=> b!1236017 (=> (not res!824044) (not e!700674))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79681 0))(
  ( (array!79682 (arr!38448 (Array (_ BitVec 32) (_ BitVec 64))) (size!38984 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79681)

(assert (=> b!1236017 (= res!824044 (not (= from!3213 (bvsub (size!38984 a!3835) #b00000000000000000000000000000001))))))

(declare-fun res!824043 () Bool)

(assert (=> start!102836 (=> (not res!824043) (not e!700674))))

(assert (=> start!102836 (= res!824043 (and (bvslt (size!38984 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38984 a!3835))))))

(assert (=> start!102836 e!700674))

(declare-fun array_inv!29296 (array!79681) Bool)

(assert (=> start!102836 (array_inv!29296 a!3835)))

(assert (=> start!102836 true))

(declare-fun b!1236018 () Bool)

(declare-datatypes ((Unit!40988 0))(
  ( (Unit!40989) )
))
(declare-fun e!700675 () Unit!40988)

(declare-fun lt!560636 () Unit!40988)

(assert (=> b!1236018 (= e!700675 lt!560636)))

(declare-fun lt!560638 () List!27221)

(assert (=> b!1236018 (= lt!560638 (Cons!27217 (select (arr!38448 a!3835) from!3213) acc!846))))

(declare-fun lt!560635 () Unit!40988)

(declare-fun lemmaListSubSeqRefl!0 (List!27221) Unit!40988)

(assert (=> b!1236018 (= lt!560635 (lemmaListSubSeqRefl!0 lt!560638))))

(declare-fun subseq!555 (List!27221 List!27221) Bool)

(assert (=> b!1236018 (subseq!555 lt!560638 lt!560638)))

(declare-fun lt!560634 () Unit!40988)

(declare-fun subseqTail!48 (List!27221 List!27221) Unit!40988)

(assert (=> b!1236018 (= lt!560634 (subseqTail!48 lt!560638 lt!560638))))

(assert (=> b!1236018 (subseq!555 acc!846 lt!560638)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79681 List!27221 List!27221 (_ BitVec 32)) Unit!40988)

(assert (=> b!1236018 (= lt!560636 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560638 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79681 (_ BitVec 32) List!27221) Bool)

(assert (=> b!1236018 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1236019 () Bool)

(declare-fun e!700677 () Bool)

(assert (=> b!1236019 (= e!700677 (not true))))

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1236019 (not (arrayContainsKey!0 a!3835 k0!2925 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun lt!560637 () Unit!40988)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79681 (_ BitVec 32) (_ BitVec 64) List!27221) Unit!40988)

(assert (=> b!1236019 (= lt!560637 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) k0!2925 acc!846))))

(declare-fun b!1236020 () Bool)

(declare-fun res!824046 () Bool)

(assert (=> b!1236020 (=> (not res!824046) (not e!700674))))

(assert (=> b!1236020 (= res!824046 (not (contains!7283 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236021 () Bool)

(declare-fun res!824049 () Bool)

(assert (=> b!1236021 (=> (not res!824049) (not e!700674))))

(declare-fun noDuplicate!1880 (List!27221) Bool)

(assert (=> b!1236021 (= res!824049 (noDuplicate!1880 acc!846))))

(declare-fun b!1236022 () Bool)

(declare-fun res!824045 () Bool)

(assert (=> b!1236022 (=> (not res!824045) (not e!700674))))

(assert (=> b!1236022 (= res!824045 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236023 () Bool)

(declare-fun res!824048 () Bool)

(assert (=> b!1236023 (=> (not res!824048) (not e!700674))))

(assert (=> b!1236023 (= res!824048 (contains!7283 acc!846 k0!2925))))

(declare-fun b!1236024 () Bool)

(declare-fun res!824042 () Bool)

(assert (=> b!1236024 (=> (not res!824042) (not e!700677))))

(assert (=> b!1236024 (= res!824042 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1236025 () Bool)

(assert (=> b!1236025 (= e!700674 e!700677)))

(declare-fun res!824047 () Bool)

(assert (=> b!1236025 (=> (not res!824047) (not e!700677))))

(assert (=> b!1236025 (= res!824047 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38984 a!3835))))))

(declare-fun lt!560639 () Unit!40988)

(assert (=> b!1236025 (= lt!560639 e!700675)))

(declare-fun c!120847 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236025 (= c!120847 (validKeyInArray!0 (select (arr!38448 a!3835) from!3213)))))

(declare-fun b!1236026 () Bool)

(declare-fun Unit!40990 () Unit!40988)

(assert (=> b!1236026 (= e!700675 Unit!40990)))

(assert (= (and start!102836 res!824043) b!1236021))

(assert (= (and b!1236021 res!824049) b!1236020))

(assert (= (and b!1236020 res!824046) b!1236016))

(assert (= (and b!1236016 res!824050) b!1236022))

(assert (= (and b!1236022 res!824045) b!1236023))

(assert (= (and b!1236023 res!824048) b!1236017))

(assert (= (and b!1236017 res!824044) b!1236025))

(assert (= (and b!1236025 c!120847) b!1236018))

(assert (= (and b!1236025 (not c!120847)) b!1236026))

(assert (= (and b!1236025 res!824047) b!1236024))

(assert (= (and b!1236024 res!824042) b!1236019))

(declare-fun m!1139859 () Bool)

(assert (=> b!1236016 m!1139859))

(declare-fun m!1139861 () Bool)

(assert (=> b!1236025 m!1139861))

(assert (=> b!1236025 m!1139861))

(declare-fun m!1139863 () Bool)

(assert (=> b!1236025 m!1139863))

(declare-fun m!1139865 () Bool)

(assert (=> b!1236023 m!1139865))

(declare-fun m!1139867 () Bool)

(assert (=> start!102836 m!1139867))

(declare-fun m!1139869 () Bool)

(assert (=> b!1236019 m!1139869))

(declare-fun m!1139871 () Bool)

(assert (=> b!1236019 m!1139871))

(declare-fun m!1139873 () Bool)

(assert (=> b!1236018 m!1139873))

(declare-fun m!1139875 () Bool)

(assert (=> b!1236018 m!1139875))

(declare-fun m!1139877 () Bool)

(assert (=> b!1236018 m!1139877))

(declare-fun m!1139879 () Bool)

(assert (=> b!1236018 m!1139879))

(declare-fun m!1139881 () Bool)

(assert (=> b!1236018 m!1139881))

(declare-fun m!1139883 () Bool)

(assert (=> b!1236018 m!1139883))

(assert (=> b!1236018 m!1139861))

(assert (=> b!1236024 m!1139883))

(declare-fun m!1139885 () Bool)

(assert (=> b!1236022 m!1139885))

(declare-fun m!1139887 () Bool)

(assert (=> b!1236020 m!1139887))

(declare-fun m!1139889 () Bool)

(assert (=> b!1236021 m!1139889))

(check-sat (not b!1236022) (not b!1236020) (not b!1236021) (not b!1236016) (not b!1236023) (not b!1236019) (not b!1236024) (not b!1236018) (not start!102836) (not b!1236025))
(check-sat)
