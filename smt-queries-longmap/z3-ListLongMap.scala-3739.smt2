; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51430 () Bool)

(assert start!51430)

(declare-fun b!562076 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!255957 () (_ BitVec 64))

(declare-datatypes ((array!35295 0))(
  ( (array!35296 (arr!16948 (Array (_ BitVec 32) (_ BitVec 64))) (size!17312 (_ BitVec 32))) )
))
(declare-fun lt!255952 () array!35295)

(declare-datatypes ((SeekEntryResult!5397 0))(
  ( (MissingZero!5397 (index!23815 (_ BitVec 32))) (Found!5397 (index!23816 (_ BitVec 32))) (Intermediate!5397 (undefined!6209 Bool) (index!23817 (_ BitVec 32)) (x!52716 (_ BitVec 32))) (Undefined!5397) (MissingVacant!5397 (index!23818 (_ BitVec 32))) )
))
(declare-fun lt!255955 () SeekEntryResult!5397)

(declare-fun e!323914 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35295 (_ BitVec 32)) SeekEntryResult!5397)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35295 (_ BitVec 32)) SeekEntryResult!5397)

(assert (=> b!562076 (= e!323914 (= (seekEntryOrOpen!0 lt!255957 lt!255952 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52716 lt!255955) (index!23817 lt!255955) (index!23817 lt!255955) lt!255957 lt!255952 mask!3119)))))

(declare-fun b!562077 () Bool)

(declare-fun res!353237 () Bool)

(declare-fun e!323919 () Bool)

