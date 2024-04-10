; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50602 () Bool)

(assert start!50602)

(declare-fun b!552944 () Bool)

(declare-fun res!345362 () Bool)

(declare-fun e!319033 () Bool)

(assert (=> b!552944 (=> (not res!345362) (not e!319033))))

(declare-datatypes ((array!34827 0))(
  ( (array!34828 (arr!16723 (Array (_ BitVec 32) (_ BitVec 64))) (size!17087 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34827)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552944 (= res!345362 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!552945 () Bool)

(declare-fun e!319032 () Bool)

(assert (=> b!552945 (= e!319032 (not true))))

(declare-fun e!319034 () Bool)

(assert (=> b!552945 e!319034))

(declare-fun res!345358 () Bool)

(assert (=> b!552945 (=> (not res!345358) (not e!319034))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34827 (_ BitVec 32)) Bool)

(assert (=> b!552945 (= res!345358 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17118 0))(
  ( (Unit!17119) )
))
(declare-fun lt!251334 () Unit!17118)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34827 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17118)

(assert (=> b!552945 (= lt!251334 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!552946 () Bool)

(declare-fun res!345365 () Bool)

(assert (=> b!552946 (=> (not res!345365) (not e!319032))))

(declare-datatypes ((List!10803 0))(
  ( (Nil!10800) (Cons!10799 (h!11784 (_ BitVec 64)) (t!17031 List!10803)) )
))
(declare-fun arrayNoDuplicates!0 (array!34827 (_ BitVec 32) List!10803) Bool)

(assert (=> b!552946 (= res!345365 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10800))))

(declare-fun b!552947 () Bool)

(declare-datatypes ((SeekEntryResult!5172 0))(
  ( (MissingZero!5172 (index!22915 (_ BitVec 32))) (Found!5172 (index!22916 (_ BitVec 32))) (Intermediate!5172 (undefined!5984 Bool) (index!22917 (_ BitVec 32)) (x!51846 (_ BitVec 32))) (Undefined!5172) (MissingVacant!5172 (index!22918 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34827 (_ BitVec 32)) SeekEntryResult!5172)

(assert (=> b!552947 (= e!319034 (= (seekEntryOrOpen!0 (select (arr!16723 a!3118) j!142) a!3118 mask!3119) (Found!5172 j!142)))))

(declare-fun b!552948 () Bool)

(declare-fun res!345363 () Bool)

(assert (=> b!552948 (=> (not res!345363) (not e!319032))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34827 (_ BitVec 32)) SeekEntryResult!5172)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552948 (= res!345363 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16723 a!3118) j!142) mask!3119) (select (arr!16723 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16723 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16723 a!3118) i!1132 k0!1914) j!142) (array!34828 (store (arr!16723 a!3118) i!1132 k0!1914) (size!17087 a!3118)) mask!3119)))))

(declare-fun b!552949 () Bool)

(declare-fun res!345357 () Bool)

(assert (=> b!552949 (=> (not res!345357) (not e!319033))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552949 (= res!345357 (validKeyInArray!0 (select (arr!16723 a!3118) j!142)))))

(declare-fun b!552950 () Bool)

(assert (=> b!552950 (= e!319033 e!319032)))

(declare-fun res!345364 () Bool)

(assert (=> b!552950 (=> (not res!345364) (not e!319032))))

(declare-fun lt!251335 () SeekEntryResult!5172)

(assert (=> b!552950 (= res!345364 (or (= lt!251335 (MissingZero!5172 i!1132)) (= lt!251335 (MissingVacant!5172 i!1132))))))

(assert (=> b!552950 (= lt!251335 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!345359 () Bool)

(assert (=> start!50602 (=> (not res!345359) (not e!319033))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50602 (= res!345359 (validMask!0 mask!3119))))

(assert (=> start!50602 e!319033))

(assert (=> start!50602 true))

(declare-fun array_inv!12519 (array!34827) Bool)

(assert (=> start!50602 (array_inv!12519 a!3118)))

(declare-fun b!552951 () Bool)

(declare-fun res!345360 () Bool)

(assert (=> b!552951 (=> (not res!345360) (not e!319033))))

(assert (=> b!552951 (= res!345360 (validKeyInArray!0 k0!1914))))

(declare-fun b!552952 () Bool)

(declare-fun res!345361 () Bool)

(assert (=> b!552952 (=> (not res!345361) (not e!319032))))

(assert (=> b!552952 (= res!345361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!552953 () Bool)

(declare-fun res!345356 () Bool)

(assert (=> b!552953 (=> (not res!345356) (not e!319033))))

(assert (=> b!552953 (= res!345356 (and (= (size!17087 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17087 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17087 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50602 res!345359) b!552953))

(assert (= (and b!552953 res!345356) b!552949))

(assert (= (and b!552949 res!345357) b!552951))

(assert (= (and b!552951 res!345360) b!552944))

(assert (= (and b!552944 res!345362) b!552950))

(assert (= (and b!552950 res!345364) b!552952))

(assert (= (and b!552952 res!345361) b!552946))

(assert (= (and b!552946 res!345365) b!552948))

(assert (= (and b!552948 res!345363) b!552945))

(assert (= (and b!552945 res!345358) b!552947))

(declare-fun m!529929 () Bool)

(assert (=> b!552946 m!529929))

(declare-fun m!529931 () Bool)

(assert (=> b!552950 m!529931))

(declare-fun m!529933 () Bool)

(assert (=> b!552949 m!529933))

(assert (=> b!552949 m!529933))

(declare-fun m!529935 () Bool)

(assert (=> b!552949 m!529935))

(declare-fun m!529937 () Bool)

(assert (=> b!552945 m!529937))

(declare-fun m!529939 () Bool)

(assert (=> b!552945 m!529939))

(assert (=> b!552948 m!529933))

(declare-fun m!529941 () Bool)

(assert (=> b!552948 m!529941))

(assert (=> b!552948 m!529933))

(declare-fun m!529943 () Bool)

(assert (=> b!552948 m!529943))

(declare-fun m!529945 () Bool)

(assert (=> b!552948 m!529945))

(assert (=> b!552948 m!529943))

(declare-fun m!529947 () Bool)

(assert (=> b!552948 m!529947))

(assert (=> b!552948 m!529941))

(assert (=> b!552948 m!529933))

(declare-fun m!529949 () Bool)

(assert (=> b!552948 m!529949))

(declare-fun m!529951 () Bool)

(assert (=> b!552948 m!529951))

(assert (=> b!552948 m!529943))

(assert (=> b!552948 m!529945))

(declare-fun m!529953 () Bool)

(assert (=> b!552944 m!529953))

(declare-fun m!529955 () Bool)

(assert (=> b!552952 m!529955))

(assert (=> b!552947 m!529933))

(assert (=> b!552947 m!529933))

(declare-fun m!529957 () Bool)

(assert (=> b!552947 m!529957))

(declare-fun m!529959 () Bool)

(assert (=> b!552951 m!529959))

(declare-fun m!529961 () Bool)

(assert (=> start!50602 m!529961))

(declare-fun m!529963 () Bool)

(assert (=> start!50602 m!529963))

(check-sat (not b!552948) (not b!552944) (not b!552952) (not b!552949) (not b!552951) (not b!552947) (not start!50602) (not b!552945) (not b!552946) (not b!552950))
(check-sat)
