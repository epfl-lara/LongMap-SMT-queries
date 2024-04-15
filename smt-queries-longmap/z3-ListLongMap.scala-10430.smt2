; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122738 () Bool)

(assert start!122738)

(declare-fun b!1422366 () Bool)

(declare-fun res!957858 () Bool)

(declare-fun e!804109 () Bool)

(assert (=> b!1422366 (=> (not res!957858) (not e!804109))))

(declare-datatypes ((array!97056 0))(
  ( (array!97057 (arr!46846 (Array (_ BitVec 32) (_ BitVec 64))) (size!47398 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97056)

(declare-datatypes ((List!33434 0))(
  ( (Nil!33431) (Cons!33430 (h!34732 (_ BitVec 64)) (t!48120 List!33434)) )
))
(declare-fun arrayNoDuplicates!0 (array!97056 (_ BitVec 32) List!33434) Bool)

(assert (=> b!1422366 (= res!957858 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33431))))

(declare-fun b!1422367 () Bool)

(declare-fun e!804108 () Bool)

(declare-fun e!804107 () Bool)

(assert (=> b!1422367 (= e!804108 e!804107)))

(declare-fun res!957852 () Bool)

(assert (=> b!1422367 (=> (not res!957852) (not e!804107))))

(declare-fun lt!626494 () array!97056)

(declare-datatypes ((SeekEntryResult!11158 0))(
  ( (MissingZero!11158 (index!47024 (_ BitVec 32))) (Found!11158 (index!47025 (_ BitVec 32))) (Intermediate!11158 (undefined!11970 Bool) (index!47026 (_ BitVec 32)) (x!128661 (_ BitVec 32))) (Undefined!11158) (MissingVacant!11158 (index!47027 (_ BitVec 32))) )
))
(declare-fun lt!626495 () SeekEntryResult!11158)

(declare-fun lt!626491 () (_ BitVec 64))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97056 (_ BitVec 32)) SeekEntryResult!11158)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422367 (= res!957852 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626491 mask!2608) lt!626491 lt!626494 mask!2608) lt!626495))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1422367 (= lt!626495 (Intermediate!11158 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1422367 (= lt!626491 (select (store (arr!46846 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422367 (= lt!626494 (array!97057 (store (arr!46846 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47398 a!2831)))))

(declare-fun b!1422368 () Bool)

(declare-fun res!957862 () Bool)

(declare-fun e!804105 () Bool)

(assert (=> b!1422368 (=> res!957862 e!804105)))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!626490 () SeekEntryResult!11158)

(declare-fun lt!626492 () (_ BitVec 32))

(assert (=> b!1422368 (= res!957862 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626492 (select (arr!46846 a!2831) j!81) a!2831 mask!2608) lt!626490)))))

(declare-fun b!1422369 () Bool)

(declare-fun res!957859 () Bool)

(assert (=> b!1422369 (=> (not res!957859) (not e!804107))))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1422369 (= res!957859 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626491 lt!626494 mask!2608) lt!626495))))

(declare-fun b!1422370 () Bool)

(assert (=> b!1422370 (= e!804105 true)))

(declare-fun lt!626489 () SeekEntryResult!11158)

(assert (=> b!1422370 (= lt!626489 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626492 lt!626491 lt!626494 mask!2608))))

(declare-fun res!957861 () Bool)

(assert (=> start!122738 (=> (not res!957861) (not e!804109))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122738 (= res!957861 (validMask!0 mask!2608))))

(assert (=> start!122738 e!804109))

(assert (=> start!122738 true))

(declare-fun array_inv!36079 (array!97056) Bool)

(assert (=> start!122738 (array_inv!36079 a!2831)))

(declare-fun b!1422371 () Bool)

(declare-fun res!957860 () Bool)

(assert (=> b!1422371 (=> (not res!957860) (not e!804109))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422371 (= res!957860 (validKeyInArray!0 (select (arr!46846 a!2831) j!81)))))

