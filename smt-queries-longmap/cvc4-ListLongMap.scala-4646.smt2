; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64652 () Bool)

(assert start!64652)

(declare-fun b!728362 () Bool)

(declare-fun e!407724 () Bool)

(declare-fun e!407725 () Bool)

(assert (=> b!728362 (= e!407724 (not e!407725))))

(declare-fun res!488895 () Bool)

(assert (=> b!728362 (=> res!488895 e!407725)))

(declare-datatypes ((SeekEntryResult!7270 0))(
  ( (MissingZero!7270 (index!31448 (_ BitVec 32))) (Found!7270 (index!31449 (_ BitVec 32))) (Intermediate!7270 (undefined!8082 Bool) (index!31450 (_ BitVec 32)) (x!62436 (_ BitVec 32))) (Undefined!7270) (MissingVacant!7270 (index!31451 (_ BitVec 32))) )
))
(declare-fun lt!322623 () SeekEntryResult!7270)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!728362 (= res!488895 (or (not (is-Intermediate!7270 lt!322623)) (bvsge x!1131 (x!62436 lt!322623))))))

(declare-fun e!407727 () Bool)

(assert (=> b!728362 e!407727))

(declare-fun res!488898 () Bool)

(assert (=> b!728362 (=> (not res!488898) (not e!407727))))

(declare-datatypes ((array!41101 0))(
  ( (array!41102 (arr!19670 (Array (_ BitVec 32) (_ BitVec 64))) (size!20091 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41101)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41101 (_ BitVec 32)) Bool)

(assert (=> b!728362 (= res!488898 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24858 0))(
  ( (Unit!24859) )
))
(declare-fun lt!322625 () Unit!24858)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41101 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24858)

(assert (=> b!728362 (= lt!322625 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!728363 () Bool)

(declare-fun res!488894 () Bool)

(declare-fun e!407728 () Bool)

(assert (=> b!728363 (=> (not res!488894) (not e!407728))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41101 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!728363 (= res!488894 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!728364 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!407730 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41101 (_ BitVec 32)) SeekEntryResult!7270)

(assert (=> b!728364 (= e!407730 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19670 a!3186) j!159) a!3186 mask!3328) (Found!7270 j!159)))))

(declare-fun b!728365 () Bool)

(declare-fun e!407731 () Bool)

(assert (=> b!728365 (= e!407731 e!407724)))

(declare-fun res!488890 () Bool)

(assert (=> b!728365 (=> (not res!488890) (not e!407724))))

(declare-fun lt!322627 () SeekEntryResult!7270)

(assert (=> b!728365 (= res!488890 (= lt!322627 lt!322623))))

(declare-fun lt!322628 () (_ BitVec 64))

(declare-fun lt!322630 () array!41101)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41101 (_ BitVec 32)) SeekEntryResult!7270)

