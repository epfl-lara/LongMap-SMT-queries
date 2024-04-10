; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59786 () Bool)

(assert start!59786)

(declare-fun b!660444 () Bool)

(declare-fun res!428509 () Bool)

(declare-fun e!379518 () Bool)

(assert (=> b!660444 (=> (not res!428509) (not e!379518))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!38833 0))(
  ( (array!38834 (arr!18609 (Array (_ BitVec 32) (_ BitVec 64))) (size!18973 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38833)

(assert (=> b!660444 (= res!428509 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!18973 a!3626))))))

(declare-fun b!660445 () Bool)

(declare-fun e!379521 () Bool)

(declare-datatypes ((List!12650 0))(
  ( (Nil!12647) (Cons!12646 (h!13691 (_ BitVec 64)) (t!18878 List!12650)) )
))
(declare-fun acc!681 () List!12650)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3227 (List!12650 (_ BitVec 64)) Bool)

(assert (=> b!660445 (= e!379521 (contains!3227 acc!681 k!2843))))

(declare-fun b!660447 () Bool)

(declare-fun res!428511 () Bool)

(assert (=> b!660447 (=> (not res!428511) (not e!379518))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!660447 (= res!428511 (validKeyInArray!0 k!2843))))

(declare-fun b!660448 () Bool)

(declare-fun res!428519 () Bool)

(assert (=> b!660448 (=> (not res!428519) (not e!379518))))

(declare-fun noDuplicate!474 (List!12650) Bool)

(assert (=> b!660448 (= res!428519 (noDuplicate!474 acc!681))))

(declare-fun b!660449 () Bool)

(assert (=> b!660449 (= e!379518 (bvsge #b00000000000000000000000000000000 (size!18973 a!3626)))))

(declare-fun b!660450 () Bool)

(declare-fun res!428518 () Bool)

(assert (=> b!660450 (=> (not res!428518) (not e!379518))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!38833 (_ BitVec 32) List!12650) Bool)

(assert (=> b!660450 (= res!428518 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!660451 () Bool)

(declare-fun res!428508 () Bool)

(assert (=> b!660451 (=> (not res!428508) (not e!379518))))

(assert (=> b!660451 (= res!428508 (not (contains!3227 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660452 () Bool)

(declare-fun res!428512 () Bool)

(assert (=> b!660452 (=> (not res!428512) (not e!379518))))

(assert (=> b!660452 (= res!428512 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12647))))

(declare-fun b!660453 () Bool)

(declare-fun res!428510 () Bool)

(assert (=> b!660453 (=> (not res!428510) (not e!379518))))

(declare-fun e!379519 () Bool)

(assert (=> b!660453 (= res!428510 e!379519)))

(declare-fun res!428515 () Bool)

(assert (=> b!660453 (=> res!428515 e!379519)))

(assert (=> b!660453 (= res!428515 e!379521)))

(declare-fun res!428517 () Bool)

(assert (=> b!660453 (=> (not res!428517) (not e!379521))))

(assert (=> b!660453 (= res!428517 (bvsgt from!3004 i!1382))))

(declare-fun b!660446 () Bool)

(declare-fun e!379517 () Bool)

(assert (=> b!660446 (= e!379519 e!379517)))

(declare-fun res!428513 () Bool)

(assert (=> b!660446 (=> (not res!428513) (not e!379517))))

(assert (=> b!660446 (= res!428513 (bvsle from!3004 i!1382))))

(declare-fun res!428516 () Bool)

(assert (=> start!59786 (=> (not res!428516) (not e!379518))))

(assert (=> start!59786 (= res!428516 (and (bvslt (size!18973 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18973 a!3626))))))

(assert (=> start!59786 e!379518))

(assert (=> start!59786 true))

(declare-fun array_inv!14405 (array!38833) Bool)

(assert (=> start!59786 (array_inv!14405 a!3626)))

(declare-fun b!660454 () Bool)

(assert (=> b!660454 (= e!379517 (not (contains!3227 acc!681 k!2843)))))

(declare-fun b!660455 () Bool)

(declare-fun res!428514 () Bool)

(assert (=> b!660455 (=> (not res!428514) (not e!379518))))

(assert (=> b!660455 (= res!428514 (not (contains!3227 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59786 res!428516) b!660448))

(assert (= (and b!660448 res!428519) b!660451))

(assert (= (and b!660451 res!428508) b!660455))

(assert (= (and b!660455 res!428514) b!660453))

(assert (= (and b!660453 res!428517) b!660445))

(assert (= (and b!660453 (not res!428515)) b!660446))

(assert (= (and b!660446 res!428513) b!660454))

(assert (= (and b!660453 res!428510) b!660452))

(assert (= (and b!660452 res!428512) b!660450))

(assert (= (and b!660450 res!428518) b!660444))

(assert (= (and b!660444 res!428509) b!660447))

(assert (= (and b!660447 res!428511) b!660449))

(declare-fun m!633119 () Bool)

(assert (=> b!660452 m!633119))

(declare-fun m!633121 () Bool)

(assert (=> b!660455 m!633121))

(declare-fun m!633123 () Bool)

(assert (=> b!660451 m!633123))

(declare-fun m!633125 () Bool)

(assert (=> b!660450 m!633125))

(declare-fun m!633127 () Bool)

(assert (=> b!660454 m!633127))

(declare-fun m!633129 () Bool)

(assert (=> b!660448 m!633129))

(declare-fun m!633131 () Bool)

(assert (=> start!59786 m!633131))

(declare-fun m!633133 () Bool)

(assert (=> b!660447 m!633133))

(assert (=> b!660445 m!633127))

(push 1)

