; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53014 () Bool)

(assert start!53014)

(declare-fun b!577283 () Bool)

(declare-fun res!365315 () Bool)

(declare-fun e!332061 () Bool)

(assert (=> b!577283 (=> (not res!365315) (not e!332061))))

(declare-datatypes ((array!36032 0))(
  ( (array!36033 (arr!17295 (Array (_ BitVec 32) (_ BitVec 64))) (size!17659 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36032)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577283 (= res!365315 (validKeyInArray!0 (select (arr!17295 a!2986) j!136)))))

(declare-fun b!577284 () Bool)

(assert (=> b!577284 (= e!332061 false)))

(declare-datatypes ((SeekEntryResult!5735 0))(
  ( (MissingZero!5735 (index!25167 (_ BitVec 32))) (Found!5735 (index!25168 (_ BitVec 32))) (Intermediate!5735 (undefined!6547 Bool) (index!25169 (_ BitVec 32)) (x!54084 (_ BitVec 32))) (Undefined!5735) (MissingVacant!5735 (index!25170 (_ BitVec 32))) )
))
(declare-fun lt!263935 () SeekEntryResult!5735)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36032 (_ BitVec 32)) SeekEntryResult!5735)

(assert (=> b!577284 (= lt!263935 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!577285 () Bool)

(declare-fun res!365318 () Bool)

(assert (=> b!577285 (=> (not res!365318) (not e!332061))))

(declare-fun arrayContainsKey!0 (array!36032 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577285 (= res!365318 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577286 () Bool)

(declare-fun res!365314 () Bool)

(assert (=> b!577286 (=> (not res!365314) (not e!332061))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577286 (= res!365314 (and (= (size!17659 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17659 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17659 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577282 () Bool)

(declare-fun res!365317 () Bool)

(assert (=> b!577282 (=> (not res!365317) (not e!332061))))

(assert (=> b!577282 (= res!365317 (validKeyInArray!0 k!1786))))

(declare-fun res!365316 () Bool)

(assert (=> start!53014 (=> (not res!365316) (not e!332061))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53014 (= res!365316 (validMask!0 mask!3053))))

(assert (=> start!53014 e!332061))

(assert (=> start!53014 true))

(declare-fun array_inv!13091 (array!36032) Bool)

(assert (=> start!53014 (array_inv!13091 a!2986)))

(assert (= (and start!53014 res!365316) b!577286))

(assert (= (and b!577286 res!365314) b!577283))

(assert (= (and b!577283 res!365315) b!577282))

(assert (= (and b!577282 res!365317) b!577285))

(assert (= (and b!577285 res!365318) b!577284))

(declare-fun m!556185 () Bool)

(assert (=> b!577284 m!556185))

(declare-fun m!556187 () Bool)

(assert (=> b!577283 m!556187))

(assert (=> b!577283 m!556187))

(declare-fun m!556189 () Bool)

(assert (=> b!577283 m!556189))

(declare-fun m!556191 () Bool)

(assert (=> b!577285 m!556191))

(declare-fun m!556193 () Bool)

(assert (=> b!577282 m!556193))

(declare-fun m!556195 () Bool)

(assert (=> start!53014 m!556195))

(declare-fun m!556197 () Bool)

(assert (=> start!53014 m!556197))

(push 1)

(assert (not b!577283))

(assert (not b!577285))

(assert (not b!577284))

(assert (not start!53014))

(assert (not b!577282))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

