; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52998 () Bool)

(assert start!52998)

(declare-fun b!577162 () Bool)

(declare-fun res!365197 () Bool)

(declare-fun e!332012 () Bool)

(assert (=> b!577162 (=> (not res!365197) (not e!332012))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36016 0))(
  ( (array!36017 (arr!17287 (Array (_ BitVec 32) (_ BitVec 64))) (size!17651 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36016)

(assert (=> b!577162 (= res!365197 (and (= (size!17651 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17651 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17651 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577163 () Bool)

(assert (=> b!577163 (= e!332012 false)))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5727 0))(
  ( (MissingZero!5727 (index!25135 (_ BitVec 32))) (Found!5727 (index!25136 (_ BitVec 32))) (Intermediate!5727 (undefined!6539 Bool) (index!25137 (_ BitVec 32)) (x!54052 (_ BitVec 32))) (Undefined!5727) (MissingVacant!5727 (index!25138 (_ BitVec 32))) )
))
(declare-fun lt!263911 () SeekEntryResult!5727)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36016 (_ BitVec 32)) SeekEntryResult!5727)

(assert (=> b!577163 (= lt!263911 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!577164 () Bool)

(declare-fun res!365194 () Bool)

(assert (=> b!577164 (=> (not res!365194) (not e!332012))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577164 (= res!365194 (validKeyInArray!0 (select (arr!17287 a!2986) j!136)))))

(declare-fun b!577165 () Bool)

(declare-fun res!365196 () Bool)

(assert (=> b!577165 (=> (not res!365196) (not e!332012))))

(assert (=> b!577165 (= res!365196 (validKeyInArray!0 k0!1786))))

(declare-fun res!365198 () Bool)

(assert (=> start!52998 (=> (not res!365198) (not e!332012))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52998 (= res!365198 (validMask!0 mask!3053))))

(assert (=> start!52998 e!332012))

(assert (=> start!52998 true))

(declare-fun array_inv!13083 (array!36016) Bool)

(assert (=> start!52998 (array_inv!13083 a!2986)))

(declare-fun b!577166 () Bool)

(declare-fun res!365195 () Bool)

(assert (=> b!577166 (=> (not res!365195) (not e!332012))))

(declare-fun arrayContainsKey!0 (array!36016 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577166 (= res!365195 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!52998 res!365198) b!577162))

(assert (= (and b!577162 res!365197) b!577164))

(assert (= (and b!577164 res!365194) b!577165))

(assert (= (and b!577165 res!365196) b!577166))

(assert (= (and b!577166 res!365195) b!577163))

(declare-fun m!556073 () Bool)

(assert (=> b!577163 m!556073))

(declare-fun m!556075 () Bool)

(assert (=> start!52998 m!556075))

(declare-fun m!556077 () Bool)

(assert (=> start!52998 m!556077))

(declare-fun m!556079 () Bool)

(assert (=> b!577166 m!556079))

(declare-fun m!556081 () Bool)

(assert (=> b!577164 m!556081))

(assert (=> b!577164 m!556081))

(declare-fun m!556083 () Bool)

(assert (=> b!577164 m!556083))

(declare-fun m!556085 () Bool)

(assert (=> b!577165 m!556085))

(check-sat (not b!577165) (not b!577164) (not b!577166) (not b!577163) (not start!52998))
