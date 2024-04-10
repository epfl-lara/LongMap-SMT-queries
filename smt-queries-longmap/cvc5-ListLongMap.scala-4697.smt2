; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65242 () Bool)

(assert start!65242)

(declare-fun b!739492 () Bool)

(declare-fun res!497218 () Bool)

(declare-fun e!413504 () Bool)

(assert (=> b!739492 (=> res!497218 e!413504)))

(declare-fun e!413509 () Bool)

(assert (=> b!739492 (= res!497218 e!413509)))

(declare-fun c!81520 () Bool)

(declare-fun lt!328379 () Bool)

(assert (=> b!739492 (= c!81520 lt!328379)))

(declare-fun b!739493 () Bool)

(declare-fun e!413499 () Bool)

(declare-fun e!413507 () Bool)

(assert (=> b!739493 (= e!413499 (not e!413507))))

(declare-fun res!497217 () Bool)

(assert (=> b!739493 (=> res!497217 e!413507)))

(declare-datatypes ((SeekEntryResult!7421 0))(
  ( (MissingZero!7421 (index!32052 (_ BitVec 32))) (Found!7421 (index!32053 (_ BitVec 32))) (Intermediate!7421 (undefined!8233 Bool) (index!32054 (_ BitVec 32)) (x!63043 (_ BitVec 32))) (Undefined!7421) (MissingVacant!7421 (index!32055 (_ BitVec 32))) )
))
(declare-fun lt!328388 () SeekEntryResult!7421)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!739493 (= res!497217 (or (not (is-Intermediate!7421 lt!328388)) (bvsge x!1131 (x!63043 lt!328388))))))

(declare-fun lt!328390 () SeekEntryResult!7421)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!739493 (= lt!328390 (Found!7421 j!159))))

(declare-fun e!413503 () Bool)

(assert (=> b!739493 e!413503))

(declare-fun res!497221 () Bool)

(assert (=> b!739493 (=> (not res!497221) (not e!413503))))

(declare-datatypes ((array!41415 0))(
  ( (array!41416 (arr!19821 (Array (_ BitVec 32) (_ BitVec 64))) (size!20242 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41415)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41415 (_ BitVec 32)) Bool)

(assert (=> b!739493 (= res!497221 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25280 0))(
  ( (Unit!25281) )
))
(declare-fun lt!328391 () Unit!25280)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41415 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25280)

(assert (=> b!739493 (= lt!328391 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!739494 () Bool)

(declare-fun res!497227 () Bool)

(declare-fun e!413502 () Bool)

(assert (=> b!739494 (=> (not res!497227) (not e!413502))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!739494 (= res!497227 (and (= (size!20242 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20242 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20242 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!739495 () Bool)

(declare-fun res!497224 () Bool)

(declare-fun e!413505 () Bool)

(assert (=> b!739495 (=> (not res!497224) (not e!413505))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!739495 (= res!497224 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20242 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20242 a!3186))))))

(declare-fun res!497223 () Bool)

(assert (=> start!65242 (=> (not res!497223) (not e!413502))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65242 (= res!497223 (validMask!0 mask!3328))))

(assert (=> start!65242 e!413502))

(assert (=> start!65242 true))

(declare-fun array_inv!15617 (array!41415) Bool)

(assert (=> start!65242 (array_inv!15617 a!3186)))

(declare-fun lt!328385 () SeekEntryResult!7421)

(declare-fun e!413506 () Bool)

(declare-fun b!739496 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41415 (_ BitVec 32)) SeekEntryResult!7421)

(assert (=> b!739496 (= e!413506 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19821 a!3186) j!159) a!3186 mask!3328) lt!328385))))

(declare-fun b!739497 () Bool)

(declare-fun lt!328378 () (_ BitVec 32))

(assert (=> b!739497 (= e!413509 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328378 resIntermediateIndex!5 (select (arr!19821 a!3186) j!159) a!3186 mask!3328) lt!328390)))))

