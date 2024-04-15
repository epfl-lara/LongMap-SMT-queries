; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120080 () Bool)

(assert start!120080)

(declare-fun res!936978 () Bool)

(declare-fun e!791458 () Bool)

(assert (=> start!120080 (=> (not res!936978) (not e!791458))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120080 (= res!936978 (validMask!0 mask!2840))))

(assert (=> start!120080 e!791458))

(assert (=> start!120080 true))

(declare-datatypes ((array!95562 0))(
  ( (array!95563 (arr!46135 (Array (_ BitVec 32) (_ BitVec 64))) (size!46687 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95562)

(declare-fun array_inv!35368 (array!95562) Bool)

(assert (=> start!120080 (array_inv!35368 a!2901)))

(declare-fun b!1398013 () Bool)

(declare-fun res!936979 () Bool)

(assert (=> b!1398013 (=> (not res!936979) (not e!791458))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95562 (_ BitVec 32)) Bool)

(assert (=> b!1398013 (= res!936979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398014 () Bool)

(declare-fun res!936983 () Bool)

(assert (=> b!1398014 (=> (not res!936983) (not e!791458))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398014 (= res!936983 (validKeyInArray!0 (select (arr!46135 a!2901) i!1037)))))

(declare-fun b!1398015 () Bool)

(declare-fun res!936981 () Bool)

(assert (=> b!1398015 (=> (not res!936981) (not e!791458))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1398015 (= res!936981 (validKeyInArray!0 (select (arr!46135 a!2901) j!112)))))

(declare-fun b!1398016 () Bool)

(declare-fun res!936982 () Bool)

(assert (=> b!1398016 (=> (not res!936982) (not e!791458))))

(declare-datatypes ((List!32732 0))(
  ( (Nil!32729) (Cons!32728 (h!33970 (_ BitVec 64)) (t!47418 List!32732)) )
))
(declare-fun arrayNoDuplicates!0 (array!95562 (_ BitVec 32) List!32732) Bool)

(assert (=> b!1398016 (= res!936982 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32729))))

(declare-fun b!1398017 () Bool)

(declare-fun e!791457 () Bool)

(assert (=> b!1398017 (= e!791457 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!10478 0))(
  ( (MissingZero!10478 (index!44283 (_ BitVec 32))) (Found!10478 (index!44284 (_ BitVec 32))) (Intermediate!10478 (undefined!11290 Bool) (index!44285 (_ BitVec 32)) (x!125929 (_ BitVec 32))) (Undefined!10478) (MissingVacant!10478 (index!44286 (_ BitVec 32))) )
))
(declare-fun lt!614513 () SeekEntryResult!10478)

(declare-fun lt!614515 () SeekEntryResult!10478)

(assert (=> b!1398017 (and (not (undefined!11290 lt!614515)) (= (index!44285 lt!614515) i!1037) (bvslt (x!125929 lt!614515) (x!125929 lt!614513)) (= (select (store (arr!46135 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44285 lt!614515)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!46803 0))(
  ( (Unit!46804) )
))
(declare-fun lt!614512 () Unit!46803)

(declare-fun lt!614516 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95562 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46803)

(assert (=> b!1398017 (= lt!614512 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!614516 (x!125929 lt!614513) (index!44285 lt!614513) (x!125929 lt!614515) (index!44285 lt!614515) (undefined!11290 lt!614515) mask!2840))))

(declare-fun b!1398018 () Bool)

(declare-fun res!936980 () Bool)

(assert (=> b!1398018 (=> (not res!936980) (not e!791458))))

(assert (=> b!1398018 (= res!936980 (and (= (size!46687 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46687 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46687 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1398019 () Bool)

(declare-fun e!791455 () Bool)

(assert (=> b!1398019 (= e!791458 (not e!791455))))

(declare-fun res!936985 () Bool)

(assert (=> b!1398019 (=> res!936985 e!791455)))

(get-info :version)

(assert (=> b!1398019 (= res!936985 (or (not ((_ is Intermediate!10478) lt!614513)) (undefined!11290 lt!614513)))))

(declare-fun e!791456 () Bool)

(assert (=> b!1398019 e!791456))

(declare-fun res!936984 () Bool)

(assert (=> b!1398019 (=> (not res!936984) (not e!791456))))

(assert (=> b!1398019 (= res!936984 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!614511 () Unit!46803)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95562 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46803)

(assert (=> b!1398019 (= lt!614511 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95562 (_ BitVec 32)) SeekEntryResult!10478)

(assert (=> b!1398019 (= lt!614513 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614516 (select (arr!46135 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398019 (= lt!614516 (toIndex!0 (select (arr!46135 a!2901) j!112) mask!2840))))

(declare-fun b!1398020 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95562 (_ BitVec 32)) SeekEntryResult!10478)

(assert (=> b!1398020 (= e!791456 (= (seekEntryOrOpen!0 (select (arr!46135 a!2901) j!112) a!2901 mask!2840) (Found!10478 j!112)))))

(declare-fun b!1398021 () Bool)

(assert (=> b!1398021 (= e!791455 e!791457)))

(declare-fun res!936977 () Bool)

(assert (=> b!1398021 (=> res!936977 e!791457)))

(assert (=> b!1398021 (= res!936977 (or (= lt!614513 lt!614515) (not ((_ is Intermediate!10478) lt!614515))))))

(declare-fun lt!614514 () (_ BitVec 64))

(assert (=> b!1398021 (= lt!614515 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614514 mask!2840) lt!614514 (array!95563 (store (arr!46135 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46687 a!2901)) mask!2840))))

(assert (=> b!1398021 (= lt!614514 (select (store (arr!46135 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (= (and start!120080 res!936978) b!1398018))

(assert (= (and b!1398018 res!936980) b!1398014))

(assert (= (and b!1398014 res!936983) b!1398015))

(assert (= (and b!1398015 res!936981) b!1398013))

(assert (= (and b!1398013 res!936979) b!1398016))

(assert (= (and b!1398016 res!936982) b!1398019))

(assert (= (and b!1398019 res!936984) b!1398020))

(assert (= (and b!1398019 (not res!936985)) b!1398021))

(assert (= (and b!1398021 (not res!936977)) b!1398017))

(declare-fun m!1284553 () Bool)

(assert (=> b!1398017 m!1284553))

(declare-fun m!1284555 () Bool)

(assert (=> b!1398017 m!1284555))

(declare-fun m!1284557 () Bool)

(assert (=> b!1398017 m!1284557))

(declare-fun m!1284559 () Bool)

(assert (=> b!1398013 m!1284559))

(declare-fun m!1284561 () Bool)

(assert (=> b!1398016 m!1284561))

(declare-fun m!1284563 () Bool)

(assert (=> b!1398021 m!1284563))

(assert (=> b!1398021 m!1284553))

(assert (=> b!1398021 m!1284563))

(declare-fun m!1284565 () Bool)

(assert (=> b!1398021 m!1284565))

(declare-fun m!1284567 () Bool)

(assert (=> b!1398021 m!1284567))

(declare-fun m!1284569 () Bool)

(assert (=> b!1398014 m!1284569))

(assert (=> b!1398014 m!1284569))

(declare-fun m!1284571 () Bool)

(assert (=> b!1398014 m!1284571))

(declare-fun m!1284573 () Bool)

(assert (=> b!1398019 m!1284573))

(declare-fun m!1284575 () Bool)

(assert (=> b!1398019 m!1284575))

(assert (=> b!1398019 m!1284573))

(declare-fun m!1284577 () Bool)

(assert (=> b!1398019 m!1284577))

(assert (=> b!1398019 m!1284573))

(declare-fun m!1284579 () Bool)

(assert (=> b!1398019 m!1284579))

(declare-fun m!1284581 () Bool)

(assert (=> b!1398019 m!1284581))

(declare-fun m!1284583 () Bool)

(assert (=> start!120080 m!1284583))

(declare-fun m!1284585 () Bool)

(assert (=> start!120080 m!1284585))

(assert (=> b!1398015 m!1284573))

(assert (=> b!1398015 m!1284573))

(declare-fun m!1284587 () Bool)

(assert (=> b!1398015 m!1284587))

(assert (=> b!1398020 m!1284573))

(assert (=> b!1398020 m!1284573))

(declare-fun m!1284589 () Bool)

(assert (=> b!1398020 m!1284589))

(check-sat (not b!1398019) (not b!1398015) (not b!1398013) (not b!1398020) (not b!1398014) (not start!120080) (not b!1398021) (not b!1398017) (not b!1398016))
(check-sat)
