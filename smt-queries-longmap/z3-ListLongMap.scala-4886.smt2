; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67364 () Bool)

(assert start!67364)

(declare-fun b!779230 () Bool)

(declare-fun res!527210 () Bool)

(declare-fun e!433509 () Bool)

(assert (=> b!779230 (=> (not res!527210) (not e!433509))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!779230 (= res!527210 (validKeyInArray!0 k0!2102))))

(declare-datatypes ((array!42593 0))(
  ( (array!42594 (arr!20389 (Array (_ BitVec 32) (_ BitVec 64))) (size!20810 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42593)

(declare-fun e!433506 () Bool)

(declare-fun b!779231 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7989 0))(
  ( (MissingZero!7989 (index!34324 (_ BitVec 32))) (Found!7989 (index!34325 (_ BitVec 32))) (Intermediate!7989 (undefined!8801 Bool) (index!34326 (_ BitVec 32)) (x!65270 (_ BitVec 32))) (Undefined!7989) (MissingVacant!7989 (index!34327 (_ BitVec 32))) )
))
(declare-fun lt!347189 () SeekEntryResult!7989)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42593 (_ BitVec 32)) SeekEntryResult!7989)

(assert (=> b!779231 (= e!433506 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20389 a!3186) j!159) a!3186 mask!3328) lt!347189))))

(declare-fun b!779232 () Bool)

(declare-fun e!433511 () Bool)

(assert (=> b!779232 (= e!433509 e!433511)))

(declare-fun res!527212 () Bool)

(assert (=> b!779232 (=> (not res!527212) (not e!433511))))

(declare-fun lt!347190 () SeekEntryResult!7989)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!779232 (= res!527212 (or (= lt!347190 (MissingZero!7989 i!1173)) (= lt!347190 (MissingVacant!7989 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42593 (_ BitVec 32)) SeekEntryResult!7989)

(assert (=> b!779232 (= lt!347190 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!779233 () Bool)

(declare-fun e!433508 () Bool)

(declare-fun e!433504 () Bool)

(assert (=> b!779233 (= e!433508 (not e!433504))))

(declare-fun res!527225 () Bool)

(assert (=> b!779233 (=> res!527225 e!433504)))

(declare-fun lt!347188 () SeekEntryResult!7989)

(get-info :version)

(assert (=> b!779233 (= res!527225 (or (not ((_ is Intermediate!7989) lt!347188)) (bvslt x!1131 (x!65270 lt!347188)) (not (= x!1131 (x!65270 lt!347188))) (not (= index!1321 (index!34326 lt!347188)))))))

(declare-fun e!433505 () Bool)

(assert (=> b!779233 e!433505))

(declare-fun res!527215 () Bool)

(assert (=> b!779233 (=> (not res!527215) (not e!433505))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42593 (_ BitVec 32)) Bool)

(assert (=> b!779233 (= res!527215 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26872 0))(
  ( (Unit!26873) )
))
(declare-fun lt!347192 () Unit!26872)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42593 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26872)

(assert (=> b!779233 (= lt!347192 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!779234 () Bool)

(declare-fun res!527220 () Bool)

(declare-fun e!433510 () Bool)

(assert (=> b!779234 (=> (not res!527220) (not e!433510))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!779234 (= res!527220 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20389 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!779235 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42593 (_ BitVec 32)) SeekEntryResult!7989)

(assert (=> b!779235 (= e!433506 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20389 a!3186) j!159) a!3186 mask!3328) (Found!7989 j!159)))))

(declare-fun res!527218 () Bool)

(assert (=> start!67364 (=> (not res!527218) (not e!433509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67364 (= res!527218 (validMask!0 mask!3328))))

(assert (=> start!67364 e!433509))

(assert (=> start!67364 true))

(declare-fun array_inv!16185 (array!42593) Bool)

(assert (=> start!67364 (array_inv!16185 a!3186)))

(declare-fun lt!347185 () SeekEntryResult!7989)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!779236 () Bool)

(declare-fun e!433503 () Bool)

(assert (=> b!779236 (= e!433503 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20389 a!3186) j!159) a!3186 mask!3328) lt!347185))))

