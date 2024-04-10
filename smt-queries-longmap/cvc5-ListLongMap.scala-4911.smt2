; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67710 () Bool)

(assert start!67710)

(declare-fun b!785207 () Bool)

(declare-fun res!531478 () Bool)

(declare-fun e!436536 () Bool)

(assert (=> b!785207 (=> (not res!531478) (not e!436536))))

(declare-datatypes ((array!42750 0))(
  ( (array!42751 (arr!20463 (Array (_ BitVec 32) (_ BitVec 64))) (size!20884 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42750)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!785207 (= res!531478 (validKeyInArray!0 (select (arr!20463 a!3186) j!159)))))

(declare-datatypes ((SeekEntryResult!8063 0))(
  ( (MissingZero!8063 (index!34620 (_ BitVec 32))) (Found!8063 (index!34621 (_ BitVec 32))) (Intermediate!8063 (undefined!8875 Bool) (index!34622 (_ BitVec 32)) (x!65571 (_ BitVec 32))) (Undefined!8063) (MissingVacant!8063 (index!34623 (_ BitVec 32))) )
))
(declare-fun lt!350095 () SeekEntryResult!8063)

(declare-fun e!436540 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!785208 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42750 (_ BitVec 32)) SeekEntryResult!8063)

(assert (=> b!785208 (= e!436540 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20463 a!3186) j!159) a!3186 mask!3328) lt!350095))))

(declare-fun b!785209 () Bool)

(declare-fun e!436535 () Bool)

(declare-fun e!436538 () Bool)

(assert (=> b!785209 (= e!436535 (not e!436538))))

(declare-fun res!531470 () Bool)

(assert (=> b!785209 (=> res!531470 e!436538)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!350093 () SeekEntryResult!8063)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!785209 (= res!531470 (or (not (is-Intermediate!8063 lt!350093)) (bvslt x!1131 (x!65571 lt!350093)) (not (= x!1131 (x!65571 lt!350093))) (not (= index!1321 (index!34622 lt!350093)))))))

(assert (=> b!785209 e!436540))

(declare-fun res!531476 () Bool)

(assert (=> b!785209 (=> (not res!531476) (not e!436540))))

(declare-fun lt!350088 () SeekEntryResult!8063)

(assert (=> b!785209 (= res!531476 (= lt!350088 lt!350095))))

