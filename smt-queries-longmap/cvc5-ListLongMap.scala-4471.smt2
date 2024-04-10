; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62210 () Bool)

(assert start!62210)

(declare-fun res!460800 () Bool)

(declare-fun e!396228 () Bool)

(assert (=> start!62210 (=> (not res!460800) (not e!396228))))

(declare-datatypes ((array!39967 0))(
  ( (array!39968 (arr!19143 (Array (_ BitVec 32) (_ BitVec 64))) (size!19528 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39967)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!62210 (= res!460800 (and (bvslt (size!19528 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19528 a!3626))))))

(assert (=> start!62210 e!396228))

(assert (=> start!62210 true))

(declare-fun array_inv!14939 (array!39967) Bool)

(assert (=> start!62210 (array_inv!14939 a!3626)))

(declare-fun b!696868 () Bool)

(declare-fun res!460792 () Bool)

(assert (=> b!696868 (=> (not res!460792) (not e!396228))))

(declare-datatypes ((List!13184 0))(
  ( (Nil!13181) (Cons!13180 (h!14225 (_ BitVec 64)) (t!19466 List!13184)) )
))
(declare-fun arrayNoDuplicates!0 (array!39967 (_ BitVec 32) List!13184) Bool)

(assert (=> b!696868 (= res!460792 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13181))))

(declare-fun b!696869 () Bool)

(declare-fun res!460787 () Bool)

(assert (=> b!696869 (=> (not res!460787) (not e!396228))))

(declare-fun e!396227 () Bool)

(assert (=> b!696869 (= res!460787 e!396227)))

(declare-fun res!460795 () Bool)

(assert (=> b!696869 (=> res!460795 e!396227)))

(declare-fun e!396225 () Bool)

(assert (=> b!696869 (= res!460795 e!396225)))

(declare-fun res!460798 () Bool)

(assert (=> b!696869 (=> (not res!460798) (not e!396225))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!696869 (= res!460798 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!696870 () Bool)

(declare-fun res!460788 () Bool)

(assert (=> b!696870 (=> (not res!460788) (not e!396228))))

(declare-fun acc!681 () List!13184)

(declare-fun noDuplicate!1008 (List!13184) Bool)

(assert (=> b!696870 (= res!460788 (noDuplicate!1008 acc!681))))

(declare-fun b!696871 () Bool)

(declare-fun e!396224 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3761 (List!13184 (_ BitVec 64)) Bool)

(assert (=> b!696871 (= e!396224 (not (contains!3761 acc!681 k!2843)))))

(declare-fun b!696872 () Bool)

(declare-fun res!460801 () Bool)

(assert (=> b!696872 (=> (not res!460801) (not e!396228))))

(assert (=> b!696872 (= res!460801 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19528 a!3626))))))

(declare-fun b!696873 () Bool)

(declare-fun res!460790 () Bool)

(assert (=> b!696873 (=> (not res!460790) (not e!396228))))