(declare-fun b!779237 () Bool)

(declare-fun res!527224 () Bool)

(assert (=> b!779237 (=> (not res!527224) (not e!433511))))

(assert (=> b!779237 (= res!527224 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20810 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20810 a!3186))))))

(declare-fun b!779238 () Bool)

(declare-fun res!527222 () Bool)

(assert (=> b!779238 (=> (not res!527222) (not e!433509))))

(declare-fun arrayContainsKey!0 (array!42593 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!779238 (= res!527222 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!779239 () Bool)

(assert (=> b!779239 (= e!433510 e!433508)))

(declare-fun res!527219 () Bool)

(assert (=> b!779239 (=> (not res!527219) (not e!433508))))

(declare-fun lt!347191 () SeekEntryResult!7989)

(assert (=> b!779239 (= res!527219 (= lt!347191 lt!347188))))

(declare-fun lt!347184 () array!42593)

(declare-fun lt!347186 () (_ BitVec 64))

(assert (=> b!779239 (= lt!347188 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347186 lt!347184 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!779239 (= lt!347191 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347186 mask!3328) lt!347186 lt!347184 mask!3328))))

(assert (=> b!779239 (= lt!347186 (select (store (arr!20389 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!779239 (= lt!347184 (array!42594 (store (arr!20389 a!3186) i!1173 k0!2102) (size!20810 a!3186)))))

(declare-fun b!779240 () Bool)

(declare-fun res!527214 () Bool)

(assert (=> b!779240 (=> (not res!527214) (not e!433511))))

(assert (=> b!779240 (= res!527214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!779241 () Bool)

(assert (=> b!779241 (= e!433504 true)))

(declare-fun lt!347187 () SeekEntryResult!7989)

(assert (=> b!779241 (= lt!347187 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20389 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!779242 () Bool)

(declare-fun res!527223 () Bool)

(assert (=> b!779242 (=> (not res!527223) (not e!433510))))

(assert (=> b!779242 (= res!527223 e!433506)))

(declare-fun c!86413 () Bool)

(assert (=> b!779242 (= c!86413 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!779243 () Bool)

(declare-fun res!527221 () Bool)

(assert (=> b!779243 (=> (not res!527221) (not e!433509))))

(assert (=> b!779243 (= res!527221 (and (= (size!20810 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20810 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20810 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!779244 () Bool)

(assert (=> b!779244 (= e!433505 e!433503)))

(declare-fun res!527211 () Bool)

(assert (=> b!779244 (=> (not res!527211) (not e!433503))))

(assert (=> b!779244 (= res!527211 (= (seekEntryOrOpen!0 (select (arr!20389 a!3186) j!159) a!3186 mask!3328) lt!347185))))

(assert (=> b!779244 (= lt!347185 (Found!7989 j!159))))

(declare-fun b!779245 () Bool)

(declare-fun res!527213 () Bool)

(assert (=> b!779245 (=> (not res!527213) (not e!433509))))

(assert (=> b!779245 (= res!527213 (validKeyInArray!0 (select (arr!20389 a!3186) j!159)))))

(declare-fun b!779246 () Bool)

(assert (=> b!779246 (= e!433511 e!433510)))

(declare-fun res!527216 () Bool)

(assert (=> b!779246 (=> (not res!527216) (not e!433510))))

(assert (=> b!779246 (= res!527216 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20389 a!3186) j!159) mask!3328) (select (arr!20389 a!3186) j!159) a!3186 mask!3328) lt!347189))))

(assert (=> b!779246 (= lt!347189 (Intermediate!7989 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!779247 () Bool)

(declare-fun res!527217 () Bool)

(assert (=> b!779247 (=> (not res!527217) (not e!433511))))

(declare-datatypes ((List!14391 0))(
  ( (Nil!14388) (Cons!14387 (h!15501 (_ BitVec 64)) (t!20706 List!14391)) )
))
(declare-fun arrayNoDuplicates!0 (array!42593 (_ BitVec 32) List!14391) Bool)

(assert (=> b!779247 (= res!527217 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14388))))

(assert (= (and start!67364 res!527218) b!779243))

(assert (= (and b!779243 res!527221) b!779245))

(assert (= (and b!779245 res!527213) b!779230))

(assert (= (and b!779230 res!527210) b!779238))

(assert (= (and b!779238 res!527222) b!779232))

(assert (= (and b!779232 res!527212) b!779240))

(assert (= (and b!779240 res!527214) b!779247))

(assert (= (and b!779247 res!527217) b!779237))

(assert (= (and b!779237 res!527224) b!779246))

(assert (= (and b!779246 res!527216) b!779234))

(assert (= (and b!779234 res!527220) b!779242))

(assert (= (and b!779242 c!86413) b!779231))

(assert (= (and b!779242 (not c!86413)) b!779235))

(assert (= (and b!779242 res!527223) b!779239))

(assert (= (and b!779239 res!527219) b!779233))

(assert (= (and b!779233 res!527215) b!779244))

(assert (= (and b!779244 res!527211) b!779236))

(assert (= (and b!779233 (not res!527225)) b!779241))

(declare-fun m!722763 () Bool)

(assert (=> start!67364 m!722763))

(declare-fun m!722765 () Bool)

(assert (=> start!67364 m!722765))

(declare-fun m!722767 () Bool)

(assert (=> b!779247 m!722767))

(declare-fun m!722769 () Bool)

(assert (=> b!779245 m!722769))

(assert (=> b!779245 m!722769))

(declare-fun m!722771 () Bool)

(assert (=> b!779245 m!722771))

(assert (=> b!779236 m!722769))

(assert (=> b!779236 m!722769))

(declare-fun m!722773 () Bool)

(assert (=> b!779236 m!722773))

(assert (=> b!779235 m!722769))

(assert (=> b!779235 m!722769))

(declare-fun m!722775 () Bool)

(assert (=> b!779235 m!722775))

(declare-fun m!722777 () Bool)

(assert (=> b!779230 m!722777))

(assert (=> b!779244 m!722769))

(assert (=> b!779244 m!722769))

(declare-fun m!722779 () Bool)

(assert (=> b!779244 m!722779))

(declare-fun m!722781 () Bool)

(assert (=> b!779232 m!722781))

(declare-fun m!722783 () Bool)

(assert (=> b!779239 m!722783))

(declare-fun m!722785 () Bool)

(assert (=> b!779239 m!722785))

(declare-fun m!722787 () Bool)

(assert (=> b!779239 m!722787))

(declare-fun m!722789 () Bool)

(assert (=> b!779239 m!722789))

(declare-fun m!722791 () Bool)

(assert (=> b!779239 m!722791))

(assert (=> b!779239 m!722783))

(assert (=> b!779246 m!722769))

(assert (=> b!779246 m!722769))

(declare-fun m!722793 () Bool)

(assert (=> b!779246 m!722793))

(assert (=> b!779246 m!722793))

(assert (=> b!779246 m!722769))

(declare-fun m!722795 () Bool)

(assert (=> b!779246 m!722795))

(assert (=> b!779241 m!722769))

(assert (=> b!779241 m!722769))

(assert (=> b!779241 m!722775))

(declare-fun m!722797 () Bool)

(assert (=> b!779238 m!722797))

(declare-fun m!722799 () Bool)

(assert (=> b!779240 m!722799))

(declare-fun m!722801 () Bool)

(assert (=> b!779233 m!722801))

(declare-fun m!722803 () Bool)

(assert (=> b!779233 m!722803))

(assert (=> b!779231 m!722769))

(assert (=> b!779231 m!722769))

(declare-fun m!722805 () Bool)

(assert (=> b!779231 m!722805))

(declare-fun m!722807 () Bool)

(assert (=> b!779234 m!722807))

(check-sat (not b!779232) (not b!779247) (not b!779245) (not b!779238) (not b!779230) (not b!779240) (not b!779244) (not b!779239) (not b!779241) (not b!779233) (not b!779236) (not b!779235) (not start!67364) (not b!779231) (not b!779246))
(check-sat)
