; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51338 () Bool)

(assert start!51338)

(declare-fun res!351435 () Bool)

(declare-fun e!322815 () Bool)

(assert (=> start!51338 (=> (not res!351435) (not e!322815))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51338 (= res!351435 (validMask!0 mask!3119))))

(assert (=> start!51338 e!322815))

(assert (=> start!51338 true))

(declare-datatypes ((array!35203 0))(
  ( (array!35204 (arr!16902 (Array (_ BitVec 32) (_ BitVec 64))) (size!17266 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35203)

(declare-fun array_inv!12698 (array!35203) Bool)

(assert (=> start!51338 (array_inv!12698 a!3118)))

(declare-fun b!560282 () Bool)

(declare-fun res!351443 () Bool)

(declare-fun e!322810 () Bool)

(assert (=> b!560282 (=> (not res!351443) (not e!322810))))

(declare-datatypes ((List!10982 0))(
  ( (Nil!10979) (Cons!10978 (h!11981 (_ BitVec 64)) (t!17210 List!10982)) )
))
(declare-fun arrayNoDuplicates!0 (array!35203 (_ BitVec 32) List!10982) Bool)

(assert (=> b!560282 (= res!351443 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10979))))

(declare-fun b!560283 () Bool)

(declare-fun e!322808 () Bool)

(declare-fun e!322814 () Bool)

(assert (=> b!560283 (= e!322808 e!322814)))

(declare-fun res!351441 () Bool)

(assert (=> b!560283 (=> (not res!351441) (not e!322814))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5351 0))(
  ( (MissingZero!5351 (index!23631 (_ BitVec 32))) (Found!5351 (index!23632 (_ BitVec 32))) (Intermediate!5351 (undefined!6163 Bool) (index!23633 (_ BitVec 32)) (x!52550 (_ BitVec 32))) (Undefined!5351) (MissingVacant!5351 (index!23634 (_ BitVec 32))) )
))
(declare-fun lt!254716 () SeekEntryResult!5351)

(declare-fun lt!254712 () SeekEntryResult!5351)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35203 (_ BitVec 32)) SeekEntryResult!5351)

