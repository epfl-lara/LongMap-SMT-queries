; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64308 () Bool)

(assert start!64308)

(declare-fun b!722477 () Bool)

(declare-fun res!484185 () Bool)

(declare-fun e!404942 () Bool)

(assert (=> b!722477 (=> (not res!484185) (not e!404942))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40889 0))(
  ( (array!40890 (arr!19567 (Array (_ BitVec 32) (_ BitVec 64))) (size!19988 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40889)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!722477 (= res!484185 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19567 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!722479 () Bool)

(declare-fun res!484193 () Bool)

(declare-fun e!404944 () Bool)

(assert (=> b!722479 (=> (not res!484193) (not e!404944))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722479 (= res!484193 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19988 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19988 a!3186))))))

(declare-fun b!722480 () Bool)

(declare-fun res!484191 () Bool)

(declare-fun e!404943 () Bool)

(assert (=> b!722480 (=> (not res!484191) (not e!404943))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!722480 (= res!484191 (and (= (size!19988 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19988 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19988 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!722481 () Bool)

(assert (=> b!722481 (= e!404944 e!404942)))

(declare-fun res!484182 () Bool)

(assert (=> b!722481 (=> (not res!484182) (not e!404942))))

(declare-datatypes ((SeekEntryResult!7167 0))(
  ( (MissingZero!7167 (index!31036 (_ BitVec 32))) (Found!7167 (index!31037 (_ BitVec 32))) (Intermediate!7167 (undefined!7979 Bool) (index!31038 (_ BitVec 32)) (x!62040 (_ BitVec 32))) (Undefined!7167) (MissingVacant!7167 (index!31039 (_ BitVec 32))) )
))
(declare-fun lt!320300 () SeekEntryResult!7167)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40889 (_ BitVec 32)) SeekEntryResult!7167)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722481 (= res!484182 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19567 a!3186) j!159) mask!3328) (select (arr!19567 a!3186) j!159) a!3186 mask!3328) lt!320300))))

