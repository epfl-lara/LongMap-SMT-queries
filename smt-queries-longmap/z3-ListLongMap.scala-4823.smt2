; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66258 () Bool)

(assert start!66258)

(declare-fun b!763500 () Bool)

(declare-fun res!516577 () Bool)

(declare-fun e!425327 () Bool)

(assert (=> b!763500 (=> (not res!516577) (not e!425327))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42180 0))(
  ( (array!42181 (arr!20198 (Array (_ BitVec 32) (_ BitVec 64))) (size!20619 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42180)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!763500 (= res!516577 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20198 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!763501 () Bool)

(declare-fun res!516570 () Bool)

(declare-fun e!425329 () Bool)

(assert (=> b!763501 (=> (not res!516570) (not e!425329))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42180 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763501 (= res!516570 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!516574 () Bool)

(assert (=> start!66258 (=> (not res!516574) (not e!425329))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66258 (= res!516574 (validMask!0 mask!3328))))

(assert (=> start!66258 e!425329))

(assert (=> start!66258 true))

(declare-fun array_inv!16081 (array!42180) Bool)

(assert (=> start!66258 (array_inv!16081 a!3186)))

(declare-fun b!763502 () Bool)

(declare-fun res!516572 () Bool)

(declare-fun e!425330 () Bool)

(assert (=> b!763502 (=> (not res!516572) (not e!425330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42180 (_ BitVec 32)) Bool)

(assert (=> b!763502 (= res!516572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763503 () Bool)

(declare-fun res!516578 () Bool)

(assert (=> b!763503 (=> (not res!516578) (not e!425330))))

(declare-datatypes ((List!14239 0))(
  ( (Nil!14236) (Cons!14235 (h!15319 (_ BitVec 64)) (t!20545 List!14239)) )
))
(declare-fun arrayNoDuplicates!0 (array!42180 (_ BitVec 32) List!14239) Bool)

(assert (=> b!763503 (= res!516578 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14236))))

(declare-fun b!763504 () Bool)

(declare-fun res!516569 () Bool)

(assert (=> b!763504 (=> (not res!516569) (not e!425329))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763504 (= res!516569 (validKeyInArray!0 k0!2102))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!763505 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!425328 () Bool)

(declare-datatypes ((SeekEntryResult!7795 0))(
  ( (MissingZero!7795 (index!33548 (_ BitVec 32))) (Found!7795 (index!33549 (_ BitVec 32))) (Intermediate!7795 (undefined!8607 Bool) (index!33550 (_ BitVec 32)) (x!64458 (_ BitVec 32))) (Undefined!7795) (MissingVacant!7795 (index!33551 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42180 (_ BitVec 32)) SeekEntryResult!7795)

(assert (=> b!763505 (= e!425328 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20198 a!3186) j!159) a!3186 mask!3328) (Found!7795 j!159)))))

(declare-fun b!763506 () Bool)

(assert (=> b!763506 (= e!425330 e!425327)))

(declare-fun res!516576 () Bool)

(assert (=> b!763506 (=> (not res!516576) (not e!425327))))

(declare-fun lt!339684 () SeekEntryResult!7795)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42180 (_ BitVec 32)) SeekEntryResult!7795)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763506 (= res!516576 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20198 a!3186) j!159) mask!3328) (select (arr!20198 a!3186) j!159) a!3186 mask!3328) lt!339684))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763506 (= lt!339684 (Intermediate!7795 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763507 () Bool)

(declare-fun res!516567 () Bool)

(assert (=> b!763507 (=> (not res!516567) (not e!425330))))

(assert (=> b!763507 (= res!516567 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20619 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20619 a!3186))))))

(declare-fun b!763508 () Bool)

(declare-fun res!516575 () Bool)

(assert (=> b!763508 (=> (not res!516575) (not e!425329))))

(assert (=> b!763508 (= res!516575 (validKeyInArray!0 (select (arr!20198 a!3186) j!159)))))

(declare-fun b!763509 () Bool)

(declare-fun res!516571 () Bool)

(assert (=> b!763509 (=> (not res!516571) (not e!425327))))

(assert (=> b!763509 (= res!516571 e!425328)))

(declare-fun c!83853 () Bool)

(assert (=> b!763509 (= c!83853 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!763510 () Bool)

(assert (=> b!763510 (= e!425327 false)))

(declare-fun lt!339685 () array!42180)

(declare-fun lt!339687 () (_ BitVec 64))

(declare-fun lt!339688 () SeekEntryResult!7795)

(assert (=> b!763510 (= lt!339688 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!339687 lt!339685 mask!3328))))

(declare-fun lt!339689 () SeekEntryResult!7795)

(assert (=> b!763510 (= lt!339689 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!339687 mask!3328) lt!339687 lt!339685 mask!3328))))