(assert (=> b!560283 (= res!351441 (= lt!254716 (seekKeyOrZeroReturnVacant!0 (x!52550 lt!254712) (index!23633 lt!254712) (index!23633 lt!254712) (select (arr!16902 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!560284 () Bool)

(declare-fun res!351439 () Bool)

(assert (=> b!560284 (=> (not res!351439) (not e!322815))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560284 (= res!351439 (validKeyInArray!0 (select (arr!16902 a!3118) j!142)))))

(declare-fun lt!254714 () array!35203)

(declare-fun lt!254711 () (_ BitVec 64))

(declare-fun b!560285 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35203 (_ BitVec 32)) SeekEntryResult!5351)

(assert (=> b!560285 (= e!322814 (= (seekEntryOrOpen!0 lt!254711 lt!254714 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52550 lt!254712) (index!23633 lt!254712) (index!23633 lt!254712) lt!254711 lt!254714 mask!3119)))))

(declare-fun b!560286 () Bool)

(declare-fun e!322809 () Bool)

(assert (=> b!560286 (= e!322809 e!322808)))

(declare-fun res!351445 () Bool)

(assert (=> b!560286 (=> res!351445 e!322808)))

(declare-fun lt!254709 () (_ BitVec 64))

(assert (=> b!560286 (= res!351445 (or (= lt!254709 (select (arr!16902 a!3118) j!142)) (= lt!254709 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560286 (= lt!254709 (select (arr!16902 a!3118) (index!23633 lt!254712)))))

(declare-fun b!560287 () Bool)

(assert (=> b!560287 (= e!322815 e!322810)))

(declare-fun res!351436 () Bool)

(assert (=> b!560287 (=> (not res!351436) (not e!322810))))

(declare-fun lt!254710 () SeekEntryResult!5351)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560287 (= res!351436 (or (= lt!254710 (MissingZero!5351 i!1132)) (= lt!254710 (MissingVacant!5351 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!560287 (= lt!254710 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!560288 () Bool)

(declare-fun res!351438 () Bool)

(assert (=> b!560288 (=> (not res!351438) (not e!322815))))

(declare-fun arrayContainsKey!0 (array!35203 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560288 (= res!351438 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560289 () Bool)

(declare-fun res!351440 () Bool)

(assert (=> b!560289 (=> (not res!351440) (not e!322810))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35203 (_ BitVec 32)) Bool)

(assert (=> b!560289 (= res!351440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560290 () Bool)

(declare-fun e!322811 () Bool)

(assert (=> b!560290 (= e!322811 (not true))))

(declare-fun e!322813 () Bool)

(assert (=> b!560290 e!322813))

(declare-fun res!351446 () Bool)

(assert (=> b!560290 (=> (not res!351446) (not e!322813))))

(assert (=> b!560290 (= res!351446 (= lt!254716 (Found!5351 j!142)))))

(assert (=> b!560290 (= lt!254716 (seekEntryOrOpen!0 (select (arr!16902 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!560290 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17476 0))(
  ( (Unit!17477) )
))
(declare-fun lt!254715 () Unit!17476)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35203 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17476)

(assert (=> b!560290 (= lt!254715 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560291 () Bool)

(assert (=> b!560291 (= e!322813 e!322809)))

(declare-fun res!351444 () Bool)

(assert (=> b!560291 (=> res!351444 e!322809)))

(assert (=> b!560291 (= res!351444 (or (undefined!6163 lt!254712) (not (is-Intermediate!5351 lt!254712))))))

(declare-fun b!560292 () Bool)

(declare-fun res!351437 () Bool)

(assert (=> b!560292 (=> (not res!351437) (not e!322815))))

(assert (=> b!560292 (= res!351437 (and (= (size!17266 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17266 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17266 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560293 () Bool)

(assert (=> b!560293 (= e!322810 e!322811)))

(declare-fun res!351442 () Bool)

(assert (=> b!560293 (=> (not res!351442) (not e!322811))))

(declare-fun lt!254713 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35203 (_ BitVec 32)) SeekEntryResult!5351)

(assert (=> b!560293 (= res!351442 (= lt!254712 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254713 lt!254711 lt!254714 mask!3119)))))

(declare-fun lt!254708 () (_ BitVec 32))

(assert (=> b!560293 (= lt!254712 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254708 (select (arr!16902 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560293 (= lt!254713 (toIndex!0 lt!254711 mask!3119))))

(assert (=> b!560293 (= lt!254711 (select (store (arr!16902 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!560293 (= lt!254708 (toIndex!0 (select (arr!16902 a!3118) j!142) mask!3119))))

(assert (=> b!560293 (= lt!254714 (array!35204 (store (arr!16902 a!3118) i!1132 k!1914) (size!17266 a!3118)))))

(declare-fun b!560294 () Bool)

(declare-fun res!351434 () Bool)

(assert (=> b!560294 (=> (not res!351434) (not e!322815))))

(assert (=> b!560294 (= res!351434 (validKeyInArray!0 k!1914))))

(assert (= (and start!51338 res!351435) b!560292))

(assert (= (and b!560292 res!351437) b!560284))

(assert (= (and b!560284 res!351439) b!560294))

(assert (= (and b!560294 res!351434) b!560288))

(assert (= (and b!560288 res!351438) b!560287))

(assert (= (and b!560287 res!351436) b!560289))

(assert (= (and b!560289 res!351440) b!560282))

(assert (= (and b!560282 res!351443) b!560293))

(assert (= (and b!560293 res!351442) b!560290))

(assert (= (and b!560290 res!351446) b!560291))

(assert (= (and b!560291 (not res!351444)) b!560286))

(assert (= (and b!560286 (not res!351445)) b!560283))

(assert (= (and b!560283 res!351441) b!560285))

(declare-fun m!538029 () Bool)

(assert (=> b!560294 m!538029))

(declare-fun m!538031 () Bool)

(assert (=> b!560282 m!538031))

(declare-fun m!538033 () Bool)

(assert (=> b!560285 m!538033))

(declare-fun m!538035 () Bool)

(assert (=> b!560285 m!538035))

(declare-fun m!538037 () Bool)

(assert (=> b!560290 m!538037))

(assert (=> b!560290 m!538037))

(declare-fun m!538039 () Bool)

(assert (=> b!560290 m!538039))

(declare-fun m!538041 () Bool)

(assert (=> b!560290 m!538041))

(declare-fun m!538043 () Bool)

(assert (=> b!560290 m!538043))

(assert (=> b!560286 m!538037))

(declare-fun m!538045 () Bool)

(assert (=> b!560286 m!538045))

(assert (=> b!560283 m!538037))

(assert (=> b!560283 m!538037))

(declare-fun m!538047 () Bool)

(assert (=> b!560283 m!538047))

(declare-fun m!538049 () Bool)

(assert (=> start!51338 m!538049))

(declare-fun m!538051 () Bool)

(assert (=> start!51338 m!538051))

(assert (=> b!560284 m!538037))

(assert (=> b!560284 m!538037))

(declare-fun m!538053 () Bool)

(assert (=> b!560284 m!538053))

(declare-fun m!538055 () Bool)

(assert (=> b!560288 m!538055))

(assert (=> b!560293 m!538037))

(declare-fun m!538057 () Bool)

(assert (=> b!560293 m!538057))

(declare-fun m!538059 () Bool)

(assert (=> b!560293 m!538059))

(assert (=> b!560293 m!538037))

(assert (=> b!560293 m!538037))

(declare-fun m!538061 () Bool)

(assert (=> b!560293 m!538061))

(declare-fun m!538063 () Bool)

(assert (=> b!560293 m!538063))

(declare-fun m!538065 () Bool)

(assert (=> b!560293 m!538065))

(declare-fun m!538067 () Bool)

(assert (=> b!560293 m!538067))

(declare-fun m!538069 () Bool)

(assert (=> b!560289 m!538069))

(declare-fun m!538071 () Bool)

(assert (=> b!560287 m!538071))

(push 1)

