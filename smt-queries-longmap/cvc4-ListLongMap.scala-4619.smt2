; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64352 () Bool)

(assert start!64352)

(declare-fun res!485011 () Bool)

(declare-fun e!405297 () Bool)

(assert (=> start!64352 (=> (not res!485011) (not e!405297))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64352 (= res!485011 (validMask!0 mask!3328))))

(assert (=> start!64352 e!405297))

(assert (=> start!64352 true))

(declare-datatypes ((array!40933 0))(
  ( (array!40934 (arr!19589 (Array (_ BitVec 32) (_ BitVec 64))) (size!20010 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40933)

(declare-fun array_inv!15385 (array!40933) Bool)

(assert (=> start!64352 (array_inv!15385 a!3186)))

(declare-fun b!723427 () Bool)

(declare-fun res!485009 () Bool)

(assert (=> b!723427 (=> (not res!485009) (not e!405297))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!723427 (= res!485009 (and (= (size!20010 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20010 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20010 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!723428 () Bool)

(declare-fun res!485000 () Bool)

(declare-fun e!405299 () Bool)

(assert (=> b!723428 (=> (not res!485000) (not e!405299))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!723428 (= res!485000 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19589 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!723429 () Bool)

(declare-fun e!405300 () Bool)

(assert (=> b!723429 (= e!405300 e!405299)))

(declare-fun res!485002 () Bool)

(assert (=> b!723429 (=> (not res!485002) (not e!405299))))

(declare-datatypes ((SeekEntryResult!7189 0))(
  ( (MissingZero!7189 (index!31124 (_ BitVec 32))) (Found!7189 (index!31125 (_ BitVec 32))) (Intermediate!7189 (undefined!8001 Bool) (index!31126 (_ BitVec 32)) (x!62118 (_ BitVec 32))) (Undefined!7189) (MissingVacant!7189 (index!31127 (_ BitVec 32))) )
))
(declare-fun lt!320667 () SeekEntryResult!7189)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40933 (_ BitVec 32)) SeekEntryResult!7189)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723429 (= res!485002 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19589 a!3186) j!159) mask!3328) (select (arr!19589 a!3186) j!159) a!3186 mask!3328) lt!320667))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723429 (= lt!320667 (Intermediate!7189 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!723430 () Bool)

(declare-fun e!405301 () Bool)

(assert (=> b!723430 (= e!405301 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40933 (_ BitVec 32)) Bool)

(assert (=> b!723430 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!24696 0))(
  ( (Unit!24697) )
))
(declare-fun lt!320668 () Unit!24696)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40933 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24696)

(assert (=> b!723430 (= lt!320668 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!723431 () Bool)

(declare-fun res!485007 () Bool)

(assert (=> b!723431 (=> (not res!485007) (not e!405297))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40933 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723431 (= res!485007 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!405298 () Bool)

(declare-fun b!723432 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40933 (_ BitVec 32)) SeekEntryResult!7189)

(assert (=> b!723432 (= e!405298 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19589 a!3186) j!159) a!3186 mask!3328) (Found!7189 j!159)))))

(declare-fun b!723433 () Bool)

(declare-fun res!485001 () Bool)

(assert (=> b!723433 (=> (not res!485001) (not e!405297))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723433 (= res!485001 (validKeyInArray!0 (select (arr!19589 a!3186) j!159)))))

(declare-fun b!723434 () Bool)

(declare-fun res!485005 () Bool)

(assert (=> b!723434 (=> (not res!485005) (not e!405297))))

(assert (=> b!723434 (= res!485005 (validKeyInArray!0 k!2102))))

(declare-fun b!723435 () Bool)

(declare-fun res!485008 () Bool)

(assert (=> b!723435 (=> (not res!485008) (not e!405300))))

(assert (=> b!723435 (= res!485008 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20010 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20010 a!3186))))))

(declare-fun b!723436 () Bool)

(declare-fun res!485006 () Bool)

(assert (=> b!723436 (=> (not res!485006) (not e!405300))))

