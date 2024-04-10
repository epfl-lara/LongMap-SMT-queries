; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102806 () Bool)

(assert start!102806)

(declare-fun b!1235561 () Bool)

(declare-fun res!823680 () Bool)

(declare-fun e!700494 () Bool)

(assert (=> b!1235561 (=> (not res!823680) (not e!700494))))

(declare-datatypes ((List!27206 0))(
  ( (Nil!27203) (Cons!27202 (h!28411 (_ BitVec 64)) (t!40669 List!27206)) )
))
(declare-fun acc!846 () List!27206)

(declare-fun contains!7268 (List!27206 (_ BitVec 64)) Bool)

(assert (=> b!1235561 (= res!823680 (not (contains!7268 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235562 () Bool)

(declare-fun e!700496 () Bool)

(assert (=> b!1235562 (= e!700494 e!700496)))

(declare-fun res!823677 () Bool)

(assert (=> b!1235562 (=> (not res!823677) (not e!700496))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79651 0))(
  ( (array!79652 (arr!38433 (Array (_ BitVec 32) (_ BitVec 64))) (size!38969 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79651)

(assert (=> b!1235562 (= res!823677 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38969 a!3835))))))

(declare-datatypes ((Unit!40943 0))(
  ( (Unit!40944) )
))
(declare-fun lt!560369 () Unit!40943)

(declare-fun e!700497 () Unit!40943)

(assert (=> b!1235562 (= lt!560369 e!700497)))

(declare-fun c!120802 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235562 (= c!120802 (validKeyInArray!0 (select (arr!38433 a!3835) from!3213)))))

(declare-fun b!1235563 () Bool)

(declare-fun res!823679 () Bool)

(assert (=> b!1235563 (=> (not res!823679) (not e!700494))))

(assert (=> b!1235563 (= res!823679 (not (contains!7268 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235564 () Bool)

(assert (=> b!1235564 (= e!700496 false)))

(declare-fun lt!560368 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79651 (_ BitVec 32) List!27206) Bool)

(assert (=> b!1235564 (= lt!560368 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1235565 () Bool)

(declare-fun res!823681 () Bool)

(assert (=> b!1235565 (=> (not res!823681) (not e!700494))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1235565 (= res!823681 (contains!7268 acc!846 k0!2925))))

(declare-fun b!1235566 () Bool)

(declare-fun res!823682 () Bool)

(assert (=> b!1235566 (=> (not res!823682) (not e!700494))))

(declare-fun noDuplicate!1865 (List!27206) Bool)

(assert (=> b!1235566 (= res!823682 (noDuplicate!1865 acc!846))))

(declare-fun b!1235567 () Bool)

(declare-fun res!823678 () Bool)

(assert (=> b!1235567 (=> (not res!823678) (not e!700494))))

(assert (=> b!1235567 (= res!823678 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun res!823683 () Bool)

(assert (=> start!102806 (=> (not res!823683) (not e!700494))))

(assert (=> start!102806 (= res!823683 (and (bvslt (size!38969 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38969 a!3835))))))

(assert (=> start!102806 e!700494))

(declare-fun array_inv!29281 (array!79651) Bool)

(assert (=> start!102806 (array_inv!29281 a!3835)))

(assert (=> start!102806 true))

(declare-fun b!1235568 () Bool)

(declare-fun lt!560367 () Unit!40943)

(assert (=> b!1235568 (= e!700497 lt!560367)))

(declare-fun lt!560365 () List!27206)

(assert (=> b!1235568 (= lt!560365 (Cons!27202 (select (arr!38433 a!3835) from!3213) acc!846))))

(declare-fun lt!560366 () Unit!40943)

(declare-fun lemmaListSubSeqRefl!0 (List!27206) Unit!40943)

(assert (=> b!1235568 (= lt!560366 (lemmaListSubSeqRefl!0 lt!560365))))

(declare-fun subseq!540 (List!27206 List!27206) Bool)

(assert (=> b!1235568 (subseq!540 lt!560365 lt!560365)))

(declare-fun lt!560364 () Unit!40943)

(declare-fun subseqTail!33 (List!27206 List!27206) Unit!40943)

(assert (=> b!1235568 (= lt!560364 (subseqTail!33 lt!560365 lt!560365))))

(assert (=> b!1235568 (subseq!540 acc!846 lt!560365)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79651 List!27206 List!27206 (_ BitVec 32)) Unit!40943)

(assert (=> b!1235568 (= lt!560367 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560365 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1235568 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1235569 () Bool)

(declare-fun Unit!40945 () Unit!40943)

(assert (=> b!1235569 (= e!700497 Unit!40945)))

(declare-fun b!1235570 () Bool)

(declare-fun res!823684 () Bool)

(assert (=> b!1235570 (=> (not res!823684) (not e!700494))))

(assert (=> b!1235570 (= res!823684 (not (= from!3213 (bvsub (size!38969 a!3835) #b00000000000000000000000000000001))))))

(assert (= (and start!102806 res!823683) b!1235566))

(assert (= (and b!1235566 res!823682) b!1235563))

(assert (= (and b!1235563 res!823679) b!1235561))

(assert (= (and b!1235561 res!823680) b!1235567))

(assert (= (and b!1235567 res!823678) b!1235565))

(assert (= (and b!1235565 res!823681) b!1235570))

(assert (= (and b!1235570 res!823684) b!1235562))

(assert (= (and b!1235562 c!120802) b!1235568))

(assert (= (and b!1235562 (not c!120802)) b!1235569))

(assert (= (and b!1235562 res!823677) b!1235564))

(declare-fun m!1139435 () Bool)

(assert (=> b!1235566 m!1139435))

(declare-fun m!1139437 () Bool)

(assert (=> b!1235564 m!1139437))

(declare-fun m!1139439 () Bool)

(assert (=> b!1235568 m!1139439))

(declare-fun m!1139441 () Bool)

(assert (=> b!1235568 m!1139441))

(declare-fun m!1139443 () Bool)

(assert (=> b!1235568 m!1139443))

(assert (=> b!1235568 m!1139437))

(declare-fun m!1139445 () Bool)

(assert (=> b!1235568 m!1139445))

(declare-fun m!1139447 () Bool)

(assert (=> b!1235568 m!1139447))

(declare-fun m!1139449 () Bool)

(assert (=> b!1235568 m!1139449))

(declare-fun m!1139451 () Bool)

(assert (=> b!1235563 m!1139451))

(declare-fun m!1139453 () Bool)

(assert (=> b!1235561 m!1139453))

(assert (=> b!1235562 m!1139449))

(assert (=> b!1235562 m!1139449))

(declare-fun m!1139455 () Bool)

(assert (=> b!1235562 m!1139455))

(declare-fun m!1139457 () Bool)

(assert (=> b!1235567 m!1139457))

(declare-fun m!1139459 () Bool)

(assert (=> b!1235565 m!1139459))

(declare-fun m!1139461 () Bool)

(assert (=> start!102806 m!1139461))

(check-sat (not b!1235561) (not b!1235568) (not b!1235566) (not b!1235567) (not b!1235563) (not start!102806) (not b!1235564) (not b!1235562) (not b!1235565))
(check-sat)
