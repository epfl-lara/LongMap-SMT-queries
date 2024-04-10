; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65186 () Bool)

(assert start!65186)

(declare-fun b!737476 () Bool)

(declare-fun res!495722 () Bool)

(declare-fun e!412492 () Bool)

(assert (=> b!737476 (=> (not res!495722) (not e!412492))))

(declare-datatypes ((array!41359 0))(
  ( (array!41360 (arr!19793 (Array (_ BitVec 32) (_ BitVec 64))) (size!20214 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41359)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!737476 (= res!495722 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20214 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20214 a!3186))))))

(declare-fun b!737477 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!412497 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7393 0))(
  ( (MissingZero!7393 (index!31940 (_ BitVec 32))) (Found!7393 (index!31941 (_ BitVec 32))) (Intermediate!7393 (undefined!8205 Bool) (index!31942 (_ BitVec 32)) (x!62935 (_ BitVec 32))) (Undefined!7393) (MissingVacant!7393 (index!31943 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41359 (_ BitVec 32)) SeekEntryResult!7393)

(assert (=> b!737477 (= e!412497 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19793 a!3186) j!159) a!3186 mask!3328) (Found!7393 j!159)))))

(declare-fun b!737478 () Bool)

(declare-fun res!495718 () Bool)

(declare-fun e!412494 () Bool)

(assert (=> b!737478 (=> (not res!495718) (not e!412494))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!737478 (= res!495718 (and (= (size!20214 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20214 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20214 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!737479 () Bool)

(declare-datatypes ((Unit!25168 0))(
  ( (Unit!25169) )
))
(declare-fun e!412499 () Unit!25168)

(declare-fun Unit!25170 () Unit!25168)

(assert (=> b!737479 (= e!412499 Unit!25170)))

(declare-fun lt!327215 () SeekEntryResult!7393)

(declare-fun lt!327207 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41359 (_ BitVec 32)) SeekEntryResult!7393)

(assert (=> b!737479 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327207 (select (arr!19793 a!3186) j!159) a!3186 mask!3328) lt!327215)))

(declare-fun b!737481 () Bool)

(declare-fun e!412501 () Bool)

(declare-fun e!412496 () Bool)

(assert (=> b!737481 (= e!412501 e!412496)))

(declare-fun res!495711 () Bool)

(assert (=> b!737481 (=> (not res!495711) (not e!412496))))

(declare-fun lt!327205 () SeekEntryResult!7393)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41359 (_ BitVec 32)) SeekEntryResult!7393)

(assert (=> b!737481 (= res!495711 (= (seekEntryOrOpen!0 (select (arr!19793 a!3186) j!159) a!3186 mask!3328) lt!327205))))

(assert (=> b!737481 (= lt!327205 (Found!7393 j!159))))

(declare-fun b!737482 () Bool)

(declare-fun e!412500 () Bool)

(declare-fun e!412495 () Bool)

(assert (=> b!737482 (= e!412500 e!412495)))

(declare-fun res!495721 () Bool)

(assert (=> b!737482 (=> (not res!495721) (not e!412495))))

(declare-fun lt!327204 () SeekEntryResult!7393)

(declare-fun lt!327209 () SeekEntryResult!7393)

(assert (=> b!737482 (= res!495721 (= lt!327204 lt!327209))))

(declare-fun lt!327206 () array!41359)

(declare-fun lt!327208 () (_ BitVec 64))

