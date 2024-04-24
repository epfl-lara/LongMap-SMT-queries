; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114416 () Bool)

(assert start!114416)

(declare-fun b!1357905 () Bool)

(declare-fun e!770961 () Bool)

(assert (=> b!1357905 (= e!770961 false)))

(declare-datatypes ((List!31716 0))(
  ( (Nil!31713) (Cons!31712 (h!32930 (_ BitVec 64)) (t!46366 List!31716)) )
))
(declare-fun acc!759 () List!31716)

(declare-fun lt!599538 () Bool)

(declare-datatypes ((array!92489 0))(
  ( (array!92490 (arr!44688 (Array (_ BitVec 32) (_ BitVec 64))) (size!45239 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92489)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92489 (_ BitVec 32) List!31716) Bool)

(assert (=> b!1357905 (= lt!599538 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1357906 () Bool)

(declare-fun res!901881 () Bool)

(assert (=> b!1357906 (=> (not res!901881) (not e!770961))))

(declare-fun noDuplicate!2259 (List!31716) Bool)

(assert (=> b!1357906 (= res!901881 (noDuplicate!2259 acc!759))))

(declare-fun res!901882 () Bool)

(assert (=> start!114416 (=> (not res!901882) (not e!770961))))

(assert (=> start!114416 (= res!901882 (and (bvslt (size!45239 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45239 a!3742))))))

(assert (=> start!114416 e!770961))

(declare-fun array_inv!33969 (array!92489) Bool)

(assert (=> start!114416 (array_inv!33969 a!3742)))

(assert (=> start!114416 true))

(declare-fun b!1357907 () Bool)

(declare-fun res!901883 () Bool)

(assert (=> b!1357907 (=> (not res!901883) (not e!770961))))

(declare-fun contains!9428 (List!31716 (_ BitVec 64)) Bool)

(assert (=> b!1357907 (= res!901883 (not (contains!9428 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357908 () Bool)

(declare-fun res!901880 () Bool)

(assert (=> b!1357908 (=> (not res!901880) (not e!770961))))

(assert (=> b!1357908 (= res!901880 (not (contains!9428 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357909 () Bool)

(declare-fun res!901884 () Bool)

(assert (=> b!1357909 (=> (not res!901884) (not e!770961))))

(assert (=> b!1357909 (= res!901884 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31713))))

(assert (= (and start!114416 res!901882) b!1357906))

(assert (= (and b!1357906 res!901881) b!1357907))

(assert (= (and b!1357907 res!901883) b!1357908))

(assert (= (and b!1357908 res!901880) b!1357909))

(assert (= (and b!1357909 res!901884) b!1357905))

(declare-fun m!1244167 () Bool)

(assert (=> b!1357909 m!1244167))

(declare-fun m!1244169 () Bool)

(assert (=> b!1357907 m!1244169))

(declare-fun m!1244171 () Bool)

(assert (=> start!114416 m!1244171))

(declare-fun m!1244173 () Bool)

(assert (=> b!1357905 m!1244173))

(declare-fun m!1244175 () Bool)

(assert (=> b!1357908 m!1244175))

(declare-fun m!1244177 () Bool)

(assert (=> b!1357906 m!1244177))

(push 1)

(assert (not start!114416))

(assert (not b!1357908))

(assert (not b!1357906))

(assert (not b!1357909))

(assert (not b!1357905))

(assert (not b!1357907))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

