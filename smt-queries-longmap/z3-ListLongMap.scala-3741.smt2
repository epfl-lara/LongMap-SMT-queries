; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51442 () Bool)

(assert start!51442)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!256112 () (_ BitVec 64))

(declare-fun e!324058 () Bool)

(declare-fun b!562310 () Bool)

(declare-datatypes ((SeekEntryResult!5403 0))(
  ( (MissingZero!5403 (index!23839 (_ BitVec 32))) (Found!5403 (index!23840 (_ BitVec 32))) (Intermediate!5403 (undefined!6215 Bool) (index!23841 (_ BitVec 32)) (x!52738 (_ BitVec 32))) (Undefined!5403) (MissingVacant!5403 (index!23842 (_ BitVec 32))) )
))
(declare-fun lt!256119 () SeekEntryResult!5403)

(declare-datatypes ((array!35307 0))(
  ( (array!35308 (arr!16954 (Array (_ BitVec 32) (_ BitVec 64))) (size!17318 (_ BitVec 32))) )
))
(declare-fun lt!256117 () array!35307)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35307 (_ BitVec 32)) SeekEntryResult!5403)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35307 (_ BitVec 32)) SeekEntryResult!5403)

(assert (=> b!562310 (= e!324058 (= (seekEntryOrOpen!0 lt!256112 lt!256117 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52738 lt!256119) (index!23841 lt!256119) (index!23841 lt!256119) lt!256112 lt!256117 mask!3119)))))

(declare-fun b!562311 () Bool)

(declare-fun e!324062 () Bool)

(declare-fun e!324059 () Bool)

(assert (=> b!562311 (= e!324062 e!324059)))

(declare-fun res!353463 () Bool)

(assert (=> b!562311 (=> (not res!353463) (not e!324059))))

(declare-fun lt!256115 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35307 (_ BitVec 32)) SeekEntryResult!5403)

