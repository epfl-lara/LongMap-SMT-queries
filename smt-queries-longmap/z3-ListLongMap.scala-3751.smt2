; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51488 () Bool)

(assert start!51488)

(declare-fun b!563074 () Bool)

(declare-fun res!354370 () Bool)

(declare-fun e!324477 () Bool)

(assert (=> b!563074 (=> (not res!354370) (not e!324477))))

(declare-datatypes ((array!35362 0))(
  ( (array!35363 (arr!16982 (Array (_ BitVec 32) (_ BitVec 64))) (size!17347 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35362)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563074 (= res!354370 (validKeyInArray!0 (select (arr!16982 a!3118) j!142)))))

(declare-fun b!563076 () Bool)

(declare-fun e!324473 () Bool)

(declare-fun e!324475 () Bool)

(assert (=> b!563076 (= e!324473 e!324475)))

(declare-fun res!354374 () Bool)

(assert (=> b!563076 (=> (not res!354374) (not e!324475))))

(declare-datatypes ((SeekEntryResult!5428 0))(
  ( (MissingZero!5428 (index!23939 (_ BitVec 32))) (Found!5428 (index!23940 (_ BitVec 32))) (Intermediate!5428 (undefined!6240 Bool) (index!23941 (_ BitVec 32)) (x!52838 (_ BitVec 32))) (Undefined!5428) (MissingVacant!5428 (index!23942 (_ BitVec 32))) )
))
(declare-fun lt!256954 () SeekEntryResult!5428)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun lt!256956 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35362 (_ BitVec 32)) SeekEntryResult!5428)

(assert (=> b!563076 (= res!354374 (= lt!256954 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256956 (select (store (arr!16982 a!3118) i!1132 k0!1914) j!142) (array!35363 (store (arr!16982 a!3118) i!1132 k0!1914) (size!17347 a!3118)) mask!3119)))))

(declare-fun lt!256952 () (_ BitVec 32))

