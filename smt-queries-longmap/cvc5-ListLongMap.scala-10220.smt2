; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120372 () Bool)

(assert start!120372)

(declare-fun b!1401146 () Bool)

(declare-fun e!793348 () Bool)

(declare-fun e!793350 () Bool)

(assert (=> b!1401146 (= e!793348 (not e!793350))))

(declare-fun res!939660 () Bool)

(assert (=> b!1401146 (=> res!939660 e!793350)))

(declare-datatypes ((SeekEntryResult!10558 0))(
  ( (MissingZero!10558 (index!44609 (_ BitVec 32))) (Found!10558 (index!44610 (_ BitVec 32))) (Intermediate!10558 (undefined!11370 Bool) (index!44611 (_ BitVec 32)) (x!126249 (_ BitVec 32))) (Undefined!10558) (MissingVacant!10558 (index!44612 (_ BitVec 32))) )
))
(declare-fun lt!616725 () SeekEntryResult!10558)

(assert (=> b!1401146 (= res!939660 (or (not (is-Intermediate!10558 lt!616725)) (undefined!11370 lt!616725)))))

(declare-fun e!793351 () Bool)

(assert (=> b!1401146 e!793351))

(declare-fun res!939659 () Bool)

(assert (=> b!1401146 (=> (not res!939659) (not e!793351))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95781 0))(
  ( (array!95782 (arr!46241 (Array (_ BitVec 32) (_ BitVec 64))) (size!46791 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95781)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95781 (_ BitVec 32)) Bool)

(assert (=> b!1401146 (= res!939659 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47120 0))(
  ( (Unit!47121) )
))
(declare-fun lt!616722 () Unit!47120)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95781 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47120)

