; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120608 () Bool)

(assert start!120608)

(declare-fun b!1403078 () Bool)

(declare-fun e!794594 () Bool)

(declare-fun e!794593 () Bool)

(assert (=> b!1403078 (= e!794594 e!794593)))

(declare-fun res!940910 () Bool)

(assert (=> b!1403078 (=> res!940910 e!794593)))

(declare-datatypes ((SeekEntryResult!10538 0))(
  ( (MissingZero!10538 (index!44529 (_ BitVec 32))) (Found!10538 (index!44530 (_ BitVec 32))) (Intermediate!10538 (undefined!11350 Bool) (index!44531 (_ BitVec 32)) (x!126312 (_ BitVec 32))) (Undefined!10538) (MissingVacant!10538 (index!44532 (_ BitVec 32))) )
))
(declare-fun lt!617699 () SeekEntryResult!10538)

(declare-fun lt!617692 () SeekEntryResult!10538)

(get-info :version)

(assert (=> b!1403078 (= res!940910 (or (= lt!617699 lt!617692) (not ((_ is Intermediate!10538) lt!617692))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!617698 () (_ BitVec 64))

(declare-datatypes ((array!95939 0))(
  ( (array!95940 (arr!46318 (Array (_ BitVec 32) (_ BitVec 64))) (size!46869 (_ BitVec 32))) )
))
(declare-fun lt!617695 () array!95939)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95939 (_ BitVec 32)) SeekEntryResult!10538)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403078 (= lt!617692 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617698 mask!2840) lt!617698 lt!617695 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun a!2901 () array!95939)

