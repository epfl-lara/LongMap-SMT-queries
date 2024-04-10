; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56284 () Bool)

(assert start!56284)

(declare-fun b!623955 () Bool)

(declare-fun res!402138 () Bool)

(declare-fun e!357870 () Bool)

(assert (=> b!623955 (=> (not res!402138) (not e!357870))))

(declare-datatypes ((array!37709 0))(
  ( (array!37710 (arr!18099 (Array (_ BitVec 32) (_ BitVec 64))) (size!18463 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37709)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!623955 (= res!402138 (validKeyInArray!0 (select (arr!18099 a!2986) j!136)))))

(declare-fun b!623956 () Bool)

(declare-fun res!402145 () Bool)

(declare-fun e!357863 () Bool)

(assert (=> b!623956 (=> (not res!402145) (not e!357863))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!623956 (= res!402145 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18099 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!623957 () Bool)

(declare-datatypes ((Unit!21064 0))(
  ( (Unit!21065) )
))
(declare-fun e!357867 () Unit!21064)

(declare-fun Unit!21066 () Unit!21064)

(assert (=> b!623957 (= e!357867 Unit!21066)))

(declare-fun b!623958 () Bool)

(declare-fun e!357869 () Bool)

(declare-fun e!357866 () Bool)

(assert (=> b!623958 (= e!357869 (not e!357866))))

(declare-fun res!402139 () Bool)

(assert (=> b!623958 (=> res!402139 e!357866)))

(declare-datatypes ((SeekEntryResult!6539 0))(
  ( (MissingZero!6539 (index!28440 (_ BitVec 32))) (Found!6539 (index!28441 (_ BitVec 32))) (Intermediate!6539 (undefined!7351 Bool) (index!28442 (_ BitVec 32)) (x!57206 (_ BitVec 32))) (Undefined!6539) (MissingVacant!6539 (index!28443 (_ BitVec 32))) )
))
(declare-fun lt!289412 () SeekEntryResult!6539)

(assert (=> b!623958 (= res!402139 (not (= lt!289412 (Found!6539 index!984))))))

(declare-fun lt!289409 () Unit!21064)

(assert (=> b!623958 (= lt!289409 e!357867)))

(declare-fun c!71276 () Bool)

(assert (=> b!623958 (= c!71276 (= lt!289412 Undefined!6539))))

(declare-fun lt!289406 () (_ BitVec 64))

(declare-fun lt!289408 () array!37709)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37709 (_ BitVec 32)) SeekEntryResult!6539)

(assert (=> b!623958 (= lt!289412 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!289406 lt!289408 mask!3053))))

(declare-fun e!357865 () Bool)

(assert (=> b!623958 e!357865))

(declare-fun res!402149 () Bool)

(assert (=> b!623958 (=> (not res!402149) (not e!357865))))

(declare-fun lt!289407 () (_ BitVec 32))

(declare-fun lt!289413 () SeekEntryResult!6539)

(assert (=> b!623958 (= res!402149 (= lt!289413 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289407 vacantSpotIndex!68 lt!289406 lt!289408 mask!3053)))))

