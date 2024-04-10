; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67778 () Bool)

(assert start!67778)

(declare-fun b!787553 () Bool)

(declare-fun e!437767 () Bool)

(declare-fun e!437761 () Bool)

(assert (=> b!787553 (= e!437767 e!437761)))

(declare-fun res!533418 () Bool)

(assert (=> b!787553 (=> (not res!533418) (not e!437761))))

(declare-datatypes ((array!42818 0))(
  ( (array!42819 (arr!20497 (Array (_ BitVec 32) (_ BitVec 64))) (size!20918 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42818)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8097 0))(
  ( (MissingZero!8097 (index!34756 (_ BitVec 32))) (Found!8097 (index!34757 (_ BitVec 32))) (Intermediate!8097 (undefined!8909 Bool) (index!34758 (_ BitVec 32)) (x!65693 (_ BitVec 32))) (Undefined!8097) (MissingVacant!8097 (index!34759 (_ BitVec 32))) )
))
(declare-fun lt!351319 () SeekEntryResult!8097)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42818 (_ BitVec 32)) SeekEntryResult!8097)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!787553 (= res!533418 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20497 a!3186) j!159) mask!3328) (select (arr!20497 a!3186) j!159) a!3186 mask!3328) lt!351319))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!787553 (= lt!351319 (Intermediate!8097 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!787554 () Bool)

(declare-fun res!533419 () Bool)

(declare-fun e!437757 () Bool)

(assert (=> b!787554 (=> (not res!533419) (not e!437757))))

(declare-fun lt!351316 () array!42818)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!351313 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42818 (_ BitVec 32)) SeekEntryResult!8097)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42818 (_ BitVec 32)) SeekEntryResult!8097)

(assert (=> b!787554 (= res!533419 (= (seekEntryOrOpen!0 lt!351313 lt!351316 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351313 lt!351316 mask!3328)))))

(declare-fun b!787555 () Bool)

(declare-fun res!533415 () Bool)

(declare-fun e!437762 () Bool)

(assert (=> b!787555 (=> (not res!533415) (not e!437762))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!787555 (= res!533415 (validKeyInArray!0 k0!2102))))

(declare-fun b!787556 () Bool)

(declare-fun e!437766 () Bool)

(declare-fun e!437768 () Bool)

(assert (=> b!787556 (= e!437766 e!437768)))

(declare-fun res!533410 () Bool)

(assert (=> b!787556 (=> res!533410 e!437768)))

(declare-fun lt!351312 () (_ BitVec 64))