(assert (=> b!728365 (= lt!322623 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322628 lt!322630 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728365 (= lt!322627 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322628 mask!3328) lt!322628 lt!322630 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!728365 (= lt!322628 (select (store (arr!19670 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!728365 (= lt!322630 (array!41102 (store (arr!19670 a!3186) i!1173 k!2102) (size!20091 a!3186)))))

(declare-fun b!728366 () Bool)

(declare-fun res!488889 () Bool)

(declare-fun e!407726 () Bool)

(assert (=> b!728366 (=> (not res!488889) (not e!407726))))

(assert (=> b!728366 (= res!488889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!728367 () Bool)

(assert (=> b!728367 (= e!407728 e!407726)))

(declare-fun res!488897 () Bool)

(assert (=> b!728367 (=> (not res!488897) (not e!407726))))

(declare-fun lt!322626 () SeekEntryResult!7270)

(assert (=> b!728367 (= res!488897 (or (= lt!322626 (MissingZero!7270 i!1173)) (= lt!322626 (MissingVacant!7270 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41101 (_ BitVec 32)) SeekEntryResult!7270)

(assert (=> b!728367 (= lt!322626 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!728368 () Bool)

(declare-fun res!488892 () Bool)

(assert (=> b!728368 (=> (not res!488892) (not e!407731))))

(assert (=> b!728368 (= res!488892 e!407730)))

(declare-fun c!80113 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!728368 (= c!80113 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!728370 () Bool)

(declare-fun res!488899 () Bool)

(assert (=> b!728370 (=> (not res!488899) (not e!407728))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!728370 (= res!488899 (validKeyInArray!0 k!2102))))

(declare-fun b!728371 () Bool)

(assert (=> b!728371 (= e!407726 e!407731)))

(declare-fun res!488891 () Bool)

(assert (=> b!728371 (=> (not res!488891) (not e!407731))))

(declare-fun lt!322629 () SeekEntryResult!7270)

(assert (=> b!728371 (= res!488891 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19670 a!3186) j!159) mask!3328) (select (arr!19670 a!3186) j!159) a!3186 mask!3328) lt!322629))))

(assert (=> b!728371 (= lt!322629 (Intermediate!7270 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!728372 () Bool)

(declare-fun res!488888 () Bool)

(assert (=> b!728372 (=> (not res!488888) (not e!407728))))

(assert (=> b!728372 (= res!488888 (validKeyInArray!0 (select (arr!19670 a!3186) j!159)))))

(declare-fun b!728373 () Bool)

(declare-fun e!407732 () Bool)

(assert (=> b!728373 (= e!407727 e!407732)))

(declare-fun res!488900 () Bool)

(assert (=> b!728373 (=> (not res!488900) (not e!407732))))

(declare-fun lt!322631 () SeekEntryResult!7270)

(assert (=> b!728373 (= res!488900 (= (seekEntryOrOpen!0 (select (arr!19670 a!3186) j!159) a!3186 mask!3328) lt!322631))))

(assert (=> b!728373 (= lt!322631 (Found!7270 j!159))))

(declare-fun b!728374 () Bool)

(assert (=> b!728374 (= e!407725 true)))

(declare-fun lt!322624 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728374 (= lt!322624 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!728375 () Bool)

(declare-fun res!488893 () Bool)

(assert (=> b!728375 (=> (not res!488893) (not e!407726))))

(declare-datatypes ((List!13672 0))(
  ( (Nil!13669) (Cons!13668 (h!14728 (_ BitVec 64)) (t!19987 List!13672)) )
))
(declare-fun arrayNoDuplicates!0 (array!41101 (_ BitVec 32) List!13672) Bool)

(assert (=> b!728375 (= res!488893 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13669))))

(declare-fun b!728376 () Bool)

(declare-fun res!488885 () Bool)

(assert (=> b!728376 (=> (not res!488885) (not e!407731))))

(assert (=> b!728376 (= res!488885 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19670 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!728377 () Bool)

(declare-fun res!488896 () Bool)

(assert (=> b!728377 (=> (not res!488896) (not e!407726))))

(assert (=> b!728377 (= res!488896 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20091 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20091 a!3186))))))

(declare-fun b!728378 () Bool)

(declare-fun res!488887 () Bool)

(assert (=> b!728378 (=> (not res!488887) (not e!407728))))

(assert (=> b!728378 (= res!488887 (and (= (size!20091 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20091 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20091 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!728379 () Bool)

(assert (=> b!728379 (= e!407732 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19670 a!3186) j!159) a!3186 mask!3328) lt!322631))))

(declare-fun res!488886 () Bool)

(assert (=> start!64652 (=> (not res!488886) (not e!407728))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64652 (= res!488886 (validMask!0 mask!3328))))

(assert (=> start!64652 e!407728))

(assert (=> start!64652 true))

(declare-fun array_inv!15466 (array!41101) Bool)

(assert (=> start!64652 (array_inv!15466 a!3186)))

(declare-fun b!728369 () Bool)

(assert (=> b!728369 (= e!407730 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19670 a!3186) j!159) a!3186 mask!3328) lt!322629))))

(assert (= (and start!64652 res!488886) b!728378))

(assert (= (and b!728378 res!488887) b!728372))

(assert (= (and b!728372 res!488888) b!728370))

(assert (= (and b!728370 res!488899) b!728363))

(assert (= (and b!728363 res!488894) b!728367))

(assert (= (and b!728367 res!488897) b!728366))

(assert (= (and b!728366 res!488889) b!728375))

(assert (= (and b!728375 res!488893) b!728377))

(assert (= (and b!728377 res!488896) b!728371))

(assert (= (and b!728371 res!488891) b!728376))

(assert (= (and b!728376 res!488885) b!728368))

(assert (= (and b!728368 c!80113) b!728369))

(assert (= (and b!728368 (not c!80113)) b!728364))

(assert (= (and b!728368 res!488892) b!728365))

(assert (= (and b!728365 res!488890) b!728362))

(assert (= (and b!728362 res!488898) b!728373))

(assert (= (and b!728373 res!488900) b!728379))

(assert (= (and b!728362 (not res!488895)) b!728374))

(declare-fun m!682123 () Bool)

(assert (=> b!728373 m!682123))

(assert (=> b!728373 m!682123))

(declare-fun m!682125 () Bool)

(assert (=> b!728373 m!682125))

(assert (=> b!728372 m!682123))

(assert (=> b!728372 m!682123))

(declare-fun m!682127 () Bool)

(assert (=> b!728372 m!682127))

(assert (=> b!728369 m!682123))

(assert (=> b!728369 m!682123))

(declare-fun m!682129 () Bool)

(assert (=> b!728369 m!682129))

(assert (=> b!728379 m!682123))

(assert (=> b!728379 m!682123))

(declare-fun m!682131 () Bool)

(assert (=> b!728379 m!682131))

(declare-fun m!682133 () Bool)

(assert (=> b!728370 m!682133))

(declare-fun m!682135 () Bool)

(assert (=> b!728365 m!682135))

(declare-fun m!682137 () Bool)

(assert (=> b!728365 m!682137))

(declare-fun m!682139 () Bool)

(assert (=> b!728365 m!682139))

(declare-fun m!682141 () Bool)

(assert (=> b!728365 m!682141))

(declare-fun m!682143 () Bool)

(assert (=> b!728365 m!682143))

(assert (=> b!728365 m!682141))

(declare-fun m!682145 () Bool)

(assert (=> b!728374 m!682145))

(assert (=> b!728364 m!682123))

(assert (=> b!728364 m!682123))

(declare-fun m!682147 () Bool)

(assert (=> b!728364 m!682147))

(declare-fun m!682149 () Bool)

(assert (=> b!728367 m!682149))

(assert (=> b!728371 m!682123))

(assert (=> b!728371 m!682123))

(declare-fun m!682151 () Bool)

(assert (=> b!728371 m!682151))

(assert (=> b!728371 m!682151))

(assert (=> b!728371 m!682123))

(declare-fun m!682153 () Bool)

(assert (=> b!728371 m!682153))

(declare-fun m!682155 () Bool)

(assert (=> b!728375 m!682155))

(declare-fun m!682157 () Bool)

(assert (=> b!728376 m!682157))

(declare-fun m!682159 () Bool)

(assert (=> start!64652 m!682159))

(declare-fun m!682161 () Bool)

(assert (=> start!64652 m!682161))

(declare-fun m!682163 () Bool)

(assert (=> b!728363 m!682163))

(declare-fun m!682165 () Bool)

(assert (=> b!728366 m!682165))

(declare-fun m!682167 () Bool)

(assert (=> b!728362 m!682167))

(declare-fun m!682169 () Bool)

(assert (=> b!728362 m!682169))

(push 1)

