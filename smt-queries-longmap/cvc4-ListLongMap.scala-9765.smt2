; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115716 () Bool)

(assert start!115716)

(declare-fun b!1368345 () Bool)

(declare-fun e!775309 () Bool)

(declare-fun e!775308 () Bool)

(assert (=> b!1368345 (= e!775309 e!775308)))

(declare-fun res!911862 () Bool)

(assert (=> b!1368345 (=> (not res!911862) (not e!775308))))

(declare-datatypes ((array!92908 0))(
  ( (array!92909 (arr!44878 (Array (_ BitVec 32) (_ BitVec 64))) (size!45428 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92908)

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((List!31946 0))(
  ( (Nil!31943) (Cons!31942 (h!33151 (_ BitVec 64)) (t!46640 List!31946)) )
))
(declare-fun acc!866 () List!31946)

(declare-fun arrayNoDuplicates!0 (array!92908 (_ BitVec 32) List!31946) Bool)

(assert (=> b!1368345 (= res!911862 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45193 0))(
  ( (Unit!45194) )
))
(declare-fun lt!602049 () Unit!45193)

(declare-fun newAcc!98 () List!31946)

(declare-fun noDuplicateSubseq!217 (List!31946 List!31946) Unit!45193)

(assert (=> b!1368345 (= lt!602049 (noDuplicateSubseq!217 newAcc!98 acc!866))))

(declare-fun b!1368346 () Bool)

(assert (=> b!1368346 (= e!775308 false)))

(declare-fun lt!602050 () Bool)

(assert (=> b!1368346 (= lt!602050 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1368347 () Bool)

(declare-fun res!911859 () Bool)

(assert (=> b!1368347 (=> (not res!911859) (not e!775308))))

(assert (=> b!1368347 (= res!911859 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1368348 () Bool)

(declare-fun res!911861 () Bool)

(assert (=> b!1368348 (=> (not res!911861) (not e!775308))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368348 (= res!911861 (not (validKeyInArray!0 (select (arr!44878 a!3861) from!3239))))))

(declare-fun b!1368350 () Bool)

(declare-fun res!911855 () Bool)

(assert (=> b!1368350 (=> (not res!911855) (not e!775309))))

(declare-fun contains!9628 (List!31946 (_ BitVec 64)) Bool)

(assert (=> b!1368350 (= res!911855 (not (contains!9628 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368351 () Bool)

(declare-fun res!911860 () Bool)

(assert (=> b!1368351 (=> (not res!911860) (not e!775309))))

(assert (=> b!1368351 (= res!911860 (not (contains!9628 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368352 () Bool)

(declare-fun res!911858 () Bool)

(assert (=> b!1368352 (=> (not res!911858) (not e!775308))))

(assert (=> b!1368352 (= res!911858 (bvslt from!3239 (size!45428 a!3861)))))

(declare-fun b!1368353 () Bool)

(declare-fun res!911854 () Bool)

(assert (=> b!1368353 (=> (not res!911854) (not e!775309))))

(assert (=> b!1368353 (= res!911854 (not (contains!9628 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!911863 () Bool)

(assert (=> start!115716 (=> (not res!911863) (not e!775309))))

(assert (=> start!115716 (= res!911863 (and (bvslt (size!45428 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45428 a!3861))))))

(assert (=> start!115716 e!775309))

(declare-fun array_inv!33906 (array!92908) Bool)

(assert (=> start!115716 (array_inv!33906 a!3861)))

(assert (=> start!115716 true))

(declare-fun b!1368349 () Bool)

(declare-fun res!911857 () Bool)

(assert (=> b!1368349 (=> (not res!911857) (not e!775309))))

(declare-fun noDuplicate!2485 (List!31946) Bool)

(assert (=> b!1368349 (= res!911857 (noDuplicate!2485 acc!866))))

(declare-fun b!1368354 () Bool)

(declare-fun res!911853 () Bool)

(assert (=> b!1368354 (=> (not res!911853) (not e!775309))))

(declare-fun subseq!1030 (List!31946 List!31946) Bool)

(assert (=> b!1368354 (= res!911853 (subseq!1030 newAcc!98 acc!866))))

(declare-fun b!1368355 () Bool)

(declare-fun res!911856 () Bool)

(assert (=> b!1368355 (=> (not res!911856) (not e!775309))))

(assert (=> b!1368355 (= res!911856 (not (contains!9628 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115716 res!911863) b!1368349))

(assert (= (and b!1368349 res!911857) b!1368350))

(assert (= (and b!1368350 res!911855) b!1368355))

(assert (= (and b!1368355 res!911856) b!1368353))

(assert (= (and b!1368353 res!911854) b!1368351))

(assert (= (and b!1368351 res!911860) b!1368354))

(assert (= (and b!1368354 res!911853) b!1368345))

(assert (= (and b!1368345 res!911862) b!1368352))

(assert (= (and b!1368352 res!911858) b!1368348))

(assert (= (and b!1368348 res!911861) b!1368347))

(assert (= (and b!1368347 res!911859) b!1368346))

(declare-fun m!1252339 () Bool)

(assert (=> b!1368348 m!1252339))

(assert (=> b!1368348 m!1252339))

(declare-fun m!1252341 () Bool)

(assert (=> b!1368348 m!1252341))

(declare-fun m!1252343 () Bool)

(assert (=> b!1368354 m!1252343))

(declare-fun m!1252345 () Bool)

(assert (=> b!1368355 m!1252345))

(declare-fun m!1252347 () Bool)

(assert (=> b!1368345 m!1252347))

(declare-fun m!1252349 () Bool)

(assert (=> b!1368345 m!1252349))

(declare-fun m!1252351 () Bool)

(assert (=> b!1368351 m!1252351))

(declare-fun m!1252353 () Bool)

(assert (=> b!1368353 m!1252353))

(declare-fun m!1252355 () Bool)

(assert (=> start!115716 m!1252355))

(declare-fun m!1252357 () Bool)

(assert (=> b!1368350 m!1252357))

(declare-fun m!1252359 () Bool)

(assert (=> b!1368346 m!1252359))

(declare-fun m!1252361 () Bool)

(assert (=> b!1368349 m!1252361))

(push 1)

(assert (not b!1368353))

(assert (not b!1368349))

(assert (not b!1368346))