(assert (=> b!787556 (= res!533410 (= lt!351312 lt!351313))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!787556 (= lt!351312 (select (store (arr!20497 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!787557 () Bool)

(declare-fun res!533411 () Bool)

(assert (=> b!787557 (=> (not res!533411) (not e!437767))))

(assert (=> b!787557 (= res!533411 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20918 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20918 a!3186))))))

(declare-fun res!533421 () Bool)

(assert (=> start!67778 (=> (not res!533421) (not e!437762))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67778 (= res!533421 (validMask!0 mask!3328))))

(assert (=> start!67778 e!437762))

(assert (=> start!67778 true))

(declare-fun array_inv!16293 (array!42818) Bool)

(assert (=> start!67778 (array_inv!16293 a!3186)))

(declare-fun b!787558 () Bool)

(declare-fun e!437765 () Bool)

(declare-fun e!437760 () Bool)

(assert (=> b!787558 (= e!437765 (not e!437760))))

(declare-fun res!533408 () Bool)

(assert (=> b!787558 (=> res!533408 e!437760)))

(declare-fun lt!351311 () SeekEntryResult!8097)

(get-info :version)

(assert (=> b!787558 (= res!533408 (or (not ((_ is Intermediate!8097) lt!351311)) (bvslt x!1131 (x!65693 lt!351311)) (not (= x!1131 (x!65693 lt!351311))) (not (= index!1321 (index!34758 lt!351311)))))))

(declare-fun e!437764 () Bool)

(assert (=> b!787558 e!437764))

(declare-fun res!533423 () Bool)

(assert (=> b!787558 (=> (not res!533423) (not e!437764))))

(declare-fun lt!351310 () SeekEntryResult!8097)

(declare-fun lt!351309 () SeekEntryResult!8097)

(assert (=> b!787558 (= res!533423 (= lt!351310 lt!351309))))

(assert (=> b!787558 (= lt!351309 (Found!8097 j!159))))

(assert (=> b!787558 (= lt!351310 (seekEntryOrOpen!0 (select (arr!20497 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42818 (_ BitVec 32)) Bool)

(assert (=> b!787558 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!27276 0))(
  ( (Unit!27277) )
))
(declare-fun lt!351317 () Unit!27276)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42818 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27276)

(assert (=> b!787558 (= lt!351317 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!787559 () Bool)

(assert (=> b!787559 (= e!437768 true)))

(assert (=> b!787559 e!437757))

(declare-fun res!533413 () Bool)

(assert (=> b!787559 (=> (not res!533413) (not e!437757))))

(assert (=> b!787559 (= res!533413 (= lt!351312 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351320 () Unit!27276)

(declare-fun e!437763 () Unit!27276)

(assert (=> b!787559 (= lt!351320 e!437763)))

(declare-fun c!87481 () Bool)

(assert (=> b!787559 (= c!87481 (= lt!351312 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!787560 () Bool)

(declare-fun res!533420 () Bool)

(assert (=> b!787560 (=> (not res!533420) (not e!437762))))

(assert (=> b!787560 (= res!533420 (and (= (size!20918 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20918 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20918 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!787561 () Bool)

(declare-fun res!533417 () Bool)

(assert (=> b!787561 (=> (not res!533417) (not e!437767))))

(declare-datatypes ((List!14499 0))(
  ( (Nil!14496) (Cons!14495 (h!15618 (_ BitVec 64)) (t!20814 List!14499)) )
))
(declare-fun arrayNoDuplicates!0 (array!42818 (_ BitVec 32) List!14499) Bool)

(assert (=> b!787561 (= res!533417 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14496))))

(declare-fun b!787562 () Bool)

(assert (=> b!787562 (= e!437761 e!437765)))

(declare-fun res!533424 () Bool)

(assert (=> b!787562 (=> (not res!533424) (not e!437765))))

(declare-fun lt!351318 () SeekEntryResult!8097)

(assert (=> b!787562 (= res!533424 (= lt!351318 lt!351311))))

(assert (=> b!787562 (= lt!351311 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351313 lt!351316 mask!3328))))

(assert (=> b!787562 (= lt!351318 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351313 mask!3328) lt!351313 lt!351316 mask!3328))))

(assert (=> b!787562 (= lt!351313 (select (store (arr!20497 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!787562 (= lt!351316 (array!42819 (store (arr!20497 a!3186) i!1173 k0!2102) (size!20918 a!3186)))))

(declare-fun b!787563 () Bool)

(declare-fun e!437759 () Bool)

(assert (=> b!787563 (= e!437759 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20497 a!3186) j!159) a!3186 mask!3328) (Found!8097 j!159)))))

(declare-fun b!787564 () Bool)

(declare-fun res!533412 () Bool)

(assert (=> b!787564 (=> (not res!533412) (not e!437762))))

(assert (=> b!787564 (= res!533412 (validKeyInArray!0 (select (arr!20497 a!3186) j!159)))))

(declare-fun b!787565 () Bool)

(declare-fun Unit!27278 () Unit!27276)

(assert (=> b!787565 (= e!437763 Unit!27278)))

(assert (=> b!787565 false))

(declare-fun b!787566 () Bool)

(assert (=> b!787566 (= e!437760 e!437766)))

(declare-fun res!533416 () Bool)

(assert (=> b!787566 (=> res!533416 e!437766)))

(declare-fun lt!351314 () SeekEntryResult!8097)

(assert (=> b!787566 (= res!533416 (not (= lt!351314 lt!351309)))))

(assert (=> b!787566 (= lt!351314 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20497 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!787567 () Bool)

(declare-fun res!533409 () Bool)

(assert (=> b!787567 (=> (not res!533409) (not e!437767))))

(assert (=> b!787567 (= res!533409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!787568 () Bool)

(assert (=> b!787568 (= e!437762 e!437767)))

(declare-fun res!533422 () Bool)

(assert (=> b!787568 (=> (not res!533422) (not e!437767))))

(declare-fun lt!351315 () SeekEntryResult!8097)

(assert (=> b!787568 (= res!533422 (or (= lt!351315 (MissingZero!8097 i!1173)) (= lt!351315 (MissingVacant!8097 i!1173))))))

(assert (=> b!787568 (= lt!351315 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!787569 () Bool)

(assert (=> b!787569 (= e!437764 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20497 a!3186) j!159) a!3186 mask!3328) lt!351309))))

(declare-fun b!787570 () Bool)

(assert (=> b!787570 (= e!437759 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20497 a!3186) j!159) a!3186 mask!3328) lt!351319))))

(declare-fun b!787571 () Bool)

(declare-fun Unit!27279 () Unit!27276)

(assert (=> b!787571 (= e!437763 Unit!27279)))

(declare-fun b!787572 () Bool)

(assert (=> b!787572 (= e!437757 (= lt!351310 lt!351314))))

(declare-fun b!787573 () Bool)

(declare-fun res!533425 () Bool)

(assert (=> b!787573 (=> (not res!533425) (not e!437762))))

(declare-fun arrayContainsKey!0 (array!42818 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!787573 (= res!533425 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!787574 () Bool)

(declare-fun res!533426 () Bool)

(assert (=> b!787574 (=> (not res!533426) (not e!437761))))

(assert (=> b!787574 (= res!533426 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20497 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!787575 () Bool)

(declare-fun res!533414 () Bool)

(assert (=> b!787575 (=> (not res!533414) (not e!437761))))

(assert (=> b!787575 (= res!533414 e!437759)))

(declare-fun c!87480 () Bool)

(assert (=> b!787575 (= c!87480 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!67778 res!533421) b!787560))

(assert (= (and b!787560 res!533420) b!787564))

(assert (= (and b!787564 res!533412) b!787555))

(assert (= (and b!787555 res!533415) b!787573))

(assert (= (and b!787573 res!533425) b!787568))

(assert (= (and b!787568 res!533422) b!787567))

(assert (= (and b!787567 res!533409) b!787561))

(assert (= (and b!787561 res!533417) b!787557))

(assert (= (and b!787557 res!533411) b!787553))

(assert (= (and b!787553 res!533418) b!787574))

(assert (= (and b!787574 res!533426) b!787575))

(assert (= (and b!787575 c!87480) b!787570))

(assert (= (and b!787575 (not c!87480)) b!787563))

(assert (= (and b!787575 res!533414) b!787562))

(assert (= (and b!787562 res!533424) b!787558))

(assert (= (and b!787558 res!533423) b!787569))

(assert (= (and b!787558 (not res!533408)) b!787566))

(assert (= (and b!787566 (not res!533416)) b!787556))

(assert (= (and b!787556 (not res!533410)) b!787559))

(assert (= (and b!787559 c!87481) b!787565))

(assert (= (and b!787559 (not c!87481)) b!787571))

(assert (= (and b!787559 res!533413) b!787554))

(assert (= (and b!787554 res!533419) b!787572))

(declare-fun m!729105 () Bool)

(assert (=> b!787563 m!729105))

(assert (=> b!787563 m!729105))

(declare-fun m!729107 () Bool)

(assert (=> b!787563 m!729107))

(declare-fun m!729109 () Bool)

(assert (=> b!787573 m!729109))

(declare-fun m!729111 () Bool)

(assert (=> b!787556 m!729111))

(declare-fun m!729113 () Bool)

(assert (=> b!787556 m!729113))

(declare-fun m!729115 () Bool)

(assert (=> b!787568 m!729115))

(declare-fun m!729117 () Bool)

(assert (=> start!67778 m!729117))

(declare-fun m!729119 () Bool)

(assert (=> start!67778 m!729119))

(declare-fun m!729121 () Bool)

(assert (=> b!787574 m!729121))

(assert (=> b!787569 m!729105))

(assert (=> b!787569 m!729105))

(declare-fun m!729123 () Bool)

(assert (=> b!787569 m!729123))

(declare-fun m!729125 () Bool)

(assert (=> b!787555 m!729125))

(assert (=> b!787553 m!729105))

(assert (=> b!787553 m!729105))

(declare-fun m!729127 () Bool)

(assert (=> b!787553 m!729127))

(assert (=> b!787553 m!729127))

(assert (=> b!787553 m!729105))

(declare-fun m!729129 () Bool)

(assert (=> b!787553 m!729129))

(assert (=> b!787558 m!729105))

(assert (=> b!787558 m!729105))

(declare-fun m!729131 () Bool)

(assert (=> b!787558 m!729131))

(declare-fun m!729133 () Bool)

(assert (=> b!787558 m!729133))

(declare-fun m!729135 () Bool)

(assert (=> b!787558 m!729135))

(declare-fun m!729137 () Bool)

(assert (=> b!787561 m!729137))

(assert (=> b!787566 m!729105))

(assert (=> b!787566 m!729105))

(assert (=> b!787566 m!729107))

(declare-fun m!729139 () Bool)

(assert (=> b!787567 m!729139))

(declare-fun m!729141 () Bool)

(assert (=> b!787554 m!729141))

(declare-fun m!729143 () Bool)

(assert (=> b!787554 m!729143))

(declare-fun m!729145 () Bool)

(assert (=> b!787562 m!729145))

(declare-fun m!729147 () Bool)

(assert (=> b!787562 m!729147))

(assert (=> b!787562 m!729145))

(assert (=> b!787562 m!729111))

(declare-fun m!729149 () Bool)

(assert (=> b!787562 m!729149))

(declare-fun m!729151 () Bool)

(assert (=> b!787562 m!729151))

(assert (=> b!787570 m!729105))

(assert (=> b!787570 m!729105))

(declare-fun m!729153 () Bool)

(assert (=> b!787570 m!729153))

(assert (=> b!787564 m!729105))

(assert (=> b!787564 m!729105))

(declare-fun m!729155 () Bool)

(assert (=> b!787564 m!729155))

(check-sat (not b!787567) (not b!787569) (not start!67778) (not b!787555) (not b!787553) (not b!787554) (not b!787573) (not b!787564) (not b!787570) (not b!787562) (not b!787566) (not b!787568) (not b!787561) (not b!787563) (not b!787558))
(check-sat)
