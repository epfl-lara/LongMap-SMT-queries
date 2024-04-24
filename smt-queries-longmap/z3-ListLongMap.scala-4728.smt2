; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65556 () Bool)

(assert start!65556)

(declare-fun b!745751 () Bool)

(declare-fun res!502236 () Bool)

(declare-fun e!416611 () Bool)

(assert (=> b!745751 (=> (not res!502236) (not e!416611))))

(declare-fun e!416615 () Bool)

(assert (=> b!745751 (= res!502236 e!416615)))

(declare-fun c!82142 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!745751 (= c!82142 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!745752 () Bool)

(declare-fun res!502238 () Bool)

(declare-fun e!416609 () Bool)

(assert (=> b!745752 (=> (not res!502238) (not e!416609))))

(declare-datatypes ((array!41599 0))(
  ( (array!41600 (arr!19909 (Array (_ BitVec 32) (_ BitVec 64))) (size!20329 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41599)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!745752 (= res!502238 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20329 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20329 a!3186))))))

(declare-fun b!745753 () Bool)

(declare-fun res!502239 () Bool)

(declare-fun e!416612 () Bool)

(assert (=> b!745753 (=> (not res!502239) (not e!416612))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!745753 (= res!502239 (validKeyInArray!0 (select (arr!19909 a!3186) j!159)))))

(declare-fun res!502235 () Bool)

(assert (=> start!65556 (=> (not res!502235) (not e!416612))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65556 (= res!502235 (validMask!0 mask!3328))))

(assert (=> start!65556 e!416612))

(assert (=> start!65556 true))

(declare-fun array_inv!15768 (array!41599) Bool)

(assert (=> start!65556 (array_inv!15768 a!3186)))

(declare-fun b!745754 () Bool)

(declare-fun e!416613 () Bool)

(declare-fun e!416610 () Bool)

(assert (=> b!745754 (= e!416613 e!416610)))

(declare-fun res!502245 () Bool)

(assert (=> b!745754 (=> (not res!502245) (not e!416610))))

(declare-datatypes ((SeekEntryResult!7465 0))(
  ( (MissingZero!7465 (index!32228 (_ BitVec 32))) (Found!7465 (index!32229 (_ BitVec 32))) (Intermediate!7465 (undefined!8277 Bool) (index!32230 (_ BitVec 32)) (x!63347 (_ BitVec 32))) (Undefined!7465) (MissingVacant!7465 (index!32231 (_ BitVec 32))) )
))
(declare-fun lt!331283 () SeekEntryResult!7465)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41599 (_ BitVec 32)) SeekEntryResult!7465)

(assert (=> b!745754 (= res!502245 (= (seekEntryOrOpen!0 (select (arr!19909 a!3186) j!159) a!3186 mask!3328) lt!331283))))

(assert (=> b!745754 (= lt!331283 (Found!7465 j!159))))

(declare-fun b!745755 () Bool)

(assert (=> b!745755 (= e!416612 e!416609)))

(declare-fun res!502249 () Bool)

(assert (=> b!745755 (=> (not res!502249) (not e!416609))))

