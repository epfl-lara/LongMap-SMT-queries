; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123866 () Bool)

(assert start!123866)

(declare-fun b!1435353 () Bool)

(declare-fun e!810095 () Bool)

(assert (=> b!1435353 (= e!810095 true)))

(declare-fun lt!631848 () (_ BitVec 32))

(declare-datatypes ((array!97610 0))(
  ( (array!97611 (arr!47106 (Array (_ BitVec 32) (_ BitVec 64))) (size!47656 (_ BitVec 32))) )
))
(declare-fun lt!631851 () array!97610)

(declare-datatypes ((SeekEntryResult!11385 0))(
  ( (MissingZero!11385 (index!47932 (_ BitVec 32))) (Found!11385 (index!47933 (_ BitVec 32))) (Intermediate!11385 (undefined!12197 Bool) (index!47934 (_ BitVec 32)) (x!129599 (_ BitVec 32))) (Undefined!11385) (MissingVacant!11385 (index!47935 (_ BitVec 32))) )
))
(declare-fun lt!631850 () SeekEntryResult!11385)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!631852 () (_ BitVec 64))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97610 (_ BitVec 32)) SeekEntryResult!11385)

(assert (=> b!1435353 (= lt!631850 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631848 lt!631852 lt!631851 mask!2608))))

(declare-fun b!1435354 () Bool)

(declare-fun res!968365 () Bool)

(declare-fun e!810094 () Bool)

(assert (=> b!1435354 (=> (not res!968365) (not e!810094))))

(declare-fun a!2831 () array!97610)

(declare-datatypes ((List!33616 0))(
  ( (Nil!33613) (Cons!33612 (h!34947 (_ BitVec 64)) (t!48310 List!33616)) )
))
(declare-fun arrayNoDuplicates!0 (array!97610 (_ BitVec 32) List!33616) Bool)

(assert (=> b!1435354 (= res!968365 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33613))))

(declare-fun b!1435355 () Bool)

(declare-fun res!968373 () Bool)

(assert (=> b!1435355 (=> (not res!968373) (not e!810094))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97610 (_ BitVec 32)) Bool)

(assert (=> b!1435355 (= res!968373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1435356 () Bool)

(declare-fun res!968363 () Bool)

(declare-fun e!810097 () Bool)

(assert (=> b!1435356 (=> (not res!968363) (not e!810097))))

(declare-fun lt!631849 () SeekEntryResult!11385)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1435356 (= res!968363 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631852 lt!631851 mask!2608) lt!631849))))

(declare-fun b!1435357 () Bool)

(declare-fun res!968366 () Bool)

