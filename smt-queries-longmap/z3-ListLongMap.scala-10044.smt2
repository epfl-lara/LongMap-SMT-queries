; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118364 () Bool)

(assert start!118364)

(declare-fun b!1384425 () Bool)

(declare-datatypes ((Unit!46017 0))(
  ( (Unit!46018) )
))
(declare-fun e!784493 () Unit!46017)

(declare-fun Unit!46019 () Unit!46017)

(assert (=> b!1384425 (= e!784493 Unit!46019)))

(declare-fun b!1384426 () Bool)

(declare-fun e!784491 () Bool)

(assert (=> b!1384426 (= e!784491 (not true))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-datatypes ((array!94620 0))(
  ( (array!94621 (arr!45688 (Array (_ BitVec 32) (_ BitVec 64))) (size!46240 (_ BitVec 32))) )
))
(declare-fun lt!608730 () array!94620)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94620 (_ BitVec 32)) Bool)

(assert (=> b!1384426 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!608730 mask!2987)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun lt!608732 () Unit!46017)

(declare-fun a!2938 () array!94620)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94620 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46017)

(assert (=> b!1384426 (= lt!608732 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(declare-fun b!1384427 () Bool)

(declare-fun res!925897 () Bool)

(declare-fun e!784492 () Bool)

(assert (=> b!1384427 (=> (not res!925897) (not e!784492))))

(assert (=> b!1384427 (= res!925897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384428 () Bool)

(declare-fun res!925898 () Bool)

(assert (=> b!1384428 (=> (not res!925898) (not e!784492))))

(assert (=> b!1384428 (= res!925898 (and (= (size!46240 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46240 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46240 a!2938))))))

(declare-fun b!1384429 () Bool)

(declare-fun lt!608729 () Unit!46017)

(assert (=> b!1384429 (= e!784493 lt!608729)))

(declare-fun lt!608731 () Unit!46017)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94620 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46017)

(assert (=> b!1384429 (= lt!608731 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10105 0))(
  ( (MissingZero!10105 (index!42791 (_ BitVec 32))) (Found!10105 (index!42792 (_ BitVec 32))) (Intermediate!10105 (undefined!10917 Bool) (index!42793 (_ BitVec 32)) (x!124295 (_ BitVec 32))) (Undefined!10105) (MissingVacant!10105 (index!42794 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94620 (_ BitVec 32)) SeekEntryResult!10105)

(assert (=> b!1384429 (= (seekEntryOrOpen!0 (select (arr!45688 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45688 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!608730 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94620 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46017)

(assert (=> b!1384429 (= lt!608729 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1384429 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun res!925899 () Bool)

(assert (=> start!118364 (=> (not res!925899) (not e!784492))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118364 (= res!925899 (validMask!0 mask!2987))))

(assert (=> start!118364 e!784492))

(assert (=> start!118364 true))

(declare-fun array_inv!34921 (array!94620) Bool)

(assert (=> start!118364 (array_inv!34921 a!2938)))

(declare-fun b!1384430 () Bool)

(declare-fun res!925895 () Bool)

(assert (=> b!1384430 (=> (not res!925895) (not e!784492))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384430 (= res!925895 (validKeyInArray!0 (select (arr!45688 a!2938) i!1065)))))

(declare-fun b!1384431 () Bool)

(declare-fun res!925901 () Bool)

(assert (=> b!1384431 (=> (not res!925901) (not e!784492))))

(declare-datatypes ((List!32294 0))(
  ( (Nil!32291) (Cons!32290 (h!33499 (_ BitVec 64)) (t!46980 List!32294)) )
))
(declare-fun arrayNoDuplicates!0 (array!94620 (_ BitVec 32) List!32294) Bool)

(assert (=> b!1384431 (= res!925901 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32291))))

(declare-fun b!1384432 () Bool)

(assert (=> b!1384432 (= e!784492 e!784491)))

(declare-fun res!925896 () Bool)

(assert (=> b!1384432 (=> (not res!925896) (not e!784491))))

(assert (=> b!1384432 (= res!925896 (and (bvslt startIndex!16 (bvsub (size!46240 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-fun lt!608728 () Unit!46017)

(assert (=> b!1384432 (= lt!608728 e!784493)))

(declare-fun c!128708 () Bool)

(declare-fun e!784494 () Bool)

(assert (=> b!1384432 (= c!128708 e!784494)))

(declare-fun res!925900 () Bool)

(assert (=> b!1384432 (=> (not res!925900) (not e!784494))))

(assert (=> b!1384432 (= res!925900 (not (= startIndex!16 i!1065)))))

(assert (=> b!1384432 (= lt!608730 (array!94621 (store (arr!45688 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46240 a!2938)))))

(declare-fun b!1384433 () Bool)

(assert (=> b!1384433 (= e!784494 (validKeyInArray!0 (select (arr!45688 a!2938) startIndex!16)))))

(declare-fun b!1384434 () Bool)

(declare-fun res!925894 () Bool)

(assert (=> b!1384434 (=> (not res!925894) (not e!784492))))

(assert (=> b!1384434 (= res!925894 (and (not (= (select (arr!45688 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45688 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!118364 res!925899) b!1384428))

(assert (= (and b!1384428 res!925898) b!1384430))

(assert (= (and b!1384430 res!925895) b!1384431))

(assert (= (and b!1384431 res!925901) b!1384427))

(assert (= (and b!1384427 res!925897) b!1384434))

(assert (= (and b!1384434 res!925894) b!1384432))

(assert (= (and b!1384432 res!925900) b!1384433))

(assert (= (and b!1384432 c!128708) b!1384429))

(assert (= (and b!1384432 (not c!128708)) b!1384425))

(assert (= (and b!1384432 res!925896) b!1384426))

(declare-fun m!1269237 () Bool)

(assert (=> b!1384429 m!1269237))

(declare-fun m!1269239 () Bool)

(assert (=> b!1384429 m!1269239))

(declare-fun m!1269241 () Bool)

(assert (=> b!1384429 m!1269241))

(declare-fun m!1269243 () Bool)

(assert (=> b!1384429 m!1269243))

(assert (=> b!1384429 m!1269239))

(declare-fun m!1269245 () Bool)

(assert (=> b!1384429 m!1269245))

(declare-fun m!1269247 () Bool)

(assert (=> b!1384429 m!1269247))

(declare-fun m!1269249 () Bool)

(assert (=> b!1384429 m!1269249))

(assert (=> b!1384429 m!1269247))

(declare-fun m!1269251 () Bool)

(assert (=> b!1384429 m!1269251))

(assert (=> b!1384433 m!1269247))

(assert (=> b!1384433 m!1269247))

(declare-fun m!1269253 () Bool)

(assert (=> b!1384433 m!1269253))

(assert (=> b!1384432 m!1269241))

(declare-fun m!1269255 () Bool)

(assert (=> start!118364 m!1269255))

(declare-fun m!1269257 () Bool)

(assert (=> start!118364 m!1269257))

(declare-fun m!1269259 () Bool)

(assert (=> b!1384431 m!1269259))

(declare-fun m!1269261 () Bool)

(assert (=> b!1384434 m!1269261))

(declare-fun m!1269263 () Bool)

(assert (=> b!1384427 m!1269263))

(assert (=> b!1384430 m!1269261))

(assert (=> b!1384430 m!1269261))

(declare-fun m!1269265 () Bool)

(assert (=> b!1384430 m!1269265))

(declare-fun m!1269267 () Bool)

(assert (=> b!1384426 m!1269267))

(declare-fun m!1269269 () Bool)

(assert (=> b!1384426 m!1269269))

(check-sat (not b!1384429) (not b!1384431) (not b!1384426) (not b!1384430) (not b!1384433) (not b!1384427) (not start!118364))
(check-sat)
