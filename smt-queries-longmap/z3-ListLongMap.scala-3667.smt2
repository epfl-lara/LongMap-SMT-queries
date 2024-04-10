; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50620 () Bool)

(assert start!50620)

(declare-fun b!553214 () Bool)

(declare-fun res!345632 () Bool)

(declare-fun e!319149 () Bool)

(assert (=> b!553214 (=> (not res!345632) (not e!319149))))

(declare-datatypes ((array!34845 0))(
  ( (array!34846 (arr!16732 (Array (_ BitVec 32) (_ BitVec 64))) (size!17096 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34845)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34845 (_ BitVec 32)) Bool)

(assert (=> b!553214 (= res!345632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!553215 () Bool)

(declare-fun e!319148 () Bool)

(declare-datatypes ((SeekEntryResult!5181 0))(
  ( (MissingZero!5181 (index!22951 (_ BitVec 32))) (Found!5181 (index!22952 (_ BitVec 32))) (Intermediate!5181 (undefined!5993 Bool) (index!22953 (_ BitVec 32)) (x!51879 (_ BitVec 32))) (Undefined!5181) (MissingVacant!5181 (index!22954 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34845 (_ BitVec 32)) SeekEntryResult!5181)

(assert (=> b!553215 (= e!319148 (= (seekEntryOrOpen!0 (select (arr!16732 a!3118) j!142) a!3118 mask!3119) (Found!5181 j!142)))))

(declare-fun b!553216 () Bool)

(declare-fun res!345630 () Bool)

(assert (=> b!553216 (=> (not res!345630) (not e!319149))))

(declare-datatypes ((List!10812 0))(
  ( (Nil!10809) (Cons!10808 (h!11793 (_ BitVec 64)) (t!17040 List!10812)) )
))
(declare-fun arrayNoDuplicates!0 (array!34845 (_ BitVec 32) List!10812) Bool)

(assert (=> b!553216 (= res!345630 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10809))))

(declare-fun b!553217 () Bool)

(declare-fun e!319147 () Bool)

(declare-fun lt!251403 () SeekEntryResult!5181)

(get-info :version)

(assert (=> b!553217 (= e!319147 (not (or (not ((_ is Intermediate!5181) lt!251403)) (not (undefined!5993 lt!251403)) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(assert (=> b!553217 e!319148))

(declare-fun res!345634 () Bool)

(assert (=> b!553217 (=> (not res!345634) (not e!319148))))

(assert (=> b!553217 (= res!345634 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17136 0))(
  ( (Unit!17137) )
))
(declare-fun lt!251404 () Unit!17136)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34845 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17136)

(assert (=> b!553217 (= lt!251404 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!345628 () Bool)

(declare-fun e!319145 () Bool)

(assert (=> start!50620 (=> (not res!345628) (not e!319145))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50620 (= res!345628 (validMask!0 mask!3119))))

(assert (=> start!50620 e!319145))

(assert (=> start!50620 true))

(declare-fun array_inv!12528 (array!34845) Bool)

(assert (=> start!50620 (array_inv!12528 a!3118)))

(declare-fun b!553218 () Bool)

(assert (=> b!553218 (= e!319149 e!319147)))

(declare-fun res!345635 () Bool)

(assert (=> b!553218 (=> (not res!345635) (not e!319147))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun lt!251407 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34845 (_ BitVec 32)) SeekEntryResult!5181)

(assert (=> b!553218 (= res!345635 (= lt!251403 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251407 (select (store (arr!16732 a!3118) i!1132 k0!1914) j!142) (array!34846 (store (arr!16732 a!3118) i!1132 k0!1914) (size!17096 a!3118)) mask!3119)))))

(declare-fun lt!251406 () (_ BitVec 32))

(assert (=> b!553218 (= lt!251403 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251406 (select (arr!16732 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553218 (= lt!251407 (toIndex!0 (select (store (arr!16732 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!553218 (= lt!251406 (toIndex!0 (select (arr!16732 a!3118) j!142) mask!3119))))

(declare-fun b!553219 () Bool)

(declare-fun res!345633 () Bool)

(assert (=> b!553219 (=> (not res!345633) (not e!319145))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553219 (= res!345633 (validKeyInArray!0 (select (arr!16732 a!3118) j!142)))))

(declare-fun b!553220 () Bool)

(declare-fun res!345626 () Bool)

(assert (=> b!553220 (=> (not res!345626) (not e!319145))))

(assert (=> b!553220 (= res!345626 (validKeyInArray!0 k0!1914))))

(declare-fun b!553221 () Bool)

(declare-fun res!345629 () Bool)

(assert (=> b!553221 (=> (not res!345629) (not e!319145))))

(declare-fun arrayContainsKey!0 (array!34845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553221 (= res!345629 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553222 () Bool)

(declare-fun res!345631 () Bool)

(assert (=> b!553222 (=> (not res!345631) (not e!319145))))

(assert (=> b!553222 (= res!345631 (and (= (size!17096 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17096 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17096 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553223 () Bool)

(assert (=> b!553223 (= e!319145 e!319149)))

(declare-fun res!345627 () Bool)

(assert (=> b!553223 (=> (not res!345627) (not e!319149))))

(declare-fun lt!251405 () SeekEntryResult!5181)

(assert (=> b!553223 (= res!345627 (or (= lt!251405 (MissingZero!5181 i!1132)) (= lt!251405 (MissingVacant!5181 i!1132))))))

(assert (=> b!553223 (= lt!251405 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!50620 res!345628) b!553222))

(assert (= (and b!553222 res!345631) b!553219))

(assert (= (and b!553219 res!345633) b!553220))

(assert (= (and b!553220 res!345626) b!553221))

(assert (= (and b!553221 res!345629) b!553223))

(assert (= (and b!553223 res!345627) b!553214))

(assert (= (and b!553214 res!345632) b!553216))

(assert (= (and b!553216 res!345630) b!553218))

(assert (= (and b!553218 res!345635) b!553217))

(assert (= (and b!553217 res!345634) b!553215))

(declare-fun m!530253 () Bool)

(assert (=> b!553220 m!530253))

(declare-fun m!530255 () Bool)

(assert (=> start!50620 m!530255))

(declare-fun m!530257 () Bool)

(assert (=> start!50620 m!530257))

(declare-fun m!530259 () Bool)

(assert (=> b!553218 m!530259))

(declare-fun m!530261 () Bool)

(assert (=> b!553218 m!530261))

(assert (=> b!553218 m!530259))

(declare-fun m!530263 () Bool)

(assert (=> b!553218 m!530263))

(declare-fun m!530265 () Bool)

(assert (=> b!553218 m!530265))

(declare-fun m!530267 () Bool)

(assert (=> b!553218 m!530267))

(assert (=> b!553218 m!530265))

(declare-fun m!530269 () Bool)

(assert (=> b!553218 m!530269))

(assert (=> b!553218 m!530259))

(declare-fun m!530271 () Bool)

(assert (=> b!553218 m!530271))

(assert (=> b!553218 m!530265))

(declare-fun m!530273 () Bool)

(assert (=> b!553221 m!530273))

(declare-fun m!530275 () Bool)

(assert (=> b!553216 m!530275))

(declare-fun m!530277 () Bool)

(assert (=> b!553217 m!530277))

(declare-fun m!530279 () Bool)

(assert (=> b!553217 m!530279))

(assert (=> b!553219 m!530265))

(assert (=> b!553219 m!530265))

(declare-fun m!530281 () Bool)

(assert (=> b!553219 m!530281))

(assert (=> b!553215 m!530265))

(assert (=> b!553215 m!530265))

(declare-fun m!530283 () Bool)

(assert (=> b!553215 m!530283))

(declare-fun m!530285 () Bool)

(assert (=> b!553214 m!530285))

(declare-fun m!530287 () Bool)

(assert (=> b!553223 m!530287))

(check-sat (not b!553220) (not b!553216) (not b!553219) (not b!553223) (not b!553215) (not b!553218) (not b!553217) (not b!553221) (not b!553214) (not start!50620))
(check-sat)
