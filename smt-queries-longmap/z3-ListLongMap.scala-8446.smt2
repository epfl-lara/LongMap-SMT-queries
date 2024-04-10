; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102812 () Bool)

(assert start!102812)

(declare-fun res!823752 () Bool)

(declare-fun e!700533 () Bool)

(assert (=> start!102812 (=> (not res!823752) (not e!700533))))

(declare-datatypes ((array!79657 0))(
  ( (array!79658 (arr!38436 (Array (_ BitVec 32) (_ BitVec 64))) (size!38972 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79657)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102812 (= res!823752 (and (bvslt (size!38972 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38972 a!3835))))))

(assert (=> start!102812 e!700533))

(declare-fun array_inv!29284 (array!79657) Bool)

(assert (=> start!102812 (array_inv!29284 a!3835)))

(assert (=> start!102812 true))

(declare-fun b!1235651 () Bool)

(declare-fun res!823749 () Bool)

(assert (=> b!1235651 (=> (not res!823749) (not e!700533))))

(declare-datatypes ((List!27209 0))(
  ( (Nil!27206) (Cons!27205 (h!28414 (_ BitVec 64)) (t!40672 List!27209)) )
))
(declare-fun acc!846 () List!27209)

(declare-fun contains!7271 (List!27209 (_ BitVec 64)) Bool)

(assert (=> b!1235651 (= res!823749 (not (contains!7271 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235652 () Bool)

(declare-fun res!823756 () Bool)

(assert (=> b!1235652 (=> (not res!823756) (not e!700533))))

(assert (=> b!1235652 (= res!823756 (not (= from!3213 (bvsub (size!38972 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235653 () Bool)

(declare-datatypes ((Unit!40952 0))(
  ( (Unit!40953) )
))
(declare-fun e!700532 () Unit!40952)

(declare-fun lt!560420 () Unit!40952)

(assert (=> b!1235653 (= e!700532 lt!560420)))

(declare-fun lt!560419 () List!27209)

(assert (=> b!1235653 (= lt!560419 (Cons!27205 (select (arr!38436 a!3835) from!3213) acc!846))))

(declare-fun lt!560421 () Unit!40952)

(declare-fun lemmaListSubSeqRefl!0 (List!27209) Unit!40952)

(assert (=> b!1235653 (= lt!560421 (lemmaListSubSeqRefl!0 lt!560419))))

(declare-fun subseq!543 (List!27209 List!27209) Bool)

(assert (=> b!1235653 (subseq!543 lt!560419 lt!560419)))

(declare-fun lt!560422 () Unit!40952)

(declare-fun subseqTail!36 (List!27209 List!27209) Unit!40952)

(assert (=> b!1235653 (= lt!560422 (subseqTail!36 lt!560419 lt!560419))))

(assert (=> b!1235653 (subseq!543 acc!846 lt!560419)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79657 List!27209 List!27209 (_ BitVec 32)) Unit!40952)

(assert (=> b!1235653 (= lt!560420 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560419 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79657 (_ BitVec 32) List!27209) Bool)

(assert (=> b!1235653 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1235654 () Bool)

(declare-fun res!823751 () Bool)

(assert (=> b!1235654 (=> (not res!823751) (not e!700533))))

(declare-fun noDuplicate!1868 (List!27209) Bool)

(assert (=> b!1235654 (= res!823751 (noDuplicate!1868 acc!846))))

(declare-fun b!1235655 () Bool)

(declare-fun e!700530 () Bool)

(assert (=> b!1235655 (= e!700533 e!700530)))

(declare-fun res!823750 () Bool)

(assert (=> b!1235655 (=> (not res!823750) (not e!700530))))

(assert (=> b!1235655 (= res!823750 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38972 a!3835))))))

(declare-fun lt!560423 () Unit!40952)

(assert (=> b!1235655 (= lt!560423 e!700532)))

(declare-fun c!120811 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235655 (= c!120811 (validKeyInArray!0 (select (arr!38436 a!3835) from!3213)))))

(declare-fun b!1235656 () Bool)

(declare-fun res!823755 () Bool)

(assert (=> b!1235656 (=> (not res!823755) (not e!700533))))

(assert (=> b!1235656 (= res!823755 (not (contains!7271 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235657 () Bool)

(assert (=> b!1235657 (= e!700530 false)))

(declare-fun lt!560418 () Bool)

(assert (=> b!1235657 (= lt!560418 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1235658 () Bool)

(declare-fun res!823754 () Bool)

(assert (=> b!1235658 (=> (not res!823754) (not e!700533))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1235658 (= res!823754 (contains!7271 acc!846 k0!2925))))

(declare-fun b!1235659 () Bool)

(declare-fun Unit!40954 () Unit!40952)

(assert (=> b!1235659 (= e!700532 Unit!40954)))

(declare-fun b!1235660 () Bool)

(declare-fun res!823753 () Bool)

(assert (=> b!1235660 (=> (not res!823753) (not e!700533))))

(assert (=> b!1235660 (= res!823753 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(assert (= (and start!102812 res!823752) b!1235654))

(assert (= (and b!1235654 res!823751) b!1235651))

(assert (= (and b!1235651 res!823749) b!1235656))

(assert (= (and b!1235656 res!823755) b!1235660))

(assert (= (and b!1235660 res!823753) b!1235658))

(assert (= (and b!1235658 res!823754) b!1235652))

(assert (= (and b!1235652 res!823756) b!1235655))

(assert (= (and b!1235655 c!120811) b!1235653))

(assert (= (and b!1235655 (not c!120811)) b!1235659))

(assert (= (and b!1235655 res!823750) b!1235657))

(declare-fun m!1139519 () Bool)

(assert (=> b!1235657 m!1139519))

(declare-fun m!1139521 () Bool)

(assert (=> b!1235654 m!1139521))

(declare-fun m!1139523 () Bool)

(assert (=> b!1235658 m!1139523))

(declare-fun m!1139525 () Bool)

(assert (=> b!1235656 m!1139525))

(declare-fun m!1139527 () Bool)

(assert (=> b!1235653 m!1139527))

(declare-fun m!1139529 () Bool)

(assert (=> b!1235653 m!1139529))

(declare-fun m!1139531 () Bool)

(assert (=> b!1235653 m!1139531))

(declare-fun m!1139533 () Bool)

(assert (=> b!1235653 m!1139533))

(declare-fun m!1139535 () Bool)

(assert (=> b!1235653 m!1139535))

(declare-fun m!1139537 () Bool)

(assert (=> b!1235653 m!1139537))

(assert (=> b!1235653 m!1139519))

(assert (=> b!1235655 m!1139535))

(assert (=> b!1235655 m!1139535))

(declare-fun m!1139539 () Bool)

(assert (=> b!1235655 m!1139539))

(declare-fun m!1139541 () Bool)

(assert (=> b!1235651 m!1139541))

(declare-fun m!1139543 () Bool)

(assert (=> b!1235660 m!1139543))

(declare-fun m!1139545 () Bool)

(assert (=> start!102812 m!1139545))

(check-sat (not start!102812) (not b!1235656) (not b!1235655) (not b!1235654) (not b!1235658) (not b!1235657) (not b!1235660) (not b!1235653) (not b!1235651))
(check-sat)
