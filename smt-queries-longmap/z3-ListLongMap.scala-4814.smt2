; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66204 () Bool)

(assert start!66204)

(declare-fun b!762409 () Bool)

(declare-fun res!515646 () Bool)

(declare-fun e!424921 () Bool)

(assert (=> b!762409 (=> (not res!515646) (not e!424921))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762409 (= res!515646 (validKeyInArray!0 k0!2102))))

(declare-fun b!762410 () Bool)

(declare-fun res!515638 () Bool)

(declare-fun e!424925 () Bool)

(assert (=> b!762410 (=> (not res!515638) (not e!424925))))

(declare-datatypes ((array!42126 0))(
  ( (array!42127 (arr!20171 (Array (_ BitVec 32) (_ BitVec 64))) (size!20592 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42126)

(declare-datatypes ((List!14212 0))(
  ( (Nil!14209) (Cons!14208 (h!15292 (_ BitVec 64)) (t!20518 List!14212)) )
))
(declare-fun arrayNoDuplicates!0 (array!42126 (_ BitVec 32) List!14212) Bool)

(assert (=> b!762410 (= res!515638 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14209))))

(declare-datatypes ((SeekEntryResult!7768 0))(
  ( (MissingZero!7768 (index!33440 (_ BitVec 32))) (Found!7768 (index!33441 (_ BitVec 32))) (Intermediate!7768 (undefined!8580 Bool) (index!33442 (_ BitVec 32)) (x!64359 (_ BitVec 32))) (Undefined!7768) (MissingVacant!7768 (index!33443 (_ BitVec 32))) )
))
(declare-fun lt!339382 () SeekEntryResult!7768)

(declare-fun b!762411 () Bool)

(declare-fun e!424923 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42126 (_ BitVec 32)) SeekEntryResult!7768)

(assert (=> b!762411 (= e!424923 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20171 a!3186) j!159) a!3186 mask!3328) lt!339382)))))

(declare-fun b!762412 () Bool)

(declare-fun res!515641 () Bool)

(declare-fun e!424924 () Bool)

(assert (=> b!762412 (=> (not res!515641) (not e!424924))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!762412 (= res!515641 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20171 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!762413 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42126 (_ BitVec 32)) SeekEntryResult!7768)

(assert (=> b!762413 (= e!424923 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20171 a!3186) j!159) a!3186 mask!3328) (Found!7768 j!159))))))

(declare-fun b!762414 () Bool)

(declare-fun res!515643 () Bool)

(assert (=> b!762414 (=> (not res!515643) (not e!424921))))

(assert (=> b!762414 (= res!515643 (validKeyInArray!0 (select (arr!20171 a!3186) j!159)))))

(declare-fun b!762415 () Bool)

(assert (=> b!762415 (= e!424925 e!424924)))

(declare-fun res!515645 () Bool)

(assert (=> b!762415 (=> (not res!515645) (not e!424924))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762415 (= res!515645 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20171 a!3186) j!159) mask!3328) (select (arr!20171 a!3186) j!159) a!3186 mask!3328) lt!339382))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762415 (= lt!339382 (Intermediate!7768 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!762416 () Bool)

(declare-fun res!515639 () Bool)

(assert (=> b!762416 (=> (not res!515639) (not e!424925))))

(assert (=> b!762416 (= res!515639 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20592 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20592 a!3186))))))

(declare-fun b!762417 () Bool)

(declare-fun res!515640 () Bool)

(assert (=> b!762417 (=> (not res!515640) (not e!424925))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42126 (_ BitVec 32)) Bool)

