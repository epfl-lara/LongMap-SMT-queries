; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120200 () Bool)

(assert start!120200)

(declare-fun b!1398262 () Bool)

(declare-fun res!936496 () Bool)

(declare-fun e!791692 () Bool)

(assert (=> b!1398262 (=> (not res!936496) (not e!791692))))

(declare-datatypes ((array!95651 0))(
  ( (array!95652 (arr!46177 (Array (_ BitVec 32) (_ BitVec 64))) (size!46728 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95651)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398262 (= res!936496 (validKeyInArray!0 (select (arr!46177 a!2901) i!1037)))))

(declare-fun b!1398263 () Bool)

(declare-fun res!936497 () Bool)

(assert (=> b!1398263 (=> (not res!936497) (not e!791692))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1398263 (= res!936497 (and (= (size!46728 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46728 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46728 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!936493 () Bool)

(assert (=> start!120200 (=> (not res!936493) (not e!791692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120200 (= res!936493 (validMask!0 mask!2840))))

(assert (=> start!120200 e!791692))

(assert (=> start!120200 true))

(declare-fun array_inv!35458 (array!95651) Bool)

(assert (=> start!120200 (array_inv!35458 a!2901)))

(declare-fun b!1398264 () Bool)

(declare-fun res!936492 () Bool)

(assert (=> b!1398264 (=> (not res!936492) (not e!791692))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95651 (_ BitVec 32)) Bool)

(assert (=> b!1398264 (= res!936492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398265 () Bool)

(declare-fun e!791695 () Bool)

(assert (=> b!1398265 (= e!791695 true)))

(declare-fun lt!614354 () (_ BitVec 64))

(declare-fun lt!614355 () array!95651)

(declare-datatypes ((SeekEntryResult!10397 0))(
  ( (MissingZero!10397 (index!43959 (_ BitVec 32))) (Found!10397 (index!43960 (_ BitVec 32))) (Intermediate!10397 (undefined!11209 Bool) (index!43961 (_ BitVec 32)) (x!125774 (_ BitVec 32))) (Undefined!10397) (MissingVacant!10397 (index!43962 (_ BitVec 32))) )
))
(declare-fun lt!614358 () SeekEntryResult!10397)

(declare-fun lt!614356 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95651 (_ BitVec 32)) SeekEntryResult!10397)

(assert (=> b!1398265 (= lt!614358 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614356 lt!614354 lt!614355 mask!2840))))

(declare-fun b!1398266 () Bool)

(declare-fun res!936491 () Bool)

(assert (=> b!1398266 (=> (not res!936491) (not e!791692))))

(declare-datatypes ((List!32683 0))(
  ( (Nil!32680) (Cons!32679 (h!33929 (_ BitVec 64)) (t!47369 List!32683)) )
))
(declare-fun arrayNoDuplicates!0 (array!95651 (_ BitVec 32) List!32683) Bool)

(assert (=> b!1398266 (= res!936491 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32680))))

(declare-fun b!1398267 () Bool)

(declare-fun e!791696 () Bool)

(assert (=> b!1398267 (= e!791692 (not e!791696))))

(declare-fun res!936499 () Bool)

(assert (=> b!1398267 (=> res!936499 e!791696)))

(declare-fun lt!614359 () SeekEntryResult!10397)

(get-info :version)

(assert (=> b!1398267 (= res!936499 (or (not ((_ is Intermediate!10397) lt!614359)) (undefined!11209 lt!614359)))))

(declare-fun e!791693 () Bool)

(assert (=> b!1398267 e!791693))

(declare-fun res!936498 () Bool)

(assert (=> b!1398267 (=> (not res!936498) (not e!791693))))

(assert (=> b!1398267 (= res!936498 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46825 0))(
  ( (Unit!46826) )
))
(declare-fun lt!614357 () Unit!46825)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95651 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46825)

(assert (=> b!1398267 (= lt!614357 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1398267 (= lt!614359 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614356 (select (arr!46177 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398267 (= lt!614356 (toIndex!0 (select (arr!46177 a!2901) j!112) mask!2840))))

(declare-fun b!1398268 () Bool)

(assert (=> b!1398268 (= e!791696 e!791695)))

(declare-fun res!936495 () Bool)

(assert (=> b!1398268 (=> res!936495 e!791695)))

(declare-fun lt!614360 () SeekEntryResult!10397)

(assert (=> b!1398268 (= res!936495 (or (= lt!614359 lt!614360) (not ((_ is Intermediate!10397) lt!614360)) (bvslt (x!125774 lt!614359) #b00000000000000000000000000000000) (bvsgt (x!125774 lt!614359) #b01111111111111111111111111111110) (bvslt lt!614356 #b00000000000000000000000000000000) (bvsge lt!614356 (size!46728 a!2901)) (bvslt (index!43961 lt!614359) #b00000000000000000000000000000000) (bvsge (index!43961 lt!614359) (size!46728 a!2901)) (not (= lt!614359 (Intermediate!10397 false (index!43961 lt!614359) (x!125774 lt!614359)))) (not (= lt!614360 (Intermediate!10397 (undefined!11209 lt!614360) (index!43961 lt!614360) (x!125774 lt!614360))))))))

(assert (=> b!1398268 (= lt!614360 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614354 mask!2840) lt!614354 lt!614355 mask!2840))))

(assert (=> b!1398268 (= lt!614354 (select (store (arr!46177 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1398268 (= lt!614355 (array!95652 (store (arr!46177 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46728 a!2901)))))

(declare-fun b!1398269 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95651 (_ BitVec 32)) SeekEntryResult!10397)

(assert (=> b!1398269 (= e!791693 (= (seekEntryOrOpen!0 (select (arr!46177 a!2901) j!112) a!2901 mask!2840) (Found!10397 j!112)))))

(declare-fun b!1398270 () Bool)

(declare-fun res!936494 () Bool)

(assert (=> b!1398270 (=> (not res!936494) (not e!791692))))

(assert (=> b!1398270 (= res!936494 (validKeyInArray!0 (select (arr!46177 a!2901) j!112)))))

(assert (= (and start!120200 res!936493) b!1398263))

(assert (= (and b!1398263 res!936497) b!1398262))

(assert (= (and b!1398262 res!936496) b!1398270))

(assert (= (and b!1398270 res!936494) b!1398264))

(assert (= (and b!1398264 res!936492) b!1398266))

(assert (= (and b!1398266 res!936491) b!1398267))

(assert (= (and b!1398267 res!936498) b!1398269))

(assert (= (and b!1398267 (not res!936499)) b!1398268))

(assert (= (and b!1398268 (not res!936495)) b!1398265))

(declare-fun m!1285159 () Bool)

(assert (=> b!1398266 m!1285159))

(declare-fun m!1285161 () Bool)

(assert (=> b!1398267 m!1285161))

(declare-fun m!1285163 () Bool)

(assert (=> b!1398267 m!1285163))

(declare-fun m!1285165 () Bool)

(assert (=> b!1398267 m!1285165))

(declare-fun m!1285167 () Bool)

(assert (=> b!1398267 m!1285167))

(assert (=> b!1398267 m!1285161))

(declare-fun m!1285169 () Bool)

(assert (=> b!1398267 m!1285169))

(assert (=> b!1398267 m!1285161))

(declare-fun m!1285171 () Bool)

(assert (=> start!120200 m!1285171))

(declare-fun m!1285173 () Bool)

(assert (=> start!120200 m!1285173))

(declare-fun m!1285175 () Bool)

(assert (=> b!1398264 m!1285175))

(declare-fun m!1285177 () Bool)

(assert (=> b!1398265 m!1285177))

(declare-fun m!1285179 () Bool)

(assert (=> b!1398268 m!1285179))

(assert (=> b!1398268 m!1285179))

(declare-fun m!1285181 () Bool)

(assert (=> b!1398268 m!1285181))

(declare-fun m!1285183 () Bool)

(assert (=> b!1398268 m!1285183))

(declare-fun m!1285185 () Bool)

(assert (=> b!1398268 m!1285185))

(declare-fun m!1285187 () Bool)

(assert (=> b!1398262 m!1285187))

(assert (=> b!1398262 m!1285187))

(declare-fun m!1285189 () Bool)

(assert (=> b!1398262 m!1285189))

(assert (=> b!1398269 m!1285161))

(assert (=> b!1398269 m!1285161))

(declare-fun m!1285191 () Bool)

(assert (=> b!1398269 m!1285191))

(assert (=> b!1398270 m!1285161))

(assert (=> b!1398270 m!1285161))

(declare-fun m!1285193 () Bool)

(assert (=> b!1398270 m!1285193))

(check-sat (not b!1398266) (not b!1398268) (not start!120200) (not b!1398267) (not b!1398264) (not b!1398265) (not b!1398270) (not b!1398262) (not b!1398269))
(check-sat)
