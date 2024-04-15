; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113852 () Bool)

(assert start!113852)

(declare-fun b!1350294 () Bool)

(declare-fun e!768162 () Bool)

(declare-fun e!768163 () Bool)

(assert (=> b!1350294 (= e!768162 e!768163)))

(declare-fun res!895796 () Bool)

(assert (=> b!1350294 (=> res!895796 e!768163)))

(declare-datatypes ((List!31568 0))(
  ( (Nil!31565) (Cons!31564 (h!32773 (_ BitVec 64)) (t!46218 List!31568)) )
))
(declare-fun contains!9188 (List!31568 (_ BitVec 64)) Bool)

(assert (=> b!1350294 (= res!895796 (contains!9188 Nil!31565 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350295 () Bool)

(declare-fun res!895795 () Bool)

(assert (=> b!1350295 (=> (not res!895795) (not e!768162))))

(declare-fun acc!759 () List!31568)

(assert (=> b!1350295 (= res!895795 (not (contains!9188 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!895797 () Bool)

(assert (=> start!113852 (=> (not res!895797) (not e!768162))))

(declare-datatypes ((array!91998 0))(
  ( (array!91999 (arr!44449 (Array (_ BitVec 32) (_ BitVec 64))) (size!45001 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!91998)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113852 (= res!895797 (and (bvslt (size!45001 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45001 a!3742))))))

(assert (=> start!113852 e!768162))

(declare-fun array_inv!33682 (array!91998) Bool)

(assert (=> start!113852 (array_inv!33682 a!3742)))

(assert (=> start!113852 true))

(declare-fun b!1350296 () Bool)

(declare-fun res!895793 () Bool)

(assert (=> b!1350296 (=> (not res!895793) (not e!768162))))

(assert (=> b!1350296 (= res!895793 (not (contains!9188 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350297 () Bool)

(assert (=> b!1350297 (= e!768163 (contains!9188 Nil!31565 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350298 () Bool)

(declare-fun res!895794 () Bool)

(assert (=> b!1350298 (=> (not res!895794) (not e!768162))))

(declare-fun noDuplicate!2103 (List!31568) Bool)

(assert (=> b!1350298 (= res!895794 (noDuplicate!2103 Nil!31565))))

(declare-fun b!1350299 () Bool)

(declare-fun res!895799 () Bool)

(assert (=> b!1350299 (=> (not res!895799) (not e!768162))))

(assert (=> b!1350299 (= res!895799 (noDuplicate!2103 acc!759))))

(declare-fun b!1350300 () Bool)

(declare-fun res!895798 () Bool)

(assert (=> b!1350300 (=> (not res!895798) (not e!768162))))

(assert (=> b!1350300 (= res!895798 (bvsle #b00000000000000000000000000000000 (size!45001 a!3742)))))

(assert (= (and start!113852 res!895797) b!1350299))

(assert (= (and b!1350299 res!895799) b!1350296))

(assert (= (and b!1350296 res!895793) b!1350295))

(assert (= (and b!1350295 res!895795) b!1350300))

(assert (= (and b!1350300 res!895798) b!1350298))

(assert (= (and b!1350298 res!895794) b!1350294))

(assert (= (and b!1350294 (not res!895796)) b!1350297))

(declare-fun m!1237075 () Bool)

(assert (=> b!1350294 m!1237075))

(declare-fun m!1237077 () Bool)

(assert (=> b!1350297 m!1237077))

(declare-fun m!1237079 () Bool)

(assert (=> b!1350295 m!1237079))

(declare-fun m!1237081 () Bool)

(assert (=> b!1350298 m!1237081))

(declare-fun m!1237083 () Bool)

(assert (=> start!113852 m!1237083))

(declare-fun m!1237085 () Bool)

(assert (=> b!1350299 m!1237085))

(declare-fun m!1237087 () Bool)

(assert (=> b!1350296 m!1237087))

(check-sat (not b!1350299) (not b!1350294) (not b!1350295) (not b!1350296) (not start!113852) (not b!1350298) (not b!1350297))
(check-sat)
(get-model)

(declare-fun d!144805 () Bool)

(declare-fun lt!596782 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!669 (List!31568) (InoxSet (_ BitVec 64)))

(assert (=> d!144805 (= lt!596782 (select (content!669 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!768187 () Bool)

(assert (=> d!144805 (= lt!596782 e!768187)))

(declare-fun res!895847 () Bool)

(assert (=> d!144805 (=> (not res!895847) (not e!768187))))

(get-info :version)

(assert (=> d!144805 (= res!895847 ((_ is Cons!31564) acc!759))))

(assert (=> d!144805 (= (contains!9188 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!596782)))

(declare-fun b!1350347 () Bool)

(declare-fun e!768186 () Bool)

(assert (=> b!1350347 (= e!768187 e!768186)))

(declare-fun res!895846 () Bool)

(assert (=> b!1350347 (=> res!895846 e!768186)))

(assert (=> b!1350347 (= res!895846 (= (h!32773 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350348 () Bool)

(assert (=> b!1350348 (= e!768186 (contains!9188 (t!46218 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!144805 res!895847) b!1350347))

(assert (= (and b!1350347 (not res!895846)) b!1350348))

(declare-fun m!1237117 () Bool)

(assert (=> d!144805 m!1237117))

(declare-fun m!1237119 () Bool)

(assert (=> d!144805 m!1237119))

(declare-fun m!1237121 () Bool)

(assert (=> b!1350348 m!1237121))

(assert (=> b!1350296 d!144805))

(declare-fun d!144807 () Bool)

(assert (=> d!144807 (= (array_inv!33682 a!3742) (bvsge (size!45001 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!113852 d!144807))

(declare-fun d!144809 () Bool)

(declare-fun lt!596783 () Bool)

(assert (=> d!144809 (= lt!596783 (select (content!669 Nil!31565) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!768189 () Bool)

(assert (=> d!144809 (= lt!596783 e!768189)))

(declare-fun res!895849 () Bool)

(assert (=> d!144809 (=> (not res!895849) (not e!768189))))

(assert (=> d!144809 (= res!895849 ((_ is Cons!31564) Nil!31565))))

(assert (=> d!144809 (= (contains!9188 Nil!31565 #b1000000000000000000000000000000000000000000000000000000000000000) lt!596783)))

(declare-fun b!1350349 () Bool)

(declare-fun e!768188 () Bool)

(assert (=> b!1350349 (= e!768189 e!768188)))

(declare-fun res!895848 () Bool)

(assert (=> b!1350349 (=> res!895848 e!768188)))

(assert (=> b!1350349 (= res!895848 (= (h!32773 Nil!31565) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350350 () Bool)

(assert (=> b!1350350 (= e!768188 (contains!9188 (t!46218 Nil!31565) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!144809 res!895849) b!1350349))

(assert (= (and b!1350349 (not res!895848)) b!1350350))

(declare-fun m!1237123 () Bool)

(assert (=> d!144809 m!1237123))

(declare-fun m!1237125 () Bool)

(assert (=> d!144809 m!1237125))

(declare-fun m!1237127 () Bool)

(assert (=> b!1350350 m!1237127))

(assert (=> b!1350297 d!144809))

(declare-fun d!144811 () Bool)

(declare-fun res!895854 () Bool)

(declare-fun e!768194 () Bool)

(assert (=> d!144811 (=> res!895854 e!768194)))

(assert (=> d!144811 (= res!895854 ((_ is Nil!31565) Nil!31565))))

(assert (=> d!144811 (= (noDuplicate!2103 Nil!31565) e!768194)))

(declare-fun b!1350355 () Bool)

(declare-fun e!768195 () Bool)

(assert (=> b!1350355 (= e!768194 e!768195)))

(declare-fun res!895855 () Bool)

(assert (=> b!1350355 (=> (not res!895855) (not e!768195))))

(assert (=> b!1350355 (= res!895855 (not (contains!9188 (t!46218 Nil!31565) (h!32773 Nil!31565))))))

(declare-fun b!1350356 () Bool)

(assert (=> b!1350356 (= e!768195 (noDuplicate!2103 (t!46218 Nil!31565)))))

(assert (= (and d!144811 (not res!895854)) b!1350355))

(assert (= (and b!1350355 res!895855) b!1350356))

(declare-fun m!1237129 () Bool)

(assert (=> b!1350355 m!1237129))

(declare-fun m!1237131 () Bool)

(assert (=> b!1350356 m!1237131))

(assert (=> b!1350298 d!144811))

(declare-fun d!144819 () Bool)

(declare-fun res!895860 () Bool)

(declare-fun e!768200 () Bool)

(assert (=> d!144819 (=> res!895860 e!768200)))

(assert (=> d!144819 (= res!895860 ((_ is Nil!31565) acc!759))))

(assert (=> d!144819 (= (noDuplicate!2103 acc!759) e!768200)))

(declare-fun b!1350361 () Bool)

(declare-fun e!768201 () Bool)

(assert (=> b!1350361 (= e!768200 e!768201)))

(declare-fun res!895861 () Bool)

(assert (=> b!1350361 (=> (not res!895861) (not e!768201))))

(assert (=> b!1350361 (= res!895861 (not (contains!9188 (t!46218 acc!759) (h!32773 acc!759))))))

(declare-fun b!1350362 () Bool)

(assert (=> b!1350362 (= e!768201 (noDuplicate!2103 (t!46218 acc!759)))))

(assert (= (and d!144819 (not res!895860)) b!1350361))

(assert (= (and b!1350361 res!895861) b!1350362))

(declare-fun m!1237133 () Bool)

(assert (=> b!1350361 m!1237133))

(declare-fun m!1237135 () Bool)

(assert (=> b!1350362 m!1237135))

(assert (=> b!1350299 d!144819))

(declare-fun d!144821 () Bool)

(declare-fun lt!596786 () Bool)

(assert (=> d!144821 (= lt!596786 (select (content!669 Nil!31565) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!768203 () Bool)

(assert (=> d!144821 (= lt!596786 e!768203)))

(declare-fun res!895863 () Bool)

(assert (=> d!144821 (=> (not res!895863) (not e!768203))))

(assert (=> d!144821 (= res!895863 ((_ is Cons!31564) Nil!31565))))

(assert (=> d!144821 (= (contains!9188 Nil!31565 #b0000000000000000000000000000000000000000000000000000000000000000) lt!596786)))

(declare-fun b!1350363 () Bool)

(declare-fun e!768202 () Bool)

(assert (=> b!1350363 (= e!768203 e!768202)))

(declare-fun res!895862 () Bool)

(assert (=> b!1350363 (=> res!895862 e!768202)))

(assert (=> b!1350363 (= res!895862 (= (h!32773 Nil!31565) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350364 () Bool)

(assert (=> b!1350364 (= e!768202 (contains!9188 (t!46218 Nil!31565) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!144821 res!895863) b!1350363))

(assert (= (and b!1350363 (not res!895862)) b!1350364))

(assert (=> d!144821 m!1237123))

(declare-fun m!1237137 () Bool)

(assert (=> d!144821 m!1237137))

(declare-fun m!1237139 () Bool)

(assert (=> b!1350364 m!1237139))

(assert (=> b!1350294 d!144821))

(declare-fun d!144823 () Bool)

(declare-fun lt!596787 () Bool)

(assert (=> d!144823 (= lt!596787 (select (content!669 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!768205 () Bool)

(assert (=> d!144823 (= lt!596787 e!768205)))

(declare-fun res!895865 () Bool)

(assert (=> d!144823 (=> (not res!895865) (not e!768205))))

(assert (=> d!144823 (= res!895865 ((_ is Cons!31564) acc!759))))

(assert (=> d!144823 (= (contains!9188 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!596787)))

(declare-fun b!1350365 () Bool)

(declare-fun e!768204 () Bool)

(assert (=> b!1350365 (= e!768205 e!768204)))

(declare-fun res!895864 () Bool)

(assert (=> b!1350365 (=> res!895864 e!768204)))

(assert (=> b!1350365 (= res!895864 (= (h!32773 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350366 () Bool)

(assert (=> b!1350366 (= e!768204 (contains!9188 (t!46218 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!144823 res!895865) b!1350365))

(assert (= (and b!1350365 (not res!895864)) b!1350366))

(assert (=> d!144823 m!1237117))

(declare-fun m!1237141 () Bool)

(assert (=> d!144823 m!1237141))

(declare-fun m!1237143 () Bool)

(assert (=> b!1350366 m!1237143))

(assert (=> b!1350295 d!144823))

(check-sat (not b!1350366) (not b!1350350) (not b!1350361) (not d!144823) (not b!1350364) (not d!144805) (not b!1350355) (not b!1350348) (not d!144821) (not d!144809) (not b!1350356) (not b!1350362))
(check-sat)
