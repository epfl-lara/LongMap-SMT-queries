; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66308 () Bool)

(assert start!66308)

(declare-fun res!515529 () Bool)

(declare-fun e!425308 () Bool)

(assert (=> start!66308 (=> (not res!515529) (not e!425308))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66308 (= res!515529 (validMask!0 mask!3328))))

(assert (=> start!66308 e!425308))

(declare-datatypes ((array!42091 0))(
  ( (array!42092 (arr!20149 (Array (_ BitVec 32) (_ BitVec 64))) (size!20569 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42091)

(declare-fun array_inv!16008 (array!42091) Bool)

(assert (=> start!66308 (array_inv!16008 a!3186)))

(assert (=> start!66308 true))

(declare-fun b!762788 () Bool)

(declare-fun res!515528 () Bool)

(assert (=> b!762788 (=> (not res!515528) (not e!425308))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42091 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762788 (= res!515528 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!762789 () Bool)

(declare-fun res!515526 () Bool)

(assert (=> b!762789 (=> (not res!515526) (not e!425308))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!762789 (= res!515526 (and (= (size!20569 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20569 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20569 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!762790 () Bool)

(declare-fun e!425309 () Bool)

(assert (=> b!762790 (= e!425308 e!425309)))

(declare-fun res!515531 () Bool)

(assert (=> b!762790 (=> (not res!515531) (not e!425309))))

(declare-datatypes ((SeekEntryResult!7705 0))(
  ( (MissingZero!7705 (index!33188 (_ BitVec 32))) (Found!7705 (index!33189 (_ BitVec 32))) (Intermediate!7705 (undefined!8517 Bool) (index!33190 (_ BitVec 32)) (x!64264 (_ BitVec 32))) (Undefined!7705) (MissingVacant!7705 (index!33191 (_ BitVec 32))) )
))
(declare-fun lt!339774 () SeekEntryResult!7705)

(assert (=> b!762790 (= res!515531 (or (= lt!339774 (MissingZero!7705 i!1173)) (= lt!339774 (MissingVacant!7705 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42091 (_ BitVec 32)) SeekEntryResult!7705)

(assert (=> b!762790 (= lt!339774 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!762791 () Bool)

(declare-fun res!515525 () Bool)

(assert (=> b!762791 (=> (not res!515525) (not e!425309))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42091 (_ BitVec 32)) Bool)

(assert (=> b!762791 (= res!515525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!762792 () Bool)

(assert (=> b!762792 (= e!425309 false)))

(declare-fun lt!339773 () Bool)

(declare-datatypes ((List!14058 0))(
  ( (Nil!14055) (Cons!14054 (h!15144 (_ BitVec 64)) (t!20365 List!14058)) )
))
(declare-fun arrayNoDuplicates!0 (array!42091 (_ BitVec 32) List!14058) Bool)

(assert (=> b!762792 (= lt!339773 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14055))))

(declare-fun b!762793 () Bool)

(declare-fun res!515530 () Bool)

(assert (=> b!762793 (=> (not res!515530) (not e!425308))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762793 (= res!515530 (validKeyInArray!0 (select (arr!20149 a!3186) j!159)))))

(declare-fun b!762794 () Bool)

(declare-fun res!515527 () Bool)

(assert (=> b!762794 (=> (not res!515527) (not e!425308))))

(assert (=> b!762794 (= res!515527 (validKeyInArray!0 k0!2102))))

(assert (= (and start!66308 res!515529) b!762789))

(assert (= (and b!762789 res!515526) b!762793))

(assert (= (and b!762793 res!515530) b!762794))

(assert (= (and b!762794 res!515527) b!762788))

(assert (= (and b!762788 res!515528) b!762790))

(assert (= (and b!762790 res!515531) b!762791))

(assert (= (and b!762791 res!515525) b!762792))

(declare-fun m!709975 () Bool)

(assert (=> b!762788 m!709975))

(declare-fun m!709977 () Bool)

(assert (=> b!762791 m!709977))

(declare-fun m!709979 () Bool)

(assert (=> b!762794 m!709979))

(declare-fun m!709981 () Bool)

(assert (=> start!66308 m!709981))

(declare-fun m!709983 () Bool)

(assert (=> start!66308 m!709983))

(declare-fun m!709985 () Bool)

(assert (=> b!762793 m!709985))

(assert (=> b!762793 m!709985))

(declare-fun m!709987 () Bool)

(assert (=> b!762793 m!709987))

(declare-fun m!709989 () Bool)

(assert (=> b!762792 m!709989))

(declare-fun m!709991 () Bool)

(assert (=> b!762790 m!709991))

(check-sat (not b!762788) (not b!762793) (not b!762791) (not b!762790) (not b!762794) (not start!66308) (not b!762792))
(check-sat)
