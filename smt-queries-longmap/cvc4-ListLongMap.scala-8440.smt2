; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102778 () Bool)

(assert start!102778)

(declare-fun res!823271 () Bool)

(declare-fun e!700347 () Bool)

(assert (=> start!102778 (=> (not res!823271) (not e!700347))))

(declare-datatypes ((array!79623 0))(
  ( (array!79624 (arr!38419 (Array (_ BitVec 32) (_ BitVec 64))) (size!38955 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79623)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102778 (= res!823271 (and (bvslt (size!38955 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38955 a!3835))))))

(assert (=> start!102778 e!700347))

(declare-fun array_inv!29267 (array!79623) Bool)

(assert (=> start!102778 (array_inv!29267 a!3835)))

(assert (=> start!102778 true))

(declare-fun b!1235103 () Bool)

(declare-fun e!700346 () Bool)

(assert (=> b!1235103 (= e!700346 true)))

(declare-fun lt!560131 () Bool)

(declare-datatypes ((List!27192 0))(
  ( (Nil!27189) (Cons!27188 (h!28397 (_ BitVec 64)) (t!40655 List!27192)) )
))
(declare-fun lt!560133 () List!27192)

(declare-fun arrayNoDuplicates!0 (array!79623 (_ BitVec 32) List!27192) Bool)

(assert (=> b!1235103 (= lt!560131 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!560133))))

(declare-datatypes ((Unit!40908 0))(
  ( (Unit!40909) )
))
(declare-fun lt!560134 () Unit!40908)

(declare-fun acc!846 () List!27192)

(declare-fun noDuplicateSubseq!73 (List!27192 List!27192) Unit!40908)

(assert (=> b!1235103 (= lt!560134 (noDuplicateSubseq!73 acc!846 lt!560133))))

(declare-fun b!1235104 () Bool)

(declare-fun res!823274 () Bool)

(assert (=> b!1235104 (=> (not res!823274) (not e!700347))))

(assert (=> b!1235104 (= res!823274 (not (= from!3213 (bvsub (size!38955 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235105 () Bool)

(declare-fun res!823273 () Bool)

(assert (=> b!1235105 (=> (not res!823273) (not e!700347))))

(declare-fun contains!7254 (List!27192 (_ BitVec 64)) Bool)

(assert (=> b!1235105 (= res!823273 (not (contains!7254 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235106 () Bool)

(declare-fun res!823276 () Bool)

(assert (=> b!1235106 (=> (not res!823276) (not e!700347))))

(assert (=> b!1235106 (= res!823276 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235107 () Bool)

(declare-fun res!823265 () Bool)

(assert (=> b!1235107 (=> (not res!823265) (not e!700347))))

(declare-fun noDuplicate!1851 (List!27192) Bool)

(assert (=> b!1235107 (= res!823265 (noDuplicate!1851 acc!846))))

(declare-fun b!1235108 () Bool)

(declare-fun res!823275 () Bool)

(assert (=> b!1235108 (=> res!823275 e!700346)))

(assert (=> b!1235108 (= res!823275 (contains!7254 lt!560133 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1235109 () Bool)

(declare-fun res!823266 () Bool)

(assert (=> b!1235109 (=> (not res!823266) (not e!700347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235109 (= res!823266 (validKeyInArray!0 (select (arr!38419 a!3835) from!3213)))))

(declare-fun b!1235110 () Bool)

(declare-fun res!823269 () Bool)

(assert (=> b!1235110 (=> (not res!823269) (not e!700347))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1235110 (= res!823269 (contains!7254 acc!846 k!2925))))

(declare-fun b!1235111 () Bool)

(declare-fun res!823268 () Bool)

(assert (=> b!1235111 (=> res!823268 e!700346)))

(assert (=> b!1235111 (= res!823268 (contains!7254 lt!560133 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1235112 () Bool)

(assert (=> b!1235112 (= e!700347 (not e!700346))))

(declare-fun res!823272 () Bool)

(assert (=> b!1235112 (=> res!823272 e!700346)))

(assert (=> b!1235112 (= res!823272 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!526 (List!27192 List!27192) Bool)

(assert (=> b!1235112 (subseq!526 acc!846 lt!560133)))

(declare-fun lt!560135 () Unit!40908)

(declare-fun subseqTail!19 (List!27192 List!27192) Unit!40908)

(assert (=> b!1235112 (= lt!560135 (subseqTail!19 lt!560133 lt!560133))))

(assert (=> b!1235112 (subseq!526 lt!560133 lt!560133)))

(declare-fun lt!560132 () Unit!40908)

(declare-fun lemmaListSubSeqRefl!0 (List!27192) Unit!40908)

(assert (=> b!1235112 (= lt!560132 (lemmaListSubSeqRefl!0 lt!560133))))

(assert (=> b!1235112 (= lt!560133 (Cons!27188 (select (arr!38419 a!3835) from!3213) acc!846))))

(declare-fun b!1235113 () Bool)

(declare-fun res!823270 () Bool)

(assert (=> b!1235113 (=> res!823270 e!700346)))

(assert (=> b!1235113 (= res!823270 (not (noDuplicate!1851 lt!560133)))))

(declare-fun b!1235114 () Bool)

(declare-fun res!823267 () Bool)

(assert (=> b!1235114 (=> (not res!823267) (not e!700347))))

(assert (=> b!1235114 (= res!823267 (not (contains!7254 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102778 res!823271) b!1235107))

(assert (= (and b!1235107 res!823265) b!1235105))

(assert (= (and b!1235105 res!823273) b!1235114))

(assert (= (and b!1235114 res!823267) b!1235106))

(assert (= (and b!1235106 res!823276) b!1235110))

(assert (= (and b!1235110 res!823269) b!1235104))

(assert (= (and b!1235104 res!823274) b!1235109))

(assert (= (and b!1235109 res!823266) b!1235112))

(assert (= (and b!1235112 (not res!823272)) b!1235113))

(assert (= (and b!1235113 (not res!823270)) b!1235108))

(assert (= (and b!1235108 (not res!823275)) b!1235111))

(assert (= (and b!1235111 (not res!823268)) b!1235103))

(declare-fun m!1139001 () Bool)

(assert (=> b!1235103 m!1139001))

(declare-fun m!1139003 () Bool)

(assert (=> b!1235103 m!1139003))

(declare-fun m!1139005 () Bool)

(assert (=> b!1235112 m!1139005))

(declare-fun m!1139007 () Bool)

(assert (=> b!1235112 m!1139007))

(declare-fun m!1139009 () Bool)

(assert (=> b!1235112 m!1139009))

(declare-fun m!1139011 () Bool)

(assert (=> b!1235112 m!1139011))

(declare-fun m!1139013 () Bool)

(assert (=> b!1235112 m!1139013))

(declare-fun m!1139015 () Bool)

(assert (=> start!102778 m!1139015))

(declare-fun m!1139017 () Bool)

(assert (=> b!1235107 m!1139017))

(declare-fun m!1139019 () Bool)

(assert (=> b!1235105 m!1139019))

(declare-fun m!1139021 () Bool)

(assert (=> b!1235111 m!1139021))

(declare-fun m!1139023 () Bool)

(assert (=> b!1235108 m!1139023))

(declare-fun m!1139025 () Bool)

(assert (=> b!1235106 m!1139025))

(declare-fun m!1139027 () Bool)

(assert (=> b!1235114 m!1139027))

(assert (=> b!1235109 m!1139013))

(assert (=> b!1235109 m!1139013))

(declare-fun m!1139029 () Bool)

(assert (=> b!1235109 m!1139029))

(declare-fun m!1139031 () Bool)

(assert (=> b!1235110 m!1139031))

(declare-fun m!1139033 () Bool)

(assert (=> b!1235113 m!1139033))

(push 1)

(assert (not b!1235107))

(assert (not b!1235113))

(assert (not b!1235111))

(assert (not b!1235103))

(assert (not b!1235110))

(assert (not b!1235109))

(assert (not b!1235106))

(assert (not b!1235108))

(assert (not start!102778))

(assert (not b!1235105))

(assert (not b!1235112))

(assert (not b!1235114))

(check-sat)

(pop 1)

(push 1)

(check-sat)

