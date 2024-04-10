; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65782 () Bool)

(assert start!65782)

(declare-fun b!756393 () Bool)

(declare-fun res!511403 () Bool)

(declare-fun e!421779 () Bool)

(assert (=> b!756393 (=> (not res!511403) (not e!421779))))

(declare-datatypes ((array!41955 0))(
  ( (array!41956 (arr!20091 (Array (_ BitVec 32) (_ BitVec 64))) (size!20512 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41955)

(declare-datatypes ((List!14093 0))(
  ( (Nil!14090) (Cons!14089 (h!15161 (_ BitVec 64)) (t!20408 List!14093)) )
))
(declare-fun arrayNoDuplicates!0 (array!41955 (_ BitVec 32) List!14093) Bool)

(assert (=> b!756393 (= res!511403 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14090))))

(declare-fun b!756394 () Bool)

(declare-fun res!511417 () Bool)

(declare-fun e!421781 () Bool)

(assert (=> b!756394 (=> (not res!511417) (not e!421781))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!756394 (= res!511417 (validKeyInArray!0 (select (arr!20091 a!3186) j!159)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!421778 () Bool)

(declare-fun b!756395 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7691 0))(
  ( (MissingZero!7691 (index!33132 (_ BitVec 32))) (Found!7691 (index!33133 (_ BitVec 32))) (Intermediate!7691 (undefined!8503 Bool) (index!33134 (_ BitVec 32)) (x!64033 (_ BitVec 32))) (Undefined!7691) (MissingVacant!7691 (index!33135 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41955 (_ BitVec 32)) SeekEntryResult!7691)

(assert (=> b!756395 (= e!421778 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20091 a!3186) j!159) a!3186 mask!3328) (Found!7691 j!159)))))

(declare-fun b!756396 () Bool)

(declare-datatypes ((Unit!26144 0))(
  ( (Unit!26145) )
))
(declare-fun e!421771 () Unit!26144)

(declare-fun Unit!26146 () Unit!26144)

(assert (=> b!756396 (= e!421771 Unit!26146)))

(declare-fun b!756397 () Bool)

(declare-fun res!511412 () Bool)

(declare-fun e!421777 () Bool)

(assert (=> b!756397 (=> (not res!511412) (not e!421777))))

(declare-fun lt!336766 () array!41955)

(declare-fun lt!336768 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41955 (_ BitVec 32)) SeekEntryResult!7691)

(assert (=> b!756397 (= res!511412 (= (seekEntryOrOpen!0 lt!336768 lt!336766 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336768 lt!336766 mask!3328)))))

(declare-fun b!756398 () Bool)

(declare-fun res!511404 () Bool)

(assert (=> b!756398 (=> (not res!511404) (not e!421779))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41955 (_ BitVec 32)) Bool)

(assert (=> b!756398 (= res!511404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!756399 () Bool)

(declare-fun e!421773 () Bool)

(declare-fun e!421775 () Bool)

(assert (=> b!756399 (= e!421773 e!421775)))

(declare-fun res!511410 () Bool)

(assert (=> b!756399 (=> (not res!511410) (not e!421775))))

(declare-fun lt!336771 () SeekEntryResult!7691)

(declare-fun lt!336762 () SeekEntryResult!7691)

(assert (=> b!756399 (= res!511410 (= lt!336771 lt!336762))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41955 (_ BitVec 32)) SeekEntryResult!7691)

(assert (=> b!756399 (= lt!336762 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336768 lt!336766 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!756399 (= lt!336771 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336768 mask!3328) lt!336768 lt!336766 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!756399 (= lt!336768 (select (store (arr!20091 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!756399 (= lt!336766 (array!41956 (store (arr!20091 a!3186) i!1173 k!2102) (size!20512 a!3186)))))

(declare-fun b!756392 () Bool)

(declare-fun res!511416 () Bool)

(assert (=> b!756392 (=> (not res!511416) (not e!421779))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!756392 (= res!511416 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20512 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20512 a!3186))))))

(declare-fun res!511405 () Bool)

(assert (=> start!65782 (=> (not res!511405) (not e!421781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65782 (= res!511405 (validMask!0 mask!3328))))

(assert (=> start!65782 e!421781))

(assert (=> start!65782 true))

(declare-fun array_inv!15887 (array!41955) Bool)

(assert (=> start!65782 (array_inv!15887 a!3186)))

(declare-fun b!756400 () Bool)

(declare-fun e!421776 () Bool)

(assert (=> b!756400 (= e!421776 true)))

(assert (=> b!756400 e!421777))

(declare-fun res!511419 () Bool)

(assert (=> b!756400 (=> (not res!511419) (not e!421777))))

(declare-fun lt!336764 () (_ BitVec 64))

(assert (=> b!756400 (= res!511419 (= lt!336764 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336773 () Unit!26144)

(assert (=> b!756400 (= lt!336773 e!421771)))

(declare-fun c!82876 () Bool)

(assert (=> b!756400 (= c!82876 (= lt!336764 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!756401 () Bool)

(declare-fun res!511409 () Bool)

(assert (=> b!756401 (=> (not res!511409) (not e!421773))))

(assert (=> b!756401 (= res!511409 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20091 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!756402 () Bool)

(declare-fun res!511415 () Bool)

(assert (=> b!756402 (=> (not res!511415) (not e!421773))))

(assert (=> b!756402 (= res!511415 e!421778)))

(declare-fun c!82875 () Bool)

(assert (=> b!756402 (= c!82875 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!756403 () Bool)

(declare-fun res!511411 () Bool)

(assert (=> b!756403 (=> (not res!511411) (not e!421781))))

(declare-fun arrayContainsKey!0 (array!41955 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!756403 (= res!511411 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!756404 () Bool)

(assert (=> b!756404 (= e!421779 e!421773)))

(declare-fun res!511407 () Bool)

(assert (=> b!756404 (=> (not res!511407) (not e!421773))))

(declare-fun lt!336765 () SeekEntryResult!7691)

(assert (=> b!756404 (= res!511407 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20091 a!3186) j!159) mask!3328) (select (arr!20091 a!3186) j!159) a!3186 mask!3328) lt!336765))))

(assert (=> b!756404 (= lt!336765 (Intermediate!7691 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!756405 () Bool)

(declare-fun e!421770 () Bool)

(assert (=> b!756405 (= e!421775 (not e!421770))))

(declare-fun res!511420 () Bool)

(assert (=> b!756405 (=> res!511420 e!421770)))

(assert (=> b!756405 (= res!511420 (or (not (is-Intermediate!7691 lt!336762)) (bvslt x!1131 (x!64033 lt!336762)) (not (= x!1131 (x!64033 lt!336762))) (not (= index!1321 (index!33134 lt!336762)))))))

(declare-fun e!421780 () Bool)

(assert (=> b!756405 e!421780))

(declare-fun res!511414 () Bool)

(assert (=> b!756405 (=> (not res!511414) (not e!421780))))

(declare-fun lt!336772 () SeekEntryResult!7691)

(declare-fun lt!336767 () SeekEntryResult!7691)

(assert (=> b!756405 (= res!511414 (= lt!336772 lt!336767))))

(assert (=> b!756405 (= lt!336767 (Found!7691 j!159))))

(assert (=> b!756405 (= lt!336772 (seekEntryOrOpen!0 (select (arr!20091 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!756405 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!336769 () Unit!26144)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41955 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26144)

(assert (=> b!756405 (= lt!336769 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!756406 () Bool)

(declare-fun e!421772 () Bool)

(assert (=> b!756406 (= e!421772 e!421776)))

(declare-fun res!511406 () Bool)

(assert (=> b!756406 (=> res!511406 e!421776)))

(assert (=> b!756406 (= res!511406 (= lt!336764 lt!336768))))

(assert (=> b!756406 (= lt!336764 (select (store (arr!20091 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!756407 () Bool)

(assert (=> b!756407 (= e!421778 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20091 a!3186) j!159) a!3186 mask!3328) lt!336765))))

(declare-fun b!756408 () Bool)

(assert (=> b!756408 (= e!421781 e!421779)))

(declare-fun res!511418 () Bool)

(assert (=> b!756408 (=> (not res!511418) (not e!421779))))

(declare-fun lt!336763 () SeekEntryResult!7691)

(assert (=> b!756408 (= res!511418 (or (= lt!336763 (MissingZero!7691 i!1173)) (= lt!336763 (MissingVacant!7691 i!1173))))))

(assert (=> b!756408 (= lt!336763 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!756409 () Bool)

(assert (=> b!756409 (= e!421770 e!421772)))

(declare-fun res!511413 () Bool)

(assert (=> b!756409 (=> res!511413 e!421772)))

(declare-fun lt!336770 () SeekEntryResult!7691)

(assert (=> b!756409 (= res!511413 (not (= lt!336770 lt!336767)))))

(assert (=> b!756409 (= lt!336770 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20091 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!756410 () Bool)

(assert (=> b!756410 (= e!421780 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20091 a!3186) j!159) a!3186 mask!3328) lt!336767))))

(declare-fun b!756411 () Bool)

(declare-fun Unit!26147 () Unit!26144)

(assert (=> b!756411 (= e!421771 Unit!26147)))

(assert (=> b!756411 false))

(declare-fun b!756412 () Bool)

(declare-fun res!511421 () Bool)

(assert (=> b!756412 (=> (not res!511421) (not e!421781))))

(assert (=> b!756412 (= res!511421 (and (= (size!20512 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20512 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20512 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!756413 () Bool)

(declare-fun res!511408 () Bool)

(assert (=> b!756413 (=> (not res!511408) (not e!421781))))

(assert (=> b!756413 (= res!511408 (validKeyInArray!0 k!2102))))

(declare-fun b!756414 () Bool)

(assert (=> b!756414 (= e!421777 (= lt!336772 lt!336770))))

(assert (= (and start!65782 res!511405) b!756412))

(assert (= (and b!756412 res!511421) b!756394))

(assert (= (and b!756394 res!511417) b!756413))

(assert (= (and b!756413 res!511408) b!756403))

(assert (= (and b!756403 res!511411) b!756408))

(assert (= (and b!756408 res!511418) b!756398))

(assert (= (and b!756398 res!511404) b!756393))

(assert (= (and b!756393 res!511403) b!756392))

(assert (= (and b!756392 res!511416) b!756404))

(assert (= (and b!756404 res!511407) b!756401))

(assert (= (and b!756401 res!511409) b!756402))

(assert (= (and b!756402 c!82875) b!756407))

(assert (= (and b!756402 (not c!82875)) b!756395))

(assert (= (and b!756402 res!511415) b!756399))

(assert (= (and b!756399 res!511410) b!756405))

(assert (= (and b!756405 res!511414) b!756410))

(assert (= (and b!756405 (not res!511420)) b!756409))

(assert (= (and b!756409 (not res!511413)) b!756406))

(assert (= (and b!756406 (not res!511406)) b!756400))

(assert (= (and b!756400 c!82876) b!756411))

(assert (= (and b!756400 (not c!82876)) b!756396))

(assert (= (and b!756400 res!511419) b!756397))

(assert (= (and b!756397 res!511412) b!756414))

(declare-fun m!704359 () Bool)

(assert (=> b!756405 m!704359))

(assert (=> b!756405 m!704359))

(declare-fun m!704361 () Bool)

(assert (=> b!756405 m!704361))

(declare-fun m!704363 () Bool)

(assert (=> b!756405 m!704363))

(declare-fun m!704365 () Bool)

(assert (=> b!756405 m!704365))

(declare-fun m!704367 () Bool)

(assert (=> b!756399 m!704367))

(declare-fun m!704369 () Bool)

(assert (=> b!756399 m!704369))

(declare-fun m!704371 () Bool)

(assert (=> b!756399 m!704371))

(declare-fun m!704373 () Bool)

(assert (=> b!756399 m!704373))

(assert (=> b!756399 m!704373))

(declare-fun m!704375 () Bool)

(assert (=> b!756399 m!704375))

(assert (=> b!756394 m!704359))

(assert (=> b!756394 m!704359))

(declare-fun m!704377 () Bool)

(assert (=> b!756394 m!704377))

(declare-fun m!704379 () Bool)

(assert (=> b!756413 m!704379))

(declare-fun m!704381 () Bool)

(assert (=> b!756397 m!704381))

(declare-fun m!704383 () Bool)

(assert (=> b!756397 m!704383))

(assert (=> b!756410 m!704359))

(assert (=> b!756410 m!704359))

(declare-fun m!704385 () Bool)

(assert (=> b!756410 m!704385))

(declare-fun m!704387 () Bool)

(assert (=> b!756408 m!704387))

(declare-fun m!704389 () Bool)

(assert (=> b!756401 m!704389))

(assert (=> b!756404 m!704359))

(assert (=> b!756404 m!704359))

(declare-fun m!704391 () Bool)

(assert (=> b!756404 m!704391))

(assert (=> b!756404 m!704391))

(assert (=> b!756404 m!704359))

(declare-fun m!704393 () Bool)

(assert (=> b!756404 m!704393))

(assert (=> b!756406 m!704369))

(declare-fun m!704395 () Bool)

(assert (=> b!756406 m!704395))

(assert (=> b!756407 m!704359))

(assert (=> b!756407 m!704359))

(declare-fun m!704397 () Bool)

(assert (=> b!756407 m!704397))

(declare-fun m!704399 () Bool)

(assert (=> b!756398 m!704399))

(assert (=> b!756409 m!704359))

(assert (=> b!756409 m!704359))

(declare-fun m!704401 () Bool)

(assert (=> b!756409 m!704401))

(assert (=> b!756395 m!704359))

(assert (=> b!756395 m!704359))

(assert (=> b!756395 m!704401))

(declare-fun m!704403 () Bool)

(assert (=> b!756393 m!704403))

(declare-fun m!704405 () Bool)

(assert (=> start!65782 m!704405))

(declare-fun m!704407 () Bool)

(assert (=> start!65782 m!704407))

(declare-fun m!704409 () Bool)

(assert (=> b!756403 m!704409))

(push 1)

