; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58994 () Bool)

(assert start!58994)

(declare-fun b!650980 () Bool)

(declare-datatypes ((Unit!22218 0))(
  ( (Unit!22219) )
))
(declare-fun e!373519 () Unit!22218)

(declare-fun Unit!22220 () Unit!22218)

(assert (=> b!650980 (= e!373519 Unit!22220)))

(declare-fun b!650981 () Bool)

(declare-fun e!373508 () Bool)

(declare-datatypes ((SeekEntryResult!6932 0))(
  ( (MissingZero!6932 (index!30078 (_ BitVec 32))) (Found!6932 (index!30079 (_ BitVec 32))) (Intermediate!6932 (undefined!7744 Bool) (index!30080 (_ BitVec 32)) (x!58866 (_ BitVec 32))) (Undefined!6932) (MissingVacant!6932 (index!30081 (_ BitVec 32))) )
))
(declare-fun lt!302606 () SeekEntryResult!6932)

(declare-fun lt!302607 () SeekEntryResult!6932)

(assert (=> b!650981 (= e!373508 (= lt!302606 lt!302607))))

(declare-fun b!650982 () Bool)

(declare-fun res!422061 () Bool)

(declare-fun e!373515 () Bool)

(assert (=> b!650982 (=> (not res!422061) (not e!373515))))

