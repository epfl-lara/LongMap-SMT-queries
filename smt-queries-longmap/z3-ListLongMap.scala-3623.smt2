; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50024 () Bool)

(assert start!50024)

(declare-fun b!548157 () Bool)

(declare-fun res!341464 () Bool)

(declare-fun e!316756 () Bool)

(assert (=> b!548157 (=> (not res!341464) (not e!316756))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548157 (= res!341464 (validKeyInArray!0 k0!1914))))

(declare-fun b!548158 () Bool)

(declare-fun res!341460 () Bool)

(declare-fun e!316758 () Bool)

(assert (=> b!548158 (=> (not res!341460) (not e!316758))))

(declare-datatypes ((array!34552 0))(
  ( (array!34553 (arr!16594 (Array (_ BitVec 32) (_ BitVec 64))) (size!16958 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34552)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34552 (_ BitVec 32)) Bool)

(assert (=> b!548158 (= res!341460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!548160 () Bool)

(declare-fun res!341466 () Bool)

(assert (=> b!548160 (=> (not res!341466) (not e!316756))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!548160 (= res!341466 (validKeyInArray!0 (select (arr!16594 a!3118) j!142)))))

(declare-fun b!548161 () Bool)

(assert (=> b!548161 (= e!316758 false)))

(declare-fun lt!249798 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!548161 (= lt!249798 (toIndex!0 (select (arr!16594 a!3118) j!142) mask!3119))))

(declare-fun b!548162 () Bool)

(declare-fun res!341463 () Bool)

(assert (=> b!548162 (=> (not res!341463) (not e!316758))))

(declare-datatypes ((List!10581 0))(
  ( (Nil!10578) (Cons!10577 (h!11547 (_ BitVec 64)) (t!16801 List!10581)) )
))
(declare-fun arrayNoDuplicates!0 (array!34552 (_ BitVec 32) List!10581) Bool)

(assert (=> b!548162 (= res!341463 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10578))))

(declare-fun b!548163 () Bool)

(declare-fun res!341467 () Bool)

(assert (=> b!548163 (=> (not res!341467) (not e!316756))))

(declare-fun arrayContainsKey!0 (array!34552 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548163 (= res!341467 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!548164 () Bool)

(assert (=> b!548164 (= e!316756 e!316758)))

(declare-fun res!341462 () Bool)

(assert (=> b!548164 (=> (not res!341462) (not e!316758))))

(declare-datatypes ((SeekEntryResult!4999 0))(
  ( (MissingZero!4999 (index!22223 (_ BitVec 32))) (Found!4999 (index!22224 (_ BitVec 32))) (Intermediate!4999 (undefined!5811 Bool) (index!22225 (_ BitVec 32)) (x!51318 (_ BitVec 32))) (Undefined!4999) (MissingVacant!4999 (index!22226 (_ BitVec 32))) )
))
(declare-fun lt!249799 () SeekEntryResult!4999)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!548164 (= res!341462 (or (= lt!249799 (MissingZero!4999 i!1132)) (= lt!249799 (MissingVacant!4999 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34552 (_ BitVec 32)) SeekEntryResult!4999)

(assert (=> b!548164 (= lt!249799 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!341461 () Bool)

(assert (=> start!50024 (=> (not res!341461) (not e!316756))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50024 (= res!341461 (validMask!0 mask!3119))))

(assert (=> start!50024 e!316756))

(assert (=> start!50024 true))

(declare-fun array_inv!12453 (array!34552) Bool)

(assert (=> start!50024 (array_inv!12453 a!3118)))

(declare-fun b!548159 () Bool)

(declare-fun res!341465 () Bool)

(assert (=> b!548159 (=> (not res!341465) (not e!316756))))

(assert (=> b!548159 (= res!341465 (and (= (size!16958 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16958 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16958 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50024 res!341461) b!548159))

(assert (= (and b!548159 res!341465) b!548160))

(assert (= (and b!548160 res!341466) b!548157))

(assert (= (and b!548157 res!341464) b!548163))

(assert (= (and b!548163 res!341467) b!548164))

(assert (= (and b!548164 res!341462) b!548158))

(assert (= (and b!548158 res!341460) b!548162))

(assert (= (and b!548162 res!341463) b!548161))

(declare-fun m!525439 () Bool)

(assert (=> b!548158 m!525439))

(declare-fun m!525441 () Bool)

(assert (=> b!548161 m!525441))

(assert (=> b!548161 m!525441))

(declare-fun m!525443 () Bool)

(assert (=> b!548161 m!525443))

(declare-fun m!525445 () Bool)

(assert (=> b!548163 m!525445))

(assert (=> b!548160 m!525441))

(assert (=> b!548160 m!525441))

(declare-fun m!525447 () Bool)

(assert (=> b!548160 m!525447))

(declare-fun m!525449 () Bool)

(assert (=> start!50024 m!525449))

(declare-fun m!525451 () Bool)

(assert (=> start!50024 m!525451))

(declare-fun m!525453 () Bool)

(assert (=> b!548164 m!525453))

(declare-fun m!525455 () Bool)

(assert (=> b!548162 m!525455))

(declare-fun m!525457 () Bool)

(assert (=> b!548157 m!525457))

(check-sat (not b!548164) (not b!548162) (not b!548161) (not b!548163) (not start!50024) (not b!548157) (not b!548158) (not b!548160))
(check-sat)
