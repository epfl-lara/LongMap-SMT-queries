; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123714 () Bool)

(assert start!123714)

(declare-fun b!1433945 () Bool)

(declare-fun res!967407 () Bool)

(declare-fun e!809360 () Bool)

(assert (=> b!1433945 (=> (not res!967407) (not e!809360))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1433945 (= res!967407 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1433946 () Bool)

(declare-fun res!967417 () Bool)

(declare-fun e!809359 () Bool)

(assert (=> b!1433946 (=> (not res!967417) (not e!809359))))

(declare-datatypes ((array!97572 0))(
  ( (array!97573 (arr!47090 (Array (_ BitVec 32) (_ BitVec 64))) (size!47640 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97572)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97572 (_ BitVec 32)) Bool)

(assert (=> b!1433946 (= res!967417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1433947 () Bool)

(declare-fun e!809362 () Bool)

(assert (=> b!1433947 (= e!809359 e!809362)))

(declare-fun res!967416 () Bool)

(assert (=> b!1433947 (=> (not res!967416) (not e!809362))))

(declare-datatypes ((SeekEntryResult!11369 0))(
  ( (MissingZero!11369 (index!47868 (_ BitVec 32))) (Found!11369 (index!47869 (_ BitVec 32))) (Intermediate!11369 (undefined!12181 Bool) (index!47870 (_ BitVec 32)) (x!129525 (_ BitVec 32))) (Undefined!11369) (MissingVacant!11369 (index!47871 (_ BitVec 32))) )
))
(declare-fun lt!631259 () SeekEntryResult!11369)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97572 (_ BitVec 32)) SeekEntryResult!11369)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433947 (= res!967416 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47090 a!2831) j!81) mask!2608) (select (arr!47090 a!2831) j!81) a!2831 mask!2608) lt!631259))))

(assert (=> b!1433947 (= lt!631259 (Intermediate!11369 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1433948 () Bool)

(declare-fun res!967419 () Bool)

(assert (=> b!1433948 (=> (not res!967419) (not e!809359))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1433948 (= res!967419 (validKeyInArray!0 (select (arr!47090 a!2831) j!81)))))

(declare-fun b!1433949 () Bool)

(assert (=> b!1433949 (= e!809362 e!809360)))

(declare-fun res!967410 () Bool)

(assert (=> b!1433949 (=> (not res!967410) (not e!809360))))

(declare-fun lt!631260 () (_ BitVec 64))

(declare-fun lt!631255 () array!97572)

(declare-fun lt!631257 () SeekEntryResult!11369)

(assert (=> b!1433949 (= res!967410 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631260 mask!2608) lt!631260 lt!631255 mask!2608) lt!631257))))

