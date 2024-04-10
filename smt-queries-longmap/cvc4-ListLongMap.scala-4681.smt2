; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65150 () Bool)

(assert start!65150)

(declare-fun b!736180 () Bool)

(declare-fun e!411848 () Bool)

(declare-fun e!411854 () Bool)

(assert (=> b!736180 (= e!411848 e!411854)))

(declare-fun res!494737 () Bool)

(assert (=> b!736180 (=> (not res!494737) (not e!411854))))

(declare-datatypes ((SeekEntryResult!7375 0))(
  ( (MissingZero!7375 (index!31868 (_ BitVec 32))) (Found!7375 (index!31869 (_ BitVec 32))) (Intermediate!7375 (undefined!8187 Bool) (index!31870 (_ BitVec 32)) (x!62869 (_ BitVec 32))) (Undefined!7375) (MissingVacant!7375 (index!31871 (_ BitVec 32))) )
))
(declare-fun lt!326455 () SeekEntryResult!7375)

(declare-fun lt!326458 () SeekEntryResult!7375)

(assert (=> b!736180 (= res!494737 (= lt!326455 lt!326458))))

(declare-datatypes ((array!41323 0))(
  ( (array!41324 (arr!19775 (Array (_ BitVec 32) (_ BitVec 64))) (size!20196 (_ BitVec 32))) )
))
(declare-fun lt!326457 () array!41323)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!326454 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41323 (_ BitVec 32)) SeekEntryResult!7375)

(assert (=> b!736180 (= lt!326458 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326454 lt!326457 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736180 (= lt!326455 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326454 mask!3328) lt!326454 lt!326457 mask!3328))))

(declare-fun a!3186 () array!41323)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!736180 (= lt!326454 (select (store (arr!19775 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!736180 (= lt!326457 (array!41324 (store (arr!19775 a!3186) i!1173 k!2102) (size!20196 a!3186)))))

(declare-fun b!736181 () Bool)

(declare-fun e!411851 () Bool)

(assert (=> b!736181 (= e!411854 (not e!411851))))

(declare-fun res!494740 () Bool)

(assert (=> b!736181 (=> res!494740 e!411851)))

(assert (=> b!736181 (= res!494740 (or (not (is-Intermediate!7375 lt!326458)) (bvsge x!1131 (x!62869 lt!326458))))))

(declare-fun lt!326456 () SeekEntryResult!7375)

(assert (=> b!736181 (= lt!326456 (Found!7375 j!159))))

(declare-fun e!411843 () Bool)

(assert (=> b!736181 e!411843))

(declare-fun res!494749 () Bool)

(assert (=> b!736181 (=> (not res!494749) (not e!411843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41323 (_ BitVec 32)) Bool)

(assert (=> b!736181 (= res!494749 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25096 0))(
  ( (Unit!25097) )
))
(declare-fun lt!326453 () Unit!25096)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41323 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25096)

(assert (=> b!736181 (= lt!326453 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun e!411852 () Bool)

(declare-fun lt!326448 () (_ BitVec 32))

(declare-fun lt!326459 () SeekEntryResult!7375)

(declare-fun b!736182 () Bool)

(assert (=> b!736182 (= e!411852 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326448 (select (arr!19775 a!3186) j!159) a!3186 mask!3328) lt!326459)))))

(declare-fun b!736183 () Bool)

(declare-fun e!411850 () Bool)

(assert (=> b!736183 (= e!411850 true)))

(declare-fun lt!326446 () SeekEntryResult!7375)

(assert (=> b!736183 (= lt!326446 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326448 lt!326454 lt!326457 mask!3328))))

(declare-fun b!736184 () Bool)

(declare-fun res!494743 () Bool)

(declare-fun e!411845 () Bool)

(assert (=> b!736184 (=> (not res!494743) (not e!411845))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!736184 (= res!494743 (validKeyInArray!0 (select (arr!19775 a!3186) j!159)))))

(declare-fun b!736185 () Bool)

(declare-fun res!494746 () Bool)

(declare-fun e!411847 () Bool)

(assert (=> b!736185 (=> (not res!494746) (not e!411847))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!736185 (= res!494746 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20196 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20196 a!3186))))))

