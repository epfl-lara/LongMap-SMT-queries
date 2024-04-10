; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120368 () Bool)

(assert start!120368)

(declare-fun res!939592 () Bool)

(declare-fun e!793306 () Bool)

(assert (=> start!120368 (=> (not res!939592) (not e!793306))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120368 (= res!939592 (validMask!0 mask!2840))))

(assert (=> start!120368 e!793306))

(assert (=> start!120368 true))

(declare-datatypes ((array!95777 0))(
  ( (array!95778 (arr!46239 (Array (_ BitVec 32) (_ BitVec 64))) (size!46789 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95777)

(declare-fun array_inv!35267 (array!95777) Bool)

(assert (=> start!120368 (array_inv!35267 a!2901)))

(declare-fun b!1401080 () Bool)

(declare-fun res!939597 () Bool)

(assert (=> b!1401080 (=> (not res!939597) (not e!793306))))

(declare-datatypes ((List!32758 0))(
  ( (Nil!32755) (Cons!32754 (h!34002 (_ BitVec 64)) (t!47452 List!32758)) )
))
(declare-fun arrayNoDuplicates!0 (array!95777 (_ BitVec 32) List!32758) Bool)

(assert (=> b!1401080 (= res!939597 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32755))))

(declare-fun e!793310 () Bool)

(declare-fun lt!616670 () array!95777)

(declare-fun b!1401081 () Bool)

(declare-datatypes ((SeekEntryResult!10556 0))(
  ( (MissingZero!10556 (index!44601 (_ BitVec 32))) (Found!10556 (index!44602 (_ BitVec 32))) (Intermediate!10556 (undefined!11368 Bool) (index!44603 (_ BitVec 32)) (x!126239 (_ BitVec 32))) (Undefined!10556) (MissingVacant!10556 (index!44604 (_ BitVec 32))) )
))
(declare-fun lt!616677 () SeekEntryResult!10556)

(declare-fun lt!616676 () (_ BitVec 64))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95777 (_ BitVec 32)) SeekEntryResult!10556)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95777 (_ BitVec 32)) SeekEntryResult!10556)

(assert (=> b!1401081 (= e!793310 (= (seekEntryOrOpen!0 lt!616676 lt!616670 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126239 lt!616677) (index!44603 lt!616677) (index!44603 lt!616677) (select (arr!46239 a!2901) j!112) lt!616670 mask!2840)))))

(declare-fun b!1401082 () Bool)

(declare-fun res!939599 () Bool)

(assert (=> b!1401082 (=> (not res!939599) (not e!793306))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95777 (_ BitVec 32)) Bool)

