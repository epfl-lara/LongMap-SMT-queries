; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102824 () Bool)

(assert start!102824)

(declare-fun b!1235831 () Bool)

(declare-fun res!823893 () Bool)

(declare-fun e!700605 () Bool)

(assert (=> b!1235831 (=> (not res!823893) (not e!700605))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79669 0))(
  ( (array!79670 (arr!38442 (Array (_ BitVec 32) (_ BitVec 64))) (size!38978 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79669)

(assert (=> b!1235831 (= res!823893 (not (= from!3213 (bvsub (size!38978 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235832 () Bool)

(declare-fun res!823896 () Bool)

(assert (=> b!1235832 (=> (not res!823896) (not e!700605))))

(declare-datatypes ((List!27215 0))(
  ( (Nil!27212) (Cons!27211 (h!28420 (_ BitVec 64)) (t!40678 List!27215)) )
))
(declare-fun acc!846 () List!27215)

(declare-fun contains!7277 (List!27215 (_ BitVec 64)) Bool)

(assert (=> b!1235832 (= res!823896 (not (contains!7277 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235833 () Bool)

(declare-fun res!823900 () Bool)

(assert (=> b!1235833 (=> (not res!823900) (not e!700605))))

(assert (=> b!1235833 (= res!823900 (not (contains!7277 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235834 () Bool)

(declare-fun res!823899 () Bool)

(assert (=> b!1235834 (=> (not res!823899) (not e!700605))))

(declare-fun arrayNoDuplicates!0 (array!79669 (_ BitVec 32) List!27215) Bool)

(assert (=> b!1235834 (= res!823899 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun res!823898 () Bool)

(assert (=> start!102824 (=> (not res!823898) (not e!700605))))

(assert (=> start!102824 (= res!823898 (and (bvslt (size!38978 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38978 a!3835))))))

(assert (=> start!102824 e!700605))

(declare-fun array_inv!29290 (array!79669) Bool)

(assert (=> start!102824 (array_inv!29290 a!3835)))

(assert (=> start!102824 true))

(declare-fun b!1235835 () Bool)

(declare-fun res!823897 () Bool)

(assert (=> b!1235835 (=> (not res!823897) (not e!700605))))

(declare-fun noDuplicate!1874 (List!27215) Bool)

(assert (=> b!1235835 (= res!823897 (noDuplicate!1874 acc!846))))

(declare-fun b!1235836 () Bool)

(declare-fun e!700603 () Bool)

(assert (=> b!1235836 (= e!700605 e!700603)))

(declare-fun res!823894 () Bool)

(assert (=> b!1235836 (=> (not res!823894) (not e!700603))))

(assert (=> b!1235836 (= res!823894 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38978 a!3835))))))

(declare-datatypes ((Unit!40970 0))(
  ( (Unit!40971) )
))
(declare-fun lt!560526 () Unit!40970)

(declare-fun e!700604 () Unit!40970)

(assert (=> b!1235836 (= lt!560526 e!700604)))

(declare-fun c!120829 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235836 (= c!120829 (validKeyInArray!0 (select (arr!38442 a!3835) from!3213)))))

(declare-fun b!1235837 () Bool)

(declare-fun Unit!40972 () Unit!40970)

(assert (=> b!1235837 (= e!700604 Unit!40972)))

(declare-fun b!1235838 () Bool)

(declare-fun lt!560528 () Unit!40970)

(assert (=> b!1235838 (= e!700604 lt!560528)))

(declare-fun lt!560531 () List!27215)

(assert (=> b!1235838 (= lt!560531 (Cons!27211 (select (arr!38442 a!3835) from!3213) acc!846))))

(declare-fun lt!560529 () Unit!40970)

(declare-fun lemmaListSubSeqRefl!0 (List!27215) Unit!40970)

(assert (=> b!1235838 (= lt!560529 (lemmaListSubSeqRefl!0 lt!560531))))

(declare-fun subseq!549 (List!27215 List!27215) Bool)

(assert (=> b!1235838 (subseq!549 lt!560531 lt!560531)))

(declare-fun lt!560530 () Unit!40970)

(declare-fun subseqTail!42 (List!27215 List!27215) Unit!40970)

(assert (=> b!1235838 (= lt!560530 (subseqTail!42 lt!560531 lt!560531))))

(assert (=> b!1235838 (subseq!549 acc!846 lt!560531)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79669 List!27215 List!27215 (_ BitVec 32)) Unit!40970)

(assert (=> b!1235838 (= lt!560528 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560531 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1235838 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1235839 () Bool)

(declare-fun res!823895 () Bool)

(assert (=> b!1235839 (=> (not res!823895) (not e!700605))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1235839 (= res!823895 (contains!7277 acc!846 k0!2925))))

(declare-fun b!1235840 () Bool)

(assert (=> b!1235840 (= e!700603 false)))

(declare-fun lt!560527 () Bool)

(assert (=> b!1235840 (= lt!560527 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(assert (= (and start!102824 res!823898) b!1235835))

(assert (= (and b!1235835 res!823897) b!1235833))

(assert (= (and b!1235833 res!823900) b!1235832))

(assert (= (and b!1235832 res!823896) b!1235834))

(assert (= (and b!1235834 res!823899) b!1235839))

(assert (= (and b!1235839 res!823895) b!1235831))

(assert (= (and b!1235831 res!823893) b!1235836))

(assert (= (and b!1235836 c!120829) b!1235838))

(assert (= (and b!1235836 (not c!120829)) b!1235837))

(assert (= (and b!1235836 res!823894) b!1235840))

(declare-fun m!1139687 () Bool)

(assert (=> b!1235834 m!1139687))

(declare-fun m!1139689 () Bool)

(assert (=> b!1235835 m!1139689))

(declare-fun m!1139691 () Bool)

(assert (=> start!102824 m!1139691))

(declare-fun m!1139693 () Bool)

(assert (=> b!1235836 m!1139693))

(assert (=> b!1235836 m!1139693))

(declare-fun m!1139695 () Bool)

(assert (=> b!1235836 m!1139695))

(declare-fun m!1139697 () Bool)

(assert (=> b!1235838 m!1139697))

(declare-fun m!1139699 () Bool)

(assert (=> b!1235838 m!1139699))

(declare-fun m!1139701 () Bool)

(assert (=> b!1235838 m!1139701))

(declare-fun m!1139703 () Bool)

(assert (=> b!1235838 m!1139703))

(declare-fun m!1139705 () Bool)

(assert (=> b!1235838 m!1139705))

(assert (=> b!1235838 m!1139693))

(declare-fun m!1139707 () Bool)

(assert (=> b!1235838 m!1139707))

(declare-fun m!1139709 () Bool)

(assert (=> b!1235833 m!1139709))

(declare-fun m!1139711 () Bool)

(assert (=> b!1235832 m!1139711))

(assert (=> b!1235840 m!1139705))

(declare-fun m!1139713 () Bool)

(assert (=> b!1235839 m!1139713))

(check-sat (not b!1235839) (not b!1235833) (not b!1235840) (not start!102824) (not b!1235834) (not b!1235832) (not b!1235835) (not b!1235838) (not b!1235836))
(check-sat)