(assert (=> b!762417 (= res!515640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!762419 () Bool)

(declare-fun res!515642 () Bool)

(assert (=> b!762419 (=> (not res!515642) (not e!424921))))

(declare-fun arrayContainsKey!0 (array!42126 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762419 (= res!515642 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!762418 () Bool)

(declare-fun res!515648 () Bool)

(assert (=> b!762418 (=> (not res!515648) (not e!424921))))

(assert (=> b!762418 (= res!515648 (and (= (size!20592 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20592 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20592 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!515644 () Bool)

(assert (=> start!66204 (=> (not res!515644) (not e!424921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66204 (= res!515644 (validMask!0 mask!3328))))

(assert (=> start!66204 e!424921))

(assert (=> start!66204 true))

(declare-fun array_inv!16054 (array!42126) Bool)

(assert (=> start!66204 (array_inv!16054 a!3186)))

(declare-fun b!762420 () Bool)

(assert (=> b!762420 (= e!424924 false)))

(declare-fun lt!339381 () Bool)

(assert (=> b!762420 (= lt!339381 e!424923)))

(declare-fun c!83772 () Bool)

(assert (=> b!762420 (= c!83772 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!762421 () Bool)

(assert (=> b!762421 (= e!424921 e!424925)))

(declare-fun res!515647 () Bool)

(assert (=> b!762421 (=> (not res!515647) (not e!424925))))

(declare-fun lt!339383 () SeekEntryResult!7768)

(assert (=> b!762421 (= res!515647 (or (= lt!339383 (MissingZero!7768 i!1173)) (= lt!339383 (MissingVacant!7768 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42126 (_ BitVec 32)) SeekEntryResult!7768)

(assert (=> b!762421 (= lt!339383 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!66204 res!515644) b!762418))

(assert (= (and b!762418 res!515648) b!762414))

(assert (= (and b!762414 res!515643) b!762409))

(assert (= (and b!762409 res!515646) b!762419))

(assert (= (and b!762419 res!515642) b!762421))

(assert (= (and b!762421 res!515647) b!762417))

(assert (= (and b!762417 res!515640) b!762410))

(assert (= (and b!762410 res!515638) b!762416))

(assert (= (and b!762416 res!515639) b!762415))

(assert (= (and b!762415 res!515645) b!762412))

(assert (= (and b!762412 res!515641) b!762420))

(assert (= (and b!762420 c!83772) b!762411))

(assert (= (and b!762420 (not c!83772)) b!762413))

(declare-fun m!708589 () Bool)

(assert (=> b!762414 m!708589))

(assert (=> b!762414 m!708589))

(declare-fun m!708591 () Bool)

(assert (=> b!762414 m!708591))

(declare-fun m!708593 () Bool)

(assert (=> start!66204 m!708593))

(declare-fun m!708595 () Bool)

(assert (=> start!66204 m!708595))

(declare-fun m!708597 () Bool)

(assert (=> b!762409 m!708597))

(assert (=> b!762415 m!708589))

(assert (=> b!762415 m!708589))

(declare-fun m!708599 () Bool)

(assert (=> b!762415 m!708599))

(assert (=> b!762415 m!708599))

(assert (=> b!762415 m!708589))

(declare-fun m!708601 () Bool)

(assert (=> b!762415 m!708601))

(declare-fun m!708603 () Bool)

(assert (=> b!762417 m!708603))

(declare-fun m!708605 () Bool)

(assert (=> b!762412 m!708605))

(declare-fun m!708607 () Bool)

(assert (=> b!762410 m!708607))

(assert (=> b!762411 m!708589))

(assert (=> b!762411 m!708589))

(declare-fun m!708609 () Bool)

(assert (=> b!762411 m!708609))

(declare-fun m!708611 () Bool)

(assert (=> b!762419 m!708611))

(assert (=> b!762413 m!708589))

(assert (=> b!762413 m!708589))

(declare-fun m!708613 () Bool)

(assert (=> b!762413 m!708613))

(declare-fun m!708615 () Bool)

(assert (=> b!762421 m!708615))

(check-sat (not b!762419) (not b!762411) (not b!762421) (not start!66204) (not b!762414) (not b!762409) (not b!762410) (not b!762417) (not b!762413) (not b!762415))
(check-sat)
