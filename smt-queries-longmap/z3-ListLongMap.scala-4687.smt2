; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65162 () Bool)

(assert start!65162)

(declare-fun b!737082 () Bool)

(declare-fun e!412272 () Bool)

(declare-fun e!412276 () Bool)

(assert (=> b!737082 (= e!412272 e!412276)))

(declare-fun res!495497 () Bool)

(assert (=> b!737082 (=> res!495497 e!412276)))

(declare-datatypes ((array!41352 0))(
  ( (array!41353 (arr!19790 (Array (_ BitVec 32) (_ BitVec 64))) (size!20211 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41352)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!326882 () (_ BitVec 32))

(assert (=> b!737082 (= res!495497 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326882 #b00000000000000000000000000000000) (bvsge lt!326882 (size!20211 a!3186))))))

(declare-datatypes ((Unit!25124 0))(
  ( (Unit!25125) )
))
(declare-fun lt!326880 () Unit!25124)

(declare-fun e!412271 () Unit!25124)

(assert (=> b!737082 (= lt!326880 e!412271)))

(declare-fun c!81178 () Bool)

(declare-fun lt!326887 () Bool)

(assert (=> b!737082 (= c!81178 lt!326887)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!737082 (= lt!326887 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737082 (= lt!326882 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!737083 () Bool)

(declare-fun res!495492 () Bool)

(declare-fun e!412275 () Bool)

(assert (=> b!737083 (=> (not res!495492) (not e!412275))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!737083 (= res!495492 (validKeyInArray!0 k0!2102))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!412270 () Bool)

(declare-datatypes ((SeekEntryResult!7387 0))(
  ( (MissingZero!7387 (index!31916 (_ BitVec 32))) (Found!7387 (index!31917 (_ BitVec 32))) (Intermediate!7387 (undefined!8199 Bool) (index!31918 (_ BitVec 32)) (x!62924 (_ BitVec 32))) (Undefined!7387) (MissingVacant!7387 (index!31919 (_ BitVec 32))) )
))
(declare-fun lt!326890 () SeekEntryResult!7387)

(declare-fun b!737084 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41352 (_ BitVec 32)) SeekEntryResult!7387)

(assert (=> b!737084 (= e!412270 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19790 a!3186) j!159) a!3186 mask!3328) lt!326890))))

(declare-fun b!737085 () Bool)

(declare-fun e!412273 () Bool)

(declare-fun e!412274 () Bool)

(assert (=> b!737085 (= e!412273 e!412274)))

(declare-fun res!495495 () Bool)

(assert (=> b!737085 (=> (not res!495495) (not e!412274))))

(declare-fun lt!326891 () SeekEntryResult!7387)

(declare-fun lt!326885 () SeekEntryResult!7387)

(assert (=> b!737085 (= res!495495 (= lt!326891 lt!326885))))

(declare-fun lt!326889 () (_ BitVec 64))

(declare-fun lt!326878 () array!41352)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41352 (_ BitVec 32)) SeekEntryResult!7387)

(assert (=> b!737085 (= lt!326885 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326889 lt!326878 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737085 (= lt!326891 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326889 mask!3328) lt!326889 lt!326878 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!737085 (= lt!326889 (select (store (arr!19790 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!737085 (= lt!326878 (array!41353 (store (arr!19790 a!3186) i!1173 k0!2102) (size!20211 a!3186)))))

(declare-fun b!737086 () Bool)

(declare-fun res!495501 () Bool)

(declare-fun e!412267 () Bool)

(assert (=> b!737086 (=> (not res!495501) (not e!412267))))

(declare-datatypes ((List!13831 0))(
  ( (Nil!13828) (Cons!13827 (h!14899 (_ BitVec 64)) (t!20137 List!13831)) )
))
(declare-fun arrayNoDuplicates!0 (array!41352 (_ BitVec 32) List!13831) Bool)

(assert (=> b!737086 (= res!495501 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13828))))

(declare-fun e!412268 () Bool)

(declare-fun b!737087 () Bool)

(declare-fun lt!326888 () SeekEntryResult!7387)

(assert (=> b!737087 (= e!412268 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19790 a!3186) j!159) a!3186 mask!3328) lt!326888))))

(declare-fun b!737088 () Bool)

(assert (=> b!737088 (= e!412274 (not e!412272))))

(declare-fun res!495487 () Bool)

(assert (=> b!737088 (=> res!495487 e!412272)))

(get-info :version)

(assert (=> b!737088 (= res!495487 (or (not ((_ is Intermediate!7387) lt!326885)) (bvsge x!1131 (x!62924 lt!326885))))))

(declare-fun lt!326883 () SeekEntryResult!7387)

(assert (=> b!737088 (= lt!326883 (Found!7387 j!159))))

(declare-fun e!412265 () Bool)

(assert (=> b!737088 e!412265))

(declare-fun res!495503 () Bool)

(assert (=> b!737088 (=> (not res!495503) (not e!412265))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41352 (_ BitVec 32)) Bool)

(assert (=> b!737088 (= res!495503 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!326884 () Unit!25124)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41352 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25124)

(assert (=> b!737088 (= lt!326884 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!737089 () Bool)

(assert (=> b!737089 (= e!412265 e!412270)))

(declare-fun res!495494 () Bool)

(assert (=> b!737089 (=> (not res!495494) (not e!412270))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41352 (_ BitVec 32)) SeekEntryResult!7387)

(assert (=> b!737089 (= res!495494 (= (seekEntryOrOpen!0 (select (arr!19790 a!3186) j!159) a!3186 mask!3328) lt!326890))))

(assert (=> b!737089 (= lt!326890 (Found!7387 j!159))))

(declare-fun b!737090 () Bool)

(declare-fun res!495498 () Bool)

(assert (=> b!737090 (=> (not res!495498) (not e!412267))))

(assert (=> b!737090 (= res!495498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!737091 () Bool)

(declare-fun Unit!25126 () Unit!25124)

(assert (=> b!737091 (= e!412271 Unit!25126)))

(assert (=> b!737091 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326882 (select (arr!19790 a!3186) j!159) a!3186 mask!3328) lt!326888)))

(declare-fun b!737092 () Bool)

(declare-fun e!412269 () Bool)

(assert (=> b!737092 (= e!412269 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326882 resIntermediateIndex!5 (select (arr!19790 a!3186) j!159) a!3186 mask!3328) lt!326883)))))

(declare-fun b!737093 () Bool)

(declare-fun res!495490 () Bool)

(assert (=> b!737093 (=> (not res!495490) (not e!412275))))

(assert (=> b!737093 (= res!495490 (and (= (size!20211 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20211 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20211 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!737094 () Bool)

(declare-fun res!495489 () Bool)

(assert (=> b!737094 (=> (not res!495489) (not e!412267))))

(assert (=> b!737094 (= res!495489 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20211 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20211 a!3186))))))

(declare-fun b!737095 () Bool)

(assert (=> b!737095 (= e!412268 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19790 a!3186) j!159) a!3186 mask!3328) (Found!7387 j!159)))))

(declare-fun res!495488 () Bool)

(assert (=> start!65162 (=> (not res!495488) (not e!412275))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65162 (= res!495488 (validMask!0 mask!3328))))

(assert (=> start!65162 e!412275))

(assert (=> start!65162 true))

(declare-fun array_inv!15673 (array!41352) Bool)

(assert (=> start!65162 (array_inv!15673 a!3186)))

(declare-fun b!737096 () Bool)

(declare-fun res!495491 () Bool)

(assert (=> b!737096 (=> res!495491 e!412276)))

(assert (=> b!737096 (= res!495491 e!412269)))

(declare-fun c!81179 () Bool)

(assert (=> b!737096 (= c!81179 lt!326887)))

(declare-fun b!737097 () Bool)

(declare-fun res!495499 () Bool)

(assert (=> b!737097 (=> (not res!495499) (not e!412275))))

(declare-fun arrayContainsKey!0 (array!41352 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!737097 (= res!495499 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!737098 () Bool)

(assert (=> b!737098 (= e!412267 e!412273)))

(declare-fun res!495502 () Bool)

(assert (=> b!737098 (=> (not res!495502) (not e!412273))))

(assert (=> b!737098 (= res!495502 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19790 a!3186) j!159) mask!3328) (select (arr!19790 a!3186) j!159) a!3186 mask!3328) lt!326888))))

