; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64668 () Bool)

(assert start!64668)

(declare-fun b!727610 () Bool)

(declare-fun res!488110 () Bool)

(declare-fun e!407417 () Bool)

(assert (=> b!727610 (=> (not res!488110) (not e!407417))))

(declare-datatypes ((array!41056 0))(
  ( (array!41057 (arr!19645 (Array (_ BitVec 32) (_ BitVec 64))) (size!20065 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41056)

(declare-datatypes ((List!13554 0))(
  ( (Nil!13551) (Cons!13550 (h!14613 (_ BitVec 64)) (t!19861 List!13554)) )
))
(declare-fun arrayNoDuplicates!0 (array!41056 (_ BitVec 32) List!13554) Bool)

(assert (=> b!727610 (= res!488110 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13551))))

(declare-fun b!727611 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun e!407413 () Bool)

(assert (=> b!727611 (= e!407413 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5) (bvsge mask!3328 #b00000000000000000000000000000000)))))

(declare-fun lt!322222 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727611 (= lt!322222 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!727612 () Bool)

(declare-fun res!488107 () Bool)

(declare-fun e!407410 () Bool)

(assert (=> b!727612 (=> (not res!488107) (not e!407410))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41056 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!727612 (= res!488107 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!727613 () Bool)

(declare-fun res!488116 () Bool)

(assert (=> b!727613 (=> (not res!488116) (not e!407417))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41056 (_ BitVec 32)) Bool)

(assert (=> b!727613 (= res!488116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!727614 () Bool)

(declare-fun res!488108 () Bool)

(declare-fun e!407411 () Bool)

(assert (=> b!727614 (=> (not res!488108) (not e!407411))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!727614 (= res!488108 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19645 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!727616 () Bool)

(declare-fun res!488117 () Bool)

(assert (=> b!727616 (=> (not res!488117) (not e!407417))))

(assert (=> b!727616 (= res!488117 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20065 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20065 a!3186))))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7201 0))(
  ( (MissingZero!7201 (index!31172 (_ BitVec 32))) (Found!7201 (index!31173 (_ BitVec 32))) (Intermediate!7201 (undefined!8013 Bool) (index!31174 (_ BitVec 32)) (x!62319 (_ BitVec 32))) (Undefined!7201) (MissingVacant!7201 (index!31175 (_ BitVec 32))) )
))
(declare-fun lt!322223 () SeekEntryResult!7201)

(declare-fun b!727617 () Bool)

(declare-fun e!407416 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41056 (_ BitVec 32)) SeekEntryResult!7201)

(assert (=> b!727617 (= e!407416 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19645 a!3186) j!159) a!3186 mask!3328) lt!322223))))

(declare-fun b!727618 () Bool)

(declare-fun e!407414 () Bool)

(assert (=> b!727618 (= e!407411 e!407414)))

(declare-fun res!488113 () Bool)

(assert (=> b!727618 (=> (not res!488113) (not e!407414))))

(declare-fun lt!322224 () SeekEntryResult!7201)

(declare-fun lt!322225 () SeekEntryResult!7201)

(assert (=> b!727618 (= res!488113 (= lt!322224 lt!322225))))

(declare-fun lt!322228 () array!41056)

(declare-fun lt!322227 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41056 (_ BitVec 32)) SeekEntryResult!7201)

(assert (=> b!727618 (= lt!322225 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322227 lt!322228 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727618 (= lt!322224 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322227 mask!3328) lt!322227 lt!322228 mask!3328))))

(assert (=> b!727618 (= lt!322227 (select (store (arr!19645 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!727618 (= lt!322228 (array!41057 (store (arr!19645 a!3186) i!1173 k0!2102) (size!20065 a!3186)))))

(declare-fun b!727619 () Bool)

(assert (=> b!727619 (= e!407410 e!407417)))

(declare-fun res!488106 () Bool)

(assert (=> b!727619 (=> (not res!488106) (not e!407417))))

(declare-fun lt!322226 () SeekEntryResult!7201)

(assert (=> b!727619 (= res!488106 (or (= lt!322226 (MissingZero!7201 i!1173)) (= lt!322226 (MissingVacant!7201 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41056 (_ BitVec 32)) SeekEntryResult!7201)

(assert (=> b!727619 (= lt!322226 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun e!407418 () Bool)

(declare-fun b!727620 () Bool)

(assert (=> b!727620 (= e!407418 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19645 a!3186) j!159) a!3186 mask!3328) (Found!7201 j!159)))))

(declare-fun b!727621 () Bool)

(declare-fun res!488111 () Bool)

(assert (=> b!727621 (=> (not res!488111) (not e!407410))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!727621 (= res!488111 (validKeyInArray!0 (select (arr!19645 a!3186) j!159)))))

(declare-fun b!727622 () Bool)

(assert (=> b!727622 (= e!407414 (not e!407413))))

(declare-fun res!488105 () Bool)

(assert (=> b!727622 (=> res!488105 e!407413)))

(get-info :version)

(assert (=> b!727622 (= res!488105 (or (not ((_ is Intermediate!7201) lt!322225)) (bvsge x!1131 (x!62319 lt!322225))))))

(declare-fun e!407412 () Bool)

(assert (=> b!727622 e!407412))

(declare-fun res!488118 () Bool)

(assert (=> b!727622 (=> (not res!488118) (not e!407412))))

(assert (=> b!727622 (= res!488118 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24799 0))(
  ( (Unit!24800) )
))
(declare-fun lt!322229 () Unit!24799)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41056 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24799)

(assert (=> b!727622 (= lt!322229 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!727623 () Bool)

(declare-fun lt!322230 () SeekEntryResult!7201)

(assert (=> b!727623 (= e!407418 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19645 a!3186) j!159) a!3186 mask!3328) lt!322230))))

(declare-fun res!488104 () Bool)

(assert (=> start!64668 (=> (not res!488104) (not e!407410))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64668 (= res!488104 (validMask!0 mask!3328))))

(assert (=> start!64668 e!407410))

(assert (=> start!64668 true))

(declare-fun array_inv!15504 (array!41056) Bool)

(assert (=> start!64668 (array_inv!15504 a!3186)))

(declare-fun b!727615 () Bool)

(declare-fun res!488114 () Bool)

(assert (=> b!727615 (=> (not res!488114) (not e!407411))))

(assert (=> b!727615 (= res!488114 e!407418)))

(declare-fun c!80129 () Bool)

(assert (=> b!727615 (= c!80129 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!727624 () Bool)

(assert (=> b!727624 (= e!407417 e!407411)))

(declare-fun res!488119 () Bool)

(assert (=> b!727624 (=> (not res!488119) (not e!407411))))

(assert (=> b!727624 (= res!488119 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19645 a!3186) j!159) mask!3328) (select (arr!19645 a!3186) j!159) a!3186 mask!3328) lt!322230))))

(assert (=> b!727624 (= lt!322230 (Intermediate!7201 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!727625 () Bool)

(declare-fun res!488112 () Bool)

(assert (=> b!727625 (=> (not res!488112) (not e!407410))))

(assert (=> b!727625 (= res!488112 (validKeyInArray!0 k0!2102))))

(declare-fun b!727626 () Bool)

(declare-fun res!488109 () Bool)

(assert (=> b!727626 (=> (not res!488109) (not e!407410))))

(assert (=> b!727626 (= res!488109 (and (= (size!20065 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20065 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20065 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!727627 () Bool)

(assert (=> b!727627 (= e!407412 e!407416)))

(declare-fun res!488115 () Bool)

(assert (=> b!727627 (=> (not res!488115) (not e!407416))))

(assert (=> b!727627 (= res!488115 (= (seekEntryOrOpen!0 (select (arr!19645 a!3186) j!159) a!3186 mask!3328) lt!322223))))

(assert (=> b!727627 (= lt!322223 (Found!7201 j!159))))

(assert (= (and start!64668 res!488104) b!727626))

(assert (= (and b!727626 res!488109) b!727621))

(assert (= (and b!727621 res!488111) b!727625))

(assert (= (and b!727625 res!488112) b!727612))

(assert (= (and b!727612 res!488107) b!727619))

(assert (= (and b!727619 res!488106) b!727613))

(assert (= (and b!727613 res!488116) b!727610))

(assert (= (and b!727610 res!488110) b!727616))

(assert (= (and b!727616 res!488117) b!727624))

(assert (= (and b!727624 res!488119) b!727614))

(assert (= (and b!727614 res!488108) b!727615))

(assert (= (and b!727615 c!80129) b!727623))

(assert (= (and b!727615 (not c!80129)) b!727620))

(assert (= (and b!727615 res!488114) b!727618))

(assert (= (and b!727618 res!488113) b!727622))

(assert (= (and b!727622 res!488118) b!727627))

(assert (= (and b!727627 res!488115) b!727617))

(assert (= (and b!727622 (not res!488105)) b!727611))

(declare-fun m!682011 () Bool)

(assert (=> b!727617 m!682011))

(assert (=> b!727617 m!682011))

(declare-fun m!682013 () Bool)

(assert (=> b!727617 m!682013))

(assert (=> b!727623 m!682011))

(assert (=> b!727623 m!682011))

(declare-fun m!682015 () Bool)

(assert (=> b!727623 m!682015))

(declare-fun m!682017 () Bool)

(assert (=> start!64668 m!682017))

(declare-fun m!682019 () Bool)

(assert (=> start!64668 m!682019))

(declare-fun m!682021 () Bool)

(assert (=> b!727622 m!682021))

(declare-fun m!682023 () Bool)

(assert (=> b!727622 m!682023))

(declare-fun m!682025 () Bool)

(assert (=> b!727613 m!682025))

(declare-fun m!682027 () Bool)

(assert (=> b!727611 m!682027))

(declare-fun m!682029 () Bool)

(assert (=> b!727618 m!682029))

(declare-fun m!682031 () Bool)

(assert (=> b!727618 m!682031))

(assert (=> b!727618 m!682029))

(declare-fun m!682033 () Bool)

(assert (=> b!727618 m!682033))

(declare-fun m!682035 () Bool)

(assert (=> b!727618 m!682035))

(declare-fun m!682037 () Bool)

(assert (=> b!727618 m!682037))

(declare-fun m!682039 () Bool)

(assert (=> b!727610 m!682039))

(declare-fun m!682041 () Bool)

(assert (=> b!727619 m!682041))

(declare-fun m!682043 () Bool)

(assert (=> b!727625 m!682043))

(assert (=> b!727624 m!682011))

(assert (=> b!727624 m!682011))

(declare-fun m!682045 () Bool)

(assert (=> b!727624 m!682045))

(assert (=> b!727624 m!682045))

(assert (=> b!727624 m!682011))

(declare-fun m!682047 () Bool)

(assert (=> b!727624 m!682047))

(assert (=> b!727620 m!682011))

(assert (=> b!727620 m!682011))

(declare-fun m!682049 () Bool)

(assert (=> b!727620 m!682049))

(declare-fun m!682051 () Bool)

(assert (=> b!727612 m!682051))

(assert (=> b!727627 m!682011))

(assert (=> b!727627 m!682011))

(declare-fun m!682053 () Bool)

(assert (=> b!727627 m!682053))

(assert (=> b!727621 m!682011))

(assert (=> b!727621 m!682011))

(declare-fun m!682055 () Bool)

(assert (=> b!727621 m!682055))

(declare-fun m!682057 () Bool)

(assert (=> b!727614 m!682057))

(check-sat (not b!727617) (not b!727624) (not b!727612) (not b!727620) (not b!727623) (not start!64668) (not b!727610) (not b!727622) (not b!727618) (not b!727625) (not b!727619) (not b!727627) (not b!727613) (not b!727621) (not b!727611))
(check-sat)
