; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119694 () Bool)

(assert start!119694)

(declare-fun b!1393517 () Bool)

(declare-fun res!932409 () Bool)

(declare-fun e!789198 () Bool)

(assert (=> b!1393517 (=> (not res!932409) (not e!789198))))

(declare-datatypes ((array!95349 0))(
  ( (array!95350 (arr!46032 (Array (_ BitVec 32) (_ BitVec 64))) (size!46583 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95349)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95349 (_ BitVec 32)) Bool)

(assert (=> b!1393517 (= res!932409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393518 () Bool)

(declare-fun e!789199 () Bool)

(assert (=> b!1393518 (= e!789198 (not e!789199))))

(declare-fun res!932412 () Bool)

(assert (=> b!1393518 (=> res!932412 e!789199)))

(declare-datatypes ((SeekEntryResult!10252 0))(
  ( (MissingZero!10252 (index!43379 (_ BitVec 32))) (Found!10252 (index!43380 (_ BitVec 32))) (Intermediate!10252 (undefined!11064 Bool) (index!43381 (_ BitVec 32)) (x!125213 (_ BitVec 32))) (Undefined!10252) (MissingVacant!10252 (index!43382 (_ BitVec 32))) )
))
(declare-fun lt!611996 () SeekEntryResult!10252)

(assert (=> b!1393518 (= res!932412 (or (not (is-Intermediate!10252 lt!611996)) (undefined!11064 lt!611996)))))

(declare-fun e!789197 () Bool)

(assert (=> b!1393518 e!789197))

(declare-fun res!932413 () Bool)

(assert (=> b!1393518 (=> (not res!932413) (not e!789197))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1393518 (= res!932413 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46535 0))(
  ( (Unit!46536) )
))
(declare-fun lt!611995 () Unit!46535)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95349 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46535)

(assert (=> b!1393518 (= lt!611995 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95349 (_ BitVec 32)) SeekEntryResult!10252)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393518 (= lt!611996 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46032 a!2901) j!112) mask!2840) (select (arr!46032 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!932407 () Bool)

(assert (=> start!119694 (=> (not res!932407) (not e!789198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119694 (= res!932407 (validMask!0 mask!2840))))

(assert (=> start!119694 e!789198))

(assert (=> start!119694 true))

(declare-fun array_inv!35313 (array!95349) Bool)

(assert (=> start!119694 (array_inv!35313 a!2901)))

(declare-fun b!1393519 () Bool)

(assert (=> b!1393519 (= e!789199 true)))

(declare-fun lt!611994 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1393519 (= lt!611994 (toIndex!0 (select (store (arr!46032 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1393520 () Bool)

(declare-fun res!932410 () Bool)

(assert (=> b!1393520 (=> (not res!932410) (not e!789198))))

(declare-datatypes ((List!32538 0))(
  ( (Nil!32535) (Cons!32534 (h!33772 (_ BitVec 64)) (t!47224 List!32538)) )
))
(declare-fun arrayNoDuplicates!0 (array!95349 (_ BitVec 32) List!32538) Bool)

(assert (=> b!1393520 (= res!932410 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32535))))

(declare-fun b!1393521 () Bool)

(declare-fun res!932408 () Bool)

(assert (=> b!1393521 (=> (not res!932408) (not e!789198))))

(assert (=> b!1393521 (= res!932408 (and (= (size!46583 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46583 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46583 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393522 () Bool)

(declare-fun res!932411 () Bool)

(assert (=> b!1393522 (=> (not res!932411) (not e!789198))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393522 (= res!932411 (validKeyInArray!0 (select (arr!46032 a!2901) j!112)))))

(declare-fun b!1393523 () Bool)

(declare-fun res!932406 () Bool)

(assert (=> b!1393523 (=> (not res!932406) (not e!789198))))

(assert (=> b!1393523 (= res!932406 (validKeyInArray!0 (select (arr!46032 a!2901) i!1037)))))

(declare-fun b!1393524 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95349 (_ BitVec 32)) SeekEntryResult!10252)

(assert (=> b!1393524 (= e!789197 (= (seekEntryOrOpen!0 (select (arr!46032 a!2901) j!112) a!2901 mask!2840) (Found!10252 j!112)))))

(assert (= (and start!119694 res!932407) b!1393521))

(assert (= (and b!1393521 res!932408) b!1393523))

(assert (= (and b!1393523 res!932406) b!1393522))

(assert (= (and b!1393522 res!932411) b!1393517))

(assert (= (and b!1393517 res!932409) b!1393520))

(assert (= (and b!1393520 res!932410) b!1393518))

(assert (= (and b!1393518 res!932413) b!1393524))

(assert (= (and b!1393518 (not res!932412)) b!1393519))

(declare-fun m!1279469 () Bool)

(assert (=> b!1393518 m!1279469))

(declare-fun m!1279471 () Bool)

(assert (=> b!1393518 m!1279471))

(assert (=> b!1393518 m!1279469))

(declare-fun m!1279473 () Bool)

(assert (=> b!1393518 m!1279473))

(assert (=> b!1393518 m!1279471))

(assert (=> b!1393518 m!1279469))

(declare-fun m!1279475 () Bool)

(assert (=> b!1393518 m!1279475))

(declare-fun m!1279477 () Bool)

(assert (=> b!1393518 m!1279477))

(declare-fun m!1279479 () Bool)

(assert (=> b!1393523 m!1279479))

(assert (=> b!1393523 m!1279479))

(declare-fun m!1279481 () Bool)

(assert (=> b!1393523 m!1279481))

(assert (=> b!1393522 m!1279469))

(assert (=> b!1393522 m!1279469))

(declare-fun m!1279483 () Bool)

(assert (=> b!1393522 m!1279483))

(declare-fun m!1279485 () Bool)

(assert (=> start!119694 m!1279485))

(declare-fun m!1279487 () Bool)

(assert (=> start!119694 m!1279487))

(assert (=> b!1393524 m!1279469))

(assert (=> b!1393524 m!1279469))

(declare-fun m!1279489 () Bool)

(assert (=> b!1393524 m!1279489))

(declare-fun m!1279491 () Bool)

(assert (=> b!1393519 m!1279491))

(declare-fun m!1279493 () Bool)

(assert (=> b!1393519 m!1279493))

(assert (=> b!1393519 m!1279493))

(declare-fun m!1279495 () Bool)

(assert (=> b!1393519 m!1279495))

(declare-fun m!1279497 () Bool)

(assert (=> b!1393520 m!1279497))

(declare-fun m!1279499 () Bool)

(assert (=> b!1393517 m!1279499))

(push 1)

(assert (not b!1393517))

(assert (not b!1393519))

(assert (not b!1393522))

(assert (not start!119694))

(assert (not b!1393520))

(assert (not b!1393524))

(assert (not b!1393523))

(assert (not b!1393518))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

