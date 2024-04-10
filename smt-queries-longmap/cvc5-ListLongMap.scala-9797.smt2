; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116348 () Bool)

(assert start!116348)

(declare-fun b!1373252 () Bool)

(declare-fun res!916498 () Bool)

(declare-fun e!777925 () Bool)

(assert (=> b!1373252 (=> (not res!916498) (not e!777925))))

(declare-datatypes ((List!32040 0))(
  ( (Nil!32037) (Cons!32036 (h!33245 (_ BitVec 64)) (t!46734 List!32040)) )
))
(declare-fun acc!866 () List!32040)

(declare-fun contains!9722 (List!32040 (_ BitVec 64)) Bool)

(assert (=> b!1373252 (= res!916498 (not (contains!9722 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373253 () Bool)

(declare-fun res!916504 () Bool)

(declare-fun e!777923 () Bool)

(assert (=> b!1373253 (=> (not res!916504) (not e!777923))))

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1373253 (= res!916504 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1373254 () Bool)

(declare-fun res!916503 () Bool)

(assert (=> b!1373254 (=> (not res!916503) (not e!777925))))

(declare-fun noDuplicate!2579 (List!32040) Bool)

(assert (=> b!1373254 (= res!916503 (noDuplicate!2579 acc!866))))

(declare-fun b!1373255 () Bool)

(declare-fun res!916507 () Bool)

(assert (=> b!1373255 (=> (not res!916507) (not e!777923))))

(declare-datatypes ((array!93126 0))(
  ( (array!93127 (arr!44972 (Array (_ BitVec 32) (_ BitVec 64))) (size!45522 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93126)

(declare-fun arrayNoDuplicates!0 (array!93126 (_ BitVec 32) List!32040) Bool)

(assert (=> b!1373255 (= res!916507 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1373256 () Bool)

(declare-fun res!916500 () Bool)

(assert (=> b!1373256 (=> (not res!916500) (not e!777925))))

(declare-fun newAcc!98 () List!32040)

(assert (=> b!1373256 (= res!916500 (not (contains!9722 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!916506 () Bool)

(assert (=> start!116348 (=> (not res!916506) (not e!777925))))

(assert (=> start!116348 (= res!916506 (and (bvslt (size!45522 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45522 a!3861))))))

(assert (=> start!116348 e!777925))

(declare-fun array_inv!34000 (array!93126) Bool)

(assert (=> start!116348 (array_inv!34000 a!3861)))

(assert (=> start!116348 true))

(declare-fun b!1373257 () Bool)

(assert (=> b!1373257 (= e!777923 (bvsge (bvsub (size!45522 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) (bvsub (size!45522 a!3861) from!3239)))))

(declare-fun b!1373258 () Bool)

(declare-fun res!916499 () Bool)

(assert (=> b!1373258 (=> (not res!916499) (not e!777925))))

(declare-fun subseq!1124 (List!32040 List!32040) Bool)

(assert (=> b!1373258 (= res!916499 (subseq!1124 newAcc!98 acc!866))))

(declare-fun b!1373259 () Bool)

(declare-fun res!916502 () Bool)

(assert (=> b!1373259 (=> (not res!916502) (not e!777925))))

(assert (=> b!1373259 (= res!916502 (not (contains!9722 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373260 () Bool)

(assert (=> b!1373260 (= e!777925 e!777923)))

(declare-fun res!916496 () Bool)

(assert (=> b!1373260 (=> (not res!916496) (not e!777923))))

(assert (=> b!1373260 (= res!916496 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45381 0))(
  ( (Unit!45382) )
))
(declare-fun lt!603028 () Unit!45381)

(declare-fun noDuplicateSubseq!311 (List!32040 List!32040) Unit!45381)

(assert (=> b!1373260 (= lt!603028 (noDuplicateSubseq!311 newAcc!98 acc!866))))

(declare-fun b!1373261 () Bool)

(declare-fun res!916505 () Bool)

(assert (=> b!1373261 (=> (not res!916505) (not e!777923))))

(assert (=> b!1373261 (= res!916505 (bvslt from!3239 (size!45522 a!3861)))))

(declare-fun b!1373262 () Bool)

(declare-fun res!916497 () Bool)

(assert (=> b!1373262 (=> (not res!916497) (not e!777923))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1373262 (= res!916497 (not (validKeyInArray!0 (select (arr!44972 a!3861) from!3239))))))

(declare-fun b!1373263 () Bool)

(declare-fun res!916501 () Bool)

(assert (=> b!1373263 (=> (not res!916501) (not e!777925))))

(assert (=> b!1373263 (= res!916501 (not (contains!9722 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!116348 res!916506) b!1373254))

(assert (= (and b!1373254 res!916503) b!1373263))

(assert (= (and b!1373263 res!916501) b!1373252))

(assert (= (and b!1373252 res!916498) b!1373256))

(assert (= (and b!1373256 res!916500) b!1373259))

(assert (= (and b!1373259 res!916502) b!1373258))

(assert (= (and b!1373258 res!916499) b!1373260))

(assert (= (and b!1373260 res!916496) b!1373261))

(assert (= (and b!1373261 res!916505) b!1373262))

(assert (= (and b!1373262 res!916497) b!1373253))

(assert (= (and b!1373253 res!916504) b!1373255))

(assert (= (and b!1373255 res!916507) b!1373257))

(declare-fun m!1256545 () Bool)

(assert (=> start!116348 m!1256545))

(declare-fun m!1256547 () Bool)

(assert (=> b!1373256 m!1256547))

(declare-fun m!1256549 () Bool)

(assert (=> b!1373260 m!1256549))

(declare-fun m!1256551 () Bool)

(assert (=> b!1373260 m!1256551))

(declare-fun m!1256553 () Bool)

(assert (=> b!1373254 m!1256553))

(declare-fun m!1256555 () Bool)

(assert (=> b!1373259 m!1256555))

(declare-fun m!1256557 () Bool)

(assert (=> b!1373255 m!1256557))

(declare-fun m!1256559 () Bool)

(assert (=> b!1373258 m!1256559))

(declare-fun m!1256561 () Bool)

(assert (=> b!1373252 m!1256561))

(declare-fun m!1256563 () Bool)

(assert (=> b!1373262 m!1256563))

(assert (=> b!1373262 m!1256563))

(declare-fun m!1256565 () Bool)

(assert (=> b!1373262 m!1256565))

(declare-fun m!1256567 () Bool)

(assert (=> b!1373263 m!1256567))

(push 1)

(assert (not b!1373256))

(assert (not b!1373262))

(assert (not b!1373258))

(assert (not b!1373255))

(assert (not b!1373260))

(assert (not b!1373254))

(assert (not b!1373252))

(assert (not b!1373263))

(assert (not start!116348))

(assert (not b!1373259))

(check-sat)

(pop 1)

(push 1)

(check-sat)

