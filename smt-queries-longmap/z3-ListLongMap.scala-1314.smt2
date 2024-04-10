; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26444 () Bool)

(assert start!26444)

(declare-fun b!274436 () Bool)

(declare-fun res!138429 () Bool)

(declare-fun e!175711 () Bool)

(assert (=> b!274436 (=> (not res!138429) (not e!175711))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274436 (= res!138429 (validKeyInArray!0 k0!2581))))

(declare-fun b!274437 () Bool)

(declare-fun res!138433 () Bool)

(declare-fun e!175712 () Bool)

(assert (=> b!274437 (=> (not res!138433) (not e!175712))))

(declare-datatypes ((array!13541 0))(
  ( (array!13542 (arr!6420 (Array (_ BitVec 32) (_ BitVec 64))) (size!6772 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13541)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!274437 (= res!138433 (validKeyInArray!0 (select (arr!6420 a!3325) startIndex!26)))))

(declare-fun b!274439 () Bool)

(declare-fun e!175714 () Bool)

(assert (=> b!274439 (= e!175711 e!175714)))

(declare-fun res!138435 () Bool)

(assert (=> b!274439 (=> (not res!138435) (not e!175714))))

(declare-datatypes ((SeekEntryResult!1578 0))(
  ( (MissingZero!1578 (index!8482 (_ BitVec 32))) (Found!1578 (index!8483 (_ BitVec 32))) (Intermediate!1578 (undefined!2390 Bool) (index!8484 (_ BitVec 32)) (x!26775 (_ BitVec 32))) (Undefined!1578) (MissingVacant!1578 (index!8485 (_ BitVec 32))) )
))
(declare-fun lt!136947 () SeekEntryResult!1578)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!274439 (= res!138435 (or (= lt!136947 (MissingZero!1578 i!1267)) (= lt!136947 (MissingVacant!1578 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13541 (_ BitVec 32)) SeekEntryResult!1578)

(assert (=> b!274439 (= lt!136947 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!274440 () Bool)

(declare-fun e!175713 () Bool)

(assert (=> b!274440 (= e!175712 (not e!175713))))

(declare-fun res!138432 () Bool)

(assert (=> b!274440 (=> res!138432 e!175713)))

(assert (=> b!274440 (= res!138432 (or (bvsge startIndex!26 (bvsub (size!6772 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13541 (_ BitVec 32)) Bool)

(assert (=> b!274440 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8643 0))(
  ( (Unit!8644) )
))
(declare-fun lt!136948 () Unit!8643)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13541 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8643)

(assert (=> b!274440 (= lt!136948 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136950 () array!13541)

(assert (=> b!274440 (= (seekEntryOrOpen!0 (select (arr!6420 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6420 a!3325) i!1267 k0!2581) startIndex!26) lt!136950 mask!3868))))

(declare-fun lt!136946 () Unit!8643)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13541 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8643)

(assert (=> b!274440 (= lt!136946 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4228 0))(
  ( (Nil!4225) (Cons!4224 (h!4891 (_ BitVec 64)) (t!9310 List!4228)) )
))
(declare-fun arrayNoDuplicates!0 (array!13541 (_ BitVec 32) List!4228) Bool)

(assert (=> b!274440 (arrayNoDuplicates!0 lt!136950 #b00000000000000000000000000000000 Nil!4225)))

(declare-fun lt!136949 () Unit!8643)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13541 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4228) Unit!8643)

(assert (=> b!274440 (= lt!136949 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4225))))

(declare-fun b!274441 () Bool)

(declare-fun res!138430 () Bool)

(assert (=> b!274441 (=> (not res!138430) (not e!175711))))

(assert (=> b!274441 (= res!138430 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4225))))

(declare-fun b!274442 () Bool)

(declare-fun res!138426 () Bool)

(assert (=> b!274442 (=> (not res!138426) (not e!175714))))

(assert (=> b!274442 (= res!138426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274443 () Bool)

(declare-fun res!138431 () Bool)

(assert (=> b!274443 (=> (not res!138431) (not e!175711))))

(assert (=> b!274443 (= res!138431 (and (= (size!6772 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6772 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6772 a!3325))))))

(declare-fun b!274444 () Bool)

(declare-fun res!138434 () Bool)

(assert (=> b!274444 (=> (not res!138434) (not e!175711))))

(declare-fun arrayContainsKey!0 (array!13541 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274444 (= res!138434 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274445 () Bool)

(assert (=> b!274445 (= e!175713 true)))

(assert (=> b!274445 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!136950 mask!3868)))

(declare-fun lt!136951 () Unit!8643)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13541 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8643)

(assert (=> b!274445 (= lt!136951 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun res!138427 () Bool)

(assert (=> start!26444 (=> (not res!138427) (not e!175711))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26444 (= res!138427 (validMask!0 mask!3868))))

(assert (=> start!26444 e!175711))

(declare-fun array_inv!4383 (array!13541) Bool)

(assert (=> start!26444 (array_inv!4383 a!3325)))

(assert (=> start!26444 true))

(declare-fun b!274438 () Bool)

(assert (=> b!274438 (= e!175714 e!175712)))

(declare-fun res!138428 () Bool)

(assert (=> b!274438 (=> (not res!138428) (not e!175712))))

(assert (=> b!274438 (= res!138428 (not (= startIndex!26 i!1267)))))

(assert (=> b!274438 (= lt!136950 (array!13542 (store (arr!6420 a!3325) i!1267 k0!2581) (size!6772 a!3325)))))

(assert (= (and start!26444 res!138427) b!274443))

(assert (= (and b!274443 res!138431) b!274436))

(assert (= (and b!274436 res!138429) b!274441))

(assert (= (and b!274441 res!138430) b!274444))

(assert (= (and b!274444 res!138434) b!274439))

(assert (= (and b!274439 res!138435) b!274442))

(assert (= (and b!274442 res!138426) b!274438))

(assert (= (and b!274438 res!138428) b!274437))

(assert (= (and b!274437 res!138433) b!274440))

(assert (= (and b!274440 (not res!138432)) b!274445))

(declare-fun m!289957 () Bool)

(assert (=> start!26444 m!289957))

(declare-fun m!289959 () Bool)

(assert (=> start!26444 m!289959))

(declare-fun m!289961 () Bool)

(assert (=> b!274442 m!289961))

(declare-fun m!289963 () Bool)

(assert (=> b!274441 m!289963))

(declare-fun m!289965 () Bool)

(assert (=> b!274438 m!289965))

(declare-fun m!289967 () Bool)

(assert (=> b!274445 m!289967))

(declare-fun m!289969 () Bool)

(assert (=> b!274445 m!289969))

(declare-fun m!289971 () Bool)

(assert (=> b!274437 m!289971))

(assert (=> b!274437 m!289971))

(declare-fun m!289973 () Bool)

(assert (=> b!274437 m!289973))

(declare-fun m!289975 () Bool)

(assert (=> b!274440 m!289975))

(declare-fun m!289977 () Bool)

(assert (=> b!274440 m!289977))

(declare-fun m!289979 () Bool)

(assert (=> b!274440 m!289979))

(assert (=> b!274440 m!289979))

(declare-fun m!289981 () Bool)

(assert (=> b!274440 m!289981))

(assert (=> b!274440 m!289965))

(declare-fun m!289983 () Bool)

(assert (=> b!274440 m!289983))

(assert (=> b!274440 m!289971))

(declare-fun m!289985 () Bool)

(assert (=> b!274440 m!289985))

(declare-fun m!289987 () Bool)

(assert (=> b!274440 m!289987))

(assert (=> b!274440 m!289971))

(declare-fun m!289989 () Bool)

(assert (=> b!274440 m!289989))

(declare-fun m!289991 () Bool)

(assert (=> b!274436 m!289991))

(declare-fun m!289993 () Bool)

(assert (=> b!274439 m!289993))

(declare-fun m!289995 () Bool)

(assert (=> b!274444 m!289995))

(check-sat (not b!274440) (not b!274437) (not b!274436) (not b!274441) (not b!274445) (not start!26444) (not b!274439) (not b!274444) (not b!274442))
(check-sat)
