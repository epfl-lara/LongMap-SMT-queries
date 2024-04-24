; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120966 () Bool)

(assert start!120966)

(declare-fun b!1406466 () Bool)

(declare-fun res!944004 () Bool)

(declare-fun e!796247 () Bool)

(assert (=> b!1406466 (=> (not res!944004) (not e!796247))))

(declare-datatypes ((array!96195 0))(
  ( (array!96196 (arr!46443 (Array (_ BitVec 32) (_ BitVec 64))) (size!46994 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96195)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96195 (_ BitVec 32)) Bool)

(assert (=> b!1406466 (= res!944004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406467 () Bool)

(declare-fun res!944003 () Bool)

(assert (=> b!1406467 (=> (not res!944003) (not e!796247))))

(declare-datatypes ((List!32949 0))(
  ( (Nil!32946) (Cons!32945 (h!34207 (_ BitVec 64)) (t!47635 List!32949)) )
))
(declare-fun arrayNoDuplicates!0 (array!96195 (_ BitVec 32) List!32949) Bool)

(assert (=> b!1406467 (= res!944003 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32946))))

(declare-fun b!1406468 () Bool)

(declare-fun e!796246 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10657 0))(
  ( (MissingZero!10657 (index!45005 (_ BitVec 32))) (Found!10657 (index!45006 (_ BitVec 32))) (Intermediate!10657 (undefined!11469 Bool) (index!45007 (_ BitVec 32)) (x!126771 (_ BitVec 32))) (Undefined!10657) (MissingVacant!10657 (index!45008 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96195 (_ BitVec 32)) SeekEntryResult!10657)

(assert (=> b!1406468 (= e!796246 (= (seekEntryOrOpen!0 (select (arr!46443 a!2901) j!112) a!2901 mask!2840) (Found!10657 j!112)))))

(declare-fun b!1406469 () Bool)

(assert (=> b!1406469 (= e!796247 (not true))))

(assert (=> b!1406469 e!796246))

(declare-fun res!944000 () Bool)

(assert (=> b!1406469 (=> (not res!944000) (not e!796246))))

(assert (=> b!1406469 (= res!944000 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47315 0))(
  ( (Unit!47316) )
))
(declare-fun lt!619394 () Unit!47315)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96195 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47315)

(assert (=> b!1406469 (= lt!619394 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!619393 () SeekEntryResult!10657)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96195 (_ BitVec 32)) SeekEntryResult!10657)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406469 (= lt!619393 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46443 a!2901) j!112) mask!2840) (select (arr!46443 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406470 () Bool)

(declare-fun res!944001 () Bool)

(assert (=> b!1406470 (=> (not res!944001) (not e!796247))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406470 (= res!944001 (validKeyInArray!0 (select (arr!46443 a!2901) j!112)))))

(declare-fun res!944005 () Bool)

(assert (=> start!120966 (=> (not res!944005) (not e!796247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120966 (= res!944005 (validMask!0 mask!2840))))

(assert (=> start!120966 e!796247))

(assert (=> start!120966 true))

(declare-fun array_inv!35724 (array!96195) Bool)

(assert (=> start!120966 (array_inv!35724 a!2901)))

(declare-fun b!1406471 () Bool)

(declare-fun res!944002 () Bool)

(assert (=> b!1406471 (=> (not res!944002) (not e!796247))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1406471 (= res!944002 (and (= (size!46994 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46994 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46994 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406472 () Bool)

(declare-fun res!943999 () Bool)

(assert (=> b!1406472 (=> (not res!943999) (not e!796247))))

(assert (=> b!1406472 (= res!943999 (validKeyInArray!0 (select (arr!46443 a!2901) i!1037)))))

(assert (= (and start!120966 res!944005) b!1406471))

(assert (= (and b!1406471 res!944002) b!1406472))

(assert (= (and b!1406472 res!943999) b!1406470))

(assert (= (and b!1406470 res!944001) b!1406466))

(assert (= (and b!1406466 res!944004) b!1406467))

(assert (= (and b!1406467 res!944003) b!1406469))

(assert (= (and b!1406469 res!944000) b!1406468))

(declare-fun m!1295453 () Bool)

(assert (=> b!1406466 m!1295453))

(declare-fun m!1295455 () Bool)

(assert (=> b!1406468 m!1295455))

(assert (=> b!1406468 m!1295455))

(declare-fun m!1295457 () Bool)

(assert (=> b!1406468 m!1295457))

(declare-fun m!1295459 () Bool)

(assert (=> b!1406472 m!1295459))

(assert (=> b!1406472 m!1295459))

(declare-fun m!1295461 () Bool)

(assert (=> b!1406472 m!1295461))

(declare-fun m!1295463 () Bool)

(assert (=> b!1406467 m!1295463))

(assert (=> b!1406469 m!1295455))

(declare-fun m!1295465 () Bool)

(assert (=> b!1406469 m!1295465))

(assert (=> b!1406469 m!1295455))

(declare-fun m!1295467 () Bool)

(assert (=> b!1406469 m!1295467))

(assert (=> b!1406469 m!1295465))

(assert (=> b!1406469 m!1295455))

(declare-fun m!1295469 () Bool)

(assert (=> b!1406469 m!1295469))

(declare-fun m!1295471 () Bool)

(assert (=> b!1406469 m!1295471))

(assert (=> b!1406470 m!1295455))

(assert (=> b!1406470 m!1295455))

(declare-fun m!1295473 () Bool)

(assert (=> b!1406470 m!1295473))

(declare-fun m!1295475 () Bool)

(assert (=> start!120966 m!1295475))

(declare-fun m!1295477 () Bool)

(assert (=> start!120966 m!1295477))

(push 1)

(assert (not b!1406468))

(assert (not b!1406467))

(assert (not b!1406472))

(assert (not b!1406469))

(assert (not b!1406470))

(assert (not b!1406466))

(assert (not start!120966))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