(declare-fun arrayContainsKey!0 (array!39967 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!696873 (= res!460790 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!696874 () Bool)

(declare-fun e!396229 () Bool)

(assert (=> b!696874 (= e!396229 (contains!3761 acc!681 k!2843))))

(declare-fun b!696875 () Bool)

(declare-fun res!460789 () Bool)

(assert (=> b!696875 (=> (not res!460789) (not e!396228))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!696875 (= res!460789 (not (validKeyInArray!0 (select (arr!19143 a!3626) from!3004))))))

(declare-fun b!696876 () Bool)

(declare-fun res!460805 () Bool)

(assert (=> b!696876 (=> (not res!460805) (not e!396228))))

(assert (=> b!696876 (= res!460805 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!696877 () Bool)

(declare-fun res!460796 () Bool)

(assert (=> b!696877 (=> (not res!460796) (not e!396228))))

(assert (=> b!696877 (= res!460796 (validKeyInArray!0 k!2843))))

(declare-fun b!696878 () Bool)

(declare-fun res!460804 () Bool)

(assert (=> b!696878 (=> (not res!460804) (not e!396228))))

(assert (=> b!696878 (= res!460804 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19528 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!696879 () Bool)

(declare-fun res!460786 () Bool)

(assert (=> b!696879 (=> (not res!460786) (not e!396228))))

(assert (=> b!696879 (= res!460786 (not (contains!3761 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!696880 () Bool)

(declare-fun e!396230 () Bool)

(assert (=> b!696880 (= e!396230 e!396224)))

(declare-fun res!460793 () Bool)

(assert (=> b!696880 (=> (not res!460793) (not e!396224))))

(assert (=> b!696880 (= res!460793 (bvsle from!3004 i!1382))))

(declare-fun b!696881 () Bool)

(declare-fun e!396231 () Bool)

(assert (=> b!696881 (= e!396231 (not (contains!3761 acc!681 k!2843)))))

(declare-fun b!696882 () Bool)

(declare-fun res!460791 () Bool)

(assert (=> b!696882 (=> (not res!460791) (not e!396228))))

(assert (=> b!696882 (= res!460791 e!396230)))

(declare-fun res!460803 () Bool)

(assert (=> b!696882 (=> res!460803 e!396230)))

(assert (=> b!696882 (= res!460803 e!396229)))

(declare-fun res!460799 () Bool)

(assert (=> b!696882 (=> (not res!460799) (not e!396229))))

(assert (=> b!696882 (= res!460799 (bvsgt from!3004 i!1382))))

(declare-fun b!696883 () Bool)

(assert (=> b!696883 (= e!396225 (contains!3761 acc!681 k!2843))))

(declare-fun b!696884 () Bool)

(declare-fun res!460797 () Bool)

(assert (=> b!696884 (=> (not res!460797) (not e!396228))))

(assert (=> b!696884 (= res!460797 (not (contains!3761 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!696885 () Bool)

(assert (=> b!696885 (= e!396228 false)))

(declare-fun lt!317131 () Bool)

(assert (=> b!696885 (= lt!317131 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!696886 () Bool)

(assert (=> b!696886 (= e!396227 e!396231)))

(declare-fun res!460794 () Bool)

(assert (=> b!696886 (=> (not res!460794) (not e!396231))))

(assert (=> b!696886 (= res!460794 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!696887 () Bool)

(declare-fun res!460802 () Bool)

(assert (=> b!696887 (=> (not res!460802) (not e!396228))))

(assert (=> b!696887 (= res!460802 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!62210 res!460800) b!696870))

(assert (= (and b!696870 res!460788) b!696884))

(assert (= (and b!696884 res!460797) b!696879))

(assert (= (and b!696879 res!460786) b!696882))

(assert (= (and b!696882 res!460799) b!696874))

(assert (= (and b!696882 (not res!460803)) b!696880))

(assert (= (and b!696880 res!460793) b!696871))

(assert (= (and b!696882 res!460791) b!696868))

(assert (= (and b!696868 res!460792) b!696887))

(assert (= (and b!696887 res!460802) b!696872))

(assert (= (and b!696872 res!460801) b!696877))

(assert (= (and b!696877 res!460796) b!696873))

(assert (= (and b!696873 res!460790) b!696878))

(assert (= (and b!696878 res!460804) b!696875))

(assert (= (and b!696875 res!460789) b!696876))

(assert (= (and b!696876 res!460805) b!696869))

(assert (= (and b!696869 res!460798) b!696883))

(assert (= (and b!696869 (not res!460795)) b!696886))

(assert (= (and b!696886 res!460794) b!696881))

(assert (= (and b!696869 res!460787) b!696885))

(declare-fun m!657611 () Bool)

(assert (=> b!696874 m!657611))

(declare-fun m!657613 () Bool)

(assert (=> b!696879 m!657613))

(declare-fun m!657615 () Bool)

(assert (=> b!696887 m!657615))

(declare-fun m!657617 () Bool)

(assert (=> b!696884 m!657617))

(declare-fun m!657619 () Bool)

(assert (=> b!696868 m!657619))

(assert (=> b!696881 m!657611))

(declare-fun m!657621 () Bool)

(assert (=> b!696885 m!657621))

(declare-fun m!657623 () Bool)

(assert (=> b!696873 m!657623))

(assert (=> b!696871 m!657611))

(assert (=> b!696883 m!657611))

(declare-fun m!657625 () Bool)

(assert (=> start!62210 m!657625))

(declare-fun m!657627 () Bool)

(assert (=> b!696870 m!657627))

(declare-fun m!657629 () Bool)

(assert (=> b!696875 m!657629))

(assert (=> b!696875 m!657629))

(declare-fun m!657631 () Bool)

(assert (=> b!696875 m!657631))

(declare-fun m!657633 () Bool)

(assert (=> b!696877 m!657633))

(push 1)

(assert (not b!696883))

(assert (not b!696887))

(assert (not b!696874))

(assert (not b!696879))

(assert (not b!696868))

(assert (not b!696877))

(assert (not start!62210))

(assert (not b!696873))

(assert (not b!696881))

(assert (not b!696875))

(assert (not b!696884))

(assert (not b!696870))

(assert (not b!696871))

(assert (not b!696885))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

