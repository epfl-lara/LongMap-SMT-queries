; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64694 () Bool)

(assert start!64694)

(declare-fun b!729496 () Bool)

(declare-fun res!489900 () Bool)

(declare-fun e!408295 () Bool)

(assert (=> b!729496 (=> (not res!489900) (not e!408295))))

(declare-datatypes ((array!41143 0))(
  ( (array!41144 (arr!19691 (Array (_ BitVec 32) (_ BitVec 64))) (size!20112 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41143)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41143 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!729496 (= res!489900 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!489903 () Bool)

(assert (=> start!64694 (=> (not res!489903) (not e!408295))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64694 (= res!489903 (validMask!0 mask!3328))))

(assert (=> start!64694 e!408295))

(assert (=> start!64694 true))

(declare-fun array_inv!15487 (array!41143) Bool)

(assert (=> start!64694 (array_inv!15487 a!3186)))

(declare-fun b!729497 () Bool)

(declare-fun res!489898 () Bool)

(assert (=> b!729497 (=> (not res!489898) (not e!408295))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!729497 (= res!489898 (validKeyInArray!0 (select (arr!19691 a!3186) j!159)))))

(declare-fun b!729498 () Bool)

(declare-fun e!408291 () Bool)

(declare-fun e!408292 () Bool)

(assert (=> b!729498 (= e!408291 (not e!408292))))

(declare-fun res!489894 () Bool)

(assert (=> b!729498 (=> res!489894 e!408292)))

(declare-datatypes ((SeekEntryResult!7291 0))(
  ( (MissingZero!7291 (index!31532 (_ BitVec 32))) (Found!7291 (index!31533 (_ BitVec 32))) (Intermediate!7291 (undefined!8103 Bool) (index!31534 (_ BitVec 32)) (x!62513 (_ BitVec 32))) (Undefined!7291) (MissingVacant!7291 (index!31535 (_ BitVec 32))) )
))
(declare-fun lt!323194 () SeekEntryResult!7291)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!729498 (= res!489894 (or (not (is-Intermediate!7291 lt!323194)) (bvsge x!1131 (x!62513 lt!323194))))))

(declare-fun e!408294 () Bool)

(assert (=> b!729498 e!408294))

(declare-fun res!489907 () Bool)

(assert (=> b!729498 (=> (not res!489907) (not e!408294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41143 (_ BitVec 32)) Bool)

(assert (=> b!729498 (= res!489907 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24900 0))(
  ( (Unit!24901) )
))
(declare-fun lt!323195 () Unit!24900)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41143 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24900)

(assert (=> b!729498 (= lt!323195 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!729499 () Bool)

(declare-fun e!408299 () Bool)

(declare-fun lt!323190 () SeekEntryResult!7291)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41143 (_ BitVec 32)) SeekEntryResult!7291)

(assert (=> b!729499 (= e!408299 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19691 a!3186) j!159) a!3186 mask!3328) lt!323190))))

(declare-fun b!729500 () Bool)

(declare-fun res!489906 () Bool)

(declare-fun e!408297 () Bool)

