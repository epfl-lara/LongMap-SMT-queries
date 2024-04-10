; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51904 () Bool)

(assert start!51904)

(declare-fun b!567353 () Bool)

(declare-fun res!357942 () Bool)

(declare-fun e!326484 () Bool)

(assert (=> b!567353 (=> (not res!357942) (not e!326484))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35598 0))(
  ( (array!35599 (arr!17095 (Array (_ BitVec 32) (_ BitVec 64))) (size!17459 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35598)

(declare-datatypes ((SeekEntryResult!5544 0))(
  ( (MissingZero!5544 (index!24403 (_ BitVec 32))) (Found!5544 (index!24404 (_ BitVec 32))) (Intermediate!5544 (undefined!6356 Bool) (index!24405 (_ BitVec 32)) (x!53273 (_ BitVec 32))) (Undefined!5544) (MissingVacant!5544 (index!24406 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35598 (_ BitVec 32)) SeekEntryResult!5544)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567353 (= res!357942 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17095 a!3118) j!142) mask!3119) (select (arr!17095 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17095 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17095 a!3118) i!1132 k0!1914) j!142) (array!35599 (store (arr!17095 a!3118) i!1132 k0!1914) (size!17459 a!3118)) mask!3119)))))

(declare-fun b!567354 () Bool)

(declare-fun res!357944 () Bool)

(declare-fun e!326485 () Bool)

(assert (=> b!567354 (=> (not res!357944) (not e!326485))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!567354 (= res!357944 (validKeyInArray!0 (select (arr!17095 a!3118) j!142)))))

(declare-fun b!567355 () Bool)

(assert (=> b!567355 (= e!326484 (not true))))

(declare-fun e!326486 () Bool)

(assert (=> b!567355 e!326486))

(declare-fun res!357945 () Bool)

(assert (=> b!567355 (=> (not res!357945) (not e!326486))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35598 (_ BitVec 32)) Bool)

(assert (=> b!567355 (= res!357945 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17790 0))(
  ( (Unit!17791) )
))
(declare-fun lt!258499 () Unit!17790)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35598 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17790)

(assert (=> b!567355 (= lt!258499 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!567356 () Bool)

(declare-fun res!357947 () Bool)

(assert (=> b!567356 (=> (not res!357947) (not e!326485))))

(assert (=> b!567356 (= res!357947 (and (= (size!17459 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17459 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17459 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!357946 () Bool)

(assert (=> start!51904 (=> (not res!357946) (not e!326485))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51904 (= res!357946 (validMask!0 mask!3119))))

(assert (=> start!51904 e!326485))

(assert (=> start!51904 true))

(declare-fun array_inv!12891 (array!35598) Bool)

(assert (=> start!51904 (array_inv!12891 a!3118)))

(declare-fun b!567357 () Bool)

(declare-fun res!357939 () Bool)

(assert (=> b!567357 (=> (not res!357939) (not e!326485))))

(assert (=> b!567357 (= res!357939 (validKeyInArray!0 k0!1914))))

(declare-fun b!567358 () Bool)

(declare-fun res!357941 () Bool)

(assert (=> b!567358 (=> (not res!357941) (not e!326484))))

(declare-datatypes ((List!11175 0))(
  ( (Nil!11172) (Cons!11171 (h!12183 (_ BitVec 64)) (t!17403 List!11175)) )
))
(declare-fun arrayNoDuplicates!0 (array!35598 (_ BitVec 32) List!11175) Bool)

(assert (=> b!567358 (= res!357941 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11172))))

(declare-fun b!567359 () Bool)

(declare-fun res!357938 () Bool)

(assert (=> b!567359 (=> (not res!357938) (not e!326485))))

(declare-fun arrayContainsKey!0 (array!35598 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!567359 (= res!357938 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!567360 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35598 (_ BitVec 32)) SeekEntryResult!5544)

(assert (=> b!567360 (= e!326486 (= (seekEntryOrOpen!0 (select (arr!17095 a!3118) j!142) a!3118 mask!3119) (Found!5544 j!142)))))

(declare-fun b!567361 () Bool)

(declare-fun res!357943 () Bool)

(assert (=> b!567361 (=> (not res!357943) (not e!326484))))

(assert (=> b!567361 (= res!357943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!567362 () Bool)

(assert (=> b!567362 (= e!326485 e!326484)))

(declare-fun res!357940 () Bool)

(assert (=> b!567362 (=> (not res!357940) (not e!326484))))

(declare-fun lt!258498 () SeekEntryResult!5544)

(assert (=> b!567362 (= res!357940 (or (= lt!258498 (MissingZero!5544 i!1132)) (= lt!258498 (MissingVacant!5544 i!1132))))))

(assert (=> b!567362 (= lt!258498 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!51904 res!357946) b!567356))

(assert (= (and b!567356 res!357947) b!567354))

(assert (= (and b!567354 res!357944) b!567357))

(assert (= (and b!567357 res!357939) b!567359))

(assert (= (and b!567359 res!357938) b!567362))

(assert (= (and b!567362 res!357940) b!567361))

(assert (= (and b!567361 res!357943) b!567358))

(assert (= (and b!567358 res!357941) b!567353))

(assert (= (and b!567353 res!357942) b!567355))

(assert (= (and b!567355 res!357945) b!567360))

(declare-fun m!545925 () Bool)

(assert (=> b!567358 m!545925))

(declare-fun m!545927 () Bool)

(assert (=> b!567357 m!545927))

(declare-fun m!545929 () Bool)

(assert (=> b!567353 m!545929))

(declare-fun m!545931 () Bool)

(assert (=> b!567353 m!545931))

(assert (=> b!567353 m!545929))

(declare-fun m!545933 () Bool)

(assert (=> b!567353 m!545933))

(declare-fun m!545935 () Bool)

(assert (=> b!567353 m!545935))

(assert (=> b!567353 m!545933))

(declare-fun m!545937 () Bool)

(assert (=> b!567353 m!545937))

(assert (=> b!567353 m!545931))

(assert (=> b!567353 m!545929))

(declare-fun m!545939 () Bool)

(assert (=> b!567353 m!545939))

(declare-fun m!545941 () Bool)

(assert (=> b!567353 m!545941))

(assert (=> b!567353 m!545933))

(assert (=> b!567353 m!545935))

(declare-fun m!545943 () Bool)

(assert (=> b!567359 m!545943))

(declare-fun m!545945 () Bool)

(assert (=> b!567361 m!545945))

(declare-fun m!545947 () Bool)

(assert (=> start!51904 m!545947))

(declare-fun m!545949 () Bool)

(assert (=> start!51904 m!545949))

(declare-fun m!545951 () Bool)

(assert (=> b!567355 m!545951))

(declare-fun m!545953 () Bool)

(assert (=> b!567355 m!545953))

(declare-fun m!545955 () Bool)

(assert (=> b!567362 m!545955))

(assert (=> b!567360 m!545929))

(assert (=> b!567360 m!545929))

(declare-fun m!545957 () Bool)

(assert (=> b!567360 m!545957))

(assert (=> b!567354 m!545929))

(assert (=> b!567354 m!545929))

(declare-fun m!545959 () Bool)

(assert (=> b!567354 m!545959))

(check-sat (not start!51904) (not b!567359) (not b!567355) (not b!567357) (not b!567354) (not b!567360) (not b!567358) (not b!567361) (not b!567353) (not b!567362))
(check-sat)
