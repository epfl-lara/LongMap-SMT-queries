; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120118 () Bool)

(assert start!120118)

(declare-fun b!1398562 () Bool)

(declare-fun e!791758 () Bool)

(declare-fun e!791759 () Bool)

(assert (=> b!1398562 (= e!791758 e!791759)))

(declare-fun res!937479 () Bool)

(assert (=> b!1398562 (=> res!937479 e!791759)))

(declare-datatypes ((SeekEntryResult!10494 0))(
  ( (MissingZero!10494 (index!44347 (_ BitVec 32))) (Found!10494 (index!44348 (_ BitVec 32))) (Intermediate!10494 (undefined!11306 Bool) (index!44349 (_ BitVec 32)) (x!125988 (_ BitVec 32))) (Undefined!10494) (MissingVacant!10494 (index!44350 (_ BitVec 32))) )
))
(declare-fun lt!615010 () SeekEntryResult!10494)

(declare-fun lt!615008 () SeekEntryResult!10494)

(assert (=> b!1398562 (= res!937479 (or (= lt!615010 lt!615008) (not (is-Intermediate!10494 lt!615008))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95647 0))(
  ( (array!95648 (arr!46177 (Array (_ BitVec 32) (_ BitVec 64))) (size!46727 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95647)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!615009 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95647 (_ BitVec 32)) SeekEntryResult!10494)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398562 (= lt!615008 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615009 mask!2840) lt!615009 (array!95648 (store (arr!46177 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46727 a!2901)) mask!2840))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1398562 (= lt!615009 (select (store (arr!46177 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1398563 () Bool)

(declare-fun res!937483 () Bool)

(declare-fun e!791760 () Bool)

(assert (=> b!1398563 (=> (not res!937483) (not e!791760))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398563 (= res!937483 (validKeyInArray!0 (select (arr!46177 a!2901) i!1037)))))

(declare-fun b!1398564 () Bool)

(declare-fun res!937477 () Bool)

(assert (=> b!1398564 (=> (not res!937477) (not e!791760))))

(assert (=> b!1398564 (= res!937477 (validKeyInArray!0 (select (arr!46177 a!2901) j!112)))))

(declare-fun b!1398565 () Bool)

(assert (=> b!1398565 (= e!791759 true)))

(assert (=> b!1398565 (and (not (undefined!11306 lt!615008)) (= (index!44349 lt!615008) i!1037) (bvslt (x!125988 lt!615008) (x!125988 lt!615010)) (= (select (store (arr!46177 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44349 lt!615008)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!46992 0))(
  ( (Unit!46993) )
))
(declare-fun lt!615012 () Unit!46992)

(declare-fun lt!615011 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95647 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46992)

(assert (=> b!1398565 (= lt!615012 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615011 (x!125988 lt!615010) (index!44349 lt!615010) (x!125988 lt!615008) (index!44349 lt!615008) (undefined!11306 lt!615008) mask!2840))))

(declare-fun b!1398566 () Bool)

(declare-fun res!937481 () Bool)

(assert (=> b!1398566 (=> (not res!937481) (not e!791760))))

(declare-datatypes ((List!32696 0))(
  ( (Nil!32693) (Cons!32692 (h!33934 (_ BitVec 64)) (t!47390 List!32696)) )
))
(declare-fun arrayNoDuplicates!0 (array!95647 (_ BitVec 32) List!32696) Bool)

(assert (=> b!1398566 (= res!937481 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32693))))

(declare-fun b!1398567 () Bool)

(declare-fun res!937480 () Bool)

(assert (=> b!1398567 (=> (not res!937480) (not e!791760))))

(assert (=> b!1398567 (= res!937480 (and (= (size!46727 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46727 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46727 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1398568 () Bool)

(assert (=> b!1398568 (= e!791760 (not e!791758))))

(declare-fun res!937476 () Bool)

(assert (=> b!1398568 (=> res!937476 e!791758)))

(assert (=> b!1398568 (= res!937476 (or (not (is-Intermediate!10494 lt!615010)) (undefined!11306 lt!615010)))))

(declare-fun e!791761 () Bool)

(assert (=> b!1398568 e!791761))

(declare-fun res!937478 () Bool)

(assert (=> b!1398568 (=> (not res!937478) (not e!791761))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95647 (_ BitVec 32)) Bool)

(assert (=> b!1398568 (= res!937478 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!615007 () Unit!46992)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95647 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46992)

(assert (=> b!1398568 (= lt!615007 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1398568 (= lt!615010 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615011 (select (arr!46177 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1398568 (= lt!615011 (toIndex!0 (select (arr!46177 a!2901) j!112) mask!2840))))

(declare-fun b!1398569 () Bool)

(declare-fun res!937482 () Bool)

(assert (=> b!1398569 (=> (not res!937482) (not e!791760))))

(assert (=> b!1398569 (= res!937482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398570 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95647 (_ BitVec 32)) SeekEntryResult!10494)

(assert (=> b!1398570 (= e!791761 (= (seekEntryOrOpen!0 (select (arr!46177 a!2901) j!112) a!2901 mask!2840) (Found!10494 j!112)))))

(declare-fun res!937475 () Bool)

(assert (=> start!120118 (=> (not res!937475) (not e!791760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120118 (= res!937475 (validMask!0 mask!2840))))

(assert (=> start!120118 e!791760))

(assert (=> start!120118 true))

(declare-fun array_inv!35205 (array!95647) Bool)

(assert (=> start!120118 (array_inv!35205 a!2901)))

(assert (= (and start!120118 res!937475) b!1398567))

(assert (= (and b!1398567 res!937480) b!1398563))

(assert (= (and b!1398563 res!937483) b!1398564))

(assert (= (and b!1398564 res!937477) b!1398569))

(assert (= (and b!1398569 res!937482) b!1398566))

(assert (= (and b!1398566 res!937481) b!1398568))

(assert (= (and b!1398568 res!937478) b!1398570))

(assert (= (and b!1398568 (not res!937476)) b!1398562))

(assert (= (and b!1398562 (not res!937479)) b!1398565))

(declare-fun m!1285741 () Bool)

(assert (=> b!1398569 m!1285741))

(declare-fun m!1285743 () Bool)

(assert (=> b!1398570 m!1285743))

(assert (=> b!1398570 m!1285743))

(declare-fun m!1285745 () Bool)

(assert (=> b!1398570 m!1285745))

(assert (=> b!1398564 m!1285743))

(assert (=> b!1398564 m!1285743))

(declare-fun m!1285747 () Bool)

(assert (=> b!1398564 m!1285747))

(declare-fun m!1285749 () Bool)

(assert (=> b!1398562 m!1285749))

(declare-fun m!1285751 () Bool)

(assert (=> b!1398562 m!1285751))

(assert (=> b!1398562 m!1285749))

(declare-fun m!1285753 () Bool)

(assert (=> b!1398562 m!1285753))

(declare-fun m!1285755 () Bool)

(assert (=> b!1398562 m!1285755))

(assert (=> b!1398565 m!1285751))

(declare-fun m!1285757 () Bool)

(assert (=> b!1398565 m!1285757))

(declare-fun m!1285759 () Bool)

(assert (=> b!1398565 m!1285759))

(declare-fun m!1285761 () Bool)

(assert (=> b!1398566 m!1285761))

(assert (=> b!1398568 m!1285743))

(declare-fun m!1285763 () Bool)

(assert (=> b!1398568 m!1285763))

(assert (=> b!1398568 m!1285743))

(declare-fun m!1285765 () Bool)

(assert (=> b!1398568 m!1285765))

(declare-fun m!1285767 () Bool)

(assert (=> b!1398568 m!1285767))

(assert (=> b!1398568 m!1285743))

(declare-fun m!1285769 () Bool)

(assert (=> b!1398568 m!1285769))

(declare-fun m!1285771 () Bool)

(assert (=> b!1398563 m!1285771))

(assert (=> b!1398563 m!1285771))

(declare-fun m!1285773 () Bool)

(assert (=> b!1398563 m!1285773))

(declare-fun m!1285775 () Bool)

(assert (=> start!120118 m!1285775))

(declare-fun m!1285777 () Bool)

(assert (=> start!120118 m!1285777))

(push 1)

