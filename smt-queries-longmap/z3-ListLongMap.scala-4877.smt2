; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67294 () Bool)

(assert start!67294)

(declare-fun b!777403 () Bool)

(declare-fun res!525807 () Bool)

(declare-fun e!432648 () Bool)

(assert (=> b!777403 (=> (not res!525807) (not e!432648))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!777403 (= res!525807 (validKeyInArray!0 k0!2102))))

(declare-fun b!777404 () Bool)

(declare-fun res!525795 () Bool)

(declare-fun e!432645 () Bool)

(assert (=> b!777404 (=> (not res!525795) (not e!432645))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42529 0))(
  ( (array!42530 (arr!20356 (Array (_ BitVec 32) (_ BitVec 64))) (size!20776 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42529)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!777404 (= res!525795 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20776 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20776 a!3186))))))

(declare-fun b!777405 () Bool)

(declare-fun e!432643 () Bool)

(assert (=> b!777405 (= e!432645 e!432643)))

(declare-fun res!525797 () Bool)

(assert (=> b!777405 (=> (not res!525797) (not e!432643))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7912 0))(
  ( (MissingZero!7912 (index!34016 (_ BitVec 32))) (Found!7912 (index!34017 (_ BitVec 32))) (Intermediate!7912 (undefined!8724 Bool) (index!34018 (_ BitVec 32)) (x!65114 (_ BitVec 32))) (Undefined!7912) (MissingVacant!7912 (index!34019 (_ BitVec 32))) )
))
(declare-fun lt!346359 () SeekEntryResult!7912)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42529 (_ BitVec 32)) SeekEntryResult!7912)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!777405 (= res!525797 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20356 a!3186) j!159) mask!3328) (select (arr!20356 a!3186) j!159) a!3186 mask!3328) lt!346359))))

