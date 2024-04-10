; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101988 () Bool)

(assert start!101988)

(declare-fun b!1227949 () Bool)

(declare-fun res!816562 () Bool)

(declare-fun e!697103 () Bool)

(assert (=> b!1227949 (=> (not res!816562) (not e!697103))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227949 (= res!816562 (validKeyInArray!0 k0!2913))))

(declare-fun b!1227951 () Bool)

(declare-fun e!697101 () Bool)

(assert (=> b!1227951 (= e!697101 true)))

(declare-datatypes ((Unit!40672 0))(
  ( (Unit!40673) )
))
(declare-fun lt!558954 () Unit!40672)

(declare-datatypes ((List!27026 0))(
  ( (Nil!27023) (Cons!27022 (h!28231 (_ BitVec 64)) (t!40489 List!27026)) )
))
(declare-fun acc!823 () List!27026)

(declare-fun noDuplicateSubseq!45 (List!27026 List!27026) Unit!40672)

(assert (=> b!1227951 (= lt!558954 (noDuplicateSubseq!45 Nil!27023 acc!823))))

(declare-fun b!1227952 () Bool)

(declare-fun res!816571 () Bool)

(assert (=> b!1227952 (=> res!816571 e!697101)))

(declare-fun contains!7088 (List!27026 (_ BitVec 64)) Bool)

(assert (=> b!1227952 (= res!816571 (contains!7088 Nil!27023 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227953 () Bool)

(declare-fun res!816561 () Bool)

(assert (=> b!1227953 (=> (not res!816561) (not e!697103))))

(assert (=> b!1227953 (= res!816561 (not (contains!7088 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227954 () Bool)

(declare-fun res!816573 () Bool)

(assert (=> b!1227954 (=> (not res!816573) (not e!697103))))

(assert (=> b!1227954 (= res!816573 (not (contains!7088 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227955 () Bool)

(declare-fun res!816572 () Bool)

(assert (=> b!1227955 (=> (not res!816572) (not e!697103))))

(declare-fun noDuplicate!1685 (List!27026) Bool)

(assert (=> b!1227955 (= res!816572 (noDuplicate!1685 acc!823))))

(declare-fun b!1227956 () Bool)

(assert (=> b!1227956 (= e!697103 (not e!697101))))

(declare-fun res!816563 () Bool)

(assert (=> b!1227956 (=> res!816563 e!697101)))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79261 0))(
  ( (array!79262 (arr!38253 (Array (_ BitVec 32) (_ BitVec 64))) (size!38789 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79261)

(assert (=> b!1227956 (= res!816563 (bvsgt from!3184 (size!38789 a!3806)))))

(declare-fun arrayNoDuplicates!0 (array!79261 (_ BitVec 32) List!27026) Bool)

(assert (=> b!1227956 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27022 (select (arr!38253 a!3806) from!3184) acc!823))))

(declare-fun b!1227957 () Bool)

(declare-fun res!816569 () Bool)

(assert (=> b!1227957 (=> res!816569 e!697101)))

(assert (=> b!1227957 (= res!816569 (contains!7088 Nil!27023 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227950 () Bool)

(declare-fun res!816567 () Bool)

(assert (=> b!1227950 (=> (not res!816567) (not e!697103))))

(declare-fun arrayContainsKey!0 (array!79261 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1227950 (= res!816567 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun res!816568 () Bool)

(assert (=> start!101988 (=> (not res!816568) (not e!697103))))

(assert (=> start!101988 (= res!816568 (bvslt (size!38789 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101988 e!697103))

(declare-fun array_inv!29101 (array!79261) Bool)

(assert (=> start!101988 (array_inv!29101 a!3806)))

(assert (=> start!101988 true))

(declare-fun b!1227958 () Bool)

(declare-fun res!816566 () Bool)

(assert (=> b!1227958 (=> (not res!816566) (not e!697103))))

(assert (=> b!1227958 (= res!816566 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1227959 () Bool)

(declare-fun res!816565 () Bool)

(assert (=> b!1227959 (=> (not res!816565) (not e!697103))))

(assert (=> b!1227959 (= res!816565 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38789 a!3806)) (bvslt from!3184 (size!38789 a!3806))))))

(declare-fun b!1227960 () Bool)

(declare-fun res!816564 () Bool)

(assert (=> b!1227960 (=> (not res!816564) (not e!697103))))

(assert (=> b!1227960 (= res!816564 (validKeyInArray!0 (select (arr!38253 a!3806) from!3184)))))

(declare-fun b!1227961 () Bool)

(declare-fun res!816570 () Bool)

(assert (=> b!1227961 (=> res!816570 e!697101)))

(declare-fun subseq!492 (List!27026 List!27026) Bool)

(assert (=> b!1227961 (= res!816570 (not (subseq!492 Nil!27023 acc!823)))))

(assert (= (and start!101988 res!816568) b!1227949))

(assert (= (and b!1227949 res!816562) b!1227959))

(assert (= (and b!1227959 res!816565) b!1227955))

(assert (= (and b!1227955 res!816572) b!1227954))

(assert (= (and b!1227954 res!816573) b!1227953))

(assert (= (and b!1227953 res!816561) b!1227950))

(assert (= (and b!1227950 res!816567) b!1227958))

(assert (= (and b!1227958 res!816566) b!1227960))

(assert (= (and b!1227960 res!816564) b!1227956))

(assert (= (and b!1227956 (not res!816563)) b!1227952))

(assert (= (and b!1227952 (not res!816571)) b!1227957))

(assert (= (and b!1227957 (not res!816569)) b!1227961))

(assert (= (and b!1227961 (not res!816570)) b!1227951))

(declare-fun m!1132591 () Bool)

(assert (=> b!1227956 m!1132591))

(declare-fun m!1132593 () Bool)

(assert (=> b!1227956 m!1132593))

(declare-fun m!1132595 () Bool)

(assert (=> b!1227958 m!1132595))

(declare-fun m!1132597 () Bool)

(assert (=> b!1227954 m!1132597))

(declare-fun m!1132599 () Bool)

(assert (=> b!1227953 m!1132599))

(declare-fun m!1132601 () Bool)

(assert (=> b!1227961 m!1132601))

(declare-fun m!1132603 () Bool)

(assert (=> start!101988 m!1132603))

(assert (=> b!1227960 m!1132591))

(assert (=> b!1227960 m!1132591))

(declare-fun m!1132605 () Bool)

(assert (=> b!1227960 m!1132605))

(declare-fun m!1132607 () Bool)

(assert (=> b!1227951 m!1132607))

(declare-fun m!1132609 () Bool)

(assert (=> b!1227957 m!1132609))

(declare-fun m!1132611 () Bool)

(assert (=> b!1227955 m!1132611))

(declare-fun m!1132613 () Bool)

(assert (=> b!1227950 m!1132613))

(declare-fun m!1132615 () Bool)

(assert (=> b!1227949 m!1132615))

(declare-fun m!1132617 () Bool)

(assert (=> b!1227952 m!1132617))

(check-sat (not b!1227950) (not b!1227953) (not b!1227960) (not b!1227954) (not start!101988) (not b!1227952) (not b!1227956) (not b!1227951) (not b!1227957) (not b!1227961) (not b!1227955) (not b!1227958) (not b!1227949))
(check-sat)
