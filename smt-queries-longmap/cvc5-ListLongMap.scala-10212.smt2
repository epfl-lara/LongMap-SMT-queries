; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120324 () Bool)

(assert start!120324)

(declare-fun b!1400354 () Bool)

(declare-fun e!792848 () Bool)

(declare-fun e!792845 () Bool)

(assert (=> b!1400354 (= e!792848 e!792845)))

(declare-fun res!938874 () Bool)

(assert (=> b!1400354 (=> res!938874 e!792845)))

(declare-datatypes ((array!95733 0))(
  ( (array!95734 (arr!46217 (Array (_ BitVec 32) (_ BitVec 64))) (size!46767 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95733)

(declare-datatypes ((SeekEntryResult!10534 0))(
  ( (MissingZero!10534 (index!44513 (_ BitVec 32))) (Found!10534 (index!44514 (_ BitVec 32))) (Intermediate!10534 (undefined!11346 Bool) (index!44515 (_ BitVec 32)) (x!126161 (_ BitVec 32))) (Undefined!10534) (MissingVacant!10534 (index!44516 (_ BitVec 32))) )
))
(declare-fun lt!616145 () SeekEntryResult!10534)

(declare-fun lt!616147 () (_ BitVec 32))

(declare-fun lt!616142 () SeekEntryResult!10534)

(assert (=> b!1400354 (= res!938874 (or (bvslt (x!126161 lt!616145) #b00000000000000000000000000000000) (bvsgt (x!126161 lt!616145) #b01111111111111111111111111111110) (bvslt (x!126161 lt!616142) #b00000000000000000000000000000000) (bvsgt (x!126161 lt!616142) #b01111111111111111111111111111110) (bvslt lt!616147 #b00000000000000000000000000000000) (bvsge lt!616147 (size!46767 a!2901)) (bvslt (index!44515 lt!616145) #b00000000000000000000000000000000) (bvsge (index!44515 lt!616145) (size!46767 a!2901)) (bvslt (index!44515 lt!616142) #b00000000000000000000000000000000) (bvsge (index!44515 lt!616142) (size!46767 a!2901)) (not (= lt!616145 (Intermediate!10534 false (index!44515 lt!616145) (x!126161 lt!616145)))) (not (= lt!616142 (Intermediate!10534 false (index!44515 lt!616142) (x!126161 lt!616142))))))))

(declare-fun e!792843 () Bool)

(assert (=> b!1400354 e!792843))

(declare-fun res!938869 () Bool)

(assert (=> b!1400354 (=> (not res!938869) (not e!792843))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1400354 (= res!938869 (and (not (undefined!11346 lt!616142)) (= (index!44515 lt!616142) i!1037) (bvslt (x!126161 lt!616142) (x!126161 lt!616145)) (= (select (store (arr!46217 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44515 lt!616142)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((Unit!47072 0))(
  ( (Unit!47073) )
))
(declare-fun lt!616149 () Unit!47072)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95733 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47072)

(assert (=> b!1400354 (= lt!616149 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616147 (x!126161 lt!616145) (index!44515 lt!616145) (x!126161 lt!616142) (index!44515 lt!616142) (undefined!11346 lt!616142) mask!2840))))

(declare-fun b!1400355 () Bool)

(declare-fun res!938870 () Bool)

(declare-fun e!792844 () Bool)

(assert (=> b!1400355 (=> (not res!938870) (not e!792844))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95733 (_ BitVec 32)) Bool)

(assert (=> b!1400355 (= res!938870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400356 () Bool)

(declare-fun e!792846 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95733 (_ BitVec 32)) SeekEntryResult!10534)

(assert (=> b!1400356 (= e!792846 (= (seekEntryOrOpen!0 (select (arr!46217 a!2901) j!112) a!2901 mask!2840) (Found!10534 j!112)))))

(declare-fun b!1400357 () Bool)

(declare-fun res!938875 () Bool)

(assert (=> b!1400357 (=> (not res!938875) (not e!792844))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400357 (= res!938875 (validKeyInArray!0 (select (arr!46217 a!2901) i!1037)))))

(declare-fun res!938872 () Bool)

(assert (=> start!120324 (=> (not res!938872) (not e!792844))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120324 (= res!938872 (validMask!0 mask!2840))))

(assert (=> start!120324 e!792844))

(assert (=> start!120324 true))

(declare-fun array_inv!35245 (array!95733) Bool)

(assert (=> start!120324 (array_inv!35245 a!2901)))

(declare-fun b!1400358 () Bool)

(declare-fun e!792847 () Bool)

(assert (=> b!1400358 (= e!792844 (not e!792847))))

(declare-fun res!938867 () Bool)

(assert (=> b!1400358 (=> res!938867 e!792847)))

(assert (=> b!1400358 (= res!938867 (or (not (is-Intermediate!10534 lt!616145)) (undefined!11346 lt!616145)))))

(assert (=> b!1400358 e!792846))

(declare-fun res!938873 () Bool)

(assert (=> b!1400358 (=> (not res!938873) (not e!792846))))

(assert (=> b!1400358 (= res!938873 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!616148 () Unit!47072)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95733 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47072)

(assert (=> b!1400358 (= lt!616148 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95733 (_ BitVec 32)) SeekEntryResult!10534)

(assert (=> b!1400358 (= lt!616145 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616147 (select (arr!46217 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400358 (= lt!616147 (toIndex!0 (select (arr!46217 a!2901) j!112) mask!2840))))

(declare-fun b!1400359 () Bool)

(declare-fun res!938871 () Bool)

(assert (=> b!1400359 (=> (not res!938871) (not e!792844))))

(assert (=> b!1400359 (= res!938871 (and (= (size!46767 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46767 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46767 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400360 () Bool)

(assert (=> b!1400360 (= e!792847 e!792848)))

(declare-fun res!938865 () Bool)

(assert (=> b!1400360 (=> res!938865 e!792848)))

(assert (=> b!1400360 (= res!938865 (or (= lt!616145 lt!616142) (not (is-Intermediate!10534 lt!616142))))))

(declare-fun lt!616146 () array!95733)

(declare-fun lt!616143 () (_ BitVec 64))

(assert (=> b!1400360 (= lt!616142 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616143 mask!2840) lt!616143 lt!616146 mask!2840))))

(assert (=> b!1400360 (= lt!616143 (select (store (arr!46217 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400360 (= lt!616146 (array!95734 (store (arr!46217 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46767 a!2901)))))

(declare-fun b!1400361 () Bool)

(declare-fun res!938868 () Bool)

(assert (=> b!1400361 (=> (not res!938868) (not e!792844))))

(assert (=> b!1400361 (= res!938868 (validKeyInArray!0 (select (arr!46217 a!2901) j!112)))))

(declare-fun b!1400362 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95733 (_ BitVec 32)) SeekEntryResult!10534)

(assert (=> b!1400362 (= e!792843 (= (seekEntryOrOpen!0 lt!616143 lt!616146 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126161 lt!616142) (index!44515 lt!616142) (index!44515 lt!616142) (select (arr!46217 a!2901) j!112) lt!616146 mask!2840)))))

(declare-fun b!1400363 () Bool)

(declare-fun res!938866 () Bool)

(assert (=> b!1400363 (=> (not res!938866) (not e!792844))))

(declare-datatypes ((List!32736 0))(
  ( (Nil!32733) (Cons!32732 (h!33980 (_ BitVec 64)) (t!47430 List!32736)) )
))
(declare-fun arrayNoDuplicates!0 (array!95733 (_ BitVec 32) List!32736) Bool)

(assert (=> b!1400363 (= res!938866 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32733))))

(declare-fun b!1400364 () Bool)

(assert (=> b!1400364 (= e!792845 true)))

(declare-fun lt!616144 () SeekEntryResult!10534)

(assert (=> b!1400364 (= lt!616144 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616147 lt!616143 lt!616146 mask!2840))))

(assert (= (and start!120324 res!938872) b!1400359))

(assert (= (and b!1400359 res!938871) b!1400357))

(assert (= (and b!1400357 res!938875) b!1400361))

(assert (= (and b!1400361 res!938868) b!1400355))

(assert (= (and b!1400355 res!938870) b!1400363))

(assert (= (and b!1400363 res!938866) b!1400358))

(assert (= (and b!1400358 res!938873) b!1400356))

(assert (= (and b!1400358 (not res!938867)) b!1400360))

(assert (= (and b!1400360 (not res!938865)) b!1400354))

(assert (= (and b!1400354 res!938869) b!1400362))

(assert (= (and b!1400354 (not res!938874)) b!1400364))

(declare-fun m!1287777 () Bool)

(assert (=> b!1400362 m!1287777))

(declare-fun m!1287779 () Bool)

(assert (=> b!1400362 m!1287779))

(assert (=> b!1400362 m!1287779))

(declare-fun m!1287781 () Bool)

(assert (=> b!1400362 m!1287781))

(declare-fun m!1287783 () Bool)

(assert (=> b!1400360 m!1287783))

(assert (=> b!1400360 m!1287783))

(declare-fun m!1287785 () Bool)

(assert (=> b!1400360 m!1287785))

(declare-fun m!1287787 () Bool)

(assert (=> b!1400360 m!1287787))

(declare-fun m!1287789 () Bool)

(assert (=> b!1400360 m!1287789))

(assert (=> b!1400358 m!1287779))

(declare-fun m!1287791 () Bool)

(assert (=> b!1400358 m!1287791))

(assert (=> b!1400358 m!1287779))

(declare-fun m!1287793 () Bool)

(assert (=> b!1400358 m!1287793))

(declare-fun m!1287795 () Bool)

(assert (=> b!1400358 m!1287795))

(assert (=> b!1400358 m!1287779))

(declare-fun m!1287797 () Bool)

(assert (=> b!1400358 m!1287797))

(declare-fun m!1287799 () Bool)

(assert (=> start!120324 m!1287799))

(declare-fun m!1287801 () Bool)

(assert (=> start!120324 m!1287801))

(declare-fun m!1287803 () Bool)

(assert (=> b!1400357 m!1287803))

(assert (=> b!1400357 m!1287803))

(declare-fun m!1287805 () Bool)

(assert (=> b!1400357 m!1287805))

(declare-fun m!1287807 () Bool)

(assert (=> b!1400364 m!1287807))

(declare-fun m!1287809 () Bool)

(assert (=> b!1400363 m!1287809))

(assert (=> b!1400354 m!1287787))

(declare-fun m!1287811 () Bool)

(assert (=> b!1400354 m!1287811))

(declare-fun m!1287813 () Bool)

(assert (=> b!1400354 m!1287813))

(declare-fun m!1287815 () Bool)

(assert (=> b!1400355 m!1287815))

(assert (=> b!1400361 m!1287779))

(assert (=> b!1400361 m!1287779))

(declare-fun m!1287817 () Bool)

(assert (=> b!1400361 m!1287817))

(assert (=> b!1400356 m!1287779))

(assert (=> b!1400356 m!1287779))

(declare-fun m!1287819 () Bool)

(assert (=> b!1400356 m!1287819))

(push 1)

