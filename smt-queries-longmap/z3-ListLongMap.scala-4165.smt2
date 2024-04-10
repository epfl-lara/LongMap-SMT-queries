; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56734 () Bool)

(assert start!56734)

(declare-fun b!628579 () Bool)

(declare-fun lt!290529 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun e!359645 () Bool)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!628579 (= e!359645 (and (bvsge lt!290529 #b00000000000000000000000000000000) (bvslt lt!290529 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628579 (= lt!290529 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!628580 () Bool)

(declare-fun res!406142 () Bool)

(assert (=> b!628580 (=> (not res!406142) (not e!359645))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37975 0))(
  ( (array!37976 (arr!18226 (Array (_ BitVec 32) (_ BitVec 64))) (size!18590 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37975)

(assert (=> b!628580 (= res!406142 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18226 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18226 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!406135 () Bool)

(declare-fun e!359644 () Bool)

(assert (=> start!56734 (=> (not res!406135) (not e!359644))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56734 (= res!406135 (validMask!0 mask!3053))))

(assert (=> start!56734 e!359644))

(assert (=> start!56734 true))

(declare-fun array_inv!14022 (array!37975) Bool)

(assert (=> start!56734 (array_inv!14022 a!2986)))

(declare-fun b!628581 () Bool)

(declare-fun res!406145 () Bool)

(assert (=> b!628581 (=> (not res!406145) (not e!359645))))

(declare-datatypes ((List!12267 0))(
  ( (Nil!12264) (Cons!12263 (h!13308 (_ BitVec 64)) (t!18495 List!12267)) )
))
(declare-fun arrayNoDuplicates!0 (array!37975 (_ BitVec 32) List!12267) Bool)

(assert (=> b!628581 (= res!406145 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12264))))

(declare-fun b!628582 () Bool)

(declare-fun res!406140 () Bool)

(assert (=> b!628582 (=> (not res!406140) (not e!359644))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!628582 (= res!406140 (and (= (size!18590 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18590 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18590 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!628583 () Bool)

(declare-fun res!406141 () Bool)

(assert (=> b!628583 (=> (not res!406141) (not e!359645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37975 (_ BitVec 32)) Bool)

(assert (=> b!628583 (= res!406141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!628584 () Bool)

(declare-fun res!406139 () Bool)

(assert (=> b!628584 (=> (not res!406139) (not e!359644))))

(declare-fun arrayContainsKey!0 (array!37975 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628584 (= res!406139 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!628585 () Bool)

(declare-fun res!406136 () Bool)

(assert (=> b!628585 (=> (not res!406136) (not e!359644))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628585 (= res!406136 (validKeyInArray!0 (select (arr!18226 a!2986) j!136)))))

(declare-fun b!628586 () Bool)

(declare-fun res!406137 () Bool)

(assert (=> b!628586 (=> (not res!406137) (not e!359645))))

(declare-datatypes ((SeekEntryResult!6666 0))(
  ( (MissingZero!6666 (index!28948 (_ BitVec 32))) (Found!6666 (index!28949 (_ BitVec 32))) (Intermediate!6666 (undefined!7478 Bool) (index!28950 (_ BitVec 32)) (x!57684 (_ BitVec 32))) (Undefined!6666) (MissingVacant!6666 (index!28951 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37975 (_ BitVec 32)) SeekEntryResult!6666)

(assert (=> b!628586 (= res!406137 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18226 a!2986) j!136) a!2986 mask!3053) (Found!6666 j!136)))))

(declare-fun b!628587 () Bool)

(assert (=> b!628587 (= e!359644 e!359645)))

(declare-fun res!406143 () Bool)

(assert (=> b!628587 (=> (not res!406143) (not e!359645))))

(declare-fun lt!290530 () SeekEntryResult!6666)

(assert (=> b!628587 (= res!406143 (or (= lt!290530 (MissingZero!6666 i!1108)) (= lt!290530 (MissingVacant!6666 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37975 (_ BitVec 32)) SeekEntryResult!6666)

(assert (=> b!628587 (= lt!290530 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!628588 () Bool)

(declare-fun res!406144 () Bool)

(assert (=> b!628588 (=> (not res!406144) (not e!359645))))

(assert (=> b!628588 (= res!406144 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18226 a!2986) index!984) (select (arr!18226 a!2986) j!136))) (not (= (select (arr!18226 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!628589 () Bool)

(declare-fun res!406138 () Bool)

(assert (=> b!628589 (=> (not res!406138) (not e!359644))))

(assert (=> b!628589 (= res!406138 (validKeyInArray!0 k0!1786))))

(assert (= (and start!56734 res!406135) b!628582))

(assert (= (and b!628582 res!406140) b!628585))

(assert (= (and b!628585 res!406136) b!628589))

(assert (= (and b!628589 res!406138) b!628584))

(assert (= (and b!628584 res!406139) b!628587))

(assert (= (and b!628587 res!406143) b!628583))

(assert (= (and b!628583 res!406141) b!628581))

(assert (= (and b!628581 res!406145) b!628580))

(assert (= (and b!628580 res!406142) b!628586))

(assert (= (and b!628586 res!406137) b!628588))

(assert (= (and b!628588 res!406144) b!628579))

(declare-fun m!603717 () Bool)

(assert (=> start!56734 m!603717))

(declare-fun m!603719 () Bool)

(assert (=> start!56734 m!603719))

(declare-fun m!603721 () Bool)

(assert (=> b!628588 m!603721))

(declare-fun m!603723 () Bool)

(assert (=> b!628588 m!603723))

(declare-fun m!603725 () Bool)

(assert (=> b!628584 m!603725))

(assert (=> b!628586 m!603723))

(assert (=> b!628586 m!603723))

(declare-fun m!603727 () Bool)

(assert (=> b!628586 m!603727))

(declare-fun m!603729 () Bool)

(assert (=> b!628583 m!603729))

(declare-fun m!603731 () Bool)

(assert (=> b!628579 m!603731))

(declare-fun m!603733 () Bool)

(assert (=> b!628580 m!603733))

(declare-fun m!603735 () Bool)

(assert (=> b!628580 m!603735))

(declare-fun m!603737 () Bool)

(assert (=> b!628580 m!603737))

(declare-fun m!603739 () Bool)

(assert (=> b!628589 m!603739))

(declare-fun m!603741 () Bool)

(assert (=> b!628581 m!603741))

(declare-fun m!603743 () Bool)

(assert (=> b!628587 m!603743))

(assert (=> b!628585 m!603723))

(assert (=> b!628585 m!603723))

(declare-fun m!603745 () Bool)

(assert (=> b!628585 m!603745))

(check-sat (not b!628587) (not b!628581) (not b!628584) (not b!628583) (not b!628585) (not start!56734) (not b!628579) (not b!628586) (not b!628589))
(check-sat)
