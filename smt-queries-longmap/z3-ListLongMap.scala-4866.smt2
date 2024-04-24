; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67228 () Bool)

(assert start!67228)

(declare-fun b!775392 () Bool)

(declare-fun res!524120 () Bool)

(declare-fun e!431665 () Bool)

(assert (=> b!775392 (=> (not res!524120) (not e!431665))))

(declare-datatypes ((array!42463 0))(
  ( (array!42464 (arr!20323 (Array (_ BitVec 32) (_ BitVec 64))) (size!20743 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42463)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42463 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!775392 (= res!524120 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!775393 () Bool)

(declare-fun e!431657 () Bool)

(declare-fun e!431661 () Bool)

(assert (=> b!775393 (= e!431657 (not e!431661))))

(declare-fun res!524124 () Bool)

(assert (=> b!775393 (=> res!524124 e!431661)))

(declare-datatypes ((SeekEntryResult!7879 0))(
  ( (MissingZero!7879 (index!33884 (_ BitVec 32))) (Found!7879 (index!33885 (_ BitVec 32))) (Intermediate!7879 (undefined!8691 Bool) (index!33886 (_ BitVec 32)) (x!64993 (_ BitVec 32))) (Undefined!7879) (MissingVacant!7879 (index!33887 (_ BitVec 32))) )
))
(declare-fun lt!345330 () SeekEntryResult!7879)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!775393 (= res!524124 (or (not ((_ is Intermediate!7879) lt!345330)) (bvsge x!1131 (x!64993 lt!345330))))))

(declare-fun lt!345321 () SeekEntryResult!7879)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!775393 (= lt!345321 (Found!7879 j!159))))

(declare-fun e!431668 () Bool)

(assert (=> b!775393 e!431668))

(declare-fun res!524132 () Bool)

(assert (=> b!775393 (=> (not res!524132) (not e!431668))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42463 (_ BitVec 32)) Bool)

(assert (=> b!775393 (= res!524132 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26707 0))(
  ( (Unit!26708) )
))
(declare-fun lt!345325 () Unit!26707)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42463 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26707)

(assert (=> b!775393 (= lt!345325 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!775394 () Bool)

(declare-fun e!431663 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42463 (_ BitVec 32)) SeekEntryResult!7879)

(assert (=> b!775394 (= e!431663 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20323 a!3186) j!159) a!3186 mask!3328) (Found!7879 j!159)))))

(declare-fun b!775395 () Bool)

(declare-fun e!431660 () Bool)

(assert (=> b!775395 (= e!431660 e!431657)))

(declare-fun res!524130 () Bool)

(assert (=> b!775395 (=> (not res!524130) (not e!431657))))

(declare-fun lt!345323 () SeekEntryResult!7879)

(assert (=> b!775395 (= res!524130 (= lt!345323 lt!345330))))

(declare-fun lt!345331 () (_ BitVec 64))

(declare-fun lt!345322 () array!42463)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42463 (_ BitVec 32)) SeekEntryResult!7879)

