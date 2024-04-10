; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53012 () Bool)

(assert start!53012)

(declare-fun b!577267 () Bool)

(declare-fun e!332054 () Bool)

(assert (=> b!577267 (= e!332054 false)))

(declare-datatypes ((SeekEntryResult!5734 0))(
  ( (MissingZero!5734 (index!25163 (_ BitVec 32))) (Found!5734 (index!25164 (_ BitVec 32))) (Intermediate!5734 (undefined!6546 Bool) (index!25165 (_ BitVec 32)) (x!54075 (_ BitVec 32))) (Undefined!5734) (MissingVacant!5734 (index!25166 (_ BitVec 32))) )
))
(declare-fun lt!263932 () SeekEntryResult!5734)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36030 0))(
  ( (array!36031 (arr!17294 (Array (_ BitVec 32) (_ BitVec 64))) (size!17658 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36030)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36030 (_ BitVec 32)) SeekEntryResult!5734)

(assert (=> b!577267 (= lt!263932 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!577268 () Bool)

(declare-fun res!365302 () Bool)

(assert (=> b!577268 (=> (not res!365302) (not e!332054))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577268 (= res!365302 (validKeyInArray!0 (select (arr!17294 a!2986) j!136)))))

(declare-fun b!577269 () Bool)

(declare-fun res!365300 () Bool)

(assert (=> b!577269 (=> (not res!365300) (not e!332054))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577269 (= res!365300 (and (= (size!17658 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17658 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17658 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577270 () Bool)

(declare-fun res!365303 () Bool)

(assert (=> b!577270 (=> (not res!365303) (not e!332054))))

(declare-fun arrayContainsKey!0 (array!36030 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577270 (= res!365303 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!365299 () Bool)

(assert (=> start!53012 (=> (not res!365299) (not e!332054))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53012 (= res!365299 (validMask!0 mask!3053))))

(assert (=> start!53012 e!332054))

(assert (=> start!53012 true))

(declare-fun array_inv!13090 (array!36030) Bool)

(assert (=> start!53012 (array_inv!13090 a!2986)))

(declare-fun b!577271 () Bool)

(declare-fun res!365301 () Bool)

(assert (=> b!577271 (=> (not res!365301) (not e!332054))))

(assert (=> b!577271 (= res!365301 (validKeyInArray!0 k!1786))))

(assert (= (and start!53012 res!365299) b!577269))

(assert (= (and b!577269 res!365300) b!577268))

(assert (= (and b!577268 res!365302) b!577271))

(assert (= (and b!577271 res!365301) b!577270))

(assert (= (and b!577270 res!365303) b!577267))

(declare-fun m!556171 () Bool)

(assert (=> start!53012 m!556171))

(declare-fun m!556173 () Bool)

(assert (=> start!53012 m!556173))

(declare-fun m!556175 () Bool)

(assert (=> b!577270 m!556175))

(declare-fun m!556177 () Bool)

(assert (=> b!577268 m!556177))

(assert (=> b!577268 m!556177))

(declare-fun m!556179 () Bool)

(assert (=> b!577268 m!556179))

(declare-fun m!556181 () Bool)

(assert (=> b!577271 m!556181))

(declare-fun m!556183 () Bool)

(assert (=> b!577267 m!556183))

(push 1)

(assert (not b!577271))

(assert (not b!577267))

(assert (not b!577270))

(assert (not start!53012))

(assert (not b!577268))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

