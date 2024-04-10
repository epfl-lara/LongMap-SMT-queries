; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65210 () Bool)

(assert start!65210)

(declare-fun b!738340 () Bool)

(declare-fun e!412928 () Bool)

(declare-fun e!412925 () Bool)

(assert (=> b!738340 (= e!412928 e!412925)))

(declare-fun res!496363 () Bool)

(assert (=> b!738340 (=> (not res!496363) (not e!412925))))

(declare-datatypes ((SeekEntryResult!7405 0))(
  ( (MissingZero!7405 (index!31988 (_ BitVec 32))) (Found!7405 (index!31989 (_ BitVec 32))) (Intermediate!7405 (undefined!8217 Bool) (index!31990 (_ BitVec 32)) (x!62979 (_ BitVec 32))) (Undefined!7405) (MissingVacant!7405 (index!31991 (_ BitVec 32))) )
))
(declare-fun lt!327711 () SeekEntryResult!7405)

(declare-fun lt!327719 () SeekEntryResult!7405)

(assert (=> b!738340 (= res!496363 (= lt!327711 lt!327719))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!327709 () (_ BitVec 64))

(declare-datatypes ((array!41383 0))(
  ( (array!41384 (arr!19805 (Array (_ BitVec 32) (_ BitVec 64))) (size!20226 (_ BitVec 32))) )
))
(declare-fun lt!327717 () array!41383)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41383 (_ BitVec 32)) SeekEntryResult!7405)

(assert (=> b!738340 (= lt!327719 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327709 lt!327717 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738340 (= lt!327711 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327709 mask!3328) lt!327709 lt!327717 mask!3328))))

(declare-fun a!3186 () array!41383)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!738340 (= lt!327709 (select (store (arr!19805 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!738340 (= lt!327717 (array!41384 (store (arr!19805 a!3186) i!1173 k!2102) (size!20226 a!3186)))))

(declare-fun b!738341 () Bool)

(declare-fun res!496359 () Bool)

(declare-fun e!412932 () Bool)

(assert (=> b!738341 (=> res!496359 e!412932)))

(declare-fun e!412930 () Bool)

(assert (=> b!738341 (= res!496359 e!412930)))

(declare-fun c!81375 () Bool)

(declare-fun lt!327710 () Bool)

(assert (=> b!738341 (= c!81375 lt!327710)))

(declare-fun b!738342 () Bool)

(declare-fun res!496357 () Bool)

(declare-fun e!412924 () Bool)

(assert (=> b!738342 (=> (not res!496357) (not e!412924))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!738342 (= res!496357 (validKeyInArray!0 k!2102))))

(declare-fun b!738343 () Bool)

(declare-fun res!496367 () Bool)

(assert (=> b!738343 (=> (not res!496367) (not e!412924))))

(assert (=> b!738343 (= res!496367 (and (= (size!20226 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20226 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20226 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!738344 () Bool)

(assert (=> b!738344 (= e!412932 true)))

(declare-fun lt!327714 () SeekEntryResult!7405)

(declare-fun lt!327708 () (_ BitVec 32))

(assert (=> b!738344 (= lt!327714 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327708 lt!327709 lt!327717 mask!3328))))

(declare-fun b!738345 () Bool)

(declare-fun res!496365 () Bool)

(assert (=> b!738345 (=> (not res!496365) (not e!412928))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!738345 (= res!496365 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19805 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!738346 () Bool)

(declare-datatypes ((Unit!25216 0))(
  ( (Unit!25217) )
))
(declare-fun e!412927 () Unit!25216)

(declare-fun Unit!25218 () Unit!25216)

(assert (=> b!738346 (= e!412927 Unit!25218)))

(declare-fun lt!327716 () SeekEntryResult!7405)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41383 (_ BitVec 32)) SeekEntryResult!7405)

(assert (=> b!738346 (= lt!327716 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19805 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!327715 () SeekEntryResult!7405)

(assert (=> b!738346 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327708 resIntermediateIndex!5 (select (arr!19805 a!3186) j!159) a!3186 mask!3328) lt!327715)))

(declare-fun b!738347 () Bool)

(declare-fun e!412934 () Bool)

(assert (=> b!738347 (= e!412924 e!412934)))

(declare-fun res!496358 () Bool)

(assert (=> b!738347 (=> (not res!496358) (not e!412934))))

(declare-fun lt!327718 () SeekEntryResult!7405)

(assert (=> b!738347 (= res!496358 (or (= lt!327718 (MissingZero!7405 i!1173)) (= lt!327718 (MissingVacant!7405 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41383 (_ BitVec 32)) SeekEntryResult!7405)

(assert (=> b!738347 (= lt!327718 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!738348 () Bool)

(declare-fun res!496369 () Bool)

(assert (=> b!738348 (=> (not res!496369) (not e!412924))))

(assert (=> b!738348 (= res!496369 (validKeyInArray!0 (select (arr!19805 a!3186) j!159)))))

(declare-fun b!738349 () Bool)

(declare-fun lt!327712 () SeekEntryResult!7405)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!412931 () Bool)

(assert (=> b!738349 (= e!412931 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19805 a!3186) j!159) a!3186 mask!3328) lt!327712))))

(declare-fun b!738350 () Bool)

(assert (=> b!738350 (= e!412930 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327708 resIntermediateIndex!5 (select (arr!19805 a!3186) j!159) a!3186 mask!3328) lt!327715)))))

(declare-fun e!412923 () Bool)

(declare-fun b!738351 () Bool)

(declare-fun lt!327707 () SeekEntryResult!7405)

(assert (=> b!738351 (= e!412923 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19805 a!3186) j!159) a!3186 mask!3328) lt!327707))))

