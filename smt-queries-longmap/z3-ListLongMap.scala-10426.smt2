; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122720 () Bool)

(assert start!122720)

(declare-fun res!957367 () Bool)

(declare-fun e!803922 () Bool)

(assert (=> start!122720 (=> (not res!957367) (not e!803922))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122720 (= res!957367 (validMask!0 mask!2608))))

(assert (=> start!122720 e!803922))

(assert (=> start!122720 true))

(declare-datatypes ((array!97085 0))(
  ( (array!97086 (arr!46860 (Array (_ BitVec 32) (_ BitVec 64))) (size!47410 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97085)

(declare-fun array_inv!35888 (array!97085) Bool)

(assert (=> start!122720 (array_inv!35888 a!2831)))

(declare-fun b!1421931 () Bool)

(declare-fun e!803923 () Bool)

(assert (=> b!1421931 (= e!803923 (not true))))

(declare-fun e!803921 () Bool)

(assert (=> b!1421931 e!803921))

(declare-fun res!957370 () Bool)

(assert (=> b!1421931 (=> (not res!957370) (not e!803921))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97085 (_ BitVec 32)) Bool)

(assert (=> b!1421931 (= res!957370 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48126 0))(
  ( (Unit!48127) )
))
(declare-fun lt!626460 () Unit!48126)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97085 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48126)

(assert (=> b!1421931 (= lt!626460 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1421932 () Bool)

(declare-fun res!957368 () Bool)

(assert (=> b!1421932 (=> (not res!957368) (not e!803922))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421932 (= res!957368 (validKeyInArray!0 (select (arr!46860 a!2831) j!81)))))

(declare-fun b!1421933 () Bool)

(declare-fun res!957369 () Bool)

(assert (=> b!1421933 (=> (not res!957369) (not e!803922))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1421933 (= res!957369 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47410 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47410 a!2831))))))

(declare-fun b!1421934 () Bool)

(declare-fun res!957373 () Bool)

(assert (=> b!1421934 (=> (not res!957373) (not e!803923))))

(declare-datatypes ((SeekEntryResult!11145 0))(
  ( (MissingZero!11145 (index!46972 (_ BitVec 32))) (Found!11145 (index!46973 (_ BitVec 32))) (Intermediate!11145 (undefined!11957 Bool) (index!46974 (_ BitVec 32)) (x!128619 (_ BitVec 32))) (Undefined!11145) (MissingVacant!11145 (index!46975 (_ BitVec 32))) )
))
(declare-fun lt!626459 () SeekEntryResult!11145)

(declare-fun lt!626456 () (_ BitVec 64))

(declare-fun lt!626457 () array!97085)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97085 (_ BitVec 32)) SeekEntryResult!11145)

(assert (=> b!1421934 (= res!957373 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626456 lt!626457 mask!2608) lt!626459))))

(declare-fun b!1421935 () Bool)

(declare-fun res!957374 () Bool)

(assert (=> b!1421935 (=> (not res!957374) (not e!803922))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421935 (= res!957374 (validKeyInArray!0 (select (arr!46860 a!2831) i!982)))))

(declare-fun b!1421936 () Bool)

(declare-fun res!957366 () Bool)

(assert (=> b!1421936 (=> (not res!957366) (not e!803922))))

