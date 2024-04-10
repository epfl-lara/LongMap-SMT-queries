; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121116 () Bool)

(assert start!121116)

(declare-fun b!1408222 () Bool)

(declare-fun res!945950 () Bool)

(declare-fun e!796995 () Bool)

(assert (=> b!1408222 (=> (not res!945950) (not e!796995))))

(declare-datatypes ((array!96270 0))(
  ( (array!96271 (arr!46478 (Array (_ BitVec 32) (_ BitVec 64))) (size!47028 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96270)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408222 (= res!945950 (validKeyInArray!0 (select (arr!46478 a!2901) j!112)))))

(declare-fun b!1408223 () Bool)

(declare-fun e!796994 () Bool)

(declare-fun e!796997 () Bool)

(assert (=> b!1408223 (= e!796994 e!796997)))

(declare-fun res!945945 () Bool)

(assert (=> b!1408223 (=> res!945945 e!796997)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!620211 () array!96270)

(declare-datatypes ((SeekEntryResult!10789 0))(
  ( (MissingZero!10789 (index!45533 (_ BitVec 32))) (Found!10789 (index!45534 (_ BitVec 32))) (Intermediate!10789 (undefined!11601 Bool) (index!45535 (_ BitVec 32)) (x!127142 (_ BitVec 32))) (Undefined!10789) (MissingVacant!10789 (index!45536 (_ BitVec 32))) )
))
(declare-fun lt!620210 () SeekEntryResult!10789)

(declare-fun lt!620212 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96270 (_ BitVec 32)) SeekEntryResult!10789)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408223 (= res!945945 (not (= lt!620210 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!620212 mask!2840) lt!620212 lt!620211 mask!2840))))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1408223 (= lt!620212 (select (store (arr!46478 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1408223 (= lt!620211 (array!96271 (store (arr!46478 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47028 a!2901)))))

(declare-fun b!1408224 () Bool)

(declare-fun res!945948 () Bool)

(assert (=> b!1408224 (=> res!945948 e!796997)))

(declare-fun lt!620214 () (_ BitVec 32))

(assert (=> b!1408224 (= res!945948 (or (bvslt (x!127142 lt!620210) #b00000000000000000000000000000000) (bvsgt (x!127142 lt!620210) #b01111111111111111111111111111110) (bvslt lt!620214 #b00000000000000000000000000000000) (bvsge lt!620214 (size!47028 a!2901)) (bvslt (index!45535 lt!620210) #b00000000000000000000000000000000) (bvsge (index!45535 lt!620210) (size!47028 a!2901)) (not (= lt!620210 (Intermediate!10789 false (index!45535 lt!620210) (x!127142 lt!620210))))))))

(declare-fun res!945947 () Bool)

(assert (=> start!121116 (=> (not res!945947) (not e!796995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121116 (= res!945947 (validMask!0 mask!2840))))

(assert (=> start!121116 e!796995))

(assert (=> start!121116 true))

(declare-fun array_inv!35506 (array!96270) Bool)

(assert (=> start!121116 (array_inv!35506 a!2901)))

(declare-fun b!1408225 () Bool)

(declare-fun res!945952 () Bool)

(assert (=> b!1408225 (=> (not res!945952) (not e!796995))))

(declare-datatypes ((List!32997 0))(
  ( (Nil!32994) (Cons!32993 (h!34256 (_ BitVec 64)) (t!47691 List!32997)) )
))
(declare-fun arrayNoDuplicates!0 (array!96270 (_ BitVec 32) List!32997) Bool)

(assert (=> b!1408225 (= res!945952 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32994))))

(declare-fun b!1408226 () Bool)

(declare-fun res!945946 () Bool)

(assert (=> b!1408226 (=> (not res!945946) (not e!796995))))

(assert (=> b!1408226 (= res!945946 (validKeyInArray!0 (select (arr!46478 a!2901) i!1037)))))

(declare-fun b!1408227 () Bool)

(declare-fun res!945949 () Bool)

(assert (=> b!1408227 (=> (not res!945949) (not e!796995))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96270 (_ BitVec 32)) Bool)

(assert (=> b!1408227 (= res!945949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408228 () Bool)

(declare-fun res!945944 () Bool)

(assert (=> b!1408228 (=> (not res!945944) (not e!796995))))

(assert (=> b!1408228 (= res!945944 (and (= (size!47028 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47028 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47028 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408229 () Bool)

(assert (=> b!1408229 (= e!796997 true)))

(declare-fun lt!620213 () SeekEntryResult!10789)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96270 (_ BitVec 32)) SeekEntryResult!10789)

(assert (=> b!1408229 (= lt!620213 (seekEntryOrOpen!0 lt!620212 lt!620211 mask!2840))))

(declare-datatypes ((Unit!47552 0))(
  ( (Unit!47553) )
))
(declare-fun lt!620209 () Unit!47552)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!96270 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47552)

(assert (=> b!1408229 (= lt!620209 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!620214 (x!127142 lt!620210) (index!45535 lt!620210) mask!2840))))

(declare-fun b!1408230 () Bool)

(assert (=> b!1408230 (= e!796995 (not e!796994))))

(declare-fun res!945951 () Bool)

(assert (=> b!1408230 (=> res!945951 e!796994)))

(assert (=> b!1408230 (= res!945951 (or (not (is-Intermediate!10789 lt!620210)) (undefined!11601 lt!620210)))))

(assert (=> b!1408230 (= lt!620213 (Found!10789 j!112))))

(assert (=> b!1408230 (= lt!620213 (seekEntryOrOpen!0 (select (arr!46478 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1408230 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!620208 () Unit!47552)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96270 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47552)

(assert (=> b!1408230 (= lt!620208 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1408230 (= lt!620210 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620214 (select (arr!46478 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1408230 (= lt!620214 (toIndex!0 (select (arr!46478 a!2901) j!112) mask!2840))))

(assert (= (and start!121116 res!945947) b!1408228))

(assert (= (and b!1408228 res!945944) b!1408226))

(assert (= (and b!1408226 res!945946) b!1408222))

(assert (= (and b!1408222 res!945950) b!1408227))

(assert (= (and b!1408227 res!945949) b!1408225))

(assert (= (and b!1408225 res!945952) b!1408230))

(assert (= (and b!1408230 (not res!945951)) b!1408223))

(assert (= (and b!1408223 (not res!945945)) b!1408224))

(assert (= (and b!1408224 (not res!945948)) b!1408229))

(declare-fun m!1297431 () Bool)

(assert (=> b!1408227 m!1297431))

(declare-fun m!1297433 () Bool)

(assert (=> b!1408225 m!1297433))

(declare-fun m!1297435 () Bool)

(assert (=> b!1408230 m!1297435))

(declare-fun m!1297437 () Bool)

(assert (=> b!1408230 m!1297437))

(assert (=> b!1408230 m!1297435))

(declare-fun m!1297439 () Bool)

(assert (=> b!1408230 m!1297439))

(assert (=> b!1408230 m!1297435))

(declare-fun m!1297441 () Bool)

(assert (=> b!1408230 m!1297441))

(assert (=> b!1408230 m!1297435))

(declare-fun m!1297443 () Bool)

(assert (=> b!1408230 m!1297443))

(declare-fun m!1297445 () Bool)

(assert (=> b!1408230 m!1297445))

(declare-fun m!1297447 () Bool)

(assert (=> start!121116 m!1297447))

(declare-fun m!1297449 () Bool)

(assert (=> start!121116 m!1297449))

(declare-fun m!1297451 () Bool)

(assert (=> b!1408223 m!1297451))

(assert (=> b!1408223 m!1297451))

(declare-fun m!1297453 () Bool)

(assert (=> b!1408223 m!1297453))

(declare-fun m!1297455 () Bool)

(assert (=> b!1408223 m!1297455))

(declare-fun m!1297457 () Bool)

(assert (=> b!1408223 m!1297457))

(assert (=> b!1408222 m!1297435))

(assert (=> b!1408222 m!1297435))

(declare-fun m!1297459 () Bool)

(assert (=> b!1408222 m!1297459))

(declare-fun m!1297461 () Bool)

(assert (=> b!1408229 m!1297461))

(declare-fun m!1297463 () Bool)

(assert (=> b!1408229 m!1297463))

(declare-fun m!1297465 () Bool)

(assert (=> b!1408226 m!1297465))

(assert (=> b!1408226 m!1297465))

(declare-fun m!1297467 () Bool)

(assert (=> b!1408226 m!1297467))

(push 1)

(assert (not b!1408229))

(assert (not b!1408227))

(assert (not b!1408230))

(assert (not b!1408222))

(assert (not b!1408225))

(assert (not b!1408223))

(assert (not b!1408226))

(assert (not start!121116))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

