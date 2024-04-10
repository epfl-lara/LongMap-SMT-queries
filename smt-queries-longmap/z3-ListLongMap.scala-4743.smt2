; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65520 () Bool)

(assert start!65520)

(declare-fun b!747600 () Bool)

(declare-fun res!504186 () Bool)

(declare-fun e!417381 () Bool)

(assert (=> b!747600 (=> (not res!504186) (not e!417381))))

(declare-datatypes ((array!41693 0))(
  ( (array!41694 (arr!19960 (Array (_ BitVec 32) (_ BitVec 64))) (size!20381 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41693)

(declare-datatypes ((List!13962 0))(
  ( (Nil!13959) (Cons!13958 (h!15030 (_ BitVec 64)) (t!20277 List!13962)) )
))
(declare-fun arrayNoDuplicates!0 (array!41693 (_ BitVec 32) List!13962) Bool)

(assert (=> b!747600 (= res!504186 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13959))))

(declare-fun b!747601 () Bool)

(declare-fun e!417386 () Bool)

(declare-fun lt!332307 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!747601 (= e!417386 (validKeyInArray!0 lt!332307))))

(declare-fun res!504195 () Bool)

(declare-fun e!417383 () Bool)

(assert (=> start!65520 (=> (not res!504195) (not e!417383))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65520 (= res!504195 (validMask!0 mask!3328))))

(assert (=> start!65520 e!417383))

(assert (=> start!65520 true))

(declare-fun array_inv!15756 (array!41693) Bool)

(assert (=> start!65520 (array_inv!15756 a!3186)))

(declare-fun b!747602 () Bool)

(declare-fun res!504190 () Bool)

(declare-fun e!417382 () Bool)

(assert (=> b!747602 (=> (not res!504190) (not e!417382))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!747602 (= res!504190 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19960 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!417377 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7560 0))(
  ( (MissingZero!7560 (index!32608 (_ BitVec 32))) (Found!7560 (index!32609 (_ BitVec 32))) (Intermediate!7560 (undefined!8372 Bool) (index!32610 (_ BitVec 32)) (x!63550 (_ BitVec 32))) (Undefined!7560) (MissingVacant!7560 (index!32611 (_ BitVec 32))) )
))
(declare-fun lt!332314 () SeekEntryResult!7560)

(declare-fun b!747603 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41693 (_ BitVec 32)) SeekEntryResult!7560)

(assert (=> b!747603 (= e!417377 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19960 a!3186) j!159) a!3186 mask!3328) lt!332314))))

(declare-fun b!747604 () Bool)

(assert (=> b!747604 (= e!417381 e!417382)))

(declare-fun res!504183 () Bool)

(assert (=> b!747604 (=> (not res!504183) (not e!417382))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!747604 (= res!504183 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19960 a!3186) j!159) mask!3328) (select (arr!19960 a!3186) j!159) a!3186 mask!3328) lt!332314))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!747604 (= lt!332314 (Intermediate!7560 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!747605 () Bool)

(declare-fun res!504196 () Bool)

(assert (=> b!747605 (=> (not res!504196) (not e!417383))))

(assert (=> b!747605 (= res!504196 (validKeyInArray!0 (select (arr!19960 a!3186) j!159)))))

(declare-fun b!747606 () Bool)

(declare-fun res!504199 () Bool)

(declare-fun e!417380 () Bool)

(assert (=> b!747606 (=> res!504199 e!417380)))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!747606 (= res!504199 (= (select (store (arr!19960 a!3186) i!1173 k0!2102) index!1321) lt!332307))))

(declare-fun b!747607 () Bool)

(declare-fun res!504184 () Bool)

(assert (=> b!747607 (=> (not res!504184) (not e!417381))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41693 (_ BitVec 32)) Bool)

(assert (=> b!747607 (= res!504184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!747608 () Bool)

(declare-fun res!504193 () Bool)

(assert (=> b!747608 (=> (not res!504193) (not e!417383))))

(assert (=> b!747608 (= res!504193 (validKeyInArray!0 k0!2102))))

(declare-fun b!747609 () Bool)

(declare-fun res!504188 () Bool)

(assert (=> b!747609 (=> res!504188 e!417380)))

(declare-fun lt!332306 () SeekEntryResult!7560)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41693 (_ BitVec 32)) SeekEntryResult!7560)

(assert (=> b!747609 (= res!504188 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19960 a!3186) j!159) a!3186 mask!3328) lt!332306)))))

(declare-fun b!747610 () Bool)

(declare-fun res!504185 () Bool)

(assert (=> b!747610 (=> (not res!504185) (not e!417381))))

(assert (=> b!747610 (= res!504185 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20381 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20381 a!3186))))))

