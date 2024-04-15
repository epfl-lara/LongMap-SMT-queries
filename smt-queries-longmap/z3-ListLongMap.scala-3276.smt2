; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45588 () Bool)

(assert start!45588)

(declare-fun b!501957 () Bool)

(declare-datatypes ((Unit!15154 0))(
  ( (Unit!15155) )
))
(declare-fun e!294010 () Unit!15154)

(declare-fun Unit!15156 () Unit!15154)

(assert (=> b!501957 (= e!294010 Unit!15156)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32354 0))(
  ( (array!32355 (arr!15557 (Array (_ BitVec 32) (_ BitVec 64))) (size!15922 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32354)

(declare-fun lt!228012 () Unit!15154)

(declare-fun lt!228010 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4021 0))(
  ( (MissingZero!4021 (index!18272 (_ BitVec 32))) (Found!4021 (index!18273 (_ BitVec 32))) (Intermediate!4021 (undefined!4833 Bool) (index!18274 (_ BitVec 32)) (x!47313 (_ BitVec 32))) (Undefined!4021) (MissingVacant!4021 (index!18275 (_ BitVec 32))) )
))
(declare-fun lt!228013 () SeekEntryResult!4021)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32354 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15154)

(assert (=> b!501957 (= lt!228012 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!228010 #b00000000000000000000000000000000 (index!18274 lt!228013) (x!47313 lt!228013) mask!3524))))

(declare-fun res!303553 () Bool)

(declare-fun lt!228014 () array!32354)

(declare-fun lt!228008 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32354 (_ BitVec 32)) SeekEntryResult!4021)

(assert (=> b!501957 (= res!303553 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228010 lt!228008 lt!228014 mask!3524) (Intermediate!4021 false (index!18274 lt!228013) (x!47313 lt!228013))))))

(declare-fun e!294013 () Bool)

(assert (=> b!501957 (=> (not res!303553) (not e!294013))))

(assert (=> b!501957 e!294013))

(declare-fun b!501958 () Bool)

(declare-fun res!303548 () Bool)

(declare-fun e!294007 () Bool)

(assert (=> b!501958 (=> res!303548 e!294007)))

(get-info :version)

(assert (=> b!501958 (= res!303548 (or (undefined!4833 lt!228013) (not ((_ is Intermediate!4021) lt!228013))))))

(declare-fun b!501959 () Bool)

(declare-fun e!294015 () Bool)

(assert (=> b!501959 (= e!294015 (not e!294007))))

(declare-fun res!303547 () Bool)

(assert (=> b!501959 (=> res!303547 e!294007)))

(declare-fun lt!228015 () (_ BitVec 32))

(assert (=> b!501959 (= res!303547 (= lt!228013 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228015 lt!228008 lt!228014 mask!3524)))))

