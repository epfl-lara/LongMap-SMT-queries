; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63512 () Bool)

(assert start!63512)

(declare-fun b!715460 () Bool)

(declare-fun res!478440 () Bool)

(declare-fun e!401866 () Bool)

(assert (=> b!715460 (=> (not res!478440) (not e!401866))))

(declare-datatypes ((array!40526 0))(
  ( (array!40527 (arr!19400 (Array (_ BitVec 32) (_ BitVec 64))) (size!19816 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40526)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40526 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!715460 (= res!478440 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!715461 () Bool)

(declare-fun res!478447 () Bool)

(assert (=> b!715461 (=> (not res!478447) (not e!401866))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!715461 (= res!478447 (not (validKeyInArray!0 (select (arr!19400 a!3591) from!2969))))))

(declare-fun res!478442 () Bool)

(assert (=> start!63512 (=> (not res!478442) (not e!401866))))

(assert (=> start!63512 (= res!478442 (and (bvslt (size!19816 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19816 a!3591))))))

(assert (=> start!63512 e!401866))

(assert (=> start!63512 true))

(declare-fun array_inv!15196 (array!40526) Bool)

(assert (=> start!63512 (array_inv!15196 a!3591)))

(declare-fun b!715462 () Bool)

(declare-fun res!478437 () Bool)

(assert (=> b!715462 (=> (not res!478437) (not e!401866))))

(declare-datatypes ((List!13441 0))(
  ( (Nil!13438) (Cons!13437 (h!14482 (_ BitVec 64)) (t!19756 List!13441)) )
))
(declare-fun newAcc!49 () List!13441)

(declare-fun noDuplicate!1265 (List!13441) Bool)

(assert (=> b!715462 (= res!478437 (noDuplicate!1265 newAcc!49))))

(declare-fun b!715463 () Bool)

(declare-fun res!478438 () Bool)

(assert (=> b!715463 (=> (not res!478438) (not e!401866))))

(assert (=> b!715463 (= res!478438 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!715464 () Bool)

(declare-fun res!478433 () Bool)

(assert (=> b!715464 (=> (not res!478433) (not e!401866))))

(declare-fun acc!652 () List!13441)

(declare-fun arrayNoDuplicates!0 (array!40526 (_ BitVec 32) List!13441) Bool)

(assert (=> b!715464 (= res!478433 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!715465 () Bool)

(declare-fun res!478431 () Bool)

(assert (=> b!715465 (=> (not res!478431) (not e!401866))))

(declare-fun contains!4018 (List!13441 (_ BitVec 64)) Bool)

(assert (=> b!715465 (= res!478431 (not (contains!4018 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715466 () Bool)

(declare-fun res!478434 () Bool)

(assert (=> b!715466 (=> (not res!478434) (not e!401866))))

(assert (=> b!715466 (= res!478434 (noDuplicate!1265 acc!652))))

(declare-fun b!715467 () Bool)

(declare-fun res!478435 () Bool)

(assert (=> b!715467 (=> (not res!478435) (not e!401866))))

(assert (=> b!715467 (= res!478435 (validKeyInArray!0 k!2824))))

(declare-fun b!715468 () Bool)

(declare-fun res!478446 () Bool)

(assert (=> b!715468 (=> (not res!478446) (not e!401866))))

(assert (=> b!715468 (= res!478446 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19816 a!3591)))))

(declare-fun b!715469 () Bool)

(declare-fun res!478432 () Bool)

(assert (=> b!715469 (=> (not res!478432) (not e!401866))))

(declare-fun subseq!463 (List!13441 List!13441) Bool)

(assert (=> b!715469 (= res!478432 (subseq!463 acc!652 newAcc!49))))

(declare-fun b!715470 () Bool)

(declare-fun res!478445 () Bool)

(assert (=> b!715470 (=> (not res!478445) (not e!401866))))

(assert (=> b!715470 (= res!478445 (contains!4018 newAcc!49 k!2824))))

(declare-fun b!715471 () Bool)

(declare-fun res!478439 () Bool)

(assert (=> b!715471 (=> (not res!478439) (not e!401866))))

(assert (=> b!715471 (= res!478439 (not (contains!4018 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715472 () Bool)

(declare-fun res!478443 () Bool)

(assert (=> b!715472 (=> (not res!478443) (not e!401866))))

(declare-fun -!428 (List!13441 (_ BitVec 64)) List!13441)

(assert (=> b!715472 (= res!478443 (= (-!428 newAcc!49 k!2824) acc!652))))

(declare-fun b!715473 () Bool)

(assert (=> b!715473 (= e!401866 false)))

(declare-fun lt!318842 () Bool)

(assert (=> b!715473 (= lt!318842 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!715474 () Bool)

(declare-fun res!478430 () Bool)

(assert (=> b!715474 (=> (not res!478430) (not e!401866))))

(assert (=> b!715474 (= res!478430 (not (contains!4018 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715475 () Bool)

(declare-fun res!478436 () Bool)

(assert (=> b!715475 (=> (not res!478436) (not e!401866))))

(assert (=> b!715475 (= res!478436 (not (contains!4018 acc!652 k!2824)))))

(declare-fun b!715476 () Bool)

(declare-fun res!478444 () Bool)

(assert (=> b!715476 (=> (not res!478444) (not e!401866))))

(assert (=> b!715476 (= res!478444 (not (contains!4018 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715477 () Bool)

(declare-fun res!478441 () Bool)

(assert (=> b!715477 (=> (not res!478441) (not e!401866))))

(assert (=> b!715477 (= res!478441 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(assert (= (and start!63512 res!478442) b!715466))

(assert (= (and b!715466 res!478434) b!715462))

(assert (= (and b!715462 res!478437) b!715465))

(assert (= (and b!715465 res!478431) b!715476))

(assert (= (and b!715476 res!478444) b!715477))

(assert (= (and b!715477 res!478441) b!715475))

(assert (= (and b!715475 res!478436) b!715467))

(assert (= (and b!715467 res!478435) b!715464))

(assert (= (and b!715464 res!478433) b!715469))

(assert (= (and b!715469 res!478432) b!715470))

(assert (= (and b!715470 res!478445) b!715472))

(assert (= (and b!715472 res!478443) b!715474))

(assert (= (and b!715474 res!478430) b!715471))

(assert (= (and b!715471 res!478439) b!715468))

(assert (= (and b!715468 res!478446) b!715461))

(assert (= (and b!715461 res!478447) b!715463))

(assert (= (and b!715463 res!478438) b!715460))

(assert (= (and b!715460 res!478440) b!715473))

(declare-fun m!671695 () Bool)

(assert (=> b!715460 m!671695))

(declare-fun m!671697 () Bool)

(assert (=> b!715464 m!671697))

(declare-fun m!671699 () Bool)

(assert (=> b!715471 m!671699))

(declare-fun m!671701 () Bool)

(assert (=> b!715461 m!671701))

(assert (=> b!715461 m!671701))

(declare-fun m!671703 () Bool)

(assert (=> b!715461 m!671703))

(declare-fun m!671705 () Bool)

(assert (=> b!715466 m!671705))

(declare-fun m!671707 () Bool)

(assert (=> b!715473 m!671707))

(declare-fun m!671709 () Bool)

(assert (=> b!715474 m!671709))

(declare-fun m!671711 () Bool)

(assert (=> b!715476 m!671711))

(declare-fun m!671713 () Bool)

(assert (=> b!715472 m!671713))

(declare-fun m!671715 () Bool)

(assert (=> b!715465 m!671715))

(declare-fun m!671717 () Bool)

(assert (=> b!715470 m!671717))

(declare-fun m!671719 () Bool)

(assert (=> b!715477 m!671719))

(declare-fun m!671721 () Bool)

(assert (=> b!715462 m!671721))

(declare-fun m!671723 () Bool)

(assert (=> b!715469 m!671723))

(declare-fun m!671725 () Bool)

(assert (=> start!63512 m!671725))

(declare-fun m!671727 () Bool)

(assert (=> b!715467 m!671727))

(declare-fun m!671729 () Bool)

(assert (=> b!715475 m!671729))

(push 1)

(assert (not b!715477))

(assert (not b!715460))

(assert (not b!715464))

(assert (not b!715466))

(assert (not b!715476))

(assert (not b!715472))

(assert (not b!715467))

(assert (not b!715475))

(assert (not b!715473))

(assert (not b!715462))

(assert (not b!715461))

(assert (not b!715465))

(assert (not b!715471))

(assert (not b!715470))

(assert (not b!715474))

(assert (not b!715469))

(assert (not start!63512))

(check-sat)

