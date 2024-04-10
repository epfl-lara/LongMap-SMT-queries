; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114186 () Bool)

(assert start!114186)

(declare-fun b!1356558 () Bool)

(declare-fun res!901315 () Bool)

(declare-fun e!770100 () Bool)

(assert (=> b!1356558 (=> (not res!901315) (not e!770100))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92368 0))(
  ( (array!92369 (arr!44632 (Array (_ BitVec 32) (_ BitVec 64))) (size!45182 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92368)

(assert (=> b!1356558 (= res!901315 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45182 a!3742))))))

(declare-fun b!1356559 () Bool)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1356559 (= e!770100 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45182 a!3742)) (bvsgt from!3120 (size!45182 a!3742))))))

(declare-fun b!1356560 () Bool)

(declare-fun res!901317 () Bool)

(assert (=> b!1356560 (=> (not res!901317) (not e!770100))))

(declare-datatypes ((List!31673 0))(
  ( (Nil!31670) (Cons!31669 (h!32878 (_ BitVec 64)) (t!46331 List!31673)) )
))
(declare-fun acc!759 () List!31673)

(declare-fun noDuplicate!2239 (List!31673) Bool)

(assert (=> b!1356560 (= res!901317 (noDuplicate!2239 acc!759))))

(declare-fun b!1356562 () Bool)

(declare-fun res!901314 () Bool)

(assert (=> b!1356562 (=> (not res!901314) (not e!770100))))

(declare-fun contains!9382 (List!31673 (_ BitVec 64)) Bool)

(assert (=> b!1356562 (= res!901314 (not (contains!9382 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356563 () Bool)

(declare-fun res!901321 () Bool)

(assert (=> b!1356563 (=> (not res!901321) (not e!770100))))

(assert (=> b!1356563 (= res!901321 (not (contains!9382 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356564 () Bool)

(declare-fun res!901316 () Bool)

(assert (=> b!1356564 (=> (not res!901316) (not e!770100))))

(declare-fun arrayNoDuplicates!0 (array!92368 (_ BitVec 32) List!31673) Bool)

(assert (=> b!1356564 (= res!901316 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356565 () Bool)

(declare-fun res!901319 () Bool)

(assert (=> b!1356565 (=> (not res!901319) (not e!770100))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356565 (= res!901319 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1356561 () Bool)

(declare-fun res!901320 () Bool)

(assert (=> b!1356561 (=> (not res!901320) (not e!770100))))

(assert (=> b!1356561 (= res!901320 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31670))))

(declare-fun res!901318 () Bool)

(assert (=> start!114186 (=> (not res!901318) (not e!770100))))

(assert (=> start!114186 (= res!901318 (and (bvslt (size!45182 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45182 a!3742))))))

(assert (=> start!114186 e!770100))

(assert (=> start!114186 true))

(declare-fun array_inv!33660 (array!92368) Bool)

(assert (=> start!114186 (array_inv!33660 a!3742)))

(assert (= (and start!114186 res!901318) b!1356560))

(assert (= (and b!1356560 res!901317) b!1356562))

(assert (= (and b!1356562 res!901314) b!1356563))

(assert (= (and b!1356563 res!901321) b!1356561))

(assert (= (and b!1356561 res!901320) b!1356564))

(assert (= (and b!1356564 res!901316) b!1356558))

(assert (= (and b!1356558 res!901315) b!1356565))

(assert (= (and b!1356565 res!901319) b!1356559))

(declare-fun m!1242533 () Bool)

(assert (=> b!1356564 m!1242533))

(declare-fun m!1242535 () Bool)

(assert (=> b!1356561 m!1242535))

(declare-fun m!1242537 () Bool)

(assert (=> b!1356560 m!1242537))

(declare-fun m!1242539 () Bool)

(assert (=> b!1356562 m!1242539))

(declare-fun m!1242541 () Bool)

(assert (=> b!1356563 m!1242541))

(declare-fun m!1242543 () Bool)

(assert (=> b!1356565 m!1242543))

(declare-fun m!1242545 () Bool)

(assert (=> start!114186 m!1242545))

(push 1)

(assert (not b!1356562))

(assert (not start!114186))

(assert (not b!1356565))

(assert (not b!1356561))

(assert (not b!1356564))

(assert (not b!1356560))

(assert (not b!1356563))

(check-sat)

(pop 1)

(push 1)

(check-sat)

