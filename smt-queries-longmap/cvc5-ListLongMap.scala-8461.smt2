; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102900 () Bool)

(assert start!102900)

(declare-fun b!1236697 () Bool)

(declare-fun res!824684 () Bool)

(declare-fun e!700910 () Bool)

(assert (=> b!1236697 (=> (not res!824684) (not e!700910))))

(declare-datatypes ((List!27253 0))(
  ( (Nil!27250) (Cons!27249 (h!28458 (_ BitVec 64)) (t!40716 List!27253)) )
))
(declare-fun acc!846 () List!27253)

(declare-fun contains!7315 (List!27253 (_ BitVec 64)) Bool)

(assert (=> b!1236697 (= res!824684 (not (contains!7315 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!824679 () Bool)

(assert (=> start!102900 (=> (not res!824679) (not e!700910))))

(declare-datatypes ((array!79745 0))(
  ( (array!79746 (arr!38480 (Array (_ BitVec 32) (_ BitVec 64))) (size!39016 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79745)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102900 (= res!824679 (and (bvslt (size!39016 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39016 a!3835))))))

(assert (=> start!102900 e!700910))

(declare-fun array_inv!29328 (array!79745) Bool)

(assert (=> start!102900 (array_inv!29328 a!3835)))

(assert (=> start!102900 true))

(declare-fun b!1236698 () Bool)

(declare-fun res!824680 () Bool)

(assert (=> b!1236698 (=> (not res!824680) (not e!700910))))

(declare-fun arrayNoDuplicates!0 (array!79745 (_ BitVec 32) List!27253) Bool)

(assert (=> b!1236698 (= res!824680 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236699 () Bool)

(declare-fun res!824686 () Bool)

(assert (=> b!1236699 (=> (not res!824686) (not e!700910))))

(assert (=> b!1236699 (= res!824686 (not (= from!3213 (bvsub (size!39016 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1236700 () Bool)

(declare-fun res!824683 () Bool)

(assert (=> b!1236700 (=> (not res!824683) (not e!700910))))

(assert (=> b!1236700 (= res!824683 (not (contains!7315 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236701 () Bool)

(assert (=> b!1236701 (= e!700910 (not true))))

(declare-datatypes ((Unit!41024 0))(
  ( (Unit!41025) )
))
(declare-fun lt!560854 () Unit!41024)

(declare-fun lt!560853 () List!27253)

(declare-fun subseqTail!56 (List!27253 List!27253) Unit!41024)

(assert (=> b!1236701 (= lt!560854 (subseqTail!56 lt!560853 lt!560853))))

(declare-fun subseq!569 (List!27253 List!27253) Bool)

(assert (=> b!1236701 (subseq!569 lt!560853 lt!560853)))

(declare-fun lt!560855 () Unit!41024)

(declare-fun lemmaListSubSeqRefl!0 (List!27253) Unit!41024)

(assert (=> b!1236701 (= lt!560855 (lemmaListSubSeqRefl!0 lt!560853))))

(assert (=> b!1236701 (= lt!560853 (Cons!27249 (select (arr!38480 a!3835) from!3213) acc!846))))

(declare-fun b!1236702 () Bool)

(declare-fun res!824681 () Bool)

(assert (=> b!1236702 (=> (not res!824681) (not e!700910))))

(declare-fun noDuplicate!1912 (List!27253) Bool)

(assert (=> b!1236702 (= res!824681 (noDuplicate!1912 acc!846))))

(declare-fun b!1236703 () Bool)

(declare-fun res!824682 () Bool)

(assert (=> b!1236703 (=> (not res!824682) (not e!700910))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1236703 (= res!824682 (contains!7315 acc!846 k!2925))))

(declare-fun b!1236704 () Bool)

(declare-fun res!824685 () Bool)

(assert (=> b!1236704 (=> (not res!824685) (not e!700910))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236704 (= res!824685 (validKeyInArray!0 (select (arr!38480 a!3835) from!3213)))))

(assert (= (and start!102900 res!824679) b!1236702))

(assert (= (and b!1236702 res!824681) b!1236700))

(assert (= (and b!1236700 res!824683) b!1236697))

(assert (= (and b!1236697 res!824684) b!1236698))

(assert (= (and b!1236698 res!824680) b!1236703))

(assert (= (and b!1236703 res!824682) b!1236699))

(assert (= (and b!1236699 res!824686) b!1236704))

(assert (= (and b!1236704 res!824685) b!1236701))

(declare-fun m!1140451 () Bool)

(assert (=> b!1236698 m!1140451))

(declare-fun m!1140453 () Bool)

(assert (=> b!1236704 m!1140453))

(assert (=> b!1236704 m!1140453))

(declare-fun m!1140455 () Bool)

(assert (=> b!1236704 m!1140455))

(declare-fun m!1140457 () Bool)

(assert (=> b!1236697 m!1140457))

(declare-fun m!1140459 () Bool)

(assert (=> b!1236702 m!1140459))

(declare-fun m!1140461 () Bool)

(assert (=> b!1236701 m!1140461))

(declare-fun m!1140463 () Bool)

(assert (=> b!1236701 m!1140463))

(declare-fun m!1140465 () Bool)

(assert (=> b!1236701 m!1140465))

(assert (=> b!1236701 m!1140453))

(declare-fun m!1140467 () Bool)

(assert (=> b!1236703 m!1140467))

(declare-fun m!1140469 () Bool)

(assert (=> b!1236700 m!1140469))

(declare-fun m!1140471 () Bool)

(assert (=> start!102900 m!1140471))

(push 1)

(assert (not b!1236701))

(assert (not b!1236698))

(assert (not b!1236697))

(assert (not b!1236704))

(assert (not start!102900))

(assert (not b!1236700))

(assert (not b!1236703))

(assert (not b!1236702))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

