; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103190 () Bool)

(assert start!103190)

(declare-fun b!1238635 () Bool)

(declare-fun res!826305 () Bool)

(declare-fun e!702013 () Bool)

(assert (=> b!1238635 (=> (not res!826305) (not e!702013))))

(declare-datatypes ((List!27350 0))(
  ( (Nil!27347) (Cons!27346 (h!28555 (_ BitVec 64)) (t!40804 List!27350)) )
))
(declare-fun acc!846 () List!27350)

(declare-fun contains!7322 (List!27350 (_ BitVec 64)) Bool)

(assert (=> b!1238635 (= res!826305 (not (contains!7322 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238636 () Bool)

(declare-datatypes ((Unit!40967 0))(
  ( (Unit!40968) )
))
(declare-fun e!702012 () Unit!40967)

(declare-fun lt!561208 () Unit!40967)

(assert (=> b!1238636 (= e!702012 lt!561208)))

(declare-fun lt!561212 () List!27350)

(declare-datatypes ((array!79748 0))(
  ( (array!79749 (arr!38476 (Array (_ BitVec 32) (_ BitVec 64))) (size!39014 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79748)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1238636 (= lt!561212 (Cons!27346 (select (arr!38476 a!3835) from!3213) acc!846))))

(declare-fun lt!561210 () Unit!40967)

(declare-fun lemmaListSubSeqRefl!0 (List!27350) Unit!40967)

(assert (=> b!1238636 (= lt!561210 (lemmaListSubSeqRefl!0 lt!561212))))

(declare-fun subseq!604 (List!27350 List!27350) Bool)

(assert (=> b!1238636 (subseq!604 lt!561212 lt!561212)))

(declare-fun lt!561211 () Unit!40967)

(declare-fun subseqTail!91 (List!27350 List!27350) Unit!40967)

(assert (=> b!1238636 (= lt!561211 (subseqTail!91 lt!561212 lt!561212))))

(assert (=> b!1238636 (subseq!604 acc!846 lt!561212)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79748 List!27350 List!27350 (_ BitVec 32)) Unit!40967)

(assert (=> b!1238636 (= lt!561208 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561212 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79748 (_ BitVec 32) List!27350) Bool)

(assert (=> b!1238636 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1238637 () Bool)

(declare-fun res!826302 () Bool)

(assert (=> b!1238637 (=> (not res!826302) (not e!702013))))

(assert (=> b!1238637 (= res!826302 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1238638 () Bool)

(declare-fun Unit!40969 () Unit!40967)

(assert (=> b!1238638 (= e!702012 Unit!40969)))

(declare-fun res!826301 () Bool)

(assert (=> start!103190 (=> (not res!826301) (not e!702013))))

(assert (=> start!103190 (= res!826301 (and (bvslt (size!39014 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39014 a!3835))))))

(assert (=> start!103190 e!702013))

(declare-fun array_inv!29459 (array!79748) Bool)

(assert (=> start!103190 (array_inv!29459 a!3835)))

(assert (=> start!103190 true))

(declare-fun b!1238639 () Bool)

(declare-fun res!826306 () Bool)

(assert (=> b!1238639 (=> (not res!826306) (not e!702013))))

(assert (=> b!1238639 (= res!826306 (not (= from!3213 (bvsub (size!39014 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1238640 () Bool)

(assert (=> b!1238640 (= e!702013 false)))

(declare-fun lt!561209 () Unit!40967)

(assert (=> b!1238640 (= lt!561209 e!702012)))

(declare-fun c!121030 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238640 (= c!121030 (validKeyInArray!0 (select (arr!38476 a!3835) from!3213)))))

(declare-fun b!1238641 () Bool)

(declare-fun res!826304 () Bool)

(assert (=> b!1238641 (=> (not res!826304) (not e!702013))))

(assert (=> b!1238641 (= res!826304 (not (contains!7322 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238642 () Bool)

(declare-fun res!826307 () Bool)

(assert (=> b!1238642 (=> (not res!826307) (not e!702013))))

(declare-fun noDuplicate!1965 (List!27350) Bool)

(assert (=> b!1238642 (= res!826307 (noDuplicate!1965 acc!846))))

(declare-fun b!1238643 () Bool)

(declare-fun res!826303 () Bool)

(assert (=> b!1238643 (=> (not res!826303) (not e!702013))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1238643 (= res!826303 (contains!7322 acc!846 k!2925))))

(assert (= (and start!103190 res!826301) b!1238642))

(assert (= (and b!1238642 res!826307) b!1238635))

(assert (= (and b!1238635 res!826305) b!1238641))

(assert (= (and b!1238641 res!826304) b!1238637))

(assert (= (and b!1238637 res!826302) b!1238643))

(assert (= (and b!1238643 res!826303) b!1238639))

(assert (= (and b!1238639 res!826306) b!1238640))

(assert (= (and b!1238640 c!121030) b!1238636))

(assert (= (and b!1238640 (not c!121030)) b!1238638))

(declare-fun m!1141715 () Bool)

(assert (=> b!1238636 m!1141715))

(declare-fun m!1141717 () Bool)

(assert (=> b!1238636 m!1141717))

(declare-fun m!1141719 () Bool)

(assert (=> b!1238636 m!1141719))

(declare-fun m!1141721 () Bool)

(assert (=> b!1238636 m!1141721))

(declare-fun m!1141723 () Bool)

(assert (=> b!1238636 m!1141723))

(declare-fun m!1141725 () Bool)

(assert (=> b!1238636 m!1141725))

(declare-fun m!1141727 () Bool)

(assert (=> b!1238636 m!1141727))

(declare-fun m!1141729 () Bool)

(assert (=> b!1238642 m!1141729))

(declare-fun m!1141731 () Bool)

(assert (=> b!1238641 m!1141731))

(assert (=> b!1238640 m!1141727))

(assert (=> b!1238640 m!1141727))

(declare-fun m!1141733 () Bool)

(assert (=> b!1238640 m!1141733))

(declare-fun m!1141735 () Bool)

(assert (=> b!1238635 m!1141735))

(declare-fun m!1141737 () Bool)

(assert (=> b!1238643 m!1141737))

(declare-fun m!1141739 () Bool)

(assert (=> b!1238637 m!1141739))

(declare-fun m!1141741 () Bool)

(assert (=> start!103190 m!1141741))

(push 1)

(assert (not b!1238642))

(assert (not b!1238637))

(assert (not b!1238641))

(assert (not start!103190))

(assert (not b!1238635))

(assert (not b!1238636))

(assert (not b!1238643))

(assert (not b!1238640))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

