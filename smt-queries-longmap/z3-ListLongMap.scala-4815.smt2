; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66210 () Bool)

(assert start!66210)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42132 0))(
  ( (array!42133 (arr!20174 (Array (_ BitVec 32) (_ BitVec 64))) (size!20595 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42132)

(declare-fun e!424966 () Bool)

(declare-fun b!762526 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7771 0))(
  ( (MissingZero!7771 (index!33452 (_ BitVec 32))) (Found!7771 (index!33453 (_ BitVec 32))) (Intermediate!7771 (undefined!8583 Bool) (index!33454 (_ BitVec 32)) (x!64370 (_ BitVec 32))) (Undefined!7771) (MissingVacant!7771 (index!33455 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42132 (_ BitVec 32)) SeekEntryResult!7771)

(assert (=> b!762526 (= e!424966 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20174 a!3186) j!159) a!3186 mask!3328) (Found!7771 j!159))))))

(declare-fun b!762527 () Bool)

(declare-fun res!515747 () Bool)

(declare-fun e!424967 () Bool)

(assert (=> b!762527 (=> (not res!515747) (not e!424967))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762527 (= res!515747 (validKeyInArray!0 k0!2102))))

(declare-fun b!762528 () Bool)

(declare-fun res!515744 () Bool)

(declare-fun e!424969 () Bool)

(assert (=> b!762528 (=> (not res!515744) (not e!424969))))

(declare-datatypes ((List!14215 0))(
  ( (Nil!14212) (Cons!14211 (h!15295 (_ BitVec 64)) (t!20521 List!14215)) )
))
(declare-fun arrayNoDuplicates!0 (array!42132 (_ BitVec 32) List!14215) Bool)

(assert (=> b!762528 (= res!515744 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14212))))

(declare-fun res!515746 () Bool)

(assert (=> start!66210 (=> (not res!515746) (not e!424967))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66210 (= res!515746 (validMask!0 mask!3328))))

(assert (=> start!66210 e!424967))

(assert (=> start!66210 true))

(declare-fun array_inv!16057 (array!42132) Bool)

(assert (=> start!66210 (array_inv!16057 a!3186)))

(declare-fun b!762529 () Bool)

(declare-fun e!424968 () Bool)

(assert (=> b!762529 (= e!424969 e!424968)))

(declare-fun res!515742 () Bool)

(assert (=> b!762529 (=> (not res!515742) (not e!424968))))

(declare-fun lt!339409 () SeekEntryResult!7771)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42132 (_ BitVec 32)) SeekEntryResult!7771)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762529 (= res!515742 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20174 a!3186) j!159) mask!3328) (select (arr!20174 a!3186) j!159) a!3186 mask!3328) lt!339409))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762529 (= lt!339409 (Intermediate!7771 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!762530 () Bool)

(assert (=> b!762530 (= e!424967 e!424969)))

(declare-fun res!515738 () Bool)

(assert (=> b!762530 (=> (not res!515738) (not e!424969))))

(declare-fun lt!339410 () SeekEntryResult!7771)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!762530 (= res!515738 (or (= lt!339410 (MissingZero!7771 i!1173)) (= lt!339410 (MissingVacant!7771 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42132 (_ BitVec 32)) SeekEntryResult!7771)

(assert (=> b!762530 (= lt!339410 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!762531 () Bool)

(declare-fun res!515745 () Bool)

(assert (=> b!762531 (=> (not res!515745) (not e!424968))))

(assert (=> b!762531 (= res!515745 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20174 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!762532 () Bool)

(declare-fun res!515741 () Bool)

(assert (=> b!762532 (=> (not res!515741) (not e!424967))))

(declare-fun arrayContainsKey!0 (array!42132 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762532 (= res!515741 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!762533 () Bool)

(declare-fun res!515739 () Bool)

(assert (=> b!762533 (=> (not res!515739) (not e!424967))))

(assert (=> b!762533 (= res!515739 (validKeyInArray!0 (select (arr!20174 a!3186) j!159)))))

(declare-fun b!762534 () Bool)

(declare-fun res!515740 () Bool)

(assert (=> b!762534 (=> (not res!515740) (not e!424967))))

(assert (=> b!762534 (= res!515740 (and (= (size!20595 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20595 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20595 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!762535 () Bool)

(assert (=> b!762535 (= e!424966 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20174 a!3186) j!159) a!3186 mask!3328) lt!339409)))))

(declare-fun b!762536 () Bool)

(declare-fun res!515737 () Bool)

(assert (=> b!762536 (=> (not res!515737) (not e!424969))))

(assert (=> b!762536 (= res!515737 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20595 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20595 a!3186))))))

(declare-fun b!762537 () Bool)

(assert (=> b!762537 (= e!424968 false)))

(declare-fun lt!339408 () Bool)

(assert (=> b!762537 (= lt!339408 e!424966)))

(declare-fun c!83781 () Bool)

(assert (=> b!762537 (= c!83781 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!762538 () Bool)

(declare-fun res!515743 () Bool)

(assert (=> b!762538 (=> (not res!515743) (not e!424969))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42132 (_ BitVec 32)) Bool)

(assert (=> b!762538 (= res!515743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!66210 res!515746) b!762534))

(assert (= (and b!762534 res!515740) b!762533))

(assert (= (and b!762533 res!515739) b!762527))

(assert (= (and b!762527 res!515747) b!762532))

(assert (= (and b!762532 res!515741) b!762530))

(assert (= (and b!762530 res!515738) b!762538))

(assert (= (and b!762538 res!515743) b!762528))

(assert (= (and b!762528 res!515744) b!762536))

(assert (= (and b!762536 res!515737) b!762529))

(assert (= (and b!762529 res!515742) b!762531))

(assert (= (and b!762531 res!515745) b!762537))

(assert (= (and b!762537 c!83781) b!762535))

(assert (= (and b!762537 (not c!83781)) b!762526))

(declare-fun m!708673 () Bool)

(assert (=> b!762533 m!708673))

(assert (=> b!762533 m!708673))

(declare-fun m!708675 () Bool)

(assert (=> b!762533 m!708675))

(declare-fun m!708677 () Bool)

(assert (=> b!762531 m!708677))

(assert (=> b!762535 m!708673))

(assert (=> b!762535 m!708673))

(declare-fun m!708679 () Bool)

(assert (=> b!762535 m!708679))

(declare-fun m!708681 () Bool)

(assert (=> b!762538 m!708681))

(declare-fun m!708683 () Bool)

(assert (=> b!762532 m!708683))

(assert (=> b!762526 m!708673))

(assert (=> b!762526 m!708673))

(declare-fun m!708685 () Bool)

(assert (=> b!762526 m!708685))

(declare-fun m!708687 () Bool)

(assert (=> b!762527 m!708687))

(declare-fun m!708689 () Bool)

(assert (=> start!66210 m!708689))

(declare-fun m!708691 () Bool)

(assert (=> start!66210 m!708691))

(declare-fun m!708693 () Bool)

(assert (=> b!762528 m!708693))

(declare-fun m!708695 () Bool)

(assert (=> b!762530 m!708695))

(assert (=> b!762529 m!708673))

(assert (=> b!762529 m!708673))

(declare-fun m!708697 () Bool)

(assert (=> b!762529 m!708697))

(assert (=> b!762529 m!708697))

(assert (=> b!762529 m!708673))

(declare-fun m!708699 () Bool)

(assert (=> b!762529 m!708699))

(check-sat (not b!762526) (not b!762528) (not b!762533) (not b!762527) (not b!762529) (not b!762532) (not start!66210) (not b!762538) (not b!762535) (not b!762530))
(check-sat)
