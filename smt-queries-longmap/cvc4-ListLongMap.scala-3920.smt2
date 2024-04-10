; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53534 () Bool)

(assert start!53534)

(declare-fun res!370581 () Bool)

(declare-fun e!334095 () Bool)

(assert (=> start!53534 (=> (not res!370581) (not e!334095))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53534 (= res!370581 (validMask!0 mask!3053))))

(assert (=> start!53534 e!334095))

(assert (=> start!53534 true))

(declare-datatypes ((array!36435 0))(
  ( (array!36436 (arr!17492 (Array (_ BitVec 32) (_ BitVec 64))) (size!17856 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36435)

(declare-fun array_inv!13288 (array!36435) Bool)

(assert (=> start!53534 (array_inv!13288 a!2986)))

(declare-fun b!582759 () Bool)

(declare-fun res!370580 () Bool)

(declare-fun e!334093 () Bool)

(assert (=> b!582759 (=> (not res!370580) (not e!334093))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!582759 (= res!370580 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17492 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17492 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582760 () Bool)

(declare-fun res!370577 () Bool)

(assert (=> b!582760 (=> (not res!370577) (not e!334093))))

(declare-datatypes ((List!11533 0))(
  ( (Nil!11530) (Cons!11529 (h!12574 (_ BitVec 64)) (t!17761 List!11533)) )
))
(declare-fun arrayNoDuplicates!0 (array!36435 (_ BitVec 32) List!11533) Bool)

(assert (=> b!582760 (= res!370577 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11530))))

(declare-fun b!582761 () Bool)

(declare-fun res!370575 () Bool)

(assert (=> b!582761 (=> (not res!370575) (not e!334093))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36435 (_ BitVec 32)) Bool)

(assert (=> b!582761 (= res!370575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582762 () Bool)

(assert (=> b!582762 (= e!334095 e!334093)))

(declare-fun res!370578 () Bool)

(assert (=> b!582762 (=> (not res!370578) (not e!334093))))

(declare-datatypes ((SeekEntryResult!5932 0))(
  ( (MissingZero!5932 (index!25955 (_ BitVec 32))) (Found!5932 (index!25956 (_ BitVec 32))) (Intermediate!5932 (undefined!6744 Bool) (index!25957 (_ BitVec 32)) (x!54801 (_ BitVec 32))) (Undefined!5932) (MissingVacant!5932 (index!25958 (_ BitVec 32))) )
))
(declare-fun lt!265186 () SeekEntryResult!5932)

(assert (=> b!582762 (= res!370578 (or (= lt!265186 (MissingZero!5932 i!1108)) (= lt!265186 (MissingVacant!5932 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36435 (_ BitVec 32)) SeekEntryResult!5932)

(assert (=> b!582762 (= lt!265186 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!582763 () Bool)

(declare-fun res!370582 () Bool)

(assert (=> b!582763 (=> (not res!370582) (not e!334095))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582763 (= res!370582 (validKeyInArray!0 (select (arr!17492 a!2986) j!136)))))

(declare-fun b!582764 () Bool)

(declare-fun res!370576 () Bool)

(assert (=> b!582764 (=> (not res!370576) (not e!334095))))

(assert (=> b!582764 (= res!370576 (validKeyInArray!0 k!1786))))

(declare-fun b!582765 () Bool)

(declare-fun res!370583 () Bool)

(assert (=> b!582765 (=> (not res!370583) (not e!334095))))

(assert (=> b!582765 (= res!370583 (and (= (size!17856 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17856 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17856 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582766 () Bool)

(declare-fun res!370579 () Bool)

(assert (=> b!582766 (=> (not res!370579) (not e!334095))))

(declare-fun arrayContainsKey!0 (array!36435 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582766 (= res!370579 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582767 () Bool)

(assert (=> b!582767 (= e!334093 false)))

(declare-fun lt!265185 () SeekEntryResult!5932)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36435 (_ BitVec 32)) SeekEntryResult!5932)

(assert (=> b!582767 (= lt!265185 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17492 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53534 res!370581) b!582765))

(assert (= (and b!582765 res!370583) b!582763))

(assert (= (and b!582763 res!370582) b!582764))

(assert (= (and b!582764 res!370576) b!582766))

(assert (= (and b!582766 res!370579) b!582762))

(assert (= (and b!582762 res!370578) b!582761))

(assert (= (and b!582761 res!370575) b!582760))

(assert (= (and b!582760 res!370577) b!582759))

(assert (= (and b!582759 res!370580) b!582767))

(declare-fun m!561251 () Bool)

(assert (=> start!53534 m!561251))

(declare-fun m!561253 () Bool)

(assert (=> start!53534 m!561253))

(declare-fun m!561255 () Bool)

(assert (=> b!582764 m!561255))

(declare-fun m!561257 () Bool)

(assert (=> b!582763 m!561257))

(assert (=> b!582763 m!561257))

(declare-fun m!561259 () Bool)

(assert (=> b!582763 m!561259))

(declare-fun m!561261 () Bool)

(assert (=> b!582766 m!561261))

(declare-fun m!561263 () Bool)

(assert (=> b!582760 m!561263))

(declare-fun m!561265 () Bool)

(assert (=> b!582759 m!561265))

(declare-fun m!561267 () Bool)

(assert (=> b!582759 m!561267))

(declare-fun m!561269 () Bool)

(assert (=> b!582759 m!561269))

(declare-fun m!561271 () Bool)

(assert (=> b!582762 m!561271))

(assert (=> b!582767 m!561257))

(assert (=> b!582767 m!561257))

(declare-fun m!561273 () Bool)

(assert (=> b!582767 m!561273))

(declare-fun m!561275 () Bool)

(assert (=> b!582761 m!561275))

(push 1)

(assert (not start!53534))

(assert (not b!582761))

(assert (not b!582764))

(assert (not b!582767))

(assert (not b!582763))

(assert (not b!582762))

(assert (not b!582766))

(assert (not b!582760))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

