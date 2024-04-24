; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120650 () Bool)

(assert start!120650)

(declare-fun b!1403733 () Bool)

(declare-fun res!941566 () Bool)

(declare-fun e!794957 () Bool)

(assert (=> b!1403733 (=> res!941566 e!794957)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!618272 () (_ BitVec 32))

(declare-datatypes ((array!95981 0))(
  ( (array!95982 (arr!46339 (Array (_ BitVec 32) (_ BitVec 64))) (size!46890 (_ BitVec 32))) )
))
(declare-fun lt!618278 () array!95981)

(declare-fun lt!618277 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10559 0))(
  ( (MissingZero!10559 (index!44613 (_ BitVec 32))) (Found!10559 (index!44614 (_ BitVec 32))) (Intermediate!10559 (undefined!11371 Bool) (index!44615 (_ BitVec 32)) (x!126389 (_ BitVec 32))) (Undefined!10559) (MissingVacant!10559 (index!44616 (_ BitVec 32))) )
))
(declare-fun lt!618279 () SeekEntryResult!10559)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95981 (_ BitVec 32)) SeekEntryResult!10559)

(assert (=> b!1403733 (= res!941566 (not (= lt!618279 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!618272 lt!618277 lt!618278 mask!2840))))))

(declare-fun b!1403735 () Bool)

(declare-fun res!941568 () Bool)

(declare-fun e!794954 () Bool)

(assert (=> b!1403735 (=> (not res!941568) (not e!794954))))