(declare-fun b!736186 () Bool)

(declare-fun res!494738 () Bool)

(assert (=> b!736186 (=> (not res!494738) (not e!411848))))

(assert (=> b!736186 (= res!494738 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19775 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!736187 () Bool)

(assert (=> b!736187 (= e!411845 e!411847)))

(declare-fun res!494741 () Bool)

(assert (=> b!736187 (=> (not res!494741) (not e!411847))))

(declare-fun lt!326450 () SeekEntryResult!7375)

(assert (=> b!736187 (= res!494741 (or (= lt!326450 (MissingZero!7375 i!1173)) (= lt!326450 (MissingVacant!7375 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41323 (_ BitVec 32)) SeekEntryResult!7375)

(assert (=> b!736187 (= lt!326450 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!736188 () Bool)

(declare-fun e!411844 () Unit!25096)

(declare-fun Unit!25098 () Unit!25096)

(assert (=> b!736188 (= e!411844 Unit!25098)))

(assert (=> b!736188 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326448 (select (arr!19775 a!3186) j!159) a!3186 mask!3328) lt!326459)))

(declare-fun b!736189 () Bool)

(declare-fun e!411853 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41323 (_ BitVec 32)) SeekEntryResult!7375)

(assert (=> b!736189 (= e!411853 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19775 a!3186) j!159) a!3186 mask!3328) (Found!7375 j!159)))))

(declare-fun b!736190 () Bool)

(declare-fun e!411846 () Bool)

(assert (=> b!736190 (= e!411843 e!411846)))

(declare-fun res!494750 () Bool)

(assert (=> b!736190 (=> (not res!494750) (not e!411846))))

(declare-fun lt!326452 () SeekEntryResult!7375)

(assert (=> b!736190 (= res!494750 (= (seekEntryOrOpen!0 (select (arr!19775 a!3186) j!159) a!3186 mask!3328) lt!326452))))

(assert (=> b!736190 (= lt!326452 (Found!7375 j!159))))

(declare-fun b!736191 () Bool)

(declare-fun res!494734 () Bool)

(assert (=> b!736191 (=> (not res!494734) (not e!411848))))

(assert (=> b!736191 (= res!494734 e!411853)))

(declare-fun c!81104 () Bool)

(assert (=> b!736191 (= c!81104 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!736192 () Bool)

(assert (=> b!736192 (= e!411851 e!411850)))

(declare-fun res!494744 () Bool)

(assert (=> b!736192 (=> res!494744 e!411850)))

(assert (=> b!736192 (= res!494744 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326448 #b00000000000000000000000000000000) (bvsge lt!326448 (size!20196 a!3186))))))

(declare-fun lt!326449 () Unit!25096)

(assert (=> b!736192 (= lt!326449 e!411844)))

(declare-fun c!81105 () Bool)

(declare-fun lt!326447 () Bool)

(assert (=> b!736192 (= c!81105 lt!326447)))

(assert (=> b!736192 (= lt!326447 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736192 (= lt!326448 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!736194 () Bool)

(declare-fun res!494736 () Bool)

(assert (=> b!736194 (=> res!494736 e!411850)))

(assert (=> b!736194 (= res!494736 e!411852)))

(declare-fun c!81106 () Bool)

(assert (=> b!736194 (= c!81106 lt!326447)))

(declare-fun b!736195 () Bool)

(declare-fun Unit!25099 () Unit!25096)

(assert (=> b!736195 (= e!411844 Unit!25099)))

(declare-fun lt!326451 () SeekEntryResult!7375)

(assert (=> b!736195 (= lt!326451 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19775 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!736195 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326448 resIntermediateIndex!5 (select (arr!19775 a!3186) j!159) a!3186 mask!3328) lt!326456)))

(declare-fun b!736196 () Bool)

(declare-fun res!494748 () Bool)

(assert (=> b!736196 (=> (not res!494748) (not e!411847))))

(assert (=> b!736196 (= res!494748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!736197 () Bool)

(assert (=> b!736197 (= e!411847 e!411848)))

(declare-fun res!494733 () Bool)

(assert (=> b!736197 (=> (not res!494733) (not e!411848))))

(assert (=> b!736197 (= res!494733 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19775 a!3186) j!159) mask!3328) (select (arr!19775 a!3186) j!159) a!3186 mask!3328) lt!326459))))

(assert (=> b!736197 (= lt!326459 (Intermediate!7375 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!736198 () Bool)

(assert (=> b!736198 (= e!411852 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326448 resIntermediateIndex!5 (select (arr!19775 a!3186) j!159) a!3186 mask!3328) lt!326456)))))

(declare-fun b!736199 () Bool)

(declare-fun res!494742 () Bool)

(assert (=> b!736199 (=> (not res!494742) (not e!411845))))

(assert (=> b!736199 (= res!494742 (and (= (size!20196 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20196 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20196 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!736200 () Bool)

(declare-fun res!494735 () Bool)

(assert (=> b!736200 (=> (not res!494735) (not e!411847))))

(declare-datatypes ((List!13777 0))(
  ( (Nil!13774) (Cons!13773 (h!14845 (_ BitVec 64)) (t!20092 List!13777)) )
))
(declare-fun arrayNoDuplicates!0 (array!41323 (_ BitVec 32) List!13777) Bool)

(assert (=> b!736200 (= res!494735 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13774))))

(declare-fun b!736201 () Bool)

(declare-fun res!494745 () Bool)

(assert (=> b!736201 (=> (not res!494745) (not e!411845))))

(assert (=> b!736201 (= res!494745 (validKeyInArray!0 k!2102))))

(declare-fun b!736202 () Bool)

(assert (=> b!736202 (= e!411846 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19775 a!3186) j!159) a!3186 mask!3328) lt!326452))))

(declare-fun b!736203 () Bool)

(assert (=> b!736203 (= e!411853 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19775 a!3186) j!159) a!3186 mask!3328) lt!326459))))

(declare-fun b!736193 () Bool)

(declare-fun res!494747 () Bool)

(assert (=> b!736193 (=> (not res!494747) (not e!411845))))

(declare-fun arrayContainsKey!0 (array!41323 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!736193 (= res!494747 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!494739 () Bool)

(assert (=> start!65150 (=> (not res!494739) (not e!411845))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65150 (= res!494739 (validMask!0 mask!3328))))

(assert (=> start!65150 e!411845))

(assert (=> start!65150 true))

(declare-fun array_inv!15571 (array!41323) Bool)

(assert (=> start!65150 (array_inv!15571 a!3186)))

(assert (= (and start!65150 res!494739) b!736199))

(assert (= (and b!736199 res!494742) b!736184))

(assert (= (and b!736184 res!494743) b!736201))

(assert (= (and b!736201 res!494745) b!736193))

(assert (= (and b!736193 res!494747) b!736187))

(assert (= (and b!736187 res!494741) b!736196))

(assert (= (and b!736196 res!494748) b!736200))

(assert (= (and b!736200 res!494735) b!736185))

(assert (= (and b!736185 res!494746) b!736197))

(assert (= (and b!736197 res!494733) b!736186))

(assert (= (and b!736186 res!494738) b!736191))

(assert (= (and b!736191 c!81104) b!736203))

(assert (= (and b!736191 (not c!81104)) b!736189))

(assert (= (and b!736191 res!494734) b!736180))

(assert (= (and b!736180 res!494737) b!736181))

(assert (= (and b!736181 res!494749) b!736190))

(assert (= (and b!736190 res!494750) b!736202))

(assert (= (and b!736181 (not res!494740)) b!736192))

(assert (= (and b!736192 c!81105) b!736188))

(assert (= (and b!736192 (not c!81105)) b!736195))

(assert (= (and b!736192 (not res!494744)) b!736194))

(assert (= (and b!736194 c!81106) b!736182))

(assert (= (and b!736194 (not c!81106)) b!736198))

(assert (= (and b!736194 (not res!494736)) b!736183))

(declare-fun m!688375 () Bool)

(assert (=> b!736195 m!688375))

(assert (=> b!736195 m!688375))

(declare-fun m!688377 () Bool)

(assert (=> b!736195 m!688377))

(assert (=> b!736195 m!688375))

(declare-fun m!688379 () Bool)

(assert (=> b!736195 m!688379))

(declare-fun m!688381 () Bool)

(assert (=> b!736196 m!688381))

(assert (=> b!736198 m!688375))

(assert (=> b!736198 m!688375))

(assert (=> b!736198 m!688379))

(assert (=> b!736203 m!688375))

(assert (=> b!736203 m!688375))

(declare-fun m!688383 () Bool)

(assert (=> b!736203 m!688383))

(assert (=> b!736197 m!688375))

(assert (=> b!736197 m!688375))

(declare-fun m!688385 () Bool)

(assert (=> b!736197 m!688385))

(assert (=> b!736197 m!688385))

(assert (=> b!736197 m!688375))

(declare-fun m!688387 () Bool)

(assert (=> b!736197 m!688387))

(declare-fun m!688389 () Bool)

(assert (=> b!736186 m!688389))

(assert (=> b!736184 m!688375))

(assert (=> b!736184 m!688375))

(declare-fun m!688391 () Bool)

(assert (=> b!736184 m!688391))

(assert (=> b!736189 m!688375))

(assert (=> b!736189 m!688375))

(assert (=> b!736189 m!688377))

(declare-fun m!688393 () Bool)

(assert (=> start!65150 m!688393))

(declare-fun m!688395 () Bool)

(assert (=> start!65150 m!688395))

(declare-fun m!688397 () Bool)

(assert (=> b!736192 m!688397))

(assert (=> b!736182 m!688375))

(assert (=> b!736182 m!688375))

(declare-fun m!688399 () Bool)

(assert (=> b!736182 m!688399))

(declare-fun m!688401 () Bool)

(assert (=> b!736181 m!688401))

(declare-fun m!688403 () Bool)

(assert (=> b!736181 m!688403))

(assert (=> b!736188 m!688375))

(assert (=> b!736188 m!688375))

(assert (=> b!736188 m!688399))

(assert (=> b!736202 m!688375))

(assert (=> b!736202 m!688375))

(declare-fun m!688405 () Bool)

(assert (=> b!736202 m!688405))

(declare-fun m!688407 () Bool)

(assert (=> b!736200 m!688407))

(declare-fun m!688409 () Bool)

(assert (=> b!736183 m!688409))

(declare-fun m!688411 () Bool)

(assert (=> b!736180 m!688411))

(declare-fun m!688413 () Bool)

(assert (=> b!736180 m!688413))

(declare-fun m!688415 () Bool)

(assert (=> b!736180 m!688415))

(declare-fun m!688417 () Bool)

(assert (=> b!736180 m!688417))

(declare-fun m!688419 () Bool)

(assert (=> b!736180 m!688419))

(assert (=> b!736180 m!688413))

(declare-fun m!688421 () Bool)

(assert (=> b!736193 m!688421))

(declare-fun m!688423 () Bool)

(assert (=> b!736187 m!688423))

(assert (=> b!736190 m!688375))

(assert (=> b!736190 m!688375))

(declare-fun m!688425 () Bool)

(assert (=> b!736190 m!688425))

(declare-fun m!688427 () Bool)

(assert (=> b!736201 m!688427))

(push 1)

