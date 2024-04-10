; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65594 () Bool)

(assert start!65594)

(declare-fun b!749979 () Bool)

(declare-fun res!506124 () Bool)

(declare-fun e!418465 () Bool)

(assert (=> b!749979 (=> (not res!506124) (not e!418465))))

(declare-datatypes ((array!41767 0))(
  ( (array!41768 (arr!19997 (Array (_ BitVec 32) (_ BitVec 64))) (size!20418 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41767)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!749979 (= res!506124 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun e!418468 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!749980 () Bool)

(declare-datatypes ((SeekEntryResult!7597 0))(
  ( (MissingZero!7597 (index!32756 (_ BitVec 32))) (Found!7597 (index!32757 (_ BitVec 32))) (Intermediate!7597 (undefined!8409 Bool) (index!32758 (_ BitVec 32)) (x!63683 (_ BitVec 32))) (Undefined!7597) (MissingVacant!7597 (index!32759 (_ BitVec 32))) )
))
(declare-fun lt!333452 () SeekEntryResult!7597)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41767 (_ BitVec 32)) SeekEntryResult!7597)

(assert (=> b!749980 (= e!418468 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19997 a!3186) j!159) a!3186 mask!3328) lt!333452))))

(declare-fun b!749981 () Bool)

(declare-fun res!506128 () Bool)

(assert (=> b!749981 (=> (not res!506128) (not e!418465))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!749981 (= res!506128 (validKeyInArray!0 (select (arr!19997 a!3186) j!159)))))

(declare-fun b!749982 () Bool)

(declare-datatypes ((Unit!25768 0))(
  ( (Unit!25769) )
))
(declare-fun e!418466 () Unit!25768)

(declare-fun Unit!25770 () Unit!25768)

(assert (=> b!749982 (= e!418466 Unit!25770)))

(declare-fun b!749983 () Bool)

(declare-fun res!506125 () Bool)

(declare-fun e!418460 () Bool)

(assert (=> b!749983 (=> (not res!506125) (not e!418460))))

(declare-datatypes ((List!13999 0))(
  ( (Nil!13996) (Cons!13995 (h!15067 (_ BitVec 64)) (t!20314 List!13999)) )
))
(declare-fun arrayNoDuplicates!0 (array!41767 (_ BitVec 32) List!13999) Bool)

(assert (=> b!749983 (= res!506125 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13996))))

(declare-fun b!749984 () Bool)

(declare-fun res!506126 () Bool)

(declare-fun e!418463 () Bool)

(assert (=> b!749984 (=> (not res!506126) (not e!418463))))

(assert (=> b!749984 (= res!506126 e!418468)))

(declare-fun c!82311 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!749984 (= c!82311 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!749985 () Bool)

(declare-fun res!506120 () Bool)

(assert (=> b!749985 (=> (not res!506120) (not e!418460))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41767 (_ BitVec 32)) Bool)

(assert (=> b!749985 (= res!506120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!749986 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41767 (_ BitVec 32)) SeekEntryResult!7597)

(assert (=> b!749986 (= e!418468 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19997 a!3186) j!159) a!3186 mask!3328) (Found!7597 j!159)))))

(declare-fun b!749987 () Bool)

(declare-fun e!418469 () Bool)

(assert (=> b!749987 (= e!418463 e!418469)))

(declare-fun res!506134 () Bool)

(assert (=> b!749987 (=> (not res!506134) (not e!418469))))

(declare-fun lt!333456 () SeekEntryResult!7597)

(declare-fun lt!333455 () SeekEntryResult!7597)

(assert (=> b!749987 (= res!506134 (= lt!333456 lt!333455))))

(declare-fun lt!333459 () (_ BitVec 64))

(declare-fun lt!333458 () array!41767)

