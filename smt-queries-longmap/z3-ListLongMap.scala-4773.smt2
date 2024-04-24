; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65826 () Bool)

(assert start!65826)

(declare-fun b!754239 () Bool)

(declare-fun res!509331 () Bool)

(declare-fun e!420745 () Bool)

(assert (=> b!754239 (=> (not res!509331) (not e!420745))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!754239 (= res!509331 (validKeyInArray!0 k0!2102))))

(declare-fun b!754240 () Bool)

(declare-fun e!420741 () Bool)

(declare-fun e!420747 () Bool)

(assert (=> b!754240 (= e!420741 (not e!420747))))

(declare-fun res!509330 () Bool)

(assert (=> b!754240 (=> res!509330 e!420747)))

(declare-datatypes ((SeekEntryResult!7600 0))(
  ( (MissingZero!7600 (index!32768 (_ BitVec 32))) (Found!7600 (index!32769 (_ BitVec 32))) (Intermediate!7600 (undefined!8412 Bool) (index!32770 (_ BitVec 32)) (x!63842 (_ BitVec 32))) (Undefined!7600) (MissingVacant!7600 (index!32771 (_ BitVec 32))) )
))
(declare-fun lt!335571 () SeekEntryResult!7600)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(get-info :version)

(assert (=> b!754240 (= res!509330 (or (not ((_ is Intermediate!7600) lt!335571)) (bvslt x!1131 (x!63842 lt!335571)) (not (= x!1131 (x!63842 lt!335571))) (not (= index!1321 (index!32770 lt!335571)))))))

(declare-fun e!420743 () Bool)

(assert (=> b!754240 e!420743))

(declare-fun res!509318 () Bool)

(assert (=> b!754240 (=> (not res!509318) (not e!420743))))

(declare-fun lt!335574 () SeekEntryResult!7600)

(declare-fun lt!335569 () SeekEntryResult!7600)

(assert (=> b!754240 (= res!509318 (= lt!335574 lt!335569))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!754240 (= lt!335569 (Found!7600 j!159))))

