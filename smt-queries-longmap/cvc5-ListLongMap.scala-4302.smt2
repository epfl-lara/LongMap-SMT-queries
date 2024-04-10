; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59840 () Bool)

(assert start!59840)

(declare-fun res!429459 () Bool)

(declare-fun e!379922 () Bool)

(assert (=> start!59840 (=> (not res!429459) (not e!379922))))

(declare-datatypes ((array!38887 0))(
  ( (array!38888 (arr!18636 (Array (_ BitVec 32) (_ BitVec 64))) (size!19000 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38887)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59840 (= res!429459 (and (bvslt (size!19000 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19000 a!3626))))))

(assert (=> start!59840 e!379922))

(assert (=> start!59840 true))

(declare-fun array_inv!14432 (array!38887) Bool)

(assert (=> start!59840 (array_inv!14432 a!3626)))

(declare-fun b!661384 () Bool)

(declare-fun res!429461 () Bool)

(assert (=> b!661384 (=> (not res!429461) (not e!379922))))

(declare-datatypes ((List!12677 0))(
  ( (Nil!12674) (Cons!12673 (h!13718 (_ BitVec 64)) (t!18905 List!12677)) )
))
(declare-fun acc!681 () List!12677)

(declare-fun contains!3254 (List!12677 (_ BitVec 64)) Bool)

(assert (=> b!661384 (= res!429461 (not (contains!3254 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661385 () Bool)

(declare-fun res!429449 () Bool)

(assert (=> b!661385 (=> (not res!429449) (not e!379922))))

(assert (=> b!661385 (= res!429449 (not (contains!3254 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661386 () Bool)

(declare-fun res!429448 () Bool)

(assert (=> b!661386 (=> (not res!429448) (not e!379922))))

(declare-fun e!379923 () Bool)

(assert (=> b!661386 (= res!429448 e!379923)))

(declare-fun res!429452 () Bool)

(assert (=> b!661386 (=> res!429452 e!379923)))

(declare-fun e!379924 () Bool)

(assert (=> b!661386 (= res!429452 e!379924)))

(declare-fun res!429453 () Bool)

(assert (=> b!661386 (=> (not res!429453) (not e!379924))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!661386 (= res!429453 (bvsgt from!3004 i!1382))))

(declare-fun b!661387 () Bool)

(declare-fun e!379925 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!661387 (= e!379925 (not (contains!3254 acc!681 k!2843)))))

(declare-fun b!661388 () Bool)

(declare-fun res!429454 () Bool)

(assert (=> b!661388 (=> (not res!429454) (not e!379922))))

(declare-fun arrayNoDuplicates!0 (array!38887 (_ BitVec 32) List!12677) Bool)

(assert (=> b!661388 (= res!429454 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12674))))

(declare-fun b!661389 () Bool)

(declare-fun res!429458 () Bool)

(assert (=> b!661389 (=> (not res!429458) (not e!379922))))

(declare-fun noDuplicate!501 (List!12677) Bool)

(assert (=> b!661389 (= res!429458 (noDuplicate!501 acc!681))))

(declare-fun b!661390 () Bool)

(declare-fun res!429456 () Bool)

(assert (=> b!661390 (=> (not res!429456) (not e!379922))))

(declare-fun arrayContainsKey!0 (array!38887 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!661390 (= res!429456 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!661391 () Bool)

(assert (=> b!661391 (= e!379924 (contains!3254 acc!681 k!2843))))

(declare-fun b!661392 () Bool)

(assert (=> b!661392 (= e!379923 e!379925)))

(declare-fun res!429451 () Bool)

(assert (=> b!661392 (=> (not res!429451) (not e!379925))))

(assert (=> b!661392 (= res!429451 (bvsle from!3004 i!1382))))

(declare-fun b!661393 () Bool)

(assert (=> b!661393 (= e!379922 (not true))))

(assert (=> b!661393 (arrayContainsKey!0 (array!38888 (store (arr!18636 a!3626) i!1382 k!2843) (size!19000 a!3626)) k!2843 from!3004)))

(declare-fun b!661394 () Bool)

(declare-fun res!429460 () Bool)

(assert (=> b!661394 (=> (not res!429460) (not e!379922))))

(assert (=> b!661394 (= res!429460 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19000 a!3626))))))

(declare-fun b!661395 () Bool)

(declare-fun res!429455 () Bool)

(assert (=> b!661395 (=> (not res!429455) (not e!379922))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!661395 (= res!429455 (validKeyInArray!0 k!2843))))

(declare-fun b!661396 () Bool)

(declare-fun res!429450 () Bool)

(assert (=> b!661396 (=> (not res!429450) (not e!379922))))

(assert (=> b!661396 (= res!429450 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!661397 () Bool)

(declare-fun res!429457 () Bool)

(assert (=> b!661397 (=> (not res!429457) (not e!379922))))

(assert (=> b!661397 (= res!429457 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19000 a!3626)) (= from!3004 i!1382)))))

(assert (= (and start!59840 res!429459) b!661389))

(assert (= (and b!661389 res!429458) b!661384))

(assert (= (and b!661384 res!429461) b!661385))

(assert (= (and b!661385 res!429449) b!661386))

(assert (= (and b!661386 res!429453) b!661391))

(assert (= (and b!661386 (not res!429452)) b!661392))

(assert (= (and b!661392 res!429451) b!661387))

(assert (= (and b!661386 res!429448) b!661388))

(assert (= (and b!661388 res!429454) b!661396))

(assert (= (and b!661396 res!429450) b!661394))

(assert (= (and b!661394 res!429460) b!661395))

(assert (= (and b!661395 res!429455) b!661390))

(assert (= (and b!661390 res!429456) b!661397))

(assert (= (and b!661397 res!429457) b!661393))

(declare-fun m!633599 () Bool)

(assert (=> b!661388 m!633599))

(declare-fun m!633601 () Bool)

(assert (=> start!59840 m!633601))

(declare-fun m!633603 () Bool)

(assert (=> b!661385 m!633603))

(declare-fun m!633605 () Bool)

(assert (=> b!661396 m!633605))

(declare-fun m!633607 () Bool)

(assert (=> b!661389 m!633607))

(declare-fun m!633609 () Bool)

(assert (=> b!661390 m!633609))

(declare-fun m!633611 () Bool)

(assert (=> b!661393 m!633611))

(declare-fun m!633613 () Bool)

(assert (=> b!661393 m!633613))

(declare-fun m!633615 () Bool)

(assert (=> b!661384 m!633615))

(declare-fun m!633617 () Bool)

(assert (=> b!661395 m!633617))

(declare-fun m!633619 () Bool)

(assert (=> b!661391 m!633619))

(assert (=> b!661387 m!633619))

(push 1)

(assert (not b!661388))

(assert (not b!661384))

(assert (not b!661393))

(assert (not b!661387))

(assert (not b!661395))

(assert (not b!661390))

(assert (not b!661396))

(assert (not start!59840))

(assert (not b!661385))

(assert (not b!661391))

(assert (not b!661389))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

