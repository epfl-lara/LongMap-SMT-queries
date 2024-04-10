; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128474 () Bool)

(assert start!128474)

(declare-fun b!1506464 () Bool)

(declare-fun res!1026788 () Bool)

(declare-fun e!841914 () Bool)

(assert (=> b!1506464 (=> (not res!1026788) (not e!841914))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100486 0))(
  ( (array!100487 (arr!48486 (Array (_ BitVec 32) (_ BitVec 64))) (size!49036 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100486)

(assert (=> b!1506464 (= res!1026788 (and (= (size!49036 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49036 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49036 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506465 () Bool)

(declare-fun res!1026791 () Bool)

(assert (=> b!1506465 (=> (not res!1026791) (not e!841914))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506465 (= res!1026791 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49036 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49036 a!2804))))))

(declare-fun b!1506466 () Bool)

(declare-fun res!1026787 () Bool)

(assert (=> b!1506466 (=> (not res!1026787) (not e!841914))))

(declare-datatypes ((List!34969 0))(
  ( (Nil!34966) (Cons!34965 (h!36365 (_ BitVec 64)) (t!49663 List!34969)) )
))
(declare-fun arrayNoDuplicates!0 (array!100486 (_ BitVec 32) List!34969) Bool)

(assert (=> b!1506466 (= res!1026787 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34966))))

(declare-fun res!1026790 () Bool)

(assert (=> start!128474 (=> (not res!1026790) (not e!841914))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128474 (= res!1026790 (validMask!0 mask!2512))))

(assert (=> start!128474 e!841914))

(assert (=> start!128474 true))

(declare-fun array_inv!37514 (array!100486) Bool)

(assert (=> start!128474 (array_inv!37514 a!2804)))

(declare-fun b!1506467 () Bool)

(assert (=> b!1506467 (= e!841914 false)))

(declare-fun lt!654238 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506467 (= lt!654238 (toIndex!0 (select (arr!48486 a!2804) j!70) mask!2512))))

(declare-fun b!1506468 () Bool)

(declare-fun res!1026792 () Bool)

(assert (=> b!1506468 (=> (not res!1026792) (not e!841914))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100486 (_ BitVec 32)) Bool)

(assert (=> b!1506468 (= res!1026792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506469 () Bool)

(declare-fun res!1026789 () Bool)

(assert (=> b!1506469 (=> (not res!1026789) (not e!841914))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506469 (= res!1026789 (validKeyInArray!0 (select (arr!48486 a!2804) j!70)))))

(declare-fun b!1506470 () Bool)

(declare-fun res!1026793 () Bool)

(assert (=> b!1506470 (=> (not res!1026793) (not e!841914))))

(assert (=> b!1506470 (= res!1026793 (validKeyInArray!0 (select (arr!48486 a!2804) i!961)))))

(assert (= (and start!128474 res!1026790) b!1506464))

(assert (= (and b!1506464 res!1026788) b!1506470))

(assert (= (and b!1506470 res!1026793) b!1506469))

(assert (= (and b!1506469 res!1026789) b!1506468))

(assert (= (and b!1506468 res!1026792) b!1506466))

(assert (= (and b!1506466 res!1026787) b!1506465))

(assert (= (and b!1506465 res!1026791) b!1506467))

(declare-fun m!1389403 () Bool)

(assert (=> start!128474 m!1389403))

(declare-fun m!1389405 () Bool)

(assert (=> start!128474 m!1389405))

(declare-fun m!1389407 () Bool)

(assert (=> b!1506469 m!1389407))

(assert (=> b!1506469 m!1389407))

(declare-fun m!1389409 () Bool)

(assert (=> b!1506469 m!1389409))

(assert (=> b!1506467 m!1389407))

(assert (=> b!1506467 m!1389407))

(declare-fun m!1389411 () Bool)

(assert (=> b!1506467 m!1389411))

(declare-fun m!1389413 () Bool)

(assert (=> b!1506466 m!1389413))

(declare-fun m!1389415 () Bool)

(assert (=> b!1506468 m!1389415))

(declare-fun m!1389417 () Bool)

(assert (=> b!1506470 m!1389417))

(assert (=> b!1506470 m!1389417))

(declare-fun m!1389419 () Bool)

(assert (=> b!1506470 m!1389419))

(check-sat (not b!1506469) (not b!1506467) (not b!1506470) (not b!1506466) (not b!1506468) (not start!128474))