(assert (=> b!785209 (= lt!350095 (Found!8063 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42750 (_ BitVec 32)) SeekEntryResult!8063)

(assert (=> b!785209 (= lt!350088 (seekEntryOrOpen!0 (select (arr!20463 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42750 (_ BitVec 32)) Bool)

(assert (=> b!785209 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!27140 0))(
  ( (Unit!27141) )
))
(declare-fun lt!350086 () Unit!27140)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42750 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27140)

(assert (=> b!785209 (= lt!350086 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!785210 () Bool)

(declare-fun e!436533 () Bool)

(assert (=> b!785210 (= e!436533 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20463 a!3186) j!159) a!3186 mask!3328) (Found!8063 j!159)))))

(declare-fun b!785211 () Bool)

(declare-fun res!531488 () Bool)

(assert (=> b!785211 (=> (not res!531488) (not e!436536))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42750 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!785211 (= res!531488 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!785212 () Bool)

(declare-fun res!531486 () Bool)

(declare-fun e!436542 () Bool)

(assert (=> b!785212 (=> (not res!531486) (not e!436542))))

(assert (=> b!785212 (= res!531486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!785213 () Bool)

(declare-fun res!531473 () Bool)

(assert (=> b!785213 (=> (not res!531473) (not e!436542))))

(declare-datatypes ((List!14465 0))(
  ( (Nil!14462) (Cons!14461 (h!15584 (_ BitVec 64)) (t!20780 List!14465)) )
))
(declare-fun arrayNoDuplicates!0 (array!42750 (_ BitVec 32) List!14465) Bool)

(assert (=> b!785213 (= res!531473 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14462))))

(declare-fun b!785214 () Bool)

(assert (=> b!785214 (= e!436536 e!436542)))

(declare-fun res!531485 () Bool)

(assert (=> b!785214 (=> (not res!531485) (not e!436542))))

(declare-fun lt!350094 () SeekEntryResult!8063)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!785214 (= res!531485 (or (= lt!350094 (MissingZero!8063 i!1173)) (= lt!350094 (MissingVacant!8063 i!1173))))))

(assert (=> b!785214 (= lt!350094 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!785215 () Bool)

(declare-fun res!531472 () Bool)

(assert (=> b!785215 (=> (not res!531472) (not e!436536))))

(assert (=> b!785215 (= res!531472 (and (= (size!20884 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20884 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20884 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!785217 () Bool)

(declare-fun e!436543 () Bool)

(declare-fun e!436544 () Bool)

(assert (=> b!785217 (= e!436543 e!436544)))

(declare-fun res!531479 () Bool)

(assert (=> b!785217 (=> res!531479 e!436544)))

(declare-fun lt!350091 () (_ BitVec 64))

(declare-fun lt!350085 () (_ BitVec 64))

(assert (=> b!785217 (= res!531479 (= lt!350091 lt!350085))))

(assert (=> b!785217 (= lt!350091 (select (store (arr!20463 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!785218 () Bool)

(declare-fun res!531475 () Bool)

(assert (=> b!785218 (=> (not res!531475) (not e!436542))))

(assert (=> b!785218 (= res!531475 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20884 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20884 a!3186))))))

(declare-fun b!785219 () Bool)

(declare-fun e!436541 () Bool)

(declare-fun lt!350089 () SeekEntryResult!8063)

(assert (=> b!785219 (= e!436541 (= lt!350088 lt!350089))))

(declare-fun b!785220 () Bool)

(assert (=> b!785220 (= e!436544 true)))

(assert (=> b!785220 e!436541))

(declare-fun res!531484 () Bool)

(assert (=> b!785220 (=> (not res!531484) (not e!436541))))

(assert (=> b!785220 (= res!531484 (= lt!350091 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350087 () Unit!27140)

(declare-fun e!436539 () Unit!27140)

(assert (=> b!785220 (= lt!350087 e!436539)))

(declare-fun c!87277 () Bool)

(assert (=> b!785220 (= c!87277 (= lt!350091 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!785221 () Bool)

(declare-fun Unit!27142 () Unit!27140)

(assert (=> b!785221 (= e!436539 Unit!27142)))

(assert (=> b!785221 false))

(declare-fun b!785222 () Bool)

(assert (=> b!785222 (= e!436538 e!436543)))

(declare-fun res!531482 () Bool)

(assert (=> b!785222 (=> res!531482 e!436543)))

(assert (=> b!785222 (= res!531482 (not (= lt!350089 lt!350095)))))

(assert (=> b!785222 (= lt!350089 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20463 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!785223 () Bool)

(declare-fun Unit!27143 () Unit!27140)

(assert (=> b!785223 (= e!436539 Unit!27143)))

(declare-fun b!785224 () Bool)

(declare-fun res!531471 () Bool)

(assert (=> b!785224 (=> (not res!531471) (not e!436541))))

(declare-fun lt!350096 () array!42750)

(assert (=> b!785224 (= res!531471 (= (seekEntryOrOpen!0 lt!350085 lt!350096 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350085 lt!350096 mask!3328)))))

(declare-fun b!785225 () Bool)

(declare-fun res!531477 () Bool)

(declare-fun e!436534 () Bool)

(assert (=> b!785225 (=> (not res!531477) (not e!436534))))

(assert (=> b!785225 (= res!531477 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20463 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!785226 () Bool)

(assert (=> b!785226 (= e!436542 e!436534)))

(declare-fun res!531474 () Bool)

(assert (=> b!785226 (=> (not res!531474) (not e!436534))))

(declare-fun lt!350090 () SeekEntryResult!8063)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42750 (_ BitVec 32)) SeekEntryResult!8063)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!785226 (= res!531474 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20463 a!3186) j!159) mask!3328) (select (arr!20463 a!3186) j!159) a!3186 mask!3328) lt!350090))))

(assert (=> b!785226 (= lt!350090 (Intermediate!8063 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!785227 () Bool)

(assert (=> b!785227 (= e!436533 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20463 a!3186) j!159) a!3186 mask!3328) lt!350090))))

(declare-fun b!785228 () Bool)

(declare-fun res!531483 () Bool)

(assert (=> b!785228 (=> (not res!531483) (not e!436534))))

(assert (=> b!785228 (= res!531483 e!436533)))

(declare-fun c!87276 () Bool)

(assert (=> b!785228 (= c!87276 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!785229 () Bool)

(declare-fun res!531481 () Bool)

(assert (=> b!785229 (=> (not res!531481) (not e!436536))))

(assert (=> b!785229 (= res!531481 (validKeyInArray!0 k!2102))))

(declare-fun b!785216 () Bool)

(assert (=> b!785216 (= e!436534 e!436535)))

(declare-fun res!531487 () Bool)

(assert (=> b!785216 (=> (not res!531487) (not e!436535))))

(declare-fun lt!350092 () SeekEntryResult!8063)

(assert (=> b!785216 (= res!531487 (= lt!350092 lt!350093))))

(assert (=> b!785216 (= lt!350093 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350085 lt!350096 mask!3328))))

(assert (=> b!785216 (= lt!350092 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350085 mask!3328) lt!350085 lt!350096 mask!3328))))

(assert (=> b!785216 (= lt!350085 (select (store (arr!20463 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!785216 (= lt!350096 (array!42751 (store (arr!20463 a!3186) i!1173 k!2102) (size!20884 a!3186)))))

(declare-fun res!531480 () Bool)

(assert (=> start!67710 (=> (not res!531480) (not e!436536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67710 (= res!531480 (validMask!0 mask!3328))))

(assert (=> start!67710 e!436536))

(assert (=> start!67710 true))

(declare-fun array_inv!16259 (array!42750) Bool)

(assert (=> start!67710 (array_inv!16259 a!3186)))

(assert (= (and start!67710 res!531480) b!785215))

(assert (= (and b!785215 res!531472) b!785207))

(assert (= (and b!785207 res!531478) b!785229))

(assert (= (and b!785229 res!531481) b!785211))

(assert (= (and b!785211 res!531488) b!785214))

(assert (= (and b!785214 res!531485) b!785212))

(assert (= (and b!785212 res!531486) b!785213))

(assert (= (and b!785213 res!531473) b!785218))

(assert (= (and b!785218 res!531475) b!785226))

(assert (= (and b!785226 res!531474) b!785225))

(assert (= (and b!785225 res!531477) b!785228))

(assert (= (and b!785228 c!87276) b!785227))

(assert (= (and b!785228 (not c!87276)) b!785210))

(assert (= (and b!785228 res!531483) b!785216))

(assert (= (and b!785216 res!531487) b!785209))

(assert (= (and b!785209 res!531476) b!785208))

(assert (= (and b!785209 (not res!531470)) b!785222))

(assert (= (and b!785222 (not res!531482)) b!785217))

(assert (= (and b!785217 (not res!531479)) b!785220))

(assert (= (and b!785220 c!87277) b!785221))

(assert (= (and b!785220 (not c!87277)) b!785223))

(assert (= (and b!785220 res!531484) b!785224))

(assert (= (and b!785224 res!531471) b!785219))

(declare-fun m!727337 () Bool)

(assert (=> b!785208 m!727337))

(assert (=> b!785208 m!727337))

(declare-fun m!727339 () Bool)

(assert (=> b!785208 m!727339))

(declare-fun m!727341 () Bool)

(assert (=> b!785213 m!727341))

(declare-fun m!727343 () Bool)

(assert (=> b!785225 m!727343))

(assert (=> b!785209 m!727337))

(assert (=> b!785209 m!727337))

(declare-fun m!727345 () Bool)

(assert (=> b!785209 m!727345))

(declare-fun m!727347 () Bool)

(assert (=> b!785209 m!727347))

(declare-fun m!727349 () Bool)

(assert (=> b!785209 m!727349))

(assert (=> b!785207 m!727337))

(assert (=> b!785207 m!727337))

(declare-fun m!727351 () Bool)

(assert (=> b!785207 m!727351))

(assert (=> b!785210 m!727337))

(assert (=> b!785210 m!727337))

(declare-fun m!727353 () Bool)

(assert (=> b!785210 m!727353))

(assert (=> b!785226 m!727337))

(assert (=> b!785226 m!727337))

(declare-fun m!727355 () Bool)

(assert (=> b!785226 m!727355))

(assert (=> b!785226 m!727355))

(assert (=> b!785226 m!727337))

(declare-fun m!727357 () Bool)

(assert (=> b!785226 m!727357))

(declare-fun m!727359 () Bool)

(assert (=> b!785216 m!727359))

(declare-fun m!727361 () Bool)

(assert (=> b!785216 m!727361))

(declare-fun m!727363 () Bool)

(assert (=> b!785216 m!727363))

(assert (=> b!785216 m!727359))

(declare-fun m!727365 () Bool)

(assert (=> b!785216 m!727365))

(declare-fun m!727367 () Bool)

(assert (=> b!785216 m!727367))

(assert (=> b!785217 m!727361))

(declare-fun m!727369 () Bool)

(assert (=> b!785217 m!727369))

(declare-fun m!727371 () Bool)

(assert (=> start!67710 m!727371))

(declare-fun m!727373 () Bool)

(assert (=> start!67710 m!727373))

(declare-fun m!727375 () Bool)

(assert (=> b!785211 m!727375))

(assert (=> b!785222 m!727337))

(assert (=> b!785222 m!727337))

(assert (=> b!785222 m!727353))

(declare-fun m!727377 () Bool)

(assert (=> b!785212 m!727377))

(assert (=> b!785227 m!727337))

(assert (=> b!785227 m!727337))

(declare-fun m!727379 () Bool)

(assert (=> b!785227 m!727379))

(declare-fun m!727381 () Bool)

(assert (=> b!785214 m!727381))

(declare-fun m!727383 () Bool)

(assert (=> b!785224 m!727383))

(declare-fun m!727385 () Bool)

(assert (=> b!785224 m!727385))

(declare-fun m!727387 () Bool)

(assert (=> b!785229 m!727387))

(push 1)