(assert (=> b!723436 (= res!485006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!723437 () Bool)

(assert (=> b!723437 (= e!405297 e!405300)))

(declare-fun res!485003 () Bool)

(assert (=> b!723437 (=> (not res!485003) (not e!405300))))

(declare-fun lt!320665 () SeekEntryResult!7189)

(assert (=> b!723437 (= res!485003 (or (= lt!320665 (MissingZero!7189 i!1173)) (= lt!320665 (MissingVacant!7189 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40933 (_ BitVec 32)) SeekEntryResult!7189)

(assert (=> b!723437 (= lt!320665 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!723438 () Bool)

(declare-fun res!485004 () Bool)

(assert (=> b!723438 (=> (not res!485004) (not e!405300))))

(declare-datatypes ((List!13591 0))(
  ( (Nil!13588) (Cons!13587 (h!14641 (_ BitVec 64)) (t!19906 List!13591)) )
))
(declare-fun arrayNoDuplicates!0 (array!40933 (_ BitVec 32) List!13591) Bool)

(assert (=> b!723438 (= res!485004 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13588))))

(declare-fun b!723439 () Bool)

(assert (=> b!723439 (= e!405299 e!405301)))

(declare-fun res!485010 () Bool)

(assert (=> b!723439 (=> (not res!485010) (not e!405301))))

(declare-fun lt!320669 () (_ BitVec 64))

(declare-fun lt!320666 () array!40933)

(assert (=> b!723439 (= res!485010 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320669 mask!3328) lt!320669 lt!320666 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320669 lt!320666 mask!3328)))))

(assert (=> b!723439 (= lt!320669 (select (store (arr!19589 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!723439 (= lt!320666 (array!40934 (store (arr!19589 a!3186) i!1173 k!2102) (size!20010 a!3186)))))

(declare-fun b!723440 () Bool)

(declare-fun res!485012 () Bool)

(assert (=> b!723440 (=> (not res!485012) (not e!405299))))

(assert (=> b!723440 (= res!485012 e!405298)))

(declare-fun c!79585 () Bool)

(assert (=> b!723440 (= c!79585 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!723441 () Bool)

(assert (=> b!723441 (= e!405298 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19589 a!3186) j!159) a!3186 mask!3328) lt!320667))))

(assert (= (and start!64352 res!485011) b!723427))

(assert (= (and b!723427 res!485009) b!723433))

(assert (= (and b!723433 res!485001) b!723434))

(assert (= (and b!723434 res!485005) b!723431))

(assert (= (and b!723431 res!485007) b!723437))

(assert (= (and b!723437 res!485003) b!723436))

(assert (= (and b!723436 res!485006) b!723438))

(assert (= (and b!723438 res!485004) b!723435))

(assert (= (and b!723435 res!485008) b!723429))

(assert (= (and b!723429 res!485002) b!723428))

(assert (= (and b!723428 res!485000) b!723440))

(assert (= (and b!723440 c!79585) b!723441))

(assert (= (and b!723440 (not c!79585)) b!723432))

(assert (= (and b!723440 res!485012) b!723439))

(assert (= (and b!723439 res!485010) b!723430))

(declare-fun m!677869 () Bool)

(assert (=> start!64352 m!677869))

(declare-fun m!677871 () Bool)

(assert (=> start!64352 m!677871))

(declare-fun m!677873 () Bool)

(assert (=> b!723441 m!677873))

(assert (=> b!723441 m!677873))

(declare-fun m!677875 () Bool)

(assert (=> b!723441 m!677875))

(assert (=> b!723432 m!677873))

(assert (=> b!723432 m!677873))

(declare-fun m!677877 () Bool)

(assert (=> b!723432 m!677877))

(declare-fun m!677879 () Bool)

(assert (=> b!723428 m!677879))

(declare-fun m!677881 () Bool)

(assert (=> b!723430 m!677881))

(declare-fun m!677883 () Bool)

(assert (=> b!723430 m!677883))

(declare-fun m!677885 () Bool)

(assert (=> b!723439 m!677885))

(declare-fun m!677887 () Bool)

(assert (=> b!723439 m!677887))

(assert (=> b!723439 m!677887))

(declare-fun m!677889 () Bool)

(assert (=> b!723439 m!677889))

(declare-fun m!677891 () Bool)

(assert (=> b!723439 m!677891))

(declare-fun m!677893 () Bool)

(assert (=> b!723439 m!677893))

(declare-fun m!677895 () Bool)

(assert (=> b!723436 m!677895))

(assert (=> b!723433 m!677873))

(assert (=> b!723433 m!677873))

(declare-fun m!677897 () Bool)

(assert (=> b!723433 m!677897))

(declare-fun m!677899 () Bool)

(assert (=> b!723437 m!677899))

(declare-fun m!677901 () Bool)

(assert (=> b!723434 m!677901))

(declare-fun m!677903 () Bool)

(assert (=> b!723431 m!677903))

(assert (=> b!723429 m!677873))

(assert (=> b!723429 m!677873))

(declare-fun m!677905 () Bool)

(assert (=> b!723429 m!677905))

(assert (=> b!723429 m!677905))

(assert (=> b!723429 m!677873))

(declare-fun m!677907 () Bool)

(assert (=> b!723429 m!677907))

(declare-fun m!677909 () Bool)

(assert (=> b!723438 m!677909))

(push 1)

