; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51536 () Bool)

(assert start!51536)

(declare-fun res!355039 () Bool)

(declare-fun e!324888 () Bool)

(assert (=> start!51536 (=> (not res!355039) (not e!324888))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51536 (= res!355039 (validMask!0 mask!3119))))

(assert (=> start!51536 e!324888))

(assert (=> start!51536 true))

(declare-datatypes ((array!35401 0))(
  ( (array!35402 (arr!17001 (Array (_ BitVec 32) (_ BitVec 64))) (size!17365 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35401)

(declare-fun array_inv!12797 (array!35401) Bool)

(assert (=> start!51536 (array_inv!12797 a!3118)))

(declare-fun b!563887 () Bool)

(declare-fun e!324887 () Bool)

(declare-fun e!324884 () Bool)

(assert (=> b!563887 (= e!324887 e!324884)))

(declare-fun res!355046 () Bool)

(assert (=> b!563887 (=> (not res!355046) (not e!324884))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!257368 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5450 0))(
  ( (MissingZero!5450 (index!24027 (_ BitVec 32))) (Found!5450 (index!24028 (_ BitVec 32))) (Intermediate!5450 (undefined!6262 Bool) (index!24029 (_ BitVec 32)) (x!52913 (_ BitVec 32))) (Undefined!5450) (MissingVacant!5450 (index!24030 (_ BitVec 32))) )
))
(declare-fun lt!257369 () SeekEntryResult!5450)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35401 (_ BitVec 32)) SeekEntryResult!5450)

(assert (=> b!563887 (= res!355046 (= lt!257369 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257368 (select (store (arr!17001 a!3118) i!1132 k!1914) j!142) (array!35402 (store (arr!17001 a!3118) i!1132 k!1914) (size!17365 a!3118)) mask!3119)))))

(declare-fun lt!257370 () (_ BitVec 32))

