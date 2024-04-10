; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52992 () Bool)

(assert start!52992)

(declare-fun b!577113 () Bool)

(declare-fun res!365149 () Bool)

(declare-fun e!331994 () Bool)

(assert (=> b!577113 (=> (not res!365149) (not e!331994))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577113 (= res!365149 (validKeyInArray!0 k0!1786))))

(declare-fun b!577114 () Bool)

(declare-fun res!365146 () Bool)

(assert (=> b!577114 (=> (not res!365146) (not e!331994))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36010 0))(
  ( (array!36011 (arr!17284 (Array (_ BitVec 32) (_ BitVec 64))) (size!17648 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36010)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5724 0))(
  ( (MissingZero!5724 (index!25123 (_ BitVec 32))) (Found!5724 (index!25124 (_ BitVec 32))) (Intermediate!5724 (undefined!6536 Bool) (index!25125 (_ BitVec 32)) (x!54041 (_ BitVec 32))) (Undefined!5724) (MissingVacant!5724 (index!25126 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36010 (_ BitVec 32)) SeekEntryResult!5724)

(assert (=> b!577114 (= res!365146 (not (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) (MissingZero!5724 i!1108))))))

(declare-fun b!577115 () Bool)

(declare-fun res!365145 () Bool)

(assert (=> b!577115 (=> (not res!365145) (not e!331994))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!577115 (= res!365145 (validKeyInArray!0 (select (arr!17284 a!2986) j!136)))))

(declare-fun res!365147 () Bool)

(assert (=> start!52992 (=> (not res!365147) (not e!331994))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52992 (= res!365147 (validMask!0 mask!3053))))

(assert (=> start!52992 e!331994))

(assert (=> start!52992 true))

(declare-fun array_inv!13080 (array!36010) Bool)

(assert (=> start!52992 (array_inv!13080 a!2986)))

(declare-fun b!577116 () Bool)

(declare-fun res!365150 () Bool)

(assert (=> b!577116 (=> (not res!365150) (not e!331994))))

(declare-fun arrayContainsKey!0 (array!36010 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577116 (= res!365150 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577117 () Bool)

(declare-fun res!365148 () Bool)

(assert (=> b!577117 (=> (not res!365148) (not e!331994))))

(assert (=> b!577117 (= res!365148 (and (= (size!17648 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17648 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17648 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577118 () Bool)

(assert (=> b!577118 (= e!331994 (bvslt mask!3053 #b00000000000000000000000000000000))))

(assert (= (and start!52992 res!365147) b!577117))

(assert (= (and b!577117 res!365148) b!577115))

(assert (= (and b!577115 res!365145) b!577113))

(assert (= (and b!577113 res!365149) b!577116))

(assert (= (and b!577116 res!365150) b!577114))

(assert (= (and b!577114 res!365146) b!577118))

(declare-fun m!556031 () Bool)

(assert (=> b!577113 m!556031))

(declare-fun m!556033 () Bool)

(assert (=> b!577115 m!556033))

(assert (=> b!577115 m!556033))

(declare-fun m!556035 () Bool)

(assert (=> b!577115 m!556035))

(declare-fun m!556037 () Bool)

(assert (=> b!577116 m!556037))

(declare-fun m!556039 () Bool)

(assert (=> start!52992 m!556039))

(declare-fun m!556041 () Bool)

(assert (=> start!52992 m!556041))

(declare-fun m!556043 () Bool)

(assert (=> b!577114 m!556043))

(check-sat (not b!577113) (not b!577114) (not start!52992) (not b!577116) (not b!577115))
(check-sat)
