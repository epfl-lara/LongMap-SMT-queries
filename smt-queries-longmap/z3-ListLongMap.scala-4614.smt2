; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64298 () Bool)

(assert start!64298)

(declare-fun b!722437 () Bool)

(declare-fun e!404862 () Bool)

(declare-fun e!404866 () Bool)

(assert (=> b!722437 (= e!404862 e!404866)))

(declare-fun res!484257 () Bool)

(assert (=> b!722437 (=> (not res!484257) (not e!404866))))

(declare-datatypes ((array!40896 0))(
  ( (array!40897 (arr!19571 (Array (_ BitVec 32) (_ BitVec 64))) (size!19992 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40896)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7168 0))(
  ( (MissingZero!7168 (index!31040 (_ BitVec 32))) (Found!7168 (index!31041 (_ BitVec 32))) (Intermediate!7168 (undefined!7980 Bool) (index!31042 (_ BitVec 32)) (x!62052 (_ BitVec 32))) (Undefined!7168) (MissingVacant!7168 (index!31043 (_ BitVec 32))) )
))
(declare-fun lt!320147 () SeekEntryResult!7168)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40896 (_ BitVec 32)) SeekEntryResult!7168)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722437 (= res!484257 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19571 a!3186) j!159) mask!3328) (select (arr!19571 a!3186) j!159) a!3186 mask!3328) lt!320147))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722437 (= lt!320147 (Intermediate!7168 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!722438 () Bool)

(declare-fun res!484252 () Bool)

(declare-fun e!404865 () Bool)

(assert (=> b!722438 (=> (not res!484252) (not e!404865))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722438 (= res!484252 (validKeyInArray!0 (select (arr!19571 a!3186) j!159)))))

(declare-fun b!722439 () Bool)

(declare-fun res!484262 () Bool)

(assert (=> b!722439 (=> (not res!484262) (not e!404862))))

(declare-datatypes ((List!13612 0))(
  ( (Nil!13609) (Cons!13608 (h!14662 (_ BitVec 64)) (t!19918 List!13612)) )
))
(declare-fun arrayNoDuplicates!0 (array!40896 (_ BitVec 32) List!13612) Bool)

(assert (=> b!722439 (= res!484262 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13609))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!722440 () Bool)

(declare-fun e!404864 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40896 (_ BitVec 32)) SeekEntryResult!7168)

(assert (=> b!722440 (= e!404864 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19571 a!3186) j!159) a!3186 mask!3328) (Found!7168 j!159)))))

(declare-fun b!722441 () Bool)

(declare-fun res!484259 () Bool)