(assert (=> b!737482 (= lt!327209 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327208 lt!327206 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737482 (= lt!327204 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327208 mask!3328) lt!327208 lt!327206 mask!3328))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!737482 (= lt!327208 (select (store (arr!19793 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!737482 (= lt!327206 (array!41360 (store (arr!19793 a!3186) i!1173 k!2102) (size!20214 a!3186)))))

(declare-fun b!737483 () Bool)

(declare-fun res!495710 () Bool)

(assert (=> b!737483 (=> (not res!495710) (not e!412500))))

(assert (=> b!737483 (= res!495710 e!412497)))

(declare-fun c!81268 () Bool)

(assert (=> b!737483 (= c!81268 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!737484 () Bool)

(declare-fun res!495706 () Bool)

(assert (=> b!737484 (=> (not res!495706) (not e!412500))))

(assert (=> b!737484 (= res!495706 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19793 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!737485 () Bool)

(declare-fun res!495705 () Bool)

(assert (=> b!737485 (=> (not res!495705) (not e!412492))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41359 (_ BitVec 32)) Bool)

(assert (=> b!737485 (= res!495705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!737486 () Bool)

(declare-fun Unit!25171 () Unit!25168)

(assert (=> b!737486 (= e!412499 Unit!25171)))

(declare-fun lt!327213 () SeekEntryResult!7393)

(assert (=> b!737486 (= lt!327213 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19793 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!327212 () SeekEntryResult!7393)

(assert (=> b!737486 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327207 resIntermediateIndex!5 (select (arr!19793 a!3186) j!159) a!3186 mask!3328) lt!327212)))

(declare-fun e!412491 () Bool)

(declare-fun b!737487 () Bool)

(assert (=> b!737487 (= e!412491 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327207 resIntermediateIndex!5 (select (arr!19793 a!3186) j!159) a!3186 mask!3328) lt!327212)))))

(declare-fun b!737488 () Bool)

(assert (=> b!737488 (= e!412496 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19793 a!3186) j!159) a!3186 mask!3328) lt!327205))))

(declare-fun b!737489 () Bool)

(declare-fun res!495719 () Bool)

(declare-fun e!412502 () Bool)

(assert (=> b!737489 (=> res!495719 e!412502)))

(assert (=> b!737489 (= res!495719 e!412491)))

(declare-fun c!81267 () Bool)

(declare-fun lt!327202 () Bool)

(assert (=> b!737489 (= c!81267 lt!327202)))

(declare-fun b!737490 () Bool)

(declare-fun res!495716 () Bool)

(assert (=> b!737490 (=> (not res!495716) (not e!412494))))

(declare-fun arrayContainsKey!0 (array!41359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!737490 (= res!495716 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!737491 () Bool)

(assert (=> b!737491 (= e!412502 true)))

(declare-fun lt!327210 () SeekEntryResult!7393)

(assert (=> b!737491 (= lt!327210 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327207 lt!327208 lt!327206 mask!3328))))

(declare-fun b!737492 () Bool)

(assert (=> b!737492 (= e!412494 e!412492)))

(declare-fun res!495709 () Bool)

(assert (=> b!737492 (=> (not res!495709) (not e!412492))))

(declare-fun lt!327203 () SeekEntryResult!7393)

(assert (=> b!737492 (= res!495709 (or (= lt!327203 (MissingZero!7393 i!1173)) (= lt!327203 (MissingVacant!7393 i!1173))))))

(assert (=> b!737492 (= lt!327203 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!737480 () Bool)

(assert (=> b!737480 (= e!412491 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327207 (select (arr!19793 a!3186) j!159) a!3186 mask!3328) lt!327215)))))

(declare-fun res!495715 () Bool)

(assert (=> start!65186 (=> (not res!495715) (not e!412494))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65186 (= res!495715 (validMask!0 mask!3328))))

(assert (=> start!65186 e!412494))

(assert (=> start!65186 true))

(declare-fun array_inv!15589 (array!41359) Bool)

(assert (=> start!65186 (array_inv!15589 a!3186)))

(declare-fun b!737493 () Bool)

(declare-fun res!495720 () Bool)

(assert (=> b!737493 (=> (not res!495720) (not e!412494))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!737493 (= res!495720 (validKeyInArray!0 k!2102))))

(declare-fun b!737494 () Bool)

(assert (=> b!737494 (= e!412497 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19793 a!3186) j!159) a!3186 mask!3328) lt!327215))))

(declare-fun b!737495 () Bool)

(declare-fun e!412498 () Bool)

(assert (=> b!737495 (= e!412495 (not e!412498))))

(declare-fun res!495717 () Bool)

(assert (=> b!737495 (=> res!495717 e!412498)))

(assert (=> b!737495 (= res!495717 (or (not (is-Intermediate!7393 lt!327209)) (bvsge x!1131 (x!62935 lt!327209))))))

(assert (=> b!737495 (= lt!327212 (Found!7393 j!159))))

(assert (=> b!737495 e!412501))

(declare-fun res!495714 () Bool)

(assert (=> b!737495 (=> (not res!495714) (not e!412501))))

(assert (=> b!737495 (= res!495714 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!327211 () Unit!25168)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41359 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25168)

(assert (=> b!737495 (= lt!327211 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!737496 () Bool)

(assert (=> b!737496 (= e!412492 e!412500)))

(declare-fun res!495707 () Bool)

(assert (=> b!737496 (=> (not res!495707) (not e!412500))))

(assert (=> b!737496 (= res!495707 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19793 a!3186) j!159) mask!3328) (select (arr!19793 a!3186) j!159) a!3186 mask!3328) lt!327215))))

