; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65312 () Bool)

(assert start!65312)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!414688 () Bool)

(declare-datatypes ((array!41502 0))(
  ( (array!41503 (arr!19865 (Array (_ BitVec 32) (_ BitVec 64))) (size!20286 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41502)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!742011 () Bool)

(declare-datatypes ((SeekEntryResult!7462 0))(
  ( (MissingZero!7462 (index!32216 (_ BitVec 32))) (Found!7462 (index!32217 (_ BitVec 32))) (Intermediate!7462 (undefined!8274 Bool) (index!32218 (_ BitVec 32)) (x!63199 (_ BitVec 32))) (Undefined!7462) (MissingVacant!7462 (index!32219 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41502 (_ BitVec 32)) SeekEntryResult!7462)

(assert (=> b!742011 (= e!414688 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19865 a!3186) j!159) a!3186 mask!3328) (Found!7462 j!159)))))

(declare-fun b!742012 () Bool)

(declare-fun lt!329503 () SeekEntryResult!7462)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41502 (_ BitVec 32)) SeekEntryResult!7462)

(assert (=> b!742012 (= e!414688 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19865 a!3186) j!159) a!3186 mask!3328) lt!329503))))

(declare-fun b!742013 () Bool)

(declare-fun e!414680 () Bool)

(assert (=> b!742013 (= e!414680 true)))

(declare-fun lt!329500 () SeekEntryResult!7462)

(assert (=> b!742013 (= lt!329500 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19865 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!499373 () Bool)

(declare-fun e!414684 () Bool)

(assert (=> start!65312 (=> (not res!499373) (not e!414684))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65312 (= res!499373 (validMask!0 mask!3328))))

(assert (=> start!65312 e!414684))

(assert (=> start!65312 true))

(declare-fun array_inv!15748 (array!41502) Bool)

(assert (=> start!65312 (array_inv!15748 a!3186)))

(declare-fun b!742014 () Bool)

(declare-fun e!414681 () Bool)

(declare-fun e!414682 () Bool)

(assert (=> b!742014 (= e!414681 e!414682)))

(declare-fun res!499367 () Bool)

(assert (=> b!742014 (=> (not res!499367) (not e!414682))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!742014 (= res!499367 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19865 a!3186) j!159) mask!3328) (select (arr!19865 a!3186) j!159) a!3186 mask!3328) lt!329503))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!742014 (= lt!329503 (Intermediate!7462 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!742015 () Bool)

(declare-fun e!414686 () Bool)

(declare-fun lt!329498 () SeekEntryResult!7462)

(assert (=> b!742015 (= e!414686 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19865 a!3186) j!159) a!3186 mask!3328) lt!329498))))

(declare-fun b!742016 () Bool)

(assert (=> b!742016 (= e!414684 e!414681)))

(declare-fun res!499366 () Bool)

(assert (=> b!742016 (=> (not res!499366) (not e!414681))))

