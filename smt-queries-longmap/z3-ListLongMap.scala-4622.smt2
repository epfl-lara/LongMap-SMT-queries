; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64428 () Bool)

(assert start!64428)

(declare-fun b!724081 () Bool)

(declare-fun e!405664 () Bool)

(declare-fun e!405666 () Bool)

(assert (=> b!724081 (= e!405664 e!405666)))

(declare-fun res!485469 () Bool)

(assert (=> b!724081 (=> (not res!485469) (not e!405666))))

(declare-datatypes ((array!40942 0))(
  ( (array!40943 (arr!19591 (Array (_ BitVec 32) (_ BitVec 64))) (size!20011 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40942)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7147 0))(
  ( (MissingZero!7147 (index!30956 (_ BitVec 32))) (Found!7147 (index!30957 (_ BitVec 32))) (Intermediate!7147 (undefined!7959 Bool) (index!30958 (_ BitVec 32)) (x!62103 (_ BitVec 32))) (Undefined!7147) (MissingVacant!7147 (index!30959 (_ BitVec 32))) )
))
(declare-fun lt!320904 () SeekEntryResult!7147)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40942 (_ BitVec 32)) SeekEntryResult!7147)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!724081 (= res!485469 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19591 a!3186) j!159) mask!3328) (select (arr!19591 a!3186) j!159) a!3186 mask!3328) lt!320904))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!724081 (= lt!320904 (Intermediate!7147 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!724082 () Bool)

(declare-fun res!485467 () Bool)

(assert (=> b!724082 (=> (not res!485467) (not e!405664))))

(declare-datatypes ((List!13500 0))(
  ( (Nil!13497) (Cons!13496 (h!14553 (_ BitVec 64)) (t!19807 List!13500)) )
))
(declare-fun arrayNoDuplicates!0 (array!40942 (_ BitVec 32) List!13500) Bool)

(assert (=> b!724082 (= res!485467 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13497))))

(declare-fun e!405660 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!724083 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!724083 (= e!405660 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19591 a!3186) j!159) a!3186 mask!3328) lt!320904))))

(declare-fun b!724084 () Bool)

(declare-fun res!485464 () Bool)

(assert (=> b!724084 (=> (not res!485464) (not e!405666))))

(assert (=> b!724084 (= res!485464 e!405660)))

(declare-fun c!79682 () Bool)