(declare-fun b!738352 () Bool)

(declare-fun e!412933 () Bool)

(assert (=> b!738352 (= e!412925 (not e!412933))))

(declare-fun res!496360 () Bool)

(assert (=> b!738352 (=> res!496360 e!412933)))

(assert (=> b!738352 (= res!496360 (or (not (is-Intermediate!7405 lt!327719)) (bvsge x!1131 (x!62979 lt!327719))))))

(assert (=> b!738352 (= lt!327715 (Found!7405 j!159))))

(declare-fun e!412926 () Bool)

(assert (=> b!738352 e!412926))

(declare-fun res!496361 () Bool)

(assert (=> b!738352 (=> (not res!496361) (not e!412926))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41383 (_ BitVec 32)) Bool)

(assert (=> b!738352 (= res!496361 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!327713 () Unit!25216)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41383 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25216)

(assert (=> b!738352 (= lt!327713 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!738353 () Bool)

(assert (=> b!738353 (= e!412926 e!412931)))

(declare-fun res!496355 () Bool)

(assert (=> b!738353 (=> (not res!496355) (not e!412931))))

(assert (=> b!738353 (= res!496355 (= (seekEntryOrOpen!0 (select (arr!19805 a!3186) j!159) a!3186 mask!3328) lt!327712))))

(assert (=> b!738353 (= lt!327712 (Found!7405 j!159))))

(declare-fun b!738354 () Bool)

(declare-fun Unit!25219 () Unit!25216)

(assert (=> b!738354 (= e!412927 Unit!25219)))

(assert (=> b!738354 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327708 (select (arr!19805 a!3186) j!159) a!3186 mask!3328) lt!327707)))

(declare-fun b!738355 () Bool)

(declare-fun res!496354 () Bool)

(assert (=> b!738355 (=> (not res!496354) (not e!412928))))

(assert (=> b!738355 (= res!496354 e!412923)))

(declare-fun c!81376 () Bool)

(assert (=> b!738355 (= c!81376 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!496362 () Bool)

(assert (=> start!65210 (=> (not res!496362) (not e!412924))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65210 (= res!496362 (validMask!0 mask!3328))))

(assert (=> start!65210 e!412924))

(assert (=> start!65210 true))

(declare-fun array_inv!15601 (array!41383) Bool)

(assert (=> start!65210 (array_inv!15601 a!3186)))

(declare-fun b!738356 () Bool)

(assert (=> b!738356 (= e!412933 e!412932)))

(declare-fun res!496368 () Bool)

(assert (=> b!738356 (=> res!496368 e!412932)))

(assert (=> b!738356 (= res!496368 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327708 #b00000000000000000000000000000000) (bvsge lt!327708 (size!20226 a!3186))))))

(declare-fun lt!327706 () Unit!25216)

(assert (=> b!738356 (= lt!327706 e!412927)))

(declare-fun c!81374 () Bool)

(assert (=> b!738356 (= c!81374 lt!327710)))

(assert (=> b!738356 (= lt!327710 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738356 (= lt!327708 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!738357 () Bool)

(assert (=> b!738357 (= e!412930 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327708 (select (arr!19805 a!3186) j!159) a!3186 mask!3328) lt!327707)))))

(declare-fun b!738358 () Bool)

(declare-fun res!496366 () Bool)

(assert (=> b!738358 (=> (not res!496366) (not e!412924))))

(declare-fun arrayContainsKey!0 (array!41383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!738358 (= res!496366 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!738359 () Bool)

(assert (=> b!738359 (= e!412934 e!412928)))

(declare-fun res!496370 () Bool)

(assert (=> b!738359 (=> (not res!496370) (not e!412928))))

(assert (=> b!738359 (= res!496370 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19805 a!3186) j!159) mask!3328) (select (arr!19805 a!3186) j!159) a!3186 mask!3328) lt!327707))))

(assert (=> b!738359 (= lt!327707 (Intermediate!7405 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!738360 () Bool)

(declare-fun res!496356 () Bool)

(assert (=> b!738360 (=> (not res!496356) (not e!412934))))

(assert (=> b!738360 (= res!496356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!738361 () Bool)

(declare-fun res!496353 () Bool)

(assert (=> b!738361 (=> (not res!496353) (not e!412934))))

(assert (=> b!738361 (= res!496353 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20226 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20226 a!3186))))))

(declare-fun b!738362 () Bool)

(assert (=> b!738362 (= e!412923 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19805 a!3186) j!159) a!3186 mask!3328) (Found!7405 j!159)))))

(declare-fun b!738363 () Bool)

(declare-fun res!496364 () Bool)

(assert (=> b!738363 (=> (not res!496364) (not e!412934))))

(declare-datatypes ((List!13807 0))(
  ( (Nil!13804) (Cons!13803 (h!14875 (_ BitVec 64)) (t!20122 List!13807)) )
))
(declare-fun arrayNoDuplicates!0 (array!41383 (_ BitVec 32) List!13807) Bool)

(assert (=> b!738363 (= res!496364 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13804))))

