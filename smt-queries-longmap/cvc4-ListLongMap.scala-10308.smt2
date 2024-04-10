; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121174 () Bool)

(assert start!121174)

(declare-fun b!1408934 () Bool)

(declare-fun e!797343 () Bool)

(assert (=> b!1408934 (= e!797343 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96328 0))(
  ( (array!96329 (arr!46507 (Array (_ BitVec 32) (_ BitVec 64))) (size!47057 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96328)

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10818 0))(
  ( (MissingZero!10818 (index!45649 (_ BitVec 32))) (Found!10818 (index!45650 (_ BitVec 32))) (Intermediate!10818 (undefined!11630 Bool) (index!45651 (_ BitVec 32)) (x!127243 (_ BitVec 32))) (Undefined!10818) (MissingVacant!10818 (index!45652 (_ BitVec 32))) )
))
(declare-fun lt!620533 () SeekEntryResult!10818)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96328 (_ BitVec 32)) SeekEntryResult!10818)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408934 (= lt!620533 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46507 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46507 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96329 (store (arr!46507 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47057 a!2901)) mask!2840))))

(declare-fun b!1408935 () Bool)

(declare-fun res!946659 () Bool)

(declare-fun e!797342 () Bool)

(assert (=> b!1408935 (=> (not res!946659) (not e!797342))))

(assert (=> b!1408935 (= res!946659 (and (= (size!47057 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47057 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47057 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408936 () Bool)

(declare-fun res!946658 () Bool)

(assert (=> b!1408936 (=> (not res!946658) (not e!797342))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408936 (= res!946658 (validKeyInArray!0 (select (arr!46507 a!2901) j!112)))))

(declare-fun b!1408937 () Bool)

(assert (=> b!1408937 (= e!797342 (not e!797343))))

(declare-fun res!946657 () Bool)

(assert (=> b!1408937 (=> res!946657 e!797343)))

(declare-fun lt!620535 () SeekEntryResult!10818)

(assert (=> b!1408937 (= res!946657 (or (not (is-Intermediate!10818 lt!620535)) (undefined!11630 lt!620535)))))

(declare-fun e!797345 () Bool)

(assert (=> b!1408937 e!797345))

(declare-fun res!946663 () Bool)

(assert (=> b!1408937 (=> (not res!946663) (not e!797345))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96328 (_ BitVec 32)) Bool)

(assert (=> b!1408937 (= res!946663 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47610 0))(
  ( (Unit!47611) )
))
(declare-fun lt!620534 () Unit!47610)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96328 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47610)

(assert (=> b!1408937 (= lt!620534 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1408937 (= lt!620535 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46507 a!2901) j!112) mask!2840) (select (arr!46507 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!946660 () Bool)

(assert (=> start!121174 (=> (not res!946660) (not e!797342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121174 (= res!946660 (validMask!0 mask!2840))))

(assert (=> start!121174 e!797342))

(assert (=> start!121174 true))

(declare-fun array_inv!35535 (array!96328) Bool)

(assert (=> start!121174 (array_inv!35535 a!2901)))

(declare-fun b!1408938 () Bool)

(declare-fun res!946661 () Bool)

(assert (=> b!1408938 (=> (not res!946661) (not e!797342))))

(assert (=> b!1408938 (= res!946661 (validKeyInArray!0 (select (arr!46507 a!2901) i!1037)))))

(declare-fun b!1408939 () Bool)

(declare-fun res!946656 () Bool)

(assert (=> b!1408939 (=> (not res!946656) (not e!797342))))

(declare-datatypes ((List!33026 0))(
  ( (Nil!33023) (Cons!33022 (h!34285 (_ BitVec 64)) (t!47720 List!33026)) )
))
(declare-fun arrayNoDuplicates!0 (array!96328 (_ BitVec 32) List!33026) Bool)

(assert (=> b!1408939 (= res!946656 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33023))))

(declare-fun b!1408940 () Bool)

(declare-fun res!946662 () Bool)

(assert (=> b!1408940 (=> (not res!946662) (not e!797342))))

(assert (=> b!1408940 (= res!946662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408941 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96328 (_ BitVec 32)) SeekEntryResult!10818)

(assert (=> b!1408941 (= e!797345 (= (seekEntryOrOpen!0 (select (arr!46507 a!2901) j!112) a!2901 mask!2840) (Found!10818 j!112)))))

(assert (= (and start!121174 res!946660) b!1408935))

(assert (= (and b!1408935 res!946659) b!1408938))

(assert (= (and b!1408938 res!946661) b!1408936))

(assert (= (and b!1408936 res!946658) b!1408940))

(assert (= (and b!1408940 res!946662) b!1408939))

(assert (= (and b!1408939 res!946656) b!1408937))

(assert (= (and b!1408937 res!946663) b!1408941))

(assert (= (and b!1408937 (not res!946657)) b!1408934))

(declare-fun m!1298441 () Bool)

(assert (=> start!121174 m!1298441))

(declare-fun m!1298443 () Bool)

(assert (=> start!121174 m!1298443))

(declare-fun m!1298445 () Bool)

(assert (=> b!1408941 m!1298445))

(assert (=> b!1408941 m!1298445))

(declare-fun m!1298447 () Bool)

(assert (=> b!1408941 m!1298447))

(declare-fun m!1298449 () Bool)

(assert (=> b!1408939 m!1298449))

(declare-fun m!1298451 () Bool)

(assert (=> b!1408938 m!1298451))

(assert (=> b!1408938 m!1298451))

(declare-fun m!1298453 () Bool)

(assert (=> b!1408938 m!1298453))

(assert (=> b!1408937 m!1298445))

(declare-fun m!1298455 () Bool)

(assert (=> b!1408937 m!1298455))

(assert (=> b!1408937 m!1298445))

(declare-fun m!1298457 () Bool)

(assert (=> b!1408937 m!1298457))

(assert (=> b!1408937 m!1298455))

(assert (=> b!1408937 m!1298445))

(declare-fun m!1298459 () Bool)

(assert (=> b!1408937 m!1298459))

(declare-fun m!1298461 () Bool)

(assert (=> b!1408937 m!1298461))

(assert (=> b!1408936 m!1298445))

(assert (=> b!1408936 m!1298445))

(declare-fun m!1298463 () Bool)

(assert (=> b!1408936 m!1298463))

(declare-fun m!1298465 () Bool)

(assert (=> b!1408934 m!1298465))

(declare-fun m!1298467 () Bool)

(assert (=> b!1408934 m!1298467))

(assert (=> b!1408934 m!1298467))

(declare-fun m!1298469 () Bool)

(assert (=> b!1408934 m!1298469))

(assert (=> b!1408934 m!1298469))

(assert (=> b!1408934 m!1298467))

(declare-fun m!1298471 () Bool)

(assert (=> b!1408934 m!1298471))

(declare-fun m!1298473 () Bool)

(assert (=> b!1408940 m!1298473))

(push 1)

(assert (not start!121174))

(assert (not b!1408939))

(assert (not b!1408937))

(assert (not b!1408938))

(assert (not b!1408941))

(assert (not b!1408940))

(assert (not b!1408936))

(assert (not b!1408934))

(check-sat)

