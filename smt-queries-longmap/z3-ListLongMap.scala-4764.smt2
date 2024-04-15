; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65624 () Bool)

(assert start!65624)

(declare-fun b!751381 () Bool)

(declare-fun res!507377 () Bool)

(declare-fun e!419135 () Bool)

(assert (=> b!751381 (=> (not res!507377) (not e!419135))))

(declare-datatypes ((array!41814 0))(
  ( (array!41815 (arr!20021 (Array (_ BitVec 32) (_ BitVec 64))) (size!20442 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41814)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41814 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!751381 (= res!507377 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!751382 () Bool)

(declare-fun res!507375 () Bool)

(assert (=> b!751382 (=> (not res!507375) (not e!419135))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!751382 (= res!507375 (validKeyInArray!0 k0!2102))))

(declare-fun b!751383 () Bool)

(declare-fun e!419142 () Bool)

(declare-fun e!419143 () Bool)

(assert (=> b!751383 (= e!419142 e!419143)))

(declare-fun res!507373 () Bool)

(assert (=> b!751383 (=> res!507373 e!419143)))

(declare-fun lt!334046 () (_ BitVec 64))

(declare-fun lt!334048 () (_ BitVec 64))

(assert (=> b!751383 (= res!507373 (= lt!334046 lt!334048))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!751383 (= lt!334046 (select (store (arr!20021 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7618 0))(
  ( (MissingZero!7618 (index!32840 (_ BitVec 32))) (Found!7618 (index!32841 (_ BitVec 32))) (Intermediate!7618 (undefined!8430 Bool) (index!32842 (_ BitVec 32)) (x!63771 (_ BitVec 32))) (Undefined!7618) (MissingVacant!7618 (index!32843 (_ BitVec 32))) )
))
(declare-fun lt!334041 () SeekEntryResult!7618)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!751384 () Bool)

(declare-fun e!419137 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41814 (_ BitVec 32)) SeekEntryResult!7618)

(assert (=> b!751384 (= e!419137 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20021 a!3186) j!159) a!3186 mask!3328) lt!334041))))

(declare-fun b!751385 () Bool)

(declare-fun res!507360 () Bool)

(assert (=> b!751385 (=> (not res!507360) (not e!419135))))

(assert (=> b!751385 (= res!507360 (validKeyInArray!0 (select (arr!20021 a!3186) j!159)))))

(declare-fun b!751386 () Bool)

(declare-fun e!419138 () Bool)

(declare-fun lt!334039 () SeekEntryResult!7618)

(declare-fun lt!334042 () SeekEntryResult!7618)

(assert (=> b!751386 (= e!419138 (= lt!334039 lt!334042))))

(declare-fun b!751388 () Bool)

(declare-datatypes ((Unit!25832 0))(
  ( (Unit!25833) )
))
(declare-fun e!419132 () Unit!25832)

(declare-fun Unit!25834 () Unit!25832)

(assert (=> b!751388 (= e!419132 Unit!25834)))

(assert (=> b!751388 false))

(declare-fun b!751389 () Bool)

(declare-fun e!419141 () Bool)

(assert (=> b!751389 (= e!419135 e!419141)))

(declare-fun res!507363 () Bool)

(assert (=> b!751389 (=> (not res!507363) (not e!419141))))

(declare-fun lt!334049 () SeekEntryResult!7618)

(assert (=> b!751389 (= res!507363 (or (= lt!334049 (MissingZero!7618 i!1173)) (= lt!334049 (MissingVacant!7618 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41814 (_ BitVec 32)) SeekEntryResult!7618)

(assert (=> b!751389 (= lt!334049 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!751390 () Bool)

(declare-fun e!419133 () Bool)

(assert (=> b!751390 (= e!419141 e!419133)))

(declare-fun res!507378 () Bool)

(assert (=> b!751390 (=> (not res!507378) (not e!419133))))

(declare-fun lt!334038 () SeekEntryResult!7618)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41814 (_ BitVec 32)) SeekEntryResult!7618)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!751390 (= res!507378 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20021 a!3186) j!159) mask!3328) (select (arr!20021 a!3186) j!159) a!3186 mask!3328) lt!334038))))

(assert (=> b!751390 (= lt!334038 (Intermediate!7618 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!751391 () Bool)

(declare-fun e!419140 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!751391 (= e!419140 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20021 a!3186) j!159) a!3186 mask!3328) (Found!7618 j!159)))))

(declare-fun b!751392 () Bool)

(assert (=> b!751392 (= e!419143 true)))

(assert (=> b!751392 e!419138))

(declare-fun res!507361 () Bool)

(assert (=> b!751392 (=> (not res!507361) (not e!419138))))

