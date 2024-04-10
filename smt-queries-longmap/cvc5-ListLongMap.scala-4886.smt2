; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67362 () Bool)

(assert start!67362)

(declare-datatypes ((array!42591 0))(
  ( (array!42592 (arr!20388 (Array (_ BitVec 32) (_ BitVec 64))) (size!20809 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42591)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!779176 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7988 0))(
  ( (MissingZero!7988 (index!34320 (_ BitVec 32))) (Found!7988 (index!34321 (_ BitVec 32))) (Intermediate!7988 (undefined!8800 Bool) (index!34322 (_ BitVec 32)) (x!65269 (_ BitVec 32))) (Undefined!7988) (MissingVacant!7988 (index!34323 (_ BitVec 32))) )
))
(declare-fun lt!347157 () SeekEntryResult!7988)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!433482 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42591 (_ BitVec 32)) SeekEntryResult!7988)

(assert (=> b!779176 (= e!433482 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20388 a!3186) j!159) a!3186 mask!3328) lt!347157))))

(declare-fun b!779177 () Bool)

(declare-fun e!433480 () Bool)

(declare-fun e!433484 () Bool)

(assert (=> b!779177 (= e!433480 e!433484)))

(declare-fun res!527170 () Bool)

(assert (=> b!779177 (=> (not res!527170) (not e!433484))))

(declare-fun lt!347165 () SeekEntryResult!7988)

(declare-fun lt!347160 () SeekEntryResult!7988)

(assert (=> b!779177 (= res!527170 (= lt!347165 lt!347160))))

(declare-fun lt!347164 () array!42591)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!347162 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42591 (_ BitVec 32)) SeekEntryResult!7988)

