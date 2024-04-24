; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66922 () Bool)

(assert start!66922)

(declare-fun b!771161 () Bool)

(declare-fun res!521490 () Bool)

(declare-fun e!429411 () Bool)

(assert (=> b!771161 (=> (not res!521490) (not e!429411))))

(declare-datatypes ((array!42364 0))(
  ( (array!42365 (arr!20278 (Array (_ BitVec 32) (_ BitVec 64))) (size!20698 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42364)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42364 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!771161 (= res!521490 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!771162 () Bool)

(declare-fun e!429408 () Bool)

(declare-fun e!429413 () Bool)

(assert (=> b!771162 (= e!429408 (not e!429413))))

(declare-fun res!521496 () Bool)

(assert (=> b!771162 (=> res!521496 e!429413)))

(declare-datatypes ((SeekEntryResult!7834 0))(
  ( (MissingZero!7834 (index!33704 (_ BitVec 32))) (Found!7834 (index!33705 (_ BitVec 32))) (Intermediate!7834 (undefined!8646 Bool) (index!33706 (_ BitVec 32)) (x!64792 (_ BitVec 32))) (Undefined!7834) (MissingVacant!7834 (index!33707 (_ BitVec 32))) )
))
(declare-fun lt!343211 () SeekEntryResult!7834)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!771162 (= res!521496 (or (not ((_ is Intermediate!7834) lt!343211)) (bvsge x!1131 (x!64792 lt!343211))))))

(declare-fun e!429414 () Bool)

(assert (=> b!771162 e!429414))

(declare-fun res!521488 () Bool)

(assert (=> b!771162 (=> (not res!521488) (not e!429414))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42364 (_ BitVec 32)) Bool)

(assert (=> b!771162 (= res!521488 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26527 0))(
  ( (Unit!26528) )
))
(declare-fun lt!343215 () Unit!26527)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42364 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26527)

(assert (=> b!771162 (= lt!343215 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!771163 () Bool)

(declare-fun e!429410 () Unit!26527)

(declare-fun Unit!26529 () Unit!26527)

(assert (=> b!771163 (= e!429410 Unit!26529)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!343212 () SeekEntryResult!7834)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42364 (_ BitVec 32)) SeekEntryResult!7834)

(assert (=> b!771163 (= lt!343212 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20278 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!343219 () (_ BitVec 32))

(assert (=> b!771163 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343219 resIntermediateIndex!5 (select (arr!20278 a!3186) j!159) a!3186 mask!3328) (Found!7834 j!159))))

(declare-fun res!521494 () Bool)

(assert (=> start!66922 (=> (not res!521494) (not e!429411))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66922 (= res!521494 (validMask!0 mask!3328))))

(assert (=> start!66922 e!429411))

(assert (=> start!66922 true))

(declare-fun array_inv!16137 (array!42364) Bool)

(assert (=> start!66922 (array_inv!16137 a!3186)))

(declare-fun b!771164 () Bool)

(declare-fun e!429406 () Bool)

(declare-fun lt!343210 () SeekEntryResult!7834)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42364 (_ BitVec 32)) SeekEntryResult!7834)

(assert (=> b!771164 (= e!429406 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20278 a!3186) j!159) a!3186 mask!3328) lt!343210))))

(declare-fun b!771165 () Bool)

(declare-fun res!521499 () Bool)

