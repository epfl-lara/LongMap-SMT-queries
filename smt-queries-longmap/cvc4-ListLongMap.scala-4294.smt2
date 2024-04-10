; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59796 () Bool)

(assert start!59796)

(declare-fun b!660600 () Bool)

(declare-fun res!428668 () Bool)

(declare-fun e!379596 () Bool)

(assert (=> b!660600 (=> (not res!428668) (not e!379596))))

(declare-datatypes ((array!38843 0))(
  ( (array!38844 (arr!18614 (Array (_ BitVec 32) (_ BitVec 64))) (size!18978 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38843)

(declare-datatypes ((List!12655 0))(
  ( (Nil!12652) (Cons!12651 (h!13696 (_ BitVec 64)) (t!18883 List!12655)) )
))
(declare-fun arrayNoDuplicates!0 (array!38843 (_ BitVec 32) List!12655) Bool)

(assert (=> b!660600 (= res!428668 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12652))))

(declare-fun b!660601 () Bool)

(declare-fun e!379595 () Bool)

(declare-fun e!379592 () Bool)

(assert (=> b!660601 (= e!379595 e!379592)))

(declare-fun res!428670 () Bool)

(assert (=> b!660601 (=> (not res!428670) (not e!379592))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660601 (= res!428670 (bvsle from!3004 i!1382))))

(declare-fun b!660602 () Bool)

(declare-fun res!428665 () Bool)

(assert (=> b!660602 (=> (not res!428665) (not e!379596))))

(declare-fun acc!681 () List!12655)

(declare-fun noDuplicate!479 (List!12655) Bool)

(assert (=> b!660602 (= res!428665 (noDuplicate!479 acc!681))))

(declare-fun b!660603 () Bool)

(assert (=> b!660603 (= e!379596 false)))

(declare-fun lt!308791 () Bool)

(assert (=> b!660603 (= lt!308791 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!660604 () Bool)

(declare-fun res!428667 () Bool)

(assert (=> b!660604 (=> (not res!428667) (not e!379596))))

(declare-fun contains!3232 (List!12655 (_ BitVec 64)) Bool)

(assert (=> b!660604 (= res!428667 (not (contains!3232 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!428669 () Bool)

(assert (=> start!59796 (=> (not res!428669) (not e!379596))))

(assert (=> start!59796 (= res!428669 (and (bvslt (size!18978 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18978 a!3626))))))

(assert (=> start!59796 e!379596))

(assert (=> start!59796 true))

(declare-fun array_inv!14410 (array!38843) Bool)

(assert (=> start!59796 (array_inv!14410 a!3626)))

(declare-fun b!660605 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!660605 (= e!379592 (not (contains!3232 acc!681 k!2843)))))

(declare-fun b!660606 () Bool)

(declare-fun res!428664 () Bool)

(assert (=> b!660606 (=> (not res!428664) (not e!379596))))

(assert (=> b!660606 (= res!428664 (not (contains!3232 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660607 () Bool)

(declare-fun e!379593 () Bool)

(assert (=> b!660607 (= e!379593 (contains!3232 acc!681 k!2843))))

(declare-fun b!660608 () Bool)

(declare-fun res!428672 () Bool)

(assert (=> b!660608 (=> (not res!428672) (not e!379596))))

(assert (=> b!660608 (= res!428672 e!379595)))

(declare-fun res!428671 () Bool)

(assert (=> b!660608 (=> res!428671 e!379595)))

(assert (=> b!660608 (= res!428671 e!379593)))

(declare-fun res!428666 () Bool)

(assert (=> b!660608 (=> (not res!428666) (not e!379593))))

(assert (=> b!660608 (= res!428666 (bvsgt from!3004 i!1382))))

(assert (= (and start!59796 res!428669) b!660602))

(assert (= (and b!660602 res!428665) b!660606))

(assert (= (and b!660606 res!428664) b!660604))

(assert (= (and b!660604 res!428667) b!660608))

(assert (= (and b!660608 res!428666) b!660607))

(assert (= (and b!660608 (not res!428671)) b!660601))

(assert (= (and b!660601 res!428670) b!660605))

(assert (= (and b!660608 res!428672) b!660600))

(assert (= (and b!660600 res!428668) b!660603))

(declare-fun m!633195 () Bool)

(assert (=> start!59796 m!633195))

(declare-fun m!633197 () Bool)

(assert (=> b!660606 m!633197))

(declare-fun m!633199 () Bool)

(assert (=> b!660604 m!633199))

(declare-fun m!633201 () Bool)

(assert (=> b!660602 m!633201))

(declare-fun m!633203 () Bool)

(assert (=> b!660603 m!633203))

(declare-fun m!633205 () Bool)

(assert (=> b!660600 m!633205))

(declare-fun m!633207 () Bool)

(assert (=> b!660607 m!633207))

(assert (=> b!660605 m!633207))

(push 1)

(assert (not b!660603))

(assert (not b!660607))

(assert (not b!660600))

(assert (not b!660604))

(assert (not start!59796))

(assert (not b!660605))

(assert (not b!660606))

(assert (not b!660602))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

