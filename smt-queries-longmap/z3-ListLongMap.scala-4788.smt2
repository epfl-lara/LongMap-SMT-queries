; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65916 () Bool)

(assert start!65916)

(declare-fun b!757344 () Bool)

(declare-fun e!422356 () Bool)

(declare-fun e!422361 () Bool)

(assert (=> b!757344 (= e!422356 e!422361)))

(declare-fun res!511883 () Bool)

(assert (=> b!757344 (=> (not res!511883) (not e!422361))))

(declare-datatypes ((SeekEntryResult!7645 0))(
  ( (MissingZero!7645 (index!32948 (_ BitVec 32))) (Found!7645 (index!32949 (_ BitVec 32))) (Intermediate!7645 (undefined!8457 Bool) (index!32950 (_ BitVec 32)) (x!64007 (_ BitVec 32))) (Undefined!7645) (MissingVacant!7645 (index!32951 (_ BitVec 32))) )
))
(declare-fun lt!337190 () SeekEntryResult!7645)

(declare-fun lt!337187 () SeekEntryResult!7645)

(assert (=> b!757344 (= res!511883 (= lt!337190 lt!337187))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!41959 0))(
  ( (array!41960 (arr!20089 (Array (_ BitVec 32) (_ BitVec 64))) (size!20509 (_ BitVec 32))) )
))
(declare-fun lt!337192 () array!41959)

(declare-fun lt!337185 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41959 (_ BitVec 32)) SeekEntryResult!7645)

(assert (=> b!757344 (= lt!337187 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337185 lt!337192 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!757344 (= lt!337190 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337185 mask!3328) lt!337185 lt!337192 mask!3328))))

(declare-fun a!3186 () array!41959)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!757344 (= lt!337185 (select (store (arr!20089 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!757344 (= lt!337192 (array!41960 (store (arr!20089 a!3186) i!1173 k0!2102) (size!20509 a!3186)))))

(declare-fun b!757345 () Bool)

(declare-fun res!511894 () Bool)

(declare-fun e!422364 () Bool)

(assert (=> b!757345 (=> (not res!511894) (not e!422364))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!757345 (= res!511894 (validKeyInArray!0 k0!2102))))

(declare-fun e!422360 () Bool)

(declare-fun lt!337189 () SeekEntryResult!7645)

(declare-fun b!757346 () Bool)

(assert (=> b!757346 (= e!422360 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20089 a!3186) j!159) a!3186 mask!3328) lt!337189))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!757347 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41959 (_ BitVec 32)) SeekEntryResult!7645)

(assert (=> b!757347 (= e!422360 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20089 a!3186) j!159) a!3186 mask!3328) (Found!7645 j!159)))))

(declare-fun b!757348 () Bool)

(declare-fun res!511897 () Bool)

(assert (=> b!757348 (=> (not res!511897) (not e!422356))))

