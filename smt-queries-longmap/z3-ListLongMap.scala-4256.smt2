; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59148 () Bool)

(assert start!59148)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!374159 () Bool)

(declare-datatypes ((array!38586 0))(
  ( (array!38587 (arr!18493 (Array (_ BitVec 32) (_ BitVec 64))) (size!18857 (_ BitVec 32))) )
))
(declare-fun lt!303181 () array!38586)

(declare-fun b!651966 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38586)

(declare-fun arrayContainsKey!0 (array!38586 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!651966 (= e!374159 (arrayContainsKey!0 lt!303181 (select (arr!18493 a!2986) j!136) index!984))))

(declare-fun b!651967 () Bool)

(declare-fun res!422657 () Bool)

(declare-fun e!374162 () Bool)

(assert (=> b!651967 (=> (not res!422657) (not e!374162))))

(declare-datatypes ((List!12441 0))(
  ( (Nil!12438) (Cons!12437 (h!13485 (_ BitVec 64)) (t!18661 List!12441)) )
))
(declare-fun arrayNoDuplicates!0 (array!38586 (_ BitVec 32) List!12441) Bool)

(assert (=> b!651967 (= res!422657 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12438))))

(declare-fun b!651968 () Bool)

(declare-fun e!374172 () Bool)

(assert (=> b!651968 (= e!374172 e!374162)))

(declare-fun res!422662 () Bool)

(assert (=> b!651968 (=> (not res!422662) (not e!374162))))

