; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53494 () Bool)

(assert start!53494)

(declare-fun b!582219 () Bool)

(declare-fun res!370043 () Bool)

(declare-fun e!333915 () Bool)

(assert (=> b!582219 (=> (not res!370043) (not e!333915))))

(declare-datatypes ((array!36395 0))(
  ( (array!36396 (arr!17472 (Array (_ BitVec 32) (_ BitVec 64))) (size!17836 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36395)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582219 (= res!370043 (validKeyInArray!0 (select (arr!17472 a!2986) j!136)))))

(declare-fun res!370036 () Bool)

(assert (=> start!53494 (=> (not res!370036) (not e!333915))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53494 (= res!370036 (validMask!0 mask!3053))))

(assert (=> start!53494 e!333915))

(assert (=> start!53494 true))

(declare-fun array_inv!13268 (array!36395) Bool)

(assert (=> start!53494 (array_inv!13268 a!2986)))

(declare-fun b!582220 () Bool)

(declare-fun e!333913 () Bool)

(assert (=> b!582220 (= e!333913 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5912 0))(
  ( (MissingZero!5912 (index!25875 (_ BitVec 32))) (Found!5912 (index!25876 (_ BitVec 32))) (Intermediate!5912 (undefined!6724 Bool) (index!25877 (_ BitVec 32)) (x!54733 (_ BitVec 32))) (Undefined!5912) (MissingVacant!5912 (index!25878 (_ BitVec 32))) )
))
(declare-fun lt!265066 () SeekEntryResult!5912)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36395 (_ BitVec 32)) SeekEntryResult!5912)

(assert (=> b!582220 (= lt!265066 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17472 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582221 () Bool)

(declare-fun res!370042 () Bool)

(assert (=> b!582221 (=> (not res!370042) (not e!333915))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582221 (= res!370042 (and (= (size!17836 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17836 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17836 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582222 () Bool)

(declare-fun res!370035 () Bool)

(assert (=> b!582222 (=> (not res!370035) (not e!333913))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!582222 (= res!370035 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17472 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17472 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582223 () Bool)

(assert (=> b!582223 (= e!333915 e!333913)))

(declare-fun res!370037 () Bool)

(assert (=> b!582223 (=> (not res!370037) (not e!333913))))

(declare-fun lt!265065 () SeekEntryResult!5912)

(assert (=> b!582223 (= res!370037 (or (= lt!265065 (MissingZero!5912 i!1108)) (= lt!265065 (MissingVacant!5912 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36395 (_ BitVec 32)) SeekEntryResult!5912)

(assert (=> b!582223 (= lt!265065 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!582224 () Bool)

(declare-fun res!370039 () Bool)

(assert (=> b!582224 (=> (not res!370039) (not e!333913))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36395 (_ BitVec 32)) Bool)

(assert (=> b!582224 (= res!370039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582225 () Bool)

(declare-fun res!370041 () Bool)

(assert (=> b!582225 (=> (not res!370041) (not e!333915))))

(assert (=> b!582225 (= res!370041 (validKeyInArray!0 k!1786))))

(declare-fun b!582226 () Bool)

(declare-fun res!370038 () Bool)

(assert (=> b!582226 (=> (not res!370038) (not e!333915))))

(declare-fun arrayContainsKey!0 (array!36395 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582226 (= res!370038 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582227 () Bool)

(declare-fun res!370040 () Bool)

(assert (=> b!582227 (=> (not res!370040) (not e!333913))))

(declare-datatypes ((List!11513 0))(
  ( (Nil!11510) (Cons!11509 (h!12554 (_ BitVec 64)) (t!17741 List!11513)) )
))
(declare-fun arrayNoDuplicates!0 (array!36395 (_ BitVec 32) List!11513) Bool)

(assert (=> b!582227 (= res!370040 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11510))))

(assert (= (and start!53494 res!370036) b!582221))

(assert (= (and b!582221 res!370042) b!582219))

(assert (= (and b!582219 res!370043) b!582225))

(assert (= (and b!582225 res!370041) b!582226))

(assert (= (and b!582226 res!370038) b!582223))

(assert (= (and b!582223 res!370037) b!582224))

(assert (= (and b!582224 res!370039) b!582227))

(assert (= (and b!582227 res!370040) b!582222))

(assert (= (and b!582222 res!370035) b!582220))

(declare-fun m!560731 () Bool)

(assert (=> b!582220 m!560731))

(assert (=> b!582220 m!560731))

(declare-fun m!560733 () Bool)

(assert (=> b!582220 m!560733))

(declare-fun m!560735 () Bool)

(assert (=> start!53494 m!560735))

(declare-fun m!560737 () Bool)

(assert (=> start!53494 m!560737))

(assert (=> b!582219 m!560731))

(assert (=> b!582219 m!560731))

(declare-fun m!560739 () Bool)

(assert (=> b!582219 m!560739))

(declare-fun m!560741 () Bool)

(assert (=> b!582227 m!560741))

(declare-fun m!560743 () Bool)

(assert (=> b!582223 m!560743))

(declare-fun m!560745 () Bool)

(assert (=> b!582224 m!560745))

(declare-fun m!560747 () Bool)

(assert (=> b!582225 m!560747))

(declare-fun m!560749 () Bool)

(assert (=> b!582222 m!560749))

(declare-fun m!560751 () Bool)

(assert (=> b!582222 m!560751))

(declare-fun m!560753 () Bool)

(assert (=> b!582222 m!560753))

(declare-fun m!560755 () Bool)

(assert (=> b!582226 m!560755))

(push 1)

(assert (not b!582219))

(assert (not b!582227))

(assert (not b!582225))

(assert (not b!582220))

(assert (not b!582223))

(assert (not start!53494))

(assert (not b!582226))

(assert (not b!582224))

(check-sat)

