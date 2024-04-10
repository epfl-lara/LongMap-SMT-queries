; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65298 () Bool)

(assert start!65298)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41471 0))(
  ( (array!41472 (arr!19849 (Array (_ BitVec 32) (_ BitVec 64))) (size!20270 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41471)

(declare-fun e!414426 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun b!741392 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7449 0))(
  ( (MissingZero!7449 (index!32164 (_ BitVec 32))) (Found!7449 (index!32165 (_ BitVec 32))) (Intermediate!7449 (undefined!8261 Bool) (index!32166 (_ BitVec 32)) (x!63143 (_ BitVec 32))) (Undefined!7449) (MissingVacant!7449 (index!32167 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41471 (_ BitVec 32)) SeekEntryResult!7449)

(assert (=> b!741392 (= e!414426 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19849 a!3186) j!159) a!3186 mask!3328) (Found!7449 j!159)))))

(declare-fun b!741393 () Bool)

(declare-fun e!414424 () Bool)

(assert (=> b!741393 (= e!414424 (not true))))

(declare-fun e!414427 () Bool)

(assert (=> b!741393 e!414427))

(declare-fun res!498715 () Bool)

(assert (=> b!741393 (=> (not res!498715) (not e!414427))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41471 (_ BitVec 32)) Bool)

(assert (=> b!741393 (= res!498715 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25378 0))(
  ( (Unit!25379) )
))
(declare-fun lt!329389 () Unit!25378)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41471 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25378)

(assert (=> b!741393 (= lt!329389 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!741394 () Bool)

(declare-fun res!498705 () Bool)

(declare-fun e!414431 () Bool)

(assert (=> b!741394 (=> (not res!498705) (not e!414431))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!741394 (= res!498705 (validKeyInArray!0 (select (arr!19849 a!3186) j!159)))))

(declare-fun b!741395 () Bool)

(declare-fun res!498711 () Bool)

(declare-fun e!414428 () Bool)

(assert (=> b!741395 (=> (not res!498711) (not e!414428))))

(declare-datatypes ((List!13851 0))(
  ( (Nil!13848) (Cons!13847 (h!14919 (_ BitVec 64)) (t!20166 List!13851)) )
))
(declare-fun arrayNoDuplicates!0 (array!41471 (_ BitVec 32) List!13851) Bool)

(assert (=> b!741395 (= res!498711 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13848))))

(declare-fun b!741396 () Bool)

(declare-fun res!498718 () Bool)

(assert (=> b!741396 (=> (not res!498718) (not e!414431))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!741396 (= res!498718 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!741397 () Bool)

(declare-fun e!414429 () Bool)

(assert (=> b!741397 (= e!414427 e!414429)))

(declare-fun res!498717 () Bool)

(assert (=> b!741397 (=> (not res!498717) (not e!414429))))

(declare-fun lt!329388 () SeekEntryResult!7449)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41471 (_ BitVec 32)) SeekEntryResult!7449)

(assert (=> b!741397 (= res!498717 (= (seekEntryOrOpen!0 (select (arr!19849 a!3186) j!159) a!3186 mask!3328) lt!329388))))

(assert (=> b!741397 (= lt!329388 (Found!7449 j!159))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!741399 () Bool)

(assert (=> b!741399 (= e!414429 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19849 a!3186) j!159) a!3186 mask!3328) lt!329388))))

(declare-fun b!741400 () Bool)

(declare-fun lt!329393 () SeekEntryResult!7449)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41471 (_ BitVec 32)) SeekEntryResult!7449)

(assert (=> b!741400 (= e!414426 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19849 a!3186) j!159) a!3186 mask!3328) lt!329393))))

(declare-fun b!741401 () Bool)

(assert (=> b!741401 (= e!414431 e!414428)))

(declare-fun res!498712 () Bool)

(assert (=> b!741401 (=> (not res!498712) (not e!414428))))

(declare-fun lt!329392 () SeekEntryResult!7449)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!741401 (= res!498712 (or (= lt!329392 (MissingZero!7449 i!1173)) (= lt!329392 (MissingVacant!7449 i!1173))))))

(assert (=> b!741401 (= lt!329392 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!741402 () Bool)

(declare-fun e!414430 () Bool)

(assert (=> b!741402 (= e!414428 e!414430)))

(declare-fun res!498707 () Bool)

(assert (=> b!741402 (=> (not res!498707) (not e!414430))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!741402 (= res!498707 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19849 a!3186) j!159) mask!3328) (select (arr!19849 a!3186) j!159) a!3186 mask!3328) lt!329393))))

