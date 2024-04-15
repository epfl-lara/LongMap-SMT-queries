; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122720 () Bool)

(assert start!122720)

(declare-fun b!1421934 () Bool)

(declare-fun res!957433 () Bool)

(declare-fun e!803919 () Bool)

(assert (=> b!1421934 (=> (not res!957433) (not e!803919))))

(declare-datatypes ((array!97038 0))(
  ( (array!97039 (arr!46837 (Array (_ BitVec 32) (_ BitVec 64))) (size!47389 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97038)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97038 (_ BitVec 32)) Bool)

(assert (=> b!1421934 (= res!957433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421935 () Bool)

(declare-fun res!957422 () Bool)

(declare-fun e!803917 () Bool)

(assert (=> b!1421935 (=> (not res!957422) (not e!803917))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11149 0))(
  ( (MissingZero!11149 (index!46988 (_ BitVec 32))) (Found!11149 (index!46989 (_ BitVec 32))) (Intermediate!11149 (undefined!11961 Bool) (index!46990 (_ BitVec 32)) (x!128628 (_ BitVec 32))) (Undefined!11149) (MissingVacant!11149 (index!46991 (_ BitVec 32))) )
))
(declare-fun lt!626304 () SeekEntryResult!11149)

(declare-fun lt!626301 () array!97038)

(declare-fun lt!626306 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97038 (_ BitVec 32)) SeekEntryResult!11149)

(assert (=> b!1421935 (= res!957422 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626306 lt!626301 mask!2608) lt!626304))))

(declare-fun b!1421936 () Bool)

(declare-fun e!803916 () Bool)

(declare-fun e!803915 () Bool)

(assert (=> b!1421936 (= e!803916 e!803915)))

(declare-fun res!957421 () Bool)

(assert (=> b!1421936 (=> res!957421 e!803915)))

(declare-fun lt!626303 () (_ BitVec 32))

(assert (=> b!1421936 (= res!957421 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626303 #b00000000000000000000000000000000) (bvsge lt!626303 (size!47389 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421936 (= lt!626303 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1421937 () Bool)

(declare-fun res!957432 () Bool)

(assert (=> b!1421937 (=> (not res!957432) (not e!803917))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1421937 (= res!957432 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1421938 () Bool)

(declare-fun res!957419 () Bool)

(assert (=> b!1421938 (=> (not res!957419) (not e!803919))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421938 (= res!957419 (validKeyInArray!0 (select (arr!46837 a!2831) i!982)))))

(declare-fun res!957427 () Bool)

(assert (=> start!122720 (=> (not res!957427) (not e!803919))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122720 (= res!957427 (validMask!0 mask!2608))))

(assert (=> start!122720 e!803919))

(assert (=> start!122720 true))

(declare-fun array_inv!36070 (array!97038) Bool)

(assert (=> start!122720 (array_inv!36070 a!2831)))

(declare-fun b!1421939 () Bool)

(declare-fun res!957420 () Bool)

(assert (=> b!1421939 (=> res!957420 e!803915)))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun lt!626300 () SeekEntryResult!11149)

(assert (=> b!1421939 (= res!957420 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626303 (select (arr!46837 a!2831) j!81) a!2831 mask!2608) lt!626300)))))

(declare-fun b!1421940 () Bool)

(declare-fun res!957418 () Bool)

(assert (=> b!1421940 (=> (not res!957418) (not e!803919))))

(assert (=> b!1421940 (= res!957418 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47389 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47389 a!2831))))))

(declare-fun b!1421941 () Bool)

(assert (=> b!1421941 (= e!803915 true)))

(declare-fun lt!626305 () SeekEntryResult!11149)

(assert (=> b!1421941 (= lt!626305 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626303 lt!626306 lt!626301 mask!2608))))

(declare-fun b!1421942 () Bool)

(declare-fun res!957424 () Bool)