(assert (=> b!1403078 (= lt!617698 (select (store (arr!46318 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1403078 (= lt!617695 (array!95940 (store (arr!46318 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46869 a!2901)))))

(declare-fun b!1403079 () Bool)

(declare-fun res!940907 () Bool)

(declare-fun e!794588 () Bool)

(assert (=> b!1403079 (=> (not res!940907) (not e!794588))))

(declare-datatypes ((List!32824 0))(
  ( (Nil!32821) (Cons!32820 (h!34076 (_ BitVec 64)) (t!47510 List!32824)) )
))
(declare-fun arrayNoDuplicates!0 (array!95939 (_ BitVec 32) List!32824) Bool)

(assert (=> b!1403079 (= res!940907 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32821))))

(declare-fun b!1403080 () Bool)

(declare-fun res!940906 () Bool)

(assert (=> b!1403080 (=> (not res!940906) (not e!794588))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403080 (= res!940906 (validKeyInArray!0 (select (arr!46318 a!2901) i!1037)))))

(declare-fun res!940911 () Bool)

(assert (=> start!120608 (=> (not res!940911) (not e!794588))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120608 (= res!940911 (validMask!0 mask!2840))))

(assert (=> start!120608 e!794588))

(assert (=> start!120608 true))

(declare-fun array_inv!35599 (array!95939) Bool)

(assert (=> start!120608 (array_inv!35599 a!2901)))

(declare-fun b!1403081 () Bool)

(declare-fun e!794589 () Bool)

(assert (=> b!1403081 (= e!794593 e!794589)))

(declare-fun res!940905 () Bool)

(assert (=> b!1403081 (=> res!940905 e!794589)))

(declare-fun lt!617697 () (_ BitVec 32))

(assert (=> b!1403081 (= res!940905 (or (bvslt (x!126312 lt!617699) #b00000000000000000000000000000000) (bvsgt (x!126312 lt!617699) #b01111111111111111111111111111110) (bvslt (x!126312 lt!617692) #b00000000000000000000000000000000) (bvsgt (x!126312 lt!617692) #b01111111111111111111111111111110) (bvslt lt!617697 #b00000000000000000000000000000000) (bvsge lt!617697 (size!46869 a!2901)) (bvslt (index!44531 lt!617699) #b00000000000000000000000000000000) (bvsge (index!44531 lt!617699) (size!46869 a!2901)) (bvslt (index!44531 lt!617692) #b00000000000000000000000000000000) (bvsge (index!44531 lt!617692) (size!46869 a!2901)) (not (= lt!617699 (Intermediate!10538 false (index!44531 lt!617699) (x!126312 lt!617699)))) (not (= lt!617692 (Intermediate!10538 false (index!44531 lt!617692) (x!126312 lt!617692))))))))

(declare-fun e!794592 () Bool)

(assert (=> b!1403081 e!794592))

(declare-fun res!940909 () Bool)

(assert (=> b!1403081 (=> (not res!940909) (not e!794592))))

(assert (=> b!1403081 (= res!940909 (and (not (undefined!11350 lt!617692)) (= (index!44531 lt!617692) i!1037) (bvslt (x!126312 lt!617692) (x!126312 lt!617699)) (= (select (store (arr!46318 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44531 lt!617692)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47107 0))(
  ( (Unit!47108) )
))
(declare-fun lt!617693 () Unit!47107)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95939 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47107)

(assert (=> b!1403081 (= lt!617693 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617697 (x!126312 lt!617699) (index!44531 lt!617699) (x!126312 lt!617692) (index!44531 lt!617692) (undefined!11350 lt!617692) mask!2840))))

(declare-fun b!1403082 () Bool)

(declare-fun e!794591 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95939 (_ BitVec 32)) SeekEntryResult!10538)

(assert (=> b!1403082 (= e!794591 (= (seekEntryOrOpen!0 (select (arr!46318 a!2901) j!112) a!2901 mask!2840) (Found!10538 j!112)))))

(declare-fun b!1403083 () Bool)

(assert (=> b!1403083 (= e!794589 true)))

(declare-fun lt!617694 () SeekEntryResult!10538)

(assert (=> b!1403083 (= lt!617694 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617697 lt!617698 lt!617695 mask!2840))))

(declare-fun b!1403084 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95939 (_ BitVec 32)) SeekEntryResult!10538)

(assert (=> b!1403084 (= e!794592 (= (seekEntryOrOpen!0 lt!617698 lt!617695 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126312 lt!617692) (index!44531 lt!617692) (index!44531 lt!617692) (select (arr!46318 a!2901) j!112) lt!617695 mask!2840)))))

(declare-fun b!1403085 () Bool)

(assert (=> b!1403085 (= e!794588 (not e!794594))))

(declare-fun res!940913 () Bool)

(assert (=> b!1403085 (=> res!940913 e!794594)))

(assert (=> b!1403085 (= res!940913 (or (not ((_ is Intermediate!10538) lt!617699)) (undefined!11350 lt!617699)))))

(assert (=> b!1403085 e!794591))

(declare-fun res!940912 () Bool)

(assert (=> b!1403085 (=> (not res!940912) (not e!794591))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95939 (_ BitVec 32)) Bool)

(assert (=> b!1403085 (= res!940912 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!617696 () Unit!47107)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95939 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47107)

(assert (=> b!1403085 (= lt!617696 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1403085 (= lt!617699 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617697 (select (arr!46318 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1403085 (= lt!617697 (toIndex!0 (select (arr!46318 a!2901) j!112) mask!2840))))

(declare-fun b!1403086 () Bool)

(declare-fun res!940914 () Bool)

(assert (=> b!1403086 (=> (not res!940914) (not e!794588))))

(assert (=> b!1403086 (= res!940914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403087 () Bool)

(declare-fun res!940915 () Bool)

(assert (=> b!1403087 (=> (not res!940915) (not e!794588))))

(assert (=> b!1403087 (= res!940915 (validKeyInArray!0 (select (arr!46318 a!2901) j!112)))))

(declare-fun b!1403088 () Bool)

(declare-fun res!940908 () Bool)

(assert (=> b!1403088 (=> (not res!940908) (not e!794588))))

(assert (=> b!1403088 (= res!940908 (and (= (size!46869 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46869 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46869 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120608 res!940911) b!1403088))

(assert (= (and b!1403088 res!940908) b!1403080))

(assert (= (and b!1403080 res!940906) b!1403087))

(assert (= (and b!1403087 res!940915) b!1403086))

(assert (= (and b!1403086 res!940914) b!1403079))

(assert (= (and b!1403079 res!940907) b!1403085))

(assert (= (and b!1403085 res!940912) b!1403082))

(assert (= (and b!1403085 (not res!940913)) b!1403078))

(assert (= (and b!1403078 (not res!940910)) b!1403081))

(assert (= (and b!1403081 res!940909) b!1403084))

(assert (= (and b!1403081 (not res!940905)) b!1403083))

(declare-fun m!1291261 () Bool)

(assert (=> b!1403087 m!1291261))

(assert (=> b!1403087 m!1291261))

(declare-fun m!1291263 () Bool)

(assert (=> b!1403087 m!1291263))

(assert (=> b!1403085 m!1291261))

(declare-fun m!1291265 () Bool)

(assert (=> b!1403085 m!1291265))

(assert (=> b!1403085 m!1291261))

(declare-fun m!1291267 () Bool)

(assert (=> b!1403085 m!1291267))

(assert (=> b!1403085 m!1291261))

(declare-fun m!1291269 () Bool)

(assert (=> b!1403085 m!1291269))

(declare-fun m!1291271 () Bool)

(assert (=> b!1403085 m!1291271))

(declare-fun m!1291273 () Bool)

(assert (=> b!1403084 m!1291273))

(assert (=> b!1403084 m!1291261))

(assert (=> b!1403084 m!1291261))

(declare-fun m!1291275 () Bool)

(assert (=> b!1403084 m!1291275))

(declare-fun m!1291277 () Bool)

(assert (=> b!1403079 m!1291277))

(declare-fun m!1291279 () Bool)

(assert (=> b!1403081 m!1291279))

(declare-fun m!1291281 () Bool)

(assert (=> b!1403081 m!1291281))

(declare-fun m!1291283 () Bool)

(assert (=> b!1403081 m!1291283))

(assert (=> b!1403082 m!1291261))

(assert (=> b!1403082 m!1291261))

(declare-fun m!1291285 () Bool)

(assert (=> b!1403082 m!1291285))

(declare-fun m!1291287 () Bool)

(assert (=> b!1403078 m!1291287))

(assert (=> b!1403078 m!1291287))

(declare-fun m!1291289 () Bool)

(assert (=> b!1403078 m!1291289))

(assert (=> b!1403078 m!1291279))

(declare-fun m!1291291 () Bool)

(assert (=> b!1403078 m!1291291))

(declare-fun m!1291293 () Bool)

(assert (=> b!1403080 m!1291293))

(assert (=> b!1403080 m!1291293))

(declare-fun m!1291295 () Bool)

(assert (=> b!1403080 m!1291295))

(declare-fun m!1291297 () Bool)

(assert (=> b!1403086 m!1291297))

(declare-fun m!1291299 () Bool)

(assert (=> start!120608 m!1291299))

(declare-fun m!1291301 () Bool)

(assert (=> start!120608 m!1291301))

(declare-fun m!1291303 () Bool)

(assert (=> b!1403083 m!1291303))

(check-sat (not b!1403083) (not b!1403084) (not start!120608) (not b!1403079) (not b!1403081) (not b!1403080) (not b!1403087) (not b!1403086) (not b!1403082) (not b!1403078) (not b!1403085))
(check-sat)
