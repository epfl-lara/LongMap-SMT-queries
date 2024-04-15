; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50312 () Bool)

(assert start!50312)

(declare-fun b!550321 () Bool)

(declare-fun e!317670 () Bool)

(declare-fun e!317668 () Bool)

(assert (=> b!550321 (= e!317670 e!317668)))

(declare-fun res!343429 () Bool)

(assert (=> b!550321 (=> (not res!343429) (not e!317668))))

(declare-datatypes ((SeekEntryResult!5119 0))(
  ( (MissingZero!5119 (index!22703 (_ BitVec 32))) (Found!5119 (index!22704 (_ BitVec 32))) (Intermediate!5119 (undefined!5931 Bool) (index!22705 (_ BitVec 32)) (x!51642 (_ BitVec 32))) (Undefined!5119) (MissingVacant!5119 (index!22706 (_ BitVec 32))) )
))
(declare-fun lt!250347 () SeekEntryResult!5119)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!550321 (= res!343429 (or (= lt!250347 (MissingZero!5119 i!1132)) (= lt!250347 (MissingVacant!5119 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!34717 0))(
  ( (array!34718 (arr!16673 (Array (_ BitVec 32) (_ BitVec 64))) (size!17038 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34717)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34717 (_ BitVec 32)) SeekEntryResult!5119)

(assert (=> b!550321 (= lt!250347 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!550322 () Bool)

(declare-fun res!343431 () Bool)

(assert (=> b!550322 (=> (not res!343431) (not e!317668))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34717 (_ BitVec 32)) SeekEntryResult!5119)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550322 (= res!343431 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16673 a!3118) j!142) mask!3119) (select (arr!16673 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16673 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16673 a!3118) i!1132 k0!1914) j!142) (array!34718 (store (arr!16673 a!3118) i!1132 k0!1914) (size!17038 a!3118)) mask!3119)))))

(declare-fun b!550323 () Bool)

(declare-fun res!343433 () Bool)

(assert (=> b!550323 (=> (not res!343433) (not e!317668))))

(declare-datatypes ((List!10792 0))(
  ( (Nil!10789) (Cons!10788 (h!11764 (_ BitVec 64)) (t!17011 List!10792)) )
))
(declare-fun arrayNoDuplicates!0 (array!34717 (_ BitVec 32) List!10792) Bool)

(assert (=> b!550323 (= res!343433 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10789))))

(declare-fun b!550324 () Bool)

(declare-fun res!343428 () Bool)

(assert (=> b!550324 (=> (not res!343428) (not e!317668))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34717 (_ BitVec 32)) Bool)

(assert (=> b!550324 (= res!343428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!550325 () Bool)

(declare-fun e!317669 () Bool)

(assert (=> b!550325 (= e!317669 (= (seekEntryOrOpen!0 (select (arr!16673 a!3118) j!142) a!3118 mask!3119) (Found!5119 j!142)))))

(declare-fun b!550326 () Bool)

(assert (=> b!550326 (= e!317668 (not true))))

(assert (=> b!550326 e!317669))

(declare-fun res!343432 () Bool)

(assert (=> b!550326 (=> (not res!343432) (not e!317669))))

(assert (=> b!550326 (= res!343432 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!16998 0))(
  ( (Unit!16999) )
))
(declare-fun lt!250348 () Unit!16998)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34717 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16998)

(assert (=> b!550326 (= lt!250348 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!550327 () Bool)

(declare-fun res!343424 () Bool)

(assert (=> b!550327 (=> (not res!343424) (not e!317670))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!550327 (= res!343424 (validKeyInArray!0 (select (arr!16673 a!3118) j!142)))))

(declare-fun b!550329 () Bool)

(declare-fun res!343427 () Bool)

(assert (=> b!550329 (=> (not res!343427) (not e!317670))))

(assert (=> b!550329 (= res!343427 (validKeyInArray!0 k0!1914))))

(declare-fun b!550330 () Bool)

(declare-fun res!343425 () Bool)

(assert (=> b!550330 (=> (not res!343425) (not e!317670))))

(declare-fun arrayContainsKey!0 (array!34717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!550330 (= res!343425 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!550328 () Bool)

(declare-fun res!343430 () Bool)

(assert (=> b!550328 (=> (not res!343430) (not e!317670))))

(assert (=> b!550328 (= res!343430 (and (= (size!17038 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17038 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17038 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!343426 () Bool)

(assert (=> start!50312 (=> (not res!343426) (not e!317670))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50312 (= res!343426 (validMask!0 mask!3119))))

(assert (=> start!50312 e!317670))

(assert (=> start!50312 true))

(declare-fun array_inv!12556 (array!34717) Bool)

(assert (=> start!50312 (array_inv!12556 a!3118)))

(assert (= (and start!50312 res!343426) b!550328))

(assert (= (and b!550328 res!343430) b!550327))

(assert (= (and b!550327 res!343424) b!550329))

(assert (= (and b!550329 res!343427) b!550330))

(assert (= (and b!550330 res!343425) b!550321))

(assert (= (and b!550321 res!343429) b!550324))

(assert (= (and b!550324 res!343428) b!550323))

(assert (= (and b!550323 res!343433) b!550322))

(assert (= (and b!550322 res!343431) b!550326))

(assert (= (and b!550326 res!343432) b!550325))

(declare-fun m!526781 () Bool)

(assert (=> b!550325 m!526781))

(assert (=> b!550325 m!526781))

(declare-fun m!526783 () Bool)

(assert (=> b!550325 m!526783))

(declare-fun m!526785 () Bool)

(assert (=> start!50312 m!526785))

(declare-fun m!526787 () Bool)

(assert (=> start!50312 m!526787))

(declare-fun m!526789 () Bool)

(assert (=> b!550323 m!526789))

(declare-fun m!526791 () Bool)

(assert (=> b!550329 m!526791))

(declare-fun m!526793 () Bool)

(assert (=> b!550326 m!526793))

(declare-fun m!526795 () Bool)

(assert (=> b!550326 m!526795))

(declare-fun m!526797 () Bool)

(assert (=> b!550324 m!526797))

(assert (=> b!550327 m!526781))

(assert (=> b!550327 m!526781))

(declare-fun m!526799 () Bool)

(assert (=> b!550327 m!526799))

(assert (=> b!550322 m!526781))

(declare-fun m!526801 () Bool)

(assert (=> b!550322 m!526801))

(assert (=> b!550322 m!526781))

(declare-fun m!526803 () Bool)

(assert (=> b!550322 m!526803))

(declare-fun m!526805 () Bool)

(assert (=> b!550322 m!526805))

(assert (=> b!550322 m!526803))

(declare-fun m!526807 () Bool)

(assert (=> b!550322 m!526807))

(assert (=> b!550322 m!526801))

(assert (=> b!550322 m!526781))

(declare-fun m!526809 () Bool)

(assert (=> b!550322 m!526809))

(declare-fun m!526811 () Bool)

(assert (=> b!550322 m!526811))

(assert (=> b!550322 m!526803))

(assert (=> b!550322 m!526805))

(declare-fun m!526813 () Bool)

(assert (=> b!550330 m!526813))

(declare-fun m!526815 () Bool)

(assert (=> b!550321 m!526815))

(check-sat (not start!50312) (not b!550322) (not b!550330) (not b!550321) (not b!550323) (not b!550326) (not b!550327) (not b!550325) (not b!550329) (not b!550324))
(check-sat)
