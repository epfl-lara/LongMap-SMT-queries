; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51366 () Bool)

(assert start!51366)

(declare-fun b!560828 () Bool)

(declare-fun e!323145 () Bool)

(declare-fun e!323150 () Bool)

(assert (=> b!560828 (= e!323145 e!323150)))

(declare-fun res!351989 () Bool)

(assert (=> b!560828 (=> res!351989 e!323150)))

(declare-datatypes ((SeekEntryResult!5365 0))(
  ( (MissingZero!5365 (index!23687 (_ BitVec 32))) (Found!5365 (index!23688 (_ BitVec 32))) (Intermediate!5365 (undefined!6177 Bool) (index!23689 (_ BitVec 32)) (x!52596 (_ BitVec 32))) (Undefined!5365) (MissingVacant!5365 (index!23690 (_ BitVec 32))) )
))
(declare-fun lt!255090 () SeekEntryResult!5365)

(assert (=> b!560828 (= res!351989 (or (undefined!6177 lt!255090) (not (is-Intermediate!5365 lt!255090))))))

(declare-fun b!560829 () Bool)

(declare-fun res!351985 () Bool)

(declare-fun e!323151 () Bool)

(assert (=> b!560829 (=> (not res!351985) (not e!323151))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35231 0))(
  ( (array!35232 (arr!16916 (Array (_ BitVec 32) (_ BitVec 64))) (size!17280 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35231)

(declare-fun mask!3119 () (_ BitVec 32))

(assert (=> b!560829 (= res!351985 (and (= (size!17280 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17280 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17280 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560830 () Bool)

(declare-fun res!351986 () Bool)

(declare-fun e!323148 () Bool)

(assert (=> b!560830 (=> (not res!351986) (not e!323148))))

(declare-datatypes ((List!10996 0))(
  ( (Nil!10993) (Cons!10992 (h!11995 (_ BitVec 64)) (t!17224 List!10996)) )
))
(declare-fun arrayNoDuplicates!0 (array!35231 (_ BitVec 32) List!10996) Bool)

(assert (=> b!560830 (= res!351986 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10993))))

(declare-fun b!560831 () Bool)

(assert (=> b!560831 (= e!323151 e!323148)))

(declare-fun res!351987 () Bool)

(assert (=> b!560831 (=> (not res!351987) (not e!323148))))

(declare-fun lt!255094 () SeekEntryResult!5365)

(assert (=> b!560831 (= res!351987 (or (= lt!255094 (MissingZero!5365 i!1132)) (= lt!255094 (MissingVacant!5365 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35231 (_ BitVec 32)) SeekEntryResult!5365)

(assert (=> b!560831 (= lt!255094 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!560832 () Bool)

(declare-fun res!351982 () Bool)

(assert (=> b!560832 (=> (not res!351982) (not e!323151))))

(declare-fun arrayContainsKey!0 (array!35231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560832 (= res!351982 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560833 () Bool)

(declare-fun e!323146 () Bool)

(assert (=> b!560833 (= e!323146 (not true))))

(assert (=> b!560833 e!323145))

(declare-fun res!351981 () Bool)

(assert (=> b!560833 (=> (not res!351981) (not e!323145))))

(declare-fun lt!255086 () SeekEntryResult!5365)

(assert (=> b!560833 (= res!351981 (= lt!255086 (Found!5365 j!142)))))

(assert (=> b!560833 (= lt!255086 (seekEntryOrOpen!0 (select (arr!16916 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35231 (_ BitVec 32)) Bool)

(assert (=> b!560833 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17504 0))(
  ( (Unit!17505) )
))
(declare-fun lt!255087 () Unit!17504)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35231 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17504)

(assert (=> b!560833 (= lt!255087 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560835 () Bool)

(declare-fun lt!255092 () (_ BitVec 64))

(declare-fun lt!255093 () array!35231)

(declare-fun e!323147 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35231 (_ BitVec 32)) SeekEntryResult!5365)

(assert (=> b!560835 (= e!323147 (= (seekEntryOrOpen!0 lt!255092 lt!255093 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52596 lt!255090) (index!23689 lt!255090) (index!23689 lt!255090) lt!255092 lt!255093 mask!3119)))))

(declare-fun b!560836 () Bool)

(declare-fun res!351980 () Bool)

(assert (=> b!560836 (=> (not res!351980) (not e!323151))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560836 (= res!351980 (validKeyInArray!0 k!1914))))

(declare-fun b!560837 () Bool)

(declare-fun res!351984 () Bool)

(assert (=> b!560837 (=> (not res!351984) (not e!323148))))

(assert (=> b!560837 (= res!351984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560838 () Bool)

(declare-fun res!351991 () Bool)

(assert (=> b!560838 (=> (not res!351991) (not e!323151))))

(assert (=> b!560838 (= res!351991 (validKeyInArray!0 (select (arr!16916 a!3118) j!142)))))

(declare-fun b!560839 () Bool)

(declare-fun e!323149 () Bool)

(assert (=> b!560839 (= e!323150 e!323149)))

(declare-fun res!351983 () Bool)

(assert (=> b!560839 (=> res!351983 e!323149)))

(declare-fun lt!255091 () (_ BitVec 64))

(assert (=> b!560839 (= res!351983 (or (= lt!255091 (select (arr!16916 a!3118) j!142)) (= lt!255091 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560839 (= lt!255091 (select (arr!16916 a!3118) (index!23689 lt!255090)))))

(declare-fun b!560840 () Bool)

(assert (=> b!560840 (= e!323148 e!323146)))

(declare-fun res!351990 () Bool)

(assert (=> b!560840 (=> (not res!351990) (not e!323146))))

(declare-fun lt!255088 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35231 (_ BitVec 32)) SeekEntryResult!5365)

(assert (=> b!560840 (= res!351990 (= lt!255090 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255088 lt!255092 lt!255093 mask!3119)))))

(declare-fun lt!255089 () (_ BitVec 32))

(assert (=> b!560840 (= lt!255090 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255089 (select (arr!16916 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560840 (= lt!255088 (toIndex!0 lt!255092 mask!3119))))

(assert (=> b!560840 (= lt!255092 (select (store (arr!16916 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!560840 (= lt!255089 (toIndex!0 (select (arr!16916 a!3118) j!142) mask!3119))))

(assert (=> b!560840 (= lt!255093 (array!35232 (store (arr!16916 a!3118) i!1132 k!1914) (size!17280 a!3118)))))

(declare-fun b!560834 () Bool)

(assert (=> b!560834 (= e!323149 e!323147)))

(declare-fun res!351992 () Bool)

(assert (=> b!560834 (=> (not res!351992) (not e!323147))))

(assert (=> b!560834 (= res!351992 (= lt!255086 (seekKeyOrZeroReturnVacant!0 (x!52596 lt!255090) (index!23689 lt!255090) (index!23689 lt!255090) (select (arr!16916 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun res!351988 () Bool)

(assert (=> start!51366 (=> (not res!351988) (not e!323151))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51366 (= res!351988 (validMask!0 mask!3119))))

(assert (=> start!51366 e!323151))

(assert (=> start!51366 true))

(declare-fun array_inv!12712 (array!35231) Bool)

(assert (=> start!51366 (array_inv!12712 a!3118)))

(assert (= (and start!51366 res!351988) b!560829))

(assert (= (and b!560829 res!351985) b!560838))

(assert (= (and b!560838 res!351991) b!560836))

(assert (= (and b!560836 res!351980) b!560832))

(assert (= (and b!560832 res!351982) b!560831))

(assert (= (and b!560831 res!351987) b!560837))

(assert (= (and b!560837 res!351984) b!560830))

(assert (= (and b!560830 res!351986) b!560840))

(assert (= (and b!560840 res!351990) b!560833))

(assert (= (and b!560833 res!351981) b!560828))

(assert (= (and b!560828 (not res!351989)) b!560839))

(assert (= (and b!560839 (not res!351983)) b!560834))

(assert (= (and b!560834 res!351992) b!560835))

(declare-fun m!538645 () Bool)

(assert (=> start!51366 m!538645))

(declare-fun m!538647 () Bool)

(assert (=> start!51366 m!538647))

(declare-fun m!538649 () Bool)

(assert (=> b!560834 m!538649))

(assert (=> b!560834 m!538649))

(declare-fun m!538651 () Bool)

(assert (=> b!560834 m!538651))

(declare-fun m!538653 () Bool)

(assert (=> b!560830 m!538653))

(declare-fun m!538655 () Bool)

(assert (=> b!560837 m!538655))

(declare-fun m!538657 () Bool)

(assert (=> b!560836 m!538657))

(assert (=> b!560839 m!538649))

(declare-fun m!538659 () Bool)

(assert (=> b!560839 m!538659))

(declare-fun m!538661 () Bool)

(assert (=> b!560840 m!538661))

(assert (=> b!560840 m!538649))

(declare-fun m!538663 () Bool)

(assert (=> b!560840 m!538663))

(declare-fun m!538665 () Bool)

(assert (=> b!560840 m!538665))

(assert (=> b!560840 m!538649))

(declare-fun m!538667 () Bool)

(assert (=> b!560840 m!538667))

(assert (=> b!560840 m!538649))

(declare-fun m!538669 () Bool)

(assert (=> b!560840 m!538669))

(declare-fun m!538671 () Bool)

(assert (=> b!560840 m!538671))

(declare-fun m!538673 () Bool)

(assert (=> b!560832 m!538673))

(declare-fun m!538675 () Bool)

(assert (=> b!560831 m!538675))

(assert (=> b!560833 m!538649))

(assert (=> b!560833 m!538649))

(declare-fun m!538677 () Bool)

(assert (=> b!560833 m!538677))

(declare-fun m!538679 () Bool)

(assert (=> b!560833 m!538679))

(declare-fun m!538681 () Bool)

(assert (=> b!560833 m!538681))

(assert (=> b!560838 m!538649))

(assert (=> b!560838 m!538649))

(declare-fun m!538683 () Bool)

(assert (=> b!560838 m!538683))

(declare-fun m!538685 () Bool)

(assert (=> b!560835 m!538685))

(declare-fun m!538687 () Bool)

(assert (=> b!560835 m!538687))

(push 1)

