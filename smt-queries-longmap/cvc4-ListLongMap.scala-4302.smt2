; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59844 () Bool)

(assert start!59844)

(declare-fun b!661468 () Bool)

(declare-fun res!429535 () Bool)

(declare-fun e!379952 () Bool)

(assert (=> b!661468 (=> (not res!429535) (not e!379952))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!38891 0))(
  ( (array!38892 (arr!18638 (Array (_ BitVec 32) (_ BitVec 64))) (size!19002 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38891)

(assert (=> b!661468 (= res!429535 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19002 a!3626))))))

(declare-fun res!429533 () Bool)

(assert (=> start!59844 (=> (not res!429533) (not e!379952))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59844 (= res!429533 (and (bvslt (size!19002 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19002 a!3626))))))

(assert (=> start!59844 e!379952))

(assert (=> start!59844 true))

(declare-fun array_inv!14434 (array!38891) Bool)

(assert (=> start!59844 (array_inv!14434 a!3626)))

(declare-fun b!661469 () Bool)

(declare-fun res!429543 () Bool)

(assert (=> b!661469 (=> (not res!429543) (not e!379952))))

(declare-datatypes ((List!12679 0))(
  ( (Nil!12676) (Cons!12675 (h!13720 (_ BitVec 64)) (t!18907 List!12679)) )
))
(declare-fun acc!681 () List!12679)

(declare-fun arrayNoDuplicates!0 (array!38891 (_ BitVec 32) List!12679) Bool)

(assert (=> b!661469 (= res!429543 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!661470 () Bool)

(declare-fun res!429544 () Bool)

(assert (=> b!661470 (=> (not res!429544) (not e!379952))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!661470 (= res!429544 (validKeyInArray!0 k!2843))))

(declare-fun b!661471 () Bool)

(declare-fun res!429532 () Bool)

(assert (=> b!661471 (=> (not res!429532) (not e!379952))))

(declare-fun arrayContainsKey!0 (array!38891 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!661471 (= res!429532 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!661472 () Bool)

(declare-fun res!429537 () Bool)

(assert (=> b!661472 (=> (not res!429537) (not e!379952))))

(declare-fun contains!3256 (List!12679 (_ BitVec 64)) Bool)

(assert (=> b!661472 (= res!429537 (not (contains!3256 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661473 () Bool)

(declare-fun e!379955 () Bool)

(assert (=> b!661473 (= e!379955 (contains!3256 acc!681 k!2843))))

(declare-fun b!661474 () Bool)

(declare-fun res!429539 () Bool)

(assert (=> b!661474 (=> (not res!429539) (not e!379952))))

(assert (=> b!661474 (= res!429539 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19002 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!661475 () Bool)

(declare-fun res!429536 () Bool)

(assert (=> b!661475 (=> (not res!429536) (not e!379952))))

(assert (=> b!661475 (= res!429536 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12676))))

(declare-fun b!661476 () Bool)

(assert (=> b!661476 (= e!379952 (not true))))

(assert (=> b!661476 (arrayContainsKey!0 (array!38892 (store (arr!18638 a!3626) i!1382 k!2843) (size!19002 a!3626)) k!2843 from!3004)))

(declare-fun b!661477 () Bool)

(declare-fun res!429545 () Bool)

(assert (=> b!661477 (=> (not res!429545) (not e!379952))))

(declare-fun e!379956 () Bool)

(assert (=> b!661477 (= res!429545 e!379956)))

(declare-fun res!429540 () Bool)

(assert (=> b!661477 (=> res!429540 e!379956)))

(assert (=> b!661477 (= res!429540 e!379955)))

(declare-fun res!429541 () Bool)

(assert (=> b!661477 (=> (not res!429541) (not e!379955))))

(assert (=> b!661477 (= res!429541 (bvsgt from!3004 i!1382))))

(declare-fun b!661478 () Bool)

(declare-fun e!379954 () Bool)

(assert (=> b!661478 (= e!379954 (not (contains!3256 acc!681 k!2843)))))

(declare-fun b!661479 () Bool)

(assert (=> b!661479 (= e!379956 e!379954)))

(declare-fun res!429534 () Bool)

(assert (=> b!661479 (=> (not res!429534) (not e!379954))))

(assert (=> b!661479 (= res!429534 (bvsle from!3004 i!1382))))

(declare-fun b!661480 () Bool)

(declare-fun res!429542 () Bool)

(assert (=> b!661480 (=> (not res!429542) (not e!379952))))

(assert (=> b!661480 (= res!429542 (not (contains!3256 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661481 () Bool)

(declare-fun res!429538 () Bool)

(assert (=> b!661481 (=> (not res!429538) (not e!379952))))

(declare-fun noDuplicate!503 (List!12679) Bool)

(assert (=> b!661481 (= res!429538 (noDuplicate!503 acc!681))))

(assert (= (and start!59844 res!429533) b!661481))

(assert (= (and b!661481 res!429538) b!661480))

(assert (= (and b!661480 res!429542) b!661472))

(assert (= (and b!661472 res!429537) b!661477))

(assert (= (and b!661477 res!429541) b!661473))

(assert (= (and b!661477 (not res!429540)) b!661479))

(assert (= (and b!661479 res!429534) b!661478))

(assert (= (and b!661477 res!429545) b!661475))

(assert (= (and b!661475 res!429536) b!661469))

(assert (= (and b!661469 res!429543) b!661468))

(assert (= (and b!661468 res!429535) b!661470))

(assert (= (and b!661470 res!429544) b!661471))

(assert (= (and b!661471 res!429532) b!661474))

(assert (= (and b!661474 res!429539) b!661476))

(declare-fun m!633643 () Bool)

(assert (=> b!661470 m!633643))

(declare-fun m!633645 () Bool)

(assert (=> b!661469 m!633645))

(declare-fun m!633647 () Bool)

(assert (=> b!661471 m!633647))

(declare-fun m!633649 () Bool)

(assert (=> b!661476 m!633649))

(declare-fun m!633651 () Bool)

(assert (=> b!661476 m!633651))

(declare-fun m!633653 () Bool)

(assert (=> b!661480 m!633653))

(declare-fun m!633655 () Bool)

(assert (=> b!661478 m!633655))

(declare-fun m!633657 () Bool)

(assert (=> b!661472 m!633657))

(declare-fun m!633659 () Bool)

(assert (=> b!661475 m!633659))

(declare-fun m!633661 () Bool)

(assert (=> b!661481 m!633661))

(assert (=> b!661473 m!633655))

(declare-fun m!633663 () Bool)

(assert (=> start!59844 m!633663))

(push 1)

(assert (not b!661471))

(assert (not b!661469))

(assert (not b!661478))

(assert (not b!661475))

(assert (not start!59844))

(assert (not b!661476))

(assert (not b!661470))

(assert (not b!661480))

(assert (not b!661473))

(assert (not b!661481))

(assert (not b!661472))

