; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59798 () Bool)

(assert start!59798)

(declare-fun b!660627 () Bool)

(declare-fun res!428698 () Bool)

(declare-fun e!379611 () Bool)

(assert (=> b!660627 (=> (not res!428698) (not e!379611))))

(declare-datatypes ((List!12656 0))(
  ( (Nil!12653) (Cons!12652 (h!13697 (_ BitVec 64)) (t!18884 List!12656)) )
))
(declare-fun acc!681 () List!12656)

(declare-fun contains!3233 (List!12656 (_ BitVec 64)) Bool)

(assert (=> b!660627 (= res!428698 (not (contains!3233 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660628 () Bool)

(declare-fun e!379608 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!660628 (= e!379608 (contains!3233 acc!681 k!2843))))

(declare-fun res!428699 () Bool)

(assert (=> start!59798 (=> (not res!428699) (not e!379611))))

(declare-datatypes ((array!38845 0))(
  ( (array!38846 (arr!18615 (Array (_ BitVec 32) (_ BitVec 64))) (size!18979 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38845)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59798 (= res!428699 (and (bvslt (size!18979 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18979 a!3626))))))

(assert (=> start!59798 e!379611))

(assert (=> start!59798 true))

(declare-fun array_inv!14411 (array!38845) Bool)

(assert (=> start!59798 (array_inv!14411 a!3626)))

(declare-fun b!660629 () Bool)

(declare-fun res!428694 () Bool)

(assert (=> b!660629 (=> (not res!428694) (not e!379611))))

(declare-fun arrayNoDuplicates!0 (array!38845 (_ BitVec 32) List!12656) Bool)

(assert (=> b!660629 (= res!428694 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12653))))

(declare-fun b!660630 () Bool)

(declare-fun res!428696 () Bool)

(assert (=> b!660630 (=> (not res!428696) (not e!379611))))

(assert (=> b!660630 (= res!428696 (not (contains!3233 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660631 () Bool)

(declare-fun e!379610 () Bool)

(assert (=> b!660631 (= e!379610 (not (contains!3233 acc!681 k!2843)))))

(declare-fun b!660632 () Bool)

(declare-fun e!379607 () Bool)

(assert (=> b!660632 (= e!379607 e!379610)))

(declare-fun res!428692 () Bool)

(assert (=> b!660632 (=> (not res!428692) (not e!379610))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660632 (= res!428692 (bvsle from!3004 i!1382))))

(declare-fun b!660633 () Bool)

(declare-fun res!428693 () Bool)

(assert (=> b!660633 (=> (not res!428693) (not e!379611))))

(declare-fun noDuplicate!480 (List!12656) Bool)

(assert (=> b!660633 (= res!428693 (noDuplicate!480 acc!681))))

(declare-fun b!660634 () Bool)

(declare-fun res!428697 () Bool)

(assert (=> b!660634 (=> (not res!428697) (not e!379611))))

(assert (=> b!660634 (= res!428697 e!379607)))

(declare-fun res!428691 () Bool)

(assert (=> b!660634 (=> res!428691 e!379607)))

(assert (=> b!660634 (= res!428691 e!379608)))

(declare-fun res!428695 () Bool)

(assert (=> b!660634 (=> (not res!428695) (not e!379608))))

(assert (=> b!660634 (= res!428695 (bvsgt from!3004 i!1382))))

(declare-fun b!660635 () Bool)

(assert (=> b!660635 (= e!379611 false)))

(declare-fun lt!308794 () Bool)

(assert (=> b!660635 (= lt!308794 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!59798 res!428699) b!660633))

(assert (= (and b!660633 res!428693) b!660630))

(assert (= (and b!660630 res!428696) b!660627))

(assert (= (and b!660627 res!428698) b!660634))

(assert (= (and b!660634 res!428695) b!660628))

(assert (= (and b!660634 (not res!428691)) b!660632))

(assert (= (and b!660632 res!428692) b!660631))

(assert (= (and b!660634 res!428697) b!660629))

(assert (= (and b!660629 res!428694) b!660635))

(declare-fun m!633209 () Bool)

(assert (=> b!660627 m!633209))

(declare-fun m!633211 () Bool)

(assert (=> b!660629 m!633211))

(declare-fun m!633213 () Bool)

(assert (=> start!59798 m!633213))

(declare-fun m!633215 () Bool)

(assert (=> b!660631 m!633215))

(declare-fun m!633217 () Bool)

(assert (=> b!660630 m!633217))

(assert (=> b!660628 m!633215))

(declare-fun m!633219 () Bool)

(assert (=> b!660633 m!633219))

(declare-fun m!633221 () Bool)

(assert (=> b!660635 m!633221))

(push 1)

(assert (not start!59798))

(assert (not b!660633))

(assert (not b!660628))

(assert (not b!660629))

(assert (not b!660635))

(assert (not b!660631))

(assert (not b!660627))

(assert (not b!660630))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