(assert (=> b!562077 (=> (not res!353237) (not e!323919))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun a!3118 () array!35295)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!562077 (= res!353237 (and (= (size!17312 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17312 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17312 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562078 () Bool)

(declare-fun e!323912 () Bool)

(assert (=> b!562078 (= e!323912 e!323914)))

(declare-fun res!353238 () Bool)

(assert (=> b!562078 (=> (not res!353238) (not e!323914))))

(declare-fun lt!255956 () SeekEntryResult!5397)

(assert (=> b!562078 (= res!353238 (= lt!255956 (seekKeyOrZeroReturnVacant!0 (x!52716 lt!255955) (index!23817 lt!255955) (index!23817 lt!255955) (select (arr!16948 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!562079 () Bool)

(declare-fun res!353233 () Bool)

(assert (=> b!562079 (=> (not res!353233) (not e!323919))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562079 (= res!353233 (validKeyInArray!0 k0!1914))))

(declare-fun b!562080 () Bool)

(declare-fun e!323917 () Bool)

(assert (=> b!562080 (= e!323919 e!323917)))

(declare-fun res!353235 () Bool)

(assert (=> b!562080 (=> (not res!353235) (not e!323917))))

(declare-fun lt!255954 () SeekEntryResult!5397)

(assert (=> b!562080 (= res!353235 (or (= lt!255954 (MissingZero!5397 i!1132)) (= lt!255954 (MissingVacant!5397 i!1132))))))

(assert (=> b!562080 (= lt!255954 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!562081 () Bool)

(declare-fun e!323916 () Bool)

(assert (=> b!562081 (= e!323916 (not true))))

(declare-fun e!323913 () Bool)

(assert (=> b!562081 e!323913))

(declare-fun res!353240 () Bool)

(assert (=> b!562081 (=> (not res!353240) (not e!323913))))

(assert (=> b!562081 (= res!353240 (= lt!255956 (Found!5397 j!142)))))

(assert (=> b!562081 (= lt!255956 (seekEntryOrOpen!0 (select (arr!16948 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35295 (_ BitVec 32)) Bool)

(assert (=> b!562081 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17568 0))(
  ( (Unit!17569) )
))
(declare-fun lt!255950 () Unit!17568)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35295 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17568)

(assert (=> b!562081 (= lt!255950 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!353229 () Bool)

(assert (=> start!51430 (=> (not res!353229) (not e!323919))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51430 (= res!353229 (validMask!0 mask!3119))))

(assert (=> start!51430 e!323919))

(assert (=> start!51430 true))

(declare-fun array_inv!12744 (array!35295) Bool)

(assert (=> start!51430 (array_inv!12744 a!3118)))

(declare-fun b!562082 () Bool)

(declare-fun res!353234 () Bool)

(assert (=> b!562082 (=> (not res!353234) (not e!323919))))

(assert (=> b!562082 (= res!353234 (validKeyInArray!0 (select (arr!16948 a!3118) j!142)))))

(declare-fun b!562083 () Bool)

(declare-fun res!353231 () Bool)

(assert (=> b!562083 (=> (not res!353231) (not e!323919))))

(declare-fun arrayContainsKey!0 (array!35295 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562083 (= res!353231 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562084 () Bool)

(declare-fun e!323915 () Bool)

(assert (=> b!562084 (= e!323913 e!323915)))

(declare-fun res!353230 () Bool)

(assert (=> b!562084 (=> res!353230 e!323915)))

(get-info :version)

(assert (=> b!562084 (= res!353230 (or (undefined!6209 lt!255955) (not ((_ is Intermediate!5397) lt!255955))))))

(declare-fun b!562085 () Bool)

(declare-fun res!353236 () Bool)

(assert (=> b!562085 (=> (not res!353236) (not e!323917))))

(declare-datatypes ((List!11028 0))(
  ( (Nil!11025) (Cons!11024 (h!12027 (_ BitVec 64)) (t!17256 List!11028)) )
))
(declare-fun arrayNoDuplicates!0 (array!35295 (_ BitVec 32) List!11028) Bool)

(assert (=> b!562085 (= res!353236 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11025))))

(declare-fun b!562086 () Bool)

(assert (=> b!562086 (= e!323915 e!323912)))

(declare-fun res!353228 () Bool)

(assert (=> b!562086 (=> res!353228 e!323912)))

(declare-fun lt!255953 () (_ BitVec 64))

(assert (=> b!562086 (= res!353228 (or (= lt!255953 (select (arr!16948 a!3118) j!142)) (= lt!255953 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562086 (= lt!255953 (select (arr!16948 a!3118) (index!23817 lt!255955)))))

(declare-fun b!562087 () Bool)

(assert (=> b!562087 (= e!323917 e!323916)))

(declare-fun res!353232 () Bool)

(assert (=> b!562087 (=> (not res!353232) (not e!323916))))

(declare-fun lt!255958 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35295 (_ BitVec 32)) SeekEntryResult!5397)

(assert (=> b!562087 (= res!353232 (= lt!255955 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255958 lt!255957 lt!255952 mask!3119)))))

(declare-fun lt!255951 () (_ BitVec 32))

(assert (=> b!562087 (= lt!255955 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255951 (select (arr!16948 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562087 (= lt!255958 (toIndex!0 lt!255957 mask!3119))))

(assert (=> b!562087 (= lt!255957 (select (store (arr!16948 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!562087 (= lt!255951 (toIndex!0 (select (arr!16948 a!3118) j!142) mask!3119))))

(assert (=> b!562087 (= lt!255952 (array!35296 (store (arr!16948 a!3118) i!1132 k0!1914) (size!17312 a!3118)))))

(declare-fun b!562088 () Bool)

(declare-fun res!353239 () Bool)

(assert (=> b!562088 (=> (not res!353239) (not e!323917))))

(assert (=> b!562088 (= res!353239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51430 res!353229) b!562077))

(assert (= (and b!562077 res!353237) b!562082))

(assert (= (and b!562082 res!353234) b!562079))

(assert (= (and b!562079 res!353233) b!562083))

(assert (= (and b!562083 res!353231) b!562080))

(assert (= (and b!562080 res!353235) b!562088))

(assert (= (and b!562088 res!353239) b!562085))

(assert (= (and b!562085 res!353236) b!562087))

(assert (= (and b!562087 res!353232) b!562081))

(assert (= (and b!562081 res!353240) b!562084))

(assert (= (and b!562084 (not res!353230)) b!562086))

(assert (= (and b!562086 (not res!353228)) b!562078))

(assert (= (and b!562078 res!353238) b!562076))

(declare-fun m!540053 () Bool)

(assert (=> b!562080 m!540053))

(declare-fun m!540055 () Bool)

(assert (=> b!562076 m!540055))

(declare-fun m!540057 () Bool)

(assert (=> b!562076 m!540057))

(declare-fun m!540059 () Bool)

(assert (=> b!562086 m!540059))

(declare-fun m!540061 () Bool)

(assert (=> b!562086 m!540061))

(declare-fun m!540063 () Bool)

(assert (=> b!562088 m!540063))

(declare-fun m!540065 () Bool)

(assert (=> start!51430 m!540065))

(declare-fun m!540067 () Bool)

(assert (=> start!51430 m!540067))

(declare-fun m!540069 () Bool)

(assert (=> b!562085 m!540069))

(declare-fun m!540071 () Bool)

(assert (=> b!562083 m!540071))

(assert (=> b!562081 m!540059))

(assert (=> b!562081 m!540059))

(declare-fun m!540073 () Bool)

(assert (=> b!562081 m!540073))

(declare-fun m!540075 () Bool)

(assert (=> b!562081 m!540075))

(declare-fun m!540077 () Bool)

(assert (=> b!562081 m!540077))

(declare-fun m!540079 () Bool)

(assert (=> b!562079 m!540079))

(assert (=> b!562082 m!540059))

(assert (=> b!562082 m!540059))

(declare-fun m!540081 () Bool)

(assert (=> b!562082 m!540081))

(declare-fun m!540083 () Bool)

(assert (=> b!562087 m!540083))

(assert (=> b!562087 m!540059))

(declare-fun m!540085 () Bool)

(assert (=> b!562087 m!540085))

(declare-fun m!540087 () Bool)

(assert (=> b!562087 m!540087))

(assert (=> b!562087 m!540059))

(declare-fun m!540089 () Bool)

(assert (=> b!562087 m!540089))

(assert (=> b!562087 m!540059))

(declare-fun m!540091 () Bool)

(assert (=> b!562087 m!540091))

(declare-fun m!540093 () Bool)

(assert (=> b!562087 m!540093))

(assert (=> b!562078 m!540059))

(assert (=> b!562078 m!540059))

(declare-fun m!540095 () Bool)

(assert (=> b!562078 m!540095))

(check-sat (not b!562082) (not b!562079) (not b!562085) (not b!562076) (not b!562081) (not b!562083) (not b!562078) (not b!562080) (not b!562087) (not b!562088) (not start!51430))
(check-sat)
