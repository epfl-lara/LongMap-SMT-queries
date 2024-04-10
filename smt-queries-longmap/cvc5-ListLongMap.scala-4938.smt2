; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68004 () Bool)

(assert start!68004)

(declare-datatypes ((array!42918 0))(
  ( (array!42919 (arr!20544 (Array (_ BitVec 32) (_ BitVec 64))) (size!20965 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42918)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!439820 () Bool)

(declare-fun b!791402 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8144 0))(
  ( (MissingZero!8144 (index!34944 (_ BitVec 32))) (Found!8144 (index!34945 (_ BitVec 32))) (Intermediate!8144 (undefined!8956 Bool) (index!34946 (_ BitVec 32)) (x!65886 (_ BitVec 32))) (Undefined!8144) (MissingVacant!8144 (index!34947 (_ BitVec 32))) )
))
(declare-fun lt!353245 () SeekEntryResult!8144)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42918 (_ BitVec 32)) SeekEntryResult!8144)

(assert (=> b!791402 (= e!439820 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20544 a!3186) j!159) a!3186 mask!3328) lt!353245))))

(declare-fun b!791403 () Bool)

(declare-fun e!439819 () Bool)

(declare-fun e!439825 () Bool)

(assert (=> b!791403 (= e!439819 e!439825)))

(declare-fun res!536159 () Bool)

(assert (=> b!791403 (=> (not res!536159) (not e!439825))))

(declare-fun lt!353248 () SeekEntryResult!8144)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42918 (_ BitVec 32)) SeekEntryResult!8144)

(assert (=> b!791403 (= res!536159 (= (seekEntryOrOpen!0 (select (arr!20544 a!3186) j!159) a!3186 mask!3328) lt!353248))))

(assert (=> b!791403 (= lt!353248 (Found!8144 j!159))))

(declare-fun b!791405 () Bool)

(declare-fun res!536161 () Bool)

(declare-fun e!439826 () Bool)

(assert (=> b!791405 (=> (not res!536161) (not e!439826))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791405 (= res!536161 (validKeyInArray!0 (select (arr!20544 a!3186) j!159)))))

(declare-fun b!791406 () Bool)

(declare-fun e!439822 () Bool)

(assert (=> b!791406 (= e!439822 (not true))))

(assert (=> b!791406 e!439819))

(declare-fun res!536157 () Bool)

(assert (=> b!791406 (=> (not res!536157) (not e!439819))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42918 (_ BitVec 32)) Bool)

(assert (=> b!791406 (= res!536157 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!27440 0))(
  ( (Unit!27441) )
))
(declare-fun lt!353244 () Unit!27440)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42918 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27440)

(assert (=> b!791406 (= lt!353244 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!791407 () Bool)

(declare-fun res!536158 () Bool)

(declare-fun e!439824 () Bool)

(assert (=> b!791407 (=> (not res!536158) (not e!439824))))

(assert (=> b!791407 (= res!536158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!791408 () Bool)

(declare-fun res!536160 () Bool)

(declare-fun e!439823 () Bool)

(assert (=> b!791408 (=> (not res!536160) (not e!439823))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!791408 (= res!536160 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20544 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!791409 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42918 (_ BitVec 32)) SeekEntryResult!8144)

(assert (=> b!791409 (= e!439825 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20544 a!3186) j!159) a!3186 mask!3328) lt!353248))))

(declare-fun b!791410 () Bool)

(declare-fun res!536163 () Bool)

(assert (=> b!791410 (=> (not res!536163) (not e!439824))))

(declare-datatypes ((List!14546 0))(
  ( (Nil!14543) (Cons!14542 (h!15671 (_ BitVec 64)) (t!20861 List!14546)) )
))
(declare-fun arrayNoDuplicates!0 (array!42918 (_ BitVec 32) List!14546) Bool)

(assert (=> b!791410 (= res!536163 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14543))))

(declare-fun b!791411 () Bool)

(assert (=> b!791411 (= e!439824 e!439823)))

(declare-fun res!536151 () Bool)

(assert (=> b!791411 (=> (not res!536151) (not e!439823))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!791411 (= res!536151 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20544 a!3186) j!159) mask!3328) (select (arr!20544 a!3186) j!159) a!3186 mask!3328) lt!353245))))

