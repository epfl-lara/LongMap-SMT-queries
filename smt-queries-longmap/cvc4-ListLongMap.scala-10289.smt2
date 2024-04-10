; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120898 () Bool)

(assert start!120898)

(declare-fun b!1406720 () Bool)

(declare-fun e!796184 () Bool)

(assert (=> b!1406720 (= e!796184 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96205 0))(
  ( (array!96206 (arr!46450 (Array (_ BitVec 32) (_ BitVec 64))) (size!47000 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96205)

(declare-datatypes ((SeekEntryResult!10761 0))(
  ( (MissingZero!10761 (index!45421 (_ BitVec 32))) (Found!10761 (index!45422 (_ BitVec 32))) (Intermediate!10761 (undefined!11573 Bool) (index!45423 (_ BitVec 32)) (x!127016 (_ BitVec 32))) (Undefined!10761) (MissingVacant!10761 (index!45424 (_ BitVec 32))) )
))
(declare-fun lt!619491 () SeekEntryResult!10761)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96205 (_ BitVec 32)) SeekEntryResult!10761)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406720 (= lt!619491 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46450 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46450 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96206 (store (arr!46450 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47000 a!2901)) mask!2840))))

(declare-fun b!1406722 () Bool)

(declare-fun e!796183 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96205 (_ BitVec 32)) SeekEntryResult!10761)

(assert (=> b!1406722 (= e!796183 (= (seekEntryOrOpen!0 (select (arr!46450 a!2901) j!112) a!2901 mask!2840) (Found!10761 j!112)))))

(declare-fun b!1406723 () Bool)

(declare-fun res!944938 () Bool)

(declare-fun e!796182 () Bool)

(assert (=> b!1406723 (=> (not res!944938) (not e!796182))))

(assert (=> b!1406723 (= res!944938 (and (= (size!47000 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47000 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47000 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406724 () Bool)

(declare-fun res!944939 () Bool)

(assert (=> b!1406724 (=> (not res!944939) (not e!796182))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96205 (_ BitVec 32)) Bool)

(assert (=> b!1406724 (= res!944939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406725 () Bool)

(declare-fun res!944942 () Bool)

(assert (=> b!1406725 (=> (not res!944942) (not e!796182))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406725 (= res!944942 (validKeyInArray!0 (select (arr!46450 a!2901) i!1037)))))

(declare-fun b!1406726 () Bool)

(assert (=> b!1406726 (= e!796182 (not e!796184))))

(declare-fun res!944941 () Bool)

(assert (=> b!1406726 (=> res!944941 e!796184)))

(declare-fun lt!619489 () SeekEntryResult!10761)

(assert (=> b!1406726 (= res!944941 (or (not (is-Intermediate!10761 lt!619489)) (undefined!11573 lt!619489)))))

(assert (=> b!1406726 e!796183))

(declare-fun res!944944 () Bool)

(assert (=> b!1406726 (=> (not res!944944) (not e!796183))))

(assert (=> b!1406726 (= res!944944 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47496 0))(
  ( (Unit!47497) )
))
(declare-fun lt!619490 () Unit!47496)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96205 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47496)

(assert (=> b!1406726 (= lt!619490 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1406726 (= lt!619489 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46450 a!2901) j!112) mask!2840) (select (arr!46450 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406727 () Bool)

(declare-fun res!944940 () Bool)

(assert (=> b!1406727 (=> (not res!944940) (not e!796182))))

(declare-datatypes ((List!32969 0))(
  ( (Nil!32966) (Cons!32965 (h!34219 (_ BitVec 64)) (t!47663 List!32969)) )
))
(declare-fun arrayNoDuplicates!0 (array!96205 (_ BitVec 32) List!32969) Bool)

(assert (=> b!1406727 (= res!944940 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32966))))

(declare-fun b!1406721 () Bool)

(declare-fun res!944943 () Bool)

(assert (=> b!1406721 (=> (not res!944943) (not e!796182))))

(assert (=> b!1406721 (= res!944943 (validKeyInArray!0 (select (arr!46450 a!2901) j!112)))))

(declare-fun res!944937 () Bool)

(assert (=> start!120898 (=> (not res!944937) (not e!796182))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120898 (= res!944937 (validMask!0 mask!2840))))

(assert (=> start!120898 e!796182))

(assert (=> start!120898 true))

(declare-fun array_inv!35478 (array!96205) Bool)

(assert (=> start!120898 (array_inv!35478 a!2901)))

(assert (= (and start!120898 res!944937) b!1406723))

(assert (= (and b!1406723 res!944938) b!1406725))

(assert (= (and b!1406725 res!944942) b!1406721))

(assert (= (and b!1406721 res!944943) b!1406724))

(assert (= (and b!1406724 res!944939) b!1406727))

(assert (= (and b!1406727 res!944940) b!1406726))

(assert (= (and b!1406726 res!944944) b!1406722))

(assert (= (and b!1406726 (not res!944941)) b!1406720))

(declare-fun m!1295981 () Bool)

(assert (=> b!1406720 m!1295981))

(declare-fun m!1295983 () Bool)

(assert (=> b!1406720 m!1295983))

(assert (=> b!1406720 m!1295983))

(declare-fun m!1295985 () Bool)

(assert (=> b!1406720 m!1295985))

(assert (=> b!1406720 m!1295985))

(assert (=> b!1406720 m!1295983))

(declare-fun m!1295987 () Bool)

(assert (=> b!1406720 m!1295987))

(declare-fun m!1295989 () Bool)

(assert (=> b!1406724 m!1295989))

(declare-fun m!1295991 () Bool)

(assert (=> b!1406726 m!1295991))

(declare-fun m!1295993 () Bool)

(assert (=> b!1406726 m!1295993))

(assert (=> b!1406726 m!1295991))

(declare-fun m!1295995 () Bool)

(assert (=> b!1406726 m!1295995))

(assert (=> b!1406726 m!1295993))

(assert (=> b!1406726 m!1295991))

(declare-fun m!1295997 () Bool)

(assert (=> b!1406726 m!1295997))

(declare-fun m!1295999 () Bool)

(assert (=> b!1406726 m!1295999))

(declare-fun m!1296001 () Bool)

(assert (=> b!1406725 m!1296001))

(assert (=> b!1406725 m!1296001))

(declare-fun m!1296003 () Bool)

(assert (=> b!1406725 m!1296003))

(assert (=> b!1406721 m!1295991))

(assert (=> b!1406721 m!1295991))

(declare-fun m!1296005 () Bool)

(assert (=> b!1406721 m!1296005))

(declare-fun m!1296007 () Bool)

(assert (=> b!1406727 m!1296007))

(declare-fun m!1296009 () Bool)

(assert (=> start!120898 m!1296009))

(declare-fun m!1296011 () Bool)

(assert (=> start!120898 m!1296011))

(assert (=> b!1406722 m!1295991))

(assert (=> b!1406722 m!1295991))

(declare-fun m!1296013 () Bool)

(assert (=> b!1406722 m!1296013))

(push 1)

(assert (not b!1406722))

(assert (not b!1406720))

(assert (not b!1406727))

(assert (not b!1406721))

(assert (not start!120898))

(assert (not b!1406726))

(assert (not b!1406724))

(assert (not b!1406725))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

