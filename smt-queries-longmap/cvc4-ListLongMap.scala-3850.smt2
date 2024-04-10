; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52988 () Bool)

(assert start!52988)

(declare-fun b!577078 () Bool)

(declare-fun res!365110 () Bool)

(declare-fun e!331982 () Bool)

(assert (=> b!577078 (=> (not res!365110) (not e!331982))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577078 (= res!365110 (validKeyInArray!0 k!1786))))

(declare-fun b!577080 () Bool)

(assert (=> b!577080 (= e!331982 false)))

(declare-datatypes ((SeekEntryResult!5722 0))(
  ( (MissingZero!5722 (index!25115 (_ BitVec 32))) (Found!5722 (index!25116 (_ BitVec 32))) (Intermediate!5722 (undefined!6534 Bool) (index!25117 (_ BitVec 32)) (x!54031 (_ BitVec 32))) (Undefined!5722) (MissingVacant!5722 (index!25118 (_ BitVec 32))) )
))
(declare-fun lt!263905 () SeekEntryResult!5722)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!36006 0))(
  ( (array!36007 (arr!17282 (Array (_ BitVec 32) (_ BitVec 64))) (size!17646 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36006)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36006 (_ BitVec 32)) SeekEntryResult!5722)

(assert (=> b!577080 (= lt!263905 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!577081 () Bool)

(declare-fun res!365113 () Bool)

(assert (=> b!577081 (=> (not res!365113) (not e!331982))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!577081 (= res!365113 (validKeyInArray!0 (select (arr!17282 a!2986) j!136)))))

(declare-fun b!577082 () Bool)

(declare-fun res!365112 () Bool)

(assert (=> b!577082 (=> (not res!365112) (not e!331982))))

(declare-fun arrayContainsKey!0 (array!36006 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577082 (= res!365112 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577079 () Bool)

(declare-fun res!365111 () Bool)

(assert (=> b!577079 (=> (not res!365111) (not e!331982))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577079 (= res!365111 (and (= (size!17646 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17646 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17646 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!365114 () Bool)

(assert (=> start!52988 (=> (not res!365114) (not e!331982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52988 (= res!365114 (validMask!0 mask!3053))))

(assert (=> start!52988 e!331982))

(assert (=> start!52988 true))

(declare-fun array_inv!13078 (array!36006) Bool)

(assert (=> start!52988 (array_inv!13078 a!2986)))

(assert (= (and start!52988 res!365114) b!577079))

(assert (= (and b!577079 res!365111) b!577081))

(assert (= (and b!577081 res!365113) b!577078))

(assert (= (and b!577078 res!365110) b!577082))

(assert (= (and b!577082 res!365112) b!577080))

(declare-fun m!556003 () Bool)

(assert (=> b!577082 m!556003))

(declare-fun m!556005 () Bool)

(assert (=> b!577080 m!556005))

(declare-fun m!556007 () Bool)

(assert (=> b!577078 m!556007))

(declare-fun m!556009 () Bool)

(assert (=> b!577081 m!556009))

(assert (=> b!577081 m!556009))

(declare-fun m!556011 () Bool)

(assert (=> b!577081 m!556011))

(declare-fun m!556013 () Bool)

(assert (=> start!52988 m!556013))

(declare-fun m!556015 () Bool)

(assert (=> start!52988 m!556015))

(push 1)

(assert (not start!52988))

(assert (not b!577081))

(assert (not b!577082))

(assert (not b!577078))

(assert (not b!577080))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

