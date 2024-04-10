; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56752 () Bool)

(assert start!56752)

(declare-fun b!628876 () Bool)

(declare-fun res!406434 () Bool)

(declare-fun e!359727 () Bool)

(assert (=> b!628876 (=> (not res!406434) (not e!359727))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37993 0))(
  ( (array!37994 (arr!18235 (Array (_ BitVec 32) (_ BitVec 64))) (size!18599 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37993)

(assert (=> b!628876 (= res!406434 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18235 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18235 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!628877 () Bool)

(assert (=> b!628877 (= e!359727 false)))

(declare-fun lt!290584 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628877 (= lt!290584 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!628878 () Bool)

(declare-fun res!406441 () Bool)

(assert (=> b!628878 (=> (not res!406441) (not e!359727))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!628878 (= res!406441 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18235 a!2986) index!984) (select (arr!18235 a!2986) j!136))) (not (= (select (arr!18235 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun res!406433 () Bool)

(declare-fun e!359726 () Bool)

(assert (=> start!56752 (=> (not res!406433) (not e!359726))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56752 (= res!406433 (validMask!0 mask!3053))))

(assert (=> start!56752 e!359726))

(assert (=> start!56752 true))

(declare-fun array_inv!14031 (array!37993) Bool)

(assert (=> start!56752 (array_inv!14031 a!2986)))

(declare-fun b!628879 () Bool)

(declare-fun res!406432 () Bool)

(assert (=> b!628879 (=> (not res!406432) (not e!359727))))

(declare-datatypes ((SeekEntryResult!6675 0))(
  ( (MissingZero!6675 (index!28984 (_ BitVec 32))) (Found!6675 (index!28985 (_ BitVec 32))) (Intermediate!6675 (undefined!7487 Bool) (index!28986 (_ BitVec 32)) (x!57717 (_ BitVec 32))) (Undefined!6675) (MissingVacant!6675 (index!28987 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37993 (_ BitVec 32)) SeekEntryResult!6675)

(assert (=> b!628879 (= res!406432 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18235 a!2986) j!136) a!2986 mask!3053) (Found!6675 j!136)))))

(declare-fun b!628880 () Bool)

(declare-fun res!406440 () Bool)

(assert (=> b!628880 (=> (not res!406440) (not e!359726))))

(declare-fun arrayContainsKey!0 (array!37993 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628880 (= res!406440 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!628881 () Bool)

(declare-fun res!406435 () Bool)

(assert (=> b!628881 (=> (not res!406435) (not e!359727))))

(declare-datatypes ((List!12276 0))(
  ( (Nil!12273) (Cons!12272 (h!13317 (_ BitVec 64)) (t!18504 List!12276)) )
))
(declare-fun arrayNoDuplicates!0 (array!37993 (_ BitVec 32) List!12276) Bool)

(assert (=> b!628881 (= res!406435 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12273))))

(declare-fun b!628882 () Bool)

(declare-fun res!406437 () Bool)

(assert (=> b!628882 (=> (not res!406437) (not e!359726))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628882 (= res!406437 (validKeyInArray!0 (select (arr!18235 a!2986) j!136)))))

(declare-fun b!628883 () Bool)

(declare-fun res!406439 () Bool)

(assert (=> b!628883 (=> (not res!406439) (not e!359726))))

(assert (=> b!628883 (= res!406439 (validKeyInArray!0 k0!1786))))

(declare-fun b!628884 () Bool)

(declare-fun res!406436 () Bool)

(assert (=> b!628884 (=> (not res!406436) (not e!359726))))

(assert (=> b!628884 (= res!406436 (and (= (size!18599 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18599 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18599 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!628885 () Bool)

(assert (=> b!628885 (= e!359726 e!359727)))

(declare-fun res!406438 () Bool)

(assert (=> b!628885 (=> (not res!406438) (not e!359727))))

(declare-fun lt!290583 () SeekEntryResult!6675)

(assert (=> b!628885 (= res!406438 (or (= lt!290583 (MissingZero!6675 i!1108)) (= lt!290583 (MissingVacant!6675 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37993 (_ BitVec 32)) SeekEntryResult!6675)

(assert (=> b!628885 (= lt!290583 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!628886 () Bool)

(declare-fun res!406442 () Bool)

(assert (=> b!628886 (=> (not res!406442) (not e!359727))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37993 (_ BitVec 32)) Bool)

(assert (=> b!628886 (= res!406442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!56752 res!406433) b!628884))

(assert (= (and b!628884 res!406436) b!628882))

(assert (= (and b!628882 res!406437) b!628883))

(assert (= (and b!628883 res!406439) b!628880))

(assert (= (and b!628880 res!406440) b!628885))

(assert (= (and b!628885 res!406438) b!628886))

(assert (= (and b!628886 res!406442) b!628881))

(assert (= (and b!628881 res!406435) b!628876))

(assert (= (and b!628876 res!406434) b!628879))

(assert (= (and b!628879 res!406432) b!628878))

(assert (= (and b!628878 res!406441) b!628877))

(declare-fun m!603987 () Bool)

(assert (=> b!628885 m!603987))

(declare-fun m!603989 () Bool)

(assert (=> b!628886 m!603989))

(declare-fun m!603991 () Bool)

(assert (=> b!628880 m!603991))

(declare-fun m!603993 () Bool)

(assert (=> b!628882 m!603993))

(assert (=> b!628882 m!603993))

(declare-fun m!603995 () Bool)

(assert (=> b!628882 m!603995))

(assert (=> b!628879 m!603993))

(assert (=> b!628879 m!603993))

(declare-fun m!603997 () Bool)

(assert (=> b!628879 m!603997))

(declare-fun m!603999 () Bool)

(assert (=> b!628877 m!603999))

(declare-fun m!604001 () Bool)

(assert (=> b!628878 m!604001))

(assert (=> b!628878 m!603993))

(declare-fun m!604003 () Bool)

(assert (=> b!628876 m!604003))

(declare-fun m!604005 () Bool)

(assert (=> b!628876 m!604005))

(declare-fun m!604007 () Bool)

(assert (=> b!628876 m!604007))

(declare-fun m!604009 () Bool)

(assert (=> b!628883 m!604009))

(declare-fun m!604011 () Bool)

(assert (=> start!56752 m!604011))

(declare-fun m!604013 () Bool)

(assert (=> start!56752 m!604013))

(declare-fun m!604015 () Bool)

(assert (=> b!628881 m!604015))

(check-sat (not b!628877) (not b!628883) (not b!628882) (not b!628881) (not b!628885) (not b!628886) (not start!56752) (not b!628880) (not b!628879))
(check-sat)
