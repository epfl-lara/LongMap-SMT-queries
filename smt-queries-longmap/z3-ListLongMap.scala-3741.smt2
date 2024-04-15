; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51428 () Bool)

(assert start!51428)

(declare-fun b!562000 () Bool)

(declare-fun res!353306 () Bool)

(declare-fun e!323858 () Bool)

(assert (=> b!562000 (=> (not res!353306) (not e!323858))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562000 (= res!353306 (validKeyInArray!0 k0!1914))))

(declare-fun b!562001 () Bool)

(declare-fun e!323865 () Bool)

(assert (=> b!562001 (= e!323858 e!323865)))

(declare-fun res!353296 () Bool)

(assert (=> b!562001 (=> (not res!353296) (not e!323865))))

(declare-datatypes ((SeekEntryResult!5398 0))(
  ( (MissingZero!5398 (index!23819 (_ BitVec 32))) (Found!5398 (index!23820 (_ BitVec 32))) (Intermediate!5398 (undefined!6210 Bool) (index!23821 (_ BitVec 32)) (x!52728 (_ BitVec 32))) (Undefined!5398) (MissingVacant!5398 (index!23822 (_ BitVec 32))) )
))
(declare-fun lt!255857 () SeekEntryResult!5398)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!562001 (= res!353296 (or (= lt!255857 (MissingZero!5398 i!1132)) (= lt!255857 (MissingVacant!5398 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35302 0))(
  ( (array!35303 (arr!16952 (Array (_ BitVec 32) (_ BitVec 64))) (size!17317 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35302)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35302 (_ BitVec 32)) SeekEntryResult!5398)

(assert (=> b!562001 (= lt!255857 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!562002 () Bool)

(declare-fun res!353304 () Bool)

(assert (=> b!562002 (=> (not res!353304) (not e!323858))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!562002 (= res!353304 (and (= (size!17317 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17317 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17317 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562003 () Bool)

(declare-fun res!353297 () Bool)

(assert (=> b!562003 (=> (not res!353297) (not e!323858))))

(declare-fun arrayContainsKey!0 (array!35302 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562003 (= res!353297 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562004 () Bool)

(declare-fun e!323863 () Bool)

(declare-fun e!323859 () Bool)

(assert (=> b!562004 (= e!323863 e!323859)))

(declare-fun res!353295 () Bool)

(assert (=> b!562004 (=> res!353295 e!323859)))

(declare-fun lt!255851 () SeekEntryResult!5398)

(get-info :version)

(assert (=> b!562004 (= res!353295 (or (undefined!6210 lt!255851) (not ((_ is Intermediate!5398) lt!255851))))))

(declare-fun res!353303 () Bool)

(assert (=> start!51428 (=> (not res!353303) (not e!323858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51428 (= res!353303 (validMask!0 mask!3119))))

(assert (=> start!51428 e!323858))

(assert (=> start!51428 true))

(declare-fun array_inv!12835 (array!35302) Bool)

(assert (=> start!51428 (array_inv!12835 a!3118)))

(declare-fun b!562005 () Bool)

(declare-fun e!323862 () Bool)

(assert (=> b!562005 (= e!323859 e!323862)))

(declare-fun res!353299 () Bool)

(assert (=> b!562005 (=> res!353299 e!323862)))

(declare-fun lt!255856 () (_ BitVec 64))

(assert (=> b!562005 (= res!353299 (or (= lt!255856 (select (arr!16952 a!3118) j!142)) (= lt!255856 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562005 (= lt!255856 (select (arr!16952 a!3118) (index!23821 lt!255851)))))

(declare-fun b!562006 () Bool)

(declare-fun res!353300 () Bool)

(assert (=> b!562006 (=> (not res!353300) (not e!323865))))

(declare-datatypes ((List!11071 0))(
  ( (Nil!11068) (Cons!11067 (h!12070 (_ BitVec 64)) (t!17290 List!11071)) )
))
(declare-fun arrayNoDuplicates!0 (array!35302 (_ BitVec 32) List!11071) Bool)

(assert (=> b!562006 (= res!353300 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11068))))

(declare-fun b!562007 () Bool)

(declare-fun e!323861 () Bool)

(assert (=> b!562007 (= e!323862 e!323861)))

(declare-fun res!353298 () Bool)

(assert (=> b!562007 (=> (not res!353298) (not e!323861))))

(declare-fun lt!255852 () SeekEntryResult!5398)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35302 (_ BitVec 32)) SeekEntryResult!5398)

(assert (=> b!562007 (= res!353298 (= lt!255852 (seekKeyOrZeroReturnVacant!0 (x!52728 lt!255851) (index!23821 lt!255851) (index!23821 lt!255851) (select (arr!16952 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!562008 () Bool)

(declare-fun res!353294 () Bool)

(assert (=> b!562008 (=> (not res!353294) (not e!323858))))

(assert (=> b!562008 (= res!353294 (validKeyInArray!0 (select (arr!16952 a!3118) j!142)))))

(declare-fun lt!255859 () array!35302)

(declare-fun b!562009 () Bool)

(declare-fun lt!255858 () (_ BitVec 64))

(assert (=> b!562009 (= e!323861 (= (seekEntryOrOpen!0 lt!255858 lt!255859 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52728 lt!255851) (index!23821 lt!255851) (index!23821 lt!255851) lt!255858 lt!255859 mask!3119)))))

(declare-fun b!562010 () Bool)

(declare-fun e!323860 () Bool)

(assert (=> b!562010 (= e!323865 e!323860)))

(declare-fun res!353302 () Bool)

(assert (=> b!562010 (=> (not res!353302) (not e!323860))))

(declare-fun lt!255853 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35302 (_ BitVec 32)) SeekEntryResult!5398)

(assert (=> b!562010 (= res!353302 (= lt!255851 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255853 lt!255858 lt!255859 mask!3119)))))

(declare-fun lt!255854 () (_ BitVec 32))

(assert (=> b!562010 (= lt!255851 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255854 (select (arr!16952 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562010 (= lt!255853 (toIndex!0 lt!255858 mask!3119))))

(assert (=> b!562010 (= lt!255858 (select (store (arr!16952 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!562010 (= lt!255854 (toIndex!0 (select (arr!16952 a!3118) j!142) mask!3119))))

(assert (=> b!562010 (= lt!255859 (array!35303 (store (arr!16952 a!3118) i!1132 k0!1914) (size!17317 a!3118)))))

(declare-fun b!562011 () Bool)

(assert (=> b!562011 (= e!323860 (not true))))

(assert (=> b!562011 e!323863))

(declare-fun res!353305 () Bool)

(assert (=> b!562011 (=> (not res!353305) (not e!323863))))

(assert (=> b!562011 (= res!353305 (= lt!255852 (Found!5398 j!142)))))

(assert (=> b!562011 (= lt!255852 (seekEntryOrOpen!0 (select (arr!16952 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35302 (_ BitVec 32)) Bool)

(assert (=> b!562011 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17556 0))(
  ( (Unit!17557) )
))
(declare-fun lt!255855 () Unit!17556)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35302 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17556)

(assert (=> b!562011 (= lt!255855 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562012 () Bool)

(declare-fun res!353301 () Bool)

(assert (=> b!562012 (=> (not res!353301) (not e!323865))))

(assert (=> b!562012 (= res!353301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51428 res!353303) b!562002))

(assert (= (and b!562002 res!353304) b!562008))

(assert (= (and b!562008 res!353294) b!562000))

(assert (= (and b!562000 res!353306) b!562003))

(assert (= (and b!562003 res!353297) b!562001))

(assert (= (and b!562001 res!353296) b!562012))

(assert (= (and b!562012 res!353301) b!562006))

(assert (= (and b!562006 res!353300) b!562010))

(assert (= (and b!562010 res!353302) b!562011))

(assert (= (and b!562011 res!353305) b!562004))

(assert (= (and b!562004 (not res!353295)) b!562005))

(assert (= (and b!562005 (not res!353299)) b!562007))

(assert (= (and b!562007 res!353298) b!562009))

(declare-fun m!539501 () Bool)

(assert (=> b!562005 m!539501))

(declare-fun m!539503 () Bool)

(assert (=> b!562005 m!539503))

(assert (=> b!562011 m!539501))

(assert (=> b!562011 m!539501))

(declare-fun m!539505 () Bool)

(assert (=> b!562011 m!539505))

(declare-fun m!539507 () Bool)

(assert (=> b!562011 m!539507))

(declare-fun m!539509 () Bool)

(assert (=> b!562011 m!539509))

(declare-fun m!539511 () Bool)

(assert (=> b!562001 m!539511))

(assert (=> b!562008 m!539501))

(assert (=> b!562008 m!539501))

(declare-fun m!539513 () Bool)

(assert (=> b!562008 m!539513))

(declare-fun m!539515 () Bool)

(assert (=> b!562003 m!539515))

(assert (=> b!562007 m!539501))

(assert (=> b!562007 m!539501))

(declare-fun m!539517 () Bool)

(assert (=> b!562007 m!539517))

(declare-fun m!539519 () Bool)

(assert (=> b!562009 m!539519))

(declare-fun m!539521 () Bool)

(assert (=> b!562009 m!539521))

(declare-fun m!539523 () Bool)

(assert (=> start!51428 m!539523))

(declare-fun m!539525 () Bool)

(assert (=> start!51428 m!539525))

(declare-fun m!539527 () Bool)

(assert (=> b!562006 m!539527))

(declare-fun m!539529 () Bool)

(assert (=> b!562000 m!539529))

(declare-fun m!539531 () Bool)

(assert (=> b!562012 m!539531))

(assert (=> b!562010 m!539501))

(declare-fun m!539533 () Bool)

(assert (=> b!562010 m!539533))

(assert (=> b!562010 m!539501))

(declare-fun m!539535 () Bool)

(assert (=> b!562010 m!539535))

(declare-fun m!539537 () Bool)

(assert (=> b!562010 m!539537))

(assert (=> b!562010 m!539501))

(declare-fun m!539539 () Bool)

(assert (=> b!562010 m!539539))

(declare-fun m!539541 () Bool)

(assert (=> b!562010 m!539541))

(declare-fun m!539543 () Bool)

(assert (=> b!562010 m!539543))

(check-sat (not b!562011) (not b!562012) (not b!562006) (not b!562000) (not b!562010) (not b!562001) (not b!562003) (not b!562007) (not b!562009) (not b!562008) (not start!51428))
(check-sat)
