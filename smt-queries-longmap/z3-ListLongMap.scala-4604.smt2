; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64238 () Bool)

(assert start!64238)

(declare-fun b!721186 () Bool)

(declare-fun res!483192 () Bool)

(declare-fun e!404407 () Bool)

(assert (=> b!721186 (=> (not res!483192) (not e!404407))))

(declare-datatypes ((array!40836 0))(
  ( (array!40837 (arr!19541 (Array (_ BitVec 32) (_ BitVec 64))) (size!19962 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40836)

(declare-datatypes ((List!13582 0))(
  ( (Nil!13579) (Cons!13578 (h!14632 (_ BitVec 64)) (t!19888 List!13582)) )
))
(declare-fun arrayNoDuplicates!0 (array!40836 (_ BitVec 32) List!13582) Bool)

(assert (=> b!721186 (= res!483192 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13579))))

(declare-fun b!721187 () Bool)

(declare-fun res!483190 () Bool)

(assert (=> b!721187 (=> (not res!483190) (not e!404407))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40836 (_ BitVec 32)) Bool)

(assert (=> b!721187 (= res!483190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-datatypes ((SeekEntryResult!7138 0))(
  ( (MissingZero!7138 (index!30920 (_ BitVec 32))) (Found!7138 (index!30921 (_ BitVec 32))) (Intermediate!7138 (undefined!7950 Bool) (index!30922 (_ BitVec 32)) (x!61942 (_ BitVec 32))) (Undefined!7138) (MissingVacant!7138 (index!30923 (_ BitVec 32))) )
))
(declare-fun lt!319844 () SeekEntryResult!7138)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!404404 () Bool)

(declare-fun b!721188 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40836 (_ BitVec 32)) SeekEntryResult!7138)

(assert (=> b!721188 (= e!404404 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19541 a!3186) j!159) a!3186 mask!3328) lt!319844))))

(declare-fun b!721189 () Bool)

(declare-fun res!483183 () Bool)

(declare-fun e!404406 () Bool)

(assert (=> b!721189 (=> (not res!483183) (not e!404406))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!721189 (= res!483183 (validKeyInArray!0 k0!2102))))

(declare-fun b!721190 () Bool)

(declare-fun e!404403 () Bool)

(assert (=> b!721190 (= e!404407 e!404403)))

(declare-fun res!483191 () Bool)

