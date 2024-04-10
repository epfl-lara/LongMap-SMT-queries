; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53546 () Bool)

(assert start!53546)

(declare-fun b!582921 () Bool)

(declare-fun res!370742 () Bool)

(declare-fun e!334148 () Bool)

(assert (=> b!582921 (=> (not res!370742) (not e!334148))))

(declare-datatypes ((array!36447 0))(
  ( (array!36448 (arr!17498 (Array (_ BitVec 32) (_ BitVec 64))) (size!17862 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36447)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36447 (_ BitVec 32)) Bool)

(assert (=> b!582921 (= res!370742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582922 () Bool)

(assert (=> b!582922 (= e!334148 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5938 0))(
  ( (MissingZero!5938 (index!25979 (_ BitVec 32))) (Found!5938 (index!25980 (_ BitVec 32))) (Intermediate!5938 (undefined!6750 Bool) (index!25981 (_ BitVec 32)) (x!54823 (_ BitVec 32))) (Undefined!5938) (MissingVacant!5938 (index!25982 (_ BitVec 32))) )
))
(declare-fun lt!265221 () SeekEntryResult!5938)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36447 (_ BitVec 32)) SeekEntryResult!5938)

(assert (=> b!582922 (= lt!265221 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17498 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582924 () Bool)

(declare-fun e!334147 () Bool)

(assert (=> b!582924 (= e!334147 e!334148)))

(declare-fun res!370737 () Bool)

(assert (=> b!582924 (=> (not res!370737) (not e!334148))))

(declare-fun lt!265222 () SeekEntryResult!5938)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582924 (= res!370737 (or (= lt!265222 (MissingZero!5938 i!1108)) (= lt!265222 (MissingVacant!5938 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36447 (_ BitVec 32)) SeekEntryResult!5938)

(assert (=> b!582924 (= lt!265222 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!582925 () Bool)

(declare-fun res!370741 () Bool)

(assert (=> b!582925 (=> (not res!370741) (not e!334148))))

(assert (=> b!582925 (= res!370741 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17498 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17498 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582926 () Bool)

(declare-fun res!370745 () Bool)

(assert (=> b!582926 (=> (not res!370745) (not e!334147))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582926 (= res!370745 (validKeyInArray!0 k!1786))))

(declare-fun b!582927 () Bool)

(declare-fun res!370744 () Bool)

(assert (=> b!582927 (=> (not res!370744) (not e!334147))))

(assert (=> b!582927 (= res!370744 (validKeyInArray!0 (select (arr!17498 a!2986) j!136)))))

(declare-fun res!370738 () Bool)

(assert (=> start!53546 (=> (not res!370738) (not e!334147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53546 (= res!370738 (validMask!0 mask!3053))))

(assert (=> start!53546 e!334147))

(assert (=> start!53546 true))

(declare-fun array_inv!13294 (array!36447) Bool)

(assert (=> start!53546 (array_inv!13294 a!2986)))

(declare-fun b!582923 () Bool)

(declare-fun res!370743 () Bool)

(assert (=> b!582923 (=> (not res!370743) (not e!334148))))

(declare-datatypes ((List!11539 0))(
  ( (Nil!11536) (Cons!11535 (h!12580 (_ BitVec 64)) (t!17767 List!11539)) )
))
(declare-fun arrayNoDuplicates!0 (array!36447 (_ BitVec 32) List!11539) Bool)

(assert (=> b!582923 (= res!370743 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11536))))

(declare-fun b!582928 () Bool)

(declare-fun res!370739 () Bool)

(assert (=> b!582928 (=> (not res!370739) (not e!334147))))

(declare-fun arrayContainsKey!0 (array!36447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582928 (= res!370739 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582929 () Bool)

(declare-fun res!370740 () Bool)

(assert (=> b!582929 (=> (not res!370740) (not e!334147))))

(assert (=> b!582929 (= res!370740 (and (= (size!17862 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17862 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17862 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53546 res!370738) b!582929))

(assert (= (and b!582929 res!370740) b!582927))

(assert (= (and b!582927 res!370744) b!582926))

(assert (= (and b!582926 res!370745) b!582928))

(assert (= (and b!582928 res!370739) b!582924))

(assert (= (and b!582924 res!370737) b!582921))

(assert (= (and b!582921 res!370742) b!582923))

(assert (= (and b!582923 res!370743) b!582925))

(assert (= (and b!582925 res!370741) b!582922))

(declare-fun m!561407 () Bool)

(assert (=> b!582925 m!561407))

(declare-fun m!561409 () Bool)

(assert (=> b!582925 m!561409))

(declare-fun m!561411 () Bool)

(assert (=> b!582925 m!561411))

(declare-fun m!561413 () Bool)

(assert (=> b!582928 m!561413))

(declare-fun m!561415 () Bool)

(assert (=> b!582926 m!561415))

(declare-fun m!561417 () Bool)

(assert (=> b!582922 m!561417))

(assert (=> b!582922 m!561417))

(declare-fun m!561419 () Bool)

(assert (=> b!582922 m!561419))

(declare-fun m!561421 () Bool)

(assert (=> b!582923 m!561421))

(assert (=> b!582927 m!561417))

(assert (=> b!582927 m!561417))

(declare-fun m!561423 () Bool)

(assert (=> b!582927 m!561423))

(declare-fun m!561425 () Bool)

(assert (=> b!582921 m!561425))

(declare-fun m!561427 () Bool)

(assert (=> start!53546 m!561427))

(declare-fun m!561429 () Bool)

(assert (=> start!53546 m!561429))

(declare-fun m!561431 () Bool)

(assert (=> b!582924 m!561431))

(push 1)

(assert (not b!582926))

(assert (not b!582927))

(assert (not b!582923))

(assert (not b!582921))

(assert (not start!53546))

(assert (not b!582922))

(assert (not b!582924))

(assert (not b!582928))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

