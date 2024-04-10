; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56582 () Bool)

(assert start!56582)

(declare-fun b!626787 () Bool)

(declare-fun e!359069 () Bool)

(assert (=> b!626787 (= e!359069 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6617 0))(
  ( (MissingZero!6617 (index!28752 (_ BitVec 32))) (Found!6617 (index!28753 (_ BitVec 32))) (Intermediate!6617 (undefined!7429 Bool) (index!28754 (_ BitVec 32)) (x!57501 (_ BitVec 32))) (Undefined!6617) (MissingVacant!6617 (index!28755 (_ BitVec 32))) )
))
(declare-fun lt!290155 () SeekEntryResult!6617)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37874 0))(
  ( (array!37875 (arr!18177 (Array (_ BitVec 32) (_ BitVec 64))) (size!18541 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37874)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37874 (_ BitVec 32)) SeekEntryResult!6617)

(assert (=> b!626787 (= lt!290155 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18177 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!626788 () Bool)

(declare-fun res!404495 () Bool)

(declare-fun e!359070 () Bool)

(assert (=> b!626788 (=> (not res!404495) (not e!359070))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626788 (= res!404495 (validKeyInArray!0 k!1786))))

(declare-fun b!626789 () Bool)

(declare-fun res!404493 () Bool)

(assert (=> b!626789 (=> (not res!404493) (not e!359069))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37874 (_ BitVec 32)) Bool)

(assert (=> b!626789 (= res!404493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!626790 () Bool)

(declare-fun res!404489 () Bool)

(assert (=> b!626790 (=> (not res!404489) (not e!359069))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!626790 (= res!404489 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18177 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18177 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626791 () Bool)

(declare-fun res!404491 () Bool)

(assert (=> b!626791 (=> (not res!404491) (not e!359069))))

(declare-datatypes ((List!12218 0))(
  ( (Nil!12215) (Cons!12214 (h!13259 (_ BitVec 64)) (t!18446 List!12218)) )
))
(declare-fun arrayNoDuplicates!0 (array!37874 (_ BitVec 32) List!12218) Bool)

(assert (=> b!626791 (= res!404491 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12215))))

(declare-fun b!626793 () Bool)

(declare-fun res!404488 () Bool)

(assert (=> b!626793 (=> (not res!404488) (not e!359070))))

(assert (=> b!626793 (= res!404488 (validKeyInArray!0 (select (arr!18177 a!2986) j!136)))))

(declare-fun b!626794 () Bool)

(declare-fun res!404490 () Bool)

(assert (=> b!626794 (=> (not res!404490) (not e!359070))))

(assert (=> b!626794 (= res!404490 (and (= (size!18541 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18541 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18541 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626795 () Bool)

(declare-fun res!404487 () Bool)

(assert (=> b!626795 (=> (not res!404487) (not e!359070))))

(declare-fun arrayContainsKey!0 (array!37874 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626795 (= res!404487 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!626792 () Bool)

(assert (=> b!626792 (= e!359070 e!359069)))

(declare-fun res!404494 () Bool)

(assert (=> b!626792 (=> (not res!404494) (not e!359069))))

(declare-fun lt!290154 () SeekEntryResult!6617)

(assert (=> b!626792 (= res!404494 (or (= lt!290154 (MissingZero!6617 i!1108)) (= lt!290154 (MissingVacant!6617 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37874 (_ BitVec 32)) SeekEntryResult!6617)

(assert (=> b!626792 (= lt!290154 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!404492 () Bool)

(assert (=> start!56582 (=> (not res!404492) (not e!359070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56582 (= res!404492 (validMask!0 mask!3053))))

(assert (=> start!56582 e!359070))

(assert (=> start!56582 true))

(declare-fun array_inv!13973 (array!37874) Bool)

(assert (=> start!56582 (array_inv!13973 a!2986)))

(assert (= (and start!56582 res!404492) b!626794))

(assert (= (and b!626794 res!404490) b!626793))

(assert (= (and b!626793 res!404488) b!626788))

(assert (= (and b!626788 res!404495) b!626795))

(assert (= (and b!626795 res!404487) b!626792))

(assert (= (and b!626792 res!404494) b!626789))

(assert (= (and b!626789 res!404493) b!626791))

(assert (= (and b!626791 res!404491) b!626790))

(assert (= (and b!626790 res!404489) b!626787))

(declare-fun m!602151 () Bool)

(assert (=> b!626788 m!602151))

(declare-fun m!602153 () Bool)

(assert (=> b!626787 m!602153))

(assert (=> b!626787 m!602153))

(declare-fun m!602155 () Bool)

(assert (=> b!626787 m!602155))

(assert (=> b!626793 m!602153))

(assert (=> b!626793 m!602153))

(declare-fun m!602157 () Bool)

(assert (=> b!626793 m!602157))

(declare-fun m!602159 () Bool)

(assert (=> b!626791 m!602159))

(declare-fun m!602161 () Bool)

(assert (=> start!56582 m!602161))

(declare-fun m!602163 () Bool)

(assert (=> start!56582 m!602163))

(declare-fun m!602165 () Bool)

(assert (=> b!626789 m!602165))

(declare-fun m!602167 () Bool)

(assert (=> b!626792 m!602167))

(declare-fun m!602169 () Bool)

(assert (=> b!626790 m!602169))

(declare-fun m!602171 () Bool)

(assert (=> b!626790 m!602171))

(declare-fun m!602173 () Bool)

(assert (=> b!626790 m!602173))

(declare-fun m!602175 () Bool)

(assert (=> b!626795 m!602175))

(push 1)

