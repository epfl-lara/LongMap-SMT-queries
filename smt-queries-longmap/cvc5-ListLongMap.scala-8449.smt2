; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102828 () Bool)

(assert start!102828)

(declare-fun b!1235891 () Bool)

(declare-fun e!700627 () Bool)

(assert (=> b!1235891 (= e!700627 false)))

(declare-datatypes ((array!79673 0))(
  ( (array!79674 (arr!38444 (Array (_ BitVec 32) (_ BitVec 64))) (size!38980 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79673)

(declare-datatypes ((List!27217 0))(
  ( (Nil!27214) (Cons!27213 (h!28422 (_ BitVec 64)) (t!40680 List!27217)) )
))
(declare-fun acc!846 () List!27217)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun lt!560566 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79673 (_ BitVec 32) List!27217) Bool)

(assert (=> b!1235891 (= lt!560566 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1235892 () Bool)

(declare-fun res!823948 () Bool)

(declare-fun e!700629 () Bool)

(assert (=> b!1235892 (=> (not res!823948) (not e!700629))))

(declare-fun contains!7279 (List!27217 (_ BitVec 64)) Bool)

(assert (=> b!1235892 (= res!823948 (not (contains!7279 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!823945 () Bool)

(assert (=> start!102828 (=> (not res!823945) (not e!700629))))

(assert (=> start!102828 (= res!823945 (and (bvslt (size!38980 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38980 a!3835))))))

(assert (=> start!102828 e!700629))

(declare-fun array_inv!29292 (array!79673) Bool)

(assert (=> start!102828 (array_inv!29292 a!3835)))

(assert (=> start!102828 true))

(declare-fun b!1235893 () Bool)

(declare-fun res!823941 () Bool)

(assert (=> b!1235893 (=> (not res!823941) (not e!700629))))

(assert (=> b!1235893 (= res!823941 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235894 () Bool)

(assert (=> b!1235894 (= e!700629 e!700627)))

(declare-fun res!823947 () Bool)

(assert (=> b!1235894 (=> (not res!823947) (not e!700627))))

(assert (=> b!1235894 (= res!823947 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38980 a!3835))))))

(declare-datatypes ((Unit!40976 0))(
  ( (Unit!40977) )
))
(declare-fun lt!560564 () Unit!40976)

(declare-fun e!700626 () Unit!40976)

(assert (=> b!1235894 (= lt!560564 e!700626)))

(declare-fun c!120835 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235894 (= c!120835 (validKeyInArray!0 (select (arr!38444 a!3835) from!3213)))))

(declare-fun b!1235895 () Bool)

(declare-fun lt!560565 () Unit!40976)

(assert (=> b!1235895 (= e!700626 lt!560565)))

(declare-fun lt!560563 () List!27217)

(assert (=> b!1235895 (= lt!560563 (Cons!27213 (select (arr!38444 a!3835) from!3213) acc!846))))

(declare-fun lt!560567 () Unit!40976)

(declare-fun lemmaListSubSeqRefl!0 (List!27217) Unit!40976)

(assert (=> b!1235895 (= lt!560567 (lemmaListSubSeqRefl!0 lt!560563))))

(declare-fun subseq!551 (List!27217 List!27217) Bool)

(assert (=> b!1235895 (subseq!551 lt!560563 lt!560563)))

(declare-fun lt!560562 () Unit!40976)

(declare-fun subseqTail!44 (List!27217 List!27217) Unit!40976)

(assert (=> b!1235895 (= lt!560562 (subseqTail!44 lt!560563 lt!560563))))

(assert (=> b!1235895 (subseq!551 acc!846 lt!560563)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79673 List!27217 List!27217 (_ BitVec 32)) Unit!40976)

(assert (=> b!1235895 (= lt!560565 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560563 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1235895 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1235896 () Bool)

(declare-fun res!823944 () Bool)

(assert (=> b!1235896 (=> (not res!823944) (not e!700629))))

(assert (=> b!1235896 (= res!823944 (not (= from!3213 (bvsub (size!38980 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235897 () Bool)

(declare-fun res!823942 () Bool)

(assert (=> b!1235897 (=> (not res!823942) (not e!700629))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1235897 (= res!823942 (contains!7279 acc!846 k!2925))))

(declare-fun b!1235898 () Bool)

(declare-fun res!823946 () Bool)

(assert (=> b!1235898 (=> (not res!823946) (not e!700629))))

(declare-fun noDuplicate!1876 (List!27217) Bool)

(assert (=> b!1235898 (= res!823946 (noDuplicate!1876 acc!846))))

(declare-fun b!1235899 () Bool)

(declare-fun res!823943 () Bool)

(assert (=> b!1235899 (=> (not res!823943) (not e!700629))))

(assert (=> b!1235899 (= res!823943 (not (contains!7279 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235900 () Bool)

(declare-fun Unit!40978 () Unit!40976)

(assert (=> b!1235900 (= e!700626 Unit!40978)))

(assert (= (and start!102828 res!823945) b!1235898))

(assert (= (and b!1235898 res!823946) b!1235899))

(assert (= (and b!1235899 res!823943) b!1235892))

(assert (= (and b!1235892 res!823948) b!1235893))

(assert (= (and b!1235893 res!823941) b!1235897))

(assert (= (and b!1235897 res!823942) b!1235896))

(assert (= (and b!1235896 res!823944) b!1235894))

(assert (= (and b!1235894 c!120835) b!1235895))

(assert (= (and b!1235894 (not c!120835)) b!1235900))

(assert (= (and b!1235894 res!823947) b!1235891))

(declare-fun m!1139743 () Bool)

(assert (=> b!1235895 m!1139743))

(declare-fun m!1139745 () Bool)

(assert (=> b!1235895 m!1139745))

(declare-fun m!1139747 () Bool)

(assert (=> b!1235895 m!1139747))

(declare-fun m!1139749 () Bool)

(assert (=> b!1235895 m!1139749))

(declare-fun m!1139751 () Bool)

(assert (=> b!1235895 m!1139751))

(declare-fun m!1139753 () Bool)

(assert (=> b!1235895 m!1139753))

(declare-fun m!1139755 () Bool)

(assert (=> b!1235895 m!1139755))

(declare-fun m!1139757 () Bool)

(assert (=> b!1235898 m!1139757))

(assert (=> b!1235894 m!1139753))

(assert (=> b!1235894 m!1139753))

(declare-fun m!1139759 () Bool)

(assert (=> b!1235894 m!1139759))

(assert (=> b!1235891 m!1139751))

(declare-fun m!1139761 () Bool)

(assert (=> b!1235892 m!1139761))

(declare-fun m!1139763 () Bool)

(assert (=> start!102828 m!1139763))

(declare-fun m!1139765 () Bool)

(assert (=> b!1235897 m!1139765))

(declare-fun m!1139767 () Bool)

(assert (=> b!1235893 m!1139767))

(declare-fun m!1139769 () Bool)

(assert (=> b!1235899 m!1139769))

(push 1)

