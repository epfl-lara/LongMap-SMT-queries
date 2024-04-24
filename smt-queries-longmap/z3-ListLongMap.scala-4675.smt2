; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65238 () Bool)

(assert start!65238)

(declare-fun b!735565 () Bool)

(declare-fun res!493975 () Bool)

(declare-fun e!411634 () Bool)

(assert (=> b!735565 (=> (not res!493975) (not e!411634))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41281 0))(
  ( (array!41282 (arr!19750 (Array (_ BitVec 32) (_ BitVec 64))) (size!20170 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41281)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!735565 (= res!493975 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20170 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20170 a!3186))))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!411633 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!735566 () Bool)

(declare-datatypes ((SeekEntryResult!7306 0))(
  ( (MissingZero!7306 (index!31592 (_ BitVec 32))) (Found!7306 (index!31593 (_ BitVec 32))) (Intermediate!7306 (undefined!8118 Bool) (index!31594 (_ BitVec 32)) (x!62764 (_ BitVec 32))) (Undefined!7306) (MissingVacant!7306 (index!31595 (_ BitVec 32))) )
))
(declare-fun lt!325990 () SeekEntryResult!7306)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41281 (_ BitVec 32)) SeekEntryResult!7306)

(assert (=> b!735566 (= e!411633 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19750 a!3186) j!159) a!3186 mask!3328) lt!325990))))

(declare-fun b!735568 () Bool)

(declare-fun res!493979 () Bool)

(declare-fun e!411639 () Bool)

(assert (=> b!735568 (=> (not res!493979) (not e!411639))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!735568 (= res!493979 (validKeyInArray!0 k0!2102))))

(declare-fun b!735569 () Bool)

(declare-fun res!493987 () Bool)

(assert (=> b!735569 (=> (not res!493987) (not e!411639))))

(declare-fun arrayContainsKey!0 (array!41281 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!735569 (= res!493987 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!735570 () Bool)

(declare-fun res!493980 () Bool)

(assert (=> b!735570 (=> (not res!493980) (not e!411634))))

(declare-datatypes ((List!13659 0))(
  ( (Nil!13656) (Cons!13655 (h!14733 (_ BitVec 64)) (t!19966 List!13659)) )
))
(declare-fun arrayNoDuplicates!0 (array!41281 (_ BitVec 32) List!13659) Bool)

(assert (=> b!735570 (= res!493980 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13656))))

(declare-fun b!735571 () Bool)

(declare-fun res!493976 () Bool)

(assert (=> b!735571 (=> (not res!493976) (not e!411639))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!735571 (= res!493976 (and (= (size!20170 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20170 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20170 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!735572 () Bool)

(declare-fun e!411636 () Bool)

(declare-fun e!411642 () Bool)

(assert (=> b!735572 (= e!411636 (not e!411642))))

(declare-fun res!493978 () Bool)

(assert (=> b!735572 (=> res!493978 e!411642)))

(declare-fun lt!325991 () SeekEntryResult!7306)

(get-info :version)

(assert (=> b!735572 (= res!493978 (or (not ((_ is Intermediate!7306) lt!325991)) (bvsge x!1131 (x!62764 lt!325991))))))

(declare-fun e!411641 () Bool)

(assert (=> b!735572 e!411641))

(declare-fun res!493984 () Bool)

(assert (=> b!735572 (=> (not res!493984) (not e!411641))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41281 (_ BitVec 32)) Bool)

(assert (=> b!735572 (= res!493984 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25009 0))(
  ( (Unit!25010) )
))
(declare-fun lt!325984 () Unit!25009)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41281 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25009)

(assert (=> b!735572 (= lt!325984 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!735573 () Bool)

(declare-fun e!411635 () Bool)

(assert (=> b!735573 (= e!411641 e!411635)))

(declare-fun res!493982 () Bool)

(assert (=> b!735573 (=> (not res!493982) (not e!411635))))

(declare-fun lt!325987 () SeekEntryResult!7306)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41281 (_ BitVec 32)) SeekEntryResult!7306)

(assert (=> b!735573 (= res!493982 (= (seekEntryOrOpen!0 (select (arr!19750 a!3186) j!159) a!3186 mask!3328) lt!325987))))

(assert (=> b!735573 (= lt!325987 (Found!7306 j!159))))

(declare-fun b!735574 () Bool)

(declare-fun res!493981 () Bool)

(declare-fun e!411640 () Bool)

(assert (=> b!735574 (=> (not res!493981) (not e!411640))))

(assert (=> b!735574 (= res!493981 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19750 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!735575 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41281 (_ BitVec 32)) SeekEntryResult!7306)

(assert (=> b!735575 (= e!411633 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19750 a!3186) j!159) a!3186 mask!3328) (Found!7306 j!159)))))

(declare-fun b!735576 () Bool)

(assert (=> b!735576 (= e!411635 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19750 a!3186) j!159) a!3186 mask!3328) lt!325987))))