(assert (=> b!757348 (= res!511897 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20089 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!511879 () Bool)

(assert (=> start!65916 (=> (not res!511879) (not e!422364))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65916 (= res!511879 (validMask!0 mask!3328))))

(assert (=> start!65916 e!422364))

(assert (=> start!65916 true))

(declare-fun array_inv!15948 (array!41959) Bool)

(assert (=> start!65916 (array_inv!15948 a!3186)))

(declare-fun b!757349 () Bool)

(declare-fun e!422366 () Bool)

(assert (=> b!757349 (= e!422366 true)))

(declare-fun e!422358 () Bool)

(assert (=> b!757349 e!422358))

(declare-fun res!511893 () Bool)

(assert (=> b!757349 (=> (not res!511893) (not e!422358))))

(declare-fun lt!337186 () (_ BitVec 64))

(assert (=> b!757349 (= res!511893 (= lt!337186 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!26137 0))(
  ( (Unit!26138) )
))
(declare-fun lt!337183 () Unit!26137)

(declare-fun e!422362 () Unit!26137)

(assert (=> b!757349 (= lt!337183 e!422362)))

(declare-fun c!83116 () Bool)

(assert (=> b!757349 (= c!83116 (= lt!337186 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!757350 () Bool)

(declare-fun res!511890 () Bool)

(assert (=> b!757350 (=> (not res!511890) (not e!422358))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41959 (_ BitVec 32)) SeekEntryResult!7645)

(assert (=> b!757350 (= res!511890 (= (seekEntryOrOpen!0 lt!337185 lt!337192 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337185 lt!337192 mask!3328)))))

(declare-fun b!757351 () Bool)

(declare-fun lt!337184 () SeekEntryResult!7645)

(declare-fun lt!337188 () SeekEntryResult!7645)

(assert (=> b!757351 (= e!422358 (= lt!337184 lt!337188))))

(declare-fun b!757352 () Bool)

(declare-fun res!511895 () Bool)

(assert (=> b!757352 (=> (not res!511895) (not e!422364))))

(declare-fun arrayContainsKey!0 (array!41959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!757352 (= res!511895 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!757353 () Bool)

(declare-fun e!422363 () Bool)

(assert (=> b!757353 (= e!422363 e!422356)))

(declare-fun res!511896 () Bool)

(assert (=> b!757353 (=> (not res!511896) (not e!422356))))

(assert (=> b!757353 (= res!511896 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20089 a!3186) j!159) mask!3328) (select (arr!20089 a!3186) j!159) a!3186 mask!3328) lt!337189))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!757353 (= lt!337189 (Intermediate!7645 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!757354 () Bool)

(declare-fun e!422367 () Bool)

(assert (=> b!757354 (= e!422361 (not e!422367))))

(declare-fun res!511892 () Bool)

(assert (=> b!757354 (=> res!511892 e!422367)))

(get-info :version)

(assert (=> b!757354 (= res!511892 (or (not ((_ is Intermediate!7645) lt!337187)) (bvslt x!1131 (x!64007 lt!337187)) (not (= x!1131 (x!64007 lt!337187))) (not (= index!1321 (index!32950 lt!337187)))))))

(declare-fun e!422359 () Bool)

(assert (=> b!757354 e!422359))

(declare-fun res!511885 () Bool)

(assert (=> b!757354 (=> (not res!511885) (not e!422359))))

(declare-fun lt!337194 () SeekEntryResult!7645)

(assert (=> b!757354 (= res!511885 (= lt!337184 lt!337194))))

(assert (=> b!757354 (= lt!337194 (Found!7645 j!159))))

(assert (=> b!757354 (= lt!337184 (seekEntryOrOpen!0 (select (arr!20089 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41959 (_ BitVec 32)) Bool)

(assert (=> b!757354 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337193 () Unit!26137)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41959 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26137)

(assert (=> b!757354 (= lt!337193 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!757355 () Bool)

(declare-fun Unit!26139 () Unit!26137)

(assert (=> b!757355 (= e!422362 Unit!26139)))

(assert (=> b!757355 false))

(declare-fun b!757356 () Bool)

(declare-fun e!422365 () Bool)

(assert (=> b!757356 (= e!422365 e!422366)))

(declare-fun res!511888 () Bool)

(assert (=> b!757356 (=> res!511888 e!422366)))

(assert (=> b!757356 (= res!511888 (= lt!337186 lt!337185))))

(assert (=> b!757356 (= lt!337186 (select (store (arr!20089 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!757357 () Bool)

(declare-fun res!511882 () Bool)

(assert (=> b!757357 (=> (not res!511882) (not e!422363))))

(assert (=> b!757357 (= res!511882 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20509 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20509 a!3186))))))

(declare-fun b!757358 () Bool)

(declare-fun Unit!26140 () Unit!26137)

(assert (=> b!757358 (= e!422362 Unit!26140)))

(declare-fun b!757359 () Bool)

(declare-fun res!511881 () Bool)

(assert (=> b!757359 (=> (not res!511881) (not e!422356))))

(assert (=> b!757359 (= res!511881 e!422360)))

(declare-fun c!83117 () Bool)

(assert (=> b!757359 (= c!83117 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!757360 () Bool)

(declare-fun res!511880 () Bool)

(assert (=> b!757360 (=> (not res!511880) (not e!422364))))

(assert (=> b!757360 (= res!511880 (and (= (size!20509 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20509 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20509 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!757361 () Bool)

(declare-fun res!511887 () Bool)

(assert (=> b!757361 (=> (not res!511887) (not e!422364))))

(assert (=> b!757361 (= res!511887 (validKeyInArray!0 (select (arr!20089 a!3186) j!159)))))

(declare-fun b!757362 () Bool)

(declare-fun res!511884 () Bool)

(assert (=> b!757362 (=> (not res!511884) (not e!422363))))

(declare-datatypes ((List!13998 0))(
  ( (Nil!13995) (Cons!13994 (h!15072 (_ BitVec 64)) (t!20305 List!13998)) )
))
(declare-fun arrayNoDuplicates!0 (array!41959 (_ BitVec 32) List!13998) Bool)

(assert (=> b!757362 (= res!511884 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13995))))

(declare-fun b!757363 () Bool)

(assert (=> b!757363 (= e!422364 e!422363)))

(declare-fun res!511889 () Bool)

(assert (=> b!757363 (=> (not res!511889) (not e!422363))))

(declare-fun lt!337191 () SeekEntryResult!7645)

(assert (=> b!757363 (= res!511889 (or (= lt!337191 (MissingZero!7645 i!1173)) (= lt!337191 (MissingVacant!7645 i!1173))))))

(assert (=> b!757363 (= lt!337191 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!757364 () Bool)

(assert (=> b!757364 (= e!422367 e!422365)))

(declare-fun res!511891 () Bool)

(assert (=> b!757364 (=> res!511891 e!422365)))

(assert (=> b!757364 (= res!511891 (not (= lt!337188 lt!337194)))))

(assert (=> b!757364 (= lt!337188 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20089 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!757365 () Bool)

(declare-fun res!511886 () Bool)

(assert (=> b!757365 (=> (not res!511886) (not e!422363))))

(assert (=> b!757365 (= res!511886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!757366 () Bool)

(assert (=> b!757366 (= e!422359 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20089 a!3186) j!159) a!3186 mask!3328) lt!337194))))

(assert (= (and start!65916 res!511879) b!757360))

(assert (= (and b!757360 res!511880) b!757361))

(assert (= (and b!757361 res!511887) b!757345))

(assert (= (and b!757345 res!511894) b!757352))

(assert (= (and b!757352 res!511895) b!757363))

(assert (= (and b!757363 res!511889) b!757365))

(assert (= (and b!757365 res!511886) b!757362))

(assert (= (and b!757362 res!511884) b!757357))

(assert (= (and b!757357 res!511882) b!757353))

(assert (= (and b!757353 res!511896) b!757348))

(assert (= (and b!757348 res!511897) b!757359))

(assert (= (and b!757359 c!83117) b!757346))

(assert (= (and b!757359 (not c!83117)) b!757347))

(assert (= (and b!757359 res!511881) b!757344))

(assert (= (and b!757344 res!511883) b!757354))

(assert (= (and b!757354 res!511885) b!757366))

(assert (= (and b!757354 (not res!511892)) b!757364))

(assert (= (and b!757364 (not res!511891)) b!757356))

(assert (= (and b!757356 (not res!511888)) b!757349))

(assert (= (and b!757349 c!83116) b!757355))

(assert (= (and b!757349 (not c!83116)) b!757358))

(assert (= (and b!757349 res!511893) b!757350))

(assert (= (and b!757350 res!511890) b!757351))

(declare-fun m!705675 () Bool)

(assert (=> b!757363 m!705675))

(declare-fun m!705677 () Bool)

(assert (=> b!757354 m!705677))

(assert (=> b!757354 m!705677))

(declare-fun m!705679 () Bool)

(assert (=> b!757354 m!705679))

(declare-fun m!705681 () Bool)

(assert (=> b!757354 m!705681))

(declare-fun m!705683 () Bool)

(assert (=> b!757354 m!705683))

(assert (=> b!757347 m!705677))

(assert (=> b!757347 m!705677))

(declare-fun m!705685 () Bool)

(assert (=> b!757347 m!705685))

(declare-fun m!705687 () Bool)

(assert (=> b!757356 m!705687))

(declare-fun m!705689 () Bool)

(assert (=> b!757356 m!705689))

(declare-fun m!705691 () Bool)

(assert (=> b!757362 m!705691))

(declare-fun m!705693 () Bool)

(assert (=> b!757350 m!705693))

(declare-fun m!705695 () Bool)

(assert (=> b!757350 m!705695))

(assert (=> b!757353 m!705677))

(assert (=> b!757353 m!705677))

(declare-fun m!705697 () Bool)

(assert (=> b!757353 m!705697))

(assert (=> b!757353 m!705697))

(assert (=> b!757353 m!705677))

(declare-fun m!705699 () Bool)

(assert (=> b!757353 m!705699))

(declare-fun m!705701 () Bool)

(assert (=> b!757345 m!705701))

(declare-fun m!705703 () Bool)

(assert (=> b!757344 m!705703))

(declare-fun m!705705 () Bool)

(assert (=> b!757344 m!705705))

(assert (=> b!757344 m!705687))

(declare-fun m!705707 () Bool)

(assert (=> b!757344 m!705707))

(assert (=> b!757344 m!705705))

(declare-fun m!705709 () Bool)

(assert (=> b!757344 m!705709))

(declare-fun m!705711 () Bool)

(assert (=> b!757365 m!705711))

(declare-fun m!705713 () Bool)

(assert (=> b!757348 m!705713))

(assert (=> b!757346 m!705677))

(assert (=> b!757346 m!705677))

(declare-fun m!705715 () Bool)

(assert (=> b!757346 m!705715))

(assert (=> b!757364 m!705677))

(assert (=> b!757364 m!705677))

(assert (=> b!757364 m!705685))

(assert (=> b!757361 m!705677))

(assert (=> b!757361 m!705677))

(declare-fun m!705717 () Bool)

(assert (=> b!757361 m!705717))

(assert (=> b!757366 m!705677))

(assert (=> b!757366 m!705677))

(declare-fun m!705719 () Bool)

(assert (=> b!757366 m!705719))

(declare-fun m!705721 () Bool)

(assert (=> b!757352 m!705721))

(declare-fun m!705723 () Bool)

(assert (=> start!65916 m!705723))

(declare-fun m!705725 () Bool)

(assert (=> start!65916 m!705725))

(check-sat (not start!65916) (not b!757353) (not b!757347) (not b!757345) (not b!757362) (not b!757364) (not b!757344) (not b!757363) (not b!757350) (not b!757365) (not b!757346) (not b!757352) (not b!757361) (not b!757366) (not b!757354))
(check-sat)
