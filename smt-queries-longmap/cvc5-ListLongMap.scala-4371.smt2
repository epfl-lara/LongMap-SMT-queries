; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60254 () Bool)

(assert start!60254)

(declare-fun b!675454 () Bool)

(declare-fun e!385393 () Bool)

(declare-datatypes ((List!12884 0))(
  ( (Nil!12881) (Cons!12880 (h!13925 (_ BitVec 64)) (t!19112 List!12884)) )
))
(declare-fun acc!681 () List!12884)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3461 (List!12884 (_ BitVec 64)) Bool)

(assert (=> b!675454 (= e!385393 (contains!3461 acc!681 k!2843))))

(declare-fun b!675455 () Bool)

(declare-fun res!441892 () Bool)

(declare-fun e!385392 () Bool)

(assert (=> b!675455 (=> (not res!441892) (not e!385392))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39301 0))(
  ( (array!39302 (arr!18843 (Array (_ BitVec 32) (_ BitVec 64))) (size!19207 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39301)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!675455 (= res!441892 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19207 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!675456 () Bool)

(declare-fun res!441881 () Bool)

(assert (=> b!675456 (=> (not res!441881) (not e!385392))))

(declare-fun arrayNoDuplicates!0 (array!39301 (_ BitVec 32) List!12884) Bool)

(assert (=> b!675456 (= res!441881 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!675457 () Bool)

(declare-fun e!385396 () Bool)

(assert (=> b!675457 (= e!385396 (contains!3461 acc!681 k!2843))))

(declare-fun b!675458 () Bool)

(declare-fun res!441899 () Bool)

(assert (=> b!675458 (=> (not res!441899) (not e!385392))))

(declare-fun e!385397 () Bool)

(assert (=> b!675458 (= res!441899 e!385397)))

(declare-fun res!441895 () Bool)

(assert (=> b!675458 (=> res!441895 e!385397)))

(assert (=> b!675458 (= res!441895 e!385396)))

(declare-fun res!441894 () Bool)

(assert (=> b!675458 (=> (not res!441894) (not e!385396))))

(assert (=> b!675458 (= res!441894 (bvsgt from!3004 i!1382))))

(declare-fun res!441887 () Bool)

(assert (=> start!60254 (=> (not res!441887) (not e!385392))))

(assert (=> start!60254 (= res!441887 (and (bvslt (size!19207 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19207 a!3626))))))

(assert (=> start!60254 e!385392))

(assert (=> start!60254 true))

(declare-fun array_inv!14639 (array!39301) Bool)

(assert (=> start!60254 (array_inv!14639 a!3626)))

(declare-fun b!675459 () Bool)

(declare-fun res!441897 () Bool)

(assert (=> b!675459 (=> (not res!441897) (not e!385392))))

(assert (=> b!675459 (= res!441897 (not (contains!3461 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675460 () Bool)

(declare-fun res!441886 () Bool)

(assert (=> b!675460 (=> (not res!441886) (not e!385392))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!675460 (= res!441886 (not (validKeyInArray!0 (select (arr!18843 a!3626) from!3004))))))

(declare-fun b!675461 () Bool)

(declare-fun e!385394 () Bool)

(assert (=> b!675461 (= e!385394 (not (contains!3461 acc!681 k!2843)))))

(declare-fun b!675462 () Bool)

(declare-fun res!441889 () Bool)

(assert (=> b!675462 (=> (not res!441889) (not e!385392))))

(assert (=> b!675462 (= res!441889 (not (contains!3461 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675463 () Bool)

(declare-fun e!385391 () Bool)

(assert (=> b!675463 (= e!385391 e!385394)))

(declare-fun res!441896 () Bool)

(assert (=> b!675463 (=> (not res!441896) (not e!385394))))

(assert (=> b!675463 (= res!441896 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675464 () Bool)

(declare-fun res!441885 () Bool)

(assert (=> b!675464 (=> (not res!441885) (not e!385392))))

(declare-fun arrayContainsKey!0 (array!39301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!675464 (= res!441885 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!675465 () Bool)

(assert (=> b!675465 (= e!385392 false)))

(declare-fun lt!312727 () Bool)

(assert (=> b!675465 (= lt!312727 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!675466 () Bool)

(declare-fun res!441883 () Bool)

(assert (=> b!675466 (=> (not res!441883) (not e!385392))))

(assert (=> b!675466 (= res!441883 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12881))))

(declare-fun b!675467 () Bool)

(declare-fun res!441898 () Bool)

(assert (=> b!675467 (=> (not res!441898) (not e!385392))))

(assert (=> b!675467 (= res!441898 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19207 a!3626))))))

(declare-fun b!675468 () Bool)

(declare-fun res!441880 () Bool)

(assert (=> b!675468 (=> (not res!441880) (not e!385392))))

(assert (=> b!675468 (= res!441880 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!675469 () Bool)

(declare-fun res!441888 () Bool)

(assert (=> b!675469 (=> (not res!441888) (not e!385392))))

(assert (=> b!675469 (= res!441888 e!385391)))

(declare-fun res!441884 () Bool)

(assert (=> b!675469 (=> res!441884 e!385391)))

(assert (=> b!675469 (= res!441884 e!385393)))

(declare-fun res!441893 () Bool)

(assert (=> b!675469 (=> (not res!441893) (not e!385393))))

(assert (=> b!675469 (= res!441893 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675470 () Bool)

(declare-fun res!441891 () Bool)

(assert (=> b!675470 (=> (not res!441891) (not e!385392))))

(declare-fun noDuplicate!708 (List!12884) Bool)

(assert (=> b!675470 (= res!441891 (noDuplicate!708 acc!681))))

(declare-fun b!675471 () Bool)

(declare-fun e!385398 () Bool)

(assert (=> b!675471 (= e!385398 (not (contains!3461 acc!681 k!2843)))))

(declare-fun b!675472 () Bool)

(declare-fun res!441882 () Bool)

(assert (=> b!675472 (=> (not res!441882) (not e!385392))))

(assert (=> b!675472 (= res!441882 (validKeyInArray!0 k!2843))))

(declare-fun b!675473 () Bool)

(assert (=> b!675473 (= e!385397 e!385398)))

(declare-fun res!441890 () Bool)

(assert (=> b!675473 (=> (not res!441890) (not e!385398))))

(assert (=> b!675473 (= res!441890 (bvsle from!3004 i!1382))))

(assert (= (and start!60254 res!441887) b!675470))

(assert (= (and b!675470 res!441891) b!675459))

(assert (= (and b!675459 res!441897) b!675462))

(assert (= (and b!675462 res!441889) b!675458))

(assert (= (and b!675458 res!441894) b!675457))

(assert (= (and b!675458 (not res!441895)) b!675473))

(assert (= (and b!675473 res!441890) b!675471))

(assert (= (and b!675458 res!441899) b!675466))

(assert (= (and b!675466 res!441883) b!675456))

(assert (= (and b!675456 res!441881) b!675467))

(assert (= (and b!675467 res!441898) b!675472))

(assert (= (and b!675472 res!441882) b!675464))

(assert (= (and b!675464 res!441885) b!675455))

(assert (= (and b!675455 res!441892) b!675460))

(assert (= (and b!675460 res!441886) b!675468))

(assert (= (and b!675468 res!441880) b!675469))

(assert (= (and b!675469 res!441893) b!675454))

(assert (= (and b!675469 (not res!441884)) b!675463))

(assert (= (and b!675463 res!441896) b!675461))

(assert (= (and b!675469 res!441888) b!675465))

(declare-fun m!642899 () Bool)

(assert (=> b!675460 m!642899))

(assert (=> b!675460 m!642899))

(declare-fun m!642901 () Bool)

(assert (=> b!675460 m!642901))

(declare-fun m!642903 () Bool)

(assert (=> b!675465 m!642903))

(declare-fun m!642905 () Bool)

(assert (=> b!675462 m!642905))

(declare-fun m!642907 () Bool)

(assert (=> b!675470 m!642907))

(declare-fun m!642909 () Bool)

(assert (=> b!675457 m!642909))

(declare-fun m!642911 () Bool)

(assert (=> b!675459 m!642911))

(declare-fun m!642913 () Bool)

(assert (=> b!675464 m!642913))

(declare-fun m!642915 () Bool)

(assert (=> start!60254 m!642915))

(declare-fun m!642917 () Bool)

(assert (=> b!675472 m!642917))

(assert (=> b!675454 m!642909))

(declare-fun m!642919 () Bool)

(assert (=> b!675466 m!642919))

(declare-fun m!642921 () Bool)

(assert (=> b!675456 m!642921))

(assert (=> b!675461 m!642909))

(assert (=> b!675471 m!642909))

(push 1)

(assert (not b!675456))

(assert (not b!675457))

(assert (not b!675471))

(assert (not b!675466))

(assert (not b!675470))

(assert (not b!675459))

(assert (not b!675460))

(assert (not b!675461))

(assert (not b!675464))

(assert (not b!675472))

(assert (not b!675454))

(assert (not b!675465))

(assert (not start!60254))

(assert (not b!675462))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

