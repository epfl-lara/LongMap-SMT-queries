; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64530 () Bool)

(assert start!64530)

(declare-fun b!725344 () Bool)

(declare-fun res!486349 () Bool)

(declare-fun e!406283 () Bool)

(assert (=> b!725344 (=> (not res!486349) (not e!406283))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725344 (= res!486349 (validKeyInArray!0 k0!2102))))

(declare-fun b!725345 () Bool)

(declare-fun res!486351 () Bool)

(declare-fun e!406284 () Bool)

(assert (=> b!725345 (=> (not res!486351) (not e!406284))))

(declare-fun e!406282 () Bool)

(assert (=> b!725345 (= res!486351 e!406282)))

(declare-fun c!79874 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!725345 (= c!79874 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!725346 () Bool)

(declare-fun e!406287 () Bool)

(assert (=> b!725346 (= e!406284 e!406287)))

(declare-fun res!486355 () Bool)

(assert (=> b!725346 (=> (not res!486355) (not e!406287))))

(declare-datatypes ((array!40981 0))(
  ( (array!40982 (arr!19609 (Array (_ BitVec 32) (_ BitVec 64))) (size!20029 (_ BitVec 32))) )
))
(declare-fun lt!321332 () array!40981)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!321333 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!7165 0))(
  ( (MissingZero!7165 (index!31028 (_ BitVec 32))) (Found!7165 (index!31029 (_ BitVec 32))) (Intermediate!7165 (undefined!7977 Bool) (index!31030 (_ BitVec 32)) (x!62178 (_ BitVec 32))) (Undefined!7165) (MissingVacant!7165 (index!31031 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40981 (_ BitVec 32)) SeekEntryResult!7165)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!725346 (= res!486355 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321333 mask!3328) lt!321333 lt!321332 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321333 lt!321332 mask!3328)))))

(declare-fun a!3186 () array!40981)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!725346 (= lt!321333 (select (store (arr!19609 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!725346 (= lt!321332 (array!40982 (store (arr!19609 a!3186) i!1173 k0!2102) (size!20029 a!3186)))))

(declare-fun b!725347 () Bool)

(declare-fun res!486358 () Bool)

(declare-fun e!406286 () Bool)

(assert (=> b!725347 (=> (not res!486358) (not e!406286))))

(declare-datatypes ((List!13518 0))(
  ( (Nil!13515) (Cons!13514 (h!14574 (_ BitVec 64)) (t!19825 List!13518)) )
))
(declare-fun arrayNoDuplicates!0 (array!40981 (_ BitVec 32) List!13518) Bool)

(assert (=> b!725347 (= res!486358 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13515))))

(declare-fun b!725348 () Bool)

(declare-fun res!486356 () Bool)

(assert (=> b!725348 (=> (not res!486356) (not e!406284))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!725348 (= res!486356 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19609 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!725349 () Bool)

(assert (=> b!725349 (= e!406283 e!406286)))

(declare-fun res!486352 () Bool)

(assert (=> b!725349 (=> (not res!486352) (not e!406286))))

(declare-fun lt!321329 () SeekEntryResult!7165)

(assert (=> b!725349 (= res!486352 (or (= lt!321329 (MissingZero!7165 i!1173)) (= lt!321329 (MissingVacant!7165 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40981 (_ BitVec 32)) SeekEntryResult!7165)

(assert (=> b!725349 (= lt!321329 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!725350 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40981 (_ BitVec 32)) SeekEntryResult!7165)

(assert (=> b!725350 (= e!406282 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19609 a!3186) j!159) a!3186 mask!3328) (Found!7165 j!159)))))

(declare-fun b!725351 () Bool)

(declare-fun res!486345 () Bool)

(assert (=> b!725351 (=> (not res!486345) (not e!406283))))

(declare-fun arrayContainsKey!0 (array!40981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725351 (= res!486345 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!725352 () Bool)

(assert (=> b!725352 (= e!406287 (not true))))

(declare-fun e!406285 () Bool)

(assert (=> b!725352 e!406285))

(declare-fun res!486347 () Bool)

(assert (=> b!725352 (=> (not res!486347) (not e!406285))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40981 (_ BitVec 32)) Bool)

(assert (=> b!725352 (= res!486347 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24727 0))(
  ( (Unit!24728) )
))
(declare-fun lt!321331 () Unit!24727)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40981 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24727)

(assert (=> b!725352 (= lt!321331 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!725353 () Bool)

(declare-fun res!486348 () Bool)

(assert (=> b!725353 (=> (not res!486348) (not e!406286))))

(assert (=> b!725353 (= res!486348 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20029 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20029 a!3186))))))

(declare-fun lt!321330 () SeekEntryResult!7165)

(declare-fun b!725354 () Bool)

(assert (=> b!725354 (= e!406282 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19609 a!3186) j!159) a!3186 mask!3328) lt!321330))))

(declare-fun res!486357 () Bool)

