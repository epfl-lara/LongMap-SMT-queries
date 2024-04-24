; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61840 () Bool)

(assert start!61840)

(declare-fun b!691803 () Bool)

(declare-fun e!393704 () Bool)

(assert (=> b!691803 (= e!393704 false)))

(declare-datatypes ((Unit!24377 0))(
  ( (Unit!24378) )
))
(declare-fun lt!316584 () Unit!24377)

(declare-fun e!393702 () Unit!24377)

(assert (=> b!691803 (= lt!316584 e!393702)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun c!78251 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!39799 0))(
  ( (array!39800 (arr!19065 (Array (_ BitVec 32) (_ BitVec 64))) (size!19448 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39799)

(assert (=> b!691803 (= c!78251 (= (select (arr!19065 a!3626) from!3004) k!2843))))

(declare-fun b!691804 () Bool)

(declare-fun res!456042 () Bool)

(assert (=> b!691804 (=> (not res!456042) (not e!393704))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!691804 (= res!456042 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19448 a!3626))))))

(declare-fun b!691805 () Bool)

(declare-fun res!456051 () Bool)

(assert (=> b!691805 (=> (not res!456051) (not e!393704))))

(declare-datatypes ((List!13013 0))(
  ( (Nil!13010) (Cons!13009 (h!14057 (_ BitVec 64)) (t!19272 List!13013)) )
))
(declare-fun acc!681 () List!13013)

(declare-fun contains!3665 (List!13013 (_ BitVec 64)) Bool)

