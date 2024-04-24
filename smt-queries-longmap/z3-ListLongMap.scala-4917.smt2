; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67864 () Bool)

(assert start!67864)

(declare-fun b!787094 () Bool)

(declare-fun e!437598 () Bool)

(declare-fun e!437603 () Bool)

(assert (=> b!787094 (= e!437598 (not e!437603))))

(declare-fun res!532774 () Bool)

(assert (=> b!787094 (=> res!532774 e!437603)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8032 0))(
  ( (MissingZero!8032 (index!34496 (_ BitVec 32))) (Found!8032 (index!34497 (_ BitVec 32))) (Intermediate!8032 (undefined!8844 Bool) (index!34498 (_ BitVec 32)) (x!65599 (_ BitVec 32))) (Undefined!8032) (MissingVacant!8032 (index!34499 (_ BitVec 32))) )
))
(declare-fun lt!351014 () SeekEntryResult!8032)

(get-info :version)

(assert (=> b!787094 (= res!532774 (or (not ((_ is Intermediate!8032) lt!351014)) (bvslt x!1131 (x!65599 lt!351014)) (not (= x!1131 (x!65599 lt!351014))) (not (= index!1321 (index!34498 lt!351014)))))))

(declare-fun e!437602 () Bool)

(assert (=> b!787094 e!437602))

(declare-fun res!532775 () Bool)

(assert (=> b!787094 (=> (not res!532775) (not e!437602))))

(declare-fun lt!351011 () SeekEntryResult!8032)

(declare-fun lt!351008 () SeekEntryResult!8032)

(assert (=> b!787094 (= res!532775 (= lt!351011 lt!351008))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!787094 (= lt!351008 (Found!8032 j!159))))

(declare-datatypes ((array!42784 0))(
  ( (array!42785 (arr!20476 (Array (_ BitVec 32) (_ BitVec 64))) (size!20896 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42784)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42784 (_ BitVec 32)) SeekEntryResult!8032)

(assert (=> b!787094 (= lt!351011 (seekEntryOrOpen!0 (select (arr!20476 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42784 (_ BitVec 32)) Bool)

(assert (=> b!787094 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!27193 0))(
  ( (Unit!27194) )
))
(declare-fun lt!351010 () Unit!27193)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42784 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27193)

(assert (=> b!787094 (= lt!351010 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!787095 () Bool)

(declare-fun e!437604 () Unit!27193)

(declare-fun Unit!27195 () Unit!27193)

(assert (=> b!787095 (= e!437604 Unit!27195)))

(assert (=> b!787095 false))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!787096 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42784 (_ BitVec 32)) SeekEntryResult!8032)

(assert (=> b!787096 (= e!437602 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20476 a!3186) j!159) a!3186 mask!3328) lt!351008))))

(declare-fun res!532778 () Bool)

(declare-fun e!437600 () Bool)

(assert (=> start!67864 (=> (not res!532778) (not e!437600))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67864 (= res!532778 (validMask!0 mask!3328))))

(assert (=> start!67864 e!437600))

(assert (=> start!67864 true))

(declare-fun array_inv!16335 (array!42784) Bool)

(assert (=> start!67864 (array_inv!16335 a!3186)))

(declare-fun b!787097 () Bool)

(declare-fun res!532768 () Bool)

(assert (=> b!787097 (=> (not res!532768) (not e!437600))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!787097 (= res!532768 (validKeyInArray!0 (select (arr!20476 a!3186) j!159)))))

(declare-fun e!437599 () Bool)

(declare-fun b!787098 () Bool)

(assert (=> b!787098 (= e!437599 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20476 a!3186) j!159) a!3186 mask!3328) (Found!8032 j!159)))))

(declare-fun b!787099 () Bool)

(declare-fun e!437605 () Bool)

(declare-fun e!437608 () Bool)

(assert (=> b!787099 (= e!437605 e!437608)))

(declare-fun res!532785 () Bool)

(assert (=> b!787099 (=> res!532785 e!437608)))

(declare-fun lt!351012 () (_ BitVec 64))

(declare-fun lt!351013 () (_ BitVec 64))