(assert (=> b!1401146 (= lt!616722 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!616718 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95781 (_ BitVec 32)) SeekEntryResult!10558)

(assert (=> b!1401146 (= lt!616725 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616718 (select (arr!46241 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401146 (= lt!616718 (toIndex!0 (select (arr!46241 a!2901) j!112) mask!2840))))

(declare-fun b!1401147 () Bool)

(declare-fun e!793347 () Bool)

(assert (=> b!1401147 (= e!793347 true)))

(declare-fun lt!616723 () array!95781)

(declare-fun lt!616720 () SeekEntryResult!10558)

(declare-fun lt!616721 () (_ BitVec 64))

(assert (=> b!1401147 (= lt!616720 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616718 lt!616721 lt!616723 mask!2840))))

(declare-fun b!1401148 () Bool)

(declare-fun res!939665 () Bool)

(assert (=> b!1401148 (=> (not res!939665) (not e!793348))))

(declare-datatypes ((List!32760 0))(
  ( (Nil!32757) (Cons!32756 (h!34004 (_ BitVec 64)) (t!47454 List!32760)) )
))
(declare-fun arrayNoDuplicates!0 (array!95781 (_ BitVec 32) List!32760) Bool)

(assert (=> b!1401148 (= res!939665 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32757))))

(declare-fun b!1401149 () Bool)

(declare-fun res!939657 () Bool)

(assert (=> b!1401149 (=> (not res!939657) (not e!793348))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1401149 (= res!939657 (and (= (size!46791 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46791 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46791 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401150 () Bool)

(declare-fun res!939667 () Bool)

(assert (=> b!1401150 (=> (not res!939667) (not e!793348))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401150 (= res!939667 (validKeyInArray!0 (select (arr!46241 a!2901) j!112)))))

(declare-fun res!939664 () Bool)

(assert (=> start!120372 (=> (not res!939664) (not e!793348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120372 (= res!939664 (validMask!0 mask!2840))))

(assert (=> start!120372 e!793348))

(assert (=> start!120372 true))

(declare-fun array_inv!35269 (array!95781) Bool)

(assert (=> start!120372 (array_inv!35269 a!2901)))

(declare-fun b!1401151 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95781 (_ BitVec 32)) SeekEntryResult!10558)

(assert (=> b!1401151 (= e!793351 (= (seekEntryOrOpen!0 (select (arr!46241 a!2901) j!112) a!2901 mask!2840) (Found!10558 j!112)))))

(declare-fun b!1401152 () Bool)

(declare-fun e!793346 () Bool)

(assert (=> b!1401152 (= e!793346 e!793347)))

(declare-fun res!939658 () Bool)

(assert (=> b!1401152 (=> res!939658 e!793347)))

(declare-fun lt!616724 () SeekEntryResult!10558)

(assert (=> b!1401152 (= res!939658 (or (bvslt (x!126249 lt!616725) #b00000000000000000000000000000000) (bvsgt (x!126249 lt!616725) #b01111111111111111111111111111110) (bvslt (x!126249 lt!616724) #b00000000000000000000000000000000) (bvsgt (x!126249 lt!616724) #b01111111111111111111111111111110) (bvslt lt!616718 #b00000000000000000000000000000000) (bvsge lt!616718 (size!46791 a!2901)) (bvslt (index!44611 lt!616725) #b00000000000000000000000000000000) (bvsge (index!44611 lt!616725) (size!46791 a!2901)) (bvslt (index!44611 lt!616724) #b00000000000000000000000000000000) (bvsge (index!44611 lt!616724) (size!46791 a!2901)) (not (= lt!616725 (Intermediate!10558 false (index!44611 lt!616725) (x!126249 lt!616725)))) (not (= lt!616724 (Intermediate!10558 false (index!44611 lt!616724) (x!126249 lt!616724))))))))

(declare-fun e!793349 () Bool)

(assert (=> b!1401152 e!793349))

(declare-fun res!939663 () Bool)

(assert (=> b!1401152 (=> (not res!939663) (not e!793349))))

(assert (=> b!1401152 (= res!939663 (and (not (undefined!11370 lt!616724)) (= (index!44611 lt!616724) i!1037) (bvslt (x!126249 lt!616724) (x!126249 lt!616725)) (= (select (store (arr!46241 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44611 lt!616724)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616719 () Unit!47120)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95781 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47120)

(assert (=> b!1401152 (= lt!616719 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616718 (x!126249 lt!616725) (index!44611 lt!616725) (x!126249 lt!616724) (index!44611 lt!616724) (undefined!11370 lt!616724) mask!2840))))

(declare-fun b!1401153 () Bool)

(declare-fun res!939661 () Bool)

(assert (=> b!1401153 (=> (not res!939661) (not e!793348))))

(assert (=> b!1401153 (= res!939661 (validKeyInArray!0 (select (arr!46241 a!2901) i!1037)))))

(declare-fun b!1401154 () Bool)

(declare-fun res!939666 () Bool)

(assert (=> b!1401154 (=> (not res!939666) (not e!793348))))

(assert (=> b!1401154 (= res!939666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401155 () Bool)

(assert (=> b!1401155 (= e!793350 e!793346)))

(declare-fun res!939662 () Bool)

(assert (=> b!1401155 (=> res!939662 e!793346)))

(assert (=> b!1401155 (= res!939662 (or (= lt!616725 lt!616724) (not (is-Intermediate!10558 lt!616724))))))

(assert (=> b!1401155 (= lt!616724 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616721 mask!2840) lt!616721 lt!616723 mask!2840))))

(assert (=> b!1401155 (= lt!616721 (select (store (arr!46241 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401155 (= lt!616723 (array!95782 (store (arr!46241 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46791 a!2901)))))

(declare-fun b!1401156 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95781 (_ BitVec 32)) SeekEntryResult!10558)

(assert (=> b!1401156 (= e!793349 (= (seekEntryOrOpen!0 lt!616721 lt!616723 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126249 lt!616724) (index!44611 lt!616724) (index!44611 lt!616724) (select (arr!46241 a!2901) j!112) lt!616723 mask!2840)))))

(assert (= (and start!120372 res!939664) b!1401149))

(assert (= (and b!1401149 res!939657) b!1401153))

(assert (= (and b!1401153 res!939661) b!1401150))

(assert (= (and b!1401150 res!939667) b!1401154))

(assert (= (and b!1401154 res!939666) b!1401148))

(assert (= (and b!1401148 res!939665) b!1401146))

(assert (= (and b!1401146 res!939659) b!1401151))

(assert (= (and b!1401146 (not res!939660)) b!1401155))

(assert (= (and b!1401155 (not res!939662)) b!1401152))

(assert (= (and b!1401152 res!939663) b!1401156))

(assert (= (and b!1401152 (not res!939658)) b!1401147))

(declare-fun m!1288833 () Bool)

(assert (=> b!1401156 m!1288833))

(declare-fun m!1288835 () Bool)

(assert (=> b!1401156 m!1288835))

(assert (=> b!1401156 m!1288835))

(declare-fun m!1288837 () Bool)

(assert (=> b!1401156 m!1288837))

(declare-fun m!1288839 () Bool)

(assert (=> b!1401154 m!1288839))

(declare-fun m!1288841 () Bool)

(assert (=> b!1401153 m!1288841))

(assert (=> b!1401153 m!1288841))

(declare-fun m!1288843 () Bool)

(assert (=> b!1401153 m!1288843))

(declare-fun m!1288845 () Bool)

(assert (=> b!1401152 m!1288845))

(declare-fun m!1288847 () Bool)

(assert (=> b!1401152 m!1288847))

(declare-fun m!1288849 () Bool)

(assert (=> b!1401152 m!1288849))

(declare-fun m!1288851 () Bool)

(assert (=> b!1401155 m!1288851))

(assert (=> b!1401155 m!1288851))

(declare-fun m!1288853 () Bool)

(assert (=> b!1401155 m!1288853))

(assert (=> b!1401155 m!1288845))

(declare-fun m!1288855 () Bool)

(assert (=> b!1401155 m!1288855))

(declare-fun m!1288857 () Bool)

(assert (=> b!1401148 m!1288857))

(assert (=> b!1401150 m!1288835))

(assert (=> b!1401150 m!1288835))

(declare-fun m!1288859 () Bool)

(assert (=> b!1401150 m!1288859))

(declare-fun m!1288861 () Bool)

(assert (=> b!1401147 m!1288861))

(assert (=> b!1401151 m!1288835))

(assert (=> b!1401151 m!1288835))

(declare-fun m!1288863 () Bool)

(assert (=> b!1401151 m!1288863))

(assert (=> b!1401146 m!1288835))

(declare-fun m!1288865 () Bool)

(assert (=> b!1401146 m!1288865))

(declare-fun m!1288867 () Bool)

(assert (=> b!1401146 m!1288867))

(declare-fun m!1288869 () Bool)

(assert (=> b!1401146 m!1288869))

(assert (=> b!1401146 m!1288835))

(assert (=> b!1401146 m!1288835))

(declare-fun m!1288871 () Bool)

(assert (=> b!1401146 m!1288871))

(declare-fun m!1288873 () Bool)

(assert (=> start!120372 m!1288873))

(declare-fun m!1288875 () Bool)

(assert (=> start!120372 m!1288875))

(push 1)