(assert (=> b!771165 (=> (not res!521499) (not e!429411))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!771165 (= res!521499 (and (= (size!20698 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20698 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20698 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!771166 () Bool)

(declare-fun res!521489 () Bool)

(declare-fun e!429415 () Bool)

(assert (=> b!771166 (=> (not res!521489) (not e!429415))))

(assert (=> b!771166 (= res!521489 e!429406)))

(declare-fun c!85237 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!771166 (= c!85237 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!771167 () Bool)

(declare-fun Unit!26530 () Unit!26527)

(assert (=> b!771167 (= e!429410 Unit!26530)))

(assert (=> b!771167 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343219 (select (arr!20278 a!3186) j!159) a!3186 mask!3328) lt!343210)))

(declare-fun b!771168 () Bool)

(declare-fun res!521491 () Bool)

(assert (=> b!771168 (=> (not res!521491) (not e!429411))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!771168 (= res!521491 (validKeyInArray!0 (select (arr!20278 a!3186) j!159)))))

(declare-fun b!771169 () Bool)

(declare-fun res!521484 () Bool)

(declare-fun e!429412 () Bool)

(assert (=> b!771169 (=> (not res!521484) (not e!429412))))

(declare-datatypes ((List!14187 0))(
  ( (Nil!14184) (Cons!14183 (h!15288 (_ BitVec 64)) (t!20494 List!14187)) )
))
(declare-fun arrayNoDuplicates!0 (array!42364 (_ BitVec 32) List!14187) Bool)

(assert (=> b!771169 (= res!521484 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14184))))

(declare-fun b!771170 () Bool)

(assert (=> b!771170 (= e!429415 e!429408)))

(declare-fun res!521492 () Bool)

(assert (=> b!771170 (=> (not res!521492) (not e!429408))))

(declare-fun lt!343214 () SeekEntryResult!7834)

(assert (=> b!771170 (= res!521492 (= lt!343214 lt!343211))))

(declare-fun lt!343209 () array!42364)

(declare-fun lt!343218 () (_ BitVec 64))

(assert (=> b!771170 (= lt!343211 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343218 lt!343209 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!771170 (= lt!343214 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343218 mask!3328) lt!343218 lt!343209 mask!3328))))

(assert (=> b!771170 (= lt!343218 (select (store (arr!20278 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!771170 (= lt!343209 (array!42365 (store (arr!20278 a!3186) i!1173 k0!2102) (size!20698 a!3186)))))

(declare-fun b!771171 () Bool)

(declare-fun res!521493 () Bool)

(assert (=> b!771171 (=> (not res!521493) (not e!429415))))

(assert (=> b!771171 (= res!521493 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20278 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!771172 () Bool)

(declare-fun res!521487 () Bool)

(assert (=> b!771172 (=> (not res!521487) (not e!429412))))

(assert (=> b!771172 (= res!521487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!771173 () Bool)

(assert (=> b!771173 (= e!429406 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20278 a!3186) j!159) a!3186 mask!3328) (Found!7834 j!159)))))

(declare-fun b!771174 () Bool)

(declare-fun e!429407 () Bool)

(assert (=> b!771174 (= e!429414 e!429407)))

(declare-fun res!521498 () Bool)

(assert (=> b!771174 (=> (not res!521498) (not e!429407))))

(declare-fun lt!343217 () SeekEntryResult!7834)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42364 (_ BitVec 32)) SeekEntryResult!7834)

(assert (=> b!771174 (= res!521498 (= (seekEntryOrOpen!0 (select (arr!20278 a!3186) j!159) a!3186 mask!3328) lt!343217))))

(assert (=> b!771174 (= lt!343217 (Found!7834 j!159))))

(declare-fun b!771175 () Bool)

(declare-fun res!521486 () Bool)

(assert (=> b!771175 (=> (not res!521486) (not e!429412))))

(assert (=> b!771175 (= res!521486 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20698 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20698 a!3186))))))

(declare-fun b!771176 () Bool)

(declare-fun res!521485 () Bool)

(assert (=> b!771176 (=> (not res!521485) (not e!429411))))

(assert (=> b!771176 (= res!521485 (validKeyInArray!0 k0!2102))))

(declare-fun b!771177 () Bool)

(assert (=> b!771177 (= e!429413 true)))

(declare-fun lt!343213 () Unit!26527)

(assert (=> b!771177 (= lt!343213 e!429410)))

(declare-fun c!85238 () Bool)

(assert (=> b!771177 (= c!85238 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!771177 (= lt!343219 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!771178 () Bool)

(assert (=> b!771178 (= e!429412 e!429415)))

(declare-fun res!521497 () Bool)

(assert (=> b!771178 (=> (not res!521497) (not e!429415))))

(assert (=> b!771178 (= res!521497 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20278 a!3186) j!159) mask!3328) (select (arr!20278 a!3186) j!159) a!3186 mask!3328) lt!343210))))