(declare-datatypes ((array!41869 0))(
  ( (array!41870 (arr!20044 (Array (_ BitVec 32) (_ BitVec 64))) (size!20464 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41869)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41869 (_ BitVec 32)) SeekEntryResult!7600)

(assert (=> b!754240 (= lt!335574 (seekEntryOrOpen!0 (select (arr!20044 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41869 (_ BitVec 32)) Bool)

(assert (=> b!754240 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25957 0))(
  ( (Unit!25958) )
))
(declare-fun lt!335563 () Unit!25957)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41869 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25957)

(assert (=> b!754240 (= lt!335563 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!754241 () Bool)

(declare-fun e!420740 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41869 (_ BitVec 32)) SeekEntryResult!7600)

(assert (=> b!754241 (= e!420740 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20044 a!3186) j!159) a!3186 mask!3328) (Found!7600 j!159)))))

(declare-fun b!754242 () Bool)

(declare-fun res!509329 () Bool)

(declare-fun e!420739 () Bool)

(assert (=> b!754242 (=> (not res!509329) (not e!420739))))

(assert (=> b!754242 (= res!509329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!754243 () Bool)

(declare-fun res!509323 () Bool)

(declare-fun e!420742 () Bool)

(assert (=> b!754243 (=> (not res!509323) (not e!420742))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!754243 (= res!509323 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20044 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!754244 () Bool)

(declare-fun res!509319 () Bool)

(assert (=> b!754244 (=> (not res!509319) (not e!420745))))

(assert (=> b!754244 (= res!509319 (validKeyInArray!0 (select (arr!20044 a!3186) j!159)))))

(declare-fun b!754245 () Bool)

(declare-fun e!420736 () Bool)

(assert (=> b!754245 (= e!420736 true)))

(declare-fun e!420738 () Bool)

(assert (=> b!754245 e!420738))

(declare-fun res!509325 () Bool)

(assert (=> b!754245 (=> (not res!509325) (not e!420738))))

(declare-fun lt!335568 () (_ BitVec 64))

(assert (=> b!754245 (= res!509325 (= lt!335568 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!335564 () Unit!25957)

(declare-fun e!420746 () Unit!25957)

(assert (=> b!754245 (= lt!335564 e!420746)))

(declare-fun c!82847 () Bool)

(assert (=> b!754245 (= c!82847 (= lt!335568 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!754246 () Bool)

(assert (=> b!754246 (= e!420742 e!420741)))

(declare-fun res!509316 () Bool)

(assert (=> b!754246 (=> (not res!509316) (not e!420741))))

(declare-fun lt!335567 () SeekEntryResult!7600)

(assert (=> b!754246 (= res!509316 (= lt!335567 lt!335571))))

(declare-fun lt!335566 () array!41869)

(declare-fun lt!335572 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41869 (_ BitVec 32)) SeekEntryResult!7600)

(assert (=> b!754246 (= lt!335571 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335572 lt!335566 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!754246 (= lt!335567 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335572 mask!3328) lt!335572 lt!335566 mask!3328))))

(assert (=> b!754246 (= lt!335572 (select (store (arr!20044 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!754246 (= lt!335566 (array!41870 (store (arr!20044 a!3186) i!1173 k0!2102) (size!20464 a!3186)))))

(declare-fun b!754247 () Bool)

(declare-fun e!420744 () Bool)

(assert (=> b!754247 (= e!420747 e!420744)))

(declare-fun res!509314 () Bool)

(assert (=> b!754247 (=> res!509314 e!420744)))

(declare-fun lt!335573 () SeekEntryResult!7600)

(assert (=> b!754247 (= res!509314 (not (= lt!335573 lt!335569)))))

(assert (=> b!754247 (= lt!335573 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20044 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!754248 () Bool)

(declare-fun Unit!25959 () Unit!25957)

(assert (=> b!754248 (= e!420746 Unit!25959)))

(assert (=> b!754248 false))

(declare-fun b!754249 () Bool)

(declare-fun res!509321 () Bool)

(assert (=> b!754249 (=> (not res!509321) (not e!420738))))

(assert (=> b!754249 (= res!509321 (= (seekEntryOrOpen!0 lt!335572 lt!335566 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335572 lt!335566 mask!3328)))))

(declare-fun lt!335570 () SeekEntryResult!7600)

(declare-fun b!754250 () Bool)

(assert (=> b!754250 (= e!420740 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20044 a!3186) j!159) a!3186 mask!3328) lt!335570))))

(declare-fun b!754251 () Bool)

(assert (=> b!754251 (= e!420739 e!420742)))

(declare-fun res!509332 () Bool)

(assert (=> b!754251 (=> (not res!509332) (not e!420742))))

(assert (=> b!754251 (= res!509332 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20044 a!3186) j!159) mask!3328) (select (arr!20044 a!3186) j!159) a!3186 mask!3328) lt!335570))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!754251 (= lt!335570 (Intermediate!7600 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!754252 () Bool)

(declare-fun res!509324 () Bool)

(assert (=> b!754252 (=> (not res!509324) (not e!420745))))

(declare-fun arrayContainsKey!0 (array!41869 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!754252 (= res!509324 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!754253 () Bool)

(assert (=> b!754253 (= e!420744 e!420736)))

(declare-fun res!509328 () Bool)

(assert (=> b!754253 (=> res!509328 e!420736)))

(assert (=> b!754253 (= res!509328 (= lt!335568 lt!335572))))

(assert (=> b!754253 (= lt!335568 (select (store (arr!20044 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun res!509320 () Bool)

(assert (=> start!65826 (=> (not res!509320) (not e!420745))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65826 (= res!509320 (validMask!0 mask!3328))))

(assert (=> start!65826 e!420745))

(assert (=> start!65826 true))

(declare-fun array_inv!15903 (array!41869) Bool)

(assert (=> start!65826 (array_inv!15903 a!3186)))

(declare-fun b!754254 () Bool)

(declare-fun res!509315 () Bool)

(assert (=> b!754254 (=> (not res!509315) (not e!420739))))

(assert (=> b!754254 (= res!509315 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20464 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20464 a!3186))))))

(declare-fun b!754255 () Bool)

(assert (=> b!754255 (= e!420743 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20044 a!3186) j!159) a!3186 mask!3328) lt!335569))))

(declare-fun b!754256 () Bool)

(declare-fun Unit!25960 () Unit!25957)

(assert (=> b!754256 (= e!420746 Unit!25960)))

(declare-fun b!754257 () Bool)

(declare-fun res!509327 () Bool)

(assert (=> b!754257 (=> (not res!509327) (not e!420742))))

(assert (=> b!754257 (= res!509327 e!420740)))

(declare-fun c!82846 () Bool)

(assert (=> b!754257 (= c!82846 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!754258 () Bool)

(declare-fun res!509317 () Bool)

(assert (=> b!754258 (=> (not res!509317) (not e!420745))))

(assert (=> b!754258 (= res!509317 (and (= (size!20464 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20464 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20464 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!754259 () Bool)

(declare-fun res!509326 () Bool)

(assert (=> b!754259 (=> (not res!509326) (not e!420739))))

(declare-datatypes ((List!13953 0))(
  ( (Nil!13950) (Cons!13949 (h!15027 (_ BitVec 64)) (t!20260 List!13953)) )
))
(declare-fun arrayNoDuplicates!0 (array!41869 (_ BitVec 32) List!13953) Bool)

(assert (=> b!754259 (= res!509326 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13950))))

(declare-fun b!754260 () Bool)

(assert (=> b!754260 (= e!420745 e!420739)))

(declare-fun res!509322 () Bool)

(assert (=> b!754260 (=> (not res!509322) (not e!420739))))

(declare-fun lt!335565 () SeekEntryResult!7600)

(assert (=> b!754260 (= res!509322 (or (= lt!335565 (MissingZero!7600 i!1173)) (= lt!335565 (MissingVacant!7600 i!1173))))))

(assert (=> b!754260 (= lt!335565 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!754261 () Bool)

(assert (=> b!754261 (= e!420738 (= lt!335574 lt!335573))))

(assert (= (and start!65826 res!509320) b!754258))

(assert (= (and b!754258 res!509317) b!754244))

(assert (= (and b!754244 res!509319) b!754239))

(assert (= (and b!754239 res!509331) b!754252))

(assert (= (and b!754252 res!509324) b!754260))

(assert (= (and b!754260 res!509322) b!754242))

(assert (= (and b!754242 res!509329) b!754259))

(assert (= (and b!754259 res!509326) b!754254))

(assert (= (and b!754254 res!509315) b!754251))

(assert (= (and b!754251 res!509332) b!754243))

(assert (= (and b!754243 res!509323) b!754257))

(assert (= (and b!754257 c!82846) b!754250))

(assert (= (and b!754257 (not c!82846)) b!754241))

(assert (= (and b!754257 res!509327) b!754246))

(assert (= (and b!754246 res!509316) b!754240))

(assert (= (and b!754240 res!509318) b!754255))

(assert (= (and b!754240 (not res!509330)) b!754247))

(assert (= (and b!754247 (not res!509314)) b!754253))

(assert (= (and b!754253 (not res!509328)) b!754245))

(assert (= (and b!754245 c!82847) b!754248))

(assert (= (and b!754245 (not c!82847)) b!754256))

(assert (= (and b!754245 res!509325) b!754249))

(assert (= (and b!754249 res!509321) b!754261))

(declare-fun m!703335 () Bool)

(assert (=> b!754241 m!703335))

(assert (=> b!754241 m!703335))

(declare-fun m!703337 () Bool)

(assert (=> b!754241 m!703337))

(assert (=> b!754251 m!703335))

(assert (=> b!754251 m!703335))

(declare-fun m!703339 () Bool)

(assert (=> b!754251 m!703339))

(assert (=> b!754251 m!703339))

(assert (=> b!754251 m!703335))

(declare-fun m!703341 () Bool)

(assert (=> b!754251 m!703341))

(declare-fun m!703343 () Bool)

(assert (=> b!754246 m!703343))

(declare-fun m!703345 () Bool)

(assert (=> b!754246 m!703345))

(declare-fun m!703347 () Bool)

(assert (=> b!754246 m!703347))

(declare-fun m!703349 () Bool)

(assert (=> b!754246 m!703349))

(declare-fun m!703351 () Bool)

(assert (=> b!754246 m!703351))

(assert (=> b!754246 m!703343))

(declare-fun m!703353 () Bool)

(assert (=> b!754259 m!703353))

(declare-fun m!703355 () Bool)

(assert (=> b!754249 m!703355))

(declare-fun m!703357 () Bool)

(assert (=> b!754249 m!703357))

(declare-fun m!703359 () Bool)

(assert (=> b!754242 m!703359))

(assert (=> b!754240 m!703335))

(assert (=> b!754240 m!703335))

(declare-fun m!703361 () Bool)

(assert (=> b!754240 m!703361))

(declare-fun m!703363 () Bool)

(assert (=> b!754240 m!703363))

(declare-fun m!703365 () Bool)

(assert (=> b!754240 m!703365))

(declare-fun m!703367 () Bool)

(assert (=> start!65826 m!703367))

(declare-fun m!703369 () Bool)

(assert (=> start!65826 m!703369))

(declare-fun m!703371 () Bool)

(assert (=> b!754239 m!703371))

(declare-fun m!703373 () Bool)

(assert (=> b!754260 m!703373))

(assert (=> b!754253 m!703351))

(declare-fun m!703375 () Bool)

(assert (=> b!754253 m!703375))

(declare-fun m!703377 () Bool)

(assert (=> b!754243 m!703377))

(assert (=> b!754255 m!703335))

(assert (=> b!754255 m!703335))

(declare-fun m!703379 () Bool)

(assert (=> b!754255 m!703379))

(declare-fun m!703381 () Bool)

(assert (=> b!754252 m!703381))

(assert (=> b!754247 m!703335))

(assert (=> b!754247 m!703335))

(assert (=> b!754247 m!703337))

(assert (=> b!754244 m!703335))

(assert (=> b!754244 m!703335))

(declare-fun m!703383 () Bool)

(assert (=> b!754244 m!703383))

(assert (=> b!754250 m!703335))

(assert (=> b!754250 m!703335))

(declare-fun m!703385 () Bool)

(assert (=> b!754250 m!703385))

(check-sat (not b!754250) (not b!754242) (not b!754241) (not b!754255) (not b!754240) (not b!754247) (not b!754244) (not b!754251) (not b!754249) (not b!754239) (not b!754246) (not start!65826) (not b!754252) (not b!754260) (not b!754259))
(check-sat)
