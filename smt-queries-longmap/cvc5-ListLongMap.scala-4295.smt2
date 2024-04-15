; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59790 () Bool)

(assert start!59790)

(declare-fun b!660385 () Bool)

(declare-fun e!379451 () Bool)

(assert (=> b!660385 (= e!379451 false)))

(declare-fun lt!308544 () Bool)

(declare-datatypes ((array!38848 0))(
  ( (array!38849 (arr!18616 (Array (_ BitVec 32) (_ BitVec 64))) (size!18981 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38848)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12696 0))(
  ( (Nil!12693) (Cons!12692 (h!13737 (_ BitVec 64)) (t!18915 List!12696)) )
))
(declare-fun acc!681 () List!12696)

(declare-fun arrayNoDuplicates!0 (array!38848 (_ BitVec 32) List!12696) Bool)

(assert (=> b!660385 (= lt!308544 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!660386 () Bool)

(declare-fun res!428617 () Bool)

(assert (=> b!660386 (=> (not res!428617) (not e!379451))))

(declare-fun contains!3218 (List!12696 (_ BitVec 64)) Bool)

(assert (=> b!660386 (= res!428617 (not (contains!3218 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660387 () Bool)

(declare-fun e!379447 () Bool)

(declare-fun e!379450 () Bool)

(assert (=> b!660387 (= e!379447 e!379450)))

(declare-fun res!428611 () Bool)

(assert (=> b!660387 (=> (not res!428611) (not e!379450))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660387 (= res!428611 (bvsle from!3004 i!1382))))

(declare-fun res!428614 () Bool)

(assert (=> start!59790 (=> (not res!428614) (not e!379451))))

(assert (=> start!59790 (= res!428614 (and (bvslt (size!18981 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18981 a!3626))))))

(assert (=> start!59790 e!379451))

(assert (=> start!59790 true))

(declare-fun array_inv!14499 (array!38848) Bool)

(assert (=> start!59790 (array_inv!14499 a!3626)))

(declare-fun b!660388 () Bool)

(declare-fun res!428612 () Bool)

(assert (=> b!660388 (=> (not res!428612) (not e!379451))))

(assert (=> b!660388 (= res!428612 (not (contains!3218 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660389 () Bool)

(declare-fun res!428615 () Bool)

(assert (=> b!660389 (=> (not res!428615) (not e!379451))))

(assert (=> b!660389 (= res!428615 e!379447)))

(declare-fun res!428609 () Bool)

(assert (=> b!660389 (=> res!428609 e!379447)))

(declare-fun e!379448 () Bool)

(assert (=> b!660389 (= res!428609 e!379448)))

(declare-fun res!428610 () Bool)

(assert (=> b!660389 (=> (not res!428610) (not e!379448))))

(assert (=> b!660389 (= res!428610 (bvsgt from!3004 i!1382))))

(declare-fun b!660390 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!660390 (= e!379448 (contains!3218 acc!681 k!2843))))

(declare-fun b!660391 () Bool)

(declare-fun res!428613 () Bool)

(assert (=> b!660391 (=> (not res!428613) (not e!379451))))

(assert (=> b!660391 (= res!428613 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12693))))

(declare-fun b!660392 () Bool)

(assert (=> b!660392 (= e!379450 (not (contains!3218 acc!681 k!2843)))))

(declare-fun b!660393 () Bool)

(declare-fun res!428616 () Bool)

(assert (=> b!660393 (=> (not res!428616) (not e!379451))))

(declare-fun noDuplicate!487 (List!12696) Bool)

(assert (=> b!660393 (= res!428616 (noDuplicate!487 acc!681))))

(assert (= (and start!59790 res!428614) b!660393))

(assert (= (and b!660393 res!428616) b!660386))

(assert (= (and b!660386 res!428617) b!660388))

(assert (= (and b!660388 res!428612) b!660389))

(assert (= (and b!660389 res!428610) b!660390))

(assert (= (and b!660389 (not res!428609)) b!660387))

(assert (= (and b!660387 res!428611) b!660392))

(assert (= (and b!660389 res!428615) b!660391))

(assert (= (and b!660391 res!428613) b!660385))

(declare-fun m!632455 () Bool)

(assert (=> b!660391 m!632455))

(declare-fun m!632457 () Bool)

(assert (=> b!660393 m!632457))

(declare-fun m!632459 () Bool)

(assert (=> b!660390 m!632459))

(declare-fun m!632461 () Bool)

(assert (=> b!660385 m!632461))

(declare-fun m!632463 () Bool)

(assert (=> b!660388 m!632463))

(declare-fun m!632465 () Bool)

(assert (=> start!59790 m!632465))

(assert (=> b!660392 m!632459))

(declare-fun m!632467 () Bool)

(assert (=> b!660386 m!632467))

(push 1)

(assert (not b!660385))

(assert (not b!660388))

(assert (not b!660391))

(assert (not b!660386))

(assert (not start!59790))

(assert (not b!660390))

(assert (not b!660392))

(assert (not b!660393))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

