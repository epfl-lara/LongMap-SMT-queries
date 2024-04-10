; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122630 () Bool)

(assert start!122630)

(declare-fun b!1420413 () Bool)

(declare-fun res!955846 () Bool)

(declare-fun e!803380 () Bool)

(assert (=> b!1420413 (=> (not res!955846) (not e!803380))))

(declare-datatypes ((array!96995 0))(
  ( (array!96996 (arr!46815 (Array (_ BitVec 32) (_ BitVec 64))) (size!47365 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96995)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420413 (= res!955846 (validKeyInArray!0 (select (arr!46815 a!2831) j!81)))))

(declare-fun b!1420414 () Bool)

(declare-fun e!803379 () Bool)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420414 (= e!803379 (and (bvsge mask!2608 #b00000000000000000000000000000000) (bvsge index!585 (bvadd #b00000000000000000000000000000001 mask!2608))))))

(declare-fun b!1420415 () Bool)

(declare-fun res!955854 () Bool)

(assert (=> b!1420415 (=> (not res!955854) (not e!803380))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1420415 (= res!955854 (validKeyInArray!0 (select (arr!46815 a!2831) i!982)))))

(declare-fun b!1420416 () Bool)

(declare-fun res!955850 () Bool)

(assert (=> b!1420416 (=> (not res!955850) (not e!803380))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1420416 (= res!955850 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47365 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47365 a!2831))))))

(declare-fun b!1420417 () Bool)

(declare-fun res!955849 () Bool)

(assert (=> b!1420417 (=> (not res!955849) (not e!803380))))

(declare-datatypes ((List!33325 0))(
  ( (Nil!33322) (Cons!33321 (h!34623 (_ BitVec 64)) (t!48019 List!33325)) )
))
(declare-fun arrayNoDuplicates!0 (array!96995 (_ BitVec 32) List!33325) Bool)

(assert (=> b!1420417 (= res!955849 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33322))))

(declare-fun res!955855 () Bool)

(assert (=> start!122630 (=> (not res!955855) (not e!803380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122630 (= res!955855 (validMask!0 mask!2608))))

(assert (=> start!122630 e!803380))

(assert (=> start!122630 true))

(declare-fun array_inv!35843 (array!96995) Bool)

(assert (=> start!122630 (array_inv!35843 a!2831)))

(declare-fun b!1420418 () Bool)

(declare-fun res!955853 () Bool)

(assert (=> b!1420418 (=> (not res!955853) (not e!803380))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96995 (_ BitVec 32)) Bool)

(assert (=> b!1420418 (= res!955853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420419 () Bool)

(declare-fun res!955851 () Bool)

(assert (=> b!1420419 (=> (not res!955851) (not e!803379))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11100 0))(
  ( (MissingZero!11100 (index!46792 (_ BitVec 32))) (Found!11100 (index!46793 (_ BitVec 32))) (Intermediate!11100 (undefined!11912 Bool) (index!46794 (_ BitVec 32)) (x!128454 (_ BitVec 32))) (Undefined!11100) (MissingVacant!11100 (index!46795 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96995 (_ BitVec 32)) SeekEntryResult!11100)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420419 (= res!955851 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46815 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46815 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96996 (store (arr!46815 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47365 a!2831)) mask!2608) (Intermediate!11100 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1420420 () Bool)

(declare-fun res!955848 () Bool)

(assert (=> b!1420420 (=> (not res!955848) (not e!803379))))

(declare-fun lt!625914 () SeekEntryResult!11100)

(assert (=> b!1420420 (= res!955848 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46815 a!2831) j!81) a!2831 mask!2608) lt!625914))))

(declare-fun b!1420421 () Bool)

(declare-fun res!955852 () Bool)

(assert (=> b!1420421 (=> (not res!955852) (not e!803380))))

(assert (=> b!1420421 (= res!955852 (and (= (size!47365 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47365 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47365 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420422 () Bool)

(assert (=> b!1420422 (= e!803380 e!803379)))

(declare-fun res!955847 () Bool)

(assert (=> b!1420422 (=> (not res!955847) (not e!803379))))

(assert (=> b!1420422 (= res!955847 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46815 a!2831) j!81) mask!2608) (select (arr!46815 a!2831) j!81) a!2831 mask!2608) lt!625914))))

(assert (=> b!1420422 (= lt!625914 (Intermediate!11100 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!122630 res!955855) b!1420421))

(assert (= (and b!1420421 res!955852) b!1420415))

(assert (= (and b!1420415 res!955854) b!1420413))

(assert (= (and b!1420413 res!955846) b!1420418))

(assert (= (and b!1420418 res!955853) b!1420417))

(assert (= (and b!1420417 res!955849) b!1420416))

(assert (= (and b!1420416 res!955850) b!1420422))

(assert (= (and b!1420422 res!955847) b!1420419))

(assert (= (and b!1420419 res!955851) b!1420420))

(assert (= (and b!1420420 res!955848) b!1420414))

(declare-fun m!1310925 () Bool)

(assert (=> b!1420417 m!1310925))

(declare-fun m!1310927 () Bool)

(assert (=> start!122630 m!1310927))

(declare-fun m!1310929 () Bool)

(assert (=> start!122630 m!1310929))

(declare-fun m!1310931 () Bool)

(assert (=> b!1420413 m!1310931))

(assert (=> b!1420413 m!1310931))

(declare-fun m!1310933 () Bool)

(assert (=> b!1420413 m!1310933))

(assert (=> b!1420422 m!1310931))

(assert (=> b!1420422 m!1310931))

(declare-fun m!1310935 () Bool)

(assert (=> b!1420422 m!1310935))

(assert (=> b!1420422 m!1310935))

(assert (=> b!1420422 m!1310931))

(declare-fun m!1310937 () Bool)

(assert (=> b!1420422 m!1310937))

(declare-fun m!1310939 () Bool)

(assert (=> b!1420419 m!1310939))

(declare-fun m!1310941 () Bool)

(assert (=> b!1420419 m!1310941))

(assert (=> b!1420419 m!1310941))

(declare-fun m!1310943 () Bool)

(assert (=> b!1420419 m!1310943))

(assert (=> b!1420419 m!1310943))

(assert (=> b!1420419 m!1310941))

(declare-fun m!1310945 () Bool)

(assert (=> b!1420419 m!1310945))

(declare-fun m!1310947 () Bool)

(assert (=> b!1420418 m!1310947))

(assert (=> b!1420420 m!1310931))

(assert (=> b!1420420 m!1310931))

(declare-fun m!1310949 () Bool)

(assert (=> b!1420420 m!1310949))

(declare-fun m!1310951 () Bool)

(assert (=> b!1420415 m!1310951))

(assert (=> b!1420415 m!1310951))

(declare-fun m!1310953 () Bool)

(assert (=> b!1420415 m!1310953))

(check-sat (not b!1420422) (not b!1420413) (not b!1420415) (not start!122630) (not b!1420419) (not b!1420420) (not b!1420418) (not b!1420417))
(check-sat)
