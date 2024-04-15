; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52400 () Bool)

(assert start!52400)

(declare-fun res!361376 () Bool)

(declare-fun e!328832 () Bool)

(assert (=> start!52400 (=> (not res!361376) (not e!328832))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52400 (= res!361376 (validMask!0 mask!3119))))

(assert (=> start!52400 e!328832))

(assert (=> start!52400 true))

(declare-datatypes ((array!35806 0))(
  ( (array!35807 (arr!17192 (Array (_ BitVec 32) (_ BitVec 64))) (size!17557 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35806)

(declare-fun array_inv!13075 (array!35806) Bool)

(assert (=> start!52400 (array_inv!13075 a!3118)))

(declare-fun b!571726 () Bool)

(declare-fun e!328830 () Bool)

(declare-fun e!328829 () Bool)

(assert (=> b!571726 (= e!328830 e!328829)))

(declare-fun res!361382 () Bool)

(assert (=> b!571726 (=> (not res!361382) (not e!328829))))

(declare-fun lt!260703 () array!35806)

(declare-fun lt!260704 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5638 0))(
  ( (MissingZero!5638 (index!24779 (_ BitVec 32))) (Found!5638 (index!24780 (_ BitVec 32))) (Intermediate!5638 (undefined!6450 Bool) (index!24781 (_ BitVec 32)) (x!53662 (_ BitVec 32))) (Undefined!5638) (MissingVacant!5638 (index!24782 (_ BitVec 32))) )
))
(declare-fun lt!260702 () SeekEntryResult!5638)

(declare-fun lt!260700 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35806 (_ BitVec 32)) SeekEntryResult!5638)

(assert (=> b!571726 (= res!361382 (= lt!260702 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260700 lt!260704 lt!260703 mask!3119)))))

