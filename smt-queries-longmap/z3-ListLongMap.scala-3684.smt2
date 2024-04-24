; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50766 () Bool)

(assert start!50766)

(declare-fun b!554912 () Bool)

(declare-fun res!347225 () Bool)

(declare-fun e!319943 () Bool)

(assert (=> b!554912 (=> (not res!347225) (not e!319943))))

(declare-datatypes ((array!34938 0))(
  ( (array!34939 (arr!16777 (Array (_ BitVec 32) (_ BitVec 64))) (size!17141 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34938)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34938 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554912 (= res!347225 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!347221 () Bool)

(assert (=> start!50766 (=> (not res!347221) (not e!319943))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50766 (= res!347221 (validMask!0 mask!3119))))

(assert (=> start!50766 e!319943))

(assert (=> start!50766 true))

(declare-fun array_inv!12636 (array!34938) Bool)

(assert (=> start!50766 (array_inv!12636 a!3118)))

(declare-fun b!554913 () Bool)

(declare-fun e!319941 () Bool)

(assert (=> b!554913 (= e!319941 (not true))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5182 0))(
  ( (MissingZero!5182 (index!22955 (_ BitVec 32))) (Found!5182 (index!22956 (_ BitVec 32))) (Intermediate!5182 (undefined!5994 Bool) (index!22957 (_ BitVec 32)) (x!52019 (_ BitVec 32))) (Undefined!5182) (MissingVacant!5182 (index!22958 (_ BitVec 32))) )
))
(declare-fun lt!252044 () SeekEntryResult!5182)

(declare-fun lt!252045 () SeekEntryResult!5182)

(get-info :version)

(assert (=> b!554913 (and (= lt!252044 (Found!5182 j!142)) (or (undefined!5994 lt!252045) (not ((_ is Intermediate!5182) lt!252045)) (= (select (arr!16777 a!3118) (index!22957 lt!252045)) (select (arr!16777 a!3118) j!142)) (not (= (select (arr!16777 a!3118) (index!22957 lt!252045)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252044 (MissingZero!5182 (index!22957 lt!252045)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34938 (_ BitVec 32)) SeekEntryResult!5182)

(assert (=> b!554913 (= lt!252044 (seekEntryOrOpen!0 (select (arr!16777 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34938 (_ BitVec 32)) Bool)

(assert (=> b!554913 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17209 0))(
  ( (Unit!17210) )
))
(declare-fun lt!252043 () Unit!17209)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34938 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17209)

(assert (=> b!554913 (= lt!252043 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554914 () Bool)

(declare-fun res!347219 () Bool)

(declare-fun e!319942 () Bool)

(assert (=> b!554914 (=> (not res!347219) (not e!319942))))

(assert (=> b!554914 (= res!347219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554915 () Bool)

(assert (=> b!554915 (= e!319942 e!319941)))

(declare-fun res!347227 () Bool)

(assert (=> b!554915 (=> (not res!347227) (not e!319941))))

(declare-fun lt!252042 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34938 (_ BitVec 32)) SeekEntryResult!5182)

(assert (=> b!554915 (= res!347227 (= lt!252045 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252042 (select (store (arr!16777 a!3118) i!1132 k0!1914) j!142) (array!34939 (store (arr!16777 a!3118) i!1132 k0!1914) (size!17141 a!3118)) mask!3119)))))

(declare-fun lt!252046 () (_ BitVec 32))

(assert (=> b!554915 (= lt!252045 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252046 (select (arr!16777 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554915 (= lt!252042 (toIndex!0 (select (store (arr!16777 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!554915 (= lt!252046 (toIndex!0 (select (arr!16777 a!3118) j!142) mask!3119))))

(declare-fun b!554916 () Bool)

(declare-fun res!347222 () Bool)

(assert (=> b!554916 (=> (not res!347222) (not e!319943))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554916 (= res!347222 (validKeyInArray!0 (select (arr!16777 a!3118) j!142)))))

(declare-fun b!554917 () Bool)

(declare-fun res!347223 () Bool)

(assert (=> b!554917 (=> (not res!347223) (not e!319943))))

(assert (=> b!554917 (= res!347223 (and (= (size!17141 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17141 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17141 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554918 () Bool)

(assert (=> b!554918 (= e!319943 e!319942)))

(declare-fun res!347220 () Bool)

(assert (=> b!554918 (=> (not res!347220) (not e!319942))))

(declare-fun lt!252041 () SeekEntryResult!5182)

(assert (=> b!554918 (= res!347220 (or (= lt!252041 (MissingZero!5182 i!1132)) (= lt!252041 (MissingVacant!5182 i!1132))))))

(assert (=> b!554918 (= lt!252041 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!554919 () Bool)

(declare-fun res!347226 () Bool)

(assert (=> b!554919 (=> (not res!347226) (not e!319942))))

(declare-datatypes ((List!10764 0))(
  ( (Nil!10761) (Cons!10760 (h!11748 (_ BitVec 64)) (t!16984 List!10764)) )
))
(declare-fun arrayNoDuplicates!0 (array!34938 (_ BitVec 32) List!10764) Bool)

(assert (=> b!554919 (= res!347226 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10761))))

(declare-fun b!554920 () Bool)

(declare-fun res!347224 () Bool)

(assert (=> b!554920 (=> (not res!347224) (not e!319943))))

(assert (=> b!554920 (= res!347224 (validKeyInArray!0 k0!1914))))

(assert (= (and start!50766 res!347221) b!554917))

(assert (= (and b!554917 res!347223) b!554916))

(assert (= (and b!554916 res!347222) b!554920))

(assert (= (and b!554920 res!347224) b!554912))

(assert (= (and b!554912 res!347225) b!554918))

(assert (= (and b!554918 res!347220) b!554914))

(assert (= (and b!554914 res!347219) b!554919))

(assert (= (and b!554919 res!347226) b!554915))

(assert (= (and b!554915 res!347227) b!554913))

(declare-fun m!532439 () Bool)

(assert (=> b!554912 m!532439))

(declare-fun m!532441 () Bool)

(assert (=> b!554916 m!532441))

(assert (=> b!554916 m!532441))

(declare-fun m!532443 () Bool)

(assert (=> b!554916 m!532443))

(declare-fun m!532445 () Bool)

(assert (=> b!554918 m!532445))

(declare-fun m!532447 () Bool)

(assert (=> start!50766 m!532447))

(declare-fun m!532449 () Bool)

(assert (=> start!50766 m!532449))

(declare-fun m!532451 () Bool)

(assert (=> b!554920 m!532451))

(assert (=> b!554915 m!532441))

(declare-fun m!532453 () Bool)

(assert (=> b!554915 m!532453))

(assert (=> b!554915 m!532441))

(declare-fun m!532455 () Bool)

(assert (=> b!554915 m!532455))

(assert (=> b!554915 m!532455))

(declare-fun m!532457 () Bool)

(assert (=> b!554915 m!532457))

(declare-fun m!532459 () Bool)

(assert (=> b!554915 m!532459))

(assert (=> b!554915 m!532441))

(declare-fun m!532461 () Bool)

(assert (=> b!554915 m!532461))

(assert (=> b!554915 m!532455))

(declare-fun m!532463 () Bool)

(assert (=> b!554915 m!532463))

(declare-fun m!532465 () Bool)

(assert (=> b!554914 m!532465))

(declare-fun m!532467 () Bool)

(assert (=> b!554919 m!532467))

(assert (=> b!554913 m!532441))

(declare-fun m!532469 () Bool)

(assert (=> b!554913 m!532469))

(declare-fun m!532471 () Bool)

(assert (=> b!554913 m!532471))

(declare-fun m!532473 () Bool)

(assert (=> b!554913 m!532473))

(assert (=> b!554913 m!532441))

(declare-fun m!532475 () Bool)

(assert (=> b!554913 m!532475))

(check-sat (not b!554913) (not b!554915) (not start!50766) (not b!554919) (not b!554918) (not b!554912) (not b!554916) (not b!554920) (not b!554914))
(check-sat)
