; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67118 () Bool)

(assert start!67118)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42473 0))(
  ( (array!42474 (arr!20332 (Array (_ BitVec 32) (_ BitVec 64))) (size!20753 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42473)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!775047 () Bool)

(declare-fun e!431393 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7932 0))(
  ( (MissingZero!7932 (index!34096 (_ BitVec 32))) (Found!7932 (index!34097 (_ BitVec 32))) (Intermediate!7932 (undefined!8744 Bool) (index!34098 (_ BitVec 32)) (x!65043 (_ BitVec 32))) (Undefined!7932) (MissingVacant!7932 (index!34099 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42473 (_ BitVec 32)) SeekEntryResult!7932)

(assert (=> b!775047 (= e!431393 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20332 a!3186) j!159) a!3186 mask!3328) (Found!7932 j!159)))))

(declare-fun b!775048 () Bool)

(declare-fun lt!345222 () SeekEntryResult!7932)

(declare-fun lt!345221 () (_ BitVec 32))

(declare-fun e!431391 () Bool)

(assert (=> b!775048 (= e!431391 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345221 resIntermediateIndex!5 (select (arr!20332 a!3186) j!159) a!3186 mask!3328) lt!345222)))))

(declare-fun b!775049 () Bool)

(declare-fun res!524075 () Bool)

(declare-fun e!431387 () Bool)

(assert (=> b!775049 (=> (not res!524075) (not e!431387))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!775049 (= res!524075 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!775050 () Bool)

(declare-fun e!431396 () Bool)

(declare-fun e!431392 () Bool)

(assert (=> b!775050 (= e!431396 (not e!431392))))

(declare-fun res!524079 () Bool)

(assert (=> b!775050 (=> res!524079 e!431392)))

(declare-fun lt!345216 () SeekEntryResult!7932)

(get-info :version)

(assert (=> b!775050 (= res!524079 (or (not ((_ is Intermediate!7932) lt!345216)) (bvsge x!1131 (x!65043 lt!345216))))))

(assert (=> b!775050 (= lt!345222 (Found!7932 j!159))))

(declare-fun e!431388 () Bool)

(assert (=> b!775050 e!431388))

(declare-fun res!524087 () Bool)

(assert (=> b!775050 (=> (not res!524087) (not e!431388))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42473 (_ BitVec 32)) Bool)

(assert (=> b!775050 (= res!524087 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26742 0))(
  ( (Unit!26743) )
))
(declare-fun lt!345224 () Unit!26742)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42473 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26742)

(assert (=> b!775050 (= lt!345224 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!775051 () Bool)

(declare-fun res!524078 () Bool)

(assert (=> b!775051 (=> (not res!524078) (not e!431387))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!775051 (= res!524078 (validKeyInArray!0 k0!2102))))

(declare-fun b!775052 () Bool)

(declare-fun res!524091 () Bool)

(assert (=> b!775052 (=> (not res!524091) (not e!431387))))

(assert (=> b!775052 (= res!524091 (validKeyInArray!0 (select (arr!20332 a!3186) j!159)))))

(declare-fun b!775053 () Bool)

(declare-fun lt!345219 () SeekEntryResult!7932)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42473 (_ BitVec 32)) SeekEntryResult!7932)

(assert (=> b!775053 (= e!431391 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345221 (select (arr!20332 a!3186) j!159) a!3186 mask!3328) lt!345219)))))

(declare-fun b!775054 () Bool)

(declare-fun e!431389 () Unit!26742)

(declare-fun Unit!26744 () Unit!26742)

(assert (=> b!775054 (= e!431389 Unit!26744)))

(declare-fun lt!345217 () SeekEntryResult!7932)

(assert (=> b!775054 (= lt!345217 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20332 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!775054 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345221 resIntermediateIndex!5 (select (arr!20332 a!3186) j!159) a!3186 mask!3328) lt!345222)))

(declare-fun b!775055 () Bool)

(declare-fun res!524083 () Bool)