(declare-fun b!739498 () Bool)

(assert (=> b!739498 (= e!413502 e!413505)))

(declare-fun res!497229 () Bool)

(assert (=> b!739498 (=> (not res!497229) (not e!413505))))

(declare-fun lt!328384 () SeekEntryResult!7421)

(assert (=> b!739498 (= res!497229 (or (= lt!328384 (MissingZero!7421 i!1173)) (= lt!328384 (MissingVacant!7421 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41415 (_ BitVec 32)) SeekEntryResult!7421)

(assert (=> b!739498 (= lt!328384 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!739499 () Bool)

(declare-fun e!413500 () Bool)

(declare-fun lt!328381 () SeekEntryResult!7421)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41415 (_ BitVec 32)) SeekEntryResult!7421)

(assert (=> b!739499 (= e!413500 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19821 a!3186) j!159) a!3186 mask!3328) lt!328381))))

(declare-fun b!739500 () Bool)

(declare-fun e!413501 () Unit!25280)

(declare-fun Unit!25282 () Unit!25280)

(assert (=> b!739500 (= e!413501 Unit!25282)))

(declare-fun lt!328380 () SeekEntryResult!7421)

(assert (=> b!739500 (= lt!328380 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19821 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!739500 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328378 resIntermediateIndex!5 (select (arr!19821 a!3186) j!159) a!3186 mask!3328) lt!328390)))

(declare-fun b!739501 () Bool)

(declare-fun e!413508 () Bool)

(assert (=> b!739501 (= e!413508 e!413499)))

(declare-fun res!497234 () Bool)

(assert (=> b!739501 (=> (not res!497234) (not e!413499))))

(declare-fun lt!328383 () SeekEntryResult!7421)

(assert (=> b!739501 (= res!497234 (= lt!328383 lt!328388))))

(declare-fun lt!328386 () array!41415)

(declare-fun lt!328387 () (_ BitVec 64))

(assert (=> b!739501 (= lt!328388 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328387 lt!328386 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739501 (= lt!328383 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328387 mask!3328) lt!328387 lt!328386 mask!3328))))

