; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67520 () Bool)

(assert start!67520)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42642 0))(
  ( (array!42643 (arr!20411 (Array (_ BitVec 32) (_ BitVec 64))) (size!20832 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42642)

(declare-fun e!434471 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!781134 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8008 0))(
  ( (MissingZero!8008 (index!34400 (_ BitVec 32))) (Found!8008 (index!34401 (_ BitVec 32))) (Intermediate!8008 (undefined!8820 Bool) (index!34402 (_ BitVec 32)) (x!65366 (_ BitVec 32))) (Undefined!8008) (MissingVacant!8008 (index!34403 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42642 (_ BitVec 32)) SeekEntryResult!8008)

(assert (=> b!781134 (= e!434471 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20411 a!3186) j!159) a!3186 mask!3328) (Found!8008 j!159)))))

(declare-fun b!781135 () Bool)

(declare-datatypes ((Unit!26900 0))(
  ( (Unit!26901) )
))
(declare-fun e!434466 () Unit!26900)

(declare-fun Unit!26902 () Unit!26900)

(assert (=> b!781135 (= e!434466 Unit!26902)))

(assert (=> b!781135 false))

(declare-fun b!781136 () Bool)

(declare-fun res!528489 () Bool)

(declare-fun e!434472 () Bool)

(assert (=> b!781136 (=> res!528489 e!434472)))

(declare-fun lt!347961 () SeekEntryResult!8008)

(assert (=> b!781136 (= res!528489 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20411 a!3186) j!159) a!3186 mask!3328) lt!347961)))))

(declare-fun res!528487 () Bool)

(declare-fun e!434470 () Bool)

(assert (=> start!67520 (=> (not res!528487) (not e!434470))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67520 (= res!528487 (validMask!0 mask!3328))))

(assert (=> start!67520 e!434470))

(assert (=> start!67520 true))

(declare-fun array_inv!16294 (array!42642) Bool)

(assert (=> start!67520 (array_inv!16294 a!3186)))

(declare-fun b!781137 () Bool)

(declare-fun res!528490 () Bool)

(assert (=> b!781137 (=> (not res!528490) (not e!434470))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42642 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!781137 (= res!528490 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!781138 () Bool)

(declare-fun res!528482 () Bool)

(declare-fun e!434469 () Bool)

(assert (=> b!781138 (=> (not res!528482) (not e!434469))))

(declare-datatypes ((List!14452 0))(
  ( (Nil!14449) (Cons!14448 (h!15568 (_ BitVec 64)) (t!20758 List!14452)) )
))
(declare-fun arrayNoDuplicates!0 (array!42642 (_ BitVec 32) List!14452) Bool)

(assert (=> b!781138 (= res!528482 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14449))))

(declare-fun b!781139 () Bool)

(declare-fun res!528481 () Bool)

(assert (=> b!781139 (=> (not res!528481) (not e!434469))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!781139 (= res!528481 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20832 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20832 a!3186))))))

(declare-fun b!781140 () Bool)

(declare-fun res!528480 () Bool)

(assert (=> b!781140 (=> (not res!528480) (not e!434470))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!781140 (= res!528480 (validKeyInArray!0 k0!2102))))

(declare-fun b!781141 () Bool)

(declare-fun res!528484 () Bool)

(declare-fun e!434467 () Bool)

