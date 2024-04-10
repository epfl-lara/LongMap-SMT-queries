; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50798 () Bool)

(assert start!50798)

(declare-fun b!555765 () Bool)

(declare-fun e!320283 () Bool)

(declare-fun e!320280 () Bool)

(assert (=> b!555765 (= e!320283 e!320280)))

(declare-fun res!348185 () Bool)

(assert (=> b!555765 (=> (not res!348185) (not e!320280))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!252636 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35023 0))(
  ( (array!35024 (arr!16821 (Array (_ BitVec 32) (_ BitVec 64))) (size!17185 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35023)

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5270 0))(
  ( (MissingZero!5270 (index!23307 (_ BitVec 32))) (Found!5270 (index!23308 (_ BitVec 32))) (Intermediate!5270 (undefined!6082 Bool) (index!23309 (_ BitVec 32)) (x!52208 (_ BitVec 32))) (Undefined!5270) (MissingVacant!5270 (index!23310 (_ BitVec 32))) )
))
(declare-fun lt!252637 () SeekEntryResult!5270)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35023 (_ BitVec 32)) SeekEntryResult!5270)

(assert (=> b!555765 (= res!348185 (= lt!252637 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252636 (select (store (arr!16821 a!3118) i!1132 k!1914) j!142) (array!35024 (store (arr!16821 a!3118) i!1132 k!1914) (size!17185 a!3118)) mask!3119)))))

(declare-fun lt!252635 () (_ BitVec 32))

