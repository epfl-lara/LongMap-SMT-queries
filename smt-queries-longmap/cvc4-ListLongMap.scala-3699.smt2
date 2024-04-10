; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50814 () Bool)

(assert start!50814)

(declare-fun b!555989 () Bool)

(declare-fun e!320379 () Bool)

(declare-fun e!320377 () Bool)

(assert (=> b!555989 (= e!320379 e!320377)))

(declare-fun res!348410 () Bool)

(assert (=> b!555989 (=> (not res!348410) (not e!320377))))

(declare-datatypes ((SeekEntryResult!5278 0))(
  ( (MissingZero!5278 (index!23339 (_ BitVec 32))) (Found!5278 (index!23340 (_ BitVec 32))) (Intermediate!5278 (undefined!6090 Bool) (index!23341 (_ BitVec 32)) (x!52232 (_ BitVec 32))) (Undefined!5278) (MissingVacant!5278 (index!23342 (_ BitVec 32))) )
))
(declare-fun lt!252745 () SeekEntryResult!5278)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555989 (= res!348410 (or (= lt!252745 (MissingZero!5278 i!1132)) (= lt!252745 (MissingVacant!5278 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!35039 0))(
  ( (array!35040 (arr!16829 (Array (_ BitVec 32) (_ BitVec 64))) (size!17193 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35039)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35039 (_ BitVec 32)) SeekEntryResult!5278)

(assert (=> b!555989 (= lt!252745 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!555990 () Bool)

(declare-fun res!348403 () Bool)

(assert (=> b!555990 (=> (not res!348403) (not e!320379))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555990 (= res!348403 (validKeyInArray!0 (select (arr!16829 a!3118) j!142)))))

(declare-fun b!555991 () Bool)

(declare-fun res!348406 () Bool)

(assert (=> b!555991 (=> (not res!348406) (not e!320379))))

(assert (=> b!555991 (= res!348406 (validKeyInArray!0 k!1914))))

(declare-fun b!555992 () Bool)

(declare-fun res!348405 () Bool)

(assert (=> b!555992 (=> (not res!348405) (not e!320379))))

(assert (=> b!555992 (= res!348405 (and (= (size!17193 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17193 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17193 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555993 () Bool)

(declare-fun res!348401 () Bool)

(assert (=> b!555993 (=> (not res!348401) (not e!320377))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35039 (_ BitVec 32)) Bool)

(assert (=> b!555993 (= res!348401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555994 () Bool)

(declare-fun e!320378 () Bool)

(assert (=> b!555994 (= e!320378 (= (seekEntryOrOpen!0 (select (arr!16829 a!3118) j!142) a!3118 mask!3119) (Found!5278 j!142)))))

(declare-fun b!555995 () Bool)

(declare-fun res!348407 () Bool)

(assert (=> b!555995 (=> (not res!348407) (not e!320377))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35039 (_ BitVec 32)) SeekEntryResult!5278)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555995 (= res!348407 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16829 a!3118) j!142) mask!3119) (select (arr!16829 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16829 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16829 a!3118) i!1132 k!1914) j!142) (array!35040 (store (arr!16829 a!3118) i!1132 k!1914) (size!17193 a!3118)) mask!3119)))))

(declare-fun b!555996 () Bool)

(assert (=> b!555996 (= e!320377 (not true))))

(assert (=> b!555996 e!320378))

(declare-fun res!348404 () Bool)

(assert (=> b!555996 (=> (not res!348404) (not e!320378))))

(assert (=> b!555996 (= res!348404 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17330 0))(
  ( (Unit!17331) )
))
(declare-fun lt!252744 () Unit!17330)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35039 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17330)

(assert (=> b!555996 (= lt!252744 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!348409 () Bool)

(assert (=> start!50814 (=> (not res!348409) (not e!320379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50814 (= res!348409 (validMask!0 mask!3119))))

(assert (=> start!50814 e!320379))

(assert (=> start!50814 true))

(declare-fun array_inv!12625 (array!35039) Bool)

(assert (=> start!50814 (array_inv!12625 a!3118)))

(declare-fun b!555997 () Bool)

(declare-fun res!348402 () Bool)

(assert (=> b!555997 (=> (not res!348402) (not e!320377))))

(declare-datatypes ((List!10909 0))(
  ( (Nil!10906) (Cons!10905 (h!11890 (_ BitVec 64)) (t!17137 List!10909)) )
))
(declare-fun arrayNoDuplicates!0 (array!35039 (_ BitVec 32) List!10909) Bool)

(assert (=> b!555997 (= res!348402 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10906))))

(declare-fun b!555998 () Bool)

(declare-fun res!348408 () Bool)

(assert (=> b!555998 (=> (not res!348408) (not e!320379))))

(declare-fun arrayContainsKey!0 (array!35039 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555998 (= res!348408 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50814 res!348409) b!555992))

(assert (= (and b!555992 res!348405) b!555990))

(assert (= (and b!555990 res!348403) b!555991))

(assert (= (and b!555991 res!348406) b!555998))

(assert (= (and b!555998 res!348408) b!555989))

(assert (= (and b!555989 res!348410) b!555993))

(assert (= (and b!555993 res!348401) b!555997))

(assert (= (and b!555997 res!348402) b!555995))

(assert (= (and b!555995 res!348407) b!555996))

(assert (= (and b!555996 res!348404) b!555994))

(declare-fun m!533883 () Bool)

(assert (=> start!50814 m!533883))

(declare-fun m!533885 () Bool)

(assert (=> start!50814 m!533885))

(declare-fun m!533887 () Bool)

(assert (=> b!555996 m!533887))

(declare-fun m!533889 () Bool)

(assert (=> b!555996 m!533889))

(declare-fun m!533891 () Bool)

(assert (=> b!555994 m!533891))

(assert (=> b!555994 m!533891))

(declare-fun m!533893 () Bool)

(assert (=> b!555994 m!533893))

(declare-fun m!533895 () Bool)

(assert (=> b!555991 m!533895))

(assert (=> b!555990 m!533891))

(assert (=> b!555990 m!533891))

(declare-fun m!533897 () Bool)

(assert (=> b!555990 m!533897))

(declare-fun m!533899 () Bool)

(assert (=> b!555993 m!533899))

(assert (=> b!555995 m!533891))

(declare-fun m!533901 () Bool)

(assert (=> b!555995 m!533901))

(assert (=> b!555995 m!533891))

(declare-fun m!533903 () Bool)

(assert (=> b!555995 m!533903))

(declare-fun m!533905 () Bool)

(assert (=> b!555995 m!533905))

(assert (=> b!555995 m!533903))

(declare-fun m!533907 () Bool)

(assert (=> b!555995 m!533907))

(assert (=> b!555995 m!533901))

(assert (=> b!555995 m!533891))

(declare-fun m!533909 () Bool)

(assert (=> b!555995 m!533909))

(declare-fun m!533911 () Bool)

(assert (=> b!555995 m!533911))

(assert (=> b!555995 m!533903))

(assert (=> b!555995 m!533905))

(declare-fun m!533913 () Bool)

(assert (=> b!555997 m!533913))

(declare-fun m!533915 () Bool)

(assert (=> b!555989 m!533915))

(declare-fun m!533917 () Bool)

(assert (=> b!555998 m!533917))

(push 1)

