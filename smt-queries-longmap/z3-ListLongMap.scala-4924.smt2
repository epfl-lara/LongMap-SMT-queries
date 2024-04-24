; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67906 () Bool)

(assert start!67906)

(declare-fun b!788543 () Bool)

(declare-datatypes ((Unit!27277 0))(
  ( (Unit!27278) )
))
(declare-fun e!438355 () Unit!27277)

(declare-fun Unit!27279 () Unit!27277)

(assert (=> b!788543 (= e!438355 Unit!27279)))

(declare-fun b!788544 () Bool)

(declare-fun res!533966 () Bool)

(declare-fun e!438362 () Bool)

(assert (=> b!788544 (=> (not res!533966) (not e!438362))))

(declare-datatypes ((array!42826 0))(
  ( (array!42827 (arr!20497 (Array (_ BitVec 32) (_ BitVec 64))) (size!20917 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42826)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42826 (_ BitVec 32)) Bool)

(assert (=> b!788544 (= res!533966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!788545 () Bool)

(declare-fun e!438356 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8053 0))(
  ( (MissingZero!8053 (index!34580 (_ BitVec 32))) (Found!8053 (index!34581 (_ BitVec 32))) (Intermediate!8053 (undefined!8865 Bool) (index!34582 (_ BitVec 32)) (x!65676 (_ BitVec 32))) (Undefined!8053) (MissingVacant!8053 (index!34583 (_ BitVec 32))) )
))
(declare-fun lt!351770 () SeekEntryResult!8053)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42826 (_ BitVec 32)) SeekEntryResult!8053)

(assert (=> b!788545 (= e!438356 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20497 a!3186) j!159) a!3186 mask!3328) lt!351770))))

(declare-fun b!788546 () Bool)

(declare-fun res!533976 () Bool)

(declare-fun e!438361 () Bool)

(assert (=> b!788546 (=> (not res!533976) (not e!438361))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!788546 (= res!533976 (and (= (size!20917 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20917 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20917 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!788547 () Bool)

(declare-fun res!533974 () Bool)

(assert (=> b!788547 (=> (not res!533974) (not e!438361))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!788547 (= res!533974 (validKeyInArray!0 (select (arr!20497 a!3186) j!159)))))

(declare-fun b!788548 () Bool)

(declare-fun res!533978 () Bool)

(assert (=> b!788548 (=> (not res!533978) (not e!438361))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!788548 (= res!533978 (validKeyInArray!0 k0!2102))))

(declare-fun b!788549 () Bool)

(declare-fun res!533981 () Bool)

(declare-fun e!438363 () Bool)

(assert (=> b!788549 (=> (not res!533981) (not e!438363))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!351768 () (_ BitVec 64))

(declare-fun lt!351763 () array!42826)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42826 (_ BitVec 32)) SeekEntryResult!8053)

(assert (=> b!788549 (= res!533981 (= (seekEntryOrOpen!0 lt!351768 lt!351763 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351768 lt!351763 mask!3328)))))

(declare-fun b!788550 () Bool)

(declare-fun res!533982 () Bool)

(declare-fun e!438364 () Bool)

(assert (=> b!788550 (=> (not res!533982) (not e!438364))))

(assert (=> b!788550 (= res!533982 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20497 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!788551 () Bool)

(declare-fun e!438354 () Bool)

(assert (=> b!788551 (= e!438354 true)))

(assert (=> b!788551 e!438363))

(declare-fun res!533972 () Bool)

(assert (=> b!788551 (=> (not res!533972) (not e!438363))))

(declare-fun lt!351761 () (_ BitVec 64))

(assert (=> b!788551 (= res!533972 (= lt!351761 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351762 () Unit!27277)

(assert (=> b!788551 (= lt!351762 e!438355)))

(declare-fun c!87701 () Bool)

(assert (=> b!788551 (= c!87701 (= lt!351761 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!788552 () Bool)

(declare-fun lt!351769 () SeekEntryResult!8053)

(declare-fun lt!351771 () SeekEntryResult!8053)

(assert (=> b!788552 (= e!438363 (= lt!351769 lt!351771))))

(declare-fun b!788553 () Bool)

(declare-fun res!533980 () Bool)

(assert (=> b!788553 (=> (not res!533980) (not e!438362))))

(declare-datatypes ((List!14406 0))(
  ( (Nil!14403) (Cons!14402 (h!15531 (_ BitVec 64)) (t!20713 List!14406)) )
))
(declare-fun arrayNoDuplicates!0 (array!42826 (_ BitVec 32) List!14406) Bool)

(assert (=> b!788553 (= res!533980 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14403))))

(declare-fun b!788554 () Bool)

(declare-fun e!438360 () Bool)

(assert (=> b!788554 (= e!438360 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20497 a!3186) j!159) a!3186 mask!3328) (Found!8053 j!159)))))

(declare-fun b!788555 () Bool)

(declare-fun res!533967 () Bool)

(assert (=> b!788555 (=> (not res!533967) (not e!438361))))

(declare-fun arrayContainsKey!0 (array!42826 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!788555 (= res!533967 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!788556 () Bool)

(assert (=> b!788556 (= e!438362 e!438364)))

(declare-fun res!533975 () Bool)

(assert (=> b!788556 (=> (not res!533975) (not e!438364))))

(declare-fun lt!351766 () SeekEntryResult!8053)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42826 (_ BitVec 32)) SeekEntryResult!8053)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!788556 (= res!533975 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20497 a!3186) j!159) mask!3328) (select (arr!20497 a!3186) j!159) a!3186 mask!3328) lt!351766))))