(assert (=> b!623958 (= lt!289413 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289407 vacantSpotIndex!68 (select (arr!18099 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!623958 (= lt!289406 (select (store (arr!18099 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!289410 () Unit!21064)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37709 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21064)

(assert (=> b!623958 (= lt!289410 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!289407 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!623958 (= lt!289407 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!402143 () Bool)

(assert (=> start!56284 (=> (not res!402143) (not e!357870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56284 (= res!402143 (validMask!0 mask!3053))))

(assert (=> start!56284 e!357870))

(assert (=> start!56284 true))

(declare-fun array_inv!13895 (array!37709) Bool)

(assert (=> start!56284 (array_inv!13895 a!2986)))

(declare-fun b!623959 () Bool)

(declare-fun res!402146 () Bool)

(assert (=> b!623959 (=> (not res!402146) (not e!357870))))

(assert (=> b!623959 (= res!402146 (validKeyInArray!0 k!1786))))

(declare-fun b!623960 () Bool)

(declare-fun res!402140 () Bool)

(assert (=> b!623960 (=> (not res!402140) (not e!357870))))

(declare-fun arrayContainsKey!0 (array!37709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!623960 (= res!402140 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!623961 () Bool)

(assert (=> b!623961 (= e!357866 (= (select (arr!18099 a!2986) j!136) lt!289406))))

(assert (=> b!623961 (= (select (store (arr!18099 a!2986) i!1108 k!1786) index!984) (select (arr!18099 a!2986) j!136))))

(declare-fun b!623962 () Bool)

(declare-fun lt!289411 () SeekEntryResult!6539)

(assert (=> b!623962 (= e!357865 (= lt!289411 lt!289413))))

(declare-fun b!623963 () Bool)

(declare-fun res!402144 () Bool)

(assert (=> b!623963 (=> (not res!402144) (not e!357863))))

(declare-datatypes ((List!12140 0))(
  ( (Nil!12137) (Cons!12136 (h!13181 (_ BitVec 64)) (t!18368 List!12140)) )
))
(declare-fun arrayNoDuplicates!0 (array!37709 (_ BitVec 32) List!12140) Bool)

(assert (=> b!623963 (= res!402144 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12137))))

(declare-fun b!623964 () Bool)

(declare-fun e!357868 () Bool)

(assert (=> b!623964 (= e!357863 e!357868)))

(declare-fun res!402137 () Bool)

(assert (=> b!623964 (=> (not res!402137) (not e!357868))))

(assert (=> b!623964 (= res!402137 (= (select (store (arr!18099 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!623964 (= lt!289408 (array!37710 (store (arr!18099 a!2986) i!1108 k!1786) (size!18463 a!2986)))))

(declare-fun b!623965 () Bool)

(assert (=> b!623965 (= e!357868 e!357869)))

(declare-fun res!402147 () Bool)

(assert (=> b!623965 (=> (not res!402147) (not e!357869))))

(assert (=> b!623965 (= res!402147 (and (= lt!289411 (Found!6539 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18099 a!2986) index!984) (select (arr!18099 a!2986) j!136))) (not (= (select (arr!18099 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!623965 (= lt!289411 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18099 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!623966 () Bool)

(declare-fun res!402141 () Bool)

(assert (=> b!623966 (=> (not res!402141) (not e!357863))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37709 (_ BitVec 32)) Bool)

(assert (=> b!623966 (= res!402141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!623967 () Bool)

(declare-fun Unit!21067 () Unit!21064)

(assert (=> b!623967 (= e!357867 Unit!21067)))

(assert (=> b!623967 false))

(declare-fun b!623968 () Bool)

(assert (=> b!623968 (= e!357870 e!357863)))

(declare-fun res!402148 () Bool)

(assert (=> b!623968 (=> (not res!402148) (not e!357863))))

(declare-fun lt!289414 () SeekEntryResult!6539)

(assert (=> b!623968 (= res!402148 (or (= lt!289414 (MissingZero!6539 i!1108)) (= lt!289414 (MissingVacant!6539 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37709 (_ BitVec 32)) SeekEntryResult!6539)

(assert (=> b!623968 (= lt!289414 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!623969 () Bool)

(declare-fun res!402142 () Bool)

(assert (=> b!623969 (=> (not res!402142) (not e!357870))))

(assert (=> b!623969 (= res!402142 (and (= (size!18463 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18463 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18463 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!56284 res!402143) b!623969))

(assert (= (and b!623969 res!402142) b!623955))

(assert (= (and b!623955 res!402138) b!623959))

(assert (= (and b!623959 res!402146) b!623960))

(assert (= (and b!623960 res!402140) b!623968))

(assert (= (and b!623968 res!402148) b!623966))

(assert (= (and b!623966 res!402141) b!623963))

(assert (= (and b!623963 res!402144) b!623956))

(assert (= (and b!623956 res!402145) b!623964))

(assert (= (and b!623964 res!402137) b!623965))

(assert (= (and b!623965 res!402147) b!623958))

(assert (= (and b!623958 res!402149) b!623962))

(assert (= (and b!623958 c!71276) b!623967))

(assert (= (and b!623958 (not c!71276)) b!623957))

(assert (= (and b!623958 (not res!402139)) b!623961))

(declare-fun m!599705 () Bool)

(assert (=> b!623960 m!599705))

(declare-fun m!599707 () Bool)

(assert (=> b!623963 m!599707))

(declare-fun m!599709 () Bool)

(assert (=> b!623965 m!599709))

(declare-fun m!599711 () Bool)

(assert (=> b!623965 m!599711))

(assert (=> b!623965 m!599711))

(declare-fun m!599713 () Bool)

(assert (=> b!623965 m!599713))

(declare-fun m!599715 () Bool)

(assert (=> b!623958 m!599715))

(declare-fun m!599717 () Bool)

(assert (=> b!623958 m!599717))

(assert (=> b!623958 m!599711))

(declare-fun m!599719 () Bool)

(assert (=> b!623958 m!599719))

(declare-fun m!599721 () Bool)

(assert (=> b!623958 m!599721))

(declare-fun m!599723 () Bool)

(assert (=> b!623958 m!599723))

(assert (=> b!623958 m!599711))

(declare-fun m!599725 () Bool)

(assert (=> b!623958 m!599725))

(declare-fun m!599727 () Bool)

(assert (=> b!623958 m!599727))

(declare-fun m!599729 () Bool)

(assert (=> b!623966 m!599729))

(declare-fun m!599731 () Bool)

(assert (=> b!623956 m!599731))

(assert (=> b!623964 m!599719))

(declare-fun m!599733 () Bool)

(assert (=> b!623964 m!599733))

(declare-fun m!599735 () Bool)

(assert (=> b!623968 m!599735))

(declare-fun m!599737 () Bool)

(assert (=> start!56284 m!599737))

(declare-fun m!599739 () Bool)

(assert (=> start!56284 m!599739))

(assert (=> b!623961 m!599711))

(assert (=> b!623961 m!599719))

(declare-fun m!599741 () Bool)

(assert (=> b!623961 m!599741))

(declare-fun m!599743 () Bool)

(assert (=> b!623959 m!599743))

(assert (=> b!623955 m!599711))

(assert (=> b!623955 m!599711))

(declare-fun m!599745 () Bool)

(assert (=> b!623955 m!599745))

(push 1)

