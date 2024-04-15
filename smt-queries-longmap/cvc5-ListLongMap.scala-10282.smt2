; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120852 () Bool)

(assert start!120852)

(declare-fun b!1406135 () Bool)

(declare-fun e!795892 () Bool)

(declare-fun e!795893 () Bool)

(assert (=> b!1406135 (= e!795892 (not e!795893))))

(declare-fun res!944407 () Bool)

(assert (=> b!1406135 (=> res!944407 e!795893)))

(declare-datatypes ((SeekEntryResult!10741 0))(
  ( (MissingZero!10741 (index!45341 (_ BitVec 32))) (Found!10741 (index!45342 (_ BitVec 32))) (Intermediate!10741 (undefined!11553 Bool) (index!45343 (_ BitVec 32)) (x!126937 (_ BitVec 32))) (Undefined!10741) (MissingVacant!10741 (index!45344 (_ BitVec 32))) )
))
(declare-fun lt!619111 () SeekEntryResult!10741)

(assert (=> b!1406135 (= res!944407 (or (not (is-Intermediate!10741 lt!619111)) (undefined!11553 lt!619111)))))

(declare-fun e!795890 () Bool)

(assert (=> b!1406135 e!795890))

(declare-fun res!944406 () Bool)

(assert (=> b!1406135 (=> (not res!944406) (not e!795890))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96112 0))(
  ( (array!96113 (arr!46404 (Array (_ BitVec 32) (_ BitVec 64))) (size!46956 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96112)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96112 (_ BitVec 32)) Bool)

(assert (=> b!1406135 (= res!944406 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47299 0))(
  ( (Unit!47300) )
))
(declare-fun lt!619112 () Unit!47299)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96112 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47299)

(assert (=> b!1406135 (= lt!619112 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96112 (_ BitVec 32)) SeekEntryResult!10741)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406135 (= lt!619111 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46404 a!2901) j!112) mask!2840) (select (arr!46404 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406136 () Bool)

(assert (=> b!1406136 (= e!795893 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!619110 () SeekEntryResult!10741)

(assert (=> b!1406136 (= lt!619110 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46404 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46404 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96113 (store (arr!46404 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46956 a!2901)) mask!2840))))

(declare-fun b!1406137 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96112 (_ BitVec 32)) SeekEntryResult!10741)

(assert (=> b!1406137 (= e!795890 (= (seekEntryOrOpen!0 (select (arr!46404 a!2901) j!112) a!2901 mask!2840) (Found!10741 j!112)))))

(declare-fun res!944403 () Bool)

(assert (=> start!120852 (=> (not res!944403) (not e!795892))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120852 (= res!944403 (validMask!0 mask!2840))))

(assert (=> start!120852 e!795892))

(assert (=> start!120852 true))

(declare-fun array_inv!35637 (array!96112) Bool)

(assert (=> start!120852 (array_inv!35637 a!2901)))

(declare-fun b!1406138 () Bool)

(declare-fun res!944409 () Bool)

(assert (=> b!1406138 (=> (not res!944409) (not e!795892))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406138 (= res!944409 (validKeyInArray!0 (select (arr!46404 a!2901) i!1037)))))

(declare-fun b!1406139 () Bool)

(declare-fun res!944410 () Bool)

(assert (=> b!1406139 (=> (not res!944410) (not e!795892))))

(assert (=> b!1406139 (= res!944410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406140 () Bool)

(declare-fun res!944405 () Bool)

(assert (=> b!1406140 (=> (not res!944405) (not e!795892))))

(declare-datatypes ((List!33001 0))(
  ( (Nil!32998) (Cons!32997 (h!34251 (_ BitVec 64)) (t!47687 List!33001)) )
))
(declare-fun arrayNoDuplicates!0 (array!96112 (_ BitVec 32) List!33001) Bool)

(assert (=> b!1406140 (= res!944405 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32998))))

(declare-fun b!1406141 () Bool)

(declare-fun res!944404 () Bool)

(assert (=> b!1406141 (=> (not res!944404) (not e!795892))))

(assert (=> b!1406141 (= res!944404 (validKeyInArray!0 (select (arr!46404 a!2901) j!112)))))

(declare-fun b!1406142 () Bool)

(declare-fun res!944408 () Bool)

(assert (=> b!1406142 (=> (not res!944408) (not e!795892))))

(assert (=> b!1406142 (= res!944408 (and (= (size!46956 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46956 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46956 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120852 res!944403) b!1406142))

(assert (= (and b!1406142 res!944408) b!1406138))

(assert (= (and b!1406138 res!944409) b!1406141))

(assert (= (and b!1406141 res!944404) b!1406139))

(assert (= (and b!1406139 res!944410) b!1406140))

(assert (= (and b!1406140 res!944405) b!1406135))

(assert (= (and b!1406135 res!944406) b!1406137))

(assert (= (and b!1406135 (not res!944407)) b!1406136))

(declare-fun m!1294731 () Bool)

(assert (=> b!1406138 m!1294731))

(assert (=> b!1406138 m!1294731))

(declare-fun m!1294733 () Bool)

(assert (=> b!1406138 m!1294733))

(declare-fun m!1294735 () Bool)

(assert (=> b!1406140 m!1294735))

(declare-fun m!1294737 () Bool)

(assert (=> b!1406137 m!1294737))

(assert (=> b!1406137 m!1294737))

(declare-fun m!1294739 () Bool)

(assert (=> b!1406137 m!1294739))

(declare-fun m!1294741 () Bool)

(assert (=> b!1406136 m!1294741))

(declare-fun m!1294743 () Bool)

(assert (=> b!1406136 m!1294743))

(assert (=> b!1406136 m!1294743))

(declare-fun m!1294745 () Bool)

(assert (=> b!1406136 m!1294745))

(assert (=> b!1406136 m!1294745))

(assert (=> b!1406136 m!1294743))

(declare-fun m!1294747 () Bool)

(assert (=> b!1406136 m!1294747))

(assert (=> b!1406135 m!1294737))

(declare-fun m!1294749 () Bool)

(assert (=> b!1406135 m!1294749))

(assert (=> b!1406135 m!1294737))

(declare-fun m!1294751 () Bool)

(assert (=> b!1406135 m!1294751))

(assert (=> b!1406135 m!1294749))

(assert (=> b!1406135 m!1294737))

(declare-fun m!1294753 () Bool)

(assert (=> b!1406135 m!1294753))

(declare-fun m!1294755 () Bool)

(assert (=> b!1406135 m!1294755))

(declare-fun m!1294757 () Bool)

(assert (=> start!120852 m!1294757))

(declare-fun m!1294759 () Bool)

(assert (=> start!120852 m!1294759))

(assert (=> b!1406141 m!1294737))

(assert (=> b!1406141 m!1294737))

(declare-fun m!1294761 () Bool)

(assert (=> b!1406141 m!1294761))

(declare-fun m!1294763 () Bool)

(assert (=> b!1406139 m!1294763))

(push 1)

(assert (not b!1406137))

(assert (not b!1406136))

(assert (not b!1406135))

(assert (not b!1406140))

(assert (not b!1406139))

(assert (not start!120852))

(assert (not b!1406138))

(assert (not b!1406141))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

