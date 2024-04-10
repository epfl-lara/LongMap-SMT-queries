; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53002 () Bool)

(assert start!53002)

(declare-fun b!577192 () Bool)

(declare-fun res!365227 () Bool)

(declare-fun e!332025 () Bool)

(assert (=> b!577192 (=> (not res!365227) (not e!332025))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36020 0))(
  ( (array!36021 (arr!17289 (Array (_ BitVec 32) (_ BitVec 64))) (size!17653 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36020)

(assert (=> b!577192 (= res!365227 (and (= (size!17653 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17653 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17653 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!365224 () Bool)

(assert (=> start!53002 (=> (not res!365224) (not e!332025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53002 (= res!365224 (validMask!0 mask!3053))))

(assert (=> start!53002 e!332025))

(assert (=> start!53002 true))

(declare-fun array_inv!13085 (array!36020) Bool)

(assert (=> start!53002 (array_inv!13085 a!2986)))

(declare-fun b!577193 () Bool)

(declare-fun res!365225 () Bool)

(assert (=> b!577193 (=> (not res!365225) (not e!332025))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577193 (= res!365225 (validKeyInArray!0 (select (arr!17289 a!2986) j!136)))))

(declare-fun b!577194 () Bool)

(assert (=> b!577194 (= e!332025 false)))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5729 0))(
  ( (MissingZero!5729 (index!25143 (_ BitVec 32))) (Found!5729 (index!25144 (_ BitVec 32))) (Intermediate!5729 (undefined!6541 Bool) (index!25145 (_ BitVec 32)) (x!54062 (_ BitVec 32))) (Undefined!5729) (MissingVacant!5729 (index!25146 (_ BitVec 32))) )
))
(declare-fun lt!263917 () SeekEntryResult!5729)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36020 (_ BitVec 32)) SeekEntryResult!5729)

(assert (=> b!577194 (= lt!263917 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!577195 () Bool)

(declare-fun res!365226 () Bool)

(assert (=> b!577195 (=> (not res!365226) (not e!332025))))

(declare-fun arrayContainsKey!0 (array!36020 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577195 (= res!365226 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577196 () Bool)

(declare-fun res!365228 () Bool)

(assert (=> b!577196 (=> (not res!365228) (not e!332025))))

(assert (=> b!577196 (= res!365228 (validKeyInArray!0 k!1786))))

(assert (= (and start!53002 res!365224) b!577192))

(assert (= (and b!577192 res!365227) b!577193))

(assert (= (and b!577193 res!365225) b!577196))

(assert (= (and b!577196 res!365228) b!577195))

(assert (= (and b!577195 res!365226) b!577194))

(declare-fun m!556101 () Bool)

(assert (=> b!577194 m!556101))

(declare-fun m!556103 () Bool)

(assert (=> b!577196 m!556103))

(declare-fun m!556105 () Bool)

(assert (=> start!53002 m!556105))

(declare-fun m!556107 () Bool)

(assert (=> start!53002 m!556107))

(declare-fun m!556109 () Bool)

(assert (=> b!577195 m!556109))

(declare-fun m!556111 () Bool)

(assert (=> b!577193 m!556111))

(assert (=> b!577193 m!556111))

(declare-fun m!556113 () Bool)

(assert (=> b!577193 m!556113))

(push 1)

(assert (not start!53002))

(assert (not b!577196))

(assert (not b!577194))

(assert (not b!577193))

(assert (not b!577195))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