(assert (=> b!1421936 (= res!957366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421937 () Bool)

(declare-fun res!957375 () Bool)

(assert (=> b!1421937 (=> (not res!957375) (not e!803922))))

(assert (=> b!1421937 (= res!957375 (and (= (size!47410 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47410 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47410 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421938 () Bool)

(declare-fun res!957371 () Bool)

(assert (=> b!1421938 (=> (not res!957371) (not e!803922))))

(declare-datatypes ((List!33370 0))(
  ( (Nil!33367) (Cons!33366 (h!34668 (_ BitVec 64)) (t!48064 List!33370)) )
))
(declare-fun arrayNoDuplicates!0 (array!97085 (_ BitVec 32) List!33370) Bool)

(assert (=> b!1421938 (= res!957371 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33367))))

(declare-fun b!1421939 () Bool)

(declare-fun res!957372 () Bool)

(assert (=> b!1421939 (=> (not res!957372) (not e!803923))))

(declare-fun lt!626458 () SeekEntryResult!11145)

(assert (=> b!1421939 (= res!957372 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46860 a!2831) j!81) a!2831 mask!2608) lt!626458))))

(declare-fun b!1421940 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97085 (_ BitVec 32)) SeekEntryResult!11145)

(assert (=> b!1421940 (= e!803921 (= (seekEntryOrOpen!0 (select (arr!46860 a!2831) j!81) a!2831 mask!2608) (Found!11145 j!81)))))

(declare-fun b!1421941 () Bool)

(declare-fun e!803920 () Bool)

(assert (=> b!1421941 (= e!803920 e!803923)))

(declare-fun res!957364 () Bool)

(assert (=> b!1421941 (=> (not res!957364) (not e!803923))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421941 (= res!957364 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626456 mask!2608) lt!626456 lt!626457 mask!2608) lt!626459))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1421941 (= lt!626459 (Intermediate!11145 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1421941 (= lt!626456 (select (store (arr!46860 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421941 (= lt!626457 (array!97086 (store (arr!46860 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47410 a!2831)))))

(declare-fun b!1421942 () Bool)

(declare-fun res!957365 () Bool)

(assert (=> b!1421942 (=> (not res!957365) (not e!803923))))

(assert (=> b!1421942 (= res!957365 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1421943 () Bool)

(assert (=> b!1421943 (= e!803922 e!803920)))

(declare-fun res!957376 () Bool)

(assert (=> b!1421943 (=> (not res!957376) (not e!803920))))

(assert (=> b!1421943 (= res!957376 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46860 a!2831) j!81) mask!2608) (select (arr!46860 a!2831) j!81) a!2831 mask!2608) lt!626458))))

(assert (=> b!1421943 (= lt!626458 (Intermediate!11145 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!122720 res!957367) b!1421937))

(assert (= (and b!1421937 res!957375) b!1421935))

(assert (= (and b!1421935 res!957374) b!1421932))

(assert (= (and b!1421932 res!957368) b!1421936))

(assert (= (and b!1421936 res!957366) b!1421938))

(assert (= (and b!1421938 res!957371) b!1421933))

(assert (= (and b!1421933 res!957369) b!1421943))

(assert (= (and b!1421943 res!957376) b!1421941))

(assert (= (and b!1421941 res!957364) b!1421939))

(assert (= (and b!1421939 res!957372) b!1421934))

(assert (= (and b!1421934 res!957373) b!1421942))

(assert (= (and b!1421942 res!957365) b!1421931))

(assert (= (and b!1421931 res!957370) b!1421940))

(declare-fun m!1312487 () Bool)

(assert (=> b!1421932 m!1312487))

(assert (=> b!1421932 m!1312487))

(declare-fun m!1312489 () Bool)

(assert (=> b!1421932 m!1312489))

(declare-fun m!1312491 () Bool)

(assert (=> b!1421934 m!1312491))

(declare-fun m!1312493 () Bool)

(assert (=> b!1421935 m!1312493))

(assert (=> b!1421935 m!1312493))

(declare-fun m!1312495 () Bool)

(assert (=> b!1421935 m!1312495))

(declare-fun m!1312497 () Bool)

(assert (=> start!122720 m!1312497))

(declare-fun m!1312499 () Bool)

(assert (=> start!122720 m!1312499))

(assert (=> b!1421943 m!1312487))

(assert (=> b!1421943 m!1312487))

(declare-fun m!1312501 () Bool)

(assert (=> b!1421943 m!1312501))

(assert (=> b!1421943 m!1312501))

(assert (=> b!1421943 m!1312487))

(declare-fun m!1312503 () Bool)

(assert (=> b!1421943 m!1312503))

(assert (=> b!1421940 m!1312487))

(assert (=> b!1421940 m!1312487))

(declare-fun m!1312505 () Bool)

(assert (=> b!1421940 m!1312505))

(declare-fun m!1312507 () Bool)

(assert (=> b!1421941 m!1312507))

(assert (=> b!1421941 m!1312507))

(declare-fun m!1312509 () Bool)

(assert (=> b!1421941 m!1312509))

(declare-fun m!1312511 () Bool)

(assert (=> b!1421941 m!1312511))

(declare-fun m!1312513 () Bool)

(assert (=> b!1421941 m!1312513))

(declare-fun m!1312515 () Bool)

(assert (=> b!1421938 m!1312515))

(declare-fun m!1312517 () Bool)

(assert (=> b!1421931 m!1312517))

(declare-fun m!1312519 () Bool)

(assert (=> b!1421931 m!1312519))

(assert (=> b!1421939 m!1312487))

(assert (=> b!1421939 m!1312487))

(declare-fun m!1312521 () Bool)

(assert (=> b!1421939 m!1312521))

(declare-fun m!1312523 () Bool)

(assert (=> b!1421936 m!1312523))

(check-sat (not b!1421938) (not b!1421940) (not b!1421943) (not start!122720) (not b!1421936) (not b!1421939) (not b!1421932) (not b!1421935) (not b!1421934) (not b!1421941) (not b!1421931))
(check-sat)
