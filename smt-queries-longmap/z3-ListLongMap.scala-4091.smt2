; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56046 () Bool)

(assert start!56046)

(declare-fun b!617048 () Bool)

(assert (=> b!617048 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((Unit!20168 0))(
  ( (Unit!20169) )
))
(declare-fun lt!284011 () Unit!20168)

(declare-datatypes ((array!37516 0))(
  ( (array!37517 (arr!18004 (Array (_ BitVec 32) (_ BitVec 64))) (size!18368 (_ BitVec 32))) )
))
(declare-fun lt!284004 () array!37516)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37516)

(declare-datatypes ((List!12045 0))(
  ( (Nil!12042) (Cons!12041 (h!13086 (_ BitVec 64)) (t!18273 List!12045)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37516 (_ BitVec 64) (_ BitVec 32) List!12045) Unit!20168)

(assert (=> b!617048 (= lt!284011 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284004 (select (arr!18004 a!2986) j!136) index!984 Nil!12042))))

(declare-fun arrayNoDuplicates!0 (array!37516 (_ BitVec 32) List!12045) Bool)

(assert (=> b!617048 (arrayNoDuplicates!0 lt!284004 index!984 Nil!12042)))

(declare-fun lt!284017 () Unit!20168)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37516 (_ BitVec 32) (_ BitVec 32)) Unit!20168)

