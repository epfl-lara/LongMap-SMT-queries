; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66214 () Bool)

(assert start!66214)

(declare-fun res!515591 () Bool)

(declare-fun e!425010 () Bool)

(assert (=> start!66214 (=> (not res!515591) (not e!425010))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66214 (= res!515591 (validMask!0 mask!3328))))

(assert (=> start!66214 e!425010))

(assert (=> start!66214 true))

(declare-datatypes ((array!42119 0))(
  ( (array!42120 (arr!20167 (Array (_ BitVec 32) (_ BitVec 64))) (size!20588 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42119)

(declare-fun array_inv!15963 (array!42119) Bool)

(assert (=> start!66214 (array_inv!15963 a!3186)))

(declare-fun b!762480 () Bool)

(declare-fun e!425008 () Bool)

(assert (=> b!762480 (= e!425010 e!425008)))

(declare-fun res!515594 () Bool)

(assert (=> b!762480 (=> (not res!515594) (not e!425008))))

(declare-datatypes ((SeekEntryResult!7767 0))(
  ( (MissingZero!7767 (index!33436 (_ BitVec 32))) (Found!7767 (index!33437 (_ BitVec 32))) (Intermediate!7767 (undefined!8579 Bool) (index!33438 (_ BitVec 32)) (x!64347 (_ BitVec 32))) (Undefined!7767) (MissingVacant!7767 (index!33439 (_ BitVec 32))) )
))
(declare-fun lt!339581 () SeekEntryResult!7767)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!762480 (= res!515594 (or (= lt!339581 (MissingZero!7767 i!1173)) (= lt!339581 (MissingVacant!7767 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42119 (_ BitVec 32)) SeekEntryResult!7767)

(assert (=> b!762480 (= lt!339581 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!762481 () Bool)

(declare-fun res!515599 () Bool)

(assert (=> b!762481 (=> (not res!515599) (not e!425008))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762481 (= res!515599 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20588 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20588 a!3186))))))

(declare-fun b!762482 () Bool)

(declare-fun res!515593 () Bool)

(assert (=> b!762482 (=> (not res!515593) (not e!425010))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762482 (= res!515593 (validKeyInArray!0 (select (arr!20167 a!3186) j!159)))))

(declare-fun b!762483 () Bool)

(declare-fun res!515598 () Bool)

(assert (=> b!762483 (=> (not res!515598) (not e!425008))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42119 (_ BitVec 32)) Bool)

(assert (=> b!762483 (= res!515598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!762484 () Bool)

(declare-fun res!515596 () Bool)

(assert (=> b!762484 (=> (not res!515596) (not e!425010))))

(declare-fun arrayContainsKey!0 (array!42119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762484 (= res!515596 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!762485 () Bool)

(assert (=> b!762485 (= e!425008 false)))

(declare-fun lt!339580 () SeekEntryResult!7767)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42119 (_ BitVec 32)) SeekEntryResult!7767)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762485 (= lt!339580 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20167 a!3186) j!159) mask!3328) (select (arr!20167 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!762486 () Bool)

(declare-fun res!515597 () Bool)

(assert (=> b!762486 (=> (not res!515597) (not e!425010))))

(assert (=> b!762486 (= res!515597 (validKeyInArray!0 k0!2102))))

(declare-fun b!762487 () Bool)

(declare-fun res!515595 () Bool)

(assert (=> b!762487 (=> (not res!515595) (not e!425008))))

(declare-datatypes ((List!14169 0))(
  ( (Nil!14166) (Cons!14165 (h!15249 (_ BitVec 64)) (t!20484 List!14169)) )
))
(declare-fun arrayNoDuplicates!0 (array!42119 (_ BitVec 32) List!14169) Bool)

(assert (=> b!762487 (= res!515595 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14166))))

(declare-fun b!762488 () Bool)

(declare-fun res!515592 () Bool)

(assert (=> b!762488 (=> (not res!515592) (not e!425010))))

(assert (=> b!762488 (= res!515592 (and (= (size!20588 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20588 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20588 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!66214 res!515591) b!762488))

(assert (= (and b!762488 res!515592) b!762482))

(assert (= (and b!762482 res!515593) b!762486))

(assert (= (and b!762486 res!515597) b!762484))

(assert (= (and b!762484 res!515596) b!762480))

(assert (= (and b!762480 res!515594) b!762483))

(assert (= (and b!762483 res!515598) b!762487))

(assert (= (and b!762487 res!515595) b!762481))

(assert (= (and b!762481 res!515599) b!762485))

(declare-fun m!709219 () Bool)

(assert (=> b!762486 m!709219))

(declare-fun m!709221 () Bool)

(assert (=> b!762480 m!709221))

(declare-fun m!709223 () Bool)

(assert (=> start!66214 m!709223))

(declare-fun m!709225 () Bool)

(assert (=> start!66214 m!709225))

(declare-fun m!709227 () Bool)

(assert (=> b!762487 m!709227))

(declare-fun m!709229 () Bool)

(assert (=> b!762485 m!709229))

(assert (=> b!762485 m!709229))

(declare-fun m!709231 () Bool)

(assert (=> b!762485 m!709231))

(assert (=> b!762485 m!709231))

(assert (=> b!762485 m!709229))

(declare-fun m!709233 () Bool)

(assert (=> b!762485 m!709233))

(declare-fun m!709235 () Bool)

(assert (=> b!762484 m!709235))

(assert (=> b!762482 m!709229))

(assert (=> b!762482 m!709229))

(declare-fun m!709237 () Bool)

(assert (=> b!762482 m!709237))

(declare-fun m!709239 () Bool)

(assert (=> b!762483 m!709239))

(check-sat (not b!762485) (not b!762482) (not b!762483) (not b!762480) (not b!762484) (not b!762486) (not b!762487) (not start!66214))
(check-sat)
