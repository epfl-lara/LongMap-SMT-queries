; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51500 () Bool)

(assert start!51500)

(declare-fun b!563254 () Bool)

(declare-fun res!354557 () Bool)

(declare-fun e!324552 () Bool)

(assert (=> b!563254 (=> (not res!354557) (not e!324552))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563254 (= res!354557 (validKeyInArray!0 k0!1914))))

(declare-fun res!354551 () Bool)

(assert (=> start!51500 (=> (not res!354551) (not e!324552))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51500 (= res!354551 (validMask!0 mask!3119))))

(assert (=> start!51500 e!324552))

(assert (=> start!51500 true))

(declare-datatypes ((array!35374 0))(
  ( (array!35375 (arr!16988 (Array (_ BitVec 32) (_ BitVec 64))) (size!17353 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35374)

(declare-fun array_inv!12871 (array!35374) Bool)

(assert (=> start!51500 (array_inv!12871 a!3118)))

(declare-fun b!563255 () Bool)

(declare-fun res!354550 () Bool)

(declare-fun e!324553 () Bool)

(assert (=> b!563255 (=> (not res!354550) (not e!324553))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35374 (_ BitVec 32)) Bool)

(assert (=> b!563255 (= res!354550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563256 () Bool)

(assert (=> b!563256 (= e!324553 (not true))))

(declare-fun e!324555 () Bool)

(assert (=> b!563256 e!324555))

(declare-fun res!354549 () Bool)

(assert (=> b!563256 (=> (not res!354549) (not e!324555))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!563256 (= res!354549 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17628 0))(
  ( (Unit!17629) )
))
(declare-fun lt!257016 () Unit!17628)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35374 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17628)

(assert (=> b!563256 (= lt!257016 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563257 () Bool)

(declare-fun res!354555 () Bool)

(assert (=> b!563257 (=> (not res!354555) (not e!324553))))

(declare-datatypes ((List!11107 0))(
  ( (Nil!11104) (Cons!11103 (h!12106 (_ BitVec 64)) (t!17326 List!11107)) )
))
(declare-fun arrayNoDuplicates!0 (array!35374 (_ BitVec 32) List!11107) Bool)

(assert (=> b!563257 (= res!354555 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11104))))

(declare-fun b!563258 () Bool)

(declare-fun res!354548 () Bool)

(assert (=> b!563258 (=> (not res!354548) (not e!324552))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!563258 (= res!354548 (and (= (size!17353 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17353 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17353 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563259 () Bool)

(declare-fun res!354552 () Bool)

(assert (=> b!563259 (=> (not res!354552) (not e!324552))))

(assert (=> b!563259 (= res!354552 (validKeyInArray!0 (select (arr!16988 a!3118) j!142)))))

(declare-fun b!563260 () Bool)

(declare-datatypes ((SeekEntryResult!5434 0))(
  ( (MissingZero!5434 (index!23963 (_ BitVec 32))) (Found!5434 (index!23964 (_ BitVec 32))) (Intermediate!5434 (undefined!6246 Bool) (index!23965 (_ BitVec 32)) (x!52860 (_ BitVec 32))) (Undefined!5434) (MissingVacant!5434 (index!23966 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35374 (_ BitVec 32)) SeekEntryResult!5434)

(assert (=> b!563260 (= e!324555 (= (seekEntryOrOpen!0 (select (arr!16988 a!3118) j!142) a!3118 mask!3119) (Found!5434 j!142)))))

(declare-fun b!563261 () Bool)

(assert (=> b!563261 (= e!324552 e!324553)))

(declare-fun res!354553 () Bool)

(assert (=> b!563261 (=> (not res!354553) (not e!324553))))

(declare-fun lt!257017 () SeekEntryResult!5434)

(assert (=> b!563261 (= res!354553 (or (= lt!257017 (MissingZero!5434 i!1132)) (= lt!257017 (MissingVacant!5434 i!1132))))))

(assert (=> b!563261 (= lt!257017 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!563262 () Bool)

(declare-fun res!354556 () Bool)

(assert (=> b!563262 (=> (not res!354556) (not e!324553))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35374 (_ BitVec 32)) SeekEntryResult!5434)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563262 (= res!354556 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16988 a!3118) j!142) mask!3119) (select (arr!16988 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16988 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16988 a!3118) i!1132 k0!1914) j!142) (array!35375 (store (arr!16988 a!3118) i!1132 k0!1914) (size!17353 a!3118)) mask!3119)))))

(declare-fun b!563263 () Bool)

(declare-fun res!354554 () Bool)

(assert (=> b!563263 (=> (not res!354554) (not e!324552))))

(declare-fun arrayContainsKey!0 (array!35374 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563263 (= res!354554 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!51500 res!354551) b!563258))

(assert (= (and b!563258 res!354548) b!563259))

(assert (= (and b!563259 res!354552) b!563254))

(assert (= (and b!563254 res!354557) b!563263))

(assert (= (and b!563263 res!354554) b!563261))

(assert (= (and b!563261 res!354553) b!563255))

(assert (= (and b!563255 res!354550) b!563257))

(assert (= (and b!563257 res!354555) b!563262))

(assert (= (and b!563262 res!354556) b!563256))

(assert (= (and b!563256 res!354549) b!563260))

(declare-fun m!541115 () Bool)

(assert (=> start!51500 m!541115))

(declare-fun m!541117 () Bool)

(assert (=> start!51500 m!541117))

(declare-fun m!541119 () Bool)

(assert (=> b!563262 m!541119))

(declare-fun m!541121 () Bool)

(assert (=> b!563262 m!541121))

(assert (=> b!563262 m!541119))

(declare-fun m!541123 () Bool)

(assert (=> b!563262 m!541123))

(declare-fun m!541125 () Bool)

(assert (=> b!563262 m!541125))

(assert (=> b!563262 m!541123))

(declare-fun m!541127 () Bool)

(assert (=> b!563262 m!541127))

(assert (=> b!563262 m!541121))

(assert (=> b!563262 m!541119))

(declare-fun m!541129 () Bool)

(assert (=> b!563262 m!541129))

(declare-fun m!541131 () Bool)

(assert (=> b!563262 m!541131))

(assert (=> b!563262 m!541123))

(assert (=> b!563262 m!541125))

(declare-fun m!541133 () Bool)

(assert (=> b!563255 m!541133))

(declare-fun m!541135 () Bool)

(assert (=> b!563257 m!541135))

(declare-fun m!541137 () Bool)

(assert (=> b!563263 m!541137))

(declare-fun m!541139 () Bool)

(assert (=> b!563256 m!541139))

(declare-fun m!541141 () Bool)

(assert (=> b!563256 m!541141))

(assert (=> b!563259 m!541119))

(assert (=> b!563259 m!541119))

(declare-fun m!541143 () Bool)

(assert (=> b!563259 m!541143))

(assert (=> b!563260 m!541119))

(assert (=> b!563260 m!541119))

(declare-fun m!541145 () Bool)

(assert (=> b!563260 m!541145))

(declare-fun m!541147 () Bool)

(assert (=> b!563254 m!541147))

(declare-fun m!541149 () Bool)

(assert (=> b!563261 m!541149))

(check-sat (not b!563259) (not b!563260) (not b!563255) (not b!563257) (not b!563254) (not b!563263) (not b!563261) (not b!563262) (not start!51500) (not b!563256))
(check-sat)
