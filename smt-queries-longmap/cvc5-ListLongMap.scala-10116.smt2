; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119190 () Bool)

(assert start!119190)

(declare-fun b!1390332 () Bool)

(declare-fun res!930550 () Bool)

(declare-fun e!787369 () Bool)

(assert (=> b!1390332 (=> (not res!930550) (not e!787369))))

(declare-datatypes ((array!95080 0))(
  ( (array!95081 (arr!45906 (Array (_ BitVec 32) (_ BitVec 64))) (size!46458 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95080)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390332 (= res!930550 (validKeyInArray!0 (select (arr!45906 a!2901) j!112)))))

(declare-fun b!1390333 () Bool)

(declare-fun res!930548 () Bool)

(assert (=> b!1390333 (=> (not res!930548) (not e!787369))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1390333 (= res!930548 (validKeyInArray!0 (select (arr!45906 a!2901) i!1037)))))

(declare-fun b!1390334 () Bool)

(declare-fun res!930546 () Bool)

(assert (=> b!1390334 (=> (not res!930546) (not e!787369))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95080 (_ BitVec 32)) Bool)

(assert (=> b!1390334 (= res!930546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390335 () Bool)

(declare-fun res!930549 () Bool)

(assert (=> b!1390335 (=> (not res!930549) (not e!787369))))

(assert (=> b!1390335 (= res!930549 (and (= (size!46458 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46458 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46458 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390336 () Bool)

(declare-fun res!930547 () Bool)

(assert (=> b!1390336 (=> (not res!930547) (not e!787369))))

(declare-datatypes ((List!32503 0))(
  ( (Nil!32500) (Cons!32499 (h!33717 (_ BitVec 64)) (t!47189 List!32503)) )
))
(declare-fun arrayNoDuplicates!0 (array!95080 (_ BitVec 32) List!32503) Bool)

(assert (=> b!1390336 (= res!930547 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32500))))

(declare-fun b!1390337 () Bool)

(declare-fun e!787370 () Bool)

(declare-datatypes ((SeekEntryResult!10249 0))(
  ( (MissingZero!10249 (index!43367 (_ BitVec 32))) (Found!10249 (index!43368 (_ BitVec 32))) (Intermediate!10249 (undefined!11061 Bool) (index!43369 (_ BitVec 32)) (x!125036 (_ BitVec 32))) (Undefined!10249) (MissingVacant!10249 (index!43370 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95080 (_ BitVec 32)) SeekEntryResult!10249)

(assert (=> b!1390337 (= e!787370 (= (seekEntryOrOpen!0 (select (arr!45906 a!2901) j!112) a!2901 mask!2840) (Found!10249 j!112)))))

(declare-fun res!930544 () Bool)

(assert (=> start!119190 (=> (not res!930544) (not e!787369))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119190 (= res!930544 (validMask!0 mask!2840))))

(assert (=> start!119190 e!787369))

(assert (=> start!119190 true))

(declare-fun array_inv!35139 (array!95080) Bool)

(assert (=> start!119190 (array_inv!35139 a!2901)))

(declare-fun b!1390338 () Bool)

(assert (=> b!1390338 (= e!787369 (not true))))

(assert (=> b!1390338 e!787370))

(declare-fun res!930545 () Bool)

(assert (=> b!1390338 (=> (not res!930545) (not e!787370))))

(assert (=> b!1390338 (= res!930545 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46345 0))(
  ( (Unit!46346) )
))
(declare-fun lt!610627 () Unit!46345)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95080 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46345)

(assert (=> b!1390338 (= lt!610627 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!610628 () SeekEntryResult!10249)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95080 (_ BitVec 32)) SeekEntryResult!10249)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390338 (= lt!610628 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45906 a!2901) j!112) mask!2840) (select (arr!45906 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119190 res!930544) b!1390335))

(assert (= (and b!1390335 res!930549) b!1390333))

(assert (= (and b!1390333 res!930548) b!1390332))

(assert (= (and b!1390332 res!930550) b!1390334))

(assert (= (and b!1390334 res!930546) b!1390336))

(assert (= (and b!1390336 res!930547) b!1390338))

(assert (= (and b!1390338 res!930545) b!1390337))

(declare-fun m!1275719 () Bool)

(assert (=> b!1390333 m!1275719))

(assert (=> b!1390333 m!1275719))

(declare-fun m!1275721 () Bool)

(assert (=> b!1390333 m!1275721))

(declare-fun m!1275723 () Bool)

(assert (=> b!1390334 m!1275723))

(declare-fun m!1275725 () Bool)

(assert (=> b!1390337 m!1275725))

(assert (=> b!1390337 m!1275725))

(declare-fun m!1275727 () Bool)

(assert (=> b!1390337 m!1275727))

(assert (=> b!1390332 m!1275725))

(assert (=> b!1390332 m!1275725))

(declare-fun m!1275729 () Bool)

(assert (=> b!1390332 m!1275729))

(assert (=> b!1390338 m!1275725))

(declare-fun m!1275731 () Bool)

(assert (=> b!1390338 m!1275731))

(assert (=> b!1390338 m!1275725))

(declare-fun m!1275733 () Bool)

(assert (=> b!1390338 m!1275733))

(assert (=> b!1390338 m!1275731))

(assert (=> b!1390338 m!1275725))

(declare-fun m!1275735 () Bool)

(assert (=> b!1390338 m!1275735))

(declare-fun m!1275737 () Bool)

(assert (=> b!1390338 m!1275737))

(declare-fun m!1275739 () Bool)

(assert (=> b!1390336 m!1275739))

(declare-fun m!1275741 () Bool)

(assert (=> start!119190 m!1275741))

(declare-fun m!1275743 () Bool)

(assert (=> start!119190 m!1275743))

(push 1)

(assert (not b!1390338))

(assert (not b!1390333))

(assert (not b!1390337))

(assert (not b!1390332))

(assert (not b!1390334))

(assert (not start!119190))

(assert (not b!1390336))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

