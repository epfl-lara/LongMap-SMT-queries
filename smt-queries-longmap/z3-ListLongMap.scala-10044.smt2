; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118580 () Bool)

(assert start!118580)

(declare-fun b!1385802 () Bool)

(declare-fun e!785372 () Bool)

(declare-datatypes ((array!94781 0))(
  ( (array!94782 (arr!45766 (Array (_ BitVec 32) (_ BitVec 64))) (size!46317 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94781)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385802 (= e!785372 (validKeyInArray!0 (select (arr!45766 a!2938) startIndex!16)))))

(declare-fun b!1385803 () Bool)

(declare-datatypes ((Unit!46115 0))(
  ( (Unit!46116) )
))
(declare-fun e!785374 () Unit!46115)

(declare-fun Unit!46117 () Unit!46115)

(assert (=> b!1385803 (= e!785374 Unit!46117)))

(declare-fun b!1385804 () Bool)

(declare-fun e!785371 () Bool)

(declare-fun e!785370 () Bool)

(assert (=> b!1385804 (= e!785371 e!785370)))

(declare-fun res!926445 () Bool)

(assert (=> b!1385804 (=> (not res!926445) (not e!785370))))

(assert (=> b!1385804 (= res!926445 (and (bvslt startIndex!16 (bvsub (size!46317 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-fun lt!609392 () Unit!46115)

(assert (=> b!1385804 (= lt!609392 e!785374)))

(declare-fun c!129129 () Bool)

(assert (=> b!1385804 (= c!129129 e!785372)))

(declare-fun res!926440 () Bool)

(assert (=> b!1385804 (=> (not res!926440) (not e!785372))))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1385804 (= res!926440 (not (= startIndex!16 i!1065)))))

(declare-fun lt!609395 () array!94781)

(assert (=> b!1385804 (= lt!609395 (array!94782 (store (arr!45766 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46317 a!2938)))))

(declare-fun b!1385805 () Bool)

(declare-fun res!926439 () Bool)

(assert (=> b!1385805 (=> (not res!926439) (not e!785371))))

(assert (=> b!1385805 (= res!926439 (validKeyInArray!0 (select (arr!45766 a!2938) i!1065)))))

(declare-fun b!1385806 () Bool)

(assert (=> b!1385806 (= e!785370 (not true))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94781 (_ BitVec 32)) Bool)

(assert (=> b!1385806 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!609395 mask!2987)))

(declare-fun lt!609394 () Unit!46115)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94781 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46115)

(assert (=> b!1385806 (= lt!609394 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(declare-fun b!1385807 () Bool)

(declare-fun res!926444 () Bool)

(assert (=> b!1385807 (=> (not res!926444) (not e!785371))))

(assert (=> b!1385807 (= res!926444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!926446 () Bool)

(assert (=> start!118580 (=> (not res!926446) (not e!785371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118580 (= res!926446 (validMask!0 mask!2987))))

(assert (=> start!118580 e!785371))

(assert (=> start!118580 true))

(declare-fun array_inv!35047 (array!94781) Bool)

(assert (=> start!118580 (array_inv!35047 a!2938)))

(declare-fun b!1385808 () Bool)

(declare-fun lt!609393 () Unit!46115)

(assert (=> b!1385808 (= e!785374 lt!609393)))

(declare-fun lt!609396 () Unit!46115)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94781 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46115)

(assert (=> b!1385808 (= lt!609396 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10062 0))(
  ( (MissingZero!10062 (index!42619 (_ BitVec 32))) (Found!10062 (index!42620 (_ BitVec 32))) (Intermediate!10062 (undefined!10874 Bool) (index!42621 (_ BitVec 32)) (x!124277 (_ BitVec 32))) (Undefined!10062) (MissingVacant!10062 (index!42622 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94781 (_ BitVec 32)) SeekEntryResult!10062)

(assert (=> b!1385808 (= (seekEntryOrOpen!0 (select (arr!45766 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45766 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609395 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94781 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46115)

(assert (=> b!1385808 (= lt!609393 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1385808 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1385809 () Bool)

(declare-fun res!926443 () Bool)

(assert (=> b!1385809 (=> (not res!926443) (not e!785371))))

(assert (=> b!1385809 (= res!926443 (and (= (size!46317 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46317 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46317 a!2938))))))

(declare-fun b!1385810 () Bool)

(declare-fun res!926442 () Bool)

(assert (=> b!1385810 (=> (not res!926442) (not e!785371))))

(assert (=> b!1385810 (= res!926442 (and (not (= (select (arr!45766 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45766 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1385811 () Bool)

(declare-fun res!926441 () Bool)

(assert (=> b!1385811 (=> (not res!926441) (not e!785371))))

(declare-datatypes ((List!32281 0))(
  ( (Nil!32278) (Cons!32277 (h!33495 (_ BitVec 64)) (t!46967 List!32281)) )
))
(declare-fun arrayNoDuplicates!0 (array!94781 (_ BitVec 32) List!32281) Bool)

(assert (=> b!1385811 (= res!926441 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32278))))

(assert (= (and start!118580 res!926446) b!1385809))

(assert (= (and b!1385809 res!926443) b!1385805))

(assert (= (and b!1385805 res!926439) b!1385811))

(assert (= (and b!1385811 res!926441) b!1385807))

(assert (= (and b!1385807 res!926444) b!1385810))

(assert (= (and b!1385810 res!926442) b!1385804))

(assert (= (and b!1385804 res!926440) b!1385802))

(assert (= (and b!1385804 c!129129) b!1385808))

(assert (= (and b!1385804 (not c!129129)) b!1385803))

(assert (= (and b!1385804 res!926445) b!1385806))

(declare-fun m!1271373 () Bool)

(assert (=> b!1385810 m!1271373))

(declare-fun m!1271375 () Bool)

(assert (=> b!1385806 m!1271375))

(declare-fun m!1271377 () Bool)

(assert (=> b!1385806 m!1271377))

(declare-fun m!1271379 () Bool)

(assert (=> start!118580 m!1271379))

(declare-fun m!1271381 () Bool)

(assert (=> start!118580 m!1271381))

(declare-fun m!1271383 () Bool)

(assert (=> b!1385804 m!1271383))

(declare-fun m!1271385 () Bool)

(assert (=> b!1385808 m!1271385))

(declare-fun m!1271387 () Bool)

(assert (=> b!1385808 m!1271387))

(assert (=> b!1385808 m!1271383))

(declare-fun m!1271389 () Bool)

(assert (=> b!1385808 m!1271389))

(declare-fun m!1271391 () Bool)

(assert (=> b!1385808 m!1271391))

(declare-fun m!1271393 () Bool)

(assert (=> b!1385808 m!1271393))

(assert (=> b!1385808 m!1271387))

(declare-fun m!1271395 () Bool)

(assert (=> b!1385808 m!1271395))

(assert (=> b!1385808 m!1271391))

(declare-fun m!1271397 () Bool)

(assert (=> b!1385808 m!1271397))

(declare-fun m!1271399 () Bool)

(assert (=> b!1385807 m!1271399))

(assert (=> b!1385805 m!1271373))

(assert (=> b!1385805 m!1271373))

(declare-fun m!1271401 () Bool)

(assert (=> b!1385805 m!1271401))

(assert (=> b!1385802 m!1271391))

(assert (=> b!1385802 m!1271391))

(declare-fun m!1271403 () Bool)

(assert (=> b!1385802 m!1271403))

(declare-fun m!1271405 () Bool)

(assert (=> b!1385811 m!1271405))

(check-sat (not b!1385807) (not b!1385811) (not b!1385808) (not b!1385802) (not b!1385805) (not start!118580) (not b!1385806))
(check-sat)
