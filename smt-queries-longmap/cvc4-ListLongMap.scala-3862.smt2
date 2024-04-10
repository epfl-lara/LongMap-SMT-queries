; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53186 () Bool)

(assert start!53186)

(declare-fun b!578135 () Bool)

(declare-fun e!332528 () Bool)

(assert (=> b!578135 (= e!332528 false)))

(declare-fun lt!264186 () Bool)

(declare-datatypes ((array!36087 0))(
  ( (array!36088 (arr!17318 (Array (_ BitVec 32) (_ BitVec 64))) (size!17682 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36087)

(declare-datatypes ((List!11359 0))(
  ( (Nil!11356) (Cons!11355 (h!12400 (_ BitVec 64)) (t!17587 List!11359)) )
))
(declare-fun arrayNoDuplicates!0 (array!36087 (_ BitVec 32) List!11359) Bool)

(assert (=> b!578135 (= lt!264186 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11356))))

(declare-fun b!578136 () Bool)

(declare-fun res!365954 () Bool)

(declare-fun e!332529 () Bool)

(assert (=> b!578136 (=> (not res!365954) (not e!332529))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36087 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578136 (= res!365954 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578137 () Bool)

(declare-fun res!365955 () Bool)

(assert (=> b!578137 (=> (not res!365955) (not e!332529))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578137 (= res!365955 (validKeyInArray!0 (select (arr!17318 a!2986) j!136)))))

(declare-fun b!578139 () Bool)

(declare-fun res!365952 () Bool)

(assert (=> b!578139 (=> (not res!365952) (not e!332528))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36087 (_ BitVec 32)) Bool)

(assert (=> b!578139 (= res!365952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578138 () Bool)

(declare-fun res!365956 () Bool)

(assert (=> b!578138 (=> (not res!365956) (not e!332529))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578138 (= res!365956 (and (= (size!17682 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17682 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17682 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!365951 () Bool)

(assert (=> start!53186 (=> (not res!365951) (not e!332529))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53186 (= res!365951 (validMask!0 mask!3053))))

(assert (=> start!53186 e!332529))

(assert (=> start!53186 true))

(declare-fun array_inv!13114 (array!36087) Bool)

(assert (=> start!53186 (array_inv!13114 a!2986)))

(declare-fun b!578140 () Bool)

(assert (=> b!578140 (= e!332529 e!332528)))

(declare-fun res!365953 () Bool)

(assert (=> b!578140 (=> (not res!365953) (not e!332528))))

(declare-datatypes ((SeekEntryResult!5758 0))(
  ( (MissingZero!5758 (index!25259 (_ BitVec 32))) (Found!5758 (index!25260 (_ BitVec 32))) (Intermediate!5758 (undefined!6570 Bool) (index!25261 (_ BitVec 32)) (x!54163 (_ BitVec 32))) (Undefined!5758) (MissingVacant!5758 (index!25262 (_ BitVec 32))) )
))
(declare-fun lt!264187 () SeekEntryResult!5758)

(assert (=> b!578140 (= res!365953 (or (= lt!264187 (MissingZero!5758 i!1108)) (= lt!264187 (MissingVacant!5758 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36087 (_ BitVec 32)) SeekEntryResult!5758)

(assert (=> b!578140 (= lt!264187 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!578141 () Bool)

(declare-fun res!365957 () Bool)

(assert (=> b!578141 (=> (not res!365957) (not e!332529))))

(assert (=> b!578141 (= res!365957 (validKeyInArray!0 k!1786))))

(assert (= (and start!53186 res!365951) b!578138))

(assert (= (and b!578138 res!365956) b!578137))

(assert (= (and b!578137 res!365955) b!578141))

(assert (= (and b!578141 res!365957) b!578136))

(assert (= (and b!578136 res!365954) b!578140))

(assert (= (and b!578140 res!365953) b!578139))

(assert (= (and b!578139 res!365952) b!578135))

(declare-fun m!556855 () Bool)

(assert (=> b!578136 m!556855))

(declare-fun m!556857 () Bool)

(assert (=> b!578135 m!556857))

(declare-fun m!556859 () Bool)

(assert (=> b!578141 m!556859))

(declare-fun m!556861 () Bool)

(assert (=> b!578140 m!556861))

(declare-fun m!556863 () Bool)

(assert (=> b!578137 m!556863))

(assert (=> b!578137 m!556863))

(declare-fun m!556865 () Bool)

(assert (=> b!578137 m!556865))

(declare-fun m!556867 () Bool)

(assert (=> b!578139 m!556867))

(declare-fun m!556869 () Bool)

(assert (=> start!53186 m!556869))

(declare-fun m!556871 () Bool)

(assert (=> start!53186 m!556871))

(push 1)

(assert (not b!578136))

(assert (not b!578135))

(assert (not b!578137))

(assert (not start!53186))

(assert (not b!578139))

(assert (not b!578140))

