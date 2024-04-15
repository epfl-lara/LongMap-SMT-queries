; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66450 () Bool)

(assert start!66450)

(declare-fun b!765708 () Bool)

(declare-fun res!518043 () Bool)

(declare-fun e!426406 () Bool)

(assert (=> b!765708 (=> (not res!518043) (not e!426406))))

(declare-fun e!426410 () Bool)

(assert (=> b!765708 (= res!518043 e!426410)))

(declare-fun c!84228 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!765708 (= c!84228 (bvsle x!1131 resIntermediateX!5))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42246 0))(
  ( (array!42247 (arr!20228 (Array (_ BitVec 32) (_ BitVec 64))) (size!20649 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42246)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!765709 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7825 0))(
  ( (MissingZero!7825 (index!33668 (_ BitVec 32))) (Found!7825 (index!33669 (_ BitVec 32))) (Intermediate!7825 (undefined!8637 Bool) (index!33670 (_ BitVec 32)) (x!64586 (_ BitVec 32))) (Undefined!7825) (MissingVacant!7825 (index!33671 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42246 (_ BitVec 32)) SeekEntryResult!7825)

(assert (=> b!765709 (= e!426410 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20228 a!3186) j!159) a!3186 mask!3328) (Found!7825 j!159)))))

(declare-fun b!765710 () Bool)

(declare-fun e!426404 () Bool)

(declare-fun e!426403 () Bool)

(assert (=> b!765710 (= e!426404 e!426403)))

(declare-fun res!518044 () Bool)

(assert (=> b!765710 (=> (not res!518044) (not e!426403))))

(declare-fun lt!340479 () SeekEntryResult!7825)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42246 (_ BitVec 32)) SeekEntryResult!7825)

(assert (=> b!765710 (= res!518044 (= (seekEntryOrOpen!0 (select (arr!20228 a!3186) j!159) a!3186 mask!3328) lt!340479))))

(assert (=> b!765710 (= lt!340479 (Found!7825 j!159))))

(declare-fun lt!340480 () SeekEntryResult!7825)

(declare-fun b!765711 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42246 (_ BitVec 32)) SeekEntryResult!7825)

(assert (=> b!765711 (= e!426410 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20228 a!3186) j!159) a!3186 mask!3328) lt!340480))))

(declare-fun b!765712 () Bool)

(declare-fun res!518035 () Bool)

(declare-fun e!426405 () Bool)

(assert (=> b!765712 (=> (not res!518035) (not e!426405))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42246 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!765712 (= res!518035 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!765713 () Bool)

(declare-fun res!518040 () Bool)

(declare-fun e!426408 () Bool)

(assert (=> b!765713 (=> (not res!518040) (not e!426408))))

(declare-datatypes ((List!14269 0))(
  ( (Nil!14266) (Cons!14265 (h!15355 (_ BitVec 64)) (t!20575 List!14269)) )
))
(declare-fun arrayNoDuplicates!0 (array!42246 (_ BitVec 32) List!14269) Bool)

(assert (=> b!765713 (= res!518040 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14266))))

(declare-fun b!765714 () Bool)

(declare-fun res!518045 () Bool)

(assert (=> b!765714 (=> (not res!518045) (not e!426406))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!765714 (= res!518045 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20228 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!765716 () Bool)

(declare-fun e!426409 () Bool)

(assert (=> b!765716 (= e!426409 (not true))))

(assert (=> b!765716 e!426404))

(declare-fun res!518034 () Bool)

(assert (=> b!765716 (=> (not res!518034) (not e!426404))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42246 (_ BitVec 32)) Bool)

(assert (=> b!765716 (= res!518034 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26348 0))(
  ( (Unit!26349) )
))
(declare-fun lt!340478 () Unit!26348)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42246 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26348)

(assert (=> b!765716 (= lt!340478 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!765717 () Bool)

(assert (=> b!765717 (= e!426403 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20228 a!3186) j!159) a!3186 mask!3328) lt!340479))))

(declare-fun b!765718 () Bool)

(declare-fun res!518041 () Bool)

(assert (=> b!765718 (=> (not res!518041) (not e!426405))))

