; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102772 () Bool)

(assert start!102772)

(declare-fun b!1234995 () Bool)

(declare-fun e!700320 () Bool)

(declare-fun e!700318 () Bool)

(assert (=> b!1234995 (= e!700320 (not e!700318))))

(declare-fun res!823166 () Bool)

(assert (=> b!1234995 (=> res!823166 e!700318)))

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1234995 (= res!823166 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-datatypes ((List!27189 0))(
  ( (Nil!27186) (Cons!27185 (h!28394 (_ BitVec 64)) (t!40652 List!27189)) )
))
(declare-fun acc!846 () List!27189)

(declare-fun lt!560088 () List!27189)

(declare-fun subseq!523 (List!27189 List!27189) Bool)

(assert (=> b!1234995 (subseq!523 acc!846 lt!560088)))

(declare-datatypes ((Unit!40902 0))(
  ( (Unit!40903) )
))
(declare-fun lt!560086 () Unit!40902)

(declare-fun subseqTail!16 (List!27189 List!27189) Unit!40902)

(assert (=> b!1234995 (= lt!560086 (subseqTail!16 lt!560088 lt!560088))))

(assert (=> b!1234995 (subseq!523 lt!560088 lt!560088)))

(declare-fun lt!560087 () Unit!40902)

(declare-fun lemmaListSubSeqRefl!0 (List!27189) Unit!40902)

(assert (=> b!1234995 (= lt!560087 (lemmaListSubSeqRefl!0 lt!560088))))

