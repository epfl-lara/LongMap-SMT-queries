; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51044 () Bool)

(assert start!51044)

(declare-fun res!349529 () Bool)

(declare-fun e!321180 () Bool)

(assert (=> start!51044 (=> (not res!349529) (not e!321180))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51044 (= res!349529 (validMask!0 mask!3119))))

(assert (=> start!51044 e!321180))

(assert (=> start!51044 true))

(declare-datatypes ((array!35107 0))(
  ( (array!35108 (arr!16859 (Array (_ BitVec 32) (_ BitVec 64))) (size!17224 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35107)

(declare-fun array_inv!12742 (array!35107) Bool)

(assert (=> start!51044 (array_inv!12742 a!3118)))

(declare-fun b!557521 () Bool)

(declare-fun res!349531 () Bool)

(assert (=> b!557521 (=> (not res!349531) (not e!321180))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!557521 (= res!349531 (validKeyInArray!0 k0!1914))))

(declare-fun b!557522 () Bool)

(declare-fun e!321179 () Bool)

(assert (=> b!557522 (= e!321179 (not true))))

(declare-fun e!321177 () Bool)

(assert (=> b!557522 e!321177))

(declare-fun res!349530 () Bool)

(assert (=> b!557522 (=> (not res!349530) (not e!321177))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35107 (_ BitVec 32)) Bool)

(assert (=> b!557522 (= res!349530 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17370 0))(
  ( (Unit!17371) )
))
(declare-fun lt!253218 () Unit!17370)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35107 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17370)

(assert (=> b!557522 (= lt!253218 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!557523 () Bool)

(declare-fun res!349528 () Bool)

(assert (=> b!557523 (=> (not res!349528) (not e!321179))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5305 0))(
  ( (MissingZero!5305 (index!23447 (_ BitVec 32))) (Found!5305 (index!23448 (_ BitVec 32))) (Intermediate!5305 (undefined!6117 Bool) (index!23449 (_ BitVec 32)) (x!52360 (_ BitVec 32))) (Undefined!5305) (MissingVacant!5305 (index!23450 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35107 (_ BitVec 32)) SeekEntryResult!5305)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557523 (= res!349528 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16859 a!3118) j!142) mask!3119) (select (arr!16859 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16859 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16859 a!3118) i!1132 k0!1914) j!142) (array!35108 (store (arr!16859 a!3118) i!1132 k0!1914) (size!17224 a!3118)) mask!3119)))))

(declare-fun b!557524 () Bool)

(declare-fun res!349535 () Bool)

(assert (=> b!557524 (=> (not res!349535) (not e!321180))))

(assert (=> b!557524 (= res!349535 (validKeyInArray!0 (select (arr!16859 a!3118) j!142)))))

(declare-fun b!557525 () Bool)

(assert (=> b!557525 (= e!321180 e!321179)))

(declare-fun res!349526 () Bool)

(assert (=> b!557525 (=> (not res!349526) (not e!321179))))

(declare-fun lt!253219 () SeekEntryResult!5305)

(assert (=> b!557525 (= res!349526 (or (= lt!253219 (MissingZero!5305 i!1132)) (= lt!253219 (MissingVacant!5305 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35107 (_ BitVec 32)) SeekEntryResult!5305)

(assert (=> b!557525 (= lt!253219 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!557526 () Bool)

(declare-fun res!349533 () Bool)

(assert (=> b!557526 (=> (not res!349533) (not e!321179))))

(assert (=> b!557526 (= res!349533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!557527 () Bool)

(assert (=> b!557527 (= e!321177 (= (seekEntryOrOpen!0 (select (arr!16859 a!3118) j!142) a!3118 mask!3119) (Found!5305 j!142)))))

(declare-fun b!557528 () Bool)

(declare-fun res!349534 () Bool)

(assert (=> b!557528 (=> (not res!349534) (not e!321179))))

(declare-datatypes ((List!10978 0))(
  ( (Nil!10975) (Cons!10974 (h!11968 (_ BitVec 64)) (t!17197 List!10978)) )
))
(declare-fun arrayNoDuplicates!0 (array!35107 (_ BitVec 32) List!10978) Bool)

(assert (=> b!557528 (= res!349534 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10975))))

(declare-fun b!557529 () Bool)

(declare-fun res!349527 () Bool)

(assert (=> b!557529 (=> (not res!349527) (not e!321180))))

(declare-fun arrayContainsKey!0 (array!35107 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!557529 (= res!349527 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!557530 () Bool)

(declare-fun res!349532 () Bool)

(assert (=> b!557530 (=> (not res!349532) (not e!321180))))

(assert (=> b!557530 (= res!349532 (and (= (size!17224 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17224 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17224 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51044 res!349529) b!557530))

(assert (= (and b!557530 res!349532) b!557524))

(assert (= (and b!557524 res!349535) b!557521))

(assert (= (and b!557521 res!349531) b!557529))

(assert (= (and b!557529 res!349527) b!557525))

(assert (= (and b!557525 res!349526) b!557526))

(assert (= (and b!557526 res!349533) b!557528))

(assert (= (and b!557528 res!349534) b!557523))

(assert (= (and b!557523 res!349528) b!557522))

(assert (= (and b!557522 res!349530) b!557527))

(declare-fun m!534869 () Bool)

(assert (=> b!557526 m!534869))

(declare-fun m!534871 () Bool)

(assert (=> b!557524 m!534871))

(assert (=> b!557524 m!534871))

(declare-fun m!534873 () Bool)

(assert (=> b!557524 m!534873))

(declare-fun m!534875 () Bool)

(assert (=> b!557528 m!534875))

(assert (=> b!557523 m!534871))

(declare-fun m!534877 () Bool)

(assert (=> b!557523 m!534877))

(assert (=> b!557523 m!534871))

(declare-fun m!534879 () Bool)

(assert (=> b!557523 m!534879))

(declare-fun m!534881 () Bool)

(assert (=> b!557523 m!534881))

(assert (=> b!557523 m!534879))

(declare-fun m!534883 () Bool)

(assert (=> b!557523 m!534883))

(assert (=> b!557523 m!534877))

(assert (=> b!557523 m!534871))

(declare-fun m!534885 () Bool)

(assert (=> b!557523 m!534885))

(declare-fun m!534887 () Bool)

(assert (=> b!557523 m!534887))

(assert (=> b!557523 m!534879))

(assert (=> b!557523 m!534881))

(declare-fun m!534889 () Bool)

(assert (=> b!557525 m!534889))

(declare-fun m!534891 () Bool)

(assert (=> b!557521 m!534891))

(assert (=> b!557527 m!534871))

(assert (=> b!557527 m!534871))

(declare-fun m!534893 () Bool)

(assert (=> b!557527 m!534893))

(declare-fun m!534895 () Bool)

(assert (=> b!557522 m!534895))

(declare-fun m!534897 () Bool)

(assert (=> b!557522 m!534897))

(declare-fun m!534899 () Bool)

(assert (=> b!557529 m!534899))

(declare-fun m!534901 () Bool)

(assert (=> start!51044 m!534901))

(declare-fun m!534903 () Bool)

(assert (=> start!51044 m!534903))

(check-sat (not b!557528) (not b!557527) (not start!51044) (not b!557521) (not b!557524) (not b!557529) (not b!557523) (not b!557526) (not b!557525) (not b!557522))
(check-sat)
