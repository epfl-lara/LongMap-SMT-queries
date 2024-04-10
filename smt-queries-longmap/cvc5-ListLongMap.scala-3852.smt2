; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52996 () Bool)

(assert start!52996)

(declare-fun b!577147 () Bool)

(declare-fun res!365179 () Bool)

(declare-fun e!332007 () Bool)

(assert (=> b!577147 (=> (not res!365179) (not e!332007))))

(declare-datatypes ((array!36014 0))(
  ( (array!36015 (arr!17286 (Array (_ BitVec 32) (_ BitVec 64))) (size!17650 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36014)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577147 (= res!365179 (validKeyInArray!0 (select (arr!17286 a!2986) j!136)))))

(declare-fun b!577148 () Bool)

(assert (=> b!577148 (= e!332007 false)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5726 0))(
  ( (MissingZero!5726 (index!25131 (_ BitVec 32))) (Found!5726 (index!25132 (_ BitVec 32))) (Intermediate!5726 (undefined!6538 Bool) (index!25133 (_ BitVec 32)) (x!54051 (_ BitVec 32))) (Undefined!5726) (MissingVacant!5726 (index!25134 (_ BitVec 32))) )
))
(declare-fun lt!263908 () SeekEntryResult!5726)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36014 (_ BitVec 32)) SeekEntryResult!5726)

(assert (=> b!577148 (= lt!263908 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!577149 () Bool)

(declare-fun res!365181 () Bool)

(assert (=> b!577149 (=> (not res!365181) (not e!332007))))

(assert (=> b!577149 (= res!365181 (validKeyInArray!0 k!1786))))

(declare-fun res!365183 () Bool)

(assert (=> start!52996 (=> (not res!365183) (not e!332007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52996 (= res!365183 (validMask!0 mask!3053))))

(assert (=> start!52996 e!332007))

(assert (=> start!52996 true))

(declare-fun array_inv!13082 (array!36014) Bool)

(assert (=> start!52996 (array_inv!13082 a!2986)))

(declare-fun b!577150 () Bool)

(declare-fun res!365180 () Bool)

(assert (=> b!577150 (=> (not res!365180) (not e!332007))))

(declare-fun arrayContainsKey!0 (array!36014 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577150 (= res!365180 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577151 () Bool)

(declare-fun res!365182 () Bool)

(assert (=> b!577151 (=> (not res!365182) (not e!332007))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577151 (= res!365182 (and (= (size!17650 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17650 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17650 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!52996 res!365183) b!577151))

(assert (= (and b!577151 res!365182) b!577147))

(assert (= (and b!577147 res!365179) b!577149))

(assert (= (and b!577149 res!365181) b!577150))

(assert (= (and b!577150 res!365180) b!577148))

(declare-fun m!556059 () Bool)

(assert (=> b!577150 m!556059))

(declare-fun m!556061 () Bool)

(assert (=> b!577147 m!556061))

(assert (=> b!577147 m!556061))

(declare-fun m!556063 () Bool)

(assert (=> b!577147 m!556063))

(declare-fun m!556065 () Bool)

(assert (=> b!577148 m!556065))

(declare-fun m!556067 () Bool)

(assert (=> start!52996 m!556067))

(declare-fun m!556069 () Bool)

(assert (=> start!52996 m!556069))

(declare-fun m!556071 () Bool)

(assert (=> b!577149 m!556071))

(push 1)

(assert (not b!577148))

(assert (not start!52996))

(assert (not b!577149))

(assert (not b!577150))

(assert (not b!577147))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