(assert (=> b!741402 (= lt!329393 (Intermediate!7449 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!741403 () Bool)

(declare-fun res!498706 () Bool)

(assert (=> b!741403 (=> (not res!498706) (not e!414430))))

(assert (=> b!741403 (= res!498706 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19849 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!741404 () Bool)

(declare-fun res!498719 () Bool)

(assert (=> b!741404 (=> (not res!498719) (not e!414428))))

(assert (=> b!741404 (= res!498719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!741405 () Bool)

(declare-fun res!498709 () Bool)

(assert (=> b!741405 (=> (not res!498709) (not e!414430))))

(assert (=> b!741405 (= res!498709 e!414426)))

(declare-fun c!81724 () Bool)

(assert (=> b!741405 (= c!81724 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!741406 () Bool)

(declare-fun res!498714 () Bool)

(assert (=> b!741406 (=> (not res!498714) (not e!414431))))

(assert (=> b!741406 (= res!498714 (and (= (size!20270 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20270 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20270 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!741407 () Bool)

(assert (=> b!741407 (= e!414430 e!414424)))

(declare-fun res!498708 () Bool)

(assert (=> b!741407 (=> (not res!498708) (not e!414424))))

(declare-fun lt!329390 () array!41471)

(declare-fun lt!329391 () (_ BitVec 64))

(assert (=> b!741407 (= res!498708 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329391 mask!3328) lt!329391 lt!329390 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329391 lt!329390 mask!3328)))))

(assert (=> b!741407 (= lt!329391 (select (store (arr!19849 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!741407 (= lt!329390 (array!41472 (store (arr!19849 a!3186) i!1173 k0!2102) (size!20270 a!3186)))))

(declare-fun b!741408 () Bool)

(declare-fun res!498710 () Bool)

(assert (=> b!741408 (=> (not res!498710) (not e!414428))))

(assert (=> b!741408 (= res!498710 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20270 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20270 a!3186))))))

(declare-fun b!741398 () Bool)

(declare-fun res!498716 () Bool)

(assert (=> b!741398 (=> (not res!498716) (not e!414431))))

(assert (=> b!741398 (= res!498716 (validKeyInArray!0 k0!2102))))

(declare-fun res!498713 () Bool)

(assert (=> start!65298 (=> (not res!498713) (not e!414431))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65298 (= res!498713 (validMask!0 mask!3328))))

(assert (=> start!65298 e!414431))

(assert (=> start!65298 true))

(declare-fun array_inv!15645 (array!41471) Bool)

(assert (=> start!65298 (array_inv!15645 a!3186)))

(assert (= (and start!65298 res!498713) b!741406))

(assert (= (and b!741406 res!498714) b!741394))

(assert (= (and b!741394 res!498705) b!741398))

(assert (= (and b!741398 res!498716) b!741396))

(assert (= (and b!741396 res!498718) b!741401))

(assert (= (and b!741401 res!498712) b!741404))

(assert (= (and b!741404 res!498719) b!741395))

(assert (= (and b!741395 res!498711) b!741408))

(assert (= (and b!741408 res!498710) b!741402))

(assert (= (and b!741402 res!498707) b!741403))

(assert (= (and b!741403 res!498706) b!741405))

(assert (= (and b!741405 c!81724) b!741400))

(assert (= (and b!741405 (not c!81724)) b!741392))

(assert (= (and b!741405 res!498709) b!741407))

(assert (= (and b!741407 res!498708) b!741393))

(assert (= (and b!741393 res!498715) b!741397))

(assert (= (and b!741397 res!498717) b!741399))

(declare-fun m!692369 () Bool)

(assert (=> b!741396 m!692369))

(declare-fun m!692371 () Bool)

(assert (=> b!741399 m!692371))

(assert (=> b!741399 m!692371))

(declare-fun m!692373 () Bool)

(assert (=> b!741399 m!692373))

(assert (=> b!741394 m!692371))

(assert (=> b!741394 m!692371))

(declare-fun m!692375 () Bool)

(assert (=> b!741394 m!692375))

(assert (=> b!741397 m!692371))

(assert (=> b!741397 m!692371))

(declare-fun m!692377 () Bool)

(assert (=> b!741397 m!692377))

(assert (=> b!741400 m!692371))

(assert (=> b!741400 m!692371))

(declare-fun m!692379 () Bool)

(assert (=> b!741400 m!692379))

(declare-fun m!692381 () Bool)

(assert (=> b!741395 m!692381))

(declare-fun m!692383 () Bool)

(assert (=> b!741407 m!692383))

(declare-fun m!692385 () Bool)

(assert (=> b!741407 m!692385))

(assert (=> b!741407 m!692383))

(declare-fun m!692387 () Bool)

(assert (=> b!741407 m!692387))

(declare-fun m!692389 () Bool)

(assert (=> b!741407 m!692389))

(declare-fun m!692391 () Bool)

(assert (=> b!741407 m!692391))

(declare-fun m!692393 () Bool)

(assert (=> b!741393 m!692393))

(declare-fun m!692395 () Bool)

(assert (=> b!741393 m!692395))

(declare-fun m!692397 () Bool)

(assert (=> b!741403 m!692397))

(declare-fun m!692399 () Bool)

(assert (=> b!741404 m!692399))

(declare-fun m!692401 () Bool)

(assert (=> start!65298 m!692401))

(declare-fun m!692403 () Bool)

(assert (=> start!65298 m!692403))

(declare-fun m!692405 () Bool)

(assert (=> b!741401 m!692405))

(assert (=> b!741402 m!692371))

(assert (=> b!741402 m!692371))

(declare-fun m!692407 () Bool)

(assert (=> b!741402 m!692407))

(assert (=> b!741402 m!692407))

(assert (=> b!741402 m!692371))

(declare-fun m!692409 () Bool)

(assert (=> b!741402 m!692409))

(declare-fun m!692411 () Bool)

(assert (=> b!741398 m!692411))

(assert (=> b!741392 m!692371))

(assert (=> b!741392 m!692371))

(declare-fun m!692413 () Bool)

(assert (=> b!741392 m!692413))

(check-sat (not start!65298) (not b!741397) (not b!741395) (not b!741404) (not b!741392) (not b!741402) (not b!741401) (not b!741400) (not b!741399) (not b!741398) (not b!741393) (not b!741396) (not b!741407) (not b!741394))
(check-sat)