(assert (=> b!779177 (= lt!347160 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347162 lt!347164 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!779177 (= lt!347165 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347162 mask!3328) lt!347162 lt!347164 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!779177 (= lt!347162 (select (store (arr!20388 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!779177 (= lt!347164 (array!42592 (store (arr!20388 a!3186) i!1173 k!2102) (size!20809 a!3186)))))

(declare-fun res!527172 () Bool)

(declare-fun e!433478 () Bool)

(assert (=> start!67362 (=> (not res!527172) (not e!433478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67362 (= res!527172 (validMask!0 mask!3328))))

(assert (=> start!67362 e!433478))

(assert (=> start!67362 true))

(declare-fun array_inv!16184 (array!42591) Bool)

(assert (=> start!67362 (array_inv!16184 a!3186)))

(declare-fun b!779178 () Bool)

(declare-fun e!433483 () Bool)

(assert (=> b!779178 (= e!433483 e!433482)))

(declare-fun res!527162 () Bool)

(assert (=> b!779178 (=> (not res!527162) (not e!433482))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42591 (_ BitVec 32)) SeekEntryResult!7988)

(assert (=> b!779178 (= res!527162 (= (seekEntryOrOpen!0 (select (arr!20388 a!3186) j!159) a!3186 mask!3328) lt!347157))))

(assert (=> b!779178 (= lt!347157 (Found!7988 j!159))))

(declare-fun b!779179 () Bool)

(declare-fun e!433476 () Bool)

(assert (=> b!779179 (= e!433476 e!433480)))

(declare-fun res!527163 () Bool)

(assert (=> b!779179 (=> (not res!527163) (not e!433480))))

(declare-fun lt!347158 () SeekEntryResult!7988)

(assert (=> b!779179 (= res!527163 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20388 a!3186) j!159) mask!3328) (select (arr!20388 a!3186) j!159) a!3186 mask!3328) lt!347158))))

(assert (=> b!779179 (= lt!347158 (Intermediate!7988 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!779180 () Bool)

(declare-fun res!527175 () Bool)

(assert (=> b!779180 (=> (not res!527175) (not e!433478))))

(assert (=> b!779180 (= res!527175 (and (= (size!20809 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20809 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20809 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!779181 () Bool)

(declare-fun res!527165 () Bool)

(assert (=> b!779181 (=> (not res!527165) (not e!433480))))

(assert (=> b!779181 (= res!527165 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20388 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!779182 () Bool)

(declare-fun res!527176 () Bool)

(assert (=> b!779182 (=> (not res!527176) (not e!433478))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!779182 (= res!527176 (validKeyInArray!0 k!2102))))

(declare-fun b!779183 () Bool)

(assert (=> b!779183 (= e!433478 e!433476)))

(declare-fun res!527164 () Bool)

(assert (=> b!779183 (=> (not res!527164) (not e!433476))))

(declare-fun lt!347161 () SeekEntryResult!7988)

(assert (=> b!779183 (= res!527164 (or (= lt!347161 (MissingZero!7988 i!1173)) (= lt!347161 (MissingVacant!7988 i!1173))))))

(assert (=> b!779183 (= lt!347161 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!779184 () Bool)

(declare-fun res!527174 () Bool)

(assert (=> b!779184 (=> (not res!527174) (not e!433480))))

(declare-fun e!433481 () Bool)

(assert (=> b!779184 (= res!527174 e!433481)))

(declare-fun c!86410 () Bool)

(assert (=> b!779184 (= c!86410 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!779185 () Bool)

(assert (=> b!779185 (= e!433481 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20388 a!3186) j!159) a!3186 mask!3328) lt!347158))))

(declare-fun b!779186 () Bool)

(declare-fun e!433479 () Bool)

(assert (=> b!779186 (= e!433479 true)))

(declare-fun lt!347163 () SeekEntryResult!7988)

(assert (=> b!779186 (= lt!347163 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20388 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!779187 () Bool)

(declare-fun res!527173 () Bool)

(assert (=> b!779187 (=> (not res!527173) (not e!433476))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42591 (_ BitVec 32)) Bool)

(assert (=> b!779187 (= res!527173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!779188 () Bool)

(declare-fun res!527169 () Bool)

(assert (=> b!779188 (=> (not res!527169) (not e!433476))))

(declare-datatypes ((List!14390 0))(
  ( (Nil!14387) (Cons!14386 (h!15500 (_ BitVec 64)) (t!20705 List!14390)) )
))
(declare-fun arrayNoDuplicates!0 (array!42591 (_ BitVec 32) List!14390) Bool)

(assert (=> b!779188 (= res!527169 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14387))))

(declare-fun b!779189 () Bool)

(declare-fun res!527168 () Bool)

(assert (=> b!779189 (=> (not res!527168) (not e!433478))))

(declare-fun arrayContainsKey!0 (array!42591 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!779189 (= res!527168 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!779190 () Bool)

(declare-fun res!527171 () Bool)

(assert (=> b!779190 (=> (not res!527171) (not e!433478))))

(assert (=> b!779190 (= res!527171 (validKeyInArray!0 (select (arr!20388 a!3186) j!159)))))

(declare-fun b!779191 () Bool)

(assert (=> b!779191 (= e!433481 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20388 a!3186) j!159) a!3186 mask!3328) (Found!7988 j!159)))))

(declare-fun b!779192 () Bool)

(assert (=> b!779192 (= e!433484 (not e!433479))))

(declare-fun res!527167 () Bool)

(assert (=> b!779192 (=> res!527167 e!433479)))

(assert (=> b!779192 (= res!527167 (or (not (is-Intermediate!7988 lt!347160)) (bvslt x!1131 (x!65269 lt!347160)) (not (= x!1131 (x!65269 lt!347160))) (not (= index!1321 (index!34322 lt!347160)))))))

(assert (=> b!779192 e!433483))

(declare-fun res!527177 () Bool)

(assert (=> b!779192 (=> (not res!527177) (not e!433483))))

(assert (=> b!779192 (= res!527177 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26870 0))(
  ( (Unit!26871) )
))
(declare-fun lt!347159 () Unit!26870)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42591 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26870)

(assert (=> b!779192 (= lt!347159 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!779193 () Bool)

(declare-fun res!527166 () Bool)

(assert (=> b!779193 (=> (not res!527166) (not e!433476))))

(assert (=> b!779193 (= res!527166 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20809 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20809 a!3186))))))

(assert (= (and start!67362 res!527172) b!779180))

(assert (= (and b!779180 res!527175) b!779190))

(assert (= (and b!779190 res!527171) b!779182))

(assert (= (and b!779182 res!527176) b!779189))

(assert (= (and b!779189 res!527168) b!779183))

(assert (= (and b!779183 res!527164) b!779187))

(assert (= (and b!779187 res!527173) b!779188))

(assert (= (and b!779188 res!527169) b!779193))

(assert (= (and b!779193 res!527166) b!779179))

(assert (= (and b!779179 res!527163) b!779181))

(assert (= (and b!779181 res!527165) b!779184))

(assert (= (and b!779184 c!86410) b!779185))

(assert (= (and b!779184 (not c!86410)) b!779191))

(assert (= (and b!779184 res!527174) b!779177))

(assert (= (and b!779177 res!527170) b!779192))

(assert (= (and b!779192 res!527177) b!779178))

(assert (= (and b!779178 res!527162) b!779176))

(assert (= (and b!779192 (not res!527167)) b!779186))

(declare-fun m!722717 () Bool)

(assert (=> b!779176 m!722717))

(assert (=> b!779176 m!722717))

(declare-fun m!722719 () Bool)

(assert (=> b!779176 m!722719))

(declare-fun m!722721 () Bool)

(assert (=> start!67362 m!722721))

(declare-fun m!722723 () Bool)

(assert (=> start!67362 m!722723))

(declare-fun m!722725 () Bool)

(assert (=> b!779188 m!722725))

(assert (=> b!779178 m!722717))

(assert (=> b!779178 m!722717))

(declare-fun m!722727 () Bool)

(assert (=> b!779178 m!722727))

(declare-fun m!722729 () Bool)

(assert (=> b!779183 m!722729))

(assert (=> b!779191 m!722717))

(assert (=> b!779191 m!722717))

(declare-fun m!722731 () Bool)

(assert (=> b!779191 m!722731))

(assert (=> b!779190 m!722717))

(assert (=> b!779190 m!722717))

(declare-fun m!722733 () Bool)

(assert (=> b!779190 m!722733))

(declare-fun m!722735 () Bool)

(assert (=> b!779187 m!722735))

(assert (=> b!779179 m!722717))

(assert (=> b!779179 m!722717))

(declare-fun m!722737 () Bool)

(assert (=> b!779179 m!722737))

(assert (=> b!779179 m!722737))

(assert (=> b!779179 m!722717))

(declare-fun m!722739 () Bool)

(assert (=> b!779179 m!722739))

(declare-fun m!722741 () Bool)

(assert (=> b!779181 m!722741))

(declare-fun m!722743 () Bool)

(assert (=> b!779192 m!722743))

(declare-fun m!722745 () Bool)

(assert (=> b!779192 m!722745))

(declare-fun m!722747 () Bool)

(assert (=> b!779189 m!722747))

(declare-fun m!722749 () Bool)

(assert (=> b!779182 m!722749))

(assert (=> b!779186 m!722717))

(assert (=> b!779186 m!722717))

(assert (=> b!779186 m!722731))

(declare-fun m!722751 () Bool)

(assert (=> b!779177 m!722751))

(assert (=> b!779177 m!722751))

(declare-fun m!722753 () Bool)

(assert (=> b!779177 m!722753))

(declare-fun m!722755 () Bool)

(assert (=> b!779177 m!722755))

(declare-fun m!722757 () Bool)

(assert (=> b!779177 m!722757))

(declare-fun m!722759 () Bool)

(assert (=> b!779177 m!722759))

(assert (=> b!779185 m!722717))

(assert (=> b!779185 m!722717))

(declare-fun m!722761 () Bool)

(assert (=> b!779185 m!722761))

(push 1)

