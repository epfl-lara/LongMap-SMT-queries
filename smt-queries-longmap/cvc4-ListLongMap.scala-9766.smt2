; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115722 () Bool)

(assert start!115722)

(declare-fun b!1368444 () Bool)

(declare-fun e!775334 () Bool)

(declare-fun e!775336 () Bool)

(assert (=> b!1368444 (= e!775334 e!775336)))

(declare-fun res!911959 () Bool)

(assert (=> b!1368444 (=> (not res!911959) (not e!775336))))

(declare-datatypes ((array!92914 0))(
  ( (array!92915 (arr!44881 (Array (_ BitVec 32) (_ BitVec 64))) (size!45431 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92914)

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((List!31949 0))(
  ( (Nil!31946) (Cons!31945 (h!33154 (_ BitVec 64)) (t!46643 List!31949)) )
))
(declare-fun acc!866 () List!31949)

(declare-fun arrayNoDuplicates!0 (array!92914 (_ BitVec 32) List!31949) Bool)

(assert (=> b!1368444 (= res!911959 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45199 0))(
  ( (Unit!45200) )
))
(declare-fun lt!602067 () Unit!45199)

(declare-fun newAcc!98 () List!31949)

(declare-fun noDuplicateSubseq!220 (List!31949 List!31949) Unit!45199)

(assert (=> b!1368444 (= lt!602067 (noDuplicateSubseq!220 newAcc!98 acc!866))))

(declare-fun res!911962 () Bool)

(assert (=> start!115722 (=> (not res!911962) (not e!775334))))

(assert (=> start!115722 (= res!911962 (and (bvslt (size!45431 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45431 a!3861))))))

(assert (=> start!115722 e!775334))

(declare-fun array_inv!33909 (array!92914) Bool)

(assert (=> start!115722 (array_inv!33909 a!3861)))

(assert (=> start!115722 true))

(declare-fun b!1368445 () Bool)

(declare-fun res!911953 () Bool)

(assert (=> b!1368445 (=> (not res!911953) (not e!775334))))

(declare-fun contains!9631 (List!31949 (_ BitVec 64)) Bool)

(assert (=> b!1368445 (= res!911953 (not (contains!9631 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368446 () Bool)

(declare-fun res!911960 () Bool)

(assert (=> b!1368446 (=> (not res!911960) (not e!775334))))

(declare-fun subseq!1033 (List!31949 List!31949) Bool)

(assert (=> b!1368446 (= res!911960 (subseq!1033 newAcc!98 acc!866))))

(declare-fun b!1368447 () Bool)

(declare-fun res!911955 () Bool)

(assert (=> b!1368447 (=> (not res!911955) (not e!775336))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368447 (= res!911955 (not (validKeyInArray!0 (select (arr!44881 a!3861) from!3239))))))

(declare-fun b!1368448 () Bool)

(declare-fun res!911954 () Bool)

(assert (=> b!1368448 (=> (not res!911954) (not e!775334))))

(assert (=> b!1368448 (= res!911954 (not (contains!9631 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368449 () Bool)

(declare-fun res!911952 () Bool)

(assert (=> b!1368449 (=> (not res!911952) (not e!775336))))

(assert (=> b!1368449 (= res!911952 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1368450 () Bool)

(declare-fun res!911961 () Bool)

(assert (=> b!1368450 (=> (not res!911961) (not e!775334))))

(assert (=> b!1368450 (= res!911961 (not (contains!9631 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368451 () Bool)

(declare-fun res!911956 () Bool)

(assert (=> b!1368451 (=> (not res!911956) (not e!775334))))

(declare-fun noDuplicate!2488 (List!31949) Bool)

(assert (=> b!1368451 (= res!911956 (noDuplicate!2488 acc!866))))

(declare-fun b!1368452 () Bool)

(assert (=> b!1368452 (= e!775336 false)))

(declare-fun lt!602068 () Bool)

(assert (=> b!1368452 (= lt!602068 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1368453 () Bool)

(declare-fun res!911958 () Bool)

(assert (=> b!1368453 (=> (not res!911958) (not e!775334))))

(assert (=> b!1368453 (= res!911958 (not (contains!9631 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368454 () Bool)

(declare-fun res!911957 () Bool)

(assert (=> b!1368454 (=> (not res!911957) (not e!775336))))

(assert (=> b!1368454 (= res!911957 (bvslt from!3239 (size!45431 a!3861)))))

(assert (= (and start!115722 res!911962) b!1368451))

(assert (= (and b!1368451 res!911956) b!1368453))

(assert (= (and b!1368453 res!911958) b!1368448))

(assert (= (and b!1368448 res!911954) b!1368450))

(assert (= (and b!1368450 res!911961) b!1368445))

(assert (= (and b!1368445 res!911953) b!1368446))

(assert (= (and b!1368446 res!911960) b!1368444))

(assert (= (and b!1368444 res!911959) b!1368454))

(assert (= (and b!1368454 res!911957) b!1368447))

(assert (= (and b!1368447 res!911955) b!1368449))

(assert (= (and b!1368449 res!911952) b!1368452))

(declare-fun m!1252411 () Bool)

(assert (=> b!1368446 m!1252411))

(declare-fun m!1252413 () Bool)

(assert (=> b!1368452 m!1252413))

(declare-fun m!1252415 () Bool)

(assert (=> b!1368447 m!1252415))

(assert (=> b!1368447 m!1252415))

(declare-fun m!1252417 () Bool)

(assert (=> b!1368447 m!1252417))

(declare-fun m!1252419 () Bool)

(assert (=> b!1368444 m!1252419))

(declare-fun m!1252421 () Bool)

(assert (=> b!1368444 m!1252421))

(declare-fun m!1252423 () Bool)

(assert (=> b!1368445 m!1252423))

(declare-fun m!1252425 () Bool)

(assert (=> b!1368450 m!1252425))

(declare-fun m!1252427 () Bool)

(assert (=> b!1368448 m!1252427))

(declare-fun m!1252429 () Bool)

(assert (=> b!1368451 m!1252429))

(declare-fun m!1252431 () Bool)

(assert (=> b!1368453 m!1252431))

(declare-fun m!1252433 () Bool)

(assert (=> start!115722 m!1252433))

(push 1)

(assert (not b!1368444))

(assert (not b!1368446))

(assert (not b!1368453))

(assert (not b!1368447))