(assert (=> b!722441 (=> (not res!484259) (not e!404866))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!722441 (= res!484259 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19571 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!722442 () Bool)

(assert (=> b!722442 (= e!404866 false)))

(declare-fun lt!320150 () array!40896)

(declare-fun lt!320148 () SeekEntryResult!7168)

(declare-fun lt!320146 () (_ BitVec 64))

(assert (=> b!722442 (= lt!320148 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320146 lt!320150 mask!3328))))

(declare-fun lt!320145 () SeekEntryResult!7168)

(assert (=> b!722442 (= lt!320145 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320146 mask!3328) lt!320146 lt!320150 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!722442 (= lt!320146 (select (store (arr!19571 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!722442 (= lt!320150 (array!40897 (store (arr!19571 a!3186) i!1173 k0!2102) (size!19992 a!3186)))))

(declare-fun b!722443 () Bool)

(assert (=> b!722443 (= e!404864 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19571 a!3186) j!159) a!3186 mask!3328) lt!320147))))

(declare-fun b!722444 () Bool)

(declare-fun res!484260 () Bool)

(assert (=> b!722444 (=> (not res!484260) (not e!404865))))

(declare-fun arrayContainsKey!0 (array!40896 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722444 (= res!484260 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!484263 () Bool)

(assert (=> start!64298 (=> (not res!484263) (not e!404865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64298 (= res!484263 (validMask!0 mask!3328))))

(assert (=> start!64298 e!404865))

(assert (=> start!64298 true))

(declare-fun array_inv!15454 (array!40896) Bool)

(assert (=> start!64298 (array_inv!15454 a!3186)))

(declare-fun b!722445 () Bool)

(declare-fun res!484261 () Bool)

(assert (=> b!722445 (=> (not res!484261) (not e!404862))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40896 (_ BitVec 32)) Bool)

(assert (=> b!722445 (= res!484261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722446 () Bool)

(declare-fun res!484254 () Bool)

(assert (=> b!722446 (=> (not res!484254) (not e!404862))))

(assert (=> b!722446 (= res!484254 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19992 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19992 a!3186))))))

(declare-fun b!722447 () Bool)

(assert (=> b!722447 (= e!404865 e!404862)))

(declare-fun res!484255 () Bool)

(assert (=> b!722447 (=> (not res!484255) (not e!404862))))

(declare-fun lt!320149 () SeekEntryResult!7168)

(assert (=> b!722447 (= res!484255 (or (= lt!320149 (MissingZero!7168 i!1173)) (= lt!320149 (MissingVacant!7168 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40896 (_ BitVec 32)) SeekEntryResult!7168)

(assert (=> b!722447 (= lt!320149 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!722448 () Bool)

(declare-fun res!484258 () Bool)

(assert (=> b!722448 (=> (not res!484258) (not e!404865))))

(assert (=> b!722448 (= res!484258 (validKeyInArray!0 k0!2102))))

(declare-fun b!722449 () Bool)

(declare-fun res!484256 () Bool)

(assert (=> b!722449 (=> (not res!484256) (not e!404866))))

(assert (=> b!722449 (= res!484256 e!404864)))

(declare-fun c!79464 () Bool)

(assert (=> b!722449 (= c!79464 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!722450 () Bool)

(declare-fun res!484253 () Bool)

(assert (=> b!722450 (=> (not res!484253) (not e!404865))))

(assert (=> b!722450 (= res!484253 (and (= (size!19992 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19992 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19992 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64298 res!484263) b!722450))

(assert (= (and b!722450 res!484253) b!722438))

(assert (= (and b!722438 res!484252) b!722448))

(assert (= (and b!722448 res!484258) b!722444))

(assert (= (and b!722444 res!484260) b!722447))

(assert (= (and b!722447 res!484255) b!722445))

(assert (= (and b!722445 res!484261) b!722439))

(assert (= (and b!722439 res!484262) b!722446))

(assert (= (and b!722446 res!484254) b!722437))

(assert (= (and b!722437 res!484257) b!722441))

(assert (= (and b!722441 res!484259) b!722449))

(assert (= (and b!722449 c!79464) b!722443))

(assert (= (and b!722449 (not c!79464)) b!722440))

(assert (= (and b!722449 res!484256) b!722442))

(declare-fun m!676433 () Bool)

(assert (=> b!722445 m!676433))

(declare-fun m!676435 () Bool)

(assert (=> b!722440 m!676435))

(assert (=> b!722440 m!676435))

(declare-fun m!676437 () Bool)

(assert (=> b!722440 m!676437))

(declare-fun m!676439 () Bool)

(assert (=> b!722442 m!676439))

(declare-fun m!676441 () Bool)

(assert (=> b!722442 m!676441))

(declare-fun m!676443 () Bool)

(assert (=> b!722442 m!676443))

(assert (=> b!722442 m!676443))

(declare-fun m!676445 () Bool)

(assert (=> b!722442 m!676445))

(declare-fun m!676447 () Bool)

(assert (=> b!722442 m!676447))

(declare-fun m!676449 () Bool)

(assert (=> b!722439 m!676449))

(declare-fun m!676451 () Bool)

(assert (=> b!722444 m!676451))

(declare-fun m!676453 () Bool)

(assert (=> start!64298 m!676453))

(declare-fun m!676455 () Bool)

(assert (=> start!64298 m!676455))

(assert (=> b!722437 m!676435))

(assert (=> b!722437 m!676435))

(declare-fun m!676457 () Bool)

(assert (=> b!722437 m!676457))

(assert (=> b!722437 m!676457))

(assert (=> b!722437 m!676435))

(declare-fun m!676459 () Bool)

(assert (=> b!722437 m!676459))

(assert (=> b!722443 m!676435))

(assert (=> b!722443 m!676435))

(declare-fun m!676461 () Bool)

(assert (=> b!722443 m!676461))

(declare-fun m!676463 () Bool)

(assert (=> b!722441 m!676463))

(declare-fun m!676465 () Bool)

(assert (=> b!722448 m!676465))

(assert (=> b!722438 m!676435))

(assert (=> b!722438 m!676435))

(declare-fun m!676467 () Bool)

(assert (=> b!722438 m!676467))

(declare-fun m!676469 () Bool)

(assert (=> b!722447 m!676469))

(check-sat (not b!722447) (not b!722445) (not start!64298) (not b!722438) (not b!722440) (not b!722444) (not b!722437) (not b!722442) (not b!722439) (not b!722448) (not b!722443))
(check-sat)
