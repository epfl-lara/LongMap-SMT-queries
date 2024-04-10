; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51342 () Bool)

(assert start!51342)

(declare-fun lt!254768 () (_ BitVec 64))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35207 0))(
  ( (array!35208 (arr!16904 (Array (_ BitVec 32) (_ BitVec 64))) (size!17268 (_ BitVec 32))) )
))
(declare-fun lt!254770 () array!35207)

(declare-fun b!560360 () Bool)

(declare-fun e!322857 () Bool)

(declare-datatypes ((SeekEntryResult!5353 0))(
  ( (MissingZero!5353 (index!23639 (_ BitVec 32))) (Found!5353 (index!23640 (_ BitVec 32))) (Intermediate!5353 (undefined!6165 Bool) (index!23641 (_ BitVec 32)) (x!52552 (_ BitVec 32))) (Undefined!5353) (MissingVacant!5353 (index!23642 (_ BitVec 32))) )
))
(declare-fun lt!254767 () SeekEntryResult!5353)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35207 (_ BitVec 32)) SeekEntryResult!5353)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35207 (_ BitVec 32)) SeekEntryResult!5353)

(assert (=> b!560360 (= e!322857 (= (seekEntryOrOpen!0 lt!254768 lt!254770 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52552 lt!254767) (index!23641 lt!254767) (index!23641 lt!254767) lt!254768 lt!254770 mask!3119)))))

(declare-fun b!560361 () Bool)

(declare-fun res!351512 () Bool)

(declare-fun e!322862 () Bool)

(assert (=> b!560361 (=> (not res!351512) (not e!322862))))

(declare-fun a!3118 () array!35207)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560361 (= res!351512 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560362 () Bool)

(declare-fun res!351517 () Bool)

(assert (=> b!560362 (=> (not res!351517) (not e!322862))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560362 (= res!351517 (validKeyInArray!0 k!1914))))

(declare-fun b!560363 () Bool)

(declare-fun res!351513 () Bool)