(declare-fun a!2901 () array!95981)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1403735 (= res!941568 (and (= (size!46890 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46890 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46890 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403736 () Bool)

(declare-fun e!794955 () Bool)

(assert (=> b!1403736 (= e!794955 e!794957)))

(declare-fun res!941565 () Bool)

(assert (=> b!1403736 (=> res!941565 e!794957)))

(declare-fun lt!618275 () SeekEntryResult!10559)

(assert (=> b!1403736 (= res!941565 (or (bvslt (x!126389 lt!618275) #b00000000000000000000000000000000) (bvsgt (x!126389 lt!618275) #b01111111111111111111111111111110) (bvslt (x!126389 lt!618279) #b00000000000000000000000000000000) (bvsgt (x!126389 lt!618279) #b01111111111111111111111111111110) (bvslt lt!618272 #b00000000000000000000000000000000) (bvsge lt!618272 (size!46890 a!2901)) (bvslt (index!44615 lt!618275) #b00000000000000000000000000000000) (bvsge (index!44615 lt!618275) (size!46890 a!2901)) (bvslt (index!44615 lt!618279) #b00000000000000000000000000000000) (bvsge (index!44615 lt!618279) (size!46890 a!2901)) (not (= lt!618275 (Intermediate!10559 false (index!44615 lt!618275) (x!126389 lt!618275)))) (not (= lt!618279 (Intermediate!10559 false (index!44615 lt!618279) (x!126389 lt!618279))))))))

(declare-fun lt!618280 () SeekEntryResult!10559)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95981 (_ BitVec 32)) SeekEntryResult!10559)

(assert (=> b!1403736 (= lt!618280 (seekKeyOrZeroReturnVacant!0 (x!126389 lt!618279) (index!44615 lt!618279) (index!44615 lt!618279) (select (arr!46339 a!2901) j!112) lt!618278 mask!2840))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95981 (_ BitVec 32)) SeekEntryResult!10559)

(assert (=> b!1403736 (= lt!618280 (seekEntryOrOpen!0 lt!618277 lt!618278 mask!2840))))

(assert (=> b!1403736 (and (not (undefined!11371 lt!618279)) (= (index!44615 lt!618279) i!1037) (bvslt (x!126389 lt!618279) (x!126389 lt!618275)) (= (select (store (arr!46339 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44615 lt!618279)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47149 0))(
  ( (Unit!47150) )
))
(declare-fun lt!618276 () Unit!47149)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95981 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47149)

(assert (=> b!1403736 (= lt!618276 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!618272 (x!126389 lt!618275) (index!44615 lt!618275) (x!126389 lt!618279) (index!44615 lt!618279) (undefined!11371 lt!618279) mask!2840))))

(declare-fun b!1403737 () Bool)

(declare-fun res!941569 () Bool)

(assert (=> b!1403737 (=> (not res!941569) (not e!794954))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95981 (_ BitVec 32)) Bool)

(assert (=> b!1403737 (= res!941569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403738 () Bool)

(declare-fun res!941567 () Bool)

(assert (=> b!1403738 (=> (not res!941567) (not e!794954))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403738 (= res!941567 (validKeyInArray!0 (select (arr!46339 a!2901) j!112)))))

(declare-fun b!1403739 () Bool)

(assert (=> b!1403739 (= e!794957 true)))

(declare-fun lt!618281 () SeekEntryResult!10559)

(assert (=> b!1403739 (= lt!618281 lt!618280)))

(declare-fun lt!618273 () Unit!47149)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95981 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47149)

(assert (=> b!1403739 (= lt!618273 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!618272 (x!126389 lt!618275) (index!44615 lt!618275) (x!126389 lt!618279) (index!44615 lt!618279) mask!2840))))

(declare-fun b!1403740 () Bool)

(declare-fun res!941563 () Bool)

(assert (=> b!1403740 (=> (not res!941563) (not e!794954))))

(assert (=> b!1403740 (= res!941563 (validKeyInArray!0 (select (arr!46339 a!2901) i!1037)))))

(declare-fun b!1403741 () Bool)

(declare-fun res!941564 () Bool)

(assert (=> b!1403741 (=> (not res!941564) (not e!794954))))

(declare-datatypes ((List!32845 0))(
  ( (Nil!32842) (Cons!32841 (h!34097 (_ BitVec 64)) (t!47531 List!32845)) )
))
(declare-fun arrayNoDuplicates!0 (array!95981 (_ BitVec 32) List!32845) Bool)

(assert (=> b!1403741 (= res!941564 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32842))))

(declare-fun b!1403742 () Bool)

(declare-fun e!794953 () Bool)

(assert (=> b!1403742 (= e!794954 (not e!794953))))

(declare-fun res!941561 () Bool)

(assert (=> b!1403742 (=> res!941561 e!794953)))

(get-info :version)

(assert (=> b!1403742 (= res!941561 (or (not ((_ is Intermediate!10559) lt!618275)) (undefined!11371 lt!618275)))))

(assert (=> b!1403742 (= lt!618281 (Found!10559 j!112))))

(assert (=> b!1403742 (= lt!618281 (seekEntryOrOpen!0 (select (arr!46339 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1403742 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!618274 () Unit!47149)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95981 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47149)

(assert (=> b!1403742 (= lt!618274 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1403742 (= lt!618275 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!618272 (select (arr!46339 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403742 (= lt!618272 (toIndex!0 (select (arr!46339 a!2901) j!112) mask!2840))))

(declare-fun b!1403734 () Bool)

(assert (=> b!1403734 (= e!794953 e!794955)))

(declare-fun res!941560 () Bool)

(assert (=> b!1403734 (=> res!941560 e!794955)))

(assert (=> b!1403734 (= res!941560 (or (= lt!618275 lt!618279) (not ((_ is Intermediate!10559) lt!618279))))))

(assert (=> b!1403734 (= lt!618279 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!618277 mask!2840) lt!618277 lt!618278 mask!2840))))

(assert (=> b!1403734 (= lt!618277 (select (store (arr!46339 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1403734 (= lt!618278 (array!95982 (store (arr!46339 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46890 a!2901)))))

(declare-fun res!941562 () Bool)

(assert (=> start!120650 (=> (not res!941562) (not e!794954))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120650 (= res!941562 (validMask!0 mask!2840))))

(assert (=> start!120650 e!794954))

(assert (=> start!120650 true))

(declare-fun array_inv!35620 (array!95981) Bool)

(assert (=> start!120650 (array_inv!35620 a!2901)))

(assert (= (and start!120650 res!941562) b!1403735))

(assert (= (and b!1403735 res!941568) b!1403740))

(assert (= (and b!1403740 res!941563) b!1403738))

(assert (= (and b!1403738 res!941567) b!1403737))

(assert (= (and b!1403737 res!941569) b!1403741))

(assert (= (and b!1403741 res!941564) b!1403742))

(assert (= (and b!1403742 (not res!941561)) b!1403734))

(assert (= (and b!1403734 (not res!941560)) b!1403736))

(assert (= (and b!1403736 (not res!941565)) b!1403733))

(assert (= (and b!1403733 (not res!941566)) b!1403739))

(declare-fun m!1292209 () Bool)

(assert (=> b!1403740 m!1292209))

(assert (=> b!1403740 m!1292209))

(declare-fun m!1292211 () Bool)

(assert (=> b!1403740 m!1292211))

(declare-fun m!1292213 () Bool)

(assert (=> b!1403737 m!1292213))

(declare-fun m!1292215 () Bool)

(assert (=> b!1403736 m!1292215))

(declare-fun m!1292217 () Bool)

(assert (=> b!1403736 m!1292217))

(declare-fun m!1292219 () Bool)

(assert (=> b!1403736 m!1292219))

(assert (=> b!1403736 m!1292219))

(declare-fun m!1292221 () Bool)

(assert (=> b!1403736 m!1292221))

(declare-fun m!1292223 () Bool)

(assert (=> b!1403736 m!1292223))

(declare-fun m!1292225 () Bool)

(assert (=> b!1403736 m!1292225))

(declare-fun m!1292227 () Bool)

(assert (=> start!120650 m!1292227))

(declare-fun m!1292229 () Bool)

(assert (=> start!120650 m!1292229))

(declare-fun m!1292231 () Bool)

(assert (=> b!1403739 m!1292231))

(declare-fun m!1292233 () Bool)

(assert (=> b!1403733 m!1292233))

(declare-fun m!1292235 () Bool)

(assert (=> b!1403734 m!1292235))

(assert (=> b!1403734 m!1292235))

(declare-fun m!1292237 () Bool)

(assert (=> b!1403734 m!1292237))

(assert (=> b!1403734 m!1292225))

(declare-fun m!1292239 () Bool)

(assert (=> b!1403734 m!1292239))

(declare-fun m!1292241 () Bool)

(assert (=> b!1403741 m!1292241))

(assert (=> b!1403742 m!1292219))

(declare-fun m!1292243 () Bool)

(assert (=> b!1403742 m!1292243))

(assert (=> b!1403742 m!1292219))

(declare-fun m!1292245 () Bool)

(assert (=> b!1403742 m!1292245))

(assert (=> b!1403742 m!1292219))

(declare-fun m!1292247 () Bool)

(assert (=> b!1403742 m!1292247))

(assert (=> b!1403742 m!1292219))

(declare-fun m!1292249 () Bool)

(assert (=> b!1403742 m!1292249))

(declare-fun m!1292251 () Bool)

(assert (=> b!1403742 m!1292251))

(assert (=> b!1403738 m!1292219))

(assert (=> b!1403738 m!1292219))

(declare-fun m!1292253 () Bool)

(assert (=> b!1403738 m!1292253))

(check-sat (not b!1403739) (not b!1403733) (not b!1403740) (not b!1403741) (not b!1403738) (not b!1403736) (not b!1403742) (not start!120650) (not b!1403737) (not b!1403734))
(check-sat)