(assert (=> b!1433949 (= lt!631257 (Intermediate!11369 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1433949 (= lt!631260 (select (store (arr!47090 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1433949 (= lt!631255 (array!97573 (store (arr!47090 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47640 a!2831)))))

(declare-fun b!1433950 () Bool)

(declare-fun res!967408 () Bool)

(assert (=> b!1433950 (=> (not res!967408) (not e!809360))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1433950 (= res!967408 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631260 lt!631255 mask!2608) lt!631257))))

(declare-fun b!1433951 () Bool)

(declare-fun res!967413 () Bool)

(assert (=> b!1433951 (=> (not res!967413) (not e!809359))))

(assert (=> b!1433951 (= res!967413 (and (= (size!47640 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47640 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47640 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1433952 () Bool)

(declare-fun res!967420 () Bool)

(assert (=> b!1433952 (=> (not res!967420) (not e!809359))))

(declare-datatypes ((List!33600 0))(
  ( (Nil!33597) (Cons!33596 (h!34925 (_ BitVec 64)) (t!48294 List!33600)) )
))
(declare-fun arrayNoDuplicates!0 (array!97572 (_ BitVec 32) List!33600) Bool)

(assert (=> b!1433952 (= res!967420 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33597))))

(declare-fun b!1433954 () Bool)

(declare-fun res!967412 () Bool)

(assert (=> b!1433954 (=> (not res!967412) (not e!809359))))

(assert (=> b!1433954 (= res!967412 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47640 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47640 a!2831))))))

(declare-fun b!1433955 () Bool)

(declare-fun e!809361 () Bool)

(assert (=> b!1433955 (= e!809361 true)))

(declare-fun lt!631258 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433955 (= lt!631258 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1433956 () Bool)

(declare-fun res!967414 () Bool)

(assert (=> b!1433956 (=> (not res!967414) (not e!809359))))

(assert (=> b!1433956 (= res!967414 (validKeyInArray!0 (select (arr!47090 a!2831) i!982)))))

(declare-fun b!1433957 () Bool)

(declare-fun res!967409 () Bool)

(assert (=> b!1433957 (=> (not res!967409) (not e!809360))))

(assert (=> b!1433957 (= res!967409 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47090 a!2831) j!81) a!2831 mask!2608) lt!631259))))

(declare-fun b!1433958 () Bool)

(assert (=> b!1433958 (= e!809360 (not e!809361))))

(declare-fun res!967411 () Bool)

(assert (=> b!1433958 (=> res!967411 e!809361)))

(assert (=> b!1433958 (= res!967411 (or (= (select (arr!47090 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47090 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47090 a!2831) index!585) (select (arr!47090 a!2831) j!81)) (= (select (store (arr!47090 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!809358 () Bool)

(assert (=> b!1433958 e!809358))

(declare-fun res!967418 () Bool)

(assert (=> b!1433958 (=> (not res!967418) (not e!809358))))

(assert (=> b!1433958 (= res!967418 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48484 0))(
  ( (Unit!48485) )
))
(declare-fun lt!631256 () Unit!48484)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97572 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48484)

(assert (=> b!1433958 (= lt!631256 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1433953 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97572 (_ BitVec 32)) SeekEntryResult!11369)

(assert (=> b!1433953 (= e!809358 (= (seekEntryOrOpen!0 (select (arr!47090 a!2831) j!81) a!2831 mask!2608) (Found!11369 j!81)))))

(declare-fun res!967415 () Bool)

(assert (=> start!123714 (=> (not res!967415) (not e!809359))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123714 (= res!967415 (validMask!0 mask!2608))))

(assert (=> start!123714 e!809359))

(assert (=> start!123714 true))

(declare-fun array_inv!36118 (array!97572) Bool)

(assert (=> start!123714 (array_inv!36118 a!2831)))

(assert (= (and start!123714 res!967415) b!1433951))

(assert (= (and b!1433951 res!967413) b!1433956))

(assert (= (and b!1433956 res!967414) b!1433948))

(assert (= (and b!1433948 res!967419) b!1433946))

(assert (= (and b!1433946 res!967417) b!1433952))

(assert (= (and b!1433952 res!967420) b!1433954))

(assert (= (and b!1433954 res!967412) b!1433947))

(assert (= (and b!1433947 res!967416) b!1433949))

(assert (= (and b!1433949 res!967410) b!1433957))

(assert (= (and b!1433957 res!967409) b!1433950))

(assert (= (and b!1433950 res!967408) b!1433945))

(assert (= (and b!1433945 res!967407) b!1433958))

(assert (= (and b!1433958 res!967418) b!1433953))

(assert (= (and b!1433958 (not res!967411)) b!1433955))

(declare-fun m!1323549 () Bool)

(assert (=> b!1433957 m!1323549))

(assert (=> b!1433957 m!1323549))

(declare-fun m!1323551 () Bool)

(assert (=> b!1433957 m!1323551))

(declare-fun m!1323553 () Bool)

(assert (=> b!1433949 m!1323553))

(assert (=> b!1433949 m!1323553))

(declare-fun m!1323555 () Bool)

(assert (=> b!1433949 m!1323555))

(declare-fun m!1323557 () Bool)

(assert (=> b!1433949 m!1323557))

(declare-fun m!1323559 () Bool)

(assert (=> b!1433949 m!1323559))

(assert (=> b!1433953 m!1323549))

(assert (=> b!1433953 m!1323549))

(declare-fun m!1323561 () Bool)

(assert (=> b!1433953 m!1323561))

(declare-fun m!1323563 () Bool)

(assert (=> b!1433955 m!1323563))

(assert (=> b!1433947 m!1323549))

(assert (=> b!1433947 m!1323549))

(declare-fun m!1323565 () Bool)

(assert (=> b!1433947 m!1323565))

(assert (=> b!1433947 m!1323565))

(assert (=> b!1433947 m!1323549))

(declare-fun m!1323567 () Bool)

(assert (=> b!1433947 m!1323567))

(declare-fun m!1323569 () Bool)

(assert (=> b!1433946 m!1323569))

(assert (=> b!1433948 m!1323549))

(assert (=> b!1433948 m!1323549))

(declare-fun m!1323571 () Bool)

(assert (=> b!1433948 m!1323571))

(declare-fun m!1323573 () Bool)

(assert (=> b!1433956 m!1323573))

(assert (=> b!1433956 m!1323573))

(declare-fun m!1323575 () Bool)

(assert (=> b!1433956 m!1323575))

(declare-fun m!1323577 () Bool)

(assert (=> b!1433950 m!1323577))

(declare-fun m!1323579 () Bool)

(assert (=> b!1433952 m!1323579))

(declare-fun m!1323581 () Bool)

(assert (=> start!123714 m!1323581))

(declare-fun m!1323583 () Bool)

(assert (=> start!123714 m!1323583))

(assert (=> b!1433958 m!1323557))

(declare-fun m!1323585 () Bool)

(assert (=> b!1433958 m!1323585))

(declare-fun m!1323587 () Bool)

(assert (=> b!1433958 m!1323587))

(declare-fun m!1323589 () Bool)

(assert (=> b!1433958 m!1323589))

(assert (=> b!1433958 m!1323549))

(declare-fun m!1323591 () Bool)

(assert (=> b!1433958 m!1323591))

(push 1)

