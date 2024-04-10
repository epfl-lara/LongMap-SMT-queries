; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122762 () Bool)

(assert start!122762)

(declare-fun b!1422927 () Bool)

(declare-fun e!804359 () Bool)

(declare-fun e!804354 () Bool)

(assert (=> b!1422927 (= e!804359 e!804354)))

(declare-fun res!958364 () Bool)

(assert (=> b!1422927 (=> res!958364 e!804354)))

(declare-fun lt!626893 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97127 0))(
  ( (array!97128 (arr!46881 (Array (_ BitVec 32) (_ BitVec 64))) (size!47431 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97127)

(assert (=> b!1422927 (= res!958364 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626893 #b00000000000000000000000000000000) (bvsge lt!626893 (size!47431 a!2831))))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422927 (= lt!626893 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1422928 () Bool)

(declare-fun res!958375 () Bool)

(declare-fun e!804357 () Bool)

(assert (=> b!1422928 (=> (not res!958375) (not e!804357))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1422928 (= res!958375 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1422929 () Bool)

(declare-fun res!958360 () Bool)

(declare-fun e!804356 () Bool)

(assert (=> b!1422929 (=> (not res!958360) (not e!804356))))

(assert (=> b!1422929 (= res!958360 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47431 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47431 a!2831))))))

(declare-fun b!1422930 () Bool)

(declare-fun res!958365 () Bool)

(assert (=> b!1422930 (=> (not res!958365) (not e!804357))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11166 0))(
  ( (MissingZero!11166 (index!47056 (_ BitVec 32))) (Found!11166 (index!47057 (_ BitVec 32))) (Intermediate!11166 (undefined!11978 Bool) (index!47058 (_ BitVec 32)) (x!128696 (_ BitVec 32))) (Undefined!11166) (MissingVacant!11166 (index!47059 (_ BitVec 32))) )
))
(declare-fun lt!626891 () SeekEntryResult!11166)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97127 (_ BitVec 32)) SeekEntryResult!11166)

(assert (=> b!1422930 (= res!958365 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46881 a!2831) j!81) a!2831 mask!2608) lt!626891))))

(declare-fun b!1422931 () Bool)

(declare-fun res!958373 () Bool)

(assert (=> b!1422931 (=> (not res!958373) (not e!804357))))

(declare-fun lt!626894 () (_ BitVec 64))

(declare-fun lt!626889 () SeekEntryResult!11166)

(declare-fun lt!626892 () array!97127)

(assert (=> b!1422931 (= res!958373 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626894 lt!626892 mask!2608) lt!626889))))

(declare-fun b!1422932 () Bool)

(declare-fun e!804353 () Bool)

(assert (=> b!1422932 (= e!804356 e!804353)))

(declare-fun res!958366 () Bool)

(assert (=> b!1422932 (=> (not res!958366) (not e!804353))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422932 (= res!958366 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46881 a!2831) j!81) mask!2608) (select (arr!46881 a!2831) j!81) a!2831 mask!2608) lt!626891))))

(assert (=> b!1422932 (= lt!626891 (Intermediate!11166 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1422933 () Bool)

(declare-fun res!958363 () Bool)

(assert (=> b!1422933 (=> res!958363 e!804354)))

(assert (=> b!1422933 (= res!958363 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626893 (select (arr!46881 a!2831) j!81) a!2831 mask!2608) lt!626891)))))

(declare-fun b!1422934 () Bool)

(declare-fun res!958367 () Bool)

(assert (=> b!1422934 (=> (not res!958367) (not e!804356))))

(declare-datatypes ((List!33391 0))(
  ( (Nil!33388) (Cons!33387 (h!34689 (_ BitVec 64)) (t!48085 List!33391)) )
))
(declare-fun arrayNoDuplicates!0 (array!97127 (_ BitVec 32) List!33391) Bool)

(assert (=> b!1422934 (= res!958367 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33388))))

