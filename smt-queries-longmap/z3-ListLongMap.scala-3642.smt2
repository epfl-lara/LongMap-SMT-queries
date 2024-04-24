; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50274 () Bool)

(assert start!50274)

(declare-fun b!549995 () Bool)

(declare-fun res!343035 () Bool)

(declare-fun e!317604 () Bool)

(assert (=> b!549995 (=> (not res!343035) (not e!317604))))

(declare-datatypes ((array!34674 0))(
  ( (array!34675 (arr!16651 (Array (_ BitVec 32) (_ BitVec 64))) (size!17015 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34674)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34674 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549995 (= res!343035 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549996 () Bool)

(declare-fun res!343034 () Bool)

(declare-fun e!317602 () Bool)

(assert (=> b!549996 (=> (not res!343034) (not e!317602))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34674 (_ BitVec 32)) Bool)

(assert (=> b!549996 (= res!343034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!343036 () Bool)

(assert (=> start!50274 (=> (not res!343036) (not e!317604))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50274 (= res!343036 (validMask!0 mask!3119))))

(assert (=> start!50274 e!317604))

(assert (=> start!50274 true))

(declare-fun array_inv!12510 (array!34674) Bool)

(assert (=> start!50274 (array_inv!12510 a!3118)))

(declare-fun b!549997 () Bool)

(declare-fun res!343041 () Bool)

(assert (=> b!549997 (=> (not res!343041) (not e!317604))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549997 (= res!343041 (validKeyInArray!0 k0!1914))))

(declare-fun b!549998 () Bool)

(declare-fun res!343038 () Bool)

(assert (=> b!549998 (=> (not res!343038) (not e!317604))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!549998 (= res!343038 (and (= (size!17015 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17015 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17015 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549999 () Bool)

(assert (=> b!549999 (= e!317602 (not true))))

(assert (=> b!549999 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!16957 0))(
  ( (Unit!16958) )
))
(declare-fun lt!250455 () Unit!16957)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34674 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16957)

(assert (=> b!549999 (= lt!250455 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!550000 () Bool)

(assert (=> b!550000 (= e!317604 e!317602)))

(declare-fun res!343042 () Bool)

(assert (=> b!550000 (=> (not res!343042) (not e!317602))))

(declare-datatypes ((SeekEntryResult!5056 0))(
  ( (MissingZero!5056 (index!22451 (_ BitVec 32))) (Found!5056 (index!22452 (_ BitVec 32))) (Intermediate!5056 (undefined!5868 Bool) (index!22453 (_ BitVec 32)) (x!51533 (_ BitVec 32))) (Undefined!5056) (MissingVacant!5056 (index!22454 (_ BitVec 32))) )
))
(declare-fun lt!250456 () SeekEntryResult!5056)

(assert (=> b!550000 (= res!343042 (or (= lt!250456 (MissingZero!5056 i!1132)) (= lt!250456 (MissingVacant!5056 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34674 (_ BitVec 32)) SeekEntryResult!5056)

(assert (=> b!550000 (= lt!250456 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!550001 () Bool)

(declare-fun res!343039 () Bool)

(assert (=> b!550001 (=> (not res!343039) (not e!317602))))

(declare-datatypes ((List!10638 0))(
  ( (Nil!10635) (Cons!10634 (h!11610 (_ BitVec 64)) (t!16858 List!10638)) )
))
(declare-fun arrayNoDuplicates!0 (array!34674 (_ BitVec 32) List!10638) Bool)

(assert (=> b!550001 (= res!343039 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10635))))

(declare-fun b!550002 () Bool)

(declare-fun res!343037 () Bool)

(assert (=> b!550002 (=> (not res!343037) (not e!317602))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34674 (_ BitVec 32)) SeekEntryResult!5056)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550002 (= res!343037 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16651 a!3118) j!142) mask!3119) (select (arr!16651 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16651 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16651 a!3118) i!1132 k0!1914) j!142) (array!34675 (store (arr!16651 a!3118) i!1132 k0!1914) (size!17015 a!3118)) mask!3119)))))

(declare-fun b!550003 () Bool)

(declare-fun res!343040 () Bool)

(assert (=> b!550003 (=> (not res!343040) (not e!317604))))

(assert (=> b!550003 (= res!343040 (validKeyInArray!0 (select (arr!16651 a!3118) j!142)))))

(assert (= (and start!50274 res!343036) b!549998))

(assert (= (and b!549998 res!343038) b!550003))

(assert (= (and b!550003 res!343040) b!549997))

(assert (= (and b!549997 res!343041) b!549995))

(assert (= (and b!549995 res!343035) b!550000))

(assert (= (and b!550000 res!343042) b!549996))

(assert (= (and b!549996 res!343034) b!550001))

(assert (= (and b!550001 res!343039) b!550002))

(assert (= (and b!550002 res!343037) b!549999))

(declare-fun m!527069 () Bool)

(assert (=> b!550000 m!527069))

(declare-fun m!527071 () Bool)

(assert (=> b!550003 m!527071))

(assert (=> b!550003 m!527071))

(declare-fun m!527073 () Bool)

(assert (=> b!550003 m!527073))

(assert (=> b!550002 m!527071))

(declare-fun m!527075 () Bool)

(assert (=> b!550002 m!527075))

(assert (=> b!550002 m!527071))

(declare-fun m!527077 () Bool)

(assert (=> b!550002 m!527077))

(declare-fun m!527079 () Bool)

(assert (=> b!550002 m!527079))

(assert (=> b!550002 m!527077))

(declare-fun m!527081 () Bool)

(assert (=> b!550002 m!527081))

(assert (=> b!550002 m!527075))

(assert (=> b!550002 m!527071))

(declare-fun m!527083 () Bool)

(assert (=> b!550002 m!527083))

(declare-fun m!527085 () Bool)

(assert (=> b!550002 m!527085))

(assert (=> b!550002 m!527077))

(assert (=> b!550002 m!527079))

(declare-fun m!527087 () Bool)

(assert (=> b!549996 m!527087))

(declare-fun m!527089 () Bool)

(assert (=> start!50274 m!527089))

(declare-fun m!527091 () Bool)

(assert (=> start!50274 m!527091))

(declare-fun m!527093 () Bool)

(assert (=> b!549999 m!527093))

(declare-fun m!527095 () Bool)

(assert (=> b!549999 m!527095))

(declare-fun m!527097 () Bool)

(assert (=> b!549995 m!527097))

(declare-fun m!527099 () Bool)

(assert (=> b!550001 m!527099))

(declare-fun m!527101 () Bool)

(assert (=> b!549997 m!527101))

(check-sat (not b!550003) (not b!549997) (not start!50274) (not b!549999) (not b!549996) (not b!550000) (not b!550001) (not b!549995) (not b!550002))
(check-sat)
