; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50850 () Bool)

(assert start!50850)

(declare-fun res!348355 () Bool)

(declare-fun e!320445 () Bool)

(assert (=> start!50850 (=> (not res!348355) (not e!320445))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50850 (= res!348355 (validMask!0 mask!3119))))

(assert (=> start!50850 e!320445))

(assert (=> start!50850 true))

(declare-datatypes ((array!35022 0))(
  ( (array!35023 (arr!16819 (Array (_ BitVec 32) (_ BitVec 64))) (size!17183 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35022)

(declare-fun array_inv!12678 (array!35022) Bool)

(assert (=> start!50850 (array_inv!12678 a!3118)))

(declare-fun b!556046 () Bool)

(declare-fun res!348353 () Bool)

(assert (=> b!556046 (=> (not res!348353) (not e!320445))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!556046 (= res!348353 (and (= (size!17183 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17183 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17183 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!556047 () Bool)

(declare-fun e!320448 () Bool)

(declare-fun e!320447 () Bool)

(assert (=> b!556047 (= e!320448 e!320447)))

(declare-fun res!348359 () Bool)

(assert (=> b!556047 (=> (not res!348359) (not e!320447))))

(declare-fun lt!252798 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5224 0))(
  ( (MissingZero!5224 (index!23123 (_ BitVec 32))) (Found!5224 (index!23124 (_ BitVec 32))) (Intermediate!5224 (undefined!6036 Bool) (index!23125 (_ BitVec 32)) (x!52173 (_ BitVec 32))) (Undefined!5224) (MissingVacant!5224 (index!23126 (_ BitVec 32))) )
))
(declare-fun lt!252801 () SeekEntryResult!5224)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35022 (_ BitVec 32)) SeekEntryResult!5224)

(assert (=> b!556047 (= res!348359 (= lt!252801 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252798 (select (store (arr!16819 a!3118) i!1132 k0!1914) j!142) (array!35023 (store (arr!16819 a!3118) i!1132 k0!1914) (size!17183 a!3118)) mask!3119)))))

(declare-fun lt!252800 () (_ BitVec 32))

(assert (=> b!556047 (= lt!252801 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252800 (select (arr!16819 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556047 (= lt!252798 (toIndex!0 (select (store (arr!16819 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!556047 (= lt!252800 (toIndex!0 (select (arr!16819 a!3118) j!142) mask!3119))))

(declare-fun b!556048 () Bool)

(declare-fun res!348360 () Bool)

(assert (=> b!556048 (=> (not res!348360) (not e!320448))))

(declare-datatypes ((List!10806 0))(
  ( (Nil!10803) (Cons!10802 (h!11790 (_ BitVec 64)) (t!17026 List!10806)) )
))
(declare-fun arrayNoDuplicates!0 (array!35022 (_ BitVec 32) List!10806) Bool)

(assert (=> b!556048 (= res!348360 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10803))))

(declare-fun b!556049 () Bool)

(assert (=> b!556049 (= e!320445 e!320448)))

(declare-fun res!348354 () Bool)

(assert (=> b!556049 (=> (not res!348354) (not e!320448))))

(declare-fun lt!252799 () SeekEntryResult!5224)

(assert (=> b!556049 (= res!348354 (or (= lt!252799 (MissingZero!5224 i!1132)) (= lt!252799 (MissingVacant!5224 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35022 (_ BitVec 32)) SeekEntryResult!5224)

(assert (=> b!556049 (= lt!252799 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!556050 () Bool)

(declare-fun res!348361 () Bool)

(assert (=> b!556050 (=> (not res!348361) (not e!320445))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556050 (= res!348361 (validKeyInArray!0 k0!1914))))

(declare-fun b!556051 () Bool)

(assert (=> b!556051 (= e!320447 (not true))))

(declare-fun lt!252802 () SeekEntryResult!5224)

(get-info :version)

(assert (=> b!556051 (and (= lt!252802 (Found!5224 j!142)) (or (undefined!6036 lt!252801) (not ((_ is Intermediate!5224) lt!252801)) (= (select (arr!16819 a!3118) (index!23125 lt!252801)) (select (arr!16819 a!3118) j!142)) (not (= (select (arr!16819 a!3118) (index!23125 lt!252801)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252802 (MissingZero!5224 (index!23125 lt!252801)))))))

(assert (=> b!556051 (= lt!252802 (seekEntryOrOpen!0 (select (arr!16819 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35022 (_ BitVec 32)) Bool)

(assert (=> b!556051 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17293 0))(
  ( (Unit!17294) )
))
(declare-fun lt!252797 () Unit!17293)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35022 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17293)

(assert (=> b!556051 (= lt!252797 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!556052 () Bool)

(declare-fun res!348358 () Bool)

(assert (=> b!556052 (=> (not res!348358) (not e!320445))))

(declare-fun arrayContainsKey!0 (array!35022 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556052 (= res!348358 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!556053 () Bool)

(declare-fun res!348357 () Bool)

(assert (=> b!556053 (=> (not res!348357) (not e!320448))))

(assert (=> b!556053 (= res!348357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!556054 () Bool)

(declare-fun res!348356 () Bool)

(assert (=> b!556054 (=> (not res!348356) (not e!320445))))

(assert (=> b!556054 (= res!348356 (validKeyInArray!0 (select (arr!16819 a!3118) j!142)))))

(assert (= (and start!50850 res!348355) b!556046))

(assert (= (and b!556046 res!348353) b!556054))

(assert (= (and b!556054 res!348356) b!556050))

(assert (= (and b!556050 res!348361) b!556052))

(assert (= (and b!556052 res!348358) b!556049))

(assert (= (and b!556049 res!348354) b!556053))

(assert (= (and b!556053 res!348357) b!556048))

(assert (= (and b!556048 res!348360) b!556047))

(assert (= (and b!556047 res!348359) b!556051))

(declare-fun m!534035 () Bool)

(assert (=> b!556049 m!534035))

(declare-fun m!534037 () Bool)

(assert (=> b!556050 m!534037))

(declare-fun m!534039 () Bool)

(assert (=> b!556051 m!534039))

(declare-fun m!534041 () Bool)

(assert (=> b!556051 m!534041))

(declare-fun m!534043 () Bool)

(assert (=> b!556051 m!534043))

(declare-fun m!534045 () Bool)

(assert (=> b!556051 m!534045))

(assert (=> b!556051 m!534039))

(declare-fun m!534047 () Bool)

(assert (=> b!556051 m!534047))

(declare-fun m!534049 () Bool)

(assert (=> start!50850 m!534049))

(declare-fun m!534051 () Bool)

(assert (=> start!50850 m!534051))

(assert (=> b!556047 m!534039))

(declare-fun m!534053 () Bool)

(assert (=> b!556047 m!534053))

(assert (=> b!556047 m!534039))

(declare-fun m!534055 () Bool)

(assert (=> b!556047 m!534055))

(declare-fun m!534057 () Bool)

(assert (=> b!556047 m!534057))

(assert (=> b!556047 m!534055))

(assert (=> b!556047 m!534039))

(declare-fun m!534059 () Bool)

(assert (=> b!556047 m!534059))

(declare-fun m!534061 () Bool)

(assert (=> b!556047 m!534061))

(assert (=> b!556047 m!534055))

(declare-fun m!534063 () Bool)

(assert (=> b!556047 m!534063))

(declare-fun m!534065 () Bool)

(assert (=> b!556048 m!534065))

(declare-fun m!534067 () Bool)

(assert (=> b!556052 m!534067))

(assert (=> b!556054 m!534039))

(assert (=> b!556054 m!534039))

(declare-fun m!534069 () Bool)

(assert (=> b!556054 m!534069))

(declare-fun m!534071 () Bool)

(assert (=> b!556053 m!534071))

(check-sat (not b!556054) (not b!556051) (not b!556050) (not b!556053) (not b!556048) (not start!50850) (not b!556047) (not b!556052) (not b!556049))
(check-sat)
