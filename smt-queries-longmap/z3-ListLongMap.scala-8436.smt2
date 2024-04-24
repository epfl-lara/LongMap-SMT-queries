; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102988 () Bool)

(assert start!102988)

(declare-fun b!1235923 () Bool)

(declare-fun res!823300 () Bool)

(declare-fun e!701083 () Bool)

(assert (=> b!1235923 (=> (not res!823300) (not e!701083))))

(declare-datatypes ((List!27203 0))(
  ( (Nil!27200) (Cons!27199 (h!28417 (_ BitVec 64)) (t!40658 List!27203)) )
))
(declare-fun acc!846 () List!27203)

(declare-fun contains!7274 (List!27203 (_ BitVec 64)) Bool)

(assert (=> b!1235923 (= res!823300 (not (contains!7274 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235924 () Bool)

(declare-fun res!823296 () Bool)

(assert (=> b!1235924 (=> (not res!823296) (not e!701083))))

(declare-fun noDuplicate!1855 (List!27203) Bool)

(assert (=> b!1235924 (= res!823296 (noDuplicate!1855 acc!846))))

(declare-fun b!1235925 () Bool)

(declare-fun res!823302 () Bool)

(assert (=> b!1235925 (=> (not res!823302) (not e!701083))))

(declare-datatypes ((array!79631 0))(
  ( (array!79632 (arr!38417 (Array (_ BitVec 32) (_ BitVec 64))) (size!38954 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79631)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235925 (= res!823302 (validKeyInArray!0 (select (arr!38417 a!3835) from!3213)))))

(declare-fun b!1235927 () Bool)

(declare-fun e!701084 () Bool)

(assert (=> b!1235927 (= e!701084 true)))

(declare-fun lt!560411 () List!27203)

(declare-fun lt!560408 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79631 (_ BitVec 32) List!27203) Bool)

(assert (=> b!1235927 (= lt!560408 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!560411))))

(declare-datatypes ((Unit!40853 0))(
  ( (Unit!40854) )
))
(declare-fun lt!560409 () Unit!40853)

(declare-fun noDuplicateSubseq!59 (List!27203 List!27203) Unit!40853)

(assert (=> b!1235927 (= lt!560409 (noDuplicateSubseq!59 acc!846 lt!560411))))

(declare-fun b!1235928 () Bool)

(declare-fun res!823297 () Bool)

(assert (=> b!1235928 (=> (not res!823297) (not e!701083))))

(assert (=> b!1235928 (= res!823297 (not (contains!7274 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235929 () Bool)

(declare-fun res!823304 () Bool)

(assert (=> b!1235929 (=> (not res!823304) (not e!701083))))

(assert (=> b!1235929 (= res!823304 (not (= from!3213 (bvsub (size!38954 a!3835) #b00000000000000000000000000000001))))))

(declare-fun res!823295 () Bool)

(assert (=> start!102988 (=> (not res!823295) (not e!701083))))

(assert (=> start!102988 (= res!823295 (and (bvslt (size!38954 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38954 a!3835))))))

(assert (=> start!102988 e!701083))

(declare-fun array_inv!29355 (array!79631) Bool)

(assert (=> start!102988 (array_inv!29355 a!3835)))

(assert (=> start!102988 true))

(declare-fun b!1235926 () Bool)

(declare-fun res!823294 () Bool)

(assert (=> b!1235926 (=> res!823294 e!701084)))

(assert (=> b!1235926 (= res!823294 (contains!7274 lt!560411 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1235930 () Bool)

(assert (=> b!1235930 (= e!701083 (not e!701084))))

(declare-fun res!823298 () Bool)

(assert (=> b!1235930 (=> res!823298 e!701084)))

(assert (=> b!1235930 (= res!823298 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!512 (List!27203 List!27203) Bool)

(assert (=> b!1235930 (subseq!512 acc!846 lt!560411)))

(declare-fun lt!560407 () Unit!40853)

(declare-fun subseqTail!5 (List!27203 List!27203) Unit!40853)

(assert (=> b!1235930 (= lt!560407 (subseqTail!5 lt!560411 lt!560411))))

(assert (=> b!1235930 (subseq!512 lt!560411 lt!560411)))

(declare-fun lt!560410 () Unit!40853)

(declare-fun lemmaListSubSeqRefl!0 (List!27203) Unit!40853)

(assert (=> b!1235930 (= lt!560410 (lemmaListSubSeqRefl!0 lt!560411))))

(assert (=> b!1235930 (= lt!560411 (Cons!27199 (select (arr!38417 a!3835) from!3213) acc!846))))

(declare-fun b!1235931 () Bool)

(declare-fun res!823301 () Bool)

(assert (=> b!1235931 (=> (not res!823301) (not e!701083))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1235931 (= res!823301 (contains!7274 acc!846 k0!2925))))

(declare-fun b!1235932 () Bool)

(declare-fun res!823305 () Bool)

(assert (=> b!1235932 (=> res!823305 e!701084)))

(assert (=> b!1235932 (= res!823305 (not (noDuplicate!1855 lt!560411)))))

(declare-fun b!1235933 () Bool)

(declare-fun res!823303 () Bool)

(assert (=> b!1235933 (=> res!823303 e!701084)))

(assert (=> b!1235933 (= res!823303 (contains!7274 lt!560411 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1235934 () Bool)

(declare-fun res!823299 () Bool)

(assert (=> b!1235934 (=> (not res!823299) (not e!701083))))

(assert (=> b!1235934 (= res!823299 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(assert (= (and start!102988 res!823295) b!1235924))

(assert (= (and b!1235924 res!823296) b!1235923))

(assert (= (and b!1235923 res!823300) b!1235928))

(assert (= (and b!1235928 res!823297) b!1235934))

(assert (= (and b!1235934 res!823299) b!1235931))

(assert (= (and b!1235931 res!823301) b!1235929))

(assert (= (and b!1235929 res!823304) b!1235925))

(assert (= (and b!1235925 res!823302) b!1235930))

(assert (= (and b!1235930 (not res!823298)) b!1235932))

(assert (= (and b!1235932 (not res!823305)) b!1235926))

(assert (= (and b!1235926 (not res!823294)) b!1235933))

(assert (= (and b!1235933 (not res!823303)) b!1235927))

(declare-fun m!1140173 () Bool)

(assert (=> b!1235923 m!1140173))

(declare-fun m!1140175 () Bool)

(assert (=> b!1235930 m!1140175))

(declare-fun m!1140177 () Bool)

(assert (=> b!1235930 m!1140177))

(declare-fun m!1140179 () Bool)

(assert (=> b!1235930 m!1140179))

(declare-fun m!1140181 () Bool)

(assert (=> b!1235930 m!1140181))

(declare-fun m!1140183 () Bool)

(assert (=> b!1235930 m!1140183))

(declare-fun m!1140185 () Bool)

(assert (=> b!1235926 m!1140185))

(declare-fun m!1140187 () Bool)

(assert (=> b!1235932 m!1140187))

(declare-fun m!1140189 () Bool)

(assert (=> b!1235927 m!1140189))

(declare-fun m!1140191 () Bool)

(assert (=> b!1235927 m!1140191))

(declare-fun m!1140193 () Bool)

(assert (=> start!102988 m!1140193))

(declare-fun m!1140195 () Bool)

(assert (=> b!1235928 m!1140195))

(declare-fun m!1140197 () Bool)

(assert (=> b!1235924 m!1140197))

(declare-fun m!1140199 () Bool)

(assert (=> b!1235933 m!1140199))

(declare-fun m!1140201 () Bool)

(assert (=> b!1235931 m!1140201))

(assert (=> b!1235925 m!1140183))

(assert (=> b!1235925 m!1140183))

(declare-fun m!1140203 () Bool)

(assert (=> b!1235925 m!1140203))

(declare-fun m!1140205 () Bool)

(assert (=> b!1235934 m!1140205))

(check-sat (not b!1235923) (not b!1235927) (not b!1235931) (not b!1235932) (not b!1235924) (not b!1235928) (not b!1235930) (not b!1235934) (not b!1235925) (not b!1235926) (not start!102988) (not b!1235933))
(check-sat)