(assert (=> b!722481 (= lt!320300 (Intermediate!7167 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!722482 () Bool)

(assert (=> b!722482 (= e!404943 e!404944)))

(declare-fun res!484186 () Bool)

(assert (=> b!722482 (=> (not res!484186) (not e!404944))))

(declare-fun lt!320298 () SeekEntryResult!7167)

(assert (=> b!722482 (= res!484186 (or (= lt!320298 (MissingZero!7167 i!1173)) (= lt!320298 (MissingVacant!7167 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40889 (_ BitVec 32)) SeekEntryResult!7167)

(assert (=> b!722482 (= lt!320298 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!722483 () Bool)

(declare-fun res!484184 () Bool)

(assert (=> b!722483 (=> (not res!484184) (not e!404944))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40889 (_ BitVec 32)) Bool)

(assert (=> b!722483 (= res!484184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722484 () Bool)

(assert (=> b!722484 (= e!404942 false)))

(declare-fun lt!320296 () SeekEntryResult!7167)

(declare-fun lt!320297 () array!40889)

(declare-fun lt!320295 () (_ BitVec 64))

(assert (=> b!722484 (= lt!320296 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320295 lt!320297 mask!3328))))

(declare-fun lt!320299 () SeekEntryResult!7167)

(assert (=> b!722484 (= lt!320299 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320295 mask!3328) lt!320295 lt!320297 mask!3328))))

(assert (=> b!722484 (= lt!320295 (select (store (arr!19567 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!722484 (= lt!320297 (array!40890 (store (arr!19567 a!3186) i!1173 k0!2102) (size!19988 a!3186)))))

(declare-fun b!722478 () Bool)

(declare-fun res!484188 () Bool)

(assert (=> b!722478 (=> (not res!484188) (not e!404943))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722478 (= res!484188 (validKeyInArray!0 k0!2102))))

(declare-fun res!484183 () Bool)

(assert (=> start!64308 (=> (not res!484183) (not e!404943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64308 (= res!484183 (validMask!0 mask!3328))))

(assert (=> start!64308 e!404943))

(assert (=> start!64308 true))

(declare-fun array_inv!15363 (array!40889) Bool)

(assert (=> start!64308 (array_inv!15363 a!3186)))

(declare-fun b!722485 () Bool)

(declare-fun res!484187 () Bool)

(assert (=> b!722485 (=> (not res!484187) (not e!404943))))

(assert (=> b!722485 (= res!484187 (validKeyInArray!0 (select (arr!19567 a!3186) j!159)))))

(declare-fun b!722486 () Bool)

(declare-fun res!484192 () Bool)

(assert (=> b!722486 (=> (not res!484192) (not e!404944))))

(declare-datatypes ((List!13569 0))(
  ( (Nil!13566) (Cons!13565 (h!14619 (_ BitVec 64)) (t!19884 List!13569)) )
))
(declare-fun arrayNoDuplicates!0 (array!40889 (_ BitVec 32) List!13569) Bool)

(assert (=> b!722486 (= res!484192 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13566))))

(declare-fun e!404945 () Bool)

(declare-fun b!722487 () Bool)

(assert (=> b!722487 (= e!404945 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19567 a!3186) j!159) a!3186 mask!3328) lt!320300))))

(declare-fun b!722488 () Bool)

(declare-fun res!484189 () Bool)

(assert (=> b!722488 (=> (not res!484189) (not e!404942))))

(assert (=> b!722488 (= res!484189 e!404945)))

(declare-fun c!79519 () Bool)

(assert (=> b!722488 (= c!79519 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!722489 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40889 (_ BitVec 32)) SeekEntryResult!7167)

(assert (=> b!722489 (= e!404945 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19567 a!3186) j!159) a!3186 mask!3328) (Found!7167 j!159)))))

(declare-fun b!722490 () Bool)

(declare-fun res!484190 () Bool)

(assert (=> b!722490 (=> (not res!484190) (not e!404943))))

(declare-fun arrayContainsKey!0 (array!40889 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722490 (= res!484190 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!64308 res!484183) b!722480))

(assert (= (and b!722480 res!484191) b!722485))

(assert (= (and b!722485 res!484187) b!722478))

(assert (= (and b!722478 res!484188) b!722490))

(assert (= (and b!722490 res!484190) b!722482))

(assert (= (and b!722482 res!484186) b!722483))

(assert (= (and b!722483 res!484184) b!722486))

(assert (= (and b!722486 res!484192) b!722479))

(assert (= (and b!722479 res!484193) b!722481))

(assert (= (and b!722481 res!484182) b!722477))

(assert (= (and b!722477 res!484185) b!722488))

(assert (= (and b!722488 c!79519) b!722487))

(assert (= (and b!722488 (not c!79519)) b!722489))

(assert (= (and b!722488 res!484189) b!722484))

(declare-fun m!677001 () Bool)

(assert (=> b!722483 m!677001))

(declare-fun m!677003 () Bool)

(assert (=> b!722484 m!677003))

(assert (=> b!722484 m!677003))

(declare-fun m!677005 () Bool)

(assert (=> b!722484 m!677005))

(declare-fun m!677007 () Bool)

(assert (=> b!722484 m!677007))

(declare-fun m!677009 () Bool)

(assert (=> b!722484 m!677009))

(declare-fun m!677011 () Bool)

(assert (=> b!722484 m!677011))

(declare-fun m!677013 () Bool)

(assert (=> b!722482 m!677013))

(declare-fun m!677015 () Bool)

(assert (=> b!722477 m!677015))

(declare-fun m!677017 () Bool)

(assert (=> b!722490 m!677017))

(declare-fun m!677019 () Bool)

(assert (=> b!722485 m!677019))

(assert (=> b!722485 m!677019))

(declare-fun m!677021 () Bool)

(assert (=> b!722485 m!677021))

(assert (=> b!722481 m!677019))

(assert (=> b!722481 m!677019))

(declare-fun m!677023 () Bool)

(assert (=> b!722481 m!677023))

(assert (=> b!722481 m!677023))

(assert (=> b!722481 m!677019))

(declare-fun m!677025 () Bool)

(assert (=> b!722481 m!677025))

(assert (=> b!722489 m!677019))

(assert (=> b!722489 m!677019))

(declare-fun m!677027 () Bool)

(assert (=> b!722489 m!677027))

(declare-fun m!677029 () Bool)

(assert (=> b!722486 m!677029))

(assert (=> b!722487 m!677019))

(assert (=> b!722487 m!677019))

(declare-fun m!677031 () Bool)

(assert (=> b!722487 m!677031))

(declare-fun m!677033 () Bool)

(assert (=> start!64308 m!677033))

(declare-fun m!677035 () Bool)

(assert (=> start!64308 m!677035))

(declare-fun m!677037 () Bool)

(assert (=> b!722478 m!677037))

(check-sat (not b!722482) (not b!722478) (not b!722486) (not b!722485) (not b!722484) (not start!64308) (not b!722490) (not b!722489) (not b!722483) (not b!722481) (not b!722487))
(check-sat)