(assert (=> b!787099 (= res!532785 (= lt!351012 lt!351013))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!787099 (= lt!351012 (select (store (arr!20476 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!787100 () Bool)

(declare-fun e!437606 () Bool)

(declare-fun lt!351016 () SeekEntryResult!8032)

(assert (=> b!787100 (= e!437606 (= lt!351011 lt!351016))))

(declare-fun b!787101 () Bool)

(declare-fun res!532783 () Bool)

(declare-fun e!437601 () Bool)

(assert (=> b!787101 (=> (not res!532783) (not e!437601))))

(declare-datatypes ((List!14385 0))(
  ( (Nil!14382) (Cons!14381 (h!15510 (_ BitVec 64)) (t!20692 List!14385)) )
))
(declare-fun arrayNoDuplicates!0 (array!42784 (_ BitVec 32) List!14385) Bool)

(assert (=> b!787101 (= res!532783 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14382))))

(declare-fun b!787102 () Bool)

(declare-fun res!532784 () Bool)

(declare-fun e!437607 () Bool)

(assert (=> b!787102 (=> (not res!532784) (not e!437607))))

(assert (=> b!787102 (= res!532784 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20476 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!787103 () Bool)

(assert (=> b!787103 (= e!437607 e!437598)))

(declare-fun res!532777 () Bool)

(assert (=> b!787103 (=> (not res!532777) (not e!437598))))

(declare-fun lt!351006 () SeekEntryResult!8032)

(assert (=> b!787103 (= res!532777 (= lt!351006 lt!351014))))

(declare-fun lt!351009 () array!42784)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42784 (_ BitVec 32)) SeekEntryResult!8032)

(assert (=> b!787103 (= lt!351014 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351013 lt!351009 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!787103 (= lt!351006 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351013 mask!3328) lt!351013 lt!351009 mask!3328))))

(assert (=> b!787103 (= lt!351013 (select (store (arr!20476 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!787103 (= lt!351009 (array!42785 (store (arr!20476 a!3186) i!1173 k0!2102) (size!20896 a!3186)))))

(declare-fun b!787104 () Bool)

(declare-fun Unit!27196 () Unit!27193)

(assert (=> b!787104 (= e!437604 Unit!27196)))

(declare-fun b!787105 () Bool)

(assert (=> b!787105 (= e!437603 e!437605)))

(declare-fun res!532776 () Bool)

(assert (=> b!787105 (=> res!532776 e!437605)))

(assert (=> b!787105 (= res!532776 (not (= lt!351016 lt!351008)))))

(assert (=> b!787105 (= lt!351016 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20476 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!787106 () Bool)

(assert (=> b!787106 (= e!437600 e!437601)))

(declare-fun res!532780 () Bool)

(assert (=> b!787106 (=> (not res!532780) (not e!437601))))

(declare-fun lt!351007 () SeekEntryResult!8032)

(assert (=> b!787106 (= res!532780 (or (= lt!351007 (MissingZero!8032 i!1173)) (= lt!351007 (MissingVacant!8032 i!1173))))))

(assert (=> b!787106 (= lt!351007 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!787107 () Bool)

(declare-fun res!532779 () Bool)

(assert (=> b!787107 (=> (not res!532779) (not e!437600))))

(assert (=> b!787107 (= res!532779 (and (= (size!20896 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20896 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20896 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!787108 () Bool)

(declare-fun res!532782 () Bool)

(assert (=> b!787108 (=> (not res!532782) (not e!437606))))

(assert (=> b!787108 (= res!532782 (= (seekEntryOrOpen!0 lt!351013 lt!351009 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351013 lt!351009 mask!3328)))))

(declare-fun b!787109 () Bool)

(declare-fun res!532772 () Bool)

(assert (=> b!787109 (=> (not res!532772) (not e!437600))))

(assert (=> b!787109 (= res!532772 (validKeyInArray!0 k0!2102))))

(declare-fun b!787110 () Bool)

(assert (=> b!787110 (= e!437601 e!437607)))

(declare-fun res!532781 () Bool)

(assert (=> b!787110 (=> (not res!532781) (not e!437607))))

(declare-fun lt!351015 () SeekEntryResult!8032)

(assert (=> b!787110 (= res!532781 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20476 a!3186) j!159) mask!3328) (select (arr!20476 a!3186) j!159) a!3186 mask!3328) lt!351015))))

(assert (=> b!787110 (= lt!351015 (Intermediate!8032 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!787111 () Bool)

(assert (=> b!787111 (= e!437599 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20476 a!3186) j!159) a!3186 mask!3328) lt!351015))))

(declare-fun b!787112 () Bool)

(declare-fun res!532773 () Bool)

(assert (=> b!787112 (=> (not res!532773) (not e!437601))))

(assert (=> b!787112 (= res!532773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!787113 () Bool)

(declare-fun res!532767 () Bool)

(assert (=> b!787113 (=> (not res!532767) (not e!437600))))

(declare-fun arrayContainsKey!0 (array!42784 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!787113 (= res!532767 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!787114 () Bool)

(declare-fun res!532770 () Bool)

(assert (=> b!787114 (=> (not res!532770) (not e!437601))))

(assert (=> b!787114 (= res!532770 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20896 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20896 a!3186))))))

(declare-fun b!787115 () Bool)

(assert (=> b!787115 (= e!437608 true)))

(assert (=> b!787115 e!437606))

(declare-fun res!532769 () Bool)

(assert (=> b!787115 (=> (not res!532769) (not e!437606))))

(assert (=> b!787115 (= res!532769 (= lt!351012 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351005 () Unit!27193)

(assert (=> b!787115 (= lt!351005 e!437604)))

(declare-fun c!87574 () Bool)

(assert (=> b!787115 (= c!87574 (= lt!351012 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!787116 () Bool)

(declare-fun res!532771 () Bool)

(assert (=> b!787116 (=> (not res!532771) (not e!437607))))

(assert (=> b!787116 (= res!532771 e!437599)))

(declare-fun c!87575 () Bool)

(assert (=> b!787116 (= c!87575 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!67864 res!532778) b!787107))

(assert (= (and b!787107 res!532779) b!787097))

(assert (= (and b!787097 res!532768) b!787109))

(assert (= (and b!787109 res!532772) b!787113))

(assert (= (and b!787113 res!532767) b!787106))

(assert (= (and b!787106 res!532780) b!787112))

(assert (= (and b!787112 res!532773) b!787101))

(assert (= (and b!787101 res!532783) b!787114))

(assert (= (and b!787114 res!532770) b!787110))

(assert (= (and b!787110 res!532781) b!787102))

(assert (= (and b!787102 res!532784) b!787116))

(assert (= (and b!787116 c!87575) b!787111))

(assert (= (and b!787116 (not c!87575)) b!787098))

(assert (= (and b!787116 res!532771) b!787103))

(assert (= (and b!787103 res!532777) b!787094))

(assert (= (and b!787094 res!532775) b!787096))

(assert (= (and b!787094 (not res!532774)) b!787105))

(assert (= (and b!787105 (not res!532776)) b!787099))

(assert (= (and b!787099 (not res!532785)) b!787115))

(assert (= (and b!787115 c!87574) b!787095))

(assert (= (and b!787115 (not c!87574)) b!787104))

(assert (= (and b!787115 res!532769) b!787108))

(assert (= (and b!787108 res!532782) b!787100))

(declare-fun m!729335 () Bool)

(assert (=> start!67864 m!729335))

(declare-fun m!729337 () Bool)

(assert (=> start!67864 m!729337))

(declare-fun m!729339 () Bool)

(assert (=> b!787113 m!729339))

(declare-fun m!729341 () Bool)

(assert (=> b!787105 m!729341))

(assert (=> b!787105 m!729341))

(declare-fun m!729343 () Bool)

(assert (=> b!787105 m!729343))

(declare-fun m!729345 () Bool)

(assert (=> b!787102 m!729345))

(assert (=> b!787098 m!729341))

(assert (=> b!787098 m!729341))

(assert (=> b!787098 m!729343))

(declare-fun m!729347 () Bool)

(assert (=> b!787099 m!729347))

(declare-fun m!729349 () Bool)

(assert (=> b!787099 m!729349))

(assert (=> b!787111 m!729341))

(assert (=> b!787111 m!729341))

(declare-fun m!729351 () Bool)

(assert (=> b!787111 m!729351))

(declare-fun m!729353 () Bool)

(assert (=> b!787103 m!729353))

(assert (=> b!787103 m!729347))

(declare-fun m!729355 () Bool)

(assert (=> b!787103 m!729355))

(declare-fun m!729357 () Bool)

(assert (=> b!787103 m!729357))

(assert (=> b!787103 m!729353))

(declare-fun m!729359 () Bool)

(assert (=> b!787103 m!729359))

(assert (=> b!787094 m!729341))

(assert (=> b!787094 m!729341))

(declare-fun m!729361 () Bool)

(assert (=> b!787094 m!729361))

(declare-fun m!729363 () Bool)

(assert (=> b!787094 m!729363))

(declare-fun m!729365 () Bool)

(assert (=> b!787094 m!729365))

(declare-fun m!729367 () Bool)

(assert (=> b!787108 m!729367))

(declare-fun m!729369 () Bool)

(assert (=> b!787108 m!729369))

(declare-fun m!729371 () Bool)

(assert (=> b!787106 m!729371))

(assert (=> b!787096 m!729341))

(assert (=> b!787096 m!729341))

(declare-fun m!729373 () Bool)

(assert (=> b!787096 m!729373))

(declare-fun m!729375 () Bool)

(assert (=> b!787109 m!729375))

(assert (=> b!787110 m!729341))

(assert (=> b!787110 m!729341))

(declare-fun m!729377 () Bool)

(assert (=> b!787110 m!729377))

(assert (=> b!787110 m!729377))

(assert (=> b!787110 m!729341))

(declare-fun m!729379 () Bool)

(assert (=> b!787110 m!729379))

(declare-fun m!729381 () Bool)

(assert (=> b!787112 m!729381))

(assert (=> b!787097 m!729341))

(assert (=> b!787097 m!729341))

(declare-fun m!729383 () Bool)

(assert (=> b!787097 m!729383))

(declare-fun m!729385 () Bool)

(assert (=> b!787101 m!729385))

(check-sat (not b!787109) (not b!787097) (not b!787098) (not b!787094) (not b!787112) (not b!787101) (not start!67864) (not b!787108) (not b!787096) (not b!787103) (not b!787113) (not b!787111) (not b!787105) (not b!787106) (not b!787110))
(check-sat)
