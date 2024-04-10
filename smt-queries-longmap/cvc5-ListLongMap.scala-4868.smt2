; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67122 () Bool)

(assert start!67122)

(declare-fun b!775197 () Bool)

(declare-fun e!431459 () Bool)

(declare-fun e!431457 () Bool)

(assert (=> b!775197 (= e!431459 e!431457)))

(declare-fun res!524202 () Bool)

(assert (=> b!775197 (=> (not res!524202) (not e!431457))))

(declare-datatypes ((array!42477 0))(
  ( (array!42478 (arr!20334 (Array (_ BitVec 32) (_ BitVec 64))) (size!20755 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42477)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7934 0))(
  ( (MissingZero!7934 (index!34104 (_ BitVec 32))) (Found!7934 (index!34105 (_ BitVec 32))) (Intermediate!7934 (undefined!8746 Bool) (index!34106 (_ BitVec 32)) (x!65053 (_ BitVec 32))) (Undefined!7934) (MissingVacant!7934 (index!34107 (_ BitVec 32))) )
))
(declare-fun lt!345303 () SeekEntryResult!7934)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42477 (_ BitVec 32)) SeekEntryResult!7934)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775197 (= res!524202 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20334 a!3186) j!159) mask!3328) (select (arr!20334 a!3186) j!159) a!3186 mask!3328) lt!345303))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!775197 (= lt!345303 (Intermediate!7934 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!775198 () Bool)

(declare-fun res!524201 () Bool)

(declare-fun e!431463 () Bool)

(assert (=> b!775198 (=> (not res!524201) (not e!431463))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!775198 (= res!524201 (validKeyInArray!0 k!2102))))

(declare-fun b!775199 () Bool)

(declare-fun e!431461 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!775199 (= e!431461 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20334 a!3186) j!159) a!3186 mask!3328) lt!345303))))

(declare-fun b!775200 () Bool)

(declare-fun e!431468 () Bool)

(assert (=> b!775200 (= e!431457 e!431468)))

(declare-fun res!524198 () Bool)

(assert (=> b!775200 (=> (not res!524198) (not e!431468))))

(declare-fun lt!345300 () SeekEntryResult!7934)

(declare-fun lt!345306 () SeekEntryResult!7934)

(assert (=> b!775200 (= res!524198 (= lt!345300 lt!345306))))

(declare-fun lt!345309 () (_ BitVec 64))

(declare-fun lt!345298 () array!42477)

(assert (=> b!775200 (= lt!345306 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345309 lt!345298 mask!3328))))

(assert (=> b!775200 (= lt!345300 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345309 mask!3328) lt!345309 lt!345298 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!775200 (= lt!345309 (select (store (arr!20334 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!775200 (= lt!345298 (array!42478 (store (arr!20334 a!3186) i!1173 k!2102) (size!20755 a!3186)))))

(declare-fun b!775201 () Bool)

(declare-fun res!524206 () Bool)

(assert (=> b!775201 (=> (not res!524206) (not e!431459))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42477 (_ BitVec 32)) Bool)

(assert (=> b!775201 (= res!524206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!775202 () Bool)

(declare-fun res!524197 () Bool)

(assert (=> b!775202 (=> (not res!524197) (not e!431457))))

(assert (=> b!775202 (= res!524197 e!431461)))

(declare-fun c!85906 () Bool)

(assert (=> b!775202 (= c!85906 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!775203 () Bool)

(declare-fun e!431458 () Bool)

(declare-fun lt!345304 () (_ BitVec 32))

(assert (=> b!775203 (= e!431458 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345304 (select (arr!20334 a!3186) j!159) a!3186 mask!3328) lt!345303)))))

(declare-fun b!775204 () Bool)

(declare-fun res!524204 () Bool)

(declare-fun e!431460 () Bool)

(assert (=> b!775204 (=> res!524204 e!431460)))

(assert (=> b!775204 (= res!524204 e!431458)))

(declare-fun c!85904 () Bool)

(declare-fun lt!345311 () Bool)

(assert (=> b!775204 (= c!85904 lt!345311)))

(declare-fun e!431462 () Bool)

(declare-fun lt!345299 () SeekEntryResult!7934)

(declare-fun b!775206 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42477 (_ BitVec 32)) SeekEntryResult!7934)

(assert (=> b!775206 (= e!431462 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20334 a!3186) j!159) a!3186 mask!3328) lt!345299))))

