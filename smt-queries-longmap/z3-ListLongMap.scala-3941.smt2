; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53706 () Bool)

(assert start!53706)

(declare-fun b!584927 () Bool)

(declare-fun e!334872 () Bool)

(declare-fun e!334873 () Bool)

(assert (=> b!584927 (= e!334872 e!334873)))

(declare-fun res!372644 () Bool)

(assert (=> b!584927 (=> (not res!372644) (not e!334873))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!265745 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!584927 (= res!372644 (and (bvsge lt!265745 #b00000000000000000000000000000000) (bvslt lt!265745 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584927 (= lt!265745 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!584928 () Bool)

(assert (=> b!584928 (= e!334873 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5944 0))(
  ( (MissingZero!5944 (index!26003 (_ BitVec 32))) (Found!5944 (index!26004 (_ BitVec 32))) (Intermediate!5944 (undefined!6756 Bool) (index!26005 (_ BitVec 32)) (x!54984 (_ BitVec 32))) (Undefined!5944) (MissingVacant!5944 (index!26006 (_ BitVec 32))) )
))
(declare-fun lt!265747 () SeekEntryResult!5944)

(declare-datatypes ((array!36552 0))(
  ( (array!36553 (arr!17548 (Array (_ BitVec 32) (_ BitVec 64))) (size!17912 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36552)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36552 (_ BitVec 32)) SeekEntryResult!5944)

(assert (=> b!584928 (= lt!265747 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265745 vacantSpotIndex!68 (select (arr!17548 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584929 () Bool)

(declare-fun res!372640 () Bool)

(assert (=> b!584929 (=> (not res!372640) (not e!334872))))

(assert (=> b!584929 (= res!372640 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17548 a!2986) j!136) a!2986 mask!3053) (Found!5944 j!136)))))

(declare-fun b!584930 () Bool)

(declare-fun res!372642 () Bool)

(declare-fun e!334874 () Bool)

(assert (=> b!584930 (=> (not res!372642) (not e!334874))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!584930 (= res!372642 (and (= (size!17912 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17912 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17912 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584931 () Bool)

(declare-fun res!372645 () Bool)

(assert (=> b!584931 (=> (not res!372645) (not e!334872))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36552 (_ BitVec 32)) Bool)

(assert (=> b!584931 (= res!372645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584932 () Bool)

(declare-fun res!372648 () Bool)

(assert (=> b!584932 (=> (not res!372648) (not e!334872))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!584932 (= res!372648 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17548 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17548 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!372638 () Bool)

(assert (=> start!53706 (=> (not res!372638) (not e!334874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53706 (= res!372638 (validMask!0 mask!3053))))

(assert (=> start!53706 e!334874))

(assert (=> start!53706 true))

(declare-fun array_inv!13407 (array!36552) Bool)

(assert (=> start!53706 (array_inv!13407 a!2986)))

(declare-fun b!584933 () Bool)

(declare-fun res!372649 () Bool)

(assert (=> b!584933 (=> (not res!372649) (not e!334872))))

(assert (=> b!584933 (= res!372649 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17548 a!2986) index!984) (select (arr!17548 a!2986) j!136))) (not (= (select (arr!17548 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584934 () Bool)

(declare-fun res!372643 () Bool)

(assert (=> b!584934 (=> (not res!372643) (not e!334874))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584934 (= res!372643 (validKeyInArray!0 k0!1786))))

(declare-fun b!584935 () Bool)

(declare-fun res!372646 () Bool)

(assert (=> b!584935 (=> (not res!372646) (not e!334874))))

(declare-fun arrayContainsKey!0 (array!36552 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584935 (= res!372646 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584936 () Bool)

(declare-fun res!372647 () Bool)

(assert (=> b!584936 (=> (not res!372647) (not e!334874))))

(assert (=> b!584936 (= res!372647 (validKeyInArray!0 (select (arr!17548 a!2986) j!136)))))

(declare-fun b!584937 () Bool)

(assert (=> b!584937 (= e!334874 e!334872)))

(declare-fun res!372641 () Bool)

(assert (=> b!584937 (=> (not res!372641) (not e!334872))))

(declare-fun lt!265746 () SeekEntryResult!5944)

(assert (=> b!584937 (= res!372641 (or (= lt!265746 (MissingZero!5944 i!1108)) (= lt!265746 (MissingVacant!5944 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36552 (_ BitVec 32)) SeekEntryResult!5944)

(assert (=> b!584937 (= lt!265746 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!584938 () Bool)

(declare-fun res!372639 () Bool)

(assert (=> b!584938 (=> (not res!372639) (not e!334872))))

(declare-datatypes ((List!11496 0))(
  ( (Nil!11493) (Cons!11492 (h!12540 (_ BitVec 64)) (t!17716 List!11496)) )
))
(declare-fun arrayNoDuplicates!0 (array!36552 (_ BitVec 32) List!11496) Bool)

(assert (=> b!584938 (= res!372639 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11493))))

(assert (= (and start!53706 res!372638) b!584930))

(assert (= (and b!584930 res!372642) b!584936))

(assert (= (and b!584936 res!372647) b!584934))

(assert (= (and b!584934 res!372643) b!584935))

(assert (= (and b!584935 res!372646) b!584937))

(assert (= (and b!584937 res!372641) b!584931))

(assert (= (and b!584931 res!372645) b!584938))

(assert (= (and b!584938 res!372639) b!584932))

(assert (= (and b!584932 res!372648) b!584929))

(assert (= (and b!584929 res!372640) b!584933))

(assert (= (and b!584933 res!372649) b!584927))

(assert (= (and b!584927 res!372644) b!584928))

(declare-fun m!563399 () Bool)

(assert (=> b!584928 m!563399))

(assert (=> b!584928 m!563399))

(declare-fun m!563401 () Bool)

(assert (=> b!584928 m!563401))

(declare-fun m!563403 () Bool)

(assert (=> b!584935 m!563403))

(declare-fun m!563405 () Bool)

(assert (=> b!584934 m!563405))

(declare-fun m!563407 () Bool)

(assert (=> start!53706 m!563407))

(declare-fun m!563409 () Bool)

(assert (=> start!53706 m!563409))

(declare-fun m!563411 () Bool)

(assert (=> b!584927 m!563411))

(declare-fun m!563413 () Bool)

(assert (=> b!584938 m!563413))

(declare-fun m!563415 () Bool)

(assert (=> b!584932 m!563415))

(declare-fun m!563417 () Bool)

(assert (=> b!584932 m!563417))

(declare-fun m!563419 () Bool)

(assert (=> b!584932 m!563419))

(declare-fun m!563421 () Bool)

(assert (=> b!584933 m!563421))

(assert (=> b!584933 m!563399))

(declare-fun m!563423 () Bool)

(assert (=> b!584931 m!563423))

(assert (=> b!584929 m!563399))

(assert (=> b!584929 m!563399))

(declare-fun m!563425 () Bool)

(assert (=> b!584929 m!563425))

(assert (=> b!584936 m!563399))

(assert (=> b!584936 m!563399))

(declare-fun m!563427 () Bool)

(assert (=> b!584936 m!563427))

(declare-fun m!563429 () Bool)

(assert (=> b!584937 m!563429))

(check-sat (not b!584928) (not b!584938) (not b!584935) (not b!584934) (not b!584936) (not b!584929) (not b!584927) (not b!584937) (not b!584931) (not start!53706))
(check-sat)
