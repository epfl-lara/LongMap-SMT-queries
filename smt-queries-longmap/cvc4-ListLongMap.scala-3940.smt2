; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53654 () Bool)

(assert start!53654)

(declare-fun b!584682 () Bool)

(declare-fun res!372504 () Bool)

(declare-fun e!334733 () Bool)

(assert (=> b!584682 (=> (not res!372504) (not e!334733))))

(declare-datatypes ((array!36555 0))(
  ( (array!36556 (arr!17552 (Array (_ BitVec 32) (_ BitVec 64))) (size!17916 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36555)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36555 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584682 (= res!372504 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584683 () Bool)

(declare-fun res!372509 () Bool)

(declare-fun e!334732 () Bool)

(assert (=> b!584683 (=> (not res!372509) (not e!334732))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!584683 (= res!372509 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17552 a!2986) index!984) (select (arr!17552 a!2986) j!136))) (not (= (select (arr!17552 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584685 () Bool)

(assert (=> b!584685 (= e!334733 e!334732)))

(declare-fun res!372503 () Bool)

(assert (=> b!584685 (=> (not res!372503) (not e!334732))))

(declare-datatypes ((SeekEntryResult!5992 0))(
  ( (MissingZero!5992 (index!26195 (_ BitVec 32))) (Found!5992 (index!26196 (_ BitVec 32))) (Intermediate!5992 (undefined!6804 Bool) (index!26197 (_ BitVec 32)) (x!55021 (_ BitVec 32))) (Undefined!5992) (MissingVacant!5992 (index!26198 (_ BitVec 32))) )
))
(declare-fun lt!265634 () SeekEntryResult!5992)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!584685 (= res!372503 (or (= lt!265634 (MissingZero!5992 i!1108)) (= lt!265634 (MissingVacant!5992 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36555 (_ BitVec 32)) SeekEntryResult!5992)

(assert (=> b!584685 (= lt!265634 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!584686 () Bool)

(declare-fun res!372501 () Bool)

(assert (=> b!584686 (=> (not res!372501) (not e!334732))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!584686 (= res!372501 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17552 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17552 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584687 () Bool)

(declare-fun res!372506 () Bool)

(assert (=> b!584687 (=> (not res!372506) (not e!334732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36555 (_ BitVec 32)) Bool)

(assert (=> b!584687 (= res!372506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584688 () Bool)

(declare-fun res!372502 () Bool)

(assert (=> b!584688 (=> (not res!372502) (not e!334732))))

(declare-datatypes ((List!11593 0))(
  ( (Nil!11590) (Cons!11589 (h!12634 (_ BitVec 64)) (t!17821 List!11593)) )
))
(declare-fun arrayNoDuplicates!0 (array!36555 (_ BitVec 32) List!11593) Bool)

(assert (=> b!584688 (= res!372502 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11590))))

(declare-fun b!584689 () Bool)

(declare-fun res!372500 () Bool)

(assert (=> b!584689 (=> (not res!372500) (not e!334733))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584689 (= res!372500 (validKeyInArray!0 k!1786))))

(declare-fun res!372499 () Bool)

(assert (=> start!53654 (=> (not res!372499) (not e!334733))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53654 (= res!372499 (validMask!0 mask!3053))))

(assert (=> start!53654 e!334733))

(assert (=> start!53654 true))

(declare-fun array_inv!13348 (array!36555) Bool)

(assert (=> start!53654 (array_inv!13348 a!2986)))

(declare-fun b!584684 () Bool)

(declare-fun res!372505 () Bool)

(assert (=> b!584684 (=> (not res!372505) (not e!334732))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36555 (_ BitVec 32)) SeekEntryResult!5992)

(assert (=> b!584684 (= res!372505 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17552 a!2986) j!136) a!2986 mask!3053) (Found!5992 j!136)))))

(declare-fun b!584690 () Bool)

(declare-fun res!372498 () Bool)

(assert (=> b!584690 (=> (not res!372498) (not e!334733))))

(assert (=> b!584690 (= res!372498 (validKeyInArray!0 (select (arr!17552 a!2986) j!136)))))

(declare-fun b!584691 () Bool)

(declare-fun res!372507 () Bool)

(assert (=> b!584691 (=> (not res!372507) (not e!334733))))

(assert (=> b!584691 (= res!372507 (and (= (size!17916 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17916 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17916 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584692 () Bool)

(declare-fun e!334731 () Bool)

(assert (=> b!584692 (= e!334731 false)))

(declare-fun lt!265636 () SeekEntryResult!5992)

(declare-fun lt!265635 () (_ BitVec 32))

(assert (=> b!584692 (= lt!265636 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265635 vacantSpotIndex!68 (select (arr!17552 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584693 () Bool)

(assert (=> b!584693 (= e!334732 e!334731)))

(declare-fun res!372508 () Bool)

(assert (=> b!584693 (=> (not res!372508) (not e!334731))))

(assert (=> b!584693 (= res!372508 (and (bvsge lt!265635 #b00000000000000000000000000000000) (bvslt lt!265635 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584693 (= lt!265635 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!53654 res!372499) b!584691))

(assert (= (and b!584691 res!372507) b!584690))

(assert (= (and b!584690 res!372498) b!584689))

(assert (= (and b!584689 res!372500) b!584682))

(assert (= (and b!584682 res!372504) b!584685))

(assert (= (and b!584685 res!372503) b!584687))

(assert (= (and b!584687 res!372506) b!584688))

(assert (= (and b!584688 res!372502) b!584686))

(assert (= (and b!584686 res!372501) b!584684))

(assert (= (and b!584684 res!372505) b!584683))

(assert (= (and b!584683 res!372509) b!584693))

(assert (= (and b!584693 res!372508) b!584692))

(declare-fun m!563009 () Bool)

(assert (=> b!584692 m!563009))

(assert (=> b!584692 m!563009))

(declare-fun m!563011 () Bool)

(assert (=> b!584692 m!563011))

(declare-fun m!563013 () Bool)

(assert (=> b!584683 m!563013))

(assert (=> b!584683 m!563009))

(declare-fun m!563015 () Bool)

(assert (=> b!584682 m!563015))

(declare-fun m!563017 () Bool)

(assert (=> b!584688 m!563017))

(declare-fun m!563019 () Bool)

(assert (=> b!584685 m!563019))

(declare-fun m!563021 () Bool)

(assert (=> b!584693 m!563021))

(declare-fun m!563023 () Bool)

(assert (=> b!584686 m!563023))

(declare-fun m!563025 () Bool)

(assert (=> b!584686 m!563025))

(declare-fun m!563027 () Bool)

(assert (=> b!584686 m!563027))

(assert (=> b!584690 m!563009))

(assert (=> b!584690 m!563009))

(declare-fun m!563029 () Bool)

(assert (=> b!584690 m!563029))

(declare-fun m!563031 () Bool)

(assert (=> start!53654 m!563031))

(declare-fun m!563033 () Bool)

(assert (=> start!53654 m!563033))

(assert (=> b!584684 m!563009))

(assert (=> b!584684 m!563009))

(declare-fun m!563035 () Bool)

(assert (=> b!584684 m!563035))

(declare-fun m!563037 () Bool)

(assert (=> b!584689 m!563037))

(declare-fun m!563039 () Bool)

(assert (=> b!584687 m!563039))

(push 1)

(assert (not b!584690))

(assert (not b!584682))

(assert (not b!584684))

(assert (not start!53654))

(assert (not b!584689))

(assert (not b!584692))

(assert (not b!584693))

(assert (not b!584687))

(assert (not b!584688))

(assert (not b!584685))

(check-sat)

