; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53008 () Bool)

(assert start!53008)

(declare-fun res!365271 () Bool)

(declare-fun e!332043 () Bool)

(assert (=> start!53008 (=> (not res!365271) (not e!332043))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53008 (= res!365271 (validMask!0 mask!3053))))

(assert (=> start!53008 e!332043))

(assert (=> start!53008 true))

(declare-datatypes ((array!36026 0))(
  ( (array!36027 (arr!17292 (Array (_ BitVec 32) (_ BitVec 64))) (size!17656 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36026)

(declare-fun array_inv!13088 (array!36026) Bool)

(assert (=> start!53008 (array_inv!13088 a!2986)))

(declare-fun b!577237 () Bool)

(declare-fun res!365269 () Bool)

(assert (=> b!577237 (=> (not res!365269) (not e!332043))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36026 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577237 (= res!365269 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577238 () Bool)

(declare-fun res!365270 () Bool)

(assert (=> b!577238 (=> (not res!365270) (not e!332043))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577238 (= res!365270 (validKeyInArray!0 (select (arr!17292 a!2986) j!136)))))

(declare-fun b!577239 () Bool)

(assert (=> b!577239 (= e!332043 false)))

(declare-datatypes ((SeekEntryResult!5732 0))(
  ( (MissingZero!5732 (index!25155 (_ BitVec 32))) (Found!5732 (index!25156 (_ BitVec 32))) (Intermediate!5732 (undefined!6544 Bool) (index!25157 (_ BitVec 32)) (x!54073 (_ BitVec 32))) (Undefined!5732) (MissingVacant!5732 (index!25158 (_ BitVec 32))) )
))
(declare-fun lt!263926 () SeekEntryResult!5732)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36026 (_ BitVec 32)) SeekEntryResult!5732)

(assert (=> b!577239 (= lt!263926 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!577240 () Bool)

(declare-fun res!365273 () Bool)

(assert (=> b!577240 (=> (not res!365273) (not e!332043))))

(assert (=> b!577240 (= res!365273 (validKeyInArray!0 k!1786))))

(declare-fun b!577241 () Bool)

(declare-fun res!365272 () Bool)

(assert (=> b!577241 (=> (not res!365272) (not e!332043))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577241 (= res!365272 (and (= (size!17656 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17656 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17656 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53008 res!365271) b!577241))

(assert (= (and b!577241 res!365272) b!577238))

(assert (= (and b!577238 res!365270) b!577240))

(assert (= (and b!577240 res!365273) b!577237))

(assert (= (and b!577237 res!365269) b!577239))

(declare-fun m!556143 () Bool)

(assert (=> b!577237 m!556143))

(declare-fun m!556145 () Bool)

(assert (=> start!53008 m!556145))

(declare-fun m!556147 () Bool)

(assert (=> start!53008 m!556147))

(declare-fun m!556149 () Bool)

(assert (=> b!577238 m!556149))

(assert (=> b!577238 m!556149))

(declare-fun m!556151 () Bool)

(assert (=> b!577238 m!556151))

(declare-fun m!556153 () Bool)

(assert (=> b!577239 m!556153))

(declare-fun m!556155 () Bool)

(assert (=> b!577240 m!556155))

(push 1)

(assert (not b!577237))

(assert (not b!577238))

(assert (not start!53008))

(assert (not b!577240))

(assert (not b!577239))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