(assert (=> b!781141 (=> (not res!528484) (not e!434467))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!781141 (= res!528484 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20411 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!781142 () Bool)

(assert (=> b!781142 (= e!434472 true)))

(assert (=> b!781142 (= (select (store (arr!20411 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!347964 () Unit!26900)

(assert (=> b!781142 (= lt!347964 e!434466)))

(declare-fun c!86736 () Bool)

(assert (=> b!781142 (= c!86736 (= (select (store (arr!20411 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!781143 () Bool)

(declare-fun Unit!26903 () Unit!26900)

(assert (=> b!781143 (= e!434466 Unit!26903)))

(declare-fun b!781144 () Bool)

(declare-fun e!434468 () Bool)

(assert (=> b!781144 (= e!434468 (not e!434472))))

(declare-fun res!528485 () Bool)

(assert (=> b!781144 (=> res!528485 e!434472)))

(declare-fun lt!347965 () SeekEntryResult!8008)

(get-info :version)

(assert (=> b!781144 (= res!528485 (or (not ((_ is Intermediate!8008) lt!347965)) (bvslt x!1131 (x!65366 lt!347965)) (not (= x!1131 (x!65366 lt!347965))) (not (= index!1321 (index!34402 lt!347965)))))))

(declare-fun e!434473 () Bool)

(assert (=> b!781144 e!434473))

(declare-fun res!528491 () Bool)

(assert (=> b!781144 (=> (not res!528491) (not e!434473))))

(declare-fun lt!347962 () SeekEntryResult!8008)

(assert (=> b!781144 (= res!528491 (= lt!347962 lt!347961))))

(assert (=> b!781144 (= lt!347961 (Found!8008 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42642 (_ BitVec 32)) SeekEntryResult!8008)

(assert (=> b!781144 (= lt!347962 (seekEntryOrOpen!0 (select (arr!20411 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42642 (_ BitVec 32)) Bool)

(assert (=> b!781144 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!347968 () Unit!26900)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42642 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26900)

(assert (=> b!781144 (= lt!347968 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!781145 () Bool)

(declare-fun res!528488 () Bool)

(assert (=> b!781145 (=> res!528488 e!434472)))

(declare-fun lt!347966 () (_ BitVec 64))

(assert (=> b!781145 (= res!528488 (= (select (store (arr!20411 a!3186) i!1173 k0!2102) index!1321) lt!347966))))

(declare-fun b!781146 () Bool)

(assert (=> b!781146 (= e!434473 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20411 a!3186) j!159) a!3186 mask!3328) lt!347961))))

(declare-fun b!781147 () Bool)

(declare-fun lt!347969 () SeekEntryResult!8008)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42642 (_ BitVec 32)) SeekEntryResult!8008)

(assert (=> b!781147 (= e!434471 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20411 a!3186) j!159) a!3186 mask!3328) lt!347969))))

(declare-fun b!781148 () Bool)

(assert (=> b!781148 (= e!434467 e!434468)))

(declare-fun res!528479 () Bool)

(assert (=> b!781148 (=> (not res!528479) (not e!434468))))

(declare-fun lt!347960 () SeekEntryResult!8008)

(assert (=> b!781148 (= res!528479 (= lt!347960 lt!347965))))

(declare-fun lt!347963 () array!42642)

(assert (=> b!781148 (= lt!347965 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347966 lt!347963 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!781148 (= lt!347960 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347966 mask!3328) lt!347966 lt!347963 mask!3328))))

(assert (=> b!781148 (= lt!347966 (select (store (arr!20411 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!781148 (= lt!347963 (array!42643 (store (arr!20411 a!3186) i!1173 k0!2102) (size!20832 a!3186)))))

(declare-fun b!781149 () Bool)

(declare-fun res!528492 () Bool)

(assert (=> b!781149 (=> (not res!528492) (not e!434467))))

(assert (=> b!781149 (= res!528492 e!434471)))

(declare-fun c!86735 () Bool)

(assert (=> b!781149 (= c!86735 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!781150 () Bool)

(assert (=> b!781150 (= e!434469 e!434467)))

(declare-fun res!528478 () Bool)

(assert (=> b!781150 (=> (not res!528478) (not e!434467))))

(assert (=> b!781150 (= res!528478 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20411 a!3186) j!159) mask!3328) (select (arr!20411 a!3186) j!159) a!3186 mask!3328) lt!347969))))

(assert (=> b!781150 (= lt!347969 (Intermediate!8008 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!781151 () Bool)

(declare-fun res!528476 () Bool)

(assert (=> b!781151 (=> (not res!528476) (not e!434469))))

(assert (=> b!781151 (= res!528476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!781152 () Bool)

(declare-fun res!528486 () Bool)

(assert (=> b!781152 (=> (not res!528486) (not e!434470))))

(assert (=> b!781152 (= res!528486 (and (= (size!20832 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20832 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20832 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!781153 () Bool)

(assert (=> b!781153 (= e!434470 e!434469)))

(declare-fun res!528477 () Bool)

(assert (=> b!781153 (=> (not res!528477) (not e!434469))))

(declare-fun lt!347967 () SeekEntryResult!8008)

(assert (=> b!781153 (= res!528477 (or (= lt!347967 (MissingZero!8008 i!1173)) (= lt!347967 (MissingVacant!8008 i!1173))))))

(assert (=> b!781153 (= lt!347967 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!781154 () Bool)

(declare-fun res!528483 () Bool)

(assert (=> b!781154 (=> (not res!528483) (not e!434470))))

(assert (=> b!781154 (= res!528483 (validKeyInArray!0 (select (arr!20411 a!3186) j!159)))))

(assert (= (and start!67520 res!528487) b!781152))

(assert (= (and b!781152 res!528486) b!781154))

(assert (= (and b!781154 res!528483) b!781140))

(assert (= (and b!781140 res!528480) b!781137))

(assert (= (and b!781137 res!528490) b!781153))

(assert (= (and b!781153 res!528477) b!781151))

(assert (= (and b!781151 res!528476) b!781138))

(assert (= (and b!781138 res!528482) b!781139))

(assert (= (and b!781139 res!528481) b!781150))

(assert (= (and b!781150 res!528478) b!781141))

(assert (= (and b!781141 res!528484) b!781149))

(assert (= (and b!781149 c!86735) b!781147))

(assert (= (and b!781149 (not c!86735)) b!781134))

(assert (= (and b!781149 res!528492) b!781148))

(assert (= (and b!781148 res!528479) b!781144))

(assert (= (and b!781144 res!528491) b!781146))

(assert (= (and b!781144 (not res!528485)) b!781136))

(assert (= (and b!781136 (not res!528489)) b!781145))

(assert (= (and b!781145 (not res!528488)) b!781142))

(assert (= (and b!781142 c!86736) b!781135))

(assert (= (and b!781142 (not c!86736)) b!781143))

(declare-fun m!723669 () Bool)

(assert (=> b!781138 m!723669))

(declare-fun m!723671 () Bool)

(assert (=> b!781154 m!723671))

(assert (=> b!781154 m!723671))

(declare-fun m!723673 () Bool)

(assert (=> b!781154 m!723673))

(declare-fun m!723675 () Bool)

(assert (=> b!781142 m!723675))

(declare-fun m!723677 () Bool)

(assert (=> b!781142 m!723677))

(assert (=> b!781147 m!723671))

(assert (=> b!781147 m!723671))

(declare-fun m!723679 () Bool)

(assert (=> b!781147 m!723679))

(assert (=> b!781134 m!723671))

(assert (=> b!781134 m!723671))

(declare-fun m!723681 () Bool)

(assert (=> b!781134 m!723681))

(assert (=> b!781136 m!723671))

(assert (=> b!781136 m!723671))

(assert (=> b!781136 m!723681))

(declare-fun m!723683 () Bool)

(assert (=> b!781151 m!723683))

(assert (=> b!781144 m!723671))

(assert (=> b!781144 m!723671))

(declare-fun m!723685 () Bool)

(assert (=> b!781144 m!723685))

(declare-fun m!723687 () Bool)

(assert (=> b!781144 m!723687))

(declare-fun m!723689 () Bool)

(assert (=> b!781144 m!723689))

(declare-fun m!723691 () Bool)

(assert (=> b!781137 m!723691))

(declare-fun m!723693 () Bool)

(assert (=> b!781140 m!723693))

(assert (=> b!781145 m!723675))

(assert (=> b!781145 m!723677))

(declare-fun m!723695 () Bool)

(assert (=> start!67520 m!723695))

(declare-fun m!723697 () Bool)

(assert (=> start!67520 m!723697))

(assert (=> b!781146 m!723671))

(assert (=> b!781146 m!723671))

(declare-fun m!723699 () Bool)

(assert (=> b!781146 m!723699))

(declare-fun m!723701 () Bool)

(assert (=> b!781148 m!723701))

(assert (=> b!781148 m!723675))

(declare-fun m!723703 () Bool)

(assert (=> b!781148 m!723703))

(assert (=> b!781148 m!723701))

(declare-fun m!723705 () Bool)

(assert (=> b!781148 m!723705))

(declare-fun m!723707 () Bool)

(assert (=> b!781148 m!723707))

(declare-fun m!723709 () Bool)

(assert (=> b!781153 m!723709))

(assert (=> b!781150 m!723671))

(assert (=> b!781150 m!723671))

(declare-fun m!723711 () Bool)

(assert (=> b!781150 m!723711))

(assert (=> b!781150 m!723711))

(assert (=> b!781150 m!723671))

(declare-fun m!723713 () Bool)

(assert (=> b!781150 m!723713))

(declare-fun m!723715 () Bool)

(assert (=> b!781141 m!723715))

(check-sat (not b!781150) (not b!781144) (not b!781146) (not b!781147) (not b!781151) (not b!781140) (not b!781136) (not b!781154) (not b!781134) (not start!67520) (not b!781137) (not b!781153) (not b!781148) (not b!781138))
(check-sat)
