; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45592 () Bool)

(assert start!45592)

(declare-fun b!502024 () Bool)

(declare-fun e!294074 () Bool)

(assert (=> b!502024 (= e!294074 false)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4021 0))(
  ( (MissingZero!4021 (index!18272 (_ BitVec 32))) (Found!4021 (index!18273 (_ BitVec 32))) (Intermediate!4021 (undefined!4833 Bool) (index!18274 (_ BitVec 32)) (x!47302 (_ BitVec 32))) (Undefined!4021) (MissingVacant!4021 (index!18275 (_ BitVec 32))) )
))
(declare-fun lt!228114 () SeekEntryResult!4021)

(declare-fun e!294077 () Bool)

(declare-fun b!502025 () Bool)

(declare-datatypes ((array!32348 0))(
  ( (array!32349 (arr!15554 (Array (_ BitVec 32) (_ BitVec 64))) (size!15918 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32348)

(declare-fun lt!228111 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32348 (_ BitVec 32)) SeekEntryResult!4021)

(assert (=> b!502025 (= e!294077 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228111 (index!18274 lt!228114) (select (arr!15554 a!3235) j!176) a!3235 mask!3524) (Found!4021 j!176))))))

(declare-fun b!502026 () Bool)

(declare-fun res!303497 () Bool)

(declare-fun e!294081 () Bool)

