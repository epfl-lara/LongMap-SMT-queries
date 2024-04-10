; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52146 () Bool)

(assert start!52146)

(declare-fun b!569130 () Bool)

(declare-fun res!359154 () Bool)

(declare-fun e!327443 () Bool)

(assert (=> b!569130 (=> (not res!359154) (not e!327443))))

(declare-datatypes ((array!35669 0))(
  ( (array!35670 (arr!17126 (Array (_ BitVec 32) (_ BitVec 64))) (size!17490 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35669)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569130 (= res!359154 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569131 () Bool)

(declare-fun res!359148 () Bool)

(declare-fun e!327444 () Bool)

(assert (=> b!569131 (=> (not res!359148) (not e!327444))))

(declare-datatypes ((List!11206 0))(
  ( (Nil!11203) (Cons!11202 (h!12223 (_ BitVec 64)) (t!17434 List!11206)) )
))
(declare-fun arrayNoDuplicates!0 (array!35669 (_ BitVec 32) List!11206) Bool)

(assert (=> b!569131 (= res!359148 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11203))))

(declare-fun res!359152 () Bool)

(assert (=> start!52146 (=> (not res!359152) (not e!327443))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52146 (= res!359152 (validMask!0 mask!3119))))

(assert (=> start!52146 e!327443))

(assert (=> start!52146 true))

(declare-fun array_inv!12922 (array!35669) Bool)

(assert (=> start!52146 (array_inv!12922 a!3118)))

(declare-fun b!569132 () Bool)

(declare-fun res!359155 () Bool)

(assert (=> b!569132 (=> (not res!359155) (not e!327444))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35669 (_ BitVec 32)) Bool)

(assert (=> b!569132 (= res!359155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569133 () Bool)

(declare-fun res!359149 () Bool)

(assert (=> b!569133 (=> (not res!359149) (not e!327443))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569133 (= res!359149 (validKeyInArray!0 k!1914))))

(declare-fun b!569134 () Bool)

(declare-fun e!327442 () Bool)

(assert (=> b!569134 (= e!327444 e!327442)))

(declare-fun res!359150 () Bool)

(assert (=> b!569134 (=> (not res!359150) (not e!327442))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5575 0))(
  ( (MissingZero!5575 (index!24527 (_ BitVec 32))) (Found!5575 (index!24528 (_ BitVec 32))) (Intermediate!5575 (undefined!6387 Bool) (index!24529 (_ BitVec 32)) (x!53402 (_ BitVec 32))) (Undefined!5575) (MissingVacant!5575 (index!24530 (_ BitVec 32))) )
))
(declare-fun lt!259337 () SeekEntryResult!5575)

(declare-fun lt!259339 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35669 (_ BitVec 32)) SeekEntryResult!5575)

(assert (=> b!569134 (= res!359150 (= lt!259337 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259339 (select (store (arr!17126 a!3118) i!1132 k!1914) j!142) (array!35670 (store (arr!17126 a!3118) i!1132 k!1914) (size!17490 a!3118)) mask!3119)))))

(declare-fun lt!259341 () (_ BitVec 32))

(assert (=> b!569134 (= lt!259337 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259341 (select (arr!17126 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569134 (= lt!259339 (toIndex!0 (select (store (arr!17126 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!569134 (= lt!259341 (toIndex!0 (select (arr!17126 a!3118) j!142) mask!3119))))

(declare-fun b!569135 () Bool)

(declare-fun res!359153 () Bool)

(assert (=> b!569135 (=> (not res!359153) (not e!327443))))

(assert (=> b!569135 (= res!359153 (validKeyInArray!0 (select (arr!17126 a!3118) j!142)))))

(declare-fun b!569136 () Bool)

(assert (=> b!569136 (= e!327443 e!327444)))

(declare-fun res!359156 () Bool)

(assert (=> b!569136 (=> (not res!359156) (not e!327444))))

(declare-fun lt!259342 () SeekEntryResult!5575)

(assert (=> b!569136 (= res!359156 (or (= lt!259342 (MissingZero!5575 i!1132)) (= lt!259342 (MissingVacant!5575 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35669 (_ BitVec 32)) SeekEntryResult!5575)

(assert (=> b!569136 (= lt!259342 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!569137 () Bool)

(assert (=> b!569137 (= e!327442 (not (or (undefined!6387 lt!259337) (not (is-Intermediate!5575 lt!259337)) (= (select (arr!17126 a!3118) (index!24529 lt!259337)) (select (arr!17126 a!3118) j!142)) (not (= (select (arr!17126 a!3118) (index!24529 lt!259337)) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!17490 a!3118)))))))

(declare-fun lt!259338 () SeekEntryResult!5575)

(assert (=> b!569137 (and (= lt!259338 (Found!5575 j!142)) (or (undefined!6387 lt!259337) (not (is-Intermediate!5575 lt!259337)) (= (select (arr!17126 a!3118) (index!24529 lt!259337)) (select (arr!17126 a!3118) j!142)) (not (= (select (arr!17126 a!3118) (index!24529 lt!259337)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259338 (MissingZero!5575 (index!24529 lt!259337)))))))

(assert (=> b!569137 (= lt!259338 (seekEntryOrOpen!0 (select (arr!17126 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!569137 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17852 0))(
  ( (Unit!17853) )
))
(declare-fun lt!259340 () Unit!17852)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35669 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17852)

(assert (=> b!569137 (= lt!259340 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569138 () Bool)

(declare-fun res!359151 () Bool)

(assert (=> b!569138 (=> (not res!359151) (not e!327443))))

(assert (=> b!569138 (= res!359151 (and (= (size!17490 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17490 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17490 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!52146 res!359152) b!569138))

(assert (= (and b!569138 res!359151) b!569135))

(assert (= (and b!569135 res!359153) b!569133))

(assert (= (and b!569133 res!359149) b!569130))

(assert (= (and b!569130 res!359154) b!569136))

(assert (= (and b!569136 res!359156) b!569132))

(assert (= (and b!569132 res!359155) b!569131))

(assert (= (and b!569131 res!359148) b!569134))

(assert (= (and b!569134 res!359150) b!569137))

(declare-fun m!547735 () Bool)

(assert (=> b!569132 m!547735))

(declare-fun m!547737 () Bool)

(assert (=> b!569136 m!547737))

(declare-fun m!547739 () Bool)

(assert (=> b!569131 m!547739))

(declare-fun m!547741 () Bool)

(assert (=> b!569130 m!547741))

(declare-fun m!547743 () Bool)

(assert (=> b!569133 m!547743))

(declare-fun m!547745 () Bool)

(assert (=> b!569135 m!547745))

(assert (=> b!569135 m!547745))

(declare-fun m!547747 () Bool)

(assert (=> b!569135 m!547747))

(assert (=> b!569134 m!547745))

(declare-fun m!547749 () Bool)

(assert (=> b!569134 m!547749))

(assert (=> b!569134 m!547745))

(declare-fun m!547751 () Bool)

(assert (=> b!569134 m!547751))

(assert (=> b!569134 m!547751))

(declare-fun m!547753 () Bool)

(assert (=> b!569134 m!547753))

(declare-fun m!547755 () Bool)

(assert (=> b!569134 m!547755))

(assert (=> b!569134 m!547745))

(declare-fun m!547757 () Bool)

(assert (=> b!569134 m!547757))

(assert (=> b!569134 m!547751))

(declare-fun m!547759 () Bool)

(assert (=> b!569134 m!547759))

(declare-fun m!547761 () Bool)

(assert (=> b!569137 m!547761))

(declare-fun m!547763 () Bool)

(assert (=> b!569137 m!547763))

(assert (=> b!569137 m!547745))

(declare-fun m!547765 () Bool)

(assert (=> b!569137 m!547765))

(declare-fun m!547767 () Bool)

(assert (=> b!569137 m!547767))

(assert (=> b!569137 m!547745))

(declare-fun m!547769 () Bool)

(assert (=> start!52146 m!547769))

(declare-fun m!547771 () Bool)

(assert (=> start!52146 m!547771))

(push 1)