(assert (=> b!739501 (= lt!328387 (select (store (arr!19821 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!739501 (= lt!328386 (array!41416 (store (arr!19821 a!3186) i!1173 k!2102) (size!20242 a!3186)))))

(declare-fun b!739502 () Bool)

(declare-fun res!497232 () Bool)

(assert (=> b!739502 (=> (not res!497232) (not e!413502))))

(declare-fun arrayContainsKey!0 (array!41415 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!739502 (= res!497232 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!739503 () Bool)

(declare-fun res!497233 () Bool)

(assert (=> b!739503 (=> (not res!497233) (not e!413502))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!739503 (= res!497233 (validKeyInArray!0 (select (arr!19821 a!3186) j!159)))))

(declare-fun b!739504 () Bool)

(assert (=> b!739504 (= e!413507 e!413504)))

(declare-fun res!497220 () Bool)

(assert (=> b!739504 (=> res!497220 e!413504)))

(assert (=> b!739504 (= res!497220 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328378 #b00000000000000000000000000000000) (bvsge lt!328378 (size!20242 a!3186))))))

(declare-fun lt!328389 () Unit!25280)

(assert (=> b!739504 (= lt!328389 e!413501)))

(declare-fun c!81518 () Bool)

(assert (=> b!739504 (= c!81518 lt!328379)))

(assert (=> b!739504 (= lt!328379 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739504 (= lt!328378 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!739505 () Bool)

(declare-fun res!497231 () Bool)

(assert (=> b!739505 (=> (not res!497231) (not e!413505))))

(declare-datatypes ((List!13823 0))(
  ( (Nil!13820) (Cons!13819 (h!14891 (_ BitVec 64)) (t!20138 List!13823)) )
))
(declare-fun arrayNoDuplicates!0 (array!41415 (_ BitVec 32) List!13823) Bool)

(assert (=> b!739505 (= res!497231 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13820))))

(declare-fun b!739506 () Bool)

(assert (=> b!739506 (= e!413503 e!413506)))

(declare-fun res!497219 () Bool)

(assert (=> b!739506 (=> (not res!497219) (not e!413506))))

(assert (=> b!739506 (= res!497219 (= (seekEntryOrOpen!0 (select (arr!19821 a!3186) j!159) a!3186 mask!3328) lt!328385))))

(assert (=> b!739506 (= lt!328385 (Found!7421 j!159))))

(declare-fun b!739507 () Bool)

(declare-fun res!497230 () Bool)

(assert (=> b!739507 (=> (not res!497230) (not e!413502))))

(assert (=> b!739507 (= res!497230 (validKeyInArray!0 k!2102))))

(declare-fun b!739508 () Bool)

(assert (=> b!739508 (= e!413509 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328378 (select (arr!19821 a!3186) j!159) a!3186 mask!3328) lt!328381)))))

(declare-fun b!739509 () Bool)

(assert (=> b!739509 (= e!413500 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19821 a!3186) j!159) a!3186 mask!3328) (Found!7421 j!159)))))

(declare-fun b!739510 () Bool)

(declare-fun res!497225 () Bool)

(assert (=> b!739510 (=> (not res!497225) (not e!413508))))

(assert (=> b!739510 (= res!497225 e!413500)))

(declare-fun c!81519 () Bool)

(assert (=> b!739510 (= c!81519 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!739511 () Bool)

(assert (=> b!739511 (= e!413504 true)))

(declare-fun lt!328382 () SeekEntryResult!7421)

(assert (=> b!739511 (= lt!328382 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328378 lt!328387 lt!328386 mask!3328))))

(declare-fun b!739512 () Bool)

(declare-fun Unit!25283 () Unit!25280)

(assert (=> b!739512 (= e!413501 Unit!25283)))

(assert (=> b!739512 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328378 (select (arr!19821 a!3186) j!159) a!3186 mask!3328) lt!328381)))

(declare-fun b!739513 () Bool)

(assert (=> b!739513 (= e!413505 e!413508)))

(declare-fun res!497226 () Bool)

(assert (=> b!739513 (=> (not res!497226) (not e!413508))))

(assert (=> b!739513 (= res!497226 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19821 a!3186) j!159) mask!3328) (select (arr!19821 a!3186) j!159) a!3186 mask!3328) lt!328381))))

