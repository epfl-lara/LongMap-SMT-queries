; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121944 () Bool)

(assert start!121944)

(declare-datatypes ((SeekEntryResult!10957 0))(
  ( (MissingZero!10957 (index!46220 (_ BitVec 32))) (Found!10957 (index!46221 (_ BitVec 32))) (Intermediate!10957 (undefined!11769 Bool) (index!46222 (_ BitVec 32)) (x!127836 (_ BitVec 32))) (Undefined!10957) (MissingVacant!10957 (index!46223 (_ BitVec 32))) )
))
(declare-fun lt!623922 () SeekEntryResult!10957)

(declare-datatypes ((array!96630 0))(
  ( (array!96631 (arr!46646 (Array (_ BitVec 32) (_ BitVec 64))) (size!47196 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96630)

(declare-fun lt!623926 () SeekEntryResult!10957)

(declare-fun b!1415124 () Bool)

(declare-fun e!800910 () Bool)

(declare-fun lt!623928 () (_ BitVec 32))

(assert (=> b!1415124 (= e!800910 (or (bvslt (x!127836 lt!623926) #b00000000000000000000000000000000) (bvsgt (x!127836 lt!623926) #b01111111111111111111111111111110) (bvslt (x!127836 lt!623922) #b00000000000000000000000000000000) (bvsgt (x!127836 lt!623922) #b01111111111111111111111111111110) (bvslt lt!623928 #b00000000000000000000000000000000) (bvsge lt!623928 (size!47196 a!2901)) (bvslt (index!46222 lt!623926) #b00000000000000000000000000000000) (bvsge (index!46222 lt!623926) (size!47196 a!2901)) (and (bvsge (index!46222 lt!623922) #b00000000000000000000000000000000) (bvslt (index!46222 lt!623922) (size!47196 a!2901)))))))

(declare-fun e!800908 () Bool)

(assert (=> b!1415124 e!800908))

(declare-fun res!951171 () Bool)

(assert (=> b!1415124 (=> (not res!951171) (not e!800908))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1415124 (= res!951171 (and (not (undefined!11769 lt!623922)) (= (index!46222 lt!623922) i!1037) (bvslt (x!127836 lt!623922) (x!127836 lt!623926)) (= (select (store (arr!46646 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46222 lt!623922)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((Unit!47888 0))(
  ( (Unit!47889) )
))
(declare-fun lt!623924 () Unit!47888)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96630 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47888)

(assert (=> b!1415124 (= lt!623924 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623928 (x!127836 lt!623926) (index!46222 lt!623926) (x!127836 lt!623922) (index!46222 lt!623922) (undefined!11769 lt!623922) mask!2840))))

(declare-fun b!1415125 () Bool)

(declare-fun res!951175 () Bool)

(declare-fun e!800909 () Bool)

(assert (=> b!1415125 (=> (not res!951175) (not e!800909))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415125 (= res!951175 (validKeyInArray!0 (select (arr!46646 a!2901) j!112)))))

(declare-fun b!1415126 () Bool)

(declare-fun res!951167 () Bool)

(assert (=> b!1415126 (=> (not res!951167) (not e!800909))))

(declare-datatypes ((List!33165 0))(
  ( (Nil!33162) (Cons!33161 (h!34448 (_ BitVec 64)) (t!47859 List!33165)) )
))
(declare-fun arrayNoDuplicates!0 (array!96630 (_ BitVec 32) List!33165) Bool)

(assert (=> b!1415126 (= res!951167 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33162))))

(declare-fun b!1415127 () Bool)

(declare-fun e!800912 () Bool)

(assert (=> b!1415127 (= e!800912 e!800910)))

(declare-fun res!951174 () Bool)

(assert (=> b!1415127 (=> res!951174 e!800910)))

(assert (=> b!1415127 (= res!951174 (or (= lt!623926 lt!623922) (not (is-Intermediate!10957 lt!623922))))))

(declare-fun lt!623927 () array!96630)

(declare-fun lt!623923 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96630 (_ BitVec 32)) SeekEntryResult!10957)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415127 (= lt!623922 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623923 mask!2840) lt!623923 lt!623927 mask!2840))))

(assert (=> b!1415127 (= lt!623923 (select (store (arr!46646 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415127 (= lt!623927 (array!96631 (store (arr!46646 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47196 a!2901)))))

(declare-fun res!951168 () Bool)

(assert (=> start!121944 (=> (not res!951168) (not e!800909))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121944 (= res!951168 (validMask!0 mask!2840))))

(assert (=> start!121944 e!800909))

(assert (=> start!121944 true))

(declare-fun array_inv!35674 (array!96630) Bool)

(assert (=> start!121944 (array_inv!35674 a!2901)))

(declare-fun b!1415128 () Bool)

(declare-fun e!800911 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96630 (_ BitVec 32)) SeekEntryResult!10957)

(assert (=> b!1415128 (= e!800911 (= (seekEntryOrOpen!0 (select (arr!46646 a!2901) j!112) a!2901 mask!2840) (Found!10957 j!112)))))

(declare-fun b!1415129 () Bool)

(declare-fun res!951173 () Bool)

(assert (=> b!1415129 (=> (not res!951173) (not e!800909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96630 (_ BitVec 32)) Bool)

(assert (=> b!1415129 (= res!951173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1415130 () Bool)

(assert (=> b!1415130 (= e!800909 (not e!800912))))

(declare-fun res!951169 () Bool)

(assert (=> b!1415130 (=> res!951169 e!800912)))

(assert (=> b!1415130 (= res!951169 (or (not (is-Intermediate!10957 lt!623926)) (undefined!11769 lt!623926)))))

(assert (=> b!1415130 e!800911))

(declare-fun res!951172 () Bool)

(assert (=> b!1415130 (=> (not res!951172) (not e!800911))))

(assert (=> b!1415130 (= res!951172 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!623925 () Unit!47888)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96630 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47888)

(assert (=> b!1415130 (= lt!623925 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1415130 (= lt!623926 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623928 (select (arr!46646 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1415130 (= lt!623928 (toIndex!0 (select (arr!46646 a!2901) j!112) mask!2840))))

(declare-fun b!1415131 () Bool)

(declare-fun res!951170 () Bool)

(assert (=> b!1415131 (=> (not res!951170) (not e!800909))))

(assert (=> b!1415131 (= res!951170 (and (= (size!47196 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47196 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47196 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1415132 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96630 (_ BitVec 32)) SeekEntryResult!10957)

(assert (=> b!1415132 (= e!800908 (= (seekEntryOrOpen!0 lt!623923 lt!623927 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127836 lt!623922) (index!46222 lt!623922) (index!46222 lt!623922) (select (arr!46646 a!2901) j!112) lt!623927 mask!2840)))))

(declare-fun b!1415133 () Bool)

(declare-fun res!951166 () Bool)

(assert (=> b!1415133 (=> (not res!951166) (not e!800909))))

(assert (=> b!1415133 (= res!951166 (validKeyInArray!0 (select (arr!46646 a!2901) i!1037)))))

(assert (= (and start!121944 res!951168) b!1415131))

(assert (= (and b!1415131 res!951170) b!1415133))

(assert (= (and b!1415133 res!951166) b!1415125))

(assert (= (and b!1415125 res!951175) b!1415129))

(assert (= (and b!1415129 res!951173) b!1415126))

(assert (= (and b!1415126 res!951167) b!1415130))

(assert (= (and b!1415130 res!951172) b!1415128))

(assert (= (and b!1415130 (not res!951169)) b!1415127))

(assert (= (and b!1415127 (not res!951174)) b!1415124))

(assert (= (and b!1415124 res!951171) b!1415132))

(declare-fun m!1305279 () Bool)

(assert (=> b!1415125 m!1305279))

(assert (=> b!1415125 m!1305279))

(declare-fun m!1305281 () Bool)

(assert (=> b!1415125 m!1305281))

(declare-fun m!1305283 () Bool)

(assert (=> b!1415126 m!1305283))

(declare-fun m!1305285 () Bool)

(assert (=> b!1415124 m!1305285))

(declare-fun m!1305287 () Bool)

(assert (=> b!1415124 m!1305287))

(declare-fun m!1305289 () Bool)

(assert (=> b!1415124 m!1305289))

(assert (=> b!1415128 m!1305279))

(assert (=> b!1415128 m!1305279))

(declare-fun m!1305291 () Bool)

(assert (=> b!1415128 m!1305291))

(declare-fun m!1305293 () Bool)

(assert (=> b!1415129 m!1305293))

(declare-fun m!1305295 () Bool)

(assert (=> b!1415127 m!1305295))

(assert (=> b!1415127 m!1305295))

(declare-fun m!1305297 () Bool)

(assert (=> b!1415127 m!1305297))

(assert (=> b!1415127 m!1305285))

(declare-fun m!1305299 () Bool)

(assert (=> b!1415127 m!1305299))

(assert (=> b!1415130 m!1305279))

(declare-fun m!1305301 () Bool)

(assert (=> b!1415130 m!1305301))

(assert (=> b!1415130 m!1305279))

(declare-fun m!1305303 () Bool)

(assert (=> b!1415130 m!1305303))

(declare-fun m!1305305 () Bool)

(assert (=> b!1415130 m!1305305))

(assert (=> b!1415130 m!1305279))

(declare-fun m!1305307 () Bool)

(assert (=> b!1415130 m!1305307))

(declare-fun m!1305309 () Bool)

(assert (=> start!121944 m!1305309))

(declare-fun m!1305311 () Bool)

(assert (=> start!121944 m!1305311))

(declare-fun m!1305313 () Bool)

(assert (=> b!1415133 m!1305313))

(assert (=> b!1415133 m!1305313))

(declare-fun m!1305315 () Bool)

(assert (=> b!1415133 m!1305315))

(declare-fun m!1305317 () Bool)

(assert (=> b!1415132 m!1305317))

(assert (=> b!1415132 m!1305279))

(assert (=> b!1415132 m!1305279))

(declare-fun m!1305319 () Bool)

(assert (=> b!1415132 m!1305319))

(push 1)

(assert (not b!1415132))

(assert (not b!1415126))

(assert (not b!1415128))

(assert (not start!121944))

(assert (not b!1415124))

(assert (not b!1415129))

(assert (not b!1415127))

(assert (not b!1415130))

(assert (not b!1415133))

(assert (not b!1415125))

(check-sat)

(pop 1)

(push 1)

(check-sat)