(assert (=> b!1421942 (=> (not res!957424) (not e!803917))))

(assert (=> b!1421942 (= res!957424 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46837 a!2831) j!81) a!2831 mask!2608) lt!626300))))

(declare-fun b!1421943 () Bool)

(declare-fun res!957430 () Bool)

(assert (=> b!1421943 (=> (not res!957430) (not e!803919))))

(assert (=> b!1421943 (= res!957430 (validKeyInArray!0 (select (arr!46837 a!2831) j!81)))))

(declare-fun b!1421944 () Bool)

(assert (=> b!1421944 (= e!803917 (not e!803916))))

(declare-fun res!957425 () Bool)

(assert (=> b!1421944 (=> res!957425 e!803916)))

(assert (=> b!1421944 (= res!957425 (or (= (select (arr!46837 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46837 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46837 a!2831) index!585) (select (arr!46837 a!2831) j!81)) (= (select (store (arr!46837 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!803920 () Bool)

(assert (=> b!1421944 e!803920))

(declare-fun res!957428 () Bool)

(assert (=> b!1421944 (=> (not res!957428) (not e!803920))))

(assert (=> b!1421944 (= res!957428 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!47973 0))(
  ( (Unit!47974) )
))
(declare-fun lt!626302 () Unit!47973)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97038 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47973)

(assert (=> b!1421944 (= lt!626302 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1421945 () Bool)

(declare-fun res!957426 () Bool)

(assert (=> b!1421945 (=> (not res!957426) (not e!803919))))

(declare-datatypes ((List!33425 0))(
  ( (Nil!33422) (Cons!33421 (h!34723 (_ BitVec 64)) (t!48111 List!33425)) )
))
(declare-fun arrayNoDuplicates!0 (array!97038 (_ BitVec 32) List!33425) Bool)

(assert (=> b!1421945 (= res!957426 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33422))))

(declare-fun b!1421946 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97038 (_ BitVec 32)) SeekEntryResult!11149)

(assert (=> b!1421946 (= e!803920 (= (seekEntryOrOpen!0 (select (arr!46837 a!2831) j!81) a!2831 mask!2608) (Found!11149 j!81)))))

(declare-fun b!1421947 () Bool)

(declare-fun e!803921 () Bool)

(assert (=> b!1421947 (= e!803921 e!803917)))

(declare-fun res!957431 () Bool)

(assert (=> b!1421947 (=> (not res!957431) (not e!803917))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421947 (= res!957431 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626306 mask!2608) lt!626306 lt!626301 mask!2608) lt!626304))))

(assert (=> b!1421947 (= lt!626304 (Intermediate!11149 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1421947 (= lt!626306 (select (store (arr!46837 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421947 (= lt!626301 (array!97039 (store (arr!46837 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47389 a!2831)))))

(declare-fun b!1421948 () Bool)

(assert (=> b!1421948 (= e!803919 e!803921)))

(declare-fun res!957429 () Bool)

(assert (=> b!1421948 (=> (not res!957429) (not e!803921))))

(assert (=> b!1421948 (= res!957429 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46837 a!2831) j!81) mask!2608) (select (arr!46837 a!2831) j!81) a!2831 mask!2608) lt!626300))))

(assert (=> b!1421948 (= lt!626300 (Intermediate!11149 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421949 () Bool)

(declare-fun res!957423 () Bool)

(assert (=> b!1421949 (=> (not res!957423) (not e!803919))))

(assert (=> b!1421949 (= res!957423 (and (= (size!47389 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47389 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47389 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122720 res!957427) b!1421949))

(assert (= (and b!1421949 res!957423) b!1421938))

(assert (= (and b!1421938 res!957419) b!1421943))

(assert (= (and b!1421943 res!957430) b!1421934))

(assert (= (and b!1421934 res!957433) b!1421945))

(assert (= (and b!1421945 res!957426) b!1421940))

(assert (= (and b!1421940 res!957418) b!1421948))

(assert (= (and b!1421948 res!957429) b!1421947))

(assert (= (and b!1421947 res!957431) b!1421942))

(assert (= (and b!1421942 res!957424) b!1421935))

(assert (= (and b!1421935 res!957422) b!1421937))

(assert (= (and b!1421937 res!957432) b!1421944))

(assert (= (and b!1421944 res!957428) b!1421946))

(assert (= (and b!1421944 (not res!957425)) b!1421936))

(assert (= (and b!1421936 (not res!957421)) b!1421939))

(assert (= (and b!1421939 (not res!957420)) b!1421941))

(declare-fun m!1312011 () Bool)

(assert (=> b!1421935 m!1312011))

(declare-fun m!1312013 () Bool)

(assert (=> b!1421944 m!1312013))

(declare-fun m!1312015 () Bool)

(assert (=> b!1421944 m!1312015))

(declare-fun m!1312017 () Bool)

(assert (=> b!1421944 m!1312017))

(declare-fun m!1312019 () Bool)

(assert (=> b!1421944 m!1312019))

(declare-fun m!1312021 () Bool)

(assert (=> b!1421944 m!1312021))

(declare-fun m!1312023 () Bool)

(assert (=> b!1421944 m!1312023))

(declare-fun m!1312025 () Bool)

(assert (=> b!1421936 m!1312025))

(assert (=> b!1421943 m!1312021))

(assert (=> b!1421943 m!1312021))

(declare-fun m!1312027 () Bool)

(assert (=> b!1421943 m!1312027))

(declare-fun m!1312029 () Bool)

(assert (=> b!1421941 m!1312029))

(assert (=> b!1421948 m!1312021))

(assert (=> b!1421948 m!1312021))

(declare-fun m!1312031 () Bool)

(assert (=> b!1421948 m!1312031))

(assert (=> b!1421948 m!1312031))

(assert (=> b!1421948 m!1312021))

(declare-fun m!1312033 () Bool)

(assert (=> b!1421948 m!1312033))

(declare-fun m!1312035 () Bool)

(assert (=> b!1421945 m!1312035))

(assert (=> b!1421939 m!1312021))

(assert (=> b!1421939 m!1312021))

(declare-fun m!1312037 () Bool)

(assert (=> b!1421939 m!1312037))

(declare-fun m!1312039 () Bool)

(assert (=> b!1421938 m!1312039))

(assert (=> b!1421938 m!1312039))

(declare-fun m!1312041 () Bool)

(assert (=> b!1421938 m!1312041))

(assert (=> b!1421946 m!1312021))

(assert (=> b!1421946 m!1312021))

(declare-fun m!1312043 () Bool)

(assert (=> b!1421946 m!1312043))

(declare-fun m!1312045 () Bool)

(assert (=> b!1421947 m!1312045))

(assert (=> b!1421947 m!1312045))

(declare-fun m!1312047 () Bool)

(assert (=> b!1421947 m!1312047))

(assert (=> b!1421947 m!1312013))

(declare-fun m!1312049 () Bool)

(assert (=> b!1421947 m!1312049))

(assert (=> b!1421942 m!1312021))

(assert (=> b!1421942 m!1312021))

(declare-fun m!1312051 () Bool)

(assert (=> b!1421942 m!1312051))

(declare-fun m!1312053 () Bool)

(assert (=> start!122720 m!1312053))

(declare-fun m!1312055 () Bool)

(assert (=> start!122720 m!1312055))

(declare-fun m!1312057 () Bool)

(assert (=> b!1421934 m!1312057))

(check-sat (not b!1421942) (not b!1421935) (not b!1421941) (not start!122720) (not b!1421944) (not b!1421936) (not b!1421946) (not b!1421948) (not b!1421943) (not b!1421945) (not b!1421947) (not b!1421934) (not b!1421939) (not b!1421938))
(check-sat)
