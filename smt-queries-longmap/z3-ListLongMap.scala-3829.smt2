; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52448 () Bool)

(assert start!52448)

(declare-fun b!572662 () Bool)

(declare-fun res!362312 () Bool)

(declare-fun e!329412 () Bool)

(assert (=> b!572662 (=> (not res!362312) (not e!329412))))

(declare-datatypes ((array!35854 0))(
  ( (array!35855 (arr!17216 (Array (_ BitVec 32) (_ BitVec 64))) (size!17581 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35854)

(declare-datatypes ((List!11335 0))(
  ( (Nil!11332) (Cons!11331 (h!12358 (_ BitVec 64)) (t!17554 List!11335)) )
))
(declare-fun arrayNoDuplicates!0 (array!35854 (_ BitVec 32) List!11335) Bool)

(assert (=> b!572662 (= res!362312 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11332))))

(declare-fun e!329409 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!572663 () Bool)

(declare-fun lt!261351 () array!35854)

(declare-datatypes ((SeekEntryResult!5662 0))(
  ( (MissingZero!5662 (index!24875 (_ BitVec 32))) (Found!5662 (index!24876 (_ BitVec 32))) (Intermediate!5662 (undefined!6474 Bool) (index!24877 (_ BitVec 32)) (x!53750 (_ BitVec 32))) (Undefined!5662) (MissingVacant!5662 (index!24878 (_ BitVec 32))) )
))
(declare-fun lt!261348 () SeekEntryResult!5662)

(declare-fun lt!261344 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35854 (_ BitVec 32)) SeekEntryResult!5662)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35854 (_ BitVec 32)) SeekEntryResult!5662)

(assert (=> b!572663 (= e!329409 (= (seekEntryOrOpen!0 lt!261344 lt!261351 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53750 lt!261348) (index!24877 lt!261348) (index!24877 lt!261348) lt!261344 lt!261351 mask!3119)))))

(declare-fun b!572664 () Bool)

(declare-fun res!362321 () Bool)

(declare-fun e!329406 () Bool)

(assert (=> b!572664 (=> (not res!362321) (not e!329406))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35854 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572664 (= res!362321 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572665 () Bool)

(declare-fun e!329408 () Bool)

(declare-fun e!329407 () Bool)

(assert (=> b!572665 (= e!329408 e!329407)))

(declare-fun res!362324 () Bool)

(assert (=> b!572665 (=> res!362324 e!329407)))

(get-info :version)

(assert (=> b!572665 (= res!362324 (or (undefined!6474 lt!261348) (not ((_ is Intermediate!5662) lt!261348))))))

(declare-fun b!572666 () Bool)

(declare-fun e!329410 () Bool)

(assert (=> b!572666 (= e!329410 (not true))))

(assert (=> b!572666 e!329408))

(declare-fun res!362315 () Bool)

(assert (=> b!572666 (=> (not res!362315) (not e!329408))))

(declare-fun lt!261346 () SeekEntryResult!5662)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!572666 (= res!362315 (= lt!261346 (Found!5662 j!142)))))

