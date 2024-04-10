; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50748 () Bool)

(assert start!50748)

(declare-fun b!555090 () Bool)

(declare-fun e!319981 () Bool)

(assert (=> b!555090 (= e!319981 (not true))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5245 0))(
  ( (MissingZero!5245 (index!23207 (_ BitVec 32))) (Found!5245 (index!23208 (_ BitVec 32))) (Intermediate!5245 (undefined!6057 Bool) (index!23209 (_ BitVec 32)) (x!52111 (_ BitVec 32))) (Undefined!5245) (MissingVacant!5245 (index!23210 (_ BitVec 32))) )
))
(declare-fun lt!252186 () SeekEntryResult!5245)

(declare-datatypes ((array!34973 0))(
  ( (array!34974 (arr!16796 (Array (_ BitVec 32) (_ BitVec 64))) (size!17160 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34973)

(declare-fun lt!252183 () SeekEntryResult!5245)

(assert (=> b!555090 (and (= lt!252183 (Found!5245 j!142)) (or (undefined!6057 lt!252186) (not (is-Intermediate!5245 lt!252186)) (= (select (arr!16796 a!3118) (index!23209 lt!252186)) (select (arr!16796 a!3118) j!142)) (not (= (select (arr!16796 a!3118) (index!23209 lt!252186)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252183 (MissingZero!5245 (index!23209 lt!252186)))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34973 (_ BitVec 32)) SeekEntryResult!5245)

(assert (=> b!555090 (= lt!252183 (seekEntryOrOpen!0 (select (arr!16796 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34973 (_ BitVec 32)) Bool)

(assert (=> b!555090 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17264 0))(
  ( (Unit!17265) )
))
(declare-fun lt!252182 () Unit!17264)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34973 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17264)

(assert (=> b!555090 (= lt!252182 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555091 () Bool)

(declare-fun res!347509 () Bool)

(declare-fun e!319983 () Bool)

(assert (=> b!555091 (=> (not res!347509) (not e!319983))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555091 (= res!347509 (validKeyInArray!0 (select (arr!16796 a!3118) j!142)))))

(declare-fun res!347508 () Bool)

(assert (=> start!50748 (=> (not res!347508) (not e!319983))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50748 (= res!347508 (validMask!0 mask!3119))))

(assert (=> start!50748 e!319983))

(assert (=> start!50748 true))

(declare-fun array_inv!12592 (array!34973) Bool)

(assert (=> start!50748 (array_inv!12592 a!3118)))

(declare-fun b!555092 () Bool)

(declare-fun res!347504 () Bool)

(declare-fun e!319982 () Bool)

(assert (=> b!555092 (=> (not res!347504) (not e!319982))))

(declare-datatypes ((List!10876 0))(
  ( (Nil!10873) (Cons!10872 (h!11857 (_ BitVec 64)) (t!17104 List!10876)) )
))
(declare-fun arrayNoDuplicates!0 (array!34973 (_ BitVec 32) List!10876) Bool)

(assert (=> b!555092 (= res!347504 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10873))))

(declare-fun b!555093 () Bool)

(assert (=> b!555093 (= e!319983 e!319982)))

(declare-fun res!347506 () Bool)

(assert (=> b!555093 (=> (not res!347506) (not e!319982))))

(declare-fun lt!252187 () SeekEntryResult!5245)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555093 (= res!347506 (or (= lt!252187 (MissingZero!5245 i!1132)) (= lt!252187 (MissingVacant!5245 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!555093 (= lt!252187 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!555094 () Bool)

(declare-fun res!347510 () Bool)

(assert (=> b!555094 (=> (not res!347510) (not e!319983))))

(declare-fun arrayContainsKey!0 (array!34973 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555094 (= res!347510 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555095 () Bool)

(declare-fun res!347503 () Bool)

(assert (=> b!555095 (=> (not res!347503) (not e!319983))))

(assert (=> b!555095 (= res!347503 (and (= (size!17160 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17160 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17160 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555096 () Bool)

(assert (=> b!555096 (= e!319982 e!319981)))

(declare-fun res!347502 () Bool)

(assert (=> b!555096 (=> (not res!347502) (not e!319981))))

(declare-fun lt!252184 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34973 (_ BitVec 32)) SeekEntryResult!5245)

(assert (=> b!555096 (= res!347502 (= lt!252186 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252184 (select (store (arr!16796 a!3118) i!1132 k!1914) j!142) (array!34974 (store (arr!16796 a!3118) i!1132 k!1914) (size!17160 a!3118)) mask!3119)))))

(declare-fun lt!252185 () (_ BitVec 32))

(assert (=> b!555096 (= lt!252186 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252185 (select (arr!16796 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555096 (= lt!252184 (toIndex!0 (select (store (arr!16796 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!555096 (= lt!252185 (toIndex!0 (select (arr!16796 a!3118) j!142) mask!3119))))

(declare-fun b!555097 () Bool)

(declare-fun res!347505 () Bool)

(assert (=> b!555097 (=> (not res!347505) (not e!319982))))

(assert (=> b!555097 (= res!347505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555098 () Bool)

(declare-fun res!347507 () Bool)

(assert (=> b!555098 (=> (not res!347507) (not e!319983))))

(assert (=> b!555098 (= res!347507 (validKeyInArray!0 k!1914))))

(assert (= (and start!50748 res!347508) b!555095))

(assert (= (and b!555095 res!347503) b!555091))

(assert (= (and b!555091 res!347509) b!555098))

(assert (= (and b!555098 res!347507) b!555094))

(assert (= (and b!555094 res!347510) b!555093))

(assert (= (and b!555093 res!347506) b!555097))

(assert (= (and b!555097 res!347505) b!555092))

(assert (= (and b!555092 res!347504) b!555096))

(assert (= (and b!555096 res!347502) b!555090))

(declare-fun m!532633 () Bool)

(assert (=> b!555091 m!532633))

(assert (=> b!555091 m!532633))

(declare-fun m!532635 () Bool)

(assert (=> b!555091 m!532635))

(assert (=> b!555096 m!532633))

(declare-fun m!532637 () Bool)

(assert (=> b!555096 m!532637))

(assert (=> b!555096 m!532637))

(declare-fun m!532639 () Bool)

(assert (=> b!555096 m!532639))

(declare-fun m!532641 () Bool)

(assert (=> b!555096 m!532641))

(assert (=> b!555096 m!532637))

(declare-fun m!532643 () Bool)

(assert (=> b!555096 m!532643))

(assert (=> b!555096 m!532633))

(declare-fun m!532645 () Bool)

(assert (=> b!555096 m!532645))

(assert (=> b!555096 m!532633))

(declare-fun m!532647 () Bool)

(assert (=> b!555096 m!532647))

(declare-fun m!532649 () Bool)

(assert (=> b!555092 m!532649))

(declare-fun m!532651 () Bool)

(assert (=> b!555097 m!532651))

(assert (=> b!555090 m!532633))

(declare-fun m!532653 () Bool)

(assert (=> b!555090 m!532653))

(declare-fun m!532655 () Bool)

(assert (=> b!555090 m!532655))

(declare-fun m!532657 () Bool)

(assert (=> b!555090 m!532657))

(assert (=> b!555090 m!532633))

(declare-fun m!532659 () Bool)

(assert (=> b!555090 m!532659))

(declare-fun m!532661 () Bool)

(assert (=> b!555093 m!532661))

(declare-fun m!532663 () Bool)

(assert (=> b!555094 m!532663))

(declare-fun m!532665 () Bool)

(assert (=> start!50748 m!532665))

(declare-fun m!532667 () Bool)

(assert (=> start!50748 m!532667))

(declare-fun m!532669 () Bool)

(assert (=> b!555098 m!532669))

(push 1)