(assert (=> b!729500 (=> (not res!489906) (not e!408297))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!729500 (= res!489906 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19691 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!729501 () Bool)

(declare-fun e!408298 () Bool)

(assert (=> b!729501 (= e!408298 e!408297)))

(declare-fun res!489908 () Bool)

(assert (=> b!729501 (=> (not res!489908) (not e!408297))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729501 (= res!489908 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19691 a!3186) j!159) mask!3328) (select (arr!19691 a!3186) j!159) a!3186 mask!3328) lt!323190))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!729501 (= lt!323190 (Intermediate!7291 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!729502 () Bool)

(declare-fun res!489893 () Bool)

(assert (=> b!729502 (=> (not res!489893) (not e!408297))))

(assert (=> b!729502 (= res!489893 e!408299)))

(declare-fun c!80176 () Bool)

(assert (=> b!729502 (= c!80176 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!729503 () Bool)

(assert (=> b!729503 (= e!408292 true)))

(declare-fun lt!323196 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729503 (= lt!323196 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!729504 () Bool)

(assert (=> b!729504 (= e!408295 e!408298)))

(declare-fun res!489904 () Bool)

(assert (=> b!729504 (=> (not res!489904) (not e!408298))))

(declare-fun lt!323197 () SeekEntryResult!7291)

(assert (=> b!729504 (= res!489904 (or (= lt!323197 (MissingZero!7291 i!1173)) (= lt!323197 (MissingVacant!7291 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41143 (_ BitVec 32)) SeekEntryResult!7291)

(assert (=> b!729504 (= lt!323197 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!729505 () Bool)

(declare-fun e!408293 () Bool)

(assert (=> b!729505 (= e!408294 e!408293)))

(declare-fun res!489896 () Bool)

(assert (=> b!729505 (=> (not res!489896) (not e!408293))))

(declare-fun lt!323198 () SeekEntryResult!7291)

(assert (=> b!729505 (= res!489896 (= (seekEntryOrOpen!0 (select (arr!19691 a!3186) j!159) a!3186 mask!3328) lt!323198))))

(assert (=> b!729505 (= lt!323198 (Found!7291 j!159))))

(declare-fun b!729506 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41143 (_ BitVec 32)) SeekEntryResult!7291)

(assert (=> b!729506 (= e!408293 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19691 a!3186) j!159) a!3186 mask!3328) lt!323198))))

(declare-fun b!729507 () Bool)

(assert (=> b!729507 (= e!408299 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19691 a!3186) j!159) a!3186 mask!3328) (Found!7291 j!159)))))

(declare-fun b!729508 () Bool)

(declare-fun res!489901 () Bool)

(assert (=> b!729508 (=> (not res!489901) (not e!408295))))

(assert (=> b!729508 (= res!489901 (validKeyInArray!0 k!2102))))

(declare-fun b!729509 () Bool)

(declare-fun res!489897 () Bool)

(assert (=> b!729509 (=> (not res!489897) (not e!408298))))

(assert (=> b!729509 (= res!489897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!729510 () Bool)

(assert (=> b!729510 (= e!408297 e!408291)))

(declare-fun res!489905 () Bool)

(assert (=> b!729510 (=> (not res!489905) (not e!408291))))

(declare-fun lt!323192 () SeekEntryResult!7291)

(assert (=> b!729510 (= res!489905 (= lt!323192 lt!323194))))

(declare-fun lt!323191 () (_ BitVec 64))

(declare-fun lt!323193 () array!41143)

(assert (=> b!729510 (= lt!323194 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323191 lt!323193 mask!3328))))

(assert (=> b!729510 (= lt!323192 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323191 mask!3328) lt!323191 lt!323193 mask!3328))))

(assert (=> b!729510 (= lt!323191 (select (store (arr!19691 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!729510 (= lt!323193 (array!41144 (store (arr!19691 a!3186) i!1173 k!2102) (size!20112 a!3186)))))

(declare-fun b!729511 () Bool)

(declare-fun res!489902 () Bool)

(assert (=> b!729511 (=> (not res!489902) (not e!408298))))

(declare-datatypes ((List!13693 0))(
  ( (Nil!13690) (Cons!13689 (h!14749 (_ BitVec 64)) (t!20008 List!13693)) )
))
(declare-fun arrayNoDuplicates!0 (array!41143 (_ BitVec 32) List!13693) Bool)

(assert (=> b!729511 (= res!489902 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13690))))

(declare-fun b!729512 () Bool)

(declare-fun res!489895 () Bool)

(assert (=> b!729512 (=> (not res!489895) (not e!408298))))

(assert (=> b!729512 (= res!489895 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20112 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20112 a!3186))))))

(declare-fun b!729513 () Bool)

