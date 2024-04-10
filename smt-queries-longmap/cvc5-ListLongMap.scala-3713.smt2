; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51074 () Bool)

(assert start!51074)

(declare-fun b!558082 () Bool)

(declare-fun e!321502 () Bool)

(assert (=> b!558082 (= e!321502 (not true))))

(declare-fun e!321501 () Bool)

(assert (=> b!558082 e!321501))

(declare-fun res!349954 () Bool)

(assert (=> b!558082 (=> (not res!349954) (not e!321501))))

(declare-datatypes ((SeekEntryResult!5318 0))(
  ( (MissingZero!5318 (index!23499 (_ BitVec 32))) (Found!5318 (index!23500 (_ BitVec 32))) (Intermediate!5318 (undefined!6130 Bool) (index!23501 (_ BitVec 32)) (x!52402 (_ BitVec 32))) (Undefined!5318) (MissingVacant!5318 (index!23502 (_ BitVec 32))) )
))
(declare-fun lt!253590 () SeekEntryResult!5318)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!558082 (= res!349954 (= lt!253590 (Found!5318 j!142)))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35128 0))(
  ( (array!35129 (arr!16869 (Array (_ BitVec 32) (_ BitVec 64))) (size!17233 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35128)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35128 (_ BitVec 32)) SeekEntryResult!5318)

(assert (=> b!558082 (= lt!253590 (seekEntryOrOpen!0 (select (arr!16869 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35128 (_ BitVec 32)) Bool)

(assert (=> b!558082 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17410 0))(
  ( (Unit!17411) )
))
(declare-fun lt!253591 () Unit!17410)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35128 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17410)

(assert (=> b!558082 (= lt!253591 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!558083 () Bool)

(declare-fun res!349945 () Bool)

(declare-fun e!321504 () Bool)

(assert (=> b!558083 (=> (not res!349945) (not e!321504))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!558083 (= res!349945 (validKeyInArray!0 k!1914))))

(declare-fun b!558084 () Bool)

(declare-fun res!349952 () Bool)

(assert (=> b!558084 (=> (not res!349952) (not e!321504))))

(assert (=> b!558084 (= res!349952 (validKeyInArray!0 (select (arr!16869 a!3118) j!142)))))

(declare-fun b!558085 () Bool)

(declare-fun e!321503 () Bool)

(assert (=> b!558085 (= e!321504 e!321503)))

(declare-fun res!349946 () Bool)

(assert (=> b!558085 (=> (not res!349946) (not e!321503))))

(declare-fun lt!253586 () SeekEntryResult!5318)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!558085 (= res!349946 (or (= lt!253586 (MissingZero!5318 i!1132)) (= lt!253586 (MissingVacant!5318 i!1132))))))

(assert (=> b!558085 (= lt!253586 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!558086 () Bool)

(declare-fun res!349949 () Bool)

(assert (=> b!558086 (=> (not res!349949) (not e!321503))))

(assert (=> b!558086 (= res!349949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!558087 () Bool)

(declare-fun res!349955 () Bool)

(assert (=> b!558087 (=> (not res!349955) (not e!321504))))

(assert (=> b!558087 (= res!349955 (and (= (size!17233 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17233 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17233 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!558088 () Bool)

(declare-fun e!321499 () Bool)

(declare-fun lt!253589 () SeekEntryResult!5318)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35128 (_ BitVec 32)) SeekEntryResult!5318)

(assert (=> b!558088 (= e!321499 (= lt!253590 (seekKeyOrZeroReturnVacant!0 (x!52402 lt!253589) (index!23501 lt!253589) (index!23501 lt!253589) (select (arr!16869 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!558089 () Bool)

(declare-fun res!349947 () Bool)

(assert (=> b!558089 (=> (not res!349947) (not e!321504))))

(declare-fun arrayContainsKey!0 (array!35128 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!558089 (= res!349947 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!558090 () Bool)

(assert (=> b!558090 (= e!321503 e!321502)))

(declare-fun res!349951 () Bool)

(assert (=> b!558090 (=> (not res!349951) (not e!321502))))

(declare-fun lt!253587 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35128 (_ BitVec 32)) SeekEntryResult!5318)

(assert (=> b!558090 (= res!349951 (= lt!253589 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253587 (select (store (arr!16869 a!3118) i!1132 k!1914) j!142) (array!35129 (store (arr!16869 a!3118) i!1132 k!1914) (size!17233 a!3118)) mask!3119)))))

(declare-fun lt!253588 () (_ BitVec 32))

(assert (=> b!558090 (= lt!253589 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253588 (select (arr!16869 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558090 (= lt!253587 (toIndex!0 (select (store (arr!16869 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!558090 (= lt!253588 (toIndex!0 (select (arr!16869 a!3118) j!142) mask!3119))))

(declare-fun b!558091 () Bool)

(declare-fun res!349953 () Bool)

(assert (=> b!558091 (=> (not res!349953) (not e!321503))))

(declare-datatypes ((List!10949 0))(
  ( (Nil!10946) (Cons!10945 (h!11939 (_ BitVec 64)) (t!17177 List!10949)) )
))
(declare-fun arrayNoDuplicates!0 (array!35128 (_ BitVec 32) List!10949) Bool)

(assert (=> b!558091 (= res!349953 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10946))))

(declare-fun b!558092 () Bool)

(assert (=> b!558092 (= e!321501 e!321499)))

(declare-fun res!349950 () Bool)

(assert (=> b!558092 (=> res!349950 e!321499)))

(assert (=> b!558092 (= res!349950 (or (undefined!6130 lt!253589) (not (is-Intermediate!5318 lt!253589)) (= (select (arr!16869 a!3118) (index!23501 lt!253589)) (select (arr!16869 a!3118) j!142)) (= (select (arr!16869 a!3118) (index!23501 lt!253589)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!349948 () Bool)

(assert (=> start!51074 (=> (not res!349948) (not e!321504))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51074 (= res!349948 (validMask!0 mask!3119))))

(assert (=> start!51074 e!321504))

(assert (=> start!51074 true))

(declare-fun array_inv!12665 (array!35128) Bool)

(assert (=> start!51074 (array_inv!12665 a!3118)))

(assert (= (and start!51074 res!349948) b!558087))

(assert (= (and b!558087 res!349955) b!558084))

(assert (= (and b!558084 res!349952) b!558083))

(assert (= (and b!558083 res!349945) b!558089))

(assert (= (and b!558089 res!349947) b!558085))

(assert (= (and b!558085 res!349946) b!558086))

(assert (= (and b!558086 res!349949) b!558091))

(assert (= (and b!558091 res!349953) b!558090))

(assert (= (and b!558090 res!349951) b!558082))

(assert (= (and b!558082 res!349954) b!558092))

(assert (= (and b!558092 (not res!349950)) b!558088))

(declare-fun m!535989 () Bool)

(assert (=> b!558083 m!535989))

(declare-fun m!535991 () Bool)

(assert (=> b!558084 m!535991))

(assert (=> b!558084 m!535991))

(declare-fun m!535993 () Bool)

(assert (=> b!558084 m!535993))

(declare-fun m!535995 () Bool)

(assert (=> b!558086 m!535995))

(assert (=> b!558090 m!535991))

(declare-fun m!535997 () Bool)

(assert (=> b!558090 m!535997))

(assert (=> b!558090 m!535991))

(assert (=> b!558090 m!535991))

(declare-fun m!535999 () Bool)

(assert (=> b!558090 m!535999))

(declare-fun m!536001 () Bool)

(assert (=> b!558090 m!536001))

(assert (=> b!558090 m!536001))

(declare-fun m!536003 () Bool)

(assert (=> b!558090 m!536003))

(declare-fun m!536005 () Bool)

(assert (=> b!558090 m!536005))

(assert (=> b!558090 m!536001))

(declare-fun m!536007 () Bool)

(assert (=> b!558090 m!536007))

(declare-fun m!536009 () Bool)

(assert (=> start!51074 m!536009))

(declare-fun m!536011 () Bool)

(assert (=> start!51074 m!536011))

(assert (=> b!558082 m!535991))

(assert (=> b!558082 m!535991))

(declare-fun m!536013 () Bool)

(assert (=> b!558082 m!536013))

(declare-fun m!536015 () Bool)

(assert (=> b!558082 m!536015))

(declare-fun m!536017 () Bool)

(assert (=> b!558082 m!536017))

(assert (=> b!558088 m!535991))

(assert (=> b!558088 m!535991))

(declare-fun m!536019 () Bool)

(assert (=> b!558088 m!536019))

(declare-fun m!536021 () Bool)

(assert (=> b!558085 m!536021))

(declare-fun m!536023 () Bool)

(assert (=> b!558089 m!536023))

(declare-fun m!536025 () Bool)

(assert (=> b!558092 m!536025))

(assert (=> b!558092 m!535991))

(declare-fun m!536027 () Bool)

(assert (=> b!558091 m!536027))

(push 1)

