; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50972 () Bool)

(assert start!50972)

(declare-fun b!557050 () Bool)

(declare-fun res!349240 () Bool)

(declare-fun e!320911 () Bool)

(assert (=> b!557050 (=> (not res!349240) (not e!320911))))

(declare-datatypes ((array!35092 0))(
  ( (array!35093 (arr!16853 (Array (_ BitVec 32) (_ BitVec 64))) (size!17218 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35092)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35092 (_ BitVec 32)) Bool)

(assert (=> b!557050 (= res!349240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!557051 () Bool)

(declare-fun res!349245 () Bool)

(declare-fun e!320912 () Bool)

(assert (=> b!557051 (=> (not res!349245) (not e!320912))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!557051 (= res!349245 (validKeyInArray!0 (select (arr!16853 a!3118) j!142)))))

(declare-fun res!349242 () Bool)

(assert (=> start!50972 (=> (not res!349242) (not e!320912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50972 (= res!349242 (validMask!0 mask!3119))))

(assert (=> start!50972 e!320912))

(assert (=> start!50972 true))

(declare-fun array_inv!12736 (array!35092) Bool)

(assert (=> start!50972 (array_inv!12736 a!3118)))

(declare-fun b!557052 () Bool)

(assert (=> b!557052 (= e!320912 e!320911)))

(declare-fun res!349247 () Bool)

(assert (=> b!557052 (=> (not res!349247) (not e!320911))))

(declare-datatypes ((SeekEntryResult!5299 0))(
  ( (MissingZero!5299 (index!23423 (_ BitVec 32))) (Found!5299 (index!23424 (_ BitVec 32))) (Intermediate!5299 (undefined!6111 Bool) (index!23425 (_ BitVec 32)) (x!52332 (_ BitVec 32))) (Undefined!5299) (MissingVacant!5299 (index!23426 (_ BitVec 32))) )
))
(declare-fun lt!253027 () SeekEntryResult!5299)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!557052 (= res!349247 (or (= lt!253027 (MissingZero!5299 i!1132)) (= lt!253027 (MissingVacant!5299 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35092 (_ BitVec 32)) SeekEntryResult!5299)

(assert (=> b!557052 (= lt!253027 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!557053 () Bool)

(declare-fun res!349244 () Bool)

(assert (=> b!557053 (=> (not res!349244) (not e!320912))))

(assert (=> b!557053 (= res!349244 (validKeyInArray!0 k0!1914))))

(declare-fun b!557054 () Bool)

(declare-fun res!349241 () Bool)

(assert (=> b!557054 (=> (not res!349241) (not e!320912))))

(assert (=> b!557054 (= res!349241 (and (= (size!17218 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17218 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17218 a!3118)) (not (= i!1132 j!142))))))

(declare-fun e!320910 () Bool)

(declare-fun b!557055 () Bool)

(assert (=> b!557055 (= e!320910 (= (seekEntryOrOpen!0 (select (arr!16853 a!3118) j!142) a!3118 mask!3119) (Found!5299 j!142)))))

(declare-fun b!557056 () Bool)

(declare-fun res!349238 () Bool)

(assert (=> b!557056 (=> (not res!349238) (not e!320912))))

(declare-fun arrayContainsKey!0 (array!35092 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!557056 (= res!349238 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!557057 () Bool)

(declare-fun res!349246 () Bool)

(assert (=> b!557057 (=> (not res!349246) (not e!320911))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35092 (_ BitVec 32)) SeekEntryResult!5299)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557057 (= res!349246 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16853 a!3118) j!142) mask!3119) (select (arr!16853 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16853 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16853 a!3118) i!1132 k0!1914) j!142) (array!35093 (store (arr!16853 a!3118) i!1132 k0!1914) (size!17218 a!3118)) mask!3119)))))

(declare-fun b!557058 () Bool)

(assert (=> b!557058 (= e!320911 (not true))))

(assert (=> b!557058 e!320910))

(declare-fun res!349243 () Bool)

(assert (=> b!557058 (=> (not res!349243) (not e!320910))))

(assert (=> b!557058 (= res!349243 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17358 0))(
  ( (Unit!17359) )
))
(declare-fun lt!253026 () Unit!17358)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35092 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17358)

(assert (=> b!557058 (= lt!253026 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!557059 () Bool)

(declare-fun res!349239 () Bool)

(assert (=> b!557059 (=> (not res!349239) (not e!320911))))

(declare-datatypes ((List!10972 0))(
  ( (Nil!10969) (Cons!10968 (h!11959 (_ BitVec 64)) (t!17191 List!10972)) )
))
(declare-fun arrayNoDuplicates!0 (array!35092 (_ BitVec 32) List!10972) Bool)

(assert (=> b!557059 (= res!349239 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10969))))

(assert (= (and start!50972 res!349242) b!557054))

(assert (= (and b!557054 res!349241) b!557051))

(assert (= (and b!557051 res!349245) b!557053))

(assert (= (and b!557053 res!349244) b!557056))

(assert (= (and b!557056 res!349238) b!557052))

(assert (= (and b!557052 res!349247) b!557050))

(assert (= (and b!557050 res!349240) b!557059))

(assert (= (and b!557059 res!349239) b!557057))

(assert (= (and b!557057 res!349246) b!557058))

(assert (= (and b!557058 res!349243) b!557055))

(declare-fun m!534443 () Bool)

(assert (=> b!557053 m!534443))

(declare-fun m!534445 () Bool)

(assert (=> b!557055 m!534445))

(assert (=> b!557055 m!534445))

(declare-fun m!534447 () Bool)

(assert (=> b!557055 m!534447))

(declare-fun m!534449 () Bool)

(assert (=> b!557050 m!534449))

(declare-fun m!534451 () Bool)

(assert (=> start!50972 m!534451))

(declare-fun m!534453 () Bool)

(assert (=> start!50972 m!534453))

(assert (=> b!557057 m!534445))

(declare-fun m!534455 () Bool)

(assert (=> b!557057 m!534455))

(assert (=> b!557057 m!534445))

(declare-fun m!534457 () Bool)

(assert (=> b!557057 m!534457))

(declare-fun m!534459 () Bool)

(assert (=> b!557057 m!534459))

(assert (=> b!557057 m!534457))

(declare-fun m!534461 () Bool)

(assert (=> b!557057 m!534461))

(assert (=> b!557057 m!534455))

(assert (=> b!557057 m!534445))

(declare-fun m!534463 () Bool)

(assert (=> b!557057 m!534463))

(declare-fun m!534465 () Bool)

(assert (=> b!557057 m!534465))

(assert (=> b!557057 m!534457))

(assert (=> b!557057 m!534459))

(declare-fun m!534467 () Bool)

(assert (=> b!557059 m!534467))

(assert (=> b!557051 m!534445))

(assert (=> b!557051 m!534445))

(declare-fun m!534469 () Bool)

(assert (=> b!557051 m!534469))

(declare-fun m!534471 () Bool)

(assert (=> b!557052 m!534471))

(declare-fun m!534473 () Bool)

(assert (=> b!557056 m!534473))

(declare-fun m!534475 () Bool)

(assert (=> b!557058 m!534475))

(declare-fun m!534477 () Bool)

(assert (=> b!557058 m!534477))

(check-sat (not b!557059) (not b!557057) (not b!557052) (not b!557058) (not b!557055) (not start!50972) (not b!557050) (not b!557053) (not b!557056) (not b!557051))
(check-sat)
