; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50416 () Bool)

(assert start!50416)

(declare-fun b!551363 () Bool)

(declare-fun e!318231 () Bool)

(declare-fun e!318230 () Bool)

(assert (=> b!551363 (= e!318231 e!318230)))

(declare-fun res!344143 () Bool)

(assert (=> b!551363 (=> (not res!344143) (not e!318230))))

(declare-datatypes ((SeekEntryResult!5139 0))(
  ( (MissingZero!5139 (index!22783 (_ BitVec 32))) (Found!5139 (index!22784 (_ BitVec 32))) (Intermediate!5139 (undefined!5951 Bool) (index!22785 (_ BitVec 32)) (x!51713 (_ BitVec 32))) (Undefined!5139) (MissingVacant!5139 (index!22786 (_ BitVec 32))) )
))
(declare-fun lt!250816 () SeekEntryResult!5139)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!551363 (= res!344143 (or (= lt!250816 (MissingZero!5139 i!1132)) (= lt!250816 (MissingVacant!5139 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!34755 0))(
  ( (array!34756 (arr!16690 (Array (_ BitVec 32) (_ BitVec 64))) (size!17054 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34755)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34755 (_ BitVec 32)) SeekEntryResult!5139)

(assert (=> b!551363 (= lt!250816 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!551364 () Bool)

(declare-fun res!344150 () Bool)

(assert (=> b!551364 (=> (not res!344150) (not e!318231))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!551364 (= res!344150 (validKeyInArray!0 (select (arr!16690 a!3118) j!142)))))

(declare-fun b!551365 () Bool)

(assert (=> b!551365 (= e!318230 (not true))))

(declare-fun e!318229 () Bool)

(assert (=> b!551365 e!318229))

(declare-fun res!344148 () Bool)

(assert (=> b!551365 (=> (not res!344148) (not e!318229))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34755 (_ BitVec 32)) Bool)

(assert (=> b!551365 (= res!344148 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17052 0))(
  ( (Unit!17053) )
))
(declare-fun lt!250815 () Unit!17052)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34755 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17052)

(assert (=> b!551365 (= lt!250815 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!551366 () Bool)

(declare-fun res!344142 () Bool)

(assert (=> b!551366 (=> (not res!344142) (not e!318230))))

(declare-datatypes ((List!10770 0))(
  ( (Nil!10767) (Cons!10766 (h!11745 (_ BitVec 64)) (t!16998 List!10770)) )
))
(declare-fun arrayNoDuplicates!0 (array!34755 (_ BitVec 32) List!10770) Bool)

(assert (=> b!551366 (= res!344142 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10767))))

(declare-fun res!344147 () Bool)

(assert (=> start!50416 (=> (not res!344147) (not e!318231))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50416 (= res!344147 (validMask!0 mask!3119))))

(assert (=> start!50416 e!318231))

(assert (=> start!50416 true))

(declare-fun array_inv!12486 (array!34755) Bool)

(assert (=> start!50416 (array_inv!12486 a!3118)))

(declare-fun b!551367 () Bool)

(declare-fun res!344146 () Bool)

(assert (=> b!551367 (=> (not res!344146) (not e!318230))))

(assert (=> b!551367 (= res!344146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!551368 () Bool)

(declare-fun res!344141 () Bool)

(assert (=> b!551368 (=> (not res!344141) (not e!318231))))

(assert (=> b!551368 (= res!344141 (validKeyInArray!0 k0!1914))))

(declare-fun b!551369 () Bool)

(declare-fun res!344149 () Bool)

(assert (=> b!551369 (=> (not res!344149) (not e!318230))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34755 (_ BitVec 32)) SeekEntryResult!5139)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551369 (= res!344149 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16690 a!3118) j!142) mask!3119) (select (arr!16690 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16690 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16690 a!3118) i!1132 k0!1914) j!142) (array!34756 (store (arr!16690 a!3118) i!1132 k0!1914) (size!17054 a!3118)) mask!3119)))))

(declare-fun b!551370 () Bool)

(assert (=> b!551370 (= e!318229 (= (seekEntryOrOpen!0 (select (arr!16690 a!3118) j!142) a!3118 mask!3119) (Found!5139 j!142)))))

(declare-fun b!551371 () Bool)

(declare-fun res!344145 () Bool)

(assert (=> b!551371 (=> (not res!344145) (not e!318231))))

(declare-fun arrayContainsKey!0 (array!34755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!551371 (= res!344145 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!551372 () Bool)

(declare-fun res!344144 () Bool)

(assert (=> b!551372 (=> (not res!344144) (not e!318231))))

(assert (=> b!551372 (= res!344144 (and (= (size!17054 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17054 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17054 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50416 res!344147) b!551372))

(assert (= (and b!551372 res!344144) b!551364))

(assert (= (and b!551364 res!344150) b!551368))

(assert (= (and b!551368 res!344141) b!551371))

(assert (= (and b!551371 res!344145) b!551363))

(assert (= (and b!551363 res!344143) b!551367))

(assert (= (and b!551367 res!344146) b!551366))

(assert (= (and b!551366 res!344142) b!551369))

(assert (= (and b!551369 res!344149) b!551365))

(assert (= (and b!551365 res!344148) b!551370))

(declare-fun m!528333 () Bool)

(assert (=> b!551369 m!528333))

(declare-fun m!528335 () Bool)

(assert (=> b!551369 m!528335))

(assert (=> b!551369 m!528333))

(declare-fun m!528337 () Bool)

(assert (=> b!551369 m!528337))

(declare-fun m!528339 () Bool)

(assert (=> b!551369 m!528339))

(assert (=> b!551369 m!528337))

(declare-fun m!528341 () Bool)

(assert (=> b!551369 m!528341))

(assert (=> b!551369 m!528335))

(assert (=> b!551369 m!528333))

(declare-fun m!528343 () Bool)

(assert (=> b!551369 m!528343))

(declare-fun m!528345 () Bool)

(assert (=> b!551369 m!528345))

(assert (=> b!551369 m!528337))

(assert (=> b!551369 m!528339))

(assert (=> b!551364 m!528333))

(assert (=> b!551364 m!528333))

(declare-fun m!528347 () Bool)

(assert (=> b!551364 m!528347))

(declare-fun m!528349 () Bool)

(assert (=> b!551367 m!528349))

(declare-fun m!528351 () Bool)

(assert (=> b!551363 m!528351))

(declare-fun m!528353 () Bool)

(assert (=> start!50416 m!528353))

(declare-fun m!528355 () Bool)

(assert (=> start!50416 m!528355))

(declare-fun m!528357 () Bool)

(assert (=> b!551368 m!528357))

(assert (=> b!551370 m!528333))

(assert (=> b!551370 m!528333))

(declare-fun m!528359 () Bool)

(assert (=> b!551370 m!528359))

(declare-fun m!528361 () Bool)

(assert (=> b!551366 m!528361))

(declare-fun m!528363 () Bool)

(assert (=> b!551371 m!528363))

(declare-fun m!528365 () Bool)

(assert (=> b!551365 m!528365))

(declare-fun m!528367 () Bool)

(assert (=> b!551365 m!528367))

(check-sat (not b!551371) (not b!551369) (not b!551367) (not b!551363) (not start!50416) (not b!551370) (not b!551364) (not b!551368) (not b!551366) (not b!551365))
(check-sat)