(declare-fun lt!260698 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!571726 (= lt!260702 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260698 (select (arr!17192 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!571726 (= lt!260700 (toIndex!0 lt!260704 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!571726 (= lt!260704 (select (store (arr!17192 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!571726 (= lt!260698 (toIndex!0 (select (arr!17192 a!3118) j!142) mask!3119))))

(assert (=> b!571726 (= lt!260703 (array!35807 (store (arr!17192 a!3118) i!1132 k0!1914) (size!17557 a!3118)))))

(declare-fun b!571727 () Bool)

(declare-fun e!328831 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35806 (_ BitVec 32)) SeekEntryResult!5638)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35806 (_ BitVec 32)) SeekEntryResult!5638)

(assert (=> b!571727 (= e!328831 (= (seekEntryOrOpen!0 lt!260704 lt!260703 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53662 lt!260702) (index!24781 lt!260702) (index!24781 lt!260702) lt!260704 lt!260703 mask!3119)))))

(declare-fun b!571728 () Bool)

(declare-fun e!328836 () Bool)

(declare-fun e!328835 () Bool)

(assert (=> b!571728 (= e!328836 e!328835)))

(declare-fun res!361387 () Bool)

(assert (=> b!571728 (=> res!361387 e!328835)))

(declare-fun lt!260696 () (_ BitVec 64))

(assert (=> b!571728 (= res!361387 (or (= lt!260696 (select (arr!17192 a!3118) j!142)) (= lt!260696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!571728 (= lt!260696 (select (arr!17192 a!3118) (index!24781 lt!260702)))))

(declare-fun b!571729 () Bool)

(assert (=> b!571729 (= e!328835 e!328831)))

(declare-fun res!361386 () Bool)

(assert (=> b!571729 (=> (not res!361386) (not e!328831))))

(declare-fun lt!260701 () SeekEntryResult!5638)

(assert (=> b!571729 (= res!361386 (= lt!260701 (seekKeyOrZeroReturnVacant!0 (x!53662 lt!260702) (index!24781 lt!260702) (index!24781 lt!260702) (select (arr!17192 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!571730 () Bool)

(assert (=> b!571730 (= e!328829 (not true))))

(declare-fun e!328834 () Bool)

(assert (=> b!571730 e!328834))

(declare-fun res!361383 () Bool)

(assert (=> b!571730 (=> (not res!361383) (not e!328834))))

(assert (=> b!571730 (= res!361383 (= lt!260701 (Found!5638 j!142)))))

(assert (=> b!571730 (= lt!260701 (seekEntryOrOpen!0 (select (arr!17192 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35806 (_ BitVec 32)) Bool)

(assert (=> b!571730 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17964 0))(
  ( (Unit!17965) )
))
(declare-fun lt!260699 () Unit!17964)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35806 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17964)

(assert (=> b!571730 (= lt!260699 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!571731 () Bool)

(declare-fun res!361384 () Bool)

(assert (=> b!571731 (=> (not res!361384) (not e!328832))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!571731 (= res!361384 (validKeyInArray!0 (select (arr!17192 a!3118) j!142)))))

(declare-fun b!571732 () Bool)

(assert (=> b!571732 (= e!328832 e!328830)))

(declare-fun res!361385 () Bool)

(assert (=> b!571732 (=> (not res!361385) (not e!328830))))

(declare-fun lt!260697 () SeekEntryResult!5638)

(assert (=> b!571732 (= res!361385 (or (= lt!260697 (MissingZero!5638 i!1132)) (= lt!260697 (MissingVacant!5638 i!1132))))))

(assert (=> b!571732 (= lt!260697 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!571733 () Bool)

(declare-fun res!361378 () Bool)

(assert (=> b!571733 (=> (not res!361378) (not e!328830))))

(declare-datatypes ((List!11311 0))(
  ( (Nil!11308) (Cons!11307 (h!12334 (_ BitVec 64)) (t!17530 List!11311)) )
))
(declare-fun arrayNoDuplicates!0 (array!35806 (_ BitVec 32) List!11311) Bool)

(assert (=> b!571733 (= res!361378 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11308))))

(declare-fun b!571734 () Bool)

(declare-fun res!361377 () Bool)

(assert (=> b!571734 (=> (not res!361377) (not e!328832))))

(assert (=> b!571734 (= res!361377 (validKeyInArray!0 k0!1914))))

(declare-fun b!571735 () Bool)

(assert (=> b!571735 (= e!328834 e!328836)))

(declare-fun res!361380 () Bool)

(assert (=> b!571735 (=> res!361380 e!328836)))

(get-info :version)

(assert (=> b!571735 (= res!361380 (or (undefined!6450 lt!260702) (not ((_ is Intermediate!5638) lt!260702))))))

(declare-fun b!571736 () Bool)

(declare-fun res!361381 () Bool)

(assert (=> b!571736 (=> (not res!361381) (not e!328832))))

(assert (=> b!571736 (= res!361381 (and (= (size!17557 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17557 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17557 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!571737 () Bool)

(declare-fun res!361379 () Bool)

(assert (=> b!571737 (=> (not res!361379) (not e!328832))))

(declare-fun arrayContainsKey!0 (array!35806 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!571737 (= res!361379 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!571738 () Bool)

(declare-fun res!361388 () Bool)

(assert (=> b!571738 (=> (not res!361388) (not e!328830))))

(assert (=> b!571738 (= res!361388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!52400 res!361376) b!571736))

(assert (= (and b!571736 res!361381) b!571731))

(assert (= (and b!571731 res!361384) b!571734))

(assert (= (and b!571734 res!361377) b!571737))

(assert (= (and b!571737 res!361379) b!571732))

(assert (= (and b!571732 res!361385) b!571738))

(assert (= (and b!571738 res!361388) b!571733))

(assert (= (and b!571733 res!361378) b!571726))

(assert (= (and b!571726 res!361382) b!571730))

(assert (= (and b!571730 res!361383) b!571735))

(assert (= (and b!571735 (not res!361380)) b!571728))

(assert (= (and b!571728 (not res!361387)) b!571729))

(assert (= (and b!571729 res!361386) b!571727))

(declare-fun m!550145 () Bool)

(assert (=> b!571730 m!550145))

(assert (=> b!571730 m!550145))

(declare-fun m!550147 () Bool)

(assert (=> b!571730 m!550147))

(declare-fun m!550149 () Bool)

(assert (=> b!571730 m!550149))

(declare-fun m!550151 () Bool)

(assert (=> b!571730 m!550151))

(declare-fun m!550153 () Bool)

(assert (=> b!571733 m!550153))

(declare-fun m!550155 () Bool)

(assert (=> b!571727 m!550155))

(declare-fun m!550157 () Bool)

(assert (=> b!571727 m!550157))

(assert (=> b!571728 m!550145))

(declare-fun m!550159 () Bool)

(assert (=> b!571728 m!550159))

(assert (=> b!571729 m!550145))

(assert (=> b!571729 m!550145))

(declare-fun m!550161 () Bool)

(assert (=> b!571729 m!550161))

(declare-fun m!550163 () Bool)

(assert (=> start!52400 m!550163))

(declare-fun m!550165 () Bool)

(assert (=> start!52400 m!550165))

(declare-fun m!550167 () Bool)

(assert (=> b!571737 m!550167))

(declare-fun m!550169 () Bool)

(assert (=> b!571738 m!550169))

(assert (=> b!571731 m!550145))

(assert (=> b!571731 m!550145))

(declare-fun m!550171 () Bool)

(assert (=> b!571731 m!550171))

(declare-fun m!550173 () Bool)

(assert (=> b!571732 m!550173))

(assert (=> b!571726 m!550145))

(declare-fun m!550175 () Bool)

(assert (=> b!571726 m!550175))

(assert (=> b!571726 m!550145))

(declare-fun m!550177 () Bool)

(assert (=> b!571726 m!550177))

(declare-fun m!550179 () Bool)

(assert (=> b!571726 m!550179))

(declare-fun m!550181 () Bool)

(assert (=> b!571726 m!550181))

(declare-fun m!550183 () Bool)

(assert (=> b!571726 m!550183))

(assert (=> b!571726 m!550145))

(declare-fun m!550185 () Bool)

(assert (=> b!571726 m!550185))

(declare-fun m!550187 () Bool)

(assert (=> b!571734 m!550187))

(check-sat (not b!571729) (not b!571730) (not b!571731) (not b!571727) (not b!571737) (not b!571738) (not b!571726) (not b!571733) (not b!571734) (not start!52400) (not b!571732))
(check-sat)
