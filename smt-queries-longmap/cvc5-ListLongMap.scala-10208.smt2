; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120300 () Bool)

(assert start!120300)

(declare-fun res!938475 () Bool)

(declare-fun e!792593 () Bool)

(assert (=> start!120300 (=> (not res!938475) (not e!792593))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120300 (= res!938475 (validMask!0 mask!2840))))

(assert (=> start!120300 e!792593))

(assert (=> start!120300 true))

(declare-datatypes ((array!95709 0))(
  ( (array!95710 (arr!46205 (Array (_ BitVec 32) (_ BitVec 64))) (size!46755 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95709)

(declare-fun array_inv!35233 (array!95709) Bool)

(assert (=> start!120300 (array_inv!35233 a!2901)))

(declare-fun b!1399958 () Bool)

(declare-fun res!938473 () Bool)

(assert (=> b!1399958 (=> (not res!938473) (not e!792593))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1399958 (= res!938473 (and (= (size!46755 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46755 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46755 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1399959 () Bool)

(declare-fun e!792591 () Bool)

(declare-fun e!792595 () Bool)

(assert (=> b!1399959 (= e!792591 e!792595)))

(declare-fun res!938477 () Bool)

(assert (=> b!1399959 (=> res!938477 e!792595)))

(declare-datatypes ((SeekEntryResult!10522 0))(
  ( (MissingZero!10522 (index!44465 (_ BitVec 32))) (Found!10522 (index!44466 (_ BitVec 32))) (Intermediate!10522 (undefined!11334 Bool) (index!44467 (_ BitVec 32)) (x!126117 (_ BitVec 32))) (Undefined!10522) (MissingVacant!10522 (index!44468 (_ BitVec 32))) )
))
(declare-fun lt!615855 () SeekEntryResult!10522)

(declare-fun lt!615856 () SeekEntryResult!10522)

(declare-fun lt!615859 () (_ BitVec 32))

(assert (=> b!1399959 (= res!938477 (or (bvslt (x!126117 lt!615855) #b00000000000000000000000000000000) (bvsgt (x!126117 lt!615855) #b01111111111111111111111111111110) (bvslt (x!126117 lt!615856) #b00000000000000000000000000000000) (bvsgt (x!126117 lt!615856) #b01111111111111111111111111111110) (bvslt lt!615859 #b00000000000000000000000000000000) (bvsge lt!615859 (size!46755 a!2901)) (bvslt (index!44467 lt!615855) #b00000000000000000000000000000000) (bvsge (index!44467 lt!615855) (size!46755 a!2901)) (bvslt (index!44467 lt!615856) #b00000000000000000000000000000000) (bvsge (index!44467 lt!615856) (size!46755 a!2901)) (not (= lt!615855 (Intermediate!10522 false (index!44467 lt!615855) (x!126117 lt!615855)))) (not (= lt!615856 (Intermediate!10522 false (index!44467 lt!615856) (x!126117 lt!615856))))))))

(declare-fun e!792594 () Bool)

(assert (=> b!1399959 e!792594))

(declare-fun res!938478 () Bool)

(assert (=> b!1399959 (=> (not res!938478) (not e!792594))))

(assert (=> b!1399959 (= res!938478 (and (not (undefined!11334 lt!615856)) (= (index!44467 lt!615856) i!1037) (bvslt (x!126117 lt!615856) (x!126117 lt!615855)) (= (select (store (arr!46205 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44467 lt!615856)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47048 0))(
  ( (Unit!47049) )
))
(declare-fun lt!615854 () Unit!47048)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95709 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47048)

(assert (=> b!1399959 (= lt!615854 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615859 (x!126117 lt!615855) (index!44467 lt!615855) (x!126117 lt!615856) (index!44467 lt!615856) (undefined!11334 lt!615856) mask!2840))))

(declare-fun b!1399960 () Bool)

(declare-fun res!938471 () Bool)

(assert (=> b!1399960 (=> (not res!938471) (not e!792593))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399960 (= res!938471 (validKeyInArray!0 (select (arr!46205 a!2901) j!112)))))

(declare-fun b!1399961 () Bool)

(assert (=> b!1399961 (= e!792595 true)))

(declare-fun lt!615858 () array!95709)

(declare-fun lt!615857 () SeekEntryResult!10522)

(declare-fun lt!615861 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95709 (_ BitVec 32)) SeekEntryResult!10522)

(assert (=> b!1399961 (= lt!615857 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615859 lt!615861 lt!615858 mask!2840))))

(declare-fun b!1399962 () Bool)

(declare-fun e!792590 () Bool)

(assert (=> b!1399962 (= e!792593 (not e!792590))))

(declare-fun res!938472 () Bool)

(assert (=> b!1399962 (=> res!938472 e!792590)))

(assert (=> b!1399962 (= res!938472 (or (not (is-Intermediate!10522 lt!615855)) (undefined!11334 lt!615855)))))

(declare-fun e!792596 () Bool)

(assert (=> b!1399962 e!792596))

(declare-fun res!938470 () Bool)

(assert (=> b!1399962 (=> (not res!938470) (not e!792596))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95709 (_ BitVec 32)) Bool)

(assert (=> b!1399962 (= res!938470 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!615860 () Unit!47048)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95709 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47048)

(assert (=> b!1399962 (= lt!615860 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1399962 (= lt!615855 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615859 (select (arr!46205 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399962 (= lt!615859 (toIndex!0 (select (arr!46205 a!2901) j!112) mask!2840))))

(declare-fun b!1399963 () Bool)

(assert (=> b!1399963 (= e!792590 e!792591)))

(declare-fun res!938479 () Bool)

(assert (=> b!1399963 (=> res!938479 e!792591)))

(assert (=> b!1399963 (= res!938479 (or (= lt!615855 lt!615856) (not (is-Intermediate!10522 lt!615856))))))

(assert (=> b!1399963 (= lt!615856 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615861 mask!2840) lt!615861 lt!615858 mask!2840))))

(assert (=> b!1399963 (= lt!615861 (select (store (arr!46205 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1399963 (= lt!615858 (array!95710 (store (arr!46205 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46755 a!2901)))))

(declare-fun b!1399964 () Bool)

(declare-fun res!938474 () Bool)

(assert (=> b!1399964 (=> (not res!938474) (not e!792593))))

(assert (=> b!1399964 (= res!938474 (validKeyInArray!0 (select (arr!46205 a!2901) i!1037)))))

(declare-fun b!1399965 () Bool)

(declare-fun res!938469 () Bool)

(assert (=> b!1399965 (=> (not res!938469) (not e!792593))))

(declare-datatypes ((List!32724 0))(
  ( (Nil!32721) (Cons!32720 (h!33968 (_ BitVec 64)) (t!47418 List!32724)) )
))
(declare-fun arrayNoDuplicates!0 (array!95709 (_ BitVec 32) List!32724) Bool)

(assert (=> b!1399965 (= res!938469 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32721))))

(declare-fun b!1399966 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95709 (_ BitVec 32)) SeekEntryResult!10522)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95709 (_ BitVec 32)) SeekEntryResult!10522)

(assert (=> b!1399966 (= e!792594 (= (seekEntryOrOpen!0 lt!615861 lt!615858 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126117 lt!615856) (index!44467 lt!615856) (index!44467 lt!615856) (select (arr!46205 a!2901) j!112) lt!615858 mask!2840)))))

(declare-fun b!1399967 () Bool)

(assert (=> b!1399967 (= e!792596 (= (seekEntryOrOpen!0 (select (arr!46205 a!2901) j!112) a!2901 mask!2840) (Found!10522 j!112)))))

(declare-fun b!1399968 () Bool)

(declare-fun res!938476 () Bool)

(assert (=> b!1399968 (=> (not res!938476) (not e!792593))))

(assert (=> b!1399968 (= res!938476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120300 res!938475) b!1399958))

(assert (= (and b!1399958 res!938473) b!1399964))

(assert (= (and b!1399964 res!938474) b!1399960))

(assert (= (and b!1399960 res!938471) b!1399968))

(assert (= (and b!1399968 res!938476) b!1399965))

(assert (= (and b!1399965 res!938469) b!1399962))

(assert (= (and b!1399962 res!938470) b!1399967))

(assert (= (and b!1399962 (not res!938472)) b!1399963))

(assert (= (and b!1399963 (not res!938479)) b!1399959))

(assert (= (and b!1399959 res!938478) b!1399966))

(assert (= (and b!1399959 (not res!938477)) b!1399961))

(declare-fun m!1287249 () Bool)

(assert (=> b!1399968 m!1287249))

(declare-fun m!1287251 () Bool)

(assert (=> start!120300 m!1287251))

(declare-fun m!1287253 () Bool)

(assert (=> start!120300 m!1287253))

(declare-fun m!1287255 () Bool)

(assert (=> b!1399965 m!1287255))

(declare-fun m!1287257 () Bool)

(assert (=> b!1399962 m!1287257))

(declare-fun m!1287259 () Bool)

(assert (=> b!1399962 m!1287259))

(assert (=> b!1399962 m!1287257))

(declare-fun m!1287261 () Bool)

(assert (=> b!1399962 m!1287261))

(declare-fun m!1287263 () Bool)

(assert (=> b!1399962 m!1287263))

(assert (=> b!1399962 m!1287257))

(declare-fun m!1287265 () Bool)

(assert (=> b!1399962 m!1287265))

(declare-fun m!1287267 () Bool)

(assert (=> b!1399961 m!1287267))

(declare-fun m!1287269 () Bool)

(assert (=> b!1399964 m!1287269))

(assert (=> b!1399964 m!1287269))

(declare-fun m!1287271 () Bool)

(assert (=> b!1399964 m!1287271))

(declare-fun m!1287273 () Bool)

(assert (=> b!1399966 m!1287273))

(assert (=> b!1399966 m!1287257))

(assert (=> b!1399966 m!1287257))

(declare-fun m!1287275 () Bool)

(assert (=> b!1399966 m!1287275))

(assert (=> b!1399967 m!1287257))

(assert (=> b!1399967 m!1287257))

(declare-fun m!1287277 () Bool)

(assert (=> b!1399967 m!1287277))

(declare-fun m!1287279 () Bool)

(assert (=> b!1399963 m!1287279))

(assert (=> b!1399963 m!1287279))

(declare-fun m!1287281 () Bool)

(assert (=> b!1399963 m!1287281))

(declare-fun m!1287283 () Bool)

(assert (=> b!1399963 m!1287283))

(declare-fun m!1287285 () Bool)

(assert (=> b!1399963 m!1287285))

(assert (=> b!1399959 m!1287283))

(declare-fun m!1287287 () Bool)

(assert (=> b!1399959 m!1287287))

(declare-fun m!1287289 () Bool)

(assert (=> b!1399959 m!1287289))

(assert (=> b!1399960 m!1287257))

(assert (=> b!1399960 m!1287257))

(declare-fun m!1287291 () Bool)

(assert (=> b!1399960 m!1287291))

(push 1)

