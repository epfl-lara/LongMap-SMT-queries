; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50728 () Bool)

(assert start!50728)

(declare-fun e!319863 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((array!34953 0))(
  ( (array!34954 (arr!16786 (Array (_ BitVec 32) (_ BitVec 64))) (size!17150 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34953)

(declare-fun b!554820 () Bool)

(declare-datatypes ((SeekEntryResult!5235 0))(
  ( (MissingZero!5235 (index!23167 (_ BitVec 32))) (Found!5235 (index!23168 (_ BitVec 32))) (Intermediate!5235 (undefined!6047 Bool) (index!23169 (_ BitVec 32)) (x!52077 (_ BitVec 32))) (Undefined!5235) (MissingVacant!5235 (index!23170 (_ BitVec 32))) )
))
(declare-fun lt!252005 () SeekEntryResult!5235)

(get-info :version)

(assert (=> b!554820 (= e!319863 (not (or (undefined!6047 lt!252005) (not ((_ is Intermediate!5235) lt!252005)) (= (select (arr!16786 a!3118) (index!23169 lt!252005)) (select (arr!16786 a!3118) j!142)) (not (= (select (arr!16786 a!3118) (index!23169 lt!252005)) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!17150 a!3118)))))))

(declare-fun lt!252007 () SeekEntryResult!5235)

(assert (=> b!554820 (and (= lt!252007 (Found!5235 j!142)) (or (undefined!6047 lt!252005) (not ((_ is Intermediate!5235) lt!252005)) (= (select (arr!16786 a!3118) (index!23169 lt!252005)) (select (arr!16786 a!3118) j!142)) (not (= (select (arr!16786 a!3118) (index!23169 lt!252005)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252007 (MissingZero!5235 (index!23169 lt!252005)))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34953 (_ BitVec 32)) SeekEntryResult!5235)

(assert (=> b!554820 (= lt!252007 (seekEntryOrOpen!0 (select (arr!16786 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34953 (_ BitVec 32)) Bool)

(assert (=> b!554820 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17244 0))(
  ( (Unit!17245) )
))
(declare-fun lt!252006 () Unit!17244)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34953 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17244)

(assert (=> b!554820 (= lt!252006 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554821 () Bool)

(declare-fun e!319860 () Bool)

(declare-fun e!319861 () Bool)

(assert (=> b!554821 (= e!319860 e!319861)))

(declare-fun res!347233 () Bool)

(assert (=> b!554821 (=> (not res!347233) (not e!319861))))

(declare-fun lt!252004 () SeekEntryResult!5235)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!554821 (= res!347233 (or (= lt!252004 (MissingZero!5235 i!1132)) (= lt!252004 (MissingVacant!5235 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!554821 (= lt!252004 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!347238 () Bool)

(assert (=> start!50728 (=> (not res!347238) (not e!319860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50728 (= res!347238 (validMask!0 mask!3119))))

(assert (=> start!50728 e!319860))

(assert (=> start!50728 true))

(declare-fun array_inv!12582 (array!34953) Bool)

(assert (=> start!50728 (array_inv!12582 a!3118)))

(declare-fun b!554822 () Bool)

(declare-fun res!347235 () Bool)

(assert (=> b!554822 (=> (not res!347235) (not e!319861))))

(declare-datatypes ((List!10866 0))(
  ( (Nil!10863) (Cons!10862 (h!11847 (_ BitVec 64)) (t!17094 List!10866)) )
))
(declare-fun arrayNoDuplicates!0 (array!34953 (_ BitVec 32) List!10866) Bool)

(assert (=> b!554822 (= res!347235 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10863))))

(declare-fun b!554823 () Bool)

(assert (=> b!554823 (= e!319861 e!319863)))

(declare-fun res!347237 () Bool)

(assert (=> b!554823 (=> (not res!347237) (not e!319863))))

(declare-fun lt!252003 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34953 (_ BitVec 32)) SeekEntryResult!5235)

(assert (=> b!554823 (= res!347237 (= lt!252005 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252003 (select (store (arr!16786 a!3118) i!1132 k0!1914) j!142) (array!34954 (store (arr!16786 a!3118) i!1132 k0!1914) (size!17150 a!3118)) mask!3119)))))

(declare-fun lt!252002 () (_ BitVec 32))

(assert (=> b!554823 (= lt!252005 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252002 (select (arr!16786 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554823 (= lt!252003 (toIndex!0 (select (store (arr!16786 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!554823 (= lt!252002 (toIndex!0 (select (arr!16786 a!3118) j!142) mask!3119))))

(declare-fun b!554824 () Bool)

(declare-fun res!347234 () Bool)

(assert (=> b!554824 (=> (not res!347234) (not e!319860))))

(declare-fun arrayContainsKey!0 (array!34953 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554824 (= res!347234 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554825 () Bool)

(declare-fun res!347236 () Bool)

(assert (=> b!554825 (=> (not res!347236) (not e!319860))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554825 (= res!347236 (validKeyInArray!0 (select (arr!16786 a!3118) j!142)))))

(declare-fun b!554826 () Bool)

(declare-fun res!347239 () Bool)

(assert (=> b!554826 (=> (not res!347239) (not e!319860))))

(assert (=> b!554826 (= res!347239 (and (= (size!17150 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17150 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17150 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554827 () Bool)

(declare-fun res!347232 () Bool)

(assert (=> b!554827 (=> (not res!347232) (not e!319860))))

(assert (=> b!554827 (= res!347232 (validKeyInArray!0 k0!1914))))

(declare-fun b!554828 () Bool)

(declare-fun res!347240 () Bool)

(assert (=> b!554828 (=> (not res!347240) (not e!319861))))

(assert (=> b!554828 (= res!347240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!50728 res!347238) b!554826))

(assert (= (and b!554826 res!347239) b!554825))

(assert (= (and b!554825 res!347236) b!554827))

(assert (= (and b!554827 res!347232) b!554824))

(assert (= (and b!554824 res!347234) b!554821))

(assert (= (and b!554821 res!347233) b!554828))

(assert (= (and b!554828 res!347240) b!554822))

(assert (= (and b!554822 res!347235) b!554823))

(assert (= (and b!554823 res!347237) b!554820))

(declare-fun m!532253 () Bool)

(assert (=> b!554825 m!532253))

(assert (=> b!554825 m!532253))

(declare-fun m!532255 () Bool)

(assert (=> b!554825 m!532255))

(declare-fun m!532257 () Bool)

(assert (=> start!50728 m!532257))

(declare-fun m!532259 () Bool)

(assert (=> start!50728 m!532259))

(declare-fun m!532261 () Bool)

(assert (=> b!554827 m!532261))

(declare-fun m!532263 () Bool)

(assert (=> b!554821 m!532263))

(declare-fun m!532265 () Bool)

(assert (=> b!554822 m!532265))

(declare-fun m!532267 () Bool)

(assert (=> b!554823 m!532267))

(declare-fun m!532269 () Bool)

(assert (=> b!554823 m!532269))

(assert (=> b!554823 m!532267))

(declare-fun m!532271 () Bool)

(assert (=> b!554823 m!532271))

(assert (=> b!554823 m!532253))

(declare-fun m!532273 () Bool)

(assert (=> b!554823 m!532273))

(assert (=> b!554823 m!532253))

(declare-fun m!532275 () Bool)

(assert (=> b!554823 m!532275))

(assert (=> b!554823 m!532267))

(declare-fun m!532277 () Bool)

(assert (=> b!554823 m!532277))

(assert (=> b!554823 m!532253))

(declare-fun m!532279 () Bool)

(assert (=> b!554824 m!532279))

(assert (=> b!554820 m!532253))

(declare-fun m!532281 () Bool)

(assert (=> b!554820 m!532281))

(declare-fun m!532283 () Bool)

(assert (=> b!554820 m!532283))

(declare-fun m!532285 () Bool)

(assert (=> b!554820 m!532285))

(assert (=> b!554820 m!532253))

(declare-fun m!532287 () Bool)

(assert (=> b!554820 m!532287))

(declare-fun m!532289 () Bool)

(assert (=> b!554828 m!532289))

(check-sat (not b!554827) (not b!554825) (not b!554821) (not b!554824) (not b!554820) (not start!50728) (not b!554823) (not b!554822) (not b!554828))
(check-sat)
