; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64250 () Bool)

(assert start!64250)

(declare-fun b!721445 () Bool)

(declare-fun res!483406 () Bool)

(declare-fun e!404505 () Bool)

(assert (=> b!721445 (=> (not res!483406) (not e!404505))))

(declare-datatypes ((array!40848 0))(
  ( (array!40849 (arr!19547 (Array (_ BitVec 32) (_ BitVec 64))) (size!19968 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40848)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!721445 (= res!483406 (validKeyInArray!0 (select (arr!19547 a!3186) j!159)))))

(declare-fun res!483412 () Bool)

(assert (=> start!64250 (=> (not res!483412) (not e!404505))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64250 (= res!483412 (validMask!0 mask!3328))))

(assert (=> start!64250 e!404505))

(assert (=> start!64250 true))

(declare-fun array_inv!15430 (array!40848) Bool)

(assert (=> start!64250 (array_inv!15430 a!3186)))

(declare-fun b!721446 () Bool)

(declare-fun e!404504 () Bool)

(assert (=> b!721446 (= e!404504 false)))

(declare-fun lt!319897 () Bool)

(declare-fun e!404503 () Bool)

(assert (=> b!721446 (= lt!319897 e!404503)))

(declare-fun c!79392 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!721446 (= c!79392 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!721447 () Bool)

(declare-fun res!483410 () Bool)

(declare-fun e!404502 () Bool)

(assert (=> b!721447 (=> (not res!483410) (not e!404502))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40848 (_ BitVec 32)) Bool)

(assert (=> b!721447 (= res!483410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!721448 () Bool)

(declare-fun res!483413 () Bool)

(assert (=> b!721448 (=> (not res!483413) (not e!404505))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40848 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!721448 (= res!483413 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!721449 () Bool)

(declare-fun res!483414 () Bool)

(assert (=> b!721449 (=> (not res!483414) (not e!404505))))

(assert (=> b!721449 (= res!483414 (validKeyInArray!0 k0!2102))))

(declare-fun b!721450 () Bool)

(assert (=> b!721450 (= e!404505 e!404502)))

(declare-fun res!483405 () Bool)

(assert (=> b!721450 (=> (not res!483405) (not e!404502))))

(declare-datatypes ((SeekEntryResult!7144 0))(
  ( (MissingZero!7144 (index!30944 (_ BitVec 32))) (Found!7144 (index!30945 (_ BitVec 32))) (Intermediate!7144 (undefined!7956 Bool) (index!30946 (_ BitVec 32)) (x!61964 (_ BitVec 32))) (Undefined!7144) (MissingVacant!7144 (index!30947 (_ BitVec 32))) )
))
(declare-fun lt!319896 () SeekEntryResult!7144)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!721450 (= res!483405 (or (= lt!319896 (MissingZero!7144 i!1173)) (= lt!319896 (MissingVacant!7144 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40848 (_ BitVec 32)) SeekEntryResult!7144)

(assert (=> b!721450 (= lt!319896 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!721451 () Bool)

(declare-fun res!483407 () Bool)

(assert (=> b!721451 (=> (not res!483407) (not e!404502))))

(declare-datatypes ((List!13588 0))(
  ( (Nil!13585) (Cons!13584 (h!14638 (_ BitVec 64)) (t!19894 List!13588)) )
))
(declare-fun arrayNoDuplicates!0 (array!40848 (_ BitVec 32) List!13588) Bool)

(assert (=> b!721451 (= res!483407 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13585))))

(declare-fun b!721452 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!319898 () SeekEntryResult!7144)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40848 (_ BitVec 32)) SeekEntryResult!7144)

(assert (=> b!721452 (= e!404503 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19547 a!3186) j!159) a!3186 mask!3328) lt!319898)))))

(declare-fun b!721453 () Bool)

(declare-fun res!483409 () Bool)

(assert (=> b!721453 (=> (not res!483409) (not e!404505))))

(assert (=> b!721453 (= res!483409 (and (= (size!19968 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19968 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19968 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!721454 () Bool)

(declare-fun res!483404 () Bool)

(assert (=> b!721454 (=> (not res!483404) (not e!404504))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!721454 (= res!483404 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19547 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!721455 () Bool)

(declare-fun res!483408 () Bool)

(assert (=> b!721455 (=> (not res!483408) (not e!404502))))

(assert (=> b!721455 (= res!483408 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19968 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19968 a!3186))))))

(declare-fun b!721456 () Bool)

(assert (=> b!721456 (= e!404502 e!404504)))

(declare-fun res!483411 () Bool)

(assert (=> b!721456 (=> (not res!483411) (not e!404504))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!721456 (= res!483411 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19547 a!3186) j!159) mask!3328) (select (arr!19547 a!3186) j!159) a!3186 mask!3328) lt!319898))))

(assert (=> b!721456 (= lt!319898 (Intermediate!7144 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!721457 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40848 (_ BitVec 32)) SeekEntryResult!7144)

(assert (=> b!721457 (= e!404503 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19547 a!3186) j!159) a!3186 mask!3328) (Found!7144 j!159))))))

(assert (= (and start!64250 res!483412) b!721453))

(assert (= (and b!721453 res!483409) b!721445))

(assert (= (and b!721445 res!483406) b!721449))

(assert (= (and b!721449 res!483414) b!721448))

(assert (= (and b!721448 res!483413) b!721450))

(assert (= (and b!721450 res!483405) b!721447))

(assert (= (and b!721447 res!483410) b!721451))

(assert (= (and b!721451 res!483407) b!721455))

(assert (= (and b!721455 res!483408) b!721456))

(assert (= (and b!721456 res!483411) b!721454))

(assert (= (and b!721454 res!483404) b!721446))

(assert (= (and b!721446 c!79392) b!721452))

(assert (= (and b!721446 (not c!79392)) b!721457))

(declare-fun m!675683 () Bool)

(assert (=> start!64250 m!675683))

(declare-fun m!675685 () Bool)

(assert (=> start!64250 m!675685))

(declare-fun m!675687 () Bool)

(assert (=> b!721449 m!675687))

(declare-fun m!675689 () Bool)

(assert (=> b!721448 m!675689))

(declare-fun m!675691 () Bool)

(assert (=> b!721457 m!675691))

(assert (=> b!721457 m!675691))

(declare-fun m!675693 () Bool)

(assert (=> b!721457 m!675693))

(declare-fun m!675695 () Bool)

(assert (=> b!721451 m!675695))

(assert (=> b!721456 m!675691))

(assert (=> b!721456 m!675691))

(declare-fun m!675697 () Bool)

(assert (=> b!721456 m!675697))

(assert (=> b!721456 m!675697))

(assert (=> b!721456 m!675691))

(declare-fun m!675699 () Bool)

(assert (=> b!721456 m!675699))

(assert (=> b!721452 m!675691))

(assert (=> b!721452 m!675691))

(declare-fun m!675701 () Bool)

(assert (=> b!721452 m!675701))

(declare-fun m!675703 () Bool)

(assert (=> b!721447 m!675703))

(declare-fun m!675705 () Bool)

(assert (=> b!721450 m!675705))

(declare-fun m!675707 () Bool)

(assert (=> b!721454 m!675707))

(assert (=> b!721445 m!675691))

(assert (=> b!721445 m!675691))

(declare-fun m!675709 () Bool)

(assert (=> b!721445 m!675709))

(check-sat (not start!64250) (not b!721449) (not b!721450) (not b!721445) (not b!721452) (not b!721447) (not b!721448) (not b!721451) (not b!721457) (not b!721456))
(check-sat)
