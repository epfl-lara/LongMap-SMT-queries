; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65754 () Bool)

(assert start!65754)

(declare-fun b!751780 () Bool)

(declare-fun e!419471 () Bool)

(declare-fun e!419475 () Bool)

(assert (=> b!751780 (= e!419471 e!419475)))

(declare-fun res!507304 () Bool)

(assert (=> b!751780 (=> res!507304 e!419475)))

(declare-fun lt!334295 () (_ BitVec 64))

(declare-fun lt!334299 () (_ BitVec 64))

(assert (=> b!751780 (= res!507304 (= lt!334295 lt!334299))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-datatypes ((array!41797 0))(
  ( (array!41798 (arr!20008 (Array (_ BitVec 32) (_ BitVec 64))) (size!20428 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41797)

(assert (=> b!751780 (= lt!334295 (select (store (arr!20008 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!751781 () Bool)

(declare-fun e!419473 () Bool)

(declare-datatypes ((SeekEntryResult!7564 0))(
  ( (MissingZero!7564 (index!32624 (_ BitVec 32))) (Found!7564 (index!32625 (_ BitVec 32))) (Intermediate!7564 (undefined!8376 Bool) (index!32626 (_ BitVec 32)) (x!63710 (_ BitVec 32))) (Undefined!7564) (MissingVacant!7564 (index!32627 (_ BitVec 32))) )
))
(declare-fun lt!334302 () SeekEntryResult!7564)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41797 (_ BitVec 32)) SeekEntryResult!7564)

(assert (=> b!751781 (= e!419473 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20008 a!3186) j!159) a!3186 mask!3328) lt!334302))))

(declare-fun b!751782 () Bool)

(declare-fun res!507291 () Bool)

(declare-fun e!419474 () Bool)

(assert (=> b!751782 (=> (not res!507291) (not e!419474))))

(declare-datatypes ((List!13917 0))(
  ( (Nil!13914) (Cons!13913 (h!14991 (_ BitVec 64)) (t!20224 List!13917)) )
))
(declare-fun arrayNoDuplicates!0 (array!41797 (_ BitVec 32) List!13917) Bool)

(assert (=> b!751782 (= res!507291 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13914))))

(declare-fun b!751783 () Bool)

(declare-fun e!419469 () Bool)

(assert (=> b!751783 (= e!419469 e!419474)))

(declare-fun res!507299 () Bool)

(assert (=> b!751783 (=> (not res!507299) (not e!419474))))

(declare-fun lt!334293 () SeekEntryResult!7564)

(assert (=> b!751783 (= res!507299 (or (= lt!334293 (MissingZero!7564 i!1173)) (= lt!334293 (MissingVacant!7564 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41797 (_ BitVec 32)) SeekEntryResult!7564)

(assert (=> b!751783 (= lt!334293 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!751784 () Bool)

(declare-fun e!419466 () Bool)

(declare-fun e!419465 () Bool)

(assert (=> b!751784 (= e!419466 e!419465)))

(declare-fun res!507290 () Bool)

(assert (=> b!751784 (=> (not res!507290) (not e!419465))))

(declare-fun lt!334294 () SeekEntryResult!7564)

(declare-fun lt!334296 () SeekEntryResult!7564)

(assert (=> b!751784 (= res!507290 (= lt!334294 lt!334296))))

(declare-fun lt!334301 () array!41797)

(assert (=> b!751784 (= lt!334296 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334299 lt!334301 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!751784 (= lt!334294 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334299 mask!3328) lt!334299 lt!334301 mask!3328))))

(assert (=> b!751784 (= lt!334299 (select (store (arr!20008 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!751784 (= lt!334301 (array!41798 (store (arr!20008 a!3186) i!1173 k0!2102) (size!20428 a!3186)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!751785 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41797 (_ BitVec 32)) SeekEntryResult!7564)

(assert (=> b!751785 (= e!419473 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20008 a!3186) j!159) a!3186 mask!3328) (Found!7564 j!159)))))

(declare-fun b!751786 () Bool)

(assert (=> b!751786 (= e!419474 e!419466)))

(declare-fun res!507287 () Bool)

(assert (=> b!751786 (=> (not res!507287) (not e!419466))))

(assert (=> b!751786 (= res!507287 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20008 a!3186) j!159) mask!3328) (select (arr!20008 a!3186) j!159) a!3186 mask!3328) lt!334302))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!751786 (= lt!334302 (Intermediate!7564 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!751787 () Bool)

(declare-fun res!507295 () Bool)

(assert (=> b!751787 (=> (not res!507295) (not e!419469))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!751787 (= res!507295 (validKeyInArray!0 k0!2102))))

(declare-fun b!751788 () Bool)

(declare-datatypes ((Unit!25813 0))(
  ( (Unit!25814) )
))
(declare-fun e!419472 () Unit!25813)

(declare-fun Unit!25815 () Unit!25813)

(assert (=> b!751788 (= e!419472 Unit!25815)))

(declare-fun res!507297 () Bool)

(assert (=> start!65754 (=> (not res!507297) (not e!419469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65754 (= res!507297 (validMask!0 mask!3328))))

(assert (=> start!65754 e!419469))

(assert (=> start!65754 true))

(declare-fun array_inv!15867 (array!41797) Bool)

(assert (=> start!65754 (array_inv!15867 a!3186)))

(declare-fun b!751789 () Bool)

(declare-fun res!507288 () Bool)

(assert (=> b!751789 (=> res!507288 e!419471)))

(declare-fun lt!334298 () SeekEntryResult!7564)

(assert (=> b!751789 (= res!507288 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20008 a!3186) j!159) a!3186 mask!3328) lt!334298)))))

(declare-fun b!751790 () Bool)

(declare-fun res!507292 () Bool)

(assert (=> b!751790 (=> (not res!507292) (not e!419474))))

(assert (=> b!751790 (= res!507292 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20428 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20428 a!3186))))))

(declare-fun b!751791 () Bool)

(declare-fun res!507298 () Bool)

(assert (=> b!751791 (=> (not res!507298) (not e!419466))))

(assert (=> b!751791 (= res!507298 e!419473)))

(declare-fun c!82630 () Bool)

(assert (=> b!751791 (= c!82630 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!751792 () Bool)

(assert (=> b!751792 (= e!419465 (not e!419471))))

(declare-fun res!507293 () Bool)

(assert (=> b!751792 (=> res!507293 e!419471)))

(get-info :version)

(assert (=> b!751792 (= res!507293 (or (not ((_ is Intermediate!7564) lt!334296)) (bvslt x!1131 (x!63710 lt!334296)) (not (= x!1131 (x!63710 lt!334296))) (not (= index!1321 (index!32626 lt!334296)))))))

(declare-fun e!419467 () Bool)

(assert (=> b!751792 e!419467))

(declare-fun res!507300 () Bool)

(assert (=> b!751792 (=> (not res!507300) (not e!419467))))

(declare-fun lt!334300 () SeekEntryResult!7564)

(assert (=> b!751792 (= res!507300 (= lt!334300 lt!334298))))

(assert (=> b!751792 (= lt!334298 (Found!7564 j!159))))

(assert (=> b!751792 (= lt!334300 (seekEntryOrOpen!0 (select (arr!20008 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41797 (_ BitVec 32)) Bool)

(assert (=> b!751792 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334292 () Unit!25813)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41797 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25813)

(assert (=> b!751792 (= lt!334292 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!751793 () Bool)

(declare-fun res!507289 () Bool)

(assert (=> b!751793 (=> (not res!507289) (not e!419469))))

(declare-fun arrayContainsKey!0 (array!41797 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!751793 (= res!507289 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!751794 () Bool)

(declare-fun res!507302 () Bool)

(assert (=> b!751794 (=> (not res!507302) (not e!419474))))

(assert (=> b!751794 (= res!507302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!751795 () Bool)

(declare-fun Unit!25816 () Unit!25813)

(assert (=> b!751795 (= e!419472 Unit!25816)))

(assert (=> b!751795 false))

(declare-fun b!751796 () Bool)

(declare-fun e!419470 () Bool)

(assert (=> b!751796 (= e!419470 (= (seekEntryOrOpen!0 lt!334299 lt!334301 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334299 lt!334301 mask!3328)))))

(declare-fun b!751797 () Bool)

(declare-fun res!507301 () Bool)

(assert (=> b!751797 (=> (not res!507301) (not e!419469))))

(assert (=> b!751797 (= res!507301 (and (= (size!20428 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20428 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20428 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!751798 () Bool)

(declare-fun res!507296 () Bool)

(assert (=> b!751798 (=> (not res!507296) (not e!419466))))

(assert (=> b!751798 (= res!507296 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20008 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!751799 () Bool)

(declare-fun res!507303 () Bool)

(assert (=> b!751799 (=> (not res!507303) (not e!419469))))

(assert (=> b!751799 (= res!507303 (validKeyInArray!0 (select (arr!20008 a!3186) j!159)))))

(declare-fun b!751800 () Bool)

(assert (=> b!751800 (= e!419467 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20008 a!3186) j!159) a!3186 mask!3328) lt!334298))))

(declare-fun b!751801 () Bool)

(assert (=> b!751801 (= e!419475 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(assert (=> b!751801 e!419470))

(declare-fun res!507294 () Bool)

(assert (=> b!751801 (=> (not res!507294) (not e!419470))))

(assert (=> b!751801 (= res!507294 (= lt!334295 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334297 () Unit!25813)

(assert (=> b!751801 (= lt!334297 e!419472)))

(declare-fun c!82631 () Bool)

(assert (=> b!751801 (= c!82631 (= lt!334295 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!65754 res!507297) b!751797))

(assert (= (and b!751797 res!507301) b!751799))

(assert (= (and b!751799 res!507303) b!751787))

(assert (= (and b!751787 res!507295) b!751793))

(assert (= (and b!751793 res!507289) b!751783))

(assert (= (and b!751783 res!507299) b!751794))

(assert (= (and b!751794 res!507302) b!751782))

(assert (= (and b!751782 res!507291) b!751790))

(assert (= (and b!751790 res!507292) b!751786))

(assert (= (and b!751786 res!507287) b!751798))

(assert (= (and b!751798 res!507296) b!751791))

(assert (= (and b!751791 c!82630) b!751781))

(assert (= (and b!751791 (not c!82630)) b!751785))

(assert (= (and b!751791 res!507298) b!751784))

(assert (= (and b!751784 res!507290) b!751792))

(assert (= (and b!751792 res!507300) b!751800))

(assert (= (and b!751792 (not res!507293)) b!751789))

(assert (= (and b!751789 (not res!507288)) b!751780))

(assert (= (and b!751780 (not res!507304)) b!751801))

(assert (= (and b!751801 c!82631) b!751795))

(assert (= (and b!751801 (not c!82631)) b!751788))

(assert (= (and b!751801 res!507294) b!751796))

(declare-fun m!701463 () Bool)

(assert (=> b!751798 m!701463))

(declare-fun m!701465 () Bool)

(assert (=> b!751786 m!701465))

(assert (=> b!751786 m!701465))

(declare-fun m!701467 () Bool)

(assert (=> b!751786 m!701467))

(assert (=> b!751786 m!701467))

(assert (=> b!751786 m!701465))

(declare-fun m!701469 () Bool)

(assert (=> b!751786 m!701469))

(assert (=> b!751800 m!701465))

(assert (=> b!751800 m!701465))

(declare-fun m!701471 () Bool)

(assert (=> b!751800 m!701471))

(declare-fun m!701473 () Bool)

(assert (=> b!751780 m!701473))

(declare-fun m!701475 () Bool)

(assert (=> b!751780 m!701475))

(declare-fun m!701477 () Bool)

(assert (=> b!751782 m!701477))

(declare-fun m!701479 () Bool)

(assert (=> start!65754 m!701479))

(declare-fun m!701481 () Bool)

(assert (=> start!65754 m!701481))

(declare-fun m!701483 () Bool)

(assert (=> b!751783 m!701483))

(assert (=> b!751792 m!701465))

(assert (=> b!751792 m!701465))

(declare-fun m!701485 () Bool)

(assert (=> b!751792 m!701485))

(declare-fun m!701487 () Bool)

(assert (=> b!751792 m!701487))

(declare-fun m!701489 () Bool)

(assert (=> b!751792 m!701489))

(assert (=> b!751789 m!701465))

(assert (=> b!751789 m!701465))

(declare-fun m!701491 () Bool)

(assert (=> b!751789 m!701491))

(declare-fun m!701493 () Bool)

(assert (=> b!751794 m!701493))

(declare-fun m!701495 () Bool)

(assert (=> b!751787 m!701495))

(declare-fun m!701497 () Bool)

(assert (=> b!751793 m!701497))

(assert (=> b!751799 m!701465))

(assert (=> b!751799 m!701465))

(declare-fun m!701499 () Bool)

(assert (=> b!751799 m!701499))

(declare-fun m!701501 () Bool)

(assert (=> b!751796 m!701501))

(declare-fun m!701503 () Bool)

(assert (=> b!751796 m!701503))

(assert (=> b!751781 m!701465))

(assert (=> b!751781 m!701465))

(declare-fun m!701505 () Bool)

(assert (=> b!751781 m!701505))

(declare-fun m!701507 () Bool)

(assert (=> b!751784 m!701507))

(assert (=> b!751784 m!701507))

(declare-fun m!701509 () Bool)

(assert (=> b!751784 m!701509))

(assert (=> b!751784 m!701473))

(declare-fun m!701511 () Bool)

(assert (=> b!751784 m!701511))

(declare-fun m!701513 () Bool)

(assert (=> b!751784 m!701513))

(assert (=> b!751785 m!701465))

(assert (=> b!751785 m!701465))

(assert (=> b!751785 m!701491))

(check-sat (not b!751784) (not b!751796) (not b!751799) (not b!751792) (not b!751787) (not start!65754) (not b!751781) (not b!751800) (not b!751782) (not b!751786) (not b!751785) (not b!751783) (not b!751793) (not b!751789) (not b!751794))
(check-sat)