(assert (=> b!691805 (= res!456051 (not (contains!3665 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691806 () Bool)

(declare-fun res!456044 () Bool)

(assert (=> b!691806 (=> (not res!456044) (not e!393704))))

(declare-fun arrayContainsKey!0 (array!39799 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!691806 (= res!456044 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!691807 () Bool)

(declare-fun res!456049 () Bool)

(assert (=> b!691807 (=> (not res!456049) (not e!393704))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!691807 (= res!456049 (validKeyInArray!0 (select (arr!19065 a!3626) from!3004)))))

(declare-fun b!691808 () Bool)

(declare-fun res!456045 () Bool)

(assert (=> b!691808 (=> (not res!456045) (not e!393704))))

(declare-fun noDuplicate!939 (List!13013) Bool)

(assert (=> b!691808 (= res!456045 (noDuplicate!939 acc!681))))

(declare-fun res!456050 () Bool)

(assert (=> start!61840 (=> (not res!456050) (not e!393704))))

(assert (=> start!61840 (= res!456050 (and (bvslt (size!19448 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19448 a!3626))))))

(assert (=> start!61840 e!393704))

(assert (=> start!61840 true))

(declare-fun array_inv!14924 (array!39799) Bool)

(assert (=> start!61840 (array_inv!14924 a!3626)))

(declare-fun b!691809 () Bool)

(declare-fun res!456039 () Bool)

(assert (=> b!691809 (=> (not res!456039) (not e!393704))))

(declare-fun arrayNoDuplicates!0 (array!39799 (_ BitVec 32) List!13013) Bool)

(assert (=> b!691809 (= res!456039 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13010))))

(declare-fun b!691810 () Bool)

(declare-fun res!456040 () Bool)

(assert (=> b!691810 (=> (not res!456040) (not e!393704))))

(assert (=> b!691810 (= res!456040 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!691811 () Bool)

(declare-fun Unit!24379 () Unit!24377)

(assert (=> b!691811 (= e!393702 Unit!24379)))

(declare-fun b!691812 () Bool)

(declare-fun e!393703 () Bool)

(assert (=> b!691812 (= e!393703 (not (contains!3665 acc!681 k!2843)))))

(declare-fun b!691813 () Bool)

(declare-fun res!456047 () Bool)

(assert (=> b!691813 (=> (not res!456047) (not e!393704))))

(declare-fun e!393701 () Bool)

(assert (=> b!691813 (= res!456047 e!393701)))

(declare-fun res!456048 () Bool)

(assert (=> b!691813 (=> res!456048 e!393701)))

(declare-fun e!393700 () Bool)

(assert (=> b!691813 (= res!456048 e!393700)))

(declare-fun res!456043 () Bool)

(assert (=> b!691813 (=> (not res!456043) (not e!393700))))

(assert (=> b!691813 (= res!456043 (bvsgt from!3004 i!1382))))

(declare-fun b!691814 () Bool)

(declare-fun res!456038 () Bool)

(assert (=> b!691814 (=> (not res!456038) (not e!393704))))

(assert (=> b!691814 (= res!456038 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19448 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!691815 () Bool)

(declare-fun Unit!24380 () Unit!24377)

(assert (=> b!691815 (= e!393702 Unit!24380)))

(assert (=> b!691815 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316585 () Unit!24377)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39799 (_ BitVec 64) (_ BitVec 32)) Unit!24377)

(assert (=> b!691815 (= lt!316585 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!691815 false))

(declare-fun b!691816 () Bool)

(assert (=> b!691816 (= e!393700 (contains!3665 acc!681 k!2843))))

(declare-fun b!691817 () Bool)

(declare-fun res!456046 () Bool)

(assert (=> b!691817 (=> (not res!456046) (not e!393704))))

(assert (=> b!691817 (= res!456046 (not (contains!3665 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691818 () Bool)

(assert (=> b!691818 (= e!393701 e!393703)))

(declare-fun res!456041 () Bool)

(assert (=> b!691818 (=> (not res!456041) (not e!393703))))

(assert (=> b!691818 (= res!456041 (bvsle from!3004 i!1382))))

(declare-fun b!691819 () Bool)

(declare-fun res!456052 () Bool)

(assert (=> b!691819 (=> (not res!456052) (not e!393704))))

(assert (=> b!691819 (= res!456052 (validKeyInArray!0 k!2843))))

(assert (= (and start!61840 res!456050) b!691808))

(assert (= (and b!691808 res!456045) b!691817))

(assert (= (and b!691817 res!456046) b!691805))

(assert (= (and b!691805 res!456051) b!691813))

(assert (= (and b!691813 res!456043) b!691816))

(assert (= (and b!691813 (not res!456048)) b!691818))

(assert (= (and b!691818 res!456041) b!691812))

(assert (= (and b!691813 res!456047) b!691809))

(assert (= (and b!691809 res!456039) b!691810))

(assert (= (and b!691810 res!456040) b!691804))

(assert (= (and b!691804 res!456042) b!691819))

(assert (= (and b!691819 res!456052) b!691806))

(assert (= (and b!691806 res!456044) b!691814))

(assert (= (and b!691814 res!456038) b!691807))

(assert (= (and b!691807 res!456049) b!691803))

(assert (= (and b!691803 c!78251) b!691815))

(assert (= (and b!691803 (not c!78251)) b!691811))

(declare-fun m!655235 () Bool)

(assert (=> start!61840 m!655235))

(declare-fun m!655237 () Bool)

(assert (=> b!691816 m!655237))

(declare-fun m!655239 () Bool)

(assert (=> b!691803 m!655239))

(declare-fun m!655241 () Bool)

(assert (=> b!691808 m!655241))

(declare-fun m!655243 () Bool)

(assert (=> b!691809 m!655243))

(declare-fun m!655245 () Bool)

(assert (=> b!691810 m!655245))

(declare-fun m!655247 () Bool)

(assert (=> b!691817 m!655247))

(declare-fun m!655249 () Bool)

(assert (=> b!691819 m!655249))

(declare-fun m!655251 () Bool)

(assert (=> b!691806 m!655251))

(assert (=> b!691807 m!655239))

(assert (=> b!691807 m!655239))

(declare-fun m!655253 () Bool)

(assert (=> b!691807 m!655253))

(declare-fun m!655255 () Bool)

(assert (=> b!691815 m!655255))

(declare-fun m!655257 () Bool)

(assert (=> b!691815 m!655257))

(assert (=> b!691812 m!655237))

(declare-fun m!655259 () Bool)

(assert (=> b!691805 m!655259))

(push 1)

(assert (not b!691805))

(assert (not b!691809))

(assert (not b!691819))

(assert (not b!691807))

(assert (not b!691808))

(assert (not b!691816))

(assert (not b!691806))

(assert (not start!61840))

(assert (not b!691815))

(assert (not b!691812))

(assert (not b!691810))

(assert (not b!691817))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