(assert (=> b!563076 (= lt!256954 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256952 (select (arr!16982 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563076 (= lt!256956 (toIndex!0 (select (store (arr!16982 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!563076 (= lt!256952 (toIndex!0 (select (arr!16982 a!3118) j!142) mask!3119))))

(declare-fun b!563077 () Bool)

(declare-fun res!354373 () Bool)

(assert (=> b!563077 (=> (not res!354373) (not e!324477))))

(assert (=> b!563077 (= res!354373 (validKeyInArray!0 k0!1914))))

(declare-fun lt!256955 () Bool)

(declare-fun b!563078 () Bool)

(assert (=> b!563078 (= e!324475 (not (or (and (not lt!256955) (undefined!6240 lt!256954)) (and (not lt!256955) (not (undefined!6240 lt!256954))) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(get-info :version)

(assert (=> b!563078 (= lt!256955 (not ((_ is Intermediate!5428) lt!256954)))))

(declare-fun e!324474 () Bool)

(assert (=> b!563078 e!324474))

(declare-fun res!354375 () Bool)

(assert (=> b!563078 (=> (not res!354375) (not e!324474))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35362 (_ BitVec 32)) Bool)

(assert (=> b!563078 (= res!354375 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17616 0))(
  ( (Unit!17617) )
))
(declare-fun lt!256957 () Unit!17616)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35362 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17616)

(assert (=> b!563078 (= lt!256957 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563079 () Bool)

(assert (=> b!563079 (= e!324477 e!324473)))

(declare-fun res!354377 () Bool)

(assert (=> b!563079 (=> (not res!354377) (not e!324473))))

(declare-fun lt!256953 () SeekEntryResult!5428)

(assert (=> b!563079 (= res!354377 (or (= lt!256953 (MissingZero!5428 i!1132)) (= lt!256953 (MissingVacant!5428 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35362 (_ BitVec 32)) SeekEntryResult!5428)

(assert (=> b!563079 (= lt!256953 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!563080 () Bool)

(declare-fun res!354368 () Bool)

(assert (=> b!563080 (=> (not res!354368) (not e!324477))))

(assert (=> b!563080 (= res!354368 (and (= (size!17347 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17347 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17347 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563081 () Bool)

(declare-fun res!354369 () Bool)

(assert (=> b!563081 (=> (not res!354369) (not e!324473))))

(assert (=> b!563081 (= res!354369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563082 () Bool)

(declare-fun res!354376 () Bool)

(assert (=> b!563082 (=> (not res!354376) (not e!324477))))

(declare-fun arrayContainsKey!0 (array!35362 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563082 (= res!354376 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563083 () Bool)

(assert (=> b!563083 (= e!324474 (= (seekEntryOrOpen!0 (select (arr!16982 a!3118) j!142) a!3118 mask!3119) (Found!5428 j!142)))))

(declare-fun res!354371 () Bool)

(assert (=> start!51488 (=> (not res!354371) (not e!324477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51488 (= res!354371 (validMask!0 mask!3119))))

(assert (=> start!51488 e!324477))

(assert (=> start!51488 true))

(declare-fun array_inv!12865 (array!35362) Bool)

(assert (=> start!51488 (array_inv!12865 a!3118)))

(declare-fun b!563075 () Bool)

(declare-fun res!354372 () Bool)

(assert (=> b!563075 (=> (not res!354372) (not e!324473))))

(declare-datatypes ((List!11101 0))(
  ( (Nil!11098) (Cons!11097 (h!12100 (_ BitVec 64)) (t!17320 List!11101)) )
))
(declare-fun arrayNoDuplicates!0 (array!35362 (_ BitVec 32) List!11101) Bool)

(assert (=> b!563075 (= res!354372 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11098))))

(assert (= (and start!51488 res!354371) b!563080))

(assert (= (and b!563080 res!354368) b!563074))

(assert (= (and b!563074 res!354370) b!563077))

(assert (= (and b!563077 res!354373) b!563082))

(assert (= (and b!563082 res!354376) b!563079))

(assert (= (and b!563079 res!354377) b!563081))

(assert (= (and b!563081 res!354369) b!563075))

(assert (= (and b!563075 res!354372) b!563076))

(assert (= (and b!563076 res!354374) b!563078))

(assert (= (and b!563078 res!354375) b!563083))

(declare-fun m!540899 () Bool)

(assert (=> b!563074 m!540899))

(assert (=> b!563074 m!540899))

(declare-fun m!540901 () Bool)

(assert (=> b!563074 m!540901))

(declare-fun m!540903 () Bool)

(assert (=> b!563075 m!540903))

(declare-fun m!540905 () Bool)

(assert (=> b!563078 m!540905))

(declare-fun m!540907 () Bool)

(assert (=> b!563078 m!540907))

(declare-fun m!540909 () Bool)

(assert (=> b!563077 m!540909))

(assert (=> b!563083 m!540899))

(assert (=> b!563083 m!540899))

(declare-fun m!540911 () Bool)

(assert (=> b!563083 m!540911))

(declare-fun m!540913 () Bool)

(assert (=> start!51488 m!540913))

(declare-fun m!540915 () Bool)

(assert (=> start!51488 m!540915))

(declare-fun m!540917 () Bool)

(assert (=> b!563082 m!540917))

(declare-fun m!540919 () Bool)

(assert (=> b!563079 m!540919))

(assert (=> b!563076 m!540899))

(declare-fun m!540921 () Bool)

(assert (=> b!563076 m!540921))

(assert (=> b!563076 m!540899))

(declare-fun m!540923 () Bool)

(assert (=> b!563076 m!540923))

(assert (=> b!563076 m!540923))

(declare-fun m!540925 () Bool)

(assert (=> b!563076 m!540925))

(assert (=> b!563076 m!540899))

(declare-fun m!540927 () Bool)

(assert (=> b!563076 m!540927))

(declare-fun m!540929 () Bool)

(assert (=> b!563076 m!540929))

(assert (=> b!563076 m!540923))

(declare-fun m!540931 () Bool)

(assert (=> b!563076 m!540931))

(declare-fun m!540933 () Bool)

(assert (=> b!563081 m!540933))

(check-sat (not b!563083) (not b!563077) (not b!563079) (not b!563076) (not b!563075) (not b!563074) (not b!563081) (not b!563082) (not start!51488) (not b!563078))
(check-sat)
