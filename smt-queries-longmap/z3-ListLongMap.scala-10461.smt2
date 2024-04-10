; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122930 () Bool)

(assert start!122930)

(declare-fun b!1425944 () Bool)

(declare-fun res!961379 () Bool)

(declare-fun e!805528 () Bool)

(assert (=> b!1425944 (=> (not res!961379) (not e!805528))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97295 0))(
  ( (array!97296 (arr!46965 (Array (_ BitVec 32) (_ BitVec 64))) (size!47515 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97295)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1425944 (= res!961379 (and (= (size!47515 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47515 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47515 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425945 () Bool)

(declare-fun res!961381 () Bool)

(assert (=> b!1425945 (=> (not res!961381) (not e!805528))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425945 (= res!961381 (validKeyInArray!0 (select (arr!46965 a!2831) i!982)))))

(declare-fun b!1425946 () Bool)

(declare-fun res!961386 () Bool)

(assert (=> b!1425946 (=> (not res!961386) (not e!805528))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97295 (_ BitVec 32)) Bool)

(assert (=> b!1425946 (= res!961386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!961383 () Bool)

(assert (=> start!122930 (=> (not res!961383) (not e!805528))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122930 (= res!961383 (validMask!0 mask!2608))))

(assert (=> start!122930 e!805528))

(assert (=> start!122930 true))

(declare-fun array_inv!35993 (array!97295) Bool)

(assert (=> start!122930 (array_inv!35993 a!2831)))

(declare-fun b!1425947 () Bool)

(declare-fun e!805526 () Bool)

(assert (=> b!1425947 (= e!805528 e!805526)))

(declare-fun res!961385 () Bool)

(assert (=> b!1425947 (=> (not res!961385) (not e!805526))))

(declare-datatypes ((SeekEntryResult!11244 0))(
  ( (MissingZero!11244 (index!47368 (_ BitVec 32))) (Found!11244 (index!47369 (_ BitVec 32))) (Intermediate!11244 (undefined!12056 Bool) (index!47370 (_ BitVec 32)) (x!128998 (_ BitVec 32))) (Undefined!11244) (MissingVacant!11244 (index!47371 (_ BitVec 32))) )
))
(declare-fun lt!627963 () SeekEntryResult!11244)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97295 (_ BitVec 32)) SeekEntryResult!11244)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425947 (= res!961385 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46965 a!2831) j!81) mask!2608) (select (arr!46965 a!2831) j!81) a!2831 mask!2608) lt!627963))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1425947 (= lt!627963 (Intermediate!11244 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1425948 () Bool)

(declare-fun res!961378 () Bool)

(declare-fun e!805529 () Bool)

(assert (=> b!1425948 (=> (not res!961378) (not e!805529))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1425948 (= res!961378 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46965 a!2831) j!81) a!2831 mask!2608) lt!627963))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun b!1425949 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1425949 (= e!805529 (and (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))) (bvsgt #b00000000000000000000000000000000 (size!47515 a!2831))))))

(declare-fun b!1425950 () Bool)

(declare-fun res!961382 () Bool)

(assert (=> b!1425950 (=> (not res!961382) (not e!805528))))

(assert (=> b!1425950 (= res!961382 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47515 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47515 a!2831))))))

(declare-fun b!1425951 () Bool)

(declare-fun res!961387 () Bool)

(assert (=> b!1425951 (=> (not res!961387) (not e!805529))))

(declare-fun lt!627966 () array!97295)

(declare-fun lt!627964 () (_ BitVec 64))

(declare-fun lt!627965 () SeekEntryResult!11244)

(assert (=> b!1425951 (= res!961387 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627964 lt!627966 mask!2608) lt!627965))))

(declare-fun b!1425952 () Bool)

(assert (=> b!1425952 (= e!805526 e!805529)))

(declare-fun res!961380 () Bool)

(assert (=> b!1425952 (=> (not res!961380) (not e!805529))))

