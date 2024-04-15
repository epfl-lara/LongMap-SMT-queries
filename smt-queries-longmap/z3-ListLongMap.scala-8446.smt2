; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102808 () Bool)

(assert start!102808)

(declare-fun b!1235553 () Bool)

(declare-fun e!700484 () Bool)

(assert (=> b!1235553 (= e!700484 false)))

(declare-datatypes ((array!79576 0))(
  ( (array!79577 (arr!38396 (Array (_ BitVec 32) (_ BitVec 64))) (size!38934 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79576)

(declare-datatypes ((List!27270 0))(
  ( (Nil!27267) (Cons!27266 (h!28475 (_ BitVec 64)) (t!40724 List!27270)) )
))
(declare-fun acc!846 () List!27270)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun lt!560230 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79576 (_ BitVec 32) List!27270) Bool)

(assert (=> b!1235553 (= lt!560230 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1235554 () Bool)

(declare-fun res!823697 () Bool)

(declare-fun e!700487 () Bool)

(assert (=> b!1235554 (=> (not res!823697) (not e!700487))))

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun contains!7242 (List!27270 (_ BitVec 64)) Bool)

(assert (=> b!1235554 (= res!823697 (contains!7242 acc!846 k0!2925))))

(declare-fun b!1235555 () Bool)

(assert (=> b!1235555 (= e!700487 e!700484)))

(declare-fun res!823700 () Bool)

(assert (=> b!1235555 (=> (not res!823700) (not e!700484))))

(assert (=> b!1235555 (= res!823700 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38934 a!3835))))))

(declare-datatypes ((Unit!40796 0))(
  ( (Unit!40797) )
))
(declare-fun lt!560228 () Unit!40796)

(declare-fun e!700486 () Unit!40796)

(assert (=> b!1235555 (= lt!560228 e!700486)))

(declare-fun c!120793 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235555 (= c!120793 (validKeyInArray!0 (select (arr!38396 a!3835) from!3213)))))

(declare-fun b!1235556 () Bool)

(declare-fun Unit!40798 () Unit!40796)

(assert (=> b!1235556 (= e!700486 Unit!40798)))

(declare-fun res!823694 () Bool)

(assert (=> start!102808 (=> (not res!823694) (not e!700487))))

(assert (=> start!102808 (= res!823694 (and (bvslt (size!38934 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38934 a!3835))))))

(assert (=> start!102808 e!700487))

(declare-fun array_inv!29379 (array!79576) Bool)

(assert (=> start!102808 (array_inv!29379 a!3835)))

(assert (=> start!102808 true))

(declare-fun b!1235557 () Bool)

(declare-fun res!823698 () Bool)

(assert (=> b!1235557 (=> (not res!823698) (not e!700487))))

(assert (=> b!1235557 (= res!823698 (not (= from!3213 (bvsub (size!38934 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235558 () Bool)

(declare-fun res!823693 () Bool)

(assert (=> b!1235558 (=> (not res!823693) (not e!700487))))

(assert (=> b!1235558 (= res!823693 (not (contains!7242 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235559 () Bool)

(declare-fun res!823696 () Bool)

(assert (=> b!1235559 (=> (not res!823696) (not e!700487))))

(assert (=> b!1235559 (= res!823696 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235560 () Bool)

(declare-fun res!823695 () Bool)

(assert (=> b!1235560 (=> (not res!823695) (not e!700487))))

(assert (=> b!1235560 (= res!823695 (not (contains!7242 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235561 () Bool)

(declare-fun lt!560231 () Unit!40796)

(assert (=> b!1235561 (= e!700486 lt!560231)))

(declare-fun lt!560227 () List!27270)

(assert (=> b!1235561 (= lt!560227 (Cons!27266 (select (arr!38396 a!3835) from!3213) acc!846))))

(declare-fun lt!560229 () Unit!40796)

(declare-fun lemmaListSubSeqRefl!0 (List!27270) Unit!40796)

(assert (=> b!1235561 (= lt!560229 (lemmaListSubSeqRefl!0 lt!560227))))

(declare-fun subseq!542 (List!27270 List!27270) Bool)

(assert (=> b!1235561 (subseq!542 lt!560227 lt!560227)))

(declare-fun lt!560226 () Unit!40796)

(declare-fun subseqTail!35 (List!27270 List!27270) Unit!40796)

(assert (=> b!1235561 (= lt!560226 (subseqTail!35 lt!560227 lt!560227))))

(assert (=> b!1235561 (subseq!542 acc!846 lt!560227)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79576 List!27270 List!27270 (_ BitVec 32)) Unit!40796)

(assert (=> b!1235561 (= lt!560231 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560227 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1235561 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1235562 () Bool)

(declare-fun res!823699 () Bool)

(assert (=> b!1235562 (=> (not res!823699) (not e!700487))))

(declare-fun noDuplicate!1885 (List!27270) Bool)

(assert (=> b!1235562 (= res!823699 (noDuplicate!1885 acc!846))))

(assert (= (and start!102808 res!823694) b!1235562))

(assert (= (and b!1235562 res!823699) b!1235560))

(assert (= (and b!1235560 res!823695) b!1235558))

(assert (= (and b!1235558 res!823693) b!1235559))

(assert (= (and b!1235559 res!823696) b!1235554))

(assert (= (and b!1235554 res!823697) b!1235557))

(assert (= (and b!1235557 res!823698) b!1235555))

(assert (= (and b!1235555 c!120793) b!1235561))

(assert (= (and b!1235555 (not c!120793)) b!1235556))

(assert (= (and b!1235555 res!823700) b!1235553))

(declare-fun m!1138995 () Bool)

(assert (=> b!1235562 m!1138995))

(declare-fun m!1138997 () Bool)

(assert (=> b!1235561 m!1138997))

(declare-fun m!1138999 () Bool)

(assert (=> b!1235561 m!1138999))

(declare-fun m!1139001 () Bool)

(assert (=> b!1235561 m!1139001))

(declare-fun m!1139003 () Bool)

(assert (=> b!1235561 m!1139003))

(declare-fun m!1139005 () Bool)

(assert (=> b!1235561 m!1139005))

(declare-fun m!1139007 () Bool)

(assert (=> b!1235561 m!1139007))

(declare-fun m!1139009 () Bool)

(assert (=> b!1235561 m!1139009))

(assert (=> b!1235553 m!1139005))

(declare-fun m!1139011 () Bool)

(assert (=> b!1235554 m!1139011))

(declare-fun m!1139013 () Bool)

(assert (=> start!102808 m!1139013))

(declare-fun m!1139015 () Bool)

(assert (=> b!1235558 m!1139015))

(declare-fun m!1139017 () Bool)

(assert (=> b!1235560 m!1139017))

(assert (=> b!1235555 m!1139007))

(assert (=> b!1235555 m!1139007))

(declare-fun m!1139019 () Bool)

(assert (=> b!1235555 m!1139019))

(declare-fun m!1139021 () Bool)

(assert (=> b!1235559 m!1139021))

(check-sat (not b!1235561) (not start!102808) (not b!1235560) (not b!1235553) (not b!1235555) (not b!1235554) (not b!1235559) (not b!1235562) (not b!1235558))
(check-sat)
