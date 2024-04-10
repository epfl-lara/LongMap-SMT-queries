; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53402 () Bool)

(assert start!53402)

(declare-fun b!580950 () Bool)

(declare-fun e!333499 () Bool)

(declare-fun e!333500 () Bool)

(assert (=> b!580950 (= e!333499 e!333500)))

(declare-fun res!368767 () Bool)

(assert (=> b!580950 (=> (not res!368767) (not e!333500))))

(declare-datatypes ((SeekEntryResult!5866 0))(
  ( (MissingZero!5866 (index!25691 (_ BitVec 32))) (Found!5866 (index!25692 (_ BitVec 32))) (Intermediate!5866 (undefined!6678 Bool) (index!25693 (_ BitVec 32)) (x!54559 (_ BitVec 32))) (Undefined!5866) (MissingVacant!5866 (index!25694 (_ BitVec 32))) )
))
(declare-fun lt!264808 () SeekEntryResult!5866)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580950 (= res!368767 (or (= lt!264808 (MissingZero!5866 i!1108)) (= lt!264808 (MissingVacant!5866 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36303 0))(
  ( (array!36304 (arr!17426 (Array (_ BitVec 32) (_ BitVec 64))) (size!17790 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36303)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36303 (_ BitVec 32)) SeekEntryResult!5866)

(assert (=> b!580950 (= lt!264808 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!580951 () Bool)

(declare-fun res!368774 () Bool)

(assert (=> b!580951 (=> (not res!368774) (not e!333500))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36303 (_ BitVec 32)) Bool)

(assert (=> b!580951 (= res!368774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580952 () Bool)

(declare-fun res!368771 () Bool)

(assert (=> b!580952 (=> (not res!368771) (not e!333500))))

(declare-datatypes ((List!11467 0))(
  ( (Nil!11464) (Cons!11463 (h!12508 (_ BitVec 64)) (t!17695 List!11467)) )
))
(declare-fun arrayNoDuplicates!0 (array!36303 (_ BitVec 32) List!11467) Bool)

(assert (=> b!580952 (= res!368771 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11464))))

(declare-fun b!580953 () Bool)

(declare-fun res!368773 () Bool)

(assert (=> b!580953 (=> (not res!368773) (not e!333499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580953 (= res!368773 (validKeyInArray!0 k!1786))))

(declare-fun b!580954 () Bool)

(assert (=> b!580954 (= e!333500 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!264807 () SeekEntryResult!5866)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36303 (_ BitVec 32)) SeekEntryResult!5866)

(assert (=> b!580954 (= lt!264807 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17426 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580955 () Bool)

(declare-fun res!368769 () Bool)

(assert (=> b!580955 (=> (not res!368769) (not e!333500))))

(assert (=> b!580955 (= res!368769 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17426 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17426 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580957 () Bool)

(declare-fun res!368770 () Bool)

(assert (=> b!580957 (=> (not res!368770) (not e!333499))))

(assert (=> b!580957 (= res!368770 (and (= (size!17790 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17790 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17790 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580958 () Bool)

(declare-fun res!368766 () Bool)

(assert (=> b!580958 (=> (not res!368766) (not e!333499))))

(assert (=> b!580958 (= res!368766 (validKeyInArray!0 (select (arr!17426 a!2986) j!136)))))

(declare-fun res!368768 () Bool)

(assert (=> start!53402 (=> (not res!368768) (not e!333499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53402 (= res!368768 (validMask!0 mask!3053))))

(assert (=> start!53402 e!333499))

(assert (=> start!53402 true))

(declare-fun array_inv!13222 (array!36303) Bool)

(assert (=> start!53402 (array_inv!13222 a!2986)))

(declare-fun b!580956 () Bool)

(declare-fun res!368772 () Bool)

(assert (=> b!580956 (=> (not res!368772) (not e!333499))))

(declare-fun arrayContainsKey!0 (array!36303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580956 (= res!368772 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53402 res!368768) b!580957))

(assert (= (and b!580957 res!368770) b!580958))

(assert (= (and b!580958 res!368766) b!580953))

(assert (= (and b!580953 res!368773) b!580956))

(assert (= (and b!580956 res!368772) b!580950))

(assert (= (and b!580950 res!368767) b!580951))

(assert (= (and b!580951 res!368774) b!580952))

(assert (= (and b!580952 res!368771) b!580955))

(assert (= (and b!580955 res!368769) b!580954))

(declare-fun m!559511 () Bool)

(assert (=> b!580953 m!559511))

(declare-fun m!559513 () Bool)

(assert (=> b!580955 m!559513))

(declare-fun m!559515 () Bool)

(assert (=> b!580955 m!559515))

(declare-fun m!559517 () Bool)

(assert (=> b!580955 m!559517))

(declare-fun m!559519 () Bool)

(assert (=> b!580954 m!559519))

(assert (=> b!580954 m!559519))

(declare-fun m!559521 () Bool)

(assert (=> b!580954 m!559521))

(declare-fun m!559523 () Bool)

(assert (=> b!580951 m!559523))

(declare-fun m!559525 () Bool)

(assert (=> start!53402 m!559525))

(declare-fun m!559527 () Bool)

(assert (=> start!53402 m!559527))

(declare-fun m!559529 () Bool)

(assert (=> b!580952 m!559529))

(assert (=> b!580958 m!559519))

(assert (=> b!580958 m!559519))

(declare-fun m!559531 () Bool)

(assert (=> b!580958 m!559531))

(declare-fun m!559533 () Bool)

(assert (=> b!580950 m!559533))

(declare-fun m!559535 () Bool)

(assert (=> b!580956 m!559535))

(push 1)

(assert (not b!580951))

(assert (not start!53402))

(assert (not b!580958))

(assert (not b!580956))

(assert (not b!580953))

(assert (not b!580952))

(assert (not b!580954))

(assert (not b!580950))

