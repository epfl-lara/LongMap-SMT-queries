; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65352 () Bool)

(assert start!65352)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41395 0))(
  ( (array!41396 (arr!19807 (Array (_ BitVec 32) (_ BitVec 64))) (size!20227 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41395)

(declare-datatypes ((SeekEntryResult!7363 0))(
  ( (MissingZero!7363 (index!31820 (_ BitVec 32))) (Found!7363 (index!31821 (_ BitVec 32))) (Intermediate!7363 (undefined!8175 Bool) (index!31822 (_ BitVec 32)) (x!62973 (_ BitVec 32))) (Undefined!7363) (MissingVacant!7363 (index!31823 (_ BitVec 32))) )
))
(declare-fun lt!328315 () SeekEntryResult!7363)

(declare-fun e!413660 () Bool)

(declare-fun lt!328323 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!739589 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41395 (_ BitVec 32)) SeekEntryResult!7363)

(assert (=> b!739589 (= e!413660 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328323 resIntermediateIndex!5 (select (arr!19807 a!3186) j!159) a!3186 mask!3328) lt!328315)))))

(declare-fun b!739590 () Bool)

(declare-fun e!413656 () Bool)

(declare-fun e!413664 () Bool)

(assert (=> b!739590 (= e!413656 e!413664)))

(declare-fun res!497049 () Bool)

(assert (=> b!739590 (=> (not res!497049) (not e!413664))))

(declare-fun lt!328316 () SeekEntryResult!7363)

(declare-fun lt!328313 () SeekEntryResult!7363)

(assert (=> b!739590 (= res!497049 (= lt!328316 lt!328313))))

(declare-fun lt!328314 () (_ BitVec 64))

(declare-fun lt!328320 () array!41395)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41395 (_ BitVec 32)) SeekEntryResult!7363)

(assert (=> b!739590 (= lt!328313 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328314 lt!328320 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739590 (= lt!328316 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328314 mask!3328) lt!328314 lt!328320 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!739590 (= lt!328314 (select (store (arr!19807 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!739590 (= lt!328320 (array!41396 (store (arr!19807 a!3186) i!1173 k0!2102) (size!20227 a!3186)))))

(declare-fun b!739591 () Bool)

(declare-fun lt!328324 () SeekEntryResult!7363)

(declare-fun e!413654 () Bool)

(assert (=> b!739591 (= e!413654 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19807 a!3186) j!159) a!3186 mask!3328) lt!328324))))

(declare-fun b!739592 () Bool)

(declare-fun e!413655 () Bool)

(assert (=> b!739592 (= e!413664 (not e!413655))))

(declare-fun res!497041 () Bool)

(assert (=> b!739592 (=> res!497041 e!413655)))

(get-info :version)

(assert (=> b!739592 (= res!497041 (or (not ((_ is Intermediate!7363) lt!328313)) (bvsge x!1131 (x!62973 lt!328313))))))

(assert (=> b!739592 (= lt!328315 (Found!7363 j!159))))

(declare-fun e!413653 () Bool)

(assert (=> b!739592 e!413653))

(declare-fun res!497046 () Bool)

(assert (=> b!739592 (=> (not res!497046) (not e!413653))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41395 (_ BitVec 32)) Bool)

(assert (=> b!739592 (= res!497046 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25225 0))(
  ( (Unit!25226) )
))
(declare-fun lt!328319 () Unit!25225)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41395 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25225)

(assert (=> b!739592 (= lt!328319 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!739593 () Bool)

(assert (=> b!739593 (= e!413654 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19807 a!3186) j!159) a!3186 mask!3328) (Found!7363 j!159)))))

(declare-fun res!497048 () Bool)

(declare-fun e!413661 () Bool)

(assert (=> start!65352 (=> (not res!497048) (not e!413661))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65352 (= res!497048 (validMask!0 mask!3328))))

(assert (=> start!65352 e!413661))

(assert (=> start!65352 true))

(declare-fun array_inv!15666 (array!41395) Bool)