(assert (= (and start!65210 res!496362) b!738343))

(assert (= (and b!738343 res!496367) b!738348))

(assert (= (and b!738348 res!496369) b!738342))

(assert (= (and b!738342 res!496357) b!738358))

(assert (= (and b!738358 res!496366) b!738347))

(assert (= (and b!738347 res!496358) b!738360))

(assert (= (and b!738360 res!496356) b!738363))

(assert (= (and b!738363 res!496364) b!738361))

(assert (= (and b!738361 res!496353) b!738359))

(assert (= (and b!738359 res!496370) b!738345))

(assert (= (and b!738345 res!496365) b!738355))

(assert (= (and b!738355 c!81376) b!738351))

(assert (= (and b!738355 (not c!81376)) b!738362))

(assert (= (and b!738355 res!496354) b!738340))

(assert (= (and b!738340 res!496363) b!738352))

(assert (= (and b!738352 res!496361) b!738353))

(assert (= (and b!738353 res!496355) b!738349))

(assert (= (and b!738352 (not res!496360)) b!738356))

(assert (= (and b!738356 c!81374) b!738354))

(assert (= (and b!738356 (not c!81374)) b!738346))

(assert (= (and b!738356 (not res!496368)) b!738341))

(assert (= (and b!738341 c!81375) b!738357))

(assert (= (and b!738341 (not c!81375)) b!738350))

