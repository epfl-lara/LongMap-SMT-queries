; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120356 () Bool)

(assert start!120356)

(declare-fun b!1400867 () Bool)

(declare-fun e!793187 () Bool)

(declare-fun e!793185 () Bool)

(assert (=> b!1400867 (= e!793187 (not e!793185))))

(declare-fun res!939438 () Bool)

(assert (=> b!1400867 (=> res!939438 e!793185)))

(declare-datatypes ((SeekEntryResult!10553 0))(
  ( (MissingZero!10553 (index!44589 (_ BitVec 32))) (Found!10553 (index!44590 (_ BitVec 32))) (Intermediate!10553 (undefined!11365 Bool) (index!44591 (_ BitVec 32)) (x!126225 (_ BitVec 32))) (Undefined!10553) (MissingVacant!10553 (index!44592 (_ BitVec 32))) )
))
(declare-fun lt!616389 () SeekEntryResult!10553)

(get-info :version)

(assert (=> b!1400867 (= res!939438 (or (not ((_ is Intermediate!10553) lt!616389)) (undefined!11365 lt!616389)))))

(declare-fun e!793182 () Bool)

(assert (=> b!1400867 e!793182))

(declare-fun res!939439 () Bool)

(assert (=> b!1400867 (=> (not res!939439) (not e!793182))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95718 0))(
  ( (array!95719 (arr!46210 (Array (_ BitVec 32) (_ BitVec 64))) (size!46762 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95718)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95718 (_ BitVec 32)) Bool)

(assert (=> b!1400867 (= res!939439 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46953 0))(
  ( (Unit!46954) )
))
(declare-fun lt!616386 () Unit!46953)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95718 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46953)