(assert (=> b!737496 (= lt!327215 (Intermediate!7393 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!737497 () Bool)

(declare-fun res!495708 () Bool)

(assert (=> b!737497 (=> (not res!495708) (not e!412494))))

(assert (=> b!737497 (= res!495708 (validKeyInArray!0 (select (arr!19793 a!3186) j!159)))))

(declare-fun b!737498 () Bool)

(assert (=> b!737498 (= e!412498 e!412502)))

(declare-fun res!495713 () Bool)

(assert (=> b!737498 (=> res!495713 e!412502)))

(assert (=> b!737498 (= res!495713 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327207 #b00000000000000000000000000000000) (bvsge lt!327207 (size!20214 a!3186))))))

(declare-fun lt!327214 () Unit!25168)

(assert (=> b!737498 (= lt!327214 e!412499)))

(declare-fun c!81266 () Bool)

(assert (=> b!737498 (= c!81266 lt!327202)))

(assert (=> b!737498 (= lt!327202 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737498 (= lt!327207 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!737499 () Bool)

(declare-fun res!495712 () Bool)

(assert (=> b!737499 (=> (not res!495712) (not e!412492))))

(declare-datatypes ((List!13795 0))(
  ( (Nil!13792) (Cons!13791 (h!14863 (_ BitVec 64)) (t!20110 List!13795)) )
))
(declare-fun arrayNoDuplicates!0 (array!41359 (_ BitVec 32) List!13795) Bool)

(assert (=> b!737499 (= res!495712 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13792))))

(assert (= (and start!65186 res!495715) b!737478))

(assert (= (and b!737478 res!495718) b!737497))

(assert (= (and b!737497 res!495708) b!737493))

(assert (= (and b!737493 res!495720) b!737490))

(assert (= (and b!737490 res!495716) b!737492))

(assert (= (and b!737492 res!495709) b!737485))

(assert (= (and b!737485 res!495705) b!737499))

(assert (= (and b!737499 res!495712) b!737476))

(assert (= (and b!737476 res!495722) b!737496))

(assert (= (and b!737496 res!495707) b!737484))

(assert (= (and b!737484 res!495706) b!737483))

(assert (= (and b!737483 c!81268) b!737494))

(assert (= (and b!737483 (not c!81268)) b!737477))

(assert (= (and b!737483 res!495710) b!737482))

(assert (= (and b!737482 res!495721) b!737495))

(assert (= (and b!737495 res!495714) b!737481))

(assert (= (and b!737481 res!495711) b!737488))

(assert (= (and b!737495 (not res!495717)) b!737498))

(assert (= (and b!737498 c!81266) b!737479))

(assert (= (and b!737498 (not c!81266)) b!737486))

(assert (= (and b!737498 (not res!495713)) b!737489))

(assert (= (and b!737489 c!81267) b!737480))

(assert (= (and b!737489 (not c!81267)) b!737487))

(assert (= (and b!737489 (not res!495719)) b!737491))

(declare-fun m!689347 () Bool)

(assert (=> b!737479 m!689347))

(assert (=> b!737479 m!689347))

(declare-fun m!689349 () Bool)

(assert (=> b!737479 m!689349))

(declare-fun m!689351 () Bool)

(assert (=> b!737484 m!689351))

(assert (=> b!737480 m!689347))

(assert (=> b!737480 m!689347))

(assert (=> b!737480 m!689349))

(assert (=> b!737481 m!689347))

(assert (=> b!737481 m!689347))

(declare-fun m!689353 () Bool)

(assert (=> b!737481 m!689353))

(assert (=> b!737477 m!689347))

(assert (=> b!737477 m!689347))

(declare-fun m!689355 () Bool)

(assert (=> b!737477 m!689355))

(declare-fun m!689357 () Bool)

(assert (=> b!737498 m!689357))

(declare-fun m!689359 () Bool)

(assert (=> b!737485 m!689359))

(declare-fun m!689361 () Bool)

(assert (=> b!737493 m!689361))

(assert (=> b!737487 m!689347))

(assert (=> b!737487 m!689347))

(declare-fun m!689363 () Bool)

(assert (=> b!737487 m!689363))

(declare-fun m!689365 () Bool)

(assert (=> b!737491 m!689365))

(assert (=> b!737497 m!689347))

(assert (=> b!737497 m!689347))

(declare-fun m!689367 () Bool)

(assert (=> b!737497 m!689367))

(declare-fun m!689369 () Bool)

(assert (=> b!737492 m!689369))

(assert (=> b!737486 m!689347))

(assert (=> b!737486 m!689347))

(assert (=> b!737486 m!689355))

(assert (=> b!737486 m!689347))

(assert (=> b!737486 m!689363))

(declare-fun m!689371 () Bool)

(assert (=> b!737482 m!689371))

(declare-fun m!689373 () Bool)

(assert (=> b!737482 m!689373))

(declare-fun m!689375 () Bool)

(assert (=> b!737482 m!689375))

(assert (=> b!737482 m!689375))

(declare-fun m!689377 () Bool)

(assert (=> b!737482 m!689377))

(declare-fun m!689379 () Bool)

(assert (=> b!737482 m!689379))

(assert (=> b!737496 m!689347))

(assert (=> b!737496 m!689347))

(declare-fun m!689381 () Bool)

(assert (=> b!737496 m!689381))

(assert (=> b!737496 m!689381))

(assert (=> b!737496 m!689347))

(declare-fun m!689383 () Bool)

(assert (=> b!737496 m!689383))

(declare-fun m!689385 () Bool)

(assert (=> b!737490 m!689385))

(declare-fun m!689387 () Bool)

(assert (=> b!737495 m!689387))

(declare-fun m!689389 () Bool)

(assert (=> b!737495 m!689389))

(assert (=> b!737488 m!689347))

(assert (=> b!737488 m!689347))

(declare-fun m!689391 () Bool)

(assert (=> b!737488 m!689391))

(declare-fun m!689393 () Bool)

(assert (=> b!737499 m!689393))

(declare-fun m!689395 () Bool)

(assert (=> start!65186 m!689395))

(declare-fun m!689397 () Bool)

(assert (=> start!65186 m!689397))

(assert (=> b!737494 m!689347))

(assert (=> b!737494 m!689347))

(declare-fun m!689399 () Bool)

(assert (=> b!737494 m!689399))

(push 1)

