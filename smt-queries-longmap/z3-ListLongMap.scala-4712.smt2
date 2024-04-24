; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65460 () Bool)

(assert start!65460)

(declare-fun b!743006 () Bool)

(declare-fun e!415316 () Bool)

(assert (=> b!743006 (= e!415316 true)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41503 0))(
  ( (array!41504 (arr!19861 (Array (_ BitVec 32) (_ BitVec 64))) (size!20281 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41503)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7417 0))(
  ( (MissingZero!7417 (index!32036 (_ BitVec 32))) (Found!7417 (index!32037 (_ BitVec 32))) (Intermediate!7417 (undefined!8229 Bool) (index!32038 (_ BitVec 32)) (x!63171 (_ BitVec 32))) (Undefined!7417) (MissingVacant!7417 (index!32039 (_ BitVec 32))) )
))
(declare-fun lt!330055 () SeekEntryResult!7417)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41503 (_ BitVec 32)) SeekEntryResult!7417)

(assert (=> b!743006 (= lt!330055 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19861 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!743007 () Bool)

(declare-fun res!499777 () Bool)

(declare-fun e!415320 () Bool)

(assert (=> b!743007 (=> (not res!499777) (not e!415320))))

(declare-datatypes ((List!13770 0))(
  ( (Nil!13767) (Cons!13766 (h!14844 (_ BitVec 64)) (t!20077 List!13770)) )
))
(declare-fun arrayNoDuplicates!0 (array!41503 (_ BitVec 32) List!13770) Bool)

(assert (=> b!743007 (= res!499777 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13767))))

(declare-fun b!743008 () Bool)

(declare-fun res!499790 () Bool)

(declare-fun e!415317 () Bool)

(assert (=> b!743008 (=> (not res!499790) (not e!415317))))

(declare-fun e!415315 () Bool)

(assert (=> b!743008 (= res!499790 e!415315)))

(declare-fun c!81998 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!743008 (= c!81998 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!743009 () Bool)

(declare-fun res!499789 () Bool)

(assert (=> b!743009 (=> (not res!499789) (not e!415317))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!743009 (= res!499789 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19861 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!743010 () Bool)

(declare-fun e!415319 () Bool)

(declare-fun e!415318 () Bool)

(assert (=> b!743010 (= e!415319 e!415318)))

(declare-fun res!499783 () Bool)

(assert (=> b!743010 (=> (not res!499783) (not e!415318))))

(declare-fun lt!330051 () SeekEntryResult!7417)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41503 (_ BitVec 32)) SeekEntryResult!7417)

(assert (=> b!743010 (= res!499783 (= (seekEntryOrOpen!0 (select (arr!19861 a!3186) j!159) a!3186 mask!3328) lt!330051))))

(assert (=> b!743010 (= lt!330051 (Found!7417 j!159))))

(declare-fun b!743011 () Bool)

(assert (=> b!743011 (= e!415320 e!415317)))

(declare-fun res!499781 () Bool)

(assert (=> b!743011 (=> (not res!499781) (not e!415317))))

(declare-fun lt!330049 () SeekEntryResult!7417)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41503 (_ BitVec 32)) SeekEntryResult!7417)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!743011 (= res!499781 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19861 a!3186) j!159) mask!3328) (select (arr!19861 a!3186) j!159) a!3186 mask!3328) lt!330049))))

(assert (=> b!743011 (= lt!330049 (Intermediate!7417 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!743012 () Bool)

(declare-fun res!499788 () Bool)

(declare-fun e!415312 () Bool)

(assert (=> b!743012 (=> (not res!499788) (not e!415312))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!743012 (= res!499788 (validKeyInArray!0 k0!2102))))

(declare-fun res!499784 () Bool)

(assert (=> start!65460 (=> (not res!499784) (not e!415312))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65460 (= res!499784 (validMask!0 mask!3328))))

(assert (=> start!65460 e!415312))

(assert (=> start!65460 true))

(declare-fun array_inv!15720 (array!41503) Bool)

(assert (=> start!65460 (array_inv!15720 a!3186)))

(declare-fun b!743013 () Bool)

(declare-fun res!499786 () Bool)

(assert (=> b!743013 (=> (not res!499786) (not e!415312))))

(assert (=> b!743013 (= res!499786 (validKeyInArray!0 (select (arr!19861 a!3186) j!159)))))

(declare-fun b!743014 () Bool)

(declare-fun res!499782 () Bool)

(assert (=> b!743014 (=> (not res!499782) (not e!415320))))

(assert (=> b!743014 (= res!499782 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20281 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20281 a!3186))))))