(assert (=> b!775055 (=> (not res!524083) (not e!431387))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!775055 (= res!524083 (and (= (size!20753 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20753 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20753 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!775056 () Bool)

(declare-fun res!524082 () Bool)

(declare-fun e!431390 () Bool)

(assert (=> b!775056 (=> (not res!524082) (not e!431390))))

(assert (=> b!775056 (= res!524082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!775057 () Bool)

(declare-fun res!524077 () Bool)

(assert (=> b!775057 (=> (not res!524077) (not e!431390))))

(declare-datatypes ((List!14334 0))(
  ( (Nil!14331) (Cons!14330 (h!15438 (_ BitVec 64)) (t!20649 List!14334)) )
))
(declare-fun arrayNoDuplicates!0 (array!42473 (_ BitVec 32) List!14334) Bool)

(assert (=> b!775057 (= res!524077 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14331))))

(declare-fun res!524085 () Bool)

(assert (=> start!67118 (=> (not res!524085) (not e!431387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67118 (= res!524085 (validMask!0 mask!3328))))

(assert (=> start!67118 e!431387))

(assert (=> start!67118 true))

(declare-fun array_inv!16128 (array!42473) Bool)

(assert (=> start!67118 (array_inv!16128 a!3186)))

(declare-fun b!775058 () Bool)

(declare-fun e!431395 () Bool)

(assert (=> b!775058 (= e!431388 e!431395)))

(declare-fun res!524089 () Bool)

(assert (=> b!775058 (=> (not res!524089) (not e!431395))))

(declare-fun lt!345223 () SeekEntryResult!7932)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42473 (_ BitVec 32)) SeekEntryResult!7932)

(assert (=> b!775058 (= res!524089 (= (seekEntryOrOpen!0 (select (arr!20332 a!3186) j!159) a!3186 mask!3328) lt!345223))))

(assert (=> b!775058 (= lt!345223 (Found!7932 j!159))))

(declare-fun b!775059 () Bool)

(assert (=> b!775059 (= e!431393 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20332 a!3186) j!159) a!3186 mask!3328) lt!345219))))

(declare-fun b!775060 () Bool)

(declare-fun Unit!26745 () Unit!26742)

(assert (=> b!775060 (= e!431389 Unit!26745)))

(assert (=> b!775060 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345221 (select (arr!20332 a!3186) j!159) a!3186 mask!3328) lt!345219)))

(declare-fun b!775061 () Bool)

(declare-fun res!524081 () Bool)

(declare-fun e!431386 () Bool)

(assert (=> b!775061 (=> (not res!524081) (not e!431386))))

(assert (=> b!775061 (= res!524081 e!431393)))

(declare-fun c!85888 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!775061 (= c!85888 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!775062 () Bool)

(declare-fun res!524090 () Bool)

(declare-fun e!431385 () Bool)

(assert (=> b!775062 (=> res!524090 e!431385)))

(declare-fun lt!345225 () (_ BitVec 64))

(declare-fun lt!345227 () array!42473)

(declare-fun lt!345220 () SeekEntryResult!7932)

(assert (=> b!775062 (= res!524090 (not (= lt!345220 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345221 lt!345225 lt!345227 mask!3328))))))

(declare-fun b!775063 () Bool)

(assert (=> b!775063 (= e!431395 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20332 a!3186) j!159) a!3186 mask!3328) lt!345223))))

(declare-fun b!775064 () Bool)

(assert (=> b!775064 (= e!431386 e!431396)))

(declare-fun res!524080 () Bool)

(assert (=> b!775064 (=> (not res!524080) (not e!431396))))

(assert (=> b!775064 (= res!524080 (= lt!345220 lt!345216))))

(assert (=> b!775064 (= lt!345216 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345225 lt!345227 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775064 (= lt!345220 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345225 mask!3328) lt!345225 lt!345227 mask!3328))))

(assert (=> b!775064 (= lt!345225 (select (store (arr!20332 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!775064 (= lt!345227 (array!42474 (store (arr!20332 a!3186) i!1173 k0!2102) (size!20753 a!3186)))))

(declare-fun b!775065 () Bool)

(assert (=> b!775065 (= e!431390 e!431386)))

(declare-fun res!524092 () Bool)

(assert (=> b!775065 (=> (not res!524092) (not e!431386))))

(assert (=> b!775065 (= res!524092 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20332 a!3186) j!159) mask!3328) (select (arr!20332 a!3186) j!159) a!3186 mask!3328) lt!345219))))