(declare-datatypes ((array!38575 0))(
  ( (array!38576 (arr!18492 (Array (_ BitVec 32) (_ BitVec 64))) (size!18856 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38575)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38575 (_ BitVec 32)) Bool)

(assert (=> b!650982 (= res!422061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!650983 () Bool)

(declare-fun e!373509 () Bool)

(assert (=> b!650983 (= e!373509 true)))

(declare-fun lt!302597 () array!38575)

(declare-datatypes ((List!12533 0))(
  ( (Nil!12530) (Cons!12529 (h!13574 (_ BitVec 64)) (t!18761 List!12533)) )
))
(declare-fun arrayNoDuplicates!0 (array!38575 (_ BitVec 32) List!12533) Bool)

(assert (=> b!650983 (arrayNoDuplicates!0 lt!302597 #b00000000000000000000000000000000 Nil!12530)))

(declare-fun lt!302595 () Unit!22218)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38575 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12533) Unit!22218)

(assert (=> b!650983 (= lt!302595 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12530))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38575 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!650983 (arrayContainsKey!0 lt!302597 (select (arr!18492 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!302611 () Unit!22218)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38575 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22218)

(assert (=> b!650983 (= lt!302611 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302597 (select (arr!18492 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!373518 () Bool)

(assert (=> b!650983 e!373518))

(declare-fun res!422062 () Bool)

(assert (=> b!650983 (=> (not res!422062) (not e!373518))))

(assert (=> b!650983 (= res!422062 (arrayContainsKey!0 lt!302597 (select (arr!18492 a!2986) j!136) j!136))))

(declare-fun b!650985 () Bool)

(declare-fun e!373511 () Bool)

(assert (=> b!650985 (= e!373511 e!373515)))

(declare-fun res!422077 () Bool)

(assert (=> b!650985 (=> (not res!422077) (not e!373515))))

(declare-fun lt!302598 () SeekEntryResult!6932)

(assert (=> b!650985 (= res!422077 (or (= lt!302598 (MissingZero!6932 i!1108)) (= lt!302598 (MissingVacant!6932 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38575 (_ BitVec 32)) SeekEntryResult!6932)

(assert (=> b!650985 (= lt!302598 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!650986 () Bool)

(declare-fun e!373513 () Bool)

(assert (=> b!650986 (= e!373513 e!373509)))

(declare-fun res!422067 () Bool)

(assert (=> b!650986 (=> res!422067 e!373509)))

(assert (=> b!650986 (= res!422067 (bvsge index!984 j!136))))

(declare-fun lt!302608 () Unit!22218)

(declare-fun e!373521 () Unit!22218)

(assert (=> b!650986 (= lt!302608 e!373521)))

(declare-fun c!74828 () Bool)

(assert (=> b!650986 (= c!74828 (bvslt j!136 index!984))))

(declare-fun e!373517 () Bool)

(declare-fun b!650987 () Bool)

(assert (=> b!650987 (= e!373517 (arrayContainsKey!0 lt!302597 (select (arr!18492 a!2986) j!136) index!984))))

(declare-fun b!650988 () Bool)

(declare-fun e!373514 () Bool)

(declare-fun e!373516 () Bool)

(assert (=> b!650988 (= e!373514 (not e!373516))))

(declare-fun res!422072 () Bool)

(assert (=> b!650988 (=> res!422072 e!373516)))

(declare-fun lt!302604 () SeekEntryResult!6932)

(assert (=> b!650988 (= res!422072 (not (= lt!302604 (Found!6932 index!984))))))

(declare-fun lt!302610 () Unit!22218)

(assert (=> b!650988 (= lt!302610 e!373519)))

(declare-fun c!74827 () Bool)

(assert (=> b!650988 (= c!74827 (= lt!302604 Undefined!6932))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!302596 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38575 (_ BitVec 32)) SeekEntryResult!6932)

(assert (=> b!650988 (= lt!302604 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!302596 lt!302597 mask!3053))))

(assert (=> b!650988 e!373508))

(declare-fun res!422074 () Bool)

(assert (=> b!650988 (=> (not res!422074) (not e!373508))))

(declare-fun lt!302600 () (_ BitVec 32))

(assert (=> b!650988 (= res!422074 (= lt!302607 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302600 vacantSpotIndex!68 lt!302596 lt!302597 mask!3053)))))

(assert (=> b!650988 (= lt!302607 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302600 vacantSpotIndex!68 (select (arr!18492 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!650988 (= lt!302596 (select (store (arr!18492 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!302603 () Unit!22218)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38575 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22218)

(assert (=> b!650988 (= lt!302603 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302600 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!650988 (= lt!302600 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!650989 () Bool)

(declare-fun res!422078 () Bool)

(assert (=> b!650989 (=> (not res!422078) (not e!373511))))

(assert (=> b!650989 (= res!422078 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!650990 () Bool)

(declare-fun res!422064 () Bool)

(assert (=> b!650990 (=> (not res!422064) (not e!373515))))

(assert (=> b!650990 (= res!422064 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12530))))

(declare-fun b!650991 () Bool)

(declare-fun Unit!22221 () Unit!22218)

(assert (=> b!650991 (= e!373519 Unit!22221)))

(assert (=> b!650991 false))

(declare-fun b!650992 () Bool)

(declare-fun e!373507 () Bool)

(assert (=> b!650992 (= e!373515 e!373507)))

(declare-fun res!422065 () Bool)

(assert (=> b!650992 (=> (not res!422065) (not e!373507))))

(assert (=> b!650992 (= res!422065 (= (select (store (arr!18492 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!650992 (= lt!302597 (array!38576 (store (arr!18492 a!2986) i!1108 k!1786) (size!18856 a!2986)))))

(declare-fun b!650993 () Bool)

(declare-fun e!373520 () Bool)

(assert (=> b!650993 (= e!373520 e!373517)))

(declare-fun res!422073 () Bool)

(assert (=> b!650993 (=> (not res!422073) (not e!373517))))

(assert (=> b!650993 (= res!422073 (arrayContainsKey!0 lt!302597 (select (arr!18492 a!2986) j!136) j!136))))

(declare-fun b!650994 () Bool)

(declare-fun Unit!22222 () Unit!22218)

(assert (=> b!650994 (= e!373521 Unit!22222)))

(declare-fun b!650995 () Bool)

(declare-fun res!422075 () Bool)

(assert (=> b!650995 (=> (not res!422075) (not e!373511))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!650995 (= res!422075 (validKeyInArray!0 k!1786))))

(declare-fun b!650996 () Bool)

(declare-fun Unit!22223 () Unit!22218)

(assert (=> b!650996 (= e!373521 Unit!22223)))

(declare-fun lt!302605 () Unit!22218)

(assert (=> b!650996 (= lt!302605 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302597 (select (arr!18492 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!650996 (arrayContainsKey!0 lt!302597 (select (arr!18492 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!302609 () Unit!22218)

(assert (=> b!650996 (= lt!302609 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12530))))

(assert (=> b!650996 (arrayNoDuplicates!0 lt!302597 #b00000000000000000000000000000000 Nil!12530)))

(declare-fun lt!302601 () Unit!22218)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38575 (_ BitVec 32) (_ BitVec 32)) Unit!22218)

(assert (=> b!650996 (= lt!302601 (lemmaNoDuplicateFromThenFromBigger!0 lt!302597 #b00000000000000000000000000000000 j!136))))

(assert (=> b!650996 (arrayNoDuplicates!0 lt!302597 j!136 Nil!12530)))

(declare-fun lt!302599 () Unit!22218)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38575 (_ BitVec 64) (_ BitVec 32) List!12533) Unit!22218)

(assert (=> b!650996 (= lt!302599 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!302597 (select (arr!18492 a!2986) j!136) j!136 Nil!12530))))

(assert (=> b!650996 false))

(declare-fun b!650997 () Bool)

(declare-fun res!422060 () Bool)

(assert (=> b!650997 (=> (not res!422060) (not e!373515))))

(assert (=> b!650997 (= res!422060 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18492 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!650998 () Bool)

(declare-fun res!422076 () Bool)

(assert (=> b!650998 (=> (not res!422076) (not e!373511))))

(assert (=> b!650998 (= res!422076 (and (= (size!18856 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18856 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18856 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!422068 () Bool)

(assert (=> start!58994 (=> (not res!422068) (not e!373511))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58994 (= res!422068 (validMask!0 mask!3053))))

(assert (=> start!58994 e!373511))

(assert (=> start!58994 true))

(declare-fun array_inv!14288 (array!38575) Bool)

(assert (=> start!58994 (array_inv!14288 a!2986)))

(declare-fun b!650984 () Bool)

(declare-fun e!373510 () Bool)

(assert (=> b!650984 (= e!373510 e!373520)))

(declare-fun res!422070 () Bool)

(assert (=> b!650984 (=> res!422070 e!373520)))

(declare-fun lt!302602 () (_ BitVec 64))

(assert (=> b!650984 (= res!422070 (or (not (= (select (arr!18492 a!2986) j!136) lt!302596)) (not (= (select (arr!18492 a!2986) j!136) lt!302602)) (bvsge j!136 index!984)))))

(declare-fun b!650999 () Bool)

(assert (=> b!650999 (= e!373507 e!373514)))

(declare-fun res!422069 () Bool)

(assert (=> b!650999 (=> (not res!422069) (not e!373514))))

(assert (=> b!650999 (= res!422069 (and (= lt!302606 (Found!6932 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18492 a!2986) index!984) (select (arr!18492 a!2986) j!136))) (not (= (select (arr!18492 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!650999 (= lt!302606 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18492 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!651000 () Bool)

(assert (=> b!651000 (= e!373516 e!373513)))

(declare-fun res!422066 () Bool)

(assert (=> b!651000 (=> res!422066 e!373513)))

(assert (=> b!651000 (= res!422066 (or (not (= (select (arr!18492 a!2986) j!136) lt!302596)) (not (= (select (arr!18492 a!2986) j!136) lt!302602))))))

(assert (=> b!651000 e!373510))

(declare-fun res!422071 () Bool)

(assert (=> b!651000 (=> (not res!422071) (not e!373510))))

(assert (=> b!651000 (= res!422071 (= lt!302602 (select (arr!18492 a!2986) j!136)))))

(assert (=> b!651000 (= lt!302602 (select (store (arr!18492 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!651001 () Bool)

(assert (=> b!651001 (= e!373518 (arrayContainsKey!0 lt!302597 (select (arr!18492 a!2986) j!136) index!984))))

(declare-fun b!651002 () Bool)

(declare-fun res!422063 () Bool)

(assert (=> b!651002 (=> (not res!422063) (not e!373511))))

(assert (=> b!651002 (= res!422063 (validKeyInArray!0 (select (arr!18492 a!2986) j!136)))))

(assert (= (and start!58994 res!422068) b!650998))

(assert (= (and b!650998 res!422076) b!651002))

(assert (= (and b!651002 res!422063) b!650995))

(assert (= (and b!650995 res!422075) b!650989))

(assert (= (and b!650989 res!422078) b!650985))

(assert (= (and b!650985 res!422077) b!650982))

(assert (= (and b!650982 res!422061) b!650990))

(assert (= (and b!650990 res!422064) b!650997))

(assert (= (and b!650997 res!422060) b!650992))

(assert (= (and b!650992 res!422065) b!650999))

(assert (= (and b!650999 res!422069) b!650988))

(assert (= (and b!650988 res!422074) b!650981))

(assert (= (and b!650988 c!74827) b!650991))

(assert (= (and b!650988 (not c!74827)) b!650980))

(assert (= (and b!650988 (not res!422072)) b!651000))

(assert (= (and b!651000 res!422071) b!650984))

(assert (= (and b!650984 (not res!422070)) b!650993))

(assert (= (and b!650993 res!422073) b!650987))

(assert (= (and b!651000 (not res!422066)) b!650986))

(assert (= (and b!650986 c!74828) b!650996))

(assert (= (and b!650986 (not c!74828)) b!650994))

(assert (= (and b!650986 (not res!422067)) b!650983))

(assert (= (and b!650983 res!422062) b!651001))

(declare-fun m!624143 () Bool)

(assert (=> b!650997 m!624143))

(declare-fun m!624145 () Bool)

(assert (=> b!650999 m!624145))

(declare-fun m!624147 () Bool)

(assert (=> b!650999 m!624147))

(assert (=> b!650999 m!624147))

(declare-fun m!624149 () Bool)

(assert (=> b!650999 m!624149))

(declare-fun m!624151 () Bool)

(assert (=> b!650992 m!624151))

(declare-fun m!624153 () Bool)

(assert (=> b!650992 m!624153))

(declare-fun m!624155 () Bool)

(assert (=> b!650988 m!624155))

(declare-fun m!624157 () Bool)

(assert (=> b!650988 m!624157))

(declare-fun m!624159 () Bool)

(assert (=> b!650988 m!624159))

(assert (=> b!650988 m!624147))

(assert (=> b!650988 m!624151))

(assert (=> b!650988 m!624147))

(declare-fun m!624161 () Bool)

(assert (=> b!650988 m!624161))

(declare-fun m!624163 () Bool)

(assert (=> b!650988 m!624163))

(declare-fun m!624165 () Bool)

(assert (=> b!650988 m!624165))

(declare-fun m!624167 () Bool)

(assert (=> b!650982 m!624167))

(assert (=> b!651001 m!624147))

(assert (=> b!651001 m!624147))

(declare-fun m!624169 () Bool)

(assert (=> b!651001 m!624169))

(assert (=> b!651002 m!624147))

(assert (=> b!651002 m!624147))

(declare-fun m!624171 () Bool)

(assert (=> b!651002 m!624171))

(declare-fun m!624173 () Bool)

(assert (=> b!650989 m!624173))

(assert (=> b!650993 m!624147))

(assert (=> b!650993 m!624147))

(declare-fun m!624175 () Bool)

(assert (=> b!650993 m!624175))

(declare-fun m!624177 () Bool)

(assert (=> start!58994 m!624177))

(declare-fun m!624179 () Bool)

(assert (=> start!58994 m!624179))

(assert (=> b!650984 m!624147))

(declare-fun m!624181 () Bool)

(assert (=> b!650996 m!624181))

(assert (=> b!650996 m!624147))

(assert (=> b!650996 m!624147))

(declare-fun m!624183 () Bool)

(assert (=> b!650996 m!624183))

(declare-fun m!624185 () Bool)

(assert (=> b!650996 m!624185))

(declare-fun m!624187 () Bool)

(assert (=> b!650996 m!624187))

(declare-fun m!624189 () Bool)

(assert (=> b!650996 m!624189))

(assert (=> b!650996 m!624147))

(declare-fun m!624191 () Bool)

(assert (=> b!650996 m!624191))

(assert (=> b!650996 m!624147))

(declare-fun m!624193 () Bool)

(assert (=> b!650996 m!624193))

(declare-fun m!624195 () Bool)

(assert (=> b!650995 m!624195))

(declare-fun m!624197 () Bool)

(assert (=> b!650985 m!624197))

(assert (=> b!650983 m!624147))

(assert (=> b!650983 m!624175))

(assert (=> b!650983 m!624147))

(assert (=> b!650983 m!624147))

(declare-fun m!624199 () Bool)

(assert (=> b!650983 m!624199))

(assert (=> b!650983 m!624147))

(declare-fun m!624201 () Bool)

(assert (=> b!650983 m!624201))

(assert (=> b!650983 m!624187))

(assert (=> b!650983 m!624189))

(declare-fun m!624203 () Bool)

(assert (=> b!650990 m!624203))

(assert (=> b!650987 m!624147))

(assert (=> b!650987 m!624147))

(assert (=> b!650987 m!624169))

(assert (=> b!651000 m!624147))

(assert (=> b!651000 m!624151))

(declare-fun m!624205 () Bool)

(assert (=> b!651000 m!624205))

(push 1)

