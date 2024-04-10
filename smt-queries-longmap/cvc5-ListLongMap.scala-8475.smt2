; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103206 () Bool)

(assert start!103206)

(declare-fun b!1238892 () Bool)

(declare-fun res!826485 () Bool)

(declare-fun e!702111 () Bool)

(assert (=> b!1238892 (=> (not res!826485) (not e!702111))))

(declare-datatypes ((List!27295 0))(
  ( (Nil!27292) (Cons!27291 (h!28500 (_ BitVec 64)) (t!40758 List!27295)) )
))
(declare-fun acc!846 () List!27295)

(declare-fun contains!7357 (List!27295 (_ BitVec 64)) Bool)

(assert (=> b!1238892 (= res!826485 (not (contains!7357 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238893 () Bool)

(declare-fun res!826482 () Bool)

(assert (=> b!1238893 (=> (not res!826482) (not e!702111))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79841 0))(
  ( (array!79842 (arr!38522 (Array (_ BitVec 32) (_ BitVec 64))) (size!39058 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79841)

(assert (=> b!1238893 (= res!826482 (not (= from!3213 (bvsub (size!39058 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1238894 () Bool)

(assert (=> b!1238894 (= e!702111 false)))

(declare-datatypes ((Unit!41143 0))(
  ( (Unit!41144) )
))
(declare-fun lt!561490 () Unit!41143)

(declare-fun e!702110 () Unit!41143)

(assert (=> b!1238894 (= lt!561490 e!702110)))

(declare-fun c!121066 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238894 (= c!121066 (validKeyInArray!0 (select (arr!38522 a!3835) from!3213)))))

(declare-fun b!1238895 () Bool)

(declare-fun Unit!41145 () Unit!41143)

(assert (=> b!1238895 (= e!702110 Unit!41145)))

(declare-fun res!826480 () Bool)

(assert (=> start!103206 (=> (not res!826480) (not e!702111))))

(assert (=> start!103206 (= res!826480 (and (bvslt (size!39058 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39058 a!3835))))))

(assert (=> start!103206 e!702111))

(declare-fun array_inv!29370 (array!79841) Bool)

(assert (=> start!103206 (array_inv!29370 a!3835)))

(assert (=> start!103206 true))

(declare-fun b!1238896 () Bool)

(declare-fun res!826484 () Bool)

(assert (=> b!1238896 (=> (not res!826484) (not e!702111))))

(declare-fun noDuplicate!1954 (List!27295) Bool)

(assert (=> b!1238896 (= res!826484 (noDuplicate!1954 acc!846))))

(declare-fun b!1238897 () Bool)

(declare-fun lt!561488 () Unit!41143)

(assert (=> b!1238897 (= e!702110 lt!561488)))

(declare-fun lt!561491 () List!27295)

(assert (=> b!1238897 (= lt!561491 (Cons!27291 (select (arr!38522 a!3835) from!3213) acc!846))))

(declare-fun lt!561489 () Unit!41143)

(declare-fun lemmaListSubSeqRefl!0 (List!27295) Unit!41143)

(assert (=> b!1238897 (= lt!561489 (lemmaListSubSeqRefl!0 lt!561491))))

(declare-fun subseq!611 (List!27295 List!27295) Bool)

(assert (=> b!1238897 (subseq!611 lt!561491 lt!561491)))

(declare-fun lt!561487 () Unit!41143)

(declare-fun subseqTail!98 (List!27295 List!27295) Unit!41143)

(assert (=> b!1238897 (= lt!561487 (subseqTail!98 lt!561491 lt!561491))))

(assert (=> b!1238897 (subseq!611 acc!846 lt!561491)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79841 List!27295 List!27295 (_ BitVec 32)) Unit!41143)

(assert (=> b!1238897 (= lt!561488 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561491 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79841 (_ BitVec 32) List!27295) Bool)

(assert (=> b!1238897 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1238898 () Bool)

(declare-fun res!826481 () Bool)

(assert (=> b!1238898 (=> (not res!826481) (not e!702111))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1238898 (= res!826481 (contains!7357 acc!846 k!2925))))

(declare-fun b!1238899 () Bool)

(declare-fun res!826486 () Bool)

(assert (=> b!1238899 (=> (not res!826486) (not e!702111))))

(assert (=> b!1238899 (= res!826486 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1238900 () Bool)

(declare-fun res!826483 () Bool)

(assert (=> b!1238900 (=> (not res!826483) (not e!702111))))

(assert (=> b!1238900 (= res!826483 (not (contains!7357 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!103206 res!826480) b!1238896))

(assert (= (and b!1238896 res!826484) b!1238892))

(assert (= (and b!1238892 res!826485) b!1238900))

(assert (= (and b!1238900 res!826483) b!1238899))

(assert (= (and b!1238899 res!826486) b!1238898))

(assert (= (and b!1238898 res!826481) b!1238893))

(assert (= (and b!1238893 res!826482) b!1238894))

(assert (= (and b!1238894 c!121066) b!1238897))

(assert (= (and b!1238894 (not c!121066)) b!1238895))

(declare-fun m!1142407 () Bool)

(assert (=> b!1238894 m!1142407))

(assert (=> b!1238894 m!1142407))

(declare-fun m!1142409 () Bool)

(assert (=> b!1238894 m!1142409))

(declare-fun m!1142411 () Bool)

(assert (=> b!1238898 m!1142411))

(declare-fun m!1142413 () Bool)

(assert (=> b!1238896 m!1142413))

(declare-fun m!1142415 () Bool)

(assert (=> b!1238892 m!1142415))

(declare-fun m!1142417 () Bool)

(assert (=> b!1238899 m!1142417))

(declare-fun m!1142419 () Bool)

(assert (=> start!103206 m!1142419))

(declare-fun m!1142421 () Bool)

(assert (=> b!1238900 m!1142421))

(declare-fun m!1142423 () Bool)

(assert (=> b!1238897 m!1142423))

(declare-fun m!1142425 () Bool)

(assert (=> b!1238897 m!1142425))

(declare-fun m!1142427 () Bool)

(assert (=> b!1238897 m!1142427))

(declare-fun m!1142429 () Bool)

(assert (=> b!1238897 m!1142429))

(declare-fun m!1142431 () Bool)

(assert (=> b!1238897 m!1142431))

(assert (=> b!1238897 m!1142407))

(declare-fun m!1142433 () Bool)

(assert (=> b!1238897 m!1142433))

(push 1)

(assert (not b!1238897))

(assert (not b!1238896))

(assert (not start!103206))

(assert (not b!1238898))

(assert (not b!1238900))

(assert (not b!1238894))

(assert (not b!1238892))

(assert (not b!1238899))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

