; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51452 () Bool)

(assert start!51452)

(declare-fun res!353734 () Bool)

(declare-fun e!324119 () Bool)

(assert (=> start!51452 (=> (not res!353734) (not e!324119))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51452 (= res!353734 (validMask!0 mask!3119))))

(assert (=> start!51452 e!324119))

(assert (=> start!51452 true))

(declare-datatypes ((array!35326 0))(
  ( (array!35327 (arr!16964 (Array (_ BitVec 32) (_ BitVec 64))) (size!17329 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35326)

(declare-fun array_inv!12847 (array!35326) Bool)

(assert (=> start!51452 (array_inv!12847 a!3118)))

(declare-fun b!562439 () Bool)

(declare-fun res!353741 () Bool)

(assert (=> b!562439 (=> (not res!353741) (not e!324119))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562439 (= res!353741 (validKeyInArray!0 (select (arr!16964 a!3118) j!142)))))

(declare-fun b!562440 () Bool)

(declare-fun e!324120 () Bool)

(declare-fun e!324118 () Bool)

(assert (=> b!562440 (= e!324120 e!324118)))

(declare-fun res!353742 () Bool)

(assert (=> b!562440 (=> res!353742 e!324118)))

(declare-fun lt!256324 () (_ BitVec 64))

(assert (=> b!562440 (= res!353742 (or (= lt!256324 (select (arr!16964 a!3118) j!142)) (= lt!256324 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!5410 0))(
  ( (MissingZero!5410 (index!23867 (_ BitVec 32))) (Found!5410 (index!23868 (_ BitVec 32))) (Intermediate!5410 (undefined!6222 Bool) (index!23869 (_ BitVec 32)) (x!52772 (_ BitVec 32))) (Undefined!5410) (MissingVacant!5410 (index!23870 (_ BitVec 32))) )
))
(declare-fun lt!256327 () SeekEntryResult!5410)

(assert (=> b!562440 (= lt!256324 (select (arr!16964 a!3118) (index!23869 lt!256327)))))

(declare-fun b!562441 () Bool)

(declare-fun res!353740 () Bool)

(declare-fun e!324123 () Bool)

(assert (=> b!562441 (=> (not res!353740) (not e!324123))))

(declare-datatypes ((List!11083 0))(
  ( (Nil!11080) (Cons!11079 (h!12082 (_ BitVec 64)) (t!17302 List!11083)) )
))
(declare-fun arrayNoDuplicates!0 (array!35326 (_ BitVec 32) List!11083) Bool)

(assert (=> b!562441 (= res!353740 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11080))))

(declare-fun b!562442 () Bool)

(declare-fun e!324121 () Bool)

(assert (=> b!562442 (= e!324123 e!324121)))

(declare-fun res!353735 () Bool)

(assert (=> b!562442 (=> (not res!353735) (not e!324121))))

(declare-fun lt!256323 () (_ BitVec 64))

(declare-fun lt!256330 () (_ BitVec 32))

(declare-fun lt!256333 () array!35326)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35326 (_ BitVec 32)) SeekEntryResult!5410)

(assert (=> b!562442 (= res!353735 (= lt!256327 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256330 lt!256323 lt!256333 mask!3119)))))

(declare-fun lt!256331 () (_ BitVec 32))

(assert (=> b!562442 (= lt!256327 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256331 (select (arr!16964 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562442 (= lt!256330 (toIndex!0 lt!256323 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!562442 (= lt!256323 (select (store (arr!16964 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!562442 (= lt!256331 (toIndex!0 (select (arr!16964 a!3118) j!142) mask!3119))))

(assert (=> b!562442 (= lt!256333 (array!35327 (store (arr!16964 a!3118) i!1132 k0!1914) (size!17329 a!3118)))))

(declare-fun b!562443 () Bool)

(declare-fun res!353744 () Bool)

(assert (=> b!562443 (=> (not res!353744) (not e!324119))))

(assert (=> b!562443 (= res!353744 (and (= (size!17329 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17329 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17329 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562444 () Bool)

(declare-fun e!324122 () Bool)

(assert (=> b!562444 (= e!324122 true)))

(declare-fun lt!256321 () SeekEntryResult!5410)

(declare-fun lt!256328 () SeekEntryResult!5410)

(assert (=> b!562444 (= lt!256321 lt!256328)))

(declare-datatypes ((Unit!17580 0))(
  ( (Unit!17581) )
))
(declare-fun lt!256332 () Unit!17580)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35326 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17580)

(assert (=> b!562444 (= lt!256332 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!52772 lt!256327) (index!23869 lt!256327) (index!23869 lt!256327) mask!3119))))

(declare-fun b!562445 () Bool)

(assert (=> b!562445 (= e!324118 e!324122)))

(declare-fun res!353738 () Bool)

(assert (=> b!562445 (=> res!353738 e!324122)))

(declare-fun lt!256322 () SeekEntryResult!5410)

(assert (=> b!562445 (= res!353738 (or (bvslt (index!23869 lt!256327) #b00000000000000000000000000000000) (bvsge (index!23869 lt!256327) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52772 lt!256327) #b01111111111111111111111111111110) (bvslt (x!52772 lt!256327) #b00000000000000000000000000000000) (not (= lt!256324 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16964 a!3118) i!1132 k0!1914) (index!23869 lt!256327)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!256321 lt!256322))))))

(declare-fun lt!256320 () SeekEntryResult!5410)

(assert (=> b!562445 (= lt!256320 lt!256328)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35326 (_ BitVec 32)) SeekEntryResult!5410)

(assert (=> b!562445 (= lt!256328 (seekKeyOrZeroReturnVacant!0 (x!52772 lt!256327) (index!23869 lt!256327) (index!23869 lt!256327) lt!256323 lt!256333 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35326 (_ BitVec 32)) SeekEntryResult!5410)

(assert (=> b!562445 (= lt!256320 (seekEntryOrOpen!0 lt!256323 lt!256333 mask!3119))))

(declare-fun lt!256326 () SeekEntryResult!5410)

(assert (=> b!562445 (= lt!256326 lt!256321)))

(assert (=> b!562445 (= lt!256321 (seekKeyOrZeroReturnVacant!0 (x!52772 lt!256327) (index!23869 lt!256327) (index!23869 lt!256327) (select (arr!16964 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!562446 () Bool)

(declare-fun res!353737 () Bool)

(assert (=> b!562446 (=> (not res!353737) (not e!324119))))

(declare-fun arrayContainsKey!0 (array!35326 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562446 (= res!353737 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562447 () Bool)

(declare-fun res!353739 () Bool)

(assert (=> b!562447 (=> (not res!353739) (not e!324123))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35326 (_ BitVec 32)) Bool)

(assert (=> b!562447 (= res!353739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562448 () Bool)

(assert (=> b!562448 (= e!324119 e!324123)))

(declare-fun res!353743 () Bool)

(assert (=> b!562448 (=> (not res!353743) (not e!324123))))

(declare-fun lt!256329 () SeekEntryResult!5410)

(assert (=> b!562448 (= res!353743 (or (= lt!256329 (MissingZero!5410 i!1132)) (= lt!256329 (MissingVacant!5410 i!1132))))))

(assert (=> b!562448 (= lt!256329 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!562449 () Bool)

(assert (=> b!562449 (= e!324121 (not e!324120))))

(declare-fun res!353733 () Bool)

(assert (=> b!562449 (=> res!353733 e!324120)))

(get-info :version)

(assert (=> b!562449 (= res!353733 (or (undefined!6222 lt!256327) (not ((_ is Intermediate!5410) lt!256327))))))

(assert (=> b!562449 (= lt!256326 lt!256322)))

(assert (=> b!562449 (= lt!256322 (Found!5410 j!142))))

(assert (=> b!562449 (= lt!256326 (seekEntryOrOpen!0 (select (arr!16964 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!562449 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!256325 () Unit!17580)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35326 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17580)

(assert (=> b!562449 (= lt!256325 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562450 () Bool)

(declare-fun res!353736 () Bool)

(assert (=> b!562450 (=> (not res!353736) (not e!324119))))

(assert (=> b!562450 (= res!353736 (validKeyInArray!0 k0!1914))))

(assert (= (and start!51452 res!353734) b!562443))

(assert (= (and b!562443 res!353744) b!562439))

(assert (= (and b!562439 res!353741) b!562450))

(assert (= (and b!562450 res!353736) b!562446))

(assert (= (and b!562446 res!353737) b!562448))

(assert (= (and b!562448 res!353743) b!562447))

(assert (= (and b!562447 res!353739) b!562441))

(assert (= (and b!562441 res!353740) b!562442))

(assert (= (and b!562442 res!353735) b!562449))

(assert (= (and b!562449 (not res!353733)) b!562440))

(assert (= (and b!562440 (not res!353742)) b!562445))

(assert (= (and b!562445 (not res!353738)) b!562444))

(declare-fun m!540065 () Bool)

(assert (=> b!562450 m!540065))

(declare-fun m!540067 () Bool)

(assert (=> b!562445 m!540067))

(declare-fun m!540069 () Bool)

(assert (=> b!562445 m!540069))

(declare-fun m!540071 () Bool)

(assert (=> b!562445 m!540071))

(declare-fun m!540073 () Bool)

(assert (=> b!562445 m!540073))

(declare-fun m!540075 () Bool)

(assert (=> b!562445 m!540075))

(assert (=> b!562445 m!540067))

(declare-fun m!540077 () Bool)

(assert (=> b!562445 m!540077))

(assert (=> b!562442 m!540067))

(declare-fun m!540079 () Bool)

(assert (=> b!562442 m!540079))

(declare-fun m!540081 () Bool)

(assert (=> b!562442 m!540081))

(assert (=> b!562442 m!540067))

(assert (=> b!562442 m!540067))

(declare-fun m!540083 () Bool)

(assert (=> b!562442 m!540083))

(declare-fun m!540085 () Bool)

(assert (=> b!562442 m!540085))

(declare-fun m!540087 () Bool)

(assert (=> b!562442 m!540087))

(assert (=> b!562442 m!540073))

(assert (=> b!562439 m!540067))

(assert (=> b!562439 m!540067))

(declare-fun m!540089 () Bool)

(assert (=> b!562439 m!540089))

(declare-fun m!540091 () Bool)

(assert (=> b!562446 m!540091))

(assert (=> b!562440 m!540067))

(declare-fun m!540093 () Bool)

(assert (=> b!562440 m!540093))

(assert (=> b!562449 m!540067))

(assert (=> b!562449 m!540067))

(declare-fun m!540095 () Bool)

(assert (=> b!562449 m!540095))

(declare-fun m!540097 () Bool)

(assert (=> b!562449 m!540097))

(declare-fun m!540099 () Bool)

(assert (=> b!562449 m!540099))

(declare-fun m!540101 () Bool)

(assert (=> b!562444 m!540101))

(declare-fun m!540103 () Bool)

(assert (=> b!562448 m!540103))

(declare-fun m!540105 () Bool)

(assert (=> b!562447 m!540105))

(declare-fun m!540107 () Bool)

(assert (=> b!562441 m!540107))

(declare-fun m!540109 () Bool)

(assert (=> start!51452 m!540109))

(declare-fun m!540111 () Bool)

(assert (=> start!51452 m!540111))

(check-sat (not b!562446) (not b!562439) (not b!562448) (not b!562447) (not b!562450) (not b!562444) (not b!562442) (not b!562441) (not b!562445) (not b!562449) (not start!51452))
(check-sat)
