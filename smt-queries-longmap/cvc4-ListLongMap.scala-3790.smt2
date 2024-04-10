; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51918 () Bool)

(assert start!51918)

(declare-fun b!567563 () Bool)

(declare-fun res!358148 () Bool)

(declare-fun e!326568 () Bool)

(assert (=> b!567563 (=> (not res!358148) (not e!326568))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35612 0))(
  ( (array!35613 (arr!17102 (Array (_ BitVec 32) (_ BitVec 64))) (size!17466 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35612)

(declare-datatypes ((SeekEntryResult!5551 0))(
  ( (MissingZero!5551 (index!24431 (_ BitVec 32))) (Found!5551 (index!24432 (_ BitVec 32))) (Intermediate!5551 (undefined!6363 Bool) (index!24433 (_ BitVec 32)) (x!53296 (_ BitVec 32))) (Undefined!5551) (MissingVacant!5551 (index!24434 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35612 (_ BitVec 32)) SeekEntryResult!5551)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567563 (= res!358148 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17102 a!3118) j!142) mask!3119) (select (arr!17102 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17102 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17102 a!3118) i!1132 k!1914) j!142) (array!35613 (store (arr!17102 a!3118) i!1132 k!1914) (size!17466 a!3118)) mask!3119)))))

(declare-fun b!567564 () Bool)

(declare-fun res!358156 () Bool)

(declare-fun e!326570 () Bool)

(assert (=> b!567564 (=> (not res!358156) (not e!326570))))

(declare-fun arrayContainsKey!0 (array!35612 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!567564 (= res!358156 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!567565 () Bool)

(declare-fun res!358151 () Bool)

(assert (=> b!567565 (=> (not res!358151) (not e!326570))))

(assert (=> b!567565 (= res!358151 (and (= (size!17466 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17466 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17466 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!358152 () Bool)

(assert (=> start!51918 (=> (not res!358152) (not e!326570))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51918 (= res!358152 (validMask!0 mask!3119))))

(assert (=> start!51918 e!326570))

(assert (=> start!51918 true))

(declare-fun array_inv!12898 (array!35612) Bool)

(assert (=> start!51918 (array_inv!12898 a!3118)))

(declare-fun b!567566 () Bool)

(assert (=> b!567566 (= e!326570 e!326568)))

(declare-fun res!358150 () Bool)

(assert (=> b!567566 (=> (not res!358150) (not e!326568))))

(declare-fun lt!258540 () SeekEntryResult!5551)

(assert (=> b!567566 (= res!358150 (or (= lt!258540 (MissingZero!5551 i!1132)) (= lt!258540 (MissingVacant!5551 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35612 (_ BitVec 32)) SeekEntryResult!5551)

(assert (=> b!567566 (= lt!258540 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!567567 () Bool)

(declare-fun res!358154 () Bool)

(assert (=> b!567567 (=> (not res!358154) (not e!326570))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!567567 (= res!358154 (validKeyInArray!0 (select (arr!17102 a!3118) j!142)))))

(declare-fun b!567568 () Bool)

(declare-fun res!358153 () Bool)

(assert (=> b!567568 (=> (not res!358153) (not e!326570))))

(assert (=> b!567568 (= res!358153 (validKeyInArray!0 k!1914))))

(declare-fun e!326571 () Bool)

(declare-fun b!567569 () Bool)

(assert (=> b!567569 (= e!326571 (= (seekEntryOrOpen!0 (select (arr!17102 a!3118) j!142) a!3118 mask!3119) (Found!5551 j!142)))))

(declare-fun b!567570 () Bool)

(declare-fun res!358149 () Bool)

(assert (=> b!567570 (=> (not res!358149) (not e!326568))))

(declare-datatypes ((List!11182 0))(
  ( (Nil!11179) (Cons!11178 (h!12190 (_ BitVec 64)) (t!17410 List!11182)) )
))
(declare-fun arrayNoDuplicates!0 (array!35612 (_ BitVec 32) List!11182) Bool)

(assert (=> b!567570 (= res!358149 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11179))))

(declare-fun b!567571 () Bool)

(declare-fun res!358155 () Bool)

(assert (=> b!567571 (=> (not res!358155) (not e!326568))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35612 (_ BitVec 32)) Bool)

(assert (=> b!567571 (= res!358155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!567572 () Bool)

(assert (=> b!567572 (= e!326568 (not true))))

(assert (=> b!567572 e!326571))

(declare-fun res!358157 () Bool)

(assert (=> b!567572 (=> (not res!358157) (not e!326571))))

(assert (=> b!567572 (= res!358157 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17804 0))(
  ( (Unit!17805) )
))
(declare-fun lt!258541 () Unit!17804)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35612 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17804)

(assert (=> b!567572 (= lt!258541 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!51918 res!358152) b!567565))

(assert (= (and b!567565 res!358151) b!567567))

(assert (= (and b!567567 res!358154) b!567568))

(assert (= (and b!567568 res!358153) b!567564))

(assert (= (and b!567564 res!358156) b!567566))

(assert (= (and b!567566 res!358150) b!567571))

(assert (= (and b!567571 res!358155) b!567570))

(assert (= (and b!567570 res!358149) b!567563))

(assert (= (and b!567563 res!358148) b!567572))

(assert (= (and b!567572 res!358157) b!567569))

(declare-fun m!546177 () Bool)

(assert (=> b!567569 m!546177))

(assert (=> b!567569 m!546177))

(declare-fun m!546179 () Bool)

(assert (=> b!567569 m!546179))

(declare-fun m!546181 () Bool)

(assert (=> b!567568 m!546181))

(declare-fun m!546183 () Bool)

(assert (=> b!567570 m!546183))

(declare-fun m!546185 () Bool)

(assert (=> b!567564 m!546185))

(assert (=> b!567563 m!546177))

(declare-fun m!546187 () Bool)

(assert (=> b!567563 m!546187))

(assert (=> b!567563 m!546177))

(declare-fun m!546189 () Bool)

(assert (=> b!567563 m!546189))

(declare-fun m!546191 () Bool)

(assert (=> b!567563 m!546191))

(assert (=> b!567563 m!546189))

(declare-fun m!546193 () Bool)

(assert (=> b!567563 m!546193))

(assert (=> b!567563 m!546187))

(assert (=> b!567563 m!546177))

(declare-fun m!546195 () Bool)

(assert (=> b!567563 m!546195))

(declare-fun m!546197 () Bool)

(assert (=> b!567563 m!546197))

(assert (=> b!567563 m!546189))

(assert (=> b!567563 m!546191))

(declare-fun m!546199 () Bool)

(assert (=> b!567566 m!546199))

(declare-fun m!546201 () Bool)

(assert (=> b!567571 m!546201))

(declare-fun m!546203 () Bool)

(assert (=> start!51918 m!546203))

(declare-fun m!546205 () Bool)

(assert (=> start!51918 m!546205))

(assert (=> b!567567 m!546177))

(assert (=> b!567567 m!546177))

(declare-fun m!546207 () Bool)

(assert (=> b!567567 m!546207))

(declare-fun m!546209 () Bool)

(assert (=> b!567572 m!546209))

(declare-fun m!546211 () Bool)

(assert (=> b!567572 m!546211))

(push 1)

