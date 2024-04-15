; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54144 () Bool)

(assert start!54144)

(declare-fun b!591431 () Bool)

(declare-fun res!378497 () Bool)

(declare-fun e!337686 () Bool)

(assert (=> b!591431 (=> (not res!378497) (not e!337686))))

(declare-datatypes ((array!36888 0))(
  ( (array!36889 (arr!17714 (Array (_ BitVec 32) (_ BitVec 64))) (size!18079 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36888)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!591431 (= res!378497 (validKeyInArray!0 (select (arr!17714 a!2986) j!136)))))

(declare-fun res!378499 () Bool)

(assert (=> start!54144 (=> (not res!378499) (not e!337686))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54144 (= res!378499 (validMask!0 mask!3053))))

(assert (=> start!54144 e!337686))

(assert (=> start!54144 true))

(declare-fun array_inv!13597 (array!36888) Bool)

(assert (=> start!54144 (array_inv!13597 a!2986)))

(declare-fun b!591432 () Bool)

(declare-datatypes ((Unit!18516 0))(
  ( (Unit!18517) )
))
(declare-fun e!337687 () Unit!18516)

(declare-fun Unit!18518 () Unit!18516)

(assert (=> b!591432 (= e!337687 Unit!18518)))

(declare-fun b!591433 () Bool)

(declare-fun res!378494 () Bool)

(declare-fun e!337694 () Bool)

(assert (=> b!591433 (=> (not res!378494) (not e!337694))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!591433 (= res!378494 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17714 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!591434 () Bool)

(declare-fun Unit!18519 () Unit!18516)

(assert (=> b!591434 (= e!337687 Unit!18519)))

(assert (=> b!591434 false))

(declare-fun b!591435 () Bool)

(declare-fun e!337685 () Bool)

(assert (=> b!591435 (= e!337685 true)))

(declare-fun e!337691 () Bool)

(assert (=> b!591435 e!337691))

(declare-fun res!378490 () Bool)

(assert (=> b!591435 (=> (not res!378490) (not e!337691))))

(declare-fun lt!268287 () (_ BitVec 64))

(assert (=> b!591435 (= res!378490 (= lt!268287 (select (arr!17714 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!591435 (= lt!268287 (select (store (arr!17714 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!591436 () Bool)

(declare-fun e!337688 () Bool)

(assert (=> b!591436 (= e!337691 e!337688)))

(declare-fun res!378493 () Bool)

(assert (=> b!591436 (=> res!378493 e!337688)))

(declare-fun lt!268285 () (_ BitVec 64))

(assert (=> b!591436 (= res!378493 (or (not (= (select (arr!17714 a!2986) j!136) lt!268285)) (not (= (select (arr!17714 a!2986) j!136) lt!268287)) (bvsge j!136 index!984)))))

(declare-fun b!591437 () Bool)

(assert (=> b!591437 (= e!337686 e!337694)))

(declare-fun res!378487 () Bool)

(assert (=> b!591437 (=> (not res!378487) (not e!337694))))

(declare-datatypes ((SeekEntryResult!6151 0))(
  ( (MissingZero!6151 (index!26840 (_ BitVec 32))) (Found!6151 (index!26841 (_ BitVec 32))) (Intermediate!6151 (undefined!6963 Bool) (index!26842 (_ BitVec 32)) (x!55642 (_ BitVec 32))) (Undefined!6151) (MissingVacant!6151 (index!26843 (_ BitVec 32))) )
))
(declare-fun lt!268288 () SeekEntryResult!6151)

(assert (=> b!591437 (= res!378487 (or (= lt!268288 (MissingZero!6151 i!1108)) (= lt!268288 (MissingVacant!6151 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36888 (_ BitVec 32)) SeekEntryResult!6151)

(assert (=> b!591437 (= lt!268288 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun e!337690 () Bool)

(declare-fun lt!268286 () array!36888)

(declare-fun b!591438 () Bool)

(declare-fun arrayContainsKey!0 (array!36888 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!591438 (= e!337690 (arrayContainsKey!0 lt!268286 (select (arr!17714 a!2986) j!136) index!984))))

(declare-fun b!591439 () Bool)

(declare-fun res!378486 () Bool)

(assert (=> b!591439 (=> (not res!378486) (not e!337694))))

(declare-datatypes ((List!11794 0))(
  ( (Nil!11791) (Cons!11790 (h!12835 (_ BitVec 64)) (t!18013 List!11794)) )
))
(declare-fun arrayNoDuplicates!0 (array!36888 (_ BitVec 32) List!11794) Bool)

(assert (=> b!591439 (= res!378486 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11791))))

(declare-fun b!591440 () Bool)

(declare-fun res!378496 () Bool)

(assert (=> b!591440 (=> (not res!378496) (not e!337686))))

(assert (=> b!591440 (= res!378496 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!591441 () Bool)

(declare-fun res!378492 () Bool)

(assert (=> b!591441 (=> (not res!378492) (not e!337686))))

(assert (=> b!591441 (= res!378492 (validKeyInArray!0 k0!1786))))

(declare-fun b!591442 () Bool)

(declare-fun e!337693 () Bool)

(declare-fun e!337689 () Bool)

(assert (=> b!591442 (= e!337693 e!337689)))

(declare-fun res!378498 () Bool)

(assert (=> b!591442 (=> (not res!378498) (not e!337689))))

(declare-fun lt!268283 () SeekEntryResult!6151)

(assert (=> b!591442 (= res!378498 (and (= lt!268283 (Found!6151 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17714 a!2986) index!984) (select (arr!17714 a!2986) j!136))) (not (= (select (arr!17714 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36888 (_ BitVec 32)) SeekEntryResult!6151)

(assert (=> b!591442 (= lt!268283 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17714 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!591443 () Bool)

(declare-fun res!378485 () Bool)

(assert (=> b!591443 (=> (not res!378485) (not e!337694))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36888 (_ BitVec 32)) Bool)

(assert (=> b!591443 (= res!378485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!591444 () Bool)

(assert (=> b!591444 (= e!337689 (not e!337685))))

(declare-fun res!378489 () Bool)

(assert (=> b!591444 (=> res!378489 e!337685)))

(declare-fun lt!268280 () SeekEntryResult!6151)

(assert (=> b!591444 (= res!378489 (not (= lt!268280 (Found!6151 index!984))))))

(declare-fun lt!268284 () Unit!18516)

(assert (=> b!591444 (= lt!268284 e!337687)))

(declare-fun c!66840 () Bool)

(assert (=> b!591444 (= c!66840 (= lt!268280 Undefined!6151))))

(assert (=> b!591444 (= lt!268280 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268285 lt!268286 mask!3053))))

(declare-fun e!337692 () Bool)

(assert (=> b!591444 e!337692))

(declare-fun res!378491 () Bool)

(assert (=> b!591444 (=> (not res!378491) (not e!337692))))

(declare-fun lt!268282 () (_ BitVec 32))

(declare-fun lt!268281 () SeekEntryResult!6151)

(assert (=> b!591444 (= res!378491 (= lt!268281 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268282 vacantSpotIndex!68 lt!268285 lt!268286 mask!3053)))))

(assert (=> b!591444 (= lt!268281 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268282 vacantSpotIndex!68 (select (arr!17714 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!591444 (= lt!268285 (select (store (arr!17714 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!268279 () Unit!18516)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36888 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18516)

(assert (=> b!591444 (= lt!268279 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268282 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!591444 (= lt!268282 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!591445 () Bool)

(declare-fun res!378500 () Bool)

(assert (=> b!591445 (=> (not res!378500) (not e!337686))))

(assert (=> b!591445 (= res!378500 (and (= (size!18079 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18079 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18079 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!591446 () Bool)

(assert (=> b!591446 (= e!337692 (= lt!268283 lt!268281))))

(declare-fun b!591447 () Bool)

(assert (=> b!591447 (= e!337688 e!337690)))

(declare-fun res!378495 () Bool)

(assert (=> b!591447 (=> (not res!378495) (not e!337690))))

(assert (=> b!591447 (= res!378495 (arrayContainsKey!0 lt!268286 (select (arr!17714 a!2986) j!136) j!136))))

(declare-fun b!591448 () Bool)

(assert (=> b!591448 (= e!337694 e!337693)))

(declare-fun res!378488 () Bool)

(assert (=> b!591448 (=> (not res!378488) (not e!337693))))

(assert (=> b!591448 (= res!378488 (= (select (store (arr!17714 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!591448 (= lt!268286 (array!36889 (store (arr!17714 a!2986) i!1108 k0!1786) (size!18079 a!2986)))))

(assert (= (and start!54144 res!378499) b!591445))

(assert (= (and b!591445 res!378500) b!591431))

(assert (= (and b!591431 res!378497) b!591441))

(assert (= (and b!591441 res!378492) b!591440))

(assert (= (and b!591440 res!378496) b!591437))

(assert (= (and b!591437 res!378487) b!591443))

(assert (= (and b!591443 res!378485) b!591439))

(assert (= (and b!591439 res!378486) b!591433))

(assert (= (and b!591433 res!378494) b!591448))

(assert (= (and b!591448 res!378488) b!591442))

(assert (= (and b!591442 res!378498) b!591444))

(assert (= (and b!591444 res!378491) b!591446))

(assert (= (and b!591444 c!66840) b!591434))

(assert (= (and b!591444 (not c!66840)) b!591432))

(assert (= (and b!591444 (not res!378489)) b!591435))

(assert (= (and b!591435 res!378490) b!591436))

(assert (= (and b!591436 (not res!378493)) b!591447))

(assert (= (and b!591447 res!378495) b!591438))

(declare-fun m!569125 () Bool)

(assert (=> b!591441 m!569125))

(declare-fun m!569127 () Bool)

(assert (=> b!591444 m!569127))

(declare-fun m!569129 () Bool)

(assert (=> b!591444 m!569129))

(declare-fun m!569131 () Bool)

(assert (=> b!591444 m!569131))

(declare-fun m!569133 () Bool)

(assert (=> b!591444 m!569133))

(declare-fun m!569135 () Bool)

(assert (=> b!591444 m!569135))

(declare-fun m!569137 () Bool)

(assert (=> b!591444 m!569137))

(assert (=> b!591444 m!569131))

(declare-fun m!569139 () Bool)

(assert (=> b!591444 m!569139))

(declare-fun m!569141 () Bool)

(assert (=> b!591444 m!569141))

(declare-fun m!569143 () Bool)

(assert (=> b!591443 m!569143))

(declare-fun m!569145 () Bool)

(assert (=> b!591440 m!569145))

(declare-fun m!569147 () Bool)

(assert (=> start!54144 m!569147))

(declare-fun m!569149 () Bool)

(assert (=> start!54144 m!569149))

(assert (=> b!591431 m!569131))

(assert (=> b!591431 m!569131))

(declare-fun m!569151 () Bool)

(assert (=> b!591431 m!569151))

(assert (=> b!591435 m!569131))

(assert (=> b!591435 m!569139))

(declare-fun m!569153 () Bool)

(assert (=> b!591435 m!569153))

(declare-fun m!569155 () Bool)

(assert (=> b!591442 m!569155))

(assert (=> b!591442 m!569131))

(assert (=> b!591442 m!569131))

(declare-fun m!569157 () Bool)

(assert (=> b!591442 m!569157))

(assert (=> b!591438 m!569131))

(assert (=> b!591438 m!569131))

(declare-fun m!569159 () Bool)

(assert (=> b!591438 m!569159))

(declare-fun m!569161 () Bool)

(assert (=> b!591437 m!569161))

(declare-fun m!569163 () Bool)

(assert (=> b!591439 m!569163))

(assert (=> b!591448 m!569139))

(declare-fun m!569165 () Bool)

(assert (=> b!591448 m!569165))

(declare-fun m!569167 () Bool)

(assert (=> b!591433 m!569167))

(assert (=> b!591447 m!569131))

(assert (=> b!591447 m!569131))

(declare-fun m!569169 () Bool)

(assert (=> b!591447 m!569169))

(assert (=> b!591436 m!569131))

(check-sat (not b!591447) (not b!591437) (not b!591444) (not b!591439) (not start!54144) (not b!591441) (not b!591440) (not b!591438) (not b!591443) (not b!591442) (not b!591431))
(check-sat)
