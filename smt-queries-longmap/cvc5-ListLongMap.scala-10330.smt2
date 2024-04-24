; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121656 () Bool)

(assert start!121656)

(declare-fun b!1412503 () Bool)

(declare-fun e!799423 () Bool)

(declare-fun e!799422 () Bool)

(assert (=> b!1412503 (= e!799423 (not e!799422))))

(declare-fun res!949051 () Bool)

(assert (=> b!1412503 (=> res!949051 e!799422)))

(declare-datatypes ((SeekEntryResult!10840 0))(
  ( (MissingZero!10840 (index!45737 (_ BitVec 32))) (Found!10840 (index!45738 (_ BitVec 32))) (Intermediate!10840 (undefined!11652 Bool) (index!45739 (_ BitVec 32)) (x!127478 (_ BitVec 32))) (Undefined!10840) (MissingVacant!10840 (index!45740 (_ BitVec 32))) )
))
(declare-fun lt!622064 () SeekEntryResult!10840)

(assert (=> b!1412503 (= res!949051 (or (not (is-Intermediate!10840 lt!622064)) (undefined!11652 lt!622064)))))

(declare-fun e!799421 () Bool)

(assert (=> b!1412503 e!799421))

(declare-fun res!949048 () Bool)

(assert (=> b!1412503 (=> (not res!949048) (not e!799421))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96579 0))(
  ( (array!96580 (arr!46626 (Array (_ BitVec 32) (_ BitVec 64))) (size!47177 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96579)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96579 (_ BitVec 32)) Bool)

(assert (=> b!1412503 (= res!949048 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47681 0))(
  ( (Unit!47682) )
))
(declare-fun lt!622065 () Unit!47681)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96579 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47681)

