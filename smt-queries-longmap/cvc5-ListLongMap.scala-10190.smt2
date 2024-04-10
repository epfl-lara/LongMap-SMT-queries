; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120066 () Bool)

(assert start!120066)

(declare-fun b!1397851 () Bool)

(declare-fun res!936771 () Bool)

(declare-fun e!791359 () Bool)

(assert (=> b!1397851 (=> (not res!936771) (not e!791359))))

(declare-datatypes ((array!95595 0))(
  ( (array!95596 (arr!46151 (Array (_ BitVec 32) (_ BitVec 64))) (size!46701 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95595)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95595 (_ BitVec 32)) Bool)

(assert (=> b!1397851 (= res!936771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397852 () Bool)

(declare-fun res!936766 () Bool)

(assert (=> b!1397852 (=> (not res!936766) (not e!791359))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397852 (= res!936766 (validKeyInArray!0 (select (arr!46151 a!2901) i!1037)))))

(declare-fun b!1397854 () Bool)

(declare-fun e!791361 () Bool)

(declare-fun e!791362 () Bool)

(assert (=> b!1397854 (= e!791361 e!791362)))

(declare-fun res!936764 () Bool)

(assert (=> b!1397854 (=> res!936764 e!791362)))

(declare-datatypes ((SeekEntryResult!10468 0))(
  ( (MissingZero!10468 (index!44243 (_ BitVec 32))) (Found!10468 (index!44244 (_ BitVec 32))) (Intermediate!10468 (undefined!11280 Bool) (index!44245 (_ BitVec 32)) (x!125898 (_ BitVec 32))) (Undefined!10468) (MissingVacant!10468 (index!44246 (_ BitVec 32))) )
))
(declare-fun lt!614527 () SeekEntryResult!10468)

(declare-fun lt!614525 () SeekEntryResult!10468)

(declare-fun lt!614528 () (_ BitVec 32))

(assert (=> b!1397854 (= res!936764 (or (= lt!614525 lt!614527) (not (is-Intermediate!10468 lt!614527)) (bvslt (x!125898 lt!614525) #b00000000000000000000000000000000) (bvsgt (x!125898 lt!614525) #b01111111111111111111111111111110) (bvslt lt!614528 #b00000000000000000000000000000000) (bvsge lt!614528 (size!46701 a!2901)) (bvslt (index!44245 lt!614525) #b00000000000000000000000000000000) (bvsge (index!44245 lt!614525) (size!46701 a!2901)) (not (= lt!614525 (Intermediate!10468 false (index!44245 lt!614525) (x!125898 lt!614525)))) (not (= lt!614527 (Intermediate!10468 (undefined!11280 lt!614527) (index!44245 lt!614527) (x!125898 lt!614527))))))))

(declare-fun lt!614524 () (_ BitVec 64))

(declare-fun lt!614523 () array!95595)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95595 (_ BitVec 32)) SeekEntryResult!10468)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397854 (= lt!614527 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614524 mask!2840) lt!614524 lt!614523 mask!2840))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1397854 (= lt!614524 (select (store (arr!46151 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397854 (= lt!614523 (array!95596 (store (arr!46151 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46701 a!2901)))))

(declare-fun b!1397855 () Bool)

(declare-fun e!791360 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95595 (_ BitVec 32)) SeekEntryResult!10468)

(assert (=> b!1397855 (= e!791360 (= (seekEntryOrOpen!0 (select (arr!46151 a!2901) j!112) a!2901 mask!2840) (Found!10468 j!112)))))

(declare-fun b!1397853 () Bool)

(assert (=> b!1397853 (= e!791359 (not e!791361))))

(declare-fun res!936769 () Bool)

(assert (=> b!1397853 (=> res!936769 e!791361)))

(assert (=> b!1397853 (= res!936769 (or (not (is-Intermediate!10468 lt!614525)) (undefined!11280 lt!614525)))))

(assert (=> b!1397853 e!791360))

(declare-fun res!936768 () Bool)

(assert (=> b!1397853 (=> (not res!936768) (not e!791360))))

(assert (=> b!1397853 (= res!936768 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46940 0))(
  ( (Unit!46941) )
))
(declare-fun lt!614526 () Unit!46940)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95595 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46940)

(assert (=> b!1397853 (= lt!614526 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1397853 (= lt!614525 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614528 (select (arr!46151 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1397853 (= lt!614528 (toIndex!0 (select (arr!46151 a!2901) j!112) mask!2840))))

(declare-fun res!936765 () Bool)

(assert (=> start!120066 (=> (not res!936765) (not e!791359))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120066 (= res!936765 (validMask!0 mask!2840))))

(assert (=> start!120066 e!791359))

(assert (=> start!120066 true))

(declare-fun array_inv!35179 (array!95595) Bool)

(assert (=> start!120066 (array_inv!35179 a!2901)))

(declare-fun b!1397856 () Bool)

(declare-fun res!936772 () Bool)

(assert (=> b!1397856 (=> (not res!936772) (not e!791359))))

(assert (=> b!1397856 (= res!936772 (and (= (size!46701 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46701 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46701 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397857 () Bool)

(declare-fun res!936770 () Bool)

(assert (=> b!1397857 (=> (not res!936770) (not e!791359))))

(assert (=> b!1397857 (= res!936770 (validKeyInArray!0 (select (arr!46151 a!2901) j!112)))))

(declare-fun b!1397858 () Bool)

(assert (=> b!1397858 (= e!791362 true)))

(declare-fun lt!614529 () SeekEntryResult!10468)

(assert (=> b!1397858 (= lt!614529 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614528 lt!614524 lt!614523 mask!2840))))

(declare-fun b!1397859 () Bool)

(declare-fun res!936767 () Bool)

(assert (=> b!1397859 (=> (not res!936767) (not e!791359))))

(declare-datatypes ((List!32670 0))(
  ( (Nil!32667) (Cons!32666 (h!33908 (_ BitVec 64)) (t!47364 List!32670)) )
))
(declare-fun arrayNoDuplicates!0 (array!95595 (_ BitVec 32) List!32670) Bool)

(assert (=> b!1397859 (= res!936767 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32667))))

(assert (= (and start!120066 res!936765) b!1397856))

(assert (= (and b!1397856 res!936772) b!1397852))

(assert (= (and b!1397852 res!936766) b!1397857))

(assert (= (and b!1397857 res!936770) b!1397851))

(assert (= (and b!1397851 res!936771) b!1397859))

(assert (= (and b!1397859 res!936767) b!1397853))

(assert (= (and b!1397853 res!936768) b!1397855))

(assert (= (and b!1397853 (not res!936769)) b!1397854))

(assert (= (and b!1397854 (not res!936764)) b!1397858))

(declare-fun m!1284759 () Bool)

(assert (=> b!1397859 m!1284759))

(declare-fun m!1284761 () Bool)

(assert (=> b!1397855 m!1284761))

(assert (=> b!1397855 m!1284761))

(declare-fun m!1284763 () Bool)

(assert (=> b!1397855 m!1284763))

(declare-fun m!1284765 () Bool)

(assert (=> b!1397858 m!1284765))

(declare-fun m!1284767 () Bool)

(assert (=> b!1397852 m!1284767))

(assert (=> b!1397852 m!1284767))

(declare-fun m!1284769 () Bool)

(assert (=> b!1397852 m!1284769))

(declare-fun m!1284771 () Bool)

(assert (=> start!120066 m!1284771))

(declare-fun m!1284773 () Bool)

(assert (=> start!120066 m!1284773))

(assert (=> b!1397853 m!1284761))

(declare-fun m!1284775 () Bool)

(assert (=> b!1397853 m!1284775))

(assert (=> b!1397853 m!1284761))

(assert (=> b!1397853 m!1284761))

(declare-fun m!1284777 () Bool)

(assert (=> b!1397853 m!1284777))

(declare-fun m!1284779 () Bool)

(assert (=> b!1397853 m!1284779))

(declare-fun m!1284781 () Bool)

(assert (=> b!1397853 m!1284781))

(declare-fun m!1284783 () Bool)

(assert (=> b!1397851 m!1284783))

(assert (=> b!1397857 m!1284761))

(assert (=> b!1397857 m!1284761))

(declare-fun m!1284785 () Bool)

(assert (=> b!1397857 m!1284785))

(declare-fun m!1284787 () Bool)

(assert (=> b!1397854 m!1284787))

(assert (=> b!1397854 m!1284787))

(declare-fun m!1284789 () Bool)

(assert (=> b!1397854 m!1284789))

(declare-fun m!1284791 () Bool)

(assert (=> b!1397854 m!1284791))

(declare-fun m!1284793 () Bool)

(assert (=> b!1397854 m!1284793))

(push 1)

