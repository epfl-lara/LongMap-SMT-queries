; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64350 () Bool)

(assert start!64350)

(declare-fun b!723383 () Bool)

(declare-fun e!405282 () Bool)

(assert (=> b!723383 (= e!405282 (not true))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((array!40931 0))(
  ( (array!40932 (arr!19588 (Array (_ BitVec 32) (_ BitVec 64))) (size!20009 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40931)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40931 (_ BitVec 32)) Bool)

(assert (=> b!723383 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!24694 0))(
  ( (Unit!24695) )
))
(declare-fun lt!320653 () Unit!24694)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40931 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24694)

(assert (=> b!723383 (= lt!320653 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!723384 () Bool)

(declare-fun res!484966 () Bool)

(declare-fun e!405283 () Bool)

(assert (=> b!723384 (=> (not res!484966) (not e!405283))))

(assert (=> b!723384 (= res!484966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!723385 () Bool)

(declare-fun res!484971 () Bool)

(declare-fun e!405281 () Bool)

(assert (=> b!723385 (=> (not res!484971) (not e!405281))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!723385 (= res!484971 (and (= (size!20009 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20009 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20009 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!723386 () Bool)

(declare-fun e!405284 () Bool)

(assert (=> b!723386 (= e!405284 e!405282)))

(declare-fun res!484972 () Bool)

(assert (=> b!723386 (=> (not res!484972) (not e!405282))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!320654 () (_ BitVec 64))

(declare-fun lt!320652 () array!40931)

(declare-datatypes ((SeekEntryResult!7188 0))(
  ( (MissingZero!7188 (index!31120 (_ BitVec 32))) (Found!7188 (index!31121 (_ BitVec 32))) (Intermediate!7188 (undefined!8000 Bool) (index!31122 (_ BitVec 32)) (x!62117 (_ BitVec 32))) (Undefined!7188) (MissingVacant!7188 (index!31123 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40931 (_ BitVec 32)) SeekEntryResult!7188)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723386 (= res!484972 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320654 mask!3328) lt!320654 lt!320652 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320654 lt!320652 mask!3328)))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!723386 (= lt!320654 (select (store (arr!19588 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!723386 (= lt!320652 (array!40932 (store (arr!19588 a!3186) i!1173 k0!2102) (size!20009 a!3186)))))

(declare-fun e!405280 () Bool)

(declare-fun lt!320651 () SeekEntryResult!7188)

(declare-fun b!723387 () Bool)

(assert (=> b!723387 (= e!405280 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19588 a!3186) j!159) a!3186 mask!3328) lt!320651))))

(declare-fun b!723388 () Bool)

(declare-fun res!484963 () Bool)

(assert (=> b!723388 (=> (not res!484963) (not e!405284))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!723388 (= res!484963 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19588 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!723389 () Bool)

(declare-fun res!484964 () Bool)

(assert (=> b!723389 (=> (not res!484964) (not e!405281))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723389 (= res!484964 (validKeyInArray!0 k0!2102))))

(declare-fun b!723390 () Bool)

(declare-fun res!484969 () Bool)

(assert (=> b!723390 (=> (not res!484969) (not e!405281))))

(declare-fun arrayContainsKey!0 (array!40931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723390 (= res!484969 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!723382 () Bool)

(declare-fun res!484973 () Bool)

(assert (=> b!723382 (=> (not res!484973) (not e!405283))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723382 (= res!484973 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20009 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20009 a!3186))))))

(declare-fun res!484962 () Bool)

(assert (=> start!64350 (=> (not res!484962) (not e!405281))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64350 (= res!484962 (validMask!0 mask!3328))))

(assert (=> start!64350 e!405281))

(assert (=> start!64350 true))

(declare-fun array_inv!15384 (array!40931) Bool)

(assert (=> start!64350 (array_inv!15384 a!3186)))

(declare-fun b!723391 () Bool)

(assert (=> b!723391 (= e!405283 e!405284)))

(declare-fun res!484970 () Bool)

(assert (=> b!723391 (=> (not res!484970) (not e!405284))))

(assert (=> b!723391 (= res!484970 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19588 a!3186) j!159) mask!3328) (select (arr!19588 a!3186) j!159) a!3186 mask!3328) lt!320651))))

(assert (=> b!723391 (= lt!320651 (Intermediate!7188 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!723392 () Bool)

(declare-fun res!484961 () Bool)

(assert (=> b!723392 (=> (not res!484961) (not e!405281))))

(assert (=> b!723392 (= res!484961 (validKeyInArray!0 (select (arr!19588 a!3186) j!159)))))

(declare-fun b!723393 () Bool)

(declare-fun res!484968 () Bool)

(assert (=> b!723393 (=> (not res!484968) (not e!405284))))

(assert (=> b!723393 (= res!484968 e!405280)))

(declare-fun c!79582 () Bool)

(assert (=> b!723393 (= c!79582 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!723394 () Bool)

(assert (=> b!723394 (= e!405281 e!405283)))

(declare-fun res!484967 () Bool)

(assert (=> b!723394 (=> (not res!484967) (not e!405283))))

(declare-fun lt!320650 () SeekEntryResult!7188)

(assert (=> b!723394 (= res!484967 (or (= lt!320650 (MissingZero!7188 i!1173)) (= lt!320650 (MissingVacant!7188 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40931 (_ BitVec 32)) SeekEntryResult!7188)

(assert (=> b!723394 (= lt!320650 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!723395 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40931 (_ BitVec 32)) SeekEntryResult!7188)

(assert (=> b!723395 (= e!405280 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19588 a!3186) j!159) a!3186 mask!3328) (Found!7188 j!159)))))

(declare-fun b!723396 () Bool)

(declare-fun res!484965 () Bool)

(assert (=> b!723396 (=> (not res!484965) (not e!405283))))

(declare-datatypes ((List!13590 0))(
  ( (Nil!13587) (Cons!13586 (h!14640 (_ BitVec 64)) (t!19905 List!13590)) )
))
(declare-fun arrayNoDuplicates!0 (array!40931 (_ BitVec 32) List!13590) Bool)

(assert (=> b!723396 (= res!484965 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13587))))

(assert (= (and start!64350 res!484962) b!723385))

(assert (= (and b!723385 res!484971) b!723392))

(assert (= (and b!723392 res!484961) b!723389))

(assert (= (and b!723389 res!484964) b!723390))

(assert (= (and b!723390 res!484969) b!723394))

(assert (= (and b!723394 res!484967) b!723384))

(assert (= (and b!723384 res!484966) b!723396))

(assert (= (and b!723396 res!484965) b!723382))

(assert (= (and b!723382 res!484973) b!723391))

(assert (= (and b!723391 res!484970) b!723388))

(assert (= (and b!723388 res!484963) b!723393))

(assert (= (and b!723393 c!79582) b!723387))

(assert (= (and b!723393 (not c!79582)) b!723395))

(assert (= (and b!723393 res!484968) b!723386))

(assert (= (and b!723386 res!484972) b!723383))

(declare-fun m!677827 () Bool)

(assert (=> start!64350 m!677827))

(declare-fun m!677829 () Bool)

(assert (=> start!64350 m!677829))

(declare-fun m!677831 () Bool)

(assert (=> b!723384 m!677831))

(declare-fun m!677833 () Bool)

(assert (=> b!723391 m!677833))

(assert (=> b!723391 m!677833))

(declare-fun m!677835 () Bool)

(assert (=> b!723391 m!677835))

(assert (=> b!723391 m!677835))

(assert (=> b!723391 m!677833))

(declare-fun m!677837 () Bool)

(assert (=> b!723391 m!677837))

(declare-fun m!677839 () Bool)

(assert (=> b!723388 m!677839))

(declare-fun m!677841 () Bool)

(assert (=> b!723383 m!677841))

(declare-fun m!677843 () Bool)

(assert (=> b!723383 m!677843))

(declare-fun m!677845 () Bool)

(assert (=> b!723390 m!677845))

(declare-fun m!677847 () Bool)

(assert (=> b!723386 m!677847))

(declare-fun m!677849 () Bool)

(assert (=> b!723386 m!677849))

(declare-fun m!677851 () Bool)

(assert (=> b!723386 m!677851))

(declare-fun m!677853 () Bool)

(assert (=> b!723386 m!677853))

(assert (=> b!723386 m!677849))

(declare-fun m!677855 () Bool)

(assert (=> b!723386 m!677855))

(assert (=> b!723392 m!677833))

(assert (=> b!723392 m!677833))

(declare-fun m!677857 () Bool)

(assert (=> b!723392 m!677857))

(declare-fun m!677859 () Bool)

(assert (=> b!723394 m!677859))

(declare-fun m!677861 () Bool)

(assert (=> b!723389 m!677861))

(assert (=> b!723395 m!677833))

(assert (=> b!723395 m!677833))

(declare-fun m!677863 () Bool)

(assert (=> b!723395 m!677863))

(assert (=> b!723387 m!677833))

(assert (=> b!723387 m!677833))

(declare-fun m!677865 () Bool)

(assert (=> b!723387 m!677865))

(declare-fun m!677867 () Bool)

(assert (=> b!723396 m!677867))

(check-sat (not b!723383) (not b!723391) (not b!723395) (not b!723384) (not b!723396) (not b!723386) (not b!723390) (not b!723394) (not b!723387) (not start!64350) (not b!723389) (not b!723392))
(check-sat)
