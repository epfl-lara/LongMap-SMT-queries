; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62406 () Bool)

(assert start!62406)

(declare-fun b!700038 () Bool)

(declare-fun res!463852 () Bool)

(declare-fun e!397247 () Bool)

(assert (=> b!700038 (=> (not res!463852) (not e!397247))))

(declare-datatypes ((List!13240 0))(
  ( (Nil!13237) (Cons!13236 (h!14281 (_ BitVec 64)) (t!19522 List!13240)) )
))
(declare-fun newAcc!49 () List!13240)

(declare-fun noDuplicate!1064 (List!13240) Bool)

(assert (=> b!700038 (= res!463852 (noDuplicate!1064 newAcc!49))))

(declare-fun b!700039 () Bool)

(declare-fun res!463865 () Bool)

(assert (=> b!700039 (=> (not res!463865) (not e!397247))))

(declare-fun acc!652 () List!13240)

(declare-fun contains!3817 (List!13240 (_ BitVec 64)) Bool)

(assert (=> b!700039 (= res!463865 (not (contains!3817 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700040 () Bool)

(declare-fun res!463855 () Bool)

(assert (=> b!700040 (=> (not res!463855) (not e!397247))))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40085 0))(
  ( (array!40086 (arr!19199 (Array (_ BitVec 32) (_ BitVec 64))) (size!19584 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40085)

(assert (=> b!700040 (= res!463855 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19584 a!3591)))))

(declare-fun b!700041 () Bool)

(declare-fun res!463870 () Bool)

(assert (=> b!700041 (=> (not res!463870) (not e!397247))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun -!227 (List!13240 (_ BitVec 64)) List!13240)

(assert (=> b!700041 (= res!463870 (= (-!227 newAcc!49 k!2824) acc!652))))

(declare-fun b!700042 () Bool)

(declare-fun res!463848 () Bool)

(declare-fun e!397248 () Bool)

(assert (=> b!700042 (=> (not res!463848) (not e!397248))))

(declare-fun lt!317444 () List!13240)

(assert (=> b!700042 (= res!463848 (not (contains!3817 lt!317444 k!2824)))))

(declare-fun b!700043 () Bool)

(declare-fun res!463862 () Bool)

(assert (=> b!700043 (=> (not res!463862) (not e!397248))))

(declare-fun lt!317445 () List!13240)

(assert (=> b!700043 (= res!463862 (= (-!227 lt!317445 k!2824) lt!317444))))

(declare-fun b!700044 () Bool)

(declare-fun res!463874 () Bool)

(assert (=> b!700044 (=> (not res!463874) (not e!397247))))

(assert (=> b!700044 (= res!463874 (contains!3817 newAcc!49 k!2824))))

(declare-fun b!700045 () Bool)

(assert (=> b!700045 (= e!397248 false)))

(declare-fun lt!317443 () Bool)

(assert (=> b!700045 (= lt!317443 (contains!3817 lt!317445 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!700046 () Bool)

(declare-fun res!463864 () Bool)

(assert (=> b!700046 (=> (not res!463864) (not e!397247))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!700046 (= res!463864 (validKeyInArray!0 k!2824))))

(declare-fun b!700047 () Bool)

(declare-fun res!463873 () Bool)

(assert (=> b!700047 (=> (not res!463873) (not e!397248))))

(assert (=> b!700047 (= res!463873 (noDuplicate!1064 lt!317445))))

(declare-fun b!700048 () Bool)

(declare-fun res!463854 () Bool)

(assert (=> b!700048 (=> (not res!463854) (not e!397247))))

(assert (=> b!700048 (= res!463854 (validKeyInArray!0 (select (arr!19199 a!3591) from!2969)))))

(declare-fun b!700049 () Bool)

(declare-fun res!463861 () Bool)

(assert (=> b!700049 (=> (not res!463861) (not e!397247))))

(declare-fun arrayContainsKey!0 (array!40085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!700049 (= res!463861 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!700050 () Bool)

(declare-fun res!463869 () Bool)

(assert (=> b!700050 (=> (not res!463869) (not e!397248))))

(assert (=> b!700050 (= res!463869 (not (contains!3817 lt!317444 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700052 () Bool)

(declare-fun res!463858 () Bool)

(assert (=> b!700052 (=> (not res!463858) (not e!397247))))

(assert (=> b!700052 (= res!463858 (not (contains!3817 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700053 () Bool)

(assert (=> b!700053 (= e!397247 e!397248)))

(declare-fun res!463857 () Bool)

(assert (=> b!700053 (=> (not res!463857) (not e!397248))))

(assert (=> b!700053 (= res!463857 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!460 (List!13240 (_ BitVec 64)) List!13240)

(assert (=> b!700053 (= lt!317445 ($colon$colon!460 newAcc!49 (select (arr!19199 a!3591) from!2969)))))

(assert (=> b!700053 (= lt!317444 ($colon$colon!460 acc!652 (select (arr!19199 a!3591) from!2969)))))

(declare-fun b!700054 () Bool)

(declare-fun res!463851 () Bool)

(assert (=> b!700054 (=> (not res!463851) (not e!397247))))

(assert (=> b!700054 (= res!463851 (not (contains!3817 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700055 () Bool)

(declare-fun res!463875 () Bool)

(assert (=> b!700055 (=> (not res!463875) (not e!397247))))

(assert (=> b!700055 (= res!463875 (not (contains!3817 acc!652 k!2824)))))

(declare-fun b!700056 () Bool)

(declare-fun res!463872 () Bool)

(assert (=> b!700056 (=> (not res!463872) (not e!397248))))

(assert (=> b!700056 (= res!463872 (not (contains!3817 lt!317445 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700057 () Bool)

(declare-fun res!463856 () Bool)

(assert (=> b!700057 (=> (not res!463856) (not e!397247))))

(assert (=> b!700057 (= res!463856 (not (contains!3817 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700058 () Bool)

(declare-fun res!463860 () Bool)

(assert (=> b!700058 (=> (not res!463860) (not e!397248))))

(assert (=> b!700058 (= res!463860 (contains!3817 lt!317445 k!2824))))

(declare-fun b!700059 () Bool)

(declare-fun res!463849 () Bool)

(assert (=> b!700059 (=> (not res!463849) (not e!397247))))

(declare-fun subseq!262 (List!13240 List!13240) Bool)

(assert (=> b!700059 (= res!463849 (subseq!262 acc!652 newAcc!49))))

(declare-fun b!700060 () Bool)

(declare-fun res!463853 () Bool)

(assert (=> b!700060 (=> (not res!463853) (not e!397247))))

(assert (=> b!700060 (= res!463853 (noDuplicate!1064 acc!652))))

(declare-fun b!700061 () Bool)

(declare-fun res!463863 () Bool)

(assert (=> b!700061 (=> (not res!463863) (not e!397248))))

(assert (=> b!700061 (= res!463863 (subseq!262 lt!317444 lt!317445))))

(declare-fun b!700062 () Bool)

(declare-fun res!463850 () Bool)

(assert (=> b!700062 (=> (not res!463850) (not e!397248))))

(assert (=> b!700062 (= res!463850 (noDuplicate!1064 lt!317444))))

(declare-fun b!700063 () Bool)

(declare-fun res!463871 () Bool)

(assert (=> b!700063 (=> (not res!463871) (not e!397248))))

(assert (=> b!700063 (= res!463871 (not (contains!3817 lt!317444 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!463867 () Bool)

(assert (=> start!62406 (=> (not res!463867) (not e!397247))))

(assert (=> start!62406 (= res!463867 (and (bvslt (size!19584 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19584 a!3591))))))

(assert (=> start!62406 e!397247))

(assert (=> start!62406 true))

(declare-fun array_inv!14995 (array!40085) Bool)

(assert (=> start!62406 (array_inv!14995 a!3591)))

(declare-fun b!700051 () Bool)

(declare-fun res!463868 () Bool)

(assert (=> b!700051 (=> (not res!463868) (not e!397248))))

(assert (=> b!700051 (= res!463868 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!700064 () Bool)

(declare-fun res!463866 () Bool)

(assert (=> b!700064 (=> (not res!463866) (not e!397248))))

(declare-fun arrayNoDuplicates!0 (array!40085 (_ BitVec 32) List!13240) Bool)

(assert (=> b!700064 (= res!463866 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317444))))

(declare-fun b!700065 () Bool)

(declare-fun res!463859 () Bool)

(assert (=> b!700065 (=> (not res!463859) (not e!397247))))

(assert (=> b!700065 (= res!463859 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(assert (= (and start!62406 res!463867) b!700060))

(assert (= (and b!700060 res!463853) b!700038))

(assert (= (and b!700038 res!463852) b!700057))

(assert (= (and b!700057 res!463856) b!700039))

(assert (= (and b!700039 res!463865) b!700049))

(assert (= (and b!700049 res!463861) b!700055))

(assert (= (and b!700055 res!463875) b!700046))

(assert (= (and b!700046 res!463864) b!700065))

(assert (= (and b!700065 res!463859) b!700059))

(assert (= (and b!700059 res!463849) b!700044))

(assert (= (and b!700044 res!463874) b!700041))

(assert (= (and b!700041 res!463870) b!700052))

(assert (= (and b!700052 res!463858) b!700054))

(assert (= (and b!700054 res!463851) b!700040))

(assert (= (and b!700040 res!463855) b!700048))

(assert (= (and b!700048 res!463854) b!700053))

(assert (= (and b!700053 res!463857) b!700062))

(assert (= (and b!700062 res!463850) b!700047))

(assert (= (and b!700047 res!463873) b!700050))

(assert (= (and b!700050 res!463869) b!700063))

(assert (= (and b!700063 res!463871) b!700051))

(assert (= (and b!700051 res!463868) b!700042))

(assert (= (and b!700042 res!463848) b!700064))

(assert (= (and b!700064 res!463866) b!700061))

(assert (= (and b!700061 res!463863) b!700058))

(assert (= (and b!700058 res!463860) b!700043))

(assert (= (and b!700043 res!463862) b!700056))

(assert (= (and b!700056 res!463872) b!700045))

(declare-fun m!659815 () Bool)

(assert (=> b!700059 m!659815))

(declare-fun m!659817 () Bool)

(assert (=> b!700044 m!659817))

(declare-fun m!659819 () Bool)

(assert (=> b!700050 m!659819))

(declare-fun m!659821 () Bool)

(assert (=> b!700057 m!659821))

(declare-fun m!659823 () Bool)

(assert (=> b!700061 m!659823))

(declare-fun m!659825 () Bool)

(assert (=> b!700053 m!659825))

(assert (=> b!700053 m!659825))

(declare-fun m!659827 () Bool)

(assert (=> b!700053 m!659827))

(assert (=> b!700053 m!659825))

(declare-fun m!659829 () Bool)

(assert (=> b!700053 m!659829))

(assert (=> b!700048 m!659825))

(assert (=> b!700048 m!659825))

(declare-fun m!659831 () Bool)

(assert (=> b!700048 m!659831))

(declare-fun m!659833 () Bool)

(assert (=> b!700065 m!659833))

(declare-fun m!659835 () Bool)

(assert (=> b!700054 m!659835))

(declare-fun m!659837 () Bool)

(assert (=> b!700063 m!659837))

(declare-fun m!659839 () Bool)

(assert (=> b!700056 m!659839))

(declare-fun m!659841 () Bool)

(assert (=> b!700038 m!659841))

(declare-fun m!659843 () Bool)

(assert (=> b!700055 m!659843))

(declare-fun m!659845 () Bool)

(assert (=> b!700064 m!659845))

(declare-fun m!659847 () Bool)

(assert (=> b!700047 m!659847))

(declare-fun m!659849 () Bool)

(assert (=> b!700042 m!659849))

(declare-fun m!659851 () Bool)

(assert (=> b!700052 m!659851))

(declare-fun m!659853 () Bool)

(assert (=> b!700049 m!659853))

(declare-fun m!659855 () Bool)

(assert (=> b!700039 m!659855))

(declare-fun m!659857 () Bool)

(assert (=> b!700051 m!659857))

(declare-fun m!659859 () Bool)

(assert (=> b!700062 m!659859))

(declare-fun m!659861 () Bool)

(assert (=> b!700046 m!659861))

(declare-fun m!659863 () Bool)

(assert (=> b!700060 m!659863))

(declare-fun m!659865 () Bool)

(assert (=> b!700045 m!659865))

(declare-fun m!659867 () Bool)

(assert (=> b!700058 m!659867))

(declare-fun m!659869 () Bool)

(assert (=> start!62406 m!659869))

(declare-fun m!659871 () Bool)

(assert (=> b!700043 m!659871))

(declare-fun m!659873 () Bool)

(assert (=> b!700041 m!659873))

(push 1)