(assert (=> b!771178 (= lt!343210 (Intermediate!7834 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!771179 () Bool)

(assert (=> b!771179 (= e!429411 e!429412)))

(declare-fun res!521495 () Bool)

(assert (=> b!771179 (=> (not res!521495) (not e!429412))))

(declare-fun lt!343216 () SeekEntryResult!7834)

(assert (=> b!771179 (= res!521495 (or (= lt!343216 (MissingZero!7834 i!1173)) (= lt!343216 (MissingVacant!7834 i!1173))))))

(assert (=> b!771179 (= lt!343216 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!771180 () Bool)

(assert (=> b!771180 (= e!429407 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20278 a!3186) j!159) a!3186 mask!3328) lt!343217))))

(assert (= (and start!66922 res!521494) b!771165))

(assert (= (and b!771165 res!521499) b!771168))

(assert (= (and b!771168 res!521491) b!771176))

(assert (= (and b!771176 res!521485) b!771161))

(assert (= (and b!771161 res!521490) b!771179))

(assert (= (and b!771179 res!521495) b!771172))

(assert (= (and b!771172 res!521487) b!771169))

(assert (= (and b!771169 res!521484) b!771175))

(assert (= (and b!771175 res!521486) b!771178))

(assert (= (and b!771178 res!521497) b!771171))

(assert (= (and b!771171 res!521493) b!771166))

(assert (= (and b!771166 c!85237) b!771164))

(assert (= (and b!771166 (not c!85237)) b!771173))

(assert (= (and b!771166 res!521489) b!771170))

(assert (= (and b!771170 res!521492) b!771162))

(assert (= (and b!771162 res!521488) b!771174))

(assert (= (and b!771174 res!521498) b!771180))

(assert (= (and b!771162 (not res!521496)) b!771177))

(assert (= (and b!771177 c!85238) b!771167))

(assert (= (and b!771177 (not c!85238)) b!771163))

(declare-fun m!716831 () Bool)

(assert (=> b!771176 m!716831))

(declare-fun m!716833 () Bool)

(assert (=> b!771172 m!716833))

(declare-fun m!716835 () Bool)

(assert (=> b!771168 m!716835))

(assert (=> b!771168 m!716835))

(declare-fun m!716837 () Bool)

(assert (=> b!771168 m!716837))

(declare-fun m!716839 () Bool)

(assert (=> b!771177 m!716839))

(assert (=> b!771180 m!716835))

(assert (=> b!771180 m!716835))

(declare-fun m!716841 () Bool)

(assert (=> b!771180 m!716841))

(declare-fun m!716843 () Bool)

(assert (=> b!771170 m!716843))

(declare-fun m!716845 () Bool)

(assert (=> b!771170 m!716845))

(declare-fun m!716847 () Bool)

(assert (=> b!771170 m!716847))

(assert (=> b!771170 m!716843))

(declare-fun m!716849 () Bool)

(assert (=> b!771170 m!716849))

(declare-fun m!716851 () Bool)

(assert (=> b!771170 m!716851))

(declare-fun m!716853 () Bool)

(assert (=> b!771169 m!716853))

(assert (=> b!771167 m!716835))

(assert (=> b!771167 m!716835))

(declare-fun m!716855 () Bool)

(assert (=> b!771167 m!716855))

(assert (=> b!771174 m!716835))

(assert (=> b!771174 m!716835))

(declare-fun m!716857 () Bool)

(assert (=> b!771174 m!716857))

(declare-fun m!716859 () Bool)

(assert (=> b!771179 m!716859))

(assert (=> b!771163 m!716835))

(assert (=> b!771163 m!716835))

(declare-fun m!716861 () Bool)

(assert (=> b!771163 m!716861))

(assert (=> b!771163 m!716835))

(declare-fun m!716863 () Bool)

(assert (=> b!771163 m!716863))

(declare-fun m!716865 () Bool)

(assert (=> b!771171 m!716865))

(assert (=> b!771178 m!716835))

(assert (=> b!771178 m!716835))

(declare-fun m!716867 () Bool)

(assert (=> b!771178 m!716867))

(assert (=> b!771178 m!716867))

(assert (=> b!771178 m!716835))

(declare-fun m!716869 () Bool)

(assert (=> b!771178 m!716869))

(declare-fun m!716871 () Bool)

(assert (=> b!771161 m!716871))

(assert (=> b!771164 m!716835))

(assert (=> b!771164 m!716835))

(declare-fun m!716873 () Bool)

(assert (=> b!771164 m!716873))

(declare-fun m!716875 () Bool)

(assert (=> start!66922 m!716875))

(declare-fun m!716877 () Bool)

(assert (=> start!66922 m!716877))

(declare-fun m!716879 () Bool)

(assert (=> b!771162 m!716879))

(declare-fun m!716881 () Bool)

(assert (=> b!771162 m!716881))

(assert (=> b!771173 m!716835))

(assert (=> b!771173 m!716835))

(assert (=> b!771173 m!716861))

(check-sat (not b!771174) (not b!771162) (not b!771176) (not b!771173) (not b!771178) (not b!771167) (not b!771179) (not b!771172) (not b!771180) (not b!771161) (not b!771169) (not b!771170) (not b!771164) (not b!771163) (not start!66922) (not b!771168) (not b!771177))
(check-sat)