(assert (=> b!737098 (= lt!326888 (Intermediate!7387 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!737099 () Bool)

(declare-fun res!495493 () Bool)

(assert (=> b!737099 (=> (not res!495493) (not e!412273))))

(assert (=> b!737099 (= res!495493 e!412268)))

(declare-fun c!81180 () Bool)

(assert (=> b!737099 (= c!81180 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!737100 () Bool)

(assert (=> b!737100 (= e!412276 true)))

(declare-fun lt!326886 () SeekEntryResult!7387)

(assert (=> b!737100 (= lt!326886 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326882 lt!326889 lt!326878 mask!3328))))

(declare-fun b!737101 () Bool)

(assert (=> b!737101 (= e!412269 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326882 (select (arr!19790 a!3186) j!159) a!3186 mask!3328) lt!326888)))))

(declare-fun b!737102 () Bool)

(declare-fun res!495504 () Bool)

(assert (=> b!737102 (=> (not res!495504) (not e!412275))))

(assert (=> b!737102 (= res!495504 (validKeyInArray!0 (select (arr!19790 a!3186) j!159)))))

(declare-fun b!737103 () Bool)

(declare-fun Unit!25127 () Unit!25124)

(assert (=> b!737103 (= e!412271 Unit!25127)))

(declare-fun lt!326879 () SeekEntryResult!7387)

(assert (=> b!737103 (= lt!326879 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19790 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!737103 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326882 resIntermediateIndex!5 (select (arr!19790 a!3186) j!159) a!3186 mask!3328) lt!326883)))

