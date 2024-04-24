; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50754 () Bool)

(assert start!50754)

(declare-fun b!554750 () Bool)

(declare-fun res!347062 () Bool)

(declare-fun e!319869 () Bool)

(assert (=> b!554750 (=> (not res!347062) (not e!319869))))

(declare-datatypes ((array!34926 0))(
  ( (array!34927 (arr!16771 (Array (_ BitVec 32) (_ BitVec 64))) (size!17135 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34926)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34926 (_ BitVec 32)) Bool)

(assert (=> b!554750 (= res!347062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554751 () Bool)

(declare-fun res!347060 () Bool)

(declare-fun e!319871 () Bool)

(assert (=> b!554751 (=> (not res!347060) (not e!319871))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554751 (= res!347060 (validKeyInArray!0 (select (arr!16771 a!3118) j!142)))))

(declare-fun b!554752 () Bool)

(declare-fun res!347064 () Bool)

(assert (=> b!554752 (=> (not res!347064) (not e!319869))))

(declare-datatypes ((List!10758 0))(
  ( (Nil!10755) (Cons!10754 (h!11742 (_ BitVec 64)) (t!16978 List!10758)) )
))
(declare-fun arrayNoDuplicates!0 (array!34926 (_ BitVec 32) List!10758) Bool)

(assert (=> b!554752 (= res!347064 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10755))))

(declare-fun b!554753 () Bool)

(declare-fun e!319870 () Bool)

(assert (=> b!554753 (= e!319870 (not true))))

(declare-datatypes ((SeekEntryResult!5176 0))(
  ( (MissingZero!5176 (index!22931 (_ BitVec 32))) (Found!5176 (index!22932 (_ BitVec 32))) (Intermediate!5176 (undefined!5988 Bool) (index!22933 (_ BitVec 32)) (x!51997 (_ BitVec 32))) (Undefined!5176) (MissingVacant!5176 (index!22934 (_ BitVec 32))) )
))
(declare-fun lt!251938 () SeekEntryResult!5176)

(declare-fun lt!251937 () SeekEntryResult!5176)

(get-info :version)

(assert (=> b!554753 (and (= lt!251937 (Found!5176 j!142)) (or (undefined!5988 lt!251938) (not ((_ is Intermediate!5176) lt!251938)) (= (select (arr!16771 a!3118) (index!22933 lt!251938)) (select (arr!16771 a!3118) j!142)) (not (= (select (arr!16771 a!3118) (index!22933 lt!251938)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!251937 (MissingZero!5176 (index!22933 lt!251938)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34926 (_ BitVec 32)) SeekEntryResult!5176)

(assert (=> b!554753 (= lt!251937 (seekEntryOrOpen!0 (select (arr!16771 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!554753 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17197 0))(
  ( (Unit!17198) )
))
(declare-fun lt!251934 () Unit!17197)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34926 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17197)

(assert (=> b!554753 (= lt!251934 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554755 () Bool)

(assert (=> b!554755 (= e!319869 e!319870)))

(declare-fun res!347061 () Bool)

(assert (=> b!554755 (=> (not res!347061) (not e!319870))))

(declare-fun lt!251936 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34926 (_ BitVec 32)) SeekEntryResult!5176)

(assert (=> b!554755 (= res!347061 (= lt!251938 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251936 (select (store (arr!16771 a!3118) i!1132 k0!1914) j!142) (array!34927 (store (arr!16771 a!3118) i!1132 k0!1914) (size!17135 a!3118)) mask!3119)))))

(declare-fun lt!251933 () (_ BitVec 32))

(assert (=> b!554755 (= lt!251938 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251933 (select (arr!16771 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554755 (= lt!251936 (toIndex!0 (select (store (arr!16771 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!554755 (= lt!251933 (toIndex!0 (select (arr!16771 a!3118) j!142) mask!3119))))

(declare-fun b!554756 () Bool)

(assert (=> b!554756 (= e!319871 e!319869)))

(declare-fun res!347065 () Bool)

(assert (=> b!554756 (=> (not res!347065) (not e!319869))))

(declare-fun lt!251935 () SeekEntryResult!5176)

(assert (=> b!554756 (= res!347065 (or (= lt!251935 (MissingZero!5176 i!1132)) (= lt!251935 (MissingVacant!5176 i!1132))))))

(assert (=> b!554756 (= lt!251935 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!554757 () Bool)

(declare-fun res!347059 () Bool)

(assert (=> b!554757 (=> (not res!347059) (not e!319871))))

(assert (=> b!554757 (= res!347059 (validKeyInArray!0 k0!1914))))

(declare-fun b!554758 () Bool)

(declare-fun res!347058 () Bool)

(assert (=> b!554758 (=> (not res!347058) (not e!319871))))

(declare-fun arrayContainsKey!0 (array!34926 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554758 (= res!347058 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!347057 () Bool)

(assert (=> start!50754 (=> (not res!347057) (not e!319871))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50754 (= res!347057 (validMask!0 mask!3119))))

(assert (=> start!50754 e!319871))

(assert (=> start!50754 true))

(declare-fun array_inv!12630 (array!34926) Bool)

(assert (=> start!50754 (array_inv!12630 a!3118)))

(declare-fun b!554754 () Bool)

(declare-fun res!347063 () Bool)

(assert (=> b!554754 (=> (not res!347063) (not e!319871))))

(assert (=> b!554754 (= res!347063 (and (= (size!17135 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17135 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17135 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50754 res!347057) b!554754))

(assert (= (and b!554754 res!347063) b!554751))

(assert (= (and b!554751 res!347060) b!554757))

(assert (= (and b!554757 res!347059) b!554758))

(assert (= (and b!554758 res!347058) b!554756))

(assert (= (and b!554756 res!347065) b!554750))

(assert (= (and b!554750 res!347062) b!554752))

(assert (= (and b!554752 res!347064) b!554755))

(assert (= (and b!554755 res!347061) b!554753))

(declare-fun m!532211 () Bool)

(assert (=> b!554755 m!532211))

(declare-fun m!532213 () Bool)

(assert (=> b!554755 m!532213))

(declare-fun m!532215 () Bool)

(assert (=> b!554755 m!532215))

(assert (=> b!554755 m!532215))

(declare-fun m!532217 () Bool)

(assert (=> b!554755 m!532217))

(declare-fun m!532219 () Bool)

(assert (=> b!554755 m!532219))

(assert (=> b!554755 m!532215))

(declare-fun m!532221 () Bool)

(assert (=> b!554755 m!532221))

(assert (=> b!554755 m!532211))

(declare-fun m!532223 () Bool)

(assert (=> b!554755 m!532223))

(assert (=> b!554755 m!532211))

(declare-fun m!532225 () Bool)

(assert (=> b!554757 m!532225))

(declare-fun m!532227 () Bool)

(assert (=> b!554758 m!532227))

(assert (=> b!554753 m!532211))

(declare-fun m!532229 () Bool)

(assert (=> b!554753 m!532229))

(declare-fun m!532231 () Bool)

(assert (=> b!554753 m!532231))

(declare-fun m!532233 () Bool)

(assert (=> b!554753 m!532233))

(assert (=> b!554753 m!532211))

(declare-fun m!532235 () Bool)

(assert (=> b!554753 m!532235))

(declare-fun m!532237 () Bool)

(assert (=> b!554756 m!532237))

(declare-fun m!532239 () Bool)

(assert (=> start!50754 m!532239))

(declare-fun m!532241 () Bool)

(assert (=> start!50754 m!532241))

(declare-fun m!532243 () Bool)

(assert (=> b!554750 m!532243))

(declare-fun m!532245 () Bool)

(assert (=> b!554752 m!532245))

(assert (=> b!554751 m!532211))

(assert (=> b!554751 m!532211))

(declare-fun m!532247 () Bool)

(assert (=> b!554751 m!532247))

(check-sat (not b!554752) (not b!554758) (not b!554756) (not b!554755) (not b!554751) (not start!50754) (not b!554750) (not b!554757) (not b!554753))
(check-sat)
