; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121608 () Bool)

(assert start!121608)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!799483 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((array!96546 0))(
  ( (array!96547 (arr!46610 (Array (_ BitVec 32) (_ BitVec 64))) (size!47160 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96546)

(declare-fun b!1412736 () Bool)

(declare-datatypes ((SeekEntryResult!10921 0))(
  ( (MissingZero!10921 (index!46064 (_ BitVec 32))) (Found!10921 (index!46065 (_ BitVec 32))) (Intermediate!10921 (undefined!11733 Bool) (index!46066 (_ BitVec 32)) (x!127656 (_ BitVec 32))) (Undefined!10921) (MissingVacant!10921 (index!46067 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96546 (_ BitVec 32)) SeekEntryResult!10921)

(assert (=> b!1412736 (= e!799483 (= (seekEntryOrOpen!0 (select (arr!46610 a!2901) j!112) a!2901 mask!2840) (Found!10921 j!112)))))

(declare-fun b!1412737 () Bool)

(declare-fun e!799479 () Bool)

(declare-fun e!799482 () Bool)

(assert (=> b!1412737 (= e!799479 (not e!799482))))

(declare-fun res!949729 () Bool)

(assert (=> b!1412737 (=> res!949729 e!799482)))

(declare-fun lt!622546 () SeekEntryResult!10921)

(assert (=> b!1412737 (= res!949729 (or (not (is-Intermediate!10921 lt!622546)) (undefined!11733 lt!622546)))))

(assert (=> b!1412737 e!799483))

(declare-fun res!949726 () Bool)

(assert (=> b!1412737 (=> (not res!949726) (not e!799483))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96546 (_ BitVec 32)) Bool)

(assert (=> b!1412737 (= res!949726 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47816 0))(
  ( (Unit!47817) )
))
(declare-fun lt!622544 () Unit!47816)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96546 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47816)

(assert (=> b!1412737 (= lt!622544 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!622542 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96546 (_ BitVec 32)) SeekEntryResult!10921)

(assert (=> b!1412737 (= lt!622546 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622542 (select (arr!46610 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412737 (= lt!622542 (toIndex!0 (select (arr!46610 a!2901) j!112) mask!2840))))

(declare-fun b!1412738 () Bool)

(declare-fun res!949730 () Bool)

(assert (=> b!1412738 (=> (not res!949730) (not e!799479))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412738 (= res!949730 (validKeyInArray!0 (select (arr!46610 a!2901) j!112)))))

(declare-fun b!1412739 () Bool)

(declare-fun res!949735 () Bool)

(assert (=> b!1412739 (=> (not res!949735) (not e!799479))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1412739 (= res!949735 (validKeyInArray!0 (select (arr!46610 a!2901) i!1037)))))

(declare-fun b!1412740 () Bool)

(declare-fun res!949731 () Bool)

(assert (=> b!1412740 (=> (not res!949731) (not e!799479))))

(assert (=> b!1412740 (= res!949731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412741 () Bool)

(declare-fun res!949728 () Bool)

(assert (=> b!1412741 (=> (not res!949728) (not e!799479))))

(declare-datatypes ((List!33129 0))(
  ( (Nil!33126) (Cons!33125 (h!34400 (_ BitVec 64)) (t!47823 List!33129)) )
))
(declare-fun arrayNoDuplicates!0 (array!96546 (_ BitVec 32) List!33129) Bool)

(assert (=> b!1412741 (= res!949728 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33126))))

(declare-fun res!949732 () Bool)

(assert (=> start!121608 (=> (not res!949732) (not e!799479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121608 (= res!949732 (validMask!0 mask!2840))))

(assert (=> start!121608 e!799479))

(assert (=> start!121608 true))

(declare-fun array_inv!35638 (array!96546) Bool)

(assert (=> start!121608 (array_inv!35638 a!2901)))

(declare-fun b!1412742 () Bool)

(declare-fun e!799481 () Bool)

(assert (=> b!1412742 (= e!799481 true)))

(declare-fun e!799484 () Bool)

(assert (=> b!1412742 e!799484))

(declare-fun res!949733 () Bool)

(assert (=> b!1412742 (=> (not res!949733) (not e!799484))))

(declare-fun lt!622543 () SeekEntryResult!10921)

(assert (=> b!1412742 (= res!949733 (and (not (undefined!11733 lt!622543)) (= (index!46066 lt!622543) i!1037) (bvslt (x!127656 lt!622543) (x!127656 lt!622546)) (= (select (store (arr!46610 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46066 lt!622543)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622545 () Unit!47816)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96546 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47816)

(assert (=> b!1412742 (= lt!622545 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622542 (x!127656 lt!622546) (index!46066 lt!622546) (x!127656 lt!622543) (index!46066 lt!622543) (undefined!11733 lt!622543) mask!2840))))

(declare-fun b!1412743 () Bool)

(declare-fun res!949727 () Bool)

(assert (=> b!1412743 (=> (not res!949727) (not e!799479))))

(assert (=> b!1412743 (= res!949727 (and (= (size!47160 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47160 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47160 a!2901)) (not (= i!1037 j!112))))))

(declare-fun lt!622547 () (_ BitVec 64))

(declare-fun lt!622548 () array!96546)

(declare-fun b!1412744 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96546 (_ BitVec 32)) SeekEntryResult!10921)

(assert (=> b!1412744 (= e!799484 (= (seekEntryOrOpen!0 lt!622547 lt!622548 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127656 lt!622543) (index!46066 lt!622543) (index!46066 lt!622543) (select (arr!46610 a!2901) j!112) lt!622548 mask!2840)))))

(declare-fun b!1412745 () Bool)

(assert (=> b!1412745 (= e!799482 e!799481)))

(declare-fun res!949734 () Bool)

(assert (=> b!1412745 (=> res!949734 e!799481)))

(assert (=> b!1412745 (= res!949734 (or (= lt!622546 lt!622543) (not (is-Intermediate!10921 lt!622543))))))

(assert (=> b!1412745 (= lt!622543 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622547 mask!2840) lt!622547 lt!622548 mask!2840))))

(assert (=> b!1412745 (= lt!622547 (select (store (arr!46610 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412745 (= lt!622548 (array!96547 (store (arr!46610 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47160 a!2901)))))

(assert (= (and start!121608 res!949732) b!1412743))

(assert (= (and b!1412743 res!949727) b!1412739))

(assert (= (and b!1412739 res!949735) b!1412738))

(assert (= (and b!1412738 res!949730) b!1412740))

(assert (= (and b!1412740 res!949731) b!1412741))

(assert (= (and b!1412741 res!949728) b!1412737))

(assert (= (and b!1412737 res!949726) b!1412736))

(assert (= (and b!1412737 (not res!949729)) b!1412745))

(assert (= (and b!1412745 (not res!949734)) b!1412742))

(assert (= (and b!1412742 res!949733) b!1412744))

(declare-fun m!1302879 () Bool)

(assert (=> b!1412741 m!1302879))

(declare-fun m!1302881 () Bool)

(assert (=> b!1412738 m!1302881))

(assert (=> b!1412738 m!1302881))

(declare-fun m!1302883 () Bool)

(assert (=> b!1412738 m!1302883))

(declare-fun m!1302885 () Bool)

(assert (=> b!1412742 m!1302885))

(declare-fun m!1302887 () Bool)

(assert (=> b!1412742 m!1302887))

(declare-fun m!1302889 () Bool)

(assert (=> b!1412742 m!1302889))

(assert (=> b!1412736 m!1302881))

(assert (=> b!1412736 m!1302881))

(declare-fun m!1302891 () Bool)

(assert (=> b!1412736 m!1302891))

(declare-fun m!1302893 () Bool)

(assert (=> b!1412744 m!1302893))

(assert (=> b!1412744 m!1302881))

(assert (=> b!1412744 m!1302881))

(declare-fun m!1302895 () Bool)

(assert (=> b!1412744 m!1302895))

(declare-fun m!1302897 () Bool)

(assert (=> start!121608 m!1302897))

(declare-fun m!1302899 () Bool)

(assert (=> start!121608 m!1302899))

(declare-fun m!1302901 () Bool)

(assert (=> b!1412745 m!1302901))

(assert (=> b!1412745 m!1302901))

(declare-fun m!1302903 () Bool)

(assert (=> b!1412745 m!1302903))

(assert (=> b!1412745 m!1302885))

(declare-fun m!1302905 () Bool)

(assert (=> b!1412745 m!1302905))

(declare-fun m!1302907 () Bool)

(assert (=> b!1412740 m!1302907))

(declare-fun m!1302909 () Bool)

(assert (=> b!1412739 m!1302909))

(assert (=> b!1412739 m!1302909))

(declare-fun m!1302911 () Bool)

(assert (=> b!1412739 m!1302911))

(assert (=> b!1412737 m!1302881))

(declare-fun m!1302913 () Bool)

(assert (=> b!1412737 m!1302913))

(declare-fun m!1302915 () Bool)

(assert (=> b!1412737 m!1302915))

(assert (=> b!1412737 m!1302881))

(declare-fun m!1302917 () Bool)

(assert (=> b!1412737 m!1302917))

(assert (=> b!1412737 m!1302881))

(declare-fun m!1302919 () Bool)

(assert (=> b!1412737 m!1302919))

(push 1)

