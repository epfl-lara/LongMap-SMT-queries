; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65748 () Bool)

(assert start!65748)

(declare-fun b!751582 () Bool)

(declare-datatypes ((Unit!25801 0))(
  ( (Unit!25802) )
))
(declare-fun e!419366 () Unit!25801)

(declare-fun Unit!25803 () Unit!25801)

(assert (=> b!751582 (= e!419366 Unit!25803)))

(assert (=> b!751582 false))

(declare-fun b!751583 () Bool)

(declare-fun res!507135 () Bool)

(declare-fun e!419370 () Bool)

(assert (=> b!751583 (=> res!507135 e!419370)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41791 0))(
  ( (array!41792 (arr!20005 (Array (_ BitVec 32) (_ BitVec 64))) (size!20425 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41791)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7561 0))(
  ( (MissingZero!7561 (index!32612 (_ BitVec 32))) (Found!7561 (index!32613 (_ BitVec 32))) (Intermediate!7561 (undefined!8373 Bool) (index!32614 (_ BitVec 32)) (x!63699 (_ BitVec 32))) (Undefined!7561) (MissingVacant!7561 (index!32615 (_ BitVec 32))) )
))
(declare-fun lt!334195 () SeekEntryResult!7561)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41791 (_ BitVec 32)) SeekEntryResult!7561)

(assert (=> b!751583 (= res!507135 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20005 a!3186) j!159) a!3186 mask!3328) lt!334195)))))

(declare-fun b!751584 () Bool)

(declare-fun res!507125 () Bool)

(declare-fun e!419371 () Bool)

(assert (=> b!751584 (=> (not res!507125) (not e!419371))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41791 (_ BitVec 32)) Bool)

(assert (=> b!751584 (= res!507125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!507139 () Bool)

(declare-fun e!419376 () Bool)

(assert (=> start!65748 (=> (not res!507139) (not e!419376))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65748 (= res!507139 (validMask!0 mask!3328))))

(assert (=> start!65748 e!419376))

(assert (=> start!65748 true))

(declare-fun array_inv!15864 (array!41791) Bool)

(assert (=> start!65748 (array_inv!15864 a!3186)))

(declare-fun b!751585 () Bool)

(declare-fun Unit!25804 () Unit!25801)

(assert (=> b!751585 (= e!419366 Unit!25804)))

(declare-fun b!751586 () Bool)

(declare-fun e!419368 () Bool)

(assert (=> b!751586 (= e!419370 e!419368)))

(declare-fun res!507132 () Bool)

(assert (=> b!751586 (=> res!507132 e!419368)))

(declare-fun lt!334197 () (_ BitVec 64))

(declare-fun lt!334203 () (_ BitVec 64))

(assert (=> b!751586 (= res!507132 (= lt!334197 lt!334203))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!751586 (= lt!334197 (select (store (arr!20005 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!751587 () Bool)

(declare-fun e!419375 () Bool)

(assert (=> b!751587 (= e!419371 e!419375)))

(declare-fun res!507140 () Bool)

(assert (=> b!751587 (=> (not res!507140) (not e!419375))))

(declare-fun lt!334198 () SeekEntryResult!7561)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41791 (_ BitVec 32)) SeekEntryResult!7561)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!751587 (= res!507140 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20005 a!3186) j!159) mask!3328) (select (arr!20005 a!3186) j!159) a!3186 mask!3328) lt!334198))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!751587 (= lt!334198 (Intermediate!7561 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun e!419372 () Bool)

(declare-fun b!751588 () Bool)

(assert (=> b!751588 (= e!419372 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20005 a!3186) j!159) a!3186 mask!3328) (Found!7561 j!159)))))

(declare-fun b!751589 () Bool)

(declare-fun e!419369 () Bool)

(assert (=> b!751589 (= e!419369 (not e!419370))))

(declare-fun res!507138 () Bool)

(assert (=> b!751589 (=> res!507138 e!419370)))

(declare-fun lt!334196 () SeekEntryResult!7561)

(get-info :version)

(assert (=> b!751589 (= res!507138 (or (not ((_ is Intermediate!7561) lt!334196)) (bvslt x!1131 (x!63699 lt!334196)) (not (= x!1131 (x!63699 lt!334196))) (not (= index!1321 (index!32614 lt!334196)))))))

(declare-fun e!419367 () Bool)

(assert (=> b!751589 e!419367))

(declare-fun res!507141 () Bool)

(assert (=> b!751589 (=> (not res!507141) (not e!419367))))

(declare-fun lt!334193 () SeekEntryResult!7561)

(assert (=> b!751589 (= res!507141 (= lt!334193 lt!334195))))

