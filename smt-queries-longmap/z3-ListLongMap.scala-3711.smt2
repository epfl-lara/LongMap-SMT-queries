; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51108 () Bool)

(assert start!51108)

(declare-datatypes ((SeekEntryResult!5263 0))(
  ( (MissingZero!5263 (index!23279 (_ BitVec 32))) (Found!5263 (index!23280 (_ BitVec 32))) (Intermediate!5263 (undefined!6075 Bool) (index!23281 (_ BitVec 32)) (x!52334 (_ BitVec 32))) (Undefined!5263) (MissingVacant!5263 (index!23282 (_ BitVec 32))) )
))
(declare-fun lt!253591 () SeekEntryResult!5263)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!558085 () Bool)

(declare-datatypes ((array!35109 0))(
  ( (array!35110 (arr!16858 (Array (_ BitVec 32) (_ BitVec 64))) (size!17222 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35109)

(declare-fun lt!253592 () SeekEntryResult!5263)

(declare-fun e!321524 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35109 (_ BitVec 32)) SeekEntryResult!5263)

(assert (=> b!558085 (= e!321524 (= lt!253592 (seekKeyOrZeroReturnVacant!0 (x!52334 lt!253591) (index!23281 lt!253591) (index!23281 lt!253591) (select (arr!16858 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!558086 () Bool)

(declare-fun e!321523 () Bool)

(assert (=> b!558086 (= e!321523 (not true))))

(declare-fun e!321521 () Bool)

(assert (=> b!558086 e!321521))

(declare-fun res!349846 () Bool)

(assert (=> b!558086 (=> (not res!349846) (not e!321521))))

(assert (=> b!558086 (= res!349846 (= lt!253592 (Found!5263 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35109 (_ BitVec 32)) SeekEntryResult!5263)

(assert (=> b!558086 (= lt!253592 (seekEntryOrOpen!0 (select (arr!16858 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35109 (_ BitVec 32)) Bool)

(assert (=> b!558086 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17371 0))(
  ( (Unit!17372) )
))
(declare-fun lt!253594 () Unit!17371)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35109 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17371)

(assert (=> b!558086 (= lt!253594 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!558087 () Bool)

(declare-fun e!321525 () Bool)

(assert (=> b!558087 (= e!321525 e!321523)))

(declare-fun res!349843 () Bool)

(assert (=> b!558087 (=> (not res!349843) (not e!321523))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!253589 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35109 (_ BitVec 32)) SeekEntryResult!5263)

(assert (=> b!558087 (= res!349843 (= lt!253591 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253589 (select (store (arr!16858 a!3118) i!1132 k0!1914) j!142) (array!35110 (store (arr!16858 a!3118) i!1132 k0!1914) (size!17222 a!3118)) mask!3119)))))

(declare-fun lt!253590 () (_ BitVec 32))

(assert (=> b!558087 (= lt!253591 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253590 (select (arr!16858 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558087 (= lt!253589 (toIndex!0 (select (store (arr!16858 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!558087 (= lt!253590 (toIndex!0 (select (arr!16858 a!3118) j!142) mask!3119))))

(declare-fun b!558088 () Bool)

(declare-fun res!349848 () Bool)

(declare-fun e!321522 () Bool)

(assert (=> b!558088 (=> (not res!349848) (not e!321522))))

(declare-fun arrayContainsKey!0 (array!35109 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!558088 (= res!349848 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!558089 () Bool)

(declare-fun res!349844 () Bool)

(assert (=> b!558089 (=> (not res!349844) (not e!321525))))

(assert (=> b!558089 (= res!349844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!558090 () Bool)

(assert (=> b!558090 (= e!321521 e!321524)))

(declare-fun res!349852 () Bool)

(assert (=> b!558090 (=> res!349852 e!321524)))

(get-info :version)

(assert (=> b!558090 (= res!349852 (or (undefined!6075 lt!253591) (not ((_ is Intermediate!5263) lt!253591)) (= (select (arr!16858 a!3118) (index!23281 lt!253591)) (select (arr!16858 a!3118) j!142)) (= (select (arr!16858 a!3118) (index!23281 lt!253591)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!349851 () Bool)

(assert (=> start!51108 (=> (not res!349851) (not e!321522))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51108 (= res!349851 (validMask!0 mask!3119))))

(assert (=> start!51108 e!321522))

(assert (=> start!51108 true))

(declare-fun array_inv!12717 (array!35109) Bool)

(assert (=> start!51108 (array_inv!12717 a!3118)))

(declare-fun b!558084 () Bool)

(declare-fun res!349849 () Bool)

(assert (=> b!558084 (=> (not res!349849) (not e!321525))))

(declare-datatypes ((List!10845 0))(
  ( (Nil!10842) (Cons!10841 (h!11838 (_ BitVec 64)) (t!17065 List!10845)) )
))
(declare-fun arrayNoDuplicates!0 (array!35109 (_ BitVec 32) List!10845) Bool)

(assert (=> b!558084 (= res!349849 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10842))))

(declare-fun b!558091 () Bool)

(declare-fun res!349847 () Bool)

(assert (=> b!558091 (=> (not res!349847) (not e!321522))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!558091 (= res!349847 (validKeyInArray!0 (select (arr!16858 a!3118) j!142)))))

(declare-fun b!558092 () Bool)

(assert (=> b!558092 (= e!321522 e!321525)))

(declare-fun res!349845 () Bool)

(assert (=> b!558092 (=> (not res!349845) (not e!321525))))

(declare-fun lt!253593 () SeekEntryResult!5263)

(assert (=> b!558092 (= res!349845 (or (= lt!253593 (MissingZero!5263 i!1132)) (= lt!253593 (MissingVacant!5263 i!1132))))))

(assert (=> b!558092 (= lt!253593 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!558093 () Bool)

(declare-fun res!349842 () Bool)

(assert (=> b!558093 (=> (not res!349842) (not e!321522))))

(assert (=> b!558093 (= res!349842 (validKeyInArray!0 k0!1914))))

(declare-fun b!558094 () Bool)

(declare-fun res!349850 () Bool)

(assert (=> b!558094 (=> (not res!349850) (not e!321522))))

(assert (=> b!558094 (= res!349850 (and (= (size!17222 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17222 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17222 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51108 res!349851) b!558094))

(assert (= (and b!558094 res!349850) b!558091))

(assert (= (and b!558091 res!349847) b!558093))

(assert (= (and b!558093 res!349842) b!558088))

(assert (= (and b!558088 res!349848) b!558092))

(assert (= (and b!558092 res!349845) b!558089))

(assert (= (and b!558089 res!349844) b!558084))

(assert (= (and b!558084 res!349849) b!558087))

(assert (= (and b!558087 res!349843) b!558086))

(assert (= (and b!558086 res!349846) b!558090))

(assert (= (and b!558090 (not res!349852)) b!558085))

(declare-fun m!536087 () Bool)

(assert (=> b!558085 m!536087))

(assert (=> b!558085 m!536087))

(declare-fun m!536089 () Bool)

(assert (=> b!558085 m!536089))

(assert (=> b!558087 m!536087))

(declare-fun m!536091 () Bool)

(assert (=> b!558087 m!536091))

(assert (=> b!558087 m!536087))

(assert (=> b!558087 m!536087))

(declare-fun m!536093 () Bool)

(assert (=> b!558087 m!536093))

(declare-fun m!536095 () Bool)

(assert (=> b!558087 m!536095))

(assert (=> b!558087 m!536095))

(declare-fun m!536097 () Bool)

(assert (=> b!558087 m!536097))

(declare-fun m!536099 () Bool)

(assert (=> b!558087 m!536099))

(assert (=> b!558087 m!536095))

(declare-fun m!536101 () Bool)

(assert (=> b!558087 m!536101))

(declare-fun m!536103 () Bool)

(assert (=> b!558090 m!536103))

(assert (=> b!558090 m!536087))

(assert (=> b!558091 m!536087))

(assert (=> b!558091 m!536087))

(declare-fun m!536105 () Bool)

(assert (=> b!558091 m!536105))

(declare-fun m!536107 () Bool)

(assert (=> b!558084 m!536107))

(declare-fun m!536109 () Bool)

(assert (=> b!558092 m!536109))

(declare-fun m!536111 () Bool)

(assert (=> b!558093 m!536111))

(declare-fun m!536113 () Bool)

(assert (=> b!558088 m!536113))

(assert (=> b!558086 m!536087))

(assert (=> b!558086 m!536087))

(declare-fun m!536115 () Bool)

(assert (=> b!558086 m!536115))

(declare-fun m!536117 () Bool)

(assert (=> b!558086 m!536117))

(declare-fun m!536119 () Bool)

(assert (=> b!558086 m!536119))

(declare-fun m!536121 () Bool)

(assert (=> start!51108 m!536121))

(declare-fun m!536123 () Bool)

(assert (=> start!51108 m!536123))

(declare-fun m!536125 () Bool)

(assert (=> b!558089 m!536125))

(check-sat (not b!558086) (not b!558087) (not b!558088) (not start!51108) (not b!558092) (not b!558093) (not b!558084) (not b!558091) (not b!558085) (not b!558089))
(check-sat)
