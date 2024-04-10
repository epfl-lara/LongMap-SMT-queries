; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115626 () Bool)

(assert start!115626)

(declare-fun res!910925 () Bool)

(declare-fun e!774945 () Bool)

(assert (=> start!115626 (=> (not res!910925) (not e!774945))))

(declare-datatypes ((array!92857 0))(
  ( (array!92858 (arr!44854 (Array (_ BitVec 32) (_ BitVec 64))) (size!45404 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92857)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115626 (= res!910925 (and (bvslt (size!45404 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45404 a!3861))))))

(assert (=> start!115626 e!774945))

(declare-fun array_inv!33882 (array!92857) Bool)

(assert (=> start!115626 (array_inv!33882 a!3861)))

(assert (=> start!115626 true))

(declare-fun b!1367398 () Bool)

(declare-fun res!910924 () Bool)

(assert (=> b!1367398 (=> (not res!910924) (not e!774945))))

(declare-datatypes ((List!31922 0))(
  ( (Nil!31919) (Cons!31918 (h!33127 (_ BitVec 64)) (t!46616 List!31922)) )
))
(declare-fun newAcc!98 () List!31922)

(declare-fun acc!866 () List!31922)

(declare-fun subseq!1006 (List!31922 List!31922) Bool)

(assert (=> b!1367398 (= res!910924 (subseq!1006 newAcc!98 acc!866))))

(declare-fun b!1367399 () Bool)

(declare-fun res!910933 () Bool)

(declare-fun e!774944 () Bool)

(assert (=> b!1367399 (=> (not res!910933) (not e!774944))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1367399 (= res!910933 (validKeyInArray!0 (select (arr!44854 a!3861) from!3239)))))

(declare-fun b!1367400 () Bool)

(declare-fun res!910927 () Bool)

(assert (=> b!1367400 (=> (not res!910927) (not e!774945))))

(declare-fun contains!9604 (List!31922 (_ BitVec 64)) Bool)

(assert (=> b!1367400 (= res!910927 (not (contains!9604 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367401 () Bool)

(declare-fun res!910926 () Bool)

(assert (=> b!1367401 (=> (not res!910926) (not e!774945))))

(assert (=> b!1367401 (= res!910926 (not (contains!9604 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367402 () Bool)

(declare-fun res!910930 () Bool)

(assert (=> b!1367402 (=> (not res!910930) (not e!774944))))

(assert (=> b!1367402 (= res!910930 (bvslt from!3239 (size!45404 a!3861)))))

(declare-fun b!1367403 () Bool)

(declare-fun res!910931 () Bool)

(assert (=> b!1367403 (=> (not res!910931) (not e!774945))))

(declare-fun noDuplicate!2461 (List!31922) Bool)

(assert (=> b!1367403 (= res!910931 (noDuplicate!2461 acc!866))))

(declare-fun b!1367404 () Bool)

(assert (=> b!1367404 (= e!774945 e!774944)))

(declare-fun res!910929 () Bool)

(assert (=> b!1367404 (=> (not res!910929) (not e!774944))))

(declare-fun arrayNoDuplicates!0 (array!92857 (_ BitVec 32) List!31922) Bool)

(assert (=> b!1367404 (= res!910929 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45145 0))(
  ( (Unit!45146) )
))
(declare-fun lt!601885 () Unit!45145)

(declare-fun noDuplicateSubseq!193 (List!31922 List!31922) Unit!45145)

(assert (=> b!1367404 (= lt!601885 (noDuplicateSubseq!193 newAcc!98 acc!866))))

(declare-fun b!1367405 () Bool)

(declare-fun res!910928 () Bool)

(assert (=> b!1367405 (=> (not res!910928) (not e!774945))))

(assert (=> b!1367405 (= res!910928 (not (contains!9604 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367406 () Bool)

(assert (=> b!1367406 (= e!774944 false)))

(declare-fun lt!601884 () Bool)

(assert (=> b!1367406 (= lt!601884 (contains!9604 acc!866 (select (arr!44854 a!3861) from!3239)))))

(declare-fun b!1367407 () Bool)

(declare-fun res!910932 () Bool)

(assert (=> b!1367407 (=> (not res!910932) (not e!774945))))

(assert (=> b!1367407 (= res!910932 (not (contains!9604 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115626 res!910925) b!1367403))

(assert (= (and b!1367403 res!910931) b!1367405))

(assert (= (and b!1367405 res!910928) b!1367400))

(assert (= (and b!1367400 res!910927) b!1367401))

(assert (= (and b!1367401 res!910926) b!1367407))

(assert (= (and b!1367407 res!910932) b!1367398))

(assert (= (and b!1367398 res!910924) b!1367404))

(assert (= (and b!1367404 res!910929) b!1367402))

(assert (= (and b!1367402 res!910930) b!1367399))

(assert (= (and b!1367399 res!910933) b!1367406))

(declare-fun m!1251631 () Bool)

(assert (=> b!1367405 m!1251631))

(declare-fun m!1251633 () Bool)

(assert (=> b!1367401 m!1251633))

(declare-fun m!1251635 () Bool)

(assert (=> start!115626 m!1251635))

(declare-fun m!1251637 () Bool)

(assert (=> b!1367407 m!1251637))

(declare-fun m!1251639 () Bool)

(assert (=> b!1367399 m!1251639))

(assert (=> b!1367399 m!1251639))

(declare-fun m!1251641 () Bool)

(assert (=> b!1367399 m!1251641))

(declare-fun m!1251643 () Bool)

(assert (=> b!1367403 m!1251643))

(declare-fun m!1251645 () Bool)

(assert (=> b!1367400 m!1251645))

(declare-fun m!1251647 () Bool)

(assert (=> b!1367398 m!1251647))

(assert (=> b!1367406 m!1251639))

(assert (=> b!1367406 m!1251639))

(declare-fun m!1251649 () Bool)

(assert (=> b!1367406 m!1251649))

(declare-fun m!1251651 () Bool)

(assert (=> b!1367404 m!1251651))

(declare-fun m!1251653 () Bool)

(assert (=> b!1367404 m!1251653))

(push 1)

(assert (not b!1367400))

(assert (not b!1367398))

(assert (not b!1367401))