(assert (=> b!765718 (= res!518041 (and (= (size!20649 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20649 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20649 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!765719 () Bool)

(declare-fun res!518032 () Bool)

(assert (=> b!765719 (=> (not res!518032) (not e!426408))))

(assert (=> b!765719 (= res!518032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!765720 () Bool)

(assert (=> b!765720 (= e!426408 e!426406)))

(declare-fun res!518037 () Bool)

(assert (=> b!765720 (=> (not res!518037) (not e!426406))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!765720 (= res!518037 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20228 a!3186) j!159) mask!3328) (select (arr!20228 a!3186) j!159) a!3186 mask!3328) lt!340480))))

(assert (=> b!765720 (= lt!340480 (Intermediate!7825 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!518036 () Bool)

(assert (=> start!66450 (=> (not res!518036) (not e!426405))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66450 (= res!518036 (validMask!0 mask!3328))))

(assert (=> start!66450 e!426405))

(assert (=> start!66450 true))

(declare-fun array_inv!16111 (array!42246) Bool)

(assert (=> start!66450 (array_inv!16111 a!3186)))

(declare-fun b!765715 () Bool)

(declare-fun res!518031 () Bool)

(assert (=> b!765715 (=> (not res!518031) (not e!426408))))

(assert (=> b!765715 (= res!518031 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20649 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20649 a!3186))))))

(declare-fun b!765721 () Bool)

(assert (=> b!765721 (= e!426405 e!426408)))

(declare-fun res!518039 () Bool)

(assert (=> b!765721 (=> (not res!518039) (not e!426408))))

(declare-fun lt!340481 () SeekEntryResult!7825)

(assert (=> b!765721 (= res!518039 (or (= lt!340481 (MissingZero!7825 i!1173)) (= lt!340481 (MissingVacant!7825 i!1173))))))

(assert (=> b!765721 (= lt!340481 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!765722 () Bool)

(declare-fun res!518038 () Bool)

(assert (=> b!765722 (=> (not res!518038) (not e!426405))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!765722 (= res!518038 (validKeyInArray!0 k0!2102))))

(declare-fun b!765723 () Bool)

(assert (=> b!765723 (= e!426406 e!426409)))

(declare-fun res!518042 () Bool)

(assert (=> b!765723 (=> (not res!518042) (not e!426409))))

(declare-fun lt!340476 () (_ BitVec 64))

(declare-fun lt!340477 () array!42246)

(assert (=> b!765723 (= res!518042 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340476 mask!3328) lt!340476 lt!340477 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340476 lt!340477 mask!3328)))))

(assert (=> b!765723 (= lt!340476 (select (store (arr!20228 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!765723 (= lt!340477 (array!42247 (store (arr!20228 a!3186) i!1173 k0!2102) (size!20649 a!3186)))))

(declare-fun b!765724 () Bool)

(declare-fun res!518033 () Bool)

(assert (=> b!765724 (=> (not res!518033) (not e!426405))))

(assert (=> b!765724 (= res!518033 (validKeyInArray!0 (select (arr!20228 a!3186) j!159)))))

(assert (= (and start!66450 res!518036) b!765718))

(assert (= (and b!765718 res!518041) b!765724))

(assert (= (and b!765724 res!518033) b!765722))

(assert (= (and b!765722 res!518038) b!765712))

(assert (= (and b!765712 res!518035) b!765721))

(assert (= (and b!765721 res!518039) b!765719))

(assert (= (and b!765719 res!518032) b!765713))

(assert (= (and b!765713 res!518040) b!765715))

(assert (= (and b!765715 res!518031) b!765720))

(assert (= (and b!765720 res!518037) b!765714))

(assert (= (and b!765714 res!518045) b!765708))

(assert (= (and b!765708 c!84228) b!765711))

(assert (= (and b!765708 (not c!84228)) b!765709))

(assert (= (and b!765708 res!518043) b!765723))

(assert (= (and b!765723 res!518042) b!765716))

(assert (= (and b!765716 res!518034) b!765710))

(assert (= (and b!765710 res!518044) b!765717))

(declare-fun m!711241 () Bool)

(assert (=> b!765713 m!711241))

(declare-fun m!711243 () Bool)

(assert (=> b!765721 m!711243))

(declare-fun m!711245 () Bool)

(assert (=> b!765717 m!711245))

(assert (=> b!765717 m!711245))

(declare-fun m!711247 () Bool)

(assert (=> b!765717 m!711247))

(declare-fun m!711249 () Bool)

(assert (=> b!765723 m!711249))

(declare-fun m!711251 () Bool)

(assert (=> b!765723 m!711251))

(assert (=> b!765723 m!711249))

(declare-fun m!711253 () Bool)

(assert (=> b!765723 m!711253))

(declare-fun m!711255 () Bool)

(assert (=> b!765723 m!711255))

(declare-fun m!711257 () Bool)

(assert (=> b!765723 m!711257))

(declare-fun m!711259 () Bool)

(assert (=> b!765722 m!711259))

(assert (=> b!765724 m!711245))

(assert (=> b!765724 m!711245))

(declare-fun m!711261 () Bool)

(assert (=> b!765724 m!711261))

(declare-fun m!711263 () Bool)

(assert (=> b!765719 m!711263))

(assert (=> b!765711 m!711245))

(assert (=> b!765711 m!711245))

(declare-fun m!711265 () Bool)

(assert (=> b!765711 m!711265))

(declare-fun m!711267 () Bool)

(assert (=> b!765712 m!711267))

(declare-fun m!711269 () Bool)

(assert (=> b!765716 m!711269))

(declare-fun m!711271 () Bool)

(assert (=> b!765716 m!711271))

(declare-fun m!711273 () Bool)

(assert (=> start!66450 m!711273))

(declare-fun m!711275 () Bool)

(assert (=> start!66450 m!711275))

(assert (=> b!765709 m!711245))

(assert (=> b!765709 m!711245))

(declare-fun m!711277 () Bool)

(assert (=> b!765709 m!711277))

(assert (=> b!765710 m!711245))

(assert (=> b!765710 m!711245))

(declare-fun m!711279 () Bool)

(assert (=> b!765710 m!711279))

(assert (=> b!765720 m!711245))

(assert (=> b!765720 m!711245))

(declare-fun m!711281 () Bool)

(assert (=> b!765720 m!711281))

(assert (=> b!765720 m!711281))

(assert (=> b!765720 m!711245))

(declare-fun m!711283 () Bool)

(assert (=> b!765720 m!711283))

(declare-fun m!711285 () Bool)

(assert (=> b!765714 m!711285))

(check-sat (not b!765713) (not start!66450) (not b!765717) (not b!765721) (not b!765720) (not b!765716) (not b!765710) (not b!765711) (not b!765712) (not b!765709) (not b!765719) (not b!765722) (not b!765724) (not b!765723))
(check-sat)
