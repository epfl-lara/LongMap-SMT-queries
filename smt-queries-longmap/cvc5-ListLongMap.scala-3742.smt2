; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51446 () Bool)

(assert start!51446)

(declare-fun b!562386 () Bool)

(declare-fun res!353545 () Bool)

(declare-fun e!324104 () Bool)

(assert (=> b!562386 (=> (not res!353545) (not e!324104))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562386 (= res!353545 (validKeyInArray!0 k!1914))))

(declare-fun b!562387 () Bool)

(declare-fun res!353548 () Bool)

(assert (=> b!562387 (=> (not res!353548) (not e!324104))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35311 0))(
  ( (array!35312 (arr!16956 (Array (_ BitVec 32) (_ BitVec 64))) (size!17320 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35311)

(assert (=> b!562387 (= res!353548 (and (= (size!17320 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17320 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17320 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562388 () Bool)

(declare-fun e!324102 () Bool)

(declare-fun e!324105 () Bool)

(assert (=> b!562388 (= e!324102 e!324105)))

(declare-fun res!353549 () Bool)

(assert (=> b!562388 (=> res!353549 e!324105)))

(declare-datatypes ((SeekEntryResult!5405 0))(
  ( (MissingZero!5405 (index!23847 (_ BitVec 32))) (Found!5405 (index!23848 (_ BitVec 32))) (Intermediate!5405 (undefined!6217 Bool) (index!23849 (_ BitVec 32)) (x!52748 (_ BitVec 32))) (Undefined!5405) (MissingVacant!5405 (index!23850 (_ BitVec 32))) )
))
(declare-fun lt!256186 () SeekEntryResult!5405)

(declare-fun lt!256187 () SeekEntryResult!5405)

(declare-fun lt!256184 () SeekEntryResult!5405)

(declare-fun lt!256176 () (_ BitVec 64))

(assert (=> b!562388 (= res!353549 (or (bvslt (index!23849 lt!256187) #b00000000000000000000000000000000) (bvsge (index!23849 lt!256187) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52748 lt!256187) #b01111111111111111111111111111110) (bvslt (x!52748 lt!256187) #b00000000000000000000000000000000) (not (= lt!256176 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16956 a!3118) i!1132 k!1914) (index!23849 lt!256187)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!256184 lt!256186))))))

(declare-fun lt!256180 () SeekEntryResult!5405)

(declare-fun lt!256177 () SeekEntryResult!5405)

(assert (=> b!562388 (= lt!256180 lt!256177)))

(declare-fun lt!256185 () array!35311)

(declare-fun lt!256182 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35311 (_ BitVec 32)) SeekEntryResult!5405)

(assert (=> b!562388 (= lt!256177 (seekKeyOrZeroReturnVacant!0 (x!52748 lt!256187) (index!23849 lt!256187) (index!23849 lt!256187) lt!256182 lt!256185 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35311 (_ BitVec 32)) SeekEntryResult!5405)

(assert (=> b!562388 (= lt!256180 (seekEntryOrOpen!0 lt!256182 lt!256185 mask!3119))))

(declare-fun lt!256181 () SeekEntryResult!5405)

(assert (=> b!562388 (= lt!256181 lt!256184)))

(assert (=> b!562388 (= lt!256184 (seekKeyOrZeroReturnVacant!0 (x!52748 lt!256187) (index!23849 lt!256187) (index!23849 lt!256187) (select (arr!16956 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!562389 () Bool)

(declare-fun e!324107 () Bool)

(declare-fun e!324103 () Bool)

(assert (=> b!562389 (= e!324107 (not e!324103))))

(declare-fun res!353538 () Bool)

(assert (=> b!562389 (=> res!353538 e!324103)))

(assert (=> b!562389 (= res!353538 (or (undefined!6217 lt!256187) (not (is-Intermediate!5405 lt!256187))))))

(assert (=> b!562389 (= lt!256181 lt!256186)))

(assert (=> b!562389 (= lt!256186 (Found!5405 j!142))))

(assert (=> b!562389 (= lt!256181 (seekEntryOrOpen!0 (select (arr!16956 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35311 (_ BitVec 32)) Bool)

(assert (=> b!562389 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17584 0))(
  ( (Unit!17585) )
))
(declare-fun lt!256178 () Unit!17584)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35311 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17584)

(assert (=> b!562389 (= lt!256178 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562390 () Bool)

(declare-fun res!353542 () Bool)

(assert (=> b!562390 (=> (not res!353542) (not e!324104))))

(declare-fun arrayContainsKey!0 (array!35311 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562390 (= res!353542 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562391 () Bool)

(assert (=> b!562391 (= e!324103 e!324102)))

(declare-fun res!353547 () Bool)

(assert (=> b!562391 (=> res!353547 e!324102)))

(assert (=> b!562391 (= res!353547 (or (= lt!256176 (select (arr!16956 a!3118) j!142)) (= lt!256176 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562391 (= lt!256176 (select (arr!16956 a!3118) (index!23849 lt!256187)))))

(declare-fun b!562392 () Bool)

(declare-fun res!353539 () Bool)

(declare-fun e!324108 () Bool)

(assert (=> b!562392 (=> (not res!353539) (not e!324108))))

(declare-datatypes ((List!11036 0))(
  ( (Nil!11033) (Cons!11032 (h!12035 (_ BitVec 64)) (t!17264 List!11036)) )
))
(declare-fun arrayNoDuplicates!0 (array!35311 (_ BitVec 32) List!11036) Bool)

(assert (=> b!562392 (= res!353539 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11033))))

(declare-fun res!353541 () Bool)

(assert (=> start!51446 (=> (not res!353541) (not e!324104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51446 (= res!353541 (validMask!0 mask!3119))))

(assert (=> start!51446 e!324104))

(assert (=> start!51446 true))

(declare-fun array_inv!12752 (array!35311) Bool)

(assert (=> start!51446 (array_inv!12752 a!3118)))

(declare-fun b!562393 () Bool)

(declare-fun res!353544 () Bool)

(assert (=> b!562393 (=> (not res!353544) (not e!324108))))

(assert (=> b!562393 (= res!353544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562394 () Bool)

(declare-fun res!353546 () Bool)

(assert (=> b!562394 (=> (not res!353546) (not e!324104))))

(assert (=> b!562394 (= res!353546 (validKeyInArray!0 (select (arr!16956 a!3118) j!142)))))

(declare-fun b!562395 () Bool)

(assert (=> b!562395 (= e!324104 e!324108)))

(declare-fun res!353543 () Bool)

(assert (=> b!562395 (=> (not res!353543) (not e!324108))))

(declare-fun lt!256179 () SeekEntryResult!5405)

(assert (=> b!562395 (= res!353543 (or (= lt!256179 (MissingZero!5405 i!1132)) (= lt!256179 (MissingVacant!5405 i!1132))))))

(assert (=> b!562395 (= lt!256179 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!562396 () Bool)

(assert (=> b!562396 (= e!324105 true)))

(assert (=> b!562396 (= lt!256184 lt!256177)))

(declare-fun lt!256189 () Unit!17584)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35311 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17584)

(assert (=> b!562396 (= lt!256189 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k!1914 j!142 (x!52748 lt!256187) (index!23849 lt!256187) (index!23849 lt!256187) mask!3119))))

(declare-fun b!562397 () Bool)

(assert (=> b!562397 (= e!324108 e!324107)))

(declare-fun res!353540 () Bool)

(assert (=> b!562397 (=> (not res!353540) (not e!324107))))

(declare-fun lt!256183 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35311 (_ BitVec 32)) SeekEntryResult!5405)

(assert (=> b!562397 (= res!353540 (= lt!256187 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256183 lt!256182 lt!256185 mask!3119)))))

(declare-fun lt!256188 () (_ BitVec 32))

(assert (=> b!562397 (= lt!256187 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256188 (select (arr!16956 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562397 (= lt!256183 (toIndex!0 lt!256182 mask!3119))))

(assert (=> b!562397 (= lt!256182 (select (store (arr!16956 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!562397 (= lt!256188 (toIndex!0 (select (arr!16956 a!3118) j!142) mask!3119))))

(assert (=> b!562397 (= lt!256185 (array!35312 (store (arr!16956 a!3118) i!1132 k!1914) (size!17320 a!3118)))))

(assert (= (and start!51446 res!353541) b!562387))

(assert (= (and b!562387 res!353548) b!562394))

(assert (= (and b!562394 res!353546) b!562386))

(assert (= (and b!562386 res!353545) b!562390))

(assert (= (and b!562390 res!353542) b!562395))

(assert (= (and b!562395 res!353543) b!562393))

(assert (= (and b!562393 res!353544) b!562392))

(assert (= (and b!562392 res!353539) b!562397))

(assert (= (and b!562397 res!353540) b!562389))

(assert (= (and b!562389 (not res!353538)) b!562391))

(assert (= (and b!562391 (not res!353547)) b!562388))

(assert (= (and b!562388 (not res!353549)) b!562396))

(declare-fun m!540405 () Bool)

(assert (=> b!562393 m!540405))

(declare-fun m!540407 () Bool)

(assert (=> b!562388 m!540407))

(declare-fun m!540409 () Bool)

(assert (=> b!562388 m!540409))

(assert (=> b!562388 m!540407))

(declare-fun m!540411 () Bool)

(assert (=> b!562388 m!540411))

(declare-fun m!540413 () Bool)

(assert (=> b!562388 m!540413))

(declare-fun m!540415 () Bool)

(assert (=> b!562388 m!540415))

(declare-fun m!540417 () Bool)

(assert (=> b!562388 m!540417))

(assert (=> b!562389 m!540407))

(assert (=> b!562389 m!540407))

(declare-fun m!540419 () Bool)

(assert (=> b!562389 m!540419))

(declare-fun m!540421 () Bool)

(assert (=> b!562389 m!540421))

(declare-fun m!540423 () Bool)

(assert (=> b!562389 m!540423))

(declare-fun m!540425 () Bool)

(assert (=> b!562397 m!540425))

(assert (=> b!562397 m!540407))

(declare-fun m!540427 () Bool)

(assert (=> b!562397 m!540427))

(assert (=> b!562397 m!540407))

(assert (=> b!562397 m!540407))

(declare-fun m!540429 () Bool)

(assert (=> b!562397 m!540429))

(declare-fun m!540431 () Bool)

(assert (=> b!562397 m!540431))

(declare-fun m!540433 () Bool)

(assert (=> b!562397 m!540433))

(assert (=> b!562397 m!540411))

(declare-fun m!540435 () Bool)

(assert (=> b!562392 m!540435))

(declare-fun m!540437 () Bool)

(assert (=> b!562390 m!540437))

(declare-fun m!540439 () Bool)

(assert (=> start!51446 m!540439))

(declare-fun m!540441 () Bool)

(assert (=> start!51446 m!540441))

(declare-fun m!540443 () Bool)

(assert (=> b!562396 m!540443))

(declare-fun m!540445 () Bool)

(assert (=> b!562386 m!540445))

(assert (=> b!562394 m!540407))

(assert (=> b!562394 m!540407))

(declare-fun m!540447 () Bool)

(assert (=> b!562394 m!540447))

(declare-fun m!540449 () Bool)

(assert (=> b!562395 m!540449))

(assert (=> b!562391 m!540407))

(declare-fun m!540451 () Bool)

(assert (=> b!562391 m!540451))

(push 1)