(assert (=> b!562311 (= res!353463 (= lt!256119 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256115 lt!256112 lt!256117 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!256118 () (_ BitVec 32))

(declare-fun a!3118 () array!35307)

(assert (=> b!562311 (= lt!256119 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256118 (select (arr!16954 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562311 (= lt!256115 (toIndex!0 lt!256112 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!562311 (= lt!256112 (select (store (arr!16954 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!562311 (= lt!256118 (toIndex!0 (select (arr!16954 a!3118) j!142) mask!3119))))

(assert (=> b!562311 (= lt!256117 (array!35308 (store (arr!16954 a!3118) i!1132 k0!1914) (size!17318 a!3118)))))

(declare-fun b!562312 () Bool)

(declare-fun e!324060 () Bool)

(assert (=> b!562312 (= e!324060 e!324058)))

(declare-fun res!353469 () Bool)

(assert (=> b!562312 (=> (not res!353469) (not e!324058))))

(declare-fun lt!256114 () SeekEntryResult!5403)

(assert (=> b!562312 (= res!353469 (= lt!256114 (seekKeyOrZeroReturnVacant!0 (x!52738 lt!256119) (index!23841 lt!256119) (index!23841 lt!256119) (select (arr!16954 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!562313 () Bool)

(declare-fun res!353473 () Bool)

(declare-fun e!324057 () Bool)

(assert (=> b!562313 (=> (not res!353473) (not e!324057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562313 (= res!353473 (validKeyInArray!0 (select (arr!16954 a!3118) j!142)))))

(declare-fun b!562314 () Bool)

(declare-fun res!353470 () Bool)

(assert (=> b!562314 (=> (not res!353470) (not e!324062))))

(declare-datatypes ((List!11034 0))(
  ( (Nil!11031) (Cons!11030 (h!12033 (_ BitVec 64)) (t!17262 List!11034)) )
))
(declare-fun arrayNoDuplicates!0 (array!35307 (_ BitVec 32) List!11034) Bool)

(assert (=> b!562314 (= res!353470 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11031))))

(declare-fun b!562315 () Bool)

(assert (=> b!562315 (= e!324057 e!324062)))

(declare-fun res!353471 () Bool)

(assert (=> b!562315 (=> (not res!353471) (not e!324062))))

(declare-fun lt!256113 () SeekEntryResult!5403)

(assert (=> b!562315 (= res!353471 (or (= lt!256113 (MissingZero!5403 i!1132)) (= lt!256113 (MissingVacant!5403 i!1132))))))

(assert (=> b!562315 (= lt!256113 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!562316 () Bool)

(declare-fun res!353464 () Bool)

(assert (=> b!562316 (=> (not res!353464) (not e!324057))))

(declare-fun arrayContainsKey!0 (array!35307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562316 (= res!353464 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562317 () Bool)

(declare-fun res!353472 () Bool)

(assert (=> b!562317 (=> (not res!353472) (not e!324057))))

(assert (=> b!562317 (= res!353472 (validKeyInArray!0 k0!1914))))

(declare-fun res!353468 () Bool)

(assert (=> start!51442 (=> (not res!353468) (not e!324057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51442 (= res!353468 (validMask!0 mask!3119))))

(assert (=> start!51442 e!324057))

(assert (=> start!51442 true))

(declare-fun array_inv!12750 (array!35307) Bool)

(assert (=> start!51442 (array_inv!12750 a!3118)))

(declare-fun b!562318 () Bool)

(declare-fun res!353466 () Bool)

(assert (=> b!562318 (=> (not res!353466) (not e!324057))))

(assert (=> b!562318 (= res!353466 (and (= (size!17318 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17318 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17318 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562319 () Bool)

(assert (=> b!562319 (= e!324059 (not true))))

(declare-fun e!324063 () Bool)

(assert (=> b!562319 e!324063))

(declare-fun res!353462 () Bool)

(assert (=> b!562319 (=> (not res!353462) (not e!324063))))

(assert (=> b!562319 (= res!353462 (= lt!256114 (Found!5403 j!142)))))

(assert (=> b!562319 (= lt!256114 (seekEntryOrOpen!0 (select (arr!16954 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35307 (_ BitVec 32)) Bool)

(assert (=> b!562319 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17580 0))(
  ( (Unit!17581) )
))
(declare-fun lt!256120 () Unit!17580)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35307 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17580)

(assert (=> b!562319 (= lt!256120 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562320 () Bool)

(declare-fun e!324056 () Bool)

(assert (=> b!562320 (= e!324056 e!324060)))

(declare-fun res!353465 () Bool)

(assert (=> b!562320 (=> res!353465 e!324060)))

(declare-fun lt!256116 () (_ BitVec 64))

(assert (=> b!562320 (= res!353465 (or (= lt!256116 (select (arr!16954 a!3118) j!142)) (= lt!256116 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562320 (= lt!256116 (select (arr!16954 a!3118) (index!23841 lt!256119)))))

(declare-fun b!562321 () Bool)

(assert (=> b!562321 (= e!324063 e!324056)))

(declare-fun res!353474 () Bool)

(assert (=> b!562321 (=> res!353474 e!324056)))

(get-info :version)

(assert (=> b!562321 (= res!353474 (or (undefined!6215 lt!256119) (not ((_ is Intermediate!5403) lt!256119))))))

(declare-fun b!562322 () Bool)

(declare-fun res!353467 () Bool)

(assert (=> b!562322 (=> (not res!353467) (not e!324062))))

(assert (=> b!562322 (= res!353467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51442 res!353468) b!562318))

(assert (= (and b!562318 res!353466) b!562313))

(assert (= (and b!562313 res!353473) b!562317))

(assert (= (and b!562317 res!353472) b!562316))

(assert (= (and b!562316 res!353464) b!562315))

(assert (= (and b!562315 res!353471) b!562322))

(assert (= (and b!562322 res!353467) b!562314))

(assert (= (and b!562314 res!353470) b!562311))

(assert (= (and b!562311 res!353463) b!562319))

(assert (= (and b!562319 res!353462) b!562321))

(assert (= (and b!562321 (not res!353474)) b!562320))

(assert (= (and b!562320 (not res!353465)) b!562312))

(assert (= (and b!562312 res!353469) b!562310))

(declare-fun m!540317 () Bool)

(assert (=> b!562319 m!540317))

(assert (=> b!562319 m!540317))

(declare-fun m!540319 () Bool)

(assert (=> b!562319 m!540319))

(declare-fun m!540321 () Bool)

(assert (=> b!562319 m!540321))

(declare-fun m!540323 () Bool)

(assert (=> b!562319 m!540323))

(declare-fun m!540325 () Bool)

(assert (=> b!562316 m!540325))

(assert (=> b!562320 m!540317))

(declare-fun m!540327 () Bool)

(assert (=> b!562320 m!540327))

(assert (=> b!562312 m!540317))

(assert (=> b!562312 m!540317))

(declare-fun m!540329 () Bool)

(assert (=> b!562312 m!540329))

(assert (=> b!562311 m!540317))

(declare-fun m!540331 () Bool)

(assert (=> b!562311 m!540331))

(assert (=> b!562311 m!540317))

(declare-fun m!540333 () Bool)

(assert (=> b!562311 m!540333))

(declare-fun m!540335 () Bool)

(assert (=> b!562311 m!540335))

(assert (=> b!562311 m!540317))

(declare-fun m!540337 () Bool)

(assert (=> b!562311 m!540337))

(declare-fun m!540339 () Bool)

(assert (=> b!562311 m!540339))

(declare-fun m!540341 () Bool)

(assert (=> b!562311 m!540341))

(declare-fun m!540343 () Bool)

(assert (=> b!562317 m!540343))

(declare-fun m!540345 () Bool)

(assert (=> start!51442 m!540345))

(declare-fun m!540347 () Bool)

(assert (=> start!51442 m!540347))

(declare-fun m!540349 () Bool)

(assert (=> b!562310 m!540349))

(declare-fun m!540351 () Bool)

(assert (=> b!562310 m!540351))

(assert (=> b!562313 m!540317))

(assert (=> b!562313 m!540317))

(declare-fun m!540353 () Bool)

(assert (=> b!562313 m!540353))

(declare-fun m!540355 () Bool)

(assert (=> b!562315 m!540355))

(declare-fun m!540357 () Bool)

(assert (=> b!562314 m!540357))

(declare-fun m!540359 () Bool)

(assert (=> b!562322 m!540359))

(check-sat (not b!562312) (not b!562316) (not b!562310) (not b!562313) (not b!562315) (not b!562314) (not b!562319) (not b!562322) (not b!562311) (not b!562317) (not start!51442))
(check-sat)
