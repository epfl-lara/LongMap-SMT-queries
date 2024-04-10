; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56280 () Bool)

(assert start!56280)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37705 0))(
  ( (array!37706 (arr!18097 (Array (_ BitVec 32) (_ BitVec 64))) (size!18461 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37705)

(declare-fun b!623885 () Bool)

(declare-fun e!357835 () Bool)

(assert (=> b!623885 (= e!357835 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18097 a!2986) index!984) (select (arr!18097 a!2986) j!136))) (not (= (select (arr!18097 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (= index!984 j!136)))))

(declare-fun b!623886 () Bool)

(declare-fun res!402072 () Bool)

(assert (=> b!623886 (=> (not res!402072) (not e!357835))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!623886 (= res!402072 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18097 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18097 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!623888 () Bool)

(declare-fun res!402076 () Bool)

(assert (=> b!623888 (=> (not res!402076) (not e!357835))))

(declare-datatypes ((SeekEntryResult!6537 0))(
  ( (MissingZero!6537 (index!28432 (_ BitVec 32))) (Found!6537 (index!28433 (_ BitVec 32))) (Intermediate!6537 (undefined!7349 Bool) (index!28434 (_ BitVec 32)) (x!57196 (_ BitVec 32))) (Undefined!6537) (MissingVacant!6537 (index!28435 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37705 (_ BitVec 32)) SeekEntryResult!6537)

(assert (=> b!623888 (= res!402076 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18097 a!2986) j!136) a!2986 mask!3053) (Found!6537 j!136)))))

(declare-fun b!623889 () Bool)

(declare-fun res!402078 () Bool)

(declare-fun e!357837 () Bool)

(assert (=> b!623889 (=> (not res!402078) (not e!357837))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!623889 (= res!402078 (validKeyInArray!0 (select (arr!18097 a!2986) j!136)))))

(declare-fun b!623890 () Bool)

(assert (=> b!623890 (= e!357837 e!357835)))

(declare-fun res!402080 () Bool)

(assert (=> b!623890 (=> (not res!402080) (not e!357835))))

(declare-fun lt!289384 () SeekEntryResult!6537)

(assert (=> b!623890 (= res!402080 (or (= lt!289384 (MissingZero!6537 i!1108)) (= lt!289384 (MissingVacant!6537 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37705 (_ BitVec 32)) SeekEntryResult!6537)

(assert (=> b!623890 (= lt!289384 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!623891 () Bool)

(declare-fun res!402073 () Bool)

(assert (=> b!623891 (=> (not res!402073) (not e!357835))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37705 (_ BitVec 32)) Bool)

(assert (=> b!623891 (= res!402073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!623892 () Bool)

(declare-fun res!402071 () Bool)

(assert (=> b!623892 (=> (not res!402071) (not e!357837))))

(assert (=> b!623892 (= res!402071 (validKeyInArray!0 k0!1786))))

(declare-fun b!623893 () Bool)

(declare-fun res!402074 () Bool)

(assert (=> b!623893 (=> (not res!402074) (not e!357837))))

(assert (=> b!623893 (= res!402074 (and (= (size!18461 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18461 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18461 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!623894 () Bool)

(declare-fun res!402075 () Bool)

(assert (=> b!623894 (=> (not res!402075) (not e!357835))))

(declare-datatypes ((List!12138 0))(
  ( (Nil!12135) (Cons!12134 (h!13179 (_ BitVec 64)) (t!18366 List!12138)) )
))
(declare-fun arrayNoDuplicates!0 (array!37705 (_ BitVec 32) List!12138) Bool)

(assert (=> b!623894 (= res!402075 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12135))))

(declare-fun b!623887 () Bool)

(declare-fun res!402079 () Bool)

(assert (=> b!623887 (=> (not res!402079) (not e!357837))))

(declare-fun arrayContainsKey!0 (array!37705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!623887 (= res!402079 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!402077 () Bool)

(assert (=> start!56280 (=> (not res!402077) (not e!357837))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56280 (= res!402077 (validMask!0 mask!3053))))

(assert (=> start!56280 e!357837))

(assert (=> start!56280 true))

(declare-fun array_inv!13893 (array!37705) Bool)

(assert (=> start!56280 (array_inv!13893 a!2986)))

(assert (= (and start!56280 res!402077) b!623893))

(assert (= (and b!623893 res!402074) b!623889))

(assert (= (and b!623889 res!402078) b!623892))

(assert (= (and b!623892 res!402071) b!623887))

(assert (= (and b!623887 res!402079) b!623890))

(assert (= (and b!623890 res!402080) b!623891))

(assert (= (and b!623891 res!402073) b!623894))

(assert (= (and b!623894 res!402075) b!623886))

(assert (= (and b!623886 res!402072) b!623888))

(assert (= (and b!623888 res!402076) b!623885))

(declare-fun m!599649 () Bool)

(assert (=> b!623892 m!599649))

(declare-fun m!599651 () Bool)

(assert (=> b!623890 m!599651))

(declare-fun m!599653 () Bool)

(assert (=> b!623894 m!599653))

(declare-fun m!599655 () Bool)

(assert (=> start!56280 m!599655))

(declare-fun m!599657 () Bool)

(assert (=> start!56280 m!599657))

(declare-fun m!599659 () Bool)

(assert (=> b!623888 m!599659))

(assert (=> b!623888 m!599659))

(declare-fun m!599661 () Bool)

(assert (=> b!623888 m!599661))

(assert (=> b!623889 m!599659))

(assert (=> b!623889 m!599659))

(declare-fun m!599663 () Bool)

(assert (=> b!623889 m!599663))

(declare-fun m!599665 () Bool)

(assert (=> b!623887 m!599665))

(declare-fun m!599667 () Bool)

(assert (=> b!623885 m!599667))

(assert (=> b!623885 m!599659))

(declare-fun m!599669 () Bool)

(assert (=> b!623886 m!599669))

(declare-fun m!599671 () Bool)

(assert (=> b!623886 m!599671))

(declare-fun m!599673 () Bool)

(assert (=> b!623886 m!599673))

(declare-fun m!599675 () Bool)

(assert (=> b!623891 m!599675))

(check-sat (not b!623890) (not b!623892) (not b!623889) (not b!623891) (not start!56280) (not b!623894) (not b!623888) (not b!623887))
(check-sat)
