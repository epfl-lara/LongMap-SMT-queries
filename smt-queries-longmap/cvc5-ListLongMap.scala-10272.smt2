; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120984 () Bool)

(assert start!120984)

(declare-fun b!1406655 () Bool)

(declare-fun e!796327 () Bool)

(assert (=> b!1406655 (= e!796327 (not true))))

(declare-fun e!796328 () Bool)

(assert (=> b!1406655 e!796328))

(declare-fun res!944190 () Bool)

(assert (=> b!1406655 (=> (not res!944190) (not e!796328))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96213 0))(
  ( (array!96214 (arr!46452 (Array (_ BitVec 32) (_ BitVec 64))) (size!47003 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96213)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96213 (_ BitVec 32)) Bool)

(assert (=> b!1406655 (= res!944190 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47333 0))(
  ( (Unit!47334) )
))
(declare-fun lt!619448 () Unit!47333)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96213 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47333)

(assert (=> b!1406655 (= lt!619448 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10666 0))(
  ( (MissingZero!10666 (index!45041 (_ BitVec 32))) (Found!10666 (index!45042 (_ BitVec 32))) (Intermediate!10666 (undefined!11478 Bool) (index!45043 (_ BitVec 32)) (x!126804 (_ BitVec 32))) (Undefined!10666) (MissingVacant!10666 (index!45044 (_ BitVec 32))) )
))
(declare-fun lt!619447 () SeekEntryResult!10666)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96213 (_ BitVec 32)) SeekEntryResult!10666)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406655 (= lt!619447 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46452 a!2901) j!112) mask!2840) (select (arr!46452 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406656 () Bool)

(declare-fun res!944191 () Bool)

(assert (=> b!1406656 (=> (not res!944191) (not e!796327))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406656 (= res!944191 (validKeyInArray!0 (select (arr!46452 a!2901) i!1037)))))

(declare-fun b!1406657 () Bool)

(declare-fun res!944192 () Bool)

(assert (=> b!1406657 (=> (not res!944192) (not e!796327))))

(assert (=> b!1406657 (= res!944192 (and (= (size!47003 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47003 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47003 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406658 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96213 (_ BitVec 32)) SeekEntryResult!10666)

(assert (=> b!1406658 (= e!796328 (= (seekEntryOrOpen!0 (select (arr!46452 a!2901) j!112) a!2901 mask!2840) (Found!10666 j!112)))))

(declare-fun b!1406660 () Bool)

(declare-fun res!944189 () Bool)

(assert (=> b!1406660 (=> (not res!944189) (not e!796327))))

(assert (=> b!1406660 (= res!944189 (validKeyInArray!0 (select (arr!46452 a!2901) j!112)))))

(declare-fun b!1406661 () Bool)

(declare-fun res!944193 () Bool)

(assert (=> b!1406661 (=> (not res!944193) (not e!796327))))

(declare-datatypes ((List!32958 0))(
  ( (Nil!32955) (Cons!32954 (h!34216 (_ BitVec 64)) (t!47644 List!32958)) )
))
(declare-fun arrayNoDuplicates!0 (array!96213 (_ BitVec 32) List!32958) Bool)

(assert (=> b!1406661 (= res!944193 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32955))))

(declare-fun b!1406659 () Bool)

(declare-fun res!944188 () Bool)

(assert (=> b!1406659 (=> (not res!944188) (not e!796327))))

(assert (=> b!1406659 (= res!944188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!944194 () Bool)

(assert (=> start!120984 (=> (not res!944194) (not e!796327))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120984 (= res!944194 (validMask!0 mask!2840))))

(assert (=> start!120984 e!796327))

(assert (=> start!120984 true))

(declare-fun array_inv!35733 (array!96213) Bool)

(assert (=> start!120984 (array_inv!35733 a!2901)))

(assert (= (and start!120984 res!944194) b!1406657))

(assert (= (and b!1406657 res!944192) b!1406656))

(assert (= (and b!1406656 res!944191) b!1406660))

(assert (= (and b!1406660 res!944189) b!1406659))

(assert (= (and b!1406659 res!944188) b!1406661))

(assert (= (and b!1406661 res!944193) b!1406655))

(assert (= (and b!1406655 res!944190) b!1406658))

(declare-fun m!1295687 () Bool)

(assert (=> b!1406659 m!1295687))

(declare-fun m!1295689 () Bool)

(assert (=> b!1406658 m!1295689))

(assert (=> b!1406658 m!1295689))

(declare-fun m!1295691 () Bool)

(assert (=> b!1406658 m!1295691))

(declare-fun m!1295693 () Bool)

(assert (=> b!1406656 m!1295693))

(assert (=> b!1406656 m!1295693))

(declare-fun m!1295695 () Bool)

(assert (=> b!1406656 m!1295695))

(declare-fun m!1295697 () Bool)

(assert (=> start!120984 m!1295697))

(declare-fun m!1295699 () Bool)

(assert (=> start!120984 m!1295699))

(declare-fun m!1295701 () Bool)

(assert (=> b!1406661 m!1295701))

(assert (=> b!1406655 m!1295689))

(declare-fun m!1295703 () Bool)

(assert (=> b!1406655 m!1295703))

(assert (=> b!1406655 m!1295689))

(declare-fun m!1295705 () Bool)

(assert (=> b!1406655 m!1295705))

(assert (=> b!1406655 m!1295703))

(assert (=> b!1406655 m!1295689))

(declare-fun m!1295707 () Bool)

(assert (=> b!1406655 m!1295707))

(declare-fun m!1295709 () Bool)

(assert (=> b!1406655 m!1295709))

(assert (=> b!1406660 m!1295689))

(assert (=> b!1406660 m!1295689))

(declare-fun m!1295711 () Bool)

(assert (=> b!1406660 m!1295711))

(push 1)

(assert (not b!1406655))

(assert (not b!1406658))

(assert (not b!1406656))

(assert (not start!120984))

(assert (not b!1406661))

(assert (not b!1406660))

(assert (not b!1406659))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