(assert (= (and b!738341 (not res!496359)) b!738344))

(declare-fun m!689995 () Bool)

(assert (=> b!738351 m!689995))

(assert (=> b!738351 m!689995))

(declare-fun m!689997 () Bool)

(assert (=> b!738351 m!689997))

(assert (=> b!738349 m!689995))

(assert (=> b!738349 m!689995))

(declare-fun m!689999 () Bool)

(assert (=> b!738349 m!689999))

(assert (=> b!738362 m!689995))

(assert (=> b!738362 m!689995))

(declare-fun m!690001 () Bool)

(assert (=> b!738362 m!690001))

(assert (=> b!738354 m!689995))

(assert (=> b!738354 m!689995))

(declare-fun m!690003 () Bool)

(assert (=> b!738354 m!690003))

(assert (=> b!738346 m!689995))

(assert (=> b!738346 m!689995))

(assert (=> b!738346 m!690001))

(assert (=> b!738346 m!689995))

(declare-fun m!690005 () Bool)

(assert (=> b!738346 m!690005))

(declare-fun m!690007 () Bool)

(assert (=> b!738360 m!690007))

(assert (=> b!738353 m!689995))

(assert (=> b!738353 m!689995))

(declare-fun m!690009 () Bool)

(assert (=> b!738353 m!690009))

(declare-fun m!690011 () Bool)

(assert (=> b!738340 m!690011))

(declare-fun m!690013 () Bool)

(assert (=> b!738340 m!690013))

(declare-fun m!690015 () Bool)

(assert (=> b!738340 m!690015))

(declare-fun m!690017 () Bool)

(assert (=> b!738340 m!690017))

(assert (=> b!738340 m!690013))

(declare-fun m!690019 () Bool)

(assert (=> b!738340 m!690019))

(assert (=> b!738350 m!689995))

(assert (=> b!738350 m!689995))

(assert (=> b!738350 m!690005))

(declare-fun m!690021 () Bool)

(assert (=> b!738347 m!690021))

(assert (=> b!738359 m!689995))

(assert (=> b!738359 m!689995))

(declare-fun m!690023 () Bool)

(assert (=> b!738359 m!690023))

(assert (=> b!738359 m!690023))

(assert (=> b!738359 m!689995))

(declare-fun m!690025 () Bool)

(assert (=> b!738359 m!690025))

(declare-fun m!690027 () Bool)

(assert (=> b!738363 m!690027))

(assert (=> b!738357 m!689995))

(assert (=> b!738357 m!689995))

(assert (=> b!738357 m!690003))

(declare-fun m!690029 () Bool)

(assert (=> b!738352 m!690029))

(declare-fun m!690031 () Bool)

(assert (=> b!738352 m!690031))

(assert (=> b!738348 m!689995))

(assert (=> b!738348 m!689995))

(declare-fun m!690033 () Bool)

(assert (=> b!738348 m!690033))

(declare-fun m!690035 () Bool)

(assert (=> b!738344 m!690035))

(declare-fun m!690037 () Bool)

(assert (=> b!738358 m!690037))

(declare-fun m!690039 () Bool)

(assert (=> b!738345 m!690039))

(declare-fun m!690041 () Bool)

(assert (=> b!738356 m!690041))

(declare-fun m!690043 () Bool)

(assert (=> b!738342 m!690043))

(declare-fun m!690045 () Bool)

(assert (=> start!65210 m!690045))

(declare-fun m!690047 () Bool)

(assert (=> start!65210 m!690047))

(push 1)

(assert (not b!738348))

(assert (not b!738351))

(assert (not b!738353))

(assert (not b!738358))

(assert (not b!738359))

(assert (not b!738342))

(assert (not b!738360))

(assert (not b!738352))

(assert (not b!738347))

(assert (not b!738350))

(assert (not b!738340))

(assert (not b!738349))

(assert (not b!738362))

(assert (not b!738356))

(assert (not start!65210))

(assert (not b!738344))

(assert (not b!738354))

(assert (not b!738363))

(assert (not b!738357))

(assert (not b!738346))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

