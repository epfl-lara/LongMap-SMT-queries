; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50172 () Bool)

(assert start!50172)

(declare-fun res!342312 () Bool)

(declare-fun e!317244 () Bool)

(assert (=> start!50172 (=> (not res!342312) (not e!317244))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50172 (= res!342312 (validMask!0 mask!3119))))

(assert (=> start!50172 e!317244))

(assert (=> start!50172 true))

(declare-datatypes ((array!34617 0))(
  ( (array!34618 (arr!16624 (Array (_ BitVec 32) (_ BitVec 64))) (size!16988 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34617)

(declare-fun array_inv!12483 (array!34617) Bool)

(assert (=> start!50172 (array_inv!12483 a!3118)))

(declare-fun b!549183 () Bool)

(declare-fun e!317243 () Bool)

(assert (=> b!549183 (= e!317244 e!317243)))

(declare-fun res!342316 () Bool)

(assert (=> b!549183 (=> (not res!342316) (not e!317243))))

(declare-datatypes ((SeekEntryResult!5029 0))(
  ( (MissingZero!5029 (index!22343 (_ BitVec 32))) (Found!5029 (index!22344 (_ BitVec 32))) (Intermediate!5029 (undefined!5841 Bool) (index!22345 (_ BitVec 32)) (x!51431 (_ BitVec 32))) (Undefined!5029) (MissingVacant!5029 (index!22346 (_ BitVec 32))) )
))
(declare-fun lt!250086 () SeekEntryResult!5029)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!549183 (= res!342316 (or (= lt!250086 (MissingZero!5029 i!1132)) (= lt!250086 (MissingVacant!5029 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34617 (_ BitVec 32)) SeekEntryResult!5029)

(assert (=> b!549183 (= lt!250086 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!549184 () Bool)

(declare-fun res!342314 () Bool)

(assert (=> b!549184 (=> (not res!342314) (not e!317243))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34617 (_ BitVec 32)) Bool)

(assert (=> b!549184 (= res!342314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549185 () Bool)

(assert (=> b!549185 (= e!317243 false)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!250087 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549185 (= lt!250087 (toIndex!0 (select (store (arr!16624 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(declare-fun b!549186 () Bool)

(declare-fun res!342311 () Bool)

(assert (=> b!549186 (=> (not res!342311) (not e!317244))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549186 (= res!342311 (validKeyInArray!0 (select (arr!16624 a!3118) j!142)))))

(declare-fun b!549187 () Bool)

(declare-fun res!342309 () Bool)

(assert (=> b!549187 (=> (not res!342309) (not e!317244))))

(assert (=> b!549187 (= res!342309 (and (= (size!16988 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16988 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16988 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549188 () Bool)

(declare-fun res!342313 () Bool)

(assert (=> b!549188 (=> (not res!342313) (not e!317243))))

(declare-datatypes ((List!10611 0))(
  ( (Nil!10608) (Cons!10607 (h!11580 (_ BitVec 64)) (t!16831 List!10611)) )
))
(declare-fun arrayNoDuplicates!0 (array!34617 (_ BitVec 32) List!10611) Bool)

(assert (=> b!549188 (= res!342313 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10608))))

(declare-fun b!549189 () Bool)

(declare-fun res!342315 () Bool)

(assert (=> b!549189 (=> (not res!342315) (not e!317244))))

(declare-fun arrayContainsKey!0 (array!34617 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549189 (= res!342315 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549190 () Bool)

(declare-fun res!342310 () Bool)

(assert (=> b!549190 (=> (not res!342310) (not e!317244))))

(assert (=> b!549190 (= res!342310 (validKeyInArray!0 k0!1914))))

(assert (= (and start!50172 res!342312) b!549187))

(assert (= (and b!549187 res!342309) b!549186))

(assert (= (and b!549186 res!342311) b!549190))

(assert (= (and b!549190 res!342310) b!549189))

(assert (= (and b!549189 res!342315) b!549183))

(assert (= (and b!549183 res!342316) b!549184))

(assert (= (and b!549184 res!342314) b!549188))

(assert (= (and b!549188 res!342313) b!549185))

(declare-fun m!526229 () Bool)

(assert (=> b!549188 m!526229))

(declare-fun m!526231 () Bool)

(assert (=> b!549184 m!526231))

(declare-fun m!526233 () Bool)

(assert (=> b!549190 m!526233))

(declare-fun m!526235 () Bool)

(assert (=> start!50172 m!526235))

(declare-fun m!526237 () Bool)

(assert (=> start!50172 m!526237))

(declare-fun m!526239 () Bool)

(assert (=> b!549183 m!526239))

(declare-fun m!526241 () Bool)

(assert (=> b!549185 m!526241))

(declare-fun m!526243 () Bool)

(assert (=> b!549185 m!526243))

(assert (=> b!549185 m!526243))

(declare-fun m!526245 () Bool)

(assert (=> b!549185 m!526245))

(declare-fun m!526247 () Bool)

(assert (=> b!549189 m!526247))

(declare-fun m!526249 () Bool)

(assert (=> b!549186 m!526249))

(assert (=> b!549186 m!526249))

(declare-fun m!526251 () Bool)

(assert (=> b!549186 m!526251))

(check-sat (not start!50172) (not b!549186) (not b!549183) (not b!549188) (not b!549190) (not b!549189) (not b!549184) (not b!549185))
(check-sat)
