; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51464 () Bool)

(assert start!51464)

(declare-fun b!562655 () Bool)

(declare-fun e!324243 () Bool)

(declare-fun e!324247 () Bool)

(assert (=> b!562655 (= e!324243 e!324247)))

(declare-fun res!353957 () Bool)

(assert (=> b!562655 (=> (not res!353957) (not e!324247))))

(declare-datatypes ((SeekEntryResult!5416 0))(
  ( (MissingZero!5416 (index!23891 (_ BitVec 32))) (Found!5416 (index!23892 (_ BitVec 32))) (Intermediate!5416 (undefined!6228 Bool) (index!23893 (_ BitVec 32)) (x!52794 (_ BitVec 32))) (Undefined!5416) (MissingVacant!5416 (index!23894 (_ BitVec 32))) )
))
(declare-fun lt!256576 () SeekEntryResult!5416)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!562655 (= res!353957 (or (= lt!256576 (MissingZero!5416 i!1132)) (= lt!256576 (MissingVacant!5416 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35338 0))(
  ( (array!35339 (arr!16970 (Array (_ BitVec 32) (_ BitVec 64))) (size!17335 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35338)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35338 (_ BitVec 32)) SeekEntryResult!5416)

(assert (=> b!562655 (= lt!256576 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!562656 () Bool)

(declare-fun e!324246 () Bool)

(declare-fun e!324244 () Bool)

(assert (=> b!562656 (= e!324246 (not e!324244))))

(declare-fun res!353959 () Bool)

(assert (=> b!562656 (=> res!353959 e!324244)))

(declare-fun lt!256581 () SeekEntryResult!5416)

(get-info :version)

(assert (=> b!562656 (= res!353959 (or (undefined!6228 lt!256581) (not ((_ is Intermediate!5416) lt!256581))))))

(declare-fun lt!256580 () SeekEntryResult!5416)

(declare-fun lt!256573 () SeekEntryResult!5416)

(assert (=> b!562656 (= lt!256580 lt!256573)))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!562656 (= lt!256573 (Found!5416 j!142))))

(assert (=> b!562656 (= lt!256580 (seekEntryOrOpen!0 (select (arr!16970 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35338 (_ BitVec 32)) Bool)

(assert (=> b!562656 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17592 0))(
  ( (Unit!17593) )
))
(declare-fun lt!256574 () Unit!17592)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35338 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17592)

(assert (=> b!562656 (= lt!256574 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562657 () Bool)

(assert (=> b!562657 (= e!324247 e!324246)))

(declare-fun res!353954 () Bool)

(assert (=> b!562657 (=> (not res!353954) (not e!324246))))

(declare-fun lt!256583 () (_ BitVec 64))

(declare-fun lt!256575 () (_ BitVec 32))

(declare-fun lt!256578 () array!35338)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35338 (_ BitVec 32)) SeekEntryResult!5416)

(assert (=> b!562657 (= res!353954 (= lt!256581 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256575 lt!256583 lt!256578 mask!3119)))))

(declare-fun lt!256584 () (_ BitVec 32))

(assert (=> b!562657 (= lt!256581 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256584 (select (arr!16970 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562657 (= lt!256575 (toIndex!0 lt!256583 mask!3119))))

(assert (=> b!562657 (= lt!256583 (select (store (arr!16970 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!562657 (= lt!256584 (toIndex!0 (select (arr!16970 a!3118) j!142) mask!3119))))

(assert (=> b!562657 (= lt!256578 (array!35339 (store (arr!16970 a!3118) i!1132 k0!1914) (size!17335 a!3118)))))

(declare-fun b!562658 () Bool)

(declare-fun res!353958 () Bool)

(assert (=> b!562658 (=> (not res!353958) (not e!324247))))

(declare-datatypes ((List!11089 0))(
  ( (Nil!11086) (Cons!11085 (h!12088 (_ BitVec 64)) (t!17308 List!11089)) )
))
(declare-fun arrayNoDuplicates!0 (array!35338 (_ BitVec 32) List!11089) Bool)

(assert (=> b!562658 (= res!353958 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11086))))

(declare-fun b!562659 () Bool)

(declare-fun e!324249 () Bool)

(assert (=> b!562659 (= e!324244 e!324249)))

(declare-fun res!353949 () Bool)

(assert (=> b!562659 (=> res!353949 e!324249)))

(declare-fun lt!256572 () (_ BitVec 64))

(assert (=> b!562659 (= res!353949 (or (= lt!256572 (select (arr!16970 a!3118) j!142)) (= lt!256572 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562659 (= lt!256572 (select (arr!16970 a!3118) (index!23893 lt!256581)))))

(declare-fun b!562660 () Bool)

(declare-fun res!353953 () Bool)

(assert (=> b!562660 (=> (not res!353953) (not e!324247))))

(assert (=> b!562660 (= res!353953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562661 () Bool)

(declare-fun res!353952 () Bool)

(assert (=> b!562661 (=> (not res!353952) (not e!324243))))

(assert (=> b!562661 (= res!353952 (and (= (size!17335 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17335 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17335 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!353951 () Bool)

(assert (=> start!51464 (=> (not res!353951) (not e!324243))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51464 (= res!353951 (validMask!0 mask!3119))))

(assert (=> start!51464 e!324243))

(assert (=> start!51464 true))

(declare-fun array_inv!12853 (array!35338) Bool)

(assert (=> start!51464 (array_inv!12853 a!3118)))

(declare-fun b!562662 () Bool)

(declare-fun res!353960 () Bool)

(assert (=> b!562662 (=> (not res!353960) (not e!324243))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562662 (= res!353960 (validKeyInArray!0 (select (arr!16970 a!3118) j!142)))))

(declare-fun b!562663 () Bool)

(declare-fun e!324248 () Bool)

(assert (=> b!562663 (= e!324249 e!324248)))

(declare-fun res!353955 () Bool)

(assert (=> b!562663 (=> res!353955 e!324248)))

(declare-fun lt!256582 () SeekEntryResult!5416)

(assert (=> b!562663 (= res!353955 (or (bvslt (index!23893 lt!256581) #b00000000000000000000000000000000) (bvsge (index!23893 lt!256581) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52794 lt!256581) #b01111111111111111111111111111110) (bvslt (x!52794 lt!256581) #b00000000000000000000000000000000) (not (= lt!256572 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16970 a!3118) i!1132 k0!1914) (index!23893 lt!256581)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!256582 lt!256573))))))

(declare-fun lt!256585 () SeekEntryResult!5416)

(declare-fun lt!256577 () SeekEntryResult!5416)

(assert (=> b!562663 (= lt!256585 lt!256577)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35338 (_ BitVec 32)) SeekEntryResult!5416)

(assert (=> b!562663 (= lt!256577 (seekKeyOrZeroReturnVacant!0 (x!52794 lt!256581) (index!23893 lt!256581) (index!23893 lt!256581) lt!256583 lt!256578 mask!3119))))

(assert (=> b!562663 (= lt!256585 (seekEntryOrOpen!0 lt!256583 lt!256578 mask!3119))))

(assert (=> b!562663 (= lt!256580 lt!256582)))

(assert (=> b!562663 (= lt!256582 (seekKeyOrZeroReturnVacant!0 (x!52794 lt!256581) (index!23893 lt!256581) (index!23893 lt!256581) (select (arr!16970 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!562664 () Bool)

(declare-fun res!353950 () Bool)

(assert (=> b!562664 (=> (not res!353950) (not e!324243))))

(declare-fun arrayContainsKey!0 (array!35338 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562664 (= res!353950 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562665 () Bool)

(assert (=> b!562665 (= e!324248 (bvsge mask!3119 #b00000000000000000000000000000000))))

(assert (=> b!562665 (= lt!256582 lt!256577)))

(declare-fun lt!256579 () Unit!17592)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35338 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17592)

(assert (=> b!562665 (= lt!256579 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!52794 lt!256581) (index!23893 lt!256581) (index!23893 lt!256581) mask!3119))))

(declare-fun b!562666 () Bool)

(declare-fun res!353956 () Bool)

(assert (=> b!562666 (=> (not res!353956) (not e!324243))))

(assert (=> b!562666 (= res!353956 (validKeyInArray!0 k0!1914))))

(assert (= (and start!51464 res!353951) b!562661))

(assert (= (and b!562661 res!353952) b!562662))

(assert (= (and b!562662 res!353960) b!562666))

(assert (= (and b!562666 res!353956) b!562664))

(assert (= (and b!562664 res!353950) b!562655))

(assert (= (and b!562655 res!353957) b!562660))

(assert (= (and b!562660 res!353953) b!562658))

(assert (= (and b!562658 res!353958) b!562657))

(assert (= (and b!562657 res!353954) b!562656))

(assert (= (and b!562656 (not res!353959)) b!562659))

(assert (= (and b!562659 (not res!353949)) b!562663))

(assert (= (and b!562663 (not res!353955)) b!562665))

(declare-fun m!540353 () Bool)

(assert (=> start!51464 m!540353))

(declare-fun m!540355 () Bool)

(assert (=> start!51464 m!540355))

(declare-fun m!540357 () Bool)

(assert (=> b!562655 m!540357))

(declare-fun m!540359 () Bool)

(assert (=> b!562658 m!540359))

(declare-fun m!540361 () Bool)

(assert (=> b!562665 m!540361))

(declare-fun m!540363 () Bool)

(assert (=> b!562666 m!540363))

(declare-fun m!540365 () Bool)

(assert (=> b!562656 m!540365))

(assert (=> b!562656 m!540365))

(declare-fun m!540367 () Bool)

(assert (=> b!562656 m!540367))

(declare-fun m!540369 () Bool)

(assert (=> b!562656 m!540369))

(declare-fun m!540371 () Bool)

(assert (=> b!562656 m!540371))

(assert (=> b!562662 m!540365))

(assert (=> b!562662 m!540365))

(declare-fun m!540373 () Bool)

(assert (=> b!562662 m!540373))

(assert (=> b!562663 m!540365))

(assert (=> b!562663 m!540365))

(declare-fun m!540375 () Bool)

(assert (=> b!562663 m!540375))

(declare-fun m!540377 () Bool)

(assert (=> b!562663 m!540377))

(declare-fun m!540379 () Bool)

(assert (=> b!562663 m!540379))

(declare-fun m!540381 () Bool)

(assert (=> b!562663 m!540381))

(declare-fun m!540383 () Bool)

(assert (=> b!562663 m!540383))

(declare-fun m!540385 () Bool)

(assert (=> b!562664 m!540385))

(assert (=> b!562659 m!540365))

(declare-fun m!540387 () Bool)

(assert (=> b!562659 m!540387))

(assert (=> b!562657 m!540365))

(declare-fun m!540389 () Bool)

(assert (=> b!562657 m!540389))

(assert (=> b!562657 m!540365))

(declare-fun m!540391 () Bool)

(assert (=> b!562657 m!540391))

(declare-fun m!540393 () Bool)

(assert (=> b!562657 m!540393))

(assert (=> b!562657 m!540365))

(declare-fun m!540395 () Bool)

(assert (=> b!562657 m!540395))

(declare-fun m!540397 () Bool)

(assert (=> b!562657 m!540397))

(assert (=> b!562657 m!540383))

(declare-fun m!540399 () Bool)

(assert (=> b!562660 m!540399))

(check-sat (not b!562663) (not b!562658) (not b!562656) (not start!51464) (not b!562655) (not b!562657) (not b!562662) (not b!562665) (not b!562666) (not b!562664) (not b!562660))
(check-sat)