(assert (=> b!572666 (= lt!261346 (seekEntryOrOpen!0 (select (arr!17216 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35854 (_ BitVec 32)) Bool)

(assert (=> b!572666 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18012 0))(
  ( (Unit!18013) )
))
(declare-fun lt!261345 () Unit!18012)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35854 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18012)

(assert (=> b!572666 (= lt!261345 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!572667 () Bool)

(assert (=> b!572667 (= e!329406 e!329412)))

(declare-fun res!362317 () Bool)

(assert (=> b!572667 (=> (not res!362317) (not e!329412))))

(declare-fun lt!261347 () SeekEntryResult!5662)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!572667 (= res!362317 (or (= lt!261347 (MissingZero!5662 i!1132)) (= lt!261347 (MissingVacant!5662 i!1132))))))

(assert (=> b!572667 (= lt!261347 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!572668 () Bool)

(declare-fun res!362313 () Bool)

(assert (=> b!572668 (=> (not res!362313) (not e!329412))))

(assert (=> b!572668 (= res!362313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!572669 () Bool)

(declare-fun e!329405 () Bool)

(assert (=> b!572669 (= e!329407 e!329405)))

(declare-fun res!362316 () Bool)

(assert (=> b!572669 (=> res!362316 e!329405)))

(declare-fun lt!261350 () (_ BitVec 64))

(assert (=> b!572669 (= res!362316 (or (= lt!261350 (select (arr!17216 a!3118) j!142)) (= lt!261350 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!572669 (= lt!261350 (select (arr!17216 a!3118) (index!24877 lt!261348)))))

(declare-fun b!572670 () Bool)

(declare-fun res!362322 () Bool)

(assert (=> b!572670 (=> (not res!362322) (not e!329406))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572670 (= res!362322 (validKeyInArray!0 k0!1914))))

(declare-fun res!362318 () Bool)

(assert (=> start!52448 (=> (not res!362318) (not e!329406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52448 (= res!362318 (validMask!0 mask!3119))))

(assert (=> start!52448 e!329406))

(assert (=> start!52448 true))

(declare-fun array_inv!13099 (array!35854) Bool)

(assert (=> start!52448 (array_inv!13099 a!3118)))

(declare-fun b!572671 () Bool)

(declare-fun res!362320 () Bool)

(assert (=> b!572671 (=> (not res!362320) (not e!329406))))

(assert (=> b!572671 (= res!362320 (validKeyInArray!0 (select (arr!17216 a!3118) j!142)))))

(declare-fun b!572672 () Bool)

(assert (=> b!572672 (= e!329412 e!329410)))

(declare-fun res!362323 () Bool)

(assert (=> b!572672 (=> (not res!362323) (not e!329410))))

(declare-fun lt!261349 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35854 (_ BitVec 32)) SeekEntryResult!5662)

(assert (=> b!572672 (= res!362323 (= lt!261348 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261349 lt!261344 lt!261351 mask!3119)))))

(declare-fun lt!261352 () (_ BitVec 32))

(assert (=> b!572672 (= lt!261348 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261352 (select (arr!17216 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572672 (= lt!261349 (toIndex!0 lt!261344 mask!3119))))

(assert (=> b!572672 (= lt!261344 (select (store (arr!17216 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!572672 (= lt!261352 (toIndex!0 (select (arr!17216 a!3118) j!142) mask!3119))))

(assert (=> b!572672 (= lt!261351 (array!35855 (store (arr!17216 a!3118) i!1132 k0!1914) (size!17581 a!3118)))))

(declare-fun b!572673 () Bool)

(assert (=> b!572673 (= e!329405 e!329409)))

(declare-fun res!362319 () Bool)

(assert (=> b!572673 (=> (not res!362319) (not e!329409))))

(assert (=> b!572673 (= res!362319 (= lt!261346 (seekKeyOrZeroReturnVacant!0 (x!53750 lt!261348) (index!24877 lt!261348) (index!24877 lt!261348) (select (arr!17216 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!572674 () Bool)

(declare-fun res!362314 () Bool)

(assert (=> b!572674 (=> (not res!362314) (not e!329406))))

(assert (=> b!572674 (= res!362314 (and (= (size!17581 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17581 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17581 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!52448 res!362318) b!572674))

(assert (= (and b!572674 res!362314) b!572671))

(assert (= (and b!572671 res!362320) b!572670))

(assert (= (and b!572670 res!362322) b!572664))

(assert (= (and b!572664 res!362321) b!572667))

(assert (= (and b!572667 res!362317) b!572668))

(assert (= (and b!572668 res!362313) b!572662))

(assert (= (and b!572662 res!362312) b!572672))

(assert (= (and b!572672 res!362323) b!572666))

(assert (= (and b!572666 res!362315) b!572665))

(assert (= (and b!572665 (not res!362324)) b!572669))

(assert (= (and b!572669 (not res!362316)) b!572673))

(assert (= (and b!572673 res!362319) b!572663))

(declare-fun m!551201 () Bool)

(assert (=> b!572666 m!551201))

(assert (=> b!572666 m!551201))

(declare-fun m!551203 () Bool)

(assert (=> b!572666 m!551203))

(declare-fun m!551205 () Bool)

(assert (=> b!572666 m!551205))

(declare-fun m!551207 () Bool)

(assert (=> b!572666 m!551207))

(declare-fun m!551209 () Bool)

(assert (=> b!572670 m!551209))

(assert (=> b!572669 m!551201))

(declare-fun m!551211 () Bool)

(assert (=> b!572669 m!551211))

(assert (=> b!572671 m!551201))

(assert (=> b!572671 m!551201))

(declare-fun m!551213 () Bool)

(assert (=> b!572671 m!551213))

(declare-fun m!551215 () Bool)

(assert (=> b!572663 m!551215))

(declare-fun m!551217 () Bool)

(assert (=> b!572663 m!551217))

(declare-fun m!551219 () Bool)

(assert (=> b!572668 m!551219))

(declare-fun m!551221 () Bool)

(assert (=> b!572662 m!551221))

(declare-fun m!551223 () Bool)

(assert (=> b!572667 m!551223))

(declare-fun m!551225 () Bool)

(assert (=> b!572664 m!551225))

(assert (=> b!572672 m!551201))

(declare-fun m!551227 () Bool)

(assert (=> b!572672 m!551227))

(assert (=> b!572672 m!551201))

(declare-fun m!551229 () Bool)

(assert (=> b!572672 m!551229))

(assert (=> b!572672 m!551201))

(declare-fun m!551231 () Bool)

(assert (=> b!572672 m!551231))

(declare-fun m!551233 () Bool)

(assert (=> b!572672 m!551233))

(declare-fun m!551235 () Bool)

(assert (=> b!572672 m!551235))

(declare-fun m!551237 () Bool)

(assert (=> b!572672 m!551237))

(declare-fun m!551239 () Bool)

(assert (=> start!52448 m!551239))

(declare-fun m!551241 () Bool)

(assert (=> start!52448 m!551241))

(assert (=> b!572673 m!551201))

(assert (=> b!572673 m!551201))

(declare-fun m!551243 () Bool)

(assert (=> b!572673 m!551243))

(check-sat (not b!572667) (not b!572672) (not b!572662) (not b!572666) (not b!572664) (not start!52448) (not b!572673) (not b!572670) (not b!572671) (not b!572668) (not b!572663))
(check-sat)
