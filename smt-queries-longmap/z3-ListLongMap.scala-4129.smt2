; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56370 () Bool)

(assert start!56370)

(declare-fun b!624692 () Bool)

(declare-fun res!402738 () Bool)

(declare-fun e!358234 () Bool)

(assert (=> b!624692 (=> (not res!402738) (not e!358234))))

(declare-datatypes ((array!37740 0))(
  ( (array!37741 (arr!18112 (Array (_ BitVec 32) (_ BitVec 64))) (size!18476 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37740)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37740 (_ BitVec 32)) Bool)

(assert (=> b!624692 (= res!402738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624693 () Bool)

(declare-fun e!358235 () Bool)

(assert (=> b!624693 (= e!358235 e!358234)))

(declare-fun res!402737 () Bool)

(assert (=> b!624693 (=> (not res!402737) (not e!358234))))

(declare-datatypes ((SeekEntryResult!6508 0))(
  ( (MissingZero!6508 (index!28316 (_ BitVec 32))) (Found!6508 (index!28317 (_ BitVec 32))) (Intermediate!6508 (undefined!7320 Bool) (index!28318 (_ BitVec 32)) (x!57226 (_ BitVec 32))) (Undefined!6508) (MissingVacant!6508 (index!28319 (_ BitVec 32))) )
))
(declare-fun lt!289710 () SeekEntryResult!6508)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624693 (= res!402737 (or (= lt!289710 (MissingZero!6508 i!1108)) (= lt!289710 (MissingVacant!6508 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37740 (_ BitVec 32)) SeekEntryResult!6508)

(assert (=> b!624693 (= lt!289710 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!624694 () Bool)

(declare-fun res!402743 () Bool)

(assert (=> b!624694 (=> (not res!402743) (not e!358235))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!624694 (= res!402743 (and (= (size!18476 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18476 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18476 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624695 () Bool)

(declare-fun res!402740 () Bool)

(assert (=> b!624695 (=> (not res!402740) (not e!358234))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!624695 (= res!402740 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18112 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18112 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!624696 () Bool)

(declare-fun res!402739 () Bool)

(assert (=> b!624696 (=> (not res!402739) (not e!358235))))

(declare-fun arrayContainsKey!0 (array!37740 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624696 (= res!402739 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624697 () Bool)

(assert (=> b!624697 (= e!358234 false)))

(declare-fun lt!289711 () SeekEntryResult!6508)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37740 (_ BitVec 32)) SeekEntryResult!6508)

(assert (=> b!624697 (= lt!289711 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18112 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!624698 () Bool)

(declare-fun res!402741 () Bool)

(assert (=> b!624698 (=> (not res!402741) (not e!358235))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624698 (= res!402741 (validKeyInArray!0 (select (arr!18112 a!2986) j!136)))))

(declare-fun res!402742 () Bool)

(assert (=> start!56370 (=> (not res!402742) (not e!358235))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56370 (= res!402742 (validMask!0 mask!3053))))

(assert (=> start!56370 e!358235))

(assert (=> start!56370 true))

(declare-fun array_inv!13971 (array!37740) Bool)

(assert (=> start!56370 (array_inv!13971 a!2986)))

(declare-fun b!624699 () Bool)

(declare-fun res!402745 () Bool)

(assert (=> b!624699 (=> (not res!402745) (not e!358234))))

(declare-datatypes ((List!12060 0))(
  ( (Nil!12057) (Cons!12056 (h!13104 (_ BitVec 64)) (t!18280 List!12060)) )
))
(declare-fun arrayNoDuplicates!0 (array!37740 (_ BitVec 32) List!12060) Bool)

(assert (=> b!624699 (= res!402745 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12057))))

(declare-fun b!624700 () Bool)

(declare-fun res!402744 () Bool)

(assert (=> b!624700 (=> (not res!402744) (not e!358235))))

(assert (=> b!624700 (= res!402744 (validKeyInArray!0 k0!1786))))

(assert (= (and start!56370 res!402742) b!624694))

(assert (= (and b!624694 res!402743) b!624698))

(assert (= (and b!624698 res!402741) b!624700))

(assert (= (and b!624700 res!402744) b!624696))

(assert (= (and b!624696 res!402739) b!624693))

(assert (= (and b!624693 res!402737) b!624692))

(assert (= (and b!624692 res!402738) b!624699))

(assert (= (and b!624699 res!402745) b!624695))

(assert (= (and b!624695 res!402740) b!624697))

(declare-fun m!600661 () Bool)

(assert (=> b!624697 m!600661))

(assert (=> b!624697 m!600661))

(declare-fun m!600663 () Bool)

(assert (=> b!624697 m!600663))

(assert (=> b!624698 m!600661))

(assert (=> b!624698 m!600661))

(declare-fun m!600665 () Bool)

(assert (=> b!624698 m!600665))

(declare-fun m!600667 () Bool)

(assert (=> b!624699 m!600667))

(declare-fun m!600669 () Bool)

(assert (=> b!624692 m!600669))

(declare-fun m!600671 () Bool)

(assert (=> b!624696 m!600671))

(declare-fun m!600673 () Bool)

(assert (=> start!56370 m!600673))

(declare-fun m!600675 () Bool)

(assert (=> start!56370 m!600675))

(declare-fun m!600677 () Bool)

(assert (=> b!624700 m!600677))

(declare-fun m!600679 () Bool)

(assert (=> b!624693 m!600679))

(declare-fun m!600681 () Bool)

(assert (=> b!624695 m!600681))

(declare-fun m!600683 () Bool)

(assert (=> b!624695 m!600683))

(declare-fun m!600685 () Bool)

(assert (=> b!624695 m!600685))

(check-sat (not b!624696) (not b!624693) (not b!624700) (not b!624692) (not b!624697) (not b!624699) (not b!624698) (not start!56370))
(check-sat)
