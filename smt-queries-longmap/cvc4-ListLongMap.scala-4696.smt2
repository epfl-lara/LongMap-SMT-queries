; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65240 () Bool)

(assert start!65240)

(declare-fun b!739420 () Bool)

(declare-fun e!413467 () Bool)

(declare-fun e!413474 () Bool)

(assert (=> b!739420 (= e!413467 e!413474)))

(declare-fun res!497171 () Bool)

(assert (=> b!739420 (=> (not res!497171) (not e!413474))))

(declare-datatypes ((array!41413 0))(
  ( (array!41414 (arr!19820 (Array (_ BitVec 32) (_ BitVec 64))) (size!20241 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41413)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7420 0))(
  ( (MissingZero!7420 (index!32048 (_ BitVec 32))) (Found!7420 (index!32049 (_ BitVec 32))) (Intermediate!7420 (undefined!8232 Bool) (index!32050 (_ BitVec 32)) (x!63034 (_ BitVec 32))) (Undefined!7420) (MissingVacant!7420 (index!32051 (_ BitVec 32))) )
))
(declare-fun lt!328341 () SeekEntryResult!7420)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41413 (_ BitVec 32)) SeekEntryResult!7420)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739420 (= res!497171 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19820 a!3186) j!159) mask!3328) (select (arr!19820 a!3186) j!159) a!3186 mask!3328) lt!328341))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!739420 (= lt!328341 (Intermediate!7420 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!739421 () Bool)

(declare-fun res!497168 () Bool)

(declare-fun e!413465 () Bool)

(assert (=> b!739421 (=> (not res!497168) (not e!413465))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!739421 (= res!497168 (and (= (size!20241 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20241 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20241 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!739422 () Bool)

(declare-fun e!413469 () Bool)

(assert (=> b!739422 (= e!413474 e!413469)))

(declare-fun res!497172 () Bool)

(assert (=> b!739422 (=> (not res!497172) (not e!413469))))

(declare-fun lt!328337 () SeekEntryResult!7420)

(declare-fun lt!328345 () SeekEntryResult!7420)

(assert (=> b!739422 (= res!497172 (= lt!328337 lt!328345))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!328342 () array!41413)

(declare-fun lt!328336 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!739422 (= lt!328345 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328336 lt!328342 mask!3328))))

(assert (=> b!739422 (= lt!328337 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328336 mask!3328) lt!328336 lt!328342 mask!3328))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!739422 (= lt!328336 (select (store (arr!19820 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!739422 (= lt!328342 (array!41414 (store (arr!19820 a!3186) i!1173 k!2102) (size!20241 a!3186)))))

(declare-fun b!739424 () Bool)

(declare-fun lt!328348 () (_ BitVec 32))

(declare-fun e!413472 () Bool)

(assert (=> b!739424 (= e!413472 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328348 (select (arr!19820 a!3186) j!159) a!3186 mask!3328) lt!328341)))))

(declare-fun b!739425 () Bool)

(declare-datatypes ((Unit!25276 0))(
  ( (Unit!25277) )
))
(declare-fun e!413470 () Unit!25276)

(declare-fun Unit!25278 () Unit!25276)

(assert (=> b!739425 (= e!413470 Unit!25278)))

(declare-fun lt!328347 () SeekEntryResult!7420)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41413 (_ BitVec 32)) SeekEntryResult!7420)

(assert (=> b!739425 (= lt!328347 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19820 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!328339 () SeekEntryResult!7420)

(assert (=> b!739425 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328348 resIntermediateIndex!5 (select (arr!19820 a!3186) j!159) a!3186 mask!3328) lt!328339)))

(declare-fun b!739426 () Bool)

(assert (=> b!739426 (= e!413465 e!413467)))

(declare-fun res!497173 () Bool)

(assert (=> b!739426 (=> (not res!497173) (not e!413467))))

(declare-fun lt!328338 () SeekEntryResult!7420)

(assert (=> b!739426 (= res!497173 (or (= lt!328338 (MissingZero!7420 i!1173)) (= lt!328338 (MissingVacant!7420 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41413 (_ BitVec 32)) SeekEntryResult!7420)

(assert (=> b!739426 (= lt!328338 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!739427 () Bool)

(declare-fun res!497175 () Bool)

(assert (=> b!739427 (=> (not res!497175) (not e!413465))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!739427 (= res!497175 (validKeyInArray!0 (select (arr!19820 a!3186) j!159)))))

(declare-fun b!739428 () Bool)

(declare-fun res!497163 () Bool)

(assert (=> b!739428 (=> (not res!497163) (not e!413467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41413 (_ BitVec 32)) Bool)

(assert (=> b!739428 (= res!497163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!739429 () Bool)

(declare-fun res!497167 () Bool)

(assert (=> b!739429 (=> (not res!497167) (not e!413465))))

(assert (=> b!739429 (= res!497167 (validKeyInArray!0 k!2102))))

(declare-fun b!739430 () Bool)

(declare-fun lt!328340 () SeekEntryResult!7420)

(declare-fun e!413464 () Bool)

(assert (=> b!739430 (= e!413464 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19820 a!3186) j!159) a!3186 mask!3328) lt!328340))))

(declare-fun b!739431 () Bool)

(declare-fun e!413466 () Bool)

(assert (=> b!739431 (= e!413466 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19820 a!3186) j!159) a!3186 mask!3328) lt!328341))))

(declare-fun b!739432 () Bool)

(declare-fun res!497180 () Bool)

(declare-fun e!413468 () Bool)

(assert (=> b!739432 (=> res!497180 e!413468)))

(assert (=> b!739432 (= res!497180 e!413472)))

(declare-fun c!81510 () Bool)

(declare-fun lt!328349 () Bool)

(assert (=> b!739432 (= c!81510 lt!328349)))

(declare-fun b!739433 () Bool)

(assert (=> b!739433 (= e!413472 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328348 resIntermediateIndex!5 (select (arr!19820 a!3186) j!159) a!3186 mask!3328) lt!328339)))))

(declare-fun b!739434 () Bool)

(declare-fun res!497164 () Bool)

(assert (=> b!739434 (=> (not res!497164) (not e!413467))))

(assert (=> b!739434 (= res!497164 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20241 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20241 a!3186))))))

