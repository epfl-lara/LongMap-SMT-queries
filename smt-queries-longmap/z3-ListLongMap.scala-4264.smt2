; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59312 () Bool)

(assert start!59312)

(declare-fun b!653948 () Bool)

(declare-fun e!375496 () Bool)

(declare-fun e!375499 () Bool)

(assert (=> b!653948 (= e!375496 e!375499)))

(declare-fun res!424182 () Bool)

(assert (=> b!653948 (=> res!424182 e!375499)))

(declare-fun lt!304451 () (_ BitVec 64))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!304442 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38643 0))(
  ( (array!38644 (arr!18521 (Array (_ BitVec 32) (_ BitVec 64))) (size!18886 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38643)

(assert (=> b!653948 (= res!424182 (or (not (= (select (arr!18521 a!2986) j!136) lt!304442)) (not (= (select (arr!18521 a!2986) j!136) lt!304451)) (bvsge j!136 index!984)))))

(declare-fun b!653949 () Bool)

(declare-fun res!424181 () Bool)

(declare-fun e!375500 () Bool)

(assert (=> b!653949 (=> (not res!424181) (not e!375500))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!653949 (= res!424181 (validKeyInArray!0 k0!1786))))

(declare-fun b!653950 () Bool)

(declare-fun e!375497 () Bool)

(declare-fun e!375502 () Bool)

(assert (=> b!653950 (= e!375497 (not e!375502))))

(declare-fun res!424188 () Bool)

(assert (=> b!653950 (=> res!424188 e!375502)))

(declare-datatypes ((SeekEntryResult!6958 0))(
  ( (MissingZero!6958 (index!30191 (_ BitVec 32))) (Found!6958 (index!30192 (_ BitVec 32))) (Intermediate!6958 (undefined!7770 Bool) (index!30193 (_ BitVec 32)) (x!58994 (_ BitVec 32))) (Undefined!6958) (MissingVacant!6958 (index!30194 (_ BitVec 32))) )
))
(declare-fun lt!304441 () SeekEntryResult!6958)

(assert (=> b!653950 (= res!424188 (not (= lt!304441 (Found!6958 index!984))))))

(declare-datatypes ((Unit!22376 0))(
  ( (Unit!22377) )
))
(declare-fun lt!304448 () Unit!22376)

(declare-fun e!375492 () Unit!22376)

(assert (=> b!653950 (= lt!304448 e!375492)))

(declare-fun c!75251 () Bool)

(assert (=> b!653950 (= c!75251 (= lt!304441 Undefined!6958))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!304445 () array!38643)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38643 (_ BitVec 32)) SeekEntryResult!6958)

(assert (=> b!653950 (= lt!304441 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!304442 lt!304445 mask!3053))))

(declare-fun e!375501 () Bool)

(assert (=> b!653950 e!375501))

(declare-fun res!424196 () Bool)

(assert (=> b!653950 (=> (not res!424196) (not e!375501))))

(declare-fun lt!304440 () (_ BitVec 32))

(declare-fun lt!304437 () SeekEntryResult!6958)

(assert (=> b!653950 (= res!424196 (= lt!304437 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304440 vacantSpotIndex!68 lt!304442 lt!304445 mask!3053)))))