(assert (=> b!751392 (= res!507361 (= lt!334046 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334040 () Unit!25832)

(assert (=> b!751392 (= lt!334040 e!419132)))

(declare-fun c!82391 () Bool)

(assert (=> b!751392 (= c!82391 (= lt!334046 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!751393 () Bool)

(declare-fun res!507362 () Bool)

(assert (=> b!751393 (=> (not res!507362) (not e!419133))))

(assert (=> b!751393 (= res!507362 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20021 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!751394 () Bool)

(declare-fun res!507367 () Bool)

(assert (=> b!751394 (=> (not res!507367) (not e!419135))))

(assert (=> b!751394 (= res!507367 (and (= (size!20442 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20442 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20442 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!751395 () Bool)

(declare-fun res!507368 () Bool)

(assert (=> b!751395 (=> (not res!507368) (not e!419133))))

(assert (=> b!751395 (= res!507368 e!419140)))

(declare-fun c!82392 () Bool)

(assert (=> b!751395 (= c!82392 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!751396 () Bool)

(assert (=> b!751396 (= e!419140 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20021 a!3186) j!159) a!3186 mask!3328) lt!334038))))

(declare-fun res!507374 () Bool)

(assert (=> start!65624 (=> (not res!507374) (not e!419135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65624 (= res!507374 (validMask!0 mask!3328))))

(assert (=> start!65624 e!419135))

(assert (=> start!65624 true))

(declare-fun array_inv!15904 (array!41814) Bool)

(assert (=> start!65624 (array_inv!15904 a!3186)))

(declare-fun b!751387 () Bool)

(declare-fun res!507366 () Bool)

(assert (=> b!751387 (=> (not res!507366) (not e!419141))))

(assert (=> b!751387 (= res!507366 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20442 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20442 a!3186))))))

(declare-fun b!751397 () Bool)

(declare-fun e!419139 () Bool)

(assert (=> b!751397 (= e!419133 e!419139)))

(declare-fun res!507364 () Bool)

(assert (=> b!751397 (=> (not res!507364) (not e!419139))))

(declare-fun lt!334044 () SeekEntryResult!7618)

(declare-fun lt!334047 () SeekEntryResult!7618)

(assert (=> b!751397 (= res!507364 (= lt!334044 lt!334047))))

(declare-fun lt!334043 () array!41814)

(assert (=> b!751397 (= lt!334047 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334048 lt!334043 mask!3328))))

(assert (=> b!751397 (= lt!334044 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334048 mask!3328) lt!334048 lt!334043 mask!3328))))

(assert (=> b!751397 (= lt!334048 (select (store (arr!20021 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!751397 (= lt!334043 (array!41815 (store (arr!20021 a!3186) i!1173 k0!2102) (size!20442 a!3186)))))

(declare-fun b!751398 () Bool)

(declare-fun e!419136 () Bool)

(assert (=> b!751398 (= e!419136 e!419142)))

(declare-fun res!507376 () Bool)

(assert (=> b!751398 (=> res!507376 e!419142)))

(assert (=> b!751398 (= res!507376 (not (= lt!334042 lt!334041)))))

(assert (=> b!751398 (= lt!334042 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20021 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!751399 () Bool)

(declare-fun Unit!25835 () Unit!25832)

(assert (=> b!751399 (= e!419132 Unit!25835)))

(declare-fun b!751400 () Bool)

(declare-fun res!507371 () Bool)

(assert (=> b!751400 (=> (not res!507371) (not e!419141))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41814 (_ BitVec 32)) Bool)

(assert (=> b!751400 (= res!507371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!751401 () Bool)

(declare-fun res!507365 () Bool)

(assert (=> b!751401 (=> (not res!507365) (not e!419138))))

(assert (=> b!751401 (= res!507365 (= (seekEntryOrOpen!0 lt!334048 lt!334043 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334048 lt!334043 mask!3328)))))

(declare-fun b!751402 () Bool)

(assert (=> b!751402 (= e!419139 (not e!419136))))

(declare-fun res!507370 () Bool)

(assert (=> b!751402 (=> res!507370 e!419136)))

(get-info :version)

(assert (=> b!751402 (= res!507370 (or (not ((_ is Intermediate!7618) lt!334047)) (bvslt x!1131 (x!63771 lt!334047)) (not (= x!1131 (x!63771 lt!334047))) (not (= index!1321 (index!32842 lt!334047)))))))

(assert (=> b!751402 e!419137))

(declare-fun res!507369 () Bool)

(assert (=> b!751402 (=> (not res!507369) (not e!419137))))

(assert (=> b!751402 (= res!507369 (= lt!334039 lt!334041))))

(assert (=> b!751402 (= lt!334041 (Found!7618 j!159))))

(assert (=> b!751402 (= lt!334039 (seekEntryOrOpen!0 (select (arr!20021 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!751402 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334045 () Unit!25832)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41814 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25832)

(assert (=> b!751402 (= lt!334045 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!751403 () Bool)

(declare-fun res!507372 () Bool)

(assert (=> b!751403 (=> (not res!507372) (not e!419141))))

(declare-datatypes ((List!14062 0))(
  ( (Nil!14059) (Cons!14058 (h!15130 (_ BitVec 64)) (t!20368 List!14062)) )
))
(declare-fun arrayNoDuplicates!0 (array!41814 (_ BitVec 32) List!14062) Bool)

(assert (=> b!751403 (= res!507372 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14059))))

(assert (= (and start!65624 res!507374) b!751394))

(assert (= (and b!751394 res!507367) b!751385))

(assert (= (and b!751385 res!507360) b!751382))

(assert (= (and b!751382 res!507375) b!751381))

(assert (= (and b!751381 res!507377) b!751389))

(assert (= (and b!751389 res!507363) b!751400))

(assert (= (and b!751400 res!507371) b!751403))

(assert (= (and b!751403 res!507372) b!751387))

(assert (= (and b!751387 res!507366) b!751390))

(assert (= (and b!751390 res!507378) b!751393))

(assert (= (and b!751393 res!507362) b!751395))

(assert (= (and b!751395 c!82392) b!751396))

(assert (= (and b!751395 (not c!82392)) b!751391))

(assert (= (and b!751395 res!507368) b!751397))

(assert (= (and b!751397 res!507364) b!751402))

(assert (= (and b!751402 res!507369) b!751384))

(assert (= (and b!751402 (not res!507370)) b!751398))

(assert (= (and b!751398 (not res!507376)) b!751383))

(assert (= (and b!751383 (not res!507373)) b!751392))

(assert (= (and b!751392 c!82391) b!751388))

(assert (= (and b!751392 (not c!82391)) b!751399))

(assert (= (and b!751392 res!507361) b!751401))

(assert (= (and b!751401 res!507365) b!751386))

(declare-fun m!700013 () Bool)

(assert (=> b!751383 m!700013))

(declare-fun m!700015 () Bool)

(assert (=> b!751383 m!700015))

(declare-fun m!700017 () Bool)

(assert (=> b!751393 m!700017))

(declare-fun m!700019 () Bool)

(assert (=> b!751382 m!700019))

(declare-fun m!700021 () Bool)

(assert (=> b!751398 m!700021))

(assert (=> b!751398 m!700021))

(declare-fun m!700023 () Bool)

(assert (=> b!751398 m!700023))

(assert (=> b!751396 m!700021))

(assert (=> b!751396 m!700021))

(declare-fun m!700025 () Bool)

(assert (=> b!751396 m!700025))

(assert (=> b!751385 m!700021))

(assert (=> b!751385 m!700021))

(declare-fun m!700027 () Bool)

(assert (=> b!751385 m!700027))

(declare-fun m!700029 () Bool)

(assert (=> b!751400 m!700029))

(declare-fun m!700031 () Bool)

(assert (=> b!751381 m!700031))

(assert (=> b!751390 m!700021))

(assert (=> b!751390 m!700021))

(declare-fun m!700033 () Bool)

(assert (=> b!751390 m!700033))

(assert (=> b!751390 m!700033))

(assert (=> b!751390 m!700021))

(declare-fun m!700035 () Bool)

(assert (=> b!751390 m!700035))

(declare-fun m!700037 () Bool)

(assert (=> b!751397 m!700037))

(declare-fun m!700039 () Bool)

(assert (=> b!751397 m!700039))

(declare-fun m!700041 () Bool)

(assert (=> b!751397 m!700041))

(assert (=> b!751397 m!700037))

(declare-fun m!700043 () Bool)

(assert (=> b!751397 m!700043))

(assert (=> b!751397 m!700013))

(declare-fun m!700045 () Bool)

(assert (=> b!751403 m!700045))

(declare-fun m!700047 () Bool)

(assert (=> start!65624 m!700047))

(declare-fun m!700049 () Bool)

(assert (=> start!65624 m!700049))

(assert (=> b!751391 m!700021))

(assert (=> b!751391 m!700021))

(assert (=> b!751391 m!700023))

(declare-fun m!700051 () Bool)

(assert (=> b!751401 m!700051))

(declare-fun m!700053 () Bool)

(assert (=> b!751401 m!700053))

(declare-fun m!700055 () Bool)

(assert (=> b!751389 m!700055))

(assert (=> b!751402 m!700021))

(assert (=> b!751402 m!700021))

(declare-fun m!700057 () Bool)

(assert (=> b!751402 m!700057))

(declare-fun m!700059 () Bool)

(assert (=> b!751402 m!700059))

(declare-fun m!700061 () Bool)

(assert (=> b!751402 m!700061))

(assert (=> b!751384 m!700021))

(assert (=> b!751384 m!700021))

(declare-fun m!700063 () Bool)

(assert (=> b!751384 m!700063))

(check-sat (not b!751402) (not b!751396) (not b!751390) (not b!751401) (not b!751381) (not b!751384) (not b!751398) (not b!751400) (not b!751389) (not start!65624) (not b!751382) (not b!751391) (not b!751397) (not b!751385) (not b!751403))
(check-sat)
