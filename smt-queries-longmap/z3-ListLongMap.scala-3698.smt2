; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50792 () Bool)

(assert start!50792)

(declare-fun b!555575 () Bool)

(declare-fun e!320142 () Bool)

(declare-fun e!320143 () Bool)

(assert (=> b!555575 (= e!320142 e!320143)))

(declare-fun res!348133 () Bool)

(assert (=> b!555575 (=> (not res!348133) (not e!320143))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!252452 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5269 0))(
  ( (MissingZero!5269 (index!23303 (_ BitVec 32))) (Found!5269 (index!23304 (_ BitVec 32))) (Intermediate!5269 (undefined!6081 Bool) (index!23305 (_ BitVec 32)) (x!52210 (_ BitVec 32))) (Undefined!5269) (MissingVacant!5269 (index!23306 (_ BitVec 32))) )
))
(declare-fun lt!252456 () SeekEntryResult!5269)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35026 0))(
  ( (array!35027 (arr!16823 (Array (_ BitVec 32) (_ BitVec 64))) (size!17188 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35026)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35026 (_ BitVec 32)) SeekEntryResult!5269)

(assert (=> b!555575 (= res!348133 (= lt!252456 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252452 (select (store (arr!16823 a!3118) i!1132 k0!1914) j!142) (array!35027 (store (arr!16823 a!3118) i!1132 k0!1914) (size!17188 a!3118)) mask!3119)))))

(declare-fun lt!252455 () (_ BitVec 32))

