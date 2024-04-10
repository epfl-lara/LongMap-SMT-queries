; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49984 () Bool)

(assert start!49984)

(declare-fun b!548053 () Bool)

(declare-fun res!341468 () Bool)

(declare-fun e!316664 () Bool)

(assert (=> b!548053 (=> (not res!341468) (not e!316664))))

(declare-datatypes ((array!34566 0))(
  ( (array!34567 (arr!16603 (Array (_ BitVec 32) (_ BitVec 64))) (size!16967 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34566)

(declare-datatypes ((List!10683 0))(
  ( (Nil!10680) (Cons!10679 (h!11646 (_ BitVec 64)) (t!16911 List!10683)) )
))
(declare-fun arrayNoDuplicates!0 (array!34566 (_ BitVec 32) List!10683) Bool)

(assert (=> b!548053 (= res!341468 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10680))))

(declare-fun b!548054 () Bool)

(declare-fun res!341462 () Bool)

(declare-fun e!316665 () Bool)

(assert (=> b!548054 (=> (not res!341462) (not e!316665))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548054 (= res!341462 (validKeyInArray!0 (select (arr!16603 a!3118) j!142)))))

(declare-fun b!548055 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(assert (=> b!548055 (= e!316664 (bvslt mask!3119 #b00000000000000000000000000000000))))

(declare-fun lt!249712 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!548055 (= lt!249712 (toIndex!0 (select (arr!16603 a!3118) j!142) mask!3119))))

(declare-fun b!548056 () Bool)

(declare-fun res!341465 () Bool)

(assert (=> b!548056 (=> (not res!341465) (not e!316665))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!548056 (= res!341465 (validKeyInArray!0 k0!1914))))

(declare-fun res!341461 () Bool)

(assert (=> start!49984 (=> (not res!341461) (not e!316665))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49984 (= res!341461 (validMask!0 mask!3119))))

(assert (=> start!49984 e!316665))

(assert (=> start!49984 true))

(declare-fun array_inv!12399 (array!34566) Bool)

(assert (=> start!49984 (array_inv!12399 a!3118)))

(declare-fun b!548057 () Bool)

(assert (=> b!548057 (= e!316665 e!316664)))

(declare-fun res!341464 () Bool)

(assert (=> b!548057 (=> (not res!341464) (not e!316664))))

(declare-datatypes ((SeekEntryResult!5052 0))(
  ( (MissingZero!5052 (index!22435 (_ BitVec 32))) (Found!5052 (index!22436 (_ BitVec 32))) (Intermediate!5052 (undefined!5864 Bool) (index!22437 (_ BitVec 32)) (x!51376 (_ BitVec 32))) (Undefined!5052) (MissingVacant!5052 (index!22438 (_ BitVec 32))) )
))
(declare-fun lt!249711 () SeekEntryResult!5052)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!548057 (= res!341464 (or (= lt!249711 (MissingZero!5052 i!1132)) (= lt!249711 (MissingVacant!5052 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34566 (_ BitVec 32)) SeekEntryResult!5052)

(assert (=> b!548057 (= lt!249711 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!548058 () Bool)

(declare-fun res!341463 () Bool)

(assert (=> b!548058 (=> (not res!341463) (not e!316664))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34566 (_ BitVec 32)) Bool)

(assert (=> b!548058 (= res!341463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!548059 () Bool)

(declare-fun res!341466 () Bool)

(assert (=> b!548059 (=> (not res!341466) (not e!316665))))

(declare-fun arrayContainsKey!0 (array!34566 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548059 (= res!341466 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!548060 () Bool)

(declare-fun res!341467 () Bool)

(assert (=> b!548060 (=> (not res!341467) (not e!316665))))

(assert (=> b!548060 (= res!341467 (and (= (size!16967 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16967 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16967 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!49984 res!341461) b!548060))

(assert (= (and b!548060 res!341467) b!548054))

(assert (= (and b!548054 res!341462) b!548056))

(assert (= (and b!548056 res!341465) b!548059))

(assert (= (and b!548059 res!341466) b!548057))

(assert (= (and b!548057 res!341464) b!548058))

(assert (= (and b!548058 res!341463) b!548053))

(assert (= (and b!548053 res!341468) b!548055))

(declare-fun m!525167 () Bool)

(assert (=> b!548058 m!525167))

(declare-fun m!525169 () Bool)

(assert (=> b!548056 m!525169))

(declare-fun m!525171 () Bool)

(assert (=> start!49984 m!525171))

(declare-fun m!525173 () Bool)

(assert (=> start!49984 m!525173))

(declare-fun m!525175 () Bool)

(assert (=> b!548053 m!525175))

(declare-fun m!525177 () Bool)

(assert (=> b!548054 m!525177))

(assert (=> b!548054 m!525177))

(declare-fun m!525179 () Bool)

(assert (=> b!548054 m!525179))

(declare-fun m!525181 () Bool)

(assert (=> b!548059 m!525181))

(assert (=> b!548055 m!525177))

(assert (=> b!548055 m!525177))

(declare-fun m!525183 () Bool)

(assert (=> b!548055 m!525183))

(declare-fun m!525185 () Bool)

(assert (=> b!548057 m!525185))

(check-sat (not b!548057) (not b!548054) (not b!548056) (not b!548058) (not b!548053) (not start!49984) (not b!548055) (not b!548059))
(check-sat)
