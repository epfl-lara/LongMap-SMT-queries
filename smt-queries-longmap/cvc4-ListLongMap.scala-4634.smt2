; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64508 () Bool)

(assert start!64508)

(declare-fun b!726037 () Bool)

(declare-fun e!406541 () Bool)

(declare-fun e!406544 () Bool)

(assert (=> b!726037 (= e!406541 e!406544)))

(declare-fun res!487071 () Bool)

(assert (=> b!726037 (=> (not res!487071) (not e!406544))))

(declare-datatypes ((SeekEntryResult!7234 0))(
  ( (MissingZero!7234 (index!31304 (_ BitVec 32))) (Found!7234 (index!31305 (_ BitVec 32))) (Intermediate!7234 (undefined!8046 Bool) (index!31306 (_ BitVec 32)) (x!62292 (_ BitVec 32))) (Undefined!7234) (MissingVacant!7234 (index!31307 (_ BitVec 32))) )
))
(declare-fun lt!321555 () SeekEntryResult!7234)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!726037 (= res!487071 (or (= lt!321555 (MissingZero!7234 i!1173)) (= lt!321555 (MissingVacant!7234 i!1173))))))

(declare-datatypes ((array!41026 0))(
  ( (array!41027 (arr!19634 (Array (_ BitVec 32) (_ BitVec 64))) (size!20055 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41026)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41026 (_ BitVec 32)) SeekEntryResult!7234)

(assert (=> b!726037 (= lt!321555 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!726038 () Bool)

(declare-fun e!406540 () Bool)

(declare-fun e!406537 () Bool)

(assert (=> b!726038 (= e!406540 e!406537)))

(declare-fun res!487078 () Bool)

(assert (=> b!726038 (=> (not res!487078) (not e!406537))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!321552 () array!41026)

(declare-fun lt!321557 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41026 (_ BitVec 32)) SeekEntryResult!7234)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726038 (= res!487078 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321557 mask!3328) lt!321557 lt!321552 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321557 lt!321552 mask!3328)))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!726038 (= lt!321557 (select (store (arr!19634 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!726038 (= lt!321552 (array!41027 (store (arr!19634 a!3186) i!1173 k!2102) (size!20055 a!3186)))))

(declare-fun b!726039 () Bool)

(declare-fun res!487081 () Bool)

(assert (=> b!726039 (=> (not res!487081) (not e!406541))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!726039 (= res!487081 (validKeyInArray!0 k!2102))))

(declare-fun b!726040 () Bool)

(declare-fun res!487074 () Bool)

(assert (=> b!726040 (=> (not res!487074) (not e!406541))))

(assert (=> b!726040 (= res!487074 (validKeyInArray!0 (select (arr!19634 a!3186) j!159)))))

(declare-fun b!726041 () Bool)

(declare-fun res!487067 () Bool)

(assert (=> b!726041 (=> (not res!487067) (not e!406541))))

(declare-fun arrayContainsKey!0 (array!41026 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!726041 (= res!487067 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!726042 () Bool)

(declare-fun res!487073 () Bool)

(assert (=> b!726042 (=> (not res!487073) (not e!406544))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!726042 (= res!487073 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20055 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20055 a!3186))))))

(declare-fun e!406536 () Bool)

(declare-fun lt!321554 () SeekEntryResult!7234)

(declare-fun b!726043 () Bool)

(assert (=> b!726043 (= e!406536 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19634 a!3186) j!159) a!3186 mask!3328) lt!321554))))

(declare-fun b!726044 () Bool)

(declare-fun e!406543 () Bool)

(assert (=> b!726044 (= e!406537 (not e!406543))))

(declare-fun res!487082 () Bool)

(assert (=> b!726044 (=> res!487082 e!406543)))

(assert (=> b!726044 (= res!487082 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun e!406542 () Bool)

(assert (=> b!726044 e!406542))

(declare-fun res!487072 () Bool)

(assert (=> b!726044 (=> (not res!487072) (not e!406542))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41026 (_ BitVec 32)) Bool)

(assert (=> b!726044 (= res!487072 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24786 0))(
  ( (Unit!24787) )
))
(declare-fun lt!321553 () Unit!24786)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41026 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24786)

(assert (=> b!726044 (= lt!321553 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!726045 () Bool)

(declare-fun res!487075 () Bool)

(assert (=> b!726045 (=> (not res!487075) (not e!406540))))

(assert (=> b!726045 (= res!487075 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19634 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!726046 () Bool)

(declare-fun e!406539 () Bool)

(assert (=> b!726046 (= e!406542 e!406539)))

(declare-fun res!487069 () Bool)

(assert (=> b!726046 (=> (not res!487069) (not e!406539))))

(declare-fun lt!321556 () SeekEntryResult!7234)

(assert (=> b!726046 (= res!487069 (= (seekEntryOrOpen!0 (select (arr!19634 a!3186) j!159) a!3186 mask!3328) lt!321556))))

(assert (=> b!726046 (= lt!321556 (Found!7234 j!159))))

(declare-fun b!726047 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41026 (_ BitVec 32)) SeekEntryResult!7234)

(assert (=> b!726047 (= e!406536 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19634 a!3186) j!159) a!3186 mask!3328) (Found!7234 j!159)))))

(declare-fun b!726048 () Bool)

(assert (=> b!726048 (= e!406539 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19634 a!3186) j!159) a!3186 mask!3328) lt!321556))))

(declare-fun b!726049 () Bool)

(declare-fun res!487079 () Bool)

(assert (=> b!726049 (=> (not res!487079) (not e!406544))))

