; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66220 () Bool)

(assert start!66220)

(declare-fun b!762581 () Bool)

(declare-fun e!425049 () Bool)

(declare-fun e!425046 () Bool)

(assert (=> b!762581 (= e!425049 e!425046)))

(declare-fun res!515690 () Bool)

(assert (=> b!762581 (=> (not res!515690) (not e!425046))))

(declare-datatypes ((array!42125 0))(
  ( (array!42126 (arr!20170 (Array (_ BitVec 32) (_ BitVec 64))) (size!20591 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42125)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7770 0))(
  ( (MissingZero!7770 (index!33448 (_ BitVec 32))) (Found!7770 (index!33449 (_ BitVec 32))) (Intermediate!7770 (undefined!8582 Bool) (index!33450 (_ BitVec 32)) (x!64358 (_ BitVec 32))) (Undefined!7770) (MissingVacant!7770 (index!33451 (_ BitVec 32))) )
))
(declare-fun lt!339605 () SeekEntryResult!7770)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42125 (_ BitVec 32)) SeekEntryResult!7770)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762581 (= res!515690 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20170 a!3186) j!159) mask!3328) (select (arr!20170 a!3186) j!159) a!3186 mask!3328) lt!339605))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762581 (= lt!339605 (Intermediate!7770 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!762582 () Bool)

(declare-fun res!515691 () Bool)

(assert (=> b!762582 (=> (not res!515691) (not e!425046))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!762582 (= res!515691 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20170 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!762583 () Bool)

(declare-fun res!515686 () Bool)

(declare-fun e!425048 () Bool)

(assert (=> b!762583 (=> (not res!515686) (not e!425048))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762583 (= res!515686 (validKeyInArray!0 k0!2102))))

(declare-fun res!515685 () Bool)

(assert (=> start!66220 (=> (not res!515685) (not e!425048))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66220 (= res!515685 (validMask!0 mask!3328))))

(assert (=> start!66220 e!425048))

(assert (=> start!66220 true))

(declare-fun array_inv!15966 (array!42125) Bool)

(assert (=> start!66220 (array_inv!15966 a!3186)))

(declare-fun b!762584 () Bool)

(declare-fun res!515683 () Bool)

(assert (=> b!762584 (=> (not res!515683) (not e!425049))))

(declare-datatypes ((List!14172 0))(
  ( (Nil!14169) (Cons!14168 (h!15252 (_ BitVec 64)) (t!20487 List!14172)) )
))
(declare-fun arrayNoDuplicates!0 (array!42125 (_ BitVec 32) List!14172) Bool)

(assert (=> b!762584 (= res!515683 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14169))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!762585 () Bool)

(declare-fun e!425047 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42125 (_ BitVec 32)) SeekEntryResult!7770)

(assert (=> b!762585 (= e!425047 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20170 a!3186) j!159) a!3186 mask!3328) (Found!7770 j!159))))))

(declare-fun b!762586 () Bool)

(assert (=> b!762586 (= e!425046 false)))

(declare-fun lt!339603 () Bool)

(assert (=> b!762586 (= lt!339603 e!425047)))

(declare-fun c!83836 () Bool)

(assert (=> b!762586 (= c!83836 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!762587 () Bool)

(assert (=> b!762587 (= e!425048 e!425049)))

(declare-fun res!515692 () Bool)

(assert (=> b!762587 (=> (not res!515692) (not e!425049))))

(declare-fun lt!339604 () SeekEntryResult!7770)

(assert (=> b!762587 (= res!515692 (or (= lt!339604 (MissingZero!7770 i!1173)) (= lt!339604 (MissingVacant!7770 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42125 (_ BitVec 32)) SeekEntryResult!7770)

(assert (=> b!762587 (= lt!339604 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!762588 () Bool)

(declare-fun res!515687 () Bool)

(assert (=> b!762588 (=> (not res!515687) (not e!425048))))

(assert (=> b!762588 (= res!515687 (validKeyInArray!0 (select (arr!20170 a!3186) j!159)))))

(declare-fun b!762589 () Bool)

(assert (=> b!762589 (= e!425047 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20170 a!3186) j!159) a!3186 mask!3328) lt!339605)))))

(declare-fun b!762590 () Bool)

(declare-fun res!515682 () Bool)

(assert (=> b!762590 (=> (not res!515682) (not e!425049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42125 (_ BitVec 32)) Bool)

(assert (=> b!762590 (= res!515682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!762591 () Bool)

(declare-fun res!515689 () Bool)

(assert (=> b!762591 (=> (not res!515689) (not e!425048))))

(assert (=> b!762591 (= res!515689 (and (= (size!20591 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20591 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20591 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!762592 () Bool)

(declare-fun res!515684 () Bool)

(assert (=> b!762592 (=> (not res!515684) (not e!425048))))

(declare-fun arrayContainsKey!0 (array!42125 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762592 (= res!515684 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!762593 () Bool)

(declare-fun res!515688 () Bool)

(assert (=> b!762593 (=> (not res!515688) (not e!425049))))

(assert (=> b!762593 (= res!515688 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20591 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20591 a!3186))))))

(assert (= (and start!66220 res!515685) b!762591))

(assert (= (and b!762591 res!515689) b!762588))

(assert (= (and b!762588 res!515687) b!762583))

(assert (= (and b!762583 res!515686) b!762592))

(assert (= (and b!762592 res!515684) b!762587))

(assert (= (and b!762587 res!515692) b!762590))

(assert (= (and b!762590 res!515682) b!762584))

(assert (= (and b!762584 res!515683) b!762593))

(assert (= (and b!762593 res!515688) b!762581))

(assert (= (and b!762581 res!515690) b!762582))

(assert (= (and b!762582 res!515691) b!762586))

(assert (= (and b!762586 c!83836) b!762589))

(assert (= (and b!762586 (not c!83836)) b!762585))

(declare-fun m!709291 () Bool)

(assert (=> b!762589 m!709291))

(assert (=> b!762589 m!709291))

(declare-fun m!709293 () Bool)

(assert (=> b!762589 m!709293))

(declare-fun m!709295 () Bool)

(assert (=> b!762592 m!709295))

(assert (=> b!762588 m!709291))

(assert (=> b!762588 m!709291))

(declare-fun m!709297 () Bool)

(assert (=> b!762588 m!709297))

(assert (=> b!762585 m!709291))

(assert (=> b!762585 m!709291))

(declare-fun m!709299 () Bool)

(assert (=> b!762585 m!709299))

(assert (=> b!762581 m!709291))

(assert (=> b!762581 m!709291))

(declare-fun m!709301 () Bool)

(assert (=> b!762581 m!709301))

(assert (=> b!762581 m!709301))

(assert (=> b!762581 m!709291))

(declare-fun m!709303 () Bool)

(assert (=> b!762581 m!709303))

(declare-fun m!709305 () Bool)

(assert (=> b!762584 m!709305))

(declare-fun m!709307 () Bool)

(assert (=> b!762582 m!709307))

(declare-fun m!709309 () Bool)

(assert (=> b!762590 m!709309))

(declare-fun m!709311 () Bool)

(assert (=> b!762583 m!709311))

(declare-fun m!709313 () Bool)

(assert (=> start!66220 m!709313))

(declare-fun m!709315 () Bool)

(assert (=> start!66220 m!709315))

(declare-fun m!709317 () Bool)

(assert (=> b!762587 m!709317))

(check-sat (not b!762587) (not b!762581) (not b!762584) (not b!762590) (not b!762585) (not b!762583) (not b!762589) (not b!762592) (not b!762588) (not start!66220))
(check-sat)
