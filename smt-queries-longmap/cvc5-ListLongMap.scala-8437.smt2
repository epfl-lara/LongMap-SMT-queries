; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102998 () Bool)

(assert start!102998)

(declare-fun b!1236103 () Bool)

(declare-fun res!823481 () Bool)

(declare-fun e!701128 () Bool)

(assert (=> b!1236103 (=> (not res!823481) (not e!701128))))

(declare-datatypes ((List!27208 0))(
  ( (Nil!27205) (Cons!27204 (h!28422 (_ BitVec 64)) (t!40663 List!27208)) )
))
(declare-fun acc!846 () List!27208)

(declare-fun contains!7279 (List!27208 (_ BitVec 64)) Bool)

(assert (=> b!1236103 (= res!823481 (not (contains!7279 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236104 () Bool)

(declare-fun res!823480 () Bool)

(assert (=> b!1236104 (=> (not res!823480) (not e!701128))))

(declare-datatypes ((array!79641 0))(
  ( (array!79642 (arr!38422 (Array (_ BitVec 32) (_ BitVec 64))) (size!38959 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79641)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79641 (_ BitVec 32) List!27208) Bool)

(assert (=> b!1236104 (= res!823480 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236105 () Bool)

(declare-fun res!823475 () Bool)

(declare-fun e!701127 () Bool)

(assert (=> b!1236105 (=> res!823475 e!701127)))

(declare-fun lt!560484 () List!27208)

(declare-fun noDuplicate!1860 (List!27208) Bool)

(assert (=> b!1236105 (= res!823475 (not (noDuplicate!1860 lt!560484)))))

(declare-fun b!1236106 () Bool)

(declare-fun res!823485 () Bool)

(assert (=> b!1236106 (=> res!823485 e!701127)))

(assert (=> b!1236106 (= res!823485 (contains!7279 lt!560484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1236107 () Bool)

(declare-fun res!823476 () Bool)

(assert (=> b!1236107 (=> (not res!823476) (not e!701128))))

(assert (=> b!1236107 (= res!823476 (not (contains!7279 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236109 () Bool)

(declare-fun res!823484 () Bool)

(assert (=> b!1236109 (=> (not res!823484) (not e!701128))))

(assert (=> b!1236109 (= res!823484 (noDuplicate!1860 acc!846))))

(declare-fun b!1236110 () Bool)

(declare-fun res!823478 () Bool)

(assert (=> b!1236110 (=> res!823478 e!701127)))

(assert (=> b!1236110 (= res!823478 (contains!7279 lt!560484 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1236111 () Bool)

(assert (=> b!1236111 (= e!701127 true)))

(declare-fun lt!560485 () Bool)

(assert (=> b!1236111 (= lt!560485 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!560484))))

(declare-datatypes ((Unit!40863 0))(
  ( (Unit!40864) )
))
(declare-fun lt!560483 () Unit!40863)

(declare-fun noDuplicateSubseq!64 (List!27208 List!27208) Unit!40863)

(assert (=> b!1236111 (= lt!560483 (noDuplicateSubseq!64 acc!846 lt!560484))))

(declare-fun b!1236112 () Bool)

(declare-fun res!823482 () Bool)

(assert (=> b!1236112 (=> (not res!823482) (not e!701128))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1236112 (= res!823482 (contains!7279 acc!846 k!2925))))

(declare-fun b!1236113 () Bool)

(declare-fun res!823474 () Bool)

(assert (=> b!1236113 (=> (not res!823474) (not e!701128))))

(assert (=> b!1236113 (= res!823474 (not (= from!3213 (bvsub (size!38959 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1236114 () Bool)

(declare-fun res!823477 () Bool)

(assert (=> b!1236114 (=> (not res!823477) (not e!701128))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236114 (= res!823477 (validKeyInArray!0 (select (arr!38422 a!3835) from!3213)))))

(declare-fun b!1236108 () Bool)

(assert (=> b!1236108 (= e!701128 (not e!701127))))

(declare-fun res!823479 () Bool)

(assert (=> b!1236108 (=> res!823479 e!701127)))

(assert (=> b!1236108 (= res!823479 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!517 (List!27208 List!27208) Bool)

(assert (=> b!1236108 (subseq!517 acc!846 lt!560484)))

(declare-fun lt!560486 () Unit!40863)

(declare-fun subseqTail!10 (List!27208 List!27208) Unit!40863)

(assert (=> b!1236108 (= lt!560486 (subseqTail!10 lt!560484 lt!560484))))

(assert (=> b!1236108 (subseq!517 lt!560484 lt!560484)))

(declare-fun lt!560482 () Unit!40863)

(declare-fun lemmaListSubSeqRefl!0 (List!27208) Unit!40863)

(assert (=> b!1236108 (= lt!560482 (lemmaListSubSeqRefl!0 lt!560484))))

(assert (=> b!1236108 (= lt!560484 (Cons!27204 (select (arr!38422 a!3835) from!3213) acc!846))))

(declare-fun res!823483 () Bool)

(assert (=> start!102998 (=> (not res!823483) (not e!701128))))

(assert (=> start!102998 (= res!823483 (and (bvslt (size!38959 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38959 a!3835))))))

(assert (=> start!102998 e!701128))

(declare-fun array_inv!29360 (array!79641) Bool)

(assert (=> start!102998 (array_inv!29360 a!3835)))

(assert (=> start!102998 true))

(assert (= (and start!102998 res!823483) b!1236109))

(assert (= (and b!1236109 res!823484) b!1236103))

(assert (= (and b!1236103 res!823481) b!1236107))

(assert (= (and b!1236107 res!823476) b!1236104))

(assert (= (and b!1236104 res!823480) b!1236112))

(assert (= (and b!1236112 res!823482) b!1236113))

(assert (= (and b!1236113 res!823474) b!1236114))

(assert (= (and b!1236114 res!823477) b!1236108))

(assert (= (and b!1236108 (not res!823479)) b!1236105))

(assert (= (and b!1236105 (not res!823475)) b!1236106))

(assert (= (and b!1236106 (not res!823485)) b!1236110))

(assert (= (and b!1236110 (not res!823478)) b!1236111))

(declare-fun m!1140343 () Bool)

(assert (=> b!1236107 m!1140343))

(declare-fun m!1140345 () Bool)

(assert (=> b!1236108 m!1140345))

(declare-fun m!1140347 () Bool)

(assert (=> b!1236108 m!1140347))

(declare-fun m!1140349 () Bool)

(assert (=> b!1236108 m!1140349))

(declare-fun m!1140351 () Bool)

(assert (=> b!1236108 m!1140351))

(declare-fun m!1140353 () Bool)

(assert (=> b!1236108 m!1140353))

(declare-fun m!1140355 () Bool)

(assert (=> start!102998 m!1140355))

(assert (=> b!1236114 m!1140351))

(assert (=> b!1236114 m!1140351))

(declare-fun m!1140357 () Bool)

(assert (=> b!1236114 m!1140357))

(declare-fun m!1140359 () Bool)

(assert (=> b!1236111 m!1140359))

(declare-fun m!1140361 () Bool)

(assert (=> b!1236111 m!1140361))

(declare-fun m!1140363 () Bool)

(assert (=> b!1236112 m!1140363))

(declare-fun m!1140365 () Bool)

(assert (=> b!1236106 m!1140365))

(declare-fun m!1140367 () Bool)

(assert (=> b!1236110 m!1140367))

(declare-fun m!1140369 () Bool)

(assert (=> b!1236104 m!1140369))

(declare-fun m!1140371 () Bool)

(assert (=> b!1236109 m!1140371))

(declare-fun m!1140373 () Bool)

(assert (=> b!1236103 m!1140373))

(declare-fun m!1140375 () Bool)

(assert (=> b!1236105 m!1140375))

(push 1)

(assert (not b!1236104))

(assert (not b!1236106))

(assert (not b!1236108))

(assert (not b!1236110))

(assert (not b!1236111))

(assert (not b!1236105))

(assert (not b!1236107))

(assert (not b!1236112))

(assert (not b!1236103))

(assert (not b!1236114))

(assert (not start!102998))

(assert (not b!1236109))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

