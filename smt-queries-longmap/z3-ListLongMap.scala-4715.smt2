; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65478 () Bool)

(assert start!65478)

(declare-fun b!743505 () Bool)

(declare-fun res!500237 () Bool)

(declare-fun e!415561 () Bool)

(assert (=> b!743505 (=> (not res!500237) (not e!415561))))

(declare-datatypes ((array!41521 0))(
  ( (array!41522 (arr!19870 (Array (_ BitVec 32) (_ BitVec 64))) (size!20290 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41521)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41521 (_ BitVec 32)) Bool)

(assert (=> b!743505 (= res!500237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!743507 () Bool)

(declare-fun res!500226 () Bool)

(declare-fun e!415557 () Bool)

(assert (=> b!743507 (=> (not res!500226) (not e!415557))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!743507 (= res!500226 (validKeyInArray!0 k0!2102))))

(declare-fun b!743508 () Bool)

(declare-fun e!415563 () Bool)

(declare-fun lt!330282 () (_ BitVec 64))

(assert (=> b!743508 (= e!415563 (validKeyInArray!0 lt!330282))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7426 0))(
  ( (MissingZero!7426 (index!32072 (_ BitVec 32))) (Found!7426 (index!32073 (_ BitVec 32))) (Intermediate!7426 (undefined!8238 Bool) (index!32074 (_ BitVec 32)) (x!63204 (_ BitVec 32))) (Undefined!7426) (MissingVacant!7426 (index!32075 (_ BitVec 32))) )
))
(declare-fun lt!330285 () SeekEntryResult!7426)

(declare-fun e!415562 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!743509 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41521 (_ BitVec 32)) SeekEntryResult!7426)

(assert (=> b!743509 (= e!415562 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19870 a!3186) j!159) a!3186 mask!3328) lt!330285))))

(declare-fun b!743510 () Bool)

(declare-fun res!500232 () Bool)

(assert (=> b!743510 (=> (not res!500232) (not e!415561))))

(declare-datatypes ((List!13779 0))(
  ( (Nil!13776) (Cons!13775 (h!14853 (_ BitVec 64)) (t!20086 List!13779)) )
))
(declare-fun arrayNoDuplicates!0 (array!41521 (_ BitVec 32) List!13779) Bool)

(assert (=> b!743510 (= res!500232 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13776))))

(declare-fun b!743511 () Bool)

(declare-fun e!415560 () Bool)

(declare-fun e!415559 () Bool)

(assert (=> b!743511 (= e!415560 e!415559)))

(declare-fun res!500233 () Bool)

(assert (=> b!743511 (=> (not res!500233) (not e!415559))))

(declare-fun lt!330281 () SeekEntryResult!7426)

(declare-fun lt!330286 () SeekEntryResult!7426)

(assert (=> b!743511 (= res!500233 (= lt!330281 lt!330286))))

(declare-fun lt!330284 () array!41521)

(assert (=> b!743511 (= lt!330286 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330282 lt!330284 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!743511 (= lt!330281 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330282 mask!3328) lt!330282 lt!330284 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!743511 (= lt!330282 (select (store (arr!19870 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!743511 (= lt!330284 (array!41522 (store (arr!19870 a!3186) i!1173 k0!2102) (size!20290 a!3186)))))

(declare-fun b!743512 () Bool)

(assert (=> b!743512 (= e!415561 e!415560)))

(declare-fun res!500225 () Bool)

(assert (=> b!743512 (=> (not res!500225) (not e!415560))))

(assert (=> b!743512 (= res!500225 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19870 a!3186) j!159) mask!3328) (select (arr!19870 a!3186) j!159) a!3186 mask!3328) lt!330285))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!743512 (= lt!330285 (Intermediate!7426 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!743513 () Bool)

(declare-fun e!415555 () Bool)

(declare-fun e!415558 () Bool)

(assert (=> b!743513 (= e!415555 e!415558)))

(declare-fun res!500229 () Bool)

(assert (=> b!743513 (=> (not res!500229) (not e!415558))))

(declare-fun lt!330288 () SeekEntryResult!7426)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41521 (_ BitVec 32)) SeekEntryResult!7426)

(assert (=> b!743513 (= res!500229 (= (seekEntryOrOpen!0 (select (arr!19870 a!3186) j!159) a!3186 mask!3328) lt!330288))))

(assert (=> b!743513 (= lt!330288 (Found!7426 j!159))))

(declare-fun b!743514 () Bool)

(declare-fun res!500223 () Bool)

(assert (=> b!743514 (=> (not res!500223) (not e!415557))))

(assert (=> b!743514 (= res!500223 (validKeyInArray!0 (select (arr!19870 a!3186) j!159)))))

(declare-fun b!743515 () Bool)

(declare-fun res!500224 () Bool)

(assert (=> b!743515 (=> (not res!500224) (not e!415561))))

(assert (=> b!743515 (= res!500224 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20290 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20290 a!3186))))))

