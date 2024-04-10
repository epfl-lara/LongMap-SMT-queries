; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103202 () Bool)

(assert start!103202)

(declare-fun b!1238838 () Bool)

(declare-fun res!826440 () Bool)

(declare-fun e!702092 () Bool)

(assert (=> b!1238838 (=> (not res!826440) (not e!702092))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79837 0))(
  ( (array!79838 (arr!38520 (Array (_ BitVec 32) (_ BitVec 64))) (size!39056 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79837)

(assert (=> b!1238838 (= res!826440 (not (= from!3213 (bvsub (size!39056 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1238839 () Bool)

(declare-datatypes ((Unit!41137 0))(
  ( (Unit!41138) )
))
(declare-fun e!702093 () Unit!41137)

(declare-fun lt!561461 () Unit!41137)

(assert (=> b!1238839 (= e!702093 lt!561461)))

(declare-datatypes ((List!27293 0))(
  ( (Nil!27290) (Cons!27289 (h!28498 (_ BitVec 64)) (t!40756 List!27293)) )
))
(declare-fun acc!846 () List!27293)

(declare-fun lt!561457 () List!27293)

(assert (=> b!1238839 (= lt!561457 (Cons!27289 (select (arr!38520 a!3835) from!3213) acc!846))))

(declare-fun lt!561458 () Unit!41137)

(declare-fun lemmaListSubSeqRefl!0 (List!27293) Unit!41137)

(assert (=> b!1238839 (= lt!561458 (lemmaListSubSeqRefl!0 lt!561457))))

(declare-fun subseq!609 (List!27293 List!27293) Bool)

(assert (=> b!1238839 (subseq!609 lt!561457 lt!561457)))

(declare-fun lt!561459 () Unit!41137)

(declare-fun subseqTail!96 (List!27293 List!27293) Unit!41137)

(assert (=> b!1238839 (= lt!561459 (subseqTail!96 lt!561457 lt!561457))))

(assert (=> b!1238839 (subseq!609 acc!846 lt!561457)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79837 List!27293 List!27293 (_ BitVec 32)) Unit!41137)

(assert (=> b!1238839 (= lt!561461 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561457 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79837 (_ BitVec 32) List!27293) Bool)

(assert (=> b!1238839 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1238840 () Bool)

(assert (=> b!1238840 (= e!702092 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!3213) (size!39056 a!3835))))))

(declare-fun lt!561460 () Unit!41137)

(assert (=> b!1238840 (= lt!561460 e!702093)))

(declare-fun c!121060 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238840 (= c!121060 (validKeyInArray!0 (select (arr!38520 a!3835) from!3213)))))

(declare-fun b!1238841 () Bool)

(declare-fun res!826444 () Bool)

(assert (=> b!1238841 (=> (not res!826444) (not e!702092))))

(declare-fun contains!7355 (List!27293 (_ BitVec 64)) Bool)

(assert (=> b!1238841 (= res!826444 (not (contains!7355 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!826439 () Bool)

(assert (=> start!103202 (=> (not res!826439) (not e!702092))))

(assert (=> start!103202 (= res!826439 (and (bvslt (size!39056 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39056 a!3835))))))

(assert (=> start!103202 e!702092))

(declare-fun array_inv!29368 (array!79837) Bool)

(assert (=> start!103202 (array_inv!29368 a!3835)))

(assert (=> start!103202 true))

(declare-fun b!1238842 () Bool)

(declare-fun res!826442 () Bool)

(assert (=> b!1238842 (=> (not res!826442) (not e!702092))))

(assert (=> b!1238842 (= res!826442 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1238843 () Bool)

(declare-fun Unit!41139 () Unit!41137)

(assert (=> b!1238843 (= e!702093 Unit!41139)))

(declare-fun b!1238844 () Bool)

(declare-fun res!826438 () Bool)

(assert (=> b!1238844 (=> (not res!826438) (not e!702092))))

(assert (=> b!1238844 (= res!826438 (not (contains!7355 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238845 () Bool)

(declare-fun res!826441 () Bool)

(assert (=> b!1238845 (=> (not res!826441) (not e!702092))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1238845 (= res!826441 (contains!7355 acc!846 k0!2925))))

(declare-fun b!1238846 () Bool)

(declare-fun res!826443 () Bool)

(assert (=> b!1238846 (=> (not res!826443) (not e!702092))))

(declare-fun noDuplicate!1952 (List!27293) Bool)

(assert (=> b!1238846 (= res!826443 (noDuplicate!1952 acc!846))))

(assert (= (and start!103202 res!826439) b!1238846))

(assert (= (and b!1238846 res!826443) b!1238841))

(assert (= (and b!1238841 res!826444) b!1238844))

(assert (= (and b!1238844 res!826438) b!1238842))

(assert (= (and b!1238842 res!826442) b!1238845))

(assert (= (and b!1238845 res!826441) b!1238838))

(assert (= (and b!1238838 res!826440) b!1238840))

(assert (= (and b!1238840 c!121060) b!1238839))

(assert (= (and b!1238840 (not c!121060)) b!1238843))

(declare-fun m!1142351 () Bool)

(assert (=> b!1238840 m!1142351))

(assert (=> b!1238840 m!1142351))

(declare-fun m!1142353 () Bool)

(assert (=> b!1238840 m!1142353))

(declare-fun m!1142355 () Bool)

(assert (=> b!1238842 m!1142355))

(declare-fun m!1142357 () Bool)

(assert (=> b!1238841 m!1142357))

(declare-fun m!1142359 () Bool)

(assert (=> b!1238845 m!1142359))

(declare-fun m!1142361 () Bool)

(assert (=> b!1238844 m!1142361))

(declare-fun m!1142363 () Bool)

(assert (=> b!1238846 m!1142363))

(declare-fun m!1142365 () Bool)

(assert (=> b!1238839 m!1142365))

(declare-fun m!1142367 () Bool)

(assert (=> b!1238839 m!1142367))

(declare-fun m!1142369 () Bool)

(assert (=> b!1238839 m!1142369))

(declare-fun m!1142371 () Bool)

(assert (=> b!1238839 m!1142371))

(declare-fun m!1142373 () Bool)

(assert (=> b!1238839 m!1142373))

(declare-fun m!1142375 () Bool)

(assert (=> b!1238839 m!1142375))

(assert (=> b!1238839 m!1142351))

(declare-fun m!1142377 () Bool)

(assert (=> start!103202 m!1142377))

(check-sat (not b!1238846) (not start!103202) (not b!1238845) (not b!1238841) (not b!1238840) (not b!1238844) (not b!1238839) (not b!1238842))
(check-sat)
