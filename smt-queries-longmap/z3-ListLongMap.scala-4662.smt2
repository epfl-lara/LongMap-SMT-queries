; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64872 () Bool)

(assert start!64872)

(declare-fun b!731604 () Bool)

(declare-fun e!409460 () Bool)

(declare-fun e!409456 () Bool)

(assert (=> b!731604 (= e!409460 e!409456)))

(declare-fun res!491423 () Bool)

(assert (=> b!731604 (=> (not res!491423) (not e!409456))))

(declare-datatypes ((array!41191 0))(
  ( (array!41192 (arr!19711 (Array (_ BitVec 32) (_ BitVec 64))) (size!20131 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41191)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7267 0))(
  ( (MissingZero!7267 (index!31436 (_ BitVec 32))) (Found!7267 (index!31437 (_ BitVec 32))) (Intermediate!7267 (undefined!8079 Bool) (index!31438 (_ BitVec 32)) (x!62573 (_ BitVec 32))) (Undefined!7267) (MissingVacant!7267 (index!31439 (_ BitVec 32))) )
))
(declare-fun lt!324190 () SeekEntryResult!7267)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41191 (_ BitVec 32)) SeekEntryResult!7267)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!731604 (= res!491423 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19711 a!3186) j!159) mask!3328) (select (arr!19711 a!3186) j!159) a!3186 mask!3328) lt!324190))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!731604 (= lt!324190 (Intermediate!7267 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun lt!324187 () SeekEntryResult!7267)

(declare-fun b!731605 () Bool)

(declare-fun e!409464 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41191 (_ BitVec 32)) SeekEntryResult!7267)

(assert (=> b!731605 (= e!409464 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19711 a!3186) j!159) a!3186 mask!3328) lt!324187))))

(declare-fun b!731606 () Bool)

(declare-fun e!409455 () Bool)

(assert (=> b!731606 (= e!409455 (bvsge mask!3328 #b00000000000000000000000000000000))))

(declare-fun b!731607 () Bool)

(declare-fun res!491418 () Bool)

(declare-fun e!409459 () Bool)

(assert (=> b!731607 (=> (not res!491418) (not e!409459))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!731607 (= res!491418 (validKeyInArray!0 (select (arr!19711 a!3186) j!159)))))

(declare-fun b!731608 () Bool)

(declare-fun e!409458 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!731608 (= e!409458 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19711 a!3186) j!159) a!3186 mask!3328) (Found!7267 j!159)))))

(declare-fun b!731609 () Bool)

(declare-fun res!491426 () Bool)

(assert (=> b!731609 (=> (not res!491426) (not e!409459))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!731609 (= res!491426 (validKeyInArray!0 k0!2102))))

(declare-fun b!731610 () Bool)

(declare-fun e!409462 () Bool)

(assert (=> b!731610 (= e!409462 e!409455)))

(declare-fun res!491425 () Bool)

(assert (=> b!731610 (=> res!491425 e!409455)))

(assert (=> b!731610 (= res!491425 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!324194 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!731610 (= lt!324194 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!731611 () Bool)

(assert (=> b!731611 (= e!409458 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19711 a!3186) j!159) a!3186 mask!3328) lt!324190))))

(declare-fun b!731613 () Bool)

(declare-fun res!491411 () Bool)

(assert (=> b!731613 (=> (not res!491411) (not e!409460))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41191 (_ BitVec 32)) Bool)

(assert (=> b!731613 (= res!491411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!731614 () Bool)

(declare-fun res!491424 () Bool)

(assert (=> b!731614 (=> (not res!491424) (not e!409460))))

(declare-datatypes ((List!13620 0))(
  ( (Nil!13617) (Cons!13616 (h!14682 (_ BitVec 64)) (t!19927 List!13620)) )
))
(declare-fun arrayNoDuplicates!0 (array!41191 (_ BitVec 32) List!13620) Bool)

(assert (=> b!731614 (= res!491424 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13617))))

(declare-fun b!731615 () Bool)

(declare-fun res!491416 () Bool)

(assert (=> b!731615 (=> res!491416 e!409455)))

(assert (=> b!731615 (= res!491416 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19711 a!3186) j!159) a!3186 mask!3328) (Found!7267 j!159))))))

(declare-fun b!731616 () Bool)

(assert (=> b!731616 (= e!409459 e!409460)))

