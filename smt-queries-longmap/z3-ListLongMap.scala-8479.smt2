; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103522 () Bool)

(assert start!103522)

(declare-fun res!827434 () Bool)

(declare-fun e!703283 () Bool)

(assert (=> start!103522 (=> (not res!827434) (not e!703283))))

(declare-datatypes ((array!79904 0))(
  ( (array!79905 (arr!38546 (Array (_ BitVec 32) (_ BitVec 64))) (size!39083 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79904)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!103522 (= res!827434 (and (bvslt (size!39083 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39083 a!3835))))))

(assert (=> start!103522 e!703283))

(declare-fun array_inv!29484 (array!79904) Bool)

(assert (=> start!103522 (array_inv!29484 a!3835)))

(assert (=> start!103522 true))

(declare-fun b!1240781 () Bool)

(declare-fun res!827428 () Bool)

(assert (=> b!1240781 (=> (not res!827428) (not e!703283))))

(declare-datatypes ((List!27332 0))(
  ( (Nil!27329) (Cons!27328 (h!28546 (_ BitVec 64)) (t!40787 List!27332)) )
))
(declare-fun acc!846 () List!27332)

(declare-fun contains!7403 (List!27332 (_ BitVec 64)) Bool)

(assert (=> b!1240781 (= res!827428 (not (contains!7403 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1240782 () Bool)

(declare-datatypes ((Unit!41156 0))(
  ( (Unit!41157) )
))
(declare-fun e!703280 () Unit!41156)

(declare-fun lt!562206 () Unit!41156)

(assert (=> b!1240782 (= e!703280 lt!562206)))

(declare-fun lt!562207 () List!27332)

(assert (=> b!1240782 (= lt!562207 (Cons!27328 (select (arr!38546 a!3835) from!3213) acc!846))))

(declare-fun lt!562204 () Unit!41156)

(declare-fun lemmaListSubSeqRefl!0 (List!27332) Unit!41156)

(assert (=> b!1240782 (= lt!562204 (lemmaListSubSeqRefl!0 lt!562207))))

(declare-fun subseq!623 (List!27332 List!27332) Bool)

(assert (=> b!1240782 (subseq!623 lt!562207 lt!562207)))

(declare-fun lt!562205 () Unit!41156)

(declare-fun subseqTail!110 (List!27332 List!27332) Unit!41156)

(assert (=> b!1240782 (= lt!562205 (subseqTail!110 lt!562207 lt!562207))))

(assert (=> b!1240782 (subseq!623 acc!846 lt!562207)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79904 List!27332 List!27332 (_ BitVec 32)) Unit!41156)

(assert (=> b!1240782 (= lt!562206 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!562207 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79904 (_ BitVec 32) List!27332) Bool)

(assert (=> b!1240782 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1240783 () Bool)

(declare-fun e!703281 () Bool)

(assert (=> b!1240783 (= e!703281 (bvsge (bvsub (size!39083 a!3835) (bvadd #b00000000000000000000000000000001 from!3213)) (bvsub (size!39083 a!3835) from!3213)))))

(declare-fun b!1240784 () Bool)

(declare-fun Unit!41158 () Unit!41156)

(assert (=> b!1240784 (= e!703280 Unit!41158)))

(declare-fun b!1240785 () Bool)

(declare-fun res!827432 () Bool)

(assert (=> b!1240785 (=> (not res!827432) (not e!703283))))

(assert (=> b!1240785 (= res!827432 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1240786 () Bool)

(declare-fun res!827431 () Bool)

(assert (=> b!1240786 (=> (not res!827431) (not e!703283))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1240786 (= res!827431 (contains!7403 acc!846 k0!2925))))

(declare-fun b!1240787 () Bool)

(declare-fun res!827436 () Bool)

(assert (=> b!1240787 (=> (not res!827436) (not e!703283))))

(assert (=> b!1240787 (= res!827436 (not (= from!3213 (bvsub (size!39083 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1240788 () Bool)

(declare-fun res!827433 () Bool)

(assert (=> b!1240788 (=> (not res!827433) (not e!703283))))

(declare-fun noDuplicate!1984 (List!27332) Bool)

(assert (=> b!1240788 (= res!827433 (noDuplicate!1984 acc!846))))

(declare-fun b!1240789 () Bool)

(declare-fun res!827435 () Bool)

(assert (=> b!1240789 (=> (not res!827435) (not e!703283))))

(assert (=> b!1240789 (= res!827435 (not (contains!7403 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1240790 () Bool)

(assert (=> b!1240790 (= e!703283 e!703281)))

(declare-fun res!827429 () Bool)

(assert (=> b!1240790 (=> (not res!827429) (not e!703281))))

(assert (=> b!1240790 (= res!827429 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!39083 a!3835))))))

(declare-fun lt!562208 () Unit!41156)

(assert (=> b!1240790 (= lt!562208 e!703280)))

(declare-fun c!121544 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1240790 (= c!121544 (validKeyInArray!0 (select (arr!38546 a!3835) from!3213)))))

(declare-fun b!1240791 () Bool)

(declare-fun res!827430 () Bool)

(assert (=> b!1240791 (=> (not res!827430) (not e!703281))))

(assert (=> b!1240791 (= res!827430 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(assert (= (and start!103522 res!827434) b!1240788))

(assert (= (and b!1240788 res!827433) b!1240781))

(assert (= (and b!1240781 res!827428) b!1240789))

(assert (= (and b!1240789 res!827435) b!1240785))

(assert (= (and b!1240785 res!827432) b!1240786))

(assert (= (and b!1240786 res!827431) b!1240787))

(assert (= (and b!1240787 res!827436) b!1240790))

(assert (= (and b!1240790 c!121544) b!1240782))

(assert (= (and b!1240790 (not c!121544)) b!1240784))

(assert (= (and b!1240790 res!827429) b!1240791))

(assert (= (and b!1240791 res!827430) b!1240783))

(declare-fun m!1144547 () Bool)

(assert (=> b!1240781 m!1144547))

(declare-fun m!1144549 () Bool)

(assert (=> b!1240790 m!1144549))

(assert (=> b!1240790 m!1144549))

(declare-fun m!1144551 () Bool)

(assert (=> b!1240790 m!1144551))

(declare-fun m!1144553 () Bool)

(assert (=> b!1240789 m!1144553))

(declare-fun m!1144555 () Bool)

(assert (=> b!1240788 m!1144555))

(declare-fun m!1144557 () Bool)

(assert (=> b!1240785 m!1144557))

(declare-fun m!1144559 () Bool)

(assert (=> b!1240782 m!1144559))

(declare-fun m!1144561 () Bool)

(assert (=> b!1240782 m!1144561))

(declare-fun m!1144563 () Bool)

(assert (=> b!1240782 m!1144563))

(declare-fun m!1144565 () Bool)

(assert (=> b!1240782 m!1144565))

(assert (=> b!1240782 m!1144549))

(declare-fun m!1144567 () Bool)

(assert (=> b!1240782 m!1144567))

(declare-fun m!1144569 () Bool)

(assert (=> b!1240782 m!1144569))

(declare-fun m!1144571 () Bool)

(assert (=> b!1240786 m!1144571))

(declare-fun m!1144573 () Bool)

(assert (=> start!103522 m!1144573))

(assert (=> b!1240791 m!1144563))

(check-sat (not b!1240782) (not b!1240789) (not b!1240788) (not b!1240790) (not b!1240785) (not b!1240786) (not b!1240781) (not b!1240791) (not start!103522))
(check-sat)
