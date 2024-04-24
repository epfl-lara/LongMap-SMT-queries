; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51462 () Bool)

(assert start!51462)

(declare-fun b!562003 () Bool)

(declare-fun e!323874 () Bool)

(declare-fun e!323878 () Bool)

(assert (=> b!562003 (= e!323874 e!323878)))

(declare-fun res!353052 () Bool)

(assert (=> b!562003 (=> (not res!353052) (not e!323878))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5341 0))(
  ( (MissingZero!5341 (index!23591 (_ BitVec 32))) (Found!5341 (index!23592 (_ BitVec 32))) (Intermediate!5341 (undefined!6153 Bool) (index!23593 (_ BitVec 32)) (x!52647 (_ BitVec 32))) (Undefined!5341) (MissingVacant!5341 (index!23594 (_ BitVec 32))) )
))
(declare-fun lt!255880 () SeekEntryResult!5341)

(declare-datatypes ((array!35274 0))(
  ( (array!35275 (arr!16936 (Array (_ BitVec 32) (_ BitVec 64))) (size!17300 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35274)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!255877 () SeekEntryResult!5341)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35274 (_ BitVec 32)) SeekEntryResult!5341)

(assert (=> b!562003 (= res!353052 (= lt!255877 (seekKeyOrZeroReturnVacant!0 (x!52647 lt!255880) (index!23593 lt!255880) (index!23593 lt!255880) (select (arr!16936 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!562004 () Bool)

(declare-fun e!323873 () Bool)

(assert (=> b!562004 (= e!323873 (not true))))

(declare-fun e!323875 () Bool)

(assert (=> b!562004 e!323875))

(declare-fun res!353057 () Bool)

(assert (=> b!562004 (=> (not res!353057) (not e!323875))))

(assert (=> b!562004 (= res!353057 (= lt!255877 (Found!5341 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35274 (_ BitVec 32)) SeekEntryResult!5341)

(assert (=> b!562004 (= lt!255877 (seekEntryOrOpen!0 (select (arr!16936 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35274 (_ BitVec 32)) Bool)

(assert (=> b!562004 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17527 0))(
  ( (Unit!17528) )
))
(declare-fun lt!255875 () Unit!17527)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35274 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17527)

(assert (=> b!562004 (= lt!255875 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!353051 () Bool)

(declare-fun e!323879 () Bool)

(assert (=> start!51462 (=> (not res!353051) (not e!323879))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51462 (= res!353051 (validMask!0 mask!3119))))

(assert (=> start!51462 e!323879))

(assert (=> start!51462 true))

(declare-fun array_inv!12795 (array!35274) Bool)

(assert (=> start!51462 (array_inv!12795 a!3118)))

(declare-fun b!562005 () Bool)

(declare-fun res!353055 () Bool)

(assert (=> b!562005 (=> (not res!353055) (not e!323879))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35274 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562005 (= res!353055 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562006 () Bool)

(declare-fun res!353056 () Bool)

(declare-fun e!323880 () Bool)

(assert (=> b!562006 (=> (not res!353056) (not e!323880))))

(assert (=> b!562006 (= res!353056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562007 () Bool)

(declare-fun res!353054 () Bool)

(assert (=> b!562007 (=> (not res!353054) (not e!323879))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562007 (= res!353054 (validKeyInArray!0 k0!1914))))

(declare-fun b!562008 () Bool)

(assert (=> b!562008 (= e!323879 e!323880)))

(declare-fun res!353060 () Bool)

(assert (=> b!562008 (=> (not res!353060) (not e!323880))))

(declare-fun lt!255872 () SeekEntryResult!5341)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!562008 (= res!353060 (or (= lt!255872 (MissingZero!5341 i!1132)) (= lt!255872 (MissingVacant!5341 i!1132))))))

(assert (=> b!562008 (= lt!255872 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!562009 () Bool)

(declare-fun e!323877 () Bool)

(assert (=> b!562009 (= e!323877 e!323874)))

(declare-fun res!353058 () Bool)

(assert (=> b!562009 (=> res!353058 e!323874)))

(declare-fun lt!255874 () (_ BitVec 64))

(assert (=> b!562009 (= res!353058 (or (= lt!255874 (select (arr!16936 a!3118) j!142)) (= lt!255874 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562009 (= lt!255874 (select (arr!16936 a!3118) (index!23593 lt!255880)))))

(declare-fun b!562010 () Bool)

(assert (=> b!562010 (= e!323880 e!323873)))

(declare-fun res!353059 () Bool)

(assert (=> b!562010 (=> (not res!353059) (not e!323873))))

(declare-fun lt!255878 () (_ BitVec 64))

(declare-fun lt!255879 () (_ BitVec 32))

(declare-fun lt!255876 () array!35274)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35274 (_ BitVec 32)) SeekEntryResult!5341)

(assert (=> b!562010 (= res!353059 (= lt!255880 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255879 lt!255878 lt!255876 mask!3119)))))

(declare-fun lt!255873 () (_ BitVec 32))

(assert (=> b!562010 (= lt!255880 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255873 (select (arr!16936 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562010 (= lt!255879 (toIndex!0 lt!255878 mask!3119))))

(assert (=> b!562010 (= lt!255878 (select (store (arr!16936 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!562010 (= lt!255873 (toIndex!0 (select (arr!16936 a!3118) j!142) mask!3119))))

(assert (=> b!562010 (= lt!255876 (array!35275 (store (arr!16936 a!3118) i!1132 k0!1914) (size!17300 a!3118)))))

(declare-fun b!562011 () Bool)

(assert (=> b!562011 (= e!323878 (= (seekEntryOrOpen!0 lt!255878 lt!255876 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52647 lt!255880) (index!23593 lt!255880) (index!23593 lt!255880) lt!255878 lt!255876 mask!3119)))))

(declare-fun b!562012 () Bool)

(declare-fun res!353062 () Bool)

(assert (=> b!562012 (=> (not res!353062) (not e!323879))))

(assert (=> b!562012 (= res!353062 (validKeyInArray!0 (select (arr!16936 a!3118) j!142)))))

(declare-fun b!562013 () Bool)

(declare-fun res!353061 () Bool)

(assert (=> b!562013 (=> (not res!353061) (not e!323879))))

(assert (=> b!562013 (= res!353061 (and (= (size!17300 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17300 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17300 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562014 () Bool)

(assert (=> b!562014 (= e!323875 e!323877)))

(declare-fun res!353050 () Bool)

(assert (=> b!562014 (=> res!353050 e!323877)))

(get-info :version)

(assert (=> b!562014 (= res!353050 (or (undefined!6153 lt!255880) (not ((_ is Intermediate!5341) lt!255880))))))

(declare-fun b!562015 () Bool)

(declare-fun res!353053 () Bool)

(assert (=> b!562015 (=> (not res!353053) (not e!323880))))

(declare-datatypes ((List!10923 0))(
  ( (Nil!10920) (Cons!10919 (h!11925 (_ BitVec 64)) (t!17143 List!10923)) )
))
(declare-fun arrayNoDuplicates!0 (array!35274 (_ BitVec 32) List!10923) Bool)

(assert (=> b!562015 (= res!353053 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10920))))

(assert (= (and start!51462 res!353051) b!562013))

(assert (= (and b!562013 res!353061) b!562012))

(assert (= (and b!562012 res!353062) b!562007))

(assert (= (and b!562007 res!353054) b!562005))

(assert (= (and b!562005 res!353055) b!562008))

(assert (= (and b!562008 res!353060) b!562006))

(assert (= (and b!562006 res!353056) b!562015))

(assert (= (and b!562015 res!353053) b!562010))

(assert (= (and b!562010 res!353059) b!562004))

(assert (= (and b!562004 res!353057) b!562014))

(assert (= (and b!562014 (not res!353050)) b!562009))

(assert (= (and b!562009 (not res!353058)) b!562003))

(assert (= (and b!562003 res!353052) b!562011))

(declare-fun m!540083 () Bool)

(assert (=> b!562015 m!540083))

(declare-fun m!540085 () Bool)

(assert (=> b!562011 m!540085))

(declare-fun m!540087 () Bool)

(assert (=> b!562011 m!540087))

(declare-fun m!540089 () Bool)

(assert (=> b!562010 m!540089))

(assert (=> b!562010 m!540089))

(declare-fun m!540091 () Bool)

(assert (=> b!562010 m!540091))

(declare-fun m!540093 () Bool)

(assert (=> b!562010 m!540093))

(declare-fun m!540095 () Bool)

(assert (=> b!562010 m!540095))

(declare-fun m!540097 () Bool)

(assert (=> b!562010 m!540097))

(declare-fun m!540099 () Bool)

(assert (=> b!562010 m!540099))

(assert (=> b!562010 m!540089))

(declare-fun m!540101 () Bool)

(assert (=> b!562010 m!540101))

(assert (=> b!562003 m!540089))

(assert (=> b!562003 m!540089))

(declare-fun m!540103 () Bool)

(assert (=> b!562003 m!540103))

(declare-fun m!540105 () Bool)

(assert (=> start!51462 m!540105))

(declare-fun m!540107 () Bool)

(assert (=> start!51462 m!540107))

(assert (=> b!562004 m!540089))

(assert (=> b!562004 m!540089))

(declare-fun m!540109 () Bool)

(assert (=> b!562004 m!540109))

(declare-fun m!540111 () Bool)

(assert (=> b!562004 m!540111))

(declare-fun m!540113 () Bool)

(assert (=> b!562004 m!540113))

(declare-fun m!540115 () Bool)

(assert (=> b!562006 m!540115))

(assert (=> b!562012 m!540089))

(assert (=> b!562012 m!540089))

(declare-fun m!540117 () Bool)

(assert (=> b!562012 m!540117))

(declare-fun m!540119 () Bool)

(assert (=> b!562007 m!540119))

(assert (=> b!562009 m!540089))

(declare-fun m!540121 () Bool)

(assert (=> b!562009 m!540121))

(declare-fun m!540123 () Bool)

(assert (=> b!562005 m!540123))

(declare-fun m!540125 () Bool)

(assert (=> b!562008 m!540125))

(check-sat (not b!562003) (not b!562010) (not start!51462) (not b!562015) (not b!562011) (not b!562012) (not b!562006) (not b!562007) (not b!562004) (not b!562008) (not b!562005))
(check-sat)
