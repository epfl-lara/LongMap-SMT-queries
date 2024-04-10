; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50494 () Bool)

(assert start!50494)

(declare-fun b!551924 () Bool)

(declare-fun res!344528 () Bool)

(declare-fun e!318523 () Bool)

(assert (=> b!551924 (=> (not res!344528) (not e!318523))))

(declare-datatypes ((array!34776 0))(
  ( (array!34777 (arr!16699 (Array (_ BitVec 32) (_ BitVec 64))) (size!17063 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34776)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34776 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!551924 (= res!344528 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!318524 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!551925 () Bool)

(declare-datatypes ((SeekEntryResult!5148 0))(
  ( (MissingZero!5148 (index!22819 (_ BitVec 32))) (Found!5148 (index!22820 (_ BitVec 32))) (Intermediate!5148 (undefined!5960 Bool) (index!22821 (_ BitVec 32)) (x!51752 (_ BitVec 32))) (Undefined!5148) (MissingVacant!5148 (index!22822 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34776 (_ BitVec 32)) SeekEntryResult!5148)

(assert (=> b!551925 (= e!318524 (= (seekEntryOrOpen!0 (select (arr!16699 a!3118) j!142) a!3118 mask!3119) (Found!5148 j!142)))))

(declare-fun b!551926 () Bool)

(declare-fun res!344523 () Bool)

(assert (=> b!551926 (=> (not res!344523) (not e!318523))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!551926 (= res!344523 (and (= (size!17063 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17063 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17063 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!551927 () Bool)

(declare-fun res!344522 () Bool)

(declare-fun e!318522 () Bool)

(assert (=> b!551927 (=> (not res!344522) (not e!318522))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34776 (_ BitVec 32)) Bool)

(assert (=> b!551927 (= res!344522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!551928 () Bool)

(declare-fun res!344526 () Bool)

(assert (=> b!551928 (=> (not res!344526) (not e!318522))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34776 (_ BitVec 32)) SeekEntryResult!5148)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551928 (= res!344526 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16699 a!3118) j!142) mask!3119) (select (arr!16699 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16699 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16699 a!3118) i!1132 k0!1914) j!142) (array!34777 (store (arr!16699 a!3118) i!1132 k0!1914) (size!17063 a!3118)) mask!3119)))))

(declare-fun b!551929 () Bool)

(declare-fun res!344525 () Bool)

(assert (=> b!551929 (=> (not res!344525) (not e!318523))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!551929 (= res!344525 (validKeyInArray!0 k0!1914))))

(declare-fun res!344520 () Bool)

(assert (=> start!50494 (=> (not res!344520) (not e!318523))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50494 (= res!344520 (validMask!0 mask!3119))))

(assert (=> start!50494 e!318523))

(assert (=> start!50494 true))

(declare-fun array_inv!12495 (array!34776) Bool)

(assert (=> start!50494 (array_inv!12495 a!3118)))

(declare-fun b!551930 () Bool)

(assert (=> b!551930 (= e!318523 e!318522)))

(declare-fun res!344521 () Bool)

(assert (=> b!551930 (=> (not res!344521) (not e!318522))))

(declare-fun lt!250999 () SeekEntryResult!5148)

(assert (=> b!551930 (= res!344521 (or (= lt!250999 (MissingZero!5148 i!1132)) (= lt!250999 (MissingVacant!5148 i!1132))))))

(assert (=> b!551930 (= lt!250999 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!551931 () Bool)

(declare-fun res!344524 () Bool)

(assert (=> b!551931 (=> (not res!344524) (not e!318522))))

(declare-datatypes ((List!10779 0))(
  ( (Nil!10776) (Cons!10775 (h!11757 (_ BitVec 64)) (t!17007 List!10779)) )
))
(declare-fun arrayNoDuplicates!0 (array!34776 (_ BitVec 32) List!10779) Bool)

(assert (=> b!551931 (= res!344524 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10776))))

(declare-fun b!551932 () Bool)

(assert (=> b!551932 (= e!318522 (not true))))

(assert (=> b!551932 e!318524))

(declare-fun res!344519 () Bool)

(assert (=> b!551932 (=> (not res!344519) (not e!318524))))

(assert (=> b!551932 (= res!344519 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17070 0))(
  ( (Unit!17071) )
))
(declare-fun lt!250998 () Unit!17070)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34776 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17070)

(assert (=> b!551932 (= lt!250998 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!551933 () Bool)

(declare-fun res!344527 () Bool)

(assert (=> b!551933 (=> (not res!344527) (not e!318523))))

(assert (=> b!551933 (= res!344527 (validKeyInArray!0 (select (arr!16699 a!3118) j!142)))))

(assert (= (and start!50494 res!344520) b!551926))

(assert (= (and b!551926 res!344523) b!551933))

(assert (= (and b!551933 res!344527) b!551929))

(assert (= (and b!551929 res!344525) b!551924))

(assert (= (and b!551924 res!344528) b!551930))

(assert (= (and b!551930 res!344521) b!551927))

(assert (= (and b!551927 res!344522) b!551931))

(assert (= (and b!551931 res!344524) b!551928))

(assert (= (and b!551928 res!344526) b!551932))

(assert (= (and b!551932 res!344519) b!551925))

(declare-fun m!528855 () Bool)

(assert (=> start!50494 m!528855))

(declare-fun m!528857 () Bool)

(assert (=> start!50494 m!528857))

(declare-fun m!528859 () Bool)

(assert (=> b!551929 m!528859))

(declare-fun m!528861 () Bool)

(assert (=> b!551932 m!528861))

(declare-fun m!528863 () Bool)

(assert (=> b!551932 m!528863))

(declare-fun m!528865 () Bool)

(assert (=> b!551928 m!528865))

(declare-fun m!528867 () Bool)

(assert (=> b!551928 m!528867))

(assert (=> b!551928 m!528865))

(declare-fun m!528869 () Bool)

(assert (=> b!551928 m!528869))

(declare-fun m!528871 () Bool)

(assert (=> b!551928 m!528871))

(assert (=> b!551928 m!528869))

(declare-fun m!528873 () Bool)

(assert (=> b!551928 m!528873))

(assert (=> b!551928 m!528867))

(assert (=> b!551928 m!528865))

(declare-fun m!528875 () Bool)

(assert (=> b!551928 m!528875))

(declare-fun m!528877 () Bool)

(assert (=> b!551928 m!528877))

(assert (=> b!551928 m!528869))

(assert (=> b!551928 m!528871))

(declare-fun m!528879 () Bool)

(assert (=> b!551927 m!528879))

(assert (=> b!551933 m!528865))

(assert (=> b!551933 m!528865))

(declare-fun m!528881 () Bool)

(assert (=> b!551933 m!528881))

(declare-fun m!528883 () Bool)

(assert (=> b!551924 m!528883))

(assert (=> b!551925 m!528865))

(assert (=> b!551925 m!528865))

(declare-fun m!528885 () Bool)

(assert (=> b!551925 m!528885))

(declare-fun m!528887 () Bool)

(assert (=> b!551930 m!528887))

(declare-fun m!528889 () Bool)

(assert (=> b!551931 m!528889))

(check-sat (not start!50494) (not b!551933) (not b!551927) (not b!551931) (not b!551924) (not b!551929) (not b!551932) (not b!551925) (not b!551928) (not b!551930))
(check-sat)