(assert (=> b!775395 (= lt!345330 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345331 lt!345322 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775395 (= lt!345323 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345331 mask!3328) lt!345331 lt!345322 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!775395 (= lt!345331 (select (store (arr!20323 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!775395 (= lt!345322 (array!42464 (store (arr!20323 a!3186) i!1173 k0!2102) (size!20743 a!3186)))))

(declare-fun b!775396 () Bool)

(declare-fun res!524122 () Bool)

(declare-fun e!431659 () Bool)

(assert (=> b!775396 (=> (not res!524122) (not e!431659))))

(declare-datatypes ((List!14232 0))(
  ( (Nil!14229) (Cons!14228 (h!15342 (_ BitVec 64)) (t!20539 List!14232)) )
))
(declare-fun arrayNoDuplicates!0 (array!42463 (_ BitVec 32) List!14232) Bool)

(assert (=> b!775396 (= res!524122 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14229))))

(declare-fun b!775397 () Bool)

(declare-fun e!431664 () Bool)

(assert (=> b!775397 (= e!431668 e!431664)))

(declare-fun res!524126 () Bool)

(assert (=> b!775397 (=> (not res!524126) (not e!431664))))

(declare-fun lt!345324 () SeekEntryResult!7879)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42463 (_ BitVec 32)) SeekEntryResult!7879)

(assert (=> b!775397 (= res!524126 (= (seekEntryOrOpen!0 (select (arr!20323 a!3186) j!159) a!3186 mask!3328) lt!345324))))

(assert (=> b!775397 (= lt!345324 (Found!7879 j!159))))

(declare-fun b!775398 () Bool)

(declare-fun res!524133 () Bool)

(declare-fun e!431662 () Bool)

(assert (=> b!775398 (=> res!524133 e!431662)))

(declare-fun e!431666 () Bool)

(assert (=> b!775398 (= res!524133 e!431666)))

(declare-fun c!86040 () Bool)

(declare-fun lt!345327 () Bool)

(assert (=> b!775398 (= c!86040 lt!345327)))

(declare-fun b!775399 () Bool)

(declare-fun e!431658 () Unit!26707)

(declare-fun Unit!26709 () Unit!26707)

(assert (=> b!775399 (= e!431658 Unit!26709)))

(declare-fun lt!345326 () (_ BitVec 32))

(declare-fun lt!345319 () SeekEntryResult!7879)

(assert (=> b!775399 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345326 (select (arr!20323 a!3186) j!159) a!3186 mask!3328) lt!345319)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!775400 () Bool)

(assert (=> b!775400 (= e!431664 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20323 a!3186) j!159) a!3186 mask!3328) lt!345324))))

(declare-fun b!775401 () Bool)

(assert (=> b!775401 (= e!431659 e!431660)))

(declare-fun res!524127 () Bool)

(assert (=> b!775401 (=> (not res!524127) (not e!431660))))

(assert (=> b!775401 (= res!524127 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20323 a!3186) j!159) mask!3328) (select (arr!20323 a!3186) j!159) a!3186 mask!3328) lt!345319))))

