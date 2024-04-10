; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54900 () Bool)

(assert start!54900)

(declare-fun b!600977 () Bool)

(declare-fun res!385817 () Bool)

(declare-fun e!343615 () Bool)

(assert (=> b!600977 (=> (not res!385817) (not e!343615))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37135 0))(
  ( (array!37136 (arr!17827 (Array (_ BitVec 32) (_ BitVec 64))) (size!18191 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37135)

(assert (=> b!600977 (= res!385817 (and (= (size!18191 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18191 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18191 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!600978 () Bool)

(declare-fun e!343612 () Bool)

(declare-datatypes ((SeekEntryResult!6267 0))(
  ( (MissingZero!6267 (index!27325 (_ BitVec 32))) (Found!6267 (index!27326 (_ BitVec 32))) (Intermediate!6267 (undefined!7079 Bool) (index!27327 (_ BitVec 32)) (x!56122 (_ BitVec 32))) (Undefined!6267) (MissingVacant!6267 (index!27328 (_ BitVec 32))) )
))
(declare-fun lt!273487 () SeekEntryResult!6267)

(declare-fun lt!273481 () SeekEntryResult!6267)

(assert (=> b!600978 (= e!343612 (= lt!273487 lt!273481))))

(declare-fun b!600979 () Bool)

(declare-fun res!385815 () Bool)

(assert (=> b!600979 (=> (not res!385815) (not e!343615))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!600979 (= res!385815 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!600980 () Bool)

(declare-fun e!343618 () Bool)

(assert (=> b!600980 (= e!343618 true)))

(declare-fun lt!273486 () Bool)

(declare-datatypes ((List!11868 0))(
  ( (Nil!11865) (Cons!11864 (h!12909 (_ BitVec 64)) (t!18096 List!11868)) )
))
(declare-fun contains!2984 (List!11868 (_ BitVec 64)) Bool)

(assert (=> b!600980 (= lt!273486 (contains!2984 Nil!11865 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600981 () Bool)

(declare-fun e!343614 () Bool)

(declare-fun e!343623 () Bool)

(assert (=> b!600981 (= e!343614 e!343623)))

(declare-fun res!385813 () Bool)

(assert (=> b!600981 (=> res!385813 e!343623)))

(declare-fun lt!273474 () (_ BitVec 64))

(declare-fun lt!273480 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!600981 (= res!385813 (or (not (= (select (arr!17827 a!2986) j!136) lt!273474)) (not (= (select (arr!17827 a!2986) j!136) lt!273480)) (bvsge j!136 index!984)))))

(declare-fun e!343617 () Bool)

(assert (=> b!600981 e!343617))

(declare-fun res!385829 () Bool)

(assert (=> b!600981 (=> (not res!385829) (not e!343617))))

(assert (=> b!600981 (= res!385829 (= lt!273480 (select (arr!17827 a!2986) j!136)))))

(assert (=> b!600981 (= lt!273480 (select (store (arr!17827 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!600982 () Bool)

(declare-fun res!385832 () Bool)

(declare-fun e!343620 () Bool)

(assert (=> b!600982 (=> (not res!385832) (not e!343620))))

(declare-fun arrayNoDuplicates!0 (array!37135 (_ BitVec 32) List!11868) Bool)

(assert (=> b!600982 (= res!385832 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11865))))

(declare-fun b!600983 () Bool)

(declare-fun res!385827 () Bool)

(assert (=> b!600983 (=> (not res!385827) (not e!343615))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!600983 (= res!385827 (validKeyInArray!0 (select (arr!17827 a!2986) j!136)))))

(declare-fun b!600984 () Bool)

(declare-fun res!385814 () Bool)

(assert (=> b!600984 (=> res!385814 e!343618)))

(declare-fun noDuplicate!301 (List!11868) Bool)

(assert (=> b!600984 (= res!385814 (not (noDuplicate!301 Nil!11865)))))

(declare-fun b!600985 () Bool)

(declare-fun e!343621 () Bool)

(assert (=> b!600985 (= e!343617 e!343621)))

(declare-fun res!385825 () Bool)

(assert (=> b!600985 (=> res!385825 e!343621)))

(assert (=> b!600985 (= res!385825 (or (not (= (select (arr!17827 a!2986) j!136) lt!273474)) (not (= (select (arr!17827 a!2986) j!136) lt!273480)) (bvsge j!136 index!984)))))

(declare-fun b!600986 () Bool)

(assert (=> b!600986 (= e!343623 e!343618)))

(declare-fun res!385821 () Bool)

(assert (=> b!600986 (=> res!385821 e!343618)))

(assert (=> b!600986 (= res!385821 (or (bvsge (size!18191 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18191 a!2986))))))

(declare-fun lt!273479 () array!37135)

(assert (=> b!600986 (arrayNoDuplicates!0 lt!273479 j!136 Nil!11865)))

(declare-datatypes ((Unit!18986 0))(
  ( (Unit!18987) )
))
(declare-fun lt!273475 () Unit!18986)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37135 (_ BitVec 32) (_ BitVec 32)) Unit!18986)

(assert (=> b!600986 (= lt!273475 (lemmaNoDuplicateFromThenFromBigger!0 lt!273479 #b00000000000000000000000000000000 j!136))))

(assert (=> b!600986 (arrayNoDuplicates!0 lt!273479 #b00000000000000000000000000000000 Nil!11865)))

(declare-fun lt!273476 () Unit!18986)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37135 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11868) Unit!18986)

(assert (=> b!600986 (= lt!273476 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11865))))

(assert (=> b!600986 (arrayContainsKey!0 lt!273479 (select (arr!17827 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273482 () Unit!18986)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37135 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18986)

(assert (=> b!600986 (= lt!273482 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273479 (select (arr!17827 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!600987 () Bool)

(declare-fun e!343616 () Unit!18986)

(declare-fun Unit!18988 () Unit!18986)

(assert (=> b!600987 (= e!343616 Unit!18988)))

(assert (=> b!600987 false))

(declare-fun b!600988 () Bool)

(declare-fun res!385820 () Bool)

(assert (=> b!600988 (=> (not res!385820) (not e!343620))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37135 (_ BitVec 32)) Bool)

(assert (=> b!600988 (= res!385820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!600989 () Bool)

(declare-fun Unit!18989 () Unit!18986)

(assert (=> b!600989 (= e!343616 Unit!18989)))

(declare-fun b!600990 () Bool)

(declare-fun res!385818 () Bool)

(assert (=> b!600990 (=> (not res!385818) (not e!343615))))

(assert (=> b!600990 (= res!385818 (validKeyInArray!0 k0!1786))))

(declare-fun b!600991 () Bool)

(declare-fun res!385828 () Bool)

(assert (=> b!600991 (=> res!385828 e!343618)))

(assert (=> b!600991 (= res!385828 (contains!2984 Nil!11865 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600992 () Bool)

(assert (=> b!600992 (= e!343615 e!343620)))

(declare-fun res!385826 () Bool)

(assert (=> b!600992 (=> (not res!385826) (not e!343620))))

(declare-fun lt!273484 () SeekEntryResult!6267)

(assert (=> b!600992 (= res!385826 (or (= lt!273484 (MissingZero!6267 i!1108)) (= lt!273484 (MissingVacant!6267 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37135 (_ BitVec 32)) SeekEntryResult!6267)

(assert (=> b!600992 (= lt!273484 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!600993 () Bool)

(declare-fun e!343611 () Bool)

(assert (=> b!600993 (= e!343620 e!343611)))

(declare-fun res!385824 () Bool)

(assert (=> b!600993 (=> (not res!385824) (not e!343611))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!600993 (= res!385824 (= (select (store (arr!17827 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!600993 (= lt!273479 (array!37136 (store (arr!17827 a!2986) i!1108 k0!1786) (size!18191 a!2986)))))

(declare-fun b!600994 () Bool)

(declare-fun e!343619 () Bool)

(assert (=> b!600994 (= e!343611 e!343619)))

(declare-fun res!385816 () Bool)

(assert (=> b!600994 (=> (not res!385816) (not e!343619))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!600994 (= res!385816 (and (= lt!273487 (Found!6267 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17827 a!2986) index!984) (select (arr!17827 a!2986) j!136))) (not (= (select (arr!17827 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37135 (_ BitVec 32)) SeekEntryResult!6267)

(assert (=> b!600994 (= lt!273487 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17827 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!600995 () Bool)

(declare-fun e!343622 () Bool)

(assert (=> b!600995 (= e!343622 (arrayContainsKey!0 lt!273479 (select (arr!17827 a!2986) j!136) index!984))))

(declare-fun b!600996 () Bool)

(declare-fun res!385819 () Bool)

(assert (=> b!600996 (=> (not res!385819) (not e!343620))))

(assert (=> b!600996 (= res!385819 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17827 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!385831 () Bool)

(assert (=> start!54900 (=> (not res!385831) (not e!343615))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54900 (= res!385831 (validMask!0 mask!3053))))

(assert (=> start!54900 e!343615))

(assert (=> start!54900 true))

(declare-fun array_inv!13623 (array!37135) Bool)

(assert (=> start!54900 (array_inv!13623 a!2986)))

(declare-fun b!600997 () Bool)

(assert (=> b!600997 (= e!343621 e!343622)))

(declare-fun res!385822 () Bool)

(assert (=> b!600997 (=> (not res!385822) (not e!343622))))

(assert (=> b!600997 (= res!385822 (arrayContainsKey!0 lt!273479 (select (arr!17827 a!2986) j!136) j!136))))

(declare-fun b!600998 () Bool)

(assert (=> b!600998 (= e!343619 (not e!343614))))

(declare-fun res!385823 () Bool)

(assert (=> b!600998 (=> res!385823 e!343614)))

(declare-fun lt!273478 () SeekEntryResult!6267)

(assert (=> b!600998 (= res!385823 (not (= lt!273478 (Found!6267 index!984))))))

(declare-fun lt!273477 () Unit!18986)

(assert (=> b!600998 (= lt!273477 e!343616)))

(declare-fun c!67949 () Bool)

(assert (=> b!600998 (= c!67949 (= lt!273478 Undefined!6267))))

(assert (=> b!600998 (= lt!273478 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273474 lt!273479 mask!3053))))

(assert (=> b!600998 e!343612))

(declare-fun res!385830 () Bool)

(assert (=> b!600998 (=> (not res!385830) (not e!343612))))

(declare-fun lt!273485 () (_ BitVec 32))

(assert (=> b!600998 (= res!385830 (= lt!273481 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273485 vacantSpotIndex!68 lt!273474 lt!273479 mask!3053)))))

(assert (=> b!600998 (= lt!273481 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273485 vacantSpotIndex!68 (select (arr!17827 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!600998 (= lt!273474 (select (store (arr!17827 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!273483 () Unit!18986)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37135 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18986)

(assert (=> b!600998 (= lt!273483 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273485 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!600998 (= lt!273485 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!54900 res!385831) b!600977))

(assert (= (and b!600977 res!385817) b!600983))

(assert (= (and b!600983 res!385827) b!600990))

(assert (= (and b!600990 res!385818) b!600979))

(assert (= (and b!600979 res!385815) b!600992))

(assert (= (and b!600992 res!385826) b!600988))

(assert (= (and b!600988 res!385820) b!600982))

(assert (= (and b!600982 res!385832) b!600996))

(assert (= (and b!600996 res!385819) b!600993))

(assert (= (and b!600993 res!385824) b!600994))

(assert (= (and b!600994 res!385816) b!600998))

(assert (= (and b!600998 res!385830) b!600978))

(assert (= (and b!600998 c!67949) b!600987))

(assert (= (and b!600998 (not c!67949)) b!600989))

(assert (= (and b!600998 (not res!385823)) b!600981))

(assert (= (and b!600981 res!385829) b!600985))

(assert (= (and b!600985 (not res!385825)) b!600997))

(assert (= (and b!600997 res!385822) b!600995))

(assert (= (and b!600981 (not res!385813)) b!600986))

(assert (= (and b!600986 (not res!385821)) b!600984))

(assert (= (and b!600984 (not res!385814)) b!600991))

(assert (= (and b!600991 (not res!385828)) b!600980))

(declare-fun m!578181 () Bool)

(assert (=> b!600995 m!578181))

(assert (=> b!600995 m!578181))

(declare-fun m!578183 () Bool)

(assert (=> b!600995 m!578183))

(declare-fun m!578185 () Bool)

(assert (=> b!600984 m!578185))

(declare-fun m!578187 () Bool)

(assert (=> b!600990 m!578187))

(declare-fun m!578189 () Bool)

(assert (=> b!600993 m!578189))

(declare-fun m!578191 () Bool)

(assert (=> b!600993 m!578191))

(assert (=> b!600983 m!578181))

(assert (=> b!600983 m!578181))

(declare-fun m!578193 () Bool)

(assert (=> b!600983 m!578193))

(declare-fun m!578195 () Bool)

(assert (=> b!600996 m!578195))

(assert (=> b!600997 m!578181))

(assert (=> b!600997 m!578181))

(declare-fun m!578197 () Bool)

(assert (=> b!600997 m!578197))

(declare-fun m!578199 () Bool)

(assert (=> b!600979 m!578199))

(declare-fun m!578201 () Bool)

(assert (=> b!600980 m!578201))

(declare-fun m!578203 () Bool)

(assert (=> b!600994 m!578203))

(assert (=> b!600994 m!578181))

(assert (=> b!600994 m!578181))

(declare-fun m!578205 () Bool)

(assert (=> b!600994 m!578205))

(declare-fun m!578207 () Bool)

(assert (=> b!600988 m!578207))

(assert (=> b!600981 m!578181))

(assert (=> b!600981 m!578189))

(declare-fun m!578209 () Bool)

(assert (=> b!600981 m!578209))

(declare-fun m!578211 () Bool)

(assert (=> b!600982 m!578211))

(declare-fun m!578213 () Bool)

(assert (=> b!600986 m!578213))

(assert (=> b!600986 m!578181))

(assert (=> b!600986 m!578181))

(declare-fun m!578215 () Bool)

(assert (=> b!600986 m!578215))

(assert (=> b!600986 m!578181))

(declare-fun m!578217 () Bool)

(assert (=> b!600986 m!578217))

(declare-fun m!578219 () Bool)

(assert (=> b!600986 m!578219))

(declare-fun m!578221 () Bool)

(assert (=> b!600986 m!578221))

(declare-fun m!578223 () Bool)

(assert (=> b!600986 m!578223))

(declare-fun m!578225 () Bool)

(assert (=> b!600992 m!578225))

(declare-fun m!578227 () Bool)

(assert (=> b!600998 m!578227))

(declare-fun m!578229 () Bool)

(assert (=> b!600998 m!578229))

(declare-fun m!578231 () Bool)

(assert (=> b!600998 m!578231))

(assert (=> b!600998 m!578181))

(declare-fun m!578233 () Bool)

(assert (=> b!600998 m!578233))

(declare-fun m!578235 () Bool)

(assert (=> b!600998 m!578235))

(assert (=> b!600998 m!578189))

(assert (=> b!600998 m!578181))

(declare-fun m!578237 () Bool)

(assert (=> b!600998 m!578237))

(declare-fun m!578239 () Bool)

(assert (=> b!600991 m!578239))

(assert (=> b!600985 m!578181))

(declare-fun m!578241 () Bool)

(assert (=> start!54900 m!578241))

(declare-fun m!578243 () Bool)

(assert (=> start!54900 m!578243))

(check-sat (not b!600995) (not b!600998) (not b!600982) (not b!600992) (not b!600986) (not b!600991) (not b!600997) (not b!600988) (not b!600990) (not b!600983) (not start!54900) (not b!600979) (not b!600980) (not b!600984) (not b!600994))
(check-sat)