(declare-fun res!489899 () Bool)

(assert (=> b!729513 (=> (not res!489899) (not e!408295))))

(assert (=> b!729513 (= res!489899 (and (= (size!20112 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20112 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20112 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64694 res!489903) b!729513))

(assert (= (and b!729513 res!489899) b!729497))

(assert (= (and b!729497 res!489898) b!729508))

(assert (= (and b!729508 res!489901) b!729496))

(assert (= (and b!729496 res!489900) b!729504))

(assert (= (and b!729504 res!489904) b!729509))

(assert (= (and b!729509 res!489897) b!729511))

(assert (= (and b!729511 res!489902) b!729512))

(assert (= (and b!729512 res!489895) b!729501))

(assert (= (and b!729501 res!489908) b!729500))

(assert (= (and b!729500 res!489906) b!729502))

(assert (= (and b!729502 c!80176) b!729499))

(assert (= (and b!729502 (not c!80176)) b!729507))

(assert (= (and b!729502 res!489893) b!729510))

(assert (= (and b!729510 res!489905) b!729498))

(assert (= (and b!729498 res!489907) b!729505))

(assert (= (and b!729505 res!489896) b!729506))

(assert (= (and b!729498 (not res!489894)) b!729503))

(declare-fun m!683131 () Bool)

(assert (=> b!729503 m!683131))

(declare-fun m!683133 () Bool)

(assert (=> b!729499 m!683133))

(assert (=> b!729499 m!683133))

(declare-fun m!683135 () Bool)

(assert (=> b!729499 m!683135))

(assert (=> b!729506 m!683133))

(assert (=> b!729506 m!683133))

(declare-fun m!683137 () Bool)

(assert (=> b!729506 m!683137))

(assert (=> b!729501 m!683133))

(assert (=> b!729501 m!683133))

(declare-fun m!683139 () Bool)

(assert (=> b!729501 m!683139))

(assert (=> b!729501 m!683139))

(assert (=> b!729501 m!683133))

(declare-fun m!683141 () Bool)

(assert (=> b!729501 m!683141))

(declare-fun m!683143 () Bool)

(assert (=> b!729498 m!683143))

(declare-fun m!683145 () Bool)

(assert (=> b!729498 m!683145))

(declare-fun m!683147 () Bool)

(assert (=> start!64694 m!683147))

(declare-fun m!683149 () Bool)

(assert (=> start!64694 m!683149))

(declare-fun m!683151 () Bool)

(assert (=> b!729510 m!683151))

(declare-fun m!683153 () Bool)

(assert (=> b!729510 m!683153))

(declare-fun m!683155 () Bool)

(assert (=> b!729510 m!683155))

(declare-fun m!683157 () Bool)

(assert (=> b!729510 m!683157))

(assert (=> b!729510 m!683151))

(declare-fun m!683159 () Bool)

(assert (=> b!729510 m!683159))

(declare-fun m!683161 () Bool)

(assert (=> b!729509 m!683161))

(declare-fun m!683163 () Bool)

(assert (=> b!729500 m!683163))

(declare-fun m!683165 () Bool)

(assert (=> b!729496 m!683165))

(declare-fun m!683167 () Bool)

(assert (=> b!729511 m!683167))

(assert (=> b!729507 m!683133))

(assert (=> b!729507 m!683133))

(declare-fun m!683169 () Bool)

(assert (=> b!729507 m!683169))

(assert (=> b!729505 m!683133))

(assert (=> b!729505 m!683133))

(declare-fun m!683171 () Bool)

(assert (=> b!729505 m!683171))

(assert (=> b!729497 m!683133))

(assert (=> b!729497 m!683133))

(declare-fun m!683173 () Bool)

(assert (=> b!729497 m!683173))

(declare-fun m!683175 () Bool)

(assert (=> b!729504 m!683175))

(declare-fun m!683177 () Bool)

(assert (=> b!729508 m!683177))

(push 1)

