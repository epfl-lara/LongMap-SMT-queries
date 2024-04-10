; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53404 () Bool)

(assert start!53404)

(declare-fun b!580977 () Bool)

(declare-fun res!368795 () Bool)

(declare-fun e!333508 () Bool)

(assert (=> b!580977 (=> (not res!368795) (not e!333508))))

(declare-datatypes ((array!36305 0))(
  ( (array!36306 (arr!17427 (Array (_ BitVec 32) (_ BitVec 64))) (size!17791 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36305)

(declare-datatypes ((List!11468 0))(
  ( (Nil!11465) (Cons!11464 (h!12509 (_ BitVec 64)) (t!17696 List!11468)) )
))
(declare-fun arrayNoDuplicates!0 (array!36305 (_ BitVec 32) List!11468) Bool)

(assert (=> b!580977 (= res!368795 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11465))))

(declare-fun b!580978 () Bool)

(declare-fun res!368798 () Bool)

(declare-fun e!333509 () Bool)

(assert (=> b!580978 (=> (not res!368798) (not e!333509))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580978 (= res!368798 (validKeyInArray!0 (select (arr!17427 a!2986) j!136)))))

(declare-fun b!580979 () Bool)

(declare-fun res!368800 () Bool)

(assert (=> b!580979 (=> (not res!368800) (not e!333509))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580979 (= res!368800 (and (= (size!17791 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17791 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17791 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580980 () Bool)

(declare-fun res!368793 () Bool)

(assert (=> b!580980 (=> (not res!368793) (not e!333509))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!580980 (= res!368793 (validKeyInArray!0 k!1786))))

(declare-fun b!580981 () Bool)

(assert (=> b!580981 (= e!333508 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5867 0))(
  ( (MissingZero!5867 (index!25695 (_ BitVec 32))) (Found!5867 (index!25696 (_ BitVec 32))) (Intermediate!5867 (undefined!6679 Bool) (index!25697 (_ BitVec 32)) (x!54568 (_ BitVec 32))) (Undefined!5867) (MissingVacant!5867 (index!25698 (_ BitVec 32))) )
))
(declare-fun lt!264813 () SeekEntryResult!5867)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36305 (_ BitVec 32)) SeekEntryResult!5867)

(assert (=> b!580981 (= lt!264813 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17427 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580982 () Bool)

(declare-fun res!368796 () Bool)

(assert (=> b!580982 (=> (not res!368796) (not e!333508))))

(assert (=> b!580982 (= res!368796 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17427 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17427 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!368794 () Bool)

(assert (=> start!53404 (=> (not res!368794) (not e!333509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53404 (= res!368794 (validMask!0 mask!3053))))

(assert (=> start!53404 e!333509))

(assert (=> start!53404 true))

(declare-fun array_inv!13223 (array!36305) Bool)

(assert (=> start!53404 (array_inv!13223 a!2986)))

(declare-fun b!580983 () Bool)

(assert (=> b!580983 (= e!333509 e!333508)))

(declare-fun res!368801 () Bool)

(assert (=> b!580983 (=> (not res!368801) (not e!333508))))

(declare-fun lt!264814 () SeekEntryResult!5867)

(assert (=> b!580983 (= res!368801 (or (= lt!264814 (MissingZero!5867 i!1108)) (= lt!264814 (MissingVacant!5867 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36305 (_ BitVec 32)) SeekEntryResult!5867)

(assert (=> b!580983 (= lt!264814 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!580984 () Bool)

(declare-fun res!368797 () Bool)

(assert (=> b!580984 (=> (not res!368797) (not e!333509))))

(declare-fun arrayContainsKey!0 (array!36305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580984 (= res!368797 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580985 () Bool)

(declare-fun res!368799 () Bool)

(assert (=> b!580985 (=> (not res!368799) (not e!333508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36305 (_ BitVec 32)) Bool)

(assert (=> b!580985 (= res!368799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53404 res!368794) b!580979))

(assert (= (and b!580979 res!368800) b!580978))

(assert (= (and b!580978 res!368798) b!580980))

(assert (= (and b!580980 res!368793) b!580984))

(assert (= (and b!580984 res!368797) b!580983))

(assert (= (and b!580983 res!368801) b!580985))

(assert (= (and b!580985 res!368799) b!580977))

(assert (= (and b!580977 res!368795) b!580982))

(assert (= (and b!580982 res!368796) b!580981))

(declare-fun m!559537 () Bool)

(assert (=> b!580980 m!559537))

(declare-fun m!559539 () Bool)

(assert (=> b!580983 m!559539))

(declare-fun m!559541 () Bool)

(assert (=> b!580985 m!559541))

(declare-fun m!559543 () Bool)

(assert (=> b!580984 m!559543))

(declare-fun m!559545 () Bool)

(assert (=> b!580981 m!559545))

(assert (=> b!580981 m!559545))

(declare-fun m!559547 () Bool)

(assert (=> b!580981 m!559547))

(assert (=> b!580978 m!559545))

(assert (=> b!580978 m!559545))

(declare-fun m!559549 () Bool)

(assert (=> b!580978 m!559549))

(declare-fun m!559551 () Bool)

(assert (=> b!580982 m!559551))

(declare-fun m!559553 () Bool)

(assert (=> b!580982 m!559553))

(declare-fun m!559555 () Bool)

(assert (=> b!580982 m!559555))

(declare-fun m!559557 () Bool)

(assert (=> b!580977 m!559557))

(declare-fun m!559559 () Bool)

(assert (=> start!53404 m!559559))

(declare-fun m!559561 () Bool)

(assert (=> start!53404 m!559561))

(push 1)