(declare-datatypes ((SeekEntryResult!6889 0))(
  ( (MissingZero!6889 (index!29909 (_ BitVec 32))) (Found!6889 (index!29910 (_ BitVec 32))) (Intermediate!6889 (undefined!7701 Bool) (index!29911 (_ BitVec 32)) (x!58851 (_ BitVec 32))) (Undefined!6889) (MissingVacant!6889 (index!29912 (_ BitVec 32))) )
))
(declare-fun lt!303167 () SeekEntryResult!6889)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!651968 (= res!422662 (or (= lt!303167 (MissingZero!6889 i!1108)) (= lt!303167 (MissingVacant!6889 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38586 (_ BitVec 32)) SeekEntryResult!6889)

(assert (=> b!651968 (= lt!303167 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!651969 () Bool)

(declare-datatypes ((Unit!22233 0))(
  ( (Unit!22234) )
))
(declare-fun e!374168 () Unit!22233)

(declare-fun Unit!22235 () Unit!22233)

(assert (=> b!651969 (= e!374168 Unit!22235)))

(assert (=> b!651969 false))

(declare-fun b!651970 () Bool)

(declare-fun e!374165 () Bool)

(assert (=> b!651970 (= e!374165 true)))

(assert (=> b!651970 (arrayNoDuplicates!0 lt!303181 index!984 Nil!12438)))

(declare-fun lt!303175 () Unit!22233)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38586 (_ BitVec 32) (_ BitVec 32)) Unit!22233)

(assert (=> b!651970 (= lt!303175 (lemmaNoDuplicateFromThenFromBigger!0 lt!303181 #b00000000000000000000000000000000 index!984))))

(assert (=> b!651970 (arrayNoDuplicates!0 lt!303181 #b00000000000000000000000000000000 Nil!12438)))

(declare-fun lt!303164 () Unit!22233)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38586 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12441) Unit!22233)

(assert (=> b!651970 (= lt!303164 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12438))))

(assert (=> b!651970 (arrayContainsKey!0 lt!303181 (select (arr!18493 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!303176 () Unit!22233)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38586 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22233)

(assert (=> b!651970 (= lt!303176 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303181 (select (arr!18493 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!651970 e!374159))

(declare-fun res!422656 () Bool)

(assert (=> b!651970 (=> (not res!422656) (not e!374159))))

(assert (=> b!651970 (= res!422656 (arrayContainsKey!0 lt!303181 (select (arr!18493 a!2986) j!136) j!136))))

(declare-fun b!651971 () Bool)

(declare-fun e!374166 () Bool)

(assert (=> b!651971 (= e!374162 e!374166)))

(declare-fun res!422663 () Bool)

(assert (=> b!651971 (=> (not res!422663) (not e!374166))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!651971 (= res!422663 (= (select (store (arr!18493 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!651971 (= lt!303181 (array!38587 (store (arr!18493 a!2986) i!1108 k0!1786) (size!18857 a!2986)))))

(declare-fun b!651972 () Bool)

(declare-fun e!374164 () Bool)

(declare-fun e!374167 () Bool)

(assert (=> b!651972 (= e!374164 e!374167)))

(declare-fun res!422664 () Bool)

(assert (=> b!651972 (=> res!422664 e!374167)))

(declare-fun lt!303168 () (_ BitVec 64))

(declare-fun lt!303178 () (_ BitVec 64))

(assert (=> b!651972 (= res!422664 (or (not (= (select (arr!18493 a!2986) j!136) lt!303168)) (not (= (select (arr!18493 a!2986) j!136) lt!303178))))))

(declare-fun e!374160 () Bool)

(assert (=> b!651972 e!374160))

(declare-fun res!422648 () Bool)

(assert (=> b!651972 (=> (not res!422648) (not e!374160))))

(assert (=> b!651972 (= res!422648 (= lt!303178 (select (arr!18493 a!2986) j!136)))))

(assert (=> b!651972 (= lt!303178 (select (store (arr!18493 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!651973 () Bool)

(declare-fun res!422652 () Bool)

(assert (=> b!651973 (=> (not res!422652) (not e!374172))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!651973 (= res!422652 (validKeyInArray!0 k0!1786))))

(declare-fun b!651974 () Bool)

(assert (=> b!651974 (= e!374167 e!374165)))

(declare-fun res!422654 () Bool)

(assert (=> b!651974 (=> res!422654 e!374165)))

(assert (=> b!651974 (= res!422654 (bvsge index!984 j!136))))

(declare-fun lt!303165 () Unit!22233)

(declare-fun e!374161 () Unit!22233)

(assert (=> b!651974 (= lt!303165 e!374161)))

(declare-fun c!75028 () Bool)

(assert (=> b!651974 (= c!75028 (bvslt j!136 index!984))))

(declare-fun res!422649 () Bool)

(assert (=> start!59148 (=> (not res!422649) (not e!374172))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59148 (= res!422649 (validMask!0 mask!3053))))

(assert (=> start!59148 e!374172))

(assert (=> start!59148 true))

(declare-fun array_inv!14352 (array!38586) Bool)

(assert (=> start!59148 (array_inv!14352 a!2986)))

(declare-fun b!651975 () Bool)

(declare-fun Unit!22236 () Unit!22233)

(assert (=> b!651975 (= e!374161 Unit!22236)))

(declare-fun b!651976 () Bool)

(declare-fun e!374169 () Bool)

(declare-fun e!374171 () Bool)

(assert (=> b!651976 (= e!374169 e!374171)))

(declare-fun res!422653 () Bool)

(assert (=> b!651976 (=> (not res!422653) (not e!374171))))

(assert (=> b!651976 (= res!422653 (arrayContainsKey!0 lt!303181 (select (arr!18493 a!2986) j!136) j!136))))

(declare-fun b!651977 () Bool)

(declare-fun res!422647 () Bool)

(assert (=> b!651977 (=> (not res!422647) (not e!374162))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!651977 (= res!422647 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18493 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!651978 () Bool)

(declare-fun Unit!22237 () Unit!22233)

(assert (=> b!651978 (= e!374161 Unit!22237)))

(declare-fun lt!303180 () Unit!22233)

(assert (=> b!651978 (= lt!303180 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303181 (select (arr!18493 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!651978 (arrayContainsKey!0 lt!303181 (select (arr!18493 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!303170 () Unit!22233)

(assert (=> b!651978 (= lt!303170 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12438))))

(assert (=> b!651978 (arrayNoDuplicates!0 lt!303181 #b00000000000000000000000000000000 Nil!12438)))

(declare-fun lt!303172 () Unit!22233)

(assert (=> b!651978 (= lt!303172 (lemmaNoDuplicateFromThenFromBigger!0 lt!303181 #b00000000000000000000000000000000 j!136))))

(assert (=> b!651978 (arrayNoDuplicates!0 lt!303181 j!136 Nil!12438)))

(declare-fun lt!303169 () Unit!22233)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38586 (_ BitVec 64) (_ BitVec 32) List!12441) Unit!22233)

(assert (=> b!651978 (= lt!303169 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!303181 (select (arr!18493 a!2986) j!136) j!136 Nil!12438))))

(assert (=> b!651978 false))

(declare-fun b!651979 () Bool)

(declare-fun res!422661 () Bool)

(assert (=> b!651979 (=> (not res!422661) (not e!374172))))

(assert (=> b!651979 (= res!422661 (and (= (size!18857 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18857 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18857 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!651980 () Bool)

(declare-fun res!422650 () Bool)

(assert (=> b!651980 (=> (not res!422650) (not e!374162))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38586 (_ BitVec 32)) Bool)

(assert (=> b!651980 (= res!422650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!651981 () Bool)

(declare-fun res!422655 () Bool)

(assert (=> b!651981 (=> (not res!422655) (not e!374172))))

(assert (=> b!651981 (= res!422655 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!651982 () Bool)

(declare-fun e!374158 () Bool)

(assert (=> b!651982 (= e!374158 (not e!374164))))

(declare-fun res!422651 () Bool)

(assert (=> b!651982 (=> res!422651 e!374164)))

(declare-fun lt!303171 () SeekEntryResult!6889)

(assert (=> b!651982 (= res!422651 (not (= lt!303171 (Found!6889 index!984))))))

(declare-fun lt!303166 () Unit!22233)

(assert (=> b!651982 (= lt!303166 e!374168)))

(declare-fun c!75029 () Bool)

(assert (=> b!651982 (= c!75029 (= lt!303171 Undefined!6889))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38586 (_ BitVec 32)) SeekEntryResult!6889)

(assert (=> b!651982 (= lt!303171 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!303168 lt!303181 mask!3053))))

(declare-fun e!374170 () Bool)

(assert (=> b!651982 e!374170))

(declare-fun res!422660 () Bool)

(assert (=> b!651982 (=> (not res!422660) (not e!374170))))

(declare-fun lt!303173 () (_ BitVec 32))

(declare-fun lt!303179 () SeekEntryResult!6889)

(assert (=> b!651982 (= res!422660 (= lt!303179 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303173 vacantSpotIndex!68 lt!303168 lt!303181 mask!3053)))))

(assert (=> b!651982 (= lt!303179 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303173 vacantSpotIndex!68 (select (arr!18493 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!651982 (= lt!303168 (select (store (arr!18493 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!303177 () Unit!22233)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38586 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22233)

(assert (=> b!651982 (= lt!303177 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303173 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!651982 (= lt!303173 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!651983 () Bool)

(assert (=> b!651983 (= e!374166 e!374158)))

(declare-fun res!422658 () Bool)

(assert (=> b!651983 (=> (not res!422658) (not e!374158))))

(declare-fun lt!303174 () SeekEntryResult!6889)

(assert (=> b!651983 (= res!422658 (and (= lt!303174 (Found!6889 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18493 a!2986) index!984) (select (arr!18493 a!2986) j!136))) (not (= (select (arr!18493 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!651983 (= lt!303174 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18493 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!651984 () Bool)

(declare-fun res!422659 () Bool)

(assert (=> b!651984 (=> (not res!422659) (not e!374172))))

(assert (=> b!651984 (= res!422659 (validKeyInArray!0 (select (arr!18493 a!2986) j!136)))))

(declare-fun b!651985 () Bool)

(assert (=> b!651985 (= e!374171 (arrayContainsKey!0 lt!303181 (select (arr!18493 a!2986) j!136) index!984))))

(declare-fun b!651986 () Bool)

(assert (=> b!651986 (= e!374170 (= lt!303174 lt!303179))))

(declare-fun b!651987 () Bool)

(assert (=> b!651987 (= e!374160 e!374169)))

(declare-fun res!422665 () Bool)

(assert (=> b!651987 (=> res!422665 e!374169)))

(assert (=> b!651987 (= res!422665 (or (not (= (select (arr!18493 a!2986) j!136) lt!303168)) (not (= (select (arr!18493 a!2986) j!136) lt!303178)) (bvsge j!136 index!984)))))

(declare-fun b!651988 () Bool)

(declare-fun Unit!22238 () Unit!22233)

(assert (=> b!651988 (= e!374168 Unit!22238)))

(assert (= (and start!59148 res!422649) b!651979))

(assert (= (and b!651979 res!422661) b!651984))

(assert (= (and b!651984 res!422659) b!651973))

(assert (= (and b!651973 res!422652) b!651981))

(assert (= (and b!651981 res!422655) b!651968))

(assert (= (and b!651968 res!422662) b!651980))

(assert (= (and b!651980 res!422650) b!651967))

(assert (= (and b!651967 res!422657) b!651977))

(assert (= (and b!651977 res!422647) b!651971))

(assert (= (and b!651971 res!422663) b!651983))

(assert (= (and b!651983 res!422658) b!651982))

(assert (= (and b!651982 res!422660) b!651986))

(assert (= (and b!651982 c!75029) b!651969))

(assert (= (and b!651982 (not c!75029)) b!651988))

(assert (= (and b!651982 (not res!422651)) b!651972))

(assert (= (and b!651972 res!422648) b!651987))

(assert (= (and b!651987 (not res!422665)) b!651976))

(assert (= (and b!651976 res!422653) b!651985))

(assert (= (and b!651972 (not res!422664)) b!651974))

(assert (= (and b!651974 c!75028) b!651978))

(assert (= (and b!651974 (not c!75028)) b!651975))

(assert (= (and b!651974 (not res!422654)) b!651970))

(assert (= (and b!651970 res!422656) b!651966))

(declare-fun m!625561 () Bool)

(assert (=> b!651980 m!625561))

(declare-fun m!625563 () Bool)

(assert (=> b!651981 m!625563))

(declare-fun m!625565 () Bool)

(assert (=> b!651968 m!625565))

(declare-fun m!625567 () Bool)

(assert (=> b!651976 m!625567))

(assert (=> b!651976 m!625567))

(declare-fun m!625569 () Bool)

(assert (=> b!651976 m!625569))

(declare-fun m!625571 () Bool)

(assert (=> b!651983 m!625571))

(assert (=> b!651983 m!625567))

(assert (=> b!651983 m!625567))

(declare-fun m!625573 () Bool)

(assert (=> b!651983 m!625573))

(declare-fun m!625575 () Bool)

(assert (=> b!651973 m!625575))

(declare-fun m!625577 () Bool)

(assert (=> b!651977 m!625577))

(assert (=> b!651972 m!625567))

(declare-fun m!625579 () Bool)

(assert (=> b!651972 m!625579))

(declare-fun m!625581 () Bool)

(assert (=> b!651972 m!625581))

(assert (=> b!651971 m!625579))

(declare-fun m!625583 () Bool)

(assert (=> b!651971 m!625583))

(declare-fun m!625585 () Bool)

(assert (=> b!651982 m!625585))

(assert (=> b!651982 m!625567))

(assert (=> b!651982 m!625579))

(assert (=> b!651982 m!625567))

(declare-fun m!625587 () Bool)

(assert (=> b!651982 m!625587))

(declare-fun m!625589 () Bool)

(assert (=> b!651982 m!625589))

(declare-fun m!625591 () Bool)

(assert (=> b!651982 m!625591))

(declare-fun m!625593 () Bool)

(assert (=> b!651982 m!625593))

(declare-fun m!625595 () Bool)

(assert (=> b!651982 m!625595))

(assert (=> b!651987 m!625567))

(assert (=> b!651966 m!625567))

(assert (=> b!651966 m!625567))

(declare-fun m!625597 () Bool)

(assert (=> b!651966 m!625597))

(declare-fun m!625599 () Bool)

(assert (=> b!651970 m!625599))

(assert (=> b!651970 m!625567))

(assert (=> b!651970 m!625567))

(declare-fun m!625601 () Bool)

(assert (=> b!651970 m!625601))

(assert (=> b!651970 m!625567))

(assert (=> b!651970 m!625569))

(declare-fun m!625603 () Bool)

(assert (=> b!651970 m!625603))

(declare-fun m!625605 () Bool)

(assert (=> b!651970 m!625605))

(assert (=> b!651970 m!625567))

(declare-fun m!625607 () Bool)

(assert (=> b!651970 m!625607))

(declare-fun m!625609 () Bool)

(assert (=> b!651970 m!625609))

(assert (=> b!651985 m!625567))

(assert (=> b!651985 m!625567))

(assert (=> b!651985 m!625597))

(declare-fun m!625611 () Bool)

(assert (=> b!651967 m!625611))

(assert (=> b!651978 m!625567))

(assert (=> b!651978 m!625567))

(declare-fun m!625613 () Bool)

(assert (=> b!651978 m!625613))

(declare-fun m!625615 () Bool)

(assert (=> b!651978 m!625615))

(assert (=> b!651978 m!625609))

(declare-fun m!625617 () Bool)

(assert (=> b!651978 m!625617))

(assert (=> b!651978 m!625605))

(assert (=> b!651978 m!625567))

(declare-fun m!625619 () Bool)

(assert (=> b!651978 m!625619))

(assert (=> b!651978 m!625567))

(declare-fun m!625621 () Bool)

(assert (=> b!651978 m!625621))

(assert (=> b!651984 m!625567))

(assert (=> b!651984 m!625567))

(declare-fun m!625623 () Bool)

(assert (=> b!651984 m!625623))

(declare-fun m!625625 () Bool)

(assert (=> start!59148 m!625625))

(declare-fun m!625627 () Bool)

(assert (=> start!59148 m!625627))

(check-sat (not b!651967) (not b!651968) (not b!651966) (not b!651976) (not start!59148) (not b!651982) (not b!651970) (not b!651980) (not b!651978) (not b!651983) (not b!651973) (not b!651984) (not b!651981) (not b!651985))
(check-sat)
