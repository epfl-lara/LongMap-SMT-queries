; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120476 () Bool)

(assert start!120476)

(declare-fun b!1402784 () Bool)

(declare-fun res!941354 () Bool)

(declare-fun e!794314 () Bool)

(assert (=> b!1402784 (=> (not res!941354) (not e!794314))))

(declare-datatypes ((array!95838 0))(
  ( (array!95839 (arr!46270 (Array (_ BitVec 32) (_ BitVec 64))) (size!46822 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95838)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402784 (= res!941354 (validKeyInArray!0 (select (arr!46270 a!2901) i!1037)))))

(declare-fun b!1402785 () Bool)

(declare-fun e!794318 () Bool)

(assert (=> b!1402785 (= e!794314 (not e!794318))))

(declare-fun res!941352 () Bool)

(assert (=> b!1402785 (=> res!941352 e!794318)))

(declare-datatypes ((SeekEntryResult!10613 0))(
  ( (MissingZero!10613 (index!44829 (_ BitVec 32))) (Found!10613 (index!44830 (_ BitVec 32))) (Intermediate!10613 (undefined!11425 Bool) (index!44831 (_ BitVec 32)) (x!126445 (_ BitVec 32))) (Undefined!10613) (MissingVacant!10613 (index!44832 (_ BitVec 32))) )
))
(declare-fun lt!617960 () SeekEntryResult!10613)

(get-info :version)

(assert (=> b!1402785 (= res!941352 (or (not ((_ is Intermediate!10613) lt!617960)) (undefined!11425 lt!617960)))))

(declare-fun lt!617956 () SeekEntryResult!10613)

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1402785 (= lt!617956 (Found!10613 j!112))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95838 (_ BitVec 32)) SeekEntryResult!10613)

