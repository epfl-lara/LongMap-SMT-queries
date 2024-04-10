; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103216 () Bool)

(assert start!103216)

(declare-fun b!1239027 () Bool)

(declare-fun res!826591 () Bool)

(declare-fun e!702156 () Bool)

(assert (=> b!1239027 (=> (not res!826591) (not e!702156))))

(declare-datatypes ((List!27300 0))(
  ( (Nil!27297) (Cons!27296 (h!28505 (_ BitVec 64)) (t!40763 List!27300)) )
))
(declare-fun acc!846 () List!27300)

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun contains!7362 (List!27300 (_ BitVec 64)) Bool)

(assert (=> b!1239027 (= res!826591 (contains!7362 acc!846 k!2925))))

(declare-fun b!1239028 () Bool)

(declare-fun res!826589 () Bool)

(assert (=> b!1239028 (=> (not res!826589) (not e!702156))))

(declare-datatypes ((array!79851 0))(
  ( (array!79852 (arr!38527 (Array (_ BitVec 32) (_ BitVec 64))) (size!39063 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79851)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79851 (_ BitVec 32) List!27300) Bool)

(assert (=> b!1239028 (= res!826589 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1239030 () Bool)

(declare-fun res!826585 () Bool)

(assert (=> b!1239030 (=> (not res!826585) (not e!702156))))

(assert (=> b!1239030 (= res!826585 (not (contains!7362 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239031 () Bool)

(declare-fun res!826586 () Bool)

(assert (=> b!1239031 (=> (not res!826586) (not e!702156))))

(assert (=> b!1239031 (= res!826586 (not (contains!7362 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239032 () Bool)

(declare-datatypes ((Unit!41158 0))(
  ( (Unit!41159) )
))
(declare-fun e!702154 () Unit!41158)

(declare-fun Unit!41160 () Unit!41158)

(assert (=> b!1239032 (= e!702154 Unit!41160)))

(declare-fun b!1239033 () Bool)

(declare-fun res!826590 () Bool)

(assert (=> b!1239033 (=> (not res!826590) (not e!702156))))

(assert (=> b!1239033 (= res!826590 (not (= from!3213 (bvsub (size!39063 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1239034 () Bool)

(assert (=> b!1239034 (= e!702156 false)))

(declare-fun lt!561565 () Unit!41158)

(assert (=> b!1239034 (= lt!561565 e!702154)))

(declare-fun c!121081 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1239034 (= c!121081 (validKeyInArray!0 (select (arr!38527 a!3835) from!3213)))))

(declare-fun b!1239035 () Bool)

(declare-fun res!826587 () Bool)

(assert (=> b!1239035 (=> (not res!826587) (not e!702156))))

(declare-fun noDuplicate!1959 (List!27300) Bool)

(assert (=> b!1239035 (= res!826587 (noDuplicate!1959 acc!846))))

(declare-fun res!826588 () Bool)

(assert (=> start!103216 (=> (not res!826588) (not e!702156))))

(assert (=> start!103216 (= res!826588 (and (bvslt (size!39063 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39063 a!3835))))))

(assert (=> start!103216 e!702156))

(declare-fun array_inv!29375 (array!79851) Bool)

(assert (=> start!103216 (array_inv!29375 a!3835)))

(assert (=> start!103216 true))

(declare-fun b!1239029 () Bool)

(declare-fun lt!561563 () Unit!41158)

(assert (=> b!1239029 (= e!702154 lt!561563)))

(declare-fun lt!561564 () List!27300)

(assert (=> b!1239029 (= lt!561564 (Cons!27296 (select (arr!38527 a!3835) from!3213) acc!846))))

(declare-fun lt!561562 () Unit!41158)

(declare-fun lemmaListSubSeqRefl!0 (List!27300) Unit!41158)

(assert (=> b!1239029 (= lt!561562 (lemmaListSubSeqRefl!0 lt!561564))))

(declare-fun subseq!616 (List!27300 List!27300) Bool)

(assert (=> b!1239029 (subseq!616 lt!561564 lt!561564)))

(declare-fun lt!561566 () Unit!41158)

(declare-fun subseqTail!103 (List!27300 List!27300) Unit!41158)

(assert (=> b!1239029 (= lt!561566 (subseqTail!103 lt!561564 lt!561564))))

(assert (=> b!1239029 (subseq!616 acc!846 lt!561564)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79851 List!27300 List!27300 (_ BitVec 32)) Unit!41158)

(assert (=> b!1239029 (= lt!561563 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561564 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1239029 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(assert (= (and start!103216 res!826588) b!1239035))

(assert (= (and b!1239035 res!826587) b!1239030))

(assert (= (and b!1239030 res!826585) b!1239031))

(assert (= (and b!1239031 res!826586) b!1239028))

(assert (= (and b!1239028 res!826589) b!1239027))

(assert (= (and b!1239027 res!826591) b!1239033))

(assert (= (and b!1239033 res!826590) b!1239034))

(assert (= (and b!1239034 c!121081) b!1239029))

(assert (= (and b!1239034 (not c!121081)) b!1239032))

(declare-fun m!1142547 () Bool)

(assert (=> start!103216 m!1142547))

(declare-fun m!1142549 () Bool)

(assert (=> b!1239034 m!1142549))

(assert (=> b!1239034 m!1142549))

(declare-fun m!1142551 () Bool)

(assert (=> b!1239034 m!1142551))

(declare-fun m!1142553 () Bool)

(assert (=> b!1239030 m!1142553))

(declare-fun m!1142555 () Bool)

(assert (=> b!1239028 m!1142555))

(declare-fun m!1142557 () Bool)

(assert (=> b!1239035 m!1142557))

(declare-fun m!1142559 () Bool)

(assert (=> b!1239031 m!1142559))

(declare-fun m!1142561 () Bool)

(assert (=> b!1239029 m!1142561))

(declare-fun m!1142563 () Bool)

(assert (=> b!1239029 m!1142563))

(declare-fun m!1142565 () Bool)

(assert (=> b!1239029 m!1142565))

(declare-fun m!1142567 () Bool)

(assert (=> b!1239029 m!1142567))

(declare-fun m!1142569 () Bool)

(assert (=> b!1239029 m!1142569))

(declare-fun m!1142571 () Bool)

(assert (=> b!1239029 m!1142571))

(assert (=> b!1239029 m!1142549))

(declare-fun m!1142573 () Bool)

(assert (=> b!1239027 m!1142573))

(push 1)

(assert (not start!103216))

(assert (not b!1239027))

(assert (not b!1239034))

