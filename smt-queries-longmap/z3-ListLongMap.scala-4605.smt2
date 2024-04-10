; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64266 () Bool)

(assert start!64266)

(declare-fun b!721609 () Bool)

(declare-fun res!483452 () Bool)

(declare-fun e!404623 () Bool)

(assert (=> b!721609 (=> (not res!483452) (not e!404623))))

(declare-datatypes ((array!40847 0))(
  ( (array!40848 (arr!19546 (Array (_ BitVec 32) (_ BitVec 64))) (size!19967 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40847)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!721609 (= res!483452 (and (= (size!19967 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19967 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19967 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!721610 () Bool)

(declare-fun res!483444 () Bool)

(declare-fun e!404622 () Bool)

(assert (=> b!721610 (=> (not res!483444) (not e!404622))))

(declare-fun e!404625 () Bool)

(assert (=> b!721610 (= res!483444 e!404625)))

(declare-fun c!79456 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!721610 (= c!79456 (bvsle x!1131 resIntermediateX!5))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun e!404627 () Bool)

(declare-fun b!721611 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!721611 (= e!404627 (not (validKeyInArray!0 (select (store (arr!19546 a!3186) i!1173 k0!2102) j!159))))))

(declare-fun b!721612 () Bool)

(declare-fun res!483442 () Bool)

(assert (=> b!721612 (=> (not res!483442) (not e!404622))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!721612 (= res!483442 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19546 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!721613 () Bool)

(declare-fun e!404626 () Bool)

(assert (=> b!721613 (= e!404623 e!404626)))

(declare-fun res!483447 () Bool)

(assert (=> b!721613 (=> (not res!483447) (not e!404626))))

(declare-datatypes ((SeekEntryResult!7146 0))(
  ( (MissingZero!7146 (index!30952 (_ BitVec 32))) (Found!7146 (index!30953 (_ BitVec 32))) (Intermediate!7146 (undefined!7958 Bool) (index!30954 (_ BitVec 32)) (x!61963 (_ BitVec 32))) (Undefined!7146) (MissingVacant!7146 (index!30955 (_ BitVec 32))) )
))
(declare-fun lt!320120 () SeekEntryResult!7146)

(assert (=> b!721613 (= res!483447 (or (= lt!320120 (MissingZero!7146 i!1173)) (= lt!320120 (MissingVacant!7146 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40847 (_ BitVec 32)) SeekEntryResult!7146)

(assert (=> b!721613 (= lt!320120 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!721614 () Bool)

(declare-fun res!483451 () Bool)

(assert (=> b!721614 (=> (not res!483451) (not e!404623))))

(assert (=> b!721614 (= res!483451 (validKeyInArray!0 (select (arr!19546 a!3186) j!159)))))

(declare-fun b!721615 () Bool)

(declare-fun res!483450 () Bool)

(assert (=> b!721615 (=> (not res!483450) (not e!404623))))

(declare-fun arrayContainsKey!0 (array!40847 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!721615 (= res!483450 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!721616 () Bool)

(declare-fun res!483448 () Bool)

(assert (=> b!721616 (=> (not res!483448) (not e!404626))))

(declare-datatypes ((List!13548 0))(
  ( (Nil!13545) (Cons!13544 (h!14598 (_ BitVec 64)) (t!19863 List!13548)) )
))
(declare-fun arrayNoDuplicates!0 (array!40847 (_ BitVec 32) List!13548) Bool)

(assert (=> b!721616 (= res!483448 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13545))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!721617 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40847 (_ BitVec 32)) SeekEntryResult!7146)

(assert (=> b!721617 (= e!404625 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19546 a!3186) j!159) a!3186 mask!3328) (Found!7146 j!159)))))

(declare-fun b!721618 () Bool)

(declare-fun res!483446 () Bool)

(assert (=> b!721618 (=> (not res!483446) (not e!404626))))

(assert (=> b!721618 (= res!483446 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19967 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19967 a!3186))))))

(declare-fun b!721619 () Bool)

(assert (=> b!721619 (= e!404622 e!404627)))

(declare-fun res!483445 () Bool)

(assert (=> b!721619 (=> (not res!483445) (not e!404627))))

(declare-fun lt!320118 () (_ BitVec 32))

(assert (=> b!721619 (= res!483445 (and (bvsge mask!3328 #b00000000000000000000000000000000) (bvsge lt!320118 #b00000000000000000000000000000000) (bvslt lt!320118 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!721619 (= lt!320118 (toIndex!0 (select (store (arr!19546 a!3186) i!1173 k0!2102) j!159) mask!3328))))

(declare-fun res!483441 () Bool)

(assert (=> start!64266 (=> (not res!483441) (not e!404623))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64266 (= res!483441 (validMask!0 mask!3328))))

(assert (=> start!64266 e!404623))

(assert (=> start!64266 true))

(declare-fun array_inv!15342 (array!40847) Bool)

(assert (=> start!64266 (array_inv!15342 a!3186)))

(declare-fun b!721620 () Bool)

(declare-fun res!483449 () Bool)

(assert (=> b!721620 (=> (not res!483449) (not e!404623))))

(assert (=> b!721620 (= res!483449 (validKeyInArray!0 k0!2102))))

(declare-fun b!721621 () Bool)

(declare-fun lt!320119 () SeekEntryResult!7146)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40847 (_ BitVec 32)) SeekEntryResult!7146)

(assert (=> b!721621 (= e!404625 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19546 a!3186) j!159) a!3186 mask!3328) lt!320119))))

(declare-fun b!721622 () Bool)

(declare-fun res!483440 () Bool)

(assert (=> b!721622 (=> (not res!483440) (not e!404626))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40847 (_ BitVec 32)) Bool)

(assert (=> b!721622 (= res!483440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!721623 () Bool)

(assert (=> b!721623 (= e!404626 e!404622)))

(declare-fun res!483443 () Bool)

(assert (=> b!721623 (=> (not res!483443) (not e!404622))))

(assert (=> b!721623 (= res!483443 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19546 a!3186) j!159) mask!3328) (select (arr!19546 a!3186) j!159) a!3186 mask!3328) lt!320119))))

(assert (=> b!721623 (= lt!320119 (Intermediate!7146 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!64266 res!483441) b!721609))

(assert (= (and b!721609 res!483452) b!721614))

(assert (= (and b!721614 res!483451) b!721620))

(assert (= (and b!721620 res!483449) b!721615))

(assert (= (and b!721615 res!483450) b!721613))

(assert (= (and b!721613 res!483447) b!721622))

(assert (= (and b!721622 res!483440) b!721616))

(assert (= (and b!721616 res!483448) b!721618))

(assert (= (and b!721618 res!483446) b!721623))

(assert (= (and b!721623 res!483443) b!721612))

(assert (= (and b!721612 res!483442) b!721610))

(assert (= (and b!721610 c!79456) b!721621))

(assert (= (and b!721610 (not c!79456)) b!721617))

(assert (= (and b!721610 res!483444) b!721619))

(assert (= (and b!721619 res!483445) b!721611))

(declare-fun m!676369 () Bool)

(assert (=> start!64266 m!676369))

(declare-fun m!676371 () Bool)

(assert (=> start!64266 m!676371))

(declare-fun m!676373 () Bool)

(assert (=> b!721611 m!676373))

(declare-fun m!676375 () Bool)

(assert (=> b!721611 m!676375))

(assert (=> b!721611 m!676375))

(declare-fun m!676377 () Bool)

(assert (=> b!721611 m!676377))

(declare-fun m!676379 () Bool)

(assert (=> b!721623 m!676379))

(assert (=> b!721623 m!676379))

(declare-fun m!676381 () Bool)

(assert (=> b!721623 m!676381))

(assert (=> b!721623 m!676381))

(assert (=> b!721623 m!676379))

(declare-fun m!676383 () Bool)

(assert (=> b!721623 m!676383))

(declare-fun m!676385 () Bool)

(assert (=> b!721612 m!676385))

(declare-fun m!676387 () Bool)

(assert (=> b!721620 m!676387))

(assert (=> b!721621 m!676379))

(assert (=> b!721621 m!676379))

(declare-fun m!676389 () Bool)

(assert (=> b!721621 m!676389))

(declare-fun m!676391 () Bool)

(assert (=> b!721616 m!676391))

(declare-fun m!676393 () Bool)

(assert (=> b!721613 m!676393))

(assert (=> b!721617 m!676379))

(assert (=> b!721617 m!676379))

(declare-fun m!676395 () Bool)

(assert (=> b!721617 m!676395))

(declare-fun m!676397 () Bool)

(assert (=> b!721615 m!676397))

(assert (=> b!721614 m!676379))

(assert (=> b!721614 m!676379))

(declare-fun m!676399 () Bool)

(assert (=> b!721614 m!676399))

(assert (=> b!721619 m!676373))

(assert (=> b!721619 m!676375))

(assert (=> b!721619 m!676375))

(declare-fun m!676401 () Bool)

(assert (=> b!721619 m!676401))

(declare-fun m!676403 () Bool)

(assert (=> b!721622 m!676403))

(check-sat (not b!721622) (not b!721616) (not b!721621) (not b!721619) (not b!721617) (not b!721613) (not b!721614) (not start!64266) (not b!721620) (not b!721623) (not b!721611) (not b!721615))
(check-sat)