(assert (=> b!1402785 (= lt!617956 (seekEntryOrOpen!0 (select (arr!46270 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95838 (_ BitVec 32)) Bool)

(assert (=> b!1402785 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47073 0))(
  ( (Unit!47074) )
))
(declare-fun lt!617954 () Unit!47073)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95838 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47073)

(assert (=> b!1402785 (= lt!617954 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!617955 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95838 (_ BitVec 32)) SeekEntryResult!10613)

(assert (=> b!1402785 (= lt!617960 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617955 (select (arr!46270 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402785 (= lt!617955 (toIndex!0 (select (arr!46270 a!2901) j!112) mask!2840))))

(declare-fun b!1402786 () Bool)

(declare-fun res!941348 () Bool)

(assert (=> b!1402786 (=> (not res!941348) (not e!794314))))

(assert (=> b!1402786 (= res!941348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402787 () Bool)

(declare-fun e!794315 () Bool)

(assert (=> b!1402787 (= e!794318 e!794315)))

(declare-fun res!941349 () Bool)

(assert (=> b!1402787 (=> res!941349 e!794315)))

(declare-fun lt!617957 () SeekEntryResult!10613)

(assert (=> b!1402787 (= res!941349 (or (= lt!617960 lt!617957) (not ((_ is Intermediate!10613) lt!617957))))))

(declare-fun lt!617963 () array!95838)

(declare-fun lt!617962 () (_ BitVec 64))

(assert (=> b!1402787 (= lt!617957 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617962 mask!2840) lt!617962 lt!617963 mask!2840))))

(assert (=> b!1402787 (= lt!617962 (select (store (arr!46270 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402787 (= lt!617963 (array!95839 (store (arr!46270 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46822 a!2901)))))

(declare-fun b!1402788 () Bool)

(declare-fun res!941350 () Bool)

(assert (=> b!1402788 (=> (not res!941350) (not e!794314))))

(assert (=> b!1402788 (= res!941350 (and (= (size!46822 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46822 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46822 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402789 () Bool)

(declare-fun e!794313 () Bool)

(assert (=> b!1402789 (= e!794313 (validKeyInArray!0 lt!617962))))

(declare-fun b!1402790 () Bool)

(declare-fun res!941353 () Bool)

(assert (=> b!1402790 (=> (not res!941353) (not e!794314))))

(assert (=> b!1402790 (= res!941353 (validKeyInArray!0 (select (arr!46270 a!2901) j!112)))))

(declare-fun res!941356 () Bool)

(assert (=> start!120476 (=> (not res!941356) (not e!794314))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120476 (= res!941356 (validMask!0 mask!2840))))

(assert (=> start!120476 e!794314))

(assert (=> start!120476 true))

(declare-fun array_inv!35503 (array!95838) Bool)

(assert (=> start!120476 (array_inv!35503 a!2901)))

(declare-fun b!1402791 () Bool)

(declare-fun res!941346 () Bool)

(assert (=> b!1402791 (=> (not res!941346) (not e!794314))))

(declare-datatypes ((List!32867 0))(
  ( (Nil!32864) (Cons!32863 (h!34111 (_ BitVec 64)) (t!47553 List!32867)) )
))
(declare-fun arrayNoDuplicates!0 (array!95838 (_ BitVec 32) List!32867) Bool)

(assert (=> b!1402791 (= res!941346 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32864))))

(declare-fun b!1402792 () Bool)

(declare-fun res!941355 () Bool)

(declare-fun e!794316 () Bool)

(assert (=> b!1402792 (=> res!941355 e!794316)))

(assert (=> b!1402792 (= res!941355 (not (= lt!617957 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617955 lt!617962 lt!617963 mask!2840))))))

(declare-fun b!1402793 () Bool)

(assert (=> b!1402793 (= e!794316 e!794313)))

(declare-fun res!941347 () Bool)

(assert (=> b!1402793 (=> res!941347 e!794313)))

(assert (=> b!1402793 (= res!941347 (bvslt mask!2840 #b00000000000000000000000000000000))))

(declare-fun lt!617958 () SeekEntryResult!10613)

(assert (=> b!1402793 (= lt!617956 lt!617958)))

(declare-fun lt!617961 () Unit!47073)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95838 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47073)

(assert (=> b!1402793 (= lt!617961 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617955 (x!126445 lt!617960) (index!44831 lt!617960) (x!126445 lt!617957) (index!44831 lt!617957) mask!2840))))

(declare-fun b!1402794 () Bool)

(assert (=> b!1402794 (= e!794315 e!794316)))

(declare-fun res!941351 () Bool)

(assert (=> b!1402794 (=> res!941351 e!794316)))

(assert (=> b!1402794 (= res!941351 (or (bvslt (x!126445 lt!617960) #b00000000000000000000000000000000) (bvsgt (x!126445 lt!617960) #b01111111111111111111111111111110) (bvslt (x!126445 lt!617957) #b00000000000000000000000000000000) (bvsgt (x!126445 lt!617957) #b01111111111111111111111111111110) (bvslt lt!617955 #b00000000000000000000000000000000) (bvsge lt!617955 (size!46822 a!2901)) (bvslt (index!44831 lt!617960) #b00000000000000000000000000000000) (bvsge (index!44831 lt!617960) (size!46822 a!2901)) (bvslt (index!44831 lt!617957) #b00000000000000000000000000000000) (bvsge (index!44831 lt!617957) (size!46822 a!2901)) (not (= lt!617960 (Intermediate!10613 false (index!44831 lt!617960) (x!126445 lt!617960)))) (not (= lt!617957 (Intermediate!10613 false (index!44831 lt!617957) (x!126445 lt!617957))))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95838 (_ BitVec 32)) SeekEntryResult!10613)

(assert (=> b!1402794 (= lt!617958 (seekKeyOrZeroReturnVacant!0 (x!126445 lt!617957) (index!44831 lt!617957) (index!44831 lt!617957) (select (arr!46270 a!2901) j!112) lt!617963 mask!2840))))

(assert (=> b!1402794 (= lt!617958 (seekEntryOrOpen!0 lt!617962 lt!617963 mask!2840))))

(assert (=> b!1402794 (and (not (undefined!11425 lt!617957)) (= (index!44831 lt!617957) i!1037) (bvslt (x!126445 lt!617957) (x!126445 lt!617960)) (= (select (store (arr!46270 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44831 lt!617957)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!617959 () Unit!47073)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95838 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47073)

(assert (=> b!1402794 (= lt!617959 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617955 (x!126445 lt!617960) (index!44831 lt!617960) (x!126445 lt!617957) (index!44831 lt!617957) (undefined!11425 lt!617957) mask!2840))))

(assert (= (and start!120476 res!941356) b!1402788))

(assert (= (and b!1402788 res!941350) b!1402784))

(assert (= (and b!1402784 res!941354) b!1402790))

(assert (= (and b!1402790 res!941353) b!1402786))

(assert (= (and b!1402786 res!941348) b!1402791))

(assert (= (and b!1402791 res!941346) b!1402785))

(assert (= (and b!1402785 (not res!941352)) b!1402787))

(assert (= (and b!1402787 (not res!941349)) b!1402794))

(assert (= (and b!1402794 (not res!941351)) b!1402792))

(assert (= (and b!1402792 (not res!941355)) b!1402793))

(assert (= (and b!1402793 (not res!941347)) b!1402789))

(declare-fun m!1290715 () Bool)

(assert (=> b!1402791 m!1290715))

(declare-fun m!1290717 () Bool)

(assert (=> b!1402786 m!1290717))

(declare-fun m!1290719 () Bool)

(assert (=> b!1402789 m!1290719))

(declare-fun m!1290721 () Bool)

(assert (=> b!1402790 m!1290721))

(assert (=> b!1402790 m!1290721))

(declare-fun m!1290723 () Bool)

(assert (=> b!1402790 m!1290723))

(declare-fun m!1290725 () Bool)

(assert (=> b!1402787 m!1290725))

(assert (=> b!1402787 m!1290725))

(declare-fun m!1290727 () Bool)

(assert (=> b!1402787 m!1290727))

(declare-fun m!1290729 () Bool)

(assert (=> b!1402787 m!1290729))

(declare-fun m!1290731 () Bool)

(assert (=> b!1402787 m!1290731))

(assert (=> b!1402785 m!1290721))

(declare-fun m!1290733 () Bool)

(assert (=> b!1402785 m!1290733))

(assert (=> b!1402785 m!1290721))

(declare-fun m!1290735 () Bool)

(assert (=> b!1402785 m!1290735))

(declare-fun m!1290737 () Bool)

(assert (=> b!1402785 m!1290737))

(assert (=> b!1402785 m!1290721))

(declare-fun m!1290739 () Bool)

(assert (=> b!1402785 m!1290739))

(assert (=> b!1402785 m!1290721))

(declare-fun m!1290741 () Bool)

(assert (=> b!1402785 m!1290741))

(declare-fun m!1290743 () Bool)

(assert (=> b!1402792 m!1290743))

(declare-fun m!1290745 () Bool)

(assert (=> b!1402794 m!1290745))

(assert (=> b!1402794 m!1290721))

(declare-fun m!1290747 () Bool)

(assert (=> b!1402794 m!1290747))

(declare-fun m!1290749 () Bool)

(assert (=> b!1402794 m!1290749))

(assert (=> b!1402794 m!1290729))

(assert (=> b!1402794 m!1290721))

(declare-fun m!1290751 () Bool)

(assert (=> b!1402794 m!1290751))

(declare-fun m!1290753 () Bool)

(assert (=> b!1402784 m!1290753))

(assert (=> b!1402784 m!1290753))

(declare-fun m!1290755 () Bool)

(assert (=> b!1402784 m!1290755))

(declare-fun m!1290757 () Bool)

(assert (=> start!120476 m!1290757))

(declare-fun m!1290759 () Bool)

(assert (=> start!120476 m!1290759))

(declare-fun m!1290761 () Bool)

(assert (=> b!1402793 m!1290761))

(check-sat (not b!1402785) (not b!1402792) (not b!1402791) (not start!120476) (not b!1402790) (not b!1402789) (not b!1402784) (not b!1402786) (not b!1402794) (not b!1402787) (not b!1402793))
(check-sat)
