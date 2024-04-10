; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120766 () Bool)

(assert start!120766)

(declare-fun b!1405200 () Bool)

(declare-fun res!943423 () Bool)

(declare-fun e!795454 () Bool)

(assert (=> b!1405200 (=> (not res!943423) (not e!795454))))

(declare-datatypes ((array!96073 0))(
  ( (array!96074 (arr!46384 (Array (_ BitVec 32) (_ BitVec 64))) (size!46934 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96073)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405200 (= res!943423 (validKeyInArray!0 (select (arr!46384 a!2901) i!1037)))))

(declare-fun b!1405201 () Bool)

(declare-fun res!943422 () Bool)

(assert (=> b!1405201 (=> (not res!943422) (not e!795454))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1405201 (= res!943422 (and (= (size!46934 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46934 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46934 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405202 () Bool)

(assert (=> b!1405202 (= e!795454 (not true))))

(declare-fun e!795453 () Bool)

(assert (=> b!1405202 e!795453))

(declare-fun res!943418 () Bool)

(assert (=> b!1405202 (=> (not res!943418) (not e!795453))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96073 (_ BitVec 32)) Bool)

(assert (=> b!1405202 (= res!943418 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47364 0))(
  ( (Unit!47365) )
))
(declare-fun lt!618959 () Unit!47364)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96073 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47364)

(assert (=> b!1405202 (= lt!618959 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10695 0))(
  ( (MissingZero!10695 (index!45157 (_ BitVec 32))) (Found!10695 (index!45158 (_ BitVec 32))) (Intermediate!10695 (undefined!11507 Bool) (index!45159 (_ BitVec 32)) (x!126774 (_ BitVec 32))) (Undefined!10695) (MissingVacant!10695 (index!45160 (_ BitVec 32))) )
))
(declare-fun lt!618960 () SeekEntryResult!10695)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96073 (_ BitVec 32)) SeekEntryResult!10695)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405202 (= lt!618960 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46384 a!2901) j!112) mask!2840) (select (arr!46384 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405203 () Bool)

(declare-fun res!943417 () Bool)

(assert (=> b!1405203 (=> (not res!943417) (not e!795454))))

(declare-datatypes ((List!32903 0))(
  ( (Nil!32900) (Cons!32899 (h!34153 (_ BitVec 64)) (t!47597 List!32903)) )
))
(declare-fun arrayNoDuplicates!0 (array!96073 (_ BitVec 32) List!32903) Bool)

(assert (=> b!1405203 (= res!943417 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32900))))

(declare-fun b!1405204 () Bool)

(declare-fun res!943421 () Bool)

(assert (=> b!1405204 (=> (not res!943421) (not e!795454))))

(assert (=> b!1405204 (= res!943421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!943419 () Bool)

(assert (=> start!120766 (=> (not res!943419) (not e!795454))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120766 (= res!943419 (validMask!0 mask!2840))))

(assert (=> start!120766 e!795454))

(assert (=> start!120766 true))

(declare-fun array_inv!35412 (array!96073) Bool)

(assert (=> start!120766 (array_inv!35412 a!2901)))

(declare-fun b!1405205 () Bool)

(declare-fun res!943420 () Bool)

(assert (=> b!1405205 (=> (not res!943420) (not e!795454))))

(assert (=> b!1405205 (= res!943420 (validKeyInArray!0 (select (arr!46384 a!2901) j!112)))))

(declare-fun b!1405206 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96073 (_ BitVec 32)) SeekEntryResult!10695)

(assert (=> b!1405206 (= e!795453 (= (seekEntryOrOpen!0 (select (arr!46384 a!2901) j!112) a!2901 mask!2840) (Found!10695 j!112)))))

(assert (= (and start!120766 res!943419) b!1405201))

(assert (= (and b!1405201 res!943422) b!1405200))

(assert (= (and b!1405200 res!943423) b!1405205))

(assert (= (and b!1405205 res!943420) b!1405204))

(assert (= (and b!1405204 res!943421) b!1405203))

(assert (= (and b!1405203 res!943417) b!1405202))

(assert (= (and b!1405202 res!943418) b!1405206))

(declare-fun m!1293925 () Bool)

(assert (=> b!1405204 m!1293925))

(declare-fun m!1293927 () Bool)

(assert (=> b!1405200 m!1293927))

(assert (=> b!1405200 m!1293927))

(declare-fun m!1293929 () Bool)

(assert (=> b!1405200 m!1293929))

(declare-fun m!1293931 () Bool)

(assert (=> b!1405203 m!1293931))

(declare-fun m!1293933 () Bool)

(assert (=> b!1405202 m!1293933))

(declare-fun m!1293935 () Bool)

(assert (=> b!1405202 m!1293935))

(assert (=> b!1405202 m!1293933))

(declare-fun m!1293937 () Bool)

(assert (=> b!1405202 m!1293937))

(assert (=> b!1405202 m!1293935))

(assert (=> b!1405202 m!1293933))

(declare-fun m!1293939 () Bool)

(assert (=> b!1405202 m!1293939))

(declare-fun m!1293941 () Bool)

(assert (=> b!1405202 m!1293941))

(assert (=> b!1405205 m!1293933))

(assert (=> b!1405205 m!1293933))

(declare-fun m!1293943 () Bool)

(assert (=> b!1405205 m!1293943))

(declare-fun m!1293945 () Bool)

(assert (=> start!120766 m!1293945))

(declare-fun m!1293947 () Bool)

(assert (=> start!120766 m!1293947))

(assert (=> b!1405206 m!1293933))

(assert (=> b!1405206 m!1293933))

(declare-fun m!1293949 () Bool)

(assert (=> b!1405206 m!1293949))

(push 1)

(assert (not b!1405204))

(assert (not b!1405205))

(assert (not b!1405202))

(assert (not b!1405203))

(assert (not b!1405200))

(assert (not b!1405206))

(assert (not start!120766))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

