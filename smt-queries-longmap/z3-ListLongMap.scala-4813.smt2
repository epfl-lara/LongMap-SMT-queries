; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66198 () Bool)

(assert start!66198)

(declare-datatypes ((SeekEntryResult!7765 0))(
  ( (MissingZero!7765 (index!33428 (_ BitVec 32))) (Found!7765 (index!33429 (_ BitVec 32))) (Intermediate!7765 (undefined!8577 Bool) (index!33430 (_ BitVec 32)) (x!64348 (_ BitVec 32))) (Undefined!7765) (MissingVacant!7765 (index!33431 (_ BitVec 32))) )
))
(declare-fun lt!339354 () SeekEntryResult!7765)

(declare-datatypes ((array!42120 0))(
  ( (array!42121 (arr!20168 (Array (_ BitVec 32) (_ BitVec 64))) (size!20589 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42120)

(declare-fun b!762292 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!424877 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42120 (_ BitVec 32)) SeekEntryResult!7765)

(assert (=> b!762292 (= e!424877 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20168 a!3186) j!159) a!3186 mask!3328) lt!339354)))))

(declare-fun b!762293 () Bool)

(declare-fun res!515539 () Bool)

(declare-fun e!424878 () Bool)

(assert (=> b!762293 (=> (not res!515539) (not e!424878))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762293 (= res!515539 (validKeyInArray!0 (select (arr!20168 a!3186) j!159)))))

(declare-fun b!762294 () Bool)

(declare-fun e!424879 () Bool)

(assert (=> b!762294 (= e!424879 false)))

(declare-fun lt!339355 () Bool)

(assert (=> b!762294 (= lt!339355 e!424877)))

(declare-fun c!83763 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762294 (= c!83763 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!762295 () Bool)

(declare-fun res!515549 () Bool)

(declare-fun e!424880 () Bool)

(assert (=> b!762295 (=> (not res!515549) (not e!424880))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!762295 (= res!515549 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20589 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20589 a!3186))))))

(declare-fun b!762297 () Bool)

(assert (=> b!762297 (= e!424880 e!424879)))

(declare-fun res!515540 () Bool)

(assert (=> b!762297 (=> (not res!515540) (not e!424879))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762297 (= res!515540 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20168 a!3186) j!159) mask!3328) (select (arr!20168 a!3186) j!159) a!3186 mask!3328) lt!339354))))

(assert (=> b!762297 (= lt!339354 (Intermediate!7765 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!762298 () Bool)

(declare-fun res!515548 () Bool)

(assert (=> b!762298 (=> (not res!515548) (not e!424878))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!762298 (= res!515548 (validKeyInArray!0 k0!2102))))

(declare-fun b!762299 () Bool)

(assert (=> b!762299 (= e!424878 e!424880)))

(declare-fun res!515545 () Bool)

(assert (=> b!762299 (=> (not res!515545) (not e!424880))))

(declare-fun lt!339356 () SeekEntryResult!7765)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!762299 (= res!515545 (or (= lt!339356 (MissingZero!7765 i!1173)) (= lt!339356 (MissingVacant!7765 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42120 (_ BitVec 32)) SeekEntryResult!7765)

(assert (=> b!762299 (= lt!339356 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!762300 () Bool)

(declare-fun res!515543 () Bool)

(assert (=> b!762300 (=> (not res!515543) (not e!424880))))

(declare-datatypes ((List!14209 0))(
  ( (Nil!14206) (Cons!14205 (h!15289 (_ BitVec 64)) (t!20515 List!14209)) )
))
(declare-fun arrayNoDuplicates!0 (array!42120 (_ BitVec 32) List!14209) Bool)

(assert (=> b!762300 (= res!515543 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14206))))

(declare-fun b!762301 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42120 (_ BitVec 32)) SeekEntryResult!7765)

(assert (=> b!762301 (= e!424877 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20168 a!3186) j!159) a!3186 mask!3328) (Found!7765 j!159))))))

