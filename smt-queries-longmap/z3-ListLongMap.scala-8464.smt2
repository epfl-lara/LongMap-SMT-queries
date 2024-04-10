; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102992 () Bool)

(assert start!102992)

(declare-fun b!1237291 () Bool)

(declare-fun res!825165 () Bool)

(declare-fun e!701268 () Bool)

(assert (=> b!1237291 (=> (not res!825165) (not e!701268))))

(declare-datatypes ((array!79768 0))(
  ( (array!79769 (arr!38490 (Array (_ BitVec 32) (_ BitVec 64))) (size!39026 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79768)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1237291 (= res!825165 (validKeyInArray!0 (select (arr!38490 a!3835) from!3213)))))

(declare-fun b!1237292 () Bool)

(assert (=> b!1237292 (= e!701268 (not true))))

(declare-datatypes ((List!27263 0))(
  ( (Nil!27260) (Cons!27259 (h!28468 (_ BitVec 64)) (t!40726 List!27263)) )
))
(declare-fun acc!846 () List!27263)

(declare-fun lt!560994 () List!27263)

(declare-fun subseq!579 (List!27263 List!27263) Bool)

(assert (=> b!1237292 (subseq!579 acc!846 lt!560994)))

(declare-datatypes ((Unit!41056 0))(
  ( (Unit!41057) )
))
(declare-fun lt!560995 () Unit!41056)

(declare-fun subseqTail!66 (List!27263 List!27263) Unit!41056)

(assert (=> b!1237292 (= lt!560995 (subseqTail!66 lt!560994 lt!560994))))

(assert (=> b!1237292 (subseq!579 lt!560994 lt!560994)))

(declare-fun lt!560996 () Unit!41056)

(declare-fun lemmaListSubSeqRefl!0 (List!27263) Unit!41056)

(assert (=> b!1237292 (= lt!560996 (lemmaListSubSeqRefl!0 lt!560994))))

(assert (=> b!1237292 (= lt!560994 (Cons!27259 (select (arr!38490 a!3835) from!3213) acc!846))))

(declare-fun b!1237293 () Bool)

(declare-fun res!825166 () Bool)

(assert (=> b!1237293 (=> (not res!825166) (not e!701268))))

(declare-fun contains!7325 (List!27263 (_ BitVec 64)) Bool)

(assert (=> b!1237293 (= res!825166 (not (contains!7325 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!825160 () Bool)

(assert (=> start!102992 (=> (not res!825160) (not e!701268))))

(assert (=> start!102992 (= res!825160 (and (bvslt (size!39026 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39026 a!3835))))))

(assert (=> start!102992 e!701268))

(declare-fun array_inv!29338 (array!79768) Bool)

(assert (=> start!102992 (array_inv!29338 a!3835)))

(assert (=> start!102992 true))

(declare-fun b!1237294 () Bool)

(declare-fun res!825161 () Bool)

(assert (=> b!1237294 (=> (not res!825161) (not e!701268))))

(assert (=> b!1237294 (= res!825161 (not (contains!7325 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237295 () Bool)

(declare-fun res!825159 () Bool)

(assert (=> b!1237295 (=> (not res!825159) (not e!701268))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1237295 (= res!825159 (contains!7325 acc!846 k0!2925))))

(declare-fun b!1237296 () Bool)

(declare-fun res!825164 () Bool)

(assert (=> b!1237296 (=> (not res!825164) (not e!701268))))

(declare-fun arrayNoDuplicates!0 (array!79768 (_ BitVec 32) List!27263) Bool)

(assert (=> b!1237296 (= res!825164 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1237297 () Bool)

(declare-fun res!825163 () Bool)

(assert (=> b!1237297 (=> (not res!825163) (not e!701268))))

(declare-fun noDuplicate!1922 (List!27263) Bool)

(assert (=> b!1237297 (= res!825163 (noDuplicate!1922 acc!846))))

(declare-fun b!1237298 () Bool)

(declare-fun res!825162 () Bool)

(assert (=> b!1237298 (=> (not res!825162) (not e!701268))))

(assert (=> b!1237298 (= res!825162 (not (= from!3213 (bvsub (size!39026 a!3835) #b00000000000000000000000000000001))))))

(assert (= (and start!102992 res!825160) b!1237297))

(assert (= (and b!1237297 res!825163) b!1237294))

(assert (= (and b!1237294 res!825161) b!1237293))

(assert (= (and b!1237293 res!825166) b!1237296))

(assert (= (and b!1237296 res!825164) b!1237295))

(assert (= (and b!1237295 res!825159) b!1237298))

(assert (= (and b!1237298 res!825162) b!1237291))

(assert (= (and b!1237291 res!825165) b!1237292))

(declare-fun m!1141009 () Bool)

(assert (=> b!1237293 m!1141009))

(declare-fun m!1141011 () Bool)

(assert (=> b!1237296 m!1141011))

(declare-fun m!1141013 () Bool)

(assert (=> start!102992 m!1141013))

(declare-fun m!1141015 () Bool)

(assert (=> b!1237297 m!1141015))

(declare-fun m!1141017 () Bool)

(assert (=> b!1237292 m!1141017))

(declare-fun m!1141019 () Bool)

(assert (=> b!1237292 m!1141019))

(declare-fun m!1141021 () Bool)

(assert (=> b!1237292 m!1141021))

(declare-fun m!1141023 () Bool)

(assert (=> b!1237292 m!1141023))

(declare-fun m!1141025 () Bool)

(assert (=> b!1237292 m!1141025))

(declare-fun m!1141027 () Bool)

(assert (=> b!1237295 m!1141027))

(assert (=> b!1237291 m!1141021))

(assert (=> b!1237291 m!1141021))

(declare-fun m!1141029 () Bool)

(assert (=> b!1237291 m!1141029))

(declare-fun m!1141031 () Bool)

(assert (=> b!1237294 m!1141031))

(check-sat (not b!1237293) (not start!102992) (not b!1237291) (not b!1237292) (not b!1237297) (not b!1237294) (not b!1237296) (not b!1237295))
(check-sat)
