; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50796 () Bool)

(assert start!50796)

(declare-fun b!555738 () Bool)

(declare-fun res!348154 () Bool)

(declare-fun e!320270 () Bool)

(assert (=> b!555738 (=> (not res!348154) (not e!320270))))

(declare-datatypes ((array!35021 0))(
  ( (array!35022 (arr!16820 (Array (_ BitVec 32) (_ BitVec 64))) (size!17184 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35021)

(declare-datatypes ((List!10900 0))(
  ( (Nil!10897) (Cons!10896 (h!11881 (_ BitVec 64)) (t!17128 List!10900)) )
))
(declare-fun arrayNoDuplicates!0 (array!35021 (_ BitVec 32) List!10900) Bool)

(assert (=> b!555738 (= res!348154 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10897))))

(declare-fun res!348155 () Bool)

(declare-fun e!320269 () Bool)

(assert (=> start!50796 (=> (not res!348155) (not e!320269))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50796 (= res!348155 (validMask!0 mask!3119))))

(assert (=> start!50796 e!320269))

(assert (=> start!50796 true))

(declare-fun array_inv!12616 (array!35021) Bool)

(assert (=> start!50796 (array_inv!12616 a!3118)))

(declare-fun b!555739 () Bool)

(declare-fun res!348158 () Bool)

(assert (=> b!555739 (=> (not res!348158) (not e!320269))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555739 (= res!348158 (validKeyInArray!0 k!1914))))

(declare-fun b!555740 () Bool)

(declare-fun res!348150 () Bool)

(assert (=> b!555740 (=> (not res!348150) (not e!320269))))

(declare-fun arrayContainsKey!0 (array!35021 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555740 (= res!348150 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555741 () Bool)

(declare-fun res!348152 () Bool)

(assert (=> b!555741 (=> (not res!348152) (not e!320270))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35021 (_ BitVec 32)) Bool)

(assert (=> b!555741 (= res!348152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555742 () Bool)

(declare-fun e!320268 () Bool)

(assert (=> b!555742 (= e!320270 e!320268)))

(declare-fun res!348157 () Bool)

(assert (=> b!555742 (=> (not res!348157) (not e!320268))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!252616 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5269 0))(
  ( (MissingZero!5269 (index!23303 (_ BitVec 32))) (Found!5269 (index!23304 (_ BitVec 32))) (Intermediate!5269 (undefined!6081 Bool) (index!23305 (_ BitVec 32)) (x!52199 (_ BitVec 32))) (Undefined!5269) (MissingVacant!5269 (index!23306 (_ BitVec 32))) )
))
(declare-fun lt!252618 () SeekEntryResult!5269)

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35021 (_ BitVec 32)) SeekEntryResult!5269)

(assert (=> b!555742 (= res!348157 (= lt!252618 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252616 (select (store (arr!16820 a!3118) i!1132 k!1914) j!142) (array!35022 (store (arr!16820 a!3118) i!1132 k!1914) (size!17184 a!3118)) mask!3119)))))

(declare-fun lt!252614 () (_ BitVec 32))

(assert (=> b!555742 (= lt!252618 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252614 (select (arr!16820 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555742 (= lt!252616 (toIndex!0 (select (store (arr!16820 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!555742 (= lt!252614 (toIndex!0 (select (arr!16820 a!3118) j!142) mask!3119))))

(declare-fun b!555743 () Bool)

(declare-fun res!348156 () Bool)

(assert (=> b!555743 (=> (not res!348156) (not e!320269))))

(assert (=> b!555743 (= res!348156 (validKeyInArray!0 (select (arr!16820 a!3118) j!142)))))

(declare-fun b!555744 () Bool)

(assert (=> b!555744 (= e!320268 (not true))))

(declare-fun lt!252619 () SeekEntryResult!5269)

(assert (=> b!555744 (and (= lt!252619 (Found!5269 j!142)) (or (undefined!6081 lt!252618) (not (is-Intermediate!5269 lt!252618)) (= (select (arr!16820 a!3118) (index!23305 lt!252618)) (select (arr!16820 a!3118) j!142)) (not (= (select (arr!16820 a!3118) (index!23305 lt!252618)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252619 (MissingZero!5269 (index!23305 lt!252618)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35021 (_ BitVec 32)) SeekEntryResult!5269)

(assert (=> b!555744 (= lt!252619 (seekEntryOrOpen!0 (select (arr!16820 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!555744 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17312 0))(
  ( (Unit!17313) )
))
(declare-fun lt!252615 () Unit!17312)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35021 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17312)

(assert (=> b!555744 (= lt!252615 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555745 () Bool)

(declare-fun res!348151 () Bool)

(assert (=> b!555745 (=> (not res!348151) (not e!320269))))

(assert (=> b!555745 (= res!348151 (and (= (size!17184 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17184 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17184 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555746 () Bool)

(assert (=> b!555746 (= e!320269 e!320270)))

(declare-fun res!348153 () Bool)

(assert (=> b!555746 (=> (not res!348153) (not e!320270))))

(declare-fun lt!252617 () SeekEntryResult!5269)

(assert (=> b!555746 (= res!348153 (or (= lt!252617 (MissingZero!5269 i!1132)) (= lt!252617 (MissingVacant!5269 i!1132))))))

(assert (=> b!555746 (= lt!252617 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!50796 res!348155) b!555745))

(assert (= (and b!555745 res!348151) b!555743))

(assert (= (and b!555743 res!348156) b!555739))

(assert (= (and b!555739 res!348158) b!555740))

(assert (= (and b!555740 res!348150) b!555746))

(assert (= (and b!555746 res!348153) b!555741))

(assert (= (and b!555741 res!348152) b!555738))

(assert (= (and b!555738 res!348154) b!555742))

(assert (= (and b!555742 res!348157) b!555744))

(declare-fun m!533545 () Bool)

(assert (=> b!555746 m!533545))

(declare-fun m!533547 () Bool)

(assert (=> b!555743 m!533547))

(assert (=> b!555743 m!533547))

(declare-fun m!533549 () Bool)

(assert (=> b!555743 m!533549))

(declare-fun m!533551 () Bool)

(assert (=> b!555740 m!533551))

(assert (=> b!555742 m!533547))

(declare-fun m!533553 () Bool)

(assert (=> b!555742 m!533553))

(assert (=> b!555742 m!533547))

(declare-fun m!533555 () Bool)

(assert (=> b!555742 m!533555))

(declare-fun m!533557 () Bool)

(assert (=> b!555742 m!533557))

(assert (=> b!555742 m!533555))

(assert (=> b!555742 m!533547))

(declare-fun m!533559 () Bool)

(assert (=> b!555742 m!533559))

(declare-fun m!533561 () Bool)

(assert (=> b!555742 m!533561))

(assert (=> b!555742 m!533555))

(declare-fun m!533563 () Bool)

(assert (=> b!555742 m!533563))

(declare-fun m!533565 () Bool)

(assert (=> b!555738 m!533565))

(declare-fun m!533567 () Bool)

(assert (=> b!555744 m!533567))

(assert (=> b!555744 m!533547))

(declare-fun m!533569 () Bool)

(assert (=> b!555744 m!533569))

(declare-fun m!533571 () Bool)

(assert (=> b!555744 m!533571))

(assert (=> b!555744 m!533547))

(declare-fun m!533573 () Bool)

(assert (=> b!555744 m!533573))

(declare-fun m!533575 () Bool)

(assert (=> b!555739 m!533575))

(declare-fun m!533577 () Bool)

(assert (=> start!50796 m!533577))

(declare-fun m!533579 () Bool)

(assert (=> start!50796 m!533579))

(declare-fun m!533581 () Bool)

(assert (=> b!555741 m!533581))

(push 1)