(assert (=> b!555575 (= lt!252456 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252455 (select (arr!16823 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555575 (= lt!252452 (toIndex!0 (select (store (arr!16823 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!555575 (= lt!252455 (toIndex!0 (select (arr!16823 a!3118) j!142) mask!3119))))

(declare-fun b!555576 () Bool)

(assert (=> b!555576 (= e!320143 (not true))))

(declare-fun lt!252453 () SeekEntryResult!5269)

(get-info :version)

(assert (=> b!555576 (and (= lt!252453 (Found!5269 j!142)) (or (undefined!6081 lt!252456) (not ((_ is Intermediate!5269) lt!252456)) (= (select (arr!16823 a!3118) (index!23305 lt!252456)) (select (arr!16823 a!3118) j!142)) (not (= (select (arr!16823 a!3118) (index!23305 lt!252456)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252453 (MissingZero!5269 (index!23305 lt!252456)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35026 (_ BitVec 32)) SeekEntryResult!5269)

(assert (=> b!555576 (= lt!252453 (seekEntryOrOpen!0 (select (arr!16823 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35026 (_ BitVec 32)) Bool)

(assert (=> b!555576 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17298 0))(
  ( (Unit!17299) )
))
(declare-fun lt!252457 () Unit!17298)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35026 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17298)

(assert (=> b!555576 (= lt!252457 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555577 () Bool)

(declare-fun res!348131 () Bool)

(declare-fun e!320144 () Bool)

(assert (=> b!555577 (=> (not res!348131) (not e!320144))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555577 (= res!348131 (validKeyInArray!0 (select (arr!16823 a!3118) j!142)))))

(declare-fun res!348129 () Bool)

(assert (=> start!50792 (=> (not res!348129) (not e!320144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50792 (= res!348129 (validMask!0 mask!3119))))

(assert (=> start!50792 e!320144))

(assert (=> start!50792 true))

(declare-fun array_inv!12706 (array!35026) Bool)

(assert (=> start!50792 (array_inv!12706 a!3118)))

(declare-fun b!555578 () Bool)

(declare-fun res!348132 () Bool)

(assert (=> b!555578 (=> (not res!348132) (not e!320144))))

(assert (=> b!555578 (= res!348132 (and (= (size!17188 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17188 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17188 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555579 () Bool)

(declare-fun res!348135 () Bool)

(assert (=> b!555579 (=> (not res!348135) (not e!320144))))

(assert (=> b!555579 (= res!348135 (validKeyInArray!0 k0!1914))))

(declare-fun b!555580 () Bool)

(assert (=> b!555580 (= e!320144 e!320142)))

(declare-fun res!348136 () Bool)

(assert (=> b!555580 (=> (not res!348136) (not e!320142))))

(declare-fun lt!252454 () SeekEntryResult!5269)

(assert (=> b!555580 (= res!348136 (or (= lt!252454 (MissingZero!5269 i!1132)) (= lt!252454 (MissingVacant!5269 i!1132))))))

(assert (=> b!555580 (= lt!252454 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!555581 () Bool)

(declare-fun res!348137 () Bool)

(assert (=> b!555581 (=> (not res!348137) (not e!320144))))

(declare-fun arrayContainsKey!0 (array!35026 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555581 (= res!348137 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555582 () Bool)

(declare-fun res!348134 () Bool)

(assert (=> b!555582 (=> (not res!348134) (not e!320142))))

(assert (=> b!555582 (= res!348134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555583 () Bool)

(declare-fun res!348130 () Bool)

(assert (=> b!555583 (=> (not res!348130) (not e!320142))))

(declare-datatypes ((List!10942 0))(
  ( (Nil!10939) (Cons!10938 (h!11923 (_ BitVec 64)) (t!17161 List!10942)) )
))
(declare-fun arrayNoDuplicates!0 (array!35026 (_ BitVec 32) List!10942) Bool)

(assert (=> b!555583 (= res!348130 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10939))))

(assert (= (and start!50792 res!348129) b!555578))

(assert (= (and b!555578 res!348132) b!555577))

(assert (= (and b!555577 res!348131) b!555579))

(assert (= (and b!555579 res!348135) b!555581))

(assert (= (and b!555581 res!348137) b!555580))

(assert (= (and b!555580 res!348136) b!555582))

(assert (= (and b!555582 res!348134) b!555583))

(assert (= (and b!555583 res!348130) b!555575))

(assert (= (and b!555575 res!348133) b!555576))

(declare-fun m!532925 () Bool)

(assert (=> b!555582 m!532925))

(declare-fun m!532927 () Bool)

(assert (=> b!555575 m!532927))

(declare-fun m!532929 () Bool)

(assert (=> b!555575 m!532929))

(assert (=> b!555575 m!532927))

(declare-fun m!532931 () Bool)

(assert (=> b!555575 m!532931))

(declare-fun m!532933 () Bool)

(assert (=> b!555575 m!532933))

(assert (=> b!555575 m!532931))

(declare-fun m!532935 () Bool)

(assert (=> b!555575 m!532935))

(assert (=> b!555575 m!532927))

(declare-fun m!532937 () Bool)

(assert (=> b!555575 m!532937))

(assert (=> b!555575 m!532931))

(declare-fun m!532939 () Bool)

(assert (=> b!555575 m!532939))

(declare-fun m!532941 () Bool)

(assert (=> b!555581 m!532941))

(assert (=> b!555576 m!532927))

(declare-fun m!532943 () Bool)

(assert (=> b!555576 m!532943))

(assert (=> b!555576 m!532927))

(declare-fun m!532945 () Bool)

(assert (=> b!555576 m!532945))

(declare-fun m!532947 () Bool)

(assert (=> b!555576 m!532947))

(declare-fun m!532949 () Bool)

(assert (=> b!555576 m!532949))

(assert (=> b!555577 m!532927))

(assert (=> b!555577 m!532927))

(declare-fun m!532951 () Bool)

(assert (=> b!555577 m!532951))

(declare-fun m!532953 () Bool)

(assert (=> b!555583 m!532953))

(declare-fun m!532955 () Bool)

(assert (=> b!555580 m!532955))

(declare-fun m!532957 () Bool)

(assert (=> b!555579 m!532957))

(declare-fun m!532959 () Bool)

(assert (=> start!50792 m!532959))

(declare-fun m!532961 () Bool)

(assert (=> start!50792 m!532961))

(check-sat (not start!50792) (not b!555576) (not b!555575) (not b!555580) (not b!555579) (not b!555581) (not b!555582) (not b!555583) (not b!555577))
(check-sat)