(assert (=> b!775065 (= lt!345219 (Intermediate!7932 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!775066 () Bool)

(assert (=> b!775066 (= e!431385 true)))

(assert (=> b!775066 (= (seekEntryOrOpen!0 lt!345225 lt!345227 mask!3328) lt!345222)))

(declare-fun lt!345214 () Unit!26742)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!42473 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26742)

(assert (=> b!775066 (= lt!345214 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k0!2102 j!159 lt!345221 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!775067 () Bool)

(assert (=> b!775067 (= e!431392 e!431385)))

(declare-fun res!524093 () Bool)

(assert (=> b!775067 (=> res!524093 e!431385)))

(assert (=> b!775067 (= res!524093 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!345221 #b00000000000000000000000000000000) (bvsge lt!345221 (size!20753 a!3186))))))

(declare-fun lt!345226 () Unit!26742)

(assert (=> b!775067 (= lt!345226 e!431389)))

(declare-fun c!85886 () Bool)

(declare-fun lt!345218 () Bool)

(assert (=> b!775067 (= c!85886 lt!345218)))

(assert (=> b!775067 (= lt!345218 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775067 (= lt!345221 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!775068 () Bool)

(declare-fun res!524088 () Bool)

(assert (=> b!775068 (=> (not res!524088) (not e!431386))))

(assert (=> b!775068 (= res!524088 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20332 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!775069 () Bool)

(assert (=> b!775069 (= e!431387 e!431390)))

(declare-fun res!524076 () Bool)

(assert (=> b!775069 (=> (not res!524076) (not e!431390))))

(declare-fun lt!345215 () SeekEntryResult!7932)

(assert (=> b!775069 (= res!524076 (or (= lt!345215 (MissingZero!7932 i!1173)) (= lt!345215 (MissingVacant!7932 i!1173))))))

(assert (=> b!775069 (= lt!345215 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!775070 () Bool)

(declare-fun res!524084 () Bool)

(assert (=> b!775070 (=> (not res!524084) (not e!431390))))

(assert (=> b!775070 (= res!524084 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20753 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20753 a!3186))))))

(declare-fun b!775071 () Bool)

(declare-fun res!524086 () Bool)

(assert (=> b!775071 (=> res!524086 e!431385)))

(assert (=> b!775071 (= res!524086 e!431391)))

(declare-fun c!85887 () Bool)

(assert (=> b!775071 (= c!85887 lt!345218)))

(assert (= (and start!67118 res!524085) b!775055))

(assert (= (and b!775055 res!524083) b!775052))

(assert (= (and b!775052 res!524091) b!775051))

(assert (= (and b!775051 res!524078) b!775049))

(assert (= (and b!775049 res!524075) b!775069))

(assert (= (and b!775069 res!524076) b!775056))

(assert (= (and b!775056 res!524082) b!775057))

(assert (= (and b!775057 res!524077) b!775070))

(assert (= (and b!775070 res!524084) b!775065))

(assert (= (and b!775065 res!524092) b!775068))

(assert (= (and b!775068 res!524088) b!775061))

(assert (= (and b!775061 c!85888) b!775059))

(assert (= (and b!775061 (not c!85888)) b!775047))

(assert (= (and b!775061 res!524081) b!775064))

(assert (= (and b!775064 res!524080) b!775050))

(assert (= (and b!775050 res!524087) b!775058))

(assert (= (and b!775058 res!524089) b!775063))

(assert (= (and b!775050 (not res!524079)) b!775067))

(assert (= (and b!775067 c!85886) b!775060))

(assert (= (and b!775067 (not c!85886)) b!775054))

(assert (= (and b!775067 (not res!524093)) b!775071))

(assert (= (and b!775071 c!85887) b!775053))

(assert (= (and b!775071 (not c!85887)) b!775048))

(assert (= (and b!775071 (not res!524086)) b!775062))

(assert (= (and b!775062 (not res!524090)) b!775066))

(declare-fun m!719361 () Bool)

(assert (=> start!67118 m!719361))

(declare-fun m!719363 () Bool)

(assert (=> start!67118 m!719363))

(declare-fun m!719365 () Bool)

(assert (=> b!775058 m!719365))

(assert (=> b!775058 m!719365))

(declare-fun m!719367 () Bool)

(assert (=> b!775058 m!719367))

(assert (=> b!775065 m!719365))

(assert (=> b!775065 m!719365))

(declare-fun m!719369 () Bool)

(assert (=> b!775065 m!719369))

(assert (=> b!775065 m!719369))

(assert (=> b!775065 m!719365))

(declare-fun m!719371 () Bool)

(assert (=> b!775065 m!719371))

(assert (=> b!775054 m!719365))

(assert (=> b!775054 m!719365))

(declare-fun m!719373 () Bool)

(assert (=> b!775054 m!719373))

(assert (=> b!775054 m!719365))

(declare-fun m!719375 () Bool)

(assert (=> b!775054 m!719375))

(declare-fun m!719377 () Bool)

(assert (=> b!775050 m!719377))

(declare-fun m!719379 () Bool)

(assert (=> b!775050 m!719379))

(assert (=> b!775053 m!719365))

(assert (=> b!775053 m!719365))

(declare-fun m!719381 () Bool)

(assert (=> b!775053 m!719381))

(assert (=> b!775063 m!719365))

(assert (=> b!775063 m!719365))

(declare-fun m!719383 () Bool)

(assert (=> b!775063 m!719383))

(declare-fun m!719385 () Bool)

(assert (=> b!775068 m!719385))

(declare-fun m!719387 () Bool)

(assert (=> b!775069 m!719387))

(declare-fun m!719389 () Bool)

(assert (=> b!775067 m!719389))

(declare-fun m!719391 () Bool)

(assert (=> b!775056 m!719391))

(assert (=> b!775052 m!719365))

(assert (=> b!775052 m!719365))

(declare-fun m!719393 () Bool)

(assert (=> b!775052 m!719393))

(declare-fun m!719395 () Bool)

(assert (=> b!775066 m!719395))

(declare-fun m!719397 () Bool)

(assert (=> b!775066 m!719397))

(assert (=> b!775060 m!719365))

(assert (=> b!775060 m!719365))

(assert (=> b!775060 m!719381))

(declare-fun m!719399 () Bool)

(assert (=> b!775051 m!719399))

(declare-fun m!719401 () Bool)

(assert (=> b!775049 m!719401))

(declare-fun m!719403 () Bool)

(assert (=> b!775057 m!719403))

(declare-fun m!719405 () Bool)

(assert (=> b!775064 m!719405))

(declare-fun m!719407 () Bool)

(assert (=> b!775064 m!719407))

(assert (=> b!775064 m!719405))

(declare-fun m!719409 () Bool)

(assert (=> b!775064 m!719409))

(declare-fun m!719411 () Bool)

(assert (=> b!775064 m!719411))

(declare-fun m!719413 () Bool)

(assert (=> b!775064 m!719413))

(assert (=> b!775048 m!719365))

(assert (=> b!775048 m!719365))

(assert (=> b!775048 m!719375))

(assert (=> b!775059 m!719365))

(assert (=> b!775059 m!719365))

(declare-fun m!719415 () Bool)

(assert (=> b!775059 m!719415))

(assert (=> b!775047 m!719365))

(assert (=> b!775047 m!719365))

(assert (=> b!775047 m!719373))

(declare-fun m!719417 () Bool)

(assert (=> b!775062 m!719417))

(check-sat (not b!775069) (not b!775063) (not b!775062) (not b!775060) (not b!775056) (not b!775067) (not b!775049) (not b!775051) (not b!775048) (not b!775052) (not b!775047) (not b!775057) (not b!775054) (not b!775066) (not b!775050) (not b!775053) (not b!775058) (not b!775064) (not b!775059) (not b!775065) (not start!67118))
(check-sat)
