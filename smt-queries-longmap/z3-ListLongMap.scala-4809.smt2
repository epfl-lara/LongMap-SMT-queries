; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66196 () Bool)

(assert start!66196)

(declare-fun b!762237 () Bool)

(declare-fun res!515353 () Bool)

(declare-fun e!424927 () Bool)

(assert (=> b!762237 (=> (not res!515353) (not e!424927))))

(declare-datatypes ((array!42101 0))(
  ( (array!42102 (arr!20158 (Array (_ BitVec 32) (_ BitVec 64))) (size!20579 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42101)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!762237 (= res!515353 (and (= (size!20579 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20579 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20579 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!762238 () Bool)

(declare-fun res!515348 () Bool)

(assert (=> b!762238 (=> (not res!515348) (not e!424927))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762238 (= res!515348 (validKeyInArray!0 (select (arr!20158 a!3186) j!159)))))

(declare-fun b!762239 () Bool)

(declare-fun e!424929 () Bool)

(assert (=> b!762239 (= e!424927 e!424929)))

(declare-fun res!515351 () Bool)

(assert (=> b!762239 (=> (not res!515351) (not e!424929))))

(declare-datatypes ((SeekEntryResult!7758 0))(
  ( (MissingZero!7758 (index!33400 (_ BitVec 32))) (Found!7758 (index!33401 (_ BitVec 32))) (Intermediate!7758 (undefined!8570 Bool) (index!33402 (_ BitVec 32)) (x!64314 (_ BitVec 32))) (Undefined!7758) (MissingVacant!7758 (index!33403 (_ BitVec 32))) )
))
(declare-fun lt!339527 () SeekEntryResult!7758)

(assert (=> b!762239 (= res!515351 (or (= lt!339527 (MissingZero!7758 i!1173)) (= lt!339527 (MissingVacant!7758 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42101 (_ BitVec 32)) SeekEntryResult!7758)

(assert (=> b!762239 (= lt!339527 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!762240 () Bool)

(declare-fun res!515354 () Bool)

(assert (=> b!762240 (=> (not res!515354) (not e!424927))))

(declare-fun arrayContainsKey!0 (array!42101 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762240 (= res!515354 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!762241 () Bool)

(declare-fun res!515355 () Bool)

(assert (=> b!762241 (=> (not res!515355) (not e!424929))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762241 (= res!515355 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20579 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20579 a!3186))))))

(declare-fun b!762242 () Bool)

(assert (=> b!762242 (= e!424929 false)))

(declare-fun lt!339526 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762242 (= lt!339526 (toIndex!0 (select (arr!20158 a!3186) j!159) mask!3328))))

(declare-fun b!762243 () Bool)

(declare-fun res!515352 () Bool)

(assert (=> b!762243 (=> (not res!515352) (not e!424929))))

(declare-datatypes ((List!14160 0))(
  ( (Nil!14157) (Cons!14156 (h!15240 (_ BitVec 64)) (t!20475 List!14160)) )
))
(declare-fun arrayNoDuplicates!0 (array!42101 (_ BitVec 32) List!14160) Bool)

(assert (=> b!762243 (= res!515352 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14157))))

(declare-fun b!762244 () Bool)

(declare-fun res!515349 () Bool)

(assert (=> b!762244 (=> (not res!515349) (not e!424927))))

(assert (=> b!762244 (= res!515349 (validKeyInArray!0 k0!2102))))

(declare-fun b!762245 () Bool)

(declare-fun res!515356 () Bool)

(assert (=> b!762245 (=> (not res!515356) (not e!424929))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42101 (_ BitVec 32)) Bool)

(assert (=> b!762245 (= res!515356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!515350 () Bool)

(assert (=> start!66196 (=> (not res!515350) (not e!424927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66196 (= res!515350 (validMask!0 mask!3328))))

(assert (=> start!66196 e!424927))

(assert (=> start!66196 true))

(declare-fun array_inv!15954 (array!42101) Bool)

(assert (=> start!66196 (array_inv!15954 a!3186)))

(assert (= (and start!66196 res!515350) b!762237))

(assert (= (and b!762237 res!515353) b!762238))

(assert (= (and b!762238 res!515348) b!762244))

(assert (= (and b!762244 res!515349) b!762240))

(assert (= (and b!762240 res!515354) b!762239))

(assert (= (and b!762239 res!515351) b!762245))

(assert (= (and b!762245 res!515356) b!762243))

(assert (= (and b!762243 res!515352) b!762241))

(assert (= (and b!762241 res!515355) b!762242))

(declare-fun m!709025 () Bool)

(assert (=> b!762238 m!709025))

(assert (=> b!762238 m!709025))

(declare-fun m!709027 () Bool)

(assert (=> b!762238 m!709027))

(declare-fun m!709029 () Bool)

(assert (=> b!762244 m!709029))

(declare-fun m!709031 () Bool)

(assert (=> start!66196 m!709031))

(declare-fun m!709033 () Bool)

(assert (=> start!66196 m!709033))

(declare-fun m!709035 () Bool)

(assert (=> b!762239 m!709035))

(declare-fun m!709037 () Bool)

(assert (=> b!762240 m!709037))

(declare-fun m!709039 () Bool)

(assert (=> b!762243 m!709039))

(declare-fun m!709041 () Bool)

(assert (=> b!762245 m!709041))

(assert (=> b!762242 m!709025))

(assert (=> b!762242 m!709025))

(declare-fun m!709043 () Bool)

(assert (=> b!762242 m!709043))

(check-sat (not b!762238) (not b!762242) (not b!762240) (not start!66196) (not b!762244) (not b!762239) (not b!762245) (not b!762243))
(check-sat)
