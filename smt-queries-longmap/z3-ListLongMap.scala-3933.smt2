; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53610 () Bool)

(assert start!53610)

(declare-fun b!583890 () Bool)

(declare-fun res!371716 () Bool)

(declare-fun e!334470 () Bool)

(assert (=> b!583890 (=> (not res!371716) (not e!334470))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36511 0))(
  ( (array!36512 (arr!17530 (Array (_ BitVec 32) (_ BitVec 64))) (size!17894 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36511)

(assert (=> b!583890 (= res!371716 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17530 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17530 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583891 () Bool)

(declare-fun res!371717 () Bool)

(assert (=> b!583891 (=> (not res!371717) (not e!334470))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!583891 (= res!371717 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17530 a!2986) index!984) (select (arr!17530 a!2986) j!136))) (not (= (select (arr!17530 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!583892 () Bool)

(declare-fun res!371711 () Bool)

(declare-fun e!334468 () Bool)

(assert (=> b!583892 (=> (not res!371711) (not e!334468))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583892 (= res!371711 (validKeyInArray!0 k0!1786))))

(declare-fun b!583893 () Bool)

(declare-fun res!371712 () Bool)

(assert (=> b!583893 (=> (not res!371712) (not e!334468))))

(declare-fun arrayContainsKey!0 (array!36511 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583893 (= res!371712 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583894 () Bool)

(declare-fun res!371715 () Bool)

(assert (=> b!583894 (=> (not res!371715) (not e!334470))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36511 (_ BitVec 32)) Bool)

(assert (=> b!583894 (= res!371715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!371710 () Bool)

(assert (=> start!53610 (=> (not res!371710) (not e!334468))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53610 (= res!371710 (validMask!0 mask!3053))))

(assert (=> start!53610 e!334468))

(assert (=> start!53610 true))

(declare-fun array_inv!13326 (array!36511) Bool)

(assert (=> start!53610 (array_inv!13326 a!2986)))

(declare-fun b!583895 () Bool)

(declare-fun e!334469 () Bool)

(assert (=> b!583895 (= e!334469 false)))

(declare-fun lt!265436 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5970 0))(
  ( (MissingZero!5970 (index!26107 (_ BitVec 32))) (Found!5970 (index!26108 (_ BitVec 32))) (Intermediate!5970 (undefined!6782 Bool) (index!26109 (_ BitVec 32)) (x!54943 (_ BitVec 32))) (Undefined!5970) (MissingVacant!5970 (index!26110 (_ BitVec 32))) )
))
(declare-fun lt!265438 () SeekEntryResult!5970)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36511 (_ BitVec 32)) SeekEntryResult!5970)

(assert (=> b!583895 (= lt!265438 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265436 vacantSpotIndex!68 (select (arr!17530 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583896 () Bool)

(declare-fun res!371706 () Bool)

(assert (=> b!583896 (=> (not res!371706) (not e!334468))))

(assert (=> b!583896 (= res!371706 (validKeyInArray!0 (select (arr!17530 a!2986) j!136)))))

(declare-fun b!583897 () Bool)

(assert (=> b!583897 (= e!334468 e!334470)))

(declare-fun res!371709 () Bool)

(assert (=> b!583897 (=> (not res!371709) (not e!334470))))

(declare-fun lt!265437 () SeekEntryResult!5970)

(assert (=> b!583897 (= res!371709 (or (= lt!265437 (MissingZero!5970 i!1108)) (= lt!265437 (MissingVacant!5970 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36511 (_ BitVec 32)) SeekEntryResult!5970)

(assert (=> b!583897 (= lt!265437 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!583898 () Bool)

(declare-fun res!371714 () Bool)

(assert (=> b!583898 (=> (not res!371714) (not e!334470))))

(declare-datatypes ((List!11571 0))(
  ( (Nil!11568) (Cons!11567 (h!12612 (_ BitVec 64)) (t!17799 List!11571)) )
))
(declare-fun arrayNoDuplicates!0 (array!36511 (_ BitVec 32) List!11571) Bool)

(assert (=> b!583898 (= res!371714 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11568))))

(declare-fun b!583899 () Bool)

(declare-fun res!371708 () Bool)

(assert (=> b!583899 (=> (not res!371708) (not e!334468))))

(assert (=> b!583899 (= res!371708 (and (= (size!17894 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17894 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17894 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583900 () Bool)

(assert (=> b!583900 (= e!334470 e!334469)))

(declare-fun res!371713 () Bool)

(assert (=> b!583900 (=> (not res!371713) (not e!334469))))

(assert (=> b!583900 (= res!371713 (and (bvsge lt!265436 #b00000000000000000000000000000000) (bvslt lt!265436 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!583900 (= lt!265436 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!583901 () Bool)

(declare-fun res!371707 () Bool)

(assert (=> b!583901 (=> (not res!371707) (not e!334470))))

(assert (=> b!583901 (= res!371707 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17530 a!2986) j!136) a!2986 mask!3053) (Found!5970 j!136)))))

(assert (= (and start!53610 res!371710) b!583899))

(assert (= (and b!583899 res!371708) b!583896))

(assert (= (and b!583896 res!371706) b!583892))

(assert (= (and b!583892 res!371711) b!583893))

(assert (= (and b!583893 res!371712) b!583897))

(assert (= (and b!583897 res!371709) b!583894))

(assert (= (and b!583894 res!371715) b!583898))

(assert (= (and b!583898 res!371714) b!583890))

(assert (= (and b!583890 res!371716) b!583901))

(assert (= (and b!583901 res!371707) b!583891))

(assert (= (and b!583891 res!371717) b!583900))

(assert (= (and b!583900 res!371713) b!583895))

(declare-fun m!562305 () Bool)

(assert (=> b!583896 m!562305))

(assert (=> b!583896 m!562305))

(declare-fun m!562307 () Bool)

(assert (=> b!583896 m!562307))

(declare-fun m!562309 () Bool)

(assert (=> b!583900 m!562309))

(declare-fun m!562311 () Bool)

(assert (=> start!53610 m!562311))

(declare-fun m!562313 () Bool)

(assert (=> start!53610 m!562313))

(declare-fun m!562315 () Bool)

(assert (=> b!583890 m!562315))

(declare-fun m!562317 () Bool)

(assert (=> b!583890 m!562317))

(declare-fun m!562319 () Bool)

(assert (=> b!583890 m!562319))

(declare-fun m!562321 () Bool)

(assert (=> b!583897 m!562321))

(declare-fun m!562323 () Bool)

(assert (=> b!583898 m!562323))

(assert (=> b!583895 m!562305))

(assert (=> b!583895 m!562305))

(declare-fun m!562325 () Bool)

(assert (=> b!583895 m!562325))

(assert (=> b!583901 m!562305))

(assert (=> b!583901 m!562305))

(declare-fun m!562327 () Bool)

(assert (=> b!583901 m!562327))

(declare-fun m!562329 () Bool)

(assert (=> b!583894 m!562329))

(declare-fun m!562331 () Bool)

(assert (=> b!583893 m!562331))

(declare-fun m!562333 () Bool)

(assert (=> b!583891 m!562333))

(assert (=> b!583891 m!562305))

(declare-fun m!562335 () Bool)

(assert (=> b!583892 m!562335))

(check-sat (not b!583895) (not b!583896) (not b!583901) (not b!583897) (not b!583893) (not b!583898) (not b!583892) (not start!53610) (not b!583900) (not b!583894))
(check-sat)
