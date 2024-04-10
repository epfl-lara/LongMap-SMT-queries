; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52774 () Bool)

(assert start!52774)

(declare-fun b!575409 () Bool)

(declare-fun res!363831 () Bool)

(declare-fun e!331086 () Bool)

(assert (=> b!575409 (=> (not res!363831) (not e!331086))))

(declare-datatypes ((array!35919 0))(
  ( (array!35920 (arr!17242 (Array (_ BitVec 32) (_ BitVec 64))) (size!17606 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35919)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35919 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!575409 (= res!363831 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!575410 () Bool)

(declare-fun res!363828 () Bool)

(assert (=> b!575410 (=> (not res!363828) (not e!331086))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!575410 (= res!363828 (validKeyInArray!0 k0!1914))))

(declare-fun b!575411 () Bool)

(declare-fun res!363832 () Bool)

(declare-fun e!331083 () Bool)

(assert (=> b!575411 (=> (not res!363832) (not e!331083))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35919 (_ BitVec 32)) Bool)

(assert (=> b!575411 (= res!363832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!575412 () Bool)

(declare-fun e!331085 () Bool)

(assert (=> b!575412 (= e!331083 e!331085)))

(declare-fun res!363827 () Bool)

(assert (=> b!575412 (=> (not res!363827) (not e!331085))))

(declare-fun lt!262998 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5691 0))(
  ( (MissingZero!5691 (index!24991 (_ BitVec 32))) (Found!5691 (index!24992 (_ BitVec 32))) (Intermediate!5691 (undefined!6503 Bool) (index!24993 (_ BitVec 32)) (x!53884 (_ BitVec 32))) (Undefined!5691) (MissingVacant!5691 (index!24994 (_ BitVec 32))) )
))
(declare-fun lt!262992 () SeekEntryResult!5691)

(declare-fun lt!262994 () (_ BitVec 64))

(declare-fun lt!262997 () array!35919)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35919 (_ BitVec 32)) SeekEntryResult!5691)

(assert (=> b!575412 (= res!363827 (= lt!262992 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262998 lt!262994 lt!262997 mask!3119)))))

(declare-fun lt!262990 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!575412 (= lt!262992 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262990 (select (arr!17242 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575412 (= lt!262998 (toIndex!0 lt!262994 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!575412 (= lt!262994 (select (store (arr!17242 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!575412 (= lt!262990 (toIndex!0 (select (arr!17242 a!3118) j!142) mask!3119))))

(assert (=> b!575412 (= lt!262997 (array!35920 (store (arr!17242 a!3118) i!1132 k0!1914) (size!17606 a!3118)))))

(declare-fun b!575413 () Bool)

(declare-fun e!331081 () Bool)

(declare-fun e!331080 () Bool)

(assert (=> b!575413 (= e!331081 e!331080)))

(declare-fun res!363833 () Bool)

(assert (=> b!575413 (=> res!363833 e!331080)))

(declare-fun lt!262989 () (_ BitVec 64))

(assert (=> b!575413 (= res!363833 (or (= lt!262989 (select (arr!17242 a!3118) j!142)) (= lt!262989 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!575413 (= lt!262989 (select (arr!17242 a!3118) (index!24993 lt!262992)))))

(declare-fun b!575414 () Bool)

(declare-fun res!363835 () Bool)

(assert (=> b!575414 (=> (not res!363835) (not e!331086))))

(assert (=> b!575414 (= res!363835 (and (= (size!17606 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17606 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17606 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!575415 () Bool)

(declare-fun res!363826 () Bool)

(assert (=> b!575415 (=> (not res!363826) (not e!331086))))

(assert (=> b!575415 (= res!363826 (validKeyInArray!0 (select (arr!17242 a!3118) j!142)))))

(declare-fun b!575416 () Bool)

(declare-fun res!363834 () Bool)

(assert (=> b!575416 (=> (not res!363834) (not e!331083))))

(declare-datatypes ((List!11322 0))(
  ( (Nil!11319) (Cons!11318 (h!12357 (_ BitVec 64)) (t!17550 List!11322)) )
))
(declare-fun arrayNoDuplicates!0 (array!35919 (_ BitVec 32) List!11322) Bool)

(assert (=> b!575416 (= res!363834 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11319))))

(declare-fun b!575418 () Bool)

(assert (=> b!575418 (= e!331085 (not e!331081))))

(declare-fun res!363829 () Bool)

(assert (=> b!575418 (=> res!363829 e!331081)))

(get-info :version)

(assert (=> b!575418 (= res!363829 (or (undefined!6503 lt!262992) (not ((_ is Intermediate!5691) lt!262992))))))

(declare-fun lt!262995 () SeekEntryResult!5691)

(declare-fun lt!263002 () SeekEntryResult!5691)

(assert (=> b!575418 (= lt!262995 lt!263002)))

(assert (=> b!575418 (= lt!263002 (Found!5691 j!142))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35919 (_ BitVec 32)) SeekEntryResult!5691)

(assert (=> b!575418 (= lt!262995 (seekEntryOrOpen!0 (select (arr!17242 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!575418 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18084 0))(
  ( (Unit!18085) )
))
(declare-fun lt!262999 () Unit!18084)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35919 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18084)

(assert (=> b!575418 (= lt!262999 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!575419 () Bool)

(declare-fun e!331084 () Bool)

(assert (=> b!575419 (= e!331084 true)))

(declare-fun lt!262993 () SeekEntryResult!5691)

(declare-fun lt!263001 () SeekEntryResult!5691)

(assert (=> b!575419 (= lt!262993 lt!263001)))

(declare-fun lt!262996 () Unit!18084)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35919 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18084)

(assert (=> b!575419 (= lt!262996 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!53884 lt!262992) (index!24993 lt!262992) (index!24993 lt!262992) mask!3119))))

(declare-fun b!575420 () Bool)

(assert (=> b!575420 (= e!331080 e!331084)))

(declare-fun res!363836 () Bool)

(assert (=> b!575420 (=> res!363836 e!331084)))

(assert (=> b!575420 (= res!363836 (or (bvslt (index!24993 lt!262992) #b00000000000000000000000000000000) (bvsge (index!24993 lt!262992) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53884 lt!262992) #b01111111111111111111111111111110) (bvslt (x!53884 lt!262992) #b00000000000000000000000000000000) (not (= lt!262989 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!17242 a!3118) i!1132 k0!1914) (index!24993 lt!262992)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!262993 lt!263002))))))

(declare-fun lt!262991 () SeekEntryResult!5691)

(assert (=> b!575420 (= lt!262991 lt!263001)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35919 (_ BitVec 32)) SeekEntryResult!5691)

(assert (=> b!575420 (= lt!263001 (seekKeyOrZeroReturnVacant!0 (x!53884 lt!262992) (index!24993 lt!262992) (index!24993 lt!262992) lt!262994 lt!262997 mask!3119))))

(assert (=> b!575420 (= lt!262991 (seekEntryOrOpen!0 lt!262994 lt!262997 mask!3119))))

(assert (=> b!575420 (= lt!262995 lt!262993)))

(assert (=> b!575420 (= lt!262993 (seekKeyOrZeroReturnVacant!0 (x!53884 lt!262992) (index!24993 lt!262992) (index!24993 lt!262992) (select (arr!17242 a!3118) j!142) a!3118 mask!3119))))

(declare-fun res!363825 () Bool)

(assert (=> start!52774 (=> (not res!363825) (not e!331086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52774 (= res!363825 (validMask!0 mask!3119))))

(assert (=> start!52774 e!331086))

(assert (=> start!52774 true))

(declare-fun array_inv!13038 (array!35919) Bool)

(assert (=> start!52774 (array_inv!13038 a!3118)))

(declare-fun b!575417 () Bool)

(assert (=> b!575417 (= e!331086 e!331083)))

(declare-fun res!363830 () Bool)

(assert (=> b!575417 (=> (not res!363830) (not e!331083))))

(declare-fun lt!263000 () SeekEntryResult!5691)

(assert (=> b!575417 (= res!363830 (or (= lt!263000 (MissingZero!5691 i!1132)) (= lt!263000 (MissingVacant!5691 i!1132))))))

(assert (=> b!575417 (= lt!263000 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!52774 res!363825) b!575414))

(assert (= (and b!575414 res!363835) b!575415))

(assert (= (and b!575415 res!363826) b!575410))

(assert (= (and b!575410 res!363828) b!575409))

(assert (= (and b!575409 res!363831) b!575417))

(assert (= (and b!575417 res!363830) b!575411))

(assert (= (and b!575411 res!363832) b!575416))

(assert (= (and b!575416 res!363834) b!575412))

(assert (= (and b!575412 res!363827) b!575418))

(assert (= (and b!575418 (not res!363829)) b!575413))

(assert (= (and b!575413 (not res!363833)) b!575420))

(assert (= (and b!575420 (not res!363836)) b!575419))

(declare-fun m!554253 () Bool)

(assert (=> b!575409 m!554253))

(declare-fun m!554255 () Bool)

(assert (=> b!575419 m!554255))

(declare-fun m!554257 () Bool)

(assert (=> b!575420 m!554257))

(declare-fun m!554259 () Bool)

(assert (=> b!575420 m!554259))

(declare-fun m!554261 () Bool)

(assert (=> b!575420 m!554261))

(declare-fun m!554263 () Bool)

(assert (=> b!575420 m!554263))

(declare-fun m!554265 () Bool)

(assert (=> b!575420 m!554265))

(assert (=> b!575420 m!554259))

(declare-fun m!554267 () Bool)

(assert (=> b!575420 m!554267))

(assert (=> b!575415 m!554259))

(assert (=> b!575415 m!554259))

(declare-fun m!554269 () Bool)

(assert (=> b!575415 m!554269))

(declare-fun m!554271 () Bool)

(assert (=> b!575411 m!554271))

(declare-fun m!554273 () Bool)

(assert (=> b!575416 m!554273))

(declare-fun m!554275 () Bool)

(assert (=> start!52774 m!554275))

(declare-fun m!554277 () Bool)

(assert (=> start!52774 m!554277))

(assert (=> b!575412 m!554259))

(declare-fun m!554279 () Bool)

(assert (=> b!575412 m!554279))

(assert (=> b!575412 m!554259))

(declare-fun m!554281 () Bool)

(assert (=> b!575412 m!554281))

(declare-fun m!554283 () Bool)

(assert (=> b!575412 m!554283))

(assert (=> b!575412 m!554261))

(declare-fun m!554285 () Bool)

(assert (=> b!575412 m!554285))

(assert (=> b!575412 m!554259))

(declare-fun m!554287 () Bool)

(assert (=> b!575412 m!554287))

(assert (=> b!575418 m!554259))

(assert (=> b!575418 m!554259))

(declare-fun m!554289 () Bool)

(assert (=> b!575418 m!554289))

(declare-fun m!554291 () Bool)

(assert (=> b!575418 m!554291))

(declare-fun m!554293 () Bool)

(assert (=> b!575418 m!554293))

(declare-fun m!554295 () Bool)

(assert (=> b!575417 m!554295))

(assert (=> b!575413 m!554259))

(declare-fun m!554297 () Bool)

(assert (=> b!575413 m!554297))

(declare-fun m!554299 () Bool)

(assert (=> b!575410 m!554299))

(check-sat (not start!52774) (not b!575415) (not b!575409) (not b!575419) (not b!575416) (not b!575420) (not b!575418) (not b!575411) (not b!575410) (not b!575417) (not b!575412))
(check-sat)
