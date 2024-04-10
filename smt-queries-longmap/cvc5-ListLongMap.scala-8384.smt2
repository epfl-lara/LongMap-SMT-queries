; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101980 () Bool)

(assert start!101980)

(declare-fun b!1227793 () Bool)

(declare-fun res!816417 () Bool)

(declare-fun e!697066 () Bool)

(assert (=> b!1227793 (=> (not res!816417) (not e!697066))))

(declare-datatypes ((List!27022 0))(
  ( (Nil!27019) (Cons!27018 (h!28227 (_ BitVec 64)) (t!40485 List!27022)) )
))
(declare-fun acc!823 () List!27022)

(declare-fun noDuplicate!1681 (List!27022) Bool)

(assert (=> b!1227793 (= res!816417 (noDuplicate!1681 acc!823))))

(declare-fun b!1227795 () Bool)

(declare-fun res!816406 () Bool)

(assert (=> b!1227795 (=> (not res!816406) (not e!697066))))

(declare-datatypes ((array!79253 0))(
  ( (array!79254 (arr!38249 (Array (_ BitVec 32) (_ BitVec 64))) (size!38785 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79253)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79253 (_ BitVec 32) List!27022) Bool)

(assert (=> b!1227795 (= res!816406 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1227796 () Bool)

(declare-fun res!816412 () Bool)

(assert (=> b!1227796 (=> (not res!816412) (not e!697066))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227796 (= res!816412 (validKeyInArray!0 k!2913))))

(declare-fun b!1227797 () Bool)

(declare-fun res!816413 () Bool)

(assert (=> b!1227797 (=> (not res!816413) (not e!697066))))

(assert (=> b!1227797 (= res!816413 (validKeyInArray!0 (select (arr!38249 a!3806) from!3184)))))

(declare-fun b!1227798 () Bool)

(declare-fun res!816414 () Bool)

(declare-fun e!697067 () Bool)

(assert (=> b!1227798 (=> res!816414 e!697067)))

(declare-fun contains!7084 (List!27022 (_ BitVec 64)) Bool)

(assert (=> b!1227798 (= res!816414 (contains!7084 Nil!27019 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227799 () Bool)

(assert (=> b!1227799 (= e!697066 (not e!697067))))

(declare-fun res!816416 () Bool)

(assert (=> b!1227799 (=> res!816416 e!697067)))

(assert (=> b!1227799 (= res!816416 (bvsgt from!3184 (size!38785 a!3806)))))

(assert (=> b!1227799 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27018 (select (arr!38249 a!3806) from!3184) acc!823))))

(declare-fun b!1227794 () Bool)

(declare-fun res!816415 () Bool)

(assert (=> b!1227794 (=> (not res!816415) (not e!697066))))

(assert (=> b!1227794 (= res!816415 (not (contains!7084 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!816409 () Bool)

(assert (=> start!101980 (=> (not res!816409) (not e!697066))))

(assert (=> start!101980 (= res!816409 (bvslt (size!38785 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101980 e!697066))

(declare-fun array_inv!29097 (array!79253) Bool)

(assert (=> start!101980 (array_inv!29097 a!3806)))

(assert (=> start!101980 true))

(declare-fun b!1227800 () Bool)

(declare-fun res!816408 () Bool)

(assert (=> b!1227800 (=> (not res!816408) (not e!697066))))

(declare-fun arrayContainsKey!0 (array!79253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1227800 (= res!816408 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1227801 () Bool)

(declare-fun res!816411 () Bool)

(assert (=> b!1227801 (=> (not res!816411) (not e!697066))))

(assert (=> b!1227801 (= res!816411 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38785 a!3806)) (bvslt from!3184 (size!38785 a!3806))))))

(declare-fun b!1227802 () Bool)

(declare-fun res!816407 () Bool)

(assert (=> b!1227802 (=> res!816407 e!697067)))

(assert (=> b!1227802 (= res!816407 (contains!7084 Nil!27019 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227803 () Bool)

(assert (=> b!1227803 (= e!697067 true)))

(declare-datatypes ((Unit!40664 0))(
  ( (Unit!40665) )
))
(declare-fun lt!558942 () Unit!40664)

(declare-fun noDuplicateSubseq!41 (List!27022 List!27022) Unit!40664)

(assert (=> b!1227803 (= lt!558942 (noDuplicateSubseq!41 Nil!27019 acc!823))))

(declare-fun b!1227804 () Bool)

(declare-fun res!816405 () Bool)

(assert (=> b!1227804 (=> (not res!816405) (not e!697066))))

(assert (=> b!1227804 (= res!816405 (not (contains!7084 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227805 () Bool)

(declare-fun res!816410 () Bool)

(assert (=> b!1227805 (=> res!816410 e!697067)))

(declare-fun subseq!488 (List!27022 List!27022) Bool)

(assert (=> b!1227805 (= res!816410 (not (subseq!488 Nil!27019 acc!823)))))

(assert (= (and start!101980 res!816409) b!1227796))

(assert (= (and b!1227796 res!816412) b!1227801))

(assert (= (and b!1227801 res!816411) b!1227793))

(assert (= (and b!1227793 res!816417) b!1227804))

(assert (= (and b!1227804 res!816405) b!1227794))

(assert (= (and b!1227794 res!816415) b!1227800))

(assert (= (and b!1227800 res!816408) b!1227795))

(assert (= (and b!1227795 res!816406) b!1227797))

(assert (= (and b!1227797 res!816413) b!1227799))

(assert (= (and b!1227799 (not res!816416)) b!1227802))

(assert (= (and b!1227802 (not res!816407)) b!1227798))

(assert (= (and b!1227798 (not res!816414)) b!1227805))

(assert (= (and b!1227805 (not res!816410)) b!1227803))

(declare-fun m!1132479 () Bool)

(assert (=> b!1227804 m!1132479))

(declare-fun m!1132481 () Bool)

(assert (=> b!1227798 m!1132481))

(declare-fun m!1132483 () Bool)

(assert (=> b!1227797 m!1132483))

(assert (=> b!1227797 m!1132483))

(declare-fun m!1132485 () Bool)

(assert (=> b!1227797 m!1132485))

(declare-fun m!1132487 () Bool)

(assert (=> b!1227793 m!1132487))

(declare-fun m!1132489 () Bool)

(assert (=> start!101980 m!1132489))

(assert (=> b!1227799 m!1132483))

(declare-fun m!1132491 () Bool)

(assert (=> b!1227799 m!1132491))

(declare-fun m!1132493 () Bool)

(assert (=> b!1227800 m!1132493))

(declare-fun m!1132495 () Bool)

(assert (=> b!1227795 m!1132495))

(declare-fun m!1132497 () Bool)

(assert (=> b!1227805 m!1132497))

(declare-fun m!1132499 () Bool)

(assert (=> b!1227794 m!1132499))

(declare-fun m!1132501 () Bool)

(assert (=> b!1227803 m!1132501))

(declare-fun m!1132503 () Bool)

(assert (=> b!1227796 m!1132503))

(declare-fun m!1132505 () Bool)

(assert (=> b!1227802 m!1132505))

(push 1)

(assert (not b!1227805))

(assert (not b!1227794))

(assert (not b!1227795))

(assert (not b!1227804))

(assert (not start!101980))

(assert (not b!1227800))

(assert (not b!1227799))

(assert (not b!1227797))

(assert (not b!1227803))

(assert (not b!1227793))

(assert (not b!1227798))

(assert (not b!1227796))

(assert (not b!1227802))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

