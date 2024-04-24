; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51594 () Bool)

(assert start!51594)

(declare-fun res!355320 () Bool)

(declare-fun e!325098 () Bool)

(assert (=> start!51594 (=> (not res!355320) (not e!325098))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51594 (= res!355320 (validMask!0 mask!3119))))

(assert (=> start!51594 e!325098))

(assert (=> start!51594 true))

(declare-datatypes ((array!35406 0))(
  ( (array!35407 (arr!17002 (Array (_ BitVec 32) (_ BitVec 64))) (size!17366 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35406)

(declare-fun array_inv!12861 (array!35406) Bool)

(assert (=> start!51594 (array_inv!12861 a!3118)))

(declare-fun b!564268 () Bool)

(declare-fun res!355315 () Bool)

(declare-fun e!325097 () Bool)

(assert (=> b!564268 (=> (not res!355315) (not e!325097))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35406 (_ BitVec 32)) Bool)

(assert (=> b!564268 (= res!355315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564269 () Bool)

(declare-fun res!355319 () Bool)

(assert (=> b!564269 (=> (not res!355319) (not e!325098))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564269 (= res!355319 (validKeyInArray!0 (select (arr!17002 a!3118) j!142)))))

(declare-fun b!564270 () Bool)

(declare-fun res!355318 () Bool)

(assert (=> b!564270 (=> (not res!355318) (not e!325098))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35406 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564270 (= res!355318 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564271 () Bool)

(assert (=> b!564271 (= e!325098 e!325097)))

(declare-fun res!355317 () Bool)

(assert (=> b!564271 (=> (not res!355317) (not e!325097))))

(declare-datatypes ((SeekEntryResult!5407 0))(
  ( (MissingZero!5407 (index!23855 (_ BitVec 32))) (Found!5407 (index!23856 (_ BitVec 32))) (Intermediate!5407 (undefined!6219 Bool) (index!23857 (_ BitVec 32)) (x!52889 (_ BitVec 32))) (Undefined!5407) (MissingVacant!5407 (index!23858 (_ BitVec 32))) )
))
(declare-fun lt!257541 () SeekEntryResult!5407)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564271 (= res!355317 (or (= lt!257541 (MissingZero!5407 i!1132)) (= lt!257541 (MissingVacant!5407 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35406 (_ BitVec 32)) SeekEntryResult!5407)

(assert (=> b!564271 (= lt!257541 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!564272 () Bool)

(declare-fun res!355321 () Bool)

(assert (=> b!564272 (=> (not res!355321) (not e!325098))))

(assert (=> b!564272 (= res!355321 (validKeyInArray!0 k0!1914))))

(declare-fun b!564273 () Bool)

(declare-fun res!355316 () Bool)

(assert (=> b!564273 (=> (not res!355316) (not e!325098))))

(assert (=> b!564273 (= res!355316 (and (= (size!17366 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17366 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17366 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564274 () Bool)

(assert (=> b!564274 (= e!325097 false)))

(declare-fun lt!257542 () Bool)

(declare-datatypes ((List!10989 0))(
  ( (Nil!10986) (Cons!10985 (h!11991 (_ BitVec 64)) (t!17209 List!10989)) )
))
(declare-fun arrayNoDuplicates!0 (array!35406 (_ BitVec 32) List!10989) Bool)

(assert (=> b!564274 (= lt!257542 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10986))))

(assert (= (and start!51594 res!355320) b!564273))

(assert (= (and b!564273 res!355316) b!564269))

(assert (= (and b!564269 res!355319) b!564272))

(assert (= (and b!564272 res!355321) b!564270))

(assert (= (and b!564270 res!355318) b!564271))

(assert (= (and b!564271 res!355317) b!564268))

(assert (= (and b!564268 res!355315) b!564274))

(declare-fun m!542879 () Bool)

(assert (=> b!564274 m!542879))

(declare-fun m!542881 () Bool)

(assert (=> b!564268 m!542881))

(declare-fun m!542883 () Bool)

(assert (=> start!51594 m!542883))

(declare-fun m!542885 () Bool)

(assert (=> start!51594 m!542885))

(declare-fun m!542887 () Bool)

(assert (=> b!564269 m!542887))

(assert (=> b!564269 m!542887))

(declare-fun m!542889 () Bool)

(assert (=> b!564269 m!542889))

(declare-fun m!542891 () Bool)

(assert (=> b!564271 m!542891))

(declare-fun m!542893 () Bool)

(assert (=> b!564272 m!542893))

(declare-fun m!542895 () Bool)

(assert (=> b!564270 m!542895))

(check-sat (not b!564271) (not b!564268) (not b!564274) (not start!51594) (not b!564270) (not b!564269) (not b!564272))
(check-sat)