(assert (=> b!563887 (= lt!257369 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257370 (select (arr!17001 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563887 (= lt!257368 (toIndex!0 (select (store (arr!17001 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!563887 (= lt!257370 (toIndex!0 (select (arr!17001 a!3118) j!142) mask!3119))))

(declare-fun b!563888 () Bool)

(declare-fun res!355041 () Bool)

(assert (=> b!563888 (=> (not res!355041) (not e!324888))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563888 (= res!355041 (validKeyInArray!0 k!1914))))

(declare-fun b!563889 () Bool)

(declare-fun res!355042 () Bool)

(assert (=> b!563889 (=> (not res!355042) (not e!324888))))

(assert (=> b!563889 (= res!355042 (and (= (size!17365 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17365 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17365 a!3118)) (not (= i!1132 j!142))))))

(declare-fun e!324885 () Bool)

(declare-fun b!563890 () Bool)

(assert (=> b!563890 (= e!324885 (validKeyInArray!0 (select (store (arr!17001 a!3118) i!1132 k!1914) j!142)))))

(declare-fun b!563891 () Bool)

(assert (=> b!563891 (= e!324888 e!324887)))

(declare-fun res!355043 () Bool)

(assert (=> b!563891 (=> (not res!355043) (not e!324887))))

(declare-fun lt!257367 () SeekEntryResult!5450)

(assert (=> b!563891 (= res!355043 (or (= lt!257367 (MissingZero!5450 i!1132)) (= lt!257367 (MissingVacant!5450 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35401 (_ BitVec 32)) SeekEntryResult!5450)

(assert (=> b!563891 (= lt!257367 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!563892 () Bool)

(declare-fun res!355048 () Bool)

(assert (=> b!563892 (=> (not res!355048) (not e!324888))))

(declare-fun arrayContainsKey!0 (array!35401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563892 (= res!355048 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563893 () Bool)

(assert (=> b!563893 (= e!324884 (not e!324885))))

(declare-fun res!355047 () Bool)

(assert (=> b!563893 (=> res!355047 e!324885)))

(declare-fun lt!257371 () Bool)

(assert (=> b!563893 (= res!355047 (or (and (not lt!257371) (undefined!6262 lt!257369)) (and (not lt!257371) (not (undefined!6262 lt!257369))) (bvslt mask!3119 #b00000000000000000000000000000000)))))

(assert (=> b!563893 (= lt!257371 (not (is-Intermediate!5450 lt!257369)))))

(declare-fun e!324883 () Bool)

(assert (=> b!563893 e!324883))

(declare-fun res!355045 () Bool)

(assert (=> b!563893 (=> (not res!355045) (not e!324883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35401 (_ BitVec 32)) Bool)

(assert (=> b!563893 (= res!355045 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17674 0))(
  ( (Unit!17675) )
))
(declare-fun lt!257366 () Unit!17674)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35401 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17674)

(assert (=> b!563893 (= lt!257366 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563894 () Bool)

(declare-fun res!355040 () Bool)

(assert (=> b!563894 (=> (not res!355040) (not e!324888))))

(assert (=> b!563894 (= res!355040 (validKeyInArray!0 (select (arr!17001 a!3118) j!142)))))

(declare-fun b!563895 () Bool)

(assert (=> b!563895 (= e!324883 (= (seekEntryOrOpen!0 (select (arr!17001 a!3118) j!142) a!3118 mask!3119) (Found!5450 j!142)))))

(declare-fun b!563896 () Bool)

(declare-fun res!355044 () Bool)

(assert (=> b!563896 (=> (not res!355044) (not e!324887))))

(assert (=> b!563896 (= res!355044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563897 () Bool)

(declare-fun res!355049 () Bool)

(assert (=> b!563897 (=> (not res!355049) (not e!324887))))

(declare-datatypes ((List!11081 0))(
  ( (Nil!11078) (Cons!11077 (h!12080 (_ BitVec 64)) (t!17309 List!11081)) )
))
(declare-fun arrayNoDuplicates!0 (array!35401 (_ BitVec 32) List!11081) Bool)

(assert (=> b!563897 (= res!355049 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11078))))

(assert (= (and start!51536 res!355039) b!563889))

(assert (= (and b!563889 res!355042) b!563894))

(assert (= (and b!563894 res!355040) b!563888))

(assert (= (and b!563888 res!355041) b!563892))

(assert (= (and b!563892 res!355048) b!563891))

(assert (= (and b!563891 res!355043) b!563896))

(assert (= (and b!563896 res!355044) b!563897))

(assert (= (and b!563897 res!355049) b!563887))

(assert (= (and b!563887 res!355046) b!563893))

(assert (= (and b!563893 res!355045) b!563895))

(assert (= (and b!563893 (not res!355047)) b!563890))

(declare-fun m!542319 () Bool)

(assert (=> b!563888 m!542319))

(declare-fun m!542321 () Bool)

(assert (=> b!563887 m!542321))

(declare-fun m!542323 () Bool)

(assert (=> b!563887 m!542323))

(declare-fun m!542325 () Bool)

(assert (=> b!563887 m!542325))

(assert (=> b!563887 m!542323))

(declare-fun m!542327 () Bool)

(assert (=> b!563887 m!542327))

(assert (=> b!563887 m!542323))

(declare-fun m!542329 () Bool)

(assert (=> b!563887 m!542329))

(assert (=> b!563887 m!542321))

(declare-fun m!542331 () Bool)

(assert (=> b!563887 m!542331))

(assert (=> b!563887 m!542321))

(declare-fun m!542333 () Bool)

(assert (=> b!563887 m!542333))

(declare-fun m!542335 () Bool)

(assert (=> b!563896 m!542335))

(declare-fun m!542337 () Bool)

(assert (=> b!563891 m!542337))

(assert (=> b!563894 m!542321))

(assert (=> b!563894 m!542321))

(declare-fun m!542339 () Bool)

(assert (=> b!563894 m!542339))

(declare-fun m!542341 () Bool)

(assert (=> b!563893 m!542341))

(declare-fun m!542343 () Bool)

(assert (=> b!563893 m!542343))

(assert (=> b!563895 m!542321))

(assert (=> b!563895 m!542321))

(declare-fun m!542345 () Bool)

(assert (=> b!563895 m!542345))

(declare-fun m!542347 () Bool)

(assert (=> start!51536 m!542347))

(declare-fun m!542349 () Bool)

(assert (=> start!51536 m!542349))

(declare-fun m!542351 () Bool)

(assert (=> b!563892 m!542351))

(declare-fun m!542353 () Bool)

(assert (=> b!563897 m!542353))

(assert (=> b!563890 m!542325))

(assert (=> b!563890 m!542323))

(assert (=> b!563890 m!542323))

(declare-fun m!542355 () Bool)

(assert (=> b!563890 m!542355))

(push 1)

