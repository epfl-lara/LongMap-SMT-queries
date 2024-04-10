; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51062 () Bool)

(assert start!51062)

(declare-fun b!557884 () Bool)

(declare-fun e!321391 () Bool)

(declare-fun e!321394 () Bool)

(assert (=> b!557884 (= e!321391 e!321394)))

(declare-fun res!349756 () Bool)

(assert (=> b!557884 (=> (not res!349756) (not e!321394))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun lt!253480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5312 0))(
  ( (MissingZero!5312 (index!23475 (_ BitVec 32))) (Found!5312 (index!23476 (_ BitVec 32))) (Intermediate!5312 (undefined!6124 Bool) (index!23477 (_ BitVec 32)) (x!52380 (_ BitVec 32))) (Undefined!5312) (MissingVacant!5312 (index!23478 (_ BitVec 32))) )
))
(declare-fun lt!253483 () SeekEntryResult!5312)

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35116 0))(
  ( (array!35117 (arr!16863 (Array (_ BitVec 32) (_ BitVec 64))) (size!17227 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35116)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35116 (_ BitVec 32)) SeekEntryResult!5312)

(assert (=> b!557884 (= res!349756 (= lt!253483 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253480 (select (store (arr!16863 a!3118) i!1132 k!1914) j!142) (array!35117 (store (arr!16863 a!3118) i!1132 k!1914) (size!17227 a!3118)) mask!3119)))))

(declare-fun lt!253478 () (_ BitVec 32))