(assert (=> b!501959 (= lt!228013 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228010 (select (arr!15557 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!501959 (= lt!228015 (toIndex!0 lt!228008 mask!3524))))

(assert (=> b!501959 (= lt!228008 (select (store (arr!15557 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!501959 (= lt!228010 (toIndex!0 (select (arr!15557 a!3235) j!176) mask!3524))))

(assert (=> b!501959 (= lt!228014 (array!32355 (store (arr!15557 a!3235) i!1204 k0!2280) (size!15922 a!3235)))))

(declare-fun e!294008 () Bool)

(assert (=> b!501959 e!294008))

(declare-fun res!303554 () Bool)

(assert (=> b!501959 (=> (not res!303554) (not e!294008))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32354 (_ BitVec 32)) Bool)

(assert (=> b!501959 (= res!303554 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228016 () Unit!15154)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32354 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15154)

(assert (=> b!501959 (= lt!228016 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!501960 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32354 (_ BitVec 32)) SeekEntryResult!4021)

(assert (=> b!501960 (= e!294008 (= (seekEntryOrOpen!0 (select (arr!15557 a!3235) j!176) a!3235 mask!3524) (Found!4021 j!176)))))

(declare-fun b!501962 () Bool)

(declare-fun Unit!15157 () Unit!15154)

(assert (=> b!501962 (= e!294010 Unit!15157)))

(declare-fun e!294014 () Bool)

(declare-fun b!501963 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32354 (_ BitVec 32)) SeekEntryResult!4021)

(assert (=> b!501963 (= e!294014 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228010 (index!18274 lt!228013) (select (arr!15557 a!3235) j!176) a!3235 mask!3524) (Found!4021 j!176))))))

(declare-fun b!501964 () Bool)

(declare-fun res!303542 () Bool)

(declare-fun e!294011 () Bool)

(assert (=> b!501964 (=> (not res!303542) (not e!294011))))

(declare-fun arrayContainsKey!0 (array!32354 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!501964 (= res!303542 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!501965 () Bool)

(assert (=> b!501965 (= e!294013 false)))

(declare-fun b!501966 () Bool)

(declare-fun e!294012 () Bool)

(assert (=> b!501966 (= e!294007 e!294012)))

(declare-fun res!303546 () Bool)

(assert (=> b!501966 (=> res!303546 e!294012)))

(assert (=> b!501966 (= res!303546 (or (bvsgt (x!47313 lt!228013) #b01111111111111111111111111111110) (bvslt lt!228010 #b00000000000000000000000000000000) (bvsge lt!228010 (size!15922 a!3235)) (bvslt (index!18274 lt!228013) #b00000000000000000000000000000000) (bvsge (index!18274 lt!228013) (size!15922 a!3235)) (not (= lt!228013 (Intermediate!4021 false (index!18274 lt!228013) (x!47313 lt!228013))))))))

(assert (=> b!501966 (= (index!18274 lt!228013) i!1204)))

(declare-fun lt!228006 () Unit!15154)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32354 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15154)

(assert (=> b!501966 (= lt!228006 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!228010 #b00000000000000000000000000000000 (index!18274 lt!228013) (x!47313 lt!228013) mask!3524))))

(assert (=> b!501966 (and (or (= (select (arr!15557 a!3235) (index!18274 lt!228013)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15557 a!3235) (index!18274 lt!228013)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15557 a!3235) (index!18274 lt!228013)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15557 a!3235) (index!18274 lt!228013)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228009 () Unit!15154)

(assert (=> b!501966 (= lt!228009 e!294010)))

(declare-fun c!59487 () Bool)

(assert (=> b!501966 (= c!59487 (= (select (arr!15557 a!3235) (index!18274 lt!228013)) (select (arr!15557 a!3235) j!176)))))

(assert (=> b!501966 (and (bvslt (x!47313 lt!228013) #b01111111111111111111111111111110) (or (= (select (arr!15557 a!3235) (index!18274 lt!228013)) (select (arr!15557 a!3235) j!176)) (= (select (arr!15557 a!3235) (index!18274 lt!228013)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15557 a!3235) (index!18274 lt!228013)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!501967 () Bool)

(declare-fun res!303544 () Bool)

(assert (=> b!501967 (=> (not res!303544) (not e!294015))))

(declare-datatypes ((List!9754 0))(
  ( (Nil!9751) (Cons!9750 (h!10627 (_ BitVec 64)) (t!15973 List!9754)) )
))
(declare-fun arrayNoDuplicates!0 (array!32354 (_ BitVec 32) List!9754) Bool)

(assert (=> b!501967 (= res!303544 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9751))))

(declare-fun b!501968 () Bool)

(declare-fun res!303541 () Bool)

(assert (=> b!501968 (=> (not res!303541) (not e!294011))))

(assert (=> b!501968 (= res!303541 (and (= (size!15922 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15922 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15922 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!501969 () Bool)

(declare-fun res!303550 () Bool)

(assert (=> b!501969 (=> (not res!303550) (not e!294015))))

(assert (=> b!501969 (= res!303550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!501970 () Bool)

(assert (=> b!501970 (= e!294012 true)))

(declare-fun lt!228011 () SeekEntryResult!4021)

(assert (=> b!501970 (= lt!228011 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228010 lt!228008 lt!228014 mask!3524))))

(declare-fun b!501971 () Bool)

(declare-fun res!303552 () Bool)

(assert (=> b!501971 (=> res!303552 e!294012)))

(assert (=> b!501971 (= res!303552 e!294014)))

(declare-fun res!303540 () Bool)

(assert (=> b!501971 (=> (not res!303540) (not e!294014))))

(assert (=> b!501971 (= res!303540 (bvsgt #b00000000000000000000000000000000 (x!47313 lt!228013)))))

(declare-fun b!501972 () Bool)

(declare-fun res!303549 () Bool)

(assert (=> b!501972 (=> (not res!303549) (not e!294011))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!501972 (= res!303549 (validKeyInArray!0 k0!2280))))

(declare-fun b!501973 () Bool)

(declare-fun res!303543 () Bool)

(assert (=> b!501973 (=> (not res!303543) (not e!294011))))

(assert (=> b!501973 (= res!303543 (validKeyInArray!0 (select (arr!15557 a!3235) j!176)))))

(declare-fun b!501961 () Bool)

(assert (=> b!501961 (= e!294011 e!294015)))

(declare-fun res!303551 () Bool)

(assert (=> b!501961 (=> (not res!303551) (not e!294015))))

(declare-fun lt!228007 () SeekEntryResult!4021)

(assert (=> b!501961 (= res!303551 (or (= lt!228007 (MissingZero!4021 i!1204)) (= lt!228007 (MissingVacant!4021 i!1204))))))

(assert (=> b!501961 (= lt!228007 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!303545 () Bool)

(assert (=> start!45588 (=> (not res!303545) (not e!294011))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45588 (= res!303545 (validMask!0 mask!3524))))

(assert (=> start!45588 e!294011))

(assert (=> start!45588 true))

(declare-fun array_inv!11440 (array!32354) Bool)

(assert (=> start!45588 (array_inv!11440 a!3235)))

(assert (= (and start!45588 res!303545) b!501968))

(assert (= (and b!501968 res!303541) b!501973))

(assert (= (and b!501973 res!303543) b!501972))

(assert (= (and b!501972 res!303549) b!501964))

(assert (= (and b!501964 res!303542) b!501961))

(assert (= (and b!501961 res!303551) b!501969))

(assert (= (and b!501969 res!303550) b!501967))

(assert (= (and b!501967 res!303544) b!501959))

(assert (= (and b!501959 res!303554) b!501960))

(assert (= (and b!501959 (not res!303547)) b!501958))

(assert (= (and b!501958 (not res!303548)) b!501966))

(assert (= (and b!501966 c!59487) b!501957))

(assert (= (and b!501966 (not c!59487)) b!501962))

(assert (= (and b!501957 res!303553) b!501965))

(assert (= (and b!501966 (not res!303546)) b!501971))

(assert (= (and b!501971 res!303540) b!501963))

(assert (= (and b!501971 (not res!303552)) b!501970))

(declare-fun m!482431 () Bool)

(assert (=> b!501966 m!482431))

(declare-fun m!482433 () Bool)

(assert (=> b!501966 m!482433))

(declare-fun m!482435 () Bool)

(assert (=> b!501966 m!482435))

(declare-fun m!482437 () Bool)

(assert (=> b!501969 m!482437))

(declare-fun m!482439 () Bool)

(assert (=> b!501967 m!482439))

(assert (=> b!501963 m!482435))

(assert (=> b!501963 m!482435))

(declare-fun m!482441 () Bool)

(assert (=> b!501963 m!482441))

(declare-fun m!482443 () Bool)

(assert (=> b!501970 m!482443))

(declare-fun m!482445 () Bool)

(assert (=> b!501972 m!482445))

(assert (=> b!501960 m!482435))

(assert (=> b!501960 m!482435))

(declare-fun m!482447 () Bool)

(assert (=> b!501960 m!482447))

(declare-fun m!482449 () Bool)

(assert (=> start!45588 m!482449))

(declare-fun m!482451 () Bool)

(assert (=> start!45588 m!482451))

(declare-fun m!482453 () Bool)

(assert (=> b!501964 m!482453))

(declare-fun m!482455 () Bool)

(assert (=> b!501959 m!482455))

(declare-fun m!482457 () Bool)

(assert (=> b!501959 m!482457))

(declare-fun m!482459 () Bool)

(assert (=> b!501959 m!482459))

(declare-fun m!482461 () Bool)

(assert (=> b!501959 m!482461))

(assert (=> b!501959 m!482435))

(declare-fun m!482463 () Bool)

(assert (=> b!501959 m!482463))

(assert (=> b!501959 m!482435))

(declare-fun m!482465 () Bool)

(assert (=> b!501959 m!482465))

(assert (=> b!501959 m!482435))

(declare-fun m!482467 () Bool)

(assert (=> b!501959 m!482467))

(declare-fun m!482469 () Bool)

(assert (=> b!501959 m!482469))

(assert (=> b!501973 m!482435))

(assert (=> b!501973 m!482435))

(declare-fun m!482471 () Bool)

(assert (=> b!501973 m!482471))

(declare-fun m!482473 () Bool)

(assert (=> b!501957 m!482473))

(assert (=> b!501957 m!482443))

(declare-fun m!482475 () Bool)

(assert (=> b!501961 m!482475))

(check-sat (not b!501957) (not b!501963) (not b!501970) (not b!501966) (not start!45588) (not b!501967) (not b!501973) (not b!501969) (not b!501964) (not b!501972) (not b!501959) (not b!501960) (not b!501961))
(check-sat)
