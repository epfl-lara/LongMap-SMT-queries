; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115448 () Bool)

(assert start!115448)

(declare-fun b!1365269 () Bool)

(declare-fun res!908851 () Bool)

(declare-fun e!774175 () Bool)

(assert (=> b!1365269 (=> (not res!908851) (not e!774175))))

(declare-datatypes ((List!31881 0))(
  ( (Nil!31878) (Cons!31877 (h!33086 (_ BitVec 64)) (t!46575 List!31881)) )
))
(declare-fun acc!866 () List!31881)

(declare-fun noDuplicate!2420 (List!31881) Bool)

(assert (=> b!1365269 (= res!908851 (noDuplicate!2420 acc!866))))

(declare-fun b!1365270 () Bool)

(declare-fun e!774172 () Bool)

(declare-fun e!774174 () Bool)

(assert (=> b!1365270 (= e!774172 e!774174)))

(declare-fun res!908848 () Bool)

(assert (=> b!1365270 (=> (not res!908848) (not e!774174))))

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1365270 (= res!908848 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun lt!601240 () List!31881)

(declare-datatypes ((array!92769 0))(
  ( (array!92770 (arr!44813 (Array (_ BitVec 32) (_ BitVec 64))) (size!45363 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92769)

(declare-fun newAcc!98 () List!31881)

(assert (=> b!1365270 (= lt!601240 (Cons!31877 (select (arr!44813 a!3861) from!3239) newAcc!98))))

(declare-fun lt!601243 () List!31881)

(assert (=> b!1365270 (= lt!601243 (Cons!31877 (select (arr!44813 a!3861) from!3239) acc!866))))

(declare-fun b!1365271 () Bool)

(declare-fun res!908860 () Bool)

(assert (=> b!1365271 (=> (not res!908860) (not e!774175))))

(declare-fun subseq!965 (List!31881 List!31881) Bool)

(assert (=> b!1365271 (= res!908860 (subseq!965 newAcc!98 acc!866))))

(declare-fun b!1365272 () Bool)

(declare-fun res!908857 () Bool)

(assert (=> b!1365272 (=> (not res!908857) (not e!774175))))

(declare-fun contains!9563 (List!31881 (_ BitVec 64)) Bool)

(assert (=> b!1365272 (= res!908857 (not (contains!9563 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365273 () Bool)

(declare-fun res!908855 () Bool)

(assert (=> b!1365273 (=> (not res!908855) (not e!774174))))

(assert (=> b!1365273 (= res!908855 (subseq!965 lt!601240 lt!601243))))

(declare-fun b!1365274 () Bool)

(declare-fun res!908849 () Bool)

(assert (=> b!1365274 (=> (not res!908849) (not e!774174))))

(assert (=> b!1365274 (= res!908849 (noDuplicate!2420 lt!601243))))

(declare-fun b!1365275 () Bool)

(declare-fun res!908856 () Bool)

(assert (=> b!1365275 (=> (not res!908856) (not e!774175))))

(assert (=> b!1365275 (= res!908856 (not (contains!9563 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!908846 () Bool)

(assert (=> start!115448 (=> (not res!908846) (not e!774175))))

(assert (=> start!115448 (= res!908846 (and (bvslt (size!45363 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45363 a!3861))))))

(assert (=> start!115448 e!774175))

(declare-fun array_inv!33841 (array!92769) Bool)

(assert (=> start!115448 (array_inv!33841 a!3861)))

(assert (=> start!115448 true))

(declare-fun b!1365276 () Bool)

(declare-fun res!908852 () Bool)

(assert (=> b!1365276 (=> (not res!908852) (not e!774172))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1365276 (= res!908852 (validKeyInArray!0 (select (arr!44813 a!3861) from!3239)))))

(declare-fun b!1365277 () Bool)

(assert (=> b!1365277 (= e!774174 false)))

(declare-fun lt!601239 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92769 (_ BitVec 32) List!31881) Bool)

(assert (=> b!1365277 (= lt!601239 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601243))))

(declare-datatypes ((Unit!45063 0))(
  ( (Unit!45064) )
))
(declare-fun lt!601241 () Unit!45063)

(declare-fun noDuplicateSubseq!152 (List!31881 List!31881) Unit!45063)

(assert (=> b!1365277 (= lt!601241 (noDuplicateSubseq!152 lt!601240 lt!601243))))

(declare-fun b!1365278 () Bool)

(assert (=> b!1365278 (= e!774175 e!774172)))

(declare-fun res!908858 () Bool)

(assert (=> b!1365278 (=> (not res!908858) (not e!774172))))

(assert (=> b!1365278 (= res!908858 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!601242 () Unit!45063)

(assert (=> b!1365278 (= lt!601242 (noDuplicateSubseq!152 newAcc!98 acc!866))))

(declare-fun b!1365279 () Bool)

(declare-fun res!908853 () Bool)

(assert (=> b!1365279 (=> (not res!908853) (not e!774174))))

(assert (=> b!1365279 (= res!908853 (not (contains!9563 lt!601243 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365280 () Bool)

(declare-fun res!908859 () Bool)

(assert (=> b!1365280 (=> (not res!908859) (not e!774174))))

(assert (=> b!1365280 (= res!908859 (not (contains!9563 lt!601240 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365281 () Bool)

(declare-fun res!908843 () Bool)

(assert (=> b!1365281 (=> (not res!908843) (not e!774172))))

(assert (=> b!1365281 (= res!908843 (bvslt from!3239 (size!45363 a!3861)))))

(declare-fun b!1365282 () Bool)

(declare-fun res!908844 () Bool)

(assert (=> b!1365282 (=> (not res!908844) (not e!774174))))

(assert (=> b!1365282 (= res!908844 (not (contains!9563 lt!601240 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365283 () Bool)

(declare-fun res!908847 () Bool)

(assert (=> b!1365283 (=> (not res!908847) (not e!774172))))

(assert (=> b!1365283 (= res!908847 (not (contains!9563 acc!866 (select (arr!44813 a!3861) from!3239))))))

(declare-fun b!1365284 () Bool)

(declare-fun res!908845 () Bool)

(assert (=> b!1365284 (=> (not res!908845) (not e!774174))))

(assert (=> b!1365284 (= res!908845 (not (contains!9563 lt!601243 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365285 () Bool)

(declare-fun res!908854 () Bool)

(assert (=> b!1365285 (=> (not res!908854) (not e!774175))))

(assert (=> b!1365285 (= res!908854 (not (contains!9563 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365286 () Bool)

(declare-fun res!908850 () Bool)

(assert (=> b!1365286 (=> (not res!908850) (not e!774175))))

(assert (=> b!1365286 (= res!908850 (not (contains!9563 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115448 res!908846) b!1365269))

(assert (= (and b!1365269 res!908851) b!1365285))

(assert (= (and b!1365285 res!908854) b!1365286))

(assert (= (and b!1365286 res!908850) b!1365272))

(assert (= (and b!1365272 res!908857) b!1365275))

(assert (= (and b!1365275 res!908856) b!1365271))

(assert (= (and b!1365271 res!908860) b!1365278))

(assert (= (and b!1365278 res!908858) b!1365281))

(assert (= (and b!1365281 res!908843) b!1365276))

(assert (= (and b!1365276 res!908852) b!1365283))

(assert (= (and b!1365283 res!908847) b!1365270))

(assert (= (and b!1365270 res!908848) b!1365274))

(assert (= (and b!1365274 res!908849) b!1365284))

(assert (= (and b!1365284 res!908845) b!1365279))

(assert (= (and b!1365279 res!908853) b!1365280))

(assert (= (and b!1365280 res!908859) b!1365282))

(assert (= (and b!1365282 res!908844) b!1365273))

(assert (= (and b!1365273 res!908855) b!1365277))

(declare-fun m!1249861 () Bool)

(assert (=> b!1365272 m!1249861))

(declare-fun m!1249863 () Bool)

(assert (=> b!1365269 m!1249863))

(declare-fun m!1249865 () Bool)

(assert (=> b!1365286 m!1249865))

(declare-fun m!1249867 () Bool)

(assert (=> b!1365276 m!1249867))

(assert (=> b!1365276 m!1249867))

(declare-fun m!1249869 () Bool)

(assert (=> b!1365276 m!1249869))

(declare-fun m!1249871 () Bool)

(assert (=> b!1365278 m!1249871))

(declare-fun m!1249873 () Bool)

(assert (=> b!1365278 m!1249873))

(declare-fun m!1249875 () Bool)

(assert (=> b!1365279 m!1249875))

(declare-fun m!1249877 () Bool)

(assert (=> b!1365280 m!1249877))

(declare-fun m!1249879 () Bool)

(assert (=> b!1365277 m!1249879))

(declare-fun m!1249881 () Bool)

(assert (=> b!1365277 m!1249881))

(declare-fun m!1249883 () Bool)

(assert (=> b!1365285 m!1249883))

(assert (=> b!1365283 m!1249867))

(assert (=> b!1365283 m!1249867))

(declare-fun m!1249885 () Bool)

(assert (=> b!1365283 m!1249885))

(declare-fun m!1249887 () Bool)

(assert (=> b!1365274 m!1249887))

(declare-fun m!1249889 () Bool)

(assert (=> b!1365271 m!1249889))

(declare-fun m!1249891 () Bool)

(assert (=> b!1365284 m!1249891))

(assert (=> b!1365270 m!1249867))

(declare-fun m!1249893 () Bool)

(assert (=> b!1365273 m!1249893))

(declare-fun m!1249895 () Bool)

(assert (=> b!1365275 m!1249895))

(declare-fun m!1249897 () Bool)

(assert (=> b!1365282 m!1249897))

(declare-fun m!1249899 () Bool)

(assert (=> start!115448 m!1249899))

(push 1)

