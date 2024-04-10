; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120040 () Bool)

(assert start!120040)

(declare-fun b!1397500 () Bool)

(declare-fun res!936414 () Bool)

(declare-fun e!791167 () Bool)

(assert (=> b!1397500 (=> (not res!936414) (not e!791167))))

(declare-datatypes ((array!95569 0))(
  ( (array!95570 (arr!46138 (Array (_ BitVec 32) (_ BitVec 64))) (size!46688 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95569)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397500 (= res!936414 (validKeyInArray!0 (select (arr!46138 a!2901) j!112)))))

(declare-fun b!1397501 () Bool)

(declare-fun res!936417 () Bool)

(assert (=> b!1397501 (=> (not res!936417) (not e!791167))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95569 (_ BitVec 32)) Bool)

(assert (=> b!1397501 (= res!936417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397502 () Bool)

(declare-fun res!936421 () Bool)

(assert (=> b!1397502 (=> (not res!936421) (not e!791167))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1397502 (= res!936421 (validKeyInArray!0 (select (arr!46138 a!2901) i!1037)))))

(declare-fun b!1397503 () Bool)

(declare-fun e!791168 () Bool)

(assert (=> b!1397503 (= e!791167 (not e!791168))))

(declare-fun res!936415 () Bool)

(assert (=> b!1397503 (=> res!936415 e!791168)))

(declare-datatypes ((SeekEntryResult!10455 0))(
  ( (MissingZero!10455 (index!44191 (_ BitVec 32))) (Found!10455 (index!44192 (_ BitVec 32))) (Intermediate!10455 (undefined!11267 Bool) (index!44193 (_ BitVec 32)) (x!125845 (_ BitVec 32))) (Undefined!10455) (MissingVacant!10455 (index!44194 (_ BitVec 32))) )
))
(declare-fun lt!614256 () SeekEntryResult!10455)

(assert (=> b!1397503 (= res!936415 (or (not (is-Intermediate!10455 lt!614256)) (undefined!11267 lt!614256)))))

(declare-fun e!791165 () Bool)

(assert (=> b!1397503 e!791165))

(declare-fun res!936416 () Bool)

(assert (=> b!1397503 (=> (not res!936416) (not e!791165))))

(assert (=> b!1397503 (= res!936416 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46914 0))(
  ( (Unit!46915) )
))
(declare-fun lt!614252 () Unit!46914)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95569 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46914)

(assert (=> b!1397503 (= lt!614252 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614253 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95569 (_ BitVec 32)) SeekEntryResult!10455)

(assert (=> b!1397503 (= lt!614256 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614253 (select (arr!46138 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397503 (= lt!614253 (toIndex!0 (select (arr!46138 a!2901) j!112) mask!2840))))

(declare-fun b!1397504 () Bool)

(declare-fun e!791164 () Bool)

(assert (=> b!1397504 (= e!791164 true)))

(declare-fun lt!614255 () SeekEntryResult!10455)

(declare-fun lt!614251 () array!95569)

(declare-fun lt!614254 () (_ BitVec 64))

(assert (=> b!1397504 (= lt!614255 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614253 lt!614254 lt!614251 mask!2840))))

(declare-fun b!1397505 () Bool)

(assert (=> b!1397505 (= e!791168 e!791164)))

(declare-fun res!936418 () Bool)

(assert (=> b!1397505 (=> res!936418 e!791164)))

(declare-fun lt!614250 () SeekEntryResult!10455)

(assert (=> b!1397505 (= res!936418 (or (= lt!614256 lt!614250) (not (is-Intermediate!10455 lt!614250)) (bvslt (x!125845 lt!614256) #b00000000000000000000000000000000) (bvsgt (x!125845 lt!614256) #b01111111111111111111111111111110) (bvslt lt!614253 #b00000000000000000000000000000000) (bvsge lt!614253 (size!46688 a!2901)) (bvslt (index!44193 lt!614256) #b00000000000000000000000000000000) (bvsge (index!44193 lt!614256) (size!46688 a!2901)) (not (= lt!614256 (Intermediate!10455 false (index!44193 lt!614256) (x!125845 lt!614256)))) (not (= lt!614250 (Intermediate!10455 (undefined!11267 lt!614250) (index!44193 lt!614250) (x!125845 lt!614250))))))))

(assert (=> b!1397505 (= lt!614250 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614254 mask!2840) lt!614254 lt!614251 mask!2840))))

(assert (=> b!1397505 (= lt!614254 (select (store (arr!46138 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397505 (= lt!614251 (array!95570 (store (arr!46138 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46688 a!2901)))))

(declare-fun b!1397506 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95569 (_ BitVec 32)) SeekEntryResult!10455)

(assert (=> b!1397506 (= e!791165 (= (seekEntryOrOpen!0 (select (arr!46138 a!2901) j!112) a!2901 mask!2840) (Found!10455 j!112)))))

(declare-fun b!1397507 () Bool)

(declare-fun res!936413 () Bool)

(assert (=> b!1397507 (=> (not res!936413) (not e!791167))))

(assert (=> b!1397507 (= res!936413 (and (= (size!46688 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46688 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46688 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!936419 () Bool)

(assert (=> start!120040 (=> (not res!936419) (not e!791167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120040 (= res!936419 (validMask!0 mask!2840))))

(assert (=> start!120040 e!791167))

(assert (=> start!120040 true))

(declare-fun array_inv!35166 (array!95569) Bool)

(assert (=> start!120040 (array_inv!35166 a!2901)))

(declare-fun b!1397508 () Bool)

(declare-fun res!936420 () Bool)

(assert (=> b!1397508 (=> (not res!936420) (not e!791167))))

(declare-datatypes ((List!32657 0))(
  ( (Nil!32654) (Cons!32653 (h!33895 (_ BitVec 64)) (t!47351 List!32657)) )
))
(declare-fun arrayNoDuplicates!0 (array!95569 (_ BitVec 32) List!32657) Bool)

(assert (=> b!1397508 (= res!936420 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32654))))

(assert (= (and start!120040 res!936419) b!1397507))

(assert (= (and b!1397507 res!936413) b!1397502))

(assert (= (and b!1397502 res!936421) b!1397500))

(assert (= (and b!1397500 res!936414) b!1397501))

(assert (= (and b!1397501 res!936417) b!1397508))

(assert (= (and b!1397508 res!936420) b!1397503))

(assert (= (and b!1397503 res!936416) b!1397506))

(assert (= (and b!1397503 (not res!936415)) b!1397505))

(assert (= (and b!1397505 (not res!936418)) b!1397504))

(declare-fun m!1284291 () Bool)

(assert (=> start!120040 m!1284291))

(declare-fun m!1284293 () Bool)

(assert (=> start!120040 m!1284293))

(declare-fun m!1284295 () Bool)

(assert (=> b!1397505 m!1284295))

(assert (=> b!1397505 m!1284295))

(declare-fun m!1284297 () Bool)

(assert (=> b!1397505 m!1284297))

(declare-fun m!1284299 () Bool)

(assert (=> b!1397505 m!1284299))

(declare-fun m!1284301 () Bool)

(assert (=> b!1397505 m!1284301))

(declare-fun m!1284303 () Bool)

(assert (=> b!1397504 m!1284303))

(declare-fun m!1284305 () Bool)

(assert (=> b!1397506 m!1284305))

(assert (=> b!1397506 m!1284305))

(declare-fun m!1284307 () Bool)

(assert (=> b!1397506 m!1284307))

(declare-fun m!1284309 () Bool)

(assert (=> b!1397501 m!1284309))

(assert (=> b!1397503 m!1284305))

(declare-fun m!1284311 () Bool)

(assert (=> b!1397503 m!1284311))

(assert (=> b!1397503 m!1284305))

(declare-fun m!1284313 () Bool)

(assert (=> b!1397503 m!1284313))

(assert (=> b!1397503 m!1284305))

(declare-fun m!1284315 () Bool)

(assert (=> b!1397503 m!1284315))

(declare-fun m!1284317 () Bool)

(assert (=> b!1397503 m!1284317))

(assert (=> b!1397500 m!1284305))

(assert (=> b!1397500 m!1284305))

(declare-fun m!1284319 () Bool)

(assert (=> b!1397500 m!1284319))

(declare-fun m!1284321 () Bool)

(assert (=> b!1397502 m!1284321))

(assert (=> b!1397502 m!1284321))

(declare-fun m!1284323 () Bool)

(assert (=> b!1397502 m!1284323))

(declare-fun m!1284325 () Bool)

(assert (=> b!1397508 m!1284325))

(push 1)

