; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59784 () Bool)

(assert start!59784)

(declare-fun b!660411 () Bool)

(declare-fun res!428478 () Bool)

(declare-fun e!379502 () Bool)

(assert (=> b!660411 (=> (not res!428478) (not e!379502))))

(declare-datatypes ((array!38831 0))(
  ( (array!38832 (arr!18608 (Array (_ BitVec 32) (_ BitVec 64))) (size!18972 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38831)

(declare-datatypes ((List!12649 0))(
  ( (Nil!12646) (Cons!12645 (h!13690 (_ BitVec 64)) (t!18877 List!12649)) )
))
(declare-fun arrayNoDuplicates!0 (array!38831 (_ BitVec 32) List!12649) Bool)

(assert (=> b!660411 (= res!428478 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12646))))

(declare-fun b!660412 () Bool)

(declare-fun res!428477 () Bool)

(assert (=> b!660412 (=> (not res!428477) (not e!379502))))

(declare-fun acc!681 () List!12649)

(declare-fun noDuplicate!473 (List!12649) Bool)

(assert (=> b!660412 (= res!428477 (noDuplicate!473 acc!681))))

(declare-fun b!660413 () Bool)

(assert (=> b!660413 (= e!379502 false)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lt!308782 () Bool)

(assert (=> b!660413 (= lt!308782 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!428479 () Bool)

(assert (=> start!59784 (=> (not res!428479) (not e!379502))))

(assert (=> start!59784 (= res!428479 (and (bvslt (size!18972 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18972 a!3626))))))

(assert (=> start!59784 e!379502))

(assert (=> start!59784 true))

(declare-fun array_inv!14404 (array!38831) Bool)

(assert (=> start!59784 (array_inv!14404 a!3626)))

(declare-fun b!660414 () Bool)

(declare-fun e!379506 () Bool)

(declare-fun e!379504 () Bool)

(assert (=> b!660414 (= e!379506 e!379504)))

(declare-fun res!428481 () Bool)

(assert (=> b!660414 (=> (not res!428481) (not e!379504))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660414 (= res!428481 (bvsle from!3004 i!1382))))

(declare-fun b!660415 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3226 (List!12649 (_ BitVec 64)) Bool)

(assert (=> b!660415 (= e!379504 (not (contains!3226 acc!681 k!2843)))))

(declare-fun b!660416 () Bool)

(declare-fun res!428475 () Bool)

(assert (=> b!660416 (=> (not res!428475) (not e!379502))))

(assert (=> b!660416 (= res!428475 e!379506)))

(declare-fun res!428476 () Bool)

(assert (=> b!660416 (=> res!428476 e!379506)))

(declare-fun e!379505 () Bool)

(assert (=> b!660416 (= res!428476 e!379505)))

(declare-fun res!428482 () Bool)

(assert (=> b!660416 (=> (not res!428482) (not e!379505))))

(assert (=> b!660416 (= res!428482 (bvsgt from!3004 i!1382))))

(declare-fun b!660417 () Bool)

(declare-fun res!428483 () Bool)

(assert (=> b!660417 (=> (not res!428483) (not e!379502))))

(assert (=> b!660417 (= res!428483 (not (contains!3226 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660418 () Bool)

(declare-fun res!428480 () Bool)

(assert (=> b!660418 (=> (not res!428480) (not e!379502))))

(assert (=> b!660418 (= res!428480 (not (contains!3226 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660419 () Bool)

(assert (=> b!660419 (= e!379505 (contains!3226 acc!681 k!2843))))

(assert (= (and start!59784 res!428479) b!660412))

(assert (= (and b!660412 res!428477) b!660418))

(assert (= (and b!660418 res!428480) b!660417))

(assert (= (and b!660417 res!428483) b!660416))

(assert (= (and b!660416 res!428482) b!660419))

(assert (= (and b!660416 (not res!428476)) b!660414))

(assert (= (and b!660414 res!428481) b!660415))

(assert (= (and b!660416 res!428475) b!660411))

(assert (= (and b!660411 res!428478) b!660413))

(declare-fun m!633105 () Bool)

(assert (=> b!660412 m!633105))

(declare-fun m!633107 () Bool)

(assert (=> b!660419 m!633107))

(declare-fun m!633109 () Bool)

(assert (=> b!660411 m!633109))

(declare-fun m!633111 () Bool)

(assert (=> b!660413 m!633111))

(declare-fun m!633113 () Bool)

(assert (=> start!59784 m!633113))

(declare-fun m!633115 () Bool)

(assert (=> b!660418 m!633115))

(declare-fun m!633117 () Bool)

(assert (=> b!660417 m!633117))

(assert (=> b!660415 m!633107))

(push 1)

(assert (not b!660412))

(assert (not b!660415))

(assert (not b!660411))

(assert (not start!59784))

(assert (not b!660417))

(assert (not b!660413))

(assert (not b!660419))

(assert (not b!660418))

