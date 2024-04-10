; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122704 () Bool)

(assert start!122704)

(declare-fun b!1421619 () Bool)

(declare-fun res!957053 () Bool)

(declare-fun e!803800 () Bool)

(assert (=> b!1421619 (=> (not res!957053) (not e!803800))))

(declare-datatypes ((array!97069 0))(
  ( (array!97070 (arr!46852 (Array (_ BitVec 32) (_ BitVec 64))) (size!47402 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97069)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421619 (= res!957053 (validKeyInArray!0 (select (arr!46852 a!2831) j!81)))))

(declare-fun b!1421620 () Bool)

(declare-fun e!803801 () Bool)

(declare-fun e!803803 () Bool)

(assert (=> b!1421620 (= e!803801 e!803803)))

(declare-fun res!957059 () Bool)

(assert (=> b!1421620 (=> (not res!957059) (not e!803803))))

(declare-fun lt!626340 () array!97069)

(declare-fun lt!626339 () (_ BitVec 64))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11137 0))(
  ( (MissingZero!11137 (index!46940 (_ BitVec 32))) (Found!11137 (index!46941 (_ BitVec 32))) (Intermediate!11137 (undefined!11949 Bool) (index!46942 (_ BitVec 32)) (x!128587 (_ BitVec 32))) (Undefined!11137) (MissingVacant!11137 (index!46943 (_ BitVec 32))) )
))
(declare-fun lt!626338 () SeekEntryResult!11137)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97069 (_ BitVec 32)) SeekEntryResult!11137)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421620 (= res!957059 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626339 mask!2608) lt!626339 lt!626340 mask!2608) lt!626338))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1421620 (= lt!626338 (Intermediate!11137 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421620 (= lt!626339 (select (store (arr!46852 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421620 (= lt!626340 (array!97070 (store (arr!46852 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47402 a!2831)))))

(declare-fun b!1421621 () Bool)

(declare-fun res!957061 () Bool)

(assert (=> b!1421621 (=> (not res!957061) (not e!803800))))

(assert (=> b!1421621 (= res!957061 (validKeyInArray!0 (select (arr!46852 a!2831) i!982)))))

(declare-fun b!1421622 () Bool)

(assert (=> b!1421622 (= e!803803 (not true))))

(declare-fun e!803802 () Bool)

(assert (=> b!1421622 e!803802))

(declare-fun res!957057 () Bool)

(assert (=> b!1421622 (=> (not res!957057) (not e!803802))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97069 (_ BitVec 32)) Bool)

(assert (=> b!1421622 (= res!957057 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48110 0))(
  ( (Unit!48111) )
))
(declare-fun lt!626336 () Unit!48110)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97069 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48110)

(assert (=> b!1421622 (= lt!626336 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1421623 () Bool)

(declare-fun res!957055 () Bool)

(assert (=> b!1421623 (=> (not res!957055) (not e!803803))))

(declare-fun lt!626337 () SeekEntryResult!11137)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1421623 (= res!957055 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46852 a!2831) j!81) a!2831 mask!2608) lt!626337))))

(declare-fun b!1421624 () Bool)

(declare-fun res!957063 () Bool)

(assert (=> b!1421624 (=> (not res!957063) (not e!803800))))

(declare-datatypes ((List!33362 0))(
  ( (Nil!33359) (Cons!33358 (h!34660 (_ BitVec 64)) (t!48056 List!33362)) )
))
(declare-fun arrayNoDuplicates!0 (array!97069 (_ BitVec 32) List!33362) Bool)

(assert (=> b!1421624 (= res!957063 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33359))))

(declare-fun b!1421625 () Bool)

(declare-fun res!957056 () Bool)

(assert (=> b!1421625 (=> (not res!957056) (not e!803800))))

