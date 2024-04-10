; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114240 () Bool)

(assert start!114240)

(declare-fun b!1357168 () Bool)

(declare-fun res!901931 () Bool)

(declare-fun e!770262 () Bool)

(assert (=> b!1357168 (=> (not res!901931) (not e!770262))))

(declare-datatypes ((array!92422 0))(
  ( (array!92423 (arr!44659 (Array (_ BitVec 32) (_ BitVec 64))) (size!45209 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92422)

(declare-datatypes ((List!31700 0))(
  ( (Nil!31697) (Cons!31696 (h!32905 (_ BitVec 64)) (t!46358 List!31700)) )
))
(declare-fun arrayNoDuplicates!0 (array!92422 (_ BitVec 32) List!31700) Bool)

(assert (=> b!1357168 (= res!901931 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31697))))

(declare-fun b!1357169 () Bool)

(declare-fun res!901924 () Bool)

(assert (=> b!1357169 (=> (not res!901924) (not e!770262))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1357169 (= res!901924 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45209 a!3742)))))

(declare-fun b!1357170 () Bool)

(declare-fun res!901930 () Bool)

(assert (=> b!1357170 (=> (not res!901930) (not e!770262))))

(declare-fun acc!759 () List!31700)

(declare-fun contains!9409 (List!31700 (_ BitVec 64)) Bool)

(assert (=> b!1357170 (= res!901930 (not (contains!9409 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357171 () Bool)

(declare-fun res!901933 () Bool)

(assert (=> b!1357171 (=> (not res!901933) (not e!770262))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1357171 (= res!901933 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1357172 () Bool)

(declare-fun res!901926 () Bool)

(assert (=> b!1357172 (=> (not res!901926) (not e!770262))))

(assert (=> b!1357172 (= res!901926 (validKeyInArray!0 (select (arr!44659 a!3742) from!3120)))))

(declare-fun b!1357173 () Bool)

(declare-fun res!901932 () Bool)

(assert (=> b!1357173 (=> (not res!901932) (not e!770262))))

(assert (=> b!1357173 (= res!901932 (not (contains!9409 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357174 () Bool)

(declare-fun res!901929 () Bool)

(assert (=> b!1357174 (=> (not res!901929) (not e!770262))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1357174 (= res!901929 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45209 a!3742))))))

(declare-fun b!1357175 () Bool)

(declare-fun res!901925 () Bool)

(assert (=> b!1357175 (=> (not res!901925) (not e!770262))))

(declare-fun noDuplicate!2266 (List!31700) Bool)

(assert (=> b!1357175 (= res!901925 (noDuplicate!2266 acc!759))))

(declare-fun b!1357176 () Bool)

(declare-fun res!901928 () Bool)

(assert (=> b!1357176 (=> (not res!901928) (not e!770262))))

(assert (=> b!1357176 (= res!901928 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1357177 () Bool)

(assert (=> b!1357177 (= e!770262 (not true))))

(declare-fun subseq!811 (List!31700 List!31700) Bool)

(assert (=> b!1357177 (subseq!811 acc!759 acc!759)))

(declare-datatypes ((Unit!44653 0))(
  ( (Unit!44654) )
))
(declare-fun lt!599125 () Unit!44653)

(declare-fun lemmaListSubSeqRefl!0 (List!31700) Unit!44653)

(assert (=> b!1357177 (= lt!599125 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun res!901927 () Bool)

(assert (=> start!114240 (=> (not res!901927) (not e!770262))))

(assert (=> start!114240 (= res!901927 (and (bvslt (size!45209 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45209 a!3742))))))

(assert (=> start!114240 e!770262))

(assert (=> start!114240 true))

(declare-fun array_inv!33687 (array!92422) Bool)

(assert (=> start!114240 (array_inv!33687 a!3742)))

(assert (= (and start!114240 res!901927) b!1357175))

(assert (= (and b!1357175 res!901925) b!1357170))

(assert (= (and b!1357170 res!901930) b!1357173))

(assert (= (and b!1357173 res!901932) b!1357168))

(assert (= (and b!1357168 res!901931) b!1357176))

(assert (= (and b!1357176 res!901928) b!1357174))

(assert (= (and b!1357174 res!901929) b!1357171))

(assert (= (and b!1357171 res!901933) b!1357169))

(assert (= (and b!1357169 res!901924) b!1357172))

(assert (= (and b!1357172 res!901926) b!1357177))

(declare-fun m!1242975 () Bool)

(assert (=> b!1357168 m!1242975))

(declare-fun m!1242977 () Bool)

(assert (=> b!1357177 m!1242977))

(declare-fun m!1242979 () Bool)

(assert (=> b!1357177 m!1242979))

(declare-fun m!1242981 () Bool)

(assert (=> b!1357171 m!1242981))

(declare-fun m!1242983 () Bool)

(assert (=> b!1357173 m!1242983))

(declare-fun m!1242985 () Bool)

(assert (=> b!1357172 m!1242985))

(assert (=> b!1357172 m!1242985))

(declare-fun m!1242987 () Bool)

(assert (=> b!1357172 m!1242987))

(declare-fun m!1242989 () Bool)

(assert (=> b!1357170 m!1242989))

(declare-fun m!1242991 () Bool)

(assert (=> b!1357176 m!1242991))

(declare-fun m!1242993 () Bool)

(assert (=> b!1357175 m!1242993))

(declare-fun m!1242995 () Bool)

(assert (=> start!114240 m!1242995))

(push 1)

(assert (not b!1357168))

(assert (not b!1357175))

(assert (not b!1357170))

(assert (not b!1357172))

(assert (not start!114240))

(assert (not b!1357171))

(assert (not b!1357173))

(assert (not b!1357176))

(assert (not b!1357177))

(check-sat)

(pop 1)

(push 1)

(check-sat)

