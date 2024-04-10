; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115152 () Bool)

(assert start!115152)

(declare-fun b!1364205 () Bool)

(declare-fun e!773617 () Bool)

(assert (=> b!1364205 (= e!773617 false)))

(declare-datatypes ((List!31832 0))(
  ( (Nil!31829) (Cons!31828 (h!33037 (_ BitVec 64)) (t!46526 List!31832)) )
))
(declare-fun acc!759 () List!31832)

(declare-fun lt!601024 () Bool)

(declare-datatypes ((array!92722 0))(
  ( (array!92723 (arr!44791 (Array (_ BitVec 32) (_ BitVec 64))) (size!45341 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92722)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92722 (_ BitVec 32) List!31832) Bool)

(assert (=> b!1364205 (= lt!601024 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1364206 () Bool)

(declare-fun res!907889 () Bool)

(assert (=> b!1364206 (=> (not res!907889) (not e!773617))))

(declare-fun contains!9541 (List!31832 (_ BitVec 64)) Bool)

(assert (=> b!1364206 (= res!907889 (not (contains!9541 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364207 () Bool)

(declare-fun res!907887 () Bool)

(assert (=> b!1364207 (=> (not res!907887) (not e!773617))))

(assert (=> b!1364207 (= res!907887 (not (contains!9541 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364208 () Bool)

(declare-fun res!907890 () Bool)

(assert (=> b!1364208 (=> (not res!907890) (not e!773617))))

(declare-fun noDuplicate!2398 (List!31832) Bool)

(assert (=> b!1364208 (= res!907890 (noDuplicate!2398 acc!759))))

(declare-fun b!1364209 () Bool)

(declare-fun res!907891 () Bool)

(assert (=> b!1364209 (=> (not res!907891) (not e!773617))))

(assert (=> b!1364209 (= res!907891 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31829))))

(declare-fun res!907888 () Bool)

(assert (=> start!115152 (=> (not res!907888) (not e!773617))))

(assert (=> start!115152 (= res!907888 (and (bvslt (size!45341 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45341 a!3742))))))

(assert (=> start!115152 e!773617))

(declare-fun array_inv!33819 (array!92722) Bool)

(assert (=> start!115152 (array_inv!33819 a!3742)))

(assert (=> start!115152 true))

(assert (= (and start!115152 res!907888) b!1364208))

(assert (= (and b!1364208 res!907890) b!1364207))

(assert (= (and b!1364207 res!907887) b!1364206))

(assert (= (and b!1364206 res!907889) b!1364209))

(assert (= (and b!1364209 res!907891) b!1364205))

(declare-fun m!1248913 () Bool)

(assert (=> b!1364207 m!1248913))

(declare-fun m!1248915 () Bool)

(assert (=> b!1364205 m!1248915))

(declare-fun m!1248917 () Bool)

(assert (=> start!115152 m!1248917))

(declare-fun m!1248919 () Bool)

(assert (=> b!1364206 m!1248919))

(declare-fun m!1248921 () Bool)

(assert (=> b!1364208 m!1248921))

(declare-fun m!1248923 () Bool)

(assert (=> b!1364209 m!1248923))

(push 1)

(assert (not b!1364207))

(assert (not b!1364208))

(assert (not b!1364205))

(assert (not b!1364209))

(assert (not b!1364206))

(assert (not start!115152))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

