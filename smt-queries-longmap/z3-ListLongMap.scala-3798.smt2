; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52144 () Bool)

(assert start!52144)

(declare-fun res!359125 () Bool)

(declare-fun e!327432 () Bool)

(assert (=> start!52144 (=> (not res!359125) (not e!327432))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52144 (= res!359125 (validMask!0 mask!3119))))

(assert (=> start!52144 e!327432))

(assert (=> start!52144 true))

(declare-datatypes ((array!35667 0))(
  ( (array!35668 (arr!17125 (Array (_ BitVec 32) (_ BitVec 64))) (size!17489 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35667)

(declare-fun array_inv!12921 (array!35667) Bool)

(assert (=> start!52144 (array_inv!12921 a!3118)))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5574 0))(
  ( (MissingZero!5574 (index!24523 (_ BitVec 32))) (Found!5574 (index!24524 (_ BitVec 32))) (Intermediate!5574 (undefined!6386 Bool) (index!24525 (_ BitVec 32)) (x!53401 (_ BitVec 32))) (Undefined!5574) (MissingVacant!5574 (index!24526 (_ BitVec 32))) )
))
(declare-fun lt!259323 () SeekEntryResult!5574)

(declare-fun b!569103 () Bool)

(declare-fun e!327430 () Bool)

(get-info :version)

(assert (=> b!569103 (= e!327430 (not (or (undefined!6386 lt!259323) (not ((_ is Intermediate!5574) lt!259323)) (= (select (arr!17125 a!3118) (index!24525 lt!259323)) (select (arr!17125 a!3118) j!142)) (not (= (select (arr!17125 a!3118) (index!24525 lt!259323)) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!17489 a!3118)))))))

(declare-fun lt!259324 () SeekEntryResult!5574)

(assert (=> b!569103 (and (= lt!259324 (Found!5574 j!142)) (or (undefined!6386 lt!259323) (not ((_ is Intermediate!5574) lt!259323)) (= (select (arr!17125 a!3118) (index!24525 lt!259323)) (select (arr!17125 a!3118) j!142)) (not (= (select (arr!17125 a!3118) (index!24525 lt!259323)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259324 (MissingZero!5574 (index!24525 lt!259323)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35667 (_ BitVec 32)) SeekEntryResult!5574)

(assert (=> b!569103 (= lt!259324 (seekEntryOrOpen!0 (select (arr!17125 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35667 (_ BitVec 32)) Bool)

(assert (=> b!569103 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17850 0))(
  ( (Unit!17851) )
))
(declare-fun lt!259320 () Unit!17850)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35667 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17850)

(assert (=> b!569103 (= lt!259320 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569104 () Bool)

(declare-fun res!359127 () Bool)

(declare-fun e!327429 () Bool)

(assert (=> b!569104 (=> (not res!359127) (not e!327429))))

(assert (=> b!569104 (= res!359127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569105 () Bool)

(assert (=> b!569105 (= e!327429 e!327430)))

(declare-fun res!359122 () Bool)

(assert (=> b!569105 (=> (not res!359122) (not e!327430))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!259322 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35667 (_ BitVec 32)) SeekEntryResult!5574)

(assert (=> b!569105 (= res!359122 (= lt!259323 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259322 (select (store (arr!17125 a!3118) i!1132 k0!1914) j!142) (array!35668 (store (arr!17125 a!3118) i!1132 k0!1914) (size!17489 a!3118)) mask!3119)))))

(declare-fun lt!259321 () (_ BitVec 32))

(assert (=> b!569105 (= lt!259323 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259321 (select (arr!17125 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569105 (= lt!259322 (toIndex!0 (select (store (arr!17125 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!569105 (= lt!259321 (toIndex!0 (select (arr!17125 a!3118) j!142) mask!3119))))

(declare-fun b!569106 () Bool)

(declare-fun res!359123 () Bool)

(assert (=> b!569106 (=> (not res!359123) (not e!327429))))

(declare-datatypes ((List!11205 0))(
  ( (Nil!11202) (Cons!11201 (h!12222 (_ BitVec 64)) (t!17433 List!11205)) )
))
(declare-fun arrayNoDuplicates!0 (array!35667 (_ BitVec 32) List!11205) Bool)

(assert (=> b!569106 (= res!359123 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11202))))

(declare-fun b!569107 () Bool)

(declare-fun res!359129 () Bool)

(assert (=> b!569107 (=> (not res!359129) (not e!327432))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569107 (= res!359129 (validKeyInArray!0 (select (arr!17125 a!3118) j!142)))))

(declare-fun b!569108 () Bool)

(declare-fun res!359124 () Bool)

(assert (=> b!569108 (=> (not res!359124) (not e!327432))))

(assert (=> b!569108 (= res!359124 (and (= (size!17489 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17489 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17489 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569109 () Bool)

(assert (=> b!569109 (= e!327432 e!327429)))

(declare-fun res!359121 () Bool)

(assert (=> b!569109 (=> (not res!359121) (not e!327429))))

(declare-fun lt!259319 () SeekEntryResult!5574)

(assert (=> b!569109 (= res!359121 (or (= lt!259319 (MissingZero!5574 i!1132)) (= lt!259319 (MissingVacant!5574 i!1132))))))

(assert (=> b!569109 (= lt!259319 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!569110 () Bool)

(declare-fun res!359126 () Bool)

(assert (=> b!569110 (=> (not res!359126) (not e!327432))))

(declare-fun arrayContainsKey!0 (array!35667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569110 (= res!359126 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569111 () Bool)

(declare-fun res!359128 () Bool)

(assert (=> b!569111 (=> (not res!359128) (not e!327432))))

(assert (=> b!569111 (= res!359128 (validKeyInArray!0 k0!1914))))

(assert (= (and start!52144 res!359125) b!569108))

(assert (= (and b!569108 res!359124) b!569107))

(assert (= (and b!569107 res!359129) b!569111))

(assert (= (and b!569111 res!359128) b!569110))

(assert (= (and b!569110 res!359126) b!569109))

(assert (= (and b!569109 res!359121) b!569104))

(assert (= (and b!569104 res!359127) b!569106))

(assert (= (and b!569106 res!359123) b!569105))

(assert (= (and b!569105 res!359122) b!569103))

(declare-fun m!547697 () Bool)

(assert (=> b!569109 m!547697))

(declare-fun m!547699 () Bool)

(assert (=> b!569104 m!547699))

(declare-fun m!547701 () Bool)

(assert (=> start!52144 m!547701))

(declare-fun m!547703 () Bool)

(assert (=> start!52144 m!547703))

(declare-fun m!547705 () Bool)

(assert (=> b!569106 m!547705))

(declare-fun m!547707 () Bool)

(assert (=> b!569103 m!547707))

(declare-fun m!547709 () Bool)

(assert (=> b!569103 m!547709))

(declare-fun m!547711 () Bool)

(assert (=> b!569103 m!547711))

(declare-fun m!547713 () Bool)

(assert (=> b!569103 m!547713))

(assert (=> b!569103 m!547707))

(declare-fun m!547715 () Bool)

(assert (=> b!569103 m!547715))

(declare-fun m!547717 () Bool)

(assert (=> b!569110 m!547717))

(assert (=> b!569107 m!547707))

(assert (=> b!569107 m!547707))

(declare-fun m!547719 () Bool)

(assert (=> b!569107 m!547719))

(assert (=> b!569105 m!547707))

(declare-fun m!547721 () Bool)

(assert (=> b!569105 m!547721))

(assert (=> b!569105 m!547707))

(declare-fun m!547723 () Bool)

(assert (=> b!569105 m!547723))

(assert (=> b!569105 m!547707))

(declare-fun m!547725 () Bool)

(assert (=> b!569105 m!547725))

(assert (=> b!569105 m!547725))

(declare-fun m!547727 () Bool)

(assert (=> b!569105 m!547727))

(declare-fun m!547729 () Bool)

(assert (=> b!569105 m!547729))

(assert (=> b!569105 m!547725))

(declare-fun m!547731 () Bool)

(assert (=> b!569105 m!547731))

(declare-fun m!547733 () Bool)

(assert (=> b!569111 m!547733))

(check-sat (not b!569110) (not b!569109) (not b!569105) (not b!569106) (not b!569103) (not b!569107) (not start!52144) (not b!569104) (not b!569111))
(check-sat)