(declare-fun b!762302 () Bool)

(declare-fun res!515542 () Bool)

(assert (=> b!762302 (=> (not res!515542) (not e!424880))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42120 (_ BitVec 32)) Bool)

(assert (=> b!762302 (= res!515542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!515546 () Bool)

(assert (=> start!66198 (=> (not res!515546) (not e!424878))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66198 (= res!515546 (validMask!0 mask!3328))))

(assert (=> start!66198 e!424878))

(assert (=> start!66198 true))

(declare-fun array_inv!16051 (array!42120) Bool)

(assert (=> start!66198 (array_inv!16051 a!3186)))

(declare-fun b!762296 () Bool)

(declare-fun res!515547 () Bool)

(assert (=> b!762296 (=> (not res!515547) (not e!424878))))

(assert (=> b!762296 (= res!515547 (and (= (size!20589 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20589 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20589 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!762303 () Bool)

(declare-fun res!515544 () Bool)

(assert (=> b!762303 (=> (not res!515544) (not e!424878))))

(declare-fun arrayContainsKey!0 (array!42120 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762303 (= res!515544 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!762304 () Bool)

(declare-fun res!515541 () Bool)

(assert (=> b!762304 (=> (not res!515541) (not e!424879))))

(assert (=> b!762304 (= res!515541 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20168 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!66198 res!515546) b!762296))

(assert (= (and b!762296 res!515547) b!762293))

(assert (= (and b!762293 res!515539) b!762298))

(assert (= (and b!762298 res!515548) b!762303))

(assert (= (and b!762303 res!515544) b!762299))

(assert (= (and b!762299 res!515545) b!762302))

(assert (= (and b!762302 res!515542) b!762300))

(assert (= (and b!762300 res!515543) b!762295))

(assert (= (and b!762295 res!515549) b!762297))

(assert (= (and b!762297 res!515540) b!762304))

(assert (= (and b!762304 res!515541) b!762294))

(assert (= (and b!762294 c!83763) b!762292))

(assert (= (and b!762294 (not c!83763)) b!762301))

(declare-fun m!708505 () Bool)

(assert (=> b!762300 m!708505))

(declare-fun m!708507 () Bool)

(assert (=> b!762304 m!708507))

(declare-fun m!708509 () Bool)

(assert (=> b!762298 m!708509))

(declare-fun m!708511 () Bool)

(assert (=> b!762303 m!708511))

(declare-fun m!708513 () Bool)

(assert (=> b!762301 m!708513))

(assert (=> b!762301 m!708513))

(declare-fun m!708515 () Bool)

(assert (=> b!762301 m!708515))

(assert (=> b!762297 m!708513))

(assert (=> b!762297 m!708513))

(declare-fun m!708517 () Bool)

(assert (=> b!762297 m!708517))

(assert (=> b!762297 m!708517))

(assert (=> b!762297 m!708513))

(declare-fun m!708519 () Bool)

(assert (=> b!762297 m!708519))

(declare-fun m!708521 () Bool)

(assert (=> start!66198 m!708521))

(declare-fun m!708523 () Bool)

(assert (=> start!66198 m!708523))

(declare-fun m!708525 () Bool)

(assert (=> b!762302 m!708525))

(assert (=> b!762293 m!708513))

(assert (=> b!762293 m!708513))

(declare-fun m!708527 () Bool)

(assert (=> b!762293 m!708527))

(assert (=> b!762292 m!708513))

(assert (=> b!762292 m!708513))

(declare-fun m!708529 () Bool)

(assert (=> b!762292 m!708529))

(declare-fun m!708531 () Bool)

(assert (=> b!762299 m!708531))

(check-sat (not b!762293) (not start!66198) (not b!762292) (not b!762302) (not b!762299) (not b!762297) (not b!762303) (not b!762300) (not b!762301) (not b!762298))
(check-sat)
