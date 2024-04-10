; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65466 () Bool)

(assert start!65466)

(declare-fun b!746041 () Bool)

(declare-fun res!502858 () Bool)

(declare-fun e!416651 () Bool)

(assert (=> b!746041 (=> (not res!502858) (not e!416651))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41639 0))(
  ( (array!41640 (arr!19933 (Array (_ BitVec 32) (_ BitVec 64))) (size!20354 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41639)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!746041 (= res!502858 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20354 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20354 a!3186))))))

(declare-fun b!746042 () Bool)

(declare-fun res!502852 () Bool)

(assert (=> b!746042 (=> (not res!502852) (not e!416651))))

(declare-datatypes ((List!13935 0))(
  ( (Nil!13932) (Cons!13931 (h!15003 (_ BitVec 64)) (t!20250 List!13935)) )
))
(declare-fun arrayNoDuplicates!0 (array!41639 (_ BitVec 32) List!13935) Bool)

(assert (=> b!746042 (= res!502852 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13932))))

(declare-fun b!746043 () Bool)

(declare-fun res!502859 () Bool)

(declare-fun e!416649 () Bool)

(assert (=> b!746043 (=> (not res!502859) (not e!416649))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!746043 (= res!502859 (and (= (size!20354 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20354 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20354 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!746044 () Bool)

(declare-fun e!416647 () Bool)

(declare-fun e!416648 () Bool)

(assert (=> b!746044 (= e!416647 (not e!416648))))

(declare-fun res!502851 () Bool)

(assert (=> b!746044 (=> res!502851 e!416648)))

(declare-datatypes ((SeekEntryResult!7533 0))(
  ( (MissingZero!7533 (index!32500 (_ BitVec 32))) (Found!7533 (index!32501 (_ BitVec 32))) (Intermediate!7533 (undefined!8345 Bool) (index!32502 (_ BitVec 32)) (x!63451 (_ BitVec 32))) (Undefined!7533) (MissingVacant!7533 (index!32503 (_ BitVec 32))) )
))
(declare-fun lt!331501 () SeekEntryResult!7533)

(get-info :version)

(assert (=> b!746044 (= res!502851 (or (not ((_ is Intermediate!7533) lt!331501)) (bvslt x!1131 (x!63451 lt!331501)) (not (= x!1131 (x!63451 lt!331501))) (not (= index!1321 (index!32502 lt!331501)))))))

(declare-fun e!416644 () Bool)

(assert (=> b!746044 e!416644))

(declare-fun res!502856 () Bool)

(assert (=> b!746044 (=> (not res!502856) (not e!416644))))

(declare-fun lt!331502 () SeekEntryResult!7533)

(declare-fun lt!331503 () SeekEntryResult!7533)

(assert (=> b!746044 (= res!502856 (= lt!331502 lt!331503))))

(assert (=> b!746044 (= lt!331503 (Found!7533 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41639 (_ BitVec 32)) SeekEntryResult!7533)

(assert (=> b!746044 (= lt!331502 (seekEntryOrOpen!0 (select (arr!19933 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41639 (_ BitVec 32)) Bool)

(assert (=> b!746044 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25546 0))(
  ( (Unit!25547) )
))
(declare-fun lt!331498 () Unit!25546)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41639 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25546)

(assert (=> b!746044 (= lt!331498 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!746045 () Bool)

(declare-fun res!502854 () Bool)

(declare-fun e!416650 () Bool)

(assert (=> b!746045 (=> (not res!502854) (not e!416650))))

(declare-fun e!416645 () Bool)

(assert (=> b!746045 (= res!502854 e!416645)))

(declare-fun c!81976 () Bool)

(assert (=> b!746045 (= c!81976 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!746046 () Bool)

(declare-fun res!502865 () Bool)

(assert (=> b!746046 (=> (not res!502865) (not e!416649))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!746046 (= res!502865 (validKeyInArray!0 (select (arr!19933 a!3186) j!159)))))

(declare-fun res!502862 () Bool)

(assert (=> start!65466 (=> (not res!502862) (not e!416649))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65466 (= res!502862 (validMask!0 mask!3328))))

(assert (=> start!65466 e!416649))

(assert (=> start!65466 true))

(declare-fun array_inv!15729 (array!41639) Bool)

(assert (=> start!65466 (array_inv!15729 a!3186)))

(declare-fun b!746047 () Bool)

(declare-fun res!502860 () Bool)

(assert (=> b!746047 (=> (not res!502860) (not e!416649))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!746047 (= res!502860 (validKeyInArray!0 k0!2102))))

(declare-fun b!746048 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41639 (_ BitVec 32)) SeekEntryResult!7533)

(assert (=> b!746048 (= e!416644 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19933 a!3186) j!159) a!3186 mask!3328) lt!331503))))

(declare-fun lt!331496 () SeekEntryResult!7533)

(declare-fun b!746049 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41639 (_ BitVec 32)) SeekEntryResult!7533)

(assert (=> b!746049 (= e!416645 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19933 a!3186) j!159) a!3186 mask!3328) lt!331496))))

(declare-fun b!746050 () Bool)

(declare-fun res!502857 () Bool)

(assert (=> b!746050 (=> (not res!502857) (not e!416650))))

(assert (=> b!746050 (= res!502857 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19933 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!746051 () Bool)

(declare-fun e!416643 () Bool)

(assert (=> b!746051 (= e!416643 true)))

(declare-fun lt!331504 () SeekEntryResult!7533)

(assert (=> b!746051 (= lt!331502 lt!331504)))

(declare-fun b!746052 () Bool)

(declare-fun res!502855 () Bool)

(assert (=> b!746052 (=> (not res!502855) (not e!416649))))

(declare-fun arrayContainsKey!0 (array!41639 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!746052 (= res!502855 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!746053 () Bool)

(assert (=> b!746053 (= e!416650 e!416647)))

(declare-fun res!502864 () Bool)

(assert (=> b!746053 (=> (not res!502864) (not e!416647))))

(declare-fun lt!331505 () SeekEntryResult!7533)

(assert (=> b!746053 (= res!502864 (= lt!331505 lt!331501))))

(declare-fun lt!331497 () array!41639)

(declare-fun lt!331500 () (_ BitVec 64))

(assert (=> b!746053 (= lt!331501 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331500 lt!331497 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!746053 (= lt!331505 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331500 mask!3328) lt!331500 lt!331497 mask!3328))))

(assert (=> b!746053 (= lt!331500 (select (store (arr!19933 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!746053 (= lt!331497 (array!41640 (store (arr!19933 a!3186) i!1173 k0!2102) (size!20354 a!3186)))))

(declare-fun b!746054 () Bool)

(declare-fun res!502863 () Bool)

(assert (=> b!746054 (=> (not res!502863) (not e!416651))))

(assert (=> b!746054 (= res!502863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!746055 () Bool)

(assert (=> b!746055 (= e!416648 e!416643)))

(declare-fun res!502850 () Bool)

(assert (=> b!746055 (=> res!502850 e!416643)))

(assert (=> b!746055 (= res!502850 (or (not (= lt!331504 lt!331503)) (= (select (store (arr!19933 a!3186) i!1173 k0!2102) index!1321) lt!331500) (not (= (select (store (arr!19933 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!746055 (= lt!331504 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19933 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!746056 () Bool)

(assert (=> b!746056 (= e!416649 e!416651)))

(declare-fun res!502861 () Bool)

(assert (=> b!746056 (=> (not res!502861) (not e!416651))))

(declare-fun lt!331499 () SeekEntryResult!7533)

(assert (=> b!746056 (= res!502861 (or (= lt!331499 (MissingZero!7533 i!1173)) (= lt!331499 (MissingVacant!7533 i!1173))))))

(assert (=> b!746056 (= lt!331499 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!746057 () Bool)

(assert (=> b!746057 (= e!416645 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19933 a!3186) j!159) a!3186 mask!3328) (Found!7533 j!159)))))

(declare-fun b!746058 () Bool)

(assert (=> b!746058 (= e!416651 e!416650)))

(declare-fun res!502853 () Bool)

(assert (=> b!746058 (=> (not res!502853) (not e!416650))))

(assert (=> b!746058 (= res!502853 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19933 a!3186) j!159) mask!3328) (select (arr!19933 a!3186) j!159) a!3186 mask!3328) lt!331496))))

(assert (=> b!746058 (= lt!331496 (Intermediate!7533 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!65466 res!502862) b!746043))

(assert (= (and b!746043 res!502859) b!746046))

(assert (= (and b!746046 res!502865) b!746047))

(assert (= (and b!746047 res!502860) b!746052))

(assert (= (and b!746052 res!502855) b!746056))

(assert (= (and b!746056 res!502861) b!746054))

(assert (= (and b!746054 res!502863) b!746042))

(assert (= (and b!746042 res!502852) b!746041))

(assert (= (and b!746041 res!502858) b!746058))

(assert (= (and b!746058 res!502853) b!746050))

(assert (= (and b!746050 res!502857) b!746045))

(assert (= (and b!746045 c!81976) b!746049))

(assert (= (and b!746045 (not c!81976)) b!746057))

(assert (= (and b!746045 res!502854) b!746053))

(assert (= (and b!746053 res!502864) b!746044))

(assert (= (and b!746044 res!502856) b!746048))

(assert (= (and b!746044 (not res!502851)) b!746055))

(assert (= (and b!746055 (not res!502850)) b!746051))

(declare-fun m!696343 () Bool)

(assert (=> b!746057 m!696343))

(assert (=> b!746057 m!696343))

(declare-fun m!696345 () Bool)

(assert (=> b!746057 m!696345))

(declare-fun m!696347 () Bool)

(assert (=> b!746056 m!696347))

(assert (=> b!746058 m!696343))

(assert (=> b!746058 m!696343))

(declare-fun m!696349 () Bool)

(assert (=> b!746058 m!696349))

(assert (=> b!746058 m!696349))

(assert (=> b!746058 m!696343))

(declare-fun m!696351 () Bool)

(assert (=> b!746058 m!696351))

(declare-fun m!696353 () Bool)

(assert (=> b!746054 m!696353))

(declare-fun m!696355 () Bool)

(assert (=> b!746047 m!696355))

(declare-fun m!696357 () Bool)

(assert (=> b!746042 m!696357))

(declare-fun m!696359 () Bool)

(assert (=> b!746052 m!696359))

(declare-fun m!696361 () Bool)

(assert (=> start!65466 m!696361))

(declare-fun m!696363 () Bool)

(assert (=> start!65466 m!696363))

(declare-fun m!696365 () Bool)

(assert (=> b!746050 m!696365))

(assert (=> b!746046 m!696343))

(assert (=> b!746046 m!696343))

(declare-fun m!696367 () Bool)

(assert (=> b!746046 m!696367))

(assert (=> b!746044 m!696343))

(assert (=> b!746044 m!696343))

(declare-fun m!696369 () Bool)

(assert (=> b!746044 m!696369))

(declare-fun m!696371 () Bool)

(assert (=> b!746044 m!696371))

(declare-fun m!696373 () Bool)

(assert (=> b!746044 m!696373))

(declare-fun m!696375 () Bool)

(assert (=> b!746053 m!696375))

(declare-fun m!696377 () Bool)

(assert (=> b!746053 m!696377))

(declare-fun m!696379 () Bool)

(assert (=> b!746053 m!696379))

(declare-fun m!696381 () Bool)

(assert (=> b!746053 m!696381))

(declare-fun m!696383 () Bool)

(assert (=> b!746053 m!696383))

(assert (=> b!746053 m!696375))

(assert (=> b!746055 m!696381))

(declare-fun m!696385 () Bool)

(assert (=> b!746055 m!696385))

(assert (=> b!746055 m!696343))

(assert (=> b!746055 m!696343))

(assert (=> b!746055 m!696345))

(assert (=> b!746049 m!696343))

(assert (=> b!746049 m!696343))

(declare-fun m!696387 () Bool)

(assert (=> b!746049 m!696387))

(assert (=> b!746048 m!696343))

(assert (=> b!746048 m!696343))

(declare-fun m!696389 () Bool)

(assert (=> b!746048 m!696389))

(check-sat (not b!746048) (not b!746047) (not b!746055) (not b!746058) (not b!746054) (not b!746052) (not b!746056) (not b!746042) (not b!746046) (not b!746057) (not b!746049) (not start!65466) (not b!746044) (not b!746053))
(check-sat)