(assert (=> b!751589 (= lt!334195 (Found!7561 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41791 (_ BitVec 32)) SeekEntryResult!7561)

(assert (=> b!751589 (= lt!334193 (seekEntryOrOpen!0 (select (arr!20005 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!751589 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334201 () Unit!25801)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41791 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25801)

(assert (=> b!751589 (= lt!334201 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!751590 () Bool)

(assert (=> b!751590 (= e!419367 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20005 a!3186) j!159) a!3186 mask!3328) lt!334195))))

(declare-fun b!751591 () Bool)

(declare-fun res!507126 () Bool)

(assert (=> b!751591 (=> (not res!507126) (not e!419371))))

(assert (=> b!751591 (= res!507126 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20425 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20425 a!3186))))))

(declare-fun b!751592 () Bool)

(declare-fun res!507131 () Bool)

(assert (=> b!751592 (=> (not res!507131) (not e!419376))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!751592 (= res!507131 (validKeyInArray!0 k0!2102))))

(declare-fun b!751593 () Bool)

(declare-fun res!507134 () Bool)

(assert (=> b!751593 (=> (not res!507134) (not e!419376))))

(assert (=> b!751593 (= res!507134 (validKeyInArray!0 (select (arr!20005 a!3186) j!159)))))

(declare-fun b!751594 () Bool)

(declare-fun res!507127 () Bool)

(assert (=> b!751594 (=> (not res!507127) (not e!419375))))

(assert (=> b!751594 (= res!507127 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20005 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!751595 () Bool)

(assert (=> b!751595 (= e!419375 e!419369)))

(declare-fun res!507136 () Bool)

(assert (=> b!751595 (=> (not res!507136) (not e!419369))))

(declare-fun lt!334199 () SeekEntryResult!7561)

(assert (=> b!751595 (= res!507136 (= lt!334199 lt!334196))))

(declare-fun lt!334200 () array!41791)

(assert (=> b!751595 (= lt!334196 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334203 lt!334200 mask!3328))))

(assert (=> b!751595 (= lt!334199 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334203 mask!3328) lt!334203 lt!334200 mask!3328))))

