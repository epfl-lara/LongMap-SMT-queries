; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63500 () Bool)

(assert start!63500)

(declare-fun b!715136 () Bool)

(declare-fun res!478110 () Bool)

(declare-fun e!401831 () Bool)

(assert (=> b!715136 (=> (not res!478110) (not e!401831))))

(declare-datatypes ((List!13435 0))(
  ( (Nil!13432) (Cons!13431 (h!14476 (_ BitVec 64)) (t!19750 List!13435)) )
))
(declare-fun acc!652 () List!13435)

(declare-fun contains!4012 (List!13435 (_ BitVec 64)) Bool)

(assert (=> b!715136 (= res!478110 (not (contains!4012 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715137 () Bool)

(declare-fun res!478108 () Bool)

(assert (=> b!715137 (=> (not res!478108) (not e!401831))))

(declare-fun newAcc!49 () List!13435)

(declare-fun subseq!457 (List!13435 List!13435) Bool)

(assert (=> b!715137 (= res!478108 (subseq!457 acc!652 newAcc!49))))

(declare-fun b!715138 () Bool)

(declare-fun res!478114 () Bool)

(assert (=> b!715138 (=> (not res!478114) (not e!401831))))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40514 0))(
  ( (array!40515 (arr!19394 (Array (_ BitVec 32) (_ BitVec 64))) (size!19810 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40514)

(assert (=> b!715138 (= res!478114 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19810 a!3591)))))

(declare-fun b!715139 () Bool)

(declare-fun res!478117 () Bool)

(assert (=> b!715139 (=> (not res!478117) (not e!401831))))

(declare-fun noDuplicate!1259 (List!13435) Bool)

(assert (=> b!715139 (= res!478117 (noDuplicate!1259 acc!652))))

(declare-fun b!715140 () Bool)

(declare-fun res!478115 () Bool)

(assert (=> b!715140 (=> (not res!478115) (not e!401831))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun -!422 (List!13435 (_ BitVec 64)) List!13435)

(assert (=> b!715140 (= res!478115 (= (-!422 newAcc!49 k!2824) acc!652))))

(declare-fun b!715141 () Bool)

(declare-fun res!478119 () Bool)

(assert (=> b!715141 (=> (not res!478119) (not e!401831))))

(assert (=> b!715141 (= res!478119 (not (contains!4012 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715142 () Bool)

(declare-fun res!478122 () Bool)

(assert (=> b!715142 (=> (not res!478122) (not e!401831))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!715142 (= res!478122 (validKeyInArray!0 k!2824))))

(declare-fun b!715143 () Bool)

(declare-fun res!478106 () Bool)

(assert (=> b!715143 (=> (not res!478106) (not e!401831))))

(declare-fun arrayContainsKey!0 (array!40514 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!715143 (= res!478106 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!715144 () Bool)

(declare-fun res!478116 () Bool)

(assert (=> b!715144 (=> (not res!478116) (not e!401831))))

(declare-fun arrayNoDuplicates!0 (array!40514 (_ BitVec 32) List!13435) Bool)

(assert (=> b!715144 (= res!478116 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!715145 () Bool)

(declare-fun res!478120 () Bool)

(assert (=> b!715145 (=> (not res!478120) (not e!401831))))

(assert (=> b!715145 (= res!478120 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun res!478112 () Bool)

(assert (=> start!63500 (=> (not res!478112) (not e!401831))))

(assert (=> start!63500 (= res!478112 (and (bvslt (size!19810 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19810 a!3591))))))

(assert (=> start!63500 e!401831))

(assert (=> start!63500 true))

(declare-fun array_inv!15190 (array!40514) Bool)

(assert (=> start!63500 (array_inv!15190 a!3591)))

(declare-fun b!715146 () Bool)

(declare-fun res!478113 () Bool)

(assert (=> b!715146 (=> (not res!478113) (not e!401831))))

(assert (=> b!715146 (= res!478113 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!715147 () Bool)

(declare-fun res!478109 () Bool)

(assert (=> b!715147 (=> (not res!478109) (not e!401831))))

(assert (=> b!715147 (= res!478109 (noDuplicate!1259 newAcc!49))))

(declare-fun b!715148 () Bool)

(declare-fun res!478107 () Bool)

(assert (=> b!715148 (=> (not res!478107) (not e!401831))))

(assert (=> b!715148 (= res!478107 (not (contains!4012 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715149 () Bool)

(declare-fun res!478123 () Bool)

(assert (=> b!715149 (=> (not res!478123) (not e!401831))))

(assert (=> b!715149 (= res!478123 (not (contains!4012 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715150 () Bool)

(declare-fun res!478118 () Bool)

(assert (=> b!715150 (=> (not res!478118) (not e!401831))))

(assert (=> b!715150 (= res!478118 (not (validKeyInArray!0 (select (arr!19394 a!3591) from!2969))))))

(declare-fun b!715151 () Bool)

(assert (=> b!715151 (= e!401831 false)))

(declare-fun lt!318824 () Bool)

(assert (=> b!715151 (= lt!318824 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!715152 () Bool)

(declare-fun res!478121 () Bool)

(assert (=> b!715152 (=> (not res!478121) (not e!401831))))

(assert (=> b!715152 (= res!478121 (not (contains!4012 acc!652 k!2824)))))

(declare-fun b!715153 () Bool)

(declare-fun res!478111 () Bool)

(assert (=> b!715153 (=> (not res!478111) (not e!401831))))

(assert (=> b!715153 (= res!478111 (contains!4012 newAcc!49 k!2824))))

(assert (= (and start!63500 res!478112) b!715139))

(assert (= (and b!715139 res!478117) b!715147))

(assert (= (and b!715147 res!478109) b!715136))

(assert (= (and b!715136 res!478110) b!715149))

(assert (= (and b!715149 res!478123) b!715143))

(assert (= (and b!715143 res!478106) b!715152))

(assert (= (and b!715152 res!478121) b!715142))

(assert (= (and b!715142 res!478122) b!715144))

(assert (= (and b!715144 res!478116) b!715137))

(assert (= (and b!715137 res!478108) b!715153))

(assert (= (and b!715153 res!478111) b!715140))

(assert (= (and b!715140 res!478115) b!715148))

(assert (= (and b!715148 res!478107) b!715141))

(assert (= (and b!715141 res!478119) b!715138))

(assert (= (and b!715138 res!478114) b!715150))

(assert (= (and b!715150 res!478118) b!715146))

(assert (= (and b!715146 res!478113) b!715145))

(assert (= (and b!715145 res!478120) b!715151))

(declare-fun m!671479 () Bool)

(assert (=> b!715141 m!671479))

(declare-fun m!671481 () Bool)

(assert (=> start!63500 m!671481))

(declare-fun m!671483 () Bool)

(assert (=> b!715137 m!671483))

(declare-fun m!671485 () Bool)

(assert (=> b!715143 m!671485))

(declare-fun m!671487 () Bool)

(assert (=> b!715149 m!671487))

(declare-fun m!671489 () Bool)

(assert (=> b!715147 m!671489))

(declare-fun m!671491 () Bool)

(assert (=> b!715140 m!671491))

(declare-fun m!671493 () Bool)

(assert (=> b!715150 m!671493))

(assert (=> b!715150 m!671493))

(declare-fun m!671495 () Bool)

(assert (=> b!715150 m!671495))

(declare-fun m!671497 () Bool)

(assert (=> b!715153 m!671497))

(declare-fun m!671499 () Bool)

(assert (=> b!715144 m!671499))

(declare-fun m!671501 () Bool)

(assert (=> b!715151 m!671501))

(declare-fun m!671503 () Bool)

(assert (=> b!715152 m!671503))

(declare-fun m!671505 () Bool)

(assert (=> b!715145 m!671505))

(declare-fun m!671507 () Bool)

(assert (=> b!715139 m!671507))

(declare-fun m!671509 () Bool)

(assert (=> b!715142 m!671509))

(declare-fun m!671511 () Bool)

(assert (=> b!715148 m!671511))

(declare-fun m!671513 () Bool)

(assert (=> b!715136 m!671513))

(push 1)

(assert (not b!715148))

(assert (not b!715140))

(assert (not b!715141))

(assert (not b!715150))

(assert (not start!63500))

(assert (not b!715145))

(assert (not b!715153))

(assert (not b!715151))

(assert (not b!715147))

(assert (not b!715144))

(assert (not b!715152))

(assert (not b!715142))

(assert (not b!715137))

(assert (not b!715143))

(assert (not b!715136))

(assert (not b!715139))

(assert (not b!715149))

(check-sat)

(pop 1)