(assert (=> b!1425952 (= res!961380 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627964 mask!2608) lt!627964 lt!627966 mask!2608) lt!627965))))

(assert (=> b!1425952 (= lt!627965 (Intermediate!11244 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1425952 (= lt!627964 (select (store (arr!46965 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1425952 (= lt!627966 (array!97296 (store (arr!46965 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47515 a!2831)))))

(declare-fun b!1425953 () Bool)

(declare-fun res!961384 () Bool)

(assert (=> b!1425953 (=> (not res!961384) (not e!805528))))

(assert (=> b!1425953 (= res!961384 (validKeyInArray!0 (select (arr!46965 a!2831) j!81)))))

(declare-fun b!1425954 () Bool)

(declare-fun res!961377 () Bool)

(assert (=> b!1425954 (=> (not res!961377) (not e!805528))))

(declare-datatypes ((List!33475 0))(
  ( (Nil!33472) (Cons!33471 (h!34773 (_ BitVec 64)) (t!48169 List!33475)) )
))
(declare-fun arrayNoDuplicates!0 (array!97295 (_ BitVec 32) List!33475) Bool)

(assert (=> b!1425954 (= res!961377 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33472))))

(assert (= (and start!122930 res!961383) b!1425944))

(assert (= (and b!1425944 res!961379) b!1425945))

(assert (= (and b!1425945 res!961381) b!1425953))

(assert (= (and b!1425953 res!961384) b!1425946))

(assert (= (and b!1425946 res!961386) b!1425954))

(assert (= (and b!1425954 res!961377) b!1425950))

(assert (= (and b!1425950 res!961382) b!1425947))

(assert (= (and b!1425947 res!961385) b!1425952))

(assert (= (and b!1425952 res!961380) b!1425948))

(assert (= (and b!1425948 res!961378) b!1425951))

(assert (= (and b!1425951 res!961387) b!1425949))

(declare-fun m!1316555 () Bool)

(assert (=> b!1425945 m!1316555))

(assert (=> b!1425945 m!1316555))

(declare-fun m!1316557 () Bool)

(assert (=> b!1425945 m!1316557))

(declare-fun m!1316559 () Bool)

(assert (=> b!1425952 m!1316559))

(assert (=> b!1425952 m!1316559))

(declare-fun m!1316561 () Bool)

(assert (=> b!1425952 m!1316561))

(declare-fun m!1316563 () Bool)

(assert (=> b!1425952 m!1316563))

(declare-fun m!1316565 () Bool)

(assert (=> b!1425952 m!1316565))

(declare-fun m!1316567 () Bool)

(assert (=> b!1425948 m!1316567))

(assert (=> b!1425948 m!1316567))

(declare-fun m!1316569 () Bool)

(assert (=> b!1425948 m!1316569))

(declare-fun m!1316571 () Bool)

(assert (=> b!1425951 m!1316571))

(assert (=> b!1425953 m!1316567))

(assert (=> b!1425953 m!1316567))

(declare-fun m!1316573 () Bool)

(assert (=> b!1425953 m!1316573))

(declare-fun m!1316575 () Bool)

(assert (=> b!1425946 m!1316575))

(declare-fun m!1316577 () Bool)

(assert (=> start!122930 m!1316577))

(declare-fun m!1316579 () Bool)

(assert (=> start!122930 m!1316579))

(assert (=> b!1425947 m!1316567))

(assert (=> b!1425947 m!1316567))

(declare-fun m!1316581 () Bool)

(assert (=> b!1425947 m!1316581))

(assert (=> b!1425947 m!1316581))

(assert (=> b!1425947 m!1316567))

(declare-fun m!1316583 () Bool)

(assert (=> b!1425947 m!1316583))

(declare-fun m!1316585 () Bool)

(assert (=> b!1425954 m!1316585))

(check-sat (not b!1425951) (not b!1425953) (not b!1425947) (not start!122930) (not b!1425948) (not b!1425952) (not b!1425945) (not b!1425954) (not b!1425946))
(check-sat)