(assert (=> b!749987 (= lt!333455 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333459 lt!333458 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!749987 (= lt!333456 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333459 mask!3328) lt!333459 lt!333458 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!749987 (= lt!333459 (select (store (arr!19997 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!749987 (= lt!333458 (array!41768 (store (arr!19997 a!3186) i!1173 k!2102) (size!20418 a!3186)))))

(declare-fun b!749989 () Bool)

(declare-fun e!418464 () Bool)

(declare-fun e!418462 () Bool)

(assert (=> b!749989 (= e!418464 e!418462)))

(declare-fun res!506119 () Bool)

(assert (=> b!749989 (=> res!506119 e!418462)))

(declare-fun lt!333457 () (_ BitVec 64))

(assert (=> b!749989 (= res!506119 (= lt!333457 lt!333459))))

(assert (=> b!749989 (= lt!333457 (select (store (arr!19997 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!749990 () Bool)

(declare-fun res!506127 () Bool)

(assert (=> b!749990 (=> (not res!506127) (not e!418463))))

(assert (=> b!749990 (= res!506127 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19997 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!749991 () Bool)

(declare-fun Unit!25771 () Unit!25768)

(assert (=> b!749991 (= e!418466 Unit!25771)))

(assert (=> b!749991 false))

(declare-fun b!749992 () Bool)

(assert (=> b!749992 (= e!418462 true)))

(declare-fun e!418467 () Bool)

(assert (=> b!749992 e!418467))

(declare-fun res!506129 () Bool)

(assert (=> b!749992 (=> (not res!506129) (not e!418467))))

(assert (=> b!749992 (= res!506129 (= lt!333457 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333460 () Unit!25768)

(assert (=> b!749992 (= lt!333460 e!418466)))

(declare-fun c!82312 () Bool)

(assert (=> b!749992 (= c!82312 (= lt!333457 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!418459 () Bool)

(declare-fun b!749993 () Bool)

(declare-fun lt!333461 () SeekEntryResult!7597)

(assert (=> b!749993 (= e!418459 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19997 a!3186) j!159) a!3186 mask!3328) lt!333461))))

(declare-fun b!749994 () Bool)

(assert (=> b!749994 (= e!418465 e!418460)))

(declare-fun res!506122 () Bool)

(assert (=> b!749994 (=> (not res!506122) (not e!418460))))

(declare-fun lt!333453 () SeekEntryResult!7597)

(assert (=> b!749994 (= res!506122 (or (= lt!333453 (MissingZero!7597 i!1173)) (= lt!333453 (MissingVacant!7597 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41767 (_ BitVec 32)) SeekEntryResult!7597)

(assert (=> b!749994 (= lt!333453 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!749995 () Bool)

(assert (=> b!749995 (= e!418469 (not e!418464))))

(declare-fun res!506130 () Bool)

(assert (=> b!749995 (=> res!506130 e!418464)))

(assert (=> b!749995 (= res!506130 (or (not (is-Intermediate!7597 lt!333455)) (bvslt x!1131 (x!63683 lt!333455)) (not (= x!1131 (x!63683 lt!333455))) (not (= index!1321 (index!32758 lt!333455)))))))

(assert (=> b!749995 e!418459))

(declare-fun res!506121 () Bool)

(assert (=> b!749995 (=> (not res!506121) (not e!418459))))

(declare-fun lt!333454 () SeekEntryResult!7597)

(assert (=> b!749995 (= res!506121 (= lt!333454 lt!333461))))

(assert (=> b!749995 (= lt!333461 (Found!7597 j!159))))

(assert (=> b!749995 (= lt!333454 (seekEntryOrOpen!0 (select (arr!19997 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!749995 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!333451 () Unit!25768)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41767 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25768)

(assert (=> b!749995 (= lt!333451 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!749996 () Bool)

(assert (=> b!749996 (= e!418460 e!418463)))

(declare-fun res!506133 () Bool)

(assert (=> b!749996 (=> (not res!506133) (not e!418463))))

(assert (=> b!749996 (= res!506133 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19997 a!3186) j!159) mask!3328) (select (arr!19997 a!3186) j!159) a!3186 mask!3328) lt!333452))))

(assert (=> b!749996 (= lt!333452 (Intermediate!7597 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!749997 () Bool)

(declare-fun res!506123 () Bool)

(assert (=> b!749997 (=> (not res!506123) (not e!418465))))

(assert (=> b!749997 (= res!506123 (validKeyInArray!0 k!2102))))

(declare-fun b!749998 () Bool)

(declare-fun res!506135 () Bool)

(assert (=> b!749998 (=> (not res!506135) (not e!418460))))

(assert (=> b!749998 (= res!506135 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20418 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20418 a!3186))))))

(declare-fun b!749988 () Bool)

(declare-fun res!506118 () Bool)

(assert (=> b!749988 (=> res!506118 e!418464)))

(assert (=> b!749988 (= res!506118 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19997 a!3186) j!159) a!3186 mask!3328) lt!333461)))))

(declare-fun res!506132 () Bool)

(assert (=> start!65594 (=> (not res!506132) (not e!418465))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65594 (= res!506132 (validMask!0 mask!3328))))

(assert (=> start!65594 e!418465))

(assert (=> start!65594 true))

(declare-fun array_inv!15793 (array!41767) Bool)

(assert (=> start!65594 (array_inv!15793 a!3186)))

(declare-fun b!749999 () Bool)

(declare-fun res!506131 () Bool)

(assert (=> b!749999 (=> (not res!506131) (not e!418465))))

(assert (=> b!749999 (= res!506131 (and (= (size!20418 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20418 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20418 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!750000 () Bool)

(assert (=> b!750000 (= e!418467 (= (seekEntryOrOpen!0 lt!333459 lt!333458 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333459 lt!333458 mask!3328)))))

(assert (= (and start!65594 res!506132) b!749999))

(assert (= (and b!749999 res!506131) b!749981))

(assert (= (and b!749981 res!506128) b!749997))

(assert (= (and b!749997 res!506123) b!749979))

(assert (= (and b!749979 res!506124) b!749994))

(assert (= (and b!749994 res!506122) b!749985))

(assert (= (and b!749985 res!506120) b!749983))

(assert (= (and b!749983 res!506125) b!749998))

(assert (= (and b!749998 res!506135) b!749996))

(assert (= (and b!749996 res!506133) b!749990))

(assert (= (and b!749990 res!506127) b!749984))

(assert (= (and b!749984 c!82311) b!749980))

(assert (= (and b!749984 (not c!82311)) b!749986))

(assert (= (and b!749984 res!506126) b!749987))

(assert (= (and b!749987 res!506134) b!749995))

(assert (= (and b!749995 res!506121) b!749993))

(assert (= (and b!749995 (not res!506130)) b!749988))

(assert (= (and b!749988 (not res!506118)) b!749989))

(assert (= (and b!749989 (not res!506119)) b!749992))

(assert (= (and b!749992 c!82312) b!749991))

(assert (= (and b!749992 (not c!82312)) b!749982))

(assert (= (and b!749992 res!506129) b!750000))

(declare-fun m!699471 () Bool)

(assert (=> b!750000 m!699471))

(declare-fun m!699473 () Bool)

(assert (=> b!750000 m!699473))

(declare-fun m!699475 () Bool)

(assert (=> b!749987 m!699475))

(assert (=> b!749987 m!699475))

(declare-fun m!699477 () Bool)

(assert (=> b!749987 m!699477))

(declare-fun m!699479 () Bool)

(assert (=> b!749987 m!699479))

(declare-fun m!699481 () Bool)

(assert (=> b!749987 m!699481))

(declare-fun m!699483 () Bool)

(assert (=> b!749987 m!699483))

(assert (=> b!749989 m!699481))

(declare-fun m!699485 () Bool)

(assert (=> b!749989 m!699485))

(declare-fun m!699487 () Bool)

(assert (=> b!749983 m!699487))

(declare-fun m!699489 () Bool)

(assert (=> b!749990 m!699489))

(declare-fun m!699491 () Bool)

(assert (=> b!749979 m!699491))

(declare-fun m!699493 () Bool)

(assert (=> b!749986 m!699493))

(assert (=> b!749986 m!699493))

(declare-fun m!699495 () Bool)

(assert (=> b!749986 m!699495))

(assert (=> b!749996 m!699493))

(assert (=> b!749996 m!699493))

(declare-fun m!699497 () Bool)

(assert (=> b!749996 m!699497))

(assert (=> b!749996 m!699497))

(assert (=> b!749996 m!699493))

(declare-fun m!699499 () Bool)

(assert (=> b!749996 m!699499))

(assert (=> b!749993 m!699493))

(assert (=> b!749993 m!699493))

(declare-fun m!699501 () Bool)

(assert (=> b!749993 m!699501))

(declare-fun m!699503 () Bool)

(assert (=> b!749997 m!699503))

(declare-fun m!699505 () Bool)

(assert (=> b!749994 m!699505))

(assert (=> b!749980 m!699493))

(assert (=> b!749980 m!699493))

(declare-fun m!699507 () Bool)

(assert (=> b!749980 m!699507))

(assert (=> b!749981 m!699493))

(assert (=> b!749981 m!699493))

(declare-fun m!699509 () Bool)

(assert (=> b!749981 m!699509))

(assert (=> b!749988 m!699493))

(assert (=> b!749988 m!699493))

(assert (=> b!749988 m!699495))

(assert (=> b!749995 m!699493))

(assert (=> b!749995 m!699493))

(declare-fun m!699511 () Bool)

(assert (=> b!749995 m!699511))

(declare-fun m!699513 () Bool)

(assert (=> b!749995 m!699513))

(declare-fun m!699515 () Bool)

(assert (=> b!749995 m!699515))

(declare-fun m!699517 () Bool)

(assert (=> b!749985 m!699517))

(declare-fun m!699519 () Bool)

(assert (=> start!65594 m!699519))

(declare-fun m!699521 () Bool)

(assert (=> start!65594 m!699521))

(push 1)