(assert (=> b!1435357 (=> (not res!968366) (not e!810094))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1435357 (= res!968366 (and (= (size!47656 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47656 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47656 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1435358 () Bool)

(declare-fun e!810096 () Bool)

(assert (=> b!1435358 (= e!810094 e!810096)))

(declare-fun res!968360 () Bool)

(assert (=> b!1435358 (=> (not res!968360) (not e!810096))))

(declare-fun lt!631853 () SeekEntryResult!11385)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1435358 (= res!968360 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47106 a!2831) j!81) mask!2608) (select (arr!47106 a!2831) j!81) a!2831 mask!2608) lt!631853))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1435358 (= lt!631853 (Intermediate!11385 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1435359 () Bool)

(declare-fun e!810098 () Bool)

(assert (=> b!1435359 (= e!810097 (not e!810098))))

(declare-fun res!968364 () Bool)

(assert (=> b!1435359 (=> res!968364 e!810098)))

(assert (=> b!1435359 (= res!968364 (or (= (select (arr!47106 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47106 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47106 a!2831) index!585) (select (arr!47106 a!2831) j!81)) (= (select (store (arr!47106 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!810093 () Bool)

(assert (=> b!1435359 e!810093))

(declare-fun res!968371 () Bool)

(assert (=> b!1435359 (=> (not res!968371) (not e!810093))))

(assert (=> b!1435359 (= res!968371 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48516 0))(
  ( (Unit!48517) )
))
(declare-fun lt!631854 () Unit!48516)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97610 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48516)

(assert (=> b!1435359 (= lt!631854 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1435360 () Bool)

(declare-fun res!968368 () Bool)

(assert (=> b!1435360 (=> (not res!968368) (not e!810094))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435360 (= res!968368 (validKeyInArray!0 (select (arr!47106 a!2831) i!982)))))

(declare-fun b!1435361 () Bool)

(assert (=> b!1435361 (= e!810096 e!810097)))

(declare-fun res!968372 () Bool)

(assert (=> b!1435361 (=> (not res!968372) (not e!810097))))

(assert (=> b!1435361 (= res!968372 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631852 mask!2608) lt!631852 lt!631851 mask!2608) lt!631849))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1435361 (= lt!631849 (Intermediate!11385 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1435361 (= lt!631852 (select (store (arr!47106 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1435361 (= lt!631851 (array!97611 (store (arr!47106 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47656 a!2831)))))

(declare-fun b!1435362 () Bool)

(declare-fun res!968367 () Bool)

(assert (=> b!1435362 (=> (not res!968367) (not e!810094))))

(assert (=> b!1435362 (= res!968367 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47656 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47656 a!2831))))))

(declare-fun res!968370 () Bool)

(assert (=> start!123866 (=> (not res!968370) (not e!810094))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123866 (= res!968370 (validMask!0 mask!2608))))

(assert (=> start!123866 e!810094))

(assert (=> start!123866 true))

(declare-fun array_inv!36134 (array!97610) Bool)

(assert (=> start!123866 (array_inv!36134 a!2831)))

(declare-fun b!1435363 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97610 (_ BitVec 32)) SeekEntryResult!11385)

(assert (=> b!1435363 (= e!810093 (= (seekEntryOrOpen!0 (select (arr!47106 a!2831) j!81) a!2831 mask!2608) (Found!11385 j!81)))))

(declare-fun b!1435364 () Bool)

(declare-fun res!968361 () Bool)

(assert (=> b!1435364 (=> (not res!968361) (not e!810094))))

(assert (=> b!1435364 (= res!968361 (validKeyInArray!0 (select (arr!47106 a!2831) j!81)))))

(declare-fun b!1435365 () Bool)

(declare-fun res!968369 () Bool)

(assert (=> b!1435365 (=> (not res!968369) (not e!810097))))

(assert (=> b!1435365 (= res!968369 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47106 a!2831) j!81) a!2831 mask!2608) lt!631853))))

(declare-fun b!1435366 () Bool)

(declare-fun res!968362 () Bool)

(assert (=> b!1435366 (=> (not res!968362) (not e!810097))))

(assert (=> b!1435366 (= res!968362 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1435367 () Bool)

(declare-fun res!968374 () Bool)

(assert (=> b!1435367 (=> res!968374 e!810095)))

(assert (=> b!1435367 (= res!968374 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631848 (select (arr!47106 a!2831) j!81) a!2831 mask!2608) lt!631853)))))

(declare-fun b!1435368 () Bool)

(assert (=> b!1435368 (= e!810098 e!810095)))

(declare-fun res!968359 () Bool)

(assert (=> b!1435368 (=> res!968359 e!810095)))

(assert (=> b!1435368 (= res!968359 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!631848 #b00000000000000000000000000000000) (bvsge lt!631848 (size!47656 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1435368 (= lt!631848 (nextIndex!0 index!585 x!605 mask!2608))))

(assert (= (and start!123866 res!968370) b!1435357))

(assert (= (and b!1435357 res!968366) b!1435360))

(assert (= (and b!1435360 res!968368) b!1435364))

(assert (= (and b!1435364 res!968361) b!1435355))

(assert (= (and b!1435355 res!968373) b!1435354))

(assert (= (and b!1435354 res!968365) b!1435362))

(assert (= (and b!1435362 res!968367) b!1435358))

(assert (= (and b!1435358 res!968360) b!1435361))

(assert (= (and b!1435361 res!968372) b!1435365))

(assert (= (and b!1435365 res!968369) b!1435356))

(assert (= (and b!1435356 res!968363) b!1435366))

(assert (= (and b!1435366 res!968362) b!1435359))

(assert (= (and b!1435359 res!968371) b!1435363))

(assert (= (and b!1435359 (not res!968364)) b!1435368))

(assert (= (and b!1435368 (not res!968359)) b!1435367))

(assert (= (and b!1435367 (not res!968374)) b!1435353))

(declare-fun m!1324713 () Bool)

(assert (=> b!1435353 m!1324713))

(declare-fun m!1324715 () Bool)

(assert (=> b!1435367 m!1324715))

(assert (=> b!1435367 m!1324715))

(declare-fun m!1324717 () Bool)

(assert (=> b!1435367 m!1324717))

(declare-fun m!1324719 () Bool)

(assert (=> b!1435354 m!1324719))

(declare-fun m!1324721 () Bool)

(assert (=> b!1435361 m!1324721))

(assert (=> b!1435361 m!1324721))

(declare-fun m!1324723 () Bool)

(assert (=> b!1435361 m!1324723))

(declare-fun m!1324725 () Bool)

(assert (=> b!1435361 m!1324725))

(declare-fun m!1324727 () Bool)

(assert (=> b!1435361 m!1324727))

(assert (=> b!1435363 m!1324715))

(assert (=> b!1435363 m!1324715))

(declare-fun m!1324729 () Bool)

(assert (=> b!1435363 m!1324729))

(declare-fun m!1324731 () Bool)

(assert (=> b!1435355 m!1324731))

(assert (=> b!1435358 m!1324715))

(assert (=> b!1435358 m!1324715))

(declare-fun m!1324733 () Bool)

(assert (=> b!1435358 m!1324733))

(assert (=> b!1435358 m!1324733))

(assert (=> b!1435358 m!1324715))

(declare-fun m!1324735 () Bool)

(assert (=> b!1435358 m!1324735))

(declare-fun m!1324737 () Bool)

(assert (=> b!1435360 m!1324737))

(assert (=> b!1435360 m!1324737))

(declare-fun m!1324739 () Bool)

(assert (=> b!1435360 m!1324739))

(assert (=> b!1435364 m!1324715))

(assert (=> b!1435364 m!1324715))

(declare-fun m!1324741 () Bool)

(assert (=> b!1435364 m!1324741))

(declare-fun m!1324743 () Bool)

(assert (=> b!1435356 m!1324743))

(assert (=> b!1435365 m!1324715))

(assert (=> b!1435365 m!1324715))

(declare-fun m!1324745 () Bool)

(assert (=> b!1435365 m!1324745))

(assert (=> b!1435359 m!1324725))

(declare-fun m!1324747 () Bool)

(assert (=> b!1435359 m!1324747))

(declare-fun m!1324749 () Bool)

(assert (=> b!1435359 m!1324749))

(declare-fun m!1324751 () Bool)

(assert (=> b!1435359 m!1324751))

(assert (=> b!1435359 m!1324715))

(declare-fun m!1324753 () Bool)

(assert (=> b!1435359 m!1324753))

(declare-fun m!1324755 () Bool)

(assert (=> b!1435368 m!1324755))

(declare-fun m!1324757 () Bool)

(assert (=> start!123866 m!1324757))

(declare-fun m!1324759 () Bool)

(assert (=> start!123866 m!1324759))

(check-sat (not b!1435358) (not start!123866) (not b!1435360) (not b!1435363) (not b!1435354) (not b!1435359) (not b!1435356) (not b!1435365) (not b!1435355) (not b!1435368) (not b!1435367) (not b!1435364) (not b!1435361) (not b!1435353))
(check-sat)