(assert (=> b!763510 (= lt!339687 (select (store (arr!20198 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!763510 (= lt!339685 (array!42181 (store (arr!20198 a!3186) i!1173 k0!2102) (size!20619 a!3186)))))

(declare-fun b!763511 () Bool)

(assert (=> b!763511 (= e!425329 e!425330)))

(declare-fun res!516568 () Bool)

(assert (=> b!763511 (=> (not res!516568) (not e!425330))))

(declare-fun lt!339686 () SeekEntryResult!7795)

(assert (=> b!763511 (= res!516568 (or (= lt!339686 (MissingZero!7795 i!1173)) (= lt!339686 (MissingVacant!7795 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42180 (_ BitVec 32)) SeekEntryResult!7795)

(assert (=> b!763511 (= lt!339686 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!763512 () Bool)

(declare-fun res!516573 () Bool)

(assert (=> b!763512 (=> (not res!516573) (not e!425329))))

(assert (=> b!763512 (= res!516573 (and (= (size!20619 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20619 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20619 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763513 () Bool)

(assert (=> b!763513 (= e!425328 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20198 a!3186) j!159) a!3186 mask!3328) lt!339684))))

(assert (= (and start!66258 res!516574) b!763512))

(assert (= (and b!763512 res!516573) b!763508))

(assert (= (and b!763508 res!516575) b!763504))

(assert (= (and b!763504 res!516569) b!763501))

(assert (= (and b!763501 res!516570) b!763511))

(assert (= (and b!763511 res!516568) b!763502))

(assert (= (and b!763502 res!516572) b!763503))

(assert (= (and b!763503 res!516578) b!763507))

(assert (= (and b!763507 res!516567) b!763506))

(assert (= (and b!763506 res!516576) b!763500))

(assert (= (and b!763500 res!516577) b!763509))

(assert (= (and b!763509 c!83853) b!763513))

(assert (= (and b!763509 (not c!83853)) b!763505))

(assert (= (and b!763509 res!516571) b!763510))

(declare-fun m!709441 () Bool)

(assert (=> b!763504 m!709441))

(declare-fun m!709443 () Bool)

(assert (=> b!763510 m!709443))

(declare-fun m!709445 () Bool)

(assert (=> b!763510 m!709445))

(declare-fun m!709447 () Bool)

(assert (=> b!763510 m!709447))

(assert (=> b!763510 m!709443))

(declare-fun m!709449 () Bool)

(assert (=> b!763510 m!709449))

(declare-fun m!709451 () Bool)

(assert (=> b!763510 m!709451))

(declare-fun m!709453 () Bool)

(assert (=> b!763500 m!709453))

(declare-fun m!709455 () Bool)

(assert (=> b!763505 m!709455))

(assert (=> b!763505 m!709455))

(declare-fun m!709457 () Bool)

(assert (=> b!763505 m!709457))

(assert (=> b!763513 m!709455))

(assert (=> b!763513 m!709455))

(declare-fun m!709459 () Bool)

(assert (=> b!763513 m!709459))

(assert (=> b!763506 m!709455))

(assert (=> b!763506 m!709455))

(declare-fun m!709461 () Bool)

(assert (=> b!763506 m!709461))

(assert (=> b!763506 m!709461))

(assert (=> b!763506 m!709455))

(declare-fun m!709463 () Bool)

(assert (=> b!763506 m!709463))

(declare-fun m!709465 () Bool)

(assert (=> b!763501 m!709465))

(declare-fun m!709467 () Bool)

(assert (=> b!763503 m!709467))

(declare-fun m!709469 () Bool)

(assert (=> b!763511 m!709469))

(declare-fun m!709471 () Bool)

(assert (=> start!66258 m!709471))

(declare-fun m!709473 () Bool)

(assert (=> start!66258 m!709473))

(declare-fun m!709475 () Bool)

(assert (=> b!763502 m!709475))

(assert (=> b!763508 m!709455))

(assert (=> b!763508 m!709455))

(declare-fun m!709477 () Bool)

(assert (=> b!763508 m!709477))

(check-sat (not b!763504) (not b!763501) (not b!763508) (not start!66258) (not b!763513) (not b!763511) (not b!763505) (not b!763502) (not b!763503) (not b!763506) (not b!763510))
(check-sat)
