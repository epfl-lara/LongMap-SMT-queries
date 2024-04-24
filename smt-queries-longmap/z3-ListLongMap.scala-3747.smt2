; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51522 () Bool)

(assert start!51522)

(declare-fun b!563126 () Bool)

(declare-fun res!354175 () Bool)

(declare-fun e!324551 () Bool)

(assert (=> b!563126 (=> (not res!354175) (not e!324551))))

(declare-datatypes ((array!35334 0))(
  ( (array!35335 (arr!16966 (Array (_ BitVec 32) (_ BitVec 64))) (size!17330 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35334)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35334 (_ BitVec 32)) Bool)

(assert (=> b!563126 (= res!354175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563127 () Bool)

(declare-fun res!354177 () Bool)

(declare-fun e!324546 () Bool)

(assert (=> b!563127 (=> (not res!354177) (not e!324546))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563127 (= res!354177 (validKeyInArray!0 (select (arr!16966 a!3118) j!142)))))

(declare-fun b!563128 () Bool)

(declare-fun e!324549 () Bool)

(assert (=> b!563128 (= e!324549 (bvsge mask!3119 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!5371 0))(
  ( (MissingZero!5371 (index!23711 (_ BitVec 32))) (Found!5371 (index!23712 (_ BitVec 32))) (Intermediate!5371 (undefined!6183 Bool) (index!23713 (_ BitVec 32)) (x!52757 (_ BitVec 32))) (Undefined!5371) (MissingVacant!5371 (index!23714 (_ BitVec 32))) )
))
(declare-fun lt!256926 () SeekEntryResult!5371)

(declare-fun lt!256930 () SeekEntryResult!5371)

(assert (=> b!563128 (= lt!256926 lt!256930)))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((Unit!17587 0))(
  ( (Unit!17588) )
))
(declare-fun lt!256928 () Unit!17587)

(declare-fun lt!256917 () SeekEntryResult!5371)

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35334 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17587)

(assert (=> b!563128 (= lt!256928 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!52757 lt!256917) (index!23713 lt!256917) (index!23713 lt!256917) mask!3119))))

(declare-fun b!563129 () Bool)

(declare-fun res!354180 () Bool)

(assert (=> b!563129 (=> (not res!354180) (not e!324546))))

(assert (=> b!563129 (= res!354180 (and (= (size!17330 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17330 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17330 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563130 () Bool)

(declare-fun e!324552 () Bool)

(declare-fun e!324550 () Bool)

(assert (=> b!563130 (= e!324552 e!324550)))

(declare-fun res!354183 () Bool)

(assert (=> b!563130 (=> res!354183 e!324550)))

(declare-fun lt!256929 () (_ BitVec 64))

(assert (=> b!563130 (= res!354183 (or (= lt!256929 (select (arr!16966 a!3118) j!142)) (= lt!256929 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!563130 (= lt!256929 (select (arr!16966 a!3118) (index!23713 lt!256917)))))

(declare-fun b!563131 () Bool)

(assert (=> b!563131 (= e!324550 e!324549)))

(declare-fun res!354181 () Bool)

(assert (=> b!563131 (=> res!354181 e!324549)))

(declare-fun lt!256925 () SeekEntryResult!5371)

(assert (=> b!563131 (= res!354181 (or (bvslt (index!23713 lt!256917) #b00000000000000000000000000000000) (bvsge (index!23713 lt!256917) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52757 lt!256917) #b01111111111111111111111111111110) (bvslt (x!52757 lt!256917) #b00000000000000000000000000000000) (not (= lt!256929 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16966 a!3118) i!1132 k0!1914) (index!23713 lt!256917)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!256926 lt!256925))))))

(declare-fun lt!256919 () SeekEntryResult!5371)

(assert (=> b!563131 (= lt!256919 lt!256930)))

(declare-fun lt!256920 () (_ BitVec 64))

(declare-fun lt!256918 () array!35334)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35334 (_ BitVec 32)) SeekEntryResult!5371)

(assert (=> b!563131 (= lt!256930 (seekKeyOrZeroReturnVacant!0 (x!52757 lt!256917) (index!23713 lt!256917) (index!23713 lt!256917) lt!256920 lt!256918 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35334 (_ BitVec 32)) SeekEntryResult!5371)

(assert (=> b!563131 (= lt!256919 (seekEntryOrOpen!0 lt!256920 lt!256918 mask!3119))))

(declare-fun lt!256921 () SeekEntryResult!5371)

(assert (=> b!563131 (= lt!256921 lt!256926)))

(assert (=> b!563131 (= lt!256926 (seekKeyOrZeroReturnVacant!0 (x!52757 lt!256917) (index!23713 lt!256917) (index!23713 lt!256917) (select (arr!16966 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!563132 () Bool)

(declare-fun res!354174 () Bool)

(assert (=> b!563132 (=> (not res!354174) (not e!324546))))

(declare-fun arrayContainsKey!0 (array!35334 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563132 (= res!354174 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!354184 () Bool)

(assert (=> start!51522 (=> (not res!354184) (not e!324546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51522 (= res!354184 (validMask!0 mask!3119))))

(assert (=> start!51522 e!324546))

(assert (=> start!51522 true))

(declare-fun array_inv!12825 (array!35334) Bool)

(assert (=> start!51522 (array_inv!12825 a!3118)))

(declare-fun b!563133 () Bool)

(assert (=> b!563133 (= e!324546 e!324551)))

(declare-fun res!354182 () Bool)

(assert (=> b!563133 (=> (not res!354182) (not e!324551))))

(declare-fun lt!256924 () SeekEntryResult!5371)

(assert (=> b!563133 (= res!354182 (or (= lt!256924 (MissingZero!5371 i!1132)) (= lt!256924 (MissingVacant!5371 i!1132))))))

(assert (=> b!563133 (= lt!256924 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!563134 () Bool)

(declare-fun e!324548 () Bool)

(assert (=> b!563134 (= e!324548 (not e!324552))))

(declare-fun res!354179 () Bool)

(assert (=> b!563134 (=> res!354179 e!324552)))

(get-info :version)

(assert (=> b!563134 (= res!354179 (or (undefined!6183 lt!256917) (not ((_ is Intermediate!5371) lt!256917))))))

(assert (=> b!563134 (= lt!256921 lt!256925)))

(assert (=> b!563134 (= lt!256925 (Found!5371 j!142))))

(assert (=> b!563134 (= lt!256921 (seekEntryOrOpen!0 (select (arr!16966 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!563134 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!256927 () Unit!17587)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35334 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17587)

(assert (=> b!563134 (= lt!256927 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563135 () Bool)

(declare-fun res!354178 () Bool)

(assert (=> b!563135 (=> (not res!354178) (not e!324546))))

(assert (=> b!563135 (= res!354178 (validKeyInArray!0 k0!1914))))

(declare-fun b!563136 () Bool)

(declare-fun res!354173 () Bool)

(assert (=> b!563136 (=> (not res!354173) (not e!324551))))

(declare-datatypes ((List!10953 0))(
  ( (Nil!10950) (Cons!10949 (h!11955 (_ BitVec 64)) (t!17173 List!10953)) )
))
(declare-fun arrayNoDuplicates!0 (array!35334 (_ BitVec 32) List!10953) Bool)

(assert (=> b!563136 (= res!354173 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10950))))

(declare-fun b!563137 () Bool)

(assert (=> b!563137 (= e!324551 e!324548)))

(declare-fun res!354176 () Bool)

(assert (=> b!563137 (=> (not res!354176) (not e!324548))))

(declare-fun lt!256922 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35334 (_ BitVec 32)) SeekEntryResult!5371)

(assert (=> b!563137 (= res!354176 (= lt!256917 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256922 lt!256920 lt!256918 mask!3119)))))

(declare-fun lt!256923 () (_ BitVec 32))

(assert (=> b!563137 (= lt!256917 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256923 (select (arr!16966 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563137 (= lt!256922 (toIndex!0 lt!256920 mask!3119))))

(assert (=> b!563137 (= lt!256920 (select (store (arr!16966 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!563137 (= lt!256923 (toIndex!0 (select (arr!16966 a!3118) j!142) mask!3119))))

(assert (=> b!563137 (= lt!256918 (array!35335 (store (arr!16966 a!3118) i!1132 k0!1914) (size!17330 a!3118)))))

(assert (= (and start!51522 res!354184) b!563129))

(assert (= (and b!563129 res!354180) b!563127))

(assert (= (and b!563127 res!354177) b!563135))

(assert (= (and b!563135 res!354178) b!563132))

(assert (= (and b!563132 res!354174) b!563133))

(assert (= (and b!563133 res!354182) b!563126))

(assert (= (and b!563126 res!354175) b!563136))

(assert (= (and b!563136 res!354173) b!563137))

(assert (= (and b!563137 res!354176) b!563134))

(assert (= (and b!563134 (not res!354179)) b!563130))

(assert (= (and b!563130 (not res!354183)) b!563131))

(assert (= (and b!563131 (not res!354181)) b!563128))

(declare-fun m!541463 () Bool)

(assert (=> b!563135 m!541463))

(declare-fun m!541465 () Bool)

(assert (=> b!563131 m!541465))

(declare-fun m!541467 () Bool)

(assert (=> b!563131 m!541467))

(declare-fun m!541469 () Bool)

(assert (=> b!563131 m!541469))

(assert (=> b!563131 m!541469))

(declare-fun m!541471 () Bool)

(assert (=> b!563131 m!541471))

(declare-fun m!541473 () Bool)

(assert (=> b!563131 m!541473))

(declare-fun m!541475 () Bool)

(assert (=> b!563131 m!541475))

(assert (=> b!563127 m!541469))

(assert (=> b!563127 m!541469))

(declare-fun m!541477 () Bool)

(assert (=> b!563127 m!541477))

(assert (=> b!563137 m!541469))

(declare-fun m!541479 () Bool)

(assert (=> b!563137 m!541479))

(declare-fun m!541481 () Bool)

(assert (=> b!563137 m!541481))

(assert (=> b!563137 m!541469))

(declare-fun m!541483 () Bool)

(assert (=> b!563137 m!541483))

(assert (=> b!563137 m!541469))

(declare-fun m!541485 () Bool)

(assert (=> b!563137 m!541485))

(assert (=> b!563137 m!541465))

(declare-fun m!541487 () Bool)

(assert (=> b!563137 m!541487))

(declare-fun m!541489 () Bool)

(assert (=> b!563133 m!541489))

(declare-fun m!541491 () Bool)

(assert (=> start!51522 m!541491))

(declare-fun m!541493 () Bool)

(assert (=> start!51522 m!541493))

(declare-fun m!541495 () Bool)

(assert (=> b!563132 m!541495))

(assert (=> b!563130 m!541469))

(declare-fun m!541497 () Bool)

(assert (=> b!563130 m!541497))

(assert (=> b!563134 m!541469))

(assert (=> b!563134 m!541469))

(declare-fun m!541499 () Bool)

(assert (=> b!563134 m!541499))

(declare-fun m!541501 () Bool)

(assert (=> b!563134 m!541501))

(declare-fun m!541503 () Bool)

(assert (=> b!563134 m!541503))

(declare-fun m!541505 () Bool)

(assert (=> b!563128 m!541505))

(declare-fun m!541507 () Bool)

(assert (=> b!563126 m!541507))

(declare-fun m!541509 () Bool)

(assert (=> b!563136 m!541509))

(check-sat (not b!563136) (not b!563133) (not b!563135) (not b!563137) (not b!563132) (not b!563127) (not b!563128) (not b!563126) (not start!51522) (not b!563131) (not b!563134))
(check-sat)
