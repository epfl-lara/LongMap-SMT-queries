; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51372 () Bool)

(assert start!51372)

(declare-fun b!560241 () Bool)

(declare-fun res!351288 () Bool)

(declare-fun e!322794 () Bool)

(assert (=> b!560241 (=> (not res!351288) (not e!322794))))

(declare-datatypes ((array!35184 0))(
  ( (array!35185 (arr!16891 (Array (_ BitVec 32) (_ BitVec 64))) (size!17255 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35184)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35184 (_ BitVec 32)) Bool)

(assert (=> b!560241 (= res!351288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560242 () Bool)

(declare-fun res!351298 () Bool)

(declare-fun e!322791 () Bool)

(assert (=> b!560242 (=> (not res!351298) (not e!322791))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560242 (= res!351298 (and (= (size!17255 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17255 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17255 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560243 () Bool)

(declare-fun res!351296 () Bool)

(assert (=> b!560243 (=> (not res!351296) (not e!322791))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35184 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560243 (= res!351296 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560244 () Bool)

(declare-fun e!322786 () Bool)

(assert (=> b!560244 (= e!322794 e!322786)))

(declare-fun res!351291 () Bool)

(assert (=> b!560244 (=> (not res!351291) (not e!322786))))

(declare-fun lt!254665 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5296 0))(
  ( (MissingZero!5296 (index!23411 (_ BitVec 32))) (Found!5296 (index!23412 (_ BitVec 32))) (Intermediate!5296 (undefined!6108 Bool) (index!23413 (_ BitVec 32)) (x!52482 (_ BitVec 32))) (Undefined!5296) (MissingVacant!5296 (index!23414 (_ BitVec 32))) )
))
(declare-fun lt!254660 () SeekEntryResult!5296)

(declare-fun lt!254659 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35184 (_ BitVec 32)) SeekEntryResult!5296)

(assert (=> b!560244 (= res!351291 (= lt!254660 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254659 lt!254665 (array!35185 (store (arr!16891 a!3118) i!1132 k0!1914) (size!17255 a!3118)) mask!3119)))))

(declare-fun lt!254661 () (_ BitVec 32))

(assert (=> b!560244 (= lt!254660 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254661 (select (arr!16891 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560244 (= lt!254659 (toIndex!0 lt!254665 mask!3119))))

(assert (=> b!560244 (= lt!254665 (select (store (arr!16891 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!560244 (= lt!254661 (toIndex!0 (select (arr!16891 a!3118) j!142) mask!3119))))

(declare-fun b!560245 () Bool)

(declare-fun e!322788 () Bool)

(declare-fun e!322787 () Bool)

(assert (=> b!560245 (= e!322788 e!322787)))

(declare-fun res!351295 () Bool)

(assert (=> b!560245 (=> res!351295 e!322787)))

(get-info :version)

(assert (=> b!560245 (= res!351295 (or (undefined!6108 lt!254660) (not ((_ is Intermediate!5296) lt!254660))))))

(declare-fun b!560246 () Bool)

(declare-fun e!322792 () Bool)

(declare-fun e!322790 () Bool)

(assert (=> b!560246 (= e!322792 e!322790)))

(declare-fun res!351290 () Bool)

(assert (=> b!560246 (=> res!351290 e!322790)))

(declare-fun lt!254664 () (_ BitVec 64))

(assert (=> b!560246 (= res!351290 (or (= lt!254664 (select (arr!16891 a!3118) j!142)) (= lt!254664 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (bvslt (index!23413 lt!254660) #b00000000000000000000000000000000) (bvsge (index!23413 lt!254660) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52482 lt!254660) #b01111111111111111111111111111110) (bvslt (x!52482 lt!254660) #b00000000000000000000000000000000) (not (= (select (store (arr!16891 a!3118) i!1132 k0!1914) (index!23413 lt!254660)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!560246 (= lt!254664 (select (arr!16891 a!3118) (index!23413 lt!254660)))))

(declare-fun res!351300 () Bool)

(assert (=> start!51372 (=> (not res!351300) (not e!322791))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51372 (= res!351300 (validMask!0 mask!3119))))

(assert (=> start!51372 e!322791))

(assert (=> start!51372 true))

(declare-fun array_inv!12750 (array!35184) Bool)

(assert (=> start!51372 (array_inv!12750 a!3118)))

(declare-fun b!560247 () Bool)

(assert (=> b!560247 (= e!322791 e!322794)))

(declare-fun res!351297 () Bool)

(assert (=> b!560247 (=> (not res!351297) (not e!322794))))

(declare-fun lt!254658 () SeekEntryResult!5296)

(assert (=> b!560247 (= res!351297 (or (= lt!254658 (MissingZero!5296 i!1132)) (= lt!254658 (MissingVacant!5296 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35184 (_ BitVec 32)) SeekEntryResult!5296)

(assert (=> b!560247 (= lt!254658 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!560248 () Bool)

(assert (=> b!560248 (= e!322786 (not e!322792))))

(declare-fun res!351289 () Bool)

(assert (=> b!560248 (=> res!351289 e!322792)))

(assert (=> b!560248 (= res!351289 (or (undefined!6108 lt!254660) (not ((_ is Intermediate!5296) lt!254660))))))

(assert (=> b!560248 e!322788))

(declare-fun res!351292 () Bool)

(assert (=> b!560248 (=> (not res!351292) (not e!322788))))

(declare-fun lt!254657 () SeekEntryResult!5296)

(assert (=> b!560248 (= res!351292 (= lt!254657 (Found!5296 j!142)))))

(assert (=> b!560248 (= lt!254657 (seekEntryOrOpen!0 (select (arr!16891 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!560248 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17437 0))(
  ( (Unit!17438) )
))
(declare-fun lt!254662 () Unit!17437)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35184 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17437)

(assert (=> b!560248 (= lt!254662 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560249 () Bool)

(declare-fun res!351293 () Bool)

(assert (=> b!560249 (=> (not res!351293) (not e!322791))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560249 (= res!351293 (validKeyInArray!0 (select (arr!16891 a!3118) j!142)))))

(declare-fun b!560250 () Bool)

(declare-fun e!322789 () Bool)

(assert (=> b!560250 (= e!322787 e!322789)))

(declare-fun res!351294 () Bool)

(assert (=> b!560250 (=> res!351294 e!322789)))

(declare-fun lt!254663 () (_ BitVec 64))

(assert (=> b!560250 (= res!351294 (or (= lt!254663 (select (arr!16891 a!3118) j!142)) (= lt!254663 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560250 (= lt!254663 (select (arr!16891 a!3118) (index!23413 lt!254660)))))

(declare-fun b!560251 () Bool)

(declare-fun res!351301 () Bool)

(assert (=> b!560251 (=> (not res!351301) (not e!322794))))

(declare-datatypes ((List!10878 0))(
  ( (Nil!10875) (Cons!10874 (h!11880 (_ BitVec 64)) (t!17098 List!10878)) )
))
(declare-fun arrayNoDuplicates!0 (array!35184 (_ BitVec 32) List!10878) Bool)

(assert (=> b!560251 (= res!351301 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10875))))

(declare-fun b!560252 () Bool)

(declare-fun res!351299 () Bool)

(assert (=> b!560252 (=> (not res!351299) (not e!322791))))

(assert (=> b!560252 (= res!351299 (validKeyInArray!0 k0!1914))))

(declare-fun b!560253 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35184 (_ BitVec 32)) SeekEntryResult!5296)

(assert (=> b!560253 (= e!322789 (= lt!254657 (seekKeyOrZeroReturnVacant!0 (x!52482 lt!254660) (index!23413 lt!254660) (index!23413 lt!254660) (select (arr!16891 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!560254 () Bool)

(assert (=> b!560254 (= e!322790 (validKeyInArray!0 lt!254665))))

(assert (= (and start!51372 res!351300) b!560242))

(assert (= (and b!560242 res!351298) b!560249))

(assert (= (and b!560249 res!351293) b!560252))

(assert (= (and b!560252 res!351299) b!560243))

(assert (= (and b!560243 res!351296) b!560247))

(assert (= (and b!560247 res!351297) b!560241))

(assert (= (and b!560241 res!351288) b!560251))

(assert (= (and b!560251 res!351301) b!560244))

(assert (= (and b!560244 res!351291) b!560248))

(assert (= (and b!560248 res!351292) b!560245))

(assert (= (and b!560245 (not res!351295)) b!560250))

(assert (= (and b!560250 (not res!351294)) b!560253))

(assert (= (and b!560248 (not res!351289)) b!560246))

(assert (= (and b!560246 (not res!351290)) b!560254))

(declare-fun m!538103 () Bool)

(assert (=> b!560252 m!538103))

(declare-fun m!538105 () Bool)

(assert (=> b!560250 m!538105))

(declare-fun m!538107 () Bool)

(assert (=> b!560250 m!538107))

(assert (=> b!560244 m!538105))

(declare-fun m!538109 () Bool)

(assert (=> b!560244 m!538109))

(assert (=> b!560244 m!538105))

(declare-fun m!538111 () Bool)

(assert (=> b!560244 m!538111))

(declare-fun m!538113 () Bool)

(assert (=> b!560244 m!538113))

(declare-fun m!538115 () Bool)

(assert (=> b!560244 m!538115))

(declare-fun m!538117 () Bool)

(assert (=> b!560244 m!538117))

(assert (=> b!560244 m!538105))

(declare-fun m!538119 () Bool)

(assert (=> b!560244 m!538119))

(declare-fun m!538121 () Bool)

(assert (=> b!560243 m!538121))

(declare-fun m!538123 () Bool)

(assert (=> b!560241 m!538123))

(assert (=> b!560248 m!538105))

(assert (=> b!560248 m!538105))

(declare-fun m!538125 () Bool)

(assert (=> b!560248 m!538125))

(declare-fun m!538127 () Bool)

(assert (=> b!560248 m!538127))

(declare-fun m!538129 () Bool)

(assert (=> b!560248 m!538129))

(declare-fun m!538131 () Bool)

(assert (=> b!560247 m!538131))

(assert (=> b!560246 m!538105))

(assert (=> b!560246 m!538117))

(declare-fun m!538133 () Bool)

(assert (=> b!560246 m!538133))

(assert (=> b!560246 m!538107))

(assert (=> b!560253 m!538105))

(assert (=> b!560253 m!538105))

(declare-fun m!538135 () Bool)

(assert (=> b!560253 m!538135))

(declare-fun m!538137 () Bool)

(assert (=> b!560254 m!538137))

(declare-fun m!538139 () Bool)

(assert (=> b!560251 m!538139))

(declare-fun m!538141 () Bool)

(assert (=> start!51372 m!538141))

(declare-fun m!538143 () Bool)

(assert (=> start!51372 m!538143))

(assert (=> b!560249 m!538105))

(assert (=> b!560249 m!538105))

(declare-fun m!538145 () Bool)

(assert (=> b!560249 m!538145))

(check-sat (not b!560253) (not start!51372) (not b!560248) (not b!560249) (not b!560247) (not b!560251) (not b!560243) (not b!560254) (not b!560252) (not b!560241) (not b!560244))
(check-sat)
