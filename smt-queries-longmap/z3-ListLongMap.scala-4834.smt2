; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66456 () Bool)

(assert start!66456)

(declare-fun b!765863 () Bool)

(declare-fun res!518170 () Bool)

(declare-fun e!426483 () Bool)

(assert (=> b!765863 (=> (not res!518170) (not e!426483))))

(declare-fun e!426480 () Bool)

(assert (=> b!765863 (= res!518170 e!426480)))

(declare-fun c!84237 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!765863 (= c!84237 (bvsle x!1131 resIntermediateX!5))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42252 0))(
  ( (array!42253 (arr!20231 (Array (_ BitVec 32) (_ BitVec 64))) (size!20652 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42252)

(declare-fun e!426478 () Bool)

(declare-fun b!765864 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7828 0))(
  ( (MissingZero!7828 (index!33680 (_ BitVec 32))) (Found!7828 (index!33681 (_ BitVec 32))) (Intermediate!7828 (undefined!8640 Bool) (index!33682 (_ BitVec 32)) (x!64597 (_ BitVec 32))) (Undefined!7828) (MissingVacant!7828 (index!33683 (_ BitVec 32))) )
))
(declare-fun lt!340541 () SeekEntryResult!7828)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42252 (_ BitVec 32)) SeekEntryResult!7828)

(assert (=> b!765864 (= e!426478 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20231 a!3186) j!159) a!3186 mask!3328) lt!340541))))

(declare-fun res!518182 () Bool)

(declare-fun e!426479 () Bool)

(assert (=> start!66456 (=> (not res!518182) (not e!426479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66456 (= res!518182 (validMask!0 mask!3328))))

(assert (=> start!66456 e!426479))

(assert (=> start!66456 true))

(declare-fun array_inv!16114 (array!42252) Bool)

(assert (=> start!66456 (array_inv!16114 a!3186)))

(declare-fun b!765865 () Bool)

(declare-fun res!518172 () Bool)

(assert (=> b!765865 (=> (not res!518172) (not e!426479))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!765865 (= res!518172 (and (= (size!20652 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20652 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20652 a!3186)) (not (= i!1173 j!159))))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!765866 () Bool)

(declare-fun lt!340543 () SeekEntryResult!7828)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42252 (_ BitVec 32)) SeekEntryResult!7828)

(assert (=> b!765866 (= e!426480 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20231 a!3186) j!159) a!3186 mask!3328) lt!340543))))

(declare-fun b!765867 () Bool)

(declare-fun res!518175 () Bool)

(declare-fun e!426481 () Bool)

(assert (=> b!765867 (=> (not res!518175) (not e!426481))))

(assert (=> b!765867 (= res!518175 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20652 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20652 a!3186))))))

(declare-fun b!765868 () Bool)

(assert (=> b!765868 (= e!426480 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20231 a!3186) j!159) a!3186 mask!3328) (Found!7828 j!159)))))

(declare-fun b!765869 () Bool)

(declare-fun e!426485 () Bool)

(assert (=> b!765869 (= e!426485 true)))