(assert (=> b!617048 (= lt!284017 (lemmaNoDuplicateFromThenFromBigger!0 lt!284004 #b00000000000000000000000000000000 index!984))))

(assert (=> b!617048 (arrayNoDuplicates!0 lt!284004 #b00000000000000000000000000000000 Nil!12042)))

(declare-fun lt!284008 () Unit!20168)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37516 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12045) Unit!20168)

(assert (=> b!617048 (= lt!284008 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12042))))

(declare-fun arrayContainsKey!0 (array!37516 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!617048 (arrayContainsKey!0 lt!284004 (select (arr!18004 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!284003 () Unit!20168)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37516 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20168)

(assert (=> b!617048 (= lt!284003 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284004 (select (arr!18004 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!353824 () Bool)

(assert (=> b!617048 e!353824))

(declare-fun res!397504 () Bool)

(assert (=> b!617048 (=> (not res!397504) (not e!353824))))

(assert (=> b!617048 (= res!397504 (arrayContainsKey!0 lt!284004 (select (arr!18004 a!2986) j!136) j!136))))

(declare-fun e!353830 () Unit!20168)

(declare-fun Unit!20170 () Unit!20168)

(assert (=> b!617048 (= e!353830 Unit!20170)))

(declare-fun b!617049 () Bool)

(declare-fun res!397512 () Bool)

(declare-fun e!353822 () Bool)

(assert (=> b!617049 (=> (not res!397512) (not e!353822))))

(assert (=> b!617049 (= res!397512 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12042))))

(declare-fun b!617050 () Bool)

(declare-fun e!353818 () Bool)

(assert (=> b!617050 (= e!353818 true)))

(assert (=> b!617050 (= (select (store (arr!18004 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!617051 () Bool)

(declare-fun res!397514 () Bool)

(declare-fun e!353832 () Bool)

(assert (=> b!617051 (=> (not res!397514) (not e!353832))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!617051 (= res!397514 (validKeyInArray!0 (select (arr!18004 a!2986) j!136)))))

(declare-fun b!617052 () Bool)

(declare-fun Unit!20171 () Unit!20168)

(assert (=> b!617052 (= e!353830 Unit!20171)))

(declare-fun e!353829 () Bool)

(declare-fun b!617053 () Bool)

(assert (=> b!617053 (= e!353829 (arrayContainsKey!0 lt!284004 (select (arr!18004 a!2986) j!136) index!984))))

(declare-fun b!617054 () Bool)

(declare-fun res!397500 () Bool)

(assert (=> b!617054 (=> (not res!397500) (not e!353832))))

(assert (=> b!617054 (= res!397500 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!617055 () Bool)

(declare-fun e!353831 () Bool)

(declare-fun e!353819 () Bool)

(assert (=> b!617055 (= e!353831 e!353819)))

(declare-fun res!397502 () Bool)

(assert (=> b!617055 (=> (not res!397502) (not e!353819))))

(declare-datatypes ((SeekEntryResult!6444 0))(
  ( (MissingZero!6444 (index!28060 (_ BitVec 32))) (Found!6444 (index!28061 (_ BitVec 32))) (Intermediate!6444 (undefined!7256 Bool) (index!28062 (_ BitVec 32)) (x!56852 (_ BitVec 32))) (Undefined!6444) (MissingVacant!6444 (index!28063 (_ BitVec 32))) )
))
(declare-fun lt!284014 () SeekEntryResult!6444)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!617055 (= res!397502 (and (= lt!284014 (Found!6444 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18004 a!2986) index!984) (select (arr!18004 a!2986) j!136))) (not (= (select (arr!18004 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37516 (_ BitVec 32)) SeekEntryResult!6444)

(assert (=> b!617055 (= lt!284014 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18004 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!617056 () Bool)

(declare-fun e!353827 () Unit!20168)

(declare-fun Unit!20172 () Unit!20168)

(assert (=> b!617056 (= e!353827 Unit!20172)))

(declare-fun b!617057 () Bool)

(assert (=> b!617057 (= e!353832 e!353822)))

(declare-fun res!397510 () Bool)

(assert (=> b!617057 (=> (not res!397510) (not e!353822))))

(declare-fun lt!284015 () SeekEntryResult!6444)

(assert (=> b!617057 (= res!397510 (or (= lt!284015 (MissingZero!6444 i!1108)) (= lt!284015 (MissingVacant!6444 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37516 (_ BitVec 32)) SeekEntryResult!6444)

(assert (=> b!617057 (= lt!284015 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!617058 () Bool)

(declare-fun e!353820 () Unit!20168)

(declare-fun Unit!20173 () Unit!20168)

(assert (=> b!617058 (= e!353820 Unit!20173)))

(declare-fun b!617059 () Bool)

(declare-fun Unit!20174 () Unit!20168)

(assert (=> b!617059 (= e!353827 Unit!20174)))

(declare-fun res!397498 () Bool)

(assert (=> b!617059 (= res!397498 (= (select (store (arr!18004 a!2986) i!1108 k0!1786) index!984) (select (arr!18004 a!2986) j!136)))))

(declare-fun e!353825 () Bool)

(assert (=> b!617059 (=> (not res!397498) (not e!353825))))

(assert (=> b!617059 e!353825))

(declare-fun c!70142 () Bool)

(assert (=> b!617059 (= c!70142 (bvslt j!136 index!984))))

(declare-fun lt!284012 () Unit!20168)

(assert (=> b!617059 (= lt!284012 e!353820)))

(declare-fun c!70144 () Bool)

(assert (=> b!617059 (= c!70144 (bvslt index!984 j!136))))

(declare-fun lt!284005 () Unit!20168)

(assert (=> b!617059 (= lt!284005 e!353830)))

(assert (=> b!617059 false))

(declare-fun b!617060 () Bool)

(assert (=> b!617060 (= e!353822 e!353831)))

(declare-fun res!397505 () Bool)

(assert (=> b!617060 (=> (not res!397505) (not e!353831))))

(assert (=> b!617060 (= res!397505 (= (select (store (arr!18004 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!617060 (= lt!284004 (array!37517 (store (arr!18004 a!2986) i!1108 k0!1786) (size!18368 a!2986)))))

(declare-fun b!617061 () Bool)

(assert (=> b!617061 false))

(declare-fun lt!284016 () Unit!20168)

(assert (=> b!617061 (= lt!284016 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284004 (select (arr!18004 a!2986) j!136) j!136 Nil!12042))))

(assert (=> b!617061 (arrayNoDuplicates!0 lt!284004 j!136 Nil!12042)))

(declare-fun lt!283998 () Unit!20168)

(assert (=> b!617061 (= lt!283998 (lemmaNoDuplicateFromThenFromBigger!0 lt!284004 #b00000000000000000000000000000000 j!136))))

(assert (=> b!617061 (arrayNoDuplicates!0 lt!284004 #b00000000000000000000000000000000 Nil!12042)))

(declare-fun lt!284013 () Unit!20168)

(assert (=> b!617061 (= lt!284013 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12042))))

(assert (=> b!617061 (arrayContainsKey!0 lt!284004 (select (arr!18004 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!284000 () Unit!20168)

(assert (=> b!617061 (= lt!284000 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284004 (select (arr!18004 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20175 () Unit!20168)

(assert (=> b!617061 (= e!353820 Unit!20175)))

(declare-fun b!617062 () Bool)

(declare-fun res!397506 () Bool)

(assert (=> b!617062 (= res!397506 (arrayContainsKey!0 lt!284004 (select (arr!18004 a!2986) j!136) j!136))))

(assert (=> b!617062 (=> (not res!397506) (not e!353829))))

(declare-fun e!353823 () Bool)

(assert (=> b!617062 (= e!353823 e!353829)))

(declare-fun b!617063 () Bool)

(declare-fun res!397503 () Bool)

(assert (=> b!617063 (=> (not res!397503) (not e!353822))))

(assert (=> b!617063 (= res!397503 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18004 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!617064 () Bool)

(declare-fun res!397511 () Bool)

(assert (=> b!617064 (= res!397511 (bvsge j!136 index!984))))

(assert (=> b!617064 (=> res!397511 e!353823)))

(assert (=> b!617064 (= e!353825 e!353823)))

(declare-fun b!617065 () Bool)

(declare-fun res!397513 () Bool)

(assert (=> b!617065 (=> (not res!397513) (not e!353832))))

(assert (=> b!617065 (= res!397513 (validKeyInArray!0 k0!1786))))

(declare-fun b!617066 () Bool)

(assert (=> b!617066 (= e!353819 (not e!353818))))

(declare-fun res!397508 () Bool)

(assert (=> b!617066 (=> res!397508 e!353818)))

(declare-fun lt!284006 () SeekEntryResult!6444)

(assert (=> b!617066 (= res!397508 (not (= lt!284006 (MissingVacant!6444 vacantSpotIndex!68))))))

(declare-fun lt!283999 () Unit!20168)

(assert (=> b!617066 (= lt!283999 e!353827)))

(declare-fun c!70145 () Bool)

(assert (=> b!617066 (= c!70145 (= lt!284006 (Found!6444 index!984)))))

(declare-fun lt!284007 () Unit!20168)

(declare-fun e!353828 () Unit!20168)

(assert (=> b!617066 (= lt!284007 e!353828)))

(declare-fun c!70143 () Bool)

(assert (=> b!617066 (= c!70143 (= lt!284006 Undefined!6444))))

(declare-fun lt!284001 () (_ BitVec 64))

(assert (=> b!617066 (= lt!284006 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!284001 lt!284004 mask!3053))))

(declare-fun e!353826 () Bool)

(assert (=> b!617066 e!353826))

(declare-fun res!397499 () Bool)

(assert (=> b!617066 (=> (not res!397499) (not e!353826))))

(declare-fun lt!284002 () (_ BitVec 32))

(declare-fun lt!284010 () SeekEntryResult!6444)

(assert (=> b!617066 (= res!397499 (= lt!284010 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284002 vacantSpotIndex!68 lt!284001 lt!284004 mask!3053)))))

(assert (=> b!617066 (= lt!284010 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284002 vacantSpotIndex!68 (select (arr!18004 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!617066 (= lt!284001 (select (store (arr!18004 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!284009 () Unit!20168)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37516 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20168)

(assert (=> b!617066 (= lt!284009 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!284002 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!617066 (= lt!284002 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!617067 () Bool)

(assert (=> b!617067 (= e!353824 (arrayContainsKey!0 lt!284004 (select (arr!18004 a!2986) j!136) index!984))))

(declare-fun res!397507 () Bool)

(assert (=> start!56046 (=> (not res!397507) (not e!353832))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56046 (= res!397507 (validMask!0 mask!3053))))

(assert (=> start!56046 e!353832))

(assert (=> start!56046 true))

(declare-fun array_inv!13800 (array!37516) Bool)

(assert (=> start!56046 (array_inv!13800 a!2986)))

(declare-fun b!617068 () Bool)

(assert (=> b!617068 (= e!353826 (= lt!284014 lt!284010))))

(declare-fun b!617069 () Bool)

(declare-fun Unit!20176 () Unit!20168)

(assert (=> b!617069 (= e!353828 Unit!20176)))

(assert (=> b!617069 false))

(declare-fun b!617070 () Bool)

(declare-fun res!397509 () Bool)

(assert (=> b!617070 (=> (not res!397509) (not e!353822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37516 (_ BitVec 32)) Bool)

(assert (=> b!617070 (= res!397509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!617071 () Bool)

(declare-fun Unit!20177 () Unit!20168)

(assert (=> b!617071 (= e!353828 Unit!20177)))

(declare-fun b!617072 () Bool)

(declare-fun res!397501 () Bool)

(assert (=> b!617072 (=> (not res!397501) (not e!353832))))

(assert (=> b!617072 (= res!397501 (and (= (size!18368 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18368 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18368 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!56046 res!397507) b!617072))

(assert (= (and b!617072 res!397501) b!617051))

(assert (= (and b!617051 res!397514) b!617065))

(assert (= (and b!617065 res!397513) b!617054))

(assert (= (and b!617054 res!397500) b!617057))

(assert (= (and b!617057 res!397510) b!617070))

(assert (= (and b!617070 res!397509) b!617049))

(assert (= (and b!617049 res!397512) b!617063))

(assert (= (and b!617063 res!397503) b!617060))

(assert (= (and b!617060 res!397505) b!617055))

(assert (= (and b!617055 res!397502) b!617066))

(assert (= (and b!617066 res!397499) b!617068))

(assert (= (and b!617066 c!70143) b!617069))

(assert (= (and b!617066 (not c!70143)) b!617071))

(assert (= (and b!617066 c!70145) b!617059))

(assert (= (and b!617066 (not c!70145)) b!617056))

(assert (= (and b!617059 res!397498) b!617064))

(assert (= (and b!617064 (not res!397511)) b!617062))

(assert (= (and b!617062 res!397506) b!617053))

(assert (= (and b!617059 c!70142) b!617061))

(assert (= (and b!617059 (not c!70142)) b!617058))

(assert (= (and b!617059 c!70144) b!617048))

(assert (= (and b!617059 (not c!70144)) b!617052))

(assert (= (and b!617048 res!397504) b!617067))

(assert (= (and b!617066 (not res!397508)) b!617050))

(declare-fun m!593181 () Bool)

(assert (=> b!617060 m!593181))

(declare-fun m!593183 () Bool)

(assert (=> b!617060 m!593183))

(declare-fun m!593185 () Bool)

(assert (=> b!617067 m!593185))

(assert (=> b!617067 m!593185))

(declare-fun m!593187 () Bool)

(assert (=> b!617067 m!593187))

(declare-fun m!593189 () Bool)

(assert (=> b!617065 m!593189))

(assert (=> b!617050 m!593181))

(declare-fun m!593191 () Bool)

(assert (=> b!617050 m!593191))

(assert (=> b!617066 m!593185))

(declare-fun m!593193 () Bool)

(assert (=> b!617066 m!593193))

(declare-fun m!593195 () Bool)

(assert (=> b!617066 m!593195))

(declare-fun m!593197 () Bool)

(assert (=> b!617066 m!593197))

(assert (=> b!617066 m!593185))

(assert (=> b!617066 m!593181))

(declare-fun m!593199 () Bool)

(assert (=> b!617066 m!593199))

(declare-fun m!593201 () Bool)

(assert (=> b!617066 m!593201))

(declare-fun m!593203 () Bool)

(assert (=> b!617066 m!593203))

(assert (=> b!617061 m!593185))

(declare-fun m!593205 () Bool)

(assert (=> b!617061 m!593205))

(assert (=> b!617061 m!593185))

(assert (=> b!617061 m!593185))

(declare-fun m!593207 () Bool)

(assert (=> b!617061 m!593207))

(declare-fun m!593209 () Bool)

(assert (=> b!617061 m!593209))

(declare-fun m!593211 () Bool)

(assert (=> b!617061 m!593211))

(declare-fun m!593213 () Bool)

(assert (=> b!617061 m!593213))

(assert (=> b!617061 m!593185))

(declare-fun m!593215 () Bool)

(assert (=> b!617061 m!593215))

(declare-fun m!593217 () Bool)

(assert (=> b!617061 m!593217))

(declare-fun m!593219 () Bool)

(assert (=> b!617048 m!593219))

(assert (=> b!617048 m!593185))

(assert (=> b!617048 m!593185))

(declare-fun m!593221 () Bool)

(assert (=> b!617048 m!593221))

(assert (=> b!617048 m!593185))

(declare-fun m!593223 () Bool)

(assert (=> b!617048 m!593223))

(assert (=> b!617048 m!593217))

(assert (=> b!617048 m!593185))

(declare-fun m!593225 () Bool)

(assert (=> b!617048 m!593225))

(assert (=> b!617048 m!593185))

(declare-fun m!593227 () Bool)

(assert (=> b!617048 m!593227))

(assert (=> b!617048 m!593211))

(declare-fun m!593229 () Bool)

(assert (=> b!617048 m!593229))

(declare-fun m!593231 () Bool)

(assert (=> b!617063 m!593231))

(assert (=> b!617053 m!593185))

(assert (=> b!617053 m!593185))

(assert (=> b!617053 m!593187))

(declare-fun m!593233 () Bool)

(assert (=> b!617057 m!593233))

(declare-fun m!593235 () Bool)

(assert (=> b!617054 m!593235))

(assert (=> b!617062 m!593185))

(assert (=> b!617062 m!593185))

(assert (=> b!617062 m!593221))

(declare-fun m!593237 () Bool)

(assert (=> start!56046 m!593237))

(declare-fun m!593239 () Bool)

(assert (=> start!56046 m!593239))

(assert (=> b!617059 m!593181))

(assert (=> b!617059 m!593191))

(assert (=> b!617059 m!593185))

(assert (=> b!617051 m!593185))

(assert (=> b!617051 m!593185))

(declare-fun m!593241 () Bool)

(assert (=> b!617051 m!593241))

(declare-fun m!593243 () Bool)

(assert (=> b!617055 m!593243))

(assert (=> b!617055 m!593185))

(assert (=> b!617055 m!593185))

(declare-fun m!593245 () Bool)

(assert (=> b!617055 m!593245))

(declare-fun m!593247 () Bool)

(assert (=> b!617070 m!593247))

(declare-fun m!593249 () Bool)

(assert (=> b!617049 m!593249))

(check-sat (not b!617066) (not b!617065) (not b!617062) (not b!617055) (not b!617070) (not start!56046) (not b!617051) (not b!617057) (not b!617061) (not b!617054) (not b!617048) (not b!617049) (not b!617053) (not b!617067))
(check-sat)