(declare-fun b!743015 () Bool)

(declare-fun e!415314 () Bool)

(assert (=> b!743015 (= e!415317 e!415314)))

(declare-fun res!499780 () Bool)

(assert (=> b!743015 (=> (not res!499780) (not e!415314))))

(declare-fun lt!330056 () SeekEntryResult!7417)

(declare-fun lt!330052 () SeekEntryResult!7417)

(assert (=> b!743015 (= res!499780 (= lt!330056 lt!330052))))

(declare-fun lt!330054 () (_ BitVec 64))

(declare-fun lt!330057 () array!41503)

(assert (=> b!743015 (= lt!330052 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330054 lt!330057 mask!3328))))

(assert (=> b!743015 (= lt!330056 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330054 mask!3328) lt!330054 lt!330057 mask!3328))))

(assert (=> b!743015 (= lt!330054 (select (store (arr!19861 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!743015 (= lt!330057 (array!41504 (store (arr!19861 a!3186) i!1173 k0!2102) (size!20281 a!3186)))))

(declare-fun b!743016 () Bool)

(assert (=> b!743016 (= e!415315 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19861 a!3186) j!159) a!3186 mask!3328) lt!330049))))

(declare-fun b!743017 () Bool)

(declare-fun res!499785 () Bool)

(assert (=> b!743017 (=> (not res!499785) (not e!415312))))

