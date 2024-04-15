; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119658 () Bool)

(assert start!119658)

(declare-fun b!1393802 () Bool)

(declare-fun res!933264 () Bool)

(declare-fun e!789201 () Bool)

(assert (=> b!1393802 (=> (not res!933264) (not e!789201))))

(declare-datatypes ((array!95293 0))(
  ( (array!95294 (arr!46005 (Array (_ BitVec 32) (_ BitVec 64))) (size!46557 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95293)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393802 (= res!933264 (validKeyInArray!0 (select (arr!46005 a!2901) j!112)))))

(declare-fun b!1393803 () Bool)

(declare-fun e!789203 () Bool)

(assert (=> b!1393803 (= e!789203 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10348 0))(
  ( (MissingZero!10348 (index!43763 (_ BitVec 32))) (Found!10348 (index!43764 (_ BitVec 32))) (Intermediate!10348 (undefined!11160 Bool) (index!43765 (_ BitVec 32)) (x!125429 (_ BitVec 32))) (Undefined!10348) (MissingVacant!10348 (index!43766 (_ BitVec 32))) )
))
(declare-fun lt!611967 () SeekEntryResult!10348)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95293 (_ BitVec 32)) SeekEntryResult!10348)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393803 (= lt!611967 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46005 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46005 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95294 (store (arr!46005 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46557 a!2901)) mask!2840))))

(declare-fun b!1393804 () Bool)

(assert (=> b!1393804 (= e!789201 (not e!789203))))

(declare-fun res!933266 () Bool)

(assert (=> b!1393804 (=> res!933266 e!789203)))

(declare-fun lt!611969 () SeekEntryResult!10348)

(assert (=> b!1393804 (= res!933266 (or (not (is-Intermediate!10348 lt!611969)) (undefined!11160 lt!611969)))))

(declare-fun e!789202 () Bool)

(assert (=> b!1393804 e!789202))

(declare-fun res!933261 () Bool)

(assert (=> b!1393804 (=> (not res!933261) (not e!789202))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95293 (_ BitVec 32)) Bool)

(assert (=> b!1393804 (= res!933261 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46543 0))(
  ( (Unit!46544) )
))
(declare-fun lt!611968 () Unit!46543)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95293 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46543)

(assert (=> b!1393804 (= lt!611968 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1393804 (= lt!611969 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46005 a!2901) j!112) mask!2840) (select (arr!46005 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!933267 () Bool)

(assert (=> start!119658 (=> (not res!933267) (not e!789201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119658 (= res!933267 (validMask!0 mask!2840))))

(assert (=> start!119658 e!789201))

(assert (=> start!119658 true))

(declare-fun array_inv!35238 (array!95293) Bool)

(assert (=> start!119658 (array_inv!35238 a!2901)))

(declare-fun b!1393805 () Bool)

(declare-fun res!933265 () Bool)

(assert (=> b!1393805 (=> (not res!933265) (not e!789201))))

(assert (=> b!1393805 (= res!933265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393806 () Bool)

(declare-fun res!933262 () Bool)

(assert (=> b!1393806 (=> (not res!933262) (not e!789201))))

(declare-datatypes ((List!32602 0))(
  ( (Nil!32599) (Cons!32598 (h!33831 (_ BitVec 64)) (t!47288 List!32602)) )
))
(declare-fun arrayNoDuplicates!0 (array!95293 (_ BitVec 32) List!32602) Bool)

(assert (=> b!1393806 (= res!933262 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32599))))

(declare-fun b!1393807 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95293 (_ BitVec 32)) SeekEntryResult!10348)

(assert (=> b!1393807 (= e!789202 (= (seekEntryOrOpen!0 (select (arr!46005 a!2901) j!112) a!2901 mask!2840) (Found!10348 j!112)))))

(declare-fun b!1393808 () Bool)

(declare-fun res!933263 () Bool)

(assert (=> b!1393808 (=> (not res!933263) (not e!789201))))

(assert (=> b!1393808 (= res!933263 (and (= (size!46557 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46557 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46557 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393809 () Bool)

(declare-fun res!933268 () Bool)

(assert (=> b!1393809 (=> (not res!933268) (not e!789201))))

(assert (=> b!1393809 (= res!933268 (validKeyInArray!0 (select (arr!46005 a!2901) i!1037)))))

(assert (= (and start!119658 res!933267) b!1393808))

(assert (= (and b!1393808 res!933263) b!1393809))

(assert (= (and b!1393809 res!933268) b!1393802))

(assert (= (and b!1393802 res!933264) b!1393805))

(assert (= (and b!1393805 res!933265) b!1393806))

(assert (= (and b!1393806 res!933262) b!1393804))

(assert (= (and b!1393804 res!933261) b!1393807))

(assert (= (and b!1393804 (not res!933266)) b!1393803))

(declare-fun m!1279443 () Bool)

(assert (=> b!1393809 m!1279443))

(assert (=> b!1393809 m!1279443))

(declare-fun m!1279445 () Bool)

(assert (=> b!1393809 m!1279445))

(declare-fun m!1279447 () Bool)

(assert (=> b!1393803 m!1279447))

(declare-fun m!1279449 () Bool)

(assert (=> b!1393803 m!1279449))

(assert (=> b!1393803 m!1279449))

(declare-fun m!1279451 () Bool)

(assert (=> b!1393803 m!1279451))

(assert (=> b!1393803 m!1279451))

(assert (=> b!1393803 m!1279449))

(declare-fun m!1279453 () Bool)

(assert (=> b!1393803 m!1279453))

(declare-fun m!1279455 () Bool)

(assert (=> b!1393805 m!1279455))

(declare-fun m!1279457 () Bool)

(assert (=> start!119658 m!1279457))

(declare-fun m!1279459 () Bool)

(assert (=> start!119658 m!1279459))

(declare-fun m!1279461 () Bool)

(assert (=> b!1393806 m!1279461))

(declare-fun m!1279463 () Bool)

(assert (=> b!1393804 m!1279463))

(declare-fun m!1279465 () Bool)

(assert (=> b!1393804 m!1279465))

(assert (=> b!1393804 m!1279463))

(declare-fun m!1279467 () Bool)

(assert (=> b!1393804 m!1279467))

(assert (=> b!1393804 m!1279465))

(assert (=> b!1393804 m!1279463))

(declare-fun m!1279469 () Bool)

(assert (=> b!1393804 m!1279469))

(declare-fun m!1279471 () Bool)

(assert (=> b!1393804 m!1279471))

(assert (=> b!1393802 m!1279463))

(assert (=> b!1393802 m!1279463))

(declare-fun m!1279473 () Bool)

(assert (=> b!1393802 m!1279473))

(assert (=> b!1393807 m!1279463))

(assert (=> b!1393807 m!1279463))

(declare-fun m!1279475 () Bool)

(assert (=> b!1393807 m!1279475))

(push 1)

(assert (not b!1393807))

(assert (not start!119658))

(assert (not b!1393809))

(assert (not b!1393803))

(assert (not b!1393805))

(assert (not b!1393802))

(assert (not b!1393806))

(assert (not b!1393804))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