(declare-fun res!491427 () Bool)

(assert (=> b!731616 (=> (not res!491427) (not e!409460))))

(declare-fun lt!324191 () SeekEntryResult!7267)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!731616 (= res!491427 (or (= lt!324191 (MissingZero!7267 i!1173)) (= lt!324191 (MissingVacant!7267 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41191 (_ BitVec 32)) SeekEntryResult!7267)

(assert (=> b!731616 (= lt!324191 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!731617 () Bool)

(declare-fun res!491421 () Bool)

(assert (=> b!731617 (=> (not res!491421) (not e!409459))))

(declare-fun arrayContainsKey!0 (array!41191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!731617 (= res!491421 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!731618 () Bool)

(declare-fun res!491415 () Bool)

(assert (=> b!731618 (=> (not res!491415) (not e!409456))))

(assert (=> b!731618 (= res!491415 e!409458)))

(declare-fun c!80474 () Bool)

(assert (=> b!731618 (= c!80474 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!731619 () Bool)

(declare-fun e!409461 () Bool)

(assert (=> b!731619 (= e!409461 (not e!409462))))

(declare-fun res!491413 () Bool)

(assert (=> b!731619 (=> res!491413 e!409462)))

(declare-fun lt!324189 () SeekEntryResult!7267)

(get-info :version)

(assert (=> b!731619 (= res!491413 (or (not ((_ is Intermediate!7267) lt!324189)) (bvsge x!1131 (x!62573 lt!324189))))))

(declare-fun e!409457 () Bool)

(assert (=> b!731619 e!409457))

(declare-fun res!491419 () Bool)

(assert (=> b!731619 (=> (not res!491419) (not e!409457))))

(assert (=> b!731619 (= res!491419 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24931 0))(
  ( (Unit!24932) )
))
(declare-fun lt!324188 () Unit!24931)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41191 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24931)

(assert (=> b!731619 (= lt!324188 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!731612 () Bool)

(declare-fun res!491422 () Bool)

(assert (=> b!731612 (=> (not res!491422) (not e!409459))))

(assert (=> b!731612 (= res!491422 (and (= (size!20131 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20131 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20131 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!491412 () Bool)

(assert (=> start!64872 (=> (not res!491412) (not e!409459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64872 (= res!491412 (validMask!0 mask!3328))))

(assert (=> start!64872 e!409459))

(assert (=> start!64872 true))

(declare-fun array_inv!15570 (array!41191) Bool)

(assert (=> start!64872 (array_inv!15570 a!3186)))

(declare-fun b!731620 () Bool)

(assert (=> b!731620 (= e!409457 e!409464)))

(declare-fun res!491417 () Bool)

(assert (=> b!731620 (=> (not res!491417) (not e!409464))))

(assert (=> b!731620 (= res!491417 (= (seekEntryOrOpen!0 (select (arr!19711 a!3186) j!159) a!3186 mask!3328) lt!324187))))

(assert (=> b!731620 (= lt!324187 (Found!7267 j!159))))

(declare-fun b!731621 () Bool)

(assert (=> b!731621 (= e!409456 e!409461)))

(declare-fun res!491428 () Bool)

(assert (=> b!731621 (=> (not res!491428) (not e!409461))))

(declare-fun lt!324192 () SeekEntryResult!7267)

(assert (=> b!731621 (= res!491428 (= lt!324192 lt!324189))))

(declare-fun lt!324195 () array!41191)

(declare-fun lt!324193 () (_ BitVec 64))

(assert (=> b!731621 (= lt!324189 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324193 lt!324195 mask!3328))))

(assert (=> b!731621 (= lt!324192 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324193 mask!3328) lt!324193 lt!324195 mask!3328))))

(assert (=> b!731621 (= lt!324193 (select (store (arr!19711 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!731621 (= lt!324195 (array!41192 (store (arr!19711 a!3186) i!1173 k0!2102) (size!20131 a!3186)))))

(declare-fun b!731622 () Bool)

(declare-fun res!491420 () Bool)

(assert (=> b!731622 (=> (not res!491420) (not e!409456))))

(assert (=> b!731622 (= res!491420 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19711 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!731623 () Bool)

(declare-fun res!491414 () Bool)

(assert (=> b!731623 (=> (not res!491414) (not e!409460))))

(assert (=> b!731623 (= res!491414 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20131 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20131 a!3186))))))

(assert (= (and start!64872 res!491412) b!731612))

(assert (= (and b!731612 res!491422) b!731607))

(assert (= (and b!731607 res!491418) b!731609))

(assert (= (and b!731609 res!491426) b!731617))

(assert (= (and b!731617 res!491421) b!731616))

(assert (= (and b!731616 res!491427) b!731613))

(assert (= (and b!731613 res!491411) b!731614))

(assert (= (and b!731614 res!491424) b!731623))

(assert (= (and b!731623 res!491414) b!731604))

(assert (= (and b!731604 res!491423) b!731622))

(assert (= (and b!731622 res!491420) b!731618))

(assert (= (and b!731618 c!80474) b!731611))

(assert (= (and b!731618 (not c!80474)) b!731608))

(assert (= (and b!731618 res!491415) b!731621))

(assert (= (and b!731621 res!491428) b!731619))

(assert (= (and b!731619 res!491419) b!731620))

(assert (= (and b!731620 res!491417) b!731605))

(assert (= (and b!731619 (not res!491413)) b!731610))

(assert (= (and b!731610 (not res!491425)) b!731615))

(assert (= (and b!731615 (not res!491416)) b!731606))

(declare-fun m!685467 () Bool)

(assert (=> b!731614 m!685467))

(declare-fun m!685469 () Bool)

(assert (=> b!731622 m!685469))

(declare-fun m!685471 () Bool)

(assert (=> b!731604 m!685471))

(assert (=> b!731604 m!685471))

(declare-fun m!685473 () Bool)

(assert (=> b!731604 m!685473))

(assert (=> b!731604 m!685473))

(assert (=> b!731604 m!685471))

(declare-fun m!685475 () Bool)

(assert (=> b!731604 m!685475))

(declare-fun m!685477 () Bool)

(assert (=> b!731610 m!685477))

(assert (=> b!731615 m!685471))

(assert (=> b!731615 m!685471))

(declare-fun m!685479 () Bool)

(assert (=> b!731615 m!685479))

(assert (=> b!731620 m!685471))

(assert (=> b!731620 m!685471))

(declare-fun m!685481 () Bool)

(assert (=> b!731620 m!685481))

(declare-fun m!685483 () Bool)

(assert (=> b!731621 m!685483))

(declare-fun m!685485 () Bool)

(assert (=> b!731621 m!685485))

(declare-fun m!685487 () Bool)

(assert (=> b!731621 m!685487))

(assert (=> b!731621 m!685487))

(declare-fun m!685489 () Bool)

(assert (=> b!731621 m!685489))

(declare-fun m!685491 () Bool)

(assert (=> b!731621 m!685491))

(assert (=> b!731605 m!685471))

(assert (=> b!731605 m!685471))

(declare-fun m!685493 () Bool)

(assert (=> b!731605 m!685493))

(declare-fun m!685495 () Bool)

(assert (=> b!731613 m!685495))

(declare-fun m!685497 () Bool)

(assert (=> b!731609 m!685497))

(assert (=> b!731611 m!685471))

(assert (=> b!731611 m!685471))

(declare-fun m!685499 () Bool)

(assert (=> b!731611 m!685499))

(assert (=> b!731607 m!685471))

(assert (=> b!731607 m!685471))

(declare-fun m!685501 () Bool)

(assert (=> b!731607 m!685501))

(declare-fun m!685503 () Bool)

(assert (=> b!731616 m!685503))

(declare-fun m!685505 () Bool)

(assert (=> b!731619 m!685505))

(declare-fun m!685507 () Bool)

(assert (=> b!731619 m!685507))

(declare-fun m!685509 () Bool)

(assert (=> b!731617 m!685509))

(declare-fun m!685511 () Bool)

(assert (=> start!64872 m!685511))

(declare-fun m!685513 () Bool)

(assert (=> start!64872 m!685513))

(assert (=> b!731608 m!685471))

(assert (=> b!731608 m!685471))

(assert (=> b!731608 m!685479))

(check-sat (not b!731617) (not b!731613) (not b!731608) (not b!731619) (not b!731620) (not b!731610) (not b!731604) (not b!731609) (not b!731614) (not b!731607) (not b!731611) (not start!64872) (not b!731605) (not b!731621) (not b!731616) (not b!731615))
(check-sat)
