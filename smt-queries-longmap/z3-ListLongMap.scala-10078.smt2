; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118598 () Bool)

(assert start!118598)

(declare-fun b!1386484 () Bool)

(declare-datatypes ((Unit!46161 0))(
  ( (Unit!46162) )
))
(declare-fun e!785416 () Unit!46161)

(declare-fun Unit!46163 () Unit!46161)

(assert (=> b!1386484 (= e!785416 Unit!46163)))

(declare-fun b!1386485 () Bool)

(declare-fun res!927704 () Bool)

(declare-fun e!785417 () Bool)

(assert (=> b!1386485 (=> (not res!927704) (not e!785417))))

(declare-datatypes ((array!94827 0))(
  ( (array!94828 (arr!45790 (Array (_ BitVec 32) (_ BitVec 64))) (size!46342 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94827)

(declare-datatypes ((List!32396 0))(
  ( (Nil!32393) (Cons!32392 (h!33601 (_ BitVec 64)) (t!47082 List!32396)) )
))
(declare-fun arrayNoDuplicates!0 (array!94827 (_ BitVec 32) List!32396) Bool)

(assert (=> b!1386485 (= res!927704 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32393))))

(declare-fun b!1386486 () Bool)

(declare-fun e!785418 () Bool)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386486 (= e!785418 (validKeyInArray!0 (select (arr!45790 a!2938) startIndex!16)))))

(declare-fun b!1386487 () Bool)

(declare-fun res!927707 () Bool)

(assert (=> b!1386487 (=> (not res!927707) (not e!785417))))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1386487 (= res!927707 (and (not (= (select (arr!45790 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45790 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386488 () Bool)

(declare-fun res!927705 () Bool)

(assert (=> b!1386488 (=> (not res!927705) (not e!785417))))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1386488 (= res!927705 (and (= (size!46342 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46342 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46342 a!2938))))))

(declare-fun b!1386489 () Bool)

(declare-fun lt!609318 () Unit!46161)

(assert (=> b!1386489 (= e!785416 lt!609318)))

(declare-fun lt!609320 () Unit!46161)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94827 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46161)

(assert (=> b!1386489 (= lt!609320 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10159 0))(
  ( (MissingZero!10159 (index!43007 (_ BitVec 32))) (Found!10159 (index!43008 (_ BitVec 32))) (Intermediate!10159 (undefined!10971 Bool) (index!43009 (_ BitVec 32)) (x!124621 (_ BitVec 32))) (Undefined!10159) (MissingVacant!10159 (index!43010 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94827 (_ BitVec 32)) SeekEntryResult!10159)

(assert (=> b!1386489 (= (seekEntryOrOpen!0 (select (arr!45790 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45790 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94828 (store (arr!45790 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46342 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94827 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46161)

(assert (=> b!1386489 (= lt!609318 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94827 (_ BitVec 32)) Bool)

(assert (=> b!1386489 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun res!927702 () Bool)

(assert (=> start!118598 (=> (not res!927702) (not e!785417))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118598 (= res!927702 (validMask!0 mask!2987))))

(assert (=> start!118598 e!785417))

(assert (=> start!118598 true))

(declare-fun array_inv!35023 (array!94827) Bool)

(assert (=> start!118598 (array_inv!35023 a!2938)))

(declare-fun b!1386490 () Bool)

(declare-fun res!927706 () Bool)

(assert (=> b!1386490 (=> (not res!927706) (not e!785417))))

(assert (=> b!1386490 (= res!927706 (validKeyInArray!0 (select (arr!45790 a!2938) i!1065)))))

(declare-fun b!1386491 () Bool)

(declare-fun res!927703 () Bool)

(assert (=> b!1386491 (=> (not res!927703) (not e!785417))))

(assert (=> b!1386491 (= res!927703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386492 () Bool)

(assert (=> b!1386492 (= e!785417 (and (bvslt startIndex!16 (bvsub (size!46342 a!2938) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-fun lt!609319 () Unit!46161)

(assert (=> b!1386492 (= lt!609319 e!785416)))

(declare-fun c!128834 () Bool)

(assert (=> b!1386492 (= c!128834 e!785418)))

(declare-fun res!927701 () Bool)

(assert (=> b!1386492 (=> (not res!927701) (not e!785418))))

(assert (=> b!1386492 (= res!927701 (not (= startIndex!16 i!1065)))))

(assert (= (and start!118598 res!927702) b!1386488))

(assert (= (and b!1386488 res!927705) b!1386490))

(assert (= (and b!1386490 res!927706) b!1386485))

(assert (= (and b!1386485 res!927704) b!1386491))

(assert (= (and b!1386491 res!927703) b!1386487))

(assert (= (and b!1386487 res!927707) b!1386492))

(assert (= (and b!1386492 res!927701) b!1386486))

(assert (= (and b!1386492 c!128834) b!1386489))

(assert (= (and b!1386492 (not c!128834)) b!1386484))

(declare-fun m!1271427 () Bool)

(assert (=> b!1386490 m!1271427))

(assert (=> b!1386490 m!1271427))

(declare-fun m!1271429 () Bool)

(assert (=> b!1386490 m!1271429))

(assert (=> b!1386487 m!1271427))

(declare-fun m!1271431 () Bool)

(assert (=> b!1386489 m!1271431))

(declare-fun m!1271433 () Bool)

(assert (=> b!1386489 m!1271433))

(assert (=> b!1386489 m!1271433))

(declare-fun m!1271435 () Bool)

(assert (=> b!1386489 m!1271435))

(declare-fun m!1271437 () Bool)

(assert (=> b!1386489 m!1271437))

(declare-fun m!1271439 () Bool)

(assert (=> b!1386489 m!1271439))

(declare-fun m!1271441 () Bool)

(assert (=> b!1386489 m!1271441))

(declare-fun m!1271443 () Bool)

(assert (=> b!1386489 m!1271443))

(assert (=> b!1386489 m!1271441))

(declare-fun m!1271445 () Bool)

(assert (=> b!1386489 m!1271445))

(declare-fun m!1271447 () Bool)

(assert (=> start!118598 m!1271447))

(declare-fun m!1271449 () Bool)

(assert (=> start!118598 m!1271449))

(assert (=> b!1386486 m!1271441))

(assert (=> b!1386486 m!1271441))

(declare-fun m!1271451 () Bool)

(assert (=> b!1386486 m!1271451))

(declare-fun m!1271453 () Bool)

(assert (=> b!1386491 m!1271453))

(declare-fun m!1271455 () Bool)

(assert (=> b!1386485 m!1271455))

(check-sat (not b!1386491) (not b!1386490) (not start!118598) (not b!1386489) (not b!1386485) (not b!1386486))
(check-sat)
