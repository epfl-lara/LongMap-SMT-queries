; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53032 () Bool)

(assert start!53032)

(declare-fun b!577421 () Bool)

(declare-fun res!365458 () Bool)

(declare-fun e!332117 () Bool)

(assert (=> b!577421 (=> (not res!365458) (not e!332117))))

(declare-datatypes ((array!36050 0))(
  ( (array!36051 (arr!17304 (Array (_ BitVec 32) (_ BitVec 64))) (size!17668 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36050)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577421 (= res!365458 (validKeyInArray!0 (select (arr!17304 a!2986) j!136)))))

(declare-fun b!577422 () Bool)

(declare-fun res!365455 () Bool)

(assert (=> b!577422 (=> (not res!365455) (not e!332117))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577422 (= res!365455 (and (= (size!17668 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17668 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17668 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577423 () Bool)

(declare-fun e!332116 () Bool)

(assert (=> b!577423 (= e!332117 e!332116)))

(declare-fun res!365459 () Bool)

(assert (=> b!577423 (=> (not res!365459) (not e!332116))))

(declare-datatypes ((SeekEntryResult!5744 0))(
  ( (MissingZero!5744 (index!25203 (_ BitVec 32))) (Found!5744 (index!25204 (_ BitVec 32))) (Intermediate!5744 (undefined!6556 Bool) (index!25205 (_ BitVec 32)) (x!54117 (_ BitVec 32))) (Undefined!5744) (MissingVacant!5744 (index!25206 (_ BitVec 32))) )
))
(declare-fun lt!263962 () SeekEntryResult!5744)

(assert (=> b!577423 (= res!365459 (or (= lt!263962 (MissingZero!5744 i!1108)) (= lt!263962 (MissingVacant!5744 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36050 (_ BitVec 32)) SeekEntryResult!5744)

(assert (=> b!577423 (= lt!263962 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!577424 () Bool)

(declare-fun res!365454 () Bool)

(assert (=> b!577424 (=> (not res!365454) (not e!332117))))

(assert (=> b!577424 (= res!365454 (validKeyInArray!0 k!1786))))

(declare-fun b!577425 () Bool)

(assert (=> b!577425 (= e!332116 (bvsgt #b00000000000000000000000000000000 (size!17668 a!2986)))))

(declare-fun b!577426 () Bool)

(declare-fun res!365453 () Bool)

(assert (=> b!577426 (=> (not res!365453) (not e!332116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36050 (_ BitVec 32)) Bool)

(assert (=> b!577426 (= res!365453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!365457 () Bool)

(assert (=> start!53032 (=> (not res!365457) (not e!332117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53032 (= res!365457 (validMask!0 mask!3053))))

(assert (=> start!53032 e!332117))

(assert (=> start!53032 true))

(declare-fun array_inv!13100 (array!36050) Bool)

(assert (=> start!53032 (array_inv!13100 a!2986)))

(declare-fun b!577427 () Bool)

(declare-fun res!365456 () Bool)

(assert (=> b!577427 (=> (not res!365456) (not e!332117))))

(declare-fun arrayContainsKey!0 (array!36050 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577427 (= res!365456 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53032 res!365457) b!577422))

(assert (= (and b!577422 res!365455) b!577421))

(assert (= (and b!577421 res!365458) b!577424))

(assert (= (and b!577424 res!365454) b!577427))

(assert (= (and b!577427 res!365456) b!577423))

(assert (= (and b!577423 res!365459) b!577426))

(assert (= (and b!577426 res!365453) b!577425))

(declare-fun m!556311 () Bool)

(assert (=> start!53032 m!556311))

(declare-fun m!556313 () Bool)

(assert (=> start!53032 m!556313))

(declare-fun m!556315 () Bool)

(assert (=> b!577427 m!556315))

(declare-fun m!556317 () Bool)

(assert (=> b!577426 m!556317))

(declare-fun m!556319 () Bool)

(assert (=> b!577424 m!556319))

(declare-fun m!556321 () Bool)

(assert (=> b!577423 m!556321))

(declare-fun m!556323 () Bool)

(assert (=> b!577421 m!556323))

(assert (=> b!577421 m!556323))

(declare-fun m!556325 () Bool)

(assert (=> b!577421 m!556325))

(push 1)

