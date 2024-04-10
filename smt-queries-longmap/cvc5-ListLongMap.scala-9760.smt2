; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115682 () Bool)

(assert start!115682)

(declare-fun b!1367784 () Bool)

(declare-fun res!911294 () Bool)

(declare-fun e!775154 () Bool)

(assert (=> b!1367784 (=> (not res!911294) (not e!775154))))

(declare-datatypes ((List!31929 0))(
  ( (Nil!31926) (Cons!31925 (h!33134 (_ BitVec 64)) (t!46623 List!31929)) )
))
(declare-fun newAcc!98 () List!31929)

(declare-fun contains!9611 (List!31929 (_ BitVec 64)) Bool)

(assert (=> b!1367784 (= res!911294 (not (contains!9611 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367785 () Bool)

(declare-fun res!911300 () Bool)

(assert (=> b!1367785 (=> (not res!911300) (not e!775154))))

(declare-fun acc!866 () List!31929)

(declare-fun noDuplicate!2468 (List!31929) Bool)

(assert (=> b!1367785 (= res!911300 (noDuplicate!2468 acc!866))))

(declare-fun b!1367786 () Bool)

(declare-fun res!911301 () Bool)

(assert (=> b!1367786 (=> (not res!911301) (not e!775154))))

(declare-fun subseq!1013 (List!31929 List!31929) Bool)

(assert (=> b!1367786 (= res!911301 (subseq!1013 newAcc!98 acc!866))))

(declare-fun b!1367788 () Bool)

(declare-fun res!911295 () Bool)

(declare-fun e!775155 () Bool)

(assert (=> b!1367788 (=> (not res!911295) (not e!775155))))

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1367788 (= res!911295 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1367789 () Bool)

(declare-fun res!911302 () Bool)

(assert (=> b!1367789 (=> (not res!911302) (not e!775155))))

(declare-datatypes ((array!92874 0))(
  ( (array!92875 (arr!44861 (Array (_ BitVec 32) (_ BitVec 64))) (size!45411 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92874)

(assert (=> b!1367789 (= res!911302 (bvslt from!3239 (size!45411 a!3861)))))

(declare-fun b!1367790 () Bool)

(declare-fun res!911298 () Bool)

(assert (=> b!1367790 (=> (not res!911298) (not e!775154))))

(assert (=> b!1367790 (= res!911298 (not (contains!9611 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367791 () Bool)

(assert (=> b!1367791 (= e!775155 false)))

(declare-fun lt!601947 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92874 (_ BitVec 32) List!31929) Bool)

(assert (=> b!1367791 (= lt!601947 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1367792 () Bool)

(declare-fun res!911292 () Bool)

(assert (=> b!1367792 (=> (not res!911292) (not e!775155))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1367792 (= res!911292 (not (validKeyInArray!0 (select (arr!44861 a!3861) from!3239))))))

(declare-fun b!1367793 () Bool)

(declare-fun res!911296 () Bool)

(assert (=> b!1367793 (=> (not res!911296) (not e!775154))))

(assert (=> b!1367793 (= res!911296 (not (contains!9611 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367794 () Bool)

(assert (=> b!1367794 (= e!775154 e!775155)))

(declare-fun res!911297 () Bool)

(assert (=> b!1367794 (=> (not res!911297) (not e!775155))))

(assert (=> b!1367794 (= res!911297 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45159 0))(
  ( (Unit!45160) )
))
(declare-fun lt!601948 () Unit!45159)

(declare-fun noDuplicateSubseq!200 (List!31929 List!31929) Unit!45159)

(assert (=> b!1367794 (= lt!601948 (noDuplicateSubseq!200 newAcc!98 acc!866))))

(declare-fun b!1367787 () Bool)

(declare-fun res!911293 () Bool)

(assert (=> b!1367787 (=> (not res!911293) (not e!775154))))

(assert (=> b!1367787 (= res!911293 (not (contains!9611 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!911299 () Bool)

(assert (=> start!115682 (=> (not res!911299) (not e!775154))))

(assert (=> start!115682 (= res!911299 (and (bvslt (size!45411 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45411 a!3861))))))

(assert (=> start!115682 e!775154))

(declare-fun array_inv!33889 (array!92874) Bool)

(assert (=> start!115682 (array_inv!33889 a!3861)))

(assert (=> start!115682 true))

(assert (= (and start!115682 res!911299) b!1367785))

(assert (= (and b!1367785 res!911300) b!1367793))

(assert (= (and b!1367793 res!911296) b!1367790))

(assert (= (and b!1367790 res!911298) b!1367784))

(assert (= (and b!1367784 res!911294) b!1367787))

(assert (= (and b!1367787 res!911293) b!1367786))

(assert (= (and b!1367786 res!911301) b!1367794))

(assert (= (and b!1367794 res!911297) b!1367789))

(assert (= (and b!1367789 res!911302) b!1367792))

(assert (= (and b!1367792 res!911292) b!1367788))

(assert (= (and b!1367788 res!911295) b!1367791))

(declare-fun m!1251931 () Bool)

(assert (=> b!1367794 m!1251931))

(declare-fun m!1251933 () Bool)

(assert (=> b!1367794 m!1251933))

(declare-fun m!1251935 () Bool)

(assert (=> b!1367786 m!1251935))

(declare-fun m!1251937 () Bool)

(assert (=> b!1367784 m!1251937))

(declare-fun m!1251939 () Bool)

(assert (=> b!1367787 m!1251939))

(declare-fun m!1251941 () Bool)

(assert (=> b!1367792 m!1251941))

(assert (=> b!1367792 m!1251941))

(declare-fun m!1251943 () Bool)

(assert (=> b!1367792 m!1251943))

(declare-fun m!1251945 () Bool)

(assert (=> b!1367791 m!1251945))

(declare-fun m!1251947 () Bool)

(assert (=> b!1367793 m!1251947))

(declare-fun m!1251949 () Bool)

(assert (=> start!115682 m!1251949))

(declare-fun m!1251951 () Bool)

(assert (=> b!1367790 m!1251951))

(declare-fun m!1251953 () Bool)

(assert (=> b!1367785 m!1251953))

(push 1)

