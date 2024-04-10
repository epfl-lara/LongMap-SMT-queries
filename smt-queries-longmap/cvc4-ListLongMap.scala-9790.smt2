; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116268 () Bool)

(assert start!116268)

(declare-fun b!1372645 () Bool)

(declare-fun res!915922 () Bool)

(declare-fun e!777651 () Bool)

(assert (=> b!1372645 (=> (not res!915922) (not e!777651))))

(declare-datatypes ((List!32021 0))(
  ( (Nil!32018) (Cons!32017 (h!33226 (_ BitVec 64)) (t!46715 List!32021)) )
))
(declare-fun acc!866 () List!32021)

(declare-fun noDuplicate!2560 (List!32021) Bool)

(assert (=> b!1372645 (= res!915922 (noDuplicate!2560 acc!866))))

(declare-fun b!1372646 () Bool)

(declare-fun res!915916 () Bool)

(assert (=> b!1372646 (=> (not res!915916) (not e!777651))))

(declare-fun newAcc!98 () List!32021)

(declare-fun contains!9703 (List!32021 (_ BitVec 64)) Bool)

(assert (=> b!1372646 (= res!915916 (not (contains!9703 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!915914 () Bool)

(assert (=> start!116268 (=> (not res!915914) (not e!777651))))

(declare-datatypes ((array!93085 0))(
  ( (array!93086 (arr!44953 (Array (_ BitVec 32) (_ BitVec 64))) (size!45503 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93085)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!116268 (= res!915914 (and (bvslt (size!45503 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45503 a!3861))))))

(assert (=> start!116268 e!777651))

(declare-fun array_inv!33981 (array!93085) Bool)

(assert (=> start!116268 (array_inv!33981 a!3861)))

(assert (=> start!116268 true))

(declare-fun b!1372647 () Bool)

(declare-fun res!915920 () Bool)

(assert (=> b!1372647 (=> (not res!915920) (not e!777651))))

(declare-fun subseq!1105 (List!32021 List!32021) Bool)

(assert (=> b!1372647 (= res!915920 (subseq!1105 newAcc!98 acc!866))))

(declare-fun b!1372648 () Bool)

(declare-fun res!915919 () Bool)

(assert (=> b!1372648 (=> (not res!915919) (not e!777651))))

(assert (=> b!1372648 (= res!915919 (not (contains!9703 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372649 () Bool)

(declare-fun res!915913 () Bool)

(assert (=> b!1372649 (=> (not res!915913) (not e!777651))))

(assert (=> b!1372649 (= res!915913 (not (contains!9703 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372650 () Bool)

(declare-fun res!915915 () Bool)

(assert (=> b!1372650 (=> (not res!915915) (not e!777651))))

(assert (=> b!1372650 (= res!915915 (not (contains!9703 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372651 () Bool)

(declare-fun e!777652 () Bool)

(assert (=> b!1372651 (= e!777651 e!777652)))

(declare-fun res!915921 () Bool)

(assert (=> b!1372651 (=> (not res!915921) (not e!777652))))

(declare-fun arrayNoDuplicates!0 (array!93085 (_ BitVec 32) List!32021) Bool)

(assert (=> b!1372651 (= res!915921 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45343 0))(
  ( (Unit!45344) )
))
(declare-fun lt!602899 () Unit!45343)

(declare-fun noDuplicateSubseq!292 (List!32021 List!32021) Unit!45343)

(assert (=> b!1372651 (= lt!602899 (noDuplicateSubseq!292 newAcc!98 acc!866))))

(declare-fun b!1372652 () Bool)

(declare-fun res!915917 () Bool)

(assert (=> b!1372652 (=> (not res!915917) (not e!777652))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1372652 (= res!915917 (not (validKeyInArray!0 (select (arr!44953 a!3861) from!3239))))))

(declare-fun b!1372653 () Bool)

(declare-fun res!915918 () Bool)

(assert (=> b!1372653 (=> (not res!915918) (not e!777652))))

(assert (=> b!1372653 (= res!915918 (bvslt from!3239 (size!45503 a!3861)))))

(declare-fun b!1372654 () Bool)

(assert (=> b!1372654 (= e!777652 (bvslt (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (= (and start!116268 res!915914) b!1372645))

(assert (= (and b!1372645 res!915922) b!1372650))

(assert (= (and b!1372650 res!915915) b!1372649))

(assert (= (and b!1372649 res!915913) b!1372648))

(assert (= (and b!1372648 res!915919) b!1372646))

(assert (= (and b!1372646 res!915916) b!1372647))

(assert (= (and b!1372647 res!915920) b!1372651))

(assert (= (and b!1372651 res!915921) b!1372653))

(assert (= (and b!1372653 res!915918) b!1372652))

(assert (= (and b!1372652 res!915917) b!1372654))

(declare-fun m!1256049 () Bool)

(assert (=> b!1372651 m!1256049))

(declare-fun m!1256051 () Bool)

(assert (=> b!1372651 m!1256051))

(declare-fun m!1256053 () Bool)

(assert (=> b!1372652 m!1256053))

(assert (=> b!1372652 m!1256053))

(declare-fun m!1256055 () Bool)

(assert (=> b!1372652 m!1256055))

(declare-fun m!1256057 () Bool)

(assert (=> b!1372646 m!1256057))

(declare-fun m!1256059 () Bool)

(assert (=> b!1372649 m!1256059))

(declare-fun m!1256061 () Bool)

(assert (=> start!116268 m!1256061))

(declare-fun m!1256063 () Bool)

(assert (=> b!1372645 m!1256063))

(declare-fun m!1256065 () Bool)

(assert (=> b!1372650 m!1256065))

(declare-fun m!1256067 () Bool)

(assert (=> b!1372648 m!1256067))

(declare-fun m!1256069 () Bool)

(assert (=> b!1372647 m!1256069))

(push 1)

(assert (not start!116268))

(assert (not b!1372647))

(assert (not b!1372651))

(assert (not b!1372649))