(assert (=> b!1421625 (= res!957056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!957054 () Bool)

(assert (=> start!122704 (=> (not res!957054) (not e!803800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122704 (= res!957054 (validMask!0 mask!2608))))

(assert (=> start!122704 e!803800))

(assert (=> start!122704 true))

(declare-fun array_inv!35880 (array!97069) Bool)

(assert (=> start!122704 (array_inv!35880 a!2831)))

(declare-fun b!1421626 () Bool)

(declare-fun res!957058 () Bool)

(assert (=> b!1421626 (=> (not res!957058) (not e!803800))))

(assert (=> b!1421626 (= res!957058 (and (= (size!47402 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47402 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47402 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421627 () Bool)

(declare-fun res!957062 () Bool)

(assert (=> b!1421627 (=> (not res!957062) (not e!803803))))

(assert (=> b!1421627 (= res!957062 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626339 lt!626340 mask!2608) lt!626338))))

(declare-fun b!1421628 () Bool)

(declare-fun res!957064 () Bool)

(assert (=> b!1421628 (=> (not res!957064) (not e!803800))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1421628 (= res!957064 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47402 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47402 a!2831))))))

(declare-fun b!1421629 () Bool)

(assert (=> b!1421629 (= e!803800 e!803801)))

(declare-fun res!957060 () Bool)

(assert (=> b!1421629 (=> (not res!957060) (not e!803801))))

(assert (=> b!1421629 (= res!957060 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46852 a!2831) j!81) mask!2608) (select (arr!46852 a!2831) j!81) a!2831 mask!2608) lt!626337))))

(assert (=> b!1421629 (= lt!626337 (Intermediate!11137 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421630 () Bool)

(declare-fun res!957052 () Bool)

(assert (=> b!1421630 (=> (not res!957052) (not e!803803))))

(assert (=> b!1421630 (= res!957052 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1421631 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97069 (_ BitVec 32)) SeekEntryResult!11137)

(assert (=> b!1421631 (= e!803802 (= (seekEntryOrOpen!0 (select (arr!46852 a!2831) j!81) a!2831 mask!2608) (Found!11137 j!81)))))

(assert (= (and start!122704 res!957054) b!1421626))

(assert (= (and b!1421626 res!957058) b!1421621))

(assert (= (and b!1421621 res!957061) b!1421619))

(assert (= (and b!1421619 res!957053) b!1421625))

(assert (= (and b!1421625 res!957056) b!1421624))

(assert (= (and b!1421624 res!957063) b!1421628))

(assert (= (and b!1421628 res!957064) b!1421629))

(assert (= (and b!1421629 res!957060) b!1421620))

(assert (= (and b!1421620 res!957059) b!1421623))

(assert (= (and b!1421623 res!957055) b!1421627))

(assert (= (and b!1421627 res!957062) b!1421630))

(assert (= (and b!1421630 res!957052) b!1421622))

(assert (= (and b!1421622 res!957057) b!1421631))

(declare-fun m!1312159 () Bool)

(assert (=> b!1421627 m!1312159))

(declare-fun m!1312161 () Bool)

(assert (=> b!1421621 m!1312161))

(assert (=> b!1421621 m!1312161))

(declare-fun m!1312163 () Bool)

(assert (=> b!1421621 m!1312163))

(declare-fun m!1312165 () Bool)

(assert (=> b!1421625 m!1312165))

(declare-fun m!1312167 () Bool)

(assert (=> b!1421629 m!1312167))

(assert (=> b!1421629 m!1312167))

(declare-fun m!1312169 () Bool)

(assert (=> b!1421629 m!1312169))

(assert (=> b!1421629 m!1312169))

(assert (=> b!1421629 m!1312167))

(declare-fun m!1312171 () Bool)

(assert (=> b!1421629 m!1312171))

(declare-fun m!1312173 () Bool)

(assert (=> b!1421620 m!1312173))

(assert (=> b!1421620 m!1312173))

(declare-fun m!1312175 () Bool)

(assert (=> b!1421620 m!1312175))

(declare-fun m!1312177 () Bool)

(assert (=> b!1421620 m!1312177))

(declare-fun m!1312179 () Bool)

(assert (=> b!1421620 m!1312179))

(assert (=> b!1421623 m!1312167))

(assert (=> b!1421623 m!1312167))

(declare-fun m!1312181 () Bool)

(assert (=> b!1421623 m!1312181))

(declare-fun m!1312183 () Bool)

(assert (=> b!1421624 m!1312183))

(assert (=> b!1421619 m!1312167))

(assert (=> b!1421619 m!1312167))

(declare-fun m!1312185 () Bool)

(assert (=> b!1421619 m!1312185))

(declare-fun m!1312187 () Bool)

(assert (=> start!122704 m!1312187))

(declare-fun m!1312189 () Bool)

(assert (=> start!122704 m!1312189))

(assert (=> b!1421631 m!1312167))

(assert (=> b!1421631 m!1312167))

(declare-fun m!1312191 () Bool)

(assert (=> b!1421631 m!1312191))

(declare-fun m!1312193 () Bool)

(assert (=> b!1421622 m!1312193))

(declare-fun m!1312195 () Bool)

(assert (=> b!1421622 m!1312195))

(push 1)