(declare-fun b!739435 () Bool)

(assert (=> b!739435 (= e!413468 true)))

(declare-fun lt!328344 () SeekEntryResult!7420)

(assert (=> b!739435 (= lt!328344 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328348 lt!328336 lt!328342 mask!3328))))

(declare-fun b!739436 () Bool)

(declare-fun e!413473 () Bool)

(assert (=> b!739436 (= e!413469 (not e!413473))))

(declare-fun res!497179 () Bool)

(assert (=> b!739436 (=> res!497179 e!413473)))

(assert (=> b!739436 (= res!497179 (or (not (is-Intermediate!7420 lt!328345)) (bvsge x!1131 (x!63034 lt!328345))))))

(assert (=> b!739436 (= lt!328339 (Found!7420 j!159))))

(declare-fun e!413471 () Bool)

(assert (=> b!739436 e!413471))

(declare-fun res!497174 () Bool)

(assert (=> b!739436 (=> (not res!497174) (not e!413471))))

(assert (=> b!739436 (= res!497174 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!328343 () Unit!25276)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41413 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25276)

(assert (=> b!739436 (= lt!328343 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!497169 () Bool)

(assert (=> start!65240 (=> (not res!497169) (not e!413465))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65240 (= res!497169 (validMask!0 mask!3328))))

(assert (=> start!65240 e!413465))

(assert (=> start!65240 true))

(declare-fun array_inv!15616 (array!41413) Bool)

(assert (=> start!65240 (array_inv!15616 a!3186)))

(declare-fun b!739423 () Bool)

(declare-fun res!497170 () Bool)

(assert (=> b!739423 (=> (not res!497170) (not e!413465))))

(declare-fun arrayContainsKey!0 (array!41413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!739423 (= res!497170 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!739437 () Bool)

(declare-fun res!497165 () Bool)

(assert (=> b!739437 (=> (not res!497165) (not e!413467))))

(declare-datatypes ((List!13822 0))(
  ( (Nil!13819) (Cons!13818 (h!14890 (_ BitVec 64)) (t!20137 List!13822)) )
))
(declare-fun arrayNoDuplicates!0 (array!41413 (_ BitVec 32) List!13822) Bool)

(assert (=> b!739437 (= res!497165 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13819))))

(declare-fun b!739438 () Bool)

(assert (=> b!739438 (= e!413471 e!413464)))

(declare-fun res!497178 () Bool)

(assert (=> b!739438 (=> (not res!497178) (not e!413464))))

(assert (=> b!739438 (= res!497178 (= (seekEntryOrOpen!0 (select (arr!19820 a!3186) j!159) a!3186 mask!3328) lt!328340))))

(assert (=> b!739438 (= lt!328340 (Found!7420 j!159))))

(declare-fun b!739439 () Bool)

(declare-fun Unit!25279 () Unit!25276)

(assert (=> b!739439 (= e!413470 Unit!25279)))

(assert (=> b!739439 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328348 (select (arr!19820 a!3186) j!159) a!3186 mask!3328) lt!328341)))

(declare-fun b!739440 () Bool)

(assert (=> b!739440 (= e!413466 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19820 a!3186) j!159) a!3186 mask!3328) (Found!7420 j!159)))))