(assert (=> start!65352 (array_inv!15666 a!3186)))

(declare-fun b!739594 () Bool)

(assert (=> b!739594 (= e!413660 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328323 (select (arr!19807 a!3186) j!159) a!3186 mask!3328) lt!328324)))))

(declare-fun b!739595 () Bool)

(declare-fun res!497052 () Bool)

(assert (=> b!739595 (=> (not res!497052) (not e!413661))))

(assert (=> b!739595 (= res!497052 (and (= (size!20227 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20227 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20227 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!739596 () Bool)

(declare-fun res!497043 () Bool)

(assert (=> b!739596 (=> (not res!497043) (not e!413661))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!739596 (= res!497043 (validKeyInArray!0 (select (arr!19807 a!3186) j!159)))))

(declare-fun b!739597 () Bool)

(declare-fun e!413657 () Bool)

(assert (=> b!739597 (= e!413657 e!413656)))

(declare-fun res!497039 () Bool)

(assert (=> b!739597 (=> (not res!497039) (not e!413656))))

(assert (=> b!739597 (= res!497039 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19807 a!3186) j!159) mask!3328) (select (arr!19807 a!3186) j!159) a!3186 mask!3328) lt!328324))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!739597 (= lt!328324 (Intermediate!7363 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!739598 () Bool)

(declare-fun res!497044 () Bool)

(assert (=> b!739598 (=> (not res!497044) (not e!413657))))

(declare-datatypes ((List!13716 0))(
  ( (Nil!13713) (Cons!13712 (h!14790 (_ BitVec 64)) (t!20023 List!13716)) )
))
(declare-fun arrayNoDuplicates!0 (array!41395 (_ BitVec 32) List!13716) Bool)

(assert (=> b!739598 (= res!497044 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13713))))

(declare-fun b!739599 () Bool)

(declare-fun res!497042 () Bool)

(assert (=> b!739599 (=> (not res!497042) (not e!413656))))

(assert (=> b!739599 (= res!497042 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19807 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!413662 () Bool)

(declare-fun b!739600 () Bool)

(declare-fun lt!328326 () SeekEntryResult!7363)

(assert (=> b!739600 (= e!413662 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19807 a!3186) j!159) a!3186 mask!3328) lt!328326))))

(declare-fun b!739601 () Bool)

(declare-fun res!497050 () Bool)

(assert (=> b!739601 (=> (not res!497050) (not e!413657))))

