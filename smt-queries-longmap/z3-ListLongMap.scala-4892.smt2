; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67442 () Bool)

(assert start!67442)

(declare-fun res!528049 () Bool)

(declare-fun e!434052 () Bool)

(assert (=> start!67442 (=> (not res!528049) (not e!434052))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67442 (= res!528049 (validMask!0 mask!3328))))

(assert (=> start!67442 e!434052))

(assert (=> start!67442 true))

(declare-datatypes ((array!42627 0))(
  ( (array!42628 (arr!20405 (Array (_ BitVec 32) (_ BitVec 64))) (size!20826 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42627)

(declare-fun array_inv!16288 (array!42627) Bool)

(assert (=> start!67442 (array_inv!16288 a!3186)))

(declare-datatypes ((SeekEntryResult!8002 0))(
  ( (MissingZero!8002 (index!34376 (_ BitVec 32))) (Found!8002 (index!34377 (_ BitVec 32))) (Intermediate!8002 (undefined!8814 Bool) (index!34378 (_ BitVec 32)) (x!65335 (_ BitVec 32))) (Undefined!8002) (MissingVacant!8002 (index!34379 (_ BitVec 32))) )
))
(declare-fun lt!347615 () SeekEntryResult!8002)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!434057 () Bool)

(declare-fun b!780339 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42627 (_ BitVec 32)) SeekEntryResult!8002)

(assert (=> b!780339 (= e!434057 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20405 a!3186) j!159) a!3186 mask!3328) lt!347615))))

(declare-fun b!780340 () Bool)

(declare-fun res!528059 () Bool)

(declare-fun e!434058 () Bool)

(assert (=> b!780340 (=> res!528059 e!434058)))

(declare-fun lt!347623 () (_ BitVec 64))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!780340 (= res!528059 (= (select (store (arr!20405 a!3186) i!1173 k0!2102) index!1321) lt!347623))))

(declare-fun b!780341 () Bool)

(declare-fun res!528044 () Bool)

(declare-fun e!434051 () Bool)

(assert (=> b!780341 (=> (not res!528044) (not e!434051))))

(assert (=> b!780341 (= res!528044 e!434057)))

