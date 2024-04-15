; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52994 () Bool)

(assert start!52994)

(declare-fun res!365159 () Bool)

(declare-fun e!331875 () Bool)

(assert (=> start!52994 (=> (not res!365159) (not e!331875))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52994 (= res!365159 (validMask!0 mask!3053))))

(assert (=> start!52994 e!331875))

(assert (=> start!52994 true))

(declare-datatypes ((array!36026 0))(
  ( (array!36027 (arr!17292 (Array (_ BitVec 32) (_ BitVec 64))) (size!17657 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36026)

(declare-fun array_inv!13175 (array!36026) Bool)

(assert (=> start!52994 (array_inv!13175 a!2986)))

(declare-fun b!576981 () Bool)

(declare-fun res!365156 () Bool)

(assert (=> b!576981 (=> (not res!365156) (not e!331875))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36026 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!576981 (= res!365156 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!576982 () Bool)

(assert (=> b!576982 (= e!331875 false)))

(declare-datatypes ((SeekEntryResult!5729 0))(
  ( (MissingZero!5729 (index!25143 (_ BitVec 32))) (Found!5729 (index!25144 (_ BitVec 32))) (Intermediate!5729 (undefined!6541 Bool) (index!25145 (_ BitVec 32)) (x!54065 (_ BitVec 32))) (Undefined!5729) (MissingVacant!5729 (index!25146 (_ BitVec 32))) )
))
(declare-fun lt!263695 () SeekEntryResult!5729)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36026 (_ BitVec 32)) SeekEntryResult!5729)

(assert (=> b!576982 (= lt!263695 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!576983 () Bool)

(declare-fun res!365158 () Bool)

(assert (=> b!576983 (=> (not res!365158) (not e!331875))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576983 (= res!365158 (validKeyInArray!0 (select (arr!17292 a!2986) j!136)))))

(declare-fun b!576984 () Bool)

(declare-fun res!365155 () Bool)

(assert (=> b!576984 (=> (not res!365155) (not e!331875))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!576984 (= res!365155 (and (= (size!17657 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17657 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17657 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!576985 () Bool)

(declare-fun res!365157 () Bool)

(assert (=> b!576985 (=> (not res!365157) (not e!331875))))

(assert (=> b!576985 (= res!365157 (validKeyInArray!0 k!1786))))

(assert (= (and start!52994 res!365159) b!576984))

(assert (= (and b!576984 res!365155) b!576983))

(assert (= (and b!576983 res!365158) b!576985))

(assert (= (and b!576985 res!365157) b!576981))

(assert (= (and b!576981 res!365156) b!576982))

(declare-fun m!555385 () Bool)

(assert (=> b!576982 m!555385))

(declare-fun m!555387 () Bool)

(assert (=> b!576983 m!555387))

(assert (=> b!576983 m!555387))

(declare-fun m!555389 () Bool)

(assert (=> b!576983 m!555389))

(declare-fun m!555391 () Bool)

(assert (=> start!52994 m!555391))

(declare-fun m!555393 () Bool)

(assert (=> start!52994 m!555393))

(declare-fun m!555395 () Bool)

(assert (=> b!576985 m!555395))

(declare-fun m!555397 () Bool)

(assert (=> b!576981 m!555397))

(push 1)

(assert (not start!52994))

(assert (not b!576981))

(assert (not b!576982))

(assert (not b!576983))

(assert (not b!576985))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

