; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60348 () Bool)

(assert start!60348)

(declare-fun b!678060 () Bool)

(declare-fun e!386445 () Bool)

(declare-datatypes ((List!12931 0))(
  ( (Nil!12928) (Cons!12927 (h!13972 (_ BitVec 64)) (t!19159 List!12931)) )
))
(declare-fun acc!681 () List!12931)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3508 (List!12931 (_ BitVec 64)) Bool)

(assert (=> b!678060 (= e!386445 (contains!3508 acc!681 k!2843))))

(declare-fun b!678061 () Bool)

(declare-fun res!444491 () Bool)

(declare-fun e!386443 () Bool)

(assert (=> b!678061 (=> (not res!444491) (not e!386443))))

(declare-fun e!386444 () Bool)

(assert (=> b!678061 (= res!444491 e!386444)))

(declare-fun res!444490 () Bool)

(assert (=> b!678061 (=> res!444490 e!386444)))

(assert (=> b!678061 (= res!444490 e!386445)))

(declare-fun res!444487 () Bool)

(assert (=> b!678061 (=> (not res!444487) (not e!386445))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!678061 (= res!444487 (bvsgt from!3004 i!1382))))

(declare-fun b!678062 () Bool)

(declare-fun res!444492 () Bool)

(assert (=> b!678062 (=> (not res!444492) (not e!386443))))

(declare-datatypes ((array!39395 0))(
  ( (array!39396 (arr!18890 (Array (_ BitVec 32) (_ BitVec 64))) (size!19254 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39395)

(declare-fun arrayNoDuplicates!0 (array!39395 (_ BitVec 32) List!12931) Bool)

(assert (=> b!678062 (= res!444492 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12928))))

(declare-fun b!678063 () Bool)

(declare-fun e!386442 () Bool)

(assert (=> b!678063 (= e!386442 (not (contains!3508 acc!681 k!2843)))))

(declare-fun b!678064 () Bool)

(declare-fun res!444488 () Bool)

(assert (=> b!678064 (=> (not res!444488) (not e!386443))))

(assert (=> b!678064 (= res!444488 (not (contains!3508 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!444494 () Bool)

(assert (=> start!60348 (=> (not res!444494) (not e!386443))))

(assert (=> start!60348 (= res!444494 (and (bvslt (size!19254 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19254 a!3626))))))

(assert (=> start!60348 e!386443))

(assert (=> start!60348 true))

(declare-fun array_inv!14686 (array!39395) Bool)

(assert (=> start!60348 (array_inv!14686 a!3626)))

(declare-fun b!678065 () Bool)

(declare-fun res!444489 () Bool)

(assert (=> b!678065 (=> (not res!444489) (not e!386443))))

(assert (=> b!678065 (= res!444489 (not (contains!3508 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678066 () Bool)

(assert (=> b!678066 (= e!386443 false)))

(declare-fun lt!312859 () Bool)

(assert (=> b!678066 (= lt!312859 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678067 () Bool)

(declare-fun res!444493 () Bool)

(assert (=> b!678067 (=> (not res!444493) (not e!386443))))

(declare-fun noDuplicate!755 (List!12931) Bool)

(assert (=> b!678067 (= res!444493 (noDuplicate!755 acc!681))))

(declare-fun b!678068 () Bool)

(assert (=> b!678068 (= e!386444 e!386442)))

(declare-fun res!444486 () Bool)

(assert (=> b!678068 (=> (not res!444486) (not e!386442))))

(assert (=> b!678068 (= res!444486 (bvsle from!3004 i!1382))))

(assert (= (and start!60348 res!444494) b!678067))

(assert (= (and b!678067 res!444493) b!678064))

(assert (= (and b!678064 res!444488) b!678065))

(assert (= (and b!678065 res!444489) b!678061))

(assert (= (and b!678061 res!444487) b!678060))

(assert (= (and b!678061 (not res!444490)) b!678068))

(assert (= (and b!678068 res!444486) b!678063))

(assert (= (and b!678061 res!444491) b!678062))

(assert (= (and b!678062 res!444492) b!678066))

(declare-fun m!644031 () Bool)

(assert (=> b!678060 m!644031))

(declare-fun m!644033 () Bool)

(assert (=> b!678065 m!644033))

(declare-fun m!644035 () Bool)

(assert (=> start!60348 m!644035))

(assert (=> b!678063 m!644031))

(declare-fun m!644037 () Bool)

(assert (=> b!678064 m!644037))

(declare-fun m!644039 () Bool)

(assert (=> b!678067 m!644039))

(declare-fun m!644041 () Bool)

(assert (=> b!678062 m!644041))

(declare-fun m!644043 () Bool)

(assert (=> b!678066 m!644043))

(push 1)

(assert (not b!678064))

(assert (not b!678066))

(assert (not b!678062))

(assert (not b!678065))

(assert (not b!678060))

(assert (not start!60348))

(assert (not b!678063))

(assert (not b!678067))

(check-sat)