(assert (=> b!502026 (=> (not res!303497) (not e!294081))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!502026 (= res!303497 (and (= (size!15918 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15918 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15918 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!303492 () Bool)

(assert (=> start!45592 (=> (not res!303492) (not e!294081))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45592 (= res!303492 (validMask!0 mask!3524))))

(assert (=> start!45592 e!294081))

(assert (=> start!45592 true))

(declare-fun array_inv!11350 (array!32348) Bool)

(assert (=> start!45592 (array_inv!11350 a!3235)))

(declare-fun b!502027 () Bool)

(declare-fun res!303489 () Bool)

(declare-fun e!294079 () Bool)

(assert (=> b!502027 (=> (not res!303489) (not e!294079))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32348 (_ BitVec 32)) Bool)

(assert (=> b!502027 (= res!303489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!502028 () Bool)

(declare-fun e!294076 () Bool)

(assert (=> b!502028 (= e!294076 true)))

(declare-fun lt!228118 () array!32348)

(declare-fun lt!228113 () SeekEntryResult!4021)

(declare-fun lt!228108 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32348 (_ BitVec 32)) SeekEntryResult!4021)

(assert (=> b!502028 (= lt!228113 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228111 lt!228108 lt!228118 mask!3524))))

(declare-fun b!502029 () Bool)

(declare-fun e!294080 () Bool)

(assert (=> b!502029 (= e!294079 (not e!294080))))

(declare-fun res!303499 () Bool)

(assert (=> b!502029 (=> res!303499 e!294080)))

(declare-fun lt!228116 () (_ BitVec 32))

(assert (=> b!502029 (= res!303499 (= lt!228114 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228116 lt!228108 lt!228118 mask!3524)))))

(assert (=> b!502029 (= lt!228114 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228111 (select (arr!15554 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!502029 (= lt!228116 (toIndex!0 lt!228108 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!502029 (= lt!228108 (select (store (arr!15554 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!502029 (= lt!228111 (toIndex!0 (select (arr!15554 a!3235) j!176) mask!3524))))

(assert (=> b!502029 (= lt!228118 (array!32349 (store (arr!15554 a!3235) i!1204 k!2280) (size!15918 a!3235)))))

(declare-fun e!294073 () Bool)

(assert (=> b!502029 e!294073))

(declare-fun res!303502 () Bool)

(assert (=> b!502029 (=> (not res!303502) (not e!294073))))

(assert (=> b!502029 (= res!303502 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15160 0))(
  ( (Unit!15161) )
))
(declare-fun lt!228110 () Unit!15160)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32348 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15160)

(assert (=> b!502029 (= lt!228110 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!502030 () Bool)

(declare-fun e!294075 () Unit!15160)

(declare-fun Unit!15162 () Unit!15160)

(assert (=> b!502030 (= e!294075 Unit!15162)))

(declare-fun lt!228115 () Unit!15160)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32348 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15160)

(assert (=> b!502030 (= lt!228115 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!228111 #b00000000000000000000000000000000 (index!18274 lt!228114) (x!47302 lt!228114) mask!3524))))

(declare-fun res!303496 () Bool)

(assert (=> b!502030 (= res!303496 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228111 lt!228108 lt!228118 mask!3524) (Intermediate!4021 false (index!18274 lt!228114) (x!47302 lt!228114))))))

(assert (=> b!502030 (=> (not res!303496) (not e!294074))))

(assert (=> b!502030 e!294074))

(declare-fun b!502031 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32348 (_ BitVec 32)) SeekEntryResult!4021)

(assert (=> b!502031 (= e!294073 (= (seekEntryOrOpen!0 (select (arr!15554 a!3235) j!176) a!3235 mask!3524) (Found!4021 j!176)))))

(declare-fun b!502032 () Bool)

(declare-fun res!303501 () Bool)

(assert (=> b!502032 (=> (not res!303501) (not e!294081))))

(declare-fun arrayContainsKey!0 (array!32348 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!502032 (= res!303501 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!502033 () Bool)

(declare-fun Unit!15163 () Unit!15160)

(assert (=> b!502033 (= e!294075 Unit!15163)))

(declare-fun b!502034 () Bool)

(declare-fun res!303493 () Bool)

(assert (=> b!502034 (=> (not res!303493) (not e!294081))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!502034 (= res!303493 (validKeyInArray!0 k!2280))))

(declare-fun b!502035 () Bool)

(declare-fun res!303494 () Bool)

(assert (=> b!502035 (=> (not res!303494) (not e!294079))))

(declare-datatypes ((List!9712 0))(
  ( (Nil!9709) (Cons!9708 (h!10585 (_ BitVec 64)) (t!15940 List!9712)) )
))
(declare-fun arrayNoDuplicates!0 (array!32348 (_ BitVec 32) List!9712) Bool)

(assert (=> b!502035 (= res!303494 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9709))))

(declare-fun b!502036 () Bool)

(declare-fun res!303490 () Bool)

(assert (=> b!502036 (=> (not res!303490) (not e!294081))))

(assert (=> b!502036 (= res!303490 (validKeyInArray!0 (select (arr!15554 a!3235) j!176)))))

(declare-fun b!502037 () Bool)

(declare-fun res!303498 () Bool)

(assert (=> b!502037 (=> res!303498 e!294080)))

(assert (=> b!502037 (= res!303498 (or (undefined!4833 lt!228114) (not (is-Intermediate!4021 lt!228114))))))

(declare-fun b!502038 () Bool)

(declare-fun res!303503 () Bool)

(assert (=> b!502038 (=> res!303503 e!294076)))

(assert (=> b!502038 (= res!303503 e!294077)))

(declare-fun res!303500 () Bool)

(assert (=> b!502038 (=> (not res!303500) (not e!294077))))

(assert (=> b!502038 (= res!303500 (bvsgt #b00000000000000000000000000000000 (x!47302 lt!228114)))))

(declare-fun b!502039 () Bool)

(assert (=> b!502039 (= e!294081 e!294079)))

(declare-fun res!303491 () Bool)

(assert (=> b!502039 (=> (not res!303491) (not e!294079))))

(declare-fun lt!228112 () SeekEntryResult!4021)

(assert (=> b!502039 (= res!303491 (or (= lt!228112 (MissingZero!4021 i!1204)) (= lt!228112 (MissingVacant!4021 i!1204))))))

(assert (=> b!502039 (= lt!228112 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!502040 () Bool)

(assert (=> b!502040 (= e!294080 e!294076)))

(declare-fun res!303495 () Bool)

(assert (=> b!502040 (=> res!303495 e!294076)))

(assert (=> b!502040 (= res!303495 (or (bvsgt (x!47302 lt!228114) #b01111111111111111111111111111110) (bvslt lt!228111 #b00000000000000000000000000000000) (bvsge lt!228111 (size!15918 a!3235)) (bvslt (index!18274 lt!228114) #b00000000000000000000000000000000) (bvsge (index!18274 lt!228114) (size!15918 a!3235)) (not (= lt!228114 (Intermediate!4021 false (index!18274 lt!228114) (x!47302 lt!228114))))))))

(assert (=> b!502040 (= (index!18274 lt!228114) i!1204)))

(declare-fun lt!228117 () Unit!15160)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32348 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15160)

(assert (=> b!502040 (= lt!228117 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!228111 #b00000000000000000000000000000000 (index!18274 lt!228114) (x!47302 lt!228114) mask!3524))))

(assert (=> b!502040 (and (or (= (select (arr!15554 a!3235) (index!18274 lt!228114)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15554 a!3235) (index!18274 lt!228114)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15554 a!3235) (index!18274 lt!228114)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15554 a!3235) (index!18274 lt!228114)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228109 () Unit!15160)

(assert (=> b!502040 (= lt!228109 e!294075)))

(declare-fun c!59546 () Bool)

(assert (=> b!502040 (= c!59546 (= (select (arr!15554 a!3235) (index!18274 lt!228114)) (select (arr!15554 a!3235) j!176)))))

(assert (=> b!502040 (and (bvslt (x!47302 lt!228114) #b01111111111111111111111111111110) (or (= (select (arr!15554 a!3235) (index!18274 lt!228114)) (select (arr!15554 a!3235) j!176)) (= (select (arr!15554 a!3235) (index!18274 lt!228114)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15554 a!3235) (index!18274 lt!228114)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!45592 res!303492) b!502026))

(assert (= (and b!502026 res!303497) b!502036))

(assert (= (and b!502036 res!303490) b!502034))

(assert (= (and b!502034 res!303493) b!502032))

(assert (= (and b!502032 res!303501) b!502039))

(assert (= (and b!502039 res!303491) b!502027))

(assert (= (and b!502027 res!303489) b!502035))

(assert (= (and b!502035 res!303494) b!502029))

(assert (= (and b!502029 res!303502) b!502031))

(assert (= (and b!502029 (not res!303499)) b!502037))

(assert (= (and b!502037 (not res!303498)) b!502040))

(assert (= (and b!502040 c!59546) b!502030))

(assert (= (and b!502040 (not c!59546)) b!502033))

(assert (= (and b!502030 res!303496) b!502024))

(assert (= (and b!502040 (not res!303495)) b!502038))

(assert (= (and b!502038 res!303500) b!502025))

(assert (= (and b!502038 (not res!303503)) b!502028))

(declare-fun m!482999 () Bool)

(assert (=> b!502036 m!482999))

(assert (=> b!502036 m!482999))

(declare-fun m!483001 () Bool)

(assert (=> b!502036 m!483001))

(declare-fun m!483003 () Bool)

(assert (=> b!502039 m!483003))

(declare-fun m!483005 () Bool)

(assert (=> b!502035 m!483005))

(declare-fun m!483007 () Bool)

(assert (=> b!502028 m!483007))

(assert (=> b!502031 m!482999))

(assert (=> b!502031 m!482999))

(declare-fun m!483009 () Bool)

(assert (=> b!502031 m!483009))

(assert (=> b!502025 m!482999))

(assert (=> b!502025 m!482999))

(declare-fun m!483011 () Bool)

(assert (=> b!502025 m!483011))

(declare-fun m!483013 () Bool)

(assert (=> b!502032 m!483013))

(assert (=> b!502029 m!482999))

(declare-fun m!483015 () Bool)

(assert (=> b!502029 m!483015))

(declare-fun m!483017 () Bool)

(assert (=> b!502029 m!483017))

(declare-fun m!483019 () Bool)

(assert (=> b!502029 m!483019))

(declare-fun m!483021 () Bool)

(assert (=> b!502029 m!483021))

(declare-fun m!483023 () Bool)

(assert (=> b!502029 m!483023))

(declare-fun m!483025 () Bool)

(assert (=> b!502029 m!483025))

(assert (=> b!502029 m!482999))

(declare-fun m!483027 () Bool)

(assert (=> b!502029 m!483027))

(assert (=> b!502029 m!482999))

(declare-fun m!483029 () Bool)

(assert (=> b!502029 m!483029))

(declare-fun m!483031 () Bool)

(assert (=> b!502027 m!483031))

(declare-fun m!483033 () Bool)

(assert (=> b!502040 m!483033))

(declare-fun m!483035 () Bool)

(assert (=> b!502040 m!483035))

(assert (=> b!502040 m!482999))

(declare-fun m!483037 () Bool)

(assert (=> start!45592 m!483037))

(declare-fun m!483039 () Bool)

(assert (=> start!45592 m!483039))

(declare-fun m!483041 () Bool)

(assert (=> b!502034 m!483041))

(declare-fun m!483043 () Bool)

(assert (=> b!502030 m!483043))

(assert (=> b!502030 m!483007))

(push 1)

(assert (not b!502036))

(assert (not start!45592))

(assert (not b!502030))

(assert (not b!502031))

(assert (not b!502039))

(assert (not b!502025))

(assert (not b!502029))

(assert (not b!502032))

(assert (not b!502034))

(assert (not b!502040))

(assert (not b!502027))

(assert (not b!502028))

(assert (not b!502035))

