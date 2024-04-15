; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51434 () Bool)

(assert start!51434)

(declare-fun b!562115 () Bool)

(declare-fun e!323931 () Bool)

(declare-fun e!323930 () Bool)

(assert (=> b!562115 (= e!323931 (not e!323930))))

(declare-fun res!353411 () Bool)

(assert (=> b!562115 (=> res!353411 e!323930)))

(declare-datatypes ((SeekEntryResult!5401 0))(
  ( (MissingZero!5401 (index!23831 (_ BitVec 32))) (Found!5401 (index!23832 (_ BitVec 32))) (Intermediate!5401 (undefined!6213 Bool) (index!23833 (_ BitVec 32)) (x!52739 (_ BitVec 32))) (Undefined!5401) (MissingVacant!5401 (index!23834 (_ BitVec 32))) )
))
(declare-fun lt!255944 () SeekEntryResult!5401)

(get-info :version)

(assert (=> b!562115 (= res!353411 (or (undefined!6213 lt!255944) (not ((_ is Intermediate!5401) lt!255944))))))

(declare-fun lt!255950 () SeekEntryResult!5401)

(declare-fun lt!255953 () SeekEntryResult!5401)

(assert (=> b!562115 (= lt!255950 lt!255953)))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!562115 (= lt!255953 (Found!5401 j!142))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35308 0))(
  ( (array!35309 (arr!16955 (Array (_ BitVec 32) (_ BitVec 64))) (size!17320 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35308)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35308 (_ BitVec 32)) SeekEntryResult!5401)

(assert (=> b!562115 (= lt!255950 (seekEntryOrOpen!0 (select (arr!16955 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35308 (_ BitVec 32)) Bool)

(assert (=> b!562115 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17562 0))(
  ( (Unit!17563) )
))
(declare-fun lt!255954 () Unit!17562)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35308 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17562)

(assert (=> b!562115 (= lt!255954 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562116 () Bool)

(declare-fun res!353412 () Bool)

(declare-fun e!323929 () Bool)

(assert (=> b!562116 (=> (not res!353412) (not e!323929))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562116 (= res!353412 (validKeyInArray!0 k0!1914))))

(declare-fun b!562117 () Bool)

(declare-fun res!353418 () Bool)

(declare-fun e!323933 () Bool)

(assert (=> b!562117 (=> (not res!353418) (not e!323933))))

(assert (=> b!562117 (= res!353418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562118 () Bool)

(assert (=> b!562118 (= e!323933 e!323931)))

(declare-fun res!353416 () Bool)

(assert (=> b!562118 (=> (not res!353416) (not e!323931))))

(declare-fun lt!255952 () (_ BitVec 64))

(declare-fun lt!255948 () (_ BitVec 32))

(declare-fun lt!255946 () array!35308)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35308 (_ BitVec 32)) SeekEntryResult!5401)

(assert (=> b!562118 (= res!353416 (= lt!255944 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255948 lt!255952 lt!255946 mask!3119)))))

(declare-fun lt!255951 () (_ BitVec 32))

(assert (=> b!562118 (= lt!255944 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255951 (select (arr!16955 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562118 (= lt!255948 (toIndex!0 lt!255952 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!562118 (= lt!255952 (select (store (arr!16955 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!562118 (= lt!255951 (toIndex!0 (select (arr!16955 a!3118) j!142) mask!3119))))

(assert (=> b!562118 (= lt!255946 (array!35309 (store (arr!16955 a!3118) i!1132 k0!1914) (size!17320 a!3118)))))

(declare-fun b!562119 () Bool)

(declare-fun res!353409 () Bool)

(assert (=> b!562119 (=> (not res!353409) (not e!323929))))

(assert (=> b!562119 (= res!353409 (and (= (size!17320 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17320 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17320 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562120 () Bool)

(declare-fun res!353413 () Bool)

(assert (=> b!562120 (=> (not res!353413) (not e!323929))))

(assert (=> b!562120 (= res!353413 (validKeyInArray!0 (select (arr!16955 a!3118) j!142)))))

(declare-fun b!562121 () Bool)

(declare-fun e!323934 () Bool)

(assert (=> b!562121 (= e!323930 e!323934)))

(declare-fun res!353415 () Bool)

(assert (=> b!562121 (=> res!353415 e!323934)))

(declare-fun lt!255949 () (_ BitVec 64))

(assert (=> b!562121 (= res!353415 (or (= lt!255949 (select (arr!16955 a!3118) j!142)) (= lt!255949 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562121 (= lt!255949 (select (arr!16955 a!3118) (index!23833 lt!255944)))))

(declare-fun res!353420 () Bool)

(assert (=> start!51434 (=> (not res!353420) (not e!323929))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51434 (= res!353420 (validMask!0 mask!3119))))

(assert (=> start!51434 e!323929))

(assert (=> start!51434 true))

(declare-fun array_inv!12838 (array!35308) Bool)

(assert (=> start!51434 (array_inv!12838 a!3118)))

(declare-fun b!562122 () Bool)

(declare-fun e!323932 () Bool)

(assert (=> b!562122 (= e!323932 true)))

(declare-fun lt!255945 () SeekEntryResult!5401)

(declare-fun lt!255942 () SeekEntryResult!5401)

(assert (=> b!562122 (= lt!255945 lt!255942)))

(declare-fun lt!255955 () Unit!17562)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35308 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17562)

(assert (=> b!562122 (= lt!255955 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!52739 lt!255944) (index!23833 lt!255944) (index!23833 lt!255944) mask!3119))))

(declare-fun b!562123 () Bool)

(declare-fun res!353410 () Bool)

(assert (=> b!562123 (=> (not res!353410) (not e!323929))))

(declare-fun arrayContainsKey!0 (array!35308 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562123 (= res!353410 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562124 () Bool)

(assert (=> b!562124 (= e!323929 e!323933)))

(declare-fun res!353414 () Bool)

(assert (=> b!562124 (=> (not res!353414) (not e!323933))))

(declare-fun lt!255943 () SeekEntryResult!5401)

(assert (=> b!562124 (= res!353414 (or (= lt!255943 (MissingZero!5401 i!1132)) (= lt!255943 (MissingVacant!5401 i!1132))))))

(assert (=> b!562124 (= lt!255943 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!562125 () Bool)

(assert (=> b!562125 (= e!323934 e!323932)))

(declare-fun res!353417 () Bool)

(assert (=> b!562125 (=> res!353417 e!323932)))

(assert (=> b!562125 (= res!353417 (or (bvslt (index!23833 lt!255944) #b00000000000000000000000000000000) (bvsge (index!23833 lt!255944) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52739 lt!255944) #b01111111111111111111111111111110) (bvslt (x!52739 lt!255944) #b00000000000000000000000000000000) (not (= lt!255949 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16955 a!3118) i!1132 k0!1914) (index!23833 lt!255944)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!255945 lt!255953))))))

(declare-fun lt!255947 () SeekEntryResult!5401)

(assert (=> b!562125 (= lt!255947 lt!255942)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35308 (_ BitVec 32)) SeekEntryResult!5401)

(assert (=> b!562125 (= lt!255942 (seekKeyOrZeroReturnVacant!0 (x!52739 lt!255944) (index!23833 lt!255944) (index!23833 lt!255944) lt!255952 lt!255946 mask!3119))))

(assert (=> b!562125 (= lt!255947 (seekEntryOrOpen!0 lt!255952 lt!255946 mask!3119))))

(assert (=> b!562125 (= lt!255950 lt!255945)))

(assert (=> b!562125 (= lt!255945 (seekKeyOrZeroReturnVacant!0 (x!52739 lt!255944) (index!23833 lt!255944) (index!23833 lt!255944) (select (arr!16955 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!562126 () Bool)

(declare-fun res!353419 () Bool)

(assert (=> b!562126 (=> (not res!353419) (not e!323933))))

(declare-datatypes ((List!11074 0))(
  ( (Nil!11071) (Cons!11070 (h!12073 (_ BitVec 64)) (t!17293 List!11074)) )
))
(declare-fun arrayNoDuplicates!0 (array!35308 (_ BitVec 32) List!11074) Bool)

(assert (=> b!562126 (= res!353419 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11071))))

(assert (= (and start!51434 res!353420) b!562119))

(assert (= (and b!562119 res!353409) b!562120))

(assert (= (and b!562120 res!353413) b!562116))

(assert (= (and b!562116 res!353412) b!562123))

(assert (= (and b!562123 res!353410) b!562124))

(assert (= (and b!562124 res!353414) b!562117))

(assert (= (and b!562117 res!353418) b!562126))

(assert (= (and b!562126 res!353419) b!562118))

(assert (= (and b!562118 res!353416) b!562115))

(assert (= (and b!562115 (not res!353411)) b!562121))

(assert (= (and b!562121 (not res!353415)) b!562125))

(assert (= (and b!562125 (not res!353417)) b!562122))

(declare-fun m!539633 () Bool)

(assert (=> b!562116 m!539633))

(declare-fun m!539635 () Bool)

(assert (=> b!562126 m!539635))

(declare-fun m!539637 () Bool)

(assert (=> b!562115 m!539637))

(assert (=> b!562115 m!539637))

(declare-fun m!539639 () Bool)

(assert (=> b!562115 m!539639))

(declare-fun m!539641 () Bool)

(assert (=> b!562115 m!539641))

(declare-fun m!539643 () Bool)

(assert (=> b!562115 m!539643))

(declare-fun m!539645 () Bool)

(assert (=> start!51434 m!539645))

(declare-fun m!539647 () Bool)

(assert (=> start!51434 m!539647))

(declare-fun m!539649 () Bool)

(assert (=> b!562117 m!539649))

(assert (=> b!562125 m!539637))

(declare-fun m!539651 () Bool)

(assert (=> b!562125 m!539651))

(assert (=> b!562125 m!539637))

(declare-fun m!539653 () Bool)

(assert (=> b!562125 m!539653))

(declare-fun m!539655 () Bool)

(assert (=> b!562125 m!539655))

(declare-fun m!539657 () Bool)

(assert (=> b!562125 m!539657))

(declare-fun m!539659 () Bool)

(assert (=> b!562125 m!539659))

(declare-fun m!539661 () Bool)

(assert (=> b!562124 m!539661))

(assert (=> b!562121 m!539637))

(declare-fun m!539663 () Bool)

(assert (=> b!562121 m!539663))

(declare-fun m!539665 () Bool)

(assert (=> b!562123 m!539665))

(assert (=> b!562118 m!539637))

(declare-fun m!539667 () Bool)

(assert (=> b!562118 m!539667))

(declare-fun m!539669 () Bool)

(assert (=> b!562118 m!539669))

(assert (=> b!562118 m!539655))

(declare-fun m!539671 () Bool)

(assert (=> b!562118 m!539671))

(assert (=> b!562118 m!539637))

(declare-fun m!539673 () Bool)

(assert (=> b!562118 m!539673))

(assert (=> b!562118 m!539637))

(declare-fun m!539675 () Bool)

(assert (=> b!562118 m!539675))

(declare-fun m!539677 () Bool)

(assert (=> b!562122 m!539677))

(assert (=> b!562120 m!539637))

(assert (=> b!562120 m!539637))

(declare-fun m!539679 () Bool)

(assert (=> b!562120 m!539679))

(check-sat (not b!562126) (not b!562116) (not b!562115) (not b!562122) (not b!562118) (not start!51434) (not b!562124) (not b!562123) (not b!562125) (not b!562120) (not b!562117))
(check-sat)
