; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52446 () Bool)

(assert start!52446)

(declare-fun b!572660 () Bool)

(declare-fun e!329411 () Bool)

(declare-fun e!329416 () Bool)

(assert (=> b!572660 (= e!329411 e!329416)))

(declare-fun res!362170 () Bool)

(assert (=> b!572660 (=> res!362170 e!329416)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!261392 () (_ BitVec 64))

(declare-datatypes ((array!35843 0))(
  ( (array!35844 (arr!17210 (Array (_ BitVec 32) (_ BitVec 64))) (size!17574 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35843)

(assert (=> b!572660 (= res!362170 (or (= lt!261392 (select (arr!17210 a!3118) j!142)) (= lt!261392 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!5659 0))(
  ( (MissingZero!5659 (index!24863 (_ BitVec 32))) (Found!5659 (index!24864 (_ BitVec 32))) (Intermediate!5659 (undefined!6471 Bool) (index!24865 (_ BitVec 32)) (x!53728 (_ BitVec 32))) (Undefined!5659) (MissingVacant!5659 (index!24866 (_ BitVec 32))) )
))
(declare-fun lt!261397 () SeekEntryResult!5659)

(assert (=> b!572660 (= lt!261392 (select (arr!17210 a!3118) (index!24865 lt!261397)))))

(declare-fun b!572661 () Bool)

(declare-fun res!362171 () Bool)

(declare-fun e!329413 () Bool)

(assert (=> b!572661 (=> (not res!362171) (not e!329413))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35843 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572661 (= res!362171 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun lt!261390 () (_ BitVec 64))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!572662 () Bool)

(declare-fun lt!261393 () array!35843)

(declare-fun e!329412 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35843 (_ BitVec 32)) SeekEntryResult!5659)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35843 (_ BitVec 32)) SeekEntryResult!5659)

(assert (=> b!572662 (= e!329412 (= (seekEntryOrOpen!0 lt!261390 lt!261393 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53728 lt!261397) (index!24865 lt!261397) (index!24865 lt!261397) lt!261390 lt!261393 mask!3119)))))

(declare-fun b!572663 () Bool)

(declare-fun res!362175 () Bool)

(assert (=> b!572663 (=> (not res!362175) (not e!329413))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!572663 (= res!362175 (and (= (size!17574 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17574 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17574 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!572664 () Bool)

(declare-fun e!329414 () Bool)

(assert (=> b!572664 (= e!329414 e!329411)))

(declare-fun res!362168 () Bool)

(assert (=> b!572664 (=> res!362168 e!329411)))

(assert (=> b!572664 (= res!362168 (or (undefined!6471 lt!261397) (not (is-Intermediate!5659 lt!261397))))))

(declare-fun b!572665 () Bool)

(assert (=> b!572665 (= e!329416 e!329412)))

(declare-fun res!362178 () Bool)

(assert (=> b!572665 (=> (not res!362178) (not e!329412))))

(declare-fun lt!261394 () SeekEntryResult!5659)

(assert (=> b!572665 (= res!362178 (= lt!261394 (seekKeyOrZeroReturnVacant!0 (x!53728 lt!261397) (index!24865 lt!261397) (index!24865 lt!261397) (select (arr!17210 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!572666 () Bool)

(declare-fun e!329415 () Bool)

(assert (=> b!572666 (= e!329413 e!329415)))

(declare-fun res!362172 () Bool)

(assert (=> b!572666 (=> (not res!362172) (not e!329415))))

(declare-fun lt!261389 () SeekEntryResult!5659)

(assert (=> b!572666 (= res!362172 (or (= lt!261389 (MissingZero!5659 i!1132)) (= lt!261389 (MissingVacant!5659 i!1132))))))

(assert (=> b!572666 (= lt!261389 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!572667 () Bool)

(declare-fun res!362169 () Bool)

(assert (=> b!572667 (=> (not res!362169) (not e!329413))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572667 (= res!362169 (validKeyInArray!0 k!1914))))

(declare-fun b!572668 () Bool)

(declare-fun res!362173 () Bool)

(assert (=> b!572668 (=> (not res!362173) (not e!329415))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35843 (_ BitVec 32)) Bool)

(assert (=> b!572668 (= res!362173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!572669 () Bool)

(declare-fun e!329418 () Bool)

(assert (=> b!572669 (= e!329415 e!329418)))

(declare-fun res!362179 () Bool)

(assert (=> b!572669 (=> (not res!362179) (not e!329418))))

(declare-fun lt!261391 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35843 (_ BitVec 32)) SeekEntryResult!5659)

(assert (=> b!572669 (= res!362179 (= lt!261397 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261391 lt!261390 lt!261393 mask!3119)))))

(declare-fun lt!261395 () (_ BitVec 32))

(assert (=> b!572669 (= lt!261397 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261395 (select (arr!17210 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572669 (= lt!261391 (toIndex!0 lt!261390 mask!3119))))

(assert (=> b!572669 (= lt!261390 (select (store (arr!17210 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!572669 (= lt!261395 (toIndex!0 (select (arr!17210 a!3118) j!142) mask!3119))))

(assert (=> b!572669 (= lt!261393 (array!35844 (store (arr!17210 a!3118) i!1132 k!1914) (size!17574 a!3118)))))

(declare-fun b!572670 () Bool)

(assert (=> b!572670 (= e!329418 (not true))))

(assert (=> b!572670 e!329414))

(declare-fun res!362176 () Bool)

(assert (=> b!572670 (=> (not res!362176) (not e!329414))))

(assert (=> b!572670 (= res!362176 (= lt!261394 (Found!5659 j!142)))))

(assert (=> b!572670 (= lt!261394 (seekEntryOrOpen!0 (select (arr!17210 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!572670 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18020 0))(
  ( (Unit!18021) )
))
(declare-fun lt!261396 () Unit!18020)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35843 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18020)

(assert (=> b!572670 (= lt!261396 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!572671 () Bool)

(declare-fun res!362180 () Bool)

(assert (=> b!572671 (=> (not res!362180) (not e!329413))))

(assert (=> b!572671 (= res!362180 (validKeyInArray!0 (select (arr!17210 a!3118) j!142)))))

(declare-fun res!362174 () Bool)

(assert (=> start!52446 (=> (not res!362174) (not e!329413))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52446 (= res!362174 (validMask!0 mask!3119))))

(assert (=> start!52446 e!329413))

(assert (=> start!52446 true))

(declare-fun array_inv!13006 (array!35843) Bool)

(assert (=> start!52446 (array_inv!13006 a!3118)))

(declare-fun b!572672 () Bool)

(declare-fun res!362177 () Bool)

(assert (=> b!572672 (=> (not res!362177) (not e!329415))))

(declare-datatypes ((List!11290 0))(
  ( (Nil!11287) (Cons!11286 (h!12313 (_ BitVec 64)) (t!17518 List!11290)) )
))
(declare-fun arrayNoDuplicates!0 (array!35843 (_ BitVec 32) List!11290) Bool)

(assert (=> b!572672 (= res!362177 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11287))))

(assert (= (and start!52446 res!362174) b!572663))

(assert (= (and b!572663 res!362175) b!572671))

(assert (= (and b!572671 res!362180) b!572667))

(assert (= (and b!572667 res!362169) b!572661))

(assert (= (and b!572661 res!362171) b!572666))

(assert (= (and b!572666 res!362172) b!572668))

(assert (= (and b!572668 res!362173) b!572672))

(assert (= (and b!572672 res!362177) b!572669))

(assert (= (and b!572669 res!362179) b!572670))

(assert (= (and b!572670 res!362176) b!572664))

(assert (= (and b!572664 (not res!362168)) b!572660))

(assert (= (and b!572660 (not res!362170)) b!572665))

(assert (= (and b!572665 res!362178) b!572662))

(declare-fun m!551665 () Bool)

(assert (=> b!572662 m!551665))

(declare-fun m!551667 () Bool)

(assert (=> b!572662 m!551667))

(declare-fun m!551669 () Bool)

(assert (=> b!572670 m!551669))

(assert (=> b!572670 m!551669))

(declare-fun m!551671 () Bool)

(assert (=> b!572670 m!551671))

(declare-fun m!551673 () Bool)

(assert (=> b!572670 m!551673))

(declare-fun m!551675 () Bool)

(assert (=> b!572670 m!551675))

(assert (=> b!572660 m!551669))

(declare-fun m!551677 () Bool)

(assert (=> b!572660 m!551677))

(assert (=> b!572669 m!551669))

(declare-fun m!551679 () Bool)

(assert (=> b!572669 m!551679))

(assert (=> b!572669 m!551669))

(declare-fun m!551681 () Bool)

(assert (=> b!572669 m!551681))

(declare-fun m!551683 () Bool)

(assert (=> b!572669 m!551683))

(assert (=> b!572669 m!551669))

(declare-fun m!551685 () Bool)

(assert (=> b!572669 m!551685))

(declare-fun m!551687 () Bool)

(assert (=> b!572669 m!551687))

(declare-fun m!551689 () Bool)

(assert (=> b!572669 m!551689))

(declare-fun m!551691 () Bool)

(assert (=> b!572661 m!551691))

(declare-fun m!551693 () Bool)

(assert (=> b!572667 m!551693))

(declare-fun m!551695 () Bool)

(assert (=> b!572672 m!551695))

(assert (=> b!572665 m!551669))

(assert (=> b!572665 m!551669))

(declare-fun m!551697 () Bool)

(assert (=> b!572665 m!551697))

(declare-fun m!551699 () Bool)

(assert (=> b!572668 m!551699))

(assert (=> b!572671 m!551669))

(assert (=> b!572671 m!551669))

(declare-fun m!551701 () Bool)

(assert (=> b!572671 m!551701))

(declare-fun m!551703 () Bool)

(assert (=> b!572666 m!551703))

(declare-fun m!551705 () Bool)

(assert (=> start!52446 m!551705))

(declare-fun m!551707 () Bool)

(assert (=> start!52446 m!551707))

(push 1)

