; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120756 () Bool)

(assert start!120756)

(declare-fun b!1405029 () Bool)

(declare-fun res!942856 () Bool)

(declare-fun e!795580 () Bool)

(assert (=> b!1405029 (=> (not res!942856) (not e!795580))))

(declare-datatypes ((array!96087 0))(
  ( (array!96088 (arr!46392 (Array (_ BitVec 32) (_ BitVec 64))) (size!46943 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96087)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405029 (= res!942856 (validKeyInArray!0 (select (arr!46392 a!2901) j!112)))))

(declare-fun b!1405030 () Bool)

(assert (=> b!1405030 (= e!795580 (not true))))

(declare-fun e!795581 () Bool)

(assert (=> b!1405030 e!795581))

(declare-fun res!942862 () Bool)

(assert (=> b!1405030 (=> (not res!942862) (not e!795581))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96087 (_ BitVec 32)) Bool)

(assert (=> b!1405030 (= res!942862 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47255 0))(
  ( (Unit!47256) )
))
(declare-fun lt!618934 () Unit!47255)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96087 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47255)

(assert (=> b!1405030 (= lt!618934 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10612 0))(
  ( (MissingZero!10612 (index!44825 (_ BitVec 32))) (Found!10612 (index!44826 (_ BitVec 32))) (Intermediate!10612 (undefined!11424 Bool) (index!44827 (_ BitVec 32)) (x!126578 (_ BitVec 32))) (Undefined!10612) (MissingVacant!10612 (index!44828 (_ BitVec 32))) )
))
(declare-fun lt!618935 () SeekEntryResult!10612)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96087 (_ BitVec 32)) SeekEntryResult!10612)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405030 (= lt!618935 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46392 a!2901) j!112) mask!2840) (select (arr!46392 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405031 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96087 (_ BitVec 32)) SeekEntryResult!10612)

(assert (=> b!1405031 (= e!795581 (= (seekEntryOrOpen!0 (select (arr!46392 a!2901) j!112) a!2901 mask!2840) (Found!10612 j!112)))))

(declare-fun b!1405032 () Bool)

(declare-fun res!942861 () Bool)

(assert (=> b!1405032 (=> (not res!942861) (not e!795580))))

(declare-datatypes ((List!32898 0))(
  ( (Nil!32895) (Cons!32894 (h!34150 (_ BitVec 64)) (t!47584 List!32898)) )
))
(declare-fun arrayNoDuplicates!0 (array!96087 (_ BitVec 32) List!32898) Bool)

(assert (=> b!1405032 (= res!942861 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32895))))

(declare-fun res!942857 () Bool)

(assert (=> start!120756 (=> (not res!942857) (not e!795580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120756 (= res!942857 (validMask!0 mask!2840))))

(assert (=> start!120756 e!795580))

(assert (=> start!120756 true))

(declare-fun array_inv!35673 (array!96087) Bool)

(assert (=> start!120756 (array_inv!35673 a!2901)))

(declare-fun b!1405033 () Bool)

(declare-fun res!942860 () Bool)

(assert (=> b!1405033 (=> (not res!942860) (not e!795580))))

(assert (=> b!1405033 (= res!942860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405034 () Bool)

(declare-fun res!942859 () Bool)

(assert (=> b!1405034 (=> (not res!942859) (not e!795580))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1405034 (= res!942859 (and (= (size!46943 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46943 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46943 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405035 () Bool)

(declare-fun res!942858 () Bool)

(assert (=> b!1405035 (=> (not res!942858) (not e!795580))))

(assert (=> b!1405035 (= res!942858 (validKeyInArray!0 (select (arr!46392 a!2901) i!1037)))))

(assert (= (and start!120756 res!942857) b!1405034))

(assert (= (and b!1405034 res!942859) b!1405035))

(assert (= (and b!1405035 res!942858) b!1405029))

(assert (= (and b!1405029 res!942856) b!1405033))

(assert (= (and b!1405033 res!942860) b!1405032))

(assert (= (and b!1405032 res!942861) b!1405030))

(assert (= (and b!1405030 res!942862) b!1405031))

(declare-fun m!1294025 () Bool)

(assert (=> b!1405030 m!1294025))

(declare-fun m!1294027 () Bool)

(assert (=> b!1405030 m!1294027))

(assert (=> b!1405030 m!1294025))

(declare-fun m!1294029 () Bool)

(assert (=> b!1405030 m!1294029))

(assert (=> b!1405030 m!1294027))

(assert (=> b!1405030 m!1294025))

(declare-fun m!1294031 () Bool)

(assert (=> b!1405030 m!1294031))

(declare-fun m!1294033 () Bool)

(assert (=> b!1405030 m!1294033))

(declare-fun m!1294035 () Bool)

(assert (=> b!1405032 m!1294035))

(declare-fun m!1294037 () Bool)

(assert (=> b!1405033 m!1294037))

(assert (=> b!1405031 m!1294025))

(assert (=> b!1405031 m!1294025))

(declare-fun m!1294039 () Bool)

(assert (=> b!1405031 m!1294039))

(declare-fun m!1294041 () Bool)

(assert (=> start!120756 m!1294041))

(declare-fun m!1294043 () Bool)

(assert (=> start!120756 m!1294043))

(assert (=> b!1405029 m!1294025))

(assert (=> b!1405029 m!1294025))

(declare-fun m!1294045 () Bool)

(assert (=> b!1405029 m!1294045))

(declare-fun m!1294047 () Bool)

(assert (=> b!1405035 m!1294047))

(assert (=> b!1405035 m!1294047))

(declare-fun m!1294049 () Bool)

(assert (=> b!1405035 m!1294049))

(push 1)

(assert (not start!120756))

(assert (not b!1405030))

(assert (not b!1405029))

(assert (not b!1405033))

(assert (not b!1405031))

(assert (not b!1405032))

(assert (not b!1405035))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