(assert (=> b!791411 (= lt!353245 (Intermediate!8144 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!791412 () Bool)

(declare-fun res!536153 () Bool)

(assert (=> b!791412 (=> (not res!536153) (not e!439826))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42918 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791412 (= res!536153 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!791413 () Bool)

(declare-fun res!536154 () Bool)

(assert (=> b!791413 (=> (not res!536154) (not e!439826))))

(assert (=> b!791413 (= res!536154 (validKeyInArray!0 k!2102))))

(declare-fun res!536162 () Bool)

(assert (=> start!68004 (=> (not res!536162) (not e!439826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68004 (= res!536162 (validMask!0 mask!3328))))

(assert (=> start!68004 e!439826))

(assert (=> start!68004 true))

(declare-fun array_inv!16340 (array!42918) Bool)

(assert (=> start!68004 (array_inv!16340 a!3186)))

(declare-fun b!791404 () Bool)

(declare-fun res!536155 () Bool)

(assert (=> b!791404 (=> (not res!536155) (not e!439826))))

(assert (=> b!791404 (= res!536155 (and (= (size!20965 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20965 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20965 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!791414 () Bool)

(declare-fun res!536165 () Bool)

(assert (=> b!791414 (=> (not res!536165) (not e!439823))))

(assert (=> b!791414 (= res!536165 e!439820)))

(declare-fun c!88036 () Bool)

(assert (=> b!791414 (= c!88036 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!791415 () Bool)

(assert (=> b!791415 (= e!439826 e!439824)))

(declare-fun res!536164 () Bool)

(assert (=> b!791415 (=> (not res!536164) (not e!439824))))

(declare-fun lt!353247 () SeekEntryResult!8144)

(assert (=> b!791415 (= res!536164 (or (= lt!353247 (MissingZero!8144 i!1173)) (= lt!353247 (MissingVacant!8144 i!1173))))))

(assert (=> b!791415 (= lt!353247 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!791416 () Bool)

(assert (=> b!791416 (= e!439823 e!439822)))

(declare-fun res!536152 () Bool)

(assert (=> b!791416 (=> (not res!536152) (not e!439822))))

(declare-fun lt!353249 () (_ BitVec 64))

(declare-fun lt!353246 () array!42918)

(assert (=> b!791416 (= res!536152 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!353249 mask!3328) lt!353249 lt!353246 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!353249 lt!353246 mask!3328)))))

(assert (=> b!791416 (= lt!353249 (select (store (arr!20544 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!791416 (= lt!353246 (array!42919 (store (arr!20544 a!3186) i!1173 k!2102) (size!20965 a!3186)))))

(declare-fun b!791417 () Bool)

(assert (=> b!791417 (= e!439820 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20544 a!3186) j!159) a!3186 mask!3328) (Found!8144 j!159)))))

(declare-fun b!791418 () Bool)

(declare-fun res!536156 () Bool)

(assert (=> b!791418 (=> (not res!536156) (not e!439824))))

(assert (=> b!791418 (= res!536156 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20965 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20965 a!3186))))))

(assert (= (and start!68004 res!536162) b!791404))

(assert (= (and b!791404 res!536155) b!791405))

(assert (= (and b!791405 res!536161) b!791413))

(assert (= (and b!791413 res!536154) b!791412))

(assert (= (and b!791412 res!536153) b!791415))

(assert (= (and b!791415 res!536164) b!791407))

(assert (= (and b!791407 res!536158) b!791410))

(assert (= (and b!791410 res!536163) b!791418))

(assert (= (and b!791418 res!536156) b!791411))

(assert (= (and b!791411 res!536151) b!791408))

(assert (= (and b!791408 res!536160) b!791414))

(assert (= (and b!791414 c!88036) b!791402))

(assert (= (and b!791414 (not c!88036)) b!791417))

(assert (= (and b!791414 res!536165) b!791416))

(assert (= (and b!791416 res!536152) b!791406))

(assert (= (and b!791406 res!536157) b!791403))

(assert (= (and b!791403 res!536159) b!791409))

(declare-fun m!732143 () Bool)

(assert (=> start!68004 m!732143))

(declare-fun m!732145 () Bool)

(assert (=> start!68004 m!732145))

(declare-fun m!732147 () Bool)

(assert (=> b!791410 m!732147))

(declare-fun m!732149 () Bool)

(assert (=> b!791407 m!732149))

(declare-fun m!732151 () Bool)

(assert (=> b!791415 m!732151))

(declare-fun m!732153 () Bool)

(assert (=> b!791403 m!732153))

(assert (=> b!791403 m!732153))

(declare-fun m!732155 () Bool)

(assert (=> b!791403 m!732155))

(declare-fun m!732157 () Bool)

(assert (=> b!791413 m!732157))

(assert (=> b!791417 m!732153))

(assert (=> b!791417 m!732153))

(declare-fun m!732159 () Bool)

(assert (=> b!791417 m!732159))

(declare-fun m!732161 () Bool)

(assert (=> b!791416 m!732161))

(declare-fun m!732163 () Bool)

(assert (=> b!791416 m!732163))

(declare-fun m!732165 () Bool)

(assert (=> b!791416 m!732165))

(declare-fun m!732167 () Bool)

(assert (=> b!791416 m!732167))

(assert (=> b!791416 m!732161))

(declare-fun m!732169 () Bool)

(assert (=> b!791416 m!732169))

(assert (=> b!791405 m!732153))

(assert (=> b!791405 m!732153))

(declare-fun m!732171 () Bool)

(assert (=> b!791405 m!732171))

(declare-fun m!732173 () Bool)

(assert (=> b!791412 m!732173))

(assert (=> b!791409 m!732153))

(assert (=> b!791409 m!732153))

(declare-fun m!732175 () Bool)

(assert (=> b!791409 m!732175))

(declare-fun m!732177 () Bool)

(assert (=> b!791408 m!732177))

(declare-fun m!732179 () Bool)

(assert (=> b!791406 m!732179))

(declare-fun m!732181 () Bool)

(assert (=> b!791406 m!732181))

(assert (=> b!791411 m!732153))

(assert (=> b!791411 m!732153))

(declare-fun m!732183 () Bool)

(assert (=> b!791411 m!732183))

(assert (=> b!791411 m!732183))

(assert (=> b!791411 m!732153))

(declare-fun m!732185 () Bool)

(assert (=> b!791411 m!732185))

(assert (=> b!791402 m!732153))

(assert (=> b!791402 m!732153))

(declare-fun m!732187 () Bool)

(assert (=> b!791402 m!732187))

(push 1)

