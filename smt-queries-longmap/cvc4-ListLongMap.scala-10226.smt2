; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120412 () Bool)

(assert start!120412)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95821 0))(
  ( (array!95822 (arr!46261 (Array (_ BitVec 32) (_ BitVec 64))) (size!46811 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95821)

(declare-fun e!793766 () Bool)

(declare-fun b!1401806 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10578 0))(
  ( (MissingZero!10578 (index!44689 (_ BitVec 32))) (Found!10578 (index!44690 (_ BitVec 32))) (Intermediate!10578 (undefined!11390 Bool) (index!44691 (_ BitVec 32)) (x!126317 (_ BitVec 32))) (Undefined!10578) (MissingVacant!10578 (index!44692 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95821 (_ BitVec 32)) SeekEntryResult!10578)

(assert (=> b!1401806 (= e!793766 (= (seekEntryOrOpen!0 (select (arr!46261 a!2901) j!112) a!2901 mask!2840) (Found!10578 j!112)))))

(declare-fun b!1401807 () Bool)

(declare-fun lt!617204 () array!95821)

(declare-fun lt!617202 () (_ BitVec 64))

(declare-fun lt!617203 () SeekEntryResult!10578)

(declare-fun e!793768 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95821 (_ BitVec 32)) SeekEntryResult!10578)

(assert (=> b!1401807 (= e!793768 (= (seekEntryOrOpen!0 lt!617202 lt!617204 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126317 lt!617203) (index!44691 lt!617203) (index!44691 lt!617203) (select (arr!46261 a!2901) j!112) lt!617204 mask!2840)))))

(declare-fun b!1401808 () Bool)

(declare-fun res!940317 () Bool)

(declare-fun e!793771 () Bool)

(assert (=> b!1401808 (=> (not res!940317) (not e!793771))))

(declare-datatypes ((List!32780 0))(
  ( (Nil!32777) (Cons!32776 (h!34024 (_ BitVec 64)) (t!47474 List!32780)) )
))
(declare-fun arrayNoDuplicates!0 (array!95821 (_ BitVec 32) List!32780) Bool)

(assert (=> b!1401808 (= res!940317 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32777))))

(declare-fun b!1401809 () Bool)

(declare-fun res!940325 () Bool)

(assert (=> b!1401809 (=> (not res!940325) (not e!793771))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95821 (_ BitVec 32)) Bool)

(assert (=> b!1401809 (= res!940325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401810 () Bool)

(declare-fun e!793770 () Bool)

(declare-fun e!793769 () Bool)

(assert (=> b!1401810 (= e!793770 e!793769)))

(declare-fun res!940322 () Bool)

(assert (=> b!1401810 (=> res!940322 e!793769)))

(declare-fun lt!617205 () SeekEntryResult!10578)

(assert (=> b!1401810 (= res!940322 (or (= lt!617205 lt!617203) (not (is-Intermediate!10578 lt!617203))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95821 (_ BitVec 32)) SeekEntryResult!10578)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401810 (= lt!617203 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617202 mask!2840) lt!617202 lt!617204 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1401810 (= lt!617202 (select (store (arr!46261 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401810 (= lt!617204 (array!95822 (store (arr!46261 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46811 a!2901)))))

(declare-fun res!940324 () Bool)

(assert (=> start!120412 (=> (not res!940324) (not e!793771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120412 (= res!940324 (validMask!0 mask!2840))))

(assert (=> start!120412 e!793771))

(assert (=> start!120412 true))

(declare-fun array_inv!35289 (array!95821) Bool)

(assert (=> start!120412 (array_inv!35289 a!2901)))

(declare-fun b!1401811 () Bool)

(declare-fun res!940321 () Bool)

(assert (=> b!1401811 (=> (not res!940321) (not e!793771))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401811 (= res!940321 (validKeyInArray!0 (select (arr!46261 a!2901) j!112)))))

(declare-fun b!1401812 () Bool)

(declare-fun res!940320 () Bool)

(assert (=> b!1401812 (=> (not res!940320) (not e!793771))))

(assert (=> b!1401812 (= res!940320 (and (= (size!46811 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46811 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46811 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401813 () Bool)

(declare-fun res!940318 () Bool)

(assert (=> b!1401813 (=> (not res!940318) (not e!793771))))

(assert (=> b!1401813 (= res!940318 (validKeyInArray!0 (select (arr!46261 a!2901) i!1037)))))

(declare-fun b!1401814 () Bool)

(declare-fun e!793767 () Bool)

(assert (=> b!1401814 (= e!793767 true)))

(declare-fun lt!617198 () (_ BitVec 32))

(declare-fun lt!617199 () SeekEntryResult!10578)

(assert (=> b!1401814 (= lt!617199 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617198 lt!617202 lt!617204 mask!2840))))

(declare-fun b!1401815 () Bool)

(assert (=> b!1401815 (= e!793771 (not e!793770))))

(declare-fun res!940323 () Bool)

(assert (=> b!1401815 (=> res!940323 e!793770)))

(assert (=> b!1401815 (= res!940323 (or (not (is-Intermediate!10578 lt!617205)) (undefined!11390 lt!617205)))))

(assert (=> b!1401815 e!793766))

(declare-fun res!940327 () Bool)

(assert (=> b!1401815 (=> (not res!940327) (not e!793766))))

(assert (=> b!1401815 (= res!940327 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47160 0))(
  ( (Unit!47161) )
))
(declare-fun lt!617201 () Unit!47160)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95821 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47160)

(assert (=> b!1401815 (= lt!617201 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1401815 (= lt!617205 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617198 (select (arr!46261 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1401815 (= lt!617198 (toIndex!0 (select (arr!46261 a!2901) j!112) mask!2840))))

(declare-fun b!1401816 () Bool)

(assert (=> b!1401816 (= e!793769 e!793767)))

(declare-fun res!940326 () Bool)

(assert (=> b!1401816 (=> res!940326 e!793767)))

(assert (=> b!1401816 (= res!940326 (or (bvslt (x!126317 lt!617205) #b00000000000000000000000000000000) (bvsgt (x!126317 lt!617205) #b01111111111111111111111111111110) (bvslt (x!126317 lt!617203) #b00000000000000000000000000000000) (bvsgt (x!126317 lt!617203) #b01111111111111111111111111111110) (bvslt lt!617198 #b00000000000000000000000000000000) (bvsge lt!617198 (size!46811 a!2901)) (bvslt (index!44691 lt!617205) #b00000000000000000000000000000000) (bvsge (index!44691 lt!617205) (size!46811 a!2901)) (bvslt (index!44691 lt!617203) #b00000000000000000000000000000000) (bvsge (index!44691 lt!617203) (size!46811 a!2901)) (not (= lt!617205 (Intermediate!10578 false (index!44691 lt!617205) (x!126317 lt!617205)))) (not (= lt!617203 (Intermediate!10578 false (index!44691 lt!617203) (x!126317 lt!617203))))))))

(assert (=> b!1401816 e!793768))

(declare-fun res!940319 () Bool)

(assert (=> b!1401816 (=> (not res!940319) (not e!793768))))

(assert (=> b!1401816 (= res!940319 (and (not (undefined!11390 lt!617203)) (= (index!44691 lt!617203) i!1037) (bvslt (x!126317 lt!617203) (x!126317 lt!617205)) (= (select (store (arr!46261 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44691 lt!617203)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!617200 () Unit!47160)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95821 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47160)

(assert (=> b!1401816 (= lt!617200 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617198 (x!126317 lt!617205) (index!44691 lt!617205) (x!126317 lt!617203) (index!44691 lt!617203) (undefined!11390 lt!617203) mask!2840))))

(assert (= (and start!120412 res!940324) b!1401812))

(assert (= (and b!1401812 res!940320) b!1401813))

(assert (= (and b!1401813 res!940318) b!1401811))

(assert (= (and b!1401811 res!940321) b!1401809))

(assert (= (and b!1401809 res!940325) b!1401808))

(assert (= (and b!1401808 res!940317) b!1401815))

(assert (= (and b!1401815 res!940327) b!1401806))

(assert (= (and b!1401815 (not res!940323)) b!1401810))

(assert (= (and b!1401810 (not res!940322)) b!1401816))

(assert (= (and b!1401816 res!940319) b!1401807))

(assert (= (and b!1401816 (not res!940326)) b!1401814))

(declare-fun m!1289713 () Bool)

(assert (=> b!1401808 m!1289713))

(declare-fun m!1289715 () Bool)

(assert (=> b!1401815 m!1289715))

(declare-fun m!1289717 () Bool)

(assert (=> b!1401815 m!1289717))

(assert (=> b!1401815 m!1289715))

(declare-fun m!1289719 () Bool)

(assert (=> b!1401815 m!1289719))

(assert (=> b!1401815 m!1289715))

(declare-fun m!1289721 () Bool)

(assert (=> b!1401815 m!1289721))

(declare-fun m!1289723 () Bool)

(assert (=> b!1401815 m!1289723))

(declare-fun m!1289725 () Bool)

(assert (=> b!1401814 m!1289725))

(declare-fun m!1289727 () Bool)

(assert (=> b!1401810 m!1289727))

(assert (=> b!1401810 m!1289727))

(declare-fun m!1289729 () Bool)

(assert (=> b!1401810 m!1289729))

(declare-fun m!1289731 () Bool)

(assert (=> b!1401810 m!1289731))

(declare-fun m!1289733 () Bool)

(assert (=> b!1401810 m!1289733))

(declare-fun m!1289735 () Bool)

(assert (=> start!120412 m!1289735))

(declare-fun m!1289737 () Bool)

(assert (=> start!120412 m!1289737))

(assert (=> b!1401811 m!1289715))

(assert (=> b!1401811 m!1289715))

(declare-fun m!1289739 () Bool)

(assert (=> b!1401811 m!1289739))

(assert (=> b!1401816 m!1289731))

(declare-fun m!1289741 () Bool)

(assert (=> b!1401816 m!1289741))

(declare-fun m!1289743 () Bool)

(assert (=> b!1401816 m!1289743))

(declare-fun m!1289745 () Bool)

(assert (=> b!1401807 m!1289745))

(assert (=> b!1401807 m!1289715))

(assert (=> b!1401807 m!1289715))

(declare-fun m!1289747 () Bool)

(assert (=> b!1401807 m!1289747))

(assert (=> b!1401806 m!1289715))

(assert (=> b!1401806 m!1289715))

(declare-fun m!1289749 () Bool)

(assert (=> b!1401806 m!1289749))

(declare-fun m!1289751 () Bool)

(assert (=> b!1401809 m!1289751))

(declare-fun m!1289753 () Bool)

(assert (=> b!1401813 m!1289753))

(assert (=> b!1401813 m!1289753))

(declare-fun m!1289755 () Bool)

(assert (=> b!1401813 m!1289755))

(push 1)