(assert (=> b!721190 (=> (not res!483191) (not e!404403))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!721190 (= res!483191 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19541 a!3186) j!159) mask!3328) (select (arr!19541 a!3186) j!159) a!3186 mask!3328) lt!319844))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!721190 (= lt!319844 (Intermediate!7138 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!721191 () Bool)

(declare-fun res!483181 () Bool)

(assert (=> b!721191 (=> (not res!483181) (not e!404406))))

(declare-fun arrayContainsKey!0 (array!40836 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!721191 (= res!483181 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!721192 () Bool)

(assert (=> b!721192 (= e!404406 e!404407)))

(declare-fun res!483189 () Bool)

(assert (=> b!721192 (=> (not res!483189) (not e!404407))))

(declare-fun lt!319843 () SeekEntryResult!7138)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!721192 (= res!483189 (or (= lt!319843 (MissingZero!7138 i!1173)) (= lt!319843 (MissingVacant!7138 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40836 (_ BitVec 32)) SeekEntryResult!7138)

(assert (=> b!721192 (= lt!319843 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!721194 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40836 (_ BitVec 32)) SeekEntryResult!7138)

(assert (=> b!721194 (= e!404404 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19541 a!3186) j!159) a!3186 mask!3328) (Found!7138 j!159)))))

(declare-fun b!721195 () Bool)

(declare-fun res!483187 () Bool)

(assert (=> b!721195 (=> (not res!483187) (not e!404406))))

(assert (=> b!721195 (= res!483187 (validKeyInArray!0 (select (arr!19541 a!3186) j!159)))))

(declare-fun b!721196 () Bool)

(declare-fun res!483186 () Bool)

(assert (=> b!721196 (=> (not res!483186) (not e!404403))))

(assert (=> b!721196 (= res!483186 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19541 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!483184 () Bool)

(assert (=> start!64238 (=> (not res!483184) (not e!404406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64238 (= res!483184 (validMask!0 mask!3328))))

(assert (=> start!64238 e!404406))

(assert (=> start!64238 true))

(declare-fun array_inv!15424 (array!40836) Bool)

(assert (=> start!64238 (array_inv!15424 a!3186)))

(declare-fun b!721193 () Bool)

(assert (=> b!721193 (= e!404403 false)))

(declare-fun lt!319842 () (_ BitVec 32))

(assert (=> b!721193 (= lt!319842 (toIndex!0 (select (store (arr!19541 a!3186) i!1173 k0!2102) j!159) mask!3328))))

(declare-fun b!721197 () Bool)

(declare-fun res!483185 () Bool)

(assert (=> b!721197 (=> (not res!483185) (not e!404407))))

(assert (=> b!721197 (= res!483185 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19962 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19962 a!3186))))))

(declare-fun b!721198 () Bool)

(declare-fun res!483182 () Bool)

(assert (=> b!721198 (=> (not res!483182) (not e!404406))))

(assert (=> b!721198 (= res!483182 (and (= (size!19962 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19962 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19962 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!721199 () Bool)

(declare-fun res!483188 () Bool)

(assert (=> b!721199 (=> (not res!483188) (not e!404403))))

(assert (=> b!721199 (= res!483188 e!404404)))

(declare-fun c!79374 () Bool)

(assert (=> b!721199 (= c!79374 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!64238 res!483184) b!721198))

(assert (= (and b!721198 res!483182) b!721195))

(assert (= (and b!721195 res!483187) b!721189))

(assert (= (and b!721189 res!483183) b!721191))

(assert (= (and b!721191 res!483181) b!721192))

(assert (= (and b!721192 res!483189) b!721187))

(assert (= (and b!721187 res!483190) b!721186))

(assert (= (and b!721186 res!483192) b!721197))

(assert (= (and b!721197 res!483185) b!721190))

(assert (= (and b!721190 res!483191) b!721196))

(assert (= (and b!721196 res!483186) b!721199))

(assert (= (and b!721199 c!79374) b!721188))

(assert (= (and b!721199 (not c!79374)) b!721194))

(assert (= (and b!721199 res!483188) b!721193))

(declare-fun m!675473 () Bool)

(assert (=> b!721193 m!675473))

(declare-fun m!675475 () Bool)

(assert (=> b!721193 m!675475))

(assert (=> b!721193 m!675475))

(declare-fun m!675477 () Bool)

(assert (=> b!721193 m!675477))

(declare-fun m!675479 () Bool)

(assert (=> b!721187 m!675479))

(declare-fun m!675481 () Bool)

(assert (=> b!721189 m!675481))

(declare-fun m!675483 () Bool)

(assert (=> b!721190 m!675483))

(assert (=> b!721190 m!675483))

(declare-fun m!675485 () Bool)

(assert (=> b!721190 m!675485))

(assert (=> b!721190 m!675485))

(assert (=> b!721190 m!675483))

(declare-fun m!675487 () Bool)

(assert (=> b!721190 m!675487))

(assert (=> b!721194 m!675483))

(assert (=> b!721194 m!675483))

(declare-fun m!675489 () Bool)

(assert (=> b!721194 m!675489))

(declare-fun m!675491 () Bool)

(assert (=> b!721191 m!675491))

(declare-fun m!675493 () Bool)

(assert (=> b!721196 m!675493))

(assert (=> b!721188 m!675483))

(assert (=> b!721188 m!675483))

(declare-fun m!675495 () Bool)

(assert (=> b!721188 m!675495))

(assert (=> b!721195 m!675483))

(assert (=> b!721195 m!675483))

(declare-fun m!675497 () Bool)

(assert (=> b!721195 m!675497))

(declare-fun m!675499 () Bool)

(assert (=> b!721192 m!675499))

(declare-fun m!675501 () Bool)

(assert (=> start!64238 m!675501))

(declare-fun m!675503 () Bool)

(assert (=> start!64238 m!675503))

(declare-fun m!675505 () Bool)

(assert (=> b!721186 m!675505))

(check-sat (not b!721194) (not b!721191) (not b!721190) (not b!721186) (not b!721193) (not b!721187) (not start!64238) (not b!721189) (not b!721188) (not b!721195) (not b!721192))
(check-sat)
