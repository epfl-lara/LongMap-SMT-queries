; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62366 () Bool)

(assert start!62366)

(declare-fun res!462325 () Bool)

(declare-fun e!397075 () Bool)

(assert (=> start!62366 (=> (not res!462325) (not e!397075))))

(declare-datatypes ((array!40045 0))(
  ( (array!40046 (arr!19179 (Array (_ BitVec 32) (_ BitVec 64))) (size!19564 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40045)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62366 (= res!462325 (and (bvslt (size!19564 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19564 a!3591))))))

(assert (=> start!62366 e!397075))

(assert (=> start!62366 true))

(declare-fun array_inv!14975 (array!40045) Bool)

(assert (=> start!62366 (array_inv!14975 a!3591)))

(declare-fun b!698512 () Bool)

(assert (=> b!698512 (= e!397075 false)))

(declare-fun lt!317277 () Bool)

(declare-datatypes ((List!13220 0))(
  ( (Nil!13217) (Cons!13216 (h!14261 (_ BitVec 64)) (t!19502 List!13220)) )
))
(declare-fun acc!652 () List!13220)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun contains!3797 (List!13220 (_ BitVec 64)) Bool)

(assert (=> b!698512 (= lt!317277 (contains!3797 acc!652 k!2824))))

(declare-fun b!698513 () Bool)

(declare-fun res!462327 () Bool)

(assert (=> b!698513 (=> (not res!462327) (not e!397075))))

(declare-fun noDuplicate!1044 (List!13220) Bool)

(assert (=> b!698513 (= res!462327 (noDuplicate!1044 acc!652))))

(declare-fun b!698514 () Bool)

(declare-fun res!462323 () Bool)

(assert (=> b!698514 (=> (not res!462323) (not e!397075))))

(assert (=> b!698514 (= res!462323 (not (contains!3797 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698515 () Bool)

(declare-fun res!462322 () Bool)

(assert (=> b!698515 (=> (not res!462322) (not e!397075))))

(assert (=> b!698515 (= res!462322 (not (contains!3797 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698516 () Bool)

(declare-fun res!462324 () Bool)

(assert (=> b!698516 (=> (not res!462324) (not e!397075))))

(declare-fun arrayContainsKey!0 (array!40045 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!698516 (= res!462324 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!698517 () Bool)

(declare-fun res!462326 () Bool)

(assert (=> b!698517 (=> (not res!462326) (not e!397075))))

(declare-fun newAcc!49 () List!13220)

(assert (=> b!698517 (= res!462326 (noDuplicate!1044 newAcc!49))))

(assert (= (and start!62366 res!462325) b!698513))

(assert (= (and b!698513 res!462327) b!698517))

(assert (= (and b!698517 res!462326) b!698514))

(assert (= (and b!698514 res!462323) b!698515))

(assert (= (and b!698515 res!462322) b!698516))

(assert (= (and b!698516 res!462324) b!698512))

(declare-fun m!658753 () Bool)

(assert (=> b!698515 m!658753))

(declare-fun m!658755 () Bool)

(assert (=> b!698516 m!658755))

(declare-fun m!658757 () Bool)

(assert (=> b!698513 m!658757))

(declare-fun m!658759 () Bool)

(assert (=> b!698514 m!658759))

(declare-fun m!658761 () Bool)

(assert (=> b!698512 m!658761))

(declare-fun m!658763 () Bool)

(assert (=> start!62366 m!658763))

(declare-fun m!658765 () Bool)

(assert (=> b!698517 m!658765))

(push 1)

(assert (not b!698512))

(assert (not b!698517))

(assert (not b!698515))

(assert (not b!698516))

(assert (not b!698514))

(assert (not b!698513))

(assert (not start!62366))

(check-sat)

(pop 1)