(declare-fun b!743516 () Bool)

(declare-fun res!500230 () Bool)

(assert (=> b!743516 (=> (not res!500230) (not e!415557))))

(assert (=> b!743516 (= res!500230 (and (= (size!20290 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20290 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20290 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!500231 () Bool)

(assert (=> start!65478 (=> (not res!500231) (not e!415557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65478 (= res!500231 (validMask!0 mask!3328))))

(assert (=> start!65478 e!415557))

(assert (=> start!65478 true))

(declare-fun array_inv!15729 (array!41521) Bool)

(assert (=> start!65478 (array_inv!15729 a!3186)))

(declare-fun b!743506 () Bool)

(assert (=> b!743506 (= e!415557 e!415561)))

(declare-fun res!500238 () Bool)

(assert (=> b!743506 (=> (not res!500238) (not e!415561))))

(declare-fun lt!330283 () SeekEntryResult!7426)

(assert (=> b!743506 (= res!500238 (or (= lt!330283 (MissingZero!7426 i!1173)) (= lt!330283 (MissingVacant!7426 i!1173))))))

(assert (=> b!743506 (= lt!330283 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!743517 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41521 (_ BitVec 32)) SeekEntryResult!7426)

(assert (=> b!743517 (= e!415562 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19870 a!3186) j!159) a!3186 mask!3328) (Found!7426 j!159)))))

(declare-fun b!743518 () Bool)

(declare-fun res!500235 () Bool)

(assert (=> b!743518 (=> res!500235 e!415563)))

(assert (=> b!743518 (= res!500235 (or (not (= (select (store (arr!19870 a!3186) i!1173 k0!2102) index!1321) lt!330282)) (undefined!8238 lt!330286) (bvslt mask!3328 #b00000000000000000000000000000000)))))

(declare-fun b!743519 () Bool)

(assert (=> b!743519 (= e!415559 (not e!415563))))

(declare-fun res!500227 () Bool)

(assert (=> b!743519 (=> res!500227 e!415563)))

(get-info :version)

(assert (=> b!743519 (= res!500227 (or (not ((_ is Intermediate!7426) lt!330286)) (bvslt x!1131 (x!63204 lt!330286)) (not (= x!1131 (x!63204 lt!330286))) (not (= index!1321 (index!32074 lt!330286)))))))

(assert (=> b!743519 e!415555))

(declare-fun res!500222 () Bool)

(assert (=> b!743519 (=> (not res!500222) (not e!415555))))

(assert (=> b!743519 (= res!500222 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25411 0))(
  ( (Unit!25412) )
))
(declare-fun lt!330287 () Unit!25411)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41521 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25411)

(assert (=> b!743519 (= lt!330287 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!743520 () Bool)

(declare-fun res!500228 () Bool)

(assert (=> b!743520 (=> (not res!500228) (not e!415557))))

(declare-fun arrayContainsKey!0 (array!41521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!743520 (= res!500228 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!743521 () Bool)

(declare-fun res!500239 () Bool)

(assert (=> b!743521 (=> (not res!500239) (not e!415560))))

(assert (=> b!743521 (= res!500239 e!415562)))

(declare-fun c!82025 () Bool)

(assert (=> b!743521 (= c!82025 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!743522 () Bool)

(declare-fun res!500234 () Bool)

(assert (=> b!743522 (=> (not res!500234) (not e!415560))))

(assert (=> b!743522 (= res!500234 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19870 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!743523 () Bool)

(declare-fun res!500236 () Bool)

(assert (=> b!743523 (=> res!500236 e!415563)))

(assert (=> b!743523 (= res!500236 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19870 a!3186) j!159) a!3186 mask!3328) (Found!7426 j!159))))))

(declare-fun b!743524 () Bool)

(assert (=> b!743524 (= e!415558 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19870 a!3186) j!159) a!3186 mask!3328) lt!330288))))

(assert (= (and start!65478 res!500231) b!743516))

(assert (= (and b!743516 res!500230) b!743514))

(assert (= (and b!743514 res!500223) b!743507))

(assert (= (and b!743507 res!500226) b!743520))

(assert (= (and b!743520 res!500228) b!743506))

(assert (= (and b!743506 res!500238) b!743505))

(assert (= (and b!743505 res!500237) b!743510))

(assert (= (and b!743510 res!500232) b!743515))

(assert (= (and b!743515 res!500224) b!743512))

(assert (= (and b!743512 res!500225) b!743522))

(assert (= (and b!743522 res!500234) b!743521))

(assert (= (and b!743521 c!82025) b!743509))

(assert (= (and b!743521 (not c!82025)) b!743517))

(assert (= (and b!743521 res!500239) b!743511))

(assert (= (and b!743511 res!500233) b!743519))

(assert (= (and b!743519 res!500222) b!743513))

(assert (= (and b!743513 res!500229) b!743524))

(assert (= (and b!743519 (not res!500227)) b!743523))

(assert (= (and b!743523 (not res!500236)) b!743518))

(assert (= (and b!743518 (not res!500235)) b!743508))

(declare-fun m!694731 () Bool)

(assert (=> b!743507 m!694731))

(declare-fun m!694733 () Bool)

(assert (=> b!743513 m!694733))

(assert (=> b!743513 m!694733))

(declare-fun m!694735 () Bool)

(assert (=> b!743513 m!694735))

(assert (=> b!743524 m!694733))

(assert (=> b!743524 m!694733))

(declare-fun m!694737 () Bool)

(assert (=> b!743524 m!694737))

(assert (=> b!743523 m!694733))

(assert (=> b!743523 m!694733))

(declare-fun m!694739 () Bool)

(assert (=> b!743523 m!694739))

(declare-fun m!694741 () Bool)

(assert (=> b!743522 m!694741))

(declare-fun m!694743 () Bool)

(assert (=> b!743519 m!694743))

(declare-fun m!694745 () Bool)

(assert (=> b!743519 m!694745))

(declare-fun m!694747 () Bool)

(assert (=> b!743518 m!694747))

(declare-fun m!694749 () Bool)

(assert (=> b!743518 m!694749))

(assert (=> b!743517 m!694733))

(assert (=> b!743517 m!694733))

(assert (=> b!743517 m!694739))

(declare-fun m!694751 () Bool)

(assert (=> b!743520 m!694751))

(assert (=> b!743509 m!694733))

(assert (=> b!743509 m!694733))

(declare-fun m!694753 () Bool)

(assert (=> b!743509 m!694753))

(declare-fun m!694755 () Bool)

(assert (=> b!743511 m!694755))

(assert (=> b!743511 m!694747))

(declare-fun m!694757 () Bool)

(assert (=> b!743511 m!694757))

(declare-fun m!694759 () Bool)

(assert (=> b!743511 m!694759))

(assert (=> b!743511 m!694757))

(declare-fun m!694761 () Bool)

(assert (=> b!743511 m!694761))

(declare-fun m!694763 () Bool)

(assert (=> b!743505 m!694763))

(declare-fun m!694765 () Bool)

(assert (=> b!743508 m!694765))

(declare-fun m!694767 () Bool)

(assert (=> b!743510 m!694767))

(declare-fun m!694769 () Bool)

(assert (=> b!743506 m!694769))

(assert (=> b!743512 m!694733))

(assert (=> b!743512 m!694733))

(declare-fun m!694771 () Bool)

(assert (=> b!743512 m!694771))

(assert (=> b!743512 m!694771))

(assert (=> b!743512 m!694733))

(declare-fun m!694773 () Bool)

(assert (=> b!743512 m!694773))

(assert (=> b!743514 m!694733))

(assert (=> b!743514 m!694733))

(declare-fun m!694775 () Bool)

(assert (=> b!743514 m!694775))

(declare-fun m!694777 () Bool)

(assert (=> start!65478 m!694777))

(declare-fun m!694779 () Bool)

(assert (=> start!65478 m!694779))

(check-sat (not start!65478) (not b!743514) (not b!743507) (not b!743523) (not b!743511) (not b!743517) (not b!743509) (not b!743508) (not b!743512) (not b!743524) (not b!743505) (not b!743519) (not b!743506) (not b!743513) (not b!743520) (not b!743510))
(check-sat)