(assert (=> b!739601 (= res!497050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!739602 () Bool)

(declare-fun e!413658 () Bool)

(assert (=> b!739602 (= e!413655 e!413658)))

(declare-fun res!497040 () Bool)

(assert (=> b!739602 (=> res!497040 e!413658)))

(assert (=> b!739602 (= res!497040 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328323 #b00000000000000000000000000000000) (bvsge lt!328323 (size!20227 a!3186))))))

(declare-fun lt!328322 () Unit!25225)

(declare-fun e!413659 () Unit!25225)

(assert (=> b!739602 (= lt!328322 e!413659)))

(declare-fun c!81660 () Bool)

(declare-fun lt!328325 () Bool)

(assert (=> b!739602 (= c!81660 lt!328325)))

(assert (=> b!739602 (= lt!328325 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739602 (= lt!328323 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!739603 () Bool)

(declare-fun Unit!25227 () Unit!25225)

(assert (=> b!739603 (= e!413659 Unit!25227)))

(assert (=> b!739603 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328323 (select (arr!19807 a!3186) j!159) a!3186 mask!3328) lt!328324)))

(declare-fun b!739604 () Bool)

(declare-fun Unit!25228 () Unit!25225)

(assert (=> b!739604 (= e!413659 Unit!25228)))

(declare-fun lt!328318 () SeekEntryResult!7363)

(assert (=> b!739604 (= lt!328318 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19807 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!739604 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328323 resIntermediateIndex!5 (select (arr!19807 a!3186) j!159) a!3186 mask!3328) lt!328315)))

(declare-fun b!739605 () Bool)

(declare-fun res!497053 () Bool)

(assert (=> b!739605 (=> (not res!497053) (not e!413656))))

(assert (=> b!739605 (= res!497053 e!413654)))

(declare-fun c!81662 () Bool)

(assert (=> b!739605 (= c!81662 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!739606 () Bool)

(declare-fun res!497045 () Bool)

(assert (=> b!739606 (=> res!497045 e!413658)))

(assert (=> b!739606 (= res!497045 e!413660)))

(declare-fun c!81661 () Bool)

(assert (=> b!739606 (= c!81661 lt!328325)))

(declare-fun b!739607 () Bool)

(declare-fun res!497038 () Bool)

(assert (=> b!739607 (=> (not res!497038) (not e!413657))))

(assert (=> b!739607 (= res!497038 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20227 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20227 a!3186))))))

(declare-fun b!739608 () Bool)

(declare-fun res!497036 () Bool)

(assert (=> b!739608 (=> (not res!497036) (not e!413661))))

(declare-fun arrayContainsKey!0 (array!41395 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!739608 (= res!497036 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!739609 () Bool)

(declare-fun res!497037 () Bool)

(assert (=> b!739609 (=> (not res!497037) (not e!413661))))

(assert (=> b!739609 (= res!497037 (validKeyInArray!0 k0!2102))))

(declare-fun b!739610 () Bool)

(assert (=> b!739610 (= e!413653 e!413662)))

(declare-fun res!497051 () Bool)

(assert (=> b!739610 (=> (not res!497051) (not e!413662))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41395 (_ BitVec 32)) SeekEntryResult!7363)

(assert (=> b!739610 (= res!497051 (= (seekEntryOrOpen!0 (select (arr!19807 a!3186) j!159) a!3186 mask!3328) lt!328326))))

(assert (=> b!739610 (= lt!328326 (Found!7363 j!159))))

(declare-fun b!739611 () Bool)

(assert (=> b!739611 (= e!413661 e!413657)))

(declare-fun res!497047 () Bool)

(assert (=> b!739611 (=> (not res!497047) (not e!413657))))

(declare-fun lt!328317 () SeekEntryResult!7363)

(assert (=> b!739611 (= res!497047 (or (= lt!328317 (MissingZero!7363 i!1173)) (= lt!328317 (MissingVacant!7363 i!1173))))))

(assert (=> b!739611 (= lt!328317 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!739612 () Bool)

(assert (=> b!739612 (= e!413658 true)))

(declare-fun lt!328321 () SeekEntryResult!7363)

(assert (=> b!739612 (= lt!328321 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328323 lt!328314 lt!328320 mask!3328))))

(assert (= (and start!65352 res!497048) b!739595))

(assert (= (and b!739595 res!497052) b!739596))

(assert (= (and b!739596 res!497043) b!739609))

(assert (= (and b!739609 res!497037) b!739608))

(assert (= (and b!739608 res!497036) b!739611))

(assert (= (and b!739611 res!497047) b!739601))

(assert (= (and b!739601 res!497050) b!739598))

(assert (= (and b!739598 res!497044) b!739607))

(assert (= (and b!739607 res!497038) b!739597))

(assert (= (and b!739597 res!497039) b!739599))

(assert (= (and b!739599 res!497042) b!739605))

(assert (= (and b!739605 c!81662) b!739591))

(assert (= (and b!739605 (not c!81662)) b!739593))

(assert (= (and b!739605 res!497053) b!739590))

(assert (= (and b!739590 res!497049) b!739592))

(assert (= (and b!739592 res!497046) b!739610))

(assert (= (and b!739610 res!497051) b!739600))

(assert (= (and b!739592 (not res!497041)) b!739602))

(assert (= (and b!739602 c!81660) b!739603))

(assert (= (and b!739602 (not c!81660)) b!739604))

(assert (= (and b!739602 (not res!497040)) b!739606))

(assert (= (and b!739606 c!81661) b!739594))

(assert (= (and b!739606 (not c!81661)) b!739589))

(assert (= (and b!739606 (not res!497045)) b!739612))

(declare-fun m!691533 () Bool)

(assert (=> b!739596 m!691533))

(assert (=> b!739596 m!691533))

(declare-fun m!691535 () Bool)

(assert (=> b!739596 m!691535))

(assert (=> b!739597 m!691533))

(assert (=> b!739597 m!691533))

(declare-fun m!691537 () Bool)

(assert (=> b!739597 m!691537))

(assert (=> b!739597 m!691537))

(assert (=> b!739597 m!691533))

(declare-fun m!691539 () Bool)

(assert (=> b!739597 m!691539))

(declare-fun m!691541 () Bool)

(assert (=> b!739592 m!691541))

(declare-fun m!691543 () Bool)

(assert (=> b!739592 m!691543))

(assert (=> b!739593 m!691533))

(assert (=> b!739593 m!691533))

(declare-fun m!691545 () Bool)

(assert (=> b!739593 m!691545))

(declare-fun m!691547 () Bool)

(assert (=> b!739608 m!691547))

(declare-fun m!691549 () Bool)

(assert (=> b!739611 m!691549))

(declare-fun m!691551 () Bool)

(assert (=> b!739598 m!691551))

(assert (=> b!739603 m!691533))

(assert (=> b!739603 m!691533))

(declare-fun m!691553 () Bool)

(assert (=> b!739603 m!691553))

(assert (=> b!739600 m!691533))

(assert (=> b!739600 m!691533))

(declare-fun m!691555 () Bool)

(assert (=> b!739600 m!691555))

(declare-fun m!691557 () Bool)

(assert (=> b!739612 m!691557))

(assert (=> b!739610 m!691533))

(assert (=> b!739610 m!691533))

(declare-fun m!691559 () Bool)

(assert (=> b!739610 m!691559))

(declare-fun m!691561 () Bool)

(assert (=> start!65352 m!691561))

(declare-fun m!691563 () Bool)

(assert (=> start!65352 m!691563))

(assert (=> b!739591 m!691533))

(assert (=> b!739591 m!691533))

(declare-fun m!691565 () Bool)

(assert (=> b!739591 m!691565))

(declare-fun m!691567 () Bool)

(assert (=> b!739599 m!691567))

(assert (=> b!739589 m!691533))

(assert (=> b!739589 m!691533))

(declare-fun m!691569 () Bool)

(assert (=> b!739589 m!691569))

(assert (=> b!739604 m!691533))

(assert (=> b!739604 m!691533))

(assert (=> b!739604 m!691545))

(assert (=> b!739604 m!691533))

(assert (=> b!739604 m!691569))

(declare-fun m!691571 () Bool)

(assert (=> b!739590 m!691571))

(declare-fun m!691573 () Bool)

(assert (=> b!739590 m!691573))

(declare-fun m!691575 () Bool)

(assert (=> b!739590 m!691575))

(assert (=> b!739590 m!691571))

(declare-fun m!691577 () Bool)

(assert (=> b!739590 m!691577))

(declare-fun m!691579 () Bool)

(assert (=> b!739590 m!691579))

(declare-fun m!691581 () Bool)

(assert (=> b!739601 m!691581))

(declare-fun m!691583 () Bool)

(assert (=> b!739602 m!691583))

(assert (=> b!739594 m!691533))

(assert (=> b!739594 m!691533))

(assert (=> b!739594 m!691553))

(declare-fun m!691585 () Bool)

(assert (=> b!739609 m!691585))

(check-sat (not b!739590) (not b!739592) (not b!739612) (not b!739602) (not b!739600) (not b!739596) (not b!739611) (not b!739601) (not b!739597) (not b!739608) (not b!739603) (not b!739589) (not b!739594) (not b!739604) (not b!739609) (not start!65352) (not b!739593) (not b!739598) (not b!739610) (not b!739591))
(check-sat)
