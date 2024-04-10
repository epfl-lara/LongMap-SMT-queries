; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50600 () Bool)

(assert start!50600)

(declare-fun b!552914 () Bool)

(declare-fun res!345334 () Bool)

(declare-fun e!319020 () Bool)

(assert (=> b!552914 (=> (not res!345334) (not e!319020))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552914 (= res!345334 (validKeyInArray!0 k!1914))))

(declare-fun b!552915 () Bool)

(declare-fun res!345331 () Bool)

(assert (=> b!552915 (=> (not res!345331) (not e!319020))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34825 0))(
  ( (array!34826 (arr!16722 (Array (_ BitVec 32) (_ BitVec 64))) (size!17086 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34825)

(assert (=> b!552915 (= res!345331 (and (= (size!17086 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17086 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17086 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!552916 () Bool)

(declare-fun e!319022 () Bool)

(assert (=> b!552916 (= e!319022 (not true))))

(declare-fun e!319023 () Bool)

(assert (=> b!552916 e!319023))

(declare-fun res!345332 () Bool)

(assert (=> b!552916 (=> (not res!345332) (not e!319023))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34825 (_ BitVec 32)) Bool)

(assert (=> b!552916 (= res!345332 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17116 0))(
  ( (Unit!17117) )
))
(declare-fun lt!251328 () Unit!17116)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34825 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17116)

(assert (=> b!552916 (= lt!251328 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!552917 () Bool)

(declare-datatypes ((SeekEntryResult!5171 0))(
  ( (MissingZero!5171 (index!22911 (_ BitVec 32))) (Found!5171 (index!22912 (_ BitVec 32))) (Intermediate!5171 (undefined!5983 Bool) (index!22913 (_ BitVec 32)) (x!51845 (_ BitVec 32))) (Undefined!5171) (MissingVacant!5171 (index!22914 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34825 (_ BitVec 32)) SeekEntryResult!5171)

(assert (=> b!552917 (= e!319023 (= (seekEntryOrOpen!0 (select (arr!16722 a!3118) j!142) a!3118 mask!3119) (Found!5171 j!142)))))

(declare-fun res!345335 () Bool)

(assert (=> start!50600 (=> (not res!345335) (not e!319020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50600 (= res!345335 (validMask!0 mask!3119))))

(assert (=> start!50600 e!319020))

(assert (=> start!50600 true))

(declare-fun array_inv!12518 (array!34825) Bool)

(assert (=> start!50600 (array_inv!12518 a!3118)))

(declare-fun b!552918 () Bool)

(declare-fun res!345328 () Bool)

(assert (=> b!552918 (=> (not res!345328) (not e!319022))))

(declare-datatypes ((List!10802 0))(
  ( (Nil!10799) (Cons!10798 (h!11783 (_ BitVec 64)) (t!17030 List!10802)) )
))
(declare-fun arrayNoDuplicates!0 (array!34825 (_ BitVec 32) List!10802) Bool)

(assert (=> b!552918 (= res!345328 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10799))))

(declare-fun b!552919 () Bool)

(assert (=> b!552919 (= e!319020 e!319022)))

(declare-fun res!345326 () Bool)

(assert (=> b!552919 (=> (not res!345326) (not e!319022))))

(declare-fun lt!251329 () SeekEntryResult!5171)

(assert (=> b!552919 (= res!345326 (or (= lt!251329 (MissingZero!5171 i!1132)) (= lt!251329 (MissingVacant!5171 i!1132))))))

(assert (=> b!552919 (= lt!251329 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!552920 () Bool)

(declare-fun res!345330 () Bool)

(assert (=> b!552920 (=> (not res!345330) (not e!319022))))

(assert (=> b!552920 (= res!345330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!552921 () Bool)

(declare-fun res!345333 () Bool)

(assert (=> b!552921 (=> (not res!345333) (not e!319020))))

(declare-fun arrayContainsKey!0 (array!34825 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552921 (= res!345333 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!552922 () Bool)

(declare-fun res!345329 () Bool)

(assert (=> b!552922 (=> (not res!345329) (not e!319020))))

(assert (=> b!552922 (= res!345329 (validKeyInArray!0 (select (arr!16722 a!3118) j!142)))))

(declare-fun b!552923 () Bool)

(declare-fun res!345327 () Bool)

(assert (=> b!552923 (=> (not res!345327) (not e!319022))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34825 (_ BitVec 32)) SeekEntryResult!5171)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552923 (= res!345327 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16722 a!3118) j!142) mask!3119) (select (arr!16722 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16722 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16722 a!3118) i!1132 k!1914) j!142) (array!34826 (store (arr!16722 a!3118) i!1132 k!1914) (size!17086 a!3118)) mask!3119)))))

(assert (= (and start!50600 res!345335) b!552915))

(assert (= (and b!552915 res!345331) b!552922))

(assert (= (and b!552922 res!345329) b!552914))

(assert (= (and b!552914 res!345334) b!552921))

(assert (= (and b!552921 res!345333) b!552919))

(assert (= (and b!552919 res!345326) b!552920))

(assert (= (and b!552920 res!345330) b!552918))

(assert (= (and b!552918 res!345328) b!552923))

(assert (= (and b!552923 res!345327) b!552916))

(assert (= (and b!552916 res!345332) b!552917))

(declare-fun m!529893 () Bool)

(assert (=> b!552920 m!529893))

(declare-fun m!529895 () Bool)

(assert (=> start!50600 m!529895))

(declare-fun m!529897 () Bool)

(assert (=> start!50600 m!529897))

(declare-fun m!529899 () Bool)

(assert (=> b!552919 m!529899))

(declare-fun m!529901 () Bool)

(assert (=> b!552921 m!529901))

(declare-fun m!529903 () Bool)

(assert (=> b!552916 m!529903))

(declare-fun m!529905 () Bool)

(assert (=> b!552916 m!529905))

(declare-fun m!529907 () Bool)

(assert (=> b!552918 m!529907))

(declare-fun m!529909 () Bool)

(assert (=> b!552922 m!529909))

(assert (=> b!552922 m!529909))

(declare-fun m!529911 () Bool)

(assert (=> b!552922 m!529911))

(declare-fun m!529913 () Bool)

(assert (=> b!552914 m!529913))

(assert (=> b!552923 m!529909))

(declare-fun m!529915 () Bool)

(assert (=> b!552923 m!529915))

(assert (=> b!552923 m!529909))

(declare-fun m!529917 () Bool)

(assert (=> b!552923 m!529917))

(declare-fun m!529919 () Bool)

(assert (=> b!552923 m!529919))

(assert (=> b!552923 m!529917))

(declare-fun m!529921 () Bool)

(assert (=> b!552923 m!529921))

(assert (=> b!552923 m!529915))

(assert (=> b!552923 m!529909))

(declare-fun m!529923 () Bool)

(assert (=> b!552923 m!529923))

(declare-fun m!529925 () Bool)

(assert (=> b!552923 m!529925))

(assert (=> b!552923 m!529917))

(assert (=> b!552923 m!529919))

(assert (=> b!552917 m!529909))

(assert (=> b!552917 m!529909))

(declare-fun m!529927 () Bool)

(assert (=> b!552917 m!529927))

(push 1)

