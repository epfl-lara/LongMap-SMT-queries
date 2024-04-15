; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26192 () Bool)

(assert start!26192)

(declare-fun b!270485 () Bool)

(declare-fun res!134538 () Bool)

(declare-fun e!174269 () Bool)

(assert (=> b!270485 (=> (not res!134538) (not e!174269))))

(declare-datatypes ((List!4069 0))(
  ( (Nil!4066) (Cons!4065 (h!4732 (_ BitVec 64)) (t!9142 List!4069)) )
))
(declare-fun contains!1907 (List!4069 (_ BitVec 64)) Bool)

(assert (=> b!270485 (= res!134538 (not (contains!1907 Nil!4066 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270486 () Bool)

(declare-fun e!174268 () Bool)

(assert (=> b!270486 (= e!174268 e!174269)))

(declare-fun res!134527 () Bool)

(assert (=> b!270486 (=> (not res!134527) (not e!174269))))

(declare-datatypes ((SeekEntryResult!1445 0))(
  ( (MissingZero!1445 (index!7950 (_ BitVec 32))) (Found!1445 (index!7951 (_ BitVec 32))) (Intermediate!1445 (undefined!2257 Bool) (index!7952 (_ BitVec 32)) (x!26305 (_ BitVec 32))) (Undefined!1445) (MissingVacant!1445 (index!7953 (_ BitVec 32))) )
))
(declare-fun lt!135497 () SeekEntryResult!1445)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!270486 (= res!134527 (or (= lt!135497 (MissingZero!1445 i!1267)) (= lt!135497 (MissingVacant!1445 i!1267))))))

(declare-datatypes ((array!13278 0))(
  ( (array!13279 (arr!6288 (Array (_ BitVec 32) (_ BitVec 64))) (size!6641 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13278)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13278 (_ BitVec 32)) SeekEntryResult!1445)

(assert (=> b!270486 (= lt!135497 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!134539 () Bool)

(assert (=> start!26192 (=> (not res!134539) (not e!174268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26192 (= res!134539 (validMask!0 mask!3868))))

(assert (=> start!26192 e!174268))

(declare-fun array_inv!4260 (array!13278) Bool)

(assert (=> start!26192 (array_inv!4260 a!3325)))

(assert (=> start!26192 true))

(declare-fun b!270487 () Bool)

(declare-fun res!134531 () Bool)

(assert (=> b!270487 (=> (not res!134531) (not e!174268))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!270487 (= res!134531 (and (= (size!6641 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6641 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6641 a!3325))))))

(declare-fun b!270488 () Bool)

(declare-fun res!134536 () Bool)

(assert (=> b!270488 (=> (not res!134536) (not e!174269))))

(declare-fun noDuplicate!121 (List!4069) Bool)

(assert (=> b!270488 (= res!134536 (noDuplicate!121 Nil!4066))))

(declare-fun b!270489 () Bool)

(declare-fun res!134535 () Bool)

(assert (=> b!270489 (=> (not res!134535) (not e!174268))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270489 (= res!134535 (validKeyInArray!0 k0!2581))))

(declare-fun b!270490 () Bool)

(declare-fun res!134537 () Bool)

(assert (=> b!270490 (=> (not res!134537) (not e!174269))))

(assert (=> b!270490 (= res!134537 (not (= startIndex!26 i!1267)))))

(declare-fun b!270491 () Bool)

(declare-fun res!134534 () Bool)

(assert (=> b!270491 (=> (not res!134534) (not e!174269))))

(assert (=> b!270491 (= res!134534 (not (contains!1907 Nil!4066 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270492 () Bool)

(declare-fun res!134532 () Bool)

(assert (=> b!270492 (=> (not res!134532) (not e!174268))))

(declare-fun arrayContainsKey!0 (array!13278 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270492 (= res!134532 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270493 () Bool)

(declare-fun res!134530 () Bool)

(assert (=> b!270493 (=> (not res!134530) (not e!174269))))

(assert (=> b!270493 (= res!134530 (validKeyInArray!0 (select (arr!6288 a!3325) startIndex!26)))))

(declare-fun b!270494 () Bool)

(declare-fun res!134533 () Bool)

(assert (=> b!270494 (=> (not res!134533) (not e!174268))))

(declare-fun arrayNoDuplicates!0 (array!13278 (_ BitVec 32) List!4069) Bool)

(assert (=> b!270494 (= res!134533 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4066))))

(declare-fun b!270495 () Bool)

(declare-fun res!134529 () Bool)

(assert (=> b!270495 (=> (not res!134529) (not e!174269))))

(assert (=> b!270495 (= res!134529 (and (bvslt (size!6641 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6641 a!3325))))))

(declare-fun b!270496 () Bool)

(assert (=> b!270496 (= e!174269 false)))

(declare-fun lt!135498 () Bool)

(assert (=> b!270496 (= lt!135498 (contains!1907 Nil!4066 k0!2581))))

(declare-fun b!270497 () Bool)

(declare-fun res!134528 () Bool)

(assert (=> b!270497 (=> (not res!134528) (not e!174269))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13278 (_ BitVec 32)) Bool)

(assert (=> b!270497 (= res!134528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26192 res!134539) b!270487))

(assert (= (and b!270487 res!134531) b!270489))

(assert (= (and b!270489 res!134535) b!270494))

(assert (= (and b!270494 res!134533) b!270492))

(assert (= (and b!270492 res!134532) b!270486))

(assert (= (and b!270486 res!134527) b!270497))

(assert (= (and b!270497 res!134528) b!270490))

(assert (= (and b!270490 res!134537) b!270493))

(assert (= (and b!270493 res!134530) b!270495))

(assert (= (and b!270495 res!134529) b!270488))

(assert (= (and b!270488 res!134536) b!270491))

(assert (= (and b!270491 res!134534) b!270485))

(assert (= (and b!270485 res!134538) b!270496))

(declare-fun m!285593 () Bool)

(assert (=> b!270497 m!285593))

(declare-fun m!285595 () Bool)

(assert (=> b!270493 m!285595))

(assert (=> b!270493 m!285595))

(declare-fun m!285597 () Bool)

(assert (=> b!270493 m!285597))

(declare-fun m!285599 () Bool)

(assert (=> b!270486 m!285599))

(declare-fun m!285601 () Bool)

(assert (=> start!26192 m!285601))

(declare-fun m!285603 () Bool)

(assert (=> start!26192 m!285603))

(declare-fun m!285605 () Bool)

(assert (=> b!270496 m!285605))

(declare-fun m!285607 () Bool)

(assert (=> b!270494 m!285607))

(declare-fun m!285609 () Bool)

(assert (=> b!270492 m!285609))

(declare-fun m!285611 () Bool)

(assert (=> b!270485 m!285611))

(declare-fun m!285613 () Bool)

(assert (=> b!270491 m!285613))

(declare-fun m!285615 () Bool)

(assert (=> b!270488 m!285615))

(declare-fun m!285617 () Bool)

(assert (=> b!270489 m!285617))

(check-sat (not b!270497) (not b!270489) (not b!270488) (not b!270492) (not b!270493) (not start!26192) (not b!270491) (not b!270486) (not b!270485) (not b!270496) (not b!270494))
(check-sat)
