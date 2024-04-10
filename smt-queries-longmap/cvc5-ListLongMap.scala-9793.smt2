; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116282 () Bool)

(assert start!116282)

(declare-fun b!1372795 () Bool)

(declare-fun res!916067 () Bool)

(declare-fun e!777693 () Bool)

(assert (=> b!1372795 (=> (not res!916067) (not e!777693))))

(declare-datatypes ((List!32028 0))(
  ( (Nil!32025) (Cons!32024 (h!33233 (_ BitVec 64)) (t!46722 List!32028)) )
))
(declare-fun newAcc!98 () List!32028)

(declare-fun contains!9710 (List!32028 (_ BitVec 64)) Bool)

(assert (=> b!1372795 (= res!916067 (not (contains!9710 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372797 () Bool)

(declare-fun res!916069 () Bool)

(assert (=> b!1372797 (=> (not res!916069) (not e!777693))))

(assert (=> b!1372797 (= res!916069 (not (contains!9710 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372798 () Bool)

(assert (=> b!1372798 (= e!777693 false)))

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun acc!866 () List!32028)

(declare-datatypes ((array!93099 0))(
  ( (array!93100 (arr!44960 (Array (_ BitVec 32) (_ BitVec 64))) (size!45510 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93099)

(declare-fun lt!602940 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93099 (_ BitVec 32) List!32028) Bool)

(assert (=> b!1372798 (= lt!602940 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45357 0))(
  ( (Unit!45358) )
))
(declare-fun lt!602941 () Unit!45357)

(declare-fun noDuplicateSubseq!299 (List!32028 List!32028) Unit!45357)

(assert (=> b!1372798 (= lt!602941 (noDuplicateSubseq!299 newAcc!98 acc!866))))

(declare-fun b!1372799 () Bool)

(declare-fun res!916064 () Bool)

(assert (=> b!1372799 (=> (not res!916064) (not e!777693))))

(declare-fun noDuplicate!2567 (List!32028) Bool)

(assert (=> b!1372799 (= res!916064 (noDuplicate!2567 acc!866))))

(declare-fun b!1372800 () Bool)

(declare-fun res!916068 () Bool)

(assert (=> b!1372800 (=> (not res!916068) (not e!777693))))

(declare-fun subseq!1112 (List!32028 List!32028) Bool)

(assert (=> b!1372800 (= res!916068 (subseq!1112 newAcc!98 acc!866))))

(declare-fun b!1372801 () Bool)

(declare-fun res!916066 () Bool)

(assert (=> b!1372801 (=> (not res!916066) (not e!777693))))

(assert (=> b!1372801 (= res!916066 (not (contains!9710 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372796 () Bool)

(declare-fun res!916063 () Bool)

(assert (=> b!1372796 (=> (not res!916063) (not e!777693))))

(assert (=> b!1372796 (= res!916063 (not (contains!9710 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!916065 () Bool)

(assert (=> start!116282 (=> (not res!916065) (not e!777693))))

(assert (=> start!116282 (= res!916065 (and (bvslt (size!45510 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45510 a!3861))))))

(assert (=> start!116282 e!777693))

(declare-fun array_inv!33988 (array!93099) Bool)

(assert (=> start!116282 (array_inv!33988 a!3861)))

(assert (=> start!116282 true))

(assert (= (and start!116282 res!916065) b!1372799))

(assert (= (and b!1372799 res!916064) b!1372801))

(assert (= (and b!1372801 res!916066) b!1372796))

(assert (= (and b!1372796 res!916063) b!1372797))

(assert (= (and b!1372797 res!916069) b!1372795))

(assert (= (and b!1372795 res!916067) b!1372800))

(assert (= (and b!1372800 res!916068) b!1372798))

(declare-fun m!1256179 () Bool)

(assert (=> b!1372801 m!1256179))

(declare-fun m!1256181 () Bool)

(assert (=> b!1372796 m!1256181))

(declare-fun m!1256183 () Bool)

(assert (=> b!1372800 m!1256183))

(declare-fun m!1256185 () Bool)

(assert (=> b!1372798 m!1256185))

(declare-fun m!1256187 () Bool)

(assert (=> b!1372798 m!1256187))

(declare-fun m!1256189 () Bool)

(assert (=> b!1372799 m!1256189))

(declare-fun m!1256191 () Bool)

(assert (=> start!116282 m!1256191))

(declare-fun m!1256193 () Bool)

(assert (=> b!1372795 m!1256193))

(declare-fun m!1256195 () Bool)

(assert (=> b!1372797 m!1256195))

(push 1)

(assert (not b!1372798))

(assert (not b!1372795))

(assert (not b!1372797))

(assert (not b!1372801))

(assert (not start!116282))

(assert (not b!1372796))

(assert (not b!1372799))

(assert (not b!1372800))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

