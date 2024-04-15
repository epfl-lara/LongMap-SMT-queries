; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120870 () Bool)

(assert start!120870)

(declare-fun b!1406351 () Bool)

(declare-fun res!944624 () Bool)

(declare-fun e!795999 () Bool)

(assert (=> b!1406351 (=> (not res!944624) (not e!795999))))

(declare-datatypes ((array!96130 0))(
  ( (array!96131 (arr!46413 (Array (_ BitVec 32) (_ BitVec 64))) (size!46965 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96130)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96130 (_ BitVec 32)) Bool)

(assert (=> b!1406351 (= res!944624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!944622 () Bool)

(assert (=> start!120870 (=> (not res!944622) (not e!795999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120870 (= res!944622 (validMask!0 mask!2840))))

(assert (=> start!120870 e!795999))

(assert (=> start!120870 true))

(declare-fun array_inv!35646 (array!96130) Bool)

(assert (=> start!120870 (array_inv!35646 a!2901)))

(declare-fun b!1406352 () Bool)

(declare-fun e!795998 () Bool)

(assert (=> b!1406352 (= e!795999 (not e!795998))))

(declare-fun res!944620 () Bool)

(assert (=> b!1406352 (=> res!944620 e!795998)))

(declare-datatypes ((SeekEntryResult!10750 0))(
  ( (MissingZero!10750 (index!45377 (_ BitVec 32))) (Found!10750 (index!45378 (_ BitVec 32))) (Intermediate!10750 (undefined!11562 Bool) (index!45379 (_ BitVec 32)) (x!126970 (_ BitVec 32))) (Undefined!10750) (MissingVacant!10750 (index!45380 (_ BitVec 32))) )
))
(declare-fun lt!619193 () SeekEntryResult!10750)

(assert (=> b!1406352 (= res!944620 (or (not (is-Intermediate!10750 lt!619193)) (undefined!11562 lt!619193)))))

(declare-fun e!796000 () Bool)

(assert (=> b!1406352 e!796000))

(declare-fun res!944626 () Bool)

(assert (=> b!1406352 (=> (not res!944626) (not e!796000))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1406352 (= res!944626 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47317 0))(
  ( (Unit!47318) )
))
(declare-fun lt!619192 () Unit!47317)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96130 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47317)

(assert (=> b!1406352 (= lt!619192 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96130 (_ BitVec 32)) SeekEntryResult!10750)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406352 (= lt!619193 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46413 a!2901) j!112) mask!2840) (select (arr!46413 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406353 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96130 (_ BitVec 32)) SeekEntryResult!10750)

(assert (=> b!1406353 (= e!796000 (= (seekEntryOrOpen!0 (select (arr!46413 a!2901) j!112) a!2901 mask!2840) (Found!10750 j!112)))))

(declare-fun b!1406354 () Bool)

(declare-fun res!944623 () Bool)

(assert (=> b!1406354 (=> (not res!944623) (not e!795999))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406354 (= res!944623 (validKeyInArray!0 (select (arr!46413 a!2901) i!1037)))))

(declare-fun b!1406355 () Bool)

(declare-fun res!944625 () Bool)

(assert (=> b!1406355 (=> (not res!944625) (not e!795999))))

(assert (=> b!1406355 (= res!944625 (validKeyInArray!0 (select (arr!46413 a!2901) j!112)))))

(declare-fun b!1406356 () Bool)

(declare-fun res!944619 () Bool)

(assert (=> b!1406356 (=> (not res!944619) (not e!795999))))

(declare-datatypes ((List!33010 0))(
  ( (Nil!33007) (Cons!33006 (h!34260 (_ BitVec 64)) (t!47696 List!33010)) )
))
(declare-fun arrayNoDuplicates!0 (array!96130 (_ BitVec 32) List!33010) Bool)

(assert (=> b!1406356 (= res!944619 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33007))))

(declare-fun b!1406357 () Bool)

(declare-fun res!944621 () Bool)

(assert (=> b!1406357 (=> (not res!944621) (not e!795999))))

(assert (=> b!1406357 (= res!944621 (and (= (size!46965 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46965 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46965 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406358 () Bool)

(assert (=> b!1406358 (= e!795998 true)))

(declare-fun lt!619191 () SeekEntryResult!10750)

(assert (=> b!1406358 (= lt!619191 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46413 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46413 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96131 (store (arr!46413 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46965 a!2901)) mask!2840))))

(assert (= (and start!120870 res!944622) b!1406357))

(assert (= (and b!1406357 res!944621) b!1406354))

(assert (= (and b!1406354 res!944623) b!1406355))

(assert (= (and b!1406355 res!944625) b!1406351))

(assert (= (and b!1406351 res!944624) b!1406356))

(assert (= (and b!1406356 res!944619) b!1406352))

(assert (= (and b!1406352 res!944626) b!1406353))

(assert (= (and b!1406352 (not res!944620)) b!1406358))

(declare-fun m!1295037 () Bool)

(assert (=> b!1406358 m!1295037))

(declare-fun m!1295039 () Bool)

(assert (=> b!1406358 m!1295039))

(assert (=> b!1406358 m!1295039))

(declare-fun m!1295041 () Bool)

(assert (=> b!1406358 m!1295041))

(assert (=> b!1406358 m!1295041))

(assert (=> b!1406358 m!1295039))

(declare-fun m!1295043 () Bool)

(assert (=> b!1406358 m!1295043))

(declare-fun m!1295045 () Bool)

(assert (=> b!1406351 m!1295045))

(declare-fun m!1295047 () Bool)

(assert (=> b!1406352 m!1295047))

(declare-fun m!1295049 () Bool)

(assert (=> b!1406352 m!1295049))

(assert (=> b!1406352 m!1295047))

(declare-fun m!1295051 () Bool)

(assert (=> b!1406352 m!1295051))

(assert (=> b!1406352 m!1295049))

(assert (=> b!1406352 m!1295047))

(declare-fun m!1295053 () Bool)

(assert (=> b!1406352 m!1295053))

(declare-fun m!1295055 () Bool)

(assert (=> b!1406352 m!1295055))

(assert (=> b!1406353 m!1295047))

(assert (=> b!1406353 m!1295047))

(declare-fun m!1295057 () Bool)

(assert (=> b!1406353 m!1295057))

(declare-fun m!1295059 () Bool)

(assert (=> b!1406354 m!1295059))

(assert (=> b!1406354 m!1295059))

(declare-fun m!1295061 () Bool)

(assert (=> b!1406354 m!1295061))

(declare-fun m!1295063 () Bool)

(assert (=> b!1406356 m!1295063))

(assert (=> b!1406355 m!1295047))

(assert (=> b!1406355 m!1295047))

(declare-fun m!1295065 () Bool)

(assert (=> b!1406355 m!1295065))

(declare-fun m!1295067 () Bool)

(assert (=> start!120870 m!1295067))

(declare-fun m!1295069 () Bool)

(assert (=> start!120870 m!1295069))

(push 1)

(assert (not b!1406351))

(assert (not b!1406354))

(assert (not b!1406358))

(assert (not b!1406352))

(assert (not start!120870))

(assert (not b!1406353))

(assert (not b!1406356))

(assert (not b!1406355))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