(assert (=> b!724084 (= c!79682 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!724085 () Bool)

(declare-fun e!405662 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40942 (_ BitVec 32)) SeekEntryResult!7147)

(assert (=> b!724085 (= e!405662 (= (seekEntryOrOpen!0 (select (arr!19591 a!3186) j!159) a!3186 mask!3328) (Found!7147 j!159)))))

(declare-fun b!724087 () Bool)

(declare-fun res!485474 () Bool)

(declare-fun e!405663 () Bool)

(assert (=> b!724087 (=> (not res!485474) (not e!405663))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!724087 (= res!485474 (validKeyInArray!0 k0!2102))))

(declare-fun b!724088 () Bool)

(declare-fun res!485476 () Bool)

(assert (=> b!724088 (=> (not res!485476) (not e!405664))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40942 (_ BitVec 32)) Bool)

(assert (=> b!724088 (= res!485476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!724089 () Bool)

(declare-fun res!485472 () Bool)

(assert (=> b!724089 (=> (not res!485472) (not e!405663))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!724089 (= res!485472 (and (= (size!20011 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20011 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20011 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!724090 () Bool)

(declare-fun res!485470 () Bool)

(assert (=> b!724090 (=> (not res!485470) (not e!405666))))

(assert (=> b!724090 (= res!485470 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19591 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724091 () Bool)

(declare-fun res!485465 () Bool)

(assert (=> b!724091 (=> (not res!485465) (not e!405663))))

(declare-fun arrayContainsKey!0 (array!40942 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!724091 (= res!485465 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!724092 () Bool)

(declare-fun e!405665 () Bool)

(assert (=> b!724092 (= e!405665 (not (bvsge mask!3328 #b00000000000000000000000000000000)))))

(assert (=> b!724092 e!405662))

(declare-fun res!485463 () Bool)

(assert (=> b!724092 (=> (not res!485463) (not e!405662))))

(assert (=> b!724092 (= res!485463 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24691 0))(
  ( (Unit!24692) )
))
(declare-fun lt!320902 () Unit!24691)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40942 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24691)

(assert (=> b!724092 (= lt!320902 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!724093 () Bool)

(declare-fun res!485468 () Bool)

(assert (=> b!724093 (=> (not res!485468) (not e!405663))))

(assert (=> b!724093 (= res!485468 (validKeyInArray!0 (select (arr!19591 a!3186) j!159)))))

(declare-fun b!724094 () Bool)

(assert (=> b!724094 (= e!405663 e!405664)))

(declare-fun res!485473 () Bool)

(assert (=> b!724094 (=> (not res!485473) (not e!405664))))

(declare-fun lt!320901 () SeekEntryResult!7147)

(assert (=> b!724094 (= res!485473 (or (= lt!320901 (MissingZero!7147 i!1173)) (= lt!320901 (MissingVacant!7147 i!1173))))))

(assert (=> b!724094 (= lt!320901 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!485466 () Bool)

(assert (=> start!64428 (=> (not res!485466) (not e!405663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64428 (= res!485466 (validMask!0 mask!3328))))

(assert (=> start!64428 e!405663))

(assert (=> start!64428 true))

(declare-fun array_inv!15450 (array!40942) Bool)

(assert (=> start!64428 (array_inv!15450 a!3186)))

(declare-fun b!724086 () Bool)

(declare-fun res!485471 () Bool)

(assert (=> b!724086 (=> (not res!485471) (not e!405664))))

(assert (=> b!724086 (= res!485471 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20011 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20011 a!3186))))))

(declare-fun b!724095 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40942 (_ BitVec 32)) SeekEntryResult!7147)

(assert (=> b!724095 (= e!405660 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19591 a!3186) j!159) a!3186 mask!3328) (Found!7147 j!159)))))

(declare-fun b!724096 () Bool)

(assert (=> b!724096 (= e!405666 e!405665)))

(declare-fun res!485475 () Bool)

(assert (=> b!724096 (=> (not res!485475) (not e!405665))))

(declare-fun lt!320900 () array!40942)

(declare-fun lt!320903 () (_ BitVec 64))

(assert (=> b!724096 (= res!485475 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320903 mask!3328) lt!320903 lt!320900 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320903 lt!320900 mask!3328)))))

(assert (=> b!724096 (= lt!320903 (select (store (arr!19591 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!724096 (= lt!320900 (array!40943 (store (arr!19591 a!3186) i!1173 k0!2102) (size!20011 a!3186)))))

(assert (= (and start!64428 res!485466) b!724089))

(assert (= (and b!724089 res!485472) b!724093))

(assert (= (and b!724093 res!485468) b!724087))

(assert (= (and b!724087 res!485474) b!724091))

(assert (= (and b!724091 res!485465) b!724094))

(assert (= (and b!724094 res!485473) b!724088))

(assert (= (and b!724088 res!485476) b!724082))

(assert (= (and b!724082 res!485467) b!724086))

(assert (= (and b!724086 res!485471) b!724081))

(assert (= (and b!724081 res!485469) b!724090))

(assert (= (and b!724090 res!485470) b!724084))

(assert (= (and b!724084 c!79682) b!724083))

(assert (= (and b!724084 (not c!79682)) b!724095))

(assert (= (and b!724084 res!485464) b!724096))

(assert (= (and b!724096 res!485475) b!724092))

(assert (= (and b!724092 res!485463) b!724085))

(declare-fun m!679017 () Bool)

(assert (=> b!724096 m!679017))

(assert (=> b!724096 m!679017))

(declare-fun m!679019 () Bool)

(assert (=> b!724096 m!679019))

(declare-fun m!679021 () Bool)

(assert (=> b!724096 m!679021))

(declare-fun m!679023 () Bool)

(assert (=> b!724096 m!679023))

(declare-fun m!679025 () Bool)

(assert (=> b!724096 m!679025))

(declare-fun m!679027 () Bool)

(assert (=> b!724094 m!679027))

(declare-fun m!679029 () Bool)

(assert (=> start!64428 m!679029))

(declare-fun m!679031 () Bool)

(assert (=> start!64428 m!679031))

(declare-fun m!679033 () Bool)

(assert (=> b!724090 m!679033))

(declare-fun m!679035 () Bool)

(assert (=> b!724085 m!679035))

(assert (=> b!724085 m!679035))

(declare-fun m!679037 () Bool)

(assert (=> b!724085 m!679037))

(declare-fun m!679039 () Bool)

(assert (=> b!724087 m!679039))

(assert (=> b!724093 m!679035))

(assert (=> b!724093 m!679035))

(declare-fun m!679041 () Bool)

(assert (=> b!724093 m!679041))

(assert (=> b!724081 m!679035))

(assert (=> b!724081 m!679035))

(declare-fun m!679043 () Bool)

(assert (=> b!724081 m!679043))

(assert (=> b!724081 m!679043))

(assert (=> b!724081 m!679035))

(declare-fun m!679045 () Bool)

(assert (=> b!724081 m!679045))

(assert (=> b!724083 m!679035))

(assert (=> b!724083 m!679035))

(declare-fun m!679047 () Bool)

(assert (=> b!724083 m!679047))

(assert (=> b!724095 m!679035))

(assert (=> b!724095 m!679035))

(declare-fun m!679049 () Bool)

(assert (=> b!724095 m!679049))

(declare-fun m!679051 () Bool)

(assert (=> b!724088 m!679051))

(declare-fun m!679053 () Bool)

(assert (=> b!724092 m!679053))

(declare-fun m!679055 () Bool)

(assert (=> b!724092 m!679055))

(declare-fun m!679057 () Bool)

(assert (=> b!724091 m!679057))

(declare-fun m!679059 () Bool)

(assert (=> b!724082 m!679059))

(check-sat (not b!724081) (not b!724095) (not b!724085) (not b!724091) (not b!724092) (not start!64428) (not b!724087) (not b!724088) (not b!724093) (not b!724094) (not b!724082) (not b!724083) (not b!724096))
(check-sat)