(assert (=> b!743017 (= res!499785 (and (= (size!20281 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20281 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20281 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!743018 () Bool)

(declare-fun res!499778 () Bool)

(assert (=> b!743018 (=> (not res!499778) (not e!415312))))

(declare-fun arrayContainsKey!0 (array!41503 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!743018 (= res!499778 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!743019 () Bool)

(assert (=> b!743019 (= e!415315 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19861 a!3186) j!159) a!3186 mask!3328) (Found!7417 j!159)))))

(declare-fun b!743020 () Bool)

(declare-fun res!499792 () Bool)

(assert (=> b!743020 (=> (not res!499792) (not e!415320))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41503 (_ BitVec 32)) Bool)

(assert (=> b!743020 (= res!499792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!743021 () Bool)

(assert (=> b!743021 (= e!415314 (not e!415316))))

(declare-fun res!499791 () Bool)

(assert (=> b!743021 (=> res!499791 e!415316)))

(get-info :version)

(assert (=> b!743021 (= res!499791 (or (not ((_ is Intermediate!7417) lt!330052)) (bvslt x!1131 (x!63171 lt!330052)) (not (= x!1131 (x!63171 lt!330052))) (not (= index!1321 (index!32038 lt!330052)))))))

(assert (=> b!743021 e!415319))

(declare-fun res!499779 () Bool)

(assert (=> b!743021 (=> (not res!499779) (not e!415319))))

(assert (=> b!743021 (= res!499779 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25393 0))(
  ( (Unit!25394) )
))
(declare-fun lt!330053 () Unit!25393)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41503 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25393)

(assert (=> b!743021 (= lt!330053 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!743022 () Bool)

(assert (=> b!743022 (= e!415312 e!415320)))

(declare-fun res!499787 () Bool)

(assert (=> b!743022 (=> (not res!499787) (not e!415320))))

(declare-fun lt!330050 () SeekEntryResult!7417)

(assert (=> b!743022 (= res!499787 (or (= lt!330050 (MissingZero!7417 i!1173)) (= lt!330050 (MissingVacant!7417 i!1173))))))

(assert (=> b!743022 (= lt!330050 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!743023 () Bool)

(assert (=> b!743023 (= e!415318 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19861 a!3186) j!159) a!3186 mask!3328) lt!330051))))

(assert (= (and start!65460 res!499784) b!743017))

(assert (= (and b!743017 res!499785) b!743013))

(assert (= (and b!743013 res!499786) b!743012))

(assert (= (and b!743012 res!499788) b!743018))

(assert (= (and b!743018 res!499778) b!743022))

(assert (= (and b!743022 res!499787) b!743020))

(assert (= (and b!743020 res!499792) b!743007))

(assert (= (and b!743007 res!499777) b!743014))

(assert (= (and b!743014 res!499782) b!743011))

(assert (= (and b!743011 res!499781) b!743009))

(assert (= (and b!743009 res!499789) b!743008))

(assert (= (and b!743008 c!81998) b!743016))

(assert (= (and b!743008 (not c!81998)) b!743019))

(assert (= (and b!743008 res!499790) b!743015))

(assert (= (and b!743015 res!499780) b!743021))

(assert (= (and b!743021 res!499779) b!743010))

(assert (= (and b!743010 res!499783) b!743023))

(assert (= (and b!743021 (not res!499791)) b!743006))

(declare-fun m!694311 () Bool)

(assert (=> b!743010 m!694311))

(assert (=> b!743010 m!694311))

(declare-fun m!694313 () Bool)

(assert (=> b!743010 m!694313))

(declare-fun m!694315 () Bool)

(assert (=> b!743022 m!694315))

(declare-fun m!694317 () Bool)

(assert (=> b!743009 m!694317))

(declare-fun m!694319 () Bool)

(assert (=> b!743020 m!694319))

(declare-fun m!694321 () Bool)

(assert (=> b!743012 m!694321))

(assert (=> b!743019 m!694311))

(assert (=> b!743019 m!694311))

(declare-fun m!694323 () Bool)

(assert (=> b!743019 m!694323))

(assert (=> b!743023 m!694311))

(assert (=> b!743023 m!694311))

(declare-fun m!694325 () Bool)

(assert (=> b!743023 m!694325))

(assert (=> b!743016 m!694311))

(assert (=> b!743016 m!694311))

(declare-fun m!694327 () Bool)

(assert (=> b!743016 m!694327))

(declare-fun m!694329 () Bool)

(assert (=> b!743021 m!694329))

(declare-fun m!694331 () Bool)

(assert (=> b!743021 m!694331))

(assert (=> b!743013 m!694311))

(assert (=> b!743013 m!694311))

(declare-fun m!694333 () Bool)

(assert (=> b!743013 m!694333))

(declare-fun m!694335 () Bool)

(assert (=> start!65460 m!694335))

(declare-fun m!694337 () Bool)

(assert (=> start!65460 m!694337))

(assert (=> b!743006 m!694311))

(assert (=> b!743006 m!694311))

(assert (=> b!743006 m!694323))

(declare-fun m!694339 () Bool)

(assert (=> b!743018 m!694339))

(declare-fun m!694341 () Bool)

(assert (=> b!743015 m!694341))

(declare-fun m!694343 () Bool)

(assert (=> b!743015 m!694343))

(declare-fun m!694345 () Bool)

(assert (=> b!743015 m!694345))

(declare-fun m!694347 () Bool)

(assert (=> b!743015 m!694347))

(assert (=> b!743015 m!694341))

(declare-fun m!694349 () Bool)

(assert (=> b!743015 m!694349))

(declare-fun m!694351 () Bool)

(assert (=> b!743007 m!694351))

(assert (=> b!743011 m!694311))

(assert (=> b!743011 m!694311))

(declare-fun m!694353 () Bool)

(assert (=> b!743011 m!694353))

(assert (=> b!743011 m!694353))

(assert (=> b!743011 m!694311))

(declare-fun m!694355 () Bool)

(assert (=> b!743011 m!694355))

(check-sat (not b!743016) (not b!743023) (not b!743022) (not b!743006) (not b!743010) (not b!743021) (not b!743007) (not b!743011) (not b!743012) (not b!743013) (not b!743019) (not b!743015) (not start!65460) (not b!743018) (not b!743020))
(check-sat)
