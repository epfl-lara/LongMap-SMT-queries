; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120990 () Bool)

(assert start!120990)

(declare-fun b!1406718 () Bool)

(declare-fun e!796354 () Bool)

(assert (=> b!1406718 (= e!796354 (not true))))

(declare-fun e!796353 () Bool)

(assert (=> b!1406718 e!796353))

(declare-fun res!944251 () Bool)

(assert (=> b!1406718 (=> (not res!944251) (not e!796353))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96219 0))(
  ( (array!96220 (arr!46455 (Array (_ BitVec 32) (_ BitVec 64))) (size!47006 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96219)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96219 (_ BitVec 32)) Bool)

(assert (=> b!1406718 (= res!944251 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47339 0))(
  ( (Unit!47340) )
))
(declare-fun lt!619465 () Unit!47339)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96219 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47339)

(assert (=> b!1406718 (= lt!619465 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10669 0))(
  ( (MissingZero!10669 (index!45053 (_ BitVec 32))) (Found!10669 (index!45054 (_ BitVec 32))) (Intermediate!10669 (undefined!11481 Bool) (index!45055 (_ BitVec 32)) (x!126815 (_ BitVec 32))) (Undefined!10669) (MissingVacant!10669 (index!45056 (_ BitVec 32))) )
))
(declare-fun lt!619466 () SeekEntryResult!10669)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96219 (_ BitVec 32)) SeekEntryResult!10669)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406718 (= lt!619466 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46455 a!2901) j!112) mask!2840) (select (arr!46455 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406719 () Bool)

(declare-fun res!944256 () Bool)

(assert (=> b!1406719 (=> (not res!944256) (not e!796354))))

(declare-datatypes ((List!32961 0))(
  ( (Nil!32958) (Cons!32957 (h!34219 (_ BitVec 64)) (t!47647 List!32961)) )
))
(declare-fun arrayNoDuplicates!0 (array!96219 (_ BitVec 32) List!32961) Bool)

(assert (=> b!1406719 (= res!944256 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32958))))

(declare-fun b!1406720 () Bool)

(declare-fun res!944253 () Bool)

(assert (=> b!1406720 (=> (not res!944253) (not e!796354))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1406720 (= res!944253 (and (= (size!47006 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47006 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47006 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406721 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96219 (_ BitVec 32)) SeekEntryResult!10669)

(assert (=> b!1406721 (= e!796353 (= (seekEntryOrOpen!0 (select (arr!46455 a!2901) j!112) a!2901 mask!2840) (Found!10669 j!112)))))

(declare-fun b!1406723 () Bool)

(declare-fun res!944252 () Bool)

(assert (=> b!1406723 (=> (not res!944252) (not e!796354))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406723 (= res!944252 (validKeyInArray!0 (select (arr!46455 a!2901) i!1037)))))

(declare-fun b!1406724 () Bool)

(declare-fun res!944257 () Bool)

(assert (=> b!1406724 (=> (not res!944257) (not e!796354))))

(assert (=> b!1406724 (= res!944257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406722 () Bool)

(declare-fun res!944254 () Bool)

(assert (=> b!1406722 (=> (not res!944254) (not e!796354))))

(assert (=> b!1406722 (= res!944254 (validKeyInArray!0 (select (arr!46455 a!2901) j!112)))))

(declare-fun res!944255 () Bool)

(assert (=> start!120990 (=> (not res!944255) (not e!796354))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120990 (= res!944255 (validMask!0 mask!2840))))

(assert (=> start!120990 e!796354))

(assert (=> start!120990 true))

(declare-fun array_inv!35736 (array!96219) Bool)

(assert (=> start!120990 (array_inv!35736 a!2901)))

(assert (= (and start!120990 res!944255) b!1406720))

(assert (= (and b!1406720 res!944253) b!1406723))

(assert (= (and b!1406723 res!944252) b!1406722))

(assert (= (and b!1406722 res!944254) b!1406724))

(assert (= (and b!1406724 res!944257) b!1406719))

(assert (= (and b!1406719 res!944256) b!1406718))

(assert (= (and b!1406718 res!944251) b!1406721))

(declare-fun m!1295765 () Bool)

(assert (=> b!1406723 m!1295765))

(assert (=> b!1406723 m!1295765))

(declare-fun m!1295767 () Bool)

(assert (=> b!1406723 m!1295767))

(declare-fun m!1295769 () Bool)

(assert (=> b!1406718 m!1295769))

(declare-fun m!1295771 () Bool)

(assert (=> b!1406718 m!1295771))

(assert (=> b!1406718 m!1295769))

(declare-fun m!1295773 () Bool)

(assert (=> b!1406718 m!1295773))

(assert (=> b!1406718 m!1295771))

(assert (=> b!1406718 m!1295769))

(declare-fun m!1295775 () Bool)

(assert (=> b!1406718 m!1295775))

(declare-fun m!1295777 () Bool)

(assert (=> b!1406718 m!1295777))

(assert (=> b!1406722 m!1295769))

(assert (=> b!1406722 m!1295769))

(declare-fun m!1295779 () Bool)

(assert (=> b!1406722 m!1295779))

(declare-fun m!1295781 () Bool)

(assert (=> b!1406724 m!1295781))

(declare-fun m!1295783 () Bool)

(assert (=> start!120990 m!1295783))

(declare-fun m!1295785 () Bool)

(assert (=> start!120990 m!1295785))

(assert (=> b!1406721 m!1295769))

(assert (=> b!1406721 m!1295769))

(declare-fun m!1295787 () Bool)

(assert (=> b!1406721 m!1295787))

(declare-fun m!1295789 () Bool)

(assert (=> b!1406719 m!1295789))

(push 1)

(assert (not b!1406719))

(assert (not b!1406721))

(assert (not b!1406724))

(assert (not b!1406718))

(assert (not b!1406723))

(assert (not start!120990))

(assert (not b!1406722))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