(assert (=> b!726049 (= res!487079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!487070 () Bool)

(assert (=> start!64508 (=> (not res!487070) (not e!406541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64508 (= res!487070 (validMask!0 mask!3328))))

(assert (=> start!64508 e!406541))

(assert (=> start!64508 true))

(declare-fun array_inv!15430 (array!41026) Bool)

(assert (=> start!64508 (array_inv!15430 a!3186)))

(declare-fun b!726050 () Bool)

(assert (=> b!726050 (= e!406543 (validKeyInArray!0 lt!321557))))

(declare-fun b!726051 () Bool)

(declare-fun res!487077 () Bool)

(assert (=> b!726051 (=> (not res!487077) (not e!406540))))

(assert (=> b!726051 (= res!487077 e!406536)))

(declare-fun c!79858 () Bool)

(assert (=> b!726051 (= c!79858 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!726052 () Bool)

(assert (=> b!726052 (= e!406544 e!406540)))

(declare-fun res!487068 () Bool)

(assert (=> b!726052 (=> (not res!487068) (not e!406540))))

(assert (=> b!726052 (= res!487068 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19634 a!3186) j!159) mask!3328) (select (arr!19634 a!3186) j!159) a!3186 mask!3328) lt!321554))))

(assert (=> b!726052 (= lt!321554 (Intermediate!7234 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!726053 () Bool)

(declare-fun res!487080 () Bool)

(assert (=> b!726053 (=> (not res!487080) (not e!406544))))

(declare-datatypes ((List!13636 0))(
  ( (Nil!13633) (Cons!13632 (h!14689 (_ BitVec 64)) (t!19951 List!13636)) )
))
(declare-fun arrayNoDuplicates!0 (array!41026 (_ BitVec 32) List!13636) Bool)

(assert (=> b!726053 (= res!487080 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13633))))

(declare-fun b!726054 () Bool)

(declare-fun res!487076 () Bool)

(assert (=> b!726054 (=> (not res!487076) (not e!406541))))

(assert (=> b!726054 (= res!487076 (and (= (size!20055 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20055 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20055 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64508 res!487070) b!726054))

(assert (= (and b!726054 res!487076) b!726040))

(assert (= (and b!726040 res!487074) b!726039))

(assert (= (and b!726039 res!487081) b!726041))

(assert (= (and b!726041 res!487067) b!726037))

(assert (= (and b!726037 res!487071) b!726049))

(assert (= (and b!726049 res!487079) b!726053))

(assert (= (and b!726053 res!487080) b!726042))

(assert (= (and b!726042 res!487073) b!726052))

(assert (= (and b!726052 res!487068) b!726045))

(assert (= (and b!726045 res!487075) b!726051))

(assert (= (and b!726051 c!79858) b!726043))

(assert (= (and b!726051 (not c!79858)) b!726047))

(assert (= (and b!726051 res!487077) b!726038))

(assert (= (and b!726038 res!487078) b!726044))

(assert (= (and b!726044 res!487072) b!726046))

(assert (= (and b!726046 res!487069) b!726048))

(assert (= (and b!726044 (not res!487082)) b!726050))

(declare-fun m!680137 () Bool)

(assert (=> b!726044 m!680137))

(declare-fun m!680139 () Bool)

(assert (=> b!726044 m!680139))

(declare-fun m!680141 () Bool)

(assert (=> b!726041 m!680141))

(declare-fun m!680143 () Bool)

(assert (=> b!726046 m!680143))

(assert (=> b!726046 m!680143))

(declare-fun m!680145 () Bool)

(assert (=> b!726046 m!680145))

(declare-fun m!680147 () Bool)

(assert (=> start!64508 m!680147))

(declare-fun m!680149 () Bool)

(assert (=> start!64508 m!680149))

(assert (=> b!726047 m!680143))

(assert (=> b!726047 m!680143))

(declare-fun m!680151 () Bool)

(assert (=> b!726047 m!680151))

(declare-fun m!680153 () Bool)

(assert (=> b!726050 m!680153))

(declare-fun m!680155 () Bool)

(assert (=> b!726049 m!680155))

(assert (=> b!726043 m!680143))

(assert (=> b!726043 m!680143))

(declare-fun m!680157 () Bool)

(assert (=> b!726043 m!680157))

(assert (=> b!726040 m!680143))

(assert (=> b!726040 m!680143))

(declare-fun m!680159 () Bool)

(assert (=> b!726040 m!680159))

(declare-fun m!680161 () Bool)

(assert (=> b!726045 m!680161))

(assert (=> b!726052 m!680143))

(assert (=> b!726052 m!680143))

(declare-fun m!680163 () Bool)

(assert (=> b!726052 m!680163))

(assert (=> b!726052 m!680163))

(assert (=> b!726052 m!680143))

(declare-fun m!680165 () Bool)

(assert (=> b!726052 m!680165))

(declare-fun m!680167 () Bool)

(assert (=> b!726039 m!680167))

(declare-fun m!680169 () Bool)

(assert (=> b!726037 m!680169))

(declare-fun m!680171 () Bool)

(assert (=> b!726053 m!680171))

(assert (=> b!726048 m!680143))

(assert (=> b!726048 m!680143))

(declare-fun m!680173 () Bool)

(assert (=> b!726048 m!680173))

(declare-fun m!680175 () Bool)

(assert (=> b!726038 m!680175))

(declare-fun m!680177 () Bool)

(assert (=> b!726038 m!680177))

(declare-fun m!680179 () Bool)

(assert (=> b!726038 m!680179))

(declare-fun m!680181 () Bool)

(assert (=> b!726038 m!680181))

(assert (=> b!726038 m!680181))

(declare-fun m!680183 () Bool)

(assert (=> b!726038 m!680183))

(push 1)