(declare-fun b!739441 () Bool)

(declare-fun res!497166 () Bool)

(assert (=> b!739441 (=> (not res!497166) (not e!413474))))

(assert (=> b!739441 (= res!497166 e!413466)))

(declare-fun c!81511 () Bool)

(assert (=> b!739441 (= c!81511 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!739442 () Bool)

(declare-fun res!497177 () Bool)

(assert (=> b!739442 (=> (not res!497177) (not e!413474))))

(assert (=> b!739442 (= res!497177 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19820 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!739443 () Bool)

(assert (=> b!739443 (= e!413473 e!413468)))

(declare-fun res!497176 () Bool)

(assert (=> b!739443 (=> res!497176 e!413468)))

(assert (=> b!739443 (= res!497176 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328348 #b00000000000000000000000000000000) (bvsge lt!328348 (size!20241 a!3186))))))

(declare-fun lt!328346 () Unit!25276)

(assert (=> b!739443 (= lt!328346 e!413470)))

(declare-fun c!81509 () Bool)

(assert (=> b!739443 (= c!81509 lt!328349)))

(assert (=> b!739443 (= lt!328349 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739443 (= lt!328348 (nextIndex!0 index!1321 x!1131 mask!3328))))

(assert (= (and start!65240 res!497169) b!739421))

(assert (= (and b!739421 res!497168) b!739427))

(assert (= (and b!739427 res!497175) b!739429))

(assert (= (and b!739429 res!497167) b!739423))

(assert (= (and b!739423 res!497170) b!739426))

(assert (= (and b!739426 res!497173) b!739428))

(assert (= (and b!739428 res!497163) b!739437))

(assert (= (and b!739437 res!497165) b!739434))

(assert (= (and b!739434 res!497164) b!739420))

(assert (= (and b!739420 res!497171) b!739442))

(assert (= (and b!739442 res!497177) b!739441))

(assert (= (and b!739441 c!81511) b!739431))

(assert (= (and b!739441 (not c!81511)) b!739440))

(assert (= (and b!739441 res!497166) b!739422))

(assert (= (and b!739422 res!497172) b!739436))

(assert (= (and b!739436 res!497174) b!739438))

(assert (= (and b!739438 res!497178) b!739430))

(assert (= (and b!739436 (not res!497179)) b!739443))

(assert (= (and b!739443 c!81509) b!739439))

(assert (= (and b!739443 (not c!81509)) b!739425))

(assert (= (and b!739443 (not res!497176)) b!739432))

(assert (= (and b!739432 c!81510) b!739424))

(assert (= (and b!739432 (not c!81510)) b!739433))

(assert (= (and b!739432 (not res!497180)) b!739435))

(declare-fun m!690805 () Bool)

(assert (=> b!739435 m!690805))

(declare-fun m!690807 () Bool)

(assert (=> b!739443 m!690807))

(declare-fun m!690809 () Bool)

(assert (=> b!739420 m!690809))

(assert (=> b!739420 m!690809))

(declare-fun m!690811 () Bool)

(assert (=> b!739420 m!690811))

(assert (=> b!739420 m!690811))

(assert (=> b!739420 m!690809))

(declare-fun m!690813 () Bool)

(assert (=> b!739420 m!690813))

(assert (=> b!739433 m!690809))

(assert (=> b!739433 m!690809))

(declare-fun m!690815 () Bool)

(assert (=> b!739433 m!690815))

(assert (=> b!739427 m!690809))

(assert (=> b!739427 m!690809))

(declare-fun m!690817 () Bool)

(assert (=> b!739427 m!690817))

(declare-fun m!690819 () Bool)

(assert (=> b!739437 m!690819))

(assert (=> b!739431 m!690809))

(assert (=> b!739431 m!690809))

(declare-fun m!690821 () Bool)

(assert (=> b!739431 m!690821))

(assert (=> b!739439 m!690809))

(assert (=> b!739439 m!690809))

(declare-fun m!690823 () Bool)

(assert (=> b!739439 m!690823))

(declare-fun m!690825 () Bool)

(assert (=> b!739429 m!690825))

(declare-fun m!690827 () Bool)

(assert (=> start!65240 m!690827))

(declare-fun m!690829 () Bool)

(assert (=> start!65240 m!690829))

(assert (=> b!739440 m!690809))

(assert (=> b!739440 m!690809))

(declare-fun m!690831 () Bool)

(assert (=> b!739440 m!690831))

(declare-fun m!690833 () Bool)

(assert (=> b!739423 m!690833))

(declare-fun m!690835 () Bool)

(assert (=> b!739422 m!690835))

(declare-fun m!690837 () Bool)

(assert (=> b!739422 m!690837))

(assert (=> b!739422 m!690835))

(declare-fun m!690839 () Bool)

(assert (=> b!739422 m!690839))

(declare-fun m!690841 () Bool)

(assert (=> b!739422 m!690841))

(declare-fun m!690843 () Bool)

(assert (=> b!739422 m!690843))

(declare-fun m!690845 () Bool)

(assert (=> b!739428 m!690845))

(declare-fun m!690847 () Bool)

(assert (=> b!739436 m!690847))

(declare-fun m!690849 () Bool)

(assert (=> b!739436 m!690849))

(declare-fun m!690851 () Bool)

(assert (=> b!739426 m!690851))

(assert (=> b!739424 m!690809))

(assert (=> b!739424 m!690809))

(assert (=> b!739424 m!690823))

(assert (=> b!739438 m!690809))

(assert (=> b!739438 m!690809))

(declare-fun m!690853 () Bool)

(assert (=> b!739438 m!690853))

(assert (=> b!739425 m!690809))

(assert (=> b!739425 m!690809))

(assert (=> b!739425 m!690831))

(assert (=> b!739425 m!690809))

(assert (=> b!739425 m!690815))

(declare-fun m!690855 () Bool)

(assert (=> b!739442 m!690855))

(assert (=> b!739430 m!690809))

(assert (=> b!739430 m!690809))

(declare-fun m!690857 () Bool)

(assert (=> b!739430 m!690857))

(push 1)