(declare-fun lt!331286 () SeekEntryResult!7465)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!745755 (= res!502249 (or (= lt!331286 (MissingZero!7465 i!1173)) (= lt!331286 (MissingVacant!7465 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!745755 (= lt!331286 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!745756 () Bool)

(declare-fun e!416608 () Bool)

(assert (=> b!745756 (= e!416611 e!416608)))

(declare-fun res!502242 () Bool)

(assert (=> b!745756 (=> (not res!502242) (not e!416608))))

(declare-fun lt!331285 () SeekEntryResult!7465)

(declare-fun lt!331284 () SeekEntryResult!7465)

(assert (=> b!745756 (= res!502242 (= lt!331285 lt!331284))))

(declare-fun lt!331282 () (_ BitVec 64))

(declare-fun lt!331289 () array!41599)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41599 (_ BitVec 32)) SeekEntryResult!7465)

(assert (=> b!745756 (= lt!331284 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331282 lt!331289 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!745756 (= lt!331285 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331282 mask!3328) lt!331282 lt!331289 mask!3328))))

(assert (=> b!745756 (= lt!331282 (select (store (arr!19909 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!745756 (= lt!331289 (array!41600 (store (arr!19909 a!3186) i!1173 k0!2102) (size!20329 a!3186)))))

(declare-fun b!745757 () Bool)

(declare-fun res!502237 () Bool)

(assert (=> b!745757 (=> (not res!502237) (not e!416611))))

(assert (=> b!745757 (= res!502237 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19909 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!745758 () Bool)

(declare-fun res!502243 () Bool)

(assert (=> b!745758 (=> (not res!502243) (not e!416612))))

(declare-fun arrayContainsKey!0 (array!41599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!745758 (= res!502243 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!745759 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41599 (_ BitVec 32)) SeekEntryResult!7465)

(assert (=> b!745759 (= e!416610 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19909 a!3186) j!159) a!3186 mask!3328) lt!331283))))

(declare-fun b!745760 () Bool)

(declare-fun e!416614 () Bool)

(assert (=> b!745760 (= e!416608 (not e!416614))))

(declare-fun res!502246 () Bool)

(assert (=> b!745760 (=> res!502246 e!416614)))

(get-info :version)

(assert (=> b!745760 (= res!502246 (or (not ((_ is Intermediate!7465) lt!331284)) (bvslt x!1131 (x!63347 lt!331284)) (not (= x!1131 (x!63347 lt!331284))) (not (= index!1321 (index!32230 lt!331284)))))))

(assert (=> b!745760 e!416613))

(declare-fun res!502248 () Bool)

(assert (=> b!745760 (=> (not res!502248) (not e!416613))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41599 (_ BitVec 32)) Bool)

(assert (=> b!745760 (= res!502248 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25489 0))(
  ( (Unit!25490) )
))
(declare-fun lt!331288 () Unit!25489)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41599 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25489)

(assert (=> b!745760 (= lt!331288 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!745761 () Bool)

(declare-fun res!502247 () Bool)

(assert (=> b!745761 (=> (not res!502247) (not e!416612))))

(assert (=> b!745761 (= res!502247 (validKeyInArray!0 k0!2102))))

(declare-fun b!745762 () Bool)

(declare-fun res!502234 () Bool)

(assert (=> b!745762 (=> (not res!502234) (not e!416609))))

(declare-datatypes ((List!13818 0))(
  ( (Nil!13815) (Cons!13814 (h!14892 (_ BitVec 64)) (t!20125 List!13818)) )
))
(declare-fun arrayNoDuplicates!0 (array!41599 (_ BitVec 32) List!13818) Bool)

(assert (=> b!745762 (= res!502234 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13815))))

(declare-fun b!745763 () Bool)

(declare-fun res!502244 () Bool)

(assert (=> b!745763 (=> (not res!502244) (not e!416609))))

(assert (=> b!745763 (= res!502244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!745764 () Bool)

(assert (=> b!745764 (= e!416609 e!416611)))

(declare-fun res!502241 () Bool)

(assert (=> b!745764 (=> (not res!502241) (not e!416611))))

(declare-fun lt!331287 () SeekEntryResult!7465)

(assert (=> b!745764 (= res!502241 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19909 a!3186) j!159) mask!3328) (select (arr!19909 a!3186) j!159) a!3186 mask!3328) lt!331287))))

(assert (=> b!745764 (= lt!331287 (Intermediate!7465 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!745765 () Bool)

(assert (=> b!745765 (= e!416615 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19909 a!3186) j!159) a!3186 mask!3328) (Found!7465 j!159)))))

(declare-fun b!745766 () Bool)

(declare-fun res!502240 () Bool)

(assert (=> b!745766 (=> (not res!502240) (not e!416612))))

