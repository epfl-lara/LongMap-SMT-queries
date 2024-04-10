; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65588 () Bool)

(assert start!65588)

(declare-fun b!749781 () Bool)

(declare-fun res!505959 () Bool)

(declare-fun e!418360 () Bool)

(assert (=> b!749781 (=> (not res!505959) (not e!418360))))

(declare-datatypes ((array!41761 0))(
  ( (array!41762 (arr!19994 (Array (_ BitVec 32) (_ BitVec 64))) (size!20415 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41761)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!749781 (= res!505959 (validKeyInArray!0 (select (arr!19994 a!3186) j!159)))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun b!749782 () Bool)

(declare-fun lt!333353 () (_ BitVec 64))

(declare-fun e!418368 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!333352 () array!41761)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7594 0))(
  ( (MissingZero!7594 (index!32744 (_ BitVec 32))) (Found!7594 (index!32745 (_ BitVec 32))) (Intermediate!7594 (undefined!8406 Bool) (index!32746 (_ BitVec 32)) (x!63672 (_ BitVec 32))) (Undefined!7594) (MissingVacant!7594 (index!32747 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41761 (_ BitVec 32)) SeekEntryResult!7594)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41761 (_ BitVec 32)) SeekEntryResult!7594)

(assert (=> b!749782 (= e!418368 (= (seekEntryOrOpen!0 lt!333353 lt!333352 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333353 lt!333352 mask!3328)))))

(declare-fun b!749783 () Bool)

(declare-fun res!505966 () Bool)

(declare-fun e!418366 () Bool)

(assert (=> b!749783 (=> (not res!505966) (not e!418366))))

(declare-datatypes ((List!13996 0))(
  ( (Nil!13993) (Cons!13992 (h!15064 (_ BitVec 64)) (t!20311 List!13996)) )
))
(declare-fun arrayNoDuplicates!0 (array!41761 (_ BitVec 32) List!13996) Bool)

(assert (=> b!749783 (= res!505966 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13993))))

(declare-fun b!749784 () Bool)

(declare-fun res!505967 () Bool)

(declare-fun e!418370 () Bool)

(assert (=> b!749784 (=> res!505967 e!418370)))

(declare-fun lt!333359 () SeekEntryResult!7594)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!749784 (= res!505967 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19994 a!3186) j!159) a!3186 mask!3328) lt!333359)))))

(declare-fun b!749785 () Bool)

(declare-fun res!505972 () Bool)

(assert (=> b!749785 (=> (not res!505972) (not e!418360))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!749785 (= res!505972 (validKeyInArray!0 k!2102))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!749786 () Bool)

(declare-fun e!418364 () Bool)

(assert (=> b!749786 (= e!418364 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19994 a!3186) j!159) a!3186 mask!3328) lt!333359))))

(declare-fun b!749787 () Bool)

(declare-fun e!418362 () Bool)

(assert (=> b!749787 (= e!418362 (not e!418370))))

(declare-fun res!505956 () Bool)

(assert (=> b!749787 (=> res!505956 e!418370)))

(declare-fun lt!333355 () SeekEntryResult!7594)

(assert (=> b!749787 (= res!505956 (or (not (is-Intermediate!7594 lt!333355)) (bvslt x!1131 (x!63672 lt!333355)) (not (= x!1131 (x!63672 lt!333355))) (not (= index!1321 (index!32746 lt!333355)))))))

(assert (=> b!749787 e!418364))

(declare-fun res!505973 () Bool)

(assert (=> b!749787 (=> (not res!505973) (not e!418364))))

(declare-fun lt!333360 () SeekEntryResult!7594)

(assert (=> b!749787 (= res!505973 (= lt!333360 lt!333359))))

(assert (=> b!749787 (= lt!333359 (Found!7594 j!159))))

