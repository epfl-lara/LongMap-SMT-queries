; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62540 () Bool)

(assert start!62540)

(declare-fun b!704782 () Bool)

(declare-fun res!468607 () Bool)

(declare-fun e!397759 () Bool)

(assert (=> b!704782 (=> (not res!468607) (not e!397759))))

(declare-datatypes ((List!13307 0))(
  ( (Nil!13304) (Cons!13303 (h!14348 (_ BitVec 64)) (t!19589 List!13307)) )
))
(declare-fun acc!652 () List!13307)

(declare-fun noDuplicate!1131 (List!13307) Bool)

(assert (=> b!704782 (= res!468607 (noDuplicate!1131 acc!652))))

(declare-fun b!704783 () Bool)

(declare-fun res!468602 () Bool)

(assert (=> b!704783 (=> (not res!468602) (not e!397759))))

(declare-fun newAcc!49 () List!13307)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun -!294 (List!13307 (_ BitVec 64)) List!13307)

(assert (=> b!704783 (= res!468602 (= (-!294 newAcc!49 k!2824) acc!652))))

(declare-fun b!704784 () Bool)

(declare-fun res!468598 () Bool)

(assert (=> b!704784 (=> (not res!468598) (not e!397759))))

(declare-datatypes ((array!40219 0))(
  ( (array!40220 (arr!19266 (Array (_ BitVec 32) (_ BitVec 64))) (size!19651 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40219)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!704784 (= res!468598 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!704785 () Bool)

(assert (=> b!704785 (= e!397759 false)))

(declare-fun lt!317862 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40219 (_ BitVec 32) List!13307) Bool)

(assert (=> b!704785 (= lt!317862 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun res!468606 () Bool)

(assert (=> start!62540 (=> (not res!468606) (not e!397759))))

(assert (=> start!62540 (= res!468606 (and (bvslt (size!19651 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19651 a!3591))))))

(assert (=> start!62540 e!397759))

(assert (=> start!62540 true))

(declare-fun array_inv!15062 (array!40219) Bool)

(assert (=> start!62540 (array_inv!15062 a!3591)))

(declare-fun b!704786 () Bool)

(declare-fun res!468605 () Bool)

(assert (=> b!704786 (=> (not res!468605) (not e!397759))))

(declare-fun contains!3884 (List!13307 (_ BitVec 64)) Bool)

(assert (=> b!704786 (= res!468605 (not (contains!3884 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704787 () Bool)

(declare-fun res!468594 () Bool)

(assert (=> b!704787 (=> (not res!468594) (not e!397759))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!704787 (= res!468594 (validKeyInArray!0 k!2824))))

(declare-fun b!704788 () Bool)

(declare-fun res!468609 () Bool)

(assert (=> b!704788 (=> (not res!468609) (not e!397759))))

(assert (=> b!704788 (= res!468609 (not (contains!3884 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704789 () Bool)

(declare-fun res!468604 () Bool)

(assert (=> b!704789 (=> (not res!468604) (not e!397759))))

(assert (=> b!704789 (= res!468604 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19651 a!3591)))))

(declare-fun b!704790 () Bool)

(declare-fun res!468608 () Bool)

(assert (=> b!704790 (=> (not res!468608) (not e!397759))))

(assert (=> b!704790 (= res!468608 (not (contains!3884 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704791 () Bool)

(declare-fun res!468593 () Bool)

(assert (=> b!704791 (=> (not res!468593) (not e!397759))))

(assert (=> b!704791 (= res!468593 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!704792 () Bool)

(declare-fun res!468595 () Bool)

(assert (=> b!704792 (=> (not res!468595) (not e!397759))))

(assert (=> b!704792 (= res!468595 (contains!3884 newAcc!49 k!2824))))

(declare-fun b!704793 () Bool)

(declare-fun res!468597 () Bool)

(assert (=> b!704793 (=> (not res!468597) (not e!397759))))

(assert (=> b!704793 (= res!468597 (noDuplicate!1131 newAcc!49))))

(declare-fun b!704794 () Bool)

(declare-fun res!468592 () Bool)

(assert (=> b!704794 (=> (not res!468592) (not e!397759))))

(assert (=> b!704794 (= res!468592 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!704795 () Bool)

(declare-fun res!468596 () Bool)

(assert (=> b!704795 (=> (not res!468596) (not e!397759))))

(assert (=> b!704795 (= res!468596 (not (contains!3884 acc!652 k!2824)))))

(declare-fun b!704796 () Bool)

(declare-fun res!468601 () Bool)

(assert (=> b!704796 (=> (not res!468601) (not e!397759))))

(declare-fun subseq!329 (List!13307 List!13307) Bool)

(assert (=> b!704796 (= res!468601 (subseq!329 acc!652 newAcc!49))))

(declare-fun b!704797 () Bool)

(declare-fun res!468599 () Bool)

(assert (=> b!704797 (=> (not res!468599) (not e!397759))))

(assert (=> b!704797 (= res!468599 (not (contains!3884 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704798 () Bool)

(declare-fun res!468600 () Bool)

(assert (=> b!704798 (=> (not res!468600) (not e!397759))))

(assert (=> b!704798 (= res!468600 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!704799 () Bool)

(declare-fun res!468603 () Bool)

(assert (=> b!704799 (=> (not res!468603) (not e!397759))))

(assert (=> b!704799 (= res!468603 (not (validKeyInArray!0 (select (arr!19266 a!3591) from!2969))))))

(assert (= (and start!62540 res!468606) b!704782))

(assert (= (and b!704782 res!468607) b!704793))

(assert (= (and b!704793 res!468597) b!704797))

(assert (= (and b!704797 res!468599) b!704790))

(assert (= (and b!704790 res!468608) b!704784))

(assert (= (and b!704784 res!468598) b!704795))

(assert (= (and b!704795 res!468596) b!704787))

(assert (= (and b!704787 res!468594) b!704794))

(assert (= (and b!704794 res!468592) b!704796))

(assert (= (and b!704796 res!468601) b!704792))

(assert (= (and b!704792 res!468595) b!704783))

(assert (= (and b!704783 res!468602) b!704786))

(assert (= (and b!704786 res!468605) b!704788))

(assert (= (and b!704788 res!468609) b!704789))

(assert (= (and b!704789 res!468604) b!704799))

(assert (= (and b!704799 res!468603) b!704791))

(assert (= (and b!704791 res!468593) b!704798))

(assert (= (and b!704798 res!468600) b!704785))

(declare-fun m!663163 () Bool)

(assert (=> b!704795 m!663163))

(declare-fun m!663165 () Bool)

(assert (=> b!704792 m!663165))

(declare-fun m!663167 () Bool)

(assert (=> b!704787 m!663167))

(declare-fun m!663169 () Bool)

(assert (=> b!704784 m!663169))

(declare-fun m!663171 () Bool)

(assert (=> b!704797 m!663171))

(declare-fun m!663173 () Bool)

(assert (=> start!62540 m!663173))

(declare-fun m!663175 () Bool)

(assert (=> b!704783 m!663175))

(declare-fun m!663177 () Bool)

(assert (=> b!704794 m!663177))

(declare-fun m!663179 () Bool)

(assert (=> b!704790 m!663179))

(declare-fun m!663181 () Bool)

(assert (=> b!704796 m!663181))

(declare-fun m!663183 () Bool)

(assert (=> b!704786 m!663183))

(declare-fun m!663185 () Bool)

(assert (=> b!704782 m!663185))

(declare-fun m!663187 () Bool)

(assert (=> b!704798 m!663187))

(declare-fun m!663189 () Bool)

(assert (=> b!704799 m!663189))

(assert (=> b!704799 m!663189))

(declare-fun m!663191 () Bool)

(assert (=> b!704799 m!663191))

(declare-fun m!663193 () Bool)

(assert (=> b!704793 m!663193))

(declare-fun m!663195 () Bool)

(assert (=> b!704785 m!663195))

(declare-fun m!663197 () Bool)

(assert (=> b!704788 m!663197))

(push 1)

(assert (not b!704793))

(assert (not b!704792))

(assert (not b!704798))

(assert (not b!704796))

(assert (not b!704784))

(assert (not b!704782))

(assert (not b!704787))

(assert (not b!704797))

(assert (not b!704785))

(assert (not b!704788))

(assert (not b!704783))

(assert (not b!704794))

(assert (not start!62540))

(assert (not b!704795))

(assert (not b!704799))

(assert (not b!704786))

(assert (not b!704790))

(check-sat)

(pop 1)