(assert (=> b!777405 (= lt!346359 (Intermediate!7912 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!777406 () Bool)

(declare-fun res!525796 () Bool)

(assert (=> b!777406 (=> (not res!525796) (not e!432648))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!777406 (= res!525796 (and (= (size!20776 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20776 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20776 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!777407 () Bool)

(declare-fun e!432647 () Bool)

(declare-fun e!432646 () Bool)

(assert (=> b!777407 (= e!432647 (not e!432646))))

(declare-fun res!525802 () Bool)

(assert (=> b!777407 (=> res!525802 e!432646)))

(declare-fun lt!346360 () SeekEntryResult!7912)

(get-info :version)

(assert (=> b!777407 (= res!525802 (or (not ((_ is Intermediate!7912) lt!346360)) (bvslt x!1131 (x!65114 lt!346360)) (not (= x!1131 (x!65114 lt!346360))) (not (= index!1321 (index!34018 lt!346360)))))))

(declare-fun e!432649 () Bool)

(assert (=> b!777407 e!432649))

(declare-fun res!525810 () Bool)

(assert (=> b!777407 (=> (not res!525810) (not e!432649))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42529 (_ BitVec 32)) Bool)

(assert (=> b!777407 (= res!525810 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26797 0))(
  ( (Unit!26798) )
))
(declare-fun lt!346355 () Unit!26797)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42529 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26797)

(assert (=> b!777407 (= lt!346355 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!777408 () Bool)

(declare-fun e!432642 () Bool)

(assert (=> b!777408 (= e!432642 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20356 a!3186) j!159) a!3186 mask!3328) lt!346359))))

(declare-fun res!525798 () Bool)

(assert (=> start!67294 (=> (not res!525798) (not e!432648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67294 (= res!525798 (validMask!0 mask!3328))))

(assert (=> start!67294 e!432648))

(assert (=> start!67294 true))

(declare-fun array_inv!16215 (array!42529) Bool)

(assert (=> start!67294 (array_inv!16215 a!3186)))

(declare-fun b!777409 () Bool)

(declare-fun e!432644 () Bool)

(assert (=> b!777409 (= e!432649 e!432644)))

(declare-fun res!525809 () Bool)

(assert (=> b!777409 (=> (not res!525809) (not e!432644))))

(declare-fun lt!346354 () SeekEntryResult!7912)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42529 (_ BitVec 32)) SeekEntryResult!7912)

(assert (=> b!777409 (= res!525809 (= (seekEntryOrOpen!0 (select (arr!20356 a!3186) j!159) a!3186 mask!3328) lt!346354))))

(assert (=> b!777409 (= lt!346354 (Found!7912 j!159))))

(declare-fun b!777410 () Bool)

(assert (=> b!777410 (= e!432646 true)))

(declare-fun lt!346353 () SeekEntryResult!7912)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42529 (_ BitVec 32)) SeekEntryResult!7912)

(assert (=> b!777410 (= lt!346353 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20356 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!777411 () Bool)

(assert (=> b!777411 (= e!432643 e!432647)))

(declare-fun res!525799 () Bool)

(assert (=> b!777411 (=> (not res!525799) (not e!432647))))

(declare-fun lt!346356 () SeekEntryResult!7912)

(assert (=> b!777411 (= res!525799 (= lt!346356 lt!346360))))

(declare-fun lt!346352 () (_ BitVec 64))

(declare-fun lt!346358 () array!42529)

(assert (=> b!777411 (= lt!346360 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346352 lt!346358 mask!3328))))

(assert (=> b!777411 (= lt!346356 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346352 mask!3328) lt!346352 lt!346358 mask!3328))))

(assert (=> b!777411 (= lt!346352 (select (store (arr!20356 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!777411 (= lt!346358 (array!42530 (store (arr!20356 a!3186) i!1173 k0!2102) (size!20776 a!3186)))))

(declare-fun b!777412 () Bool)

(declare-fun res!525806 () Bool)

(assert (=> b!777412 (=> (not res!525806) (not e!432648))))

(declare-fun arrayContainsKey!0 (array!42529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!777412 (= res!525806 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!777413 () Bool)

(declare-fun res!525804 () Bool)

(assert (=> b!777413 (=> (not res!525804) (not e!432645))))

(assert (=> b!777413 (= res!525804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!777414 () Bool)

(declare-fun res!525800 () Bool)

(assert (=> b!777414 (=> (not res!525800) (not e!432648))))

(assert (=> b!777414 (= res!525800 (validKeyInArray!0 (select (arr!20356 a!3186) j!159)))))

(declare-fun b!777415 () Bool)

(declare-fun res!525808 () Bool)

(assert (=> b!777415 (=> (not res!525808) (not e!432643))))

(assert (=> b!777415 (= res!525808 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20356 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!777416 () Bool)

(declare-fun res!525801 () Bool)

(assert (=> b!777416 (=> (not res!525801) (not e!432645))))

(declare-datatypes ((List!14265 0))(
  ( (Nil!14262) (Cons!14261 (h!15375 (_ BitVec 64)) (t!20572 List!14265)) )
))
(declare-fun arrayNoDuplicates!0 (array!42529 (_ BitVec 32) List!14265) Bool)

(assert (=> b!777416 (= res!525801 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14262))))

(declare-fun b!777417 () Bool)

(assert (=> b!777417 (= e!432642 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20356 a!3186) j!159) a!3186 mask!3328) (Found!7912 j!159)))))

(declare-fun b!777418 () Bool)

(assert (=> b!777418 (= e!432648 e!432645)))

(declare-fun res!525803 () Bool)

(assert (=> b!777418 (=> (not res!525803) (not e!432645))))

(declare-fun lt!346357 () SeekEntryResult!7912)

(assert (=> b!777418 (= res!525803 (or (= lt!346357 (MissingZero!7912 i!1173)) (= lt!346357 (MissingVacant!7912 i!1173))))))

(assert (=> b!777418 (= lt!346357 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!777419 () Bool)

(assert (=> b!777419 (= e!432644 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20356 a!3186) j!159) a!3186 mask!3328) lt!346354))))

(declare-fun b!777420 () Bool)

(declare-fun res!525805 () Bool)

(assert (=> b!777420 (=> (not res!525805) (not e!432643))))

(assert (=> b!777420 (= res!525805 e!432642)))

(declare-fun c!86207 () Bool)

(assert (=> b!777420 (= c!86207 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!67294 res!525798) b!777406))

(assert (= (and b!777406 res!525796) b!777414))

(assert (= (and b!777414 res!525800) b!777403))

(assert (= (and b!777403 res!525807) b!777412))

(assert (= (and b!777412 res!525806) b!777418))

(assert (= (and b!777418 res!525803) b!777413))

(assert (= (and b!777413 res!525804) b!777416))

(assert (= (and b!777416 res!525801) b!777404))

(assert (= (and b!777404 res!525795) b!777405))

(assert (= (and b!777405 res!525797) b!777415))

(assert (= (and b!777415 res!525808) b!777420))

(assert (= (and b!777420 c!86207) b!777408))

(assert (= (and b!777420 (not c!86207)) b!777417))

(assert (= (and b!777420 res!525805) b!777411))

(assert (= (and b!777411 res!525799) b!777407))

(assert (= (and b!777407 res!525810) b!777409))

(assert (= (and b!777409 res!525809) b!777419))

(assert (= (and b!777407 (not res!525802)) b!777410))

(declare-fun m!721853 () Bool)

(assert (=> b!777409 m!721853))

(assert (=> b!777409 m!721853))

(declare-fun m!721855 () Bool)

(assert (=> b!777409 m!721855))

(declare-fun m!721857 () Bool)

(assert (=> b!777418 m!721857))

(declare-fun m!721859 () Bool)

(assert (=> b!777411 m!721859))

(declare-fun m!721861 () Bool)

(assert (=> b!777411 m!721861))

(declare-fun m!721863 () Bool)

(assert (=> b!777411 m!721863))

(assert (=> b!777411 m!721859))

(declare-fun m!721865 () Bool)

(assert (=> b!777411 m!721865))

(declare-fun m!721867 () Bool)

(assert (=> b!777411 m!721867))

(assert (=> b!777405 m!721853))

(assert (=> b!777405 m!721853))

(declare-fun m!721869 () Bool)

(assert (=> b!777405 m!721869))

(assert (=> b!777405 m!721869))

(assert (=> b!777405 m!721853))

(declare-fun m!721871 () Bool)

(assert (=> b!777405 m!721871))

(declare-fun m!721873 () Bool)

(assert (=> b!777412 m!721873))

(assert (=> b!777410 m!721853))

(assert (=> b!777410 m!721853))

(declare-fun m!721875 () Bool)

(assert (=> b!777410 m!721875))

(assert (=> b!777417 m!721853))

(assert (=> b!777417 m!721853))

(assert (=> b!777417 m!721875))

(declare-fun m!721877 () Bool)

(assert (=> start!67294 m!721877))

(declare-fun m!721879 () Bool)

(assert (=> start!67294 m!721879))

(declare-fun m!721881 () Bool)

(assert (=> b!777415 m!721881))

(assert (=> b!777414 m!721853))

(assert (=> b!777414 m!721853))

(declare-fun m!721883 () Bool)

(assert (=> b!777414 m!721883))

(declare-fun m!721885 () Bool)

(assert (=> b!777416 m!721885))

(assert (=> b!777419 m!721853))

(assert (=> b!777419 m!721853))

(declare-fun m!721887 () Bool)

(assert (=> b!777419 m!721887))

(declare-fun m!721889 () Bool)

(assert (=> b!777413 m!721889))

(declare-fun m!721891 () Bool)

(assert (=> b!777407 m!721891))

(declare-fun m!721893 () Bool)

(assert (=> b!777407 m!721893))

(assert (=> b!777408 m!721853))

(assert (=> b!777408 m!721853))

(declare-fun m!721895 () Bool)

(assert (=> b!777408 m!721895))

(declare-fun m!721897 () Bool)

(assert (=> b!777403 m!721897))

(check-sat (not start!67294) (not b!777414) (not b!777412) (not b!777418) (not b!777407) (not b!777403) (not b!777405) (not b!777419) (not b!777409) (not b!777417) (not b!777413) (not b!777411) (not b!777416) (not b!777408) (not b!777410))
(check-sat)