(declare-fun b!737104 () Bool)

(assert (=> b!737104 (= e!412275 e!412267)))

(declare-fun res!495500 () Bool)

(assert (=> b!737104 (=> (not res!495500) (not e!412267))))

(declare-fun lt!326881 () SeekEntryResult!7387)

(assert (=> b!737104 (= res!495500 (or (= lt!326881 (MissingZero!7387 i!1173)) (= lt!326881 (MissingVacant!7387 i!1173))))))

(assert (=> b!737104 (= lt!326881 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!737105 () Bool)

(declare-fun res!495496 () Bool)

(assert (=> b!737105 (=> (not res!495496) (not e!412273))))

(assert (=> b!737105 (= res!495496 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19790 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!65162 res!495488) b!737093))

(assert (= (and b!737093 res!495490) b!737102))

(assert (= (and b!737102 res!495504) b!737083))

(assert (= (and b!737083 res!495492) b!737097))

(assert (= (and b!737097 res!495499) b!737104))

(assert (= (and b!737104 res!495500) b!737090))

(assert (= (and b!737090 res!495498) b!737086))

(assert (= (and b!737086 res!495501) b!737094))

(assert (= (and b!737094 res!495489) b!737098))

(assert (= (and b!737098 res!495502) b!737105))

(assert (= (and b!737105 res!495496) b!737099))

(assert (= (and b!737099 c!81180) b!737087))

(assert (= (and b!737099 (not c!81180)) b!737095))

(assert (= (and b!737099 res!495493) b!737085))

(assert (= (and b!737085 res!495495) b!737088))

(assert (= (and b!737088 res!495503) b!737089))

(assert (= (and b!737089 res!495494) b!737084))

(assert (= (and b!737088 (not res!495487)) b!737082))

(assert (= (and b!737082 c!81178) b!737091))

(assert (= (and b!737082 (not c!81178)) b!737103))

(assert (= (and b!737082 (not res!495497)) b!737096))

(assert (= (and b!737096 c!81179) b!737101))

(assert (= (and b!737096 (not c!81179)) b!737092))

(assert (= (and b!737096 (not res!495491)) b!737100))

(declare-fun m!688481 () Bool)

(assert (=> b!737104 m!688481))

(declare-fun m!688483 () Bool)

(assert (=> b!737088 m!688483))

(declare-fun m!688485 () Bool)

(assert (=> b!737088 m!688485))

(declare-fun m!688487 () Bool)

(assert (=> b!737092 m!688487))

(assert (=> b!737092 m!688487))

(declare-fun m!688489 () Bool)

(assert (=> b!737092 m!688489))

(assert (=> b!737101 m!688487))

(assert (=> b!737101 m!688487))

(declare-fun m!688491 () Bool)

(assert (=> b!737101 m!688491))

(assert (=> b!737098 m!688487))

(assert (=> b!737098 m!688487))

(declare-fun m!688493 () Bool)

(assert (=> b!737098 m!688493))

(assert (=> b!737098 m!688493))

(assert (=> b!737098 m!688487))

(declare-fun m!688495 () Bool)

(assert (=> b!737098 m!688495))

(declare-fun m!688497 () Bool)

(assert (=> b!737090 m!688497))

(assert (=> b!737087 m!688487))

(assert (=> b!737087 m!688487))

(declare-fun m!688499 () Bool)

(assert (=> b!737087 m!688499))

(assert (=> b!737084 m!688487))

(assert (=> b!737084 m!688487))

(declare-fun m!688501 () Bool)

(assert (=> b!737084 m!688501))

(declare-fun m!688503 () Bool)

(assert (=> b!737100 m!688503))

(declare-fun m!688505 () Bool)

(assert (=> start!65162 m!688505))

(declare-fun m!688507 () Bool)

(assert (=> start!65162 m!688507))

(assert (=> b!737091 m!688487))

(assert (=> b!737091 m!688487))

(assert (=> b!737091 m!688491))

(assert (=> b!737095 m!688487))

(assert (=> b!737095 m!688487))

(declare-fun m!688509 () Bool)

(assert (=> b!737095 m!688509))

(declare-fun m!688511 () Bool)

(assert (=> b!737097 m!688511))

(declare-fun m!688513 () Bool)

(assert (=> b!737083 m!688513))

(declare-fun m!688515 () Bool)

(assert (=> b!737082 m!688515))

(declare-fun m!688517 () Bool)

(assert (=> b!737086 m!688517))

(assert (=> b!737089 m!688487))

(assert (=> b!737089 m!688487))

(declare-fun m!688519 () Bool)

(assert (=> b!737089 m!688519))

(assert (=> b!737103 m!688487))

(assert (=> b!737103 m!688487))

(assert (=> b!737103 m!688509))

(assert (=> b!737103 m!688487))

(assert (=> b!737103 m!688489))

(declare-fun m!688521 () Bool)

(assert (=> b!737105 m!688521))

(declare-fun m!688523 () Bool)

(assert (=> b!737085 m!688523))

(declare-fun m!688525 () Bool)

(assert (=> b!737085 m!688525))

(declare-fun m!688527 () Bool)

(assert (=> b!737085 m!688527))

(assert (=> b!737085 m!688523))

(declare-fun m!688529 () Bool)

(assert (=> b!737085 m!688529))

(declare-fun m!688531 () Bool)

(assert (=> b!737085 m!688531))

(assert (=> b!737102 m!688487))

(assert (=> b!737102 m!688487))

(declare-fun m!688533 () Bool)

(assert (=> b!737102 m!688533))

(check-sat (not b!737088) (not b!737082) (not b!737098) (not b!737087) (not b!737104) (not b!737085) (not b!737100) (not b!737092) (not b!737101) (not b!737090) (not b!737097) (not b!737089) (not b!737084) (not b!737103) (not b!737091) (not b!737102) (not b!737083) (not start!65162) (not b!737086) (not b!737095))
(check-sat)
