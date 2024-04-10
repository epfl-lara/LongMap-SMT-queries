; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56580 () Bool)

(assert start!56580)

(declare-fun b!626760 () Bool)

(declare-fun res!404463 () Bool)

(declare-fun e!359059 () Bool)

(assert (=> b!626760 (=> (not res!404463) (not e!359059))))

(declare-datatypes ((array!37872 0))(
  ( (array!37873 (arr!18176 (Array (_ BitVec 32) (_ BitVec 64))) (size!18540 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37872)

(declare-datatypes ((List!12217 0))(
  ( (Nil!12214) (Cons!12213 (h!13258 (_ BitVec 64)) (t!18445 List!12217)) )
))
(declare-fun arrayNoDuplicates!0 (array!37872 (_ BitVec 32) List!12217) Bool)

(assert (=> b!626760 (= res!404463 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12214))))

(declare-fun b!626761 () Bool)

(declare-fun res!404467 () Bool)

(declare-fun e!359060 () Bool)

(assert (=> b!626761 (=> (not res!404467) (not e!359060))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!626761 (= res!404467 (and (= (size!18540 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18540 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18540 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626762 () Bool)

(declare-fun res!404464 () Bool)

(assert (=> b!626762 (=> (not res!404464) (not e!359060))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626762 (= res!404464 (validKeyInArray!0 k!1786))))

(declare-fun b!626763 () Bool)

(declare-fun res!404460 () Bool)

(assert (=> b!626763 (=> (not res!404460) (not e!359059))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37872 (_ BitVec 32)) Bool)

(assert (=> b!626763 (= res!404460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!626764 () Bool)

(assert (=> b!626764 (= e!359059 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6616 0))(
  ( (MissingZero!6616 (index!28748 (_ BitVec 32))) (Found!6616 (index!28749 (_ BitVec 32))) (Intermediate!6616 (undefined!7428 Bool) (index!28750 (_ BitVec 32)) (x!57492 (_ BitVec 32))) (Undefined!6616) (MissingVacant!6616 (index!28751 (_ BitVec 32))) )
))
(declare-fun lt!290148 () SeekEntryResult!6616)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37872 (_ BitVec 32)) SeekEntryResult!6616)

(assert (=> b!626764 (= lt!290148 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18176 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!626765 () Bool)

(declare-fun res!404468 () Bool)

(assert (=> b!626765 (=> (not res!404468) (not e!359059))))

(assert (=> b!626765 (= res!404468 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18176 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18176 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626766 () Bool)

(declare-fun res!404462 () Bool)

(assert (=> b!626766 (=> (not res!404462) (not e!359060))))

(declare-fun arrayContainsKey!0 (array!37872 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626766 (= res!404462 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!626767 () Bool)

(declare-fun res!404461 () Bool)

(assert (=> b!626767 (=> (not res!404461) (not e!359060))))

(assert (=> b!626767 (= res!404461 (validKeyInArray!0 (select (arr!18176 a!2986) j!136)))))

(declare-fun res!404465 () Bool)

(assert (=> start!56580 (=> (not res!404465) (not e!359060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56580 (= res!404465 (validMask!0 mask!3053))))

(assert (=> start!56580 e!359060))

(assert (=> start!56580 true))

(declare-fun array_inv!13972 (array!37872) Bool)

(assert (=> start!56580 (array_inv!13972 a!2986)))

(declare-fun b!626768 () Bool)

(assert (=> b!626768 (= e!359060 e!359059)))

(declare-fun res!404466 () Bool)

(assert (=> b!626768 (=> (not res!404466) (not e!359059))))

(declare-fun lt!290149 () SeekEntryResult!6616)

(assert (=> b!626768 (= res!404466 (or (= lt!290149 (MissingZero!6616 i!1108)) (= lt!290149 (MissingVacant!6616 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37872 (_ BitVec 32)) SeekEntryResult!6616)

(assert (=> b!626768 (= lt!290149 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!56580 res!404465) b!626761))

(assert (= (and b!626761 res!404467) b!626767))

(assert (= (and b!626767 res!404461) b!626762))

(assert (= (and b!626762 res!404464) b!626766))

(assert (= (and b!626766 res!404462) b!626768))

(assert (= (and b!626768 res!404466) b!626763))

(assert (= (and b!626763 res!404460) b!626760))

(assert (= (and b!626760 res!404463) b!626765))

(assert (= (and b!626765 res!404468) b!626764))

(declare-fun m!602125 () Bool)

(assert (=> b!626762 m!602125))

(declare-fun m!602127 () Bool)

(assert (=> b!626765 m!602127))

(declare-fun m!602129 () Bool)

(assert (=> b!626765 m!602129))

(declare-fun m!602131 () Bool)

(assert (=> b!626765 m!602131))

(declare-fun m!602133 () Bool)

(assert (=> b!626768 m!602133))

(declare-fun m!602135 () Bool)

(assert (=> b!626760 m!602135))

(declare-fun m!602137 () Bool)

(assert (=> start!56580 m!602137))

(declare-fun m!602139 () Bool)

(assert (=> start!56580 m!602139))

(declare-fun m!602141 () Bool)

(assert (=> b!626763 m!602141))

(declare-fun m!602143 () Bool)

(assert (=> b!626767 m!602143))

(assert (=> b!626767 m!602143))

(declare-fun m!602145 () Bool)

(assert (=> b!626767 m!602145))

(declare-fun m!602147 () Bool)

(assert (=> b!626766 m!602147))

(assert (=> b!626764 m!602143))

(assert (=> b!626764 m!602143))

(declare-fun m!602149 () Bool)

(assert (=> b!626764 m!602149))

(push 1)

(assert (not b!626767))

(assert (not b!626763))

(assert (not b!626768))

(assert (not b!626762))

(assert (not b!626760))

(assert (not b!626766))

(assert (not start!56580))

(assert (not b!626764))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

