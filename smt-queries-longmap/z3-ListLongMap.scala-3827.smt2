; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52494 () Bool)

(assert start!52494)

(declare-fun b!572899 () Bool)

(declare-fun e!329566 () Bool)

(declare-fun e!329565 () Bool)

(assert (=> b!572899 (= e!329566 e!329565)))

(declare-fun res!362311 () Bool)

(assert (=> b!572899 (=> (not res!362311) (not e!329565))))

(declare-fun lt!261535 () (_ BitVec 32))

(declare-datatypes ((array!35838 0))(
  ( (array!35839 (arr!17206 (Array (_ BitVec 32) (_ BitVec 64))) (size!17570 (_ BitVec 32))) )
))
(declare-fun lt!261534 () array!35838)

(declare-fun lt!261529 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5611 0))(
  ( (MissingZero!5611 (index!24671 (_ BitVec 32))) (Found!5611 (index!24672 (_ BitVec 32))) (Intermediate!5611 (undefined!6423 Bool) (index!24673 (_ BitVec 32)) (x!53691 (_ BitVec 32))) (Undefined!5611) (MissingVacant!5611 (index!24674 (_ BitVec 32))) )
))
(declare-fun lt!261533 () SeekEntryResult!5611)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35838 (_ BitVec 32)) SeekEntryResult!5611)

(assert (=> b!572899 (= res!362311 (= lt!261533 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261535 lt!261529 lt!261534 mask!3119)))))

(declare-fun lt!261527 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun a!3118 () array!35838)