(assert (=> b!1401082 (= res!939599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401083 () Bool)

(declare-fun e!793308 () Bool)

(declare-fun e!793304 () Bool)

(assert (=> b!1401083 (= e!793308 e!793304)))

(declare-fun res!939594 () Bool)

(assert (=> b!1401083 (=> res!939594 e!793304)))

(declare-fun lt!616675 () SeekEntryResult!10556)

(declare-fun lt!616673 () (_ BitVec 32))

(assert (=> b!1401083 (= res!939594 (or (bvslt (x!126239 lt!616675) #b00000000000000000000000000000000) (bvsgt (x!126239 lt!616675) #b01111111111111111111111111111110) (bvslt (x!126239 lt!616677) #b00000000000000000000000000000000) (bvsgt (x!126239 lt!616677) #b01111111111111111111111111111110) (bvslt lt!616673 #b00000000000000000000000000000000) (bvsge lt!616673 (size!46789 a!2901)) (bvslt (index!44603 lt!616675) #b00000000000000000000000000000000) (bvsge (index!44603 lt!616675) (size!46789 a!2901)) (bvslt (index!44603 lt!616677) #b00000000000000000000000000000000) (bvsge (index!44603 lt!616677) (size!46789 a!2901)) (not (= lt!616675 (Intermediate!10556 false (index!44603 lt!616675) (x!126239 lt!616675)))) (not (= lt!616677 (Intermediate!10556 false (index!44603 lt!616677) (x!126239 lt!616677))))))))

(assert (=> b!1401083 e!793310))

(declare-fun res!939596 () Bool)

(assert (=> b!1401083 (=> (not res!939596) (not e!793310))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1401083 (= res!939596 (and (not (undefined!11368 lt!616677)) (= (index!44603 lt!616677) i!1037) (bvslt (x!126239 lt!616677) (x!126239 lt!616675)) (= (select (store (arr!46239 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44603 lt!616677)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47116 0))(
  ( (Unit!47117) )
))
(declare-fun lt!616672 () Unit!47116)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95777 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47116)

(assert (=> b!1401083 (= lt!616672 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616673 (x!126239 lt!616675) (index!44603 lt!616675) (x!126239 lt!616677) (index!44603 lt!616677) (undefined!11368 lt!616677) mask!2840))))

(declare-fun b!1401084 () Bool)

(declare-fun res!939600 () Bool)

(assert (=> b!1401084 (=> (not res!939600) (not e!793306))))

(assert (=> b!1401084 (= res!939600 (and (= (size!46789 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46789 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46789 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401085 () Bool)

(declare-fun e!793309 () Bool)

(assert (=> b!1401085 (= e!793309 (= (seekEntryOrOpen!0 (select (arr!46239 a!2901) j!112) a!2901 mask!2840) (Found!10556 j!112)))))

(declare-fun b!1401086 () Bool)

(declare-fun e!793307 () Bool)

(assert (=> b!1401086 (= e!793306 (not e!793307))))

(declare-fun res!939591 () Bool)

(assert (=> b!1401086 (=> res!939591 e!793307)))

(get-info :version)

(assert (=> b!1401086 (= res!939591 (or (not ((_ is Intermediate!10556) lt!616675)) (undefined!11368 lt!616675)))))

(assert (=> b!1401086 e!793309))

(declare-fun res!939595 () Bool)

(assert (=> b!1401086 (=> (not res!939595) (not e!793309))))

(assert (=> b!1401086 (= res!939595 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!616674 () Unit!47116)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95777 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47116)

(assert (=> b!1401086 (= lt!616674 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95777 (_ BitVec 32)) SeekEntryResult!10556)

(assert (=> b!1401086 (= lt!616675 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616673 (select (arr!46239 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401086 (= lt!616673 (toIndex!0 (select (arr!46239 a!2901) j!112) mask!2840))))

(declare-fun b!1401087 () Bool)

(assert (=> b!1401087 (= e!793307 e!793308)))

(declare-fun res!939598 () Bool)

(assert (=> b!1401087 (=> res!939598 e!793308)))

(assert (=> b!1401087 (= res!939598 (or (= lt!616675 lt!616677) (not ((_ is Intermediate!10556) lt!616677))))))

(assert (=> b!1401087 (= lt!616677 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616676 mask!2840) lt!616676 lt!616670 mask!2840))))

(assert (=> b!1401087 (= lt!616676 (select (store (arr!46239 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401087 (= lt!616670 (array!95778 (store (arr!46239 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46789 a!2901)))))

(declare-fun b!1401088 () Bool)

(declare-fun res!939593 () Bool)

(assert (=> b!1401088 (=> (not res!939593) (not e!793306))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401088 (= res!939593 (validKeyInArray!0 (select (arr!46239 a!2901) i!1037)))))

(declare-fun b!1401089 () Bool)

(assert (=> b!1401089 (= e!793304 true)))

(declare-fun lt!616671 () SeekEntryResult!10556)

(assert (=> b!1401089 (= lt!616671 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616673 lt!616676 lt!616670 mask!2840))))

(declare-fun b!1401090 () Bool)

(declare-fun res!939601 () Bool)

(assert (=> b!1401090 (=> (not res!939601) (not e!793306))))

(assert (=> b!1401090 (= res!939601 (validKeyInArray!0 (select (arr!46239 a!2901) j!112)))))

(assert (= (and start!120368 res!939592) b!1401084))

(assert (= (and b!1401084 res!939600) b!1401088))

(assert (= (and b!1401088 res!939593) b!1401090))

(assert (= (and b!1401090 res!939601) b!1401082))

(assert (= (and b!1401082 res!939599) b!1401080))

(assert (= (and b!1401080 res!939597) b!1401086))

(assert (= (and b!1401086 res!939595) b!1401085))

(assert (= (and b!1401086 (not res!939591)) b!1401087))

(assert (= (and b!1401087 (not res!939598)) b!1401083))

(assert (= (and b!1401083 res!939596) b!1401081))

(assert (= (and b!1401083 (not res!939594)) b!1401089))

(declare-fun m!1288745 () Bool)

(assert (=> b!1401080 m!1288745))

(declare-fun m!1288747 () Bool)

(assert (=> b!1401090 m!1288747))

(assert (=> b!1401090 m!1288747))

(declare-fun m!1288749 () Bool)

(assert (=> b!1401090 m!1288749))

(declare-fun m!1288751 () Bool)

(assert (=> b!1401081 m!1288751))

(assert (=> b!1401081 m!1288747))

(assert (=> b!1401081 m!1288747))

(declare-fun m!1288753 () Bool)

(assert (=> b!1401081 m!1288753))

(assert (=> b!1401085 m!1288747))

(assert (=> b!1401085 m!1288747))

(declare-fun m!1288755 () Bool)

(assert (=> b!1401085 m!1288755))

(declare-fun m!1288757 () Bool)

(assert (=> b!1401089 m!1288757))

(declare-fun m!1288759 () Bool)

(assert (=> start!120368 m!1288759))

(declare-fun m!1288761 () Bool)

(assert (=> start!120368 m!1288761))

(declare-fun m!1288763 () Bool)

(assert (=> b!1401087 m!1288763))

(assert (=> b!1401087 m!1288763))

(declare-fun m!1288765 () Bool)

(assert (=> b!1401087 m!1288765))

(declare-fun m!1288767 () Bool)

(assert (=> b!1401087 m!1288767))

(declare-fun m!1288769 () Bool)

(assert (=> b!1401087 m!1288769))

(declare-fun m!1288771 () Bool)

(assert (=> b!1401082 m!1288771))

(declare-fun m!1288773 () Bool)

(assert (=> b!1401088 m!1288773))

(assert (=> b!1401088 m!1288773))

(declare-fun m!1288775 () Bool)

(assert (=> b!1401088 m!1288775))

(assert (=> b!1401083 m!1288767))

(declare-fun m!1288777 () Bool)

(assert (=> b!1401083 m!1288777))

(declare-fun m!1288779 () Bool)

(assert (=> b!1401083 m!1288779))

(assert (=> b!1401086 m!1288747))

(declare-fun m!1288781 () Bool)

(assert (=> b!1401086 m!1288781))

(assert (=> b!1401086 m!1288747))

(declare-fun m!1288783 () Bool)

(assert (=> b!1401086 m!1288783))

(declare-fun m!1288785 () Bool)

(assert (=> b!1401086 m!1288785))

(assert (=> b!1401086 m!1288747))

(declare-fun m!1288787 () Bool)

(assert (=> b!1401086 m!1288787))

(check-sat (not b!1401081) (not b!1401085) (not b!1401080) (not b!1401089) (not b!1401083) (not b!1401088) (not b!1401090) (not b!1401082) (not start!120368) (not b!1401086) (not b!1401087))
(check-sat)