(assert (=> start!64530 (=> (not res!486357) (not e!406283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64530 (= res!486357 (validMask!0 mask!3328))))

(assert (=> start!64530 e!406283))

(assert (=> start!64530 true))

(declare-fun array_inv!15468 (array!40981) Bool)

(assert (=> start!64530 (array_inv!15468 a!3186)))

(declare-fun b!725355 () Bool)

(assert (=> b!725355 (= e!406286 e!406284)))

(declare-fun res!486354 () Bool)

(assert (=> b!725355 (=> (not res!486354) (not e!406284))))

(assert (=> b!725355 (= res!486354 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19609 a!3186) j!159) mask!3328) (select (arr!19609 a!3186) j!159) a!3186 mask!3328) lt!321330))))

(assert (=> b!725355 (= lt!321330 (Intermediate!7165 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!725356 () Bool)

(declare-fun res!486346 () Bool)

(assert (=> b!725356 (=> (not res!486346) (not e!406283))))

(assert (=> b!725356 (= res!486346 (and (= (size!20029 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20029 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20029 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!725357 () Bool)

(declare-fun res!486350 () Bool)

(assert (=> b!725357 (=> (not res!486350) (not e!406286))))

(assert (=> b!725357 (= res!486350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!725358 () Bool)

(declare-fun res!486353 () Bool)

(assert (=> b!725358 (=> (not res!486353) (not e!406283))))

(assert (=> b!725358 (= res!486353 (validKeyInArray!0 (select (arr!19609 a!3186) j!159)))))

(declare-fun b!725359 () Bool)

(assert (=> b!725359 (= e!406285 (= (seekEntryOrOpen!0 (select (arr!19609 a!3186) j!159) a!3186 mask!3328) (Found!7165 j!159)))))

(assert (= (and start!64530 res!486357) b!725356))

(assert (= (and b!725356 res!486346) b!725358))

(assert (= (and b!725358 res!486353) b!725344))

(assert (= (and b!725344 res!486349) b!725351))

(assert (= (and b!725351 res!486345) b!725349))

(assert (= (and b!725349 res!486352) b!725357))

(assert (= (and b!725357 res!486350) b!725347))

(assert (= (and b!725347 res!486358) b!725353))

(assert (= (and b!725353 res!486348) b!725355))

(assert (= (and b!725355 res!486354) b!725348))

(assert (= (and b!725348 res!486356) b!725345))

(assert (= (and b!725345 c!79874) b!725354))

(assert (= (and b!725345 (not c!79874)) b!725350))

(assert (= (and b!725345 res!486351) b!725346))

(assert (= (and b!725346 res!486355) b!725352))

(assert (= (and b!725352 res!486347) b!725359))

(declare-fun m!680067 () Bool)

(assert (=> b!725349 m!680067))

(declare-fun m!680069 () Bool)

(assert (=> b!725351 m!680069))

(declare-fun m!680071 () Bool)

(assert (=> b!725359 m!680071))

(assert (=> b!725359 m!680071))

(declare-fun m!680073 () Bool)

(assert (=> b!725359 m!680073))

(declare-fun m!680075 () Bool)

(assert (=> b!725348 m!680075))

(declare-fun m!680077 () Bool)

(assert (=> b!725347 m!680077))

(declare-fun m!680079 () Bool)

(assert (=> b!725357 m!680079))

(assert (=> b!725355 m!680071))

(assert (=> b!725355 m!680071))

(declare-fun m!680081 () Bool)

(assert (=> b!725355 m!680081))

(assert (=> b!725355 m!680081))

(assert (=> b!725355 m!680071))

(declare-fun m!680083 () Bool)

(assert (=> b!725355 m!680083))

(assert (=> b!725354 m!680071))

(assert (=> b!725354 m!680071))

(declare-fun m!680085 () Bool)

(assert (=> b!725354 m!680085))

(assert (=> b!725350 m!680071))

(assert (=> b!725350 m!680071))

(declare-fun m!680087 () Bool)

(assert (=> b!725350 m!680087))

(declare-fun m!680089 () Bool)

(assert (=> start!64530 m!680089))

(declare-fun m!680091 () Bool)

(assert (=> start!64530 m!680091))

(declare-fun m!680093 () Bool)

(assert (=> b!725346 m!680093))

(declare-fun m!680095 () Bool)

(assert (=> b!725346 m!680095))

(declare-fun m!680097 () Bool)

(assert (=> b!725346 m!680097))

(declare-fun m!680099 () Bool)

(assert (=> b!725346 m!680099))

(assert (=> b!725346 m!680097))

(declare-fun m!680101 () Bool)

(assert (=> b!725346 m!680101))

(assert (=> b!725358 m!680071))

(assert (=> b!725358 m!680071))

(declare-fun m!680103 () Bool)

(assert (=> b!725358 m!680103))

(declare-fun m!680105 () Bool)

(assert (=> b!725352 m!680105))

(declare-fun m!680107 () Bool)

(assert (=> b!725352 m!680107))

(declare-fun m!680109 () Bool)

(assert (=> b!725344 m!680109))

(check-sat (not b!725358) (not b!725344) (not b!725350) (not b!725359) (not b!725349) (not b!725351) (not b!725346) (not b!725355) (not b!725352) (not b!725347) (not start!64530) (not b!725354) (not b!725357))
(check-sat)