(assert (=> b!788556 (= lt!351766 (Intermediate!8053 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!788557 () Bool)

(assert (=> b!788557 (= e!438360 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20497 a!3186) j!159) a!3186 mask!3328) lt!351766))))

(declare-fun b!788558 () Bool)

(declare-fun e!438353 () Bool)

(declare-fun e!438358 () Bool)

(assert (=> b!788558 (= e!438353 (not e!438358))))

(declare-fun res!533968 () Bool)

(assert (=> b!788558 (=> res!533968 e!438358)))

(declare-fun lt!351767 () SeekEntryResult!8053)

(get-info :version)

(assert (=> b!788558 (= res!533968 (or (not ((_ is Intermediate!8053) lt!351767)) (bvslt x!1131 (x!65676 lt!351767)) (not (= x!1131 (x!65676 lt!351767))) (not (= index!1321 (index!34582 lt!351767)))))))

(assert (=> b!788558 e!438356))

(declare-fun res!533969 () Bool)

(assert (=> b!788558 (=> (not res!533969) (not e!438356))))

(assert (=> b!788558 (= res!533969 (= lt!351769 lt!351770))))

(assert (=> b!788558 (= lt!351770 (Found!8053 j!159))))

(assert (=> b!788558 (= lt!351769 (seekEntryOrOpen!0 (select (arr!20497 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!788558 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!351764 () Unit!27277)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42826 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27277)

(assert (=> b!788558 (= lt!351764 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!788559 () Bool)

(declare-fun e!438357 () Bool)

(assert (=> b!788559 (= e!438358 e!438357)))

(declare-fun res!533965 () Bool)

(assert (=> b!788559 (=> res!533965 e!438357)))

(assert (=> b!788559 (= res!533965 (not (= lt!351771 lt!351770)))))

(assert (=> b!788559 (= lt!351771 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20497 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!788560 () Bool)

(assert (=> b!788560 (= e!438357 e!438354)))

(declare-fun res!533970 () Bool)

(assert (=> b!788560 (=> res!533970 e!438354)))

(assert (=> b!788560 (= res!533970 (= lt!351761 lt!351768))))

(assert (=> b!788560 (= lt!351761 (select (store (arr!20497 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!788561 () Bool)

(declare-fun res!533971 () Bool)

(assert (=> b!788561 (=> (not res!533971) (not e!438364))))

(assert (=> b!788561 (= res!533971 e!438360)))

(declare-fun c!87700 () Bool)

(assert (=> b!788561 (= c!87700 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!788562 () Bool)

(assert (=> b!788562 (= e!438361 e!438362)))

(declare-fun res!533979 () Bool)

(assert (=> b!788562 (=> (not res!533979) (not e!438362))))

(declare-fun lt!351772 () SeekEntryResult!8053)

(assert (=> b!788562 (= res!533979 (or (= lt!351772 (MissingZero!8053 i!1173)) (= lt!351772 (MissingVacant!8053 i!1173))))))

(assert (=> b!788562 (= lt!351772 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!788563 () Bool)

(assert (=> b!788563 (= e!438364 e!438353)))

(declare-fun res!533964 () Bool)

(assert (=> b!788563 (=> (not res!533964) (not e!438353))))

(declare-fun lt!351765 () SeekEntryResult!8053)

(assert (=> b!788563 (= res!533964 (= lt!351765 lt!351767))))

(assert (=> b!788563 (= lt!351767 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351768 lt!351763 mask!3328))))

(assert (=> b!788563 (= lt!351765 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351768 mask!3328) lt!351768 lt!351763 mask!3328))))

(assert (=> b!788563 (= lt!351768 (select (store (arr!20497 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!788563 (= lt!351763 (array!42827 (store (arr!20497 a!3186) i!1173 k0!2102) (size!20917 a!3186)))))

(declare-fun res!533973 () Bool)

(assert (=> start!67906 (=> (not res!533973) (not e!438361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67906 (= res!533973 (validMask!0 mask!3328))))

(assert (=> start!67906 e!438361))

(assert (=> start!67906 true))

(declare-fun array_inv!16356 (array!42826) Bool)

(assert (=> start!67906 (array_inv!16356 a!3186)))

(declare-fun b!788564 () Bool)

(declare-fun Unit!27280 () Unit!27277)

(assert (=> b!788564 (= e!438355 Unit!27280)))

(assert (=> b!788564 false))

(declare-fun b!788565 () Bool)

(declare-fun res!533977 () Bool)

(assert (=> b!788565 (=> (not res!533977) (not e!438362))))

(assert (=> b!788565 (= res!533977 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20917 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20917 a!3186))))))

(assert (= (and start!67906 res!533973) b!788546))

(assert (= (and b!788546 res!533976) b!788547))

(assert (= (and b!788547 res!533974) b!788548))

(assert (= (and b!788548 res!533978) b!788555))

(assert (= (and b!788555 res!533967) b!788562))

(assert (= (and b!788562 res!533979) b!788544))

(assert (= (and b!788544 res!533966) b!788553))

(assert (= (and b!788553 res!533980) b!788565))

(assert (= (and b!788565 res!533977) b!788556))

(assert (= (and b!788556 res!533975) b!788550))

(assert (= (and b!788550 res!533982) b!788561))

(assert (= (and b!788561 c!87700) b!788557))

(assert (= (and b!788561 (not c!87700)) b!788554))

(assert (= (and b!788561 res!533971) b!788563))

(assert (= (and b!788563 res!533964) b!788558))

(assert (= (and b!788558 res!533969) b!788545))

(assert (= (and b!788558 (not res!533968)) b!788559))

(assert (= (and b!788559 (not res!533965)) b!788560))

(assert (= (and b!788560 (not res!533970)) b!788551))

(assert (= (and b!788551 c!87701) b!788564))

(assert (= (and b!788551 (not c!87701)) b!788543))

(assert (= (and b!788551 res!533972) b!788549))

(assert (= (and b!788549 res!533981) b!788552))

(declare-fun m!730427 () Bool)

(assert (=> start!67906 m!730427))

(declare-fun m!730429 () Bool)

(assert (=> start!67906 m!730429))

(declare-fun m!730431 () Bool)

(assert (=> b!788545 m!730431))

(assert (=> b!788545 m!730431))

(declare-fun m!730433 () Bool)

(assert (=> b!788545 m!730433))

(assert (=> b!788547 m!730431))

(assert (=> b!788547 m!730431))

(declare-fun m!730435 () Bool)

(assert (=> b!788547 m!730435))

(assert (=> b!788558 m!730431))

(assert (=> b!788558 m!730431))

(declare-fun m!730437 () Bool)

(assert (=> b!788558 m!730437))

(declare-fun m!730439 () Bool)

(assert (=> b!788558 m!730439))

(declare-fun m!730441 () Bool)

(assert (=> b!788558 m!730441))

(declare-fun m!730443 () Bool)

(assert (=> b!788548 m!730443))

(assert (=> b!788556 m!730431))

(assert (=> b!788556 m!730431))

(declare-fun m!730445 () Bool)

(assert (=> b!788556 m!730445))

(assert (=> b!788556 m!730445))

(assert (=> b!788556 m!730431))

(declare-fun m!730447 () Bool)

(assert (=> b!788556 m!730447))

(assert (=> b!788557 m!730431))

(assert (=> b!788557 m!730431))

(declare-fun m!730449 () Bool)

(assert (=> b!788557 m!730449))

(declare-fun m!730451 () Bool)

(assert (=> b!788550 m!730451))

(declare-fun m!730453 () Bool)

(assert (=> b!788553 m!730453))

(declare-fun m!730455 () Bool)

(assert (=> b!788563 m!730455))

(declare-fun m!730457 () Bool)

(assert (=> b!788563 m!730457))

(declare-fun m!730459 () Bool)

(assert (=> b!788563 m!730459))

(declare-fun m!730461 () Bool)

(assert (=> b!788563 m!730461))

(assert (=> b!788563 m!730457))

(declare-fun m!730463 () Bool)

(assert (=> b!788563 m!730463))

(declare-fun m!730465 () Bool)

(assert (=> b!788555 m!730465))

(assert (=> b!788560 m!730455))

(declare-fun m!730467 () Bool)

(assert (=> b!788560 m!730467))

(assert (=> b!788554 m!730431))

(assert (=> b!788554 m!730431))

(declare-fun m!730469 () Bool)

(assert (=> b!788554 m!730469))

(declare-fun m!730471 () Bool)

(assert (=> b!788562 m!730471))

(declare-fun m!730473 () Bool)

(assert (=> b!788549 m!730473))

(declare-fun m!730475 () Bool)

(assert (=> b!788549 m!730475))

(declare-fun m!730477 () Bool)

(assert (=> b!788544 m!730477))

(assert (=> b!788559 m!730431))

(assert (=> b!788559 m!730431))

(assert (=> b!788559 m!730469))

(check-sat (not b!788559) (not b!788547) (not b!788549) (not start!67906) (not b!788562) (not b!788544) (not b!788545) (not b!788556) (not b!788555) (not b!788553) (not b!788558) (not b!788548) (not b!788563) (not b!788557) (not b!788554))
(check-sat)