(assert (=> b!775401 (= lt!345319 (Intermediate!7879 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!775402 () Bool)

(declare-fun res!524131 () Bool)

(assert (=> b!775402 (=> (not res!524131) (not e!431660))))

(assert (=> b!775402 (= res!524131 e!431663)))

(declare-fun c!86041 () Bool)

(assert (=> b!775402 (= c!86041 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!775403 () Bool)

(declare-fun res!524123 () Bool)

(assert (=> b!775403 (=> (not res!524123) (not e!431659))))

(assert (=> b!775403 (= res!524123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!524121 () Bool)

(assert (=> start!67228 (=> (not res!524121) (not e!431665))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67228 (= res!524121 (validMask!0 mask!3328))))

(assert (=> start!67228 e!431665))

(assert (=> start!67228 true))

(declare-fun array_inv!16182 (array!42463) Bool)

(assert (=> start!67228 (array_inv!16182 a!3186)))

(declare-fun b!775404 () Bool)

(declare-fun res!524129 () Bool)

(assert (=> b!775404 (=> (not res!524129) (not e!431665))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!775404 (= res!524129 (validKeyInArray!0 k0!2102))))

(declare-fun b!775405 () Bool)

(declare-fun res!524119 () Bool)

(assert (=> b!775405 (=> (not res!524119) (not e!431665))))

(assert (=> b!775405 (= res!524119 (validKeyInArray!0 (select (arr!20323 a!3186) j!159)))))

(declare-fun b!775406 () Bool)

(declare-fun res!524134 () Bool)

(assert (=> b!775406 (=> res!524134 e!431662)))

(assert (=> b!775406 (= res!524134 (not (= lt!345323 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345326 lt!345331 lt!345322 mask!3328))))))

(declare-fun b!775407 () Bool)

(assert (=> b!775407 (= e!431661 e!431662)))

(declare-fun res!524118 () Bool)

(assert (=> b!775407 (=> res!524118 e!431662)))

(assert (=> b!775407 (= res!524118 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!345326 #b00000000000000000000000000000000) (bvsge lt!345326 (size!20743 a!3186))))))

(declare-fun lt!345320 () Unit!26707)

(assert (=> b!775407 (= lt!345320 e!431658)))

(declare-fun c!86042 () Bool)

(assert (=> b!775407 (= c!86042 lt!345327)))

(assert (=> b!775407 (= lt!345327 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775407 (= lt!345326 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!775408 () Bool)

(declare-fun res!524128 () Bool)

(assert (=> b!775408 (=> (not res!524128) (not e!431665))))

(assert (=> b!775408 (= res!524128 (and (= (size!20743 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20743 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20743 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!775409 () Bool)

(assert (=> b!775409 (= e!431662 true)))

(assert (=> b!775409 (= (seekEntryOrOpen!0 lt!345331 lt!345322 mask!3328) lt!345321)))

(declare-fun lt!345328 () Unit!26707)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!42463 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26707)

(assert (=> b!775409 (= lt!345328 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k0!2102 j!159 lt!345326 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!775410 () Bool)

(declare-fun res!524136 () Bool)

(assert (=> b!775410 (=> (not res!524136) (not e!431659))))

(assert (=> b!775410 (= res!524136 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20743 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20743 a!3186))))))

(declare-fun b!775411 () Bool)

(assert (=> b!775411 (= e!431666 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345326 resIntermediateIndex!5 (select (arr!20323 a!3186) j!159) a!3186 mask!3328) lt!345321)))))

(declare-fun b!775412 () Bool)

(declare-fun Unit!26710 () Unit!26707)

(assert (=> b!775412 (= e!431658 Unit!26710)))

(declare-fun lt!345329 () SeekEntryResult!7879)

(assert (=> b!775412 (= lt!345329 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20323 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!775412 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345326 resIntermediateIndex!5 (select (arr!20323 a!3186) j!159) a!3186 mask!3328) lt!345321)))

(declare-fun b!775413 () Bool)

(assert (=> b!775413 (= e!431666 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345326 (select (arr!20323 a!3186) j!159) a!3186 mask!3328) lt!345319)))))

(declare-fun b!775414 () Bool)

(declare-fun res!524125 () Bool)

(assert (=> b!775414 (=> (not res!524125) (not e!431660))))

(assert (=> b!775414 (= res!524125 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20323 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!775415 () Bool)

(assert (=> b!775415 (= e!431665 e!431659)))

(declare-fun res!524135 () Bool)

(assert (=> b!775415 (=> (not res!524135) (not e!431659))))

(declare-fun lt!345318 () SeekEntryResult!7879)

(assert (=> b!775415 (= res!524135 (or (= lt!345318 (MissingZero!7879 i!1173)) (= lt!345318 (MissingVacant!7879 i!1173))))))

(assert (=> b!775415 (= lt!345318 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!775416 () Bool)

(assert (=> b!775416 (= e!431663 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20323 a!3186) j!159) a!3186 mask!3328) lt!345319))))

(assert (= (and start!67228 res!524121) b!775408))

(assert (= (and b!775408 res!524128) b!775405))

(assert (= (and b!775405 res!524119) b!775404))

(assert (= (and b!775404 res!524129) b!775392))

(assert (= (and b!775392 res!524120) b!775415))

(assert (= (and b!775415 res!524135) b!775403))

(assert (= (and b!775403 res!524123) b!775396))

(assert (= (and b!775396 res!524122) b!775410))

(assert (= (and b!775410 res!524136) b!775401))

(assert (= (and b!775401 res!524127) b!775414))

(assert (= (and b!775414 res!524125) b!775402))

(assert (= (and b!775402 c!86041) b!775416))

(assert (= (and b!775402 (not c!86041)) b!775394))

(assert (= (and b!775402 res!524131) b!775395))

(assert (= (and b!775395 res!524130) b!775393))

(assert (= (and b!775393 res!524132) b!775397))

(assert (= (and b!775397 res!524126) b!775400))

(assert (= (and b!775393 (not res!524124)) b!775407))

(assert (= (and b!775407 c!86042) b!775399))

(assert (= (and b!775407 (not c!86042)) b!775412))

(assert (= (and b!775407 (not res!524118)) b!775398))

(assert (= (and b!775398 c!86040) b!775413))

(assert (= (and b!775398 (not c!86040)) b!775411))

(assert (= (and b!775398 (not res!524133)) b!775406))

(assert (= (and b!775406 (not res!524134)) b!775409))

(declare-fun m!720191 () Bool)

(assert (=> b!775392 m!720191))

(declare-fun m!720193 () Bool)

(assert (=> b!775399 m!720193))

(assert (=> b!775399 m!720193))

(declare-fun m!720195 () Bool)

(assert (=> b!775399 m!720195))

(declare-fun m!720197 () Bool)

(assert (=> b!775403 m!720197))

(declare-fun m!720199 () Bool)

(assert (=> b!775409 m!720199))

(declare-fun m!720201 () Bool)

(assert (=> b!775409 m!720201))

(declare-fun m!720203 () Bool)

(assert (=> b!775406 m!720203))

(declare-fun m!720205 () Bool)

(assert (=> start!67228 m!720205))

(declare-fun m!720207 () Bool)

(assert (=> start!67228 m!720207))

(assert (=> b!775405 m!720193))

(assert (=> b!775405 m!720193))

(declare-fun m!720209 () Bool)

(assert (=> b!775405 m!720209))

(assert (=> b!775416 m!720193))

(assert (=> b!775416 m!720193))

(declare-fun m!720211 () Bool)

(assert (=> b!775416 m!720211))

(assert (=> b!775411 m!720193))

(assert (=> b!775411 m!720193))

(declare-fun m!720213 () Bool)

(assert (=> b!775411 m!720213))

(assert (=> b!775394 m!720193))

(assert (=> b!775394 m!720193))

(declare-fun m!720215 () Bool)

(assert (=> b!775394 m!720215))

(assert (=> b!775397 m!720193))

(assert (=> b!775397 m!720193))

(declare-fun m!720217 () Bool)

(assert (=> b!775397 m!720217))

(declare-fun m!720219 () Bool)

(assert (=> b!775404 m!720219))

(declare-fun m!720221 () Bool)

(assert (=> b!775407 m!720221))

(declare-fun m!720223 () Bool)

(assert (=> b!775393 m!720223))

(declare-fun m!720225 () Bool)

(assert (=> b!775393 m!720225))

(declare-fun m!720227 () Bool)

(assert (=> b!775395 m!720227))

(declare-fun m!720229 () Bool)

(assert (=> b!775395 m!720229))

(assert (=> b!775395 m!720229))

(declare-fun m!720231 () Bool)

(assert (=> b!775395 m!720231))

(declare-fun m!720233 () Bool)

(assert (=> b!775395 m!720233))

(declare-fun m!720235 () Bool)

(assert (=> b!775395 m!720235))

(assert (=> b!775413 m!720193))

(assert (=> b!775413 m!720193))

(assert (=> b!775413 m!720195))

(declare-fun m!720237 () Bool)

(assert (=> b!775415 m!720237))

(declare-fun m!720239 () Bool)

(assert (=> b!775414 m!720239))

(assert (=> b!775412 m!720193))

(assert (=> b!775412 m!720193))

(assert (=> b!775412 m!720215))

(assert (=> b!775412 m!720193))

(assert (=> b!775412 m!720213))

(declare-fun m!720241 () Bool)

(assert (=> b!775396 m!720241))

(assert (=> b!775400 m!720193))

(assert (=> b!775400 m!720193))

(declare-fun m!720243 () Bool)

(assert (=> b!775400 m!720243))

(assert (=> b!775401 m!720193))

(assert (=> b!775401 m!720193))

(declare-fun m!720245 () Bool)

(assert (=> b!775401 m!720245))

(assert (=> b!775401 m!720245))

(assert (=> b!775401 m!720193))

(declare-fun m!720247 () Bool)

(assert (=> b!775401 m!720247))

(check-sat (not b!775405) (not b!775393) (not b!775401) (not b!775407) (not b!775411) (not b!775413) (not b!775404) (not b!775416) (not b!775392) (not b!775397) (not b!775400) (not b!775406) (not b!775403) (not b!775409) (not b!775394) (not b!775399) (not b!775415) (not start!67228) (not b!775395) (not b!775412) (not b!775396))
(check-sat)
