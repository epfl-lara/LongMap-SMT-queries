; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103004 () Bool)

(assert start!103004)

(declare-fun b!1237391 () Bool)

(declare-fun res!825295 () Bool)

(declare-fun e!701275 () Bool)

(assert (=> b!1237391 (=> (not res!825295) (not e!701275))))

(declare-datatypes ((List!27332 0))(
  ( (Nil!27329) (Cons!27328 (h!28537 (_ BitVec 64)) (t!40786 List!27332)) )
))
(declare-fun acc!846 () List!27332)

(declare-fun contains!7304 (List!27332 (_ BitVec 64)) Bool)

(assert (=> b!1237391 (= res!825295 (not (contains!7304 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237392 () Bool)

(declare-fun res!825301 () Bool)

(assert (=> b!1237392 (=> (not res!825301) (not e!701275))))

(declare-datatypes ((array!79703 0))(
  ( (array!79704 (arr!38458 (Array (_ BitVec 32) (_ BitVec 64))) (size!38996 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79703)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79703 (_ BitVec 32) List!27332) Bool)

(assert (=> b!1237392 (= res!825301 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1237394 () Bool)

(assert (=> b!1237394 (= e!701275 (not true))))

(declare-fun lt!560883 () List!27332)

(declare-fun subseq!586 (List!27332 List!27332) Bool)

(assert (=> b!1237394 (subseq!586 acc!846 lt!560883)))

(declare-datatypes ((Unit!40915 0))(
  ( (Unit!40916) )
))
(declare-fun lt!560884 () Unit!40915)

(declare-fun subseqTail!73 (List!27332 List!27332) Unit!40915)

(assert (=> b!1237394 (= lt!560884 (subseqTail!73 lt!560883 lt!560883))))

(assert (=> b!1237394 (subseq!586 lt!560883 lt!560883)))

(declare-fun lt!560885 () Unit!40915)

(declare-fun lemmaListSubSeqRefl!0 (List!27332) Unit!40915)

(assert (=> b!1237394 (= lt!560885 (lemmaListSubSeqRefl!0 lt!560883))))

(assert (=> b!1237394 (= lt!560883 (Cons!27328 (select (arr!38458 a!3835) from!3213) acc!846))))

(declare-fun b!1237395 () Bool)

(declare-fun res!825297 () Bool)

(assert (=> b!1237395 (=> (not res!825297) (not e!701275))))

(declare-fun noDuplicate!1947 (List!27332) Bool)

(assert (=> b!1237395 (= res!825297 (noDuplicate!1947 acc!846))))

(declare-fun res!825302 () Bool)

(assert (=> start!103004 (=> (not res!825302) (not e!701275))))

(assert (=> start!103004 (= res!825302 (and (bvslt (size!38996 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38996 a!3835))))))

(assert (=> start!103004 e!701275))

(declare-fun array_inv!29441 (array!79703) Bool)

(assert (=> start!103004 (array_inv!29441 a!3835)))

(assert (=> start!103004 true))

(declare-fun b!1237393 () Bool)

(declare-fun res!825299 () Bool)

(assert (=> b!1237393 (=> (not res!825299) (not e!701275))))

(assert (=> b!1237393 (= res!825299 (not (= from!3213 (bvsub (size!38996 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1237396 () Bool)

(declare-fun res!825296 () Bool)

(assert (=> b!1237396 (=> (not res!825296) (not e!701275))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1237396 (= res!825296 (validKeyInArray!0 (select (arr!38458 a!3835) from!3213)))))

(declare-fun b!1237397 () Bool)

(declare-fun res!825298 () Bool)

(assert (=> b!1237397 (=> (not res!825298) (not e!701275))))

(assert (=> b!1237397 (= res!825298 (not (contains!7304 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237398 () Bool)

(declare-fun res!825300 () Bool)

(assert (=> b!1237398 (=> (not res!825300) (not e!701275))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1237398 (= res!825300 (contains!7304 acc!846 k!2925))))

(assert (= (and start!103004 res!825302) b!1237395))

(assert (= (and b!1237395 res!825297) b!1237397))

(assert (= (and b!1237397 res!825298) b!1237391))

(assert (= (and b!1237391 res!825295) b!1237392))

(assert (= (and b!1237392 res!825301) b!1237398))

(assert (= (and b!1237398 res!825300) b!1237393))

(assert (= (and b!1237393 res!825299) b!1237396))

(assert (= (and b!1237396 res!825296) b!1237394))

(declare-fun m!1140681 () Bool)

(assert (=> b!1237392 m!1140681))

(declare-fun m!1140683 () Bool)

(assert (=> b!1237395 m!1140683))

(declare-fun m!1140685 () Bool)

(assert (=> b!1237396 m!1140685))

(assert (=> b!1237396 m!1140685))

(declare-fun m!1140687 () Bool)

(assert (=> b!1237396 m!1140687))

(declare-fun m!1140689 () Bool)

(assert (=> b!1237397 m!1140689))

(declare-fun m!1140691 () Bool)

(assert (=> b!1237394 m!1140691))

(declare-fun m!1140693 () Bool)

(assert (=> b!1237394 m!1140693))

(declare-fun m!1140695 () Bool)

(assert (=> b!1237394 m!1140695))

(declare-fun m!1140697 () Bool)

(assert (=> b!1237394 m!1140697))

(assert (=> b!1237394 m!1140685))

(declare-fun m!1140699 () Bool)

(assert (=> b!1237398 m!1140699))

(declare-fun m!1140701 () Bool)

(assert (=> start!103004 m!1140701))

(declare-fun m!1140703 () Bool)

(assert (=> b!1237391 m!1140703))

(push 1)

(assert (not b!1237391))

(assert (not b!1237394))

(assert (not b!1237395))

(assert (not b!1237392))

(assert (not b!1237396))

(assert (not b!1237398))

(assert (not start!103004))

(assert (not b!1237397))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

