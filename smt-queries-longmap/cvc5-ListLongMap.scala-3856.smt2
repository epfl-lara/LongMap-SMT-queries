; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53074 () Bool)

(assert start!53074)

(declare-fun b!577557 () Bool)

(declare-fun e!332220 () Bool)

(assert (=> b!577557 (= e!332220 false)))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36037 0))(
  ( (array!36038 (arr!17295 (Array (_ BitVec 32) (_ BitVec 64))) (size!17659 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36037)

(declare-datatypes ((SeekEntryResult!5691 0))(
  ( (MissingZero!5691 (index!24991 (_ BitVec 32))) (Found!5691 (index!24992 (_ BitVec 32))) (Intermediate!5691 (undefined!6503 Bool) (index!24993 (_ BitVec 32)) (x!54051 (_ BitVec 32))) (Undefined!5691) (MissingVacant!5691 (index!24994 (_ BitVec 32))) )
))
(declare-fun lt!264061 () SeekEntryResult!5691)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36037 (_ BitVec 32)) SeekEntryResult!5691)

(assert (=> b!577557 (= lt!264061 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!577558 () Bool)

(declare-fun res!365484 () Bool)

(assert (=> b!577558 (=> (not res!365484) (not e!332220))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577558 (= res!365484 (validKeyInArray!0 (select (arr!17295 a!2986) j!136)))))

(declare-fun b!577559 () Bool)

(declare-fun res!365487 () Bool)

(assert (=> b!577559 (=> (not res!365487) (not e!332220))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577559 (= res!365487 (and (= (size!17659 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17659 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17659 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!365488 () Bool)

(assert (=> start!53074 (=> (not res!365488) (not e!332220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53074 (= res!365488 (validMask!0 mask!3053))))

(assert (=> start!53074 e!332220))

(assert (=> start!53074 true))

(declare-fun array_inv!13154 (array!36037) Bool)

(assert (=> start!53074 (array_inv!13154 a!2986)))

(declare-fun b!577560 () Bool)

(declare-fun res!365485 () Bool)

(assert (=> b!577560 (=> (not res!365485) (not e!332220))))

(declare-fun arrayContainsKey!0 (array!36037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577560 (= res!365485 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577561 () Bool)

(declare-fun res!365486 () Bool)

(assert (=> b!577561 (=> (not res!365486) (not e!332220))))

(assert (=> b!577561 (= res!365486 (validKeyInArray!0 k!1786))))

(assert (= (and start!53074 res!365488) b!577559))

(assert (= (and b!577559 res!365487) b!577558))

(assert (= (and b!577558 res!365484) b!577561))

(assert (= (and b!577561 res!365486) b!577560))

(assert (= (and b!577560 res!365485) b!577557))

(declare-fun m!556593 () Bool)

(assert (=> b!577561 m!556593))

(declare-fun m!556595 () Bool)

(assert (=> b!577558 m!556595))

(assert (=> b!577558 m!556595))

(declare-fun m!556597 () Bool)

(assert (=> b!577558 m!556597))

(declare-fun m!556599 () Bool)

(assert (=> start!53074 m!556599))

(declare-fun m!556601 () Bool)

(assert (=> start!53074 m!556601))

(declare-fun m!556603 () Bool)

(assert (=> b!577557 m!556603))

(declare-fun m!556605 () Bool)

(assert (=> b!577560 m!556605))

(push 1)

(assert (not b!577558))

(assert (not b!577560))

(assert (not start!53074))

(assert (not b!577557))

(assert (not b!577561))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