(declare-fun b!1422372 () Bool)

(assert (=> b!1422372 (= e!804109 e!804108)))

(declare-fun res!957864 () Bool)

(assert (=> b!1422372 (=> (not res!957864) (not e!804108))))

(assert (=> b!1422372 (= res!957864 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46846 a!2831) j!81) mask!2608) (select (arr!46846 a!2831) j!81) a!2831 mask!2608) lt!626490))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1422372 (= lt!626490 (Intermediate!11158 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1422373 () Bool)

(declare-fun res!957850 () Bool)

(assert (=> b!1422373 (=> (not res!957850) (not e!804107))))

(assert (=> b!1422373 (= res!957850 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46846 a!2831) j!81) a!2831 mask!2608) lt!626490))))

(declare-fun b!1422374 () Bool)

(declare-fun e!804104 () Bool)

(assert (=> b!1422374 (= e!804107 (not e!804104))))

(declare-fun res!957857 () Bool)

(assert (=> b!1422374 (=> res!957857 e!804104)))

(assert (=> b!1422374 (= res!957857 (or (= (select (arr!46846 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46846 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46846 a!2831) index!585) (select (arr!46846 a!2831) j!81)) (= (select (store (arr!46846 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!804110 () Bool)

(assert (=> b!1422374 e!804110))

(declare-fun res!957865 () Bool)

(assert (=> b!1422374 (=> (not res!957865) (not e!804110))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97056 (_ BitVec 32)) Bool)

(assert (=> b!1422374 (= res!957865 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!47991 0))(
  ( (Unit!47992) )
))
(declare-fun lt!626493 () Unit!47991)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97056 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47991)

(assert (=> b!1422374 (= lt!626493 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422375 () Bool)

(assert (=> b!1422375 (= e!804104 e!804105)))

(declare-fun res!957863 () Bool)

(assert (=> b!1422375 (=> res!957863 e!804105)))

(assert (=> b!1422375 (= res!957863 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626492 #b00000000000000000000000000000000) (bvsge lt!626492 (size!47398 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422375 (= lt!626492 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1422376 () Bool)

(declare-fun res!957855 () Bool)

(assert (=> b!1422376 (=> (not res!957855) (not e!804109))))

(assert (=> b!1422376 (= res!957855 (and (= (size!47398 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47398 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47398 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1422377 () Bool)

(declare-fun res!957853 () Bool)

(assert (=> b!1422377 (=> (not res!957853) (not e!804109))))

(assert (=> b!1422377 (= res!957853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1422378 () Bool)

(declare-fun res!957856 () Bool)

(assert (=> b!1422378 (=> (not res!957856) (not e!804109))))

(assert (=> b!1422378 (= res!957856 (validKeyInArray!0 (select (arr!46846 a!2831) i!982)))))

(declare-fun b!1422379 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97056 (_ BitVec 32)) SeekEntryResult!11158)

(assert (=> b!1422379 (= e!804110 (= (seekEntryOrOpen!0 (select (arr!46846 a!2831) j!81) a!2831 mask!2608) (Found!11158 j!81)))))

(declare-fun b!1422380 () Bool)

(declare-fun res!957851 () Bool)

(assert (=> b!1422380 (=> (not res!957851) (not e!804107))))

(assert (=> b!1422380 (= res!957851 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1422381 () Bool)

(declare-fun res!957854 () Bool)

(assert (=> b!1422381 (=> (not res!957854) (not e!804109))))

(assert (=> b!1422381 (= res!957854 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47398 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47398 a!2831))))))

(assert (= (and start!122738 res!957861) b!1422376))

(assert (= (and b!1422376 res!957855) b!1422378))

(assert (= (and b!1422378 res!957856) b!1422371))

(assert (= (and b!1422371 res!957860) b!1422377))

(assert (= (and b!1422377 res!957853) b!1422366))

(assert (= (and b!1422366 res!957858) b!1422381))

(assert (= (and b!1422381 res!957854) b!1422372))

(assert (= (and b!1422372 res!957864) b!1422367))

(assert (= (and b!1422367 res!957852) b!1422373))

(assert (= (and b!1422373 res!957850) b!1422369))

(assert (= (and b!1422369 res!957859) b!1422380))

(assert (= (and b!1422380 res!957851) b!1422374))

(assert (= (and b!1422374 res!957865) b!1422379))

(assert (= (and b!1422374 (not res!957857)) b!1422375))

(assert (= (and b!1422375 (not res!957863)) b!1422368))

(assert (= (and b!1422368 (not res!957862)) b!1422370))

(declare-fun m!1312443 () Bool)

(assert (=> b!1422373 m!1312443))

(assert (=> b!1422373 m!1312443))

(declare-fun m!1312445 () Bool)

(assert (=> b!1422373 m!1312445))

(assert (=> b!1422368 m!1312443))

(assert (=> b!1422368 m!1312443))

(declare-fun m!1312447 () Bool)

(assert (=> b!1422368 m!1312447))

(assert (=> b!1422379 m!1312443))

(assert (=> b!1422379 m!1312443))

(declare-fun m!1312449 () Bool)

(assert (=> b!1422379 m!1312449))

(declare-fun m!1312451 () Bool)

(assert (=> b!1422375 m!1312451))

(assert (=> b!1422371 m!1312443))

(assert (=> b!1422371 m!1312443))

(declare-fun m!1312453 () Bool)

(assert (=> b!1422371 m!1312453))

(declare-fun m!1312455 () Bool)

(assert (=> start!122738 m!1312455))

(declare-fun m!1312457 () Bool)

(assert (=> start!122738 m!1312457))

(declare-fun m!1312459 () Bool)

(assert (=> b!1422366 m!1312459))

(declare-fun m!1312461 () Bool)

(assert (=> b!1422374 m!1312461))

(declare-fun m!1312463 () Bool)

(assert (=> b!1422374 m!1312463))

(declare-fun m!1312465 () Bool)

(assert (=> b!1422374 m!1312465))

(declare-fun m!1312467 () Bool)

(assert (=> b!1422374 m!1312467))

(assert (=> b!1422374 m!1312443))

(declare-fun m!1312469 () Bool)

(assert (=> b!1422374 m!1312469))

(declare-fun m!1312471 () Bool)

(assert (=> b!1422367 m!1312471))

(assert (=> b!1422367 m!1312471))

(declare-fun m!1312473 () Bool)

(assert (=> b!1422367 m!1312473))

(assert (=> b!1422367 m!1312461))

(declare-fun m!1312475 () Bool)

(assert (=> b!1422367 m!1312475))

(declare-fun m!1312477 () Bool)

(assert (=> b!1422370 m!1312477))

(declare-fun m!1312479 () Bool)

(assert (=> b!1422378 m!1312479))

(assert (=> b!1422378 m!1312479))

(declare-fun m!1312481 () Bool)

(assert (=> b!1422378 m!1312481))

(declare-fun m!1312483 () Bool)

(assert (=> b!1422377 m!1312483))

(declare-fun m!1312485 () Bool)

(assert (=> b!1422369 m!1312485))

(assert (=> b!1422372 m!1312443))

(assert (=> b!1422372 m!1312443))

(declare-fun m!1312487 () Bool)

(assert (=> b!1422372 m!1312487))

(assert (=> b!1422372 m!1312487))

(assert (=> b!1422372 m!1312443))

(declare-fun m!1312489 () Bool)

(assert (=> b!1422372 m!1312489))

(check-sat (not b!1422373) (not b!1422369) (not start!122738) (not b!1422378) (not b!1422372) (not b!1422370) (not b!1422377) (not b!1422366) (not b!1422371) (not b!1422374) (not b!1422368) (not b!1422379) (not b!1422375) (not b!1422367))
(check-sat)
