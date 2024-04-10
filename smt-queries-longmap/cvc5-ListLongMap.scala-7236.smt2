; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92478 () Bool)

(assert start!92478)

(declare-fun b!1051545 () Bool)

(declare-fun e!596933 () Bool)

(assert (=> b!1051545 (= e!596933 true)))

(declare-fun lt!464311 () Bool)

(declare-datatypes ((List!22191 0))(
  ( (Nil!22188) (Cons!22187 (h!23396 (_ BitVec 64)) (t!31498 List!22191)) )
))
(declare-fun contains!6133 (List!22191 (_ BitVec 64)) Bool)

(assert (=> b!1051545 (= lt!464311 (contains!6133 Nil!22188 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051546 () Bool)

(declare-fun e!596928 () Bool)

(declare-fun e!596931 () Bool)

(assert (=> b!1051546 (= e!596928 e!596931)))

(declare-fun res!700678 () Bool)

(assert (=> b!1051546 (=> res!700678 e!596931)))

(declare-fun lt!464315 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051546 (= res!700678 (or (bvsgt lt!464315 i!1381) (bvsle i!1381 lt!464315)))))

(declare-fun b!1051547 () Bool)

(declare-fun res!700681 () Bool)

(declare-fun e!596934 () Bool)

(assert (=> b!1051547 (=> (not res!700681) (not e!596934))))

(declare-datatypes ((array!66279 0))(
  ( (array!66280 (arr!31879 (Array (_ BitVec 32) (_ BitVec 64))) (size!32415 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66279)

(declare-fun k!2747 () (_ BitVec 64))

(assert (=> b!1051547 (= res!700681 (= (select (arr!31879 a!3488) i!1381) k!2747))))

(declare-fun b!1051548 () Bool)

(declare-fun arrayContainsKey!0 (array!66279 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051548 (= e!596931 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1051549 () Bool)

(declare-fun res!700672 () Bool)

(assert (=> b!1051549 (=> (not res!700672) (not e!596934))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051549 (= res!700672 (validKeyInArray!0 k!2747))))

(declare-fun b!1051550 () Bool)

(declare-fun e!596930 () Bool)

(declare-fun e!596929 () Bool)

(assert (=> b!1051550 (= e!596930 e!596929)))

(declare-fun res!700682 () Bool)

(assert (=> b!1051550 (=> (not res!700682) (not e!596929))))

(assert (=> b!1051550 (= res!700682 (not (= lt!464315 i!1381)))))

(declare-fun lt!464312 () array!66279)

(declare-fun arrayScanForKey!0 (array!66279 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051550 (= lt!464315 (arrayScanForKey!0 lt!464312 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051551 () Bool)

(assert (=> b!1051551 (= e!596934 e!596930)))

(declare-fun res!700675 () Bool)

(assert (=> b!1051551 (=> (not res!700675) (not e!596930))))

(assert (=> b!1051551 (= res!700675 (arrayContainsKey!0 lt!464312 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051551 (= lt!464312 (array!66280 (store (arr!31879 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32415 a!3488)))))

(declare-fun b!1051552 () Bool)

(declare-fun e!596935 () Bool)

(assert (=> b!1051552 (= e!596935 e!596933)))

(declare-fun res!700676 () Bool)

(assert (=> b!1051552 (=> res!700676 e!596933)))

(declare-fun lt!464314 () (_ BitVec 32))

(assert (=> b!1051552 (= res!700676 (or (bvslt lt!464315 #b00000000000000000000000000000000) (bvsge lt!464314 (size!32415 a!3488)) (bvsge lt!464315 (size!32415 a!3488))))))

(assert (=> b!1051552 (arrayContainsKey!0 a!3488 k!2747 lt!464314)))

(declare-datatypes ((Unit!34430 0))(
  ( (Unit!34431) )
))
(declare-fun lt!464316 () Unit!34430)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66279 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34430)

(assert (=> b!1051552 (= lt!464316 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!464314))))

(assert (=> b!1051552 (= lt!464314 (bvadd #b00000000000000000000000000000001 lt!464315))))

(declare-fun arrayNoDuplicates!0 (array!66279 (_ BitVec 32) List!22191) Bool)

(assert (=> b!1051552 (arrayNoDuplicates!0 a!3488 lt!464315 Nil!22188)))

(declare-fun lt!464313 () Unit!34430)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66279 (_ BitVec 32) (_ BitVec 32)) Unit!34430)

(assert (=> b!1051552 (= lt!464313 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464315))))

(declare-fun b!1051553 () Bool)

(declare-fun res!700671 () Bool)

(assert (=> b!1051553 (=> res!700671 e!596933)))

(assert (=> b!1051553 (= res!700671 (contains!6133 Nil!22188 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051554 () Bool)

(declare-fun res!700679 () Bool)

(assert (=> b!1051554 (=> res!700679 e!596933)))

(declare-fun noDuplicate!1518 (List!22191) Bool)

(assert (=> b!1051554 (= res!700679 (not (noDuplicate!1518 Nil!22188)))))

(declare-fun b!1051556 () Bool)

(declare-fun res!700673 () Bool)

(assert (=> b!1051556 (=> (not res!700673) (not e!596934))))

(assert (=> b!1051556 (= res!700673 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22188))))

(declare-fun b!1051555 () Bool)

(assert (=> b!1051555 (= e!596929 (not e!596935))))

(declare-fun res!700680 () Bool)

(assert (=> b!1051555 (=> res!700680 e!596935)))

(assert (=> b!1051555 (= res!700680 (or (bvsgt lt!464315 i!1381) (bvsle i!1381 lt!464315)))))

(assert (=> b!1051555 e!596928))

(declare-fun res!700677 () Bool)

(assert (=> b!1051555 (=> (not res!700677) (not e!596928))))

(assert (=> b!1051555 (= res!700677 (= (select (store (arr!31879 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464315) k!2747))))

(declare-fun res!700674 () Bool)

(assert (=> start!92478 (=> (not res!700674) (not e!596934))))

(assert (=> start!92478 (= res!700674 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32415 a!3488)) (bvslt (size!32415 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92478 e!596934))

(assert (=> start!92478 true))

(declare-fun array_inv!24659 (array!66279) Bool)

(assert (=> start!92478 (array_inv!24659 a!3488)))

(assert (= (and start!92478 res!700674) b!1051556))

(assert (= (and b!1051556 res!700673) b!1051549))

(assert (= (and b!1051549 res!700672) b!1051547))

(assert (= (and b!1051547 res!700681) b!1051551))

(assert (= (and b!1051551 res!700675) b!1051550))

(assert (= (and b!1051550 res!700682) b!1051555))

(assert (= (and b!1051555 res!700677) b!1051546))

(assert (= (and b!1051546 (not res!700678)) b!1051548))

(assert (= (and b!1051555 (not res!700680)) b!1051552))

(assert (= (and b!1051552 (not res!700676)) b!1051554))

(assert (= (and b!1051554 (not res!700679)) b!1051553))

(assert (= (and b!1051553 (not res!700671)) b!1051545))

(declare-fun m!972023 () Bool)

(assert (=> b!1051555 m!972023))

(declare-fun m!972025 () Bool)

(assert (=> b!1051555 m!972025))

(declare-fun m!972027 () Bool)

(assert (=> b!1051551 m!972027))

(assert (=> b!1051551 m!972023))

(declare-fun m!972029 () Bool)

(assert (=> b!1051554 m!972029))

(declare-fun m!972031 () Bool)

(assert (=> b!1051550 m!972031))

(declare-fun m!972033 () Bool)

(assert (=> b!1051553 m!972033))

(declare-fun m!972035 () Bool)

(assert (=> b!1051552 m!972035))

(declare-fun m!972037 () Bool)

(assert (=> b!1051552 m!972037))

(declare-fun m!972039 () Bool)

(assert (=> b!1051552 m!972039))

(declare-fun m!972041 () Bool)

(assert (=> b!1051552 m!972041))

(declare-fun m!972043 () Bool)

(assert (=> b!1051547 m!972043))

(declare-fun m!972045 () Bool)

(assert (=> b!1051556 m!972045))

(declare-fun m!972047 () Bool)

(assert (=> b!1051545 m!972047))

(declare-fun m!972049 () Bool)

(assert (=> start!92478 m!972049))

(declare-fun m!972051 () Bool)

(assert (=> b!1051548 m!972051))

(declare-fun m!972053 () Bool)

(assert (=> b!1051549 m!972053))

(push 1)

(assert (not b!1051550))

(assert (not b!1051545))

(assert (not b!1051551))

(assert (not b!1051553))

(assert (not b!1051554))

(assert (not start!92478))

(assert (not b!1051556))

(assert (not b!1051552))

(assert (not b!1051549))

(assert (not b!1051548))

(check-sat)

