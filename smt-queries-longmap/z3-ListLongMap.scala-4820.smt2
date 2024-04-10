; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66262 () Bool)

(assert start!66262)

(declare-fun b!763418 () Bool)

(declare-fun e!425363 () Bool)

(declare-fun e!425364 () Bool)

(assert (=> b!763418 (= e!425363 e!425364)))

(declare-fun res!516401 () Bool)

(assert (=> b!763418 (=> (not res!516401) (not e!425364))))

(declare-datatypes ((array!42167 0))(
  ( (array!42168 (arr!20191 (Array (_ BitVec 32) (_ BitVec 64))) (size!20612 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42167)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7791 0))(
  ( (MissingZero!7791 (index!33532 (_ BitVec 32))) (Found!7791 (index!33533 (_ BitVec 32))) (Intermediate!7791 (undefined!8603 Bool) (index!33534 (_ BitVec 32)) (x!64435 (_ BitVec 32))) (Undefined!7791) (MissingVacant!7791 (index!33535 (_ BitVec 32))) )
))
(declare-fun lt!339794 () SeekEntryResult!7791)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42167 (_ BitVec 32)) SeekEntryResult!7791)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763418 (= res!516401 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20191 a!3186) j!159) mask!3328) (select (arr!20191 a!3186) j!159) a!3186 mask!3328) lt!339794))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763418 (= lt!339794 (Intermediate!7791 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763419 () Bool)

(declare-fun res!516403 () Bool)

(assert (=> b!763419 (=> (not res!516403) (not e!425363))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42167 (_ BitVec 32)) Bool)

(assert (=> b!763419 (= res!516403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763420 () Bool)

(declare-fun res!516395 () Bool)

(assert (=> b!763420 (=> (not res!516395) (not e!425363))))

(declare-datatypes ((List!14193 0))(
  ( (Nil!14190) (Cons!14189 (h!15273 (_ BitVec 64)) (t!20508 List!14193)) )
))
(declare-fun arrayNoDuplicates!0 (array!42167 (_ BitVec 32) List!14193) Bool)

(assert (=> b!763420 (= res!516395 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14190))))

(declare-fun b!763421 () Bool)

(declare-fun res!516393 () Bool)

(declare-fun e!425361 () Bool)

(assert (=> b!763421 (=> (not res!516393) (not e!425361))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763421 (= res!516393 (validKeyInArray!0 (select (arr!20191 a!3186) j!159)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!425362 () Bool)

(declare-fun b!763422 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42167 (_ BitVec 32)) SeekEntryResult!7791)

(assert (=> b!763422 (= e!425362 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20191 a!3186) j!159) a!3186 mask!3328) (Found!7791 j!159))))))

(declare-fun res!516398 () Bool)

(assert (=> start!66262 (=> (not res!516398) (not e!425361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66262 (= res!516398 (validMask!0 mask!3328))))

(assert (=> start!66262 e!425361))

(assert (=> start!66262 true))

(declare-fun array_inv!15987 (array!42167) Bool)

(assert (=> start!66262 (array_inv!15987 a!3186)))

(declare-fun b!763423 () Bool)

(declare-fun res!516400 () Bool)

(assert (=> b!763423 (=> (not res!516400) (not e!425361))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763423 (= res!516400 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!763424 () Bool)

(assert (=> b!763424 (= e!425361 e!425363)))

(declare-fun res!516397 () Bool)

(assert (=> b!763424 (=> (not res!516397) (not e!425363))))

(declare-fun lt!339793 () SeekEntryResult!7791)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!763424 (= res!516397 (or (= lt!339793 (MissingZero!7791 i!1173)) (= lt!339793 (MissingVacant!7791 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42167 (_ BitVec 32)) SeekEntryResult!7791)

(assert (=> b!763424 (= lt!339793 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!763425 () Bool)

(declare-fun res!516396 () Bool)

(assert (=> b!763425 (=> (not res!516396) (not e!425361))))

(assert (=> b!763425 (= res!516396 (validKeyInArray!0 k0!2102))))

(declare-fun b!763426 () Bool)

(assert (=> b!763426 (= e!425364 false)))

(declare-fun lt!339792 () Bool)

(assert (=> b!763426 (= lt!339792 e!425362)))

(declare-fun c!83899 () Bool)

(assert (=> b!763426 (= c!83899 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!763427 () Bool)

(declare-fun res!516399 () Bool)

(assert (=> b!763427 (=> (not res!516399) (not e!425364))))

(assert (=> b!763427 (= res!516399 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20191 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!763428 () Bool)

(declare-fun res!516402 () Bool)

(assert (=> b!763428 (=> (not res!516402) (not e!425363))))

(assert (=> b!763428 (= res!516402 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20612 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20612 a!3186))))))

(declare-fun b!763429 () Bool)

(declare-fun res!516394 () Bool)

(assert (=> b!763429 (=> (not res!516394) (not e!425361))))

(assert (=> b!763429 (= res!516394 (and (= (size!20612 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20612 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20612 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763430 () Bool)

(assert (=> b!763430 (= e!425362 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20191 a!3186) j!159) a!3186 mask!3328) lt!339794)))))

(assert (= (and start!66262 res!516398) b!763429))

(assert (= (and b!763429 res!516394) b!763421))

(assert (= (and b!763421 res!516393) b!763425))

(assert (= (and b!763425 res!516396) b!763423))

(assert (= (and b!763423 res!516400) b!763424))

(assert (= (and b!763424 res!516397) b!763419))

(assert (= (and b!763419 res!516403) b!763420))

(assert (= (and b!763420 res!516395) b!763428))

(assert (= (and b!763428 res!516402) b!763418))

(assert (= (and b!763418 res!516401) b!763427))

(assert (= (and b!763427 res!516399) b!763426))

(assert (= (and b!763426 c!83899) b!763430))

(assert (= (and b!763426 (not c!83899)) b!763422))

(declare-fun m!709915 () Bool)

(assert (=> b!763418 m!709915))

(assert (=> b!763418 m!709915))

(declare-fun m!709917 () Bool)

(assert (=> b!763418 m!709917))

(assert (=> b!763418 m!709917))

(assert (=> b!763418 m!709915))

(declare-fun m!709919 () Bool)

(assert (=> b!763418 m!709919))

(declare-fun m!709921 () Bool)

(assert (=> b!763420 m!709921))

(declare-fun m!709923 () Bool)

(assert (=> b!763427 m!709923))

(declare-fun m!709925 () Bool)

(assert (=> start!66262 m!709925))

(declare-fun m!709927 () Bool)

(assert (=> start!66262 m!709927))

(assert (=> b!763421 m!709915))

(assert (=> b!763421 m!709915))

(declare-fun m!709929 () Bool)

(assert (=> b!763421 m!709929))

(declare-fun m!709931 () Bool)

(assert (=> b!763419 m!709931))

(assert (=> b!763430 m!709915))

(assert (=> b!763430 m!709915))

(declare-fun m!709933 () Bool)

(assert (=> b!763430 m!709933))

(declare-fun m!709935 () Bool)

(assert (=> b!763425 m!709935))

(declare-fun m!709937 () Bool)

(assert (=> b!763424 m!709937))

(declare-fun m!709939 () Bool)

(assert (=> b!763423 m!709939))

(assert (=> b!763422 m!709915))

(assert (=> b!763422 m!709915))

(declare-fun m!709941 () Bool)

(assert (=> b!763422 m!709941))

(check-sat (not b!763418) (not b!763424) (not start!66262) (not b!763421) (not b!763420) (not b!763423) (not b!763419) (not b!763425) (not b!763430) (not b!763422))
(check-sat)
