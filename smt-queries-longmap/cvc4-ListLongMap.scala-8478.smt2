; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103282 () Bool)

(assert start!103282)

(declare-fun b!1239425 () Bool)

(declare-fun res!826876 () Bool)

(declare-fun e!702405 () Bool)

(assert (=> b!1239425 (=> (not res!826876) (not e!702405))))

(declare-datatypes ((array!79866 0))(
  ( (array!79867 (arr!38533 (Array (_ BitVec 32) (_ BitVec 64))) (size!39069 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79866)

(declare-datatypes ((List!27306 0))(
  ( (Nil!27303) (Cons!27302 (h!28511 (_ BitVec 64)) (t!40769 List!27306)) )
))
(declare-fun acc!846 () List!27306)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79866 (_ BitVec 32) List!27306) Bool)

(assert (=> b!1239425 (= res!826876 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1239426 () Bool)

(declare-fun e!702408 () Bool)

(assert (=> b!1239426 (= e!702405 e!702408)))

(declare-fun res!826871 () Bool)

(assert (=> b!1239426 (=> (not res!826871) (not e!702408))))

(assert (=> b!1239426 (= res!826871 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!39069 a!3835))))))

(declare-datatypes ((Unit!41180 0))(
  ( (Unit!41181) )
))
(declare-fun lt!561703 () Unit!41180)

(declare-fun e!702407 () Unit!41180)

(assert (=> b!1239426 (= lt!561703 e!702407)))

(declare-fun c!121138 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1239426 (= c!121138 (validKeyInArray!0 (select (arr!38533 a!3835) from!3213)))))

(declare-fun b!1239428 () Bool)

(declare-fun Unit!41182 () Unit!41180)

(assert (=> b!1239428 (= e!702407 Unit!41182)))

(declare-fun b!1239429 () Bool)

(declare-fun res!826873 () Bool)

(assert (=> b!1239429 (=> (not res!826873) (not e!702405))))

(declare-fun contains!7368 (List!27306 (_ BitVec 64)) Bool)

(assert (=> b!1239429 (= res!826873 (not (contains!7368 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239430 () Bool)

(declare-fun res!826875 () Bool)

(assert (=> b!1239430 (=> (not res!826875) (not e!702405))))

(assert (=> b!1239430 (= res!826875 (not (= from!3213 (bvsub (size!39069 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1239431 () Bool)

(declare-fun res!826872 () Bool)

(assert (=> b!1239431 (=> (not res!826872) (not e!702405))))

(declare-fun noDuplicate!1965 (List!27306) Bool)

(assert (=> b!1239431 (= res!826872 (noDuplicate!1965 acc!846))))

(declare-fun b!1239432 () Bool)

(assert (=> b!1239432 (= e!702408 false)))

(declare-fun lt!561705 () Bool)

(assert (=> b!1239432 (= lt!561705 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1239433 () Bool)

(declare-fun res!826870 () Bool)

(assert (=> b!1239433 (=> (not res!826870) (not e!702405))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1239433 (= res!826870 (contains!7368 acc!846 k!2925))))

(declare-fun b!1239434 () Bool)

(declare-fun res!826869 () Bool)

(assert (=> b!1239434 (=> (not res!826869) (not e!702405))))

(assert (=> b!1239434 (= res!826869 (not (contains!7368 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239427 () Bool)

(declare-fun lt!561704 () Unit!41180)

(assert (=> b!1239427 (= e!702407 lt!561704)))

(declare-fun lt!561707 () List!27306)

(assert (=> b!1239427 (= lt!561707 (Cons!27302 (select (arr!38533 a!3835) from!3213) acc!846))))

(declare-fun lt!561702 () Unit!41180)

(declare-fun lemmaListSubSeqRefl!0 (List!27306) Unit!41180)

(assert (=> b!1239427 (= lt!561702 (lemmaListSubSeqRefl!0 lt!561707))))

(declare-fun subseq!622 (List!27306 List!27306) Bool)

(assert (=> b!1239427 (subseq!622 lt!561707 lt!561707)))

(declare-fun lt!561706 () Unit!41180)

(declare-fun subseqTail!109 (List!27306 List!27306) Unit!41180)

(assert (=> b!1239427 (= lt!561706 (subseqTail!109 lt!561707 lt!561707))))

(assert (=> b!1239427 (subseq!622 acc!846 lt!561707)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79866 List!27306 List!27306 (_ BitVec 32)) Unit!41180)

(assert (=> b!1239427 (= lt!561704 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561707 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1239427 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun res!826874 () Bool)

(assert (=> start!103282 (=> (not res!826874) (not e!702405))))

(assert (=> start!103282 (= res!826874 (and (bvslt (size!39069 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39069 a!3835))))))

(assert (=> start!103282 e!702405))

(declare-fun array_inv!29381 (array!79866) Bool)

(assert (=> start!103282 (array_inv!29381 a!3835)))

(assert (=> start!103282 true))

(assert (= (and start!103282 res!826874) b!1239431))

(assert (= (and b!1239431 res!826872) b!1239434))

(assert (= (and b!1239434 res!826869) b!1239429))

(assert (= (and b!1239429 res!826873) b!1239425))

(assert (= (and b!1239425 res!826876) b!1239433))

(assert (= (and b!1239433 res!826870) b!1239430))

(assert (= (and b!1239430 res!826875) b!1239426))

(assert (= (and b!1239426 c!121138) b!1239427))

(assert (= (and b!1239426 (not c!121138)) b!1239428))

(assert (= (and b!1239426 res!826871) b!1239432))

(declare-fun m!1142871 () Bool)

(assert (=> b!1239431 m!1142871))

(declare-fun m!1142873 () Bool)

(assert (=> start!103282 m!1142873))

(declare-fun m!1142875 () Bool)

(assert (=> b!1239433 m!1142875))

(declare-fun m!1142877 () Bool)

(assert (=> b!1239432 m!1142877))

(declare-fun m!1142879 () Bool)

(assert (=> b!1239434 m!1142879))

(declare-fun m!1142881 () Bool)

(assert (=> b!1239425 m!1142881))

(declare-fun m!1142883 () Bool)

(assert (=> b!1239427 m!1142883))

(declare-fun m!1142885 () Bool)

(assert (=> b!1239427 m!1142885))

(declare-fun m!1142887 () Bool)

(assert (=> b!1239427 m!1142887))

(assert (=> b!1239427 m!1142877))

(declare-fun m!1142889 () Bool)

(assert (=> b!1239427 m!1142889))

(declare-fun m!1142891 () Bool)

(assert (=> b!1239427 m!1142891))

(declare-fun m!1142893 () Bool)

(assert (=> b!1239427 m!1142893))

(assert (=> b!1239426 m!1142889))

(assert (=> b!1239426 m!1142889))

(declare-fun m!1142895 () Bool)

(assert (=> b!1239426 m!1142895))

(declare-fun m!1142897 () Bool)

(assert (=> b!1239429 m!1142897))

(push 1)

(assert (not start!103282))

(assert (not b!1239427))

(assert (not b!1239432))

