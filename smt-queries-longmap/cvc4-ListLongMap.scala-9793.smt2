; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116286 () Bool)

(assert start!116286)

(declare-fun b!1372837 () Bool)

(declare-fun e!777706 () Bool)

(assert (=> b!1372837 (= e!777706 false)))

(declare-datatypes ((array!93103 0))(
  ( (array!93104 (arr!44962 (Array (_ BitVec 32) (_ BitVec 64))) (size!45512 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93103)

(declare-fun lt!602953 () Bool)

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((List!32030 0))(
  ( (Nil!32027) (Cons!32026 (h!33235 (_ BitVec 64)) (t!46724 List!32030)) )
))
(declare-fun acc!866 () List!32030)

(declare-fun arrayNoDuplicates!0 (array!93103 (_ BitVec 32) List!32030) Bool)

(assert (=> b!1372837 (= lt!602953 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45361 0))(
  ( (Unit!45362) )
))
(declare-fun lt!602952 () Unit!45361)

(declare-fun newAcc!98 () List!32030)

(declare-fun noDuplicateSubseq!301 (List!32030 List!32030) Unit!45361)

(assert (=> b!1372837 (= lt!602952 (noDuplicateSubseq!301 newAcc!98 acc!866))))

(declare-fun b!1372838 () Bool)

(declare-fun res!916109 () Bool)

(assert (=> b!1372838 (=> (not res!916109) (not e!777706))))

(declare-fun contains!9712 (List!32030 (_ BitVec 64)) Bool)

(assert (=> b!1372838 (= res!916109 (not (contains!9712 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372839 () Bool)

(declare-fun res!916108 () Bool)

(assert (=> b!1372839 (=> (not res!916108) (not e!777706))))

(declare-fun subseq!1114 (List!32030 List!32030) Bool)

(assert (=> b!1372839 (= res!916108 (subseq!1114 newAcc!98 acc!866))))

(declare-fun b!1372840 () Bool)

(declare-fun res!916106 () Bool)

(assert (=> b!1372840 (=> (not res!916106) (not e!777706))))

(assert (=> b!1372840 (= res!916106 (not (contains!9712 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372841 () Bool)

(declare-fun res!916107 () Bool)

(assert (=> b!1372841 (=> (not res!916107) (not e!777706))))

(assert (=> b!1372841 (= res!916107 (not (contains!9712 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372842 () Bool)

(declare-fun res!916105 () Bool)

(assert (=> b!1372842 (=> (not res!916105) (not e!777706))))

(declare-fun noDuplicate!2569 (List!32030) Bool)

(assert (=> b!1372842 (= res!916105 (noDuplicate!2569 acc!866))))

(declare-fun res!916111 () Bool)

(assert (=> start!116286 (=> (not res!916111) (not e!777706))))

(assert (=> start!116286 (= res!916111 (and (bvslt (size!45512 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45512 a!3861))))))

(assert (=> start!116286 e!777706))

(declare-fun array_inv!33990 (array!93103) Bool)

(assert (=> start!116286 (array_inv!33990 a!3861)))

(assert (=> start!116286 true))

(declare-fun b!1372843 () Bool)

(declare-fun res!916110 () Bool)

(assert (=> b!1372843 (=> (not res!916110) (not e!777706))))

(assert (=> b!1372843 (= res!916110 (not (contains!9712 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!116286 res!916111) b!1372842))

(assert (= (and b!1372842 res!916105) b!1372838))

(assert (= (and b!1372838 res!916109) b!1372841))

(assert (= (and b!1372841 res!916107) b!1372840))

(assert (= (and b!1372840 res!916106) b!1372843))

(assert (= (and b!1372843 res!916110) b!1372839))

(assert (= (and b!1372839 res!916108) b!1372837))

(declare-fun m!1256215 () Bool)

(assert (=> b!1372840 m!1256215))

(declare-fun m!1256217 () Bool)

(assert (=> b!1372839 m!1256217))

(declare-fun m!1256219 () Bool)

(assert (=> b!1372837 m!1256219))

(declare-fun m!1256221 () Bool)

(assert (=> b!1372837 m!1256221))

(declare-fun m!1256223 () Bool)

(assert (=> b!1372841 m!1256223))

(declare-fun m!1256225 () Bool)

(assert (=> start!116286 m!1256225))

(declare-fun m!1256227 () Bool)

(assert (=> b!1372842 m!1256227))

(declare-fun m!1256229 () Bool)

(assert (=> b!1372843 m!1256229))

(declare-fun m!1256231 () Bool)

(assert (=> b!1372838 m!1256231))

(push 1)

(assert (not b!1372839))

(assert (not start!116286))

(assert (not b!1372840))

(assert (not b!1372842))

(assert (not b!1372843))

(assert (not b!1372837))

(assert (not b!1372841))

(assert (not b!1372838))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

