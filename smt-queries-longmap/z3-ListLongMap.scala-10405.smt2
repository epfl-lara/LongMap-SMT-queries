; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122594 () Bool)

(assert start!122594)

(declare-fun b!1419931 () Bool)

(declare-fun res!955368 () Bool)

(declare-fun e!803258 () Bool)

(assert (=> b!1419931 (=> (not res!955368) (not e!803258))))

(declare-datatypes ((array!96959 0))(
  ( (array!96960 (arr!46797 (Array (_ BitVec 32) (_ BitVec 64))) (size!47347 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96959)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419931 (= res!955368 (validKeyInArray!0 (select (arr!46797 a!2831) j!81)))))

(declare-fun b!1419932 () Bool)

(declare-fun res!955369 () Bool)

(assert (=> b!1419932 (=> (not res!955369) (not e!803258))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1419932 (= res!955369 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47347 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47347 a!2831))))))

(declare-fun b!1419933 () Bool)

(declare-fun res!955371 () Bool)

(assert (=> b!1419933 (=> (not res!955371) (not e!803258))))

(declare-datatypes ((List!33307 0))(
  ( (Nil!33304) (Cons!33303 (h!34605 (_ BitVec 64)) (t!48001 List!33307)) )
))
(declare-fun arrayNoDuplicates!0 (array!96959 (_ BitVec 32) List!33307) Bool)

(assert (=> b!1419933 (= res!955371 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33304))))

(declare-fun b!1419934 () Bool)

(declare-fun res!955366 () Bool)

(assert (=> b!1419934 (=> (not res!955366) (not e!803258))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419934 (= res!955366 (and (= (size!47347 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47347 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47347 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419935 () Bool)

(assert (=> b!1419935 (= e!803258 (and (bvsge mask!2608 #b00000000000000000000000000000000) (bvsge index!585 (bvadd #b00000000000000000000000000000001 mask!2608))))))

(declare-fun res!955367 () Bool)

(assert (=> start!122594 (=> (not res!955367) (not e!803258))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122594 (= res!955367 (validMask!0 mask!2608))))

(assert (=> start!122594 e!803258))

(assert (=> start!122594 true))

(declare-fun array_inv!35825 (array!96959) Bool)

(assert (=> start!122594 (array_inv!35825 a!2831)))

(declare-fun b!1419936 () Bool)

(declare-fun res!955364 () Bool)

(assert (=> b!1419936 (=> (not res!955364) (not e!803258))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11082 0))(
  ( (MissingZero!11082 (index!46720 (_ BitVec 32))) (Found!11082 (index!46721 (_ BitVec 32))) (Intermediate!11082 (undefined!11894 Bool) (index!46722 (_ BitVec 32)) (x!128388 (_ BitVec 32))) (Undefined!11082) (MissingVacant!11082 (index!46723 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96959 (_ BitVec 32)) SeekEntryResult!11082)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419936 (= res!955364 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46797 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46797 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96960 (store (arr!46797 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47347 a!2831)) mask!2608) (Intermediate!11082 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1419937 () Bool)

(declare-fun res!955372 () Bool)

(assert (=> b!1419937 (=> (not res!955372) (not e!803258))))

(assert (=> b!1419937 (= res!955372 (validKeyInArray!0 (select (arr!46797 a!2831) i!982)))))

(declare-fun b!1419938 () Bool)

(declare-fun res!955365 () Bool)

(assert (=> b!1419938 (=> (not res!955365) (not e!803258))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96959 (_ BitVec 32)) Bool)

(assert (=> b!1419938 (= res!955365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419939 () Bool)

(declare-fun res!955370 () Bool)

(assert (=> b!1419939 (=> (not res!955370) (not e!803258))))

(assert (=> b!1419939 (= res!955370 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46797 a!2831) j!81) mask!2608) (select (arr!46797 a!2831) j!81) a!2831 mask!2608) (Intermediate!11082 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(assert (= (and start!122594 res!955367) b!1419934))

(assert (= (and b!1419934 res!955366) b!1419937))

(assert (= (and b!1419937 res!955372) b!1419931))

(assert (= (and b!1419931 res!955368) b!1419938))

(assert (= (and b!1419938 res!955365) b!1419933))

(assert (= (and b!1419933 res!955371) b!1419932))

(assert (= (and b!1419932 res!955369) b!1419939))

(assert (= (and b!1419939 res!955370) b!1419936))

(assert (= (and b!1419936 res!955364) b!1419935))

(declare-fun m!1310401 () Bool)

(assert (=> b!1419938 m!1310401))

(declare-fun m!1310403 () Bool)

(assert (=> b!1419939 m!1310403))

(assert (=> b!1419939 m!1310403))

(declare-fun m!1310405 () Bool)

(assert (=> b!1419939 m!1310405))

(assert (=> b!1419939 m!1310405))

(assert (=> b!1419939 m!1310403))

(declare-fun m!1310407 () Bool)

(assert (=> b!1419939 m!1310407))

(declare-fun m!1310409 () Bool)

(assert (=> b!1419936 m!1310409))

(declare-fun m!1310411 () Bool)

(assert (=> b!1419936 m!1310411))

(assert (=> b!1419936 m!1310411))

(declare-fun m!1310413 () Bool)

(assert (=> b!1419936 m!1310413))

(assert (=> b!1419936 m!1310413))

(assert (=> b!1419936 m!1310411))

(declare-fun m!1310415 () Bool)

(assert (=> b!1419936 m!1310415))

(assert (=> b!1419931 m!1310403))

(assert (=> b!1419931 m!1310403))

(declare-fun m!1310417 () Bool)

(assert (=> b!1419931 m!1310417))

(declare-fun m!1310419 () Bool)

(assert (=> start!122594 m!1310419))

(declare-fun m!1310421 () Bool)

(assert (=> start!122594 m!1310421))

(declare-fun m!1310423 () Bool)

(assert (=> b!1419933 m!1310423))

(declare-fun m!1310425 () Bool)

(assert (=> b!1419937 m!1310425))

(assert (=> b!1419937 m!1310425))

(declare-fun m!1310427 () Bool)

(assert (=> b!1419937 m!1310427))

(check-sat (not b!1419938) (not b!1419939) (not b!1419936) (not b!1419931) (not b!1419933) (not b!1419937) (not start!122594))
(check-sat)