(declare-fun b!747611 () Bool)

(declare-fun res!504194 () Bool)

(assert (=> b!747611 (=> (not res!504194) (not e!417383))))

(declare-fun arrayContainsKey!0 (array!41693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!747611 (= res!504194 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!747612 () Bool)

(assert (=> b!747612 (= e!417380 e!417386)))

(declare-fun res!504187 () Bool)

(assert (=> b!747612 (=> res!504187 e!417386)))

(assert (=> b!747612 (= res!504187 (bvslt mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!747612 (= (select (store (arr!19960 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!25620 0))(
  ( (Unit!25621) )
))
(declare-fun lt!332310 () Unit!25620)

(declare-fun e!417385 () Unit!25620)

(assert (=> b!747612 (= lt!332310 e!417385)))

(declare-fun c!82090 () Bool)

(assert (=> b!747612 (= c!82090 (= (select (store (arr!19960 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!747613 () Bool)

(declare-fun e!417384 () Bool)

(assert (=> b!747613 (= e!417384 (not e!417380))))

(declare-fun res!504189 () Bool)

(assert (=> b!747613 (=> res!504189 e!417380)))

(declare-fun lt!332313 () SeekEntryResult!7560)

(get-info :version)

(assert (=> b!747613 (= res!504189 (or (not ((_ is Intermediate!7560) lt!332313)) (bvslt x!1131 (x!63550 lt!332313)) (not (= x!1131 (x!63550 lt!332313))) (not (= index!1321 (index!32610 lt!332313)))))))

(declare-fun e!417378 () Bool)

(assert (=> b!747613 e!417378))

(declare-fun res!504197 () Bool)

(assert (=> b!747613 (=> (not res!504197) (not e!417378))))

(declare-fun lt!332308 () SeekEntryResult!7560)

(assert (=> b!747613 (= res!504197 (= lt!332308 lt!332306))))

(assert (=> b!747613 (= lt!332306 (Found!7560 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41693 (_ BitVec 32)) SeekEntryResult!7560)

(assert (=> b!747613 (= lt!332308 (seekEntryOrOpen!0 (select (arr!19960 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!747613 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332311 () Unit!25620)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41693 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25620)

(assert (=> b!747613 (= lt!332311 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!747614 () Bool)

(assert (=> b!747614 (= e!417383 e!417381)))

(declare-fun res!504191 () Bool)

(assert (=> b!747614 (=> (not res!504191) (not e!417381))))

(declare-fun lt!332315 () SeekEntryResult!7560)

(assert (=> b!747614 (= res!504191 (or (= lt!332315 (MissingZero!7560 i!1173)) (= lt!332315 (MissingVacant!7560 i!1173))))))

(assert (=> b!747614 (= lt!332315 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!747615 () Bool)

(declare-fun Unit!25622 () Unit!25620)

(assert (=> b!747615 (= e!417385 Unit!25622)))

(declare-fun b!747616 () Bool)

(declare-fun res!504200 () Bool)

(assert (=> b!747616 (=> (not res!504200) (not e!417382))))

(assert (=> b!747616 (= res!504200 e!417377)))

(declare-fun c!82089 () Bool)

(assert (=> b!747616 (= c!82089 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!747617 () Bool)

(declare-fun res!504198 () Bool)

(assert (=> b!747617 (=> (not res!504198) (not e!417383))))

(assert (=> b!747617 (= res!504198 (and (= (size!20381 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20381 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20381 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!747618 () Bool)

(assert (=> b!747618 (= e!417377 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19960 a!3186) j!159) a!3186 mask!3328) (Found!7560 j!159)))))

(declare-fun b!747619 () Bool)

(assert (=> b!747619 (= e!417382 e!417384)))

(declare-fun res!504192 () Bool)

(assert (=> b!747619 (=> (not res!504192) (not e!417384))))

(declare-fun lt!332309 () SeekEntryResult!7560)

(assert (=> b!747619 (= res!504192 (= lt!332309 lt!332313))))

(declare-fun lt!332312 () array!41693)

(assert (=> b!747619 (= lt!332313 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332307 lt!332312 mask!3328))))

(assert (=> b!747619 (= lt!332309 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332307 mask!3328) lt!332307 lt!332312 mask!3328))))

(assert (=> b!747619 (= lt!332307 (select (store (arr!19960 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!747619 (= lt!332312 (array!41694 (store (arr!19960 a!3186) i!1173 k0!2102) (size!20381 a!3186)))))

(declare-fun b!747620 () Bool)

(declare-fun Unit!25623 () Unit!25620)

(assert (=> b!747620 (= e!417385 Unit!25623)))

(assert (=> b!747620 false))

(declare-fun b!747621 () Bool)

(assert (=> b!747621 (= e!417378 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19960 a!3186) j!159) a!3186 mask!3328) lt!332306))))

(assert (= (and start!65520 res!504195) b!747617))

(assert (= (and b!747617 res!504198) b!747605))

(assert (= (and b!747605 res!504196) b!747608))

(assert (= (and b!747608 res!504193) b!747611))

(assert (= (and b!747611 res!504194) b!747614))

(assert (= (and b!747614 res!504191) b!747607))

(assert (= (and b!747607 res!504184) b!747600))

(assert (= (and b!747600 res!504186) b!747610))

(assert (= (and b!747610 res!504185) b!747604))

(assert (= (and b!747604 res!504183) b!747602))

(assert (= (and b!747602 res!504190) b!747616))

(assert (= (and b!747616 c!82089) b!747603))

(assert (= (and b!747616 (not c!82089)) b!747618))

(assert (= (and b!747616 res!504200) b!747619))

(assert (= (and b!747619 res!504192) b!747613))

(assert (= (and b!747613 res!504197) b!747621))

(assert (= (and b!747613 (not res!504189)) b!747609))

(assert (= (and b!747609 (not res!504188)) b!747606))

(assert (= (and b!747606 (not res!504199)) b!747612))

(assert (= (and b!747612 c!82090) b!747620))

(assert (= (and b!747612 (not c!82090)) b!747615))

(assert (= (and b!747612 (not res!504187)) b!747601))

(declare-fun m!697641 () Bool)

(assert (=> b!747613 m!697641))

(assert (=> b!747613 m!697641))

(declare-fun m!697643 () Bool)

(assert (=> b!747613 m!697643))

(declare-fun m!697645 () Bool)

(assert (=> b!747613 m!697645))

(declare-fun m!697647 () Bool)

(assert (=> b!747613 m!697647))

(assert (=> b!747605 m!697641))

(assert (=> b!747605 m!697641))

(declare-fun m!697649 () Bool)

(assert (=> b!747605 m!697649))

(declare-fun m!697651 () Bool)

(assert (=> b!747601 m!697651))

(declare-fun m!697653 () Bool)

(assert (=> b!747612 m!697653))

(declare-fun m!697655 () Bool)

(assert (=> b!747612 m!697655))

(declare-fun m!697657 () Bool)

(assert (=> b!747608 m!697657))

(assert (=> b!747621 m!697641))

(assert (=> b!747621 m!697641))

(declare-fun m!697659 () Bool)

(assert (=> b!747621 m!697659))

(assert (=> b!747603 m!697641))

(assert (=> b!747603 m!697641))

(declare-fun m!697661 () Bool)

(assert (=> b!747603 m!697661))

(declare-fun m!697663 () Bool)

(assert (=> start!65520 m!697663))

(declare-fun m!697665 () Bool)

(assert (=> start!65520 m!697665))

(assert (=> b!747618 m!697641))

(assert (=> b!747618 m!697641))

(declare-fun m!697667 () Bool)

(assert (=> b!747618 m!697667))

(declare-fun m!697669 () Bool)

(assert (=> b!747600 m!697669))

(assert (=> b!747609 m!697641))

(assert (=> b!747609 m!697641))

(assert (=> b!747609 m!697667))

(declare-fun m!697671 () Bool)

(assert (=> b!747619 m!697671))

(declare-fun m!697673 () Bool)

(assert (=> b!747619 m!697673))

(declare-fun m!697675 () Bool)

(assert (=> b!747619 m!697675))

(assert (=> b!747619 m!697653))

(declare-fun m!697677 () Bool)

(assert (=> b!747619 m!697677))

(assert (=> b!747619 m!697671))

(declare-fun m!697679 () Bool)

(assert (=> b!747614 m!697679))

(assert (=> b!747606 m!697653))

(assert (=> b!747606 m!697655))

(declare-fun m!697681 () Bool)

(assert (=> b!747611 m!697681))

(declare-fun m!697683 () Bool)

(assert (=> b!747602 m!697683))

(assert (=> b!747604 m!697641))

(assert (=> b!747604 m!697641))

(declare-fun m!697685 () Bool)

(assert (=> b!747604 m!697685))

(assert (=> b!747604 m!697685))

(assert (=> b!747604 m!697641))

(declare-fun m!697687 () Bool)

(assert (=> b!747604 m!697687))

(declare-fun m!697689 () Bool)

(assert (=> b!747607 m!697689))

(check-sat (not b!747604) (not b!747608) (not b!747603) (not start!65520) (not b!747614) (not b!747609) (not b!747601) (not b!747605) (not b!747618) (not b!747621) (not b!747607) (not b!747600) (not b!747613) (not b!747619) (not b!747611))
(check-sat)