(declare-datatypes ((array!79617 0))(
  ( (array!79618 (arr!38416 (Array (_ BitVec 32) (_ BitVec 64))) (size!38952 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79617)

(assert (=> b!1234995 (= lt!560088 (Cons!27185 (select (arr!38416 a!3835) from!3213) acc!846))))

(declare-fun b!1234996 () Bool)

(declare-fun res!823161 () Bool)

(assert (=> b!1234996 (=> (not res!823161) (not e!700320))))

(declare-fun contains!7251 (List!27189 (_ BitVec 64)) Bool)

(assert (=> b!1234996 (= res!823161 (not (contains!7251 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234997 () Bool)

(declare-fun res!823167 () Bool)

(assert (=> b!1234997 (=> (not res!823167) (not e!700320))))

(assert (=> b!1234997 (= res!823167 (not (= from!3213 (bvsub (size!38952 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1234998 () Bool)

(declare-fun res!823157 () Bool)

(assert (=> b!1234998 (=> (not res!823157) (not e!700320))))

(declare-fun noDuplicate!1848 (List!27189) Bool)

(assert (=> b!1234998 (= res!823157 (noDuplicate!1848 acc!846))))

(declare-fun b!1234999 () Bool)

(declare-fun res!823164 () Bool)

(assert (=> b!1234999 (=> res!823164 e!700318)))

(assert (=> b!1234999 (= res!823164 (contains!7251 lt!560088 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1235000 () Bool)

(declare-fun res!823158 () Bool)

(assert (=> b!1235000 (=> (not res!823158) (not e!700320))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235000 (= res!823158 (validKeyInArray!0 (select (arr!38416 a!3835) from!3213)))))

(declare-fun b!1235001 () Bool)

(assert (=> b!1235001 (= e!700318 true)))

(declare-fun lt!560089 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79617 (_ BitVec 32) List!27189) Bool)

(assert (=> b!1235001 (= lt!560089 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!560088))))

(declare-fun lt!560090 () Unit!40902)

(declare-fun noDuplicateSubseq!70 (List!27189 List!27189) Unit!40902)

(assert (=> b!1235001 (= lt!560090 (noDuplicateSubseq!70 acc!846 lt!560088))))

(declare-fun b!1235002 () Bool)

(declare-fun res!823163 () Bool)

(assert (=> b!1235002 (=> (not res!823163) (not e!700320))))

(assert (=> b!1235002 (= res!823163 (not (contains!7251 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235003 () Bool)

(declare-fun res!823168 () Bool)

(assert (=> b!1235003 (=> (not res!823168) (not e!700320))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1235003 (= res!823168 (contains!7251 acc!846 k!2925))))

(declare-fun b!1235004 () Bool)

(declare-fun res!823165 () Bool)

(assert (=> b!1235004 (=> (not res!823165) (not e!700320))))

(assert (=> b!1235004 (= res!823165 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun res!823162 () Bool)

(assert (=> start!102772 (=> (not res!823162) (not e!700320))))

(assert (=> start!102772 (= res!823162 (and (bvslt (size!38952 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38952 a!3835))))))

(assert (=> start!102772 e!700320))

(declare-fun array_inv!29264 (array!79617) Bool)

(assert (=> start!102772 (array_inv!29264 a!3835)))

(assert (=> start!102772 true))

(declare-fun b!1235005 () Bool)

(declare-fun res!823159 () Bool)

(assert (=> b!1235005 (=> res!823159 e!700318)))

(assert (=> b!1235005 (= res!823159 (not (noDuplicate!1848 lt!560088)))))

(declare-fun b!1235006 () Bool)

(declare-fun res!823160 () Bool)

(assert (=> b!1235006 (=> res!823160 e!700318)))

(assert (=> b!1235006 (= res!823160 (contains!7251 lt!560088 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!102772 res!823162) b!1234998))

(assert (= (and b!1234998 res!823157) b!1235002))

(assert (= (and b!1235002 res!823163) b!1234996))

(assert (= (and b!1234996 res!823161) b!1235004))

(assert (= (and b!1235004 res!823165) b!1235003))

(assert (= (and b!1235003 res!823168) b!1234997))

(assert (= (and b!1234997 res!823167) b!1235000))

(assert (= (and b!1235000 res!823158) b!1234995))

(assert (= (and b!1234995 (not res!823166)) b!1235005))

(assert (= (and b!1235005 (not res!823159)) b!1234999))

(assert (= (and b!1234999 (not res!823164)) b!1235006))

(assert (= (and b!1235006 (not res!823160)) b!1235001))

(declare-fun m!1138899 () Bool)

(assert (=> b!1235005 m!1138899))

(declare-fun m!1138901 () Bool)

(assert (=> b!1235000 m!1138901))

(assert (=> b!1235000 m!1138901))

(declare-fun m!1138903 () Bool)

(assert (=> b!1235000 m!1138903))

(declare-fun m!1138905 () Bool)

(assert (=> b!1234998 m!1138905))

(declare-fun m!1138907 () Bool)

(assert (=> b!1234996 m!1138907))

(declare-fun m!1138909 () Bool)

(assert (=> b!1234999 m!1138909))

(declare-fun m!1138911 () Bool)

(assert (=> b!1235006 m!1138911))

(declare-fun m!1138913 () Bool)

(assert (=> b!1234995 m!1138913))

(declare-fun m!1138915 () Bool)

(assert (=> b!1234995 m!1138915))

(declare-fun m!1138917 () Bool)

(assert (=> b!1234995 m!1138917))

(assert (=> b!1234995 m!1138901))

(declare-fun m!1138919 () Bool)

(assert (=> b!1234995 m!1138919))

(declare-fun m!1138921 () Bool)

(assert (=> b!1235003 m!1138921))

(declare-fun m!1138923 () Bool)

(assert (=> start!102772 m!1138923))

(declare-fun m!1138925 () Bool)

(assert (=> b!1235002 m!1138925))

(declare-fun m!1138927 () Bool)

(assert (=> b!1235004 m!1138927))

(declare-fun m!1138929 () Bool)

(assert (=> b!1235001 m!1138929))

(declare-fun m!1138931 () Bool)

(assert (=> b!1235001 m!1138931))

(push 1)

(assert (not b!1234999))

(assert (not b!1234995))

(assert (not b!1235002))

(assert (not b!1235003))

(assert (not b!1235004))

(assert (not b!1235001))

(assert (not b!1235006))

(assert (not b!1235000))

(assert (not b!1234996))

(assert (not start!102772))

(assert (not b!1235005))

(assert (not b!1234998))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