(assert (=> b!1400867 (= lt!616386 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!616390 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95718 (_ BitVec 32)) SeekEntryResult!10553)

(assert (=> b!1400867 (= lt!616389 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616390 (select (arr!46210 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400867 (= lt!616390 (toIndex!0 (select (arr!46210 a!2901) j!112) mask!2840))))

(declare-fun b!1400868 () Bool)

(declare-fun e!793183 () Bool)

(declare-fun e!793186 () Bool)

(assert (=> b!1400868 (= e!793183 e!793186)))

(declare-fun res!939431 () Bool)

(assert (=> b!1400868 (=> res!939431 e!793186)))

(declare-fun lt!616387 () SeekEntryResult!10553)

(assert (=> b!1400868 (= res!939431 (or (bvslt (x!126225 lt!616389) #b00000000000000000000000000000000) (bvsgt (x!126225 lt!616389) #b01111111111111111111111111111110) (bvslt (x!126225 lt!616387) #b00000000000000000000000000000000) (bvsgt (x!126225 lt!616387) #b01111111111111111111111111111110) (bvslt lt!616390 #b00000000000000000000000000000000) (bvsge lt!616390 (size!46762 a!2901)) (bvslt (index!44591 lt!616389) #b00000000000000000000000000000000) (bvsge (index!44591 lt!616389) (size!46762 a!2901)) (bvslt (index!44591 lt!616387) #b00000000000000000000000000000000) (bvsge (index!44591 lt!616387) (size!46762 a!2901)) (not (= lt!616389 (Intermediate!10553 false (index!44591 lt!616389) (x!126225 lt!616389)))) (not (= lt!616387 (Intermediate!10553 false (index!44591 lt!616387) (x!126225 lt!616387))))))))

(declare-fun e!793181 () Bool)

(assert (=> b!1400868 e!793181))

(declare-fun res!939429 () Bool)

(assert (=> b!1400868 (=> (not res!939429) (not e!793181))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1400868 (= res!939429 (and (not (undefined!11365 lt!616387)) (= (index!44591 lt!616387) i!1037) (bvslt (x!126225 lt!616387) (x!126225 lt!616389)) (= (select (store (arr!46210 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44591 lt!616387)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616391 () Unit!46953)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95718 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46953)

(assert (=> b!1400868 (= lt!616391 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616390 (x!126225 lt!616389) (index!44591 lt!616389) (x!126225 lt!616387) (index!44591 lt!616387) (undefined!11365 lt!616387) mask!2840))))

(declare-fun b!1400869 () Bool)

(assert (=> b!1400869 (= e!793185 e!793183)))

(declare-fun res!939433 () Bool)

(assert (=> b!1400869 (=> res!939433 e!793183)))

(assert (=> b!1400869 (= res!939433 (or (= lt!616389 lt!616387) (not ((_ is Intermediate!10553) lt!616387))))))

(declare-fun lt!616388 () (_ BitVec 64))

(declare-fun lt!616384 () array!95718)

(assert (=> b!1400869 (= lt!616387 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616388 mask!2840) lt!616388 lt!616384 mask!2840))))

(assert (=> b!1400869 (= lt!616388 (select (store (arr!46210 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400869 (= lt!616384 (array!95719 (store (arr!46210 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46762 a!2901)))))

(declare-fun b!1400870 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95718 (_ BitVec 32)) SeekEntryResult!10553)

(assert (=> b!1400870 (= e!793182 (= (seekEntryOrOpen!0 (select (arr!46210 a!2901) j!112) a!2901 mask!2840) (Found!10553 j!112)))))

(declare-fun b!1400871 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95718 (_ BitVec 32)) SeekEntryResult!10553)

(assert (=> b!1400871 (= e!793181 (= (seekEntryOrOpen!0 lt!616388 lt!616384 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126225 lt!616387) (index!44591 lt!616387) (index!44591 lt!616387) (select (arr!46210 a!2901) j!112) lt!616384 mask!2840)))))

(declare-fun res!939432 () Bool)

(assert (=> start!120356 (=> (not res!939432) (not e!793187))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120356 (= res!939432 (validMask!0 mask!2840))))

(assert (=> start!120356 e!793187))

(assert (=> start!120356 true))

(declare-fun array_inv!35443 (array!95718) Bool)

(assert (=> start!120356 (array_inv!35443 a!2901)))

(declare-fun b!1400872 () Bool)

(declare-fun res!939435 () Bool)

(assert (=> b!1400872 (=> (not res!939435) (not e!793187))))

(declare-datatypes ((List!32807 0))(
  ( (Nil!32804) (Cons!32803 (h!34051 (_ BitVec 64)) (t!47493 List!32807)) )
))
(declare-fun arrayNoDuplicates!0 (array!95718 (_ BitVec 32) List!32807) Bool)

(assert (=> b!1400872 (= res!939435 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32804))))

(declare-fun b!1400873 () Bool)

(assert (=> b!1400873 (= e!793186 true)))

(declare-fun lt!616385 () SeekEntryResult!10553)

(assert (=> b!1400873 (= lt!616385 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616390 lt!616388 lt!616384 mask!2840))))

(declare-fun b!1400874 () Bool)

(declare-fun res!939437 () Bool)

(assert (=> b!1400874 (=> (not res!939437) (not e!793187))))

(assert (=> b!1400874 (= res!939437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400875 () Bool)

(declare-fun res!939436 () Bool)

(assert (=> b!1400875 (=> (not res!939436) (not e!793187))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400875 (= res!939436 (validKeyInArray!0 (select (arr!46210 a!2901) j!112)))))

(declare-fun b!1400876 () Bool)

(declare-fun res!939430 () Bool)

(assert (=> b!1400876 (=> (not res!939430) (not e!793187))))

(assert (=> b!1400876 (= res!939430 (validKeyInArray!0 (select (arr!46210 a!2901) i!1037)))))

(declare-fun b!1400877 () Bool)

(declare-fun res!939434 () Bool)

(assert (=> b!1400877 (=> (not res!939434) (not e!793187))))

(assert (=> b!1400877 (= res!939434 (and (= (size!46762 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46762 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46762 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120356 res!939432) b!1400877))

(assert (= (and b!1400877 res!939434) b!1400876))

(assert (= (and b!1400876 res!939430) b!1400875))

(assert (= (and b!1400875 res!939436) b!1400874))

(assert (= (and b!1400874 res!939437) b!1400872))

(assert (= (and b!1400872 res!939435) b!1400867))

(assert (= (and b!1400867 res!939439) b!1400870))

(assert (= (and b!1400867 (not res!939438)) b!1400869))

(assert (= (and b!1400869 (not res!939433)) b!1400868))

(assert (= (and b!1400868 res!939429) b!1400871))

(assert (= (and b!1400868 (not res!939431)) b!1400873))

(declare-fun m!1288033 () Bool)

(assert (=> b!1400874 m!1288033))

(declare-fun m!1288035 () Bool)

(assert (=> b!1400867 m!1288035))

(declare-fun m!1288037 () Bool)

(assert (=> b!1400867 m!1288037))

(assert (=> b!1400867 m!1288035))

(assert (=> b!1400867 m!1288035))

(declare-fun m!1288039 () Bool)

(assert (=> b!1400867 m!1288039))

(declare-fun m!1288041 () Bool)

(assert (=> b!1400867 m!1288041))

(declare-fun m!1288043 () Bool)

(assert (=> b!1400867 m!1288043))

(declare-fun m!1288045 () Bool)

(assert (=> b!1400876 m!1288045))

(assert (=> b!1400876 m!1288045))

(declare-fun m!1288047 () Bool)

(assert (=> b!1400876 m!1288047))

(declare-fun m!1288049 () Bool)

(assert (=> b!1400872 m!1288049))

(declare-fun m!1288051 () Bool)

(assert (=> b!1400871 m!1288051))

(assert (=> b!1400871 m!1288035))

(assert (=> b!1400871 m!1288035))

(declare-fun m!1288053 () Bool)

(assert (=> b!1400871 m!1288053))

(declare-fun m!1288055 () Bool)

(assert (=> b!1400868 m!1288055))

(declare-fun m!1288057 () Bool)

(assert (=> b!1400868 m!1288057))

(declare-fun m!1288059 () Bool)

(assert (=> b!1400868 m!1288059))

(assert (=> b!1400875 m!1288035))

(assert (=> b!1400875 m!1288035))

(declare-fun m!1288061 () Bool)

(assert (=> b!1400875 m!1288061))

(declare-fun m!1288063 () Bool)

(assert (=> b!1400873 m!1288063))

(declare-fun m!1288065 () Bool)

(assert (=> start!120356 m!1288065))

(declare-fun m!1288067 () Bool)

(assert (=> start!120356 m!1288067))

(assert (=> b!1400870 m!1288035))

(assert (=> b!1400870 m!1288035))

(declare-fun m!1288069 () Bool)

(assert (=> b!1400870 m!1288069))

(declare-fun m!1288071 () Bool)

(assert (=> b!1400869 m!1288071))

(assert (=> b!1400869 m!1288071))

(declare-fun m!1288073 () Bool)

(assert (=> b!1400869 m!1288073))

(assert (=> b!1400869 m!1288055))

(declare-fun m!1288075 () Bool)

(assert (=> b!1400869 m!1288075))

(check-sat (not b!1400873) (not b!1400870) (not b!1400869) (not b!1400867) (not b!1400868) (not b!1400872) (not b!1400876) (not b!1400871) (not start!120356) (not b!1400875) (not b!1400874))
(check-sat)
