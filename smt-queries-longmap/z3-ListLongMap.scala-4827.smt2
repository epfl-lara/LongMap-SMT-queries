; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66422 () Bool)

(assert start!66422)

(declare-fun b!764919 () Bool)

(declare-fun res!517402 () Bool)

(declare-fun e!426099 () Bool)

(assert (=> b!764919 (=> (not res!517402) (not e!426099))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42205 0))(
  ( (array!42206 (arr!20206 (Array (_ BitVec 32) (_ BitVec 64))) (size!20626 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42205)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!764919 (= res!517402 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20206 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!764920 () Bool)

(declare-fun res!517401 () Bool)

(declare-fun e!426098 () Bool)

(assert (=> b!764920 (=> (not res!517401) (not e!426098))))

(declare-datatypes ((List!14115 0))(
  ( (Nil!14112) (Cons!14111 (h!15201 (_ BitVec 64)) (t!20422 List!14115)) )
))
(declare-fun arrayNoDuplicates!0 (array!42205 (_ BitVec 32) List!14115) Bool)

(assert (=> b!764920 (= res!517401 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14112))))

(declare-fun b!764921 () Bool)

(declare-fun res!517407 () Bool)

(declare-fun e!426101 () Bool)

(assert (=> b!764921 (=> (not res!517407) (not e!426101))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!764921 (= res!517407 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!764922 () Bool)

(declare-fun e!426096 () Bool)

(assert (=> b!764922 (= e!426099 e!426096)))

(declare-fun res!517410 () Bool)

(assert (=> b!764922 (=> (not res!517410) (not e!426096))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!340375 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!340377 () array!42205)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7762 0))(
  ( (MissingZero!7762 (index!33416 (_ BitVec 32))) (Found!7762 (index!33417 (_ BitVec 32))) (Intermediate!7762 (undefined!8574 Bool) (index!33418 (_ BitVec 32)) (x!64473 (_ BitVec 32))) (Undefined!7762) (MissingVacant!7762 (index!33419 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42205 (_ BitVec 32)) SeekEntryResult!7762)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!764922 (= res!517410 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340375 mask!3328) lt!340375 lt!340377 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340375 lt!340377 mask!3328)))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!764922 (= lt!340375 (select (store (arr!20206 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!764922 (= lt!340377 (array!42206 (store (arr!20206 a!3186) i!1173 k0!2102) (size!20626 a!3186)))))

(declare-fun b!764923 () Bool)

(assert (=> b!764923 (= e!426101 e!426098)))

(declare-fun res!517411 () Bool)

(assert (=> b!764923 (=> (not res!517411) (not e!426098))))

(declare-fun lt!340374 () SeekEntryResult!7762)

(assert (=> b!764923 (= res!517411 (or (= lt!340374 (MissingZero!7762 i!1173)) (= lt!340374 (MissingVacant!7762 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42205 (_ BitVec 32)) SeekEntryResult!7762)

(assert (=> b!764923 (= lt!340374 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!764924 () Bool)

(declare-fun res!517405 () Bool)

(assert (=> b!764924 (=> (not res!517405) (not e!426098))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42205 (_ BitVec 32)) Bool)

(assert (=> b!764924 (= res!517405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!764925 () Bool)

(assert (=> b!764925 (= e!426098 e!426099)))

(declare-fun res!517408 () Bool)

(assert (=> b!764925 (=> (not res!517408) (not e!426099))))

(declare-fun lt!340373 () SeekEntryResult!7762)

(assert (=> b!764925 (= res!517408 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20206 a!3186) j!159) mask!3328) (select (arr!20206 a!3186) j!159) a!3186 mask!3328) lt!340373))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!764925 (= lt!340373 (Intermediate!7762 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!764926 () Bool)

(assert (=> b!764926 (= e!426096 (not true))))

(assert (=> b!764926 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26329 0))(
  ( (Unit!26330) )
))
(declare-fun lt!340376 () Unit!26329)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42205 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26329)

(assert (=> b!764926 (= lt!340376 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!764927 () Bool)

(declare-fun res!517406 () Bool)

(assert (=> b!764927 (=> (not res!517406) (not e!426098))))

(assert (=> b!764927 (= res!517406 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20626 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20626 a!3186))))))

(declare-fun b!764928 () Bool)

(declare-fun res!517409 () Bool)

(assert (=> b!764928 (=> (not res!517409) (not e!426101))))

(assert (=> b!764928 (= res!517409 (and (= (size!20626 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20626 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20626 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!764929 () Bool)

(declare-fun res!517403 () Bool)

(assert (=> b!764929 (=> (not res!517403) (not e!426101))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!764929 (= res!517403 (validKeyInArray!0 (select (arr!20206 a!3186) j!159)))))

(declare-fun e!426100 () Bool)

(declare-fun b!764930 () Bool)

(assert (=> b!764930 (= e!426100 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20206 a!3186) j!159) a!3186 mask!3328) lt!340373))))

(declare-fun b!764931 () Bool)

(declare-fun res!517404 () Bool)

(assert (=> b!764931 (=> (not res!517404) (not e!426101))))

(assert (=> b!764931 (= res!517404 (validKeyInArray!0 k0!2102))))

(declare-fun b!764932 () Bool)

(declare-fun res!517412 () Bool)

(assert (=> b!764932 (=> (not res!517412) (not e!426099))))

(assert (=> b!764932 (= res!517412 e!426100)))

(declare-fun c!84149 () Bool)

(assert (=> b!764932 (= c!84149 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!764933 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42205 (_ BitVec 32)) SeekEntryResult!7762)

(assert (=> b!764933 (= e!426100 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20206 a!3186) j!159) a!3186 mask!3328) (Found!7762 j!159)))))

(declare-fun res!517400 () Bool)

(assert (=> start!66422 (=> (not res!517400) (not e!426101))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66422 (= res!517400 (validMask!0 mask!3328))))

(assert (=> start!66422 e!426101))

(assert (=> start!66422 true))

(declare-fun array_inv!16065 (array!42205) Bool)

(assert (=> start!66422 (array_inv!16065 a!3186)))

(assert (= (and start!66422 res!517400) b!764928))

(assert (= (and b!764928 res!517409) b!764929))

(assert (= (and b!764929 res!517403) b!764931))

(assert (= (and b!764931 res!517404) b!764921))

(assert (= (and b!764921 res!517407) b!764923))

(assert (= (and b!764923 res!517411) b!764924))

(assert (= (and b!764924 res!517405) b!764920))

(assert (= (and b!764920 res!517401) b!764927))

(assert (= (and b!764927 res!517406) b!764925))

(assert (= (and b!764925 res!517408) b!764919))

(assert (= (and b!764919 res!517402) b!764932))

(assert (= (and b!764932 c!84149) b!764930))

(assert (= (and b!764932 (not c!84149)) b!764933))

(assert (= (and b!764932 res!517412) b!764922))

(assert (= (and b!764922 res!517410) b!764926))

(declare-fun m!711679 () Bool)

(assert (=> b!764929 m!711679))

(assert (=> b!764929 m!711679))

(declare-fun m!711681 () Bool)

(assert (=> b!764929 m!711681))

(declare-fun m!711683 () Bool)

(assert (=> b!764922 m!711683))

(declare-fun m!711685 () Bool)

(assert (=> b!764922 m!711685))

(declare-fun m!711687 () Bool)

(assert (=> b!764922 m!711687))

(declare-fun m!711689 () Bool)

(assert (=> b!764922 m!711689))

(assert (=> b!764922 m!711685))

(declare-fun m!711691 () Bool)

(assert (=> b!764922 m!711691))

(declare-fun m!711693 () Bool)

(assert (=> b!764921 m!711693))

(declare-fun m!711695 () Bool)

(assert (=> start!66422 m!711695))

(declare-fun m!711697 () Bool)

(assert (=> start!66422 m!711697))

(declare-fun m!711699 () Bool)

(assert (=> b!764920 m!711699))

(declare-fun m!711701 () Bool)

(assert (=> b!764924 m!711701))

(assert (=> b!764930 m!711679))

(assert (=> b!764930 m!711679))

(declare-fun m!711703 () Bool)

(assert (=> b!764930 m!711703))

(declare-fun m!711705 () Bool)

(assert (=> b!764923 m!711705))

(assert (=> b!764925 m!711679))

(assert (=> b!764925 m!711679))

(declare-fun m!711707 () Bool)

(assert (=> b!764925 m!711707))

(assert (=> b!764925 m!711707))

(assert (=> b!764925 m!711679))

(declare-fun m!711709 () Bool)

(assert (=> b!764925 m!711709))

(declare-fun m!711711 () Bool)

(assert (=> b!764931 m!711711))

(declare-fun m!711713 () Bool)

(assert (=> b!764919 m!711713))

(assert (=> b!764933 m!711679))

(assert (=> b!764933 m!711679))

(declare-fun m!711715 () Bool)

(assert (=> b!764933 m!711715))

(declare-fun m!711717 () Bool)

(assert (=> b!764926 m!711717))

(declare-fun m!711719 () Bool)

(assert (=> b!764926 m!711719))

(check-sat (not b!764922) (not b!764933) (not b!764921) (not start!66422) (not b!764931) (not b!764926) (not b!764929) (not b!764930) (not b!764924) (not b!764923) (not b!764920) (not b!764925))
(check-sat)