(assert (=> b!745766 (= res!502240 (and (= (size!20329 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20329 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20329 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!745767 () Bool)

(assert (=> b!745767 (= e!416615 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19909 a!3186) j!159) a!3186 mask!3328) lt!331287))))

(declare-fun b!745768 () Bool)

(assert (=> b!745768 (= e!416614 true)))

(declare-fun lt!331290 () SeekEntryResult!7465)

(assert (=> b!745768 (= lt!331290 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19909 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!65556 res!502235) b!745766))

(assert (= (and b!745766 res!502240) b!745753))

(assert (= (and b!745753 res!502239) b!745761))

(assert (= (and b!745761 res!502247) b!745758))

(assert (= (and b!745758 res!502243) b!745755))

(assert (= (and b!745755 res!502249) b!745763))

(assert (= (and b!745763 res!502244) b!745762))

(assert (= (and b!745762 res!502234) b!745752))

(assert (= (and b!745752 res!502238) b!745764))

(assert (= (and b!745764 res!502241) b!745757))

(assert (= (and b!745757 res!502237) b!745751))

(assert (= (and b!745751 c!82142) b!745767))

(assert (= (and b!745751 (not c!82142)) b!745765))

(assert (= (and b!745751 res!502236) b!745756))

(assert (= (and b!745756 res!502242) b!745760))

(assert (= (and b!745760 res!502248) b!745754))

(assert (= (and b!745754 res!502245) b!745759))

(assert (= (and b!745760 (not res!502246)) b!745768))

(declare-fun m!696609 () Bool)

(assert (=> b!745756 m!696609))

(declare-fun m!696611 () Bool)

(assert (=> b!745756 m!696611))

(declare-fun m!696613 () Bool)

(assert (=> b!745756 m!696613))

(declare-fun m!696615 () Bool)

(assert (=> b!745756 m!696615))

(assert (=> b!745756 m!696609))

(declare-fun m!696617 () Bool)

(assert (=> b!745756 m!696617))

(declare-fun m!696619 () Bool)

(assert (=> b!745761 m!696619))

(declare-fun m!696621 () Bool)

(assert (=> b!745753 m!696621))

(assert (=> b!745753 m!696621))

(declare-fun m!696623 () Bool)

(assert (=> b!745753 m!696623))

(assert (=> b!745765 m!696621))

(assert (=> b!745765 m!696621))

(declare-fun m!696625 () Bool)

(assert (=> b!745765 m!696625))

(assert (=> b!745754 m!696621))

(assert (=> b!745754 m!696621))

(declare-fun m!696627 () Bool)

(assert (=> b!745754 m!696627))

(declare-fun m!696629 () Bool)

(assert (=> b!745760 m!696629))

(declare-fun m!696631 () Bool)

(assert (=> b!745760 m!696631))

(declare-fun m!696633 () Bool)

(assert (=> b!745762 m!696633))

(declare-fun m!696635 () Bool)

(assert (=> b!745758 m!696635))

(declare-fun m!696637 () Bool)

(assert (=> b!745755 m!696637))

(assert (=> b!745759 m!696621))

(assert (=> b!745759 m!696621))

(declare-fun m!696639 () Bool)

(assert (=> b!745759 m!696639))

(declare-fun m!696641 () Bool)

(assert (=> start!65556 m!696641))

(declare-fun m!696643 () Bool)

(assert (=> start!65556 m!696643))

(declare-fun m!696645 () Bool)

(assert (=> b!745757 m!696645))

(assert (=> b!745767 m!696621))

(assert (=> b!745767 m!696621))

(declare-fun m!696647 () Bool)

(assert (=> b!745767 m!696647))

(declare-fun m!696649 () Bool)

(assert (=> b!745763 m!696649))

(assert (=> b!745768 m!696621))

(assert (=> b!745768 m!696621))

(assert (=> b!745768 m!696625))

(assert (=> b!745764 m!696621))

(assert (=> b!745764 m!696621))

(declare-fun m!696651 () Bool)

(assert (=> b!745764 m!696651))

(assert (=> b!745764 m!696651))

(assert (=> b!745764 m!696621))

(declare-fun m!696653 () Bool)

(assert (=> b!745764 m!696653))

(check-sat (not b!745755) (not b!745763) (not b!745761) (not b!745759) (not b!745767) (not start!65556) (not b!745760) (not b!745753) (not b!745765) (not b!745764) (not b!745756) (not b!745768) (not b!745754) (not b!745762) (not b!745758))
(check-sat)