(declare-fun b!1422935 () Bool)

(declare-fun res!958370 () Bool)

(assert (=> b!1422935 (=> (not res!958370) (not e!804356))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422935 (= res!958370 (validKeyInArray!0 (select (arr!46881 a!2831) i!982)))))

(declare-fun b!1422936 () Bool)

(assert (=> b!1422936 (= e!804357 (not e!804359))))

(declare-fun res!958361 () Bool)

(assert (=> b!1422936 (=> res!958361 e!804359)))

(assert (=> b!1422936 (= res!958361 (or (= (select (arr!46881 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46881 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46881 a!2831) index!585) (select (arr!46881 a!2831) j!81)) (= (select (store (arr!46881 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!804355 () Bool)

(assert (=> b!1422936 e!804355))

(declare-fun res!958372 () Bool)

(assert (=> b!1422936 (=> (not res!958372) (not e!804355))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97127 (_ BitVec 32)) Bool)

(assert (=> b!1422936 (= res!958372 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48168 0))(
  ( (Unit!48169) )
))
(declare-fun lt!626890 () Unit!48168)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97127 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48168)

(assert (=> b!1422936 (= lt!626890 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422937 () Bool)

(declare-fun res!958362 () Bool)

(assert (=> b!1422937 (=> (not res!958362) (not e!804356))))

(assert (=> b!1422937 (= res!958362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1422938 () Bool)

(assert (=> b!1422938 (= e!804354 true)))

(declare-fun lt!626895 () SeekEntryResult!11166)

(assert (=> b!1422938 (= lt!626895 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626893 lt!626894 lt!626892 mask!2608))))

(declare-fun b!1422939 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97127 (_ BitVec 32)) SeekEntryResult!11166)

(assert (=> b!1422939 (= e!804355 (= (seekEntryOrOpen!0 (select (arr!46881 a!2831) j!81) a!2831 mask!2608) (Found!11166 j!81)))))

(declare-fun res!958368 () Bool)

(assert (=> start!122762 (=> (not res!958368) (not e!804356))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122762 (= res!958368 (validMask!0 mask!2608))))

(assert (=> start!122762 e!804356))

(assert (=> start!122762 true))

(declare-fun array_inv!35909 (array!97127) Bool)

(assert (=> start!122762 (array_inv!35909 a!2831)))

(declare-fun b!1422940 () Bool)

(assert (=> b!1422940 (= e!804353 e!804357)))

(declare-fun res!958374 () Bool)

(assert (=> b!1422940 (=> (not res!958374) (not e!804357))))

(assert (=> b!1422940 (= res!958374 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626894 mask!2608) lt!626894 lt!626892 mask!2608) lt!626889))))

(assert (=> b!1422940 (= lt!626889 (Intermediate!11166 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1422940 (= lt!626894 (select (store (arr!46881 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422940 (= lt!626892 (array!97128 (store (arr!46881 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47431 a!2831)))))

(declare-fun b!1422941 () Bool)

(declare-fun res!958371 () Bool)

(assert (=> b!1422941 (=> (not res!958371) (not e!804356))))

(assert (=> b!1422941 (= res!958371 (validKeyInArray!0 (select (arr!46881 a!2831) j!81)))))

(declare-fun b!1422942 () Bool)

(declare-fun res!958369 () Bool)

(assert (=> b!1422942 (=> (not res!958369) (not e!804356))))

(assert (=> b!1422942 (= res!958369 (and (= (size!47431 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47431 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47431 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122762 res!958368) b!1422942))

(assert (= (and b!1422942 res!958369) b!1422935))

(assert (= (and b!1422935 res!958370) b!1422941))

(assert (= (and b!1422941 res!958371) b!1422937))

(assert (= (and b!1422937 res!958362) b!1422934))

(assert (= (and b!1422934 res!958367) b!1422929))

(assert (= (and b!1422929 res!958360) b!1422932))

(assert (= (and b!1422932 res!958366) b!1422940))

(assert (= (and b!1422940 res!958374) b!1422930))

(assert (= (and b!1422930 res!958365) b!1422931))

(assert (= (and b!1422931 res!958373) b!1422928))

(assert (= (and b!1422928 res!958375) b!1422936))

(assert (= (and b!1422936 res!958372) b!1422939))

(assert (= (and b!1422936 (not res!958361)) b!1422927))

(assert (= (and b!1422927 (not res!958364)) b!1422933))

(assert (= (and b!1422933 (not res!958363)) b!1422938))

(declare-fun m!1313475 () Bool)

(assert (=> b!1422940 m!1313475))

(assert (=> b!1422940 m!1313475))

(declare-fun m!1313477 () Bool)

(assert (=> b!1422940 m!1313477))

(declare-fun m!1313479 () Bool)

(assert (=> b!1422940 m!1313479))

(declare-fun m!1313481 () Bool)

(assert (=> b!1422940 m!1313481))

(declare-fun m!1313483 () Bool)

(assert (=> b!1422941 m!1313483))

(assert (=> b!1422941 m!1313483))

(declare-fun m!1313485 () Bool)

(assert (=> b!1422941 m!1313485))

(declare-fun m!1313487 () Bool)

(assert (=> b!1422931 m!1313487))

(declare-fun m!1313489 () Bool)

(assert (=> b!1422937 m!1313489))

(assert (=> b!1422936 m!1313479))

(declare-fun m!1313491 () Bool)

(assert (=> b!1422936 m!1313491))

(declare-fun m!1313493 () Bool)

(assert (=> b!1422936 m!1313493))

(declare-fun m!1313495 () Bool)

(assert (=> b!1422936 m!1313495))

(assert (=> b!1422936 m!1313483))

(declare-fun m!1313497 () Bool)

(assert (=> b!1422936 m!1313497))

(declare-fun m!1313499 () Bool)

(assert (=> b!1422935 m!1313499))

(assert (=> b!1422935 m!1313499))

(declare-fun m!1313501 () Bool)

(assert (=> b!1422935 m!1313501))

(declare-fun m!1313503 () Bool)

(assert (=> start!122762 m!1313503))

(declare-fun m!1313505 () Bool)

(assert (=> start!122762 m!1313505))

(declare-fun m!1313507 () Bool)

(assert (=> b!1422934 m!1313507))

(assert (=> b!1422939 m!1313483))

(assert (=> b!1422939 m!1313483))

(declare-fun m!1313509 () Bool)

(assert (=> b!1422939 m!1313509))

(assert (=> b!1422932 m!1313483))

(assert (=> b!1422932 m!1313483))

(declare-fun m!1313511 () Bool)

(assert (=> b!1422932 m!1313511))

(assert (=> b!1422932 m!1313511))

(assert (=> b!1422932 m!1313483))

(declare-fun m!1313513 () Bool)

(assert (=> b!1422932 m!1313513))

(declare-fun m!1313515 () Bool)

(assert (=> b!1422927 m!1313515))

(assert (=> b!1422930 m!1313483))

(assert (=> b!1422930 m!1313483))

(declare-fun m!1313517 () Bool)

(assert (=> b!1422930 m!1313517))

(assert (=> b!1422933 m!1313483))

(assert (=> b!1422933 m!1313483))

(declare-fun m!1313519 () Bool)

(assert (=> b!1422933 m!1313519))

(declare-fun m!1313521 () Bool)

(assert (=> b!1422938 m!1313521))

(check-sat (not b!1422935) (not b!1422937) (not b!1422938) (not b!1422927) (not b!1422934) (not b!1422936) (not b!1422941) (not b!1422932) (not b!1422933) (not b!1422931) (not b!1422930) (not b!1422939) (not b!1422940) (not start!122762))
(check-sat)
