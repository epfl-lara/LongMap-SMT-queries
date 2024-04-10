; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120214 () Bool)

(assert start!120214)

(declare-fun b!1399311 () Bool)

(declare-fun res!938060 () Bool)

(declare-fun e!792200 () Bool)

(assert (=> b!1399311 (=> (not res!938060) (not e!792200))))

(declare-datatypes ((array!95686 0))(
  ( (array!95687 (arr!46195 (Array (_ BitVec 32) (_ BitVec 64))) (size!46745 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95686)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399311 (= res!938060 (validKeyInArray!0 (select (arr!46195 a!2901) j!112)))))

(declare-fun b!1399312 () Bool)

(declare-fun e!792196 () Bool)

(assert (=> b!1399312 (= e!792200 (not e!792196))))

(declare-fun res!938065 () Bool)

(assert (=> b!1399312 (=> res!938065 e!792196)))

(declare-datatypes ((SeekEntryResult!10512 0))(
  ( (MissingZero!10512 (index!44422 (_ BitVec 32))) (Found!10512 (index!44423 (_ BitVec 32))) (Intermediate!10512 (undefined!11324 Bool) (index!44424 (_ BitVec 32)) (x!126063 (_ BitVec 32))) (Undefined!10512) (MissingVacant!10512 (index!44425 (_ BitVec 32))) )
))
(declare-fun lt!615471 () SeekEntryResult!10512)

(assert (=> b!1399312 (= res!938065 (or (not (is-Intermediate!10512 lt!615471)) (undefined!11324 lt!615471)))))

(declare-fun e!792198 () Bool)

(assert (=> b!1399312 e!792198))

(declare-fun res!938066 () Bool)

(assert (=> b!1399312 (=> (not res!938066) (not e!792198))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95686 (_ BitVec 32)) Bool)

(assert (=> b!1399312 (= res!938066 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47028 0))(
  ( (Unit!47029) )
))
(declare-fun lt!615468 () Unit!47028)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95686 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47028)

(assert (=> b!1399312 (= lt!615468 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!615472 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95686 (_ BitVec 32)) SeekEntryResult!10512)

(assert (=> b!1399312 (= lt!615471 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615472 (select (arr!46195 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399312 (= lt!615472 (toIndex!0 (select (arr!46195 a!2901) j!112) mask!2840))))

(declare-fun b!1399313 () Bool)

(declare-fun res!938067 () Bool)

(assert (=> b!1399313 (=> (not res!938067) (not e!792200))))

(assert (=> b!1399313 (= res!938067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1399314 () Bool)

(declare-fun res!938068 () Bool)

(assert (=> b!1399314 (=> (not res!938068) (not e!792200))))

(declare-datatypes ((List!32714 0))(
  ( (Nil!32711) (Cons!32710 (h!33955 (_ BitVec 64)) (t!47408 List!32714)) )
))
(declare-fun arrayNoDuplicates!0 (array!95686 (_ BitVec 32) List!32714) Bool)

(assert (=> b!1399314 (= res!938068 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32711))))

(declare-fun b!1399315 () Bool)

(declare-fun res!938061 () Bool)

(assert (=> b!1399315 (=> (not res!938061) (not e!792200))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1399315 (= res!938061 (validKeyInArray!0 (select (arr!46195 a!2901) i!1037)))))

(declare-fun res!938062 () Bool)

(assert (=> start!120214 (=> (not res!938062) (not e!792200))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120214 (= res!938062 (validMask!0 mask!2840))))

(assert (=> start!120214 e!792200))

(assert (=> start!120214 true))

(declare-fun array_inv!35223 (array!95686) Bool)

(assert (=> start!120214 (array_inv!35223 a!2901)))

(declare-fun b!1399316 () Bool)

(declare-fun res!938064 () Bool)

(assert (=> b!1399316 (=> (not res!938064) (not e!792200))))

(assert (=> b!1399316 (= res!938064 (and (= (size!46745 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46745 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46745 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1399317 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95686 (_ BitVec 32)) SeekEntryResult!10512)

(assert (=> b!1399317 (= e!792198 (= (seekEntryOrOpen!0 (select (arr!46195 a!2901) j!112) a!2901 mask!2840) (Found!10512 j!112)))))

(declare-fun e!792199 () Bool)

(declare-fun lt!615474 () SeekEntryResult!10512)

(declare-fun lt!615473 () (_ BitVec 64))

(declare-fun b!1399318 () Bool)

(declare-fun lt!615469 () array!95686)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95686 (_ BitVec 32)) SeekEntryResult!10512)

(assert (=> b!1399318 (= e!792199 (= (seekEntryOrOpen!0 lt!615473 lt!615469 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126063 lt!615474) (index!44424 lt!615474) (index!44424 lt!615474) (select (arr!46195 a!2901) j!112) lt!615469 mask!2840)))))

(declare-fun b!1399319 () Bool)

(declare-fun e!792197 () Bool)

(assert (=> b!1399319 (= e!792197 (bvsge mask!2840 #b00000000000000000000000000000000))))

(assert (=> b!1399319 e!792199))

(declare-fun res!938063 () Bool)

(assert (=> b!1399319 (=> (not res!938063) (not e!792199))))

(assert (=> b!1399319 (= res!938063 (and (not (undefined!11324 lt!615474)) (= (index!44424 lt!615474) i!1037) (bvslt (x!126063 lt!615474) (x!126063 lt!615471)) (= (select (store (arr!46195 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44424 lt!615474)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!615470 () Unit!47028)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95686 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47028)

(assert (=> b!1399319 (= lt!615470 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615472 (x!126063 lt!615471) (index!44424 lt!615471) (x!126063 lt!615474) (index!44424 lt!615474) (undefined!11324 lt!615474) mask!2840))))

(declare-fun b!1399320 () Bool)

(assert (=> b!1399320 (= e!792196 e!792197)))

(declare-fun res!938059 () Bool)

(assert (=> b!1399320 (=> res!938059 e!792197)))

(assert (=> b!1399320 (= res!938059 (or (= lt!615471 lt!615474) (not (is-Intermediate!10512 lt!615474))))))

(assert (=> b!1399320 (= lt!615474 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615473 mask!2840) lt!615473 lt!615469 mask!2840))))

(assert (=> b!1399320 (= lt!615473 (select (store (arr!46195 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1399320 (= lt!615469 (array!95687 (store (arr!46195 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46745 a!2901)))))

(assert (= (and start!120214 res!938062) b!1399316))

(assert (= (and b!1399316 res!938064) b!1399315))

(assert (= (and b!1399315 res!938061) b!1399311))

(assert (= (and b!1399311 res!938060) b!1399313))

(assert (= (and b!1399313 res!938067) b!1399314))

(assert (= (and b!1399314 res!938068) b!1399312))

(assert (= (and b!1399312 res!938066) b!1399317))

(assert (= (and b!1399312 (not res!938065)) b!1399320))

(assert (= (and b!1399320 (not res!938059)) b!1399319))

(assert (= (and b!1399319 res!938063) b!1399318))

(declare-fun m!1286595 () Bool)

(assert (=> start!120214 m!1286595))

(declare-fun m!1286597 () Bool)

(assert (=> start!120214 m!1286597))

(declare-fun m!1286599 () Bool)

(assert (=> b!1399315 m!1286599))

(assert (=> b!1399315 m!1286599))

(declare-fun m!1286601 () Bool)

(assert (=> b!1399315 m!1286601))

(declare-fun m!1286603 () Bool)

(assert (=> b!1399319 m!1286603))

(declare-fun m!1286605 () Bool)

(assert (=> b!1399319 m!1286605))

(declare-fun m!1286607 () Bool)

(assert (=> b!1399319 m!1286607))

(declare-fun m!1286609 () Bool)

(assert (=> b!1399311 m!1286609))

(assert (=> b!1399311 m!1286609))

(declare-fun m!1286611 () Bool)

(assert (=> b!1399311 m!1286611))

(declare-fun m!1286613 () Bool)

(assert (=> b!1399313 m!1286613))

(declare-fun m!1286615 () Bool)

(assert (=> b!1399320 m!1286615))

(assert (=> b!1399320 m!1286615))

(declare-fun m!1286617 () Bool)

(assert (=> b!1399320 m!1286617))

(assert (=> b!1399320 m!1286603))

(declare-fun m!1286619 () Bool)

(assert (=> b!1399320 m!1286619))

(assert (=> b!1399312 m!1286609))

(declare-fun m!1286621 () Bool)

(assert (=> b!1399312 m!1286621))

(assert (=> b!1399312 m!1286609))

(assert (=> b!1399312 m!1286609))

(declare-fun m!1286623 () Bool)

(assert (=> b!1399312 m!1286623))

(declare-fun m!1286625 () Bool)

(assert (=> b!1399312 m!1286625))

(declare-fun m!1286627 () Bool)

(assert (=> b!1399312 m!1286627))

(assert (=> b!1399317 m!1286609))

(assert (=> b!1399317 m!1286609))

(declare-fun m!1286629 () Bool)

(assert (=> b!1399317 m!1286629))

(declare-fun m!1286631 () Bool)

(assert (=> b!1399318 m!1286631))

(assert (=> b!1399318 m!1286609))

(assert (=> b!1399318 m!1286609))

(declare-fun m!1286633 () Bool)

(assert (=> b!1399318 m!1286633))

(declare-fun m!1286635 () Bool)

(assert (=> b!1399314 m!1286635))

(push 1)