(declare-fun b!735577 () Bool)

(declare-fun res!493989 () Bool)

(assert (=> b!735577 (=> (not res!493989) (not e!411634))))

(assert (=> b!735577 (= res!493989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!735578 () Bool)

(declare-fun e!411637 () Bool)

(assert (=> b!735578 (= e!411637 true)))

(declare-fun lt!325988 () SeekEntryResult!7306)

(assert (=> b!735578 (= lt!325988 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19750 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!735567 () Bool)

(assert (=> b!735567 (= e!411639 e!411634)))

(declare-fun res!493985 () Bool)

(assert (=> b!735567 (=> (not res!493985) (not e!411634))))

(declare-fun lt!325983 () SeekEntryResult!7306)

(assert (=> b!735567 (= res!493985 (or (= lt!325983 (MissingZero!7306 i!1173)) (= lt!325983 (MissingVacant!7306 i!1173))))))

(assert (=> b!735567 (= lt!325983 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!493977 () Bool)

(assert (=> start!65238 (=> (not res!493977) (not e!411639))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65238 (= res!493977 (validMask!0 mask!3328))))

(assert (=> start!65238 e!411639))

(assert (=> start!65238 true))

(declare-fun array_inv!15609 (array!41281) Bool)

(assert (=> start!65238 (array_inv!15609 a!3186)))

(declare-fun b!735579 () Bool)

(assert (=> b!735579 (= e!411634 e!411640)))

(declare-fun res!493974 () Bool)

(assert (=> b!735579 (=> (not res!493974) (not e!411640))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735579 (= res!493974 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19750 a!3186) j!159) mask!3328) (select (arr!19750 a!3186) j!159) a!3186 mask!3328) lt!325990))))

(assert (=> b!735579 (= lt!325990 (Intermediate!7306 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!735580 () Bool)

(declare-fun res!493990 () Bool)

(assert (=> b!735580 (=> (not res!493990) (not e!411639))))

(assert (=> b!735580 (= res!493990 (validKeyInArray!0 (select (arr!19750 a!3186) j!159)))))

(declare-fun b!735581 () Bool)

(assert (=> b!735581 (= e!411642 e!411637)))

(declare-fun res!493988 () Bool)

(assert (=> b!735581 (=> res!493988 e!411637)))

(assert (=> b!735581 (= res!493988 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!325992 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735581 (= lt!325992 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!735582 () Bool)

(declare-fun res!493983 () Bool)

(assert (=> b!735582 (=> (not res!493983) (not e!411640))))

(assert (=> b!735582 (= res!493983 e!411633)))

(declare-fun c!81179 () Bool)

(assert (=> b!735582 (= c!81179 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!735583 () Bool)

(assert (=> b!735583 (= e!411640 e!411636)))

(declare-fun res!493986 () Bool)

(assert (=> b!735583 (=> (not res!493986) (not e!411636))))

(declare-fun lt!325985 () SeekEntryResult!7306)

(assert (=> b!735583 (= res!493986 (= lt!325985 lt!325991))))

(declare-fun lt!325986 () array!41281)

(declare-fun lt!325989 () (_ BitVec 64))

(assert (=> b!735583 (= lt!325991 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325989 lt!325986 mask!3328))))

(assert (=> b!735583 (= lt!325985 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325989 mask!3328) lt!325989 lt!325986 mask!3328))))

(assert (=> b!735583 (= lt!325989 (select (store (arr!19750 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!735583 (= lt!325986 (array!41282 (store (arr!19750 a!3186) i!1173 k0!2102) (size!20170 a!3186)))))

(assert (= (and start!65238 res!493977) b!735571))

(assert (= (and b!735571 res!493976) b!735580))

(assert (= (and b!735580 res!493990) b!735568))

(assert (= (and b!735568 res!493979) b!735569))

(assert (= (and b!735569 res!493987) b!735567))

(assert (= (and b!735567 res!493985) b!735577))

(assert (= (and b!735577 res!493989) b!735570))

(assert (= (and b!735570 res!493980) b!735565))

(assert (= (and b!735565 res!493975) b!735579))

(assert (= (and b!735579 res!493974) b!735574))

(assert (= (and b!735574 res!493981) b!735582))

(assert (= (and b!735582 c!81179) b!735566))

(assert (= (and b!735582 (not c!81179)) b!735575))

(assert (= (and b!735582 res!493983) b!735583))

(assert (= (and b!735583 res!493986) b!735572))

(assert (= (and b!735572 res!493984) b!735573))

(assert (= (and b!735573 res!493982) b!735576))

(assert (= (and b!735572 (not res!493978)) b!735581))

(assert (= (and b!735581 (not res!493988)) b!735578))

(declare-fun m!688491 () Bool)

(assert (=> b!735581 m!688491))

(declare-fun m!688493 () Bool)

(assert (=> b!735579 m!688493))

(assert (=> b!735579 m!688493))

(declare-fun m!688495 () Bool)

(assert (=> b!735579 m!688495))

(assert (=> b!735579 m!688495))

(assert (=> b!735579 m!688493))

(declare-fun m!688497 () Bool)

(assert (=> b!735579 m!688497))

(declare-fun m!688499 () Bool)

(assert (=> b!735577 m!688499))

(declare-fun m!688501 () Bool)

(assert (=> b!735574 m!688501))

(assert (=> b!735578 m!688493))

(assert (=> b!735578 m!688493))

(declare-fun m!688503 () Bool)

(assert (=> b!735578 m!688503))

(declare-fun m!688505 () Bool)

(assert (=> b!735567 m!688505))

(declare-fun m!688507 () Bool)

(assert (=> b!735568 m!688507))

(declare-fun m!688509 () Bool)

(assert (=> b!735583 m!688509))

(assert (=> b!735583 m!688509))

(declare-fun m!688511 () Bool)

(assert (=> b!735583 m!688511))

(declare-fun m!688513 () Bool)

(assert (=> b!735583 m!688513))

(declare-fun m!688515 () Bool)

(assert (=> b!735583 m!688515))

(declare-fun m!688517 () Bool)

(assert (=> b!735583 m!688517))

(declare-fun m!688519 () Bool)

(assert (=> b!735570 m!688519))

(assert (=> b!735566 m!688493))

(assert (=> b!735566 m!688493))

(declare-fun m!688521 () Bool)

(assert (=> b!735566 m!688521))

(assert (=> b!735580 m!688493))

(assert (=> b!735580 m!688493))

(declare-fun m!688523 () Bool)

(assert (=> b!735580 m!688523))

(assert (=> b!735575 m!688493))

(assert (=> b!735575 m!688493))

(assert (=> b!735575 m!688503))

(assert (=> b!735576 m!688493))

(assert (=> b!735576 m!688493))

(declare-fun m!688525 () Bool)

(assert (=> b!735576 m!688525))

(declare-fun m!688527 () Bool)

(assert (=> b!735572 m!688527))

(declare-fun m!688529 () Bool)

(assert (=> b!735572 m!688529))

(declare-fun m!688531 () Bool)

(assert (=> start!65238 m!688531))

(declare-fun m!688533 () Bool)

(assert (=> start!65238 m!688533))

(declare-fun m!688535 () Bool)

(assert (=> b!735569 m!688535))

(assert (=> b!735573 m!688493))

(assert (=> b!735573 m!688493))

(declare-fun m!688537 () Bool)

(assert (=> b!735573 m!688537))

(check-sat (not b!735570) (not b!735580) (not b!735578) (not b!735575) (not b!735573) (not b!735576) (not b!735579) (not b!735567) (not b!735583) (not b!735568) (not b!735581) (not b!735572) (not b!735577) (not b!735569) (not b!735566) (not start!65238))
(check-sat)