(declare-fun b!775207 () Bool)

(declare-datatypes ((Unit!26750 0))(
  ( (Unit!26751) )
))
(declare-fun e!431465 () Unit!26750)

(declare-fun Unit!26752 () Unit!26750)

(assert (=> b!775207 (= e!431465 Unit!26752)))

(declare-fun lt!345308 () SeekEntryResult!7934)

(assert (=> b!775207 (= lt!345308 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20334 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!345301 () SeekEntryResult!7934)

(assert (=> b!775207 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345304 resIntermediateIndex!5 (select (arr!20334 a!3186) j!159) a!3186 mask!3328) lt!345301)))

(declare-fun b!775208 () Bool)

(declare-fun res!524195 () Bool)

(assert (=> b!775208 (=> (not res!524195) (not e!431463))))

(assert (=> b!775208 (= res!524195 (and (= (size!20755 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20755 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20755 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!775209 () Bool)

(assert (=> b!775209 (= e!431458 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345304 resIntermediateIndex!5 (select (arr!20334 a!3186) j!159) a!3186 mask!3328) lt!345301)))))

(declare-fun b!775210 () Bool)

(declare-fun res!524200 () Bool)

(assert (=> b!775210 (=> (not res!524200) (not e!431463))))

(declare-fun arrayContainsKey!0 (array!42477 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!775210 (= res!524200 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!775211 () Bool)

(declare-fun res!524191 () Bool)

(assert (=> b!775211 (=> (not res!524191) (not e!431459))))

(assert (=> b!775211 (= res!524191 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20755 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20755 a!3186))))))

(declare-fun b!775212 () Bool)

(declare-fun e!431464 () Bool)

(assert (=> b!775212 (= e!431464 e!431460)))

(declare-fun res!524196 () Bool)

(assert (=> b!775212 (=> res!524196 e!431460)))

(assert (=> b!775212 (= res!524196 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!345304 #b00000000000000000000000000000000) (bvsge lt!345304 (size!20755 a!3186))))))

(declare-fun lt!345305 () Unit!26750)

(assert (=> b!775212 (= lt!345305 e!431465)))

(declare-fun c!85905 () Bool)

(assert (=> b!775212 (= c!85905 lt!345311)))

(assert (=> b!775212 (= lt!345311 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775212 (= lt!345304 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!775213 () Bool)

(assert (=> b!775213 (= e!431461 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20334 a!3186) j!159) a!3186 mask!3328) (Found!7934 j!159)))))

(declare-fun b!775214 () Bool)

(assert (=> b!775214 (= e!431463 e!431459)))

(declare-fun res!524199 () Bool)

(assert (=> b!775214 (=> (not res!524199) (not e!431459))))

(declare-fun lt!345307 () SeekEntryResult!7934)

(assert (=> b!775214 (= res!524199 (or (= lt!345307 (MissingZero!7934 i!1173)) (= lt!345307 (MissingVacant!7934 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42477 (_ BitVec 32)) SeekEntryResult!7934)

(assert (=> b!775214 (= lt!345307 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!775205 () Bool)

(assert (=> b!775205 (= e!431468 (not e!431464))))

(declare-fun res!524190 () Bool)

(assert (=> b!775205 (=> res!524190 e!431464)))

(assert (=> b!775205 (= res!524190 (or (not (is-Intermediate!7934 lt!345306)) (bvsge x!1131 (x!65053 lt!345306))))))

(assert (=> b!775205 (= lt!345301 (Found!7934 j!159))))

(declare-fun e!431467 () Bool)

(assert (=> b!775205 e!431467))

(declare-fun res!524194 () Bool)

(assert (=> b!775205 (=> (not res!524194) (not e!431467))))

(assert (=> b!775205 (= res!524194 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!345302 () Unit!26750)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42477 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26750)

(assert (=> b!775205 (= lt!345302 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!524192 () Bool)

(assert (=> start!67122 (=> (not res!524192) (not e!431463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67122 (= res!524192 (validMask!0 mask!3328))))

(assert (=> start!67122 e!431463))

(assert (=> start!67122 true))

(declare-fun array_inv!16130 (array!42477) Bool)

(assert (=> start!67122 (array_inv!16130 a!3186)))

(declare-fun b!775215 () Bool)

(declare-fun res!524189 () Bool)

(assert (=> b!775215 (=> res!524189 e!431460)))

(assert (=> b!775215 (= res!524189 (not (= lt!345300 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345304 lt!345309 lt!345298 mask!3328))))))

(declare-fun b!775216 () Bool)

(assert (=> b!775216 (= e!431467 e!431462)))

(declare-fun res!524205 () Bool)

(assert (=> b!775216 (=> (not res!524205) (not e!431462))))

(assert (=> b!775216 (= res!524205 (= (seekEntryOrOpen!0 (select (arr!20334 a!3186) j!159) a!3186 mask!3328) lt!345299))))

(assert (=> b!775216 (= lt!345299 (Found!7934 j!159))))

(declare-fun b!775217 () Bool)

(declare-fun res!524193 () Bool)

(assert (=> b!775217 (=> (not res!524193) (not e!431463))))

(assert (=> b!775217 (= res!524193 (validKeyInArray!0 (select (arr!20334 a!3186) j!159)))))

(declare-fun b!775218 () Bool)

(declare-fun res!524203 () Bool)

(assert (=> b!775218 (=> (not res!524203) (not e!431459))))

(declare-datatypes ((List!14336 0))(
  ( (Nil!14333) (Cons!14332 (h!15440 (_ BitVec 64)) (t!20651 List!14336)) )
))
(declare-fun arrayNoDuplicates!0 (array!42477 (_ BitVec 32) List!14336) Bool)

(assert (=> b!775218 (= res!524203 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14333))))

(declare-fun b!775219 () Bool)

(assert (=> b!775219 (= e!431460 true)))

(assert (=> b!775219 (= (seekEntryOrOpen!0 lt!345309 lt!345298 mask!3328) lt!345301)))

(declare-fun lt!345310 () Unit!26750)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!42477 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26750)

(assert (=> b!775219 (= lt!345310 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k!2102 j!159 lt!345304 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!775220 () Bool)

(declare-fun res!524207 () Bool)

(assert (=> b!775220 (=> (not res!524207) (not e!431457))))

(assert (=> b!775220 (= res!524207 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20334 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!775221 () Bool)

(declare-fun Unit!26753 () Unit!26750)

(assert (=> b!775221 (= e!431465 Unit!26753)))

(assert (=> b!775221 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345304 (select (arr!20334 a!3186) j!159) a!3186 mask!3328) lt!345303)))

(assert (= (and start!67122 res!524192) b!775208))

(assert (= (and b!775208 res!524195) b!775217))

(assert (= (and b!775217 res!524193) b!775198))

(assert (= (and b!775198 res!524201) b!775210))

(assert (= (and b!775210 res!524200) b!775214))

(assert (= (and b!775214 res!524199) b!775201))

(assert (= (and b!775201 res!524206) b!775218))

(assert (= (and b!775218 res!524203) b!775211))

(assert (= (and b!775211 res!524191) b!775197))

(assert (= (and b!775197 res!524202) b!775220))

(assert (= (and b!775220 res!524207) b!775202))

(assert (= (and b!775202 c!85906) b!775199))

(assert (= (and b!775202 (not c!85906)) b!775213))

(assert (= (and b!775202 res!524197) b!775200))

(assert (= (and b!775200 res!524198) b!775205))

(assert (= (and b!775205 res!524194) b!775216))

(assert (= (and b!775216 res!524205) b!775206))

(assert (= (and b!775205 (not res!524190)) b!775212))

(assert (= (and b!775212 c!85905) b!775221))

(assert (= (and b!775212 (not c!85905)) b!775207))

(assert (= (and b!775212 (not res!524196)) b!775204))

(assert (= (and b!775204 c!85904) b!775203))

(assert (= (and b!775204 (not c!85904)) b!775209))

(assert (= (and b!775204 (not res!524204)) b!775215))

(assert (= (and b!775215 (not res!524189)) b!775219))

(declare-fun m!719477 () Bool)

(assert (=> b!775201 m!719477))

(declare-fun m!719479 () Bool)

(assert (=> b!775218 m!719479))

(declare-fun m!719481 () Bool)

(assert (=> b!775210 m!719481))

(declare-fun m!719483 () Bool)

(assert (=> b!775206 m!719483))

(assert (=> b!775206 m!719483))

(declare-fun m!719485 () Bool)

(assert (=> b!775206 m!719485))

(declare-fun m!719487 () Bool)

(assert (=> b!775215 m!719487))

(declare-fun m!719489 () Bool)

(assert (=> b!775205 m!719489))

(declare-fun m!719491 () Bool)

(assert (=> b!775205 m!719491))

(assert (=> b!775216 m!719483))

(assert (=> b!775216 m!719483))

(declare-fun m!719493 () Bool)

(assert (=> b!775216 m!719493))

(declare-fun m!719495 () Bool)

(assert (=> start!67122 m!719495))

(declare-fun m!719497 () Bool)

(assert (=> start!67122 m!719497))

(assert (=> b!775221 m!719483))

(assert (=> b!775221 m!719483))

(declare-fun m!719499 () Bool)

(assert (=> b!775221 m!719499))

(declare-fun m!719501 () Bool)

(assert (=> b!775198 m!719501))

(declare-fun m!719503 () Bool)

(assert (=> b!775212 m!719503))

(assert (=> b!775197 m!719483))

(assert (=> b!775197 m!719483))

(declare-fun m!719505 () Bool)

(assert (=> b!775197 m!719505))

(assert (=> b!775197 m!719505))

(assert (=> b!775197 m!719483))

(declare-fun m!719507 () Bool)

(assert (=> b!775197 m!719507))

(declare-fun m!719509 () Bool)

(assert (=> b!775220 m!719509))

(assert (=> b!775209 m!719483))

(assert (=> b!775209 m!719483))

(declare-fun m!719511 () Bool)

(assert (=> b!775209 m!719511))

(declare-fun m!719513 () Bool)

(assert (=> b!775219 m!719513))

(declare-fun m!719515 () Bool)

(assert (=> b!775219 m!719515))

(assert (=> b!775203 m!719483))

(assert (=> b!775203 m!719483))

(assert (=> b!775203 m!719499))

(assert (=> b!775213 m!719483))

(assert (=> b!775213 m!719483))

(declare-fun m!719517 () Bool)

(assert (=> b!775213 m!719517))

(assert (=> b!775207 m!719483))

(assert (=> b!775207 m!719483))

(assert (=> b!775207 m!719517))

(assert (=> b!775207 m!719483))

(assert (=> b!775207 m!719511))

(assert (=> b!775199 m!719483))

(assert (=> b!775199 m!719483))

(declare-fun m!719519 () Bool)

(assert (=> b!775199 m!719519))

(assert (=> b!775217 m!719483))

(assert (=> b!775217 m!719483))

(declare-fun m!719521 () Bool)

(assert (=> b!775217 m!719521))

(declare-fun m!719523 () Bool)

(assert (=> b!775214 m!719523))

(declare-fun m!719525 () Bool)

(assert (=> b!775200 m!719525))

(declare-fun m!719527 () Bool)

(assert (=> b!775200 m!719527))

(assert (=> b!775200 m!719527))

(declare-fun m!719529 () Bool)

(assert (=> b!775200 m!719529))

(declare-fun m!719531 () Bool)

(assert (=> b!775200 m!719531))

(declare-fun m!719533 () Bool)

(assert (=> b!775200 m!719533))

(push 1)

