; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120398 () Bool)

(assert start!120398)

(declare-fun b!1401561 () Bool)

(declare-fun res!940123 () Bool)

(declare-fun e!793628 () Bool)

(assert (=> b!1401561 (=> (not res!940123) (not e!793628))))

(declare-datatypes ((array!95760 0))(
  ( (array!95761 (arr!46231 (Array (_ BitVec 32) (_ BitVec 64))) (size!46783 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95760)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95760 (_ BitVec 32)) Bool)

(assert (=> b!1401561 (= res!940123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401562 () Bool)

(declare-fun e!793622 () Bool)

(declare-fun e!793623 () Bool)

(assert (=> b!1401562 (= e!793622 e!793623)))

(declare-fun res!940126 () Bool)

(assert (=> b!1401562 (=> res!940126 e!793623)))

(declare-datatypes ((SeekEntryResult!10574 0))(
  ( (MissingZero!10574 (index!44673 (_ BitVec 32))) (Found!10574 (index!44674 (_ BitVec 32))) (Intermediate!10574 (undefined!11386 Bool) (index!44675 (_ BitVec 32)) (x!126302 (_ BitVec 32))) (Undefined!10574) (MissingVacant!10574 (index!44676 (_ BitVec 32))) )
))
(declare-fun lt!616888 () SeekEntryResult!10574)

(declare-fun lt!616894 () SeekEntryResult!10574)

(get-info :version)

(assert (=> b!1401562 (= res!940126 (or (= lt!616888 lt!616894) (not ((_ is Intermediate!10574) lt!616894))))))

(declare-fun lt!616889 () (_ BitVec 64))

(declare-fun lt!616890 () array!95760)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95760 (_ BitVec 32)) SeekEntryResult!10574)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401562 (= lt!616894 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616889 mask!2840) lt!616889 lt!616890 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1401562 (= lt!616889 (select (store (arr!46231 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401562 (= lt!616890 (array!95761 (store (arr!46231 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46783 a!2901)))))

(declare-fun b!1401563 () Bool)

(declare-fun res!940124 () Bool)

(assert (=> b!1401563 (=> (not res!940124) (not e!793628))))

(declare-datatypes ((List!32828 0))(
  ( (Nil!32825) (Cons!32824 (h!34072 (_ BitVec 64)) (t!47514 List!32828)) )
))
(declare-fun arrayNoDuplicates!0 (array!95760 (_ BitVec 32) List!32828) Bool)

(assert (=> b!1401563 (= res!940124 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32825))))

(declare-fun b!1401564 () Bool)

(declare-fun e!793626 () Bool)

(assert (=> b!1401564 (= e!793626 true)))

(declare-fun lt!616891 () (_ BitVec 32))

(declare-fun lt!616893 () SeekEntryResult!10574)

(assert (=> b!1401564 (= lt!616893 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616891 lt!616889 lt!616890 mask!2840))))

(declare-fun b!1401565 () Bool)

(assert (=> b!1401565 (= e!793623 e!793626)))

(declare-fun res!940128 () Bool)

(assert (=> b!1401565 (=> res!940128 e!793626)))

(assert (=> b!1401565 (= res!940128 (or (bvslt (x!126302 lt!616888) #b00000000000000000000000000000000) (bvsgt (x!126302 lt!616888) #b01111111111111111111111111111110) (bvslt (x!126302 lt!616894) #b00000000000000000000000000000000) (bvsgt (x!126302 lt!616894) #b01111111111111111111111111111110) (bvslt lt!616891 #b00000000000000000000000000000000) (bvsge lt!616891 (size!46783 a!2901)) (bvslt (index!44675 lt!616888) #b00000000000000000000000000000000) (bvsge (index!44675 lt!616888) (size!46783 a!2901)) (bvslt (index!44675 lt!616894) #b00000000000000000000000000000000) (bvsge (index!44675 lt!616894) (size!46783 a!2901)) (not (= lt!616888 (Intermediate!10574 false (index!44675 lt!616888) (x!126302 lt!616888)))) (not (= lt!616894 (Intermediate!10574 false (index!44675 lt!616894) (x!126302 lt!616894))))))))

(declare-fun e!793627 () Bool)

(assert (=> b!1401565 e!793627))

(declare-fun res!940122 () Bool)

(assert (=> b!1401565 (=> (not res!940122) (not e!793627))))

(assert (=> b!1401565 (= res!940122 (and (not (undefined!11386 lt!616894)) (= (index!44675 lt!616894) i!1037) (bvslt (x!126302 lt!616894) (x!126302 lt!616888)) (= (select (store (arr!46231 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44675 lt!616894)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!46995 0))(
  ( (Unit!46996) )
))
(declare-fun lt!616892 () Unit!46995)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95760 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46995)

(assert (=> b!1401565 (= lt!616892 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616891 (x!126302 lt!616888) (index!44675 lt!616888) (x!126302 lt!616894) (index!44675 lt!616894) (undefined!11386 lt!616894) mask!2840))))

(declare-fun b!1401566 () Bool)

(declare-fun res!940131 () Bool)

(assert (=> b!1401566 (=> (not res!940131) (not e!793628))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401566 (= res!940131 (validKeyInArray!0 (select (arr!46231 a!2901) i!1037)))))

(declare-fun b!1401567 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95760 (_ BitVec 32)) SeekEntryResult!10574)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95760 (_ BitVec 32)) SeekEntryResult!10574)

(assert (=> b!1401567 (= e!793627 (= (seekEntryOrOpen!0 lt!616889 lt!616890 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126302 lt!616894) (index!44675 lt!616894) (index!44675 lt!616894) (select (arr!46231 a!2901) j!112) lt!616890 mask!2840)))))

(declare-fun b!1401568 () Bool)

(declare-fun res!940129 () Bool)

(assert (=> b!1401568 (=> (not res!940129) (not e!793628))))

(assert (=> b!1401568 (= res!940129 (and (= (size!46783 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46783 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46783 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401560 () Bool)

(declare-fun res!940127 () Bool)

(assert (=> b!1401560 (=> (not res!940127) (not e!793628))))

(assert (=> b!1401560 (= res!940127 (validKeyInArray!0 (select (arr!46231 a!2901) j!112)))))

(declare-fun res!940132 () Bool)

(assert (=> start!120398 (=> (not res!940132) (not e!793628))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120398 (= res!940132 (validMask!0 mask!2840))))

(assert (=> start!120398 e!793628))

(assert (=> start!120398 true))

(declare-fun array_inv!35464 (array!95760) Bool)

(assert (=> start!120398 (array_inv!35464 a!2901)))

(declare-fun b!1401569 () Bool)

(assert (=> b!1401569 (= e!793628 (not e!793622))))

(declare-fun res!940125 () Bool)

(assert (=> b!1401569 (=> res!940125 e!793622)))

(assert (=> b!1401569 (= res!940125 (or (not ((_ is Intermediate!10574) lt!616888)) (undefined!11386 lt!616888)))))

(declare-fun e!793625 () Bool)

(assert (=> b!1401569 e!793625))

(declare-fun res!940130 () Bool)

(assert (=> b!1401569 (=> (not res!940130) (not e!793625))))

(assert (=> b!1401569 (= res!940130 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!616895 () Unit!46995)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95760 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46995)

(assert (=> b!1401569 (= lt!616895 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1401569 (= lt!616888 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616891 (select (arr!46231 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1401569 (= lt!616891 (toIndex!0 (select (arr!46231 a!2901) j!112) mask!2840))))

(declare-fun b!1401570 () Bool)

(assert (=> b!1401570 (= e!793625 (= (seekEntryOrOpen!0 (select (arr!46231 a!2901) j!112) a!2901 mask!2840) (Found!10574 j!112)))))

(assert (= (and start!120398 res!940132) b!1401568))

(assert (= (and b!1401568 res!940129) b!1401566))

(assert (= (and b!1401566 res!940131) b!1401560))

(assert (= (and b!1401560 res!940127) b!1401561))

(assert (= (and b!1401561 res!940123) b!1401563))

(assert (= (and b!1401563 res!940124) b!1401569))

(assert (= (and b!1401569 res!940130) b!1401570))

(assert (= (and b!1401569 (not res!940125)) b!1401562))

(assert (= (and b!1401562 (not res!940126)) b!1401565))

(assert (= (and b!1401565 res!940122) b!1401567))

(assert (= (and b!1401565 (not res!940128)) b!1401564))

(declare-fun m!1288957 () Bool)

(assert (=> b!1401569 m!1288957))

(declare-fun m!1288959 () Bool)

(assert (=> b!1401569 m!1288959))

(assert (=> b!1401569 m!1288957))

(assert (=> b!1401569 m!1288957))

(declare-fun m!1288961 () Bool)

(assert (=> b!1401569 m!1288961))

(declare-fun m!1288963 () Bool)

(assert (=> b!1401569 m!1288963))

(declare-fun m!1288965 () Bool)

(assert (=> b!1401569 m!1288965))

(declare-fun m!1288967 () Bool)

(assert (=> start!120398 m!1288967))

(declare-fun m!1288969 () Bool)

(assert (=> start!120398 m!1288969))

(declare-fun m!1288971 () Bool)

(assert (=> b!1401566 m!1288971))

(assert (=> b!1401566 m!1288971))

(declare-fun m!1288973 () Bool)

(assert (=> b!1401566 m!1288973))

(declare-fun m!1288975 () Bool)

(assert (=> b!1401565 m!1288975))

(declare-fun m!1288977 () Bool)

(assert (=> b!1401565 m!1288977))

(declare-fun m!1288979 () Bool)

(assert (=> b!1401565 m!1288979))

(assert (=> b!1401570 m!1288957))

(assert (=> b!1401570 m!1288957))

(declare-fun m!1288981 () Bool)

(assert (=> b!1401570 m!1288981))

(declare-fun m!1288983 () Bool)

(assert (=> b!1401562 m!1288983))

(assert (=> b!1401562 m!1288983))

(declare-fun m!1288985 () Bool)

(assert (=> b!1401562 m!1288985))

(assert (=> b!1401562 m!1288975))

(declare-fun m!1288987 () Bool)

(assert (=> b!1401562 m!1288987))

(declare-fun m!1288989 () Bool)

(assert (=> b!1401563 m!1288989))

(declare-fun m!1288991 () Bool)

(assert (=> b!1401564 m!1288991))

(assert (=> b!1401560 m!1288957))

(assert (=> b!1401560 m!1288957))

(declare-fun m!1288993 () Bool)

(assert (=> b!1401560 m!1288993))

(declare-fun m!1288995 () Bool)

(assert (=> b!1401561 m!1288995))

(declare-fun m!1288997 () Bool)

(assert (=> b!1401567 m!1288997))

(assert (=> b!1401567 m!1288957))

(assert (=> b!1401567 m!1288957))

(declare-fun m!1288999 () Bool)

(assert (=> b!1401567 m!1288999))

(check-sat (not b!1401569) (not b!1401562) (not b!1401570) (not b!1401566) (not b!1401565) (not start!120398) (not b!1401560) (not b!1401564) (not b!1401567) (not b!1401563) (not b!1401561))
(check-sat)