(declare-fun lt!340540 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!765869 (= lt!340540 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!765870 () Bool)

(declare-fun res!518180 () Bool)

(assert (=> b!765870 (=> (not res!518180) (not e!426479))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!765870 (= res!518180 (validKeyInArray!0 (select (arr!20231 a!3186) j!159)))))

(declare-fun b!765871 () Bool)

(assert (=> b!765871 (= e!426479 e!426481)))

(declare-fun res!518177 () Bool)

(assert (=> b!765871 (=> (not res!518177) (not e!426481))))

(declare-fun lt!340536 () SeekEntryResult!7828)

(assert (=> b!765871 (= res!518177 (or (= lt!340536 (MissingZero!7828 i!1173)) (= lt!340536 (MissingVacant!7828 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42252 (_ BitVec 32)) SeekEntryResult!7828)

(assert (=> b!765871 (= lt!340536 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!765872 () Bool)

(declare-fun e!426482 () Bool)

(assert (=> b!765872 (= e!426482 e!426478)))

(declare-fun res!518178 () Bool)

(assert (=> b!765872 (=> (not res!518178) (not e!426478))))

(assert (=> b!765872 (= res!518178 (= (seekEntryOrOpen!0 (select (arr!20231 a!3186) j!159) a!3186 mask!3328) lt!340541))))

(assert (=> b!765872 (= lt!340541 (Found!7828 j!159))))

(declare-fun b!765873 () Bool)

(declare-fun res!518168 () Bool)

(assert (=> b!765873 (=> (not res!518168) (not e!426481))))

(declare-datatypes ((List!14272 0))(
  ( (Nil!14269) (Cons!14268 (h!15358 (_ BitVec 64)) (t!20578 List!14272)) )
))
(declare-fun arrayNoDuplicates!0 (array!42252 (_ BitVec 32) List!14272) Bool)

(assert (=> b!765873 (= res!518168 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14269))))

(declare-fun b!765874 () Bool)

(declare-fun e!426477 () Bool)

(assert (=> b!765874 (= e!426477 (not e!426485))))

(declare-fun res!518179 () Bool)

(assert (=> b!765874 (=> res!518179 e!426485)))

(declare-fun lt!340538 () SeekEntryResult!7828)

(get-info :version)

(assert (=> b!765874 (= res!518179 (or (not ((_ is Intermediate!7828) lt!340538)) (bvsge x!1131 (x!64597 lt!340538))))))

(assert (=> b!765874 e!426482))

(declare-fun res!518176 () Bool)

(assert (=> b!765874 (=> (not res!518176) (not e!426482))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42252 (_ BitVec 32)) Bool)

(assert (=> b!765874 (= res!518176 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26354 0))(
  ( (Unit!26355) )
))
(declare-fun lt!340539 () Unit!26354)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42252 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26354)

(assert (=> b!765874 (= lt!340539 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!765875 () Bool)

(declare-fun res!518169 () Bool)

(assert (=> b!765875 (=> (not res!518169) (not e!426479))))

(assert (=> b!765875 (= res!518169 (validKeyInArray!0 k0!2102))))

(declare-fun b!765876 () Bool)

(declare-fun res!518173 () Bool)

(assert (=> b!765876 (=> (not res!518173) (not e!426483))))

(assert (=> b!765876 (= res!518173 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20231 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!765877 () Bool)

(declare-fun res!518171 () Bool)

(assert (=> b!765877 (=> (not res!518171) (not e!426481))))

(assert (=> b!765877 (= res!518171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!765878 () Bool)

(declare-fun res!518183 () Bool)

(assert (=> b!765878 (=> (not res!518183) (not e!426479))))

(declare-fun arrayContainsKey!0 (array!42252 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!765878 (= res!518183 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!765879 () Bool)

(assert (=> b!765879 (= e!426483 e!426477)))

(declare-fun res!518181 () Bool)

(assert (=> b!765879 (=> (not res!518181) (not e!426477))))

(declare-fun lt!340544 () SeekEntryResult!7828)

(assert (=> b!765879 (= res!518181 (= lt!340544 lt!340538))))

(declare-fun lt!340537 () (_ BitVec 64))

(declare-fun lt!340542 () array!42252)

(assert (=> b!765879 (= lt!340538 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340537 lt!340542 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!765879 (= lt!340544 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340537 mask!3328) lt!340537 lt!340542 mask!3328))))

(assert (=> b!765879 (= lt!340537 (select (store (arr!20231 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!765879 (= lt!340542 (array!42253 (store (arr!20231 a!3186) i!1173 k0!2102) (size!20652 a!3186)))))

(declare-fun b!765880 () Bool)

(assert (=> b!765880 (= e!426481 e!426483)))

(declare-fun res!518174 () Bool)

(assert (=> b!765880 (=> (not res!518174) (not e!426483))))

(assert (=> b!765880 (= res!518174 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20231 a!3186) j!159) mask!3328) (select (arr!20231 a!3186) j!159) a!3186 mask!3328) lt!340543))))

(assert (=> b!765880 (= lt!340543 (Intermediate!7828 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!66456 res!518182) b!765865))

(assert (= (and b!765865 res!518172) b!765870))

(assert (= (and b!765870 res!518180) b!765875))

(assert (= (and b!765875 res!518169) b!765878))

(assert (= (and b!765878 res!518183) b!765871))

(assert (= (and b!765871 res!518177) b!765877))

(assert (= (and b!765877 res!518171) b!765873))

(assert (= (and b!765873 res!518168) b!765867))

(assert (= (and b!765867 res!518175) b!765880))

(assert (= (and b!765880 res!518174) b!765876))

(assert (= (and b!765876 res!518173) b!765863))

(assert (= (and b!765863 c!84237) b!765866))

(assert (= (and b!765863 (not c!84237)) b!765868))

(assert (= (and b!765863 res!518170) b!765879))

(assert (= (and b!765879 res!518181) b!765874))

(assert (= (and b!765874 res!518176) b!765872))

(assert (= (and b!765872 res!518178) b!765864))

(assert (= (and b!765874 (not res!518179)) b!765869))

(declare-fun m!711379 () Bool)

(assert (=> b!765874 m!711379))

(declare-fun m!711381 () Bool)

(assert (=> b!765874 m!711381))

(declare-fun m!711383 () Bool)

(assert (=> b!765877 m!711383))

(declare-fun m!711385 () Bool)

(assert (=> b!765866 m!711385))

(assert (=> b!765866 m!711385))

(declare-fun m!711387 () Bool)

(assert (=> b!765866 m!711387))

(declare-fun m!711389 () Bool)

(assert (=> b!765869 m!711389))

(assert (=> b!765880 m!711385))

(assert (=> b!765880 m!711385))

(declare-fun m!711391 () Bool)

(assert (=> b!765880 m!711391))

(assert (=> b!765880 m!711391))

(assert (=> b!765880 m!711385))

(declare-fun m!711393 () Bool)

(assert (=> b!765880 m!711393))

(declare-fun m!711395 () Bool)

(assert (=> b!765879 m!711395))

(declare-fun m!711397 () Bool)

(assert (=> b!765879 m!711397))

(declare-fun m!711399 () Bool)

(assert (=> b!765879 m!711399))

(declare-fun m!711401 () Bool)

(assert (=> b!765879 m!711401))

(declare-fun m!711403 () Bool)

(assert (=> b!765879 m!711403))

(assert (=> b!765879 m!711395))

(declare-fun m!711405 () Bool)

(assert (=> b!765878 m!711405))

(declare-fun m!711407 () Bool)

(assert (=> b!765876 m!711407))

(declare-fun m!711409 () Bool)

(assert (=> b!765871 m!711409))

(declare-fun m!711411 () Bool)

(assert (=> b!765873 m!711411))

(assert (=> b!765870 m!711385))

(assert (=> b!765870 m!711385))

(declare-fun m!711413 () Bool)

(assert (=> b!765870 m!711413))

(assert (=> b!765868 m!711385))

(assert (=> b!765868 m!711385))

(declare-fun m!711415 () Bool)

(assert (=> b!765868 m!711415))

(declare-fun m!711417 () Bool)

(assert (=> start!66456 m!711417))

(declare-fun m!711419 () Bool)

(assert (=> start!66456 m!711419))

(assert (=> b!765872 m!711385))

(assert (=> b!765872 m!711385))

(declare-fun m!711421 () Bool)

(assert (=> b!765872 m!711421))

(assert (=> b!765864 m!711385))

(assert (=> b!765864 m!711385))

(declare-fun m!711423 () Bool)

(assert (=> b!765864 m!711423))

(declare-fun m!711425 () Bool)

(assert (=> b!765875 m!711425))

(check-sat (not b!765868) (not b!765873) (not b!765871) (not b!765879) (not start!66456) (not b!765869) (not b!765880) (not b!765875) (not b!765864) (not b!765870) (not b!765874) (not b!765877) (not b!765878) (not b!765872) (not b!765866))
(check-sat)
