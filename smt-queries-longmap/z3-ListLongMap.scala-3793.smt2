; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52098 () Bool)

(assert start!52098)

(declare-fun b!568573 () Bool)

(declare-fun res!358672 () Bool)

(declare-fun e!327181 () Bool)

(assert (=> b!568573 (=> (not res!358672) (not e!327181))))

(declare-datatypes ((array!35625 0))(
  ( (array!35626 (arr!17104 (Array (_ BitVec 32) (_ BitVec 64))) (size!17468 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35625)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35625 (_ BitVec 32)) Bool)

(assert (=> b!568573 (= res!358672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!568574 () Bool)

(assert (=> b!568574 (= e!327181 (not true))))

(declare-fun e!327182 () Bool)

(assert (=> b!568574 e!327182))

(declare-fun res!358675 () Bool)

(assert (=> b!568574 (=> (not res!358675) (not e!327182))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!568574 (= res!358675 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17791 0))(
  ( (Unit!17792) )
))
(declare-fun lt!259041 () Unit!17791)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35625 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17791)

(assert (=> b!568574 (= lt!259041 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!568575 () Bool)

(declare-fun res!358678 () Bool)

(declare-fun e!327180 () Bool)

(assert (=> b!568575 (=> (not res!358678) (not e!327180))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35625 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!568575 (= res!358678 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!568576 () Bool)

(declare-fun res!358669 () Bool)

(assert (=> b!568576 (=> (not res!358669) (not e!327180))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!568576 (= res!358669 (validKeyInArray!0 (select (arr!17104 a!3118) j!142)))))

(declare-fun b!568577 () Bool)

(declare-fun res!358671 () Bool)

(assert (=> b!568577 (=> (not res!358671) (not e!327181))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5509 0))(
  ( (MissingZero!5509 (index!24263 (_ BitVec 32))) (Found!5509 (index!24264 (_ BitVec 32))) (Intermediate!5509 (undefined!6321 Bool) (index!24265 (_ BitVec 32)) (x!53293 (_ BitVec 32))) (Undefined!5509) (MissingVacant!5509 (index!24266 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35625 (_ BitVec 32)) SeekEntryResult!5509)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568577 (= res!358671 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17104 a!3118) j!142) mask!3119) (select (arr!17104 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17104 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17104 a!3118) i!1132 k0!1914) j!142) (array!35626 (store (arr!17104 a!3118) i!1132 k0!1914) (size!17468 a!3118)) mask!3119)))))

(declare-fun b!568578 () Bool)

(declare-fun res!358674 () Bool)

(assert (=> b!568578 (=> (not res!358674) (not e!327180))))

(assert (=> b!568578 (= res!358674 (validKeyInArray!0 k0!1914))))

(declare-fun b!568579 () Bool)

(declare-fun res!358677 () Bool)

(assert (=> b!568579 (=> (not res!358677) (not e!327181))))

(declare-datatypes ((List!11091 0))(
  ( (Nil!11088) (Cons!11087 (h!12108 (_ BitVec 64)) (t!17311 List!11091)) )
))
(declare-fun arrayNoDuplicates!0 (array!35625 (_ BitVec 32) List!11091) Bool)

(assert (=> b!568579 (= res!358677 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11088))))

(declare-fun b!568581 () Bool)

(declare-fun res!358670 () Bool)

(assert (=> b!568581 (=> (not res!358670) (not e!327180))))

(assert (=> b!568581 (= res!358670 (and (= (size!17468 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17468 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17468 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!568582 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35625 (_ BitVec 32)) SeekEntryResult!5509)

(assert (=> b!568582 (= e!327182 (= (seekEntryOrOpen!0 (select (arr!17104 a!3118) j!142) a!3118 mask!3119) (Found!5509 j!142)))))

(declare-fun res!358673 () Bool)

(assert (=> start!52098 (=> (not res!358673) (not e!327180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52098 (= res!358673 (validMask!0 mask!3119))))

(assert (=> start!52098 e!327180))

(assert (=> start!52098 true))

(declare-fun array_inv!12963 (array!35625) Bool)

(assert (=> start!52098 (array_inv!12963 a!3118)))

(declare-fun b!568580 () Bool)

(assert (=> b!568580 (= e!327180 e!327181)))

(declare-fun res!358676 () Bool)

(assert (=> b!568580 (=> (not res!358676) (not e!327181))))

(declare-fun lt!259042 () SeekEntryResult!5509)

(assert (=> b!568580 (= res!358676 (or (= lt!259042 (MissingZero!5509 i!1132)) (= lt!259042 (MissingVacant!5509 i!1132))))))

(assert (=> b!568580 (= lt!259042 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!52098 res!358673) b!568581))

(assert (= (and b!568581 res!358670) b!568576))

(assert (= (and b!568576 res!358669) b!568578))

(assert (= (and b!568578 res!358674) b!568575))

(assert (= (and b!568575 res!358678) b!568580))

(assert (= (and b!568580 res!358676) b!568573))

(assert (= (and b!568573 res!358672) b!568579))

(assert (= (and b!568579 res!358677) b!568577))

(assert (= (and b!568577 res!358671) b!568574))

(assert (= (and b!568574 res!358675) b!568582))

(declare-fun m!547229 () Bool)

(assert (=> b!568575 m!547229))

(declare-fun m!547231 () Bool)

(assert (=> b!568579 m!547231))

(declare-fun m!547233 () Bool)

(assert (=> b!568580 m!547233))

(declare-fun m!547235 () Bool)

(assert (=> b!568576 m!547235))

(assert (=> b!568576 m!547235))

(declare-fun m!547237 () Bool)

(assert (=> b!568576 m!547237))

(assert (=> b!568577 m!547235))

(declare-fun m!547239 () Bool)

(assert (=> b!568577 m!547239))

(assert (=> b!568577 m!547235))

(declare-fun m!547241 () Bool)

(assert (=> b!568577 m!547241))

(declare-fun m!547243 () Bool)

(assert (=> b!568577 m!547243))

(assert (=> b!568577 m!547241))

(declare-fun m!547245 () Bool)

(assert (=> b!568577 m!547245))

(assert (=> b!568577 m!547239))

(assert (=> b!568577 m!547235))

(declare-fun m!547247 () Bool)

(assert (=> b!568577 m!547247))

(declare-fun m!547249 () Bool)

(assert (=> b!568577 m!547249))

(assert (=> b!568577 m!547241))

(assert (=> b!568577 m!547243))

(assert (=> b!568582 m!547235))

(assert (=> b!568582 m!547235))

(declare-fun m!547251 () Bool)

(assert (=> b!568582 m!547251))

(declare-fun m!547253 () Bool)

(assert (=> b!568573 m!547253))

(declare-fun m!547255 () Bool)

(assert (=> b!568574 m!547255))

(declare-fun m!547257 () Bool)

(assert (=> b!568574 m!547257))

(declare-fun m!547259 () Bool)

(assert (=> b!568578 m!547259))

(declare-fun m!547261 () Bool)

(assert (=> start!52098 m!547261))

(declare-fun m!547263 () Bool)

(assert (=> start!52098 m!547263))

(check-sat (not b!568573) (not start!52098) (not b!568582) (not b!568577) (not b!568578) (not b!568579) (not b!568580) (not b!568574) (not b!568575) (not b!568576))
(check-sat)
