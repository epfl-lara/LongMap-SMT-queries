; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103210 () Bool)

(assert start!103210)

(declare-fun b!1238946 () Bool)

(declare-fun res!826522 () Bool)

(declare-fun e!702128 () Bool)

(assert (=> b!1238946 (=> (not res!826522) (not e!702128))))

(declare-datatypes ((List!27297 0))(
  ( (Nil!27294) (Cons!27293 (h!28502 (_ BitVec 64)) (t!40760 List!27297)) )
))
(declare-fun acc!846 () List!27297)

(declare-fun contains!7359 (List!27297 (_ BitVec 64)) Bool)

(assert (=> b!1238946 (= res!826522 (not (contains!7359 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238947 () Bool)

(declare-fun res!826528 () Bool)

(assert (=> b!1238947 (=> (not res!826528) (not e!702128))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1238947 (= res!826528 (contains!7359 acc!846 k!2925))))

(declare-fun b!1238948 () Bool)

(declare-datatypes ((Unit!41149 0))(
  ( (Unit!41150) )
))
(declare-fun e!702127 () Unit!41149)

(declare-fun lt!561518 () Unit!41149)

(assert (=> b!1238948 (= e!702127 lt!561518)))

(declare-fun lt!561521 () List!27297)

(declare-datatypes ((array!79845 0))(
  ( (array!79846 (arr!38524 (Array (_ BitVec 32) (_ BitVec 64))) (size!39060 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79845)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1238948 (= lt!561521 (Cons!27293 (select (arr!38524 a!3835) from!3213) acc!846))))

(declare-fun lt!561517 () Unit!41149)

(declare-fun lemmaListSubSeqRefl!0 (List!27297) Unit!41149)

(assert (=> b!1238948 (= lt!561517 (lemmaListSubSeqRefl!0 lt!561521))))

(declare-fun subseq!613 (List!27297 List!27297) Bool)

(assert (=> b!1238948 (subseq!613 lt!561521 lt!561521)))

(declare-fun lt!561520 () Unit!41149)

(declare-fun subseqTail!100 (List!27297 List!27297) Unit!41149)

(assert (=> b!1238948 (= lt!561520 (subseqTail!100 lt!561521 lt!561521))))

(assert (=> b!1238948 (subseq!613 acc!846 lt!561521)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79845 List!27297 List!27297 (_ BitVec 32)) Unit!41149)

(assert (=> b!1238948 (= lt!561518 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561521 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79845 (_ BitVec 32) List!27297) Bool)

(assert (=> b!1238948 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun res!826525 () Bool)

(assert (=> start!103210 (=> (not res!826525) (not e!702128))))

(assert (=> start!103210 (= res!826525 (and (bvslt (size!39060 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39060 a!3835))))))

(assert (=> start!103210 e!702128))

(declare-fun array_inv!29372 (array!79845) Bool)

(assert (=> start!103210 (array_inv!29372 a!3835)))

(assert (=> start!103210 true))

(declare-fun b!1238949 () Bool)

(declare-fun res!826526 () Bool)

(assert (=> b!1238949 (=> (not res!826526) (not e!702128))))

(assert (=> b!1238949 (= res!826526 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1238950 () Bool)

(declare-fun Unit!41151 () Unit!41149)

(assert (=> b!1238950 (= e!702127 Unit!41151)))

(declare-fun b!1238951 () Bool)

(declare-fun res!826527 () Bool)

(assert (=> b!1238951 (=> (not res!826527) (not e!702128))))

(assert (=> b!1238951 (= res!826527 (not (= from!3213 (bvsub (size!39060 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1238952 () Bool)

(declare-fun res!826523 () Bool)

(assert (=> b!1238952 (=> (not res!826523) (not e!702128))))

(declare-fun noDuplicate!1956 (List!27297) Bool)

(assert (=> b!1238952 (= res!826523 (noDuplicate!1956 acc!846))))

(declare-fun b!1238953 () Bool)

(declare-fun res!826524 () Bool)

(assert (=> b!1238953 (=> (not res!826524) (not e!702128))))

(assert (=> b!1238953 (= res!826524 (not (contains!7359 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238954 () Bool)

(assert (=> b!1238954 (= e!702128 false)))

(declare-fun lt!561519 () Unit!41149)

(assert (=> b!1238954 (= lt!561519 e!702127)))

(declare-fun c!121072 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238954 (= c!121072 (validKeyInArray!0 (select (arr!38524 a!3835) from!3213)))))

(assert (= (and start!103210 res!826525) b!1238952))

(assert (= (and b!1238952 res!826523) b!1238953))

(assert (= (and b!1238953 res!826524) b!1238946))

(assert (= (and b!1238946 res!826522) b!1238949))

(assert (= (and b!1238949 res!826526) b!1238947))

(assert (= (and b!1238947 res!826528) b!1238951))

(assert (= (and b!1238951 res!826527) b!1238954))

(assert (= (and b!1238954 c!121072) b!1238948))

(assert (= (and b!1238954 (not c!121072)) b!1238950))

(declare-fun m!1142463 () Bool)

(assert (=> b!1238949 m!1142463))

(declare-fun m!1142465 () Bool)

(assert (=> b!1238954 m!1142465))

(assert (=> b!1238954 m!1142465))

(declare-fun m!1142467 () Bool)

(assert (=> b!1238954 m!1142467))

(declare-fun m!1142469 () Bool)

(assert (=> start!103210 m!1142469))

(declare-fun m!1142471 () Bool)

(assert (=> b!1238947 m!1142471))

(declare-fun m!1142473 () Bool)

(assert (=> b!1238948 m!1142473))

(declare-fun m!1142475 () Bool)

(assert (=> b!1238948 m!1142475))

(declare-fun m!1142477 () Bool)

(assert (=> b!1238948 m!1142477))

(declare-fun m!1142479 () Bool)

(assert (=> b!1238948 m!1142479))

(declare-fun m!1142481 () Bool)

(assert (=> b!1238948 m!1142481))

(assert (=> b!1238948 m!1142465))

(declare-fun m!1142483 () Bool)

(assert (=> b!1238948 m!1142483))

(declare-fun m!1142485 () Bool)

(assert (=> b!1238946 m!1142485))

(declare-fun m!1142487 () Bool)

(assert (=> b!1238953 m!1142487))

(declare-fun m!1142489 () Bool)

(assert (=> b!1238952 m!1142489))

(push 1)

(assert (not b!1238952))

(assert (not b!1238946))

(assert (not b!1238954))

(assert (not start!103210))

(assert (not b!1238947))

(assert (not b!1238953))

(assert (not b!1238949))

(assert (not b!1238948))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

