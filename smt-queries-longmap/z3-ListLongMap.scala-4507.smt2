; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62512 () Bool)

(assert start!62512)

(declare-fun b!704026 () Bool)

(declare-fun res!467852 () Bool)

(declare-fun e!397674 () Bool)

(assert (=> b!704026 (=> (not res!467852) (not e!397674))))

(declare-datatypes ((List!13293 0))(
  ( (Nil!13290) (Cons!13289 (h!14334 (_ BitVec 64)) (t!19575 List!13293)) )
))
(declare-fun acc!652 () List!13293)

(declare-fun noDuplicate!1117 (List!13293) Bool)

(assert (=> b!704026 (= res!467852 (noDuplicate!1117 acc!652))))

(declare-fun b!704027 () Bool)

(declare-fun res!467851 () Bool)

(assert (=> b!704027 (=> (not res!467851) (not e!397674))))

(declare-datatypes ((array!40191 0))(
  ( (array!40192 (arr!19252 (Array (_ BitVec 32) (_ BitVec 64))) (size!19637 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40191)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!704027 (= res!467851 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!704028 () Bool)

(declare-fun res!467836 () Bool)

(assert (=> b!704028 (=> (not res!467836) (not e!397674))))

(declare-fun arrayNoDuplicates!0 (array!40191 (_ BitVec 32) List!13293) Bool)

(assert (=> b!704028 (= res!467836 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!704029 () Bool)

(declare-fun res!467846 () Bool)

(assert (=> b!704029 (=> (not res!467846) (not e!397674))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!704029 (= res!467846 (validKeyInArray!0 k0!2824))))

(declare-fun b!704030 () Bool)

(declare-fun res!467840 () Bool)

(assert (=> b!704030 (=> (not res!467840) (not e!397674))))

(assert (=> b!704030 (= res!467840 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!704031 () Bool)

(declare-fun res!467844 () Bool)

(assert (=> b!704031 (=> (not res!467844) (not e!397674))))

(declare-fun newAcc!49 () List!13293)

(declare-fun contains!3870 (List!13293 (_ BitVec 64)) Bool)

(assert (=> b!704031 (= res!467844 (not (contains!3870 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704032 () Bool)

(declare-fun res!467837 () Bool)

(assert (=> b!704032 (=> (not res!467837) (not e!397674))))

(assert (=> b!704032 (= res!467837 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19637 a!3591)))))

(declare-fun b!704033 () Bool)

(declare-fun res!467848 () Bool)

(assert (=> b!704033 (=> (not res!467848) (not e!397674))))

(assert (=> b!704033 (= res!467848 (not (contains!3870 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704034 () Bool)

(declare-fun res!467853 () Bool)

(assert (=> b!704034 (=> (not res!467853) (not e!397674))))

(declare-fun subseq!315 (List!13293 List!13293) Bool)

(assert (=> b!704034 (= res!467853 (subseq!315 acc!652 newAcc!49))))

(declare-fun b!704035 () Bool)

(declare-fun res!467839 () Bool)

(assert (=> b!704035 (=> (not res!467839) (not e!397674))))

(declare-fun -!280 (List!13293 (_ BitVec 64)) List!13293)

(assert (=> b!704035 (= res!467839 (= (-!280 newAcc!49 k0!2824) acc!652))))

(declare-fun res!467850 () Bool)

(assert (=> start!62512 (=> (not res!467850) (not e!397674))))

(assert (=> start!62512 (= res!467850 (and (bvslt (size!19637 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19637 a!3591))))))

(assert (=> start!62512 e!397674))

(assert (=> start!62512 true))

(declare-fun array_inv!15048 (array!40191) Bool)

(assert (=> start!62512 (array_inv!15048 a!3591)))

(declare-fun b!704036 () Bool)

(assert (=> b!704036 (= e!397674 false)))

(declare-fun lt!317820 () Bool)

(assert (=> b!704036 (= lt!317820 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!704037 () Bool)

(declare-fun res!467849 () Bool)

(assert (=> b!704037 (=> (not res!467849) (not e!397674))))

(assert (=> b!704037 (= res!467849 (not (validKeyInArray!0 (select (arr!19252 a!3591) from!2969))))))

(declare-fun b!704038 () Bool)

(declare-fun res!467838 () Bool)

(assert (=> b!704038 (=> (not res!467838) (not e!397674))))

(assert (=> b!704038 (= res!467838 (not (contains!3870 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704039 () Bool)

(declare-fun res!467842 () Bool)

(assert (=> b!704039 (=> (not res!467842) (not e!397674))))

(assert (=> b!704039 (= res!467842 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!704040 () Bool)

(declare-fun res!467845 () Bool)

(assert (=> b!704040 (=> (not res!467845) (not e!397674))))

(assert (=> b!704040 (= res!467845 (not (contains!3870 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704041 () Bool)

(declare-fun res!467847 () Bool)

(assert (=> b!704041 (=> (not res!467847) (not e!397674))))

(assert (=> b!704041 (= res!467847 (contains!3870 newAcc!49 k0!2824))))

(declare-fun b!704042 () Bool)

(declare-fun res!467843 () Bool)

(assert (=> b!704042 (=> (not res!467843) (not e!397674))))

(assert (=> b!704042 (= res!467843 (not (contains!3870 acc!652 k0!2824)))))

(declare-fun b!704043 () Bool)

(declare-fun res!467841 () Bool)

(assert (=> b!704043 (=> (not res!467841) (not e!397674))))

(assert (=> b!704043 (= res!467841 (noDuplicate!1117 newAcc!49))))

(assert (= (and start!62512 res!467850) b!704026))

(assert (= (and b!704026 res!467852) b!704043))

(assert (= (and b!704043 res!467841) b!704033))

(assert (= (and b!704033 res!467848) b!704038))

(assert (= (and b!704038 res!467838) b!704039))

(assert (= (and b!704039 res!467842) b!704042))

(assert (= (and b!704042 res!467843) b!704029))

(assert (= (and b!704029 res!467846) b!704028))

(assert (= (and b!704028 res!467836) b!704034))

(assert (= (and b!704034 res!467853) b!704041))

(assert (= (and b!704041 res!467847) b!704035))

(assert (= (and b!704035 res!467839) b!704040))

(assert (= (and b!704040 res!467845) b!704031))

(assert (= (and b!704031 res!467844) b!704032))

(assert (= (and b!704032 res!467837) b!704037))

(assert (= (and b!704037 res!467849) b!704030))

(assert (= (and b!704030 res!467840) b!704027))

(assert (= (and b!704027 res!467851) b!704036))

(declare-fun m!662659 () Bool)

(assert (=> b!704038 m!662659))

(declare-fun m!662661 () Bool)

(assert (=> b!704026 m!662661))

(declare-fun m!662663 () Bool)

(assert (=> start!62512 m!662663))

(declare-fun m!662665 () Bool)

(assert (=> b!704036 m!662665))

(declare-fun m!662667 () Bool)

(assert (=> b!704043 m!662667))

(declare-fun m!662669 () Bool)

(assert (=> b!704034 m!662669))

(declare-fun m!662671 () Bool)

(assert (=> b!704042 m!662671))

(declare-fun m!662673 () Bool)

(assert (=> b!704035 m!662673))

(declare-fun m!662675 () Bool)

(assert (=> b!704033 m!662675))

(declare-fun m!662677 () Bool)

(assert (=> b!704028 m!662677))

(declare-fun m!662679 () Bool)

(assert (=> b!704040 m!662679))

(declare-fun m!662681 () Bool)

(assert (=> b!704027 m!662681))

(declare-fun m!662683 () Bool)

(assert (=> b!704031 m!662683))

(declare-fun m!662685 () Bool)

(assert (=> b!704029 m!662685))

(declare-fun m!662687 () Bool)

(assert (=> b!704041 m!662687))

(declare-fun m!662689 () Bool)

(assert (=> b!704037 m!662689))

(assert (=> b!704037 m!662689))

(declare-fun m!662691 () Bool)

(assert (=> b!704037 m!662691))

(declare-fun m!662693 () Bool)

(assert (=> b!704039 m!662693))

(check-sat (not start!62512) (not b!704028) (not b!704035) (not b!704039) (not b!704027) (not b!704040) (not b!704033) (not b!704043) (not b!704042) (not b!704029) (not b!704038) (not b!704037) (not b!704026) (not b!704034) (not b!704031) (not b!704036) (not b!704041))
(check-sat)
