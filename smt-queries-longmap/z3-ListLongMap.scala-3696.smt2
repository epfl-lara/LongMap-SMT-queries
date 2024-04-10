; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50794 () Bool)

(assert start!50794)

(declare-fun b!555711 () Bool)

(declare-fun res!348123 () Bool)

(declare-fun e!320256 () Bool)

(assert (=> b!555711 (=> (not res!348123) (not e!320256))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555711 (= res!348123 (validKeyInArray!0 k0!1914))))

(declare-fun b!555712 () Bool)

(declare-fun res!348124 () Bool)

(assert (=> b!555712 (=> (not res!348124) (not e!320256))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35019 0))(
  ( (array!35020 (arr!16819 (Array (_ BitVec 32) (_ BitVec 64))) (size!17183 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35019)

(assert (=> b!555712 (= res!348124 (and (= (size!17183 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17183 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17183 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555713 () Bool)

(declare-fun res!348128 () Bool)

(assert (=> b!555713 (=> (not res!348128) (not e!320256))))

(declare-fun arrayContainsKey!0 (array!35019 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555713 (= res!348128 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!348126 () Bool)

(assert (=> start!50794 (=> (not res!348126) (not e!320256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50794 (= res!348126 (validMask!0 mask!3119))))

(assert (=> start!50794 e!320256))

(assert (=> start!50794 true))

(declare-fun array_inv!12615 (array!35019) Bool)

(assert (=> start!50794 (array_inv!12615 a!3118)))

(declare-fun b!555714 () Bool)

(declare-fun res!348125 () Bool)

(declare-fun e!320257 () Bool)

(assert (=> b!555714 (=> (not res!348125) (not e!320257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35019 (_ BitVec 32)) Bool)

(assert (=> b!555714 (= res!348125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555715 () Bool)

(assert (=> b!555715 (= e!320256 e!320257)))

(declare-fun res!348130 () Bool)

(assert (=> b!555715 (=> (not res!348130) (not e!320257))))

(declare-datatypes ((SeekEntryResult!5268 0))(
  ( (MissingZero!5268 (index!23299 (_ BitVec 32))) (Found!5268 (index!23300 (_ BitVec 32))) (Intermediate!5268 (undefined!6080 Bool) (index!23301 (_ BitVec 32)) (x!52198 (_ BitVec 32))) (Undefined!5268) (MissingVacant!5268 (index!23302 (_ BitVec 32))) )
))
(declare-fun lt!252596 () SeekEntryResult!5268)

(assert (=> b!555715 (= res!348130 (or (= lt!252596 (MissingZero!5268 i!1132)) (= lt!252596 (MissingVacant!5268 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35019 (_ BitVec 32)) SeekEntryResult!5268)

(assert (=> b!555715 (= lt!252596 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!555716 () Bool)

(declare-fun res!348129 () Bool)

(assert (=> b!555716 (=> (not res!348129) (not e!320256))))

(assert (=> b!555716 (= res!348129 (validKeyInArray!0 (select (arr!16819 a!3118) j!142)))))

(declare-fun b!555717 () Bool)

(declare-fun e!320259 () Bool)

(assert (=> b!555717 (= e!320259 (not true))))

(declare-fun lt!252598 () SeekEntryResult!5268)

(declare-fun lt!252599 () SeekEntryResult!5268)

(get-info :version)

(assert (=> b!555717 (and (= lt!252599 (Found!5268 j!142)) (or (undefined!6080 lt!252598) (not ((_ is Intermediate!5268) lt!252598)) (= (select (arr!16819 a!3118) (index!23301 lt!252598)) (select (arr!16819 a!3118) j!142)) (not (= (select (arr!16819 a!3118) (index!23301 lt!252598)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252599 (MissingZero!5268 (index!23301 lt!252598)))))))

(assert (=> b!555717 (= lt!252599 (seekEntryOrOpen!0 (select (arr!16819 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!555717 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17310 0))(
  ( (Unit!17311) )
))
(declare-fun lt!252601 () Unit!17310)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35019 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17310)

(assert (=> b!555717 (= lt!252601 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555718 () Bool)

(declare-fun res!348131 () Bool)

(assert (=> b!555718 (=> (not res!348131) (not e!320257))))

(declare-datatypes ((List!10899 0))(
  ( (Nil!10896) (Cons!10895 (h!11880 (_ BitVec 64)) (t!17127 List!10899)) )
))
(declare-fun arrayNoDuplicates!0 (array!35019 (_ BitVec 32) List!10899) Bool)

(assert (=> b!555718 (= res!348131 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10896))))

(declare-fun b!555719 () Bool)

(assert (=> b!555719 (= e!320257 e!320259)))

(declare-fun res!348127 () Bool)

(assert (=> b!555719 (=> (not res!348127) (not e!320259))))

(declare-fun lt!252597 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35019 (_ BitVec 32)) SeekEntryResult!5268)

(assert (=> b!555719 (= res!348127 (= lt!252598 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252597 (select (store (arr!16819 a!3118) i!1132 k0!1914) j!142) (array!35020 (store (arr!16819 a!3118) i!1132 k0!1914) (size!17183 a!3118)) mask!3119)))))

(declare-fun lt!252600 () (_ BitVec 32))

(assert (=> b!555719 (= lt!252598 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252600 (select (arr!16819 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555719 (= lt!252597 (toIndex!0 (select (store (arr!16819 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!555719 (= lt!252600 (toIndex!0 (select (arr!16819 a!3118) j!142) mask!3119))))

(assert (= (and start!50794 res!348126) b!555712))

(assert (= (and b!555712 res!348124) b!555716))

(assert (= (and b!555716 res!348129) b!555711))

(assert (= (and b!555711 res!348123) b!555713))

(assert (= (and b!555713 res!348128) b!555715))

(assert (= (and b!555715 res!348130) b!555714))

(assert (= (and b!555714 res!348125) b!555718))

(assert (= (and b!555718 res!348131) b!555719))

(assert (= (and b!555719 res!348127) b!555717))

(declare-fun m!533507 () Bool)

(assert (=> b!555719 m!533507))

(declare-fun m!533509 () Bool)

(assert (=> b!555719 m!533509))

(assert (=> b!555719 m!533507))

(declare-fun m!533511 () Bool)

(assert (=> b!555719 m!533511))

(assert (=> b!555719 m!533511))

(declare-fun m!533513 () Bool)

(assert (=> b!555719 m!533513))

(declare-fun m!533515 () Bool)

(assert (=> b!555719 m!533515))

(assert (=> b!555719 m!533511))

(declare-fun m!533517 () Bool)

(assert (=> b!555719 m!533517))

(assert (=> b!555719 m!533507))

(declare-fun m!533519 () Bool)

(assert (=> b!555719 m!533519))

(declare-fun m!533521 () Bool)

(assert (=> b!555713 m!533521))

(assert (=> b!555716 m!533507))

(assert (=> b!555716 m!533507))

(declare-fun m!533523 () Bool)

(assert (=> b!555716 m!533523))

(declare-fun m!533525 () Bool)

(assert (=> b!555715 m!533525))

(declare-fun m!533527 () Bool)

(assert (=> b!555714 m!533527))

(declare-fun m!533529 () Bool)

(assert (=> b!555718 m!533529))

(declare-fun m!533531 () Bool)

(assert (=> b!555711 m!533531))

(assert (=> b!555717 m!533507))

(declare-fun m!533533 () Bool)

(assert (=> b!555717 m!533533))

(declare-fun m!533535 () Bool)

(assert (=> b!555717 m!533535))

(declare-fun m!533537 () Bool)

(assert (=> b!555717 m!533537))

(assert (=> b!555717 m!533507))

(declare-fun m!533539 () Bool)

(assert (=> b!555717 m!533539))

(declare-fun m!533541 () Bool)

(assert (=> start!50794 m!533541))

(declare-fun m!533543 () Bool)

(assert (=> start!50794 m!533543))

(check-sat (not start!50794) (not b!555711) (not b!555714) (not b!555717) (not b!555719) (not b!555715) (not b!555713) (not b!555718) (not b!555716))
(check-sat)
