; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114232 () Bool)

(assert start!114232)

(declare-fun res!901805 () Bool)

(declare-fun e!770239 () Bool)

(assert (=> start!114232 (=> (not res!901805) (not e!770239))))

(declare-datatypes ((array!92414 0))(
  ( (array!92415 (arr!44655 (Array (_ BitVec 32) (_ BitVec 64))) (size!45205 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92414)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114232 (= res!901805 (and (bvslt (size!45205 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45205 a!3742))))))

(assert (=> start!114232 e!770239))

(assert (=> start!114232 true))

(declare-fun array_inv!33683 (array!92414) Bool)

(assert (=> start!114232 (array_inv!33683 a!3742)))

(declare-fun b!1357048 () Bool)

(assert (=> b!1357048 (= e!770239 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!31696 0))(
  ( (Nil!31693) (Cons!31692 (h!32901 (_ BitVec 64)) (t!46354 List!31696)) )
))
(declare-fun acc!759 () List!31696)

(declare-fun subseq!807 (List!31696 List!31696) Bool)

(assert (=> b!1357048 (subseq!807 acc!759 acc!759)))

(declare-datatypes ((Unit!44645 0))(
  ( (Unit!44646) )
))
(declare-fun lt!599113 () Unit!44645)

(declare-fun lemmaListSubSeqRefl!0 (List!31696) Unit!44645)

(assert (=> b!1357048 (= lt!599113 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1357049 () Bool)

(declare-fun res!901808 () Bool)

(assert (=> b!1357049 (=> (not res!901808) (not e!770239))))

(declare-fun contains!9405 (List!31696 (_ BitVec 64)) Bool)

(assert (=> b!1357049 (= res!901808 (not (contains!9405 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357050 () Bool)

(declare-fun res!901804 () Bool)

(assert (=> b!1357050 (=> (not res!901804) (not e!770239))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1357050 (= res!901804 (validKeyInArray!0 (select (arr!44655 a!3742) from!3120)))))

(declare-fun b!1357051 () Bool)

(declare-fun res!901813 () Bool)

(assert (=> b!1357051 (=> (not res!901813) (not e!770239))))

(assert (=> b!1357051 (= res!901813 (not (contains!9405 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357052 () Bool)

(declare-fun res!901806 () Bool)

(assert (=> b!1357052 (=> (not res!901806) (not e!770239))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1357052 (= res!901806 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1357053 () Bool)

(declare-fun res!901812 () Bool)

(assert (=> b!1357053 (=> (not res!901812) (not e!770239))))

(declare-fun arrayNoDuplicates!0 (array!92414 (_ BitVec 32) List!31696) Bool)

(assert (=> b!1357053 (= res!901812 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31693))))

(declare-fun b!1357054 () Bool)

(declare-fun res!901811 () Bool)

(assert (=> b!1357054 (=> (not res!901811) (not e!770239))))

(assert (=> b!1357054 (= res!901811 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45205 a!3742)))))

(declare-fun b!1357055 () Bool)

(declare-fun res!901807 () Bool)

(assert (=> b!1357055 (=> (not res!901807) (not e!770239))))

(assert (=> b!1357055 (= res!901807 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1357056 () Bool)

(declare-fun res!901810 () Bool)

(assert (=> b!1357056 (=> (not res!901810) (not e!770239))))

(declare-fun noDuplicate!2262 (List!31696) Bool)

(assert (=> b!1357056 (= res!901810 (noDuplicate!2262 acc!759))))

(declare-fun b!1357057 () Bool)

(declare-fun res!901809 () Bool)

(assert (=> b!1357057 (=> (not res!901809) (not e!770239))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1357057 (= res!901809 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45205 a!3742))))))

(assert (= (and start!114232 res!901805) b!1357056))

(assert (= (and b!1357056 res!901810) b!1357049))

(assert (= (and b!1357049 res!901808) b!1357051))

(assert (= (and b!1357051 res!901813) b!1357053))

(assert (= (and b!1357053 res!901812) b!1357055))

(assert (= (and b!1357055 res!901807) b!1357057))

(assert (= (and b!1357057 res!901809) b!1357052))

(assert (= (and b!1357052 res!901806) b!1357054))

(assert (= (and b!1357054 res!901811) b!1357050))

(assert (= (and b!1357050 res!901804) b!1357048))

(declare-fun m!1242887 () Bool)

(assert (=> b!1357056 m!1242887))

(declare-fun m!1242889 () Bool)

(assert (=> b!1357048 m!1242889))

(declare-fun m!1242891 () Bool)

(assert (=> b!1357048 m!1242891))

(declare-fun m!1242893 () Bool)

(assert (=> b!1357055 m!1242893))

(declare-fun m!1242895 () Bool)

(assert (=> b!1357051 m!1242895))

(declare-fun m!1242897 () Bool)

(assert (=> b!1357052 m!1242897))

(declare-fun m!1242899 () Bool)

(assert (=> b!1357053 m!1242899))

(declare-fun m!1242901 () Bool)

(assert (=> b!1357049 m!1242901))

(declare-fun m!1242903 () Bool)

(assert (=> start!114232 m!1242903))

(declare-fun m!1242905 () Bool)

(assert (=> b!1357050 m!1242905))

(assert (=> b!1357050 m!1242905))

(declare-fun m!1242907 () Bool)

(assert (=> b!1357050 m!1242907))

(check-sat (not start!114232) (not b!1357050) (not b!1357052) (not b!1357049) (not b!1357048) (not b!1357055) (not b!1357051) (not b!1357053) (not b!1357056))
(check-sat)
