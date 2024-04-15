; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64610 () Bool)

(assert start!64610)

(declare-fun b!727518 () Bool)

(declare-fun res!488257 () Bool)

(declare-fun e!407274 () Bool)

(assert (=> b!727518 (=> (not res!488257) (not e!407274))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41076 0))(
  ( (array!41077 (arr!19658 (Array (_ BitVec 32) (_ BitVec 64))) (size!20079 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41076)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!727518 (= res!488257 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19658 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!727519 () Bool)

(declare-fun res!488251 () Bool)

(declare-fun e!407276 () Bool)

(assert (=> b!727519 (=> (not res!488251) (not e!407276))))

(declare-datatypes ((List!13699 0))(
  ( (Nil!13696) (Cons!13695 (h!14755 (_ BitVec 64)) (t!20005 List!13699)) )
))
(declare-fun arrayNoDuplicates!0 (array!41076 (_ BitVec 32) List!13699) Bool)

(assert (=> b!727519 (= res!488251 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13696))))

(declare-datatypes ((SeekEntryResult!7255 0))(
  ( (MissingZero!7255 (index!31388 (_ BitVec 32))) (Found!7255 (index!31389 (_ BitVec 32))) (Intermediate!7255 (undefined!8067 Bool) (index!31390 (_ BitVec 32)) (x!62392 (_ BitVec 32))) (Undefined!7255) (MissingVacant!7255 (index!31391 (_ BitVec 32))) )
))
(declare-fun lt!322091 () SeekEntryResult!7255)

(declare-fun b!727520 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!407281 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41076 (_ BitVec 32)) SeekEntryResult!7255)

(assert (=> b!727520 (= e!407281 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19658 a!3186) j!159) a!3186 mask!3328) lt!322091))))

(declare-fun b!727521 () Bool)

(declare-fun lt!322087 () SeekEntryResult!7255)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!407273 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41076 (_ BitVec 32)) SeekEntryResult!7255)

(assert (=> b!727521 (= e!407273 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19658 a!3186) j!159) a!3186 mask!3328) lt!322087))))

(declare-fun b!727522 () Bool)

(declare-fun lt!322086 () (_ BitVec 32))

(declare-fun e!407278 () Bool)

