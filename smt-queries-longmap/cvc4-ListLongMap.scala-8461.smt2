; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102904 () Bool)

(assert start!102904)

(declare-fun b!1236745 () Bool)

(declare-fun res!824730 () Bool)

(declare-fun e!700922 () Bool)

(assert (=> b!1236745 (=> (not res!824730) (not e!700922))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79749 0))(
  ( (array!79750 (arr!38482 (Array (_ BitVec 32) (_ BitVec 64))) (size!39018 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79749)

(assert (=> b!1236745 (= res!824730 (not (= from!3213 (bvsub (size!39018 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1236746 () Bool)

(declare-fun res!824727 () Bool)

(assert (=> b!1236746 (=> (not res!824727) (not e!700922))))

(declare-datatypes ((List!27255 0))(
  ( (Nil!27252) (Cons!27251 (h!28460 (_ BitVec 64)) (t!40718 List!27255)) )
))
(declare-fun acc!846 () List!27255)

(declare-fun contains!7317 (List!27255 (_ BitVec 64)) Bool)

(assert (=> b!1236746 (= res!824727 (not (contains!7317 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236748 () Bool)

(declare-fun res!824732 () Bool)

(assert (=> b!1236748 (=> (not res!824732) (not e!700922))))

(declare-fun noDuplicate!1914 (List!27255) Bool)

(assert (=> b!1236748 (= res!824732 (noDuplicate!1914 acc!846))))

(declare-fun b!1236749 () Bool)

(declare-fun res!824731 () Bool)

(assert (=> b!1236749 (=> (not res!824731) (not e!700922))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236749 (= res!824731 (validKeyInArray!0 (select (arr!38482 a!3835) from!3213)))))

(declare-fun b!1236750 () Bool)

(assert (=> b!1236750 (= e!700922 (not true))))

(declare-datatypes ((Unit!41028 0))(
  ( (Unit!41029) )
))
(declare-fun lt!560873 () Unit!41028)

(declare-fun lt!560871 () List!27255)

(declare-fun subseqTail!58 (List!27255 List!27255) Unit!41028)

(assert (=> b!1236750 (= lt!560873 (subseqTail!58 lt!560871 lt!560871))))

(declare-fun subseq!571 (List!27255 List!27255) Bool)

(assert (=> b!1236750 (subseq!571 lt!560871 lt!560871)))

(declare-fun lt!560872 () Unit!41028)

(declare-fun lemmaListSubSeqRefl!0 (List!27255) Unit!41028)

(assert (=> b!1236750 (= lt!560872 (lemmaListSubSeqRefl!0 lt!560871))))

(assert (=> b!1236750 (= lt!560871 (Cons!27251 (select (arr!38482 a!3835) from!3213) acc!846))))

(declare-fun b!1236751 () Bool)

(declare-fun res!824733 () Bool)

(assert (=> b!1236751 (=> (not res!824733) (not e!700922))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1236751 (= res!824733 (contains!7317 acc!846 k!2925))))

(declare-fun b!1236752 () Bool)

(declare-fun res!824729 () Bool)

(assert (=> b!1236752 (=> (not res!824729) (not e!700922))))

(assert (=> b!1236752 (= res!824729 (not (contains!7317 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!824728 () Bool)

(assert (=> start!102904 (=> (not res!824728) (not e!700922))))

(assert (=> start!102904 (= res!824728 (and (bvslt (size!39018 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39018 a!3835))))))

(assert (=> start!102904 e!700922))

(declare-fun array_inv!29330 (array!79749) Bool)

(assert (=> start!102904 (array_inv!29330 a!3835)))

(assert (=> start!102904 true))

(declare-fun b!1236747 () Bool)

(declare-fun res!824734 () Bool)

(assert (=> b!1236747 (=> (not res!824734) (not e!700922))))

(declare-fun arrayNoDuplicates!0 (array!79749 (_ BitVec 32) List!27255) Bool)

(assert (=> b!1236747 (= res!824734 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(assert (= (and start!102904 res!824728) b!1236748))

(assert (= (and b!1236748 res!824732) b!1236752))

(assert (= (and b!1236752 res!824729) b!1236746))

(assert (= (and b!1236746 res!824727) b!1236747))

(assert (= (and b!1236747 res!824734) b!1236751))

(assert (= (and b!1236751 res!824733) b!1236745))

(assert (= (and b!1236745 res!824730) b!1236749))

(assert (= (and b!1236749 res!824731) b!1236750))

(declare-fun m!1140495 () Bool)

(assert (=> b!1236752 m!1140495))

(declare-fun m!1140497 () Bool)

(assert (=> b!1236750 m!1140497))

(declare-fun m!1140499 () Bool)

(assert (=> b!1236750 m!1140499))

(declare-fun m!1140501 () Bool)

(assert (=> b!1236750 m!1140501))

(declare-fun m!1140503 () Bool)

(assert (=> b!1236750 m!1140503))

(declare-fun m!1140505 () Bool)

(assert (=> b!1236746 m!1140505))

(declare-fun m!1140507 () Bool)

(assert (=> start!102904 m!1140507))

(declare-fun m!1140509 () Bool)

(assert (=> b!1236747 m!1140509))

(declare-fun m!1140511 () Bool)

(assert (=> b!1236751 m!1140511))

(declare-fun m!1140513 () Bool)

(assert (=> b!1236748 m!1140513))

(assert (=> b!1236749 m!1140503))

(assert (=> b!1236749 m!1140503))

(declare-fun m!1140515 () Bool)

(assert (=> b!1236749 m!1140515))

(push 1)

(assert (not b!1236751))

(assert (not start!102904))

(assert (not b!1236747))

(assert (not b!1236746))

(assert (not b!1236748))

(assert (not b!1236752))

(assert (not b!1236749))

(assert (not b!1236750))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

