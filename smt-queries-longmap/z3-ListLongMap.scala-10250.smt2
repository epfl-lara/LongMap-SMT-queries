; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120554 () Bool)

(assert start!120554)

(declare-fun b!1403742 () Bool)

(declare-fun res!942254 () Bool)

(declare-fun e!794780 () Bool)

(assert (=> b!1403742 (=> (not res!942254) (not e!794780))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95963 0))(
  ( (array!95964 (arr!46332 (Array (_ BitVec 32) (_ BitVec 64))) (size!46882 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95963)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1403742 (= res!942254 (and (= (size!46882 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46882 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46882 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403743 () Bool)

(declare-fun res!942256 () Bool)

(assert (=> b!1403743 (=> (not res!942256) (not e!794780))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95963 (_ BitVec 32)) Bool)

(assert (=> b!1403743 (= res!942256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!942255 () Bool)

(assert (=> start!120554 (=> (not res!942255) (not e!794780))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120554 (= res!942255 (validMask!0 mask!2840))))

(assert (=> start!120554 e!794780))

(assert (=> start!120554 true))

(declare-fun array_inv!35360 (array!95963) Bool)

(assert (=> start!120554 (array_inv!35360 a!2901)))

(declare-fun b!1403744 () Bool)

(declare-fun e!794778 () Bool)

(declare-datatypes ((SeekEntryResult!10649 0))(
  ( (MissingZero!10649 (index!44973 (_ BitVec 32))) (Found!10649 (index!44974 (_ BitVec 32))) (Intermediate!10649 (undefined!11461 Bool) (index!44975 (_ BitVec 32)) (x!126580 (_ BitVec 32))) (Undefined!10649) (MissingVacant!10649 (index!44976 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95963 (_ BitVec 32)) SeekEntryResult!10649)

(assert (=> b!1403744 (= e!794778 (= (seekEntryOrOpen!0 (select (arr!46332 a!2901) j!112) a!2901 mask!2840) (Found!10649 j!112)))))

(declare-fun b!1403745 () Bool)

(assert (=> b!1403745 (= e!794780 (not true))))

(assert (=> b!1403745 e!794778))

(declare-fun res!942257 () Bool)

(assert (=> b!1403745 (=> (not res!942257) (not e!794778))))

(assert (=> b!1403745 (= res!942257 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47302 0))(
  ( (Unit!47303) )
))
(declare-fun lt!618495 () Unit!47302)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95963 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47302)

(assert (=> b!1403745 (= lt!618495 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618494 () SeekEntryResult!10649)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95963 (_ BitVec 32)) SeekEntryResult!10649)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403745 (= lt!618494 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46332 a!2901) j!112) mask!2840) (select (arr!46332 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403746 () Bool)

(declare-fun res!942253 () Bool)

(assert (=> b!1403746 (=> (not res!942253) (not e!794780))))

(declare-datatypes ((List!32851 0))(
  ( (Nil!32848) (Cons!32847 (h!34095 (_ BitVec 64)) (t!47545 List!32851)) )
))
(declare-fun arrayNoDuplicates!0 (array!95963 (_ BitVec 32) List!32851) Bool)

(assert (=> b!1403746 (= res!942253 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32848))))

(declare-fun b!1403747 () Bool)

(declare-fun res!942259 () Bool)

(assert (=> b!1403747 (=> (not res!942259) (not e!794780))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403747 (= res!942259 (validKeyInArray!0 (select (arr!46332 a!2901) j!112)))))

(declare-fun b!1403748 () Bool)

(declare-fun res!942258 () Bool)

(assert (=> b!1403748 (=> (not res!942258) (not e!794780))))

(assert (=> b!1403748 (= res!942258 (validKeyInArray!0 (select (arr!46332 a!2901) i!1037)))))

(assert (= (and start!120554 res!942255) b!1403742))

(assert (= (and b!1403742 res!942254) b!1403748))

(assert (= (and b!1403748 res!942258) b!1403747))

(assert (= (and b!1403747 res!942259) b!1403743))

(assert (= (and b!1403743 res!942256) b!1403746))

(assert (= (and b!1403746 res!942253) b!1403745))

(assert (= (and b!1403745 res!942257) b!1403744))

(declare-fun m!1292471 () Bool)

(assert (=> b!1403743 m!1292471))

(declare-fun m!1292473 () Bool)

(assert (=> b!1403748 m!1292473))

(assert (=> b!1403748 m!1292473))

(declare-fun m!1292475 () Bool)

(assert (=> b!1403748 m!1292475))

(declare-fun m!1292477 () Bool)

(assert (=> b!1403746 m!1292477))

(declare-fun m!1292479 () Bool)

(assert (=> b!1403747 m!1292479))

(assert (=> b!1403747 m!1292479))

(declare-fun m!1292481 () Bool)

(assert (=> b!1403747 m!1292481))

(assert (=> b!1403745 m!1292479))

(declare-fun m!1292483 () Bool)

(assert (=> b!1403745 m!1292483))

(assert (=> b!1403745 m!1292479))

(declare-fun m!1292485 () Bool)

(assert (=> b!1403745 m!1292485))

(assert (=> b!1403745 m!1292483))

(assert (=> b!1403745 m!1292479))

(declare-fun m!1292487 () Bool)

(assert (=> b!1403745 m!1292487))

(declare-fun m!1292489 () Bool)

(assert (=> b!1403745 m!1292489))

(assert (=> b!1403744 m!1292479))

(assert (=> b!1403744 m!1292479))

(declare-fun m!1292491 () Bool)

(assert (=> b!1403744 m!1292491))

(declare-fun m!1292493 () Bool)

(assert (=> start!120554 m!1292493))

(declare-fun m!1292495 () Bool)

(assert (=> start!120554 m!1292495))

(check-sat (not start!120554) (not b!1403745) (not b!1403743) (not b!1403747) (not b!1403748) (not b!1403746) (not b!1403744))
(check-sat)
