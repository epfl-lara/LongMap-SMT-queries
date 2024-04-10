; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60306 () Bool)

(assert start!60306)

(declare-fun b!677015 () Bool)

(declare-fun res!443449 () Bool)

(declare-fun e!386015 () Bool)

(assert (=> b!677015 (=> (not res!443449) (not e!386015))))

(declare-datatypes ((List!12910 0))(
  ( (Nil!12907) (Cons!12906 (h!13951 (_ BitVec 64)) (t!19138 List!12910)) )
))
(declare-fun acc!681 () List!12910)

(declare-fun contains!3487 (List!12910 (_ BitVec 64)) Bool)

(assert (=> b!677015 (= res!443449 (not (contains!3487 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677016 () Bool)

(assert (=> b!677016 (= e!386015 false)))

(declare-fun lt!312805 () Bool)

(declare-datatypes ((array!39353 0))(
  ( (array!39354 (arr!18869 (Array (_ BitVec 32) (_ BitVec 64))) (size!19233 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39353)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39353 (_ BitVec 32) List!12910) Bool)

(assert (=> b!677016 (= lt!312805 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677017 () Bool)

(declare-fun res!443451 () Bool)

(assert (=> b!677017 (=> (not res!443451) (not e!386015))))

(declare-fun e!386019 () Bool)

(assert (=> b!677017 (= res!443451 e!386019)))

(declare-fun res!443450 () Bool)

(assert (=> b!677017 (=> res!443450 e!386019)))

(declare-fun e!386021 () Bool)

(assert (=> b!677017 (= res!443450 e!386021)))

(declare-fun res!443453 () Bool)

(assert (=> b!677017 (=> (not res!443453) (not e!386021))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!677017 (= res!443453 (bvsgt from!3004 i!1382))))

(declare-fun b!677018 () Bool)

(declare-fun res!443446 () Bool)

(assert (=> b!677018 (=> (not res!443446) (not e!386015))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!677018 (= res!443446 (validKeyInArray!0 k!2843))))

(declare-fun b!677019 () Bool)

(declare-fun res!443452 () Bool)

(assert (=> b!677019 (=> (not res!443452) (not e!386015))))

(assert (=> b!677019 (= res!443452 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12907))))

(declare-fun b!677020 () Bool)

(assert (=> b!677020 (= e!386021 (contains!3487 acc!681 k!2843))))

(declare-fun b!677021 () Bool)

(declare-fun e!386017 () Bool)

(assert (=> b!677021 (= e!386017 (not (contains!3487 acc!681 k!2843)))))

(declare-fun res!443441 () Bool)

(assert (=> start!60306 (=> (not res!443441) (not e!386015))))

(assert (=> start!60306 (= res!443441 (and (bvslt (size!19233 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19233 a!3626))))))

(assert (=> start!60306 e!386015))

(assert (=> start!60306 true))

(declare-fun array_inv!14665 (array!39353) Bool)

(assert (=> start!60306 (array_inv!14665 a!3626)))

(declare-fun b!677014 () Bool)

(declare-fun e!386022 () Bool)

(assert (=> b!677014 (= e!386022 e!386017)))

(declare-fun res!443458 () Bool)

(assert (=> b!677014 (=> (not res!443458) (not e!386017))))

(assert (=> b!677014 (= res!443458 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677022 () Bool)

(declare-fun res!443440 () Bool)

(assert (=> b!677022 (=> (not res!443440) (not e!386015))))

(assert (=> b!677022 (= res!443440 (not (contains!3487 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677023 () Bool)

(declare-fun res!443459 () Bool)

(assert (=> b!677023 (=> (not res!443459) (not e!386015))))

(assert (=> b!677023 (= res!443459 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19233 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!677024 () Bool)

(declare-fun res!443444 () Bool)

(assert (=> b!677024 (=> (not res!443444) (not e!386015))))

(declare-fun arrayContainsKey!0 (array!39353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!677024 (= res!443444 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!677025 () Bool)

(declare-fun e!386016 () Bool)

(assert (=> b!677025 (= e!386016 (not (contains!3487 acc!681 k!2843)))))

(declare-fun b!677026 () Bool)

(declare-fun res!443455 () Bool)

(assert (=> b!677026 (=> (not res!443455) (not e!386015))))

(assert (=> b!677026 (= res!443455 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!677027 () Bool)

(declare-fun e!386020 () Bool)

(assert (=> b!677027 (= e!386020 (contains!3487 acc!681 k!2843))))

(declare-fun b!677028 () Bool)

(declare-fun res!443447 () Bool)

(assert (=> b!677028 (=> (not res!443447) (not e!386015))))

(assert (=> b!677028 (= res!443447 (not (validKeyInArray!0 (select (arr!18869 a!3626) from!3004))))))

(declare-fun b!677029 () Bool)

(declare-fun res!443445 () Bool)

(assert (=> b!677029 (=> (not res!443445) (not e!386015))))

(declare-fun noDuplicate!734 (List!12910) Bool)

(assert (=> b!677029 (= res!443445 (noDuplicate!734 acc!681))))

(declare-fun b!677030 () Bool)

(declare-fun res!443448 () Bool)

(assert (=> b!677030 (=> (not res!443448) (not e!386015))))

(assert (=> b!677030 (= res!443448 e!386022)))

(declare-fun res!443442 () Bool)

(assert (=> b!677030 (=> res!443442 e!386022)))

(assert (=> b!677030 (= res!443442 e!386020)))

(declare-fun res!443443 () Bool)

(assert (=> b!677030 (=> (not res!443443) (not e!386020))))

(assert (=> b!677030 (= res!443443 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677031 () Bool)

(assert (=> b!677031 (= e!386019 e!386016)))

(declare-fun res!443457 () Bool)

(assert (=> b!677031 (=> (not res!443457) (not e!386016))))

(assert (=> b!677031 (= res!443457 (bvsle from!3004 i!1382))))

(declare-fun b!677032 () Bool)

(declare-fun res!443454 () Bool)

(assert (=> b!677032 (=> (not res!443454) (not e!386015))))

(assert (=> b!677032 (= res!443454 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!677033 () Bool)

(declare-fun res!443456 () Bool)

(assert (=> b!677033 (=> (not res!443456) (not e!386015))))

(assert (=> b!677033 (= res!443456 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19233 a!3626))))))

(assert (= (and start!60306 res!443441) b!677029))

(assert (= (and b!677029 res!443445) b!677015))

(assert (= (and b!677015 res!443449) b!677022))

(assert (= (and b!677022 res!443440) b!677017))

(assert (= (and b!677017 res!443453) b!677020))

(assert (= (and b!677017 (not res!443450)) b!677031))

(assert (= (and b!677031 res!443457) b!677025))

(assert (= (and b!677017 res!443451) b!677019))

(assert (= (and b!677019 res!443452) b!677026))

(assert (= (and b!677026 res!443455) b!677033))

(assert (= (and b!677033 res!443456) b!677018))

(assert (= (and b!677018 res!443446) b!677024))

(assert (= (and b!677024 res!443444) b!677023))

(assert (= (and b!677023 res!443459) b!677028))

(assert (= (and b!677028 res!443447) b!677032))

(assert (= (and b!677032 res!443454) b!677030))

(assert (= (and b!677030 res!443443) b!677027))

(assert (= (and b!677030 (not res!443442)) b!677014))

(assert (= (and b!677014 res!443458) b!677021))

(assert (= (and b!677030 res!443448) b!677016))

(declare-fun m!643523 () Bool)

(assert (=> b!677022 m!643523))

(declare-fun m!643525 () Bool)

(assert (=> b!677028 m!643525))

(assert (=> b!677028 m!643525))

(declare-fun m!643527 () Bool)

(assert (=> b!677028 m!643527))

(declare-fun m!643529 () Bool)

(assert (=> b!677026 m!643529))

(declare-fun m!643531 () Bool)

(assert (=> b!677029 m!643531))

(declare-fun m!643533 () Bool)

(assert (=> b!677021 m!643533))

(declare-fun m!643535 () Bool)

(assert (=> b!677016 m!643535))

(declare-fun m!643537 () Bool)

(assert (=> start!60306 m!643537))

(declare-fun m!643539 () Bool)

(assert (=> b!677015 m!643539))

(declare-fun m!643541 () Bool)

(assert (=> b!677018 m!643541))

(assert (=> b!677025 m!643533))

(declare-fun m!643543 () Bool)

(assert (=> b!677024 m!643543))

(declare-fun m!643545 () Bool)

(assert (=> b!677019 m!643545))

(assert (=> b!677027 m!643533))

(assert (=> b!677020 m!643533))

(push 1)

(assert (not b!677025))

(assert (not b!677027))

(assert (not b!677019))

(assert (not b!677015))

(assert (not b!677020))

(assert (not b!677018))

(assert (not b!677021))

(assert (not b!677016))

(assert (not b!677028))

(assert (not b!677026))

(assert (not start!60306))

(assert (not b!677022))

(assert (not b!677024))

(assert (not b!677029))

(check-sat)