(assert (=> b!653950 (= lt!304437 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304440 vacantSpotIndex!68 (select (arr!18521 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!653950 (= lt!304442 (select (store (arr!18521 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!304439 () Unit!22376)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38643 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22376)

(assert (=> b!653950 (= lt!304439 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!304440 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!653950 (= lt!304440 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!653951 () Bool)

(declare-fun e!375494 () Bool)

(assert (=> b!653951 (= e!375502 e!375494)))

(declare-fun res!424190 () Bool)

(assert (=> b!653951 (=> res!424190 e!375494)))

(assert (=> b!653951 (= res!424190 (or (not (= (select (arr!18521 a!2986) j!136) lt!304442)) (not (= (select (arr!18521 a!2986) j!136) lt!304451))))))

(assert (=> b!653951 e!375496))

(declare-fun res!424187 () Bool)

(assert (=> b!653951 (=> (not res!424187) (not e!375496))))

(assert (=> b!653951 (= res!424187 (= lt!304451 (select (arr!18521 a!2986) j!136)))))

(assert (=> b!653951 (= lt!304451 (select (store (arr!18521 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!653952 () Bool)

(declare-fun e!375506 () Bool)

(assert (=> b!653952 (= e!375506 true)))

(assert (=> b!653952 false))

(declare-fun lt!304447 () Unit!22376)

(declare-datatypes ((List!12601 0))(
  ( (Nil!12598) (Cons!12597 (h!13642 (_ BitVec 64)) (t!18820 List!12601)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38643 (_ BitVec 64) (_ BitVec 32) List!12601) Unit!22376)

(assert (=> b!653952 (= lt!304447 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!304445 (select (arr!18521 a!2986) j!136) index!984 Nil!12598))))

(declare-fun arrayNoDuplicates!0 (array!38643 (_ BitVec 32) List!12601) Bool)

(assert (=> b!653952 (arrayNoDuplicates!0 lt!304445 index!984 Nil!12598)))

(declare-fun lt!304450 () Unit!22376)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38643 (_ BitVec 32) (_ BitVec 32)) Unit!22376)

(assert (=> b!653952 (= lt!304450 (lemmaNoDuplicateFromThenFromBigger!0 lt!304445 #b00000000000000000000000000000000 index!984))))

(assert (=> b!653952 (arrayNoDuplicates!0 lt!304445 #b00000000000000000000000000000000 Nil!12598)))

(declare-fun lt!304436 () Unit!22376)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38643 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12601) Unit!22376)

(assert (=> b!653952 (= lt!304436 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12598))))

(declare-fun arrayContainsKey!0 (array!38643 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!653952 (arrayContainsKey!0 lt!304445 (select (arr!18521 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!304438 () Unit!22376)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38643 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22376)

(assert (=> b!653952 (= lt!304438 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304445 (select (arr!18521 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!375505 () Bool)

(assert (=> b!653952 e!375505))

(declare-fun res!424185 () Bool)

(assert (=> b!653952 (=> (not res!424185) (not e!375505))))

(assert (=> b!653952 (= res!424185 (arrayContainsKey!0 lt!304445 (select (arr!18521 a!2986) j!136) j!136))))

(declare-fun b!653953 () Bool)

(declare-fun res!424193 () Bool)

(declare-fun e!375493 () Bool)

(assert (=> b!653953 (=> (not res!424193) (not e!375493))))

(assert (=> b!653953 (= res!424193 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12598))))

(declare-fun b!653954 () Bool)

(declare-fun res!424189 () Bool)

(assert (=> b!653954 (=> (not res!424189) (not e!375500))))

(assert (=> b!653954 (= res!424189 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!653955 () Bool)

(declare-fun Unit!22378 () Unit!22376)

(assert (=> b!653955 (= e!375492 Unit!22378)))

(assert (=> b!653955 false))

(declare-fun b!653956 () Bool)

(assert (=> b!653956 (= e!375494 e!375506)))

(declare-fun res!424192 () Bool)

(assert (=> b!653956 (=> res!424192 e!375506)))

(assert (=> b!653956 (= res!424192 (bvsge index!984 j!136))))

(declare-fun lt!304434 () Unit!22376)

(declare-fun e!375503 () Unit!22376)

(assert (=> b!653956 (= lt!304434 e!375503)))

(declare-fun c!75252 () Bool)

(assert (=> b!653956 (= c!75252 (bvslt j!136 index!984))))

(declare-fun b!653957 () Bool)

(declare-fun Unit!22379 () Unit!22376)

(assert (=> b!653957 (= e!375503 Unit!22379)))

(declare-fun e!375498 () Bool)

(declare-fun b!653958 () Bool)

(assert (=> b!653958 (= e!375498 (arrayContainsKey!0 lt!304445 (select (arr!18521 a!2986) j!136) index!984))))

(declare-fun b!653959 () Bool)

(assert (=> b!653959 (= e!375505 (arrayContainsKey!0 lt!304445 (select (arr!18521 a!2986) j!136) index!984))))

(declare-fun b!653960 () Bool)

(declare-fun Unit!22380 () Unit!22376)

(assert (=> b!653960 (= e!375492 Unit!22380)))

(declare-fun b!653961 () Bool)

(declare-fun res!424195 () Bool)

(assert (=> b!653961 (=> (not res!424195) (not e!375493))))

(assert (=> b!653961 (= res!424195 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18521 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!424186 () Bool)

(assert (=> start!59312 (=> (not res!424186) (not e!375500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59312 (= res!424186 (validMask!0 mask!3053))))

(assert (=> start!59312 e!375500))

(assert (=> start!59312 true))

(declare-fun array_inv!14404 (array!38643) Bool)

(assert (=> start!59312 (array_inv!14404 a!2986)))

(declare-fun b!653962 () Bool)

(declare-fun res!424194 () Bool)

(assert (=> b!653962 (=> (not res!424194) (not e!375500))))

(assert (=> b!653962 (= res!424194 (and (= (size!18886 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18886 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18886 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!653963 () Bool)

(declare-fun e!375504 () Bool)

(assert (=> b!653963 (= e!375493 e!375504)))

(declare-fun res!424197 () Bool)

(assert (=> b!653963 (=> (not res!424197) (not e!375504))))

(assert (=> b!653963 (= res!424197 (= (select (store (arr!18521 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!653963 (= lt!304445 (array!38644 (store (arr!18521 a!2986) i!1108 k0!1786) (size!18886 a!2986)))))

(declare-fun b!653964 () Bool)

(declare-fun res!424198 () Bool)

(assert (=> b!653964 (=> (not res!424198) (not e!375493))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38643 (_ BitVec 32)) Bool)

(assert (=> b!653964 (= res!424198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!653965 () Bool)

(assert (=> b!653965 (= e!375504 e!375497)))

(declare-fun res!424183 () Bool)

(assert (=> b!653965 (=> (not res!424183) (not e!375497))))

(declare-fun lt!304452 () SeekEntryResult!6958)

(assert (=> b!653965 (= res!424183 (and (= lt!304452 (Found!6958 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18521 a!2986) index!984) (select (arr!18521 a!2986) j!136))) (not (= (select (arr!18521 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!653965 (= lt!304452 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18521 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!653966 () Bool)

(assert (=> b!653966 (= e!375501 (= lt!304452 lt!304437))))

(declare-fun b!653967 () Bool)

(assert (=> b!653967 (= e!375499 e!375498)))

(declare-fun res!424184 () Bool)

(assert (=> b!653967 (=> (not res!424184) (not e!375498))))

(assert (=> b!653967 (= res!424184 (arrayContainsKey!0 lt!304445 (select (arr!18521 a!2986) j!136) j!136))))

(declare-fun b!653968 () Bool)

(declare-fun Unit!22381 () Unit!22376)

(assert (=> b!653968 (= e!375503 Unit!22381)))

(declare-fun lt!304446 () Unit!22376)

(assert (=> b!653968 (= lt!304446 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304445 (select (arr!18521 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!653968 (arrayContainsKey!0 lt!304445 (select (arr!18521 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!304449 () Unit!22376)

(assert (=> b!653968 (= lt!304449 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12598))))

(assert (=> b!653968 (arrayNoDuplicates!0 lt!304445 #b00000000000000000000000000000000 Nil!12598)))

(declare-fun lt!304444 () Unit!22376)

(assert (=> b!653968 (= lt!304444 (lemmaNoDuplicateFromThenFromBigger!0 lt!304445 #b00000000000000000000000000000000 j!136))))

(assert (=> b!653968 (arrayNoDuplicates!0 lt!304445 j!136 Nil!12598)))

(declare-fun lt!304435 () Unit!22376)

(assert (=> b!653968 (= lt!304435 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!304445 (select (arr!18521 a!2986) j!136) j!136 Nil!12598))))

(assert (=> b!653968 false))

(declare-fun b!653969 () Bool)

(assert (=> b!653969 (= e!375500 e!375493)))

(declare-fun res!424180 () Bool)

(assert (=> b!653969 (=> (not res!424180) (not e!375493))))

(declare-fun lt!304443 () SeekEntryResult!6958)

(assert (=> b!653969 (= res!424180 (or (= lt!304443 (MissingZero!6958 i!1108)) (= lt!304443 (MissingVacant!6958 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38643 (_ BitVec 32)) SeekEntryResult!6958)

(assert (=> b!653969 (= lt!304443 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!653970 () Bool)

(declare-fun res!424191 () Bool)

(assert (=> b!653970 (=> (not res!424191) (not e!375500))))

(assert (=> b!653970 (= res!424191 (validKeyInArray!0 (select (arr!18521 a!2986) j!136)))))

(assert (= (and start!59312 res!424186) b!653962))

(assert (= (and b!653962 res!424194) b!653970))

(assert (= (and b!653970 res!424191) b!653949))

(assert (= (and b!653949 res!424181) b!653954))

(assert (= (and b!653954 res!424189) b!653969))

(assert (= (and b!653969 res!424180) b!653964))

(assert (= (and b!653964 res!424198) b!653953))

(assert (= (and b!653953 res!424193) b!653961))

(assert (= (and b!653961 res!424195) b!653963))

(assert (= (and b!653963 res!424197) b!653965))

(assert (= (and b!653965 res!424183) b!653950))

(assert (= (and b!653950 res!424196) b!653966))

(assert (= (and b!653950 c!75251) b!653955))

(assert (= (and b!653950 (not c!75251)) b!653960))

(assert (= (and b!653950 (not res!424188)) b!653951))

(assert (= (and b!653951 res!424187) b!653948))

(assert (= (and b!653948 (not res!424182)) b!653967))

(assert (= (and b!653967 res!424184) b!653958))

(assert (= (and b!653951 (not res!424190)) b!653956))

(assert (= (and b!653956 c!75252) b!653968))

(assert (= (and b!653956 (not c!75252)) b!653957))

(assert (= (and b!653956 (not res!424192)) b!653952))

(assert (= (and b!653952 res!424185) b!653959))

(declare-fun m!626565 () Bool)

(assert (=> b!653952 m!626565))

(assert (=> b!653952 m!626565))

(declare-fun m!626567 () Bool)

(assert (=> b!653952 m!626567))

(assert (=> b!653952 m!626565))

(declare-fun m!626569 () Bool)

(assert (=> b!653952 m!626569))

(declare-fun m!626571 () Bool)

(assert (=> b!653952 m!626571))

(declare-fun m!626573 () Bool)

(assert (=> b!653952 m!626573))

(declare-fun m!626575 () Bool)

(assert (=> b!653952 m!626575))

(declare-fun m!626577 () Bool)

(assert (=> b!653952 m!626577))

(assert (=> b!653952 m!626565))

(declare-fun m!626579 () Bool)

(assert (=> b!653952 m!626579))

(assert (=> b!653952 m!626565))

(declare-fun m!626581 () Bool)

(assert (=> b!653952 m!626581))

(declare-fun m!626583 () Bool)

(assert (=> b!653969 m!626583))

(declare-fun m!626585 () Bool)

(assert (=> b!653954 m!626585))

(declare-fun m!626587 () Bool)

(assert (=> b!653961 m!626587))

(declare-fun m!626589 () Bool)

(assert (=> b!653964 m!626589))

(declare-fun m!626591 () Bool)

(assert (=> b!653953 m!626591))

(assert (=> b!653958 m!626565))

(assert (=> b!653958 m!626565))

(declare-fun m!626593 () Bool)

(assert (=> b!653958 m!626593))

(declare-fun m!626595 () Bool)

(assert (=> b!653949 m!626595))

(assert (=> b!653959 m!626565))

(assert (=> b!653959 m!626565))

(assert (=> b!653959 m!626593))

(assert (=> b!653970 m!626565))

(assert (=> b!653970 m!626565))

(declare-fun m!626597 () Bool)

(assert (=> b!653970 m!626597))

(assert (=> b!653948 m!626565))

(declare-fun m!626599 () Bool)

(assert (=> b!653965 m!626599))

(assert (=> b!653965 m!626565))

(assert (=> b!653965 m!626565))

(declare-fun m!626601 () Bool)

(assert (=> b!653965 m!626601))

(declare-fun m!626603 () Bool)

(assert (=> start!59312 m!626603))

(declare-fun m!626605 () Bool)

(assert (=> start!59312 m!626605))

(assert (=> b!653951 m!626565))

(declare-fun m!626607 () Bool)

(assert (=> b!653951 m!626607))

(declare-fun m!626609 () Bool)

(assert (=> b!653951 m!626609))

(assert (=> b!653967 m!626565))

(assert (=> b!653967 m!626565))

(assert (=> b!653967 m!626579))

(assert (=> b!653968 m!626565))

(assert (=> b!653968 m!626565))

(declare-fun m!626611 () Bool)

(assert (=> b!653968 m!626611))

(assert (=> b!653968 m!626565))

(declare-fun m!626613 () Bool)

(assert (=> b!653968 m!626613))

(declare-fun m!626615 () Bool)

(assert (=> b!653968 m!626615))

(assert (=> b!653968 m!626573))

(assert (=> b!653968 m!626577))

(assert (=> b!653968 m!626565))

(declare-fun m!626617 () Bool)

(assert (=> b!653968 m!626617))

(declare-fun m!626619 () Bool)

(assert (=> b!653968 m!626619))

(assert (=> b!653963 m!626607))

(declare-fun m!626621 () Bool)

(assert (=> b!653963 m!626621))

(declare-fun m!626623 () Bool)

(assert (=> b!653950 m!626623))

(declare-fun m!626625 () Bool)

(assert (=> b!653950 m!626625))

(assert (=> b!653950 m!626565))

(assert (=> b!653950 m!626607))

(declare-fun m!626627 () Bool)

(assert (=> b!653950 m!626627))

(declare-fun m!626629 () Bool)

(assert (=> b!653950 m!626629))

(declare-fun m!626631 () Bool)

(assert (=> b!653950 m!626631))

(assert (=> b!653950 m!626565))

(declare-fun m!626633 () Bool)

(assert (=> b!653950 m!626633))

(check-sat (not b!653954) (not b!653952) (not b!653970) (not b!653969) (not b!653964) (not b!653949) (not b!653950) (not b!653959) (not b!653953) (not b!653967) (not b!653965) (not b!653958) (not b!653968) (not start!59312))
(check-sat)
