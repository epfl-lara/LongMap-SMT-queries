; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120782 () Bool)

(assert start!120782)

(declare-fun b!1405368 () Bool)

(declare-fun e!795527 () Bool)

(assert (=> b!1405368 (= e!795527 (not true))))

(declare-fun e!795526 () Bool)

(assert (=> b!1405368 e!795526))

(declare-fun res!943589 () Bool)

(assert (=> b!1405368 (=> (not res!943589) (not e!795526))))

(declare-datatypes ((array!96089 0))(
  ( (array!96090 (arr!46392 (Array (_ BitVec 32) (_ BitVec 64))) (size!46942 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96089)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96089 (_ BitVec 32)) Bool)

(assert (=> b!1405368 (= res!943589 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47380 0))(
  ( (Unit!47381) )
))
(declare-fun lt!619007 () Unit!47380)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96089 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47380)

(assert (=> b!1405368 (= lt!619007 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10703 0))(
  ( (MissingZero!10703 (index!45189 (_ BitVec 32))) (Found!10703 (index!45190 (_ BitVec 32))) (Intermediate!10703 (undefined!11515 Bool) (index!45191 (_ BitVec 32)) (x!126806 (_ BitVec 32))) (Undefined!10703) (MissingVacant!10703 (index!45192 (_ BitVec 32))) )
))
(declare-fun lt!619008 () SeekEntryResult!10703)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96089 (_ BitVec 32)) SeekEntryResult!10703)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405368 (= lt!619008 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46392 a!2901) j!112) mask!2840) (select (arr!46392 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405369 () Bool)

(declare-fun res!943588 () Bool)

(assert (=> b!1405369 (=> (not res!943588) (not e!795527))))

(declare-datatypes ((List!32911 0))(
  ( (Nil!32908) (Cons!32907 (h!34161 (_ BitVec 64)) (t!47605 List!32911)) )
))
(declare-fun arrayNoDuplicates!0 (array!96089 (_ BitVec 32) List!32911) Bool)

(assert (=> b!1405369 (= res!943588 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32908))))

(declare-fun b!1405370 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96089 (_ BitVec 32)) SeekEntryResult!10703)

(assert (=> b!1405370 (= e!795526 (= (seekEntryOrOpen!0 (select (arr!46392 a!2901) j!112) a!2901 mask!2840) (Found!10703 j!112)))))

(declare-fun b!1405371 () Bool)

(declare-fun res!943585 () Bool)

(assert (=> b!1405371 (=> (not res!943585) (not e!795527))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1405371 (= res!943585 (and (= (size!46942 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46942 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46942 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405372 () Bool)

(declare-fun res!943590 () Bool)

(assert (=> b!1405372 (=> (not res!943590) (not e!795527))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405372 (= res!943590 (validKeyInArray!0 (select (arr!46392 a!2901) i!1037)))))

(declare-fun b!1405373 () Bool)

(declare-fun res!943586 () Bool)

(assert (=> b!1405373 (=> (not res!943586) (not e!795527))))

(assert (=> b!1405373 (= res!943586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!943587 () Bool)

(assert (=> start!120782 (=> (not res!943587) (not e!795527))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120782 (= res!943587 (validMask!0 mask!2840))))

(assert (=> start!120782 e!795527))

(assert (=> start!120782 true))

(declare-fun array_inv!35420 (array!96089) Bool)

(assert (=> start!120782 (array_inv!35420 a!2901)))

(declare-fun b!1405374 () Bool)

(declare-fun res!943591 () Bool)

(assert (=> b!1405374 (=> (not res!943591) (not e!795527))))

(assert (=> b!1405374 (= res!943591 (validKeyInArray!0 (select (arr!46392 a!2901) j!112)))))

(assert (= (and start!120782 res!943587) b!1405371))

(assert (= (and b!1405371 res!943585) b!1405372))

(assert (= (and b!1405372 res!943590) b!1405374))

(assert (= (and b!1405374 res!943591) b!1405373))

(assert (= (and b!1405373 res!943586) b!1405369))

(assert (= (and b!1405369 res!943588) b!1405368))

(assert (= (and b!1405368 res!943589) b!1405370))

(declare-fun m!1294133 () Bool)

(assert (=> b!1405370 m!1294133))

(assert (=> b!1405370 m!1294133))

(declare-fun m!1294135 () Bool)

(assert (=> b!1405370 m!1294135))

(assert (=> b!1405374 m!1294133))

(assert (=> b!1405374 m!1294133))

(declare-fun m!1294137 () Bool)

(assert (=> b!1405374 m!1294137))

(declare-fun m!1294139 () Bool)

(assert (=> b!1405373 m!1294139))

(declare-fun m!1294141 () Bool)

(assert (=> b!1405369 m!1294141))

(declare-fun m!1294143 () Bool)

(assert (=> start!120782 m!1294143))

(declare-fun m!1294145 () Bool)

(assert (=> start!120782 m!1294145))

(assert (=> b!1405368 m!1294133))

(declare-fun m!1294147 () Bool)

(assert (=> b!1405368 m!1294147))

(assert (=> b!1405368 m!1294133))

(declare-fun m!1294149 () Bool)

(assert (=> b!1405368 m!1294149))

(assert (=> b!1405368 m!1294147))

(assert (=> b!1405368 m!1294133))

(declare-fun m!1294151 () Bool)

(assert (=> b!1405368 m!1294151))

(declare-fun m!1294153 () Bool)

(assert (=> b!1405368 m!1294153))

(declare-fun m!1294155 () Bool)

(assert (=> b!1405372 m!1294155))

(assert (=> b!1405372 m!1294155))

(declare-fun m!1294157 () Bool)

(assert (=> b!1405372 m!1294157))

(check-sat (not b!1405372) (not start!120782) (not b!1405370) (not b!1405369) (not b!1405374) (not b!1405368) (not b!1405373))