(assert (=> b!557884 (= lt!253483 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253478 (select (arr!16863 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557884 (= lt!253480 (toIndex!0 (select (store (arr!16863 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!557884 (= lt!253478 (toIndex!0 (select (arr!16863 a!3118) j!142) mask!3119))))

(declare-fun b!557885 () Bool)

(assert (=> b!557885 (= e!321394 (not true))))

(declare-fun e!321396 () Bool)

(assert (=> b!557885 e!321396))

(declare-fun res!349748 () Bool)

(assert (=> b!557885 (=> (not res!349748) (not e!321396))))

(declare-fun lt!253481 () SeekEntryResult!5312)

(assert (=> b!557885 (= res!349748 (= lt!253481 (Found!5312 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35116 (_ BitVec 32)) SeekEntryResult!5312)

(assert (=> b!557885 (= lt!253481 (seekEntryOrOpen!0 (select (arr!16863 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35116 (_ BitVec 32)) Bool)

(assert (=> b!557885 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17398 0))(
  ( (Unit!17399) )
))
(declare-fun lt!253482 () Unit!17398)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35116 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17398)

(assert (=> b!557885 (= lt!253482 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!557886 () Bool)

(declare-fun res!349750 () Bool)

(declare-fun e!321395 () Bool)

(assert (=> b!557886 (=> (not res!349750) (not e!321395))))

(assert (=> b!557886 (= res!349750 (and (= (size!17227 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17227 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17227 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!557887 () Bool)

(declare-fun res!349747 () Bool)

(assert (=> b!557887 (=> (not res!349747) (not e!321391))))

(assert (=> b!557887 (= res!349747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun e!321392 () Bool)

(declare-fun b!557888 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35116 (_ BitVec 32)) SeekEntryResult!5312)

(assert (=> b!557888 (= e!321392 (= lt!253481 (seekKeyOrZeroReturnVacant!0 (x!52380 lt!253483) (index!23477 lt!253483) (index!23477 lt!253483) (select (arr!16863 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!557889 () Bool)

(assert (=> b!557889 (= e!321396 e!321392)))

(declare-fun res!349753 () Bool)

(assert (=> b!557889 (=> res!349753 e!321392)))

(assert (=> b!557889 (= res!349753 (or (undefined!6124 lt!253483) (not (is-Intermediate!5312 lt!253483)) (= (select (arr!16863 a!3118) (index!23477 lt!253483)) (select (arr!16863 a!3118) j!142)) (= (select (arr!16863 a!3118) (index!23477 lt!253483)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!349755 () Bool)

(assert (=> start!51062 (=> (not res!349755) (not e!321395))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51062 (= res!349755 (validMask!0 mask!3119))))

(assert (=> start!51062 e!321395))

(assert (=> start!51062 true))

(declare-fun array_inv!12659 (array!35116) Bool)

(assert (=> start!51062 (array_inv!12659 a!3118)))

(declare-fun b!557890 () Bool)

(declare-fun res!349757 () Bool)

(assert (=> b!557890 (=> (not res!349757) (not e!321395))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!557890 (= res!349757 (validKeyInArray!0 (select (arr!16863 a!3118) j!142)))))

(declare-fun b!557891 () Bool)

(declare-fun res!349749 () Bool)

(assert (=> b!557891 (=> (not res!349749) (not e!321391))))

(declare-datatypes ((List!10943 0))(
  ( (Nil!10940) (Cons!10939 (h!11933 (_ BitVec 64)) (t!17171 List!10943)) )
))
(declare-fun arrayNoDuplicates!0 (array!35116 (_ BitVec 32) List!10943) Bool)

(assert (=> b!557891 (= res!349749 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10940))))

(declare-fun b!557892 () Bool)

(assert (=> b!557892 (= e!321395 e!321391)))

(declare-fun res!349754 () Bool)

(assert (=> b!557892 (=> (not res!349754) (not e!321391))))

(declare-fun lt!253479 () SeekEntryResult!5312)

(assert (=> b!557892 (= res!349754 (or (= lt!253479 (MissingZero!5312 i!1132)) (= lt!253479 (MissingVacant!5312 i!1132))))))

(assert (=> b!557892 (= lt!253479 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!557893 () Bool)

(declare-fun res!349752 () Bool)

(assert (=> b!557893 (=> (not res!349752) (not e!321395))))

(declare-fun arrayContainsKey!0 (array!35116 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!557893 (= res!349752 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!557894 () Bool)

(declare-fun res!349751 () Bool)

(assert (=> b!557894 (=> (not res!349751) (not e!321395))))

(assert (=> b!557894 (= res!349751 (validKeyInArray!0 k!1914))))

(assert (= (and start!51062 res!349755) b!557886))

(assert (= (and b!557886 res!349750) b!557890))

(assert (= (and b!557890 res!349757) b!557894))

(assert (= (and b!557894 res!349751) b!557893))

(assert (= (and b!557893 res!349752) b!557892))

(assert (= (and b!557892 res!349754) b!557887))

(assert (= (and b!557887 res!349747) b!557891))

(assert (= (and b!557891 res!349749) b!557884))

(assert (= (and b!557884 res!349756) b!557885))

(assert (= (and b!557885 res!349748) b!557889))

(assert (= (and b!557889 (not res!349753)) b!557888))

(declare-fun m!535749 () Bool)

(assert (=> b!557889 m!535749))

(declare-fun m!535751 () Bool)

(assert (=> b!557889 m!535751))

(declare-fun m!535753 () Bool)

(assert (=> b!557892 m!535753))

(declare-fun m!535755 () Bool)

(assert (=> b!557891 m!535755))

(assert (=> b!557888 m!535751))

(assert (=> b!557888 m!535751))

(declare-fun m!535757 () Bool)

(assert (=> b!557888 m!535757))

(declare-fun m!535759 () Bool)

(assert (=> b!557887 m!535759))

(assert (=> b!557885 m!535751))

(assert (=> b!557885 m!535751))

(declare-fun m!535761 () Bool)

(assert (=> b!557885 m!535761))

(declare-fun m!535763 () Bool)

(assert (=> b!557885 m!535763))

(declare-fun m!535765 () Bool)

(assert (=> b!557885 m!535765))

(declare-fun m!535767 () Bool)

(assert (=> start!51062 m!535767))

(declare-fun m!535769 () Bool)

(assert (=> start!51062 m!535769))

(assert (=> b!557890 m!535751))

(assert (=> b!557890 m!535751))

(declare-fun m!535771 () Bool)

(assert (=> b!557890 m!535771))

(assert (=> b!557884 m!535751))

(declare-fun m!535773 () Bool)

(assert (=> b!557884 m!535773))

(assert (=> b!557884 m!535751))

(assert (=> b!557884 m!535751))

(declare-fun m!535775 () Bool)

(assert (=> b!557884 m!535775))

(declare-fun m!535777 () Bool)

(assert (=> b!557884 m!535777))

(declare-fun m!535779 () Bool)

(assert (=> b!557884 m!535779))

(assert (=> b!557884 m!535777))

(declare-fun m!535781 () Bool)

(assert (=> b!557884 m!535781))

(assert (=> b!557884 m!535777))

(declare-fun m!535783 () Bool)

(assert (=> b!557884 m!535783))

(declare-fun m!535785 () Bool)

(assert (=> b!557893 m!535785))

(declare-fun m!535787 () Bool)

(assert (=> b!557894 m!535787))

(push 1)