(assert (=> b!749787 (= lt!333360 (seekEntryOrOpen!0 (select (arr!19994 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41761 (_ BitVec 32)) Bool)

(assert (=> b!749787 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25756 0))(
  ( (Unit!25757) )
))
(declare-fun lt!333356 () Unit!25756)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41761 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25756)

(assert (=> b!749787 (= lt!333356 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!749788 () Bool)

(declare-fun res!505964 () Bool)

(assert (=> b!749788 (=> (not res!505964) (not e!418366))))

(assert (=> b!749788 (= res!505964 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20415 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20415 a!3186))))))

(declare-fun b!749789 () Bool)

(declare-fun res!505960 () Bool)

(declare-fun e!418369 () Bool)

(assert (=> b!749789 (=> (not res!505960) (not e!418369))))

(declare-fun e!418365 () Bool)

(assert (=> b!749789 (= res!505960 e!418365)))

(declare-fun c!82293 () Bool)

(assert (=> b!749789 (= c!82293 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!749790 () Bool)

(declare-fun e!418367 () Unit!25756)

(declare-fun Unit!25758 () Unit!25756)

(assert (=> b!749790 (= e!418367 Unit!25758)))

(declare-fun b!749791 () Bool)

(assert (=> b!749791 (= e!418360 e!418366)))

(declare-fun res!505961 () Bool)

(assert (=> b!749791 (=> (not res!505961) (not e!418366))))

(declare-fun lt!333354 () SeekEntryResult!7594)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!749791 (= res!505961 (or (= lt!333354 (MissingZero!7594 i!1173)) (= lt!333354 (MissingVacant!7594 i!1173))))))

(assert (=> b!749791 (= lt!333354 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!749793 () Bool)

(declare-fun Unit!25759 () Unit!25756)

(assert (=> b!749793 (= e!418367 Unit!25759)))

(assert (=> b!749793 false))

(declare-fun b!749794 () Bool)

(declare-fun res!505958 () Bool)

(assert (=> b!749794 (=> (not res!505958) (not e!418366))))

(assert (=> b!749794 (= res!505958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!749795 () Bool)

(declare-fun e!418361 () Bool)

(assert (=> b!749795 (= e!418361 true)))

(assert (=> b!749795 e!418368))

(declare-fun res!505962 () Bool)

(assert (=> b!749795 (=> (not res!505962) (not e!418368))))

(declare-fun lt!333357 () (_ BitVec 64))

(assert (=> b!749795 (= res!505962 (= lt!333357 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333362 () Unit!25756)

(assert (=> b!749795 (= lt!333362 e!418367)))

(declare-fun c!82294 () Bool)

(assert (=> b!749795 (= c!82294 (= lt!333357 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!749796 () Bool)

(assert (=> b!749796 (= e!418365 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19994 a!3186) j!159) a!3186 mask!3328) (Found!7594 j!159)))))

(declare-fun b!749797 () Bool)

(assert (=> b!749797 (= e!418369 e!418362)))

(declare-fun res!505971 () Bool)

(assert (=> b!749797 (=> (not res!505971) (not e!418362))))

(declare-fun lt!333358 () SeekEntryResult!7594)

(assert (=> b!749797 (= res!505971 (= lt!333358 lt!333355))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41761 (_ BitVec 32)) SeekEntryResult!7594)

(assert (=> b!749797 (= lt!333355 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333353 lt!333352 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!749797 (= lt!333358 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333353 mask!3328) lt!333353 lt!333352 mask!3328))))

(assert (=> b!749797 (= lt!333353 (select (store (arr!19994 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!749797 (= lt!333352 (array!41762 (store (arr!19994 a!3186) i!1173 k!2102) (size!20415 a!3186)))))

(declare-fun b!749798 () Bool)

(declare-fun res!505963 () Bool)

(assert (=> b!749798 (=> (not res!505963) (not e!418360))))

(declare-fun arrayContainsKey!0 (array!41761 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!749798 (= res!505963 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!749799 () Bool)

(declare-fun res!505957 () Bool)

(assert (=> b!749799 (=> (not res!505957) (not e!418360))))

(assert (=> b!749799 (= res!505957 (and (= (size!20415 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20415 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20415 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!749800 () Bool)

(assert (=> b!749800 (= e!418370 e!418361)))

(declare-fun res!505970 () Bool)

(assert (=> b!749800 (=> res!505970 e!418361)))

(assert (=> b!749800 (= res!505970 (= lt!333357 lt!333353))))

(assert (=> b!749800 (= lt!333357 (select (store (arr!19994 a!3186) i!1173 k!2102) index!1321))))

(declare-fun lt!333361 () SeekEntryResult!7594)

(declare-fun b!749801 () Bool)

(assert (=> b!749801 (= e!418365 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19994 a!3186) j!159) a!3186 mask!3328) lt!333361))))

(declare-fun b!749802 () Bool)

(assert (=> b!749802 (= e!418366 e!418369)))

(declare-fun res!505969 () Bool)

(assert (=> b!749802 (=> (not res!505969) (not e!418369))))

(assert (=> b!749802 (= res!505969 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19994 a!3186) j!159) mask!3328) (select (arr!19994 a!3186) j!159) a!3186 mask!3328) lt!333361))))

(assert (=> b!749802 (= lt!333361 (Intermediate!7594 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!749792 () Bool)

(declare-fun res!505965 () Bool)

(assert (=> b!749792 (=> (not res!505965) (not e!418369))))

(assert (=> b!749792 (= res!505965 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19994 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!505968 () Bool)

(assert (=> start!65588 (=> (not res!505968) (not e!418360))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65588 (= res!505968 (validMask!0 mask!3328))))

(assert (=> start!65588 e!418360))

(assert (=> start!65588 true))

(declare-fun array_inv!15790 (array!41761) Bool)

(assert (=> start!65588 (array_inv!15790 a!3186)))

(assert (= (and start!65588 res!505968) b!749799))

(assert (= (and b!749799 res!505957) b!749781))

(assert (= (and b!749781 res!505959) b!749785))

(assert (= (and b!749785 res!505972) b!749798))

(assert (= (and b!749798 res!505963) b!749791))

(assert (= (and b!749791 res!505961) b!749794))

(assert (= (and b!749794 res!505958) b!749783))

(assert (= (and b!749783 res!505966) b!749788))

(assert (= (and b!749788 res!505964) b!749802))

(assert (= (and b!749802 res!505969) b!749792))

(assert (= (and b!749792 res!505965) b!749789))

(assert (= (and b!749789 c!82293) b!749801))

(assert (= (and b!749789 (not c!82293)) b!749796))

(assert (= (and b!749789 res!505960) b!749797))

(assert (= (and b!749797 res!505971) b!749787))

(assert (= (and b!749787 res!505973) b!749786))

(assert (= (and b!749787 (not res!505956)) b!749784))

(assert (= (and b!749784 (not res!505967)) b!749800))

(assert (= (and b!749800 (not res!505970)) b!749795))

(assert (= (and b!749795 c!82294) b!749793))

(assert (= (and b!749795 (not c!82294)) b!749790))

(assert (= (and b!749795 res!505962) b!749782))

(declare-fun m!699315 () Bool)

(assert (=> b!749781 m!699315))

(assert (=> b!749781 m!699315))

(declare-fun m!699317 () Bool)

(assert (=> b!749781 m!699317))

(declare-fun m!699319 () Bool)

(assert (=> b!749797 m!699319))

(declare-fun m!699321 () Bool)

(assert (=> b!749797 m!699321))

(declare-fun m!699323 () Bool)

(assert (=> b!749797 m!699323))

(declare-fun m!699325 () Bool)

(assert (=> b!749797 m!699325))

(declare-fun m!699327 () Bool)

(assert (=> b!749797 m!699327))

(assert (=> b!749797 m!699319))

(assert (=> b!749796 m!699315))

(assert (=> b!749796 m!699315))

(declare-fun m!699329 () Bool)

(assert (=> b!749796 m!699329))

(assert (=> b!749801 m!699315))

(assert (=> b!749801 m!699315))

(declare-fun m!699331 () Bool)

(assert (=> b!749801 m!699331))

(assert (=> b!749787 m!699315))

(assert (=> b!749787 m!699315))

(declare-fun m!699333 () Bool)

(assert (=> b!749787 m!699333))

(declare-fun m!699335 () Bool)

(assert (=> b!749787 m!699335))

(declare-fun m!699337 () Bool)

(assert (=> b!749787 m!699337))

(declare-fun m!699339 () Bool)

(assert (=> b!749792 m!699339))

(declare-fun m!699341 () Bool)

(assert (=> b!749794 m!699341))

(declare-fun m!699343 () Bool)

(assert (=> b!749783 m!699343))

(declare-fun m!699345 () Bool)

(assert (=> b!749782 m!699345))

(declare-fun m!699347 () Bool)

(assert (=> b!749782 m!699347))

(declare-fun m!699349 () Bool)

(assert (=> b!749785 m!699349))

(assert (=> b!749800 m!699325))

(declare-fun m!699351 () Bool)

(assert (=> b!749800 m!699351))

(declare-fun m!699353 () Bool)

(assert (=> start!65588 m!699353))

(declare-fun m!699355 () Bool)

(assert (=> start!65588 m!699355))

(assert (=> b!749784 m!699315))

(assert (=> b!749784 m!699315))

(assert (=> b!749784 m!699329))

(assert (=> b!749802 m!699315))

(assert (=> b!749802 m!699315))

(declare-fun m!699357 () Bool)

(assert (=> b!749802 m!699357))

(assert (=> b!749802 m!699357))

(assert (=> b!749802 m!699315))

(declare-fun m!699359 () Bool)

(assert (=> b!749802 m!699359))

(declare-fun m!699361 () Bool)

(assert (=> b!749791 m!699361))

(declare-fun m!699363 () Bool)

(assert (=> b!749798 m!699363))

(assert (=> b!749786 m!699315))

(assert (=> b!749786 m!699315))

(declare-fun m!699365 () Bool)

(assert (=> b!749786 m!699365))

(push 1)