(assert (=> b!727522 (= e!407278 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5) (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt lt!322086 #b00000000000000000000000000000000) (bvsge lt!322086 (bvadd #b00000000000000000000000000000001 mask!3328)) (and (bvsle (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727522 (= lt!322086 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!727524 () Bool)

(declare-fun res!488249 () Bool)

(declare-fun e!407280 () Bool)

(assert (=> b!727524 (=> (not res!488249) (not e!407280))))

(assert (=> b!727524 (= res!488249 (and (= (size!20079 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20079 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20079 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!727525 () Bool)

(declare-fun res!488259 () Bool)

(assert (=> b!727525 (=> (not res!488259) (not e!407276))))

(assert (=> b!727525 (= res!488259 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20079 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20079 a!3186))))))

(declare-fun b!727526 () Bool)

(declare-fun res!488262 () Bool)

(assert (=> b!727526 (=> (not res!488262) (not e!407276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41076 (_ BitVec 32)) Bool)

(assert (=> b!727526 (= res!488262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!727527 () Bool)

(declare-fun res!488256 () Bool)

(assert (=> b!727527 (=> (not res!488256) (not e!407280))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!727527 (= res!488256 (validKeyInArray!0 (select (arr!19658 a!3186) j!159)))))

(declare-fun b!727528 () Bool)

(declare-fun e!407279 () Bool)

(assert (=> b!727528 (= e!407274 e!407279)))

(declare-fun res!488253 () Bool)

(assert (=> b!727528 (=> (not res!488253) (not e!407279))))

(declare-fun lt!322089 () SeekEntryResult!7255)

(declare-fun lt!322092 () SeekEntryResult!7255)

(assert (=> b!727528 (= res!488253 (= lt!322089 lt!322092))))

(declare-fun lt!322090 () (_ BitVec 64))

(declare-fun lt!322093 () array!41076)

(assert (=> b!727528 (= lt!322092 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322090 lt!322093 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727528 (= lt!322089 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322090 mask!3328) lt!322090 lt!322093 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!727528 (= lt!322090 (select (store (arr!19658 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!727528 (= lt!322093 (array!41077 (store (arr!19658 a!3186) i!1173 k0!2102) (size!20079 a!3186)))))

(declare-fun b!727529 () Bool)

(assert (=> b!727529 (= e!407280 e!407276)))

(declare-fun res!488247 () Bool)

(assert (=> b!727529 (=> (not res!488247) (not e!407276))))

(declare-fun lt!322088 () SeekEntryResult!7255)

(assert (=> b!727529 (= res!488247 (or (= lt!322088 (MissingZero!7255 i!1173)) (= lt!322088 (MissingVacant!7255 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41076 (_ BitVec 32)) SeekEntryResult!7255)

(assert (=> b!727529 (= lt!322088 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!727530 () Bool)

(declare-fun res!488255 () Bool)

(assert (=> b!727530 (=> (not res!488255) (not e!407280))))

(assert (=> b!727530 (= res!488255 (validKeyInArray!0 k0!2102))))

(declare-fun b!727531 () Bool)

(declare-fun res!488261 () Bool)

(assert (=> b!727531 (=> (not res!488261) (not e!407280))))

(declare-fun arrayContainsKey!0 (array!41076 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!727531 (= res!488261 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!727532 () Bool)

(assert (=> b!727532 (= e!407281 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19658 a!3186) j!159) a!3186 mask!3328) (Found!7255 j!159)))))

(declare-fun b!727533 () Bool)

(declare-fun e!407275 () Bool)

(assert (=> b!727533 (= e!407275 e!407273)))

(declare-fun res!488252 () Bool)

(assert (=> b!727533 (=> (not res!488252) (not e!407273))))

(assert (=> b!727533 (= res!488252 (= (seekEntryOrOpen!0 (select (arr!19658 a!3186) j!159) a!3186 mask!3328) lt!322087))))

(assert (=> b!727533 (= lt!322087 (Found!7255 j!159))))

(declare-fun b!727523 () Bool)

(assert (=> b!727523 (= e!407279 (not e!407278))))

(declare-fun res!488248 () Bool)

(assert (=> b!727523 (=> res!488248 e!407278)))

(get-info :version)

(assert (=> b!727523 (= res!488248 (or (not ((_ is Intermediate!7255) lt!322092)) (bvsge x!1131 (x!62392 lt!322092))))))

(assert (=> b!727523 e!407275))

(declare-fun res!488260 () Bool)

(assert (=> b!727523 (=> (not res!488260) (not e!407275))))

(assert (=> b!727523 (= res!488260 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24800 0))(
  ( (Unit!24801) )
))
(declare-fun lt!322094 () Unit!24800)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41076 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24800)

(assert (=> b!727523 (= lt!322094 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!488254 () Bool)

(assert (=> start!64610 (=> (not res!488254) (not e!407280))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64610 (= res!488254 (validMask!0 mask!3328))))

(assert (=> start!64610 e!407280))

(assert (=> start!64610 true))

(declare-fun array_inv!15541 (array!41076) Bool)

(assert (=> start!64610 (array_inv!15541 a!3186)))

(declare-fun b!727534 () Bool)

(declare-fun res!488250 () Bool)

(assert (=> b!727534 (=> (not res!488250) (not e!407274))))

(assert (=> b!727534 (= res!488250 e!407281)))

(declare-fun c!80010 () Bool)

(assert (=> b!727534 (= c!80010 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!727535 () Bool)

(assert (=> b!727535 (= e!407276 e!407274)))

(declare-fun res!488258 () Bool)

(assert (=> b!727535 (=> (not res!488258) (not e!407274))))

(assert (=> b!727535 (= res!488258 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19658 a!3186) j!159) mask!3328) (select (arr!19658 a!3186) j!159) a!3186 mask!3328) lt!322091))))

(assert (=> b!727535 (= lt!322091 (Intermediate!7255 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!64610 res!488254) b!727524))

(assert (= (and b!727524 res!488249) b!727527))

(assert (= (and b!727527 res!488256) b!727530))

(assert (= (and b!727530 res!488255) b!727531))

(assert (= (and b!727531 res!488261) b!727529))

(assert (= (and b!727529 res!488247) b!727526))

(assert (= (and b!727526 res!488262) b!727519))

(assert (= (and b!727519 res!488251) b!727525))

(assert (= (and b!727525 res!488259) b!727535))

(assert (= (and b!727535 res!488258) b!727518))

(assert (= (and b!727518 res!488257) b!727534))

(assert (= (and b!727534 c!80010) b!727520))

(assert (= (and b!727534 (not c!80010)) b!727532))

(assert (= (and b!727534 res!488250) b!727528))

(assert (= (and b!727528 res!488253) b!727523))

(assert (= (and b!727523 res!488260) b!727533))

(assert (= (and b!727533 res!488252) b!727521))

(assert (= (and b!727523 (not res!488248)) b!727522))

(declare-fun m!680837 () Bool)

(assert (=> b!727522 m!680837))

(declare-fun m!680839 () Bool)

(assert (=> b!727533 m!680839))

(assert (=> b!727533 m!680839))

(declare-fun m!680841 () Bool)

(assert (=> b!727533 m!680841))

(declare-fun m!680843 () Bool)

(assert (=> b!727519 m!680843))

(assert (=> b!727521 m!680839))

(assert (=> b!727521 m!680839))

(declare-fun m!680845 () Bool)

(assert (=> b!727521 m!680845))

(declare-fun m!680847 () Bool)

(assert (=> b!727523 m!680847))

(declare-fun m!680849 () Bool)

(assert (=> b!727523 m!680849))

(declare-fun m!680851 () Bool)

(assert (=> b!727526 m!680851))

(assert (=> b!727535 m!680839))

(assert (=> b!727535 m!680839))

(declare-fun m!680853 () Bool)

(assert (=> b!727535 m!680853))

(assert (=> b!727535 m!680853))

(assert (=> b!727535 m!680839))

(declare-fun m!680855 () Bool)

(assert (=> b!727535 m!680855))

(declare-fun m!680857 () Bool)

(assert (=> start!64610 m!680857))

(declare-fun m!680859 () Bool)

(assert (=> start!64610 m!680859))

(assert (=> b!727532 m!680839))

(assert (=> b!727532 m!680839))

(declare-fun m!680861 () Bool)

(assert (=> b!727532 m!680861))

(declare-fun m!680863 () Bool)

(assert (=> b!727529 m!680863))

(declare-fun m!680865 () Bool)

(assert (=> b!727531 m!680865))

(assert (=> b!727520 m!680839))

(assert (=> b!727520 m!680839))

(declare-fun m!680867 () Bool)

(assert (=> b!727520 m!680867))

(declare-fun m!680869 () Bool)

(assert (=> b!727518 m!680869))

(assert (=> b!727527 m!680839))

(assert (=> b!727527 m!680839))

(declare-fun m!680871 () Bool)

(assert (=> b!727527 m!680871))

(declare-fun m!680873 () Bool)

(assert (=> b!727528 m!680873))

(declare-fun m!680875 () Bool)

(assert (=> b!727528 m!680875))

(declare-fun m!680877 () Bool)

(assert (=> b!727528 m!680877))

(declare-fun m!680879 () Bool)

(assert (=> b!727528 m!680879))

(assert (=> b!727528 m!680879))

(declare-fun m!680881 () Bool)

(assert (=> b!727528 m!680881))

(declare-fun m!680883 () Bool)

(assert (=> b!727530 m!680883))

(check-sat (not b!727528) (not b!727533) (not b!727529) (not b!727527) (not b!727526) (not b!727535) (not b!727522) (not b!727520) (not b!727531) (not b!727523) (not start!64610) (not b!727521) (not b!727530) (not b!727519) (not b!727532))
(check-sat)
