; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103198 () Bool)

(assert start!103198)

(declare-fun b!1238784 () Bool)

(declare-fun res!826400 () Bool)

(declare-fun e!702073 () Bool)

(assert (=> b!1238784 (=> (not res!826400) (not e!702073))))

(declare-datatypes ((List!27291 0))(
  ( (Nil!27288) (Cons!27287 (h!28496 (_ BitVec 64)) (t!40754 List!27291)) )
))
(declare-fun acc!846 () List!27291)

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun contains!7353 (List!27291 (_ BitVec 64)) Bool)

(assert (=> b!1238784 (= res!826400 (contains!7353 acc!846 k!2925))))

(declare-fun res!826397 () Bool)

(assert (=> start!103198 (=> (not res!826397) (not e!702073))))

(declare-datatypes ((array!79833 0))(
  ( (array!79834 (arr!38518 (Array (_ BitVec 32) (_ BitVec 64))) (size!39054 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79833)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!103198 (= res!826397 (and (bvslt (size!39054 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39054 a!3835))))))

(assert (=> start!103198 e!702073))

(declare-fun array_inv!29366 (array!79833) Bool)

(assert (=> start!103198 (array_inv!29366 a!3835)))

(assert (=> start!103198 true))

(declare-fun b!1238785 () Bool)

(declare-datatypes ((Unit!41131 0))(
  ( (Unit!41132) )
))
(declare-fun e!702075 () Unit!41131)

(declare-fun Unit!41133 () Unit!41131)

(assert (=> b!1238785 (= e!702075 Unit!41133)))

(declare-fun b!1238786 () Bool)

(declare-fun res!826401 () Bool)

(assert (=> b!1238786 (=> (not res!826401) (not e!702073))))

(assert (=> b!1238786 (= res!826401 (not (= from!3213 (bvsub (size!39054 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1238787 () Bool)

(declare-fun res!826396 () Bool)

(assert (=> b!1238787 (=> (not res!826396) (not e!702073))))

(assert (=> b!1238787 (= res!826396 (not (contains!7353 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238788 () Bool)

(declare-fun res!826398 () Bool)

(assert (=> b!1238788 (=> (not res!826398) (not e!702073))))

(declare-fun arrayNoDuplicates!0 (array!79833 (_ BitVec 32) List!27291) Bool)

(assert (=> b!1238788 (= res!826398 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1238789 () Bool)

(declare-fun res!826402 () Bool)

(assert (=> b!1238789 (=> (not res!826402) (not e!702073))))

(declare-fun noDuplicate!1950 (List!27291) Bool)

(assert (=> b!1238789 (= res!826402 (noDuplicate!1950 acc!846))))

(declare-fun b!1238790 () Bool)

(assert (=> b!1238790 (= e!702073 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun lt!561431 () Unit!41131)

(assert (=> b!1238790 (= lt!561431 e!702075)))

(declare-fun c!121054 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238790 (= c!121054 (validKeyInArray!0 (select (arr!38518 a!3835) from!3213)))))

(declare-fun b!1238791 () Bool)

(declare-fun lt!561427 () Unit!41131)

(assert (=> b!1238791 (= e!702075 lt!561427)))

(declare-fun lt!561430 () List!27291)

(assert (=> b!1238791 (= lt!561430 (Cons!27287 (select (arr!38518 a!3835) from!3213) acc!846))))

(declare-fun lt!561428 () Unit!41131)

(declare-fun lemmaListSubSeqRefl!0 (List!27291) Unit!41131)

(assert (=> b!1238791 (= lt!561428 (lemmaListSubSeqRefl!0 lt!561430))))

(declare-fun subseq!607 (List!27291 List!27291) Bool)

(assert (=> b!1238791 (subseq!607 lt!561430 lt!561430)))

(declare-fun lt!561429 () Unit!41131)

(declare-fun subseqTail!94 (List!27291 List!27291) Unit!41131)

(assert (=> b!1238791 (= lt!561429 (subseqTail!94 lt!561430 lt!561430))))

(assert (=> b!1238791 (subseq!607 acc!846 lt!561430)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79833 List!27291 List!27291 (_ BitVec 32)) Unit!41131)

(assert (=> b!1238791 (= lt!561427 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561430 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1238791 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1238792 () Bool)

(declare-fun res!826399 () Bool)

(assert (=> b!1238792 (=> (not res!826399) (not e!702073))))

(assert (=> b!1238792 (= res!826399 (not (contains!7353 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!103198 res!826397) b!1238789))

(assert (= (and b!1238789 res!826402) b!1238787))

(assert (= (and b!1238787 res!826396) b!1238792))

(assert (= (and b!1238792 res!826399) b!1238788))

(assert (= (and b!1238788 res!826398) b!1238784))

(assert (= (and b!1238784 res!826400) b!1238786))

(assert (= (and b!1238786 res!826401) b!1238790))

(assert (= (and b!1238790 c!121054) b!1238791))

(assert (= (and b!1238790 (not c!121054)) b!1238785))

(declare-fun m!1142295 () Bool)

(assert (=> b!1238787 m!1142295))

(declare-fun m!1142297 () Bool)

(assert (=> b!1238789 m!1142297))

(declare-fun m!1142299 () Bool)

(assert (=> start!103198 m!1142299))

(declare-fun m!1142301 () Bool)

(assert (=> b!1238788 m!1142301))

(declare-fun m!1142303 () Bool)

(assert (=> b!1238790 m!1142303))

(assert (=> b!1238790 m!1142303))

(declare-fun m!1142305 () Bool)

(assert (=> b!1238790 m!1142305))

(declare-fun m!1142307 () Bool)

(assert (=> b!1238784 m!1142307))

(declare-fun m!1142309 () Bool)

(assert (=> b!1238791 m!1142309))

(declare-fun m!1142311 () Bool)

(assert (=> b!1238791 m!1142311))

(declare-fun m!1142313 () Bool)

(assert (=> b!1238791 m!1142313))

(declare-fun m!1142315 () Bool)

(assert (=> b!1238791 m!1142315))

(declare-fun m!1142317 () Bool)

(assert (=> b!1238791 m!1142317))

(declare-fun m!1142319 () Bool)

(assert (=> b!1238791 m!1142319))

(assert (=> b!1238791 m!1142303))

(declare-fun m!1142321 () Bool)

(assert (=> b!1238792 m!1142321))

(push 1)