(declare-fun lt!329496 () SeekEntryResult!7462)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!742016 (= res!499366 (or (= lt!329496 (MissingZero!7462 i!1173)) (= lt!329496 (MissingVacant!7462 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41502 (_ BitVec 32)) SeekEntryResult!7462)

(assert (=> b!742016 (= lt!329496 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!742017 () Bool)

(declare-fun res!499372 () Bool)

(assert (=> b!742017 (=> (not res!499372) (not e!414682))))

(assert (=> b!742017 (= res!499372 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19865 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!742018 () Bool)

(declare-fun res!499368 () Bool)

(assert (=> b!742018 (=> (not res!499368) (not e!414684))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!742018 (= res!499368 (validKeyInArray!0 (select (arr!19865 a!3186) j!159)))))

(declare-fun b!742019 () Bool)

(declare-fun e!414683 () Bool)

(assert (=> b!742019 (= e!414683 (not e!414680))))

(declare-fun res!499364 () Bool)

(assert (=> b!742019 (=> res!499364 e!414680)))

(declare-fun lt!329499 () SeekEntryResult!7462)

(get-info :version)

(assert (=> b!742019 (= res!499364 (or (not ((_ is Intermediate!7462) lt!329499)) (bvslt x!1131 (x!63199 lt!329499)) (not (= x!1131 (x!63199 lt!329499))) (not (= index!1321 (index!32218 lt!329499)))))))

(declare-fun e!414685 () Bool)

(assert (=> b!742019 e!414685))

(declare-fun res!499371 () Bool)

(assert (=> b!742019 (=> (not res!499371) (not e!414685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41502 (_ BitVec 32)) Bool)

(assert (=> b!742019 (= res!499371 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25376 0))(
  ( (Unit!25377) )
))
(declare-fun lt!329501 () Unit!25376)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41502 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25376)

(assert (=> b!742019 (= lt!329501 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!742020 () Bool)

(declare-fun res!499377 () Bool)

(assert (=> b!742020 (=> (not res!499377) (not e!414684))))

(declare-fun arrayContainsKey!0 (array!41502 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!742020 (= res!499377 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!742021 () Bool)

(declare-fun res!499365 () Bool)

(assert (=> b!742021 (=> (not res!499365) (not e!414681))))

(assert (=> b!742021 (= res!499365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!742022 () Bool)

(declare-fun res!499370 () Bool)

(assert (=> b!742022 (=> (not res!499370) (not e!414682))))

(assert (=> b!742022 (= res!499370 e!414688)))

(declare-fun c!81705 () Bool)

(assert (=> b!742022 (= c!81705 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!742023 () Bool)

(assert (=> b!742023 (= e!414685 e!414686)))

(declare-fun res!499376 () Bool)

(assert (=> b!742023 (=> (not res!499376) (not e!414686))))

(assert (=> b!742023 (= res!499376 (= (seekEntryOrOpen!0 (select (arr!19865 a!3186) j!159) a!3186 mask!3328) lt!329498))))

(assert (=> b!742023 (= lt!329498 (Found!7462 j!159))))

(declare-fun b!742024 () Bool)

(declare-fun res!499363 () Bool)

(assert (=> b!742024 (=> (not res!499363) (not e!414684))))

(assert (=> b!742024 (= res!499363 (and (= (size!20286 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20286 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20286 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!742025 () Bool)

(declare-fun res!499375 () Bool)

(assert (=> b!742025 (=> (not res!499375) (not e!414681))))

(assert (=> b!742025 (= res!499375 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20286 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20286 a!3186))))))

(declare-fun b!742026 () Bool)

(declare-fun res!499362 () Bool)

(assert (=> b!742026 (=> (not res!499362) (not e!414681))))

(declare-datatypes ((List!13906 0))(
  ( (Nil!13903) (Cons!13902 (h!14974 (_ BitVec 64)) (t!20212 List!13906)) )
))
(declare-fun arrayNoDuplicates!0 (array!41502 (_ BitVec 32) List!13906) Bool)

(assert (=> b!742026 (= res!499362 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13903))))

(declare-fun b!742027 () Bool)

(declare-fun res!499369 () Bool)

(assert (=> b!742027 (=> (not res!499369) (not e!414684))))

(assert (=> b!742027 (= res!499369 (validKeyInArray!0 k0!2102))))

(declare-fun b!742028 () Bool)

(assert (=> b!742028 (= e!414682 e!414683)))

(declare-fun res!499374 () Bool)

(assert (=> b!742028 (=> (not res!499374) (not e!414683))))

(declare-fun lt!329504 () SeekEntryResult!7462)

(assert (=> b!742028 (= res!499374 (= lt!329504 lt!329499))))

(declare-fun lt!329497 () (_ BitVec 64))

(declare-fun lt!329502 () array!41502)

(assert (=> b!742028 (= lt!329499 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329497 lt!329502 mask!3328))))

(assert (=> b!742028 (= lt!329504 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329497 mask!3328) lt!329497 lt!329502 mask!3328))))

(assert (=> b!742028 (= lt!329497 (select (store (arr!19865 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!742028 (= lt!329502 (array!41503 (store (arr!19865 a!3186) i!1173 k0!2102) (size!20286 a!3186)))))

(assert (= (and start!65312 res!499373) b!742024))

(assert (= (and b!742024 res!499363) b!742018))

(assert (= (and b!742018 res!499368) b!742027))

(assert (= (and b!742027 res!499369) b!742020))

(assert (= (and b!742020 res!499377) b!742016))

(assert (= (and b!742016 res!499366) b!742021))

(assert (= (and b!742021 res!499365) b!742026))

(assert (= (and b!742026 res!499362) b!742025))

(assert (= (and b!742025 res!499375) b!742014))

(assert (= (and b!742014 res!499367) b!742017))

(assert (= (and b!742017 res!499372) b!742022))

(assert (= (and b!742022 c!81705) b!742012))

(assert (= (and b!742022 (not c!81705)) b!742011))

(assert (= (and b!742022 res!499370) b!742028))

(assert (= (and b!742028 res!499374) b!742019))

(assert (= (and b!742019 res!499371) b!742023))

(assert (= (and b!742023 res!499376) b!742015))

(assert (= (and b!742019 (not res!499364)) b!742013))

(declare-fun m!692393 () Bool)

(assert (=> b!742021 m!692393))

(declare-fun m!692395 () Bool)

(assert (=> b!742028 m!692395))

(assert (=> b!742028 m!692395))

(declare-fun m!692397 () Bool)

(assert (=> b!742028 m!692397))

(declare-fun m!692399 () Bool)

(assert (=> b!742028 m!692399))

(declare-fun m!692401 () Bool)

(assert (=> b!742028 m!692401))

(declare-fun m!692403 () Bool)

(assert (=> b!742028 m!692403))

(declare-fun m!692405 () Bool)

(assert (=> b!742014 m!692405))

(assert (=> b!742014 m!692405))

(declare-fun m!692407 () Bool)

(assert (=> b!742014 m!692407))

(assert (=> b!742014 m!692407))

(assert (=> b!742014 m!692405))

(declare-fun m!692409 () Bool)

(assert (=> b!742014 m!692409))

(declare-fun m!692411 () Bool)

(assert (=> b!742017 m!692411))

(assert (=> b!742013 m!692405))

(assert (=> b!742013 m!692405))

(declare-fun m!692413 () Bool)

(assert (=> b!742013 m!692413))

(assert (=> b!742018 m!692405))

(assert (=> b!742018 m!692405))

(declare-fun m!692415 () Bool)

(assert (=> b!742018 m!692415))

(declare-fun m!692417 () Bool)

(assert (=> b!742027 m!692417))

(declare-fun m!692419 () Bool)

(assert (=> b!742026 m!692419))

(declare-fun m!692421 () Bool)

(assert (=> start!65312 m!692421))

(declare-fun m!692423 () Bool)

(assert (=> start!65312 m!692423))

(assert (=> b!742015 m!692405))

(assert (=> b!742015 m!692405))

(declare-fun m!692425 () Bool)

(assert (=> b!742015 m!692425))

(assert (=> b!742012 m!692405))

(assert (=> b!742012 m!692405))

(declare-fun m!692427 () Bool)

(assert (=> b!742012 m!692427))

(declare-fun m!692429 () Bool)

(assert (=> b!742019 m!692429))

(declare-fun m!692431 () Bool)

(assert (=> b!742019 m!692431))

(assert (=> b!742023 m!692405))

(assert (=> b!742023 m!692405))

(declare-fun m!692433 () Bool)

(assert (=> b!742023 m!692433))

(declare-fun m!692435 () Bool)

(assert (=> b!742020 m!692435))

(declare-fun m!692437 () Bool)

(assert (=> b!742016 m!692437))

(assert (=> b!742011 m!692405))

(assert (=> b!742011 m!692405))

(assert (=> b!742011 m!692413))

(check-sat (not b!742011) (not start!65312) (not b!742014) (not b!742015) (not b!742013) (not b!742026) (not b!742016) (not b!742021) (not b!742018) (not b!742012) (not b!742027) (not b!742020) (not b!742028) (not b!742023) (not b!742019))
(check-sat)
