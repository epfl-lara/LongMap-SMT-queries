; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59796 () Bool)

(assert start!59796)

(declare-fun b!660467 () Bool)

(declare-fun res!428692 () Bool)

(declare-fun e!379492 () Bool)

(assert (=> b!660467 (=> (not res!428692) (not e!379492))))

(declare-datatypes ((array!38854 0))(
  ( (array!38855 (arr!18619 (Array (_ BitVec 32) (_ BitVec 64))) (size!18984 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38854)

(declare-datatypes ((List!12699 0))(
  ( (Nil!12696) (Cons!12695 (h!13740 (_ BitVec 64)) (t!18918 List!12699)) )
))
(declare-fun arrayNoDuplicates!0 (array!38854 (_ BitVec 32) List!12699) Bool)

(assert (=> b!660467 (= res!428692 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12696))))

(declare-fun b!660468 () Bool)

(declare-fun res!428697 () Bool)

(assert (=> b!660468 (=> (not res!428697) (not e!379492))))

(declare-fun acc!681 () List!12699)

(declare-fun noDuplicate!490 (List!12699) Bool)

(assert (=> b!660468 (= res!428697 (noDuplicate!490 acc!681))))

(declare-fun b!660469 () Bool)

(declare-fun res!428694 () Bool)

(assert (=> b!660469 (=> (not res!428694) (not e!379492))))

(declare-fun e!379495 () Bool)

(assert (=> b!660469 (= res!428694 e!379495)))

(declare-fun res!428693 () Bool)

(assert (=> b!660469 (=> res!428693 e!379495)))

(declare-fun e!379494 () Bool)

(assert (=> b!660469 (= res!428693 e!379494)))

(declare-fun res!428690 () Bool)

(assert (=> b!660469 (=> (not res!428690) (not e!379494))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660469 (= res!428690 (bvsgt from!3004 i!1382))))

(declare-fun b!660470 () Bool)

(declare-fun res!428696 () Bool)

(assert (=> b!660470 (=> (not res!428696) (not e!379492))))

(declare-fun contains!3221 (List!12699 (_ BitVec 64)) Bool)

(assert (=> b!660470 (= res!428696 (not (contains!3221 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660471 () Bool)

(declare-fun e!379496 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!660471 (= e!379496 (not (contains!3221 acc!681 k!2843)))))

(declare-fun b!660472 () Bool)

(assert (=> b!660472 (= e!379495 e!379496)))

(declare-fun res!428695 () Bool)

(assert (=> b!660472 (=> (not res!428695) (not e!379496))))

(assert (=> b!660472 (= res!428695 (bvsle from!3004 i!1382))))

(declare-fun b!660473 () Bool)

(assert (=> b!660473 (= e!379494 (contains!3221 acc!681 k!2843))))

(declare-fun b!660474 () Bool)

(assert (=> b!660474 (= e!379492 false)))

(declare-fun lt!308553 () Bool)

(assert (=> b!660474 (= lt!308553 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!660466 () Bool)

(declare-fun res!428691 () Bool)

(assert (=> b!660466 (=> (not res!428691) (not e!379492))))

(assert (=> b!660466 (= res!428691 (not (contains!3221 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!428698 () Bool)

(assert (=> start!59796 (=> (not res!428698) (not e!379492))))

(assert (=> start!59796 (= res!428698 (and (bvslt (size!18984 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18984 a!3626))))))

(assert (=> start!59796 e!379492))

(assert (=> start!59796 true))

(declare-fun array_inv!14502 (array!38854) Bool)

(assert (=> start!59796 (array_inv!14502 a!3626)))

(assert (= (and start!59796 res!428698) b!660468))

(assert (= (and b!660468 res!428697) b!660470))

(assert (= (and b!660470 res!428696) b!660466))

(assert (= (and b!660466 res!428691) b!660469))

(assert (= (and b!660469 res!428690) b!660473))

(assert (= (and b!660469 (not res!428693)) b!660472))

(assert (= (and b!660472 res!428695) b!660471))

(assert (= (and b!660469 res!428694) b!660467))

(assert (= (and b!660467 res!428692) b!660474))

(declare-fun m!632497 () Bool)

(assert (=> b!660471 m!632497))

(declare-fun m!632499 () Bool)

(assert (=> b!660474 m!632499))

(declare-fun m!632501 () Bool)

(assert (=> start!59796 m!632501))

(declare-fun m!632503 () Bool)

(assert (=> b!660466 m!632503))

(declare-fun m!632505 () Bool)

(assert (=> b!660470 m!632505))

(declare-fun m!632507 () Bool)

(assert (=> b!660468 m!632507))

(assert (=> b!660473 m!632497))

(declare-fun m!632509 () Bool)

(assert (=> b!660467 m!632509))

(push 1)

(assert (not b!660468))

(assert (not b!660474))

(assert (not b!660467))

(assert (not b!660473))

(assert (not b!660466))

(assert (not b!660470))

(assert (not b!660471))

(assert (not start!59796))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