(assert (=> b!739513 (= lt!328381 (Intermediate!7421 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!739514 () Bool)

(declare-fun res!497228 () Bool)

(assert (=> b!739514 (=> (not res!497228) (not e!413508))))

(assert (=> b!739514 (= res!497228 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19821 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!739515 () Bool)

(declare-fun res!497222 () Bool)

(assert (=> b!739515 (=> (not res!497222) (not e!413505))))

(assert (=> b!739515 (= res!497222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65242 res!497223) b!739494))

(assert (= (and b!739494 res!497227) b!739503))

(assert (= (and b!739503 res!497233) b!739507))

(assert (= (and b!739507 res!497230) b!739502))

(assert (= (and b!739502 res!497232) b!739498))

(assert (= (and b!739498 res!497229) b!739515))

(assert (= (and b!739515 res!497222) b!739505))

(assert (= (and b!739505 res!497231) b!739495))

(assert (= (and b!739495 res!497224) b!739513))

(assert (= (and b!739513 res!497226) b!739514))

(assert (= (and b!739514 res!497228) b!739510))

(assert (= (and b!739510 c!81519) b!739499))

(assert (= (and b!739510 (not c!81519)) b!739509))

(assert (= (and b!739510 res!497225) b!739501))

(assert (= (and b!739501 res!497234) b!739493))

(assert (= (and b!739493 res!497221) b!739506))

(assert (= (and b!739506 res!497219) b!739496))

(assert (= (and b!739493 (not res!497217)) b!739504))

(assert (= (and b!739504 c!81518) b!739512))

(assert (= (and b!739504 (not c!81518)) b!739500))

(assert (= (and b!739504 (not res!497220)) b!739492))

(assert (= (and b!739492 c!81520) b!739508))

(assert (= (and b!739492 (not c!81520)) b!739497))

(assert (= (and b!739492 (not res!497218)) b!739511))

(declare-fun m!690859 () Bool)

(assert (=> b!739511 m!690859))

(declare-fun m!690861 () Bool)

(assert (=> b!739493 m!690861))

(declare-fun m!690863 () Bool)

(assert (=> b!739493 m!690863))

(declare-fun m!690865 () Bool)

(assert (=> start!65242 m!690865))

(declare-fun m!690867 () Bool)

(assert (=> start!65242 m!690867))

(declare-fun m!690869 () Bool)

(assert (=> b!739505 m!690869))

(declare-fun m!690871 () Bool)

(assert (=> b!739503 m!690871))

(assert (=> b!739503 m!690871))

(declare-fun m!690873 () Bool)

(assert (=> b!739503 m!690873))

(assert (=> b!739506 m!690871))

(assert (=> b!739506 m!690871))

(declare-fun m!690875 () Bool)

(assert (=> b!739506 m!690875))

(assert (=> b!739513 m!690871))

(assert (=> b!739513 m!690871))

(declare-fun m!690877 () Bool)

(assert (=> b!739513 m!690877))

(assert (=> b!739513 m!690877))

(assert (=> b!739513 m!690871))

(declare-fun m!690879 () Bool)

(assert (=> b!739513 m!690879))

(assert (=> b!739497 m!690871))

(assert (=> b!739497 m!690871))

(declare-fun m!690881 () Bool)

(assert (=> b!739497 m!690881))

(assert (=> b!739499 m!690871))

(assert (=> b!739499 m!690871))

(declare-fun m!690883 () Bool)

(assert (=> b!739499 m!690883))

(assert (=> b!739509 m!690871))

(assert (=> b!739509 m!690871))

(declare-fun m!690885 () Bool)

(assert (=> b!739509 m!690885))

(declare-fun m!690887 () Bool)

(assert (=> b!739501 m!690887))

(declare-fun m!690889 () Bool)

(assert (=> b!739501 m!690889))

(declare-fun m!690891 () Bool)

(assert (=> b!739501 m!690891))

(declare-fun m!690893 () Bool)

(assert (=> b!739501 m!690893))

(assert (=> b!739501 m!690891))

(declare-fun m!690895 () Bool)

(assert (=> b!739501 m!690895))

(declare-fun m!690897 () Bool)

(assert (=> b!739515 m!690897))

(assert (=> b!739496 m!690871))

(assert (=> b!739496 m!690871))

(declare-fun m!690899 () Bool)

(assert (=> b!739496 m!690899))

(assert (=> b!739508 m!690871))

(assert (=> b!739508 m!690871))

(declare-fun m!690901 () Bool)

(assert (=> b!739508 m!690901))

(declare-fun m!690903 () Bool)

(assert (=> b!739507 m!690903))

(declare-fun m!690905 () Bool)

(assert (=> b!739504 m!690905))

(assert (=> b!739512 m!690871))

(assert (=> b!739512 m!690871))

(assert (=> b!739512 m!690901))

(assert (=> b!739500 m!690871))

(assert (=> b!739500 m!690871))

(assert (=> b!739500 m!690885))

(assert (=> b!739500 m!690871))

(assert (=> b!739500 m!690881))

(declare-fun m!690907 () Bool)

(assert (=> b!739498 m!690907))

(declare-fun m!690909 () Bool)

(assert (=> b!739514 m!690909))

(declare-fun m!690911 () Bool)

(assert (=> b!739502 m!690911))

(push 1)