(assert (=> b!751595 (= lt!334203 (select (store (arr!20005 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!751595 (= lt!334200 (array!41792 (store (arr!20005 a!3186) i!1173 k0!2102) (size!20425 a!3186)))))

(declare-fun b!751596 () Bool)

(declare-fun res!507133 () Bool)

(assert (=> b!751596 (=> (not res!507133) (not e!419376))))

(declare-fun arrayContainsKey!0 (array!41791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!751596 (= res!507133 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!751597 () Bool)

(declare-fun e!419374 () Bool)

(assert (=> b!751597 (= e!419374 (= (seekEntryOrOpen!0 lt!334203 lt!334200 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334203 lt!334200 mask!3328)))))

(declare-fun b!751598 () Bool)

(assert (=> b!751598 (= e!419368 true)))

(assert (=> b!751598 e!419374))

(declare-fun res!507142 () Bool)

(assert (=> b!751598 (=> (not res!507142) (not e!419374))))

(assert (=> b!751598 (= res!507142 (= lt!334197 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334202 () Unit!25801)

(assert (=> b!751598 (= lt!334202 e!419366)))

(declare-fun c!82612 () Bool)

(assert (=> b!751598 (= c!82612 (= lt!334197 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!751599 () Bool)

(declare-fun res!507130 () Bool)

(assert (=> b!751599 (=> (not res!507130) (not e!419376))))

(assert (=> b!751599 (= res!507130 (and (= (size!20425 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20425 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20425 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!751600 () Bool)

(declare-fun res!507137 () Bool)

(assert (=> b!751600 (=> (not res!507137) (not e!419375))))

(assert (=> b!751600 (= res!507137 e!419372)))

(declare-fun c!82613 () Bool)

(assert (=> b!751600 (= c!82613 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!751601 () Bool)

(declare-fun res!507128 () Bool)

(assert (=> b!751601 (=> (not res!507128) (not e!419371))))

(declare-datatypes ((List!13914 0))(
  ( (Nil!13911) (Cons!13910 (h!14988 (_ BitVec 64)) (t!20221 List!13914)) )
))
(declare-fun arrayNoDuplicates!0 (array!41791 (_ BitVec 32) List!13914) Bool)

(assert (=> b!751601 (= res!507128 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13911))))

(declare-fun b!751602 () Bool)

(assert (=> b!751602 (= e!419372 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20005 a!3186) j!159) a!3186 mask!3328) lt!334198))))

(declare-fun b!751603 () Bool)

(assert (=> b!751603 (= e!419376 e!419371)))

(declare-fun res!507129 () Bool)

(assert (=> b!751603 (=> (not res!507129) (not e!419371))))

(declare-fun lt!334194 () SeekEntryResult!7561)

(assert (=> b!751603 (= res!507129 (or (= lt!334194 (MissingZero!7561 i!1173)) (= lt!334194 (MissingVacant!7561 i!1173))))))

(assert (=> b!751603 (= lt!334194 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!65748 res!507139) b!751599))

(assert (= (and b!751599 res!507130) b!751593))

(assert (= (and b!751593 res!507134) b!751592))

(assert (= (and b!751592 res!507131) b!751596))

(assert (= (and b!751596 res!507133) b!751603))

(assert (= (and b!751603 res!507129) b!751584))

(assert (= (and b!751584 res!507125) b!751601))

(assert (= (and b!751601 res!507128) b!751591))

(assert (= (and b!751591 res!507126) b!751587))

(assert (= (and b!751587 res!507140) b!751594))

(assert (= (and b!751594 res!507127) b!751600))

(assert (= (and b!751600 c!82613) b!751602))

(assert (= (and b!751600 (not c!82613)) b!751588))

(assert (= (and b!751600 res!507137) b!751595))

(assert (= (and b!751595 res!507136) b!751589))

(assert (= (and b!751589 res!507141) b!751590))

(assert (= (and b!751589 (not res!507138)) b!751583))

(assert (= (and b!751583 (not res!507135)) b!751586))

(assert (= (and b!751586 (not res!507132)) b!751598))

(assert (= (and b!751598 c!82612) b!751582))

(assert (= (and b!751598 (not c!82612)) b!751585))

(assert (= (and b!751598 res!507142) b!751597))

(declare-fun m!701307 () Bool)

(assert (=> b!751601 m!701307))

(declare-fun m!701309 () Bool)

(assert (=> b!751588 m!701309))

(assert (=> b!751588 m!701309))

(declare-fun m!701311 () Bool)

(assert (=> b!751588 m!701311))

(declare-fun m!701313 () Bool)

(assert (=> b!751603 m!701313))

(declare-fun m!701315 () Bool)

(assert (=> b!751596 m!701315))

(assert (=> b!751593 m!701309))

(assert (=> b!751593 m!701309))

(declare-fun m!701317 () Bool)

(assert (=> b!751593 m!701317))

(declare-fun m!701319 () Bool)

(assert (=> b!751584 m!701319))

(assert (=> b!751583 m!701309))

(assert (=> b!751583 m!701309))

(assert (=> b!751583 m!701311))

(declare-fun m!701321 () Bool)

(assert (=> b!751594 m!701321))

(declare-fun m!701323 () Bool)

(assert (=> start!65748 m!701323))

(declare-fun m!701325 () Bool)

(assert (=> start!65748 m!701325))

(declare-fun m!701327 () Bool)

(assert (=> b!751586 m!701327))

(declare-fun m!701329 () Bool)

(assert (=> b!751586 m!701329))

(assert (=> b!751590 m!701309))

(assert (=> b!751590 m!701309))

(declare-fun m!701331 () Bool)

(assert (=> b!751590 m!701331))

(declare-fun m!701333 () Bool)

(assert (=> b!751592 m!701333))

(declare-fun m!701335 () Bool)

(assert (=> b!751597 m!701335))

(declare-fun m!701337 () Bool)

(assert (=> b!751597 m!701337))

(assert (=> b!751587 m!701309))

(assert (=> b!751587 m!701309))

(declare-fun m!701339 () Bool)

(assert (=> b!751587 m!701339))

(assert (=> b!751587 m!701339))

(assert (=> b!751587 m!701309))

(declare-fun m!701341 () Bool)

(assert (=> b!751587 m!701341))

(assert (=> b!751595 m!701327))

(declare-fun m!701343 () Bool)

(assert (=> b!751595 m!701343))

(declare-fun m!701345 () Bool)

(assert (=> b!751595 m!701345))

(assert (=> b!751595 m!701343))

(declare-fun m!701347 () Bool)

(assert (=> b!751595 m!701347))

(declare-fun m!701349 () Bool)

(assert (=> b!751595 m!701349))

(assert (=> b!751589 m!701309))

(assert (=> b!751589 m!701309))

(declare-fun m!701351 () Bool)

(assert (=> b!751589 m!701351))

(declare-fun m!701353 () Bool)

(assert (=> b!751589 m!701353))

(declare-fun m!701355 () Bool)

(assert (=> b!751589 m!701355))

(assert (=> b!751602 m!701309))

(assert (=> b!751602 m!701309))

(declare-fun m!701357 () Bool)

(assert (=> b!751602 m!701357))

(check-sat (not b!751603) (not b!751587) (not b!751601) (not b!751595) (not start!65748) (not b!751583) (not b!751602) (not b!751588) (not b!751590) (not b!751593) (not b!751597) (not b!751592) (not b!751589) (not b!751596) (not b!751584))
(check-sat)
