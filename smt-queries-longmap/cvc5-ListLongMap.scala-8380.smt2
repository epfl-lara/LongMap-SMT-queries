; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101956 () Bool)

(assert start!101956)

(declare-fun b!1227325 () Bool)

(declare-fun res!815947 () Bool)

(declare-fun e!696958 () Bool)

(assert (=> b!1227325 (=> (not res!815947) (not e!696958))))

(declare-datatypes ((List!27010 0))(
  ( (Nil!27007) (Cons!27006 (h!28215 (_ BitVec 64)) (t!40473 List!27010)) )
))
(declare-fun acc!823 () List!27010)

(declare-fun noDuplicate!1669 (List!27010) Bool)

(assert (=> b!1227325 (= res!815947 (noDuplicate!1669 acc!823))))

(declare-fun b!1227326 () Bool)

(declare-fun res!815939 () Bool)

(assert (=> b!1227326 (=> (not res!815939) (not e!696958))))

(declare-datatypes ((array!79229 0))(
  ( (array!79230 (arr!38237 (Array (_ BitVec 32) (_ BitVec 64))) (size!38773 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79229)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79229 (_ BitVec 32) List!27010) Bool)

(assert (=> b!1227326 (= res!815939 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1227327 () Bool)

(declare-fun res!815937 () Bool)

(declare-fun e!696957 () Bool)

(assert (=> b!1227327 (=> res!815937 e!696957)))

(declare-fun contains!7072 (List!27010 (_ BitVec 64)) Bool)

(assert (=> b!1227327 (= res!815937 (contains!7072 Nil!27007 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227328 () Bool)

(declare-fun res!815938 () Bool)

(assert (=> b!1227328 (=> (not res!815938) (not e!696958))))

(assert (=> b!1227328 (= res!815938 (not (contains!7072 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227329 () Bool)

(declare-fun res!815945 () Bool)

(assert (=> b!1227329 (=> res!815945 e!696957)))

(declare-fun subseq!476 (List!27010 List!27010) Bool)

(assert (=> b!1227329 (= res!815945 (not (subseq!476 Nil!27007 acc!823)))))

(declare-fun res!815943 () Bool)

(assert (=> start!101956 (=> (not res!815943) (not e!696958))))

(assert (=> start!101956 (= res!815943 (bvslt (size!38773 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101956 e!696958))

(declare-fun array_inv!29085 (array!79229) Bool)

(assert (=> start!101956 (array_inv!29085 a!3806)))

(assert (=> start!101956 true))

(declare-fun b!1227330 () Bool)

(declare-fun res!815946 () Bool)

(assert (=> b!1227330 (=> (not res!815946) (not e!696958))))

(assert (=> b!1227330 (= res!815946 (not (contains!7072 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227331 () Bool)

(assert (=> b!1227331 (= e!696957 true)))

(declare-datatypes ((Unit!40640 0))(
  ( (Unit!40641) )
))
(declare-fun lt!558906 () Unit!40640)

(declare-fun noDuplicateSubseq!29 (List!27010 List!27010) Unit!40640)

(assert (=> b!1227331 (= lt!558906 (noDuplicateSubseq!29 Nil!27007 acc!823))))

(declare-fun b!1227332 () Bool)

(declare-fun res!815941 () Bool)

(assert (=> b!1227332 (=> (not res!815941) (not e!696958))))

(assert (=> b!1227332 (= res!815941 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38773 a!3806)) (bvslt from!3184 (size!38773 a!3806))))))

(declare-fun b!1227333 () Bool)

(assert (=> b!1227333 (= e!696958 (not e!696957))))

(declare-fun res!815944 () Bool)

(assert (=> b!1227333 (=> res!815944 e!696957)))

(assert (=> b!1227333 (= res!815944 (bvsgt from!3184 (size!38773 a!3806)))))

(assert (=> b!1227333 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27006 (select (arr!38237 a!3806) from!3184) acc!823))))

(declare-fun b!1227334 () Bool)

(declare-fun res!815948 () Bool)

(assert (=> b!1227334 (=> (not res!815948) (not e!696958))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79229 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1227334 (= res!815948 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1227335 () Bool)

(declare-fun res!815940 () Bool)

(assert (=> b!1227335 (=> res!815940 e!696957)))

(assert (=> b!1227335 (= res!815940 (contains!7072 Nil!27007 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227336 () Bool)

(declare-fun res!815949 () Bool)

(assert (=> b!1227336 (=> (not res!815949) (not e!696958))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227336 (= res!815949 (validKeyInArray!0 (select (arr!38237 a!3806) from!3184)))))

(declare-fun b!1227337 () Bool)

(declare-fun res!815942 () Bool)

(assert (=> b!1227337 (=> (not res!815942) (not e!696958))))

(assert (=> b!1227337 (= res!815942 (validKeyInArray!0 k!2913))))

(assert (= (and start!101956 res!815943) b!1227337))

(assert (= (and b!1227337 res!815942) b!1227332))

(assert (= (and b!1227332 res!815941) b!1227325))

(assert (= (and b!1227325 res!815947) b!1227330))

(assert (= (and b!1227330 res!815946) b!1227328))

(assert (= (and b!1227328 res!815938) b!1227334))

(assert (= (and b!1227334 res!815948) b!1227326))

(assert (= (and b!1227326 res!815939) b!1227336))

(assert (= (and b!1227336 res!815949) b!1227333))

(assert (= (and b!1227333 (not res!815944)) b!1227335))

(assert (= (and b!1227335 (not res!815940)) b!1227327))

(assert (= (and b!1227327 (not res!815937)) b!1227329))

(assert (= (and b!1227329 (not res!815945)) b!1227331))

(declare-fun m!1132143 () Bool)

(assert (=> b!1227335 m!1132143))

(declare-fun m!1132145 () Bool)

(assert (=> b!1227325 m!1132145))

(declare-fun m!1132147 () Bool)

(assert (=> b!1227336 m!1132147))

(assert (=> b!1227336 m!1132147))

(declare-fun m!1132149 () Bool)

(assert (=> b!1227336 m!1132149))

(declare-fun m!1132151 () Bool)

(assert (=> b!1227337 m!1132151))

(declare-fun m!1132153 () Bool)

(assert (=> b!1227329 m!1132153))

(declare-fun m!1132155 () Bool)

(assert (=> b!1227330 m!1132155))

(assert (=> b!1227333 m!1132147))

(declare-fun m!1132157 () Bool)

(assert (=> b!1227333 m!1132157))

(declare-fun m!1132159 () Bool)

(assert (=> b!1227326 m!1132159))

(declare-fun m!1132161 () Bool)

(assert (=> b!1227334 m!1132161))

(declare-fun m!1132163 () Bool)

(assert (=> b!1227327 m!1132163))

(declare-fun m!1132165 () Bool)

(assert (=> start!101956 m!1132165))

(declare-fun m!1132167 () Bool)

(assert (=> b!1227328 m!1132167))

(declare-fun m!1132169 () Bool)

(assert (=> b!1227331 m!1132169))

(push 1)

(assert (not b!1227326))

(assert (not b!1227335))

(assert (not b!1227334))

(assert (not b!1227325))

(assert (not b!1227331))

(assert (not start!101956))

(assert (not b!1227330))

(assert (not b!1227329))

(assert (not b!1227337))

(assert (not b!1227336))

(assert (not b!1227328))

(assert (not b!1227327))

(assert (not b!1227333))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