(assert (=> b!572899 (= lt!261533 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261527 (select (arr!17206 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572899 (= lt!261535 (toIndex!0 lt!261529 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!572899 (= lt!261529 (select (store (arr!17206 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!572899 (= lt!261527 (toIndex!0 (select (arr!17206 a!3118) j!142) mask!3119))))

(assert (=> b!572899 (= lt!261534 (array!35839 (store (arr!17206 a!3118) i!1132 k0!1914) (size!17570 a!3118)))))

(declare-fun b!572900 () Bool)

(declare-fun e!329570 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35838 (_ BitVec 32)) SeekEntryResult!5611)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35838 (_ BitVec 32)) SeekEntryResult!5611)

(assert (=> b!572900 (= e!329570 (= (seekEntryOrOpen!0 lt!261529 lt!261534 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53691 lt!261533) (index!24673 lt!261533) (index!24673 lt!261533) lt!261529 lt!261534 mask!3119)))))

(declare-fun b!572901 () Bool)

(declare-fun res!362308 () Bool)

(assert (=> b!572901 (=> (not res!362308) (not e!329566))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35838 (_ BitVec 32)) Bool)

(assert (=> b!572901 (= res!362308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!572903 () Bool)

(declare-fun e!329564 () Bool)

(assert (=> b!572903 (= e!329564 e!329566)))

(declare-fun res!362314 () Bool)

(assert (=> b!572903 (=> (not res!362314) (not e!329566))))

(declare-fun lt!261528 () SeekEntryResult!5611)

(assert (=> b!572903 (= res!362314 (or (= lt!261528 (MissingZero!5611 i!1132)) (= lt!261528 (MissingVacant!5611 i!1132))))))

(assert (=> b!572903 (= lt!261528 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!572904 () Bool)

(declare-fun e!329569 () Bool)

(declare-fun e!329571 () Bool)

(assert (=> b!572904 (= e!329569 e!329571)))

(declare-fun res!362306 () Bool)

(assert (=> b!572904 (=> res!362306 e!329571)))

(declare-fun lt!261532 () (_ BitVec 64))

(assert (=> b!572904 (= res!362306 (or (= lt!261532 (select (arr!17206 a!3118) j!142)) (= lt!261532 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!572904 (= lt!261532 (select (arr!17206 a!3118) (index!24673 lt!261533)))))

(declare-fun b!572905 () Bool)

(declare-fun res!362305 () Bool)

(assert (=> b!572905 (=> (not res!362305) (not e!329564))))

(assert (=> b!572905 (= res!362305 (and (= (size!17570 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17570 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17570 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!572906 () Bool)

(declare-fun res!362307 () Bool)

(assert (=> b!572906 (=> (not res!362307) (not e!329566))))

(declare-datatypes ((List!11193 0))(
  ( (Nil!11190) (Cons!11189 (h!12219 (_ BitVec 64)) (t!17413 List!11193)) )
))
(declare-fun arrayNoDuplicates!0 (array!35838 (_ BitVec 32) List!11193) Bool)

(assert (=> b!572906 (= res!362307 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11190))))

(declare-fun b!572907 () Bool)

(assert (=> b!572907 (= e!329571 e!329570)))

(declare-fun res!362309 () Bool)

(assert (=> b!572907 (=> (not res!362309) (not e!329570))))

(declare-fun lt!261531 () SeekEntryResult!5611)

(assert (=> b!572907 (= res!362309 (= lt!261531 (seekKeyOrZeroReturnVacant!0 (x!53691 lt!261533) (index!24673 lt!261533) (index!24673 lt!261533) (select (arr!17206 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!572908 () Bool)

(declare-fun res!362312 () Bool)

(assert (=> b!572908 (=> (not res!362312) (not e!329564))))

(declare-fun arrayContainsKey!0 (array!35838 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572908 (= res!362312 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572909 () Bool)

(declare-fun res!362302 () Bool)

(assert (=> b!572909 (=> (not res!362302) (not e!329564))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572909 (= res!362302 (validKeyInArray!0 (select (arr!17206 a!3118) j!142)))))

(declare-fun b!572910 () Bool)

(declare-fun res!362303 () Bool)

(assert (=> b!572910 (=> (not res!362303) (not e!329564))))

(assert (=> b!572910 (= res!362303 (validKeyInArray!0 k0!1914))))

(declare-fun b!572911 () Bool)

(declare-fun e!329567 () Bool)

(assert (=> b!572911 (= e!329567 e!329569)))

(declare-fun res!362313 () Bool)

(assert (=> b!572911 (=> res!362313 e!329569)))

(get-info :version)

(assert (=> b!572911 (= res!362313 (or (undefined!6423 lt!261533) (not ((_ is Intermediate!5611) lt!261533))))))

(declare-fun b!572902 () Bool)

(assert (=> b!572902 (= e!329565 (not true))))

(assert (=> b!572902 e!329567))

(declare-fun res!362304 () Bool)

(assert (=> b!572902 (=> (not res!362304) (not e!329567))))

(assert (=> b!572902 (= res!362304 (= lt!261531 (Found!5611 j!142)))))

(assert (=> b!572902 (= lt!261531 (seekEntryOrOpen!0 (select (arr!17206 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!572902 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17995 0))(
  ( (Unit!17996) )
))
(declare-fun lt!261530 () Unit!17995)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35838 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17995)

(assert (=> b!572902 (= lt!261530 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!362310 () Bool)

(assert (=> start!52494 (=> (not res!362310) (not e!329564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52494 (= res!362310 (validMask!0 mask!3119))))

(assert (=> start!52494 e!329564))

(assert (=> start!52494 true))

(declare-fun array_inv!13065 (array!35838) Bool)

(assert (=> start!52494 (array_inv!13065 a!3118)))

(assert (= (and start!52494 res!362310) b!572905))

(assert (= (and b!572905 res!362305) b!572909))

(assert (= (and b!572909 res!362302) b!572910))

(assert (= (and b!572910 res!362303) b!572908))

(assert (= (and b!572908 res!362312) b!572903))

(assert (= (and b!572903 res!362314) b!572901))

(assert (= (and b!572901 res!362308) b!572906))

(assert (= (and b!572906 res!362307) b!572899))

(assert (= (and b!572899 res!362311) b!572902))

(assert (= (and b!572902 res!362304) b!572911))

(assert (= (and b!572911 (not res!362313)) b!572904))

(assert (= (and b!572904 (not res!362306)) b!572907))

(assert (= (and b!572907 res!362309) b!572900))

(declare-fun m!552047 () Bool)

(assert (=> b!572903 m!552047))

(declare-fun m!552049 () Bool)

(assert (=> b!572910 m!552049))

(declare-fun m!552051 () Bool)

(assert (=> b!572906 m!552051))

(declare-fun m!552053 () Bool)

(assert (=> b!572900 m!552053))

(declare-fun m!552055 () Bool)

(assert (=> b!572900 m!552055))

(declare-fun m!552057 () Bool)

(assert (=> b!572909 m!552057))

(assert (=> b!572909 m!552057))

(declare-fun m!552059 () Bool)

(assert (=> b!572909 m!552059))

(declare-fun m!552061 () Bool)

(assert (=> b!572901 m!552061))

(assert (=> b!572902 m!552057))

(assert (=> b!572902 m!552057))

(declare-fun m!552063 () Bool)

(assert (=> b!572902 m!552063))

(declare-fun m!552065 () Bool)

(assert (=> b!572902 m!552065))

(declare-fun m!552067 () Bool)

(assert (=> b!572902 m!552067))

(declare-fun m!552069 () Bool)

(assert (=> b!572908 m!552069))

(declare-fun m!552071 () Bool)

(assert (=> start!52494 m!552071))

(declare-fun m!552073 () Bool)

(assert (=> start!52494 m!552073))

(assert (=> b!572904 m!552057))

(declare-fun m!552075 () Bool)

(assert (=> b!572904 m!552075))

(assert (=> b!572899 m!552057))

(declare-fun m!552077 () Bool)

(assert (=> b!572899 m!552077))

(assert (=> b!572899 m!552057))

(declare-fun m!552079 () Bool)

(assert (=> b!572899 m!552079))

(declare-fun m!552081 () Bool)

(assert (=> b!572899 m!552081))

(declare-fun m!552083 () Bool)

(assert (=> b!572899 m!552083))

(declare-fun m!552085 () Bool)

(assert (=> b!572899 m!552085))

(assert (=> b!572899 m!552057))

(declare-fun m!552087 () Bool)

(assert (=> b!572899 m!552087))

(assert (=> b!572907 m!552057))

(assert (=> b!572907 m!552057))

(declare-fun m!552089 () Bool)

(assert (=> b!572907 m!552089))

(check-sat (not b!572899) (not b!572906) (not start!52494) (not b!572901) (not b!572900) (not b!572910) (not b!572903) (not b!572909) (not b!572902) (not b!572908) (not b!572907))
(check-sat)
