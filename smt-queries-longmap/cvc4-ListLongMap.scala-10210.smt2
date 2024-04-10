; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120316 () Bool)

(assert start!120316)

(declare-fun b!1400222 () Bool)

(declare-fun e!792759 () Bool)

(declare-fun e!792764 () Bool)

(assert (=> b!1400222 (= e!792759 e!792764)))

(declare-fun res!938736 () Bool)

(assert (=> b!1400222 (=> res!938736 e!792764)))

(declare-datatypes ((array!95725 0))(
  ( (array!95726 (arr!46213 (Array (_ BitVec 32) (_ BitVec 64))) (size!46763 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95725)

(declare-datatypes ((SeekEntryResult!10530 0))(
  ( (MissingZero!10530 (index!44497 (_ BitVec 32))) (Found!10530 (index!44498 (_ BitVec 32))) (Intermediate!10530 (undefined!11342 Bool) (index!44499 (_ BitVec 32)) (x!126141 (_ BitVec 32))) (Undefined!10530) (MissingVacant!10530 (index!44500 (_ BitVec 32))) )
))
(declare-fun lt!616052 () SeekEntryResult!10530)

(declare-fun lt!616051 () SeekEntryResult!10530)

(declare-fun lt!616050 () (_ BitVec 32))

(assert (=> b!1400222 (= res!938736 (or (bvslt (x!126141 lt!616052) #b00000000000000000000000000000000) (bvsgt (x!126141 lt!616052) #b01111111111111111111111111111110) (bvslt (x!126141 lt!616051) #b00000000000000000000000000000000) (bvsgt (x!126141 lt!616051) #b01111111111111111111111111111110) (bvslt lt!616050 #b00000000000000000000000000000000) (bvsge lt!616050 (size!46763 a!2901)) (bvslt (index!44499 lt!616052) #b00000000000000000000000000000000) (bvsge (index!44499 lt!616052) (size!46763 a!2901)) (bvslt (index!44499 lt!616051) #b00000000000000000000000000000000) (bvsge (index!44499 lt!616051) (size!46763 a!2901)) (not (= lt!616052 (Intermediate!10530 false (index!44499 lt!616052) (x!126141 lt!616052)))) (not (= lt!616051 (Intermediate!10530 false (index!44499 lt!616051) (x!126141 lt!616051))))))))

(declare-fun e!792763 () Bool)

(assert (=> b!1400222 e!792763))

(declare-fun res!938740 () Bool)

(assert (=> b!1400222 (=> (not res!938740) (not e!792763))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1400222 (= res!938740 (and (not (undefined!11342 lt!616051)) (= (index!44499 lt!616051) i!1037) (bvslt (x!126141 lt!616051) (x!126141 lt!616052)) (= (select (store (arr!46213 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44499 lt!616051)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((Unit!47064 0))(
  ( (Unit!47065) )
))
(declare-fun lt!616053 () Unit!47064)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95725 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47064)

(assert (=> b!1400222 (= lt!616053 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616050 (x!126141 lt!616052) (index!44499 lt!616052) (x!126141 lt!616051) (index!44499 lt!616051) (undefined!11342 lt!616051) mask!2840))))

(declare-fun b!1400223 () Bool)

(assert (=> b!1400223 (= e!792764 true)))

(declare-fun lt!616048 () (_ BitVec 64))

(declare-fun lt!616047 () SeekEntryResult!10530)

(declare-fun lt!616046 () array!95725)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95725 (_ BitVec 32)) SeekEntryResult!10530)

(assert (=> b!1400223 (= lt!616047 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616050 lt!616048 lt!616046 mask!2840))))

(declare-fun b!1400224 () Bool)

(declare-fun res!938733 () Bool)

(declare-fun e!792758 () Bool)

(assert (=> b!1400224 (=> (not res!938733) (not e!792758))))

(assert (=> b!1400224 (= res!938733 (and (= (size!46763 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46763 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46763 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400225 () Bool)

(declare-fun res!938739 () Bool)

(assert (=> b!1400225 (=> (not res!938739) (not e!792758))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400225 (= res!938739 (validKeyInArray!0 (select (arr!46213 a!2901) i!1037)))))

(declare-fun b!1400226 () Bool)

(declare-fun res!938743 () Bool)

(assert (=> b!1400226 (=> (not res!938743) (not e!792758))))

(assert (=> b!1400226 (= res!938743 (validKeyInArray!0 (select (arr!46213 a!2901) j!112)))))

(declare-fun e!792762 () Bool)

(declare-fun b!1400228 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95725 (_ BitVec 32)) SeekEntryResult!10530)

(assert (=> b!1400228 (= e!792762 (= (seekEntryOrOpen!0 (select (arr!46213 a!2901) j!112) a!2901 mask!2840) (Found!10530 j!112)))))

(declare-fun b!1400229 () Bool)

(declare-fun res!938738 () Bool)

(assert (=> b!1400229 (=> (not res!938738) (not e!792758))))

(declare-datatypes ((List!32732 0))(
  ( (Nil!32729) (Cons!32728 (h!33976 (_ BitVec 64)) (t!47426 List!32732)) )
))
(declare-fun arrayNoDuplicates!0 (array!95725 (_ BitVec 32) List!32732) Bool)

(assert (=> b!1400229 (= res!938738 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32729))))

(declare-fun b!1400230 () Bool)

(declare-fun res!938734 () Bool)

(assert (=> b!1400230 (=> (not res!938734) (not e!792758))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95725 (_ BitVec 32)) Bool)

(assert (=> b!1400230 (= res!938734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400231 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95725 (_ BitVec 32)) SeekEntryResult!10530)

(assert (=> b!1400231 (= e!792763 (= (seekEntryOrOpen!0 lt!616048 lt!616046 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126141 lt!616051) (index!44499 lt!616051) (index!44499 lt!616051) (select (arr!46213 a!2901) j!112) lt!616046 mask!2840)))))

(declare-fun b!1400232 () Bool)

(declare-fun e!792760 () Bool)

(assert (=> b!1400232 (= e!792758 (not e!792760))))

(declare-fun res!938737 () Bool)

(assert (=> b!1400232 (=> res!938737 e!792760)))

(assert (=> b!1400232 (= res!938737 (or (not (is-Intermediate!10530 lt!616052)) (undefined!11342 lt!616052)))))

(assert (=> b!1400232 e!792762))

(declare-fun res!938742 () Bool)

(assert (=> b!1400232 (=> (not res!938742) (not e!792762))))

(assert (=> b!1400232 (= res!938742 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!616049 () Unit!47064)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95725 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47064)

(assert (=> b!1400232 (= lt!616049 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1400232 (= lt!616052 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616050 (select (arr!46213 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400232 (= lt!616050 (toIndex!0 (select (arr!46213 a!2901) j!112) mask!2840))))

(declare-fun b!1400227 () Bool)

(assert (=> b!1400227 (= e!792760 e!792759)))

(declare-fun res!938735 () Bool)

(assert (=> b!1400227 (=> res!938735 e!792759)))

(assert (=> b!1400227 (= res!938735 (or (= lt!616052 lt!616051) (not (is-Intermediate!10530 lt!616051))))))

(assert (=> b!1400227 (= lt!616051 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616048 mask!2840) lt!616048 lt!616046 mask!2840))))

(assert (=> b!1400227 (= lt!616048 (select (store (arr!46213 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400227 (= lt!616046 (array!95726 (store (arr!46213 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46763 a!2901)))))

(declare-fun res!938741 () Bool)

(assert (=> start!120316 (=> (not res!938741) (not e!792758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120316 (= res!938741 (validMask!0 mask!2840))))

(assert (=> start!120316 e!792758))

(assert (=> start!120316 true))

(declare-fun array_inv!35241 (array!95725) Bool)

(assert (=> start!120316 (array_inv!35241 a!2901)))

(assert (= (and start!120316 res!938741) b!1400224))

(assert (= (and b!1400224 res!938733) b!1400225))

(assert (= (and b!1400225 res!938739) b!1400226))

(assert (= (and b!1400226 res!938743) b!1400230))

(assert (= (and b!1400230 res!938734) b!1400229))

(assert (= (and b!1400229 res!938738) b!1400232))

(assert (= (and b!1400232 res!938742) b!1400228))

(assert (= (and b!1400232 (not res!938737)) b!1400227))

(assert (= (and b!1400227 (not res!938735)) b!1400222))

(assert (= (and b!1400222 res!938740) b!1400231))

(assert (= (and b!1400222 (not res!938736)) b!1400223))

(declare-fun m!1287601 () Bool)

(assert (=> b!1400223 m!1287601))

(declare-fun m!1287603 () Bool)

(assert (=> b!1400229 m!1287603))

(declare-fun m!1287605 () Bool)

(assert (=> b!1400225 m!1287605))

(assert (=> b!1400225 m!1287605))

(declare-fun m!1287607 () Bool)

(assert (=> b!1400225 m!1287607))

(declare-fun m!1287609 () Bool)

(assert (=> b!1400227 m!1287609))

(assert (=> b!1400227 m!1287609))

(declare-fun m!1287611 () Bool)

(assert (=> b!1400227 m!1287611))

(declare-fun m!1287613 () Bool)

(assert (=> b!1400227 m!1287613))

(declare-fun m!1287615 () Bool)

(assert (=> b!1400227 m!1287615))

(declare-fun m!1287617 () Bool)

(assert (=> b!1400232 m!1287617))

(declare-fun m!1287619 () Bool)

(assert (=> b!1400232 m!1287619))

(assert (=> b!1400232 m!1287617))

(declare-fun m!1287621 () Bool)

(assert (=> b!1400232 m!1287621))

(declare-fun m!1287623 () Bool)

(assert (=> b!1400232 m!1287623))

(assert (=> b!1400232 m!1287617))

(declare-fun m!1287625 () Bool)

(assert (=> b!1400232 m!1287625))

(declare-fun m!1287627 () Bool)

(assert (=> b!1400230 m!1287627))

(declare-fun m!1287629 () Bool)

(assert (=> b!1400231 m!1287629))

(assert (=> b!1400231 m!1287617))

(assert (=> b!1400231 m!1287617))

(declare-fun m!1287631 () Bool)

(assert (=> b!1400231 m!1287631))

(assert (=> b!1400222 m!1287613))

(declare-fun m!1287633 () Bool)

(assert (=> b!1400222 m!1287633))

(declare-fun m!1287635 () Bool)

(assert (=> b!1400222 m!1287635))

(assert (=> b!1400226 m!1287617))

(assert (=> b!1400226 m!1287617))

(declare-fun m!1287637 () Bool)

(assert (=> b!1400226 m!1287637))

(declare-fun m!1287639 () Bool)

(assert (=> start!120316 m!1287639))

(declare-fun m!1287641 () Bool)

(assert (=> start!120316 m!1287641))

(assert (=> b!1400228 m!1287617))

(assert (=> b!1400228 m!1287617))

(declare-fun m!1287643 () Bool)

(assert (=> b!1400228 m!1287643))

(push 1)