(assert (=> b!560363 (=> (not res!351513) (not e!322862))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560363 (= res!351513 (and (= (size!17268 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17268 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17268 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560365 () Bool)

(declare-fun e!322861 () Bool)

(declare-fun e!322863 () Bool)

(assert (=> b!560365 (= e!322861 e!322863)))

(declare-fun res!351516 () Bool)

(assert (=> b!560365 (=> res!351516 e!322863)))

(assert (=> b!560365 (= res!351516 (or (undefined!6165 lt!254767) (not (is-Intermediate!5353 lt!254767))))))

(declare-fun b!560366 () Bool)

(declare-fun res!351515 () Bool)

(declare-fun e!322859 () Bool)

(assert (=> b!560366 (=> (not res!351515) (not e!322859))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35207 (_ BitVec 32)) Bool)

(assert (=> b!560366 (= res!351515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560367 () Bool)

(declare-fun e!322856 () Bool)

(assert (=> b!560367 (= e!322856 e!322857)))

(declare-fun res!351514 () Bool)

(assert (=> b!560367 (=> (not res!351514) (not e!322857))))

(declare-fun lt!254764 () SeekEntryResult!5353)

(assert (=> b!560367 (= res!351514 (= lt!254764 (seekKeyOrZeroReturnVacant!0 (x!52552 lt!254767) (index!23641 lt!254767) (index!23641 lt!254767) (select (arr!16904 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!560368 () Bool)

(declare-fun res!351520 () Bool)

(assert (=> b!560368 (=> (not res!351520) (not e!322862))))

(assert (=> b!560368 (= res!351520 (validKeyInArray!0 (select (arr!16904 a!3118) j!142)))))

(declare-fun res!351519 () Bool)

(assert (=> start!51342 (=> (not res!351519) (not e!322862))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51342 (= res!351519 (validMask!0 mask!3119))))

(assert (=> start!51342 e!322862))

(assert (=> start!51342 true))

(declare-fun array_inv!12700 (array!35207) Bool)

(assert (=> start!51342 (array_inv!12700 a!3118)))

(declare-fun b!560364 () Bool)

(declare-fun res!351524 () Bool)

(assert (=> b!560364 (=> (not res!351524) (not e!322859))))

(declare-datatypes ((List!10984 0))(
  ( (Nil!10981) (Cons!10980 (h!11983 (_ BitVec 64)) (t!17212 List!10984)) )
))
(declare-fun arrayNoDuplicates!0 (array!35207 (_ BitVec 32) List!10984) Bool)

(assert (=> b!560364 (= res!351524 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10981))))

(declare-fun b!560369 () Bool)

(declare-fun e!322860 () Bool)

(assert (=> b!560369 (= e!322860 (not true))))

(assert (=> b!560369 e!322861))

(declare-fun res!351523 () Bool)

(assert (=> b!560369 (=> (not res!351523) (not e!322861))))

(assert (=> b!560369 (= res!351523 (= lt!254764 (Found!5353 j!142)))))

(assert (=> b!560369 (= lt!254764 (seekEntryOrOpen!0 (select (arr!16904 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!560369 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17480 0))(
  ( (Unit!17481) )
))
(declare-fun lt!254766 () Unit!17480)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35207 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17480)

(assert (=> b!560369 (= lt!254766 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560370 () Bool)

(assert (=> b!560370 (= e!322862 e!322859)))

(declare-fun res!351522 () Bool)

(assert (=> b!560370 (=> (not res!351522) (not e!322859))))

(declare-fun lt!254763 () SeekEntryResult!5353)

(assert (=> b!560370 (= res!351522 (or (= lt!254763 (MissingZero!5353 i!1132)) (= lt!254763 (MissingVacant!5353 i!1132))))))

(assert (=> b!560370 (= lt!254763 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!560371 () Bool)

(assert (=> b!560371 (= e!322863 e!322856)))

(declare-fun res!351521 () Bool)

(assert (=> b!560371 (=> res!351521 e!322856)))

(declare-fun lt!254769 () (_ BitVec 64))

(assert (=> b!560371 (= res!351521 (or (= lt!254769 (select (arr!16904 a!3118) j!142)) (= lt!254769 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560371 (= lt!254769 (select (arr!16904 a!3118) (index!23641 lt!254767)))))

(declare-fun b!560372 () Bool)

(assert (=> b!560372 (= e!322859 e!322860)))

(declare-fun res!351518 () Bool)

(assert (=> b!560372 (=> (not res!351518) (not e!322860))))

(declare-fun lt!254765 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35207 (_ BitVec 32)) SeekEntryResult!5353)

(assert (=> b!560372 (= res!351518 (= lt!254767 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254765 lt!254768 lt!254770 mask!3119)))))

(declare-fun lt!254762 () (_ BitVec 32))

(assert (=> b!560372 (= lt!254767 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254762 (select (arr!16904 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560372 (= lt!254765 (toIndex!0 lt!254768 mask!3119))))

(assert (=> b!560372 (= lt!254768 (select (store (arr!16904 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!560372 (= lt!254762 (toIndex!0 (select (arr!16904 a!3118) j!142) mask!3119))))

(assert (=> b!560372 (= lt!254770 (array!35208 (store (arr!16904 a!3118) i!1132 k!1914) (size!17268 a!3118)))))

(assert (= (and start!51342 res!351519) b!560363))

(assert (= (and b!560363 res!351513) b!560368))

(assert (= (and b!560368 res!351520) b!560362))

(assert (= (and b!560362 res!351517) b!560361))

(assert (= (and b!560361 res!351512) b!560370))

(assert (= (and b!560370 res!351522) b!560366))

(assert (= (and b!560366 res!351515) b!560364))

(assert (= (and b!560364 res!351524) b!560372))

(assert (= (and b!560372 res!351518) b!560369))

(assert (= (and b!560369 res!351523) b!560365))

(assert (= (and b!560365 (not res!351516)) b!560371))

(assert (= (and b!560371 (not res!351521)) b!560367))

(assert (= (and b!560367 res!351514) b!560360))

(declare-fun m!538117 () Bool)

(assert (=> b!560369 m!538117))

(assert (=> b!560369 m!538117))

(declare-fun m!538119 () Bool)

(assert (=> b!560369 m!538119))

(declare-fun m!538121 () Bool)

(assert (=> b!560369 m!538121))

(declare-fun m!538123 () Bool)

(assert (=> b!560369 m!538123))

(assert (=> b!560371 m!538117))

(declare-fun m!538125 () Bool)

(assert (=> b!560371 m!538125))

(declare-fun m!538127 () Bool)

(assert (=> b!560360 m!538127))

(declare-fun m!538129 () Bool)

(assert (=> b!560360 m!538129))

(assert (=> b!560367 m!538117))

(assert (=> b!560367 m!538117))

(declare-fun m!538131 () Bool)

(assert (=> b!560367 m!538131))

(declare-fun m!538133 () Bool)

(assert (=> b!560370 m!538133))

(declare-fun m!538135 () Bool)

(assert (=> start!51342 m!538135))

(declare-fun m!538137 () Bool)

(assert (=> start!51342 m!538137))

(declare-fun m!538139 () Bool)

(assert (=> b!560361 m!538139))

(declare-fun m!538141 () Bool)

(assert (=> b!560366 m!538141))

(declare-fun m!538143 () Bool)

(assert (=> b!560364 m!538143))

(assert (=> b!560368 m!538117))

(assert (=> b!560368 m!538117))

(declare-fun m!538145 () Bool)

(assert (=> b!560368 m!538145))

(assert (=> b!560372 m!538117))

(declare-fun m!538147 () Bool)

(assert (=> b!560372 m!538147))

(assert (=> b!560372 m!538117))

(declare-fun m!538149 () Bool)

(assert (=> b!560372 m!538149))

(assert (=> b!560372 m!538117))

(declare-fun m!538151 () Bool)

(assert (=> b!560372 m!538151))

(declare-fun m!538153 () Bool)

(assert (=> b!560372 m!538153))

(declare-fun m!538155 () Bool)

(assert (=> b!560372 m!538155))

(declare-fun m!538157 () Bool)

(assert (=> b!560372 m!538157))

(declare-fun m!538159 () Bool)

(assert (=> b!560362 m!538159))

(push 1)

(assert (not b!560368))

(assert (not start!51342))

(assert (not b!560364))

(assert (not b!560361))

(assert (not b!560362))

(assert (not b!560367))

(assert (not b!560369))

(assert (not b!560370))

(assert (not b!560360))

(assert (not b!560372))

