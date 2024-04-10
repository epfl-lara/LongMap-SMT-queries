; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120382 () Bool)

(assert start!120382)

(declare-fun b!1401311 () Bool)

(declare-fun res!939825 () Bool)

(declare-fun e!793453 () Bool)

(assert (=> b!1401311 (=> (not res!939825) (not e!793453))))

(declare-datatypes ((array!95791 0))(
  ( (array!95792 (arr!46246 (Array (_ BitVec 32) (_ BitVec 64))) (size!46796 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95791)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95791 (_ BitVec 32)) Bool)

(assert (=> b!1401311 (= res!939825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401312 () Bool)

(declare-fun e!793457 () Bool)

(declare-fun e!793455 () Bool)

(assert (=> b!1401312 (= e!793457 e!793455)))

(declare-fun res!939828 () Bool)

(assert (=> b!1401312 (=> res!939828 e!793455)))

(declare-datatypes ((SeekEntryResult!10563 0))(
  ( (MissingZero!10563 (index!44629 (_ BitVec 32))) (Found!10563 (index!44630 (_ BitVec 32))) (Intermediate!10563 (undefined!11375 Bool) (index!44631 (_ BitVec 32)) (x!126262 (_ BitVec 32))) (Undefined!10563) (MissingVacant!10563 (index!44632 (_ BitVec 32))) )
))
(declare-fun lt!616838 () SeekEntryResult!10563)

(declare-fun lt!616845 () SeekEntryResult!10563)

(assert (=> b!1401312 (= res!939828 (or (= lt!616838 lt!616845) (not (is-Intermediate!10563 lt!616845))))))

(declare-fun lt!616842 () (_ BitVec 64))

(declare-fun lt!616844 () array!95791)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95791 (_ BitVec 32)) SeekEntryResult!10563)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401312 (= lt!616845 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616842 mask!2840) lt!616842 lt!616844 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1401312 (= lt!616842 (select (store (arr!46246 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401312 (= lt!616844 (array!95792 (store (arr!46246 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46796 a!2901)))))

(declare-fun b!1401313 () Bool)

(declare-fun e!793451 () Bool)

(assert (=> b!1401313 (= e!793455 e!793451)))

(declare-fun res!939822 () Bool)

(assert (=> b!1401313 (=> res!939822 e!793451)))

(declare-fun lt!616840 () (_ BitVec 32))

(assert (=> b!1401313 (= res!939822 (or (bvslt (x!126262 lt!616838) #b00000000000000000000000000000000) (bvsgt (x!126262 lt!616838) #b01111111111111111111111111111110) (bvslt (x!126262 lt!616845) #b00000000000000000000000000000000) (bvsgt (x!126262 lt!616845) #b01111111111111111111111111111110) (bvslt lt!616840 #b00000000000000000000000000000000) (bvsge lt!616840 (size!46796 a!2901)) (bvslt (index!44631 lt!616838) #b00000000000000000000000000000000) (bvsge (index!44631 lt!616838) (size!46796 a!2901)) (bvslt (index!44631 lt!616845) #b00000000000000000000000000000000) (bvsge (index!44631 lt!616845) (size!46796 a!2901)) (not (= lt!616838 (Intermediate!10563 false (index!44631 lt!616838) (x!126262 lt!616838)))) (not (= lt!616845 (Intermediate!10563 false (index!44631 lt!616845) (x!126262 lt!616845))))))))

(declare-fun e!793452 () Bool)

(assert (=> b!1401313 e!793452))

(declare-fun res!939830 () Bool)

(assert (=> b!1401313 (=> (not res!939830) (not e!793452))))

(assert (=> b!1401313 (= res!939830 (and (not (undefined!11375 lt!616845)) (= (index!44631 lt!616845) i!1037) (bvslt (x!126262 lt!616845) (x!126262 lt!616838)) (= (select (store (arr!46246 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44631 lt!616845)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47130 0))(
  ( (Unit!47131) )
))
(declare-fun lt!616843 () Unit!47130)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95791 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47130)

(assert (=> b!1401313 (= lt!616843 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616840 (x!126262 lt!616838) (index!44631 lt!616838) (x!126262 lt!616845) (index!44631 lt!616845) (undefined!11375 lt!616845) mask!2840))))

(declare-fun res!939832 () Bool)

(assert (=> start!120382 (=> (not res!939832) (not e!793453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120382 (= res!939832 (validMask!0 mask!2840))))

(assert (=> start!120382 e!793453))

(assert (=> start!120382 true))

(declare-fun array_inv!35274 (array!95791) Bool)

(assert (=> start!120382 (array_inv!35274 a!2901)))

(declare-fun b!1401314 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95791 (_ BitVec 32)) SeekEntryResult!10563)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95791 (_ BitVec 32)) SeekEntryResult!10563)

(assert (=> b!1401314 (= e!793452 (= (seekEntryOrOpen!0 lt!616842 lt!616844 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126262 lt!616845) (index!44631 lt!616845) (index!44631 lt!616845) (select (arr!46246 a!2901) j!112) lt!616844 mask!2840)))))

(declare-fun b!1401315 () Bool)

(declare-fun res!939827 () Bool)

(assert (=> b!1401315 (=> (not res!939827) (not e!793453))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401315 (= res!939827 (validKeyInArray!0 (select (arr!46246 a!2901) j!112)))))

(declare-fun b!1401316 () Bool)

(declare-fun res!939826 () Bool)

(assert (=> b!1401316 (=> (not res!939826) (not e!793453))))

(assert (=> b!1401316 (= res!939826 (validKeyInArray!0 (select (arr!46246 a!2901) i!1037)))))

(declare-fun b!1401317 () Bool)

(declare-fun res!939829 () Bool)

(assert (=> b!1401317 (=> (not res!939829) (not e!793453))))

(assert (=> b!1401317 (= res!939829 (and (= (size!46796 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46796 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46796 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401318 () Bool)

(declare-fun e!793454 () Bool)

(assert (=> b!1401318 (= e!793454 (= (seekEntryOrOpen!0 (select (arr!46246 a!2901) j!112) a!2901 mask!2840) (Found!10563 j!112)))))

(declare-fun b!1401319 () Bool)

(declare-fun res!939823 () Bool)

(assert (=> b!1401319 (=> (not res!939823) (not e!793453))))

(declare-datatypes ((List!32765 0))(
  ( (Nil!32762) (Cons!32761 (h!34009 (_ BitVec 64)) (t!47459 List!32765)) )
))
(declare-fun arrayNoDuplicates!0 (array!95791 (_ BitVec 32) List!32765) Bool)

(assert (=> b!1401319 (= res!939823 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32762))))

(declare-fun b!1401320 () Bool)

(assert (=> b!1401320 (= e!793451 true)))

(declare-fun lt!616839 () SeekEntryResult!10563)

(assert (=> b!1401320 (= lt!616839 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616840 lt!616842 lt!616844 mask!2840))))

(declare-fun b!1401321 () Bool)

(assert (=> b!1401321 (= e!793453 (not e!793457))))

(declare-fun res!939824 () Bool)

(assert (=> b!1401321 (=> res!939824 e!793457)))

(assert (=> b!1401321 (= res!939824 (or (not (is-Intermediate!10563 lt!616838)) (undefined!11375 lt!616838)))))

(assert (=> b!1401321 e!793454))

(declare-fun res!939831 () Bool)

(assert (=> b!1401321 (=> (not res!939831) (not e!793454))))

(assert (=> b!1401321 (= res!939831 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!616841 () Unit!47130)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95791 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47130)

(assert (=> b!1401321 (= lt!616841 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1401321 (= lt!616838 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616840 (select (arr!46246 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1401321 (= lt!616840 (toIndex!0 (select (arr!46246 a!2901) j!112) mask!2840))))

(assert (= (and start!120382 res!939832) b!1401317))

(assert (= (and b!1401317 res!939829) b!1401316))

(assert (= (and b!1401316 res!939826) b!1401315))

(assert (= (and b!1401315 res!939827) b!1401311))

(assert (= (and b!1401311 res!939825) b!1401319))

(assert (= (and b!1401319 res!939823) b!1401321))

(assert (= (and b!1401321 res!939831) b!1401318))

(assert (= (and b!1401321 (not res!939824)) b!1401312))

(assert (= (and b!1401312 (not res!939828)) b!1401313))

(assert (= (and b!1401313 res!939830) b!1401314))

(assert (= (and b!1401313 (not res!939822)) b!1401320))

(declare-fun m!1289053 () Bool)

(assert (=> b!1401312 m!1289053))

(assert (=> b!1401312 m!1289053))

(declare-fun m!1289055 () Bool)

(assert (=> b!1401312 m!1289055))

(declare-fun m!1289057 () Bool)

(assert (=> b!1401312 m!1289057))

(declare-fun m!1289059 () Bool)

(assert (=> b!1401312 m!1289059))

(declare-fun m!1289061 () Bool)

(assert (=> b!1401320 m!1289061))

(declare-fun m!1289063 () Bool)

(assert (=> b!1401319 m!1289063))

(declare-fun m!1289065 () Bool)

(assert (=> start!120382 m!1289065))

(declare-fun m!1289067 () Bool)

(assert (=> start!120382 m!1289067))

(declare-fun m!1289069 () Bool)

(assert (=> b!1401321 m!1289069))

(declare-fun m!1289071 () Bool)

(assert (=> b!1401321 m!1289071))

(declare-fun m!1289073 () Bool)

(assert (=> b!1401321 m!1289073))

(assert (=> b!1401321 m!1289069))

(declare-fun m!1289075 () Bool)

(assert (=> b!1401321 m!1289075))

(assert (=> b!1401321 m!1289069))

(declare-fun m!1289077 () Bool)

(assert (=> b!1401321 m!1289077))

(declare-fun m!1289079 () Bool)

(assert (=> b!1401314 m!1289079))

(assert (=> b!1401314 m!1289069))

(assert (=> b!1401314 m!1289069))

(declare-fun m!1289081 () Bool)

(assert (=> b!1401314 m!1289081))

(assert (=> b!1401315 m!1289069))

(assert (=> b!1401315 m!1289069))

(declare-fun m!1289083 () Bool)

(assert (=> b!1401315 m!1289083))

(assert (=> b!1401318 m!1289069))

(assert (=> b!1401318 m!1289069))

(declare-fun m!1289085 () Bool)

(assert (=> b!1401318 m!1289085))

(assert (=> b!1401313 m!1289057))

(declare-fun m!1289087 () Bool)

(assert (=> b!1401313 m!1289087))

(declare-fun m!1289089 () Bool)

(assert (=> b!1401313 m!1289089))

(declare-fun m!1289091 () Bool)

(assert (=> b!1401316 m!1289091))

(assert (=> b!1401316 m!1289091))

(declare-fun m!1289093 () Bool)

(assert (=> b!1401316 m!1289093))

(declare-fun m!1289095 () Bool)

(assert (=> b!1401311 m!1289095))

(push 1)