(declare-fun c!86552 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!780341 (= c!86552 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!780342 () Bool)

(declare-fun res!528046 () Bool)

(assert (=> b!780342 (=> (not res!528046) (not e!434052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!780342 (= res!528046 (validKeyInArray!0 k0!2102))))

(declare-fun b!780343 () Bool)

(declare-fun res!528056 () Bool)

(declare-fun e!434053 () Bool)

(assert (=> b!780343 (=> (not res!528056) (not e!434053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42627 (_ BitVec 32)) Bool)

(assert (=> b!780343 (= res!528056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!780344 () Bool)

(declare-fun res!528051 () Bool)

(assert (=> b!780344 (=> (not res!528051) (not e!434052))))

(assert (=> b!780344 (= res!528051 (and (= (size!20826 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20826 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20826 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!780345 () Bool)

(declare-fun e!434056 () Bool)

(assert (=> b!780345 (= e!434051 e!434056)))

(declare-fun res!528052 () Bool)

(assert (=> b!780345 (=> (not res!528052) (not e!434056))))

(declare-fun lt!347616 () SeekEntryResult!8002)

(declare-fun lt!347617 () SeekEntryResult!8002)

(assert (=> b!780345 (= res!528052 (= lt!347616 lt!347617))))

(declare-fun lt!347618 () array!42627)

(assert (=> b!780345 (= lt!347617 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347623 lt!347618 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!780345 (= lt!347616 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347623 mask!3328) lt!347623 lt!347618 mask!3328))))

(assert (=> b!780345 (= lt!347623 (select (store (arr!20405 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!780345 (= lt!347618 (array!42628 (store (arr!20405 a!3186) i!1173 k0!2102) (size!20826 a!3186)))))

(declare-fun b!780346 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!434054 () Bool)

(declare-fun lt!347622 () SeekEntryResult!8002)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42627 (_ BitVec 32)) SeekEntryResult!8002)

(assert (=> b!780346 (= e!434054 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20405 a!3186) j!159) a!3186 mask!3328) lt!347622))))

(declare-fun b!780347 () Bool)

(declare-fun res!528053 () Bool)

(assert (=> b!780347 (=> (not res!528053) (not e!434053))))

(declare-datatypes ((List!14446 0))(
  ( (Nil!14443) (Cons!14442 (h!15559 (_ BitVec 64)) (t!20752 List!14446)) )
))
(declare-fun arrayNoDuplicates!0 (array!42627 (_ BitVec 32) List!14446) Bool)

(assert (=> b!780347 (= res!528053 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14443))))

(declare-fun b!780348 () Bool)

(assert (=> b!780348 (= e!434057 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20405 a!3186) j!159) a!3186 mask!3328) (Found!8002 j!159)))))

(declare-fun b!780349 () Bool)

(assert (=> b!780349 (= e!434052 e!434053)))

(declare-fun res!528055 () Bool)

(assert (=> b!780349 (=> (not res!528055) (not e!434053))))

(declare-fun lt!347619 () SeekEntryResult!8002)

(assert (=> b!780349 (= res!528055 (or (= lt!347619 (MissingZero!8002 i!1173)) (= lt!347619 (MissingVacant!8002 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42627 (_ BitVec 32)) SeekEntryResult!8002)

(assert (=> b!780349 (= lt!347619 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!780350 () Bool)

(declare-fun res!528057 () Bool)

(assert (=> b!780350 (=> (not res!528057) (not e!434051))))

(assert (=> b!780350 (= res!528057 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20405 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!780351 () Bool)

(declare-datatypes ((Unit!26876 0))(
  ( (Unit!26877) )
))
(declare-fun e!434055 () Unit!26876)

(declare-fun Unit!26878 () Unit!26876)

(assert (=> b!780351 (= e!434055 Unit!26878)))

(declare-fun b!780352 () Bool)

(declare-fun res!528050 () Bool)

(assert (=> b!780352 (=> (not res!528050) (not e!434052))))

(assert (=> b!780352 (= res!528050 (validKeyInArray!0 (select (arr!20405 a!3186) j!159)))))

(declare-fun b!780353 () Bool)

(declare-fun res!528058 () Bool)

(assert (=> b!780353 (=> (not res!528058) (not e!434052))))

(declare-fun arrayContainsKey!0 (array!42627 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!780353 (= res!528058 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!780354 () Bool)

(assert (=> b!780354 (= e!434053 e!434051)))

(declare-fun res!528060 () Bool)

(assert (=> b!780354 (=> (not res!528060) (not e!434051))))

(assert (=> b!780354 (= res!528060 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20405 a!3186) j!159) mask!3328) (select (arr!20405 a!3186) j!159) a!3186 mask!3328) lt!347615))))

(assert (=> b!780354 (= lt!347615 (Intermediate!8002 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!780355 () Bool)

(declare-fun res!528047 () Bool)

(assert (=> b!780355 (=> (not res!528047) (not e!434053))))

(assert (=> b!780355 (= res!528047 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20826 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20826 a!3186))))))

(declare-fun b!780356 () Bool)

(declare-fun res!528054 () Bool)

(assert (=> b!780356 (=> res!528054 e!434058)))

(assert (=> b!780356 (= res!528054 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20405 a!3186) j!159) a!3186 mask!3328) lt!347622)))))

(declare-fun b!780357 () Bool)

(declare-fun Unit!26879 () Unit!26876)

(assert (=> b!780357 (= e!434055 Unit!26879)))

(assert (=> b!780357 false))

(declare-fun b!780358 () Bool)

(assert (=> b!780358 (= e!434056 (not e!434058))))

(declare-fun res!528048 () Bool)

(assert (=> b!780358 (=> res!528048 e!434058)))

(get-info :version)

(assert (=> b!780358 (= res!528048 (or (not ((_ is Intermediate!8002) lt!347617)) (bvslt x!1131 (x!65335 lt!347617)) (not (= x!1131 (x!65335 lt!347617))) (not (= index!1321 (index!34378 lt!347617)))))))

(assert (=> b!780358 e!434054))

(declare-fun res!528045 () Bool)

(assert (=> b!780358 (=> (not res!528045) (not e!434054))))

(declare-fun lt!347621 () SeekEntryResult!8002)

(assert (=> b!780358 (= res!528045 (= lt!347621 lt!347622))))

(assert (=> b!780358 (= lt!347622 (Found!8002 j!159))))

(assert (=> b!780358 (= lt!347621 (seekEntryOrOpen!0 (select (arr!20405 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!780358 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!347624 () Unit!26876)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42627 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26876)

(assert (=> b!780358 (= lt!347624 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!780359 () Bool)

(assert (=> b!780359 (= e!434058 true)))

(declare-fun lt!347620 () Unit!26876)

(assert (=> b!780359 (= lt!347620 e!434055)))

(declare-fun c!86553 () Bool)

(assert (=> b!780359 (= c!86553 (= (select (store (arr!20405 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!67442 res!528049) b!780344))

(assert (= (and b!780344 res!528051) b!780352))

(assert (= (and b!780352 res!528050) b!780342))

(assert (= (and b!780342 res!528046) b!780353))

(assert (= (and b!780353 res!528058) b!780349))

(assert (= (and b!780349 res!528055) b!780343))

(assert (= (and b!780343 res!528056) b!780347))

(assert (= (and b!780347 res!528053) b!780355))

(assert (= (and b!780355 res!528047) b!780354))

(assert (= (and b!780354 res!528060) b!780350))

(assert (= (and b!780350 res!528057) b!780341))

(assert (= (and b!780341 c!86552) b!780339))

(assert (= (and b!780341 (not c!86552)) b!780348))

(assert (= (and b!780341 res!528044) b!780345))

(assert (= (and b!780345 res!528052) b!780358))

(assert (= (and b!780358 res!528045) b!780346))

(assert (= (and b!780358 (not res!528048)) b!780356))

(assert (= (and b!780356 (not res!528054)) b!780340))

(assert (= (and b!780340 (not res!528059)) b!780359))

(assert (= (and b!780359 c!86553) b!780357))

(assert (= (and b!780359 (not c!86553)) b!780351))

(declare-fun m!723099 () Bool)

(assert (=> b!780342 m!723099))

(declare-fun m!723101 () Bool)

(assert (=> b!780352 m!723101))

(assert (=> b!780352 m!723101))

(declare-fun m!723103 () Bool)

(assert (=> b!780352 m!723103))

(assert (=> b!780339 m!723101))

(assert (=> b!780339 m!723101))

(declare-fun m!723105 () Bool)

(assert (=> b!780339 m!723105))

(assert (=> b!780358 m!723101))

(assert (=> b!780358 m!723101))

(declare-fun m!723107 () Bool)

(assert (=> b!780358 m!723107))

(declare-fun m!723109 () Bool)

(assert (=> b!780358 m!723109))

(declare-fun m!723111 () Bool)

(assert (=> b!780358 m!723111))

(declare-fun m!723113 () Bool)

(assert (=> b!780347 m!723113))

(declare-fun m!723115 () Bool)

(assert (=> b!780343 m!723115))

(assert (=> b!780348 m!723101))

(assert (=> b!780348 m!723101))

(declare-fun m!723117 () Bool)

(assert (=> b!780348 m!723117))

(declare-fun m!723119 () Bool)

(assert (=> b!780345 m!723119))

(declare-fun m!723121 () Bool)

(assert (=> b!780345 m!723121))

(declare-fun m!723123 () Bool)

(assert (=> b!780345 m!723123))

(declare-fun m!723125 () Bool)

(assert (=> b!780345 m!723125))

(declare-fun m!723127 () Bool)

(assert (=> b!780345 m!723127))

(assert (=> b!780345 m!723125))

(declare-fun m!723129 () Bool)

(assert (=> start!67442 m!723129))

(declare-fun m!723131 () Bool)

(assert (=> start!67442 m!723131))

(assert (=> b!780346 m!723101))

(assert (=> b!780346 m!723101))

(declare-fun m!723133 () Bool)

(assert (=> b!780346 m!723133))

(declare-fun m!723135 () Bool)

(assert (=> b!780353 m!723135))

(declare-fun m!723137 () Bool)

(assert (=> b!780350 m!723137))

(assert (=> b!780356 m!723101))

(assert (=> b!780356 m!723101))

(assert (=> b!780356 m!723117))

(declare-fun m!723139 () Bool)

(assert (=> b!780349 m!723139))

(assert (=> b!780354 m!723101))

(assert (=> b!780354 m!723101))

(declare-fun m!723141 () Bool)

(assert (=> b!780354 m!723141))

(assert (=> b!780354 m!723141))

(assert (=> b!780354 m!723101))

(declare-fun m!723143 () Bool)

(assert (=> b!780354 m!723143))

(assert (=> b!780359 m!723121))

(declare-fun m!723145 () Bool)

(assert (=> b!780359 m!723145))

(assert (=> b!780340 m!723121))

(assert (=> b!780340 m!723145))

(check-sat (not b!780343) (not b!780339) (not b!780346) (not b!780354) (not start!67442) (not b!780345) (not b!780352) (not b!780348) (not b!780349) (not b!780347) (not b!780353) (not b!780356) (not b!780342) (not b!780358))
(check-sat)
