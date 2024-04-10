; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102808 () Bool)

(assert start!102808)

(declare-fun b!1235591 () Bool)

(declare-datatypes ((Unit!40946 0))(
  ( (Unit!40947) )
))
(declare-fun e!700508 () Unit!40946)

(declare-fun Unit!40948 () Unit!40946)

(assert (=> b!1235591 (= e!700508 Unit!40948)))

(declare-fun b!1235592 () Bool)

(declare-fun res!823705 () Bool)

(declare-fun e!700509 () Bool)

(assert (=> b!1235592 (=> (not res!823705) (not e!700509))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79653 0))(
  ( (array!79654 (arr!38434 (Array (_ BitVec 32) (_ BitVec 64))) (size!38970 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79653)

(assert (=> b!1235592 (= res!823705 (not (= from!3213 (bvsub (size!38970 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235593 () Bool)

(declare-fun e!700507 () Bool)

(assert (=> b!1235593 (= e!700509 e!700507)))

(declare-fun res!823703 () Bool)

(assert (=> b!1235593 (=> (not res!823703) (not e!700507))))

(assert (=> b!1235593 (= res!823703 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38970 a!3835))))))

(declare-fun lt!560387 () Unit!40946)

(assert (=> b!1235593 (= lt!560387 e!700508)))

(declare-fun c!120805 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235593 (= c!120805 (validKeyInArray!0 (select (arr!38434 a!3835) from!3213)))))

(declare-fun b!1235594 () Bool)

(declare-fun res!823701 () Bool)

(assert (=> b!1235594 (=> (not res!823701) (not e!700509))))

(declare-datatypes ((List!27207 0))(
  ( (Nil!27204) (Cons!27203 (h!28412 (_ BitVec 64)) (t!40670 List!27207)) )
))
(declare-fun acc!846 () List!27207)

(declare-fun contains!7269 (List!27207 (_ BitVec 64)) Bool)

(assert (=> b!1235594 (= res!823701 (not (contains!7269 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235595 () Bool)

(assert (=> b!1235595 (= e!700507 false)))

(declare-fun lt!560386 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79653 (_ BitVec 32) List!27207) Bool)

(assert (=> b!1235595 (= lt!560386 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1235596 () Bool)

(declare-fun res!823707 () Bool)

(assert (=> b!1235596 (=> (not res!823707) (not e!700509))))

(assert (=> b!1235596 (= res!823707 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235597 () Bool)

(declare-fun res!823704 () Bool)

(assert (=> b!1235597 (=> (not res!823704) (not e!700509))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1235597 (= res!823704 (contains!7269 acc!846 k!2925))))

(declare-fun b!1235598 () Bool)

(declare-fun lt!560383 () Unit!40946)

(assert (=> b!1235598 (= e!700508 lt!560383)))

(declare-fun lt!560384 () List!27207)

(assert (=> b!1235598 (= lt!560384 (Cons!27203 (select (arr!38434 a!3835) from!3213) acc!846))))

(declare-fun lt!560385 () Unit!40946)

(declare-fun lemmaListSubSeqRefl!0 (List!27207) Unit!40946)

(assert (=> b!1235598 (= lt!560385 (lemmaListSubSeqRefl!0 lt!560384))))

(declare-fun subseq!541 (List!27207 List!27207) Bool)

(assert (=> b!1235598 (subseq!541 lt!560384 lt!560384)))

(declare-fun lt!560382 () Unit!40946)

(declare-fun subseqTail!34 (List!27207 List!27207) Unit!40946)

(assert (=> b!1235598 (= lt!560382 (subseqTail!34 lt!560384 lt!560384))))

(assert (=> b!1235598 (subseq!541 acc!846 lt!560384)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79653 List!27207 List!27207 (_ BitVec 32)) Unit!40946)

(assert (=> b!1235598 (= lt!560383 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560384 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1235598 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1235599 () Bool)

(declare-fun res!823702 () Bool)

(assert (=> b!1235599 (=> (not res!823702) (not e!700509))))

(assert (=> b!1235599 (= res!823702 (not (contains!7269 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235600 () Bool)

(declare-fun res!823708 () Bool)

(assert (=> b!1235600 (=> (not res!823708) (not e!700509))))

(declare-fun noDuplicate!1866 (List!27207) Bool)

(assert (=> b!1235600 (= res!823708 (noDuplicate!1866 acc!846))))

(declare-fun res!823706 () Bool)

(assert (=> start!102808 (=> (not res!823706) (not e!700509))))

(assert (=> start!102808 (= res!823706 (and (bvslt (size!38970 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38970 a!3835))))))

(assert (=> start!102808 e!700509))

(declare-fun array_inv!29282 (array!79653) Bool)

(assert (=> start!102808 (array_inv!29282 a!3835)))

(assert (=> start!102808 true))

(assert (= (and start!102808 res!823706) b!1235600))

(assert (= (and b!1235600 res!823708) b!1235594))

(assert (= (and b!1235594 res!823701) b!1235599))

(assert (= (and b!1235599 res!823702) b!1235596))

(assert (= (and b!1235596 res!823707) b!1235597))

(assert (= (and b!1235597 res!823704) b!1235592))

(assert (= (and b!1235592 res!823705) b!1235593))

(assert (= (and b!1235593 c!120805) b!1235598))

(assert (= (and b!1235593 (not c!120805)) b!1235591))

(assert (= (and b!1235593 res!823703) b!1235595))

(declare-fun m!1139463 () Bool)

(assert (=> b!1235596 m!1139463))

(declare-fun m!1139465 () Bool)

(assert (=> b!1235595 m!1139465))

(declare-fun m!1139467 () Bool)

(assert (=> b!1235597 m!1139467))

(declare-fun m!1139469 () Bool)

(assert (=> b!1235594 m!1139469))

(declare-fun m!1139471 () Bool)

(assert (=> start!102808 m!1139471))

(declare-fun m!1139473 () Bool)

(assert (=> b!1235599 m!1139473))

(declare-fun m!1139475 () Bool)

(assert (=> b!1235593 m!1139475))

(assert (=> b!1235593 m!1139475))

(declare-fun m!1139477 () Bool)

(assert (=> b!1235593 m!1139477))

(declare-fun m!1139479 () Bool)

(assert (=> b!1235598 m!1139479))

(declare-fun m!1139481 () Bool)

(assert (=> b!1235598 m!1139481))

(declare-fun m!1139483 () Bool)

(assert (=> b!1235598 m!1139483))

(declare-fun m!1139485 () Bool)

(assert (=> b!1235598 m!1139485))

(declare-fun m!1139487 () Bool)

(assert (=> b!1235598 m!1139487))

(assert (=> b!1235598 m!1139465))

(assert (=> b!1235598 m!1139475))

(declare-fun m!1139489 () Bool)

(assert (=> b!1235600 m!1139489))

(push 1)

(assert (not b!1235596))

(assert (not b!1235597))

(assert (not b!1235593))

(assert (not b!1235594))

(assert (not b!1235595))

(assert (not b!1235598))