(assert (=> b!1412503 (= lt!622065 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!622063 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96579 (_ BitVec 32)) SeekEntryResult!10840)

(assert (=> b!1412503 (= lt!622064 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622063 (select (arr!46626 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412503 (= lt!622063 (toIndex!0 (select (arr!46626 a!2901) j!112) mask!2840))))

(declare-fun b!1412504 () Bool)

(declare-fun res!949049 () Bool)

(assert (=> b!1412504 (=> (not res!949049) (not e!799423))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412504 (= res!949049 (validKeyInArray!0 (select (arr!46626 a!2901) i!1037)))))

(declare-fun b!1412505 () Bool)

(declare-fun res!949054 () Bool)

(assert (=> b!1412505 (=> (not res!949054) (not e!799423))))

(declare-datatypes ((List!33132 0))(
  ( (Nil!33129) (Cons!33128 (h!34408 (_ BitVec 64)) (t!47818 List!33132)) )
))
(declare-fun arrayNoDuplicates!0 (array!96579 (_ BitVec 32) List!33132) Bool)

(assert (=> b!1412505 (= res!949054 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33129))))

(declare-fun b!1412506 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96579 (_ BitVec 32)) SeekEntryResult!10840)

(assert (=> b!1412506 (= e!799421 (= (seekEntryOrOpen!0 (select (arr!46626 a!2901) j!112) a!2901 mask!2840) (Found!10840 j!112)))))

(declare-fun b!1412507 () Bool)

(declare-fun res!949050 () Bool)

(assert (=> b!1412507 (=> (not res!949050) (not e!799423))))

(assert (=> b!1412507 (= res!949050 (validKeyInArray!0 (select (arr!46626 a!2901) j!112)))))

(declare-fun b!1412508 () Bool)

(declare-fun res!949046 () Bool)

(assert (=> b!1412508 (=> (not res!949046) (not e!799423))))

(assert (=> b!1412508 (= res!949046 (and (= (size!47177 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47177 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47177 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1412509 () Bool)

(declare-fun e!799424 () Bool)

(assert (=> b!1412509 (= e!799422 e!799424)))

(declare-fun res!949053 () Bool)

(assert (=> b!1412509 (=> res!949053 e!799424)))

(declare-fun lt!622067 () SeekEntryResult!10840)

(assert (=> b!1412509 (= res!949053 (or (= lt!622064 lt!622067) (not (is-Intermediate!10840 lt!622067))))))

(assert (=> b!1412509 (= lt!622067 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46626 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46626 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96580 (store (arr!46626 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47177 a!2901)) mask!2840))))

(declare-fun res!949047 () Bool)

(assert (=> start!121656 (=> (not res!949047) (not e!799423))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121656 (= res!949047 (validMask!0 mask!2840))))

(assert (=> start!121656 e!799423))

(assert (=> start!121656 true))

(declare-fun array_inv!35907 (array!96579) Bool)

(assert (=> start!121656 (array_inv!35907 a!2901)))

(declare-fun b!1412510 () Bool)

(assert (=> b!1412510 (= e!799424 (and (bvsge (index!45739 lt!622067) #b00000000000000000000000000000000) (bvslt (index!45739 lt!622067) (size!47177 a!2901))))))

(assert (=> b!1412510 (and (not (undefined!11652 lt!622067)) (= (index!45739 lt!622067) i!1037) (bvslt (x!127478 lt!622067) (x!127478 lt!622064)))))

(declare-fun lt!622066 () Unit!47681)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96579 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47681)

(assert (=> b!1412510 (= lt!622066 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622063 (x!127478 lt!622064) (index!45739 lt!622064) (x!127478 lt!622067) (index!45739 lt!622067) (undefined!11652 lt!622067) mask!2840))))

(declare-fun b!1412511 () Bool)

(declare-fun res!949052 () Bool)

(assert (=> b!1412511 (=> (not res!949052) (not e!799423))))

(assert (=> b!1412511 (= res!949052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121656 res!949047) b!1412508))

(assert (= (and b!1412508 res!949046) b!1412504))

(assert (= (and b!1412504 res!949049) b!1412507))

(assert (= (and b!1412507 res!949050) b!1412511))

(assert (= (and b!1412511 res!949052) b!1412505))

(assert (= (and b!1412505 res!949054) b!1412503))

(assert (= (and b!1412503 res!949048) b!1412506))

(assert (= (and b!1412503 (not res!949051)) b!1412509))

(assert (= (and b!1412509 (not res!949053)) b!1412510))

(declare-fun m!1302553 () Bool)

(assert (=> b!1412511 m!1302553))

(declare-fun m!1302555 () Bool)

(assert (=> b!1412505 m!1302555))

(declare-fun m!1302557 () Bool)

(assert (=> b!1412510 m!1302557))

(declare-fun m!1302559 () Bool)

(assert (=> b!1412509 m!1302559))

(declare-fun m!1302561 () Bool)

(assert (=> b!1412509 m!1302561))

(assert (=> b!1412509 m!1302561))

(declare-fun m!1302563 () Bool)

(assert (=> b!1412509 m!1302563))

(assert (=> b!1412509 m!1302563))

(assert (=> b!1412509 m!1302561))

(declare-fun m!1302565 () Bool)

(assert (=> b!1412509 m!1302565))

(declare-fun m!1302567 () Bool)

(assert (=> b!1412506 m!1302567))

(assert (=> b!1412506 m!1302567))

(declare-fun m!1302569 () Bool)

(assert (=> b!1412506 m!1302569))

(declare-fun m!1302571 () Bool)

(assert (=> start!121656 m!1302571))

(declare-fun m!1302573 () Bool)

(assert (=> start!121656 m!1302573))

(declare-fun m!1302575 () Bool)

(assert (=> b!1412504 m!1302575))

(assert (=> b!1412504 m!1302575))

(declare-fun m!1302577 () Bool)

(assert (=> b!1412504 m!1302577))

(assert (=> b!1412503 m!1302567))

(declare-fun m!1302579 () Bool)

(assert (=> b!1412503 m!1302579))

(assert (=> b!1412503 m!1302567))

(declare-fun m!1302581 () Bool)

(assert (=> b!1412503 m!1302581))

(assert (=> b!1412503 m!1302567))

(declare-fun m!1302583 () Bool)

(assert (=> b!1412503 m!1302583))

(declare-fun m!1302585 () Bool)

(assert (=> b!1412503 m!1302585))

(assert (=> b!1412507 m!1302567))

(assert (=> b!1412507 m!1302567))

(declare-fun m!1302587 () Bool)

(assert (=> b!1412507 m!1302587))

(push 1)

(assert (not b!1412507))

(assert (not b!1412504))

(assert (not b!1412510))

(assert (not b!1412503))

(assert (not b!1412505))

(assert (not b!1412506))

(assert (not b!1412509))

(assert (not b!1412511))

(assert (not start!121656))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

