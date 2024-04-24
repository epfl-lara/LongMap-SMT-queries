; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52332 () Bool)

(assert start!52332)

(declare-fun b!570723 () Bool)

(declare-fun res!360402 () Bool)

(declare-fun e!328258 () Bool)

(assert (=> b!570723 (=> (not res!360402) (not e!328258))))

(declare-datatypes ((array!35739 0))(
  ( (array!35740 (arr!17158 (Array (_ BitVec 32) (_ BitVec 64))) (size!17522 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35739)

(declare-datatypes ((List!11145 0))(
  ( (Nil!11142) (Cons!11141 (h!12168 (_ BitVec 64)) (t!17365 List!11145)) )
))
(declare-fun arrayNoDuplicates!0 (array!35739 (_ BitVec 32) List!11145) Bool)

(assert (=> b!570723 (= res!360402 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11142))))

(declare-fun b!570724 () Bool)

(declare-fun e!328261 () Bool)

(assert (=> b!570724 (= e!328261 e!328258)))

(declare-fun res!360408 () Bool)

(assert (=> b!570724 (=> (not res!360408) (not e!328258))))

(declare-datatypes ((SeekEntryResult!5563 0))(
  ( (MissingZero!5563 (index!24479 (_ BitVec 32))) (Found!5563 (index!24480 (_ BitVec 32))) (Intermediate!5563 (undefined!6375 Bool) (index!24481 (_ BitVec 32)) (x!53506 (_ BitVec 32))) (Undefined!5563) (MissingVacant!5563 (index!24482 (_ BitVec 32))) )
))
(declare-fun lt!260194 () SeekEntryResult!5563)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!570724 (= res!360408 (or (= lt!260194 (MissingZero!5563 i!1132)) (= lt!260194 (MissingVacant!5563 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35739 (_ BitVec 32)) SeekEntryResult!5563)

(assert (=> b!570724 (= lt!260194 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!328260 () Bool)

(declare-fun lt!260189 () SeekEntryResult!5563)

(declare-fun lt!260192 () SeekEntryResult!5563)

(declare-fun b!570726 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35739 (_ BitVec 32)) SeekEntryResult!5563)

(assert (=> b!570726 (= e!328260 (= lt!260189 (seekKeyOrZeroReturnVacant!0 (x!53506 lt!260192) (index!24481 lt!260192) (index!24481 lt!260192) (select (arr!17158 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!570727 () Bool)

(declare-fun res!360401 () Bool)

(assert (=> b!570727 (=> (not res!360401) (not e!328261))))

(declare-fun arrayContainsKey!0 (array!35739 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570727 (= res!360401 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!570728 () Bool)

(declare-fun res!360400 () Bool)

(assert (=> b!570728 (=> (not res!360400) (not e!328258))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35739 (_ BitVec 32)) Bool)

(assert (=> b!570728 (= res!360400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!570729 () Bool)

(declare-fun e!328259 () Bool)

(assert (=> b!570729 (= e!328258 e!328259)))

(declare-fun res!360403 () Bool)

(assert (=> b!570729 (=> (not res!360403) (not e!328259))))

(declare-fun lt!260193 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35739 (_ BitVec 32)) SeekEntryResult!5563)

(assert (=> b!570729 (= res!360403 (= lt!260192 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260193 (select (store (arr!17158 a!3118) i!1132 k0!1914) j!142) (array!35740 (store (arr!17158 a!3118) i!1132 k0!1914) (size!17522 a!3118)) mask!3119)))))

(declare-fun lt!260190 () (_ BitVec 32))

(assert (=> b!570729 (= lt!260192 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260190 (select (arr!17158 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570729 (= lt!260193 (toIndex!0 (select (store (arr!17158 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!570729 (= lt!260190 (toIndex!0 (select (arr!17158 a!3118) j!142) mask!3119))))

(declare-fun res!360399 () Bool)

(assert (=> start!52332 (=> (not res!360399) (not e!328261))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52332 (= res!360399 (validMask!0 mask!3119))))

(assert (=> start!52332 e!328261))

(assert (=> start!52332 true))

(declare-fun array_inv!13017 (array!35739) Bool)

(assert (=> start!52332 (array_inv!13017 a!3118)))

(declare-fun b!570725 () Bool)

(assert (=> b!570725 (= e!328259 (not true))))

(declare-fun e!328262 () Bool)

(assert (=> b!570725 e!328262))

(declare-fun res!360407 () Bool)

(assert (=> b!570725 (=> (not res!360407) (not e!328262))))

(assert (=> b!570725 (= res!360407 (= lt!260189 (Found!5563 j!142)))))

(assert (=> b!570725 (= lt!260189 (seekEntryOrOpen!0 (select (arr!17158 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!570725 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17899 0))(
  ( (Unit!17900) )
))
(declare-fun lt!260191 () Unit!17899)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35739 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17899)

(assert (=> b!570725 (= lt!260191 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!570730 () Bool)

(declare-fun res!360409 () Bool)

(assert (=> b!570730 (=> (not res!360409) (not e!328261))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570730 (= res!360409 (validKeyInArray!0 (select (arr!17158 a!3118) j!142)))))

(declare-fun b!570731 () Bool)

(declare-fun res!360405 () Bool)

(assert (=> b!570731 (=> (not res!360405) (not e!328261))))

(assert (=> b!570731 (= res!360405 (validKeyInArray!0 k0!1914))))

(declare-fun b!570732 () Bool)

(assert (=> b!570732 (= e!328262 e!328260)))

(declare-fun res!360406 () Bool)

(assert (=> b!570732 (=> res!360406 e!328260)))

(get-info :version)

(assert (=> b!570732 (= res!360406 (or (undefined!6375 lt!260192) (not ((_ is Intermediate!5563) lt!260192)) (= (select (arr!17158 a!3118) (index!24481 lt!260192)) (select (arr!17158 a!3118) j!142)) (= (select (arr!17158 a!3118) (index!24481 lt!260192)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!570733 () Bool)

(declare-fun res!360404 () Bool)

(assert (=> b!570733 (=> (not res!360404) (not e!328261))))

(assert (=> b!570733 (= res!360404 (and (= (size!17522 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17522 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17522 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!52332 res!360399) b!570733))

(assert (= (and b!570733 res!360404) b!570730))

(assert (= (and b!570730 res!360409) b!570731))

(assert (= (and b!570731 res!360405) b!570727))

(assert (= (and b!570727 res!360401) b!570724))

(assert (= (and b!570724 res!360408) b!570728))

(assert (= (and b!570728 res!360400) b!570723))

(assert (= (and b!570723 res!360402) b!570729))

(assert (= (and b!570729 res!360403) b!570725))

(assert (= (and b!570725 res!360407) b!570732))

(assert (= (and b!570732 (not res!360406)) b!570726))

(declare-fun m!549707 () Bool)

(assert (=> b!570724 m!549707))

(declare-fun m!549709 () Bool)

(assert (=> b!570730 m!549709))

(assert (=> b!570730 m!549709))

(declare-fun m!549711 () Bool)

(assert (=> b!570730 m!549711))

(declare-fun m!549713 () Bool)

(assert (=> b!570723 m!549713))

(declare-fun m!549715 () Bool)

(assert (=> b!570731 m!549715))

(assert (=> b!570729 m!549709))

(declare-fun m!549717 () Bool)

(assert (=> b!570729 m!549717))

(assert (=> b!570729 m!549709))

(declare-fun m!549719 () Bool)

(assert (=> b!570729 m!549719))

(declare-fun m!549721 () Bool)

(assert (=> b!570729 m!549721))

(declare-fun m!549723 () Bool)

(assert (=> b!570729 m!549723))

(assert (=> b!570729 m!549719))

(declare-fun m!549725 () Bool)

(assert (=> b!570729 m!549725))

(assert (=> b!570729 m!549719))

(assert (=> b!570729 m!549709))

(declare-fun m!549727 () Bool)

(assert (=> b!570729 m!549727))

(assert (=> b!570726 m!549709))

(assert (=> b!570726 m!549709))

(declare-fun m!549729 () Bool)

(assert (=> b!570726 m!549729))

(declare-fun m!549731 () Bool)

(assert (=> start!52332 m!549731))

(declare-fun m!549733 () Bool)

(assert (=> start!52332 m!549733))

(declare-fun m!549735 () Bool)

(assert (=> b!570732 m!549735))

(assert (=> b!570732 m!549709))

(declare-fun m!549737 () Bool)

(assert (=> b!570728 m!549737))

(declare-fun m!549739 () Bool)

(assert (=> b!570727 m!549739))

(assert (=> b!570725 m!549709))

(assert (=> b!570725 m!549709))

(declare-fun m!549741 () Bool)

(assert (=> b!570725 m!549741))

(declare-fun m!549743 () Bool)

(assert (=> b!570725 m!549743))

(declare-fun m!549745 () Bool)

(assert (=> b!570725 m!549745))

(check-sat (not b!570727) (not b!570730) (not start!52332) (not b!570729) (not b!570723) (not b!570728) (not b!570731) (not b!570725) (not b!570724) (not b!570726))
(check-sat)
