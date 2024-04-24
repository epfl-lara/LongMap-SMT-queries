; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103516 () Bool)

(assert start!103516)

(declare-fun b!1240689 () Bool)

(declare-fun res!827360 () Bool)

(declare-fun e!703244 () Bool)

(assert (=> b!1240689 (=> (not res!827360) (not e!703244))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79898 0))(
  ( (array!79899 (arr!38543 (Array (_ BitVec 32) (_ BitVec 64))) (size!39080 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79898)

(assert (=> b!1240689 (= res!827360 (not (= from!3213 (bvsub (size!39080 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1240690 () Bool)

(declare-fun e!703245 () Bool)

(assert (=> b!1240690 (= e!703245 false)))

(declare-datatypes ((List!27329 0))(
  ( (Nil!27326) (Cons!27325 (h!28543 (_ BitVec 64)) (t!40784 List!27329)) )
))
(declare-fun acc!846 () List!27329)

(declare-fun lt!562157 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79898 (_ BitVec 32) List!27329) Bool)

(assert (=> b!1240690 (= lt!562157 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1240691 () Bool)

(assert (=> b!1240691 (= e!703244 e!703245)))

(declare-fun res!827358 () Bool)

(assert (=> b!1240691 (=> (not res!827358) (not e!703245))))

(assert (=> b!1240691 (= res!827358 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!39080 a!3835))))))

(declare-datatypes ((Unit!41147 0))(
  ( (Unit!41148) )
))
(declare-fun lt!562156 () Unit!41147)

(declare-fun e!703246 () Unit!41147)

(assert (=> b!1240691 (= lt!562156 e!703246)))

(declare-fun c!121535 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1240691 (= c!121535 (validKeyInArray!0 (select (arr!38543 a!3835) from!3213)))))

(declare-fun b!1240692 () Bool)

(declare-fun Unit!41149 () Unit!41147)

(assert (=> b!1240692 (= e!703246 Unit!41149)))

(declare-fun b!1240693 () Bool)

(declare-fun res!827361 () Bool)

(assert (=> b!1240693 (=> (not res!827361) (not e!703244))))

(declare-fun noDuplicate!1981 (List!27329) Bool)

(assert (=> b!1240693 (= res!827361 (noDuplicate!1981 acc!846))))

(declare-fun res!827355 () Bool)

(assert (=> start!103516 (=> (not res!827355) (not e!703244))))

(assert (=> start!103516 (= res!827355 (and (bvslt (size!39080 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39080 a!3835))))))

(assert (=> start!103516 e!703244))

(declare-fun array_inv!29481 (array!79898) Bool)

(assert (=> start!103516 (array_inv!29481 a!3835)))

(assert (=> start!103516 true))

(declare-fun b!1240694 () Bool)

(declare-fun res!827354 () Bool)

(assert (=> b!1240694 (=> (not res!827354) (not e!703244))))

(assert (=> b!1240694 (= res!827354 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1240695 () Bool)

(declare-fun res!827357 () Bool)

(assert (=> b!1240695 (=> (not res!827357) (not e!703244))))

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun contains!7400 (List!27329 (_ BitVec 64)) Bool)

(assert (=> b!1240695 (= res!827357 (contains!7400 acc!846 k0!2925))))

(declare-fun b!1240696 () Bool)

(declare-fun res!827356 () Bool)

(assert (=> b!1240696 (=> (not res!827356) (not e!703244))))

(assert (=> b!1240696 (= res!827356 (not (contains!7400 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1240697 () Bool)

(declare-fun res!827359 () Bool)

(assert (=> b!1240697 (=> (not res!827359) (not e!703244))))

(assert (=> b!1240697 (= res!827359 (not (contains!7400 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1240698 () Bool)

(declare-fun lt!562153 () Unit!41147)

(assert (=> b!1240698 (= e!703246 lt!562153)))

(declare-fun lt!562155 () List!27329)

(assert (=> b!1240698 (= lt!562155 (Cons!27325 (select (arr!38543 a!3835) from!3213) acc!846))))

(declare-fun lt!562152 () Unit!41147)

(declare-fun lemmaListSubSeqRefl!0 (List!27329) Unit!41147)

(assert (=> b!1240698 (= lt!562152 (lemmaListSubSeqRefl!0 lt!562155))))

(declare-fun subseq!620 (List!27329 List!27329) Bool)

(assert (=> b!1240698 (subseq!620 lt!562155 lt!562155)))

(declare-fun lt!562154 () Unit!41147)

(declare-fun subseqTail!107 (List!27329 List!27329) Unit!41147)

(assert (=> b!1240698 (= lt!562154 (subseqTail!107 lt!562155 lt!562155))))

(assert (=> b!1240698 (subseq!620 acc!846 lt!562155)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79898 List!27329 List!27329 (_ BitVec 32)) Unit!41147)

(assert (=> b!1240698 (= lt!562153 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!562155 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1240698 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(assert (= (and start!103516 res!827355) b!1240693))

(assert (= (and b!1240693 res!827361) b!1240696))

(assert (= (and b!1240696 res!827356) b!1240697))

(assert (= (and b!1240697 res!827359) b!1240694))

(assert (= (and b!1240694 res!827354) b!1240695))

(assert (= (and b!1240695 res!827357) b!1240689))

(assert (= (and b!1240689 res!827360) b!1240691))

(assert (= (and b!1240691 c!121535) b!1240698))

(assert (= (and b!1240691 (not c!121535)) b!1240692))

(assert (= (and b!1240691 res!827358) b!1240690))

(declare-fun m!1144463 () Bool)

(assert (=> b!1240698 m!1144463))

(declare-fun m!1144465 () Bool)

(assert (=> b!1240698 m!1144465))

(declare-fun m!1144467 () Bool)

(assert (=> b!1240698 m!1144467))

(declare-fun m!1144469 () Bool)

(assert (=> b!1240698 m!1144469))

(declare-fun m!1144471 () Bool)

(assert (=> b!1240698 m!1144471))

(declare-fun m!1144473 () Bool)

(assert (=> b!1240698 m!1144473))

(declare-fun m!1144475 () Bool)

(assert (=> b!1240698 m!1144475))

(declare-fun m!1144477 () Bool)

(assert (=> b!1240693 m!1144477))

(assert (=> b!1240690 m!1144469))

(declare-fun m!1144479 () Bool)

(assert (=> b!1240697 m!1144479))

(declare-fun m!1144481 () Bool)

(assert (=> b!1240695 m!1144481))

(declare-fun m!1144483 () Bool)

(assert (=> start!103516 m!1144483))

(declare-fun m!1144485 () Bool)

(assert (=> b!1240696 m!1144485))

(declare-fun m!1144487 () Bool)

(assert (=> b!1240694 m!1144487))

(assert (=> b!1240691 m!1144471))

(assert (=> b!1240691 m!1144471))

(declare-fun m!1144489 () Bool)

(assert (=> b!1240691 m!1144489))

(check-sat (not b!1240695) (not b!1240690) (not b!1240693) (not start!103516) (not b!1240697) (not b!1240691) (not b!1240696) (not b!1240694) (not b!1240698))
(check-sat)