(assert (=> b!555765 (= lt!252637 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252635 (select (arr!16821 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555765 (= lt!252636 (toIndex!0 (select (store (arr!16821 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!555765 (= lt!252635 (toIndex!0 (select (arr!16821 a!3118) j!142) mask!3119))))

(declare-fun res!348179 () Bool)

(declare-fun e!320281 () Bool)

(assert (=> start!50798 (=> (not res!348179) (not e!320281))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50798 (= res!348179 (validMask!0 mask!3119))))

(assert (=> start!50798 e!320281))

(assert (=> start!50798 true))

(declare-fun array_inv!12617 (array!35023) Bool)

(assert (=> start!50798 (array_inv!12617 a!3118)))

(declare-fun b!555766 () Bool)

(declare-fun res!348177 () Bool)

(assert (=> b!555766 (=> (not res!348177) (not e!320281))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555766 (= res!348177 (validKeyInArray!0 (select (arr!16821 a!3118) j!142)))))

(declare-fun b!555767 () Bool)

(assert (=> b!555767 (= e!320281 e!320283)))

(declare-fun res!348178 () Bool)

(assert (=> b!555767 (=> (not res!348178) (not e!320283))))

(declare-fun lt!252632 () SeekEntryResult!5270)

(assert (=> b!555767 (= res!348178 (or (= lt!252632 (MissingZero!5270 i!1132)) (= lt!252632 (MissingVacant!5270 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35023 (_ BitVec 32)) SeekEntryResult!5270)

(assert (=> b!555767 (= lt!252632 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!555768 () Bool)

(declare-fun res!348183 () Bool)

(assert (=> b!555768 (=> (not res!348183) (not e!320283))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35023 (_ BitVec 32)) Bool)

(assert (=> b!555768 (= res!348183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555769 () Bool)

(declare-fun res!348180 () Bool)

(assert (=> b!555769 (=> (not res!348180) (not e!320283))))

(declare-datatypes ((List!10901 0))(
  ( (Nil!10898) (Cons!10897 (h!11882 (_ BitVec 64)) (t!17129 List!10901)) )
))
(declare-fun arrayNoDuplicates!0 (array!35023 (_ BitVec 32) List!10901) Bool)

(assert (=> b!555769 (= res!348180 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10898))))

(declare-fun b!555770 () Bool)

(declare-fun res!348181 () Bool)

(assert (=> b!555770 (=> (not res!348181) (not e!320281))))

(declare-fun arrayContainsKey!0 (array!35023 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555770 (= res!348181 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555771 () Bool)

(assert (=> b!555771 (= e!320280 (not true))))

(declare-fun lt!252634 () SeekEntryResult!5270)

(assert (=> b!555771 (and (= lt!252634 (Found!5270 j!142)) (or (undefined!6082 lt!252637) (not (is-Intermediate!5270 lt!252637)) (= (select (arr!16821 a!3118) (index!23309 lt!252637)) (select (arr!16821 a!3118) j!142)) (not (= (select (arr!16821 a!3118) (index!23309 lt!252637)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252634 (MissingZero!5270 (index!23309 lt!252637)))))))

(assert (=> b!555771 (= lt!252634 (seekEntryOrOpen!0 (select (arr!16821 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!555771 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17314 0))(
  ( (Unit!17315) )
))
(declare-fun lt!252633 () Unit!17314)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35023 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17314)

(assert (=> b!555771 (= lt!252633 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555772 () Bool)

(declare-fun res!348184 () Bool)

(assert (=> b!555772 (=> (not res!348184) (not e!320281))))

(assert (=> b!555772 (= res!348184 (and (= (size!17185 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17185 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17185 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555773 () Bool)

(declare-fun res!348182 () Bool)

(assert (=> b!555773 (=> (not res!348182) (not e!320281))))

(assert (=> b!555773 (= res!348182 (validKeyInArray!0 k!1914))))

(assert (= (and start!50798 res!348179) b!555772))

(assert (= (and b!555772 res!348184) b!555766))

(assert (= (and b!555766 res!348177) b!555773))

(assert (= (and b!555773 res!348182) b!555770))

(assert (= (and b!555770 res!348181) b!555767))

(assert (= (and b!555767 res!348178) b!555768))

(assert (= (and b!555768 res!348183) b!555769))

(assert (= (and b!555769 res!348180) b!555765))

(assert (= (and b!555765 res!348185) b!555771))

(declare-fun m!533583 () Bool)

(assert (=> b!555773 m!533583))

(declare-fun m!533585 () Bool)

(assert (=> b!555767 m!533585))

(declare-fun m!533587 () Bool)

(assert (=> b!555768 m!533587))

(declare-fun m!533589 () Bool)

(assert (=> b!555766 m!533589))

(assert (=> b!555766 m!533589))

(declare-fun m!533591 () Bool)

(assert (=> b!555766 m!533591))

(declare-fun m!533593 () Bool)

(assert (=> b!555769 m!533593))

(declare-fun m!533595 () Bool)

(assert (=> b!555770 m!533595))

(declare-fun m!533597 () Bool)

(assert (=> start!50798 m!533597))

(declare-fun m!533599 () Bool)

(assert (=> start!50798 m!533599))

(assert (=> b!555771 m!533589))

(declare-fun m!533601 () Bool)

(assert (=> b!555771 m!533601))

(declare-fun m!533603 () Bool)

(assert (=> b!555771 m!533603))

(declare-fun m!533605 () Bool)

(assert (=> b!555771 m!533605))

(assert (=> b!555771 m!533589))

(declare-fun m!533607 () Bool)

(assert (=> b!555771 m!533607))

(assert (=> b!555765 m!533589))

(declare-fun m!533609 () Bool)

(assert (=> b!555765 m!533609))

(declare-fun m!533611 () Bool)

(assert (=> b!555765 m!533611))

(declare-fun m!533613 () Bool)

(assert (=> b!555765 m!533613))

(assert (=> b!555765 m!533589))

(assert (=> b!555765 m!533611))

(declare-fun m!533615 () Bool)

(assert (=> b!555765 m!533615))

(assert (=> b!555765 m!533589))

(declare-fun m!533617 () Bool)

(assert (=> b!555765 m!533617))

(assert (=> b!555765 m!533611))

(declare-fun m!533619 () Bool)

(assert (=> b!555765 m!533619))

(push 1)

