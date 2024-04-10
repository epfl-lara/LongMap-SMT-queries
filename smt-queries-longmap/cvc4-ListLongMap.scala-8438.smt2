; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102766 () Bool)

(assert start!102766)

(declare-fun b!1234887 () Bool)

(declare-fun res!823060 () Bool)

(declare-fun e!700291 () Bool)

(assert (=> b!1234887 (=> (not res!823060) (not e!700291))))

(declare-datatypes ((List!27186 0))(
  ( (Nil!27183) (Cons!27182 (h!28391 (_ BitVec 64)) (t!40649 List!27186)) )
))
(declare-fun acc!846 () List!27186)

(declare-fun contains!7248 (List!27186 (_ BitVec 64)) Bool)

(assert (=> b!1234887 (= res!823060 (not (contains!7248 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234888 () Bool)

(declare-fun res!823054 () Bool)

(declare-fun e!700292 () Bool)

(assert (=> b!1234888 (=> res!823054 e!700292)))

(declare-fun lt!560041 () List!27186)

(declare-fun noDuplicate!1845 (List!27186) Bool)

(assert (=> b!1234888 (= res!823054 (not (noDuplicate!1845 lt!560041)))))

(declare-fun b!1234889 () Bool)

(declare-fun res!823058 () Bool)

(assert (=> b!1234889 (=> (not res!823058) (not e!700291))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1234889 (= res!823058 (contains!7248 acc!846 k!2925))))

(declare-fun b!1234890 () Bool)

(declare-fun res!823055 () Bool)

(assert (=> b!1234890 (=> (not res!823055) (not e!700291))))

(assert (=> b!1234890 (= res!823055 (noDuplicate!1845 acc!846))))

(declare-fun res!823049 () Bool)

(assert (=> start!102766 (=> (not res!823049) (not e!700291))))

(declare-datatypes ((array!79611 0))(
  ( (array!79612 (arr!38413 (Array (_ BitVec 32) (_ BitVec 64))) (size!38949 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79611)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102766 (= res!823049 (and (bvslt (size!38949 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38949 a!3835))))))

(assert (=> start!102766 e!700291))

(declare-fun array_inv!29261 (array!79611) Bool)

(assert (=> start!102766 (array_inv!29261 a!3835)))

(assert (=> start!102766 true))

(declare-fun b!1234891 () Bool)

(declare-fun res!823052 () Bool)

(assert (=> b!1234891 (=> (not res!823052) (not e!700291))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1234891 (= res!823052 (validKeyInArray!0 (select (arr!38413 a!3835) from!3213)))))

(declare-fun b!1234892 () Bool)

(assert (=> b!1234892 (= e!700292 true)))

(declare-fun lt!560045 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79611 (_ BitVec 32) List!27186) Bool)

(assert (=> b!1234892 (= lt!560045 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!560041))))

(declare-datatypes ((Unit!40896 0))(
  ( (Unit!40897) )
))
(declare-fun lt!560043 () Unit!40896)

(declare-fun noDuplicateSubseq!67 (List!27186 List!27186) Unit!40896)

(assert (=> b!1234892 (= lt!560043 (noDuplicateSubseq!67 acc!846 lt!560041))))

(declare-fun b!1234893 () Bool)

(assert (=> b!1234893 (= e!700291 (not e!700292))))

(declare-fun res!823053 () Bool)

(assert (=> b!1234893 (=> res!823053 e!700292)))

(assert (=> b!1234893 (= res!823053 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!520 (List!27186 List!27186) Bool)

(assert (=> b!1234893 (subseq!520 acc!846 lt!560041)))

(declare-fun lt!560044 () Unit!40896)

(declare-fun subseqTail!13 (List!27186 List!27186) Unit!40896)

(assert (=> b!1234893 (= lt!560044 (subseqTail!13 lt!560041 lt!560041))))

(assert (=> b!1234893 (subseq!520 lt!560041 lt!560041)))

(declare-fun lt!560042 () Unit!40896)

(declare-fun lemmaListSubSeqRefl!0 (List!27186) Unit!40896)

(assert (=> b!1234893 (= lt!560042 (lemmaListSubSeqRefl!0 lt!560041))))

(assert (=> b!1234893 (= lt!560041 (Cons!27182 (select (arr!38413 a!3835) from!3213) acc!846))))

(declare-fun b!1234894 () Bool)

(declare-fun res!823051 () Bool)

(assert (=> b!1234894 (=> (not res!823051) (not e!700291))))

(assert (=> b!1234894 (= res!823051 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1234895 () Bool)

(declare-fun res!823056 () Bool)

(assert (=> b!1234895 (=> res!823056 e!700292)))

(assert (=> b!1234895 (= res!823056 (contains!7248 lt!560041 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234896 () Bool)

(declare-fun res!823059 () Bool)

(assert (=> b!1234896 (=> (not res!823059) (not e!700291))))

(assert (=> b!1234896 (= res!823059 (not (= from!3213 (bvsub (size!38949 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1234897 () Bool)

(declare-fun res!823050 () Bool)

(assert (=> b!1234897 (=> (not res!823050) (not e!700291))))

(assert (=> b!1234897 (= res!823050 (not (contains!7248 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234898 () Bool)

(declare-fun res!823057 () Bool)

(assert (=> b!1234898 (=> res!823057 e!700292)))

(assert (=> b!1234898 (= res!823057 (contains!7248 lt!560041 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!102766 res!823049) b!1234890))

(assert (= (and b!1234890 res!823055) b!1234897))

(assert (= (and b!1234897 res!823050) b!1234887))

(assert (= (and b!1234887 res!823060) b!1234894))

(assert (= (and b!1234894 res!823051) b!1234889))

(assert (= (and b!1234889 res!823058) b!1234896))

(assert (= (and b!1234896 res!823059) b!1234891))

(assert (= (and b!1234891 res!823052) b!1234893))

(assert (= (and b!1234893 (not res!823053)) b!1234888))

(assert (= (and b!1234888 (not res!823054)) b!1234895))

(assert (= (and b!1234895 (not res!823056)) b!1234898))

(assert (= (and b!1234898 (not res!823057)) b!1234892))

(declare-fun m!1138797 () Bool)

(assert (=> start!102766 m!1138797))

(declare-fun m!1138799 () Bool)

(assert (=> b!1234895 m!1138799))

(declare-fun m!1138801 () Bool)

(assert (=> b!1234894 m!1138801))

(declare-fun m!1138803 () Bool)

(assert (=> b!1234898 m!1138803))

(declare-fun m!1138805 () Bool)

(assert (=> b!1234891 m!1138805))

(assert (=> b!1234891 m!1138805))

(declare-fun m!1138807 () Bool)

(assert (=> b!1234891 m!1138807))

(declare-fun m!1138809 () Bool)

(assert (=> b!1234887 m!1138809))

(declare-fun m!1138811 () Bool)

(assert (=> b!1234892 m!1138811))

(declare-fun m!1138813 () Bool)

(assert (=> b!1234892 m!1138813))

(declare-fun m!1138815 () Bool)

(assert (=> b!1234893 m!1138815))

(declare-fun m!1138817 () Bool)

(assert (=> b!1234893 m!1138817))

(declare-fun m!1138819 () Bool)

(assert (=> b!1234893 m!1138819))

(declare-fun m!1138821 () Bool)

(assert (=> b!1234893 m!1138821))

(assert (=> b!1234893 m!1138805))

(declare-fun m!1138823 () Bool)

(assert (=> b!1234890 m!1138823))

(declare-fun m!1138825 () Bool)

(assert (=> b!1234889 m!1138825))

(declare-fun m!1138827 () Bool)

(assert (=> b!1234897 m!1138827))

(declare-fun m!1138829 () Bool)

(assert (=> b!1234888 m!1138829))

(push 1)

(assert (not b!1234898))

(assert (not b!1234892))

(assert (not b!1234887))

(assert (not b!1234891))

(assert (not b!1234893))

(assert (not b!1234895))

(assert (not b!1234897))

(assert (not b!1234888))

(assert (not b!1234894))

(assert (not start!102766))

(assert (not b!1234889))

(assert (not b!1234890))

(check-sat)

